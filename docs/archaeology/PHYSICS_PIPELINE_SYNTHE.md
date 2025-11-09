# SYNTHE Physics Pipeline

**Purpose**: Document the physics of SYNTHE's stellar spectrum synthesis from a computational science perspective
**Target Audience**: Future Julia developers and astrophysicists reviewing migration
**Focus**: WHAT physics is computed and WHY, not HOW the Fortran implements it
**Created**: 2025-11-09
**Phase**: Phase 3 Extension - SYNTHE Physics Documentation

---

## Table of Contents

1. [Overview](#i-overview)
2. [Input State](#ii-input-state)
3. [Pipeline Steps](#iii-pipeline-steps)
4. [Physical Constraints](#iv-physical-constraints)
5. [Numerical Methods](#v-numerical-methods)
6. [Failure Modes](#vi-failure-modes)
7. [SYNTHE vs Other Synthesis Codes](#vii-synthe-vs-other-synthesis-codes)
8. [Migration Considerations](#viii-migration-considerations)
9. [Glossary](#ix-glossary)
10. [Equation Reference](#x-equation-reference)
11. [Units and Conventions](#xi-units-and-conventions)
12. [Typical Values](#xii-typical-values)

---

## I. Overview

SYNTHE computes synthetic stellar spectra from pre-computed atmosphere models (typically from ATLAS12 or ATLAS9). It solves the radiative transfer equation at each wavelength point, accounting for both continuum and line opacity, then applies rotational and instrumental broadening to produce observable spectra.

**Physical regime**:
- Stellar photospheres (using atmosphere models from ATLAS)
- Wavelength range: typically UV to near-IR (3000-25000 Å, can extend further)
- Spectral resolution: R = λ/Δλ up to ~500,000 (limited by line data quality)
- Temperature range: 3,000-50,000 K (inherited from atmosphere model)

**Key assumptions**:
1. **Fixed atmosphere**: Temperature, pressure, density structure from pre-computed ATLAS model (does not iterate)
2. **LTE populations**: Saha-Boltzmann statistics for level populations (same as ATLAS12)
3. **Plane-parallel geometry**: 1D atmosphere, radiation field depends only on depth
4. **Time-independent**: Steady-state spectrum (not time-varying phenomena)
5. **No scattering**: Pure absorption (can include electron scattering as pseudo-continuum)
6. **Detailed line opacity**: Includes millions of atomic and molecular transitions

**Computational approach**:
- **One-pass pipeline**: No iteration (unlike ATLAS12)
- **Wavelength loop**: Solve radiative transfer independently at each wavelength
- **Typical run**: 10,000-100,000 wavelength points depending on resolution and range
- **Fast mode option**: Pre-compute line opacities (fort.9) for repeated calculations with same atmosphere

**Distinction from other synthesis codes**:
- **SYNTHE** (Kurucz): Detailed line lists, LTE, plane-parallel, high spectral resolution
- **SPECTRUM** (Gray): More flexible atomic models, easier to modify
- **Turbospectrum**: Similar to SYNTHE but with NLTE options
- **MOOG**: Focus on chemical abundances, stellar parameter determination

**Relationship to ATLAS**:
```
ATLAS12/ATLAS9 → Atmosphere model (T, P, ρ, abundances vs depth)
      ↓
SYNTHE → Synthetic spectrum (flux vs wavelength)
      ↓
Observations (compare with telescope data)
```

---

## II. Input State

### 2.1 Atmosphere Model (from ATLAS)

**Required atmospheric structure** (fort.7 or fort.8):
- **T(depth)**: Temperature profile (K) at ~72 depth points
- **P(depth)**: Gas pressure profile (dyne/cm²)
- **ρ(depth)**: Mass density profile (g/cm³)
- **XNE(depth)**: Electron density profile (electrons/cm³)
- **RHOX(depth)**: Column mass density (g/cm²) - depth coordinate
- **τ_Ross(depth)**: Rosseland optical depth (alternative depth coordinate)

**Depth grid**:
- Typically 72 points from atmosphere model
- Spans from top of photosphere (τ_Ross ~ 10^(-6)) to deep layers (τ_Ross ~ 10^(+2))
- SYNTHE can interpolate if different depth grid needed

**Stellar parameters** (from atmosphere model):
- **T_eff** (effective temperature): 3,000-50,000 K
- **log g** (surface gravity): 0.0-5.0 (cgs units)
- **[M/H]** (metallicity): -5.0 to +1.0
- **Individual abundances**: Can differ from scaled-solar
- **Microturbulent velocity ξ**: Typically 1-2 km/s (broadening parameter)

### 2.2 Line Lists

**Atomic lines** (from gfall*.dat, fort.12):
- **λ** (wavelength): Typically 1000-100000 Å
- **log(gf)**: Oscillator strength (dimensionless)
- **E_lower**: Lower level energy (eV or cm⁻¹)
- **χ_ion**: Ionization potential of species (eV)
- **Element code**: Atomic number × 100 + ionization stage (e.g., 2601 = Fe I)
- **Damping parameters**:
  - γ_rad (radiative damping)
  - γ_Stark (Stark broadening by charged particles)
  - γ_vdW (van der Waals broadening by neutral atoms)

**Molecular lines** (from molecular.asc, TiO, H₂O databases):
- **λ** (wavelength): Rotational-vibrational transitions
- **log(gf)**: Transition strength
- **E_lower**: Lower level energy
- **Dissociation energy**: Molecular binding energy
- **Isotope information**: For molecules like TiO, H₂O, CO, CN, etc.

**Line list size**:
- **Total available**: ~500 million lines (Kurucz database)
- **Wavelength-selected**: 10,000-1,000,000 lines (for typical synthesis)
- **Significant at each wavelength**: ~10-1000 lines (within Voigt profile wings)

**Wavelength selection** (fort.93 configuration):
- **λ_min, λ_max**: Wavelength range for synthesis
- **Δλ**: Wavelength step (determines resolution)
- **Cutoff criteria**: Minimum line strength, maximum distance from λ

### 2.3 Continuum Opacity Sources

**Same sources as ATLAS12** (see Deep Dive 10, xnfpelsyn calls KAPP):
- **H I**: Bound-free (bf) and free-free (ff) opacity
- **H⁻**: Dominant in solar-type stars (5000-7000 K)
- **He I, He II**: bf and ff opacity
- **Metals**: Bound-free edges (C, N, O, Si, Mg, Al, Fe, etc.)
- **Electron scattering**: Thomson scattering (grey opacity)
- **Rayleigh scattering**: H, He, H₂ (important in blue/UV)
- **Molecular opacity**: H₂⁻, H₂⁺ (in cool stars)

**Pre-computed format** (fort.10 from xnfpelsyn):
- 377 frequency bins spanning wavelength range
- κ_cont(λ, depth) at 3 points per bin (for interpolation)
- Continuum flux F_cont(λ) for comparison

### 2.4 Optional Fast Mode (fort.9)

**Pre-computed line opacities** (from dfsynthe):
- κ_line(λ, depth) for all wavelengths and depths
- ~GB-scale file for high-resolution synthesis
- **Trade-off**: Tied to specific atmosphere - any T, P, or abundance change requires regeneration
- **Speed-up**: ~10× faster than computing line opacities on-the-fly

---

## III. Pipeline Steps

SYNTHE's computational pipeline transforms atmosphere and line data into an observed spectrum through five major stages:

```
[Stage 1: Line List Preparation]
    Select lines in wavelength range → fort.12
    ↓
[Stage 2: Atmosphere Preparation]
    Read ATLAS model, compute populations/continuum → fort.10
    ↓
[Stage 3: Spectrum Synthesis - Main Loop]
    For each wavelength λ:
        Compute line opacities
        Solve radiative transfer
        Output I(λ) or F(λ)
    → fort.5 (raw spectrum)
    ↓
[Stage 4: Rotational Broadening (optional)]
    Convolve with rotation kernel → broadened spectrum
    ↓
[Stage 5: Instrumental Broadening (optional)]
    Convolve with instrument profile → final spectrum
```

### Step 1: Line List Preparation

**Physical process**: Filter complete line database to only include transitions relevant for the specified wavelength range and stellar conditions.

**Programs involved**:
- **synbeg**: Initialize fort.12, fort.93 (configuration)
- **rgfalllinesnew**: Atomic lines from gfall*.dat (see Deep Dive 12)
- **rmolecasc**: Molecular lines from molecular.asc (see Deep Dive 12)
- **rschwenk, rh2ofast**: Binary databases (TiO, H₂O)
- **rpredict**: Predicted lines (uncertain wavelengths)

**Selection criteria**:
1. **Wavelength range**: λ_min ≤ λ ≤ λ_max (from fort.93)
2. **Line strength**: log(gf) > threshold (to exclude negligibly weak lines)
3. **Wing contribution**: λ_line ± N×FWHM overlaps wavelength grid
4. **Species presence**: Element must have non-zero abundance

**Physical justification**:
- Lines far outside wavelength range don't affect spectrum (Voigt wings decay)
- Weak lines (small gf) contribute negligible opacity
- Lines of absent elements have zero opacity (n_lower = 0)

**Output**: fort.12 (binary file, see Deep Dive 09)
- Merged, sorted line list (by wavelength)
- Typically 10K-1M lines depending on wavelength range and stellar type
- Format: NBUFF, CONGF, NELION, ELO, GAMRF, GAMSF, GAMWF (packed integers)

**Cross-reference**: Deep Dive 12 (line readers), Deep Dive 09 (binary accumulation), Deep Dive 04 (fort.12 format)

---

### Step 2: Atmosphere Preparation

**Physical process**: Read atmosphere model from ATLAS, compute LTE populations and continuum opacities at all depths, output pre-computed tables for fast wavelength-by-wavelength synthesis.

**Program**: xnfpelsyn (see Deep Dive 10)

**Input**:
- fort.7: Atmosphere structure (T, P, ρ, XNE vs depth)
- fort.93: Configuration (wavelength range, resolution)
- Element abundances (from atmosphere model or user override)

**Computational steps**:

#### 2.1 Population Calculations

**Governing equation**: Same Saha-Boltzmann as ATLAS12 (see PHYSICS_PIPELINE_ATLAS12.md Step 1)

```
n_i,j+1 / n_i,j = (2 Z_i,j+1 / Z_i,j) × (2π m_e k T / h²)^(3/2) × exp(-χ_i,j / kT) / n_e
```

**Physical meaning**:
- n_i,j = number density of element i in ionization stage j (particles/cm³)
- Determines how many atoms are in the lower level of each transition
- Critical for line opacity: κ_line ∝ n_lower × gf

**Implementation**: Calls POPS subroutine (shared with ATLAS12, see Deep Dive 02)
- Iterates on electron density n_e until charge conservation satisfied
- Uses 0.3 damping factor (same as ATLAS12)
- **Precision**: Float64 REQUIRED (ratios span 40+ orders of magnitude)

**Output**:
- XNF(depth, element, ion): Fractional populations (n_i,j / n_total)
- XNE(depth): Converged electron density

#### 2.2 Continuum Opacity Tables

**Physical process**: Compute κ_cont(λ, depth) for all continuum sources at pre-selected wavelength grid.

**Governing equations**:

**H⁻ bound-free** (dominant in solar-type stars):
```
κ_H⁻ = n_H⁻ × σ_bf(λ)
```
Where σ_bf(λ) is the photodetachment cross-section (peaks ~8500 Å)

**Electron scattering** (Thomson scattering):
```
κ_es = n_e × σ_T
```
Where σ_T = 6.65×10⁻²⁵ cm² (Thomson cross-section, wavelength-independent)

**Metal bound-free** (edges in UV):
```
κ_bf = Σ_i n_i × σ_bf,i(λ) × Θ(λ - λ_edge)
```
Where Θ is Heaviside function (opacity jumps at ionization edge)

**Implementation**: Calls KAPP subroutine (shared with ATLAS12)
- Computes ~25 continuum sources
- Evaluates at 377 wavelength bins (fort.10 grid)
- Uses 3-point interpolation structure for each bin

**Output**: fort.10 (binary file)
- κ_cont(λ_i, depth) for i = 1...377 wavelength bins
- F_cont(λ): Continuum flux (for normalization)
- Wavelength grid for interpolation

**Physical significance**:
- Continuum sets "baseline" opacity at each wavelength
- Lines add opacity on top of continuum
- Continuum flux F_cont(λ) is what emergent spectrum approaches in line-free regions

**Precision considerations**:
- Populations: Float64 (from POPS requirement)
- Opacities: Float32 adequate for continuum (smooth, slowly varying)
- Fort.10 values: Mixed precision (see Deep Dive 10)

**Cross-reference**: Deep Dive 10 (xnfpelsyn), Deep Dive 02 (POPS populations), PHYSICS_PIPELINE_ATLAS12.md Step 1-2

---

### Step 3: Spectrum Synthesis Loop

**Physical process**: For each wavelength λ in the synthesis range, compute total opacity (continuum + lines), solve radiative transfer equation, output emergent intensity or flux.

**Program**: spectrv (see Deep Dive 08)

**Main loop structure**:
```
For λ = λ_min to λ_max step Δλ:
    1. Interpolate κ_cont(λ, depth) from fort.10
    2. Compute κ_line(λ, depth) from fort.12 lines
    3. Total opacity: κ_total = κ_cont + κ_line
    4. Solve radiative transfer: J_ν, H_ν, I_ν(λ, μ)
    5. Output flux F_ν(λ) = 2π ∫ I_ν(λ, μ) μ dμ
```

#### 3.1 Line Opacity Calculation

**Physical process**: For all lines whose Voigt profile wings contribute at wavelength λ, sum opacity contributions at each depth.

**Governing equation**: Line absorption coefficient

```
κ_line(λ, depth) = Σ_lines (π e² / m_e c) × f_ik × n_i × φ_V(λ - λ_0)
```

Where:
- **f_ik**: Oscillator strength (dimensionless, from gf value)
- **n_i**: Number density in lower level (from populations)
- **φ_V(λ - λ_0)**: Voigt profile (normalized to unit area)

**Voigt profile** (convolution of Doppler and Lorentzian broadening):

```
φ_V(Δλ) = (1 / Δλ_D√π) × H(a, v)
```

Where:
- **Δλ_D** = (λ_0/c) × √(2kT/m + ξ²): Doppler width (thermal + microturbulence)
- **a** = γ / (4π Δν_D): Damping parameter (ratio of natural to Doppler width)
- **v** = Δν / Δν_D: Frequency offset in Doppler widths
- **H(a, v)**: Voigt function (see Deep Dive 01 for numerical evaluation)

**Broadening mechanisms**:

1. **Doppler broadening** (thermal motion + microturbulence):
   ```
   Δλ_D = (λ_0/c) × √(2kT/m + ξ²)
   ```
   - Gaussian profile core
   - Width increases with √T and ξ (microturbulent velocity)

2. **Natural broadening** (radiative damping γ_rad):
   ```
   γ_rad = (λ_0² / 2πc) × Σ_k A_ki
   ```
   - Lorentzian wings
   - From spontaneous emission (quantum uncertainty)

3. **Collisional broadening**:
   - **Stark**: γ_Stark ∝ n_e (charged particle collisions)
   - **van der Waals**: γ_vdW ∝ n_H (neutral atom collisions)

**Total damping**:
```
γ_total = γ_rad + γ_Stark + γ_vdW
```

**Line selection at wavelength λ**:
- Only include lines where |λ - λ_0| < N_cut × Δλ_D (typical N_cut ~ 10-50)
- Voigt wings decay as 1/Δν² for |Δν| >> γ (far wings negligible)
- Binary search on sorted fort.12 to find relevant lines efficiently

**Depth dependence**:
- Populations n_i(depth) vary (Saha-Boltzmann with T, P, ρ)
- Voigt width Δλ_D(depth) varies with T(depth)
- Damping γ(depth) varies with n_e(depth), n_H(depth)

**Accumulation**:
```fortran
DO LINE = 1, NLINES_AT_LAMBDA
    κ_line(depth) += compute_line_opacity(line, λ, depth)
END DO
```

**Precision considerations**:
- Populations n_i: Float64 (inherited from POPS)
- Voigt profile H(a,v): Float32 acceptable (~2% accuracy, see Deep Dive 01)
- Opacity accumulation: Float32 adequate, Float64 recommended (see Deep Dive 03)
- Typical accuracy: κ_line within 0.1% for strong lines, 1% for weak lines

**Performance**:
- **Bottleneck**: This is the most expensive step (~90% of SYNTHE runtime)
- ~10-1000 lines contribute at each wavelength
- ~10,000-100,000 wavelengths per synthesis
- Total: 10⁷-10⁹ Voigt profile evaluations per spectrum

**Cross-reference**: Deep Dive 08 (spectrv main loop), Deep Dive 03 (line opacity accumulation), Deep Dive 01 (Voigt profile), Deep Dive 12 (line data format)

---

#### 3.2 Radiative Transfer Solution

**Physical process**: Given opacity κ_total(λ, depth), solve for radiation field I_ν(depth, μ) where μ = cos(θ) is the angle from vertical.

**Governing equation**: Radiative transfer equation (RTE)

```
μ (dI_ν / dτ_ν) = I_ν - S_ν
```

Where:
- **I_ν(τ, μ)**: Specific intensity (erg/s/cm²/Hz/steradian)
- **τ_ν**: Optical depth at frequency ν (dimensionless)
- **S_ν**: Source function (erg/s/cm²/Hz/steradian)
- **μ**: Direction cosine (μ=1 is vertically outward, μ=-1 is inward)

**Optical depth definition**:
```
dτ_ν = -κ_ν ρ dz
```
Where κ_ν is mass absorption coefficient (cm²/g)

**Source function** (LTE assumption):
```
S_ν = B_ν(T)
```
Where B_ν(T) is the Planck function:
```
B_ν(T) = (2hν³/c²) / [exp(hν/kT) - 1]
```

**Boundary conditions**:
1. **Upper boundary** (τ → 0): No incoming radiation
   ```
   I_ν(τ=0, μ<0) = 0
   ```

2. **Lower boundary** (τ → ∞): Thermalized radiation
   ```
   I_ν(τ→∞, μ) = B_ν(T_deep)
   ```

**Formal solution** (JOSH subroutine, see Deep Dive 05):

Discretize angle μ into N_μ directions (typically 17: μ_1, ..., μ_17)
Discretize depth into N_depth points (typically 72)

Uses **Feautrier-like method**:
- Define J_ν = (1/2) ∫ I_ν dΩ (mean intensity)
- Define H_ν = (1/2) ∫ μ I_ν dΩ (flux)
- Solve tridiagonal system for J_ν at each depth
- Pre-computed COEFJ, COEFH weights (51×51 matrices, see Deep Dive 05)

**Emergent flux** (observable quantity):
```
F_ν = 2π ∫_0^1 I_ν(τ=0, μ) μ dμ
```

Or for disk-center intensity:
```
I_ν(μ=1) = I_ν(τ=0, μ=1)
```

**Physical interpretation**:
- Deep layers (large τ): I_ν → B_ν(T) (thermalized)
- Surface layers (small τ): I_ν < B_ν(T) (cooling by escape)
- Line cores: Large κ_line → photons escape from higher (cooler) layers → absorption line
- Line wings: Moderate κ_line → photons from intermediate layers → weak absorption
- Continuum: Small κ_line → photons from deeper (hotter) layers → peak flux

**Precision considerations**:
- COEFJ, COEFH weights: Float32 (pretabulated, see Deep Dive 05)
- Source function B_ν: Float64 (Planck function requires precision for Wien tail)
- Intensity I_ν: Float64 recommended (accumulated from multiple angles)

**Output**:
- F_ν(λ): Flux spectrum (erg/s/cm²/Å) → Written to fort.5
- Or I_ν(λ, μ): Intensity at multiple angles → For limb darkening studies

**Cross-reference**: Deep Dive 08 (spectrv RT call), Deep Dive 05 (JOSH algorithm), PHYSICS_PIPELINE_ATLAS12.md Step 4

---

### Step 4: Rotational Broadening

**Physical process**: Stellar rotation projects velocity components onto line-of-sight (Doppler shift), broadening spectral lines. Different parts of stellar disk have different radial velocities.

**Program**: rotate (see Deep Dive 11)

**Physical setup**:
- Star rotates with angular velocity Ω
- Projected velocity on sky: v(r, θ) = v sin i × (r/R) × sin(θ)
  - **v sin i**: Projected equatorial velocity (km/s)
  - **r/R**: Radial position on stellar disk (0 at center, 1 at limb)
  - **θ**: Azimuthal angle around rotation axis
  - **i**: Inclination angle (i=90° for equator-on, i=0° for pole-on)

**Doppler shift**:
```
Δλ(r, θ) = λ_0 × (v sin i / c) × (r/R) × sin(θ)
```

**Observed spectrum** (convolution):
```
F_rot(λ) = ∫∫ F_rest(λ - Δλ(r,θ)) × W(r, θ) × r dr dθ
```

Where W(r, θ) is the **limb darkening weight** (visible intensity distribution on disk)

**Limb darkening** (Gray's law):
```
I(μ) / I(μ=1) = 1 - u_1(1 - μ) - u_2(1 - μ)²
```

Where:
- **μ** = cos(angle from disk center) = √(1 - r²)
- **u_1, u_2**: Linear and quadratic limb darkening coefficients (wavelength-dependent)
- Typical values: u_1 ~ 0.6, u_2 ~ 0.1 for solar-type stars in optical

**Physical justification**:
- At disk center (μ=1): We see deeper, hotter layers → brighter
- At limb (μ=0): We see shallower, cooler layers → dimmer
- Limb darkening weights must be included to get correct rotational profile shape

**Rotational profile shape**:
- **Slow rotation** (v sin i << Δλ_therm): Thermal broadening dominates
- **Moderate rotation** (v sin i ~ Δλ_therm): Asymmetric line profiles
- **Fast rotation** (v sin i >> Δλ_therm): Lines become broad, shallow

**Typical v sin i values**:
- **Slow rotators** (giants, old stars): v sin i < 5 km/s
- **Solar-type**: v sin i ~ 2 km/s (Sun's rotation)
- **Fast rotators** (A-type main sequence): v sin i ~ 100-300 km/s

**Numerical implementation**:
- Discretize stellar disk into grid of (r, θ) points
- Compute Doppler shift at each point
- Interpolate rest-frame spectrum to shifted wavelength
- Sum with limb darkening weight
- **Direct convolution** (no FFT - spectra typically < 10K points)

**Output**:
- F_rot(λ): Rotationally broadened spectrum → Overwrites fort.5 or new file

**Precision considerations**:
- Limb darkening coefficients: Float64 recommended (small changes affect profile shape)
- Interpolation: Float64 recommended (cumulative error over many wavelengths)

**Cross-reference**: Deep Dive 11 (rotate algorithm), Gray (2005) limb darkening theory

---

### Step 5: Instrumental Broadening

**Physical process**: Telescope spectrograph has finite resolving power R = λ/Δλ, causing observed spectrum to be convolution of true spectrum with instrument profile.

**Program**: broaden (see Deep Dive 11)

**Instrument profile types**:

#### 5.1 Gaussian Profile (common)

```
G(Δλ) = (1 / σ√(2π)) × exp(-Δλ² / 2σ²)
```

Where:
- **σ** = λ / (2.355 × R): Standard deviation in wavelength units
- **R**: Resolving power (e.g., R = 50,000 for typical échelle spectrograph)
- **FWHM** = 2.355 × σ

**Physical origin**: Diffraction, optical aberrations, detector pixel size

#### 5.2 Sinc Profile (ideal slit)

```
S(Δλ) = sinc(π Δλ / Δλ_slit)
```

**Physical origin**: Rectangular slit in focal plane (Fourier transform)

#### 5.3 Macroturbulence

**Additional Gaussian** representing large-scale velocity fields in stellar atmosphere:
```
M(Δλ) = (1 / v_macro√(2π)) × exp[-(Δλ/λ_0 × c)² / 2v_macro²]
```

Where v_macro ~ 2-5 km/s for solar-type stars

**Convolution**:
```
F_obs(λ) = ∫ F_rot(λ') × P(λ - λ') dλ'
```

Where P(Δλ) is the instrument profile (Gaussian, sinc, or combination)

**Numerical implementation**:
- Direct convolution in wavelength space
- **No FFT** (small spectra, convolution kernel is short)
- Boundary handling: Pad spectrum or truncate edges

**Typical resolving powers**:
- **Low-resolution survey** (SDSS): R ~ 2,000
- **Medium-resolution** (general purpose): R ~ 10,000-30,000
- **High-resolution** (échelle spectrographs): R ~ 50,000-100,000
- **Very high-resolution** (laser comb calibrated): R > 200,000

**FWHM vs R**:
- **R = 50,000** at λ = 5000 Å: FWHM = 0.1 Å = 6 km/s
- **R = 100,000** at λ = 5000 Å: FWHM = 0.05 Å = 3 km/s

**Relation to line width**:
- Thermal width at 6000 K for Fe I: ~2 km/s (FWHM)
- If R = 50,000 (FWHM = 6 km/s), instrumental width dominates
- High-resolution spectroscopy (R > 100,000) begins to resolve thermal widths

**Output**:
- F_final(λ): Fully processed synthetic spectrum → fort.5

**Physical interpretation**:
- If R is too low, lines blend together → lose information
- If R matches or exceeds thermal width, can measure line profiles → stellar rotation, macroturbulence, etc.

**Cross-reference**: Deep Dive 11 (broaden algorithm)

---

## IV. Physical Constraints

### 4.1 Energy Conservation

**Integrated flux must match effective temperature**:
```
∫_0^∞ F_ν dν = σ T_eff⁴
```

Where σ is Stefan-Boltzmann constant.

**Validation test**: Compute bolometric flux from synthetic spectrum, compare to T_eff⁴
- If atmosphere is in radiative equilibrium (from ATLAS), this should hold
- Typical agreement: ~1% (limited by numerical integration, incomplete wavelength coverage)

**Failure mode**:
- If ∫F_ν dν << σT_eff⁴: Missing opacity sources (UV, far-IR)
- If ∫F_ν dν >> σT_eff⁴: Incorrect continuum normalization

### 4.2 Optical Depth Monotonicity

**Optical depth must increase inward**:
```
dτ_ν / dz < 0  (z points upward)
```

Since τ_ν = ∫ κ_ν ρ dz from surface downward.

**Physical meaning**: Deeper layers are more opaque (higher column density above them)

**Validation test**: Check that τ(depth_i) > τ(depth_i+1) for all depths

**Failure mode**:
- If τ decreases with depth: Atmosphere structure is unphysical (ATLAS convergence failed)

### 4.3 LTE Validity

**LTE assumptions require**:
```
n_e × σ_collision × v_thermal >> A_spontaneous
```

**Collisional rates >> radiative rates** for level populations to thermalize.

**Validity regime**:
- **Photosphere**: Typically valid (high density, frequent collisions)
- **Chromosphere**: Breaks down (low density, NLTE effects important)
- **Critical density**: n_crit ~ A / (σ × v) ~ 10^12 cm⁻³ for typical lines

**Failure indicators**:
- Strong emission lines (NLTE pumping)
- H-alpha wings in cool stars (NLTE important)
- UV resonance lines (scattering dominates)

**Mitigation**:
- SYNTHE is LTE-only (cannot handle NLTE)
- For NLTE: Use other codes (e.g., Turbospectrum, DETAIL+SURFACE)

### 4.4 Plane-Parallel Validity

**Requires atmosphere scale height << stellar radius**:
```
H << R_star
```

Where H ~ kT / (μ m_H g) is pressure scale height.

**Typical values**:
- Sun: H ~ 150 km, R ~ 700,000 km → H/R ~ 2×10⁻⁴ ✓
- Red giant: H ~ 10,000 km, R ~ 100 R_☉ → H/R ~ 0.001 (marginal)
- White dwarf: H ~ 10 km, R ~ 5000 km → H/R ~ 0.002 ✓

**Failure mode**:
- Extended atmospheres (supergiants, AGB stars): Spherical geometry needed
- SYNTHE assumes plane-parallel (inherited from ATLAS model)

### 4.5 Line List Completeness

**All significant opacity sources must be included**:
```
Σ_lines κ_line >> κ_missing
```

**Completeness challenges**:
- **Weak lines** (millions of transitions, but summed opacity matters)
- **Molecular lines** (complex rovibrational structure, databases incomplete)
- **Rare isotopes** (e.g., Li-6, often omitted)
- **Predicted lines** (uncertain wavelengths, gf values)

**Validation**:
- Compare synthetic spectrum to observed solar spectrum (flux atlas)
- Missing lines appear as "observed features not in synthetic"
- Kurucz line lists aim for ~99% completeness in optical

**Failure indicators**:
- Synthetic spectrum too bright in UV (missing metal lines)
- Missing molecular bands in cool stars (TiO, H₂O incomplete)

---

## V. Numerical Methods

### 5.1 Wavelength Grid

**Choice of Δλ spacing**:

**Logarithmic** (constant Δλ/λ):
```
λ_i+1 = λ_i × (1 + 1/R)
```
- Matches constant resolving power R
- Efficient for wide wavelength ranges

**Linear** (constant Δλ):
```
λ_i+1 = λ_i + Δλ
```
- Simpler for convolution operations
- Used by SYNTHE

**Sampling requirement**:
- Must Nyquist-sample narrowest features
- For line width FWHM, need Δλ < FWHM / 2
- Typical: Δλ ~ 0.01-0.1 Å for high-resolution synthesis

### 5.2 Voigt Profile Evaluation

**Challenge**: H(a, v) has no closed form, requires numerical evaluation

**SYNTHE implementation** (see Deep Dive 01):
- Piecewise algorithm with 4 regimes
- Pretabulated H0TAB, H1TAB, H2TAB for fast lookup
- 13 magic constants (empirical tuning for accuracy)
- ~1 μs per evaluation (millions needed per spectrum)

**Alternative methods**:
- Humlicek (1982) w4 approximation
- Optimized polynomial fits
- Julia libraries: Voigt.jl (consider for migration)

**Accuracy requirement**: ~2% for line profiles (see Deep Dive 01)

### 5.3 Interpolation

**Continuum opacity interpolation** (fort.10 → spectrv):
- Fort.10 has 377 wavelength bins
- Spectrv needs κ_cont at ~10K-100K wavelengths
- Uses linear or spline interpolation

**Population interpolation** (depth grid):
- If SYNTHE depth grid differs from ATLAS depth grid
- Interpolate T, P, ρ, XNE in log(RHOX) or log(τ_Ross)

**Spectrum interpolation** (rotation):
- Doppler-shifted wavelengths rarely align with grid
- Uses linear interpolation on F(λ)

### 5.4 Radiative Transfer Solver

**JOSH algorithm** (see Deep Dive 05):
- Feautrier-like method
- Fixed 51-point optical depth grid (XTAU8)
- Pre-computed COEFJ, COEFH integration weights (51×51 matrices)
- Gauss-Seidel iteration (up to 51 iterations)

**Alternative methods**:
- Rybicki method (faster convergence)
- Short characteristics (for 2D/3D)
- Accelerated Lambda Iteration (ALI, for NLTE)

**SYNTHE choice**: Uses JOSH (shared with ATLAS12, validated over decades)

### 5.5 Convolution

**Direct convolution** (no FFT):
```
F_conv(λ_i) = Σ_j F(λ_j) × K(λ_i - λ_j) × Δλ
```

**Why not FFT?**:
- Spectra are short (~10K points typical)
- Kernels are short (FWHM ~ few pixels)
- Direct convolution is O(N × M) where M << N
- FFT is O(N log N) but has overhead for small N

**When FFT wins**:
- Very high-resolution spectra (N > 100K)
- Wide wavelength ranges requiring many convolutions
- Julia: Consider FFTW.jl for large spectra

---

## VI. Failure Modes

### 6.1 Missing Lines

**Symptom**: Synthetic spectrum too bright in certain regions compared to observations

**Causes**:
- Incomplete line database (especially molecules)
- Wavelength range of line selection too narrow
- Wrong line cutoff threshold (excluded weak lines that collectively matter)

**Diagnosis**:
- Compare F_synth vs F_obs
- Look for systematic offset (not random scatter)
- Check if missing opacity correlates with specific species (e.g., all TiO bands)

**Fix**:
- Expand line list (include more databases)
- Lower cutoff threshold for weak lines
- Add molecular databases (TiO, H₂O, CN, etc.)

### 6.2 Incorrect Abundances

**Symptom**: Line strengths systematically wrong (all Fe lines too strong/weak)

**Causes**:
- Wrong element abundance in atmosphere model
- Abundance file not read correctly by xnfpelsyn
- LTE assumptions fail (NLTE populations differ)

**Diagnosis**:
- Check log(ε) values in fort.7
- Verify abundance changes propagated from ATLAS to SYNTHE
- Compare multiple lines of same element (consistent error suggests abundance problem)

**Fix**:
- Correct element abundances in atmosphere model
- Re-run ATLAS12 with corrected abundances
- If NLTE suspected, use NLTE synthesis code

### 6.3 Wrong Broadening

**Symptom**: Line widths don't match observations

**Causes**:
- Incorrect v sin i (rotational broadening)
- Incorrect ξ (microturbulent velocity)
- Incorrect R (instrumental resolution)
- Missing macroturbulence

**Diagnosis**:
- Measure FWHM of observed vs synthetic lines
- Check if error is systematic (all lines) or line-dependent
- Weak lines more sensitive to instrumental R
- Strong lines more sensitive to ξ, v sin i

**Fix**:
- Adjust v sin i until line widths match
- Adjust ξ in atmosphere model (requires ATLAS re-run)
- Verify spectrograph resolution R
- Add macroturbulence convolution (typically 2-5 km/s)

### 6.4 Atmosphere Model Issues

**Symptom**: Continuum shape wrong, or systematic line strength errors vs depth

**Causes**:
- ATLAS12 convergence failed (atmosphere is not self-consistent)
- Wrong T_eff, log g, [M/H] parameters
- Convection treatment incorrect (for cool stars)

**Diagnosis**:
- Check ATLAS12 convergence flags
- Verify flux conservation: ∫F_ν dν = σT_eff⁴
- Compare synthetic colors (B-V, etc.) to observed
- Check T(τ) profile for unphysical features (inversions, discontinuities)

**Fix**:
- Re-run ATLAS12 with more iterations
- Adjust fundamental parameters (T_eff, log g, [M/H])
- Check mixing length parameter α_MLT (for cool stars with convection)

### 6.5 Numerical Precision Loss

**Symptom**: Noisy spectrum, non-physical negative flux values, convergence failures

**Causes**:
- Float32 underflow in population calculations
- Opacity accumulation error (summing millions of small values)
- Interpolation errors in heavily resampled data

**Diagnosis**:
- Check for negative flux values (unphysical)
- Look for noise that correlates with line density
- Verify populations don't underflow (n_i > 0 always)

**Fix**:
- Use Float64 for populations (REQUIRED, see Deep Dive 02)
- Consider Float64 for opacity accumulation ("cheap insurance", see Deep Dive 03)
- Check interpolation schemes (linear may be insufficient, use spline)

### 6.6 Binary File Corruption

**Symptom**: Spectrv crashes reading fort.10 or fort.12, or produces garbage output

**Causes**:
- Endianness mismatch (big-endian vs little-endian)
- Fortran compiler difference (gfortran vs ifort record markers)
- Incomplete write (xnfpelsyn crashed mid-write)
- Cross-platform transfer (binary files are not portable)

**Diagnosis**:
- Check file sizes (fort.10 should be ~few MB, fort.12 varies)
- Try reading fort.12 with FortranFiles.jl (validate structure)
- Look for error messages about "unformatted read error"

**Fix**:
- Re-generate fort.10, fort.12 on same platform
- Convert to ASCII formats for debugging (slower but portable)
- Use FortranFiles.jl for cross-platform reading (see Deep Dive 04)

**Cross-reference**: Deep Dive 04 (binary I/O), Deep Dive 09 (fort.12 format)

---

## VII. SYNTHE vs Other Synthesis Codes

### 7.1 SYNTHE (Kurucz)

**Strengths**:
- Comprehensive line lists (~500M lines available)
- Validated over decades against solar spectrum
- Fast (especially with fort.9 pre-computed opacities)
- Handles molecular lines (TiO, H₂O, CN, etc.)
- Integrated with ATLAS atmosphere models

**Weaknesses**:
- LTE only (no NLTE)
- Plane-parallel only (no spherical geometry)
- Fortran 77 (hard to modify, no modern features)
- Input format is cryptic (fixed-format, many fort.X files)

**Best use cases**:
- High-resolution spectroscopy (R > 50,000)
- Stellar parameter determination (T_eff, log g, [M/H])
- Abundance analysis (LTE regime)
- Solar-type stars (LTE valid)

### 7.2 SPECTRUM (Gray)

**Differences from SYNTHE**:
- More flexible atomic models (easier to add new physics)
- Better documentation
- Easier input format
- Similar computational approach (wavelength-by-wavelength RT)

**Trade-offs**:
- Smaller default line list
- Less optimized (slower for very large line lists)

### 7.3 Turbospectrum

**Key difference**: NLTE option

**Advantages over SYNTHE**:
- Can handle NLTE departure coefficients
- More modern code structure
- Active development

**Disadvantages**:
- Requires NLTE calculations (model atoms, expensive)
- Steeper learning curve

### 7.4 MOOG

**Different focus**: Chemical abundances

**Advantages**:
- User-friendly (widely used in stellar abundance community)
- Well-documented
- Many published tutorials

**Differences**:
- Uses equivalent widths in addition to full synthesis
- Less emphasis on high-resolution, more on abundance measurements

### 7.5 Summary Table

| Code | NLTE | Spherical | Line Lists | Speed | Ease of Use |
|------|------|-----------|------------|-------|-------------|
| SYNTHE | No | No | Excellent | Fast | Hard |
| SPECTRUM | No | No | Good | Medium | Easy |
| Turbospectrum | Yes | No | Good | Slow | Medium |
| MOOG | Limited | No | Good | Fast | Easy |

**Why migrate SYNTHE?**:
- Kurucz's line lists are the gold standard for optical/UV
- SYNTHE + ATLAS12 is the reference for model atmosphere + synthesis
- Many existing analysis pipelines depend on SYNTHE
- Julia migration: Keep physics/data, improve usability

---

## VIII. Migration Considerations

### 8.1 What to Preserve Exactly

**Critical (must match Fortran bit-for-bit during validation)**:

1. **Voigt profile algorithm** (Deep Dive 01):
   - 13 magic constants
   - 4-regime piecewise structure
   - Pretabulated H0TAB, H1TAB, H2TAB
   - **Reason**: Profile shape affects line strength calibration

2. **Saha-Boltzmann populations** (Deep Dive 02):
   - 0.3 damping factor for n_e iteration
   - Partition function tables (PARTTAB, 2190 lines)
   - **Reason**: Population errors propagate to all line opacities

3. **JOSH radiative transfer** (Deep Dive 05):
   - COEFJ, COEFH pretabulated weights (51×51 matrices)
   - Fixed 51-iteration Gauss-Seidel
   - Optical depth grid XTAU8 (51 points)
   - **Reason**: RT solution is validated against observations

4. **Binary file formats** (Deep Dive 04, 09):
   - Fort.12: IIIIIII structure (16-byte records)
   - Wavelength log-encoding: IWL = floor(log(λ)/RATIOLG)
   - **Reason**: Must read existing line databases

5. **Limb darkening coefficients** (Deep Dive 11):
   - Gray's law: I(μ) = 1 - u_1(1-μ) - u_2(1-μ)²
   - Wavelength-dependent u_1, u_2 tables
   - **Reason**: Affects rotational broadening profile shape

**Precision requirements** (from Deep Dives):

| Component | Fortran | Julia Recommendation | Justification |
|-----------|---------|----------------------|---------------|
| Populations (POPS) | REAL*8 | Float64 | REQUIRED (40+ OOM range, see DD02) |
| Partition functions | REAL*8 | Float64 | REQUIRED (interpolation sensitive) |
| Voigt profile | REAL*4 | Float32 | Acceptable (~2% accuracy, see DD01) |
| Line opacity sum | REAL*4 | Float64 | Recommended ("cheap insurance", DD03) |
| Continuum opacity | REAL*4 | Float32 | Acceptable (smooth function) |
| RT source function | REAL*8 | Float64 | REQUIRED (Planck function precision) |
| RT intensity | REAL*8 | Float64 | Recommended (accumulated over angles) |
| COEFJ/COEFH | REAL*4 | Float32 | Acceptable (pretabulated, validated) |
| Wavelength grid | REAL*8 | Float64 | REQUIRED (avoid cumulative error) |
| Output spectrum | REAL*4 | Float64 | Recommended (user may reprocess) |

**Cross-reference**: PHYSICS_PIPELINE_ATLAS12.md Section VIII.4 for shared components

---

### 8.2 Where Optimizations Are Safe

**Safe to change (won't affect validation)**:

1. **Line selection algorithm** (Deep Dive 12):
   - Current: Sequential readers append to fort.12
   - Julia: Parallel line readers, merge at end
   - **Benefit**: 5-10× speedup for line ingestion
   - **Validation**: Check final fort.12 matches (same lines)

2. **Wavelength loop parallelization** (Deep Dive 08):
   - Current: Serial loop over wavelengths
   - Julia: Parallel wavelength chunks (independent RT solutions)
   - **Benefit**: N_threads × speedup (embarrassingly parallel)
   - **Caution**: Must ensure thread-safe JOSH calls

3. **Convolution via FFT** (Deep Dive 11):
   - Current: Direct convolution O(N×M)
   - Julia: FFT convolution O(N log N) for large spectra
   - **Benefit**: Faster for high-resolution, wide wavelength range
   - **Validation**: Check F_conv(λ) matches within floating-point error

4. **Binary search for line selection**:
   - Current: Linear search in some paths
   - Julia: Always binary search on sorted λ array
   - **Benefit**: O(log N) instead of O(N)

5. **Voigt profile caching**:
   - Current: Recomputes H(a, v) every time
   - Julia: Cache recently computed values (LRU cache)
   - **Benefit**: ~50% speedup if many lines have same broadening parameters

6. **SIMD vectorization** (Deep Dive 03):
   - Current: Scalar loops
   - Julia: @simd over line opacity accumulation
   - **Benefit**: 2-4× speedup (CPU-dependent)

7. **Memory layout optimization**:
   - Current: Arrays of structs (Fortran COMMON blocks)
   - Julia: Structs of arrays (better cache locality)
   - **Benefit**: Reduced memory bandwidth pressure

**Unsafe to change without careful validation**:

1. **Numerical algorithms** (Voigt, JOSH, populations):
   - Even small changes can propagate to final spectrum
   - Must validate against Fortran output iteration-by-iteration

2. **Interpolation schemes**:
   - Linear → spline changes results (usually small, but check)

3. **Default parameter values**:
   - Cutoff thresholds, damping factors, iteration limits
   - Changing defaults breaks reproducibility of published results

---

### 8.3 Testing Strategy

**Unit tests** (from Deep Dives):

1. **Voigt profile** (DD01):
   - Test H(a, v) against tabulated values (Humlicek 1982 Table 1)
   - Edge cases: a → 0 (pure Doppler), a → ∞ (pure Lorentzian)
   - Extreme values: v > 10 (far wings), v < 0.01 (line core)

2. **Populations** (DD02):
   - Solar abundance test: n(Fe II) / n(Fe I) vs T, n_e
   - Partition function interpolation accuracy
   - Charge conservation: Σ_j j × n_i,j = n_e

3. **Line opacity** (DD03):
   - Single line: κ_line(λ) vs analytical Voigt
   - Multiple lines: Accumulation accuracy (no NaN, no negative)
   - Early exit: Matches full calculation within tolerance

4. **RT solution** (DD05):
   - Grey atmosphere: Match analytical Eddington solution
   - Isothermal slab: Verify limb darkening
   - Optically thin: I_ν → S_ν(τ=0)

5. **Rotation** (DD11):
   - Non-rotating (v sin i = 0): F_rot = F_rest
   - Limb darkening: ∫I(μ) μ dμ matches analytical
   - Conservation: ∫F_rot dλ = ∫F_rest dλ

6. **Broadening** (DD11):
   - Delta function input → Output is instrument profile
   - Gaussian: FWHM_out = √(FWHM_in² + FWHM_inst²)

**Integration tests**:

1. **Solar spectrum validation**:
   - Input: Solar atmosphere model (T_eff=5777 K, log g=4.44)
   - Output: Synthetic spectrum 4000-7000 Å
   - Compare: Kurucz solar flux atlas (line-by-line)
   - **Success criterion**: Mean absolute difference < 2%

2. **Stellar parameter recovery**:
   - Input: Synthetic spectrum from known model
   - Fit: T_eff, log g, [M/H], v sin i (χ² minimization)
   - **Success criterion**: Recover input parameters within 1σ errors

3. **Cross-code comparison**:
   - Run same atmosphere with SYNTHE Fortran vs Julia
   - Compare F(λ) point-by-point
   - **Success criterion**: Difference < 0.1% RMS

**Physics validation tests**:

1. **Balmer jump**: Check flux discontinuity at 3646 Å (H I edge)
2. **Strong lines**: H-alpha, Mg I b triplet, Na I D lines match observations
3. **Molecular bands**: TiO bands visible in cool stars (T_eff < 4000 K)
4. **Limb darkening**: I(μ=1) / I(μ=0.1) matches Gray's law

**Regression tests**:

- Maintain suite of test spectra (various T_eff, log g, [M/H])
- Run Julia SYNTHE on all tests after each code change
- Flag any change in output > numerical noise threshold

**Cross-reference**: SYNTHE_DEEP_DIVE_SUMMARY.md Section 8 (Testing Strategy)

---

### 8.4 Suggested Julia Package Structure

```julia
# Atlas.jl package structure
module Atlas

# Shared modules (used by ATLAS12 and SYNTHE)
using Atlas.Physics       # Physical constants, atomic data
using Atlas.Populations   # POPS (Saha-Boltzmann)
using Atlas.Opacity       # Continuum sources (KAPP)
using Atlas.RadiativeTransfer  # JOSH (RT solver)
using Atlas.Voigt         # Voigt profile evaluation

# SYNTHE-specific modules
module SYNTHE
    using ..Atlas  # Inherit shared modules

    # Line list handling
    include("line_readers.jl")     # DD12: rgfalllinesnew, rmolecasc, etc.
    include("line_accumulation.jl") # DD09: synbeg, fort.12 merging

    # Atmosphere preparation
    include("xnfpelsyn.jl")        # DD10: populations + continuum opacities

    # Main synthesis
    include("spectrv.jl")          # DD08: wavelength loop + RT
    include("line_opacity.jl")     # DD08: κ_line(λ, depth) calculation

    # Post-processing
    include("rotation.jl")         # DD11: rotational broadening
    include("broadening.jl")       # DD11: instrumental convolution

    # High-level API
    include("pipeline.jl")         # Unified interface
end

end # module Atlas
```

**Example unified API**:

```julia
using Atlas.SYNTHE

# Simple synthesis
spectrum = synthesize_spectrum(
    atmosphere = "atlas_model.dat",
    wavelength_range = (4000.0, 7000.0),  # Å
    wavelength_step = 0.02,                # Å
    line_lists = ["gfallvac08oct17.dat", "molecular.asc"],
    v_sini = 2.0,                          # km/s
    resolving_power = 50000,
    output = "synthetic_spectrum.dat"
)

# Advanced: Access intermediate products
pipeline = SynthePipeline(
    atmosphere = load_atmosphere("atlas_model.dat"),
    line_lists = load_lines(["gfall*.dat"], λ_min=4000, λ_max=7000)
)

# Stage 1: Prepare
populations = compute_populations!(pipeline)
continuum = compute_continuum!(pipeline)

# Stage 2: Synthesize
raw_spectrum = synthesize!(pipeline)

# Stage 3: Process
rotated = apply_rotation(raw_spectrum, v_sini=2.0)
final = apply_broadening(rotated, R=50000)

# Save
save_spectrum("output.dat", final)
```

---

## IX. Glossary

**Atmosphere model**: Temperature, pressure, density structure vs depth from ATLAS

**Bolometric flux**: Integrated flux over all wavelengths, ∫F_ν dν

**Continuum opacity**: Absorption from bound-free and free-free transitions (no lines)

**Disk-center intensity**: Specific intensity at μ=1 (looking straight down into atmosphere)

**Doppler width**: Thermal + microturbulent line broadening

**Effective temperature T_eff**: Temperature of blackbody with same total flux

**Emergent flux**: Flux escaping from atmosphere top, observed at Earth

**Equivalent width**: ∫(1 - F_line/F_cont) dλ, measures line strength

**Fast mode**: Pre-computed line opacities (fort.9) for repeated syntheses

**Feautrier method**: Radiative transfer solution technique (used by JOSH)

**gf value**: Oscillator strength (transition probability)

**JOSH**: Radiative transfer subroutine (shared with ATLAS12)

**Kurucz line lists**: Comprehensive atomic/molecular databases (~500M lines)

**Limb darkening**: Center-to-limb intensity variation on stellar disk

**Line opacity**: Absorption from bound-bound transitions (atomic/molecular lines)

**LTE (Local Thermodynamic Equilibrium)**: Level populations follow Boltzmann/Saha equations

**Mean intensity J_ν**: Angle-averaged radiation field, (1/4π) ∫I_ν dΩ

**Microturbulence ξ**: Small-scale velocity field broadening lines

**Opacity κ_ν**: Absorption coefficient (cm²/g), measures "opaqueness"

**Optical depth τ_ν**: ∫κ_ν ρ dz, dimensionless measure of distance into atmosphere

**Partition function Z**: Statistical weight sum over atomic levels

**Plane-parallel**: 1D atmosphere (depends only on depth, not lateral position)

**POPS**: Saha-Boltzmann population calculation subroutine

**Resolving power R**: λ/Δλ, ability to separate close wavelengths

**Rosseland mean opacity**: Harmonic mean opacity weighted by Planck function

**Saha equation**: Ionization equilibrium relation

**Source function S_ν**: Emission per unit absorption, equals B_ν(T) in LTE

**Specific intensity I_ν**: Radiance (erg/s/cm²/Hz/steradian)

**v sin i**: Projected rotational velocity (km/s)

**Voigt profile**: Convolution of Doppler (Gaussian) and Lorentzian (damping) profiles

---

## X. Equation Reference

### Radiative Transfer Equation
```
μ (dI_ν / dτ_ν) = I_ν - S_ν
```

### Optical Depth
```
dτ_ν = -κ_ν ρ dz
```

### Source Function (LTE)
```
S_ν = B_ν(T)
```

### Planck Function
```
B_ν(T) = (2hν³/c²) / [exp(hν/kT) - 1]
```

### Emergent Flux
```
F_ν = 2π ∫_0^1 I_ν(τ=0, μ) μ dμ
```

### Line Absorption Coefficient
```
κ_line = (π e² / m_e c) × f × n_lower × φ_V(Δλ)
```

### Voigt Profile
```
φ_V(Δλ) = (1 / Δλ_D√π) × H(a, v)
```

### Doppler Width
```
Δλ_D = (λ_0/c) × √(2kT/m + ξ²)
```

### Damping Parameter
```
a = (λ_0² / 4πc) × (γ / Δν_D)
```

### Saha Equation
```
n_i,j+1 / n_i,j = (2 Z_i,j+1 / Z_i,j) × (2π m_e k T / h²)^(3/2) × exp(-χ_i,j / kT) / n_e
```

### Limb Darkening (Gray's Law)
```
I(μ) / I(1) = 1 - u_1(1 - μ) - u_2(1 - μ)²
```

### Rotational Doppler Shift
```
Δλ(r, θ) = λ_0 × (v sin i / c) × (r/R) × sin(θ)
```

---

## XI. Units and Conventions

### Fundamental Units (CGS)

| Quantity | Symbol | Unit |
|----------|--------|------|
| Length | z, r | cm |
| Mass | m, M | g |
| Time | t | s |
| Temperature | T | K (Kelvin) |
| Wavelength | λ | Å (Angstrom, 10⁻⁸ cm) |
| Frequency | ν | Hz (s⁻¹) |

### Derived Units

| Quantity | Symbol | Unit | CGS |
|----------|--------|------|-----|
| Velocity | v | km/s | 10⁵ cm/s |
| Density | ρ | g/cm³ | - |
| Pressure | P | dyne/cm² | g/(cm·s²) |
| Energy | E, χ | eV | 1.602×10⁻¹² erg |
| Energy | - | erg | g·cm²/s² |
| Intensity | I_ν | erg/(s·cm²·Hz·sr) | - |
| Flux | F_ν | erg/(s·cm²·Hz) | - |
| Opacity | κ_ν | cm²/g | - |
| Column density | RHOX | g/cm² | - |

### Logarithmic Quantities

**Abundance notation**:
```
log ε(X) = log₁₀(N_X / N_H) + 12
```
(Solar: log ε(Fe) = 7.5 means Fe/H = 10^(-4.5))

**Metallicity**:
```
[M/H] = log₁₀(Z / Z_☉)
```
(Solar: [M/H] = 0.0, metal-poor: [M/H] = -2.0)

**Surface gravity**:
```
log g = log₁₀(g [cm/s²])
```
(Solar: log g = 4.44)

**Oscillator strength**:
```
log(gf) = log₁₀(g_upper × f)
```
where g_upper is statistical weight, f is oscillator strength

### Conventions

**Depth coordinate**:
- RHOX = ∫ρ dz (column mass, g/cm²), increases inward
- τ_Ross = ∫κ_Ross ρ dz (Rosseland optical depth), increases inward
- z = 0 at arbitrary reference (often τ_Ross = 1), positive outward

**Angle convention**:
- μ = cos(θ) where θ is angle from outward normal
- μ = 1: vertically outward (disk center)
- μ = 0: tangent to surface (limb)

**Wavelength**:
- Vacuum wavelengths for λ < 2000 Å
- Air wavelengths for λ > 2000 Å
- Conversion: λ_vac = λ_air × n(air) where n ≈ 1.00028 (wavelength-dependent)

---

## XII. Typical Values

### Stellar Parameters

**Sun**:
- T_eff = 5777 K
- log g = 4.44
- [M/H] = 0.0 (by definition)
- v sin i = 2 km/s (slow rotator)
- ξ = 1.0 km/s (microturbulence)
- α_MLT = 1.25 (mixing length)

**A-type main sequence (e.g., Vega)**:
- T_eff = 9500 K
- log g = 4.0
- [M/H] = -0.5 (slightly metal-poor)
- v sin i = 20 km/s (fast rotator)
- ξ = 2.0 km/s

**Red giant**:
- T_eff = 4500 K
- log g = 2.5 (low gravity)
- [M/H] = 0.0
- v sin i = 5 km/s
- ξ = 1.5 km/s

**Cool dwarf (M-type)**:
- T_eff = 3500 K
- log g = 4.5
- [M/H] = 0.0
- v sin i = 3 km/s
- ξ = 1.0 km/s
- **Molecules important**: TiO, H₂O, VO

### Opacity Values (Solar, τ_Ross = 1)

| Source | κ (cm²/g) | Notes |
|--------|-----------|-------|
| H⁻ bf + ff | ~0.01 | Dominant in visible |
| H I bf | ~0.001 | UV |
| Electron scattering | ~0.02 | Wavelength-independent |
| Lines (total) | ~0.001-0.1 | Wavelength-dependent |
| Metals bf | ~0.0001 | UV edges |

### Line Parameters (Typical Fe I line in solar photosphere)

| Parameter | Value | Notes |
|-----------|-------|-------|
| λ | 5000 Å | Optical |
| log(gf) | -2.0 | Moderate strength |
| E_lower | 2 eV | Low excitation |
| χ_ion (Fe I) | 7.9 eV | First ionization |
| γ_rad | 10⁷ s⁻¹ | Radiative damping |
| γ_vdW | 10⁸ s⁻¹ | van der Waals (dominant) |
| Δλ_D (thermal) | 0.02 Å | At T=6000 K |
| Equivalent width | 50 mÅ | Measurable |

### Computational Scale

**Line list sizes**:
- Wavelength range 4000-7000 Å (optical): ~500K lines
- Full UV-IR 1000-25000 Å: ~5M lines
- Kurucz master list: ~500M lines (all elements, all wavelengths)

**Synthesis run times** (rough estimates, single CPU):
- Low-resolution (R=2000), 3000 Å range: ~1 minute
- High-resolution (R=50000), 3000 Å range: ~10 minutes
- Very high-resolution (R=500000), 100 Å range: ~30 minutes
- Fast mode (fort.9 pre-computed): ~10× faster

**File sizes**:
- Fort.12 (line list, 3000 Å range): ~10 MB
- Fort.10 (continuum opacities): ~2 MB
- Fort.9 (pre-computed line opacities, high-res): ~1 GB
- Output spectrum (100K points): ~2 MB ASCII

### Broadening Scales

**Thermal width** (FWHM):
- H line at 5000 Å, T=6000 K: 0.1 Å = 6 km/s
- Fe line at 5000 Å, T=6000 K: 0.02 Å = 1.2 km/s

**Rotational broadening**:
- Slow rotator (v sin i = 2 km/s): 0.03 Å at 5000 Å
- Fast rotator (v sin i = 100 km/s): 1.7 Å at 5000 Å

**Instrumental broadening**:
- R = 50,000: FWHM = 0.1 Å = 6 km/s at 5000 Å
- R = 100,000: FWHM = 0.05 Å = 3 km/s at 5000 Å

---

## Questions for Paula

1. **Line list completeness**: Are there known gaps in Kurucz line lists for specific wavelength ranges or elements?

2. **NLTE effects**: For which lines/stellar types does LTE assumption fail significantly in SYNTHE?

3. **Limb darkening coefficients**: Where do wavelength-dependent u_1, u_2 values come from? Original Kurucz source?

4. **Fast mode usage**: How often is fort.9 (pre-computed opacities) used in practice? Worth prioritizing in Julia migration?

5. **Molecular databases**: Which molecular species are most critical? TiO, H₂O, CN, CO - any others?

6. **Validation strategy**: What observed spectra should be the primary validation targets (solar, Arcturus, Vega)?

7. **ATLAS7V library**: What exactly is shared between ATLAS12 and SYNTHE? Tracing full dependencies would help migration planning.

8. **Parameter sensitivity**: Which parameters have biggest impact on synthetic spectra? (T_eff, log g, abundances, ξ, v sin i, R)

9. **Cross-code comparison**: Have you compared SYNTHE vs SPECTRUM or Turbospectrum systematically? Known systematic differences?

10. **Migration priority**: Is full SYNTHE pipeline needed, or would standalone spectrv (assuming fort.10, fort.12 exist) be sufficient initially?

---

## Cross-References

**Related documents**:
- `PHYSICS_PIPELINE_ATLAS12.md`: Physics of atmosphere iteration (Stage 1 for SYNTHE)
- `SYNTHE_DEEP_DIVE_SUMMARY.md`: Migration roadmap and code analysis
- `ARCHITECTURE_INSIGHTS.md` Section 3.2: SYNTHE data flow architecture

**Deep Dives**:
- DD01: Voigt profile evaluation (used in Step 3.1)
- DD02: Populations (POPS, used in Step 2.1)
- DD03: Line opacity accumulation (similar to SYNTHE Step 3.1)
- DD04: Binary I/O (fort.12 format)
- DD05: JOSH radiative transfer (used in Step 3.2)
- DD08: SYNTHE SPECTRV main loop (Step 3 implementation)
- DD09: Line accumulation (synbeg, Step 1)
- DD10: XNFPELSYN (Step 2 implementation)
- DD11: Broadening (Steps 4-5 implementation)
- DD12: Line readers (Step 1 implementation)

---

**Document Status**: Version 1.0 - Complete
**Created**: 2025-11-09
**Authors**: Claude (Phase 3 archaeology)
**Total Lines**: ~1950 lines
