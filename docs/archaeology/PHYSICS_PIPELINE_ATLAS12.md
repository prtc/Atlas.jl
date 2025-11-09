# ATLAS12 Physics Pipeline

**Purpose**: Document the physics of ATLAS12's stellar atmosphere iteration from a computational science perspective
**Target Audience**: Future Julia developers and astrophysicists reviewing migration
**Focus**: WHAT physics is computed and WHY, not HOW the Fortran implements it
**Created**: 2025-11-09
**Phase**: Phase 3 - Physics Pipeline Documentation

---

## I. Overview

ATLAS12 computes self-consistent stellar atmosphere models in plane-parallel geometry under the assumptions of Local Thermodynamic Equilibrium (LTE), hydrostatic equilibrium, and radiative (or radiative-convective) energy balance.

**Physical regime**:
- Stellar photospheres (outermost ~100 scale heights where radiation escapes)
- Temperature range: ~3,000-50,000 K
- Pressure range: ~10^(-2) to 10^(6) dyne/cm²
- Plane-parallel geometry (valid for τ << R_star/H, where H is scale height)

**Key assumptions**:
1. **Hydrostatic equilibrium**: dP/dτ = g/κ_Ross (gravity balanced by pressure gradient)
2. **Radiative equilibrium**: ∫(J_ν - S_ν)κ_ν dν = 0 (absorbed energy = emitted energy)
3. **LTE populations**: Saha-Boltzmann statistics determine atomic/molecular level populations
4. **Plane-parallel**: Radiation field depends only on depth, not lateral position
5. **Time-independent**: Steady-state atmosphere (not evolving)

**Computational approach**:
- Iterative solution: Start with initial T(τ), P(τ) guess → compute radiation field → adjust T, P → repeat until converged
- Typical convergence: 10-50 iterations
- Frequency resolution: ~30,000 wavelength points spanning UV to far-IR

**Distinction from ATLAS9**: ATLAS12 uses opacity sampling (direct line-by-line calculations) vs ATLAS9's opacity distribution functions (statistical opacity bins). ATLAS12 is more accurate for non-standard abundances and high-resolution spectroscopy.

---

## II. Input State

### 2.1 Stellar Parameters

**Fundamental parameters** (define the star):
- **T_eff** (effective temperature): Surface temperature in K (3,000-50,000 K typical range)
- **log g** (surface gravity): log₁₀(g) where g is in cm/s² (0.0-5.0 typical range)
- **[M/H]** (metallicity): log₁₀(Z/Z_☉) abundance relative to solar (-5.0 to +1.0 typical range)
- **Element abundances**: Individual element abundances (can deviate from scaled-solar)

**Derived/initial values**:
- **Mixing length parameter** α_MLT: Ratio of mixing length to scale height (typically 1.25)
- **Microturbulent velocity** ξ_micro: Small-scale turbulent broadening (typically 1-2 km/s)

### 2.2 Initial Atmosphere Structure

**Depth grid**:
- RHOX = ∫ρ dz (column mass density in g/cm²)
- Typically 72 depth points spanning τ_Ross ~ 10^(-6) to 10^(+2)

**Initial profiles** (T(RHOX), P(RHOX), ρ(RHOX)):
- From previous ATLAS9/ATLAS12 run, or
- From analytical approximation (e.g., gray atmosphere T-τ relation)
- Must satisfy hydrostatic equilibrium: dP/dτ = g/κ

**Initial electron density** XNE(RHOX):
- From Saha equation given initial T, P
- Critical for ionization balance

### 2.3 Atomic and Molecular Data

**Partition functions**:
- Z(T, element, ion) tabulated for all elements and ionization stages
- PARTTAB array: 2,190 lines (from Deep Dive 02)
- Temperature range: typically 1,000-100,000 K

**Ionization potentials**:
- χ_ion(element, ion): Energy to remove electron in eV
- Critical for Saha equation population ratios

**Line lists** (from fort.12 after Stage 1 selection):
- λ (wavelength in Å)
- log(gf) (oscillator strength)
- E_lower, E_upper (energy levels)
- Element code, ionization stage
- Broadening parameters (γ_rad, γ_Stark, γ_vdW)
- Typically 100K-1M lines selected for opacity sampling

**Continuum opacity sources**:
- H I bound-free (bf) and free-free (ff)
- H⁻ opacity (dominant in solar-type stars)
- He I, He II bf opacity
- Metals (C, N, O, Si, Mg, Fe, etc.) bf opacity
- Electron scattering (Thomson scattering)
- Rayleigh scattering (H, He)

---

## III. Iteration Pipeline

One complete ATLAS12 iteration progresses through the following steps, transforming the atmosphere state from iteration N to iteration N+1:

```
Initial atmosphere (T, P, ρ, XNE at iteration N)
    ↓
[Step 1: Population calculations] → n_i,j (number densities)
    ↓
[Step 2: Continuum opacity] → κ_cont(ν, depth)
    ↓
[Step 3: Line opacity] → κ_line(ν, depth)
    ↓
[Frequency loop over ~30,000 wavelengths]:
    [Step 4: Radiative transfer] → J_ν, H_ν, S_ν (radiation field)
    [Accumulate corrections]
    ↓
[Step 5: Temperature correction] → ΔT(depth)
    ↓
[Step 6: Convection (if ∇_rad > ∇_ad)] → convective flux, ΔT_conv
    ↓
[Step 7: Convergence check] → converged?
    ↓
Updated atmosphere (T, P, ρ, XNE at iteration N+1)
```

### Step 1: Population Calculations

**Physical process**: Compute number densities n_i,j for each chemical species i in ionization stage j, assuming Local Thermodynamic Equilibrium (LTE).

**Governing equation**: **Saha-Boltzmann equation**

For ionization equilibrium (Saha equation):
```
n_i,j+1 / n_i,j = (2 Z_i,j+1 / Z_i,j) × (2π m_e k T / h²)^(3/2) × exp(-χ_i,j / kT) / n_e
```

Where:
- n_i,j = number density of species i in ionization stage j (particles/cm³)
- Z_i,j = partition function (dimensionless, accounts for excited states)
- χ_i,j = ionization potential (eV or ergs)
- n_e = electron number density (electrons/cm³)
- m_e = electron mass, k = Boltzmann constant, h = Planck constant, T = temperature

**Input state**:
- T(depth), P(depth), ρ(depth) from current iteration
- Initial guess for n_e(depth) (electron density)
- Element abundances (relative to H)
- Partition function tables Z(T, element, ion)
- Ionization potentials χ(element, ion)

**Output state**:
- n_i,j(depth) for all elements i and ionization stages j
- Updated n_e(depth) from charge conservation: n_e = Σ_i,j j × n_i,j
- Molecular number densities (if molecules present)

**Physical constraints**:
- **Element conservation**: Σ_j n_i,j = n_i,total (total number of atoms of element i)
- **Charge conservation**: n_e = Σ_i,j j × n_i,j (electrons from all ions)
- **Ideal gas law**: P = (Σ n_i,j + n_e) k T (total pressure from all particles)

**Numerical method**:
- Direct calculation from Saha-Boltzmann (not iterative at each depth)
- Electron density iteration: n_e^(k+1) = n_e^(k) + 0.3 × (n_e^calc - n_e^(k)) (damping factor 0.3)
- See Deep Dive 02 for computational details

**Precision requirements**:
- **Float64 REQUIRED** (non-negotiable)
- Population ratios span 40+ orders of magnitude
- Example: H ionization at 5000K → exp(-χ/kT) = exp(-31.6) = 1.7 × 10^(-14)
- Float32 would underflow to exactly 0.0 → catastrophic failure

**Typical values** (solar-type star, T~5800K, log g~4.4):
- H I: n_H ~ 10^(17) cm^(-3) (mostly neutral at photosphere)
- H II: n_H+ ~ 10^(13) cm^(-3) (small fraction ionized)
- He I: n_He ~ 10^(16) cm^(-3)
- Electron density: n_e ~ 10^(13-14) cm^(-3) (dominated by H, metals)

**Failure modes**:
- **Negative electron density**: Can occur if ionization fractions are inconsistent
  - Code handles by clamping n_e > 0 and re-iterating
- **Non-convergence in n_e iteration**: Oscillation between two values
  - Damping factor 0.3 prevents this (see Deep Dive 02, Section 3.2)
- **Partition function extrapolation**: Outside tabulated T range
  - Code extrapolates log-linearly (may be unphysical at extremes)

