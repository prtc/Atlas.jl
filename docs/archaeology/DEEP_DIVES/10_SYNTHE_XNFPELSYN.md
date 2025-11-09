# Deep Dive 10: XNFPELSYN - Atmosphere Preparation
*Population and Continuum Opacity Calculator for SYNTHE*

**Code Section**: `upstream/castelli/source_codes/synthe/xnfpelsyn.for` (317 lines)

**Risk Type**: Algorithm Complexity, Binary I/O, Numerical Precision
**Analysis Date**: 2025-11-09
**Time Invested**: ~60 minutes

---

## Executive Summary

XNFPELSYN is the **first program in the SYNTHE execution pipeline**, preparing atmospheric structure and continuum opacities for spectrum synthesis. It bridges the gap between ATLAS12 atmosphere models and SYNTHE spectrum synthesis.

**What it does**:
1. Reads ATLAS12 atmosphere model from stdin
2. Computes atomic/molecular populations (Saha-Boltzmann equation)
3. Computes continuum opacities at ~377 wavelength points
4. Computes Doppler widths (thermal + turbulent broadening)
5. Writes binary file (fort.10) for spectrv.for to read

**Key findings**:

- **Short but Dense**: Only 317 lines, but calls complex ATLAS7V library routines (READIN, POPS, KAPP)
- **~377 Wavelength Points**: Continuum opacity sampled at edges spanning IR to UV
- **Pre-computation Strategy**: Compute opacities once, then interpolate in spectrv (much faster than computing on-the-fly)
- **POPS is Critical**: Saha-Boltzmann solver must be accurate (affects all line/continuum opacities)
- **Float64 Precision**: Populations computed in REAL*8 (critical for weak lines)

**Migration complexity**: Medium - Must port or interface with POPS (Saha-Boltzmann solver) from ATLAS7V library.

---

## Table of Contents

