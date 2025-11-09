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

**Physical process**: [TO BE FILLED]

**Governing equation(s)**: [TO BE FILLED]

**Input state**: [TO BE FILLED]

**Output state**: [TO BE FILLED]

**Physical constraints**: [TO BE FILLED]

**Method**: [TO BE FILLED]

**Precision requirements**: [TO BE FILLED]

**Typical values**: [TO BE FILLED]

**Failure modes**: [TO BE FILLED]

**Questions for Paula**: [TO BE FILLED]

**Migration notes**: [TO BE FILLED]

**Fortran implementation**: KAPCONT subroutine
**Deep Dive reference**: [Cross-reference if available]

---

### Step 3: Line Opacity Calculations

**Physical process**: [TO BE FILLED]

**Governing equation(s)**: [TO BE FILLED - Voigt profile]

**Input state**: [TO BE FILLED]

**Output state**: [TO BE FILLED]

**Physical constraints**: [TO BE FILLED]

**Method**: [TO BE FILLED]

**Precision requirements**: [TO BE FILLED]

**Typical values**: [TO BE FILLED]

**Failure modes**: [TO BE FILLED]

**Questions for Paula**: [TO BE FILLED]

**Migration notes**: [TO BE FILLED]

**Fortran implementation**: XLINOP, LINOP1 subroutines
**Deep Dive reference**: See `docs/archaeology/DEEP_DIVES/03_LINE_OPACITY_SUMMATION.md`, `01_VOIGT_PROFILE.md`

---

### Step 4: Radiative Transfer

**Physical process**: [TO BE FILLED]

**Governing equation(s)**: [TO BE FILLED - RT equation]

**Input state**: [TO BE FILLED]

**Output state**: [TO BE FILLED]

**Physical constraints**: [TO BE FILLED]

**Method**: [TO BE FILLED - Feautrier-like]

**Precision requirements**: [TO BE FILLED]

**Typical values**: [TO BE FILLED]

**Failure modes**: [TO BE FILLED]

**Questions for Paula**: [TO BE FILLED]

**Migration notes**: [TO BE FILLED]

**Fortran implementation**: JOSH subroutine
**Deep Dive reference**: See `docs/archaeology/DEEP_DIVES/05_RADIATIVE_TRANSFER.md`

---

### Step 5: Temperature Correction

**Physical process**: [TO BE FILLED]

**Governing equation(s)**: [TO BE FILLED - radiative equilibrium]

**Input state**: [TO BE FILLED]

**Output state**: [TO BE FILLED]

**Physical constraints**: [TO BE FILLED]

**Method**: [TO BE FILLED - damped Newton-Raphson]

**Precision requirements**: [TO BE FILLED]

**Typical values**: [TO BE FILLED]

**Failure modes**: [TO BE FILLED]

**Questions for Paula**: [TO BE FILLED]

**Migration notes**: [TO BE FILLED]

**Fortran implementation**: TCORR subroutine
**Deep Dive reference**: See `docs/archaeology/DEEP_DIVES/06_ITERATION_DAMPING.md`

---

### Step 6: Convection

**Physical process**: [TO BE FILLED]

**Governing equation(s)**: [TO BE FILLED - mixing length theory]

**Input state**: [TO BE FILLED]

**Output state**: [TO BE FILLED]

**Physical constraints**: [TO BE FILLED]

**Method**: [TO BE FILLED]

**Precision requirements**: [TO BE FILLED]

**Typical values**: [TO BE FILLED]

**Failure modes**: [TO BE FILLED]

**Questions for Paula**: [TO BE FILLED]

**Migration notes**: [TO BE FILLED]

**Fortran implementation**: CONVEC subroutine
**Deep Dive reference**: See `docs/archaeology/DEEP_DIVES/07_CONVECTIVE_TRANSPORT.md`

---

### Step 7: Convergence Check

**Physical process**: [TO BE FILLED]

**Convergence criteria**: [TO BE FILLED]

**Typical iteration count**: [TO BE FILLED]

---

## IV. Physical Constraints & Conservation Laws

### 4.1 Energy Conservation

**Integrated flux condition**: [TO BE FILLED]

### 4.2 Particle Number Conservation

[TO BE FILLED]

### 4.3 Hydrostatic Equilibrium

**Equation**: dP/dτ = g/κ_Ross

[TO BE FILLED]

### 4.4 Radiative Equilibrium

**Equation**: ∫ (J_ν - S_ν) κ_ν dν = 0