**Questions for Paula**:
- Why 0.3 damping specifically? Empirically tuned or theoretically motivated?
- Can we expose damping factor as parameter in Julia?

**Migration notes**:
- Must preserve Float64 precision exactly
- Preserve damping logic initially for validation
- Consider exposing iteration diagnostics (n_e convergence history)
- Partition function interpolation must match Fortran exactly during validation

**Fortran implementation**: POPS, POPSALL, NELECT subroutines (atlas12.for:4143-4665)
**Deep Dive reference**: See `docs/archaeology/DEEP_DIVES/02_POPULATIONS.md`

---

### Step 2: Continuum Opacity Calculations

**Physical process**: Compute opacity from bound-free (photoionization), free-free (bremsstrahlung), and scattering processes for all continuum sources. Unlike line opacity, continuum opacity is smooth and varies slowly with wavelength.

**Governing equations**: Multiple physical processes, each with specific cross-sections

**Key continuum sources**:

1. **H⁻ (H-minus) opacity** - Dominant in solar-type stars (T~5000-7000K)
   - Bound-free: H⁻ + photon → H + e⁻
   - Free-free: H + e⁻ + photon → H + e⁻ (bremsstrahlung)
   - Cross-sections from John (1988) and Bell & Berrington

2. **H I bound-free** - Photoionization from ground and excited states
   - H(n) + photon → H⁺ + e⁻
   - Cross-section: σ_bf ∝ λ³ (Kramers formula for hydrogen-like atoms)

3. **He I, He II bound-free** - Helium photoionization
   - Significant in hot stars (T > 10,000K)

4. **Metals bound-free** - C, N, O, Si, Mg, Fe, etc.
   - 20+ separate element-specific subroutines (HOP, HMINOP, HE1OP, HE2OP, C1OP, etc.)
   - Each computes photoionization cross-sections for neutral and singly ionized states

5. **Electron scattering** (Thomson scattering)
   - σ_e = 6.65 × 10⁻²⁵ cm² (constant, independent of frequency)
   - Dominates in hot stars where electrons abundant

6. **Rayleigh scattering** - H, He neutral atoms
   - σ_R ∝ λ⁻⁴ (strong wavelength dependence)
   - Important in UV

**Input state**:
- n_i,j(depth) from Step 1 (populations for all species and ionization stages)
- n_e(depth) (electron density)
- T(depth), P(depth), ρ(depth) (atmosphere structure)
- Frequency ν or wavelength λ (current wavelength in frequency loop)

**Output state**:
- ACONT(depth): Continuum absorption opacity [cm²/g]
- SCONT(depth): Continuum source function (thermal emission / opacity)
- SIGMAC(depth): Continuum scattering opacity [cm²/g]
- TABCONT(depth, ν): Continuum opacity table used for line opacity thresholds

**Physical constraints**:
- Opacity must be > 0 at all depths
- Source function S_cont = B_ν(T) in LTE (Planck function)
- Scattering albedo α = σ_scatter / (σ_absorb + σ_scatter) ≤ 1

**Numerical method**:
- Direct calculation (not iterative)
- Each source computed independently, then summed
- Wavelength-dependent cross-sections tabulated or computed from fitting formulas
- See ARCHITECTURE_INSIGHTS.md Section 2.2 for ~25 separate opacity source subroutines

**Precision requirements**:
- Float64 for population densities (already computed in Step 1)
- Float32 acceptable for final TABCONT array (large: 72 depths × 344 wavelengths)
- Cross-sections typically Float64 to preserve accuracy

**Typical values** (solar-type star, λ~5000Å):
- H⁻ opacity: κ ~ 10⁻²⁶ cm² (dominant contributor)
- H I bound-free: κ ~ 10⁻²⁷ cm² (subdominant at optical wavelengths)
- Electron scattering: κ ~ n_e × 6.65×10⁻²⁵ cm²
- Total continuum: κ_cont ~ 10⁻²⁶ to 10⁻²⁴ cm²/g (depth-dependent)

**Failure modes**:
- **Negative opacities**: Can occur if populations are negative (should not happen if Step 1 correct)
- **Extreme values**: If T or n_e extrapolate beyond tabulated ranges
- **Missing opacities**: If element not included in code (e.g., rare isotopes)

**Questions for Paula**:
- Are all continuum sources in Castelli version scientifically necessary? Or can some be omitted for stars in specific T_eff ranges?
- How often are metal opacities updated with new atomic data?

**Migration notes**:
- Opportunity to consolidate ~25 separate subroutines into unified opacity module
- Each source can be pure function: opacity = f(ν, T, n_e, populations)
- Can parallelize over continuum sources (independent calculations)
- Validate against Fortran output before refactoring

**Fortran implementation**: KAPCONT subroutine (calls 20+ element-specific opacity routines)
**Deep Dive reference**: Referenced in ARCHITECTURE_INSIGHTS.md Section 2.2 (Opacity Calculation Pattern)

---

### Step 3: Line Opacity Calculations

**Physical process**: Accumulate opacity contributions from hundreds of thousands of atomic and molecular spectral lines. Each line absorbs radiation at its rest wavelength λ₀, with wings extending due to Doppler broadening (thermal motion + turbulence) and natural/collisional broadening (damping).

**Governing equation**: **Voigt profile** (convolution of Lorentz and Doppler profiles)

For each line at wavelength λ₀:
```
κ_line(λ, depth) = (π e² / m_e c) × f × λ₀² × n_lower × V(a, u) / Δν_D
```

Where:
- f = oscillator strength (dimensionless)
- n_lower = number density in lower level (from Step 1 populations)
- λ₀ = rest wavelength
- Δν_D = Doppler width = (ν₀/c) × √(2kT/m + ξ_turb²)
- V(a,u) = Voigt function:
  - a = damping parameter = γ / (4π Δν_D)
  - u = frequency offset in Doppler widths = (ν - ν₀) / Δν_D
  - γ = γ_rad + γ_Stark + γ_vdW (natural + collisional broadening)

**Voigt profile approximation** (Deep Dive 01):
- 4-regime piecewise algorithm (Humlicek-inspired but divergent)
- Fast polynomial approximations for different (a, u) regions
- 13 undocumented magic constants
- Accuracy: ~2% target (sufficient for spectral synthesis)

**Input state**:
- Selected line list from fort.12 (Stage 1 output):
  - λ₀, log(gf), E_lower, E_upper, element, ion
  - γ_rad, γ_Stark, γ_vdW (broadening parameters)
  - Typically 100K-1M lines depending on wavelength range and T_eff
- n_i,j(depth) from Step 1 (populations)
- ξ_turb(depth) (microturbulent velocity)
- T(depth) (for Doppler width)
- n_e(depth) (for Stark broadening)
- P(depth) (for van der Waals broadening)

**Output state**:
- XLINES(depth, ν): Line opacity at all wavelengths [cm²/g]
  - Array size: 72 depths × 30,000 wavelengths = 2.16M values
  - Float32 storage (~8.6 MB)
- Accumulated via: `XLINES(J,IW) = XLINES(J,IW) + CV` (no Kahan summation)

**Physical constraints**:
- Line opacity ≥ 0 at all wavelengths
- Total opacity conserves oscillator strength: ∫ κ_line dν = (π e²/m_e c) f n_lower
- Line wings must decay to zero far from line center (validated via TABCONT threshold cutoff)

**Numerical method**:
1. **Initialize**: XLINES(depth, ν) = 0 for all depths and wavelengths
2. **Loop over lines** (100K-500M contributions):
   - Compute line center opacity: CENTER = f × n_lower / Δν_D
   - **Early exit optimization** (critical for performance):
     - If CENTER < TABCONT threshold → skip line entirely
     - Saves ~500× in computation (Deep Dive 03)
   - Compute damping parameter a and Doppler width
   - **Loop over wavelengths** (red and blue wings):
     - Compute Voigt profile V(a, u) at each λ
     - Accumulate: XLINES += opacity_contribution
     - **Early exit when** contribution < TABCONT threshold
3. **Final result**: XLINES contains sum of all line contributions

**Precision requirements** (from Deep Dive 03):
- **Float32 adequate** for XLINES accumulation (error <0.01% typical)
- **Float64 recommended** for Julia as "cheap insurance"
- Voigt profile evaluation: Float32 acceptable (target ~2% accuracy)
- Line parameters (λ₀, gf): Float64 to preserve wavelength precision

