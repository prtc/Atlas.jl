# ATLAS7V Phase 4: Critical Subroutines Deep Dive

## Executive Summary

Detailed analysis of the 4 Tier-1 critical atlas7v subroutines required by SYNTHE, based on source code inspection and architectural understanding.

**Total Code**: 1,328 lines across 4 subroutines (POPS, KAPP, JOSH, READIN)

**Key Finding**: These subroutines are **well-structured dispatchers and solvers**, not monolithic algorithms. Each has clear responsibilities and can be migrated incrementally.

**Migration Readiness**: HIGH - All 4 subroutines have clean interfaces via COMMON blocks and can be tested independently.

---

## Table of Contents

1. [POPS: Population Solver](#pops-population-solver)
2. [KAPP: Opacity Dispatcher](#kapp-opacity-dispatcher)
3. [JOSH: Radiative Transfer Solver](#josh-radiative-transfer-solver)
4. [READIN: Atmosphere Parser](#readin-atmosphere-parser)
5. [COMMON Block Dependencies](#common-block-dependencies)
6. [Migration Strategy](#migration-strategy)
7. [Testing Strategy](#testing-strategy)

---

## POPS: Population Solver

**Lines**: 101 (2789-2889)
**Purpose**: Calculate atomic/ionic/molecular number densities via Saha-Boltzmann equilibrium
**Called by**: xnfpelsyn (44× for different elements)

### Interface

```fortran
SUBROUTINE POPS(CODE, MODE, NUMBER)
  REAL*8 CODE         ! Element/ion code (e.g., 1.00=H I, 1.01=H II, 26.00=Fe I)
  INTEGER MODE        ! Mode: 1=ionization fraction, 2=number density, 10+=multiple ions
  REAL*8 NUMBER(kw,10) ! Output: populations for each depth × ionization stage
```

**Element Code Format**:
- Integer part: Atomic number (1=H, 2=He, 6=C, ..., 26=Fe)
- Decimal part × 100: Ionization stage (0=neutral, 1=singly ionized, ...)
- Examples:
  - 1.00 → H I (neutral hydrogen)
  - 1.01 → H II (ionized hydrogen, protons)
  - 26.00 → Fe I (neutral iron)
  - 26.01 → Fe II (singly ionized iron)

### Algorithm

POPS is a **dispatcher** that handles three cases:

#### Case 1: Atomic Species (CODE < 100, IFMOL=0)

```fortran
IF(CODE.LT.1.D2)GO TO 110
110 IZ=CODE                          ! Extract atomic number
    NION=(CODE-DBLE(IZ))*100.+1.5   ! Extract ionization stage + 1
    DO J=1,NRHOX
      CALL PFSAHA(J,IZ,NION,MODE,NUMBER)  ! Saha equation solver
      ! Convert ionization fractions to number densities:
      NUMBER(J,ION) = NUMBER(J,ION) * XNATOM(J) * XABUND(IZ)
    END DO
```

**Logic**:
1. Parse element code to get atomic number (IZ) and ionization stage (NION)
2. Loop over all atmospheric depths (NRHOX)
3. Call PFSAHA to compute ionization fractions via Saha equation
4. Scale by total atom density (XNATOM) and element abundance (XABUND)

#### Case 2: Molecular Species (CODE ≥ 100, IFMOL=1)

```fortran
200 IF(CODE.LT.100.)GO TO 300   ! Handle atomic+molecular mixed case
    ! Lookup molecule in CODEMOL table
    DO JMOL=1,NUMMOL
      IF(CODEMOL(JMOL).EQ.CODE)GO TO 203
    END DO
    ! Molecule not found, return zero
    DO J=1,NRHOX
      NUMBER(J,1)=0.
    END DO
    RETURN
203 ! Return molecular populations based on MODE
    IF(MODE.EQ.1)NUMBER(J,1) = XNFPMOL(J,JMOL)  ! Fraction
    IF(MODE.EQ.2)NUMBER(J,1) = XNMOL(J,JMOL)    ! Number density
    IF(MODE.EQ.3)NUMBER(J,1) = XNMOL/XNFPMOL    ! Ratio
```

**Logic**:
1. Search CODEMOL table for matching molecular species code
2. If found, return pre-computed molecular populations from XNMOL/XNFPMOL
3. If not found, return zero (molecule not included in calculation)

**Molecular Codes** (examples):
- 240: H₂
- 246: CH
- 264: C₂
- 270: CN
- 276: CO
- 366: TiO
- 534: H₂O

#### Case 3: Hybrid (Atomic Code with IFMOL=1)

```fortran
300 ! Handle atomic species when molecules are enabled
    ! Try molecular lookup first, fall back to atomic
```

### Key Dependencies

**Subroutines**:
- PFSAHA (950 lines): Partition function calculator, Saha equation solver

**COMMON Blocks**:
- /RHOX/: RHOX(kw), NRHOX - depth scale
- /STATE/: XNATOM(kw) - total atom number density
- /ELEM/: ABUND(99), XABUND(99) - element abundances
- /XNMOL/: XNMOL(kw,MAXMOL), XNFPMOL(kw,MAXMOL), CODEMOL(MAXMOL) - molecular data
- /IF/: IFMOL - molecular on/off flag

### Migration Notes

**Complexity**: LOW
- Simple dispatcher logic
- Clean separation of atomic vs molecular cases
- No complex numerics (just table lookup and scaling)

**Dependencies**:
- PFSAHA must be migrated first (or stubbed)
- COMMON blocks must be replaced with structs

**Testing**:
- Unit test: H I populations at T=5000K, P_e=100 dyne/cm², compare to Saha equation
- Integration test: Compare Fe I populations for solar model against Kurucz reference

**Julia Translation**:
```julia
function pops(code::Float64, mode::Int, atm::AtmosphereState)
    if code == 0.0
        return zeros(atm.n_depths, 10)
    end

    iz = floor(Int, code)  # Atomic number
    ionization_stage = round(Int, (code - iz) * 100) + 1

    populations = zeros(atm.n_depths, 10)

    for j in 1:atm.n_depths
        pfsaha!(j, iz, ionization_stage, mode, populations, atm)
        # Convert fractions to number densities
        for ion in 1:ionization_stage
            populations[j, ion] *= atm.n_atoms[j] * atm.abundances[iz]
        end
    end

    return populations
end
```

---

## KAPP: Opacity Dispatcher

**Lines**: 118 (4324-4441)
**Purpose**: Compute continuum opacity by dispatching to element-specific opacity calculators
**Called by**: xnfpelsyn (pre-computation), ATLAS12 (iteration)

### Interface

```fortran
SUBROUTINE KAPP(N, NSTEPS, STEPWT)
  INTEGER N       ! 0=initialize and compute continuum, >0=recompute lines only
  INTEGER NSTEPS  ! Number of frequency integration steps (for lines)
  REAL*8 STEPWT   ! Integration step weight (for lines)
```

### Algorithm

KAPP operates in two modes:

#### Mode 1: Initialize + Continuum (N ≤ 1)

```fortran
IF(N.GT.1)GO TO 200  ! Skip if recomputing lines

! Zero all opacity arrays
DO J=1,NRHOX
  AHYD(J)=0.    ! H I bound-free
  AHMIN(J)=0.   ! H⁻ opacity
  AH2P(J)=0.    ! H₂⁺ opacity
  AHE1(J)=0.    ! He I bound-free
  ! ... 20+ arrays for different opacity sources ...
END DO

! Conditionally call opacity subroutines based on IFOP flags
IF(IFOP(1).EQ.1)CALL HOP      ! H I bound-free
IF(IFOP(2).EQ.1)CALL H2PLOP   ! H₂⁺
IF(IFOP(3).EQ.1)CALL HMINOP   ! H⁻
IF(IFOP(4).EQ.1)CALL HRAYOP   ! H Rayleigh scattering
IF(IFOP(5).EQ.1)CALL HE1OP    ! He I bound-free
! ... 15 more conditional calls ...

! Accumulate total opacity
DO J=1,NRHOX
  ACONT(J) = AH2P(J) + AHEMIN(J) + ALUKE(J) + AHOT(J) +
             AHYD(J) + AHMIN(J) + AXCONT(J) + AHE1(J) + AHE2(J) + ACOOL(J)
  ! Compute opacity-weighted source function
  SCONT(J) = (weighted sum of source functions) / ACONT(J)
  ! Scattering opacity
  SIGMAC(J) = SIGH(J) + SIGHE(J) + SIGEL(J) + SIGH2(J) + SIGX(J)
END DO
```

#### Mode 2: Recompute Lines Only (N > 1)

```fortran
200 IF(IFOP(15).EQ.1)CALL LINOP(N,NSTEPS,STEPWT)
    IF(IFOP(16).EQ.1)CALL LINSOP(N,NSTEPS,STEPWT)
    DO J=1,NRHOX
      ALINE(J) = AHLINE(J) + ALINES(J) + AXLINE(J)
      ! Recompute line source function
      SLINE(J) = (weighted sum) / ALINE(J)
      SIGMAL(J) = SIGLIN(J) + SIGXL(J)
    END DO
```

### IFOP Opacity Flags

KAPP uses a 20-element flag array to control which opacity sources are computed:

| IFOP(i) | Opacity Source | Subroutine | Critical? |
|---------|----------------|------------|-----------|
| 1 | H I bound-free | HOP | ✓ CRITICAL |
| 2 | H₂⁺ | H2PLOP | Medium (cool stars) |
| 3 | H⁻ | HMINOP | ✓ CRITICAL |
| 4 | H Rayleigh | HRAYOP | ✓ HIGH |
| 5 | He I bound-free | HE1OP | ✓ CRITICAL |
| 6 | He II bound-free | HE2OP | ✓ HIGH |
| 7 | He⁻ | HEMIOP | Low |
| 8 | He Rayleigh | HERAOP | Low |
| 9 | Cool opacity | COOLOP | Low |
| 10 | Luke opacity | LUKEOP | Low |
| 11 | Hot opacity | HOTOP | Low |
| 12 | Electron scattering | ELECOP | ✓ HIGH |
| 13 | H₂ Rayleigh | H2RAOP | Low |
| 14 | H lines | HLINOP | Medium |
| 15 | General lines | LINOP | HIGH |
| 16 | Line scattering | LINSOP | Medium |
| 17-20 | X-opacities | XLINOP, XLISOP, XCONOP, XSOP | Low |

**Typical Solar Synthesis**: IFOP = [1,0,1,1,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0]
- Enables: H I, H⁻, H Rayleigh, He I, He II, electron scattering
- Disables: Exotic sources, X-variants

### Opacity Accumulation

KAPP computes three types of opacity:

**1. Absorption Opacity** (`ACONT`, `ALINE`):
- True absorption (photons removed from beam)
- Weighted sum: `ACONT = Σ(A_i)` over all absorption sources

**2. Scattering Opacity** (`SIGMAC`, `SIGMAL`):
- Coherent scattering (photons redirected, not absorbed)
- Examples: Rayleigh scattering, electron scattering

**3. Source Functions** (`SCONT`, `SLINE`):
- Opacity-weighted thermal emission
- `SCONT = Σ(A_i × S_i) / Σ(A_i)`
- Where `S_i` is Planck function `B_ν(T)` for thermal sources

### Key Dependencies

**Subroutines** (20 opacity calculators):
- HOP, HMINOP, HRAYOP, HE1OP, HE2OP, ELECOP (critical 6)
- H2PLOP, HEMIOP, HERAOP, H2RAOP, COOLOP, LUKEOP, HOTOP (secondary 7)
- HLINOP, LINOP, LINSOP, XLINOP, XLISOP, XCONOP, XSOP (line opacities, 7)

**COMMON Blocks** (~15 blocks with element-specific opacity arrays):
- /BHYD/: H opacity arrays (AHYD, AHMIN, AH2P, SIGH, etc.)
- /BHE/: He opacity arrays (AHE1, AHE2, SIGHE, etc.)
- /BC/, /BMG/, /BAL/, /BSI/, /BFE/: Metal opacity arrays
- /OPS/: Exotic opacities (ACOOL, ALUKE, AHOT, SIGEL, etc.)
- /OPTOT/: Total opacity (ACONT, SCONT, ALINE, SLINE, SIGMAC, SIGMAL)
- /FREQ/: Frequency, stimulated emission factor
- /TEMP/, /STATE/, /RHOX/: Atmosphere structure

### Migration Notes

**Complexity**: LOW (dispatcher logic), but depends on 20 opacity subroutines

**Critical Path**:
1. Migrate 6 critical opacity subroutines first (HOP, HMINOP, HRAYOP, HE1OP, HE2OP, ELECOP)
2. Stub remaining 14 opacity subroutines with warnings
3. Implement KAPP dispatcher (trivial once dependencies exist)

**Testing**:
- Unit test each opacity subroutine independently (e.g., H⁻ opacity at λ=5000Å, T=5000K)
- Integration test: Compare total continuum opacity for solar model against OPAL/OP tables

**Julia Translation**:
```julia
struct OpacityConfig
    ifop::Vector{Bool}  # 20 flags for opacity sources
end

function kapp!(n::Int, nsteps::Int, stepwt::Float64,
               atm::AtmosphereState, opacities::OpacityState, config::OpacityConfig)
    if n ≤ 1
        # Initialize and compute continuum
        zero_opacity_arrays!(opacities)

        config.ifop[1] && hop!(opacities, atm)        # H I
        config.ifop[3] && hminop!(opacities, atm)     # H⁻
        config.ifop[4] && hrayop!(opacities, atm)     # H Rayleigh
        config.ifop[5] && he1op!(opacities, atm)      # He I
        config.ifop[6] && he2op!(opacities, atm)      # He II
        config.ifop[12] && elecop!(opacities, atm)    # Electron scattering
        # ... other opacity sources ...

        # Accumulate total continuum opacity
        for j in 1:atm.n_depths
            opacities.a_cont[j] = sum([opacities.a_hyd[j], opacities.a_hmin[j], ...])
            opacities.s_cont[j] = weighted_source_function(opacities, j)
            opacities.sigma_c[j] = sum([opacities.sig_h[j], opacities.sig_he[j], ...])
        end
    else
        # Recompute lines only
        config.ifop[15] && linop!(n, nsteps, stepwt, opacities, atm)
        config.ifop[16] && linsop!(n, nsteps, stepwt, opacities, atm)

        for j in 1:atm.n_depths
            opacities.a_line[j] = sum([opacities.a_hline[j], opacities.a_lines[j], ...])
            opacities.s_line[j] = weighted_source_function_line(opacities, j)
        end
    end
end
```

---

## JOSH: Radiative Transfer Solver

**Lines**: 239 (7941-8179)
**Purpose**: Solve radiative transfer equation via Feautrier method
**Called by**: spectrv (twice per wavelength: continuum + total)

### Interface

```fortran
SUBROUTINE JOSH(IFSCAT, IFSURF)
  INTEGER IFSCAT  ! 0=no scattering (S_ν=B_ν), 1=solve integral equation for S_ν
  INTEGER IFSURF  ! 0=compute J and H, 1=compute surface flux, 2=compute specific intensity I_μ
```

**Mode Combinations**:
- `JOSH(0,0)`: LTE, compute mean intensity J and Eddington flux H
- `JOSH(1,0)`: Non-LTE with scattering, solve for source function, compute J and H
- `JOSH(1,1)`: Non-LTE, compute surface flux only (for emergent spectrum)
- `JOSH(0,2)`: LTE, compute specific intensities I(μ) at surface (for disk integration)

### Algorithm: Feautrier Method

JOSH implements the **Feautrier method** for solving the radiative transfer equation:

```
μ ∂I/∂τ = I - S
```

Where:
- I(τ,μ) = specific intensity
- τ = optical depth
- μ = cosine of angle from normal (μ=1 is outward)
- S = source function

**Feautrier Variables**:
```
u(τ) = [I(τ,+μ) + I(τ,-μ)] / 2   ! Symmetric combination
v(τ) = [I(τ,+μ) - I(τ,-μ)] / 2   ! Antisymmetric combination
```

These satisfy:
```
μ ∂u/∂τ = v
μ ∂v/∂τ = u - S
```

### Step-by-Step Implementation

#### 1. Compute Total Opacity and Source Function

```fortran
DO J=1,NRHOX
  ABTOT(J) = ACONT(J) + ALINE(J) + SIGMAC(J) + SIGMAL(J)  ! Total extinction
  ALPHA(J) = (SIGMAC(J) + SIGMAL(J)) / ABTOT(J)           ! Scattering fraction
  SNUBAR(J) = (ACONT(J)*SCONT(J) + ALINE(J)*SLINE(J)) / (ACONT(J)+ALINE(J))  ! Thermal source
END DO
```

#### 2. Compute Optical Depth Scale

```fortran
CALL INTEG(RHOX, ABTOT, TAUNU, NRHOX, ABTOT(1)*RHOX(1))
! TAUNU(J) = ∫[0 to RHOX(J)] ABTOT(ρ) dρ
```

#### 3. Interpolate to Feautrier Grid

```fortran
! Interpolate from depth grid (RHOX, NRHOX) to standard optical depth grid (XTAU8, NXTAU=51)
MAXJ = MAP1(TAUNU, SNUBAR, NRHOX, XTAU8, XSBAR8, NXTAU)  ! Source function
MAXJ = MAP1(TAUNU, ALPHA, NRHOX, XTAU8, XALPHA8, NXTAU)   ! Scattering fraction
```

**Standard Optical Depth Grid** (51 points, logarithmically spaced):
```fortran
DATA XTAU8/0.,.0000032,.0000056,.00001,.000018,.000032,.000056,
  .0001,.00018,.00032,.00056,.001,.0018,.0032,.0056,.01,.016,.025,
  .042,.065,.096,.139,.196,.273,.375,.5,.63,.78,.95,1.15,1.35,1.6,
  1.85,2.15,2.45,2.75,3.15,3.65,4.25,5.0,6.,7.,8.,9.,10.,11.5,
  13.,14.5,16.,18.,20./
```

#### 4. Solve Integral Equation for Source Function (if IFSCAT=1)

**Integral Equation**:
```
S(τ) = (1-α) × B(τ) + α × Λ[S]
```

Where:
- α = scattering fraction (ALPHA)
- B(τ) = thermal source (SNUBAR)
- Λ[S] = scattering integral operator (via COEFJ matrix)

**Iterative Solution** (Gauss-Seidel):
```fortran
DO L=1,NXTAU  ! Iterate until convergence
  IFERR=0
  K=NXTAU+1
  DO KK=1,NXTAU
    K=K-1
    DELXS=0.
    DO M=1,NXTAU
      DELXS = DELXS + COEFJ(K,M)*XS(M)  ! Matrix-vector product
    END DO
    DELXS = (DELXS*XALPHA(K) + XSBAR(K) - XS(K)) / DIAG(K)
    IF(ABS(DELXS/XS(K)).GT.0.00001)IFERR=1
    XS(K) = MAX(XS(K) + DELXS, 1.E-38)  ! Update with floor to avoid negatives
  END DO
  IF(IFERR.EQ.0)GO TO 35  ! Converged
END DO
```

**COEFJ Matrix**: Pre-computed Feautrier integration weights (51×51) for angle-averaged scattering integral.

#### 5. Compute Mean Intensity J and Flux H

**J (mean intensity)**:
```fortran
DO L=1,NXTAU
  XJS(L) = -XS(L)
  DO M=1,NXTAU
    XJS(L) = XJS(L) + COEFJ(L,M)*XS(M)  ! J = Λ[S]
  END DO
  JNU(J) = JMINS(J) + SNU(J)  ! Add source function
END DO
```

**H (Eddington flux)**:
```fortran
DO L=1,NXTAU
  XH(L) = 0.
  DO M=1,NXTAU
    XH(L) = XH(L) + COEFH(L,M)*XS(M)  ! H via COEFH weights
  END DO
END DO
```

**COEFH Matrix**: Pre-computed weights for first moment (flux) integral (51×51).

#### 6. Compute Surface Flux (if IFSURF=1)

```fortran
XH(1) = 0.
DO M=1,NXTAU
  XH(1) = XH(1) + CH(M)*XS(M)  ! Surface flux via CH weights
END DO
HNU(1) = XH(1)
```

**CH Weights** (51 values): Hardcoded data array for surface flux integration.

#### 7. Compute Specific Intensities I(μ) (if IFSURF=2)

```fortran
DO MU=1,NMU  ! Loop over angles
  SURFI(MU) = 0.
  DO J=1,N1
    ! Formal solution: I = ∫ S(τ) e^(-τ/μ) dτ
    SURFI(MU) = SURFI(MU) +
      EXTAU(J,MU)*(XS8(J) + parabolic_correction) -
      EXTAU(J+1,MU)*(XS8(J+1) + parabolic_correction)
  END DO
END DO
```

Uses parabolic interpolation (via PARCOE) for higher accuracy.

### Key Dependencies

**Subroutines**:
- DERIV (20 lines): Numerical derivative
- INTEG (18 lines): Trapezoidal integration
- MAP1 (58 lines): Table interpolation
- PARCOE (38 lines): Parabolic coefficient calculator (for specific intensities)

**COMMON Blocks**:
- /MATXJ/, /MATXH/: COEFJ(51,51), COEFH(51,51) - Feautrier integration weights
- /TAUSHJ/: TAUNU, SNU, HNU, JNU, JMINS - optical depth, source function, radiation field
- /OPTOT/: ACONT, SCONT, ALINE, SLINE, SIGMAC, SIGMAL - opacities and source functions
- /RHOX/: RHOX, NRHOX - depth scale
- /ABTOT/: ABTOT, ALPHA - total opacity, scattering fraction
- /MUS/: ANGLE(20), SURFI(20), NMU - angles and specific intensities

### Migration Notes

**Complexity**: MEDIUM-HIGH
- Well-structured algorithm (Feautrier method is standard)
- Iterative solver (Gauss-Seidel) is straightforward
- COEFJ/COEFH matrices are pre-computed (need to extract or recompute)

**Critical Issues**:
1. **COEFJ/COEFH matrices**: Where are these computed? Likely in BLOCKJ subroutine (787 lines)
2. **CH weights**: Hardcoded data array - need to verify source
3. **CK weights**: Used for K (second moment) - also hardcoded

**Testing**:
- Unit test: Gray atmosphere (α=0, S=B) - analytical solution exists
- Integration test: Isothermal atmosphere, compare J and H against exact solution
- Validation: Emergent intensity for solar model, compare to Kurucz atlas

**Julia Translation**:
```julia
function josh!(ifscat::Bool, ifsurf::Int, atm::AtmosphereState,
               opacities::OpacityState, radiation::RadiationField,
               feautrier::FeautrierGrid)
    # 1. Compute total opacity
    for j in 1:atm.n_depths
        abtot[j] = opacities.a_cont[j] + opacities.a_line[j] +
                   opacities.sigma_c[j] + opacities.sigma_l[j]
        alpha[j] = (opacities.sigma_c[j] + opacities.sigma_l[j]) / abtot[j]
        snu_bar[j] = (opacities.a_cont[j]*opacities.s_cont[j] +
                      opacities.a_line[j]*opacities.s_line[j]) /
                     (opacities.a_cont[j] + opacities.a_line[j])
    end

    # 2. Compute optical depth
    integrate!(atm.rhox, abtot, tau_nu, atm.n_depths)

    # 3. Interpolate to Feautrier grid
    map1!(tau_nu, snu_bar, atm.n_depths, feautrier.tau, xs_bar, feautrier.n_tau)
    map1!(tau_nu, alpha, atm.n_depths, feautrier.tau, x_alpha, feautrier.n_tau)

    # 4. Solve for source function (if scattering)
    if ifscat
        gauss_seidel_solver!(xs, xs_bar, x_alpha, feautrier.coef_j, feautrier.n_tau)
    else
        xs .= xs_bar  # LTE: S = B
    end

    # 5. Compute radiation field
    if ifsurf == 0
        compute_j_and_h!(xs, feautrier, radiation)
    elseif ifsurf == 1
        compute_surface_flux!(xs, feautrier, radiation)
    elseif ifsurf == 2
        compute_specific_intensities!(xs, snu, tau_nu, atm.angles, radiation)
    end
end
```

---

## READIN: Atmosphere Parser

**Lines**: 870 (1312-2181)
**Purpose**: Parse atmosphere model from input file (fort.5) using keyword-based format
**Called by**: spectrv, ATLAS12 main program

### Interface

```fortran
SUBROUTINE READIN(MODE)
  INTEGER MODE  ! 1=compute new model, 2/20=read existing model
```

### File Format: Keyword-Based

READIN uses a **keyword dispatcher** similar to a command language:

```
TEFF 5777.
GRAVITY 4.437
BEGIN
OPACITY ON H1 HMINUS HRAY HE1 HE2 ELECTRON
READ DECK6
 72
 -5.00  4942.3  3.756E+02  1.148E+16  2.367E-01 ...
 -4.90  4961.5  4.218E+02  1.358E+16  2.407E-01 ...
 ...
END
```

### Keywords Implemented

**Atmosphere Structure**:
- `TEFF`: Effective temperature (K)
- `GRAVITY`: Surface gravity (cm/s² or log g)
- `BEGIN`: Begin model atmosphere
- `CALCULATE`: Compute model with specified parameters
- `READ DECK6`: Read atmosphere from tabular data

**Physical Settings**:
- `OPACITY ON/OFF`: Enable/disable opacity sources (H1, HMINUS, HE1, etc.)
- `MOLECULES ON/OFF`: Enable/disable molecular equilibrium
- `SCATTERING`: Set scattering mode
- `CONVECTION`: Enable convection
- `TURBULENCE`: Set microturbulence

**Abundances**:
- `ABUNDANCE CHANGE`: Modify element abundances
- `ABUNDANCE SCALE`: Scale all abundances

**Iteration Control**:
- `ITERATIONS`: Set number of iterations
- `PRINT`: Control output frequency
- `PUNCH`: Control punch (output) frequency

**Advanced**:
- `READ DEPARTURE COEFFICIENTS`: Read NLTE b-factors
- `TITLE`: Set title string
- `PRESSURE`: Pressure parameters
- `CHANGE RHOX`: Modify depth scale

### Keyword Parser Implementation

```fortran
99 READ(5,1) CARD          ! Read 80-character card
1  FORMAT(80A1)
   MIAC = IWORDF(CARD)     ! Convert to alphanumeric code

   ! Dispatch on keyword
   IF(MIAC.EQ.1020133)GO TO 100      ! TEFF
   IF(MIAC.EQ.519223721)GO TO 200    ! GRAVITY
   IF(MIAC.EQ.1070201044)GO TO 300   ! OPACITY
   IF(MIAC.EQ.20688921)GO TO 400     ! KAPPA
   IF(MIAC.EQ.661856797)GO TO 500    ! ITERATIONS
   IF(MIAC.EQ.930198669)GO TO 600    ! MOLECULES
   ! ... 20+ more keywords ...

   GO TO 9000  ! Unrecognized keyword, error
```

**MIAC Encoding**: Machine-Independent Alphameric Code (base-37)
- A=1, B=2, ..., Z=26, 0=27, 1=28, ..., 9=36
- Example: "TEFF" = (20×37³ + 5×37² + 6×37 + 6) = 1020133

**IWORDF Function**: Converts ASCII string to MIAC integer (in atlas7v.for, line 2310)

### Example: Reading DECK6 Format

```fortran
1140 NRHOX=FREEFF(CARD)  ! Read number of depths
     DO J=1,NRHOX
       READ(5,1)CARD
       RHOX(J) = FREEFF(CARD)    ! Column mass depth (g/cm²)
       T(J) = FREEFF(CARD)        ! Temperature (K)
       P(J) = FREEFF(CARD)        ! Gas pressure (dyne/cm²)
       XNE(J) = FREEFF(CARD)      ! Electron density (cm⁻³)
       ABROSS(J) = FREEFF(CARD)   ! Rosseland opacity
       PRAD(J) = FREEFF(CARD)     ! Radiation pressure
       VTURB(J) = FREEFF(CARD)    ! Microturbulence velocity (km/s)
     END DO
```

**FREEFF Function**: Parse floating-point number from CARD string (atlas7v.for, line 2203)

### T-Tau Relation Initialization

When `CALCULATE` is used, READIN initializes a gray atmosphere:

```fortran
700 NRHOX=FREEFF(CARD)
    TAU1LG=FREEFF(CARD)   ! log₁₀(τ_Ross) at first depth
    STEPLG=FREEFF(CARD)   ! log₁₀ step size

    DO J=1,NRHOX
      TAUROS(J) = 10^(TAU1LG + (J-1)*STEPLG)  ! Rosseland optical depth
      ! Eddington-Barbier approximation:
      T(J) = TEFF * (0.75*(0.710 + TAUROS(J) - 0.1331*EXP(-3.4488*TAUROS(J))))^0.25
    END DO

    CALL TTAUP(T, TAUROS, ABROSS, PTOTAL, P, PRAD, PTURB, GRAV, NRHOX)
```

**Gray T(τ) Relation**: Eddington-Barbier with empirical correction (Kurucz formula)

**TTAUP Subroutine** (258 lines, 2383-2640): Converts T-τ to T-P-ρ structure via integration of hydrostatic equilibrium.

### Key Dependencies

**Subroutines**:
- IWORDF (73 lines): Parse keyword from string → MIAC code
- FREEFF (107 lines): Parse floating-point from string
- FREEFR (15 lines): Parse integer from string
- TTAUP (258 lines): T-tau → T-P-ρ conversion via hydrostatic integration
- INTEG (18 lines): Integration utility (called by TTAUP)

**COMMON Blocks** (~30 blocks! READIN touches almost everything):
- /ELEM/: Element abundances
- /TEMP/: Temperature arrays
- /STATE/: Pressure, density, electron density
- /RHOX/: Depth scale
- /TEFF/: T_eff, log g
- /IF/: Flags (IFMOL, IFOP, IFSCAT, etc.)
- /CONV/: Convection parameters
- /TURBPR/: Turbulence parameters
- /ITER/: Iteration control
- Plus element-specific /BHYD/, /BHE/, /BC/, /BMG/, etc.

### Migration Notes

**Complexity**: HIGH (largest single routine, many keywords)

**Strategy**:
1. **MVP**: Support minimal keyword set for reading DECK6 format only
   - `READ DECK6` → parse tabular atmosphere
   - `TEFF`, `GRAVITY` → basic parameters
   - `OPACITY IFOP` → opacity flags
   - `END` → finish parsing
2. **Extended**: Add `CALCULATE` keyword for gray atmosphere initialization
3. **Full**: Support all keywords (NLTE, convection, turbulence, etc.)

**Alternative Approach**: Replace keyword parser with modern format (JSON, TOML, HDF5)

**Testing**:
- Unit test: Parse Kurucz solar model (DECK6 format)
- Validation: Compare parsed T, P, ρ against reference values

**Julia Translation**:
```julia
struct AtmosphereModel
    n_depths::Int
    rhox::Vector{Float64}      # Column mass depth (g/cm²)
    T::Vector{Float64}          # Temperature (K)
    P::Vector{Float64}          # Gas pressure (dyne/cm²)
    P_e::Vector{Float64}        # Electron pressure
    ρ::Vector{Float64}          # Density
    κ_ross::Vector{Float64}     # Rosseland opacity
    v_turb::Vector{Float64}     # Microturbulence
end

function read_atmosphere(filename::String)
    # Modern approach: use TOML/JSON instead of keyword parser
    config = TOML.parsefile(filename)

    if haskey(config, "deck6_file")
        return read_deck6(config["deck6_file"])
    elseif haskey(config, "calculate")
        return calculate_gray_atmosphere(config["calculate"])
    else
        error("Unknown atmosphere format")
    end
end

function read_deck6(filename::String)
    lines = readlines(filename)
    n_depths = parse(Int, strip(lines[1]))

    model = AtmosphereModel(n_depths, ...)
    for (j, line) in enumerate(lines[2:n_depths+1])
        fields = split(line)
        model.rhox[j] = parse(Float64, fields[1])
        model.T[j] = parse(Float64, fields[2])
        model.P[j] = parse(Float64, fields[3])
        model.P_e[j] = parse(Float64, fields[4])
        model.κ_ross[j] = parse(Float64, fields[5])
        # ...
    end

    return model
end
```

---

## COMMON Block Dependencies

All 4 subroutines heavily rely on COMMON blocks for global state. Here's the dependency mapping:

### COMMON Blocks Used by All 4

| Block | Contents | Size | Purpose |
|-------|----------|------|---------|
| /RHOX/ | RHOX(kw), NRHOX | kw+1 | Depth scale (column mass) |
| /TEMP/ | T, TKEV, TK, HKT, TLOG, HCKT, ITEMP | 6×kw+1 | Temperature arrays |
| /STATE/ | P, XNE, XNATOM, RHO, PTOTAL | 5×kw | Pressure, density, electrons |

### COMMON Blocks by Subroutine

**POPS** (5 blocks):
- /ELEM/: ABUND(99), ATMASS(99), ELEM(99), XABUND(99), WTMOLE
- /IF/: IFCORR, IFPRES, IFSURF, IFSCAT, IFMOL, NLTEON, IFOP(20)
- /XNMOL/: CODEMOL(MAXMOL), XNMOL(kw,MAXMOL), XNFPMOL(kw,MAXMOL), NUMMOL

**KAPP** (15 blocks!):
- /BAL/, /BB/, /BC/, /BCA/, /BFE/, /BHE/, /BHYD/, /BK/, /BMG/, /BNA/, /BO/, /BSI/ (element opacities)
- /FREQ/: FREQ, FREQLG, EHVKT, STIM, BNU, WAVENO
- /OPS/: ACOOL, ALUKE, AHOT, SIGEL, ALINES, SIGLIN, etc.
- /OPTOT/: ACONT, SCONT, ALINE, SLINE, SIGMAC, SIGMAL

**JOSH** (7 blocks):
- /ABTOT/: ABTOT(kw), ALPHA(kw)
- /MATXJ/, /MATXH/: COEFJ(51,51), COEFH(51,51)
- /MUS/: ANGLE(20), SURFI(20), NMU
- /OPTOT/: ACONT, SCONT, ALINE, SLINE, SIGMAC, SIGMAL
- /PRD/: Partial redistribution parameters (advanced)
- /TAUSHJ/: TAUNU, SNU, HNU, JNU, JMINS
- /PZERO/: Pressure zero-point parameters

**READIN** (~30 blocks):
- All of the above plus:
- /ABROSS/: ABROSS(kw), TAUROS(kw)
- /CONV/: Convection parameters
- /FLUX/: FLUX, FLXERR, FLXDRV, FLXRAD
- /ITER/: ITER, IFPRNT(15), IFPNCH(15), NUMITS
- /JUNK/: TITLE(74), FREQID(6), WLTE, XSCALE
- /RAD/: ACCRAD(kw), PRAD(kw)
- /TEFF/: TEFF, GRAV, GLOG
- /TURBPR/: VTURB, PTURB, turbulence parameters
- Plus all element-specific /BX/ blocks

### Total COMMON Block Memory

Estimating memory usage (kw=99 depths):

| Category | Blocks | Arrays | Memory |
|----------|--------|--------|--------|
| Atmosphere (T, P, ρ, etc.) | 5 | ~20 × 99 | ~16 KB |
| Populations (XNFP arrays) | 12 | ~100 × 99 | ~80 KB |
| Opacities (A, S, Σ arrays) | 15 | ~150 × 99 | ~120 KB |
| Radiation (J, H, S arrays) | 3 | ~10 × 99 | ~8 KB |
| Matrices (COEFJ, COEFH) | 2 | 2 × 51² | ~20 KB |
| Miscellaneous | 10 | Various | ~20 KB |
| **TOTAL** | **~50** | **~400 arrays** | **~260 KB** |

**Migration Impact**: All COMMON blocks must be replaced with Julia structs. This is a **massive refactoring** but cleanly separates concerns.

---

## Migration Strategy

### Phase A: COMMON Block Replacement (Week 1-2)

Design Julia data structures to replace COMMON blocks:

```julia
struct AtmosphereState
    n_depths::Int
    rhox::Vector{Float64}       # Column mass (g/cm²)
    T::Vector{Float64}           # Temperature (K)
    T_kev::Vector{Float64}       # Temperature (keV)
    log_T::Vector{Float64}       # log₁₀(T)
    P::Vector{Float64}           # Gas pressure (dyne/cm²)
    P_e::Vector{Float64}         # Electron pressure
    ρ::Vector{Float64}           # Density (g/cm³)
    n_e::Vector{Float64}         # Electron number density (cm⁻³)
    n_atoms::Vector{Float64}     # Total atom number density
    # ... etc
end

struct PopulationState
    xnfp::Array{Float64, 3}     # Populations (depth × element × ionization)
    xnfh::Vector{Float64}        # H I populations
    xnfhe::Vector{Float64}       # He I populations
    # ... etc
end

struct OpacityState
    a_cont::Vector{Float64}      # Continuum absorption
    s_cont::Vector{Float64}      # Continuum source function
    a_line::Vector{Float64}      # Line absorption
    s_line::Vector{Float64}      # Line source function
    sigma_c::Vector{Float64}     # Continuum scattering
    sigma_l::Vector{Float64}     # Line scattering
    # Element-specific arrays
    a_hyd::Vector{Float64}       # H I opacity
    a_hmin::Vector{Float64}      # H⁻ opacity
    # ... etc
end

struct RadiationField
    tau_nu::Vector{Float64}      # Optical depth
    s_nu::Vector{Float64}        # Source function
    j_nu::Vector{Float64}        # Mean intensity
    h_nu::Vector{Float64}        # Eddington flux
    # ... etc
end

struct FeautrierGrid
    n_tau::Int
    tau::Vector{Float64}         # Standard optical depth grid (51 points)
    coef_j::Matrix{Float32}      # Integration weights J (51×51)
    coef_h::Matrix{Float32}      # Integration weights H (51×51)
    ch::Vector{Float32}          # Surface flux weights (51)
    ck::Vector{Float32}          # K weights (51)
end
```

### Phase B: Utilities (Week 3)

Migrate helper functions (no dependencies):
- DERIV (20 lines)
- INTEG (18 lines)
- MAP1 (58 lines)
- PARCOE (38 lines)
- W (9 lines)

**Effort**: 1 week, high confidence

### Phase C: POPS (Week 4-5)

Migrate POPS + PFSAHA:
- POPS (101 lines): Simple dispatcher
- PFSAHA (950 lines): Complex partition function calculator

**Blockers**:
- PFIRON (6K lines) - **defer with placeholder**

**Testing**: Compare H I, He I, Mg I, Fe I populations for solar model

**Effort**: 2 weeks

### Phase D: KAPP (Week 6-9)

Migrate KAPP + critical opacity subroutines:

**Week 6-7**: Core opacities
- HOP (122 lines): H I bound-free
- HMINOP (105 lines): H⁻ opacity
- HE1OP (206 lines): He I bound-free

**Week 8**: Secondary opacities
- HRAYOP (148 lines): H Rayleigh scattering
- HE2OP (89 lines): He II bound-free
- ELECOP (12 lines): Electron scattering

**Week 9**: KAPP dispatcher + testing
- KAPP (118 lines)
- Integration testing against OPAL tables

**Effort**: 4 weeks

### Phase E: JOSH (Week 10-11)

Migrate JOSH + setup:

**Week 10**: BLOCKJ investigation
- Locate or recompute COEFJ, COEFH matrices
- Extract CH, CK weight arrays

**Week 11**: JOSH implementation
- Port Feautrier solver (239 lines)
- Test against gray atmosphere analytical solution

**Effort**: 2 weeks

### Phase F: READIN (Week 12-13)

Migrate minimal READIN:

**Week 12**: DECK6 parser
- Read tabular atmosphere format
- Parse TEFF, GRAVITY, OPACITY keywords
- Validate against Kurucz solar model

**Week 13**: TTAUP + gray atmosphere
- Port T-tau initialization (258 lines)
- Support CALCULATE keyword

**Defer**: Advanced keywords (NLTE, convection, etc.)

**Effort**: 2 weeks

---

## Testing Strategy

### Unit Tests (Per Subroutine)

**POPS**:
```julia
@testset "POPS H I Populations" begin
    # Test Saha equation for H I at T=5000K, P_e=100 dyne/cm²
    atm = test_atmosphere(T=5000.0, P_e=100.0)
    pops_result = pops(1.00, mode=1, atm)

    # Compare to analytical Saha equation
    saha_result = saha_equation(Z=1, T=5000.0, P_e=100.0)
    @test isapprox(pops_result[1,1], saha_result, rtol=0.01)
end
```

**KAPP**:
```julia
@testset "KAPP H⁻ Opacity" begin
    atm = test_atmosphere(T=5000.0, P_e=100.0, λ=5000.0)
    opacities = OpacityState(atm.n_depths)
    config = OpacityConfig(ifop=[false for _ in 1:20])
    config.ifop[3] = true  # H⁻ only

    kapp!(0, 1, 1.0, atm, opacities, config)

    # Compare to published H⁻ opacity (John 1988)
    john_opacity = h_minus_opacity_john(5000.0, 5000.0, 100.0)
    @test isapprox(opacities.a_hmin[1], john_opacity, rtol=0.1)
end
```

**JOSH**:
```julia
@testset "JOSH Gray Atmosphere" begin
    # Test against analytical solution for gray atmosphere
    atm = gray_atmosphere(T_eff=5777.0, log_g=4.437)
    opacities = gray_opacities(atm)
    radiation = RadiationField(atm.n_depths)
    feautrier = FeautrierGrid()

    josh!(false, 0, atm, opacities, radiation, feautrier)

    # Analytical solution: J = 0.5 * B(T_eff) at τ=0
    @test isapprox(radiation.j_nu[1], 0.5*planck(atm.T[1], λ), rtol=0.05)
end
```

**READIN**:
```julia
@testset "READIN Kurucz Solar Model" begin
    model = read_atmosphere("kurucz_solar.dat")

    # Verify T_eff
    @test isapprox(model.T_eff, 5777.0, rtol=0.01)

    # Verify hydrostatic equilibrium
    for j in 2:model.n_depths
        dP = model.P[j] - model.P[j-1]
        dρx = model.rhox[j] - model.rhox[j-1]
        @test isapprox(dP/dρx, -model.g, rtol=0.1)
    end
end
```

### Integration Tests

**End-to-End Solar Spectrum**:
```julia
@testset "Solar Fe I Line Synthesis" begin
    # Read solar model
    model = read_atmosphere("kurucz_solar.dat")

    # Compute populations
    populations = compute_populations(model)

    # Compute opacities (continuum + Fe I lines)
    opacities = compute_opacities(model, populations, λ_range=[6000.0, 6003.0])

    # Solve radiative transfer
    spectrum = synthesize_spectrum(model, opacities)

    # Compare to Kurucz solar atlas
    atlas = read_kurucz_atlas(6000.0, 6003.0)
    correlation = cor(spectrum.flux, atlas.flux)
    @test correlation > 0.95  # Expect >95% correlation

    rms_error = sqrt(mean((spectrum.flux .- atlas.flux).^2))
    @test rms_error < 0.05  # <5% RMS error
end
```

---

## Document Status

**Phase 4**: COMPLETE ✓
**Subroutines Analyzed**: 4 (POPS, KAPP, JOSH, READIN)
**Total Lines**: 1,328 lines
**Migration Estimate**: 12-13 weeks for Tier 1 (excluding PFIRON)
**Next**: Commit and push, then assess remaining work