[TO BE FILLED]

### 4.5 Charge Conservation

[TO BE FILLED]

---

## V. Numerical Methods Summary

### 5.1 Population Solver

[TO BE FILLED - Direct calculation, iterative n_e]

### 5.2 Opacity Calculations

[TO BE FILLED]

### 5.3 Radiative Transfer Solver

[TO BE FILLED - Feautrier-like method]

### 5.4 Temperature Correction Algorithm

[TO BE FILLED - Damped Newton-Raphson]

### 5.5 Convection Solver

[TO BE FILLED - MLT, numerical derivatives]

### 5.6 Convergence Acceleration

[TO BE FILLED - Adaptive damping]

---

## VI. Failure Modes & Physics Checks

### 6.1 Non-Convergence Scenarios

**Oscillation**: [TO BE FILLED]

**Divergence**: [TO BE FILLED]

**Slow convergence**: [TO BE FILLED]

### 6.2 Unphysical Outputs

**Negative densities**: [TO BE FILLED]

**Inverted temperature gradient**: [TO BE FILLED]

**Flux non-conservation**: [TO BE FILLED]

### 6.3 Precision Failures

**Underflow**: [TO BE FILLED]

**Overflow**: [TO BE FILLED]

**Catastrophic cancellation**: [TO BE FILLED]

### 6.4 When LTE Breaks Down

[TO BE FILLED]

---

## VII. Comparison: ATLAS12 vs ATLAS9

### 7.1 Physics Differences

**Opacity treatment**: [TO BE FILLED - OS vs ODF]

### 7.2 Numerical Method Differences

[TO BE FILLED]

### 7.3 Accuracy Improvements

[TO BE FILLED]

---

## VIII. Migration Considerations

### 8.1 Physics That Must Be Preserved Exactly

1. **Population calculations**: Float64 precision, Saha-Boltzmann equation, charge conservation
2. [TO BE FILLED]

### 8.2 Where Optimizations Are Safe

1. **Voigt profile evaluation**: Float32 acceptable (see Deep Dive 01)
2. [TO BE FILLED]

### 8.3 Physical Validation Tests

**Flux conservation**: [TO BE FILLED]

**Population ratios**: [TO BE FILLED]

**Hydrostatic equilibrium**: [TO BE FILLED]

### 8.4 Precision Requirements by Component

| Component | Precision | Justification |
|-----------|-----------|---------------|
| Populations | Float64 | 40+ order magnitude range (Deep Dive 02) |
| Voigt profiles | Float32 | Target accuracy ~2% (Deep Dive 01) |
| Line opacity | Float64 recommended | "Cheap insurance" (Deep Dive 03) |
| RT integration | Mixed | Weights Float32, sources Float64 (Deep Dive 05) |

---

## IX. Glossary

**LTE** (Local Thermodynamic Equilibrium): Statistical equilibrium where level populations follow Boltzmann distribution and ionization follows Saha equation. Valid when collisions dominate radiative processes.

**Rosseland mean opacity**: Harmonic mean opacity weighted by Planck function derivative. Relevant for radiative diffusion (optically thick regime).

**Partition function**: Statistical sum over all accessible energy states. Accounts for excited state populations.

**Optical depth**: τ = ∫ κρ dz. Measures attenuation of radiation. τ=1 is photosphere (where radiation escapes).

**Source function**: S_ν = j_ν / κ_ν (emission / absorption). In LTE, S_ν = B_ν(T) (Planck function).

**Hydrostatic equilibrium**: Force balance between gravity and pressure gradient. Valid when dynamical timescales >> sound crossing time.

[Additional terms to be added as needed]

---

## X. Equation Reference

### Saha Equation
```
n_i,j+1 / n_i,j = (2 Z_i,j+1 / Z_i,j) × (2π m_e k T / h²)^(3/2) × exp(-χ_i,j / kT) / n_e
```

### Boltzmann Equation
[TO BE FILLED]

### Radiative Transfer Equation
[TO BE FILLED]

### Voigt Profile
[TO BE FILLED]

### Mixing Length Theory
[TO BE FILLED]

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

**End of PHYSICS_PIPELINE.md skeleton**

---

**Status**: Skeleton created, Section III Step 1 (Populations) complete, remaining sections to be filled
**Next steps**: Fill in remaining pipeline steps using Deep Dive references and Fortran code analysis
**Estimated completion**: Sections II-VIII will be completed in Phase 3 work sessions