**Typical values** (solar-type star, λ~5000Å):
- Lines per wavelength point: ~10-100 contributors
- Strong line center: κ_line ~ 10⁻²⁴ cm²/g (dominates continuum)
- Medium line: κ_line ~ 10⁻²⁶ cm²/g
- Weak line wing: κ_line ~ 10⁻²⁸ to 10⁻³² cm²/g (cutoff threshold)
- **Performance**: ~600 GFLOP for XLINOP, ~3 PFLOP for LINOP1 (Deep Dive 03)

**Failure modes**:
- **Precision loss**: Accumulating tiny values into large sums (mitigated by early exit)
- **Performance collapse**: If TABCONT threshold too low → compute all lines to large distances
- **Missing lines**: If Stage 1 selection too aggressive → underestimate opacity
- **Broadening errors**: If γ parameters wrong → wrong line wings

**Questions for Paula**:
- How is TABCONT threshold tuned? Trade-off between accuracy and performance?
- Can lines be grouped/binned for faster calculation (at cost of some accuracy)?

**Migration notes**:
- **Preserve early exit logic** exactly - performance critical
- **Voigt profile**: Port 4-regime algorithm as-is initially, validate, then consider standard library
- **Parallelization opportunity**: Lines are independent, can accumulate in parallel (with care for accumulation)
- **SIMD vectorization**: Voigt profile evaluation can use Julia SIMD intrinsics
- **Testing**: Validate against Fortran XLINES array at specific wavelengths and depths

**Fortran implementation**:
- XLINOP subroutine (atlas12.for:15039-15389) - Main line opacity
- LINOP1 subroutine (atlas12.for:9916-10133) - Additional line opacity from fort.12
- HVOIGT subroutine (atlas12.for:16173-16284) - Voigt profile evaluation

**Deep Dive reference**:
- See `docs/archaeology/DEEP_DIVES/03_LINE_OPACITY_SUMMATION.md` (accumulation, precision, performance)
- See `docs/archaeology/DEEP_DIVES/01_VOIGT_PROFILE.md` (profile evaluation, magic constants, accuracy)

---

### Step 4: Radiative Transfer

**Physical process**: Solve the radiative transfer equation to compute how radiation propagates through the atmosphere - determining mean intensity J(τ), Eddington flux H(τ), and source function S(τ) at each depth for the current wavelength.

**Governing equation**: **Radiative Transfer Equation** (plane-parallel geometry)

```
μ dI/dτ = I - S
```

Where:
- I(τ, μ) = specific intensity at optical depth τ, angle μ = cos(θ)
- S(τ) = source function = emission / opacity
- τ = optical depth = ∫ κ ρ dz

**Integrated moments** (angle-averaged quantities):
```
J(τ) = (1/2) ∫ I(τ, μ) dμ                  [mean intensity]
H(τ) = (1/2) ∫ μ I(τ, μ) dμ                [Eddington flux]
K(τ) = (1/2) ∫ μ² I(τ, μ) dμ               [K-integral, radiation pressure]
```

**Source function with scattering**:
```
S = (1 - α) S̄ + α J
```
Where:
- α = scattering albedo = σ_scatter / κ_total
- S̄ = thermal source function (LTE: S̄ = B_ν(T), Planck function)
- J = mean intensity (couples all depths together → integral equation)

**Input state**:
- κ_total(depth) = κ_cont + κ_line from Steps 2-3 (total opacity)
- α(depth) = scattering albedo
- S̄(depth) = thermal source function (B_ν(T) in LTE)
- Boundary conditions:
  - Surface: I(0, μ>0) = 0 (no incoming radiation)
  - Deep: I(τ_max, μ<0) ∝ B_ν(T_deep) (diffusion approximation)

**Output state**:
- J_ν(depth): Mean intensity [erg/(cm² s Hz sr)]
- H_ν(depth): Eddington flux [erg/(cm² s Hz)]
- S_ν(depth): Source function (updated with scattering)
- Surface flux: H_ν(τ=0) or specific intensity I_ν(τ=0, μ)

**Physical constraints**:
- Flux conservation: dH/dτ = J - S (energy balance)
- Positivity: J ≥ 0, S ≥ 0 at all depths
- Boundary matching: Surface flux → blackbody in optically thick limit

**Numerical method**: **Feautrier-like method with pretabulated weights** (Deep Dive 05)

1. **Map to standard τ grid**:
   - Fixed 51-point grid: τ = 0, 0.0000032, ..., 20
   - Interpolate atmosphere opacity κ(depth) → κ(τ_std)
   - Interpolate source function S̄(depth) → S̄(τ_std)

2. **Iterate source function** (with scattering, IFSCAT=1):
   - Initial guess: S = S̄
   - Gauss-Seidel iteration (up to 51 iterations):
     - Compute J from S using pretabulated weights: J = COEFJ · S
     - Update S = (1-α) S̄ + α J
     - Repeat until converged (NO CONVERGENCE CHECK - always runs full 51 iterations)

3. **Compute moments** using pretabulated integration weights:
   - J(τᵢ) = Σⱼ COEFJ(i,j) × S(τⱼ)  [51×51 matrix multiplication]
   - H(τᵢ) = Σⱼ COEFH(i,j) × S(τⱼ)  [51×51 matrix multiplication]
   - COEFJ, COEFH: Pretabulated weights (origin unknown, possibly from published RT method)

4. **Map back to atmosphere grid**:
   - Interpolate J(τ_std) → J(depth)
   - Interpolate H(τ_std) → H(depth)
   - Interpolate S(τ_std) → S(depth)

**Precision requirements** (from Deep Dive 05):
- **Mixed precision internal**:
  - COEFJ, COEFH weights: Float32 (pretabulated, 51×51 each)
  - Source functions S: Float64
  - Mean intensity J, flux H: Float64
- **Justification**: Weights are pretabulated, source functions span large dynamic range

**Typical values** (solar-type star, λ~5000Å):
- Optical depth: τ ~ 10⁻⁶ (surface) to 10² (depth)
- Mean intensity: J ~ 10¹³-10¹⁴ erg/(cm² s Hz sr)
- Flux: H ~ 10¹² erg/(cm² s Hz)
- Source function: S ~ B_ν(T) ~ 10¹³-10¹⁴ at optical wavelengths

**Failure modes** (Deep Dive 05):
- **Negative J or S**: Can occur with strong scattering + poor initial guess
  - Code clamps: J = max(J, 10⁻⁹⁹), S = max(S, 10⁻⁹⁹)
  - **Silent failure** - no warning when clamping occurs!
- **Non-convergence**: Scattering iteration may not converge in 51 iterations
  - No convergence diagnostic - always runs fixed iteration count
- **Grid interpolation errors**: If atmosphere τ grid poorly matches standard grid
  - MAP1 parabolic interpolation can overshoot if grid spacing large

**Questions for Paula**:
- How were COEFJ/COEFH matrices computed originally? Can we regenerate or must we trust pretabulated values?
- Why 51 iterations? Is this always sufficient for convergence?
- Should we add convergence diagnostics (flag non-converged cases)?

**Migration notes**:
- **Pretabulated weights**: Must port COEFJ, COEFH exactly (51×51 matrices each)
  - Validate generation if possible, otherwise copy verbatim
- **Iteration limit**: Expose as parameter, add optional early-exit on convergence
- **Diagnostics**: Add convergence tracking (iteration-by-iteration source function changes)
- **Testing**: Validate J, H against Fortran for standard test atmospheres
- **Parallelization**: Frequency loops independent → embarrassingly parallel

**Fortran implementation**: JOSH subroutine (atlas12.for:10342-10609)
**Deep Dive reference**: See `docs/archaeology/DEEP_DIVES/05_RADIATIVE_TRANSFER.md` (algorithm, pretabulated weights, precision analysis)

---

### Step 5: Temperature Correction

**Physical process**: Enforce radiative equilibrium by adjusting temperature structure to balance absorbed and emitted radiation at each depth. After integrating over all frequencies (Step 4 loop), compute temperature corrections needed to achieve energy balance.

**Governing equation**: **Radiative Equilibrium Condition**

```
∫ (J_ν - S_ν) κ_ν dν = 0
```

In steady state, absorbed energy = emitted energy at each depth:
- Absorbed: ∫ J_ν κ_ν dν (radiation field from Step 4)
- Emitted: ∫ S_ν κ_ν dν (thermal emission ≈ ∫ B_ν(T) κ_ν dν in LTE)

Alternatively, using flux divergence:
```
dH/dτ = J - S   (depth-dependent flux divergence)
```

**Avrett-Krook Temperature Correction** (traditional ATLAS method):
Compute correction factor based on flux error at each depth.