1. [Overview](#1-overview)
2. [Main Program Flow](#2-main-program-flow)
3. [Wavelength Edge Setup](#3-wavelength-edge-setup)
4. [Population Calculations (POPS)](#4-population-calculations-pops)
5. [H2 Molecular Formation](#5-h2-molecular-formation)
6. [Continuum Opacity Loop](#6-continuum-opacity-loop)
7. [Doppler Width Calculation](#7-doppler-width-calculation)
8. [Fort.10 Binary Format](#8-fort10-binary-format)
9. [ATLAS7V Library Dependencies](#9-atlas7v-library-dependencies)
10. [Migration Strategy](#10-migration-strategy)
11. [Testing Strategy](#11-testing-strategy)
12. [Open Questions](#12-open-questions)
13. [Key Takeaways](#13-key-takeaways)

---

## 1. Overview

### Purpose

XNFPELSYN prepares all the atmospheric data needed for spectrum synthesis:

**Inputs**:
- stdin: ATLAS atmosphere model (.mod file from ATLAS12)
- fort.2: molecules.dat (molecular equilibrium constants)
- fort.17: continua.dat (wavelength edges for opacity sampling)

**Outputs**:
- fort.10: Binary file containing:
  - Atmosphere structure (T, P, ρ, v_turb at each depth)
  - Populations (number densities for all ions)
  - Continuum opacities (at ~377 wavelength points)
  - Doppler widths (for each element)

**Usage in pipeline**:
```
ATLAS12 → (atmosphere.mod) → xnfpelsyn → (fort.10) → spectrv → spectrum
```

### Why Separate from Spectrv?

**Design rationale**: Pre-compute expensive calculations once, reuse many times.

- **POPS** (Saha-Boltzmann solver) requires ~20 iterations to converge
- **KAPP** (continuum opacity) involves H-, H2+, Rayleigh scattering, etc.
- These depend ONLY on (T, P, abundances) → constant for a given atmosphere
- Spectrv synthesizes spectrum at ~10^5 wavelength points

**Speedup**: Computing populations once vs 10^5 times = **~1000× faster**!

---

## 2. Main Program Flow

### Structure

```fortran
PROGRAM XNFPELSYN
  ! Read atmosphere model via READIN (from ATLAS7V)
  CALL READIN(20)

  ! Initialize fort.10 output file
  WRITE(10)NT,TEFF,GLOG,TITLE

  ! Read wavelength edges from fort.17
  [... loop reading edges ...]

  ! Compute populations for key elements (used in opacity calculation)
  CALL POPS(1.00D0,12,XNFH)    ! H I
  CALL POPS(2.01D0,12,XNFHE)   ! He I
  CALL POPS(6.01D0,11,XNFPC)   ! C II
  ! ... etc for Mg, Si, Ca, Fe, etc.

  ! Compute H2 molecular populations
  [... H2 equilibrium ...]

  ! Loop over wavelength edges, compute continuum opacity
  DO NU=1,NUMNU
    FREQ=FREQSET(NU)
    CALL KAPP(N,NSTEPS,STEPWT)  ! Continuum opacity at this frequency
    ! Store in CONTINALL, CONTABS, CONTSCAT arrays
  ENDDO

  ! Write atmosphere structure to fort.10
  WRITE(10)T,TKEV,TK,HKT,TLOG,HCKT,P,XNE,XNATOM,RHO,RHOX,VTURB,XNFH,XNFHE,XNFH2

  ! Compute populations for ALL elements (not just key ones)
  CALL POPS(...)  ! For all 99 elements

  ! Loop over depth points
  DO J=1,NRHOX
    ! Compute Doppler widths at this depth
    [... Doppler calculation ...]

    ! Write continuum opacities and populations for this depth
    WRITE(10)CONTINALL(...,J), CONTABS(...,J), CONTSCAT(...,J)
    WRITE(10)XNFPEL, DOPPLE
  ENDDO

  CALL EXIT
END
```

### Key Observations

1. **Two POPS passes**:
   - First: Compute populations for elements used in continuum opacity (lines 159-176)
   - Second: Compute populations for ALL elements (lines 215-244)

   **Why?** KAPP needs H, He, C, O, Mg, Si, Ca, Fe to compute continuum. But spectrum synthesis needs all 99 elements for line opacity.

2. **Depth loop is outermost** (lines 248-300):
   - For each depth J:
     - Write opacity grid for this depth
     - Write populations for this depth
   - Fort.10 structure: alternating (opacities, populations) for each depth

3. **ATLAS7V dependencies**:
   - READIN: Read atmosphere model
   - POPS: Saha-Boltzmann populations
   - KAPP: Continuum opacity
   - FREEFF: Free-format number parser

   All from 17K-line ATLAS7V library.

---

## 3. Wavelength Edge Setup

### Reading Edges from Fort.17

```fortran
11 EDGE=XFREEF(CARD)
   IF(EDGE.EQ.0.)GO TO 14  ! End of file
   IN=IN+1

   ! Determine what EDGE represents (wavelength, wavenumber, or frequency)
   IF(ABS(EDGE).LT.1.D6)GO TO 12       ! Wavelength in Angstroms
   IF(ABS(EDGE).LT.1.D25)GO TO 13      ! Frequency in Hz

   ! EDGE >= 1.E25: Wavenumber in cm^-1 (multiplied by 1.E25)
   CMEDGE(IN)=EDGE/1.D25
   WLEDGE(IN)=1.D7/CMEDGE(IN)
   FRQEDG(IN)=2.99792458D17/WLEDGE(IN)
   GO TO 1111

12 ! EDGE < 1.E6: Wavelength
   WLEDGE(IN)=EDGE
   CMEDGE(IN)=1.D7/EDGE
   FRQEDG(IN)=2.99792458D17/WLEDGE(IN)
   GO TO 1111

13 ! EDGE in [1.E6, 1.E25): Frequency
   FRQEDG(IN)=EDGE
   WLEDGE(IN)=2.99792458D17/EDGE
   CMEDGE(IN)=1.D7/WLEDGE(IN)

1111 CONTINUE
```

**Format auto-detection**:
- EDGE < 10^6: Interpret as wavelength (Å)
- 10^6 ≤ EDGE < 10^25: Interpret as frequency (Hz)
- EDGE ≥ 10^25: Interpret as wavenumber × 10^25 (cm^-1)

**Why this scheme?**
- Wavelengths: 10 Å (X-ray) to 10^5 Å (100 μm, far-IR) → 4-5 digits
- Frequencies: ~10^15 Hz (typical optical) → 15-16 digits
- Wavenumbers: ~10^3-10^5 cm^-1 → stored as 10^28-10^30 for distinction

**Clever but fragile!** 🐉 **Dragon**: What if someone inputs wavelength 10^6 Å (100 m, radio)?
Would be misinterpreted as frequency! No validation.

### Sorting Edges

```fortran
14 DO 17 LAST=2,IN
     LAST1=IN-LAST+2
     DO 16 I=2,LAST1
       IF(A(I).GE.A(I-1))GO TO 16
       ! Swap A(I) and A(I-1), and corresponding FRQEDG, WLEDGE, CMEDGE
       [... bubble sort implementation ...]
16   CONTINUE
17 CONTINUE
```

**Bubble sort!** Simple but O(N²).

**Typical N**: ~377 edges → ~142K comparisons. Fast enough (<1 ms on modern CPU).

### Creating Frequency Grid

```fortran
DO 18 I=1,IN-1
  NUMNU=NUMNU+1
  FREQSET(NUMNU)=ABS(FRQEDG(I))/1.0000001        ! Slightly below edge

  NUMNU=NUMNU+1
  FREQSET(NUMNU)=2.99792458E17/(ABS(WLEDGE(I))+ABS(WLEDGE(I+1)))*2.  ! Midpoint

  NUMNU=NUMNU+1
18 FREQSET(NUMNU)=ABS(FRQEDG(I+1))*1.0000001     ! Slightly above edge
ENDDO
```

**Result**: For each bin between edges I and I+1, sample at **3 frequencies**:
1. Just below lower edge (÷ 1.0000001 ≈ -0.01% shift)
2. Midpoint between edges
3. Just above upper edge (× 1.0000001 ≈ +0.01% shift)

**Why 3 points?** Enables parabolic interpolation in spectrv (see Deep Dive 08, Section 6).

**Total points**: 377 edges → 376 bins → 376 × 3 = **1128 points** (rounded to 1131 in arrays).

---

## 4. Population Calculations (POPS)

### Saha-Boltzmann Equation

**POPS** subroutine (from ATLAS7V library) solves:

**Saha equation** (ionization equilibrium):
```
n(ion+1) / n(ion) = (2 * partition_function(ion+1) / partition_function(ion))
                     × (2πm_e kT/h²)^(3/2) × exp(-χ(ion)/kT) / n_e
```

Where:
- n(ion) = number density of ionization stage
- χ(ion) = ionization potential
- n_e = electron density (must be solved self-consistently!)

**Boltzmann equation** (level populations within ion):
```
n(level) / n(ion) = g(level) × exp(-E(level)/kT) / partition_function
```

**Self-consistency**: Electron density n_e depends on ionization fractions, which depend on n_e!

**POPS iterates** until convergence (typically ~20 iterations).

### POPS Call Signature

```fortran
CALL POPS(CODE, MODE, XNFP_ARRAY)
```

**Parameters**:
- `CODE`: Element/ion code (e.g., 26.00 = Fe I, 26.01 = Fe II)
- `MODE`:
  - `11` = Single ionization stage (e.g., Fe II only)
  - `12` = All ionization stages (e.g., Fe I, Fe II, Fe III, ...)
  - `1` = Molecular species
- `XNFP_ARRAY`: Output array for number densities (kw depth points)

**Example** (lines 159-172):
```fortran
CALL POPS(1.00D0,12,XNFH)      ! H I (all stages: H I, H II)
CALL POPS(2.01D0,12,XNFHE)     ! He I (all stages: He I, He II, He III)
CALL POPS(1.01D0,11,XNFPH)     ! H II (single stage)
CALL POPS(2.02D0,11,XNFPHE)    ! He II (single stage)
CALL POPS(6.01D0,11,XNFPC)     ! C II (single stage)
CALL POPS(26.00D0,11,XNFPFE)   ! Fe I (single stage)
```

### Population Storage

**XNFP array** (lines 59, 214):
```fortran
DIMENSION XNFP(kw,10,99)
```

**Dimensions**:
- First: kw=99 depth points
- Second: 10 ionization stages (neutral to +9)
- Third: 99 elements (H to Es)

**Example access**:
```fortran
XNFP(J,1,26) = Fe I number density at depth J
XNFP(J,2,26) = Fe II number density at depth J
XNFP(J,3,26) = Fe III number density at depth J
```

**Memory**: 99 × 10 × 99 × 8 bytes = **~780 KB** (manageable)

### Precision Note

**REAL*8** (Float64) is **critical** for populations!

**Why?** Number densities span 20+ orders of magnitude:
- H I in photosphere: ~10^17 cm^-3
- Fe X in corona: ~10^5 cm^-3
- Trace elements: <10^-3 cm^-3

**Float32** would lose precision for weak ions → incorrect line strengths.

---

## 5. H2 Molecular Formation

### H2 Equilibrium

```fortran
DO 444 J=1,NRHOX
  XNFH2(J)=0.
  IF(T(J).LT.10000.)XNFH2(J)=XNFH(J)**2*EXP(4.477/TKEV(J)-4.6628E1+
   1(1.8031E-3+(-5.0239E-7+(8.1424E-11-5.0501E-15*T(J))*T(J))*T(J))*
   2T(J)-1.5*TLOG(J))
444 CONTINUE
```

**H2 formation**: 2H ⇌ H2

**Equilibrium constant**:
```
K(T) = n(H2) / n(H)²
```

**Temperature dependence**: Polynomial fit to partition function ratio and dissociation energy.

**Formula breakdown**:
```fortran
! Dissociation energy term
4.477/TKEV(J)              ! D_0 / kT  (D_0 ≈ 4.477 eV for H2)

! Partition function polynomial
-4.6628E1 + 1.8031E-3*T - 5.0239E-7*T² + 8.1424E-11*T³ - 5.0501E-15*T⁴

! Translational partition function
-1.5*TLOG(J)               ! -1.5 × ln(T)
```

**Temperature cutoff**: T < 10000 K only
- Above 10000 K, H2 fully dissociated → XNFH2 = 0

**Cool stars** (T < 4000 K): H2 dominates over H I!
- Important for M dwarfs, brown dwarfs
- Affects pressure (H2 has half the particles per unit mass compared to 2H)

---

## 6. Continuum Opacity Loop

### KAPP Call

```fortran
DO 125 NU=1,NUMNU
  FREQ=FREQSET(NU)
  CALL KAPP(N,NSTEPS,STEPWT)

  DO 129 J=1,NRHOX
    ABTOT(J)=ACONT(J)+SIGMAC(J)
    CONTINALL(NU,J)=LOG10(ABTOT(J))      ! Total opacity (absorption + scattering)
    CONTABS(NU,J)=LOG10(ACONT(J))        ! Absorption only
    CONTSCAT(NU,J)=LOG10(SIGMAC(J))      ! Scattering only
  129 CONTINUE
125 CONTINUE
```

**KAPP** (from ATLAS7V) computes continuum opacity from:

**Bound-free**:
- H I (1s → continuum, 2s → continuum, ...)
- He I, He II
- Metals (C, N, O, Mg, Si, Ca, Fe, ...)

**Free-free**:
- H, He
- Electron-ion bremsstrahlung

**Negative ions**:
- H- (bound-free and free-free)
- He-, C-, O-, Si- (less important)

**Molecular**:
- H2+ (dissociative recombination)

**Scattering**:
- Rayleigh scattering (H I, He I, H2)
- Electron scattering (Thomson)

**Output** (via COMMON blocks):
- `ACONT(kw)`: Absorption opacity (cm² per gram)
- `SIGMAC(kw)`: Scattering opacity (cm² per gram)

### Why Log10?

```fortran
CONTINALL(NU,J)=LOG10(ABTOT(J))
```

**Opacity range**: 10^-6 to 10^3 cm²/g → 9 orders of magnitude

**Storage**:
- Linear scale: Need Float64 for precision
- Log scale: Float32 sufficient (dynamic range ~10^38)

**Interpolation**: Parabolic in log-space (see Deep Dive 08) → smoother than linear.

---

## 7. Doppler Width Calculation

### Formula

```fortran
DOPPLE(1,NELEM)=SQRT(2.*TK(J)/ATMASS(NELEM)/1.660E-24 + VTURB(J)**2) / 2.99792458E10
```

**Physical meaning**: Δv/c (velocity dispersion as fraction of light speed)

**Components**:
1. **Thermal broadening**: `v_thermal = √(2kT/m)`
   - `TK(J)`: Temperature in K
   - `ATMASS(NELEM)`: Atomic mass in amu
   - `1.660E-24`: amu to grams conversion

2. **Turbulent broadening**: `v_turb` (km/s → cm/s conversion in VTURB array)

3. **Total**: `Δv = √(v_thermal² + v_turb²)`

**Divide by c**: Convert to fractional velocity

**Example** (Fe I at 5000 K, v_turb = 2 km/s):
```
v_thermal = √(2 × 1.38e-16 × 5000 / (56 × 1.66e-24)) = 8.9e4 cm/s
v_turb = 2e5 cm/s
Δv = √(8.9e4² + 2e5²) = 2.2e5 cm/s
Δv/c = 2.2e5 / 3e10 = 7.3e-6
```

**Doppler width in wavelength**:
```
Δλ / λ = Δv / c
```

At λ = 5000 Å: Δλ = 5000 × 7.3e-6 = 0.037 Å = 0.0037 nm

**Typical line FWHM**: ~0.1 Å (including damping wings).

### Doppler Array Structure

```fortran
DIMENSION DOPPLE(6,99)
```

**Dimensions**:
- First: 6 "ionization stages" (but all set equal - lines 261-265!)
- Second: 99 elements

🐉 **Dragon Alert**: Why dimension (6,99) if all 6 values are identical?

**Likely reason**: Historical artifact. Perhaps older versions had ion-dependent Doppler widths (e.g., different masses for neutral vs ionized states)? Current code just copies:

```fortran
DO 20 NELEM=1,99
  DOPPLE(1,NELEM)=SQRT(...)
  DOPPLE(2,NELEM)=DOPPLE(1,NELEM)
  DOPPLE(3,NELEM)=DOPPLE(1,NELEM)
  DOPPLE(4,NELEM)=DOPPLE(1,NELEM)
  DOPPLE(5,NELEM)=DOPPLE(1,NELEM)
20 DOPPLE(6,NELEM)=DOPPLE(1,NELEM)
```

**Memory waste**: 5× duplication! But only ~4 KB per depth, negligible.

### Molecular Doppler Widths

```fortran
IF(IFMOL.EQ.0)GO TO 270
DO 265 NELEM=40,99
265 DOPPLE(6,NELEM)=SQRT(2.*TK(J)/MOMASS(NELEM-39)/1.660E-24 + VTURB(J)**2) / 2.99792458E10
```

**Molecules stored in elements 40-99**:
- NELEM=40: H2 (mass from MOMASS(1) = 2 amu)
- NELEM=41: CH (MOMASS(2) = 13 amu)
- NELEM=42: OH (MOMASS(3) = 17 amu)
- ... etc

**Stored in dimension 6**: `DOPPLE(6,NELEM)`

**Why dimension 6?** Molecules treated as "6th ionization stage" (artificial convention).

---

## 8. Fort.10 Binary Format

### Record Structure

```fortran
! Record 1: Header
WRITE(10)NT,TEFF,GLOG,TITLE

! Record 2: Wavelength edges
WRITE(10)IN,(FRQEDG(I),WLEDGE(I),CMEDGE(I),I=1,IN),IDMOL,MOMASS

! Record 3: Frequency grid
WRITE(10)NUMNU,(FREQSET(NU),NU=1,NUMNU)

! Record 4: Atmosphere structure
WRITE(10)T,TKEV,TK,HKT,TLOG,HCKT,P,XNE,XNATOM,RHO,RHOX,VTURB,XNFH,XNFHE,XNFH2

! Records 5+: For each depth J=1,NRHOX
DO J=1,NRHOX
  WRITE(10)(CONTINALL(NU,J),NU=1,1131)   ! Total opacity at all frequencies
  WRITE(10)(CONTABS(NU,J),NU=1,1131)     ! Absorption opacity
  WRITE(10)(CONTSCAT(NU,J),NU=1,1131)    ! Scattering opacity
  WRITE(10)XNFPEL,DOPPLE                 ! Populations and Doppler widths
ENDDO
```

### Record Details

**Record 1** (Header):
- NT: INTEGER - Number of depth points
- TEFF: REAL*8 - Effective temperature (K)
- GLOG: REAL*8 - log10(surface gravity) (cgs)
- TITLE: 74 × CHARACTER*1 - Model description

**Record 2** (Wavelength edges):
- IN: (implicit from array size) - Number of edges (~377)
- FRQEDG: IN × REAL*8 - Frequencies (Hz)
- WLEDGE: IN × REAL*8 - Wavelengths (Å)
- CMEDGE: IN × REAL*8 - Wavenumbers (cm^-1)
- IDMOL: 60 × REAL*8 - Molecular codes (e.g., 106. = CH)
- MOMASS: 60 × REAL*8 - Molecular masses (amu)

**Record 3** (Frequency grid):
- NUMNU: (implicit) - Number of frequencies (~1131)
- FREQSET: NUMNU × REAL*8 - Frequencies (Hz)

**Record 4** (Atmosphere structure - depth-independent portion):
- T, TKEV, TK, HKT, TLOG, HCKT: kw × REAL*8 each - Temperature arrays
- P, XNE, XNATOM, RHO, RHOX: kw × REAL*8 each - Pressure, density arrays
- VTURB: kw × REAL*8 - Turbulent velocity
- XNFH, XNFHE, XNFH2: kw × REAL*8 each - H, He, H2 number densities

**Records 5 to 4+kw** (One per depth):
- CONTINALL: 1131 × REAL*8 - Total opacity vs frequency
- CONTABS: 1131 × REAL*8 - Absorption opacity
- CONTSCAT: 1131 × REAL*8 - Scattering opacity
- XNFPEL: (6,99) × REAL*8 - Populations for all ions
- DOPPLE: (6,99) × REAL*8 - Doppler widths

**File size estimate** (kw=99 depth points):
- Header: ~600 bytes
- Edges: 377 × 24 bytes = ~9 KB
- Frequency grid: 1131 × 8 bytes = ~9 KB
- Atmosphere structure: 15 × 99 × 8 bytes = ~12 KB
- Per depth: (1131×3 + 6×99×2) × 8 bytes = ~37 KB
- Total: ~600 + 30K + 99 × 37K = **~3.7 MB**

Manageable size for modern systems.

---

## 9. ATLAS7V Library Dependencies

### Required Subroutines

XNFPELSYN calls these ATLAS7V routines:

**READIN** (lines 86):
- Purpose: Read ATLAS atmosphere model from stdin
- Input: Fortran unit 5 (redirected to .mod file)
- Output: Fills all COMMON blocks (T, P, XNE, ABUND, VTURB, etc.)
- Complexity: ~500 lines (parses complex input format)

**POPS** (lines 159-244):
- Purpose: Solve Saha-Boltzmann equation for populations
- Algorithm: Iterative (Nelder-Mead? Newton-Raphson?)
- Precision: Float64 required
- Complexity: ~800 lines (includes partition functions)

**KAPP** (line 196):
- Purpose: Compute continuum opacity at given frequency
- Calls: ~30 opacity subroutines (HOP, HMINOP, C1OP, etc.)
- Complexity: ~200 lines (dispatcher) + 3000 lines (all opacity sources)

**FREEFF** (called via XFREEF, line 309):
- Purpose: Free-format number parser
- Why needed: Fort.17 has variable-format numbers
- Complexity: ~100 lines

**Total ATLAS7V code needed**: ~5000 lines minimum.

### Migration Options

**Option A: Port required ATLAS7V subroutines to Julia**
- ✅ Full control
- ✅ Can optimize (e.g., vectorize KAPP)
- ❌ Labor-intensive (~2-4 weeks)
- ❌ Must validate against Fortran

**Option B: Use Fortran-Julia interop**
- ✅ Quick (~1 week)
- ✅ Exact compatibility
- ❌ Requires Fortran compiler
- ❌ Harder to optimize

**Option C: Rewrite POPS/KAPP from scratch**
- ✅ Clean, modern code
- ✅ Can use better algorithms
- ❌ Very labor-intensive (~3-6 months)
- ❌ High risk of physics errors

**Recommendation**: **Option A** (port ATLAS7V) for long-term project, **Option B** (interop) for quick prototype.

---

## 10. Migration Strategy

### Phase 1: Understand POPS Algorithm

**Before porting**, document:
1. Saha equation solver algorithm (Newton-Raphson? Secant?)
2. Partition function data source (tabulated? Fitted polynomials?)
3. Convergence criteria (tolerance, max iterations)
4. Electron density iteration (how is n_e updated?)

**Action**: Deep dive into POPS source (ATLAS7V library).

### Phase 2: Julia POPS Implementation

```julia
"""
Solve Saha-Boltzmann equation for ionization/excitation equilibrium
"""
function saha_boltzmann!(
    populations::Array{Float64,2},  # (nlevels, nions) at single depth
    temperature::Float64,            # K
    electron_density::Float64,       # cm^-3 (initial guess)
    element::Element,                # Atomic data (ionization potentials, partition functions)
    tol::Float64=1e-6,
    maxiter::Int=50
)
    # Initialize
    n_e = electron_density

    for iter in 1:maxiter
        # Saha equation for each ionization stage
        for ion in 1:element.nions-1
            χ = element.ionization_potential[ion]  # eV
            U_i = partition_function(element, ion, temperature)
            U_ip1 = partition_function(element, ion+1, temperature)

            # Saha constant
            K_saha = 2 * U_ip1 / U_i * (2π * m_e * k_B * T / h^2)^(3/2) * exp(-χ * eV_to_erg / (k_B * T)) / n_e

            # Ratio of adjacent ionization stages
            populations[ion+1] / populations[ion] = K_saha
        end

        # Total number density constraint
        n_element = sum(populations)

        # Update electron density
        n_e_new = compute_electron_density(populations, all_elements)

        # Check convergence
        if abs(n_e_new - n_e) / n_e < tol
            return n_e_new  # Converged
        end

        n_e = n_e_new
    end

    @warn "Saha-Boltzmann did not converge after $maxiter iterations"
    return n_e
end
```

**Testing**: Compare Julia POPS vs Fortran POPS on simple test case (pure H atmosphere).

### Phase 3: Julia KAPP Implementation

```julia
"""
Compute continuum opacity at given wavelength and depth point
"""
function continuum_opacity(
    wave::Float64,           # Wavelength (Å)
    atmosphere::AtmospherePoint,  # T, P, n_e, populations at single depth
    opacity_sources::OpacitySources = default_sources
)
    κ_abs = 0.0
    κ_scat = 0.0

    # Bound-free opacities
    if :H_bf in opacity_sources
        κ_abs += h_boundfree(wave, atmosphere)
    end

    if :Hminus_bf in opacity_sources
        κ_abs += hminus_boundfree(wave, atmosphere)
    end

    # Free-free opacities
    if :H_ff in opacity_sources
        κ_abs += h_freefree(wave, atmosphere)
    end

    # Scattering
    if :Rayleigh in opacity_sources
        κ_scat += rayleigh_scattering(wave, atmosphere)
    end

    if :Thomson in opacity_sources
        κ_scat += thomson_scattering(atmosphere.n_e)
    end

    return (absorption=κ_abs, scattering=κ_scat)
end
```

**Validation**: Compare opacity at test wavelengths against Fortran KAPP.

### Phase 4: Fort.10 Writer

```julia
struct ContinuumOpacityTable
    nedge::Int
    frequencies::Vector{Float64}      # Hz
    wavelengths::Vector{Float64}      # Angstroms
    wavenumbers::Vector{Float64}      # cm^-1

    nfreq::Int
    freq_grid::Vector{Float64}        # Hz

    opacity_total::Matrix{Float64}    # (nfreq, ndepth)
    opacity_abs::Matrix{Float64}
    opacity_scat::Matrix{Float64}

    populations::Array{Float64,3}     # (nion, nelement, ndepth)
    doppler::Array{Float64,3}         # (nion, nelement, ndepth)

    atmosphere::AtmosphereModel
end

function write_fort10(filename::String, opacity_table::ContinuumOpacityTable)
    open(filename, "w") do io
        # Write in Fortran UNFORMATTED format
        write_fortran_record(io, opacity_table.atmosphere.ndepth,
                                 opacity_table.atmosphere.teff,
                                 opacity_table.atmosphere.logg,
                                 opacity_table.atmosphere.title)

        write_fortran_record(io, opacity_table.frequencies,
                                 opacity_table.wavelengths,
                                 opacity_table.wavenumbers,
                                 MOLECULAR_IDS, MOLECULAR_MASSES)

        # ... etc for each record
    end
end
```

**Challenge**: Must match Fortran UNFORMATTED format exactly (see Deep Dive 04).

---

## 11. Testing Strategy

### Unit Tests

**Test 1: Wavelength Edge Parsing**
```julia
@testset "Edge Parsing" begin
    # Test wavelength input (< 1e6)
    edge = 5000.0
    freq, wave, wavenum = parse_edge(edge)
    @test wave ≈ 5000.0
    @test freq ≈ 5.996e14  # c / λ
    @test wavenum ≈ 20000.0  # 1 / λ (in cm)

    # Test frequency input (1e6 to 1e25)
    edge = 5.996e14
    freq, wave, wavenum = parse_edge(edge)
    @test freq ≈ 5.996e14
    @test wave ≈ 5000.0

    # Test wavenumber input (>= 1e25)
    edge = 20000.0 * 1e25
    freq, wave, wavenum = parse_edge(edge)
    @test wavenum ≈ 20000.0
    @test wave ≈ 5000.0
end
```

**Test 2: Saha-Boltzmann Convergence**
```julia
@testset "POPS Convergence" begin
    # Simple case: pure H atmosphere
    T = 5000.0  # K
    P = 1e4     # dyne/cm²

    # Initial guess for electron density
    n_e_guess = 1e13  # cm^-3

    # Solve
    pops, n_e = saha_boltzmann(T, P, hydrogen_data, n_e_guess)

    # Check Saha equation is satisfied
    χ = 13.6  # eV (H ionization potential)
    U_HI = 2.0  # Partition function
    U_HII = 1.0

    expected_ratio = 2 * U_HII / U_HI * (2π * m_e * k_B * T / h^2)^(3/2) *
                     exp(-χ * eV_to_erg / (k_B * T)) / n_e

    @test pops[2] / pops[1] ≈ expected_ratio rtol=1e-6
end
```

**Test 3: H2 Equilibrium**
```julia
@testset "H2 Formation" begin
    T = 3000.0  # K (cool star)
    n_H = 1e17  # cm^-3

    n_H2 = h2_equilibrium(T, n_H)

    # At 3000 K, most H should be in H2
    @test n_H2 > 0.4 * n_H  # At least 40% in H2 form

    # High temperature: no H2
    n_H2_hot = h2_equilibrium(12000.0, n_H)
    @test n_H2_hot ≈ 0.0 atol=1e10
end
```

### Integration Tests

**Test 4: Compare with Fortran**
```julia
@testset "Fort.10 Compatibility" begin
    # Run Fortran xnfpelsyn
    run(`./xnfpelsyn < test_solar.mod`)

    # Read Fortran fort.10
    fort10_f = read_fort10_fortran("fort.10")

    # Run Julia xnfpelsyn
    opacity_table = xnfpelsyn_julia("test_solar.mod")

    # Compare opacities
    for j in 1:opacity_table.ndepth
        for ν in 1:opacity_table.nfreq
            @test opacity_table.opacity_total[ν,j] ≈
                  fort10_f.opacity_total[ν,j] rtol=0.01  # 1% tolerance
        end
    end

    # Compare populations
    for elem in 1:99
        for ion in 1:6
            for j in 1:ndepth
                @test opacity_table.populations[ion,elem,j] ≈
                      fort10_f.populations[ion,elem,j] rtol=0.05  # 5% tolerance
            end
        end
    end
end
```

---

## 12. Open Questions

### For Code Archaeology

1. **POPS algorithm**: What specific method is used?
   - Need to read POPS source in ATLAS7V
   - Is it Newton-Raphson? Secant method?
   - How is electron density updated each iteration?

2. **Partition functions**: Where do they come from?
   - Tabulated data files?
   - Fitted polynomials?
   - What accuracy/completeness?

3. **DOPPLE dimension**: Why (6,99) when all 6 are identical?
   - Historical artifact?
   - Future-proofing for ion-dependent Doppler widths?
   - Can we simplify to (99) in Julia?

4. **IDMOL, MOMASS**: Why dimension 60?
   - Only ~40 molecules defined
   - Is there room for expansion?
   - What is the molecule numbering scheme?

### For Domain Expert

5. **H2 polynomial**: Where does this formula come from?
   ```fortran
   EXP(4.477/TKEV(J)-4.6628E1+(1.8031E-3+...)*T-1.5*TLOG(J))
   ```
   - Reference paper?
   - Valid temperature range?
   - Accuracy compared to modern data?

6. **Wavelength edges**: Why ~377 points?
   - Matches ATLAS12's 344 + 33 = 377?
   - Optimized distribution (more points where opacity changes rapidly)?
   - Can we use fewer (or more) points in Julia?

7. **Continuum opacity sources**: Which are most important?
   - H- dominates in solar photosphere
   - What about cooler stars (TiO opacity)?
   - Can we skip minor sources for speed?

### For Migration Decisions

8. **ATLAS7V porting**: How much code do we really need?
   - Can we extract just POPS, KAPP, READIN?
   - Or need full 17K lines?
   - Dependencies between subroutines?

9. **Precision**: Can we use Float32 anywhere?
   - Populations: NO (must be Float64)
   - Opacities: Maybe (log-space helps)
   - Doppler widths: Probably (small numbers, limited range)

10. **Optimization**: Where to focus efforts?
    - POPS is called ~120 times (once per element/ion)
    - KAPP is called ~1131 times (once per frequency)
    - Which is the bottleneck? (Need profiling)

---

## 13. Key Takeaways

### Architecture

1. **Pre-computation Strategy**: Calculate expensive quantities once, reuse in spectrv
2. **Two-Pass POPS**: First for opacity sources, second for all elements
3. **~377 Wavelength Edges**: Sample continuum opacity at selected points, interpolate in spectrv
4. **Depth-Major Format**: Fort.10 organized by depth (all data for depth J together)

### Physics

5. **Saha-Boltzmann Critical**: Population accuracy directly affects spectrum quality
6. **H2 Formation Important**: Especially for cool stars (T < 4000 K)
7. **Continuum Opacities**: H- dominates in solar-type stars, must include all sources for accuracy
8. **Doppler Widths**: Thermal + turbulent broadening, element-dependent via atomic mass

### Implementation

9. **ATLAS7V Dependency**: Cannot migrate xnfpelsyn without POPS and KAPP
10. **Float64 Precision**: Required for populations (span 20+ orders of magnitude)
11. **Binary Format**: Fort.10 is Fortran UNFORMATTED (must match exactly for validation)
12. **Bubble Sort**: Used for wavelength edges (N~377, fast enough)

### Migration Priorities

13. **Start with POPS**: Most critical algorithm, affects everything downstream
14. **Then KAPP**: Many opacity sources, can parallelize
15. **Test Incrementally**: Validate each component against Fortran before proceeding
16. **Fort.10 Last**: Output format compatibility essential for spectrv integration

---

*End of Deep Dive 10*

**Next**: Deep Dive 11 will analyze rotation/broadening kernels (rotate.for, broaden.for, smooth.for).