**Input state**:
- Accumulated frequency integrals from Step 4 loop:
  - ∫ J_ν κ_ν dν (absorbed radiation)
  - ∫ S_ν κ_ν dν (emitted radiation)
  - ∫ B_ν κ_ν dν (Planck-weighted opacity)
  - Rosseland mean opacity (from ROSS subroutine)
- Current T(depth)
- Convective flux F_conv(depth) from Step 6 (if convection present)

**Output state**:
- ΔT(depth): Temperature correction at each depth
- Updated T(depth) = T_old + ΔT × (damping factors)

**Physical constraints**:
- Global flux conservation: ∫ F_ν dν = σ T_eff⁴ (Stefan-Boltzmann)
- Local energy balance: F_rad + F_conv = constant (in plane-parallel)
- Hydrostatic equilibrium: dP/dτ = g/κ_Ross (after T updated, P must adjust)

**Numerical method**: **Damped Newton-Raphson with 6 damping mechanisms** (Deep Dive 06)

TCORR is called in 3 modes (MODE parameter):
1. **MODE=1**: Initialize integrals (erase accumulators)
2. **MODE=2**: Accumulate contributions from current frequency
3. **MODE=3**: Finalize - compute ΔT and apply with damping

**Six damping mechanisms** (all active simultaneously):

1. **Optical depth limits** (±τ/4):
   - Prevents temperature changes from altering optical depth structure too rapidly
   - Clamps ΔT if it would shift τ_Ross by more than ±0.25

2. **Temperature limits** (±T_eff/25):
   - Absolute bounds: -0.04 T_eff < ΔT < +0.04 T_eff
   - Prevents extreme temperature excursions

3. **Adaptive damping** (0.5× to 1.25×):
   - Detects oscillation vs steady convergence:
     - If ΔT changes sign (oscillation) → multiply by 0.5 (damp harder)
     - If ΔT same sign, decreasing (steady) → multiply by 1.25 (accelerate)
   - Responds dynamically to convergence behavior

4. **Spatial smoothing**:
   - 3-point smoothing of ΔT across depth
   - Prevents grid-scale oscillations

5. **Monotonicity preservation**:
   - Prevents temperature inversions where unphysical
   - Adjusts ΔT to maintain T gradient sign in certain regions

6. **Grid adjustment**:
   - Couples temperature correction to pressure structure via hydrostatic equilibrium

**Critical implementation detail** (Deep Dive 06):
- **No early-exit convergence test**
- Always runs NUMITS iterations regardless of convergence
- To match Fortran exactly, must run fixed iteration count

**Precision requirements**:
- Float64 for temperature and flux integrals (accumulate over ~30,000 wavelengths)
- Float64 for damping factor calculations (avoid precision loss in ratios)

**Typical values** (solar-type star):
- ΔT (undamped): ~100-500K in early iterations, ~1-10K near convergence
- ΔT (after damping): ~10-100K in early iterations, ~0.1-1K near convergence
- Damping factors: 0.3-0.8 typical (aggressive damping prevents oscillation)
- Iterations to convergence: 10-50 typical (depends on initial guess quality)

**Failure modes**:
- **Oscillation**: ΔT flips sign every iteration
  - Adaptive damping (mechanism #3) should catch this
  - If persists → reduce MIXLTH or check convection coupling
- **Runaway**: ΔT grows instead of shrinking
  - Limits (mechanisms #1, #2) prevent catastrophic failure
  - May indicate bad opacity or population calculation
- **Slow convergence**: >100 iterations needed
  - May indicate stiff problem (strong convection, extreme abundances)
  - Consider adjusting initial guess or damping parameters

**Questions for Paula**:
- Why T_eff/25 and τ/4 specifically for damping limits? Empirically tuned?
- Can we add early-exit convergence test (while preserving fixed-iteration mode for validation)?
- How often do atmospheres fail to converge in NUMITS iterations?

**Migration notes**:
- **Preserve all 6 damping mechanisms** exactly during validation phase
- **Expose damping parameters** as options (MIXLTH already is, expose τ/4 and T_eff/25 limits)
- **Add convergence diagnostics**:
  - Track ΔT history, flag oscillations
  - Report which damping mechanism is limiting
  - Optional early exit when converged (after validation)
- **Testing**: Validate ΔT(depth) against Fortran at each iteration

**Fortran implementation**: TCORR subroutine (atlas12.for:606-995)
**Deep Dive reference**: See `docs/archaeology/DEEP_DIVES/06_ITERATION_DAMPING.md` (6 damping mechanisms, adaptive logic, convergence analysis)

---

### Step 6: Convection

**Physical process**: Compute convective energy transport using mixing length theory (MLT) for cool stellar atmospheres where radiative transport alone is insufficient. Convection occurs when temperature gradient exceeds the adiabatic gradient (superadiabatic regions).

**Governing equation**: **Mixing Length Theory** (MLT)

**Convection criterion**:
```
∇ = d ln T / d ln P > ∇_ad
```

Where:
- ∇ = actual temperature gradient (from current T, P structure)
- ∇_ad = adiabatic gradient (from thermodynamics: ∇_ad = (∂ ln T / ∂ ln P)_s)

**Convective flux** (MLT):
```
F_conv = ρ c_P v_conv ΔT
```

Where:
- v_conv = convective velocity (from buoyancy: v ∝ √(g H_P ΔT/T))
- ΔT = temperature excess of rising bubble
- ℓ = α H_P = mixing length (α ≈ 1-2, user parameter MIXLTH)
- H_P = P/(ρg) = pressure scale height

**Input state**:
- T(depth), P(depth), ρ(depth) from current iteration
- Updated populations n_i,j(depth) (CONVEC calls POPS 4× for derivatives)
- Radiative flux F_rad(depth) from Step 5
- Mixing length parameter α (MIXLTH, typically 1.0-2.0)
- Overshooting weight (OVERWT, typically 0.5)

**Output state**:
- F_conv(depth): Convective flux [erg/(cm² s)]
- v_conv(depth): Convective velocity [cm/s]
- ∇_ad(depth): Adiabatic gradient (dimensionless)
- Updated total flux: F_total = F_rad + F_conv

**Physical constraints**:
- F_conv ≥ 0 (convection transports energy outward, never inward)
- F_total = F_rad + F_conv = constant (energy conservation in plane-parallel)
- Convection zone boundary: ∇ = ∇_ad (smooth transition)

**Numerical method**: **MLT with numerical derivatives and iterative opacity** (Deep Dive 07)

**Key steps**:

1. **Compute thermodynamic derivatives via finite differences** (±0.1% perturbations):
   - Perturb T → T×1.001, call POPS → compute ∂E/∂T, ∂ρ/∂T
   - Perturb P → P×1.001, call POPS → compute ∂E/∂P, ∂ρ/∂P
   - From these: c_P, c_V, ∇_ad, sound speed
   - **Expensive**: 4× POPS calls per depth (could use AD in Julia)

2. **Check convection criterion**:
   - Compute ∇ = d ln T / d ln P numerically
   - If ∇ > ∇_ad → convection present

3. **Iterative convective opacity convergence** (30 iterations):
   - Convective bubbles alter opacity distribution
   - Iterate: F_conv → opacity → F_conv until converged
   - SOR relaxation: ω = 0.7
   - **No convergence test** - always runs full 30 iterations

4. **Mihalas optically-thin correction**:
   - Reduces convective efficiency in optically thin regions
   - Factor: τ_b² / (2 + τ_b²)
   - Prevents spurious convection at surface

5. **Convective overshooting**:
   - Extends convection into formally stable regions (mixing)
   - Controlled by OVERWT parameter
   - **Possible bug**: OVERWT = 0.5D-5 in code (should be 0.5?)

**Precision requirements**:
- Float64 for thermodynamic derivatives (sensitive to precision)
- Float64 for convective flux calculations
- Finite differences: ±0.1% perturbations → requires ~10⁻⁴ relative accuracy

**Typical values** (solar-type star):
- Convection zone: Outer ~30% of stellar radius
- F_conv: 0 (radiative) to ~10⁷ erg/(cm² s) (deep convective)
- v_conv: ~10⁴-10⁵ cm/s
- ∇_ad: ~0.4 (ideal gas), ~0.2-0.3 (ionization zones)
- MIXLTH: 1.25 (solar calibration)

**Failure modes**:
- **Negative F_conv**: Unphysical, indicates thermodynamic derivative error
  - Code may clamp to F_conv = 0
- **Oscillations**: Convection zone boundary moves erratically
  - Indicates insufficient damping in TCORR
- **30 iterations insufficient**: Opacity not converged
  - Silent failure - no warning
- **OVERWT bug**: If 0.5D-5 is typo → overshooting essentially disabled

**Questions for Paula**:
- Is OVERWT = 0.5D-5 correct? Or should it be 0.5? (Deep Dive 07 flagged as potential bug)
- Typical OVERWT values for solar-type stars?
- Can we use automatic differentiation instead of finite differences (after validation)?

**Migration notes**:
- **Finite differences initially**: Match Fortran exactly during validation
- **Migrate to AD**: Julia's automatic differentiation (ForwardDiff.jl) for efficiency
  - Eliminates 4× POPS calls → major performance gain
  - Must validate thermodynamic derivatives match FD results
- **Expose iteration limits**: Make 30-iteration limit a parameter
- **Add convergence diagnostics**: Track F_conv convergence, warn if not converged
- **Fix OVERWT if bug confirmed**: Change 0.5D-5 → 0.5

**Fortran implementation**: CONVEC subroutine (atlas12.for:4847-5090)
**Deep Dive reference**: See `docs/archaeology/DEEP_DIVES/07_CONVECTIVE_TRANSPORT.md` (MLT physics, numerical derivatives, possible OVERWT bug)

---

### Step 7: Convergence Check

**Physical process**: After completing one full iteration (Steps 1-6), check if the atmosphere has converged to a self-consistent solution. Convergence means the temperature, pressure, and radiation field have stopped changing significantly between iterations.

**Convergence criteria**:
1. **Flux conservation**: |∫ F_ν dν - σ T_eff⁴| / (σ T_eff⁴) < CONVL (flux tolerance)
2. **Temperature change**: max|T_new - T_old| / T_old < CONVT (temperature tolerance)
3. **Pressure consistency**: Hydrostatic equilibrium satisfied
4. **Iteration limit**: iteration < NUMITS (maximum iterations)

**Typical values**:
- CONVL: ~0.01 (1% flux error tolerance)
- CONVT: ~0.001 (0.1% temperature tolerance)
- NUMITS: 45 typical (user-specified)

**Iteration counts** (typical):
- Simple model (solar): 10-20 iterations
- Complex model (metal-poor, extreme log g): 30-50 iterations
- Non-convergence: >100 iterations (usually indicates problem with input or opacity)

**If converged**:
- Write final atmosphere model to fort.7
- Exit iteration loop

**If not converged**:
- Continue to next iteration (back to Step 1)
- Apply any iteration-dependent adjustments

**Note**: ATLAS12 does NOT implement early-exit convergence checks in the code. It always runs exactly NUMITS iterations regardless of convergence state. Convergence must be assessed manually by inspecting output.

---

## IV. Physical Constraints & Conservation Laws

These physical constraints must be satisfied by any valid atmosphere model. They serve as validation tests for the Julia migration.

### 4.1 Energy Conservation

**Global flux conservation** (Stefan-Boltzmann):
```
∫ F_ν dν = σ T_eff⁴
```

Where:
- F_ν = emergent flux at surface as function of frequency
- σ = Stefan-Boltzmann constant = 5.67×10⁻⁵ erg/(cm² s K⁴)
- T_eff = effective temperature (input parameter)

**Implementation**: ATLAS12 enforces this by adjusting temperature structure via Step 5 (TCORR) until integrated flux matches T_eff⁴.

**Validation test**: Compute ∫ H_ν(τ=0) dν and compare to σ T_eff⁴. Should agree to < 1% at convergence.

**Local energy balance** (radiative equilibrium):
```
∫ (J_ν - S_ν) κ_ν dν = 0   at each depth
```

Or equivalently:
```
dH/dτ = 0   (flux constant with depth in pure radiative equilibrium)
```

With convection:
```
d(H_rad + F_conv)/dτ = 0   (total flux constant)
```

### 4.2 Particle Number Conservation

**Element conservation** (for each element i):
```
Σ_j n_i,j = n_i,total
```

Where:
- j = ionization stage (0 = neutral, 1 = singly ionized, etc.)
- n_i,j = number density of element i in ionization stage j
- n_i,total = total number density of element i (from abundances and ρ)

**Validation test**: After Step 1 (POPS), sum populations across ionization stages and verify equals input abundance × n_total.

**Molecular dissociation** (if molecules present):
```
n_AB + n_A + n_B = n_A,total + n_B,total
```

Accounts for atoms bound in molecules (H2, CO, TiO, etc.).

### 4.3 Hydrostatic Equilibrium

**Equation**:
```
dP/dτ = g/κ_Ross
```

Or equivalently in geometric depth:
```
dP/dz = -ρg
```

Where:
- P = total pressure (gas + radiation + turbulent)
- τ = Rosseland optical depth
- κ_Ross = Rosseland mean opacity
- g = surface gravity (input parameter)
- z = geometric height

**Physical meaning**: Pressure gradient balances gravitational force. Valid when dynamical timescales (minutes-hours) >> sound crossing time (seconds).

**Implementation**: ATLAS12 integrates this equation to relate P(τ) to T(τ) and ρ(τ) via ideal gas law and opacity.

**Validation test**: Compute dP/dz numerically and compare to -ρg. Should agree to < 1%.

### 4.4 Radiative Equilibrium

**Equation**:
```
∫ (J_ν - S_ν) κ_ν dν = 0
```

Or in terms of flux:
```
dH/dτ = J - S
```

**Physical meaning**: At each depth, absorbed radiation equals emitted radiation (steady state, no internal heating).

**Implementation**: Step 5 (TCORR) adjusts temperatures to drive this integral toward zero.

**Convergence criterion**: Flux error |dH/dτ| / H < CONVL (typically 0.01 = 1%).

**Breakdown**: Radiative equilibrium can fail in:
- Chromospheres (non-radiative heating)
- Stellar winds (dynamical effects)
- Rapid pulsations (time-dependent)

ATLAS12 assumes radiative equilibrium always valid (appropriate for photospheres).

### 4.5 Charge Conservation

**Equation**:
```
n_e = Σ_i,j j × n_i,j
```

Where:
- n_e = electron number density
- j = charge state (1 for singly ionized, 2 for doubly ionized, etc.)
- n_i,j = number density of ion i in charge state j

**Physical meaning**: Free electrons come from ionized atoms. Total electron density equals sum of charges from all ions.

**Implementation**: Step 1 (POPS) iterates electron density with damping factor 0.3 to satisfy this constraint.

**Validation test**: After POPS convergence, compute right-hand side and compare to n_e. Should agree to < 0.1%.

**Correction for doubly ionized He**:
```fortran
EXCESS = 2×n_e - P/(k×T)
IF(EXCESS > 0) CHARGESQ = CHARGESQ + 2×EXCESS
```

Accounts for He⁺⁺ contributing 2 electrons each (atlas12.for:240-243).

---

## V. Numerical Methods Summary

Quick reference for the algorithms used at each pipeline step. See Section III for detailed physics.

### 5.1 Population Solver (Step 1)

**Method**: Saha-Boltzmann equation (direct analytical calculation)
- **Iteration**: Electron density n_e iterated with 0.3 damping factor
- **Solver**: Algebraic (not matrix inversion)
- **Convergence**: Typically < 20 iterations per depth point
- **Key subroutine**: POPS (atlas12.for:4143-4665)

### 5.2 Opacity Calculations (Steps 2-3)

**Continuum opacity** (Step 2):
- **Method**: Direct summation of ~25 independent sources
- **Algorithm**: Each source computed via analytic formulas or tabulated cross-sections
- **Performance**: Fast (few ms per wavelength)

**Line opacity** (Step 3):
- **Method**: Accumulation over 100K-1M spectral lines
- **Algorithm**: For each line: compute Voigt profile, accumulate to XLINES array
- **Critical optimization**: Early exit when contribution < TABCONT threshold (~500× speedup)
- **Voigt profile**: 4-regime piecewise approximation (~1 μs/call)
- **Performance**: 600 GFLOP (XLINOP), 3 PFLOP (LINOP1) - See Deep Dive 03

### 5.3 Radiative Transfer Solver (Step 4)

**Method**: Feautrier-like integration with pretabulated weights
- **Grid**: Fixed 51-point τ grid (τ = 0 to 20)
- **Scattering iteration**: Gauss-Seidel (up to 51 iterations, no convergence check)
- **Integration**: Matrix multiplication J = COEFJ · S, H = COEFH · S
- **Interpolation**: MAP1 parabolic (3-point stencil) for grid mapping
- **Key subroutine**: JOSH (atlas12.for:10342-10609)

### 5.4 Temperature Correction Algorithm (Step 5)

**Method**: Damped Newton-Raphson with 6 simultaneous damping mechanisms
1. Optical depth limits: ±τ/4
2. Temperature limits: ±T_eff/25
3. Adaptive damping: 0.5× (oscillation) to 1.25× (acceleration)
4. Spatial smoothing: 3-point depth average
5. Monotonicity preservation: Prevent unphysical T inversions
6. Grid adjustment: Couple to hydrostatic equilibrium

**Iteration control**: Fixed iteration count (NUMITS), no early exit
- **Key subroutine**: TCORR (atlas12.for:606-995)

### 5.5 Convection Solver (Step 6)

**Method**: Mixing length theory (MLT) with numerical thermodynamic derivatives
- **Derivatives**: Finite differences (±0.1% perturbations, 4× POPS calls)
  - ∂E/∂T, ∂E/∂P, ∂ρ/∂T, ∂ρ/∂P
- **Opacity iteration**: 30 iterations with SOR relaxation (ω=0.7)
- **Corrections**: Mihalas optically-thin factor, overshooting (OVERWT)
- **Key subroutine**: CONVEC (atlas12.for:4847-5090)

### 5.6 Convergence Acceleration

**Adaptive damping** (in TCORR):
- Detects oscillation (ΔT sign flips) → damp by 0.5
- Detects steady decrease → accelerate by 1.25
- Auto-adjusts to convergence behavior

**Spatial smoothing**:
- 3-point averaging of ΔT to prevent grid-scale oscillations
- Applied before temperature update

**No global convergence acceleration**:
- ATLAS12 does not implement Ng acceleration or Anderson mixing
- Relies entirely on local damping mechanisms

---

## VI. Failure Modes & Physics Checks

Common failure modes and how to detect them. Julia migration should add diagnostics for all of these.

### 6.1 Non-Convergence Scenarios

**Oscillation** (most common failure):
- **Symptom**: ΔT alternates sign every iteration, temperature bounces between two values
- **Cause**: Insufficient damping, stiff coupling (e.g., strong convection)
- **Detection**: Track sign(ΔT) across iterations, flag if alternates >3 times
- **Fortran handling**: Adaptive damping (mechanism #3 in TCORR) should catch, but may persist
- **Julia improvement**: Add explicit oscillation detection, reduce damping automatically

**Divergence** (rare but catastrophic):
- **Symptom**: ΔT grows instead of shrinking, temperatures run away to extremes
- **Cause**: Bad opacity (missing source), wrong abundance, corrupted input
- **Detection**: |ΔT| > ΔT_previous for 5+ consecutive iterations
- **Fortran handling**: Damping limits (±T_eff/25, ±τ/4) prevent total catastrophe
- **Julia improvement**: Add early-exit abort if divergence detected

**Slow convergence** (> 50-100 iterations):
- **Symptom**: ΔT decreases but very slowly, linear not exponential
- **Cause**: Poor initial guess, extreme stellar parameters, stiff problem
- **Detection**: Iteration count > NUMITS without convergence
- **Fortran handling**: None - just runs out of iterations
- **Julia improvement**:
  - Suggest better initial guess (interpolate from grid)
  - Implement Ng acceleration or Anderson mixing
  - Adaptive damping tuning

### 6.2 Unphysical Outputs

**Negative densities**:
- **Where**: Populations (n_i,j < 0), electron density (n_e < 0)
- **Cause**: Saha equation numerical error, wrong partition functions
- **Detection**: Check all n_i,j ≥ 0 after Step 1
- **Fortran handling**: Clamps n_e > 0, re-iterates
- **Julia improvement**: Throw error with diagnostic (which species, which depth)

**Inverted temperature gradient** (T increases outward):
- **Where**: Surface layers (low optical depth)
- **Physical**: Can be real (chromospheric heating) but ATLAS12 doesn't model this
- **Detection**: Check dT/dτ < 0 in photosphere (τ > 0.1)
- **Fortran handling**: Monotonicity damping (mechanism #5) tries to prevent
- **Julia improvement**: Flag as warning (may indicate non-LTE needed)

**Flux non-conservation**:
- **Symptom**: ∫ F_ν dν ≠ σ T_eff⁴ (>1-2% error)
- **Cause**: Temperature correction failed, optical depth grid inadequate
- **Detection**: Compute flux integral, compare to σ T_eff⁴
- **Fortran handling**: TCORR should drive this to < CONVL tolerance
- **Julia improvement**: Report flux error prominently in output

**Negative opacities**:
- **Where**: Continuum opacity κ_cont < 0
- **Cause**: Populations negative, bad atomic data
- **Detection**: Check ACONT(depth) ≥ 0 after Step 2
- **Fortran handling**: May silently use |κ| or clamp to 0
- **Julia improvement**: Abort with diagnostic

### 6.3 Precision Failures

**Underflow** (most common precision issue):
- **Where**: Populations (Saha equation exp(-χ/kT) for high ionization)
  - Example: n_Fe7+ / n_Fe6+ ~ exp(-54.8eV / k×5000K) ~ 10⁻⁴⁷
- **Float32 range**: ~10⁻³⁸ (underflows to exactly 0.0)
- **Float64 range**: ~10⁻³⁰⁸ (adequate)
- **Detection**: Check for exact 0.0 where small positive expected
- **Fortran handling**: Uses Float64 for populations (REAL*8)
- **Julia migration**: **Must use Float64** for populations (Deep Dive 02)

**Overflow** (rare):
- **Where**: Exp(-χ/kT) for very hot stars (T > 50,000K, low χ)
- **Float64 max**: ~10³⁰⁸
- **Detection**: Check for Inf or NaN in populations
- **Fortran handling**: Typically doesn't occur in valid T_eff range
- **Julia improvement**: Clamp exponents before evaluation if T extreme

**Catastrophic cancellation**:
- **Where**: Line opacity accumulation (10⁸ additions, values span 10⁸ range)
  - Adding 10⁻³² to accumulated sum ~10⁻²⁴
- **Float32**: Loses precision after ~10⁷ additions
- **Float64**: Adequate (Deep Dive 03 analysis)
- **Detection**: Compare accumulated sum to exact (Kahan summation)
- **Fortran**: Uses Float32 (XLINES), no Kahan summation, accepts ~0.01% error
- **Julia migration**: Float64 recommended as "cheap insurance"

### 6.4 When LTE Breaks Down

**LTE assumptions** (ATLAS12 always assumes these valid):
1. Collisions >> radiative processes (sets level populations)
2. Thermalization depth >> photon mean free path
3. Velocity fields << sound speed (hydrostatic equilibrium)

**Where LTE fails**:
- **Chromospheres**: Low density, radiation dominates → NLTE populations needed
- **Stellar winds**: Supersonic outflow → not hydrostatic
- **Hot stars** (T_eff > 30,000K): UV radiation fields → photoionization from excited states
- **Strong lines**: Line cores optically thick → scattering not thermalization

**Symptoms of LTE breakdown** (in ATLAS12 output):
- Unphysical strong lines (much stronger than observed)
- Ionization balance wrong (compared to observed spectra)
- Chromospheric lines in emission (ATLAS12 predicts absorption)

**ATLAS12 mitigation**: None - assumes LTE always valid

**ATLAS12 vs ATLAS9**: ATLAS12 has experimental NLTE options (fort.19 file) but rarely used

**Julia migration**: Document LTE limitations, potentially add NLTE as future extension

---

## VII. Comparison: ATLAS12 vs ATLAS9

Quick comparison for users familiar with ATLAS9. Both codes compute LTE stellar atmospheres but differ in opacity treatment.

### 7.1 Physics Differences

**Opacity treatment** (fundamental difference):

**ATLAS9**: Opacity Distribution Functions (ODFs)
- Pre-tabulated opacity bins (statistical approach)
- Groups lines into ~10,000 opacity bins
- Fast (no line-by-line calculation each iteration)
- Less accurate for non-solar abundances

**ATLAS12**: Opacity Sampling (OS)
- Direct line-by-line opacity calculation
- Uses actual line list (100K-1M lines from fort.12)
- Slower (must compute each line each iteration)
- More accurate, especially for abundance variations

**When to use ATLAS12**:
- Non-standard abundances (metal-poor, enhanced CNO, etc.)
- High-resolution spectral synthesis (couples with SYNTHE)
- Accurate line blanketing for specific elements

**When ATLAS9 sufficient**:
- Solar or near-solar abundances
- Broad-band photometry (no high-res spectra)
- Fast grid calculations (many models)

### 7.2 Numerical Method Differences

**Similarities**:
- Same radiative transfer solver (JOSH - Feautrier-like)
- Same temperature correction (TCORR - 6 damping mechanisms)
- Same convection treatment (CONVEC - mixing length theory)
- Same hydrostatic equilibrium integration

**Differences**:
- **Line opacity**: ATLAS9 uses pretabulated ODFs, ATLAS12 computes line-by-line
- **Performance**: ATLAS9 ~10-100× faster (no line opacity summation)
- **Memory**: ATLAS12 uses more (stores XLINES array: 72×30,000 Float32)

### 7.3 Accuracy Improvements

**Abundance sensitivity**:
- ATLAS9: Accurate to ~10-20% for solar-scaled abundances
- ATLAS12: Accurate to ~1-5% for arbitrary abundances

**Line blanketing**:
- ATLAS9: Statistical (averages over bins)
- ATLAS12: Exact (every line resolved)

**Example**: Fe-enhanced star ([Fe/H] = +0.5, solar CNO)
- ATLAS9: Uses scaled-solar ODF (wrong for Fe-only enhancement)
- ATLAS12: Computes Fe line opacity correctly (more accurate T structure)

**Validation**: Deep Dive 03 confirms ATLAS12 opacity sampling gives < 1% error relative to exact Voigt profiles

---

## VIII. Migration Considerations

Critical guidance for Julia developers. Prioritized by risk and impact.

### 8.1 Physics That Must Be Preserved Exactly

**NON-NEGOTIABLE** (validation will fail if changed):

1. **Population calculations** (Step 1):
   - Float64 precision (40+ order of magnitude range)
   - Saha-Boltzmann equations exact
   - 0.3 damping factor for n_e iteration
   - Charge conservation enforced

2. **Voigt profile magic constants** (Step 3):
   - 13 constants in HVOIGT subroutine
   - 4-regime piecewise algorithm
   - Must port exactly (even if non-standard) for validation

3. **JOSH pretabulated weights** (Step 4):
   - COEFJ, COEFH matrices (51×51 each)
   - CK, CH surface weights (51 values each)
   - Copy verbatim from Fortran DATA statements

4. **TCORR damping mechanisms** (Step 5):
   - All 6 damping mechanisms active
   - ±T_eff/25 and ±τ/4 limits exact
   - 0.5×/1.25× adaptive factors
   - 3-point spatial smoothing

5. **Frequency integration**:
   - ~30,000 wavelength points (from WAVESET array)
   - Rosseland weighting (RCOSET array)
   - Integration order (continuum → lines → RT → corrections)

**PRESERVE INITIALLY, OPTIMIZE LATER**:

6. **Early-exit thresholds** (Step 3):
   - TABCONT cutoff (performance-critical)
   - Line wing truncation distances
   - Validate these exactly, then tune for Julia

7. **Iteration counts**:
   - NUMITS (main loop)
   - 51 iterations (JOSH scattering)
   - 30 iterations (CONVEC opacity)
   - No early-exit convergence checks

### 8.2 Where Optimizations Are Safe

**SAFE IMMEDIATELY** (won't affect validation):

1. **Data structures**:
   - Replace COMMON blocks with structs
   - Make dependencies explicit (function arguments)
   - Use immutable structs where possible

2. **Parallelization**:
   - Frequency loop (Step 4): Embarrassingly parallel
   - Continuum opacity sources (Step 2): Independent, can parallelize
   - Depth loop in line opacity: Parallelizable with care (shared XLINES accumulation)

3. **Vectorization**:
   - Voigt profile: SIMD intrinsics for u loop
   - Population calculations: Broadcast over depth points
   - Opacity summation: GPU-friendly (if needed)

4. **I/O format**:
   - Fort units → named files or in-memory structures
   - Binary formats → HDF5, FITS, or Julia serialization
   - Preserve ability to read/write legacy formats for validation

5. **Diagnostics**:
   - Add convergence tracking (iteration history)
   - Add timing profilers
   - Add physics check warnings (negative densities, flux errors, etc.)

**SAFE AFTER VALIDATION**:

6. **Voigt profile**:
   - Replace with standard library (Faddeeva.jl) after validating against HVOIGT
   - Use Float32 (Deep Dive 01 confirms adequate)

7. **Line opacity precision**:
   - XLINES Float32 → Float64 "cheap insurance" (Deep Dive 03)
   - Memory cost negligible (~8 MB → 16 MB)

8. **Convection derivatives**:
   - Finite differences → automatic differentiation (ForwardDiff.jl)
   - Eliminates 4× POPS calls → major speedup
   - Validate thermodynamic derivatives match Fortran first

9. **Convergence acceleration**:
   - Add Ng acceleration or Anderson mixing
   - Optional early-exit on convergence
   - Keep fixed-iteration mode for validation

### 8.3 Physical Validation Tests

**Test suite for Julia vs Fortran validation** (all must pass to < 1% error):

1. **Flux conservation**:
   ```julia
   @test abs(integrated_flux - σ * T_eff^4) / (σ * T_eff^4) < 0.01
   ```

2. **Population ratios** (check Saha equation):
   ```julia
   for each ionization stage:
       ratio_computed = n[i,j+1] / n[i,j]
       ratio_saha = saha_equation(T, n_e, Z[i,j], χ[i,j])
       @test isapprox(ratio_computed, ratio_saha, rtol=0.01)
   ```

3. **Hydrostatic equilibrium**:
   ```julia
   dP_dz = numerical_derivative(P, z)
   @test all(abs.(dP_dz + ρ * g) ./ (ρ * g) .< 0.01)
   ```

4. **Charge conservation**:
   ```julia
   n_e_computed = sum(j * n[i,j] for all ions)
   @test isapprox(n_e_computed, n_e, rtol=0.001)
   ```

5. **Temperature structure** (validate against Fortran fort.7 output):
   ```julia
   T_julia = read_atmosphere("julia_output.dat")
   T_fortran = read_atmosphere("fortran_fort7.dat")
   @test all(abs.(T_julia - T_fortran) ./ T_fortran .< 0.01)
   ```

6. **Opacity spot checks**:
   - Compare XLINES(depth, ν) for specific wavelengths
   - Compare continuum opacity at test wavelengths
   - Validate Voigt profile against HVOIGT for test (a, u) values

7. **Radiative transfer**:
   - Compare J_ν(depth) for test wavelengths
   - Compare H_ν(depth) (flux)
   - Surface flux I_ν(μ) for test angles

**Test atmospheres** (validate all):
- Solar (T_eff=5777K, log g=4.44, [M/H]=0.0)
- Hot star (T_eff=15000K, log g=4.0, [M/H]=0.0)
- Metal-poor (T_eff=6000K, log g=4.0, [M/H]=-2.0)
- Giant (T_eff=5000K, log g=2.0, [M/H]=0.0)

### 8.4 Precision Requirements by Component

| Component | Fortran | Julia Recommended | Justification |
|-----------|---------|-------------------|---------------|
| **Populations** | Float64 | **Float64** | 40+ order magnitude range (Deep Dive 02) - NON-NEGOTIABLE |
| **Voigt profiles** | Float32 | Float32 | Target accuracy ~2% sufficient (Deep Dive 01) |
| **XLINES accumulation** | Float32 | **Float64** | "Cheap insurance" vs catastrophic cancellation (Deep Dive 03) |
| **Continuum opacity** | Mixed | Float64 | Consistent with populations input |
| **RT source functions** | Float64 | Float64 | Large dynamic range |
| **RT weights (COEFJ)** | Float32 | Float32 | Pretabulated, no need to change |
| **Temperature** | Float64 | Float64 | Accumulated frequency integrals |
| **Flux integrals** | Float64 | Float64 | Sum over ~30,000 wavelengths |
| **Convection** | Float64 | Float64 | Finite difference derivatives sensitive |

**General principle**: Use Float64 by default unless Deep Dive analysis confirms Float32 adequate. Memory cost negligible on modern hardware.

---

## IX. Glossary

**LTE** (Local Thermodynamic Equilibrium): Statistical equilibrium where level populations follow Boltzmann distribution and ionization follows Saha equation. Valid when collisions dominate radiative processes.

**Rosseland mean opacity**: Harmonic mean opacity weighted by Planck function derivative. Relevant for radiative diffusion (optically thick regime).

**Partition function**: Statistical sum over all accessible energy states. Accounts for excited state populations.

**Optical depth**: τ = ∫ κρ dz. Measures attenuation of radiation. τ=1 is photosphere (where radiation escapes).

**Source function**: S_ν = j_ν / κ_ν (emission / absorption). In LTE, S_ν = B_ν(T) (Planck function).

**Hydrostatic equilibrium**: Force balance between gravity and pressure gradient. Valid when dynamical timescales >> sound crossing time.

**Planck function** (B_ν): Blackbody radiation intensity B_ν(T) = (2hν³/c²) / [exp(hν/kT) - 1]. Describes thermal emission in LTE.

**Photosphere**: Layer where optical depth τ ~ 1. Radiation escapes to observer from this region.

**Opacity sampling**: Direct line-by-line opacity calculation (ATLAS12 method). More accurate than ODFs but slower.

**Opacity distribution function (ODF)**: Statistical binning of line opacity (ATLAS9 method). Fast but less accurate for non-solar abundances.

**Voigt profile**: Convolution of Doppler (Gaussian) and Lorentz (damping) line profiles. Describes spectral line shape.

**Eddington flux**: H = (1/4π) ∫ μI dΩ. Net radiation flux (energy transport).

**Mean intensity**: J = (1/4π) ∫ I dΩ. Angle-averaged radiation field (drives heating/cooling).

**Mixing length**: ℓ = α H_P. Characteristic distance convective bubbles travel before dissolving. α ≈ 1-2 (calibrated to Sun).

**Superadiabatic gradient**: ∇ > ∇_ad. Indicates convective instability.

**Saha equation**: Statistical equilibrium for ionization balance (collisions >> photoionization).

**Boltzmann distribution**: Statistical equilibrium for level populations within an ion (collisions >> radiative transitions).

**Scattering albedo**: α = σ_scatter / (σ_absorb + σ_scatter). Fraction of opacity that scatters (vs absorbs).

---

## X. Equation Reference

Quick reference for key equations. See Section III for detailed physics context.

### Saha Equation (Ionization Balance)
```
n_i,j+1 / n_i,j = (2 Z_i,j+1 / Z_i,j) × (2π m_e k T / h²)^(3/2) × exp(-χ_i,j / kT) / n_e
```
Where:
- n_i,j = number density of element i in ionization stage j
- Z = partition function (temperature-dependent)
- χ_i,j = ionization potential (eV or ergs)
- n_e = electron density

### Boltzmann Equation (Level Populations)
```
n_i,j,k / n_i,j = (g_k / Z_i,j) × exp(-E_k / kT)
```
Where:
- n_i,j,k = number density in excited level k
- g_k = statistical weight of level k
- E_k = excitation energy above ground state

### Radiative Transfer Equation (Plane-Parallel)
```
μ dI/dτ = I - S
```
Integrated moments:
```
J = (1/2) ∫₋₁⁺¹ I(μ) dμ        (mean intensity)
H = (1/2) ∫₋₁⁺¹ μ I(μ) dμ      (Eddington flux)
K = (1/2) ∫₋₁⁺¹ μ² I(μ) dμ     (K-integral)
```

### Voigt Profile
```
V(a, u) = (a/π) ∫₋∞⁺∞ exp(-y²) / [(u-y)² + a²] dy
```
Where:
- a = damping parameter = γ / (4π Δν_D)
- u = frequency offset = (ν - ν₀) / Δν_D
- Δν_D = Doppler width

ATLAS12 uses piecewise polynomial approximation (not this integral).

### Planck Function (Thermal Emission)
```
B_ν(T) = (2hν³/c²) / [exp(hν/kT) - 1]
```

### Hydrostatic Equilibrium
```
dP/dτ = g / κ_Ross

dP/dz = -ρg   (geometric depth form)
```

### Radiative Equilibrium
```
∫ (J_ν - S_ν) κ_ν dν = 0
```
Or:
```
dH/dτ = J - S
```

### Mixing Length Theory (Convective Flux)
```
F_conv = ρ c_P v_conv ΔT

v_conv ∝ √(g H_P ΔT / T)
```
Where:
- ℓ = α H_P (mixing length)
- H_P = P/(ρg) (pressure scale height)
- ΔT = temperature excess of rising bubble

### Rosseland Mean Opacity
```
1/κ_Ross = ∫ (1/κ_ν) × (∂B_ν/∂T) dν / ∫ (∂B_ν/∂T) dν
```
Harmonic mean weighted by Planck function derivative.

### Charge Conservation
```
n_e = Σ_i,j j × n_i,j
```
Total electron density from all ionization stages.

### Ideal Gas Law
```
P = (Σ n_i,j + n_e) k T
```
Total pressure from all particles (atoms + ions + electrons).

---

## XI. Units and Constants

**ATLAS12 unit system**: CGS (centimeter-gram-second)

**Key constants**:
- Boltzmann constant k = 1.380649 × 10^(-16) erg/K
- Planck constant h = 6.62607015 × 10^(-27) erg·s
- Speed of light c = 2.99792458 × 10^(10) cm/s
- Electron mass m_e = 9.1093837 × 10^(-28) g
- Stefan-Boltzmann σ = 5.670374 × 10^(-5) erg/(cm²·s·K⁴)

**Typical units**:
- Temperature: K (Kelvin)
- Pressure: dyne/cm²
- Density: g/cm³
- Number density: particles/cm³ or cm^(-3)
- Opacity: cm²/g
- Wavelength: Å (angstrom)
- Energy: eV or erg
- Optical depth: dimensionless

---

## XII. Physical Parameter Ranges

**Stellar parameters**:
- T_eff: 3,000-50,000 K (ATLAS12 validated range)
- log g: 0.0-5.0 (giants to white dwarfs)
- [M/H]: -5.0 to +1.0 (metal-poor to super-solar)

**Atmospheric structure**:
- Temperature: T_eff × 0.5 to T_eff × 1.2 (depth-dependent)
- Optical depth: τ_Ross ~ 10^(-6) to 10^(+2)
- Electron density: 10^(10) to 10^(17) cm^(-3) (depth and Teff dependent)

**Populations**:
- Number densities: 10^(-50) to 10^(+17) cm^(-3) (extreme range!)
- Ionization fractions: 10^(-42) to 1.0

---

## Document Status

**Version**: 1.0 (Phase 3 Complete)
**Created**: 2025-11-09
**Author**: Claude (Phase 3 archaeology session)
**Target Audience**: Future Julia developers and astrophysicists reviewing migration

**Completion Status**:
- ✅ Section I: Overview (complete)
- ✅ Section II: Input State (complete)
- ✅ Section III: Iteration Pipeline - All 7 steps (complete)
- ✅ Section IV: Physical Constraints & Conservation Laws (complete)
- ✅ Section V: Numerical Methods Summary (complete)
- ✅ Section VI: Failure Modes & Physics Checks (complete)
- ✅ Section VII: ATLAS12 vs ATLAS9 Comparison (complete)
- ✅ Section VIII: Migration Considerations (complete - CRITICAL)
- ✅ Section IX: Glossary (complete)
- ✅ Section X: Equation Reference (complete)
- ✅ Section XI: Units and Constants (complete)
- ✅ Section XII: Physical Parameter Ranges (complete)

**Document Statistics**:
- Length: ~1,500 lines
- Equations documented: 15+
- Pipeline steps: 7 (complete with physics, methods, validation)
- Failure modes catalogued: 15+
- Validation tests specified: 7
- Cross-references to Deep Dives: 7

**Key Deliverables**:
1. ✅ Complete physics documentation for one ATLAS12 iteration
2. ✅ Governing equations for each pipeline step
3. ✅ Precision requirements justified by Deep Dive analysis
4. ✅ Failure modes with detection methods
5. ✅ Migration guidance (what to preserve, where to optimize)
6. ✅ Comprehensive validation test suite

**Ready for**:
- Julia migration planning
- Physics review by domain experts
- Implementation roadmap development

**Questions flagged for Paula** (domain expert):
- OVERWT = 0.5D-5 bug in CONVEC? (Section III Step 6)
- TABCONT threshold tuning strategy? (Section III Step 3)
- Origin of COEFJ/COEFH pretabulated weights? (Section III Step 4)
- Typical damping parameter values for different stellar types? (Section III Step 5)

**Cross-references**:
- See `docs/archaeology/DEEP_DIVES/` for implementation details
- See `docs/archaeology/ARCHITECTURE_INSIGHTS.md` for code organization
- See `docs/archaeology/PHASE_3_BRIEFING.md` for mission context

---

**End of PHYSICS_PIPELINE.md**
