# Deep Dive 08: SPECTRV - Radiative Transfer Solver
*SYNTHE Pipeline Component: Emergent Spectrum Computation*

**Code Section**:
- Castelli: `upstream/castelli/source_codes/synthe/spectrv.for` (438 lines)
- Kurucz: `upstream/kurucz/source_codes/programs/SYNTHECD/spectrv.for` (555 lines)

**Risk Type**: Algorithm Complexity, Numerical Precision, Performance
**Analysis Date**: 2025-11-09
**Time Invested**: ~90 minutes

---

## Executive Summary

SPECTRV is the radiative transfer solver in the SYNTHE pipeline, computing emergent intensity or flux spectrum from an atmosphere model and pre-computed line opacities. It represents **Program 9** in the 11-program SYNTHE pipeline.

**Key Findings**:

1. **Purpose**: Solves radiative transfer equation to compute emergent spectrum from atmosphere + opacity data
2. **Two Versions**: Castelli (1997) and Kurucz (1993) versions have **diverged significantly**
3. **Main Algorithm**: Wavelength loop calling JOSH (radiative transfer solver from ATLAS7V library) at each wavelength
4. **Performance**: ~Seconds to minutes depending on wavelength range (much faster than synthe.for which calculates opacities)
5. **Critical Dependencies**:
   - Reads atmosphere from stdin (same ATLAS model format as xnfpelsyn)
   - Reads pre-computed line opacities from fort.9 (synthe.for output)
   - Reads continuum opacities from fort.10 (xnfpelsyn output - Castelli only)
   - Calls JOSH from atlas7v.for library (radiative transfer solver)

**Migration Complexity**: **Medium** - Algorithm is well-defined, but dependencies on ATLAS7V library and binary I/O formats add complexity.

**Key Design Difference**:
- **Castelli**: Reads pre-computed continuum opacity tables from xnfpelsyn (fort.10), interpolates using parabolic coefficients
- **Kurucz**: Calls POPS/CONT3 to compute populations and continuum on-the-fly

This represents a significant architectural decision affecting the SYNTHE workflow.

---

## Table of Contents

1. [Overview and Context](#1-overview-and-context)
2. [Castelli vs Kurucz Versions](#2-castelli-vs-kurucz-versions)
3. [Main Program Flow](#3-main-program-flow)
4. [Initialization Phase](#4-initialization-phase)
5. [Wavelength Loop Structure](#5-wavelength-loop-structure)
6. [Continuum Opacity Handling](#6-continuum-opacity-handling)
7. [Line Opacity Integration](#7-line-opacity-integration)
8. [Radiative Transfer Solution](#8-radiative-transfer-solution)
9. [Output Format](#9-output-format)
10. [COMMON Block Architecture](#10-common-block-architecture)
11. [Migration Strategy](#11-migration-strategy)
12. [Testing Strategy](#12-testing-strategy)
13. [Open Questions](#13-open-questions)
14. [Key Takeaways](#14-key-takeaways)

---

## 1. Overview and Context

### Purpose

SPECTRV solves the radiative transfer equation to compute the emergent spectrum from a stellar atmosphere model. It is the **final computational step** before post-processing (rotation, broadening).

**Position in Pipeline**:
```
xnfpelsyn → synbeg → [line readers] → synthe → spectrv → rotate → broaden → spectrum
                                         ↓          ↑
                                    fort.9 (line opacities)
                                    fort.10 (continuum, Castelli)
```

### What It Does

For each wavelength point:
1. **Retrieve continuum opacity** (absorption + scattering) at all depth points
2. **Retrieve line opacity** from synthe.for output (fort.9)
3. **Combine opacities**: Total opacity = continuum + line
4. **Solve radiative transfer**: Call JOSH to compute emergent intensity/flux
5. **Write output**: Spectrum to fort.7

### What It Does NOT Do

- ❌ **Does NOT calculate line opacities** (that's synthe.for's job)
- ❌ **Does NOT calculate atmosphere structure** (that's ATLAS12's job)
- ❌ **Does NOT apply broadening** (that's rotate.for and broaden.for)

### Key Insight

SPECTRV is essentially a **post-processor** that takes pre-computed opacities and atmosphere structure, and solves the radiative transfer problem. The heavy lifting (opacity calculations) has already been done.

---

## 2. Castelli vs Kurucz Versions

### Version Differences Summary

| Feature | Castelli (1997) | Kurucz (1993) |
|---------|-----------------|---------------|
| **Program Name** | SPECTRV | SPECTR |
| **Lines of Code** | 438 | 555 |
| **Continuum Source** | Pre-computed (fort.10) | Computed on-the-fly (CONT3) |
| **Population Calc** | Commented out | Active (POPS calls) |
| **EDGE COMMON** | No (local arrays) | Yes (COMMON /EDGE/) |
| **BEGTIME/ENDTIME** | Commented out | Active |
| **Output Unit** | fort.16 (line list) | fort.17 (line list) |

### Architectural Divergence

The **most significant difference** is how continuum opacities are handled:

**Castelli Approach** (Modern, Efficient):
```fortran
! Read pre-computed continuum tables from xnfpelsyn
OPEN(UNIT=10,TYPE='OLD',FORM='UNFORMATTED',READONLY,SHARED)
READ(10) ! Header
READ(10)NEDGE,(FRQEDG(IEDGE),WLEDGE(IEDGE),CMEDGE(IEDGE),IEDGE=1,NEDGE)
READ(10)NCON,(CONFRQ(NU),NU=1,NCON)
! ... then for each depth point:
READ(10)QCONTABS  ! Pre-computed absorption
READ(10)QCONTSCAT ! Pre-computed scattering
```

Then during wavelength loop, **interpolate** using parabolic coefficients:
```fortran
C1=(WAVE-HALFEDGE(IEDGE))*(WAVE-WLEDGE(IEDGE+1))/DELEDGE(IEDGE)
C2=(WLEDGE(IEDGE)-WAVE)*(WAVE-WLEDGE(IEDGE+1))*2./DELEDGE(IEDGE)
C3=(WAVE-WLEDGE(IEDGE))*(WAVE-HALFEDGE(IEDGE))/DELEDGE(IEDGE)
ACONT(J)=10.**(C1*CONTABS(1,IEDGE,J)+C2*CONTABS(2,IEDGE,J)+C3*CONTABS(3,IEDGE,J))
```

**Kurucz Approach** (Original, Simpler):
```fortran
! Compute populations for each element at each wavelength
CALL POPS(1.00D0,12,XNFH)   ! H I
CALL POPS(2.01D0,12,XNFHE)  ! He I
CALL POPS(6.01D0,11,XNFPC)  ! C II
! ... etc for all elements

! Then in wavelength loop:
CALL CONT3(WAVE,SURF,RHOXJ)  ! Compute continuum at this wavelength
```

### Which Version to Migrate?

**Recommendation**: **Castelli version** for these reasons:

1. ✅ **More recent** (1997 vs 1993)
2. ✅ **More efficient** (reads pre-computed opacities once, then interpolates)
3. ✅ **Better separation of concerns** (xnfpelsyn computes opacities, spectrv just uses them)
4. ✅ **Matches existing pipeline** (xnfpelsyn already writes fort.10)

However, we should **document both** because:
- Kurucz version shows the **physics more clearly** (explicit POPS calls)
- Understanding CONT3 may help validate xnfpelsyn's opacity calculations
- Some users may prefer the Kurucz version's simplicity

---

## 3. Main Program Flow

### High-Level Structure

```fortran
PROGRAM SPECTRV
  ! ============================================
  ! PHASE 1: Initialization (lines 1-174)
  ! ============================================
  ! Read parameters from fort.25 (RHOXJ, plot params, PRD params)
  ! Read atmosphere model via READIN(20) from stdin
  ! Read continuum opacities from fort.10 (Castelli)
  ! Initialize BFUDGE and FSCAT arrays

  ! ============================================
  ! PHASE 2: Wavelength Loop (lines 215-289)
  ! ============================================
  ! For each wavelength in spectrum:
  !   - Interpolate continuum opacity
  !   - Read line opacity from fort.9
  !   - Solve radiative transfer (CALL JOSH)
  !   - Write spectrum point to fort.7

  ! ============================================
  ! PHASE 3: Line-by-Line Output (lines 296-369)
  ! ============================================
  ! For each spectral line in fort.9:
  !   - Compute line center intensity
  !   - Write line data to fort.7 and fort.16

  ! ============================================
  ! PHASE 4: Additional Lines (lines 371-424)
  ! ============================================
  ! Process additional lines from fort.20 (if any)

END PROGRAM
```

### Three-Pass Strategy

SPECTRV makes **three passes** through the wavelength range:

**Pass 1** (lines 215-289): **Continuous spectrum**
- Loop over wavelength grid
- Read pre-computed line opacity at each wavelength (from fort.9)
- Solve radiative transfer
- Write emergent flux/intensity to fort.7

**Pass 2** (lines 296-369): **Line-by-line analysis**
- Loop over individual spectral lines
- Compute line center intensity for each line
- Write line metadata + intensity to fort.7 and fort.16
- Used for line identification and analysis

**Pass 3** (lines 371-424): **Supplementary lines**
- Process additional lines from fort.20 (optional)
- Uses LINCEN subroutine (stub in Castelli version)

### Why Three Passes?

1. **Pass 1** gives you the **synthetic spectrum** for plotting/comparison
2. **Pass 2** gives you **line identification** data for abundance analysis
3. **Pass 3** handles special cases (e.g., user-added lines for analysis)

This is a common pattern in spectral synthesis codes: compute continuous spectrum first, then analyze individual lines.

---

## 4. Initialization Phase

### Fort.25 Parameters

```fortran
READ(25,1)RHOXJ,R1,R101,PH1,PC1,PSI1,PRDDOP,PRDPOW
  1 FORMAT(8F10.5)
```

**Parameter meanings**:
- `RHOXJ`: Depth above which line source function is J (for scattering)
  - If 0: Pure absorption (LTE source function = Planck function)
  - If >0: Scattering included above this depth
- `R1`, `R101`: Residual intensity plot range (bottom, top)
- `PH1`, `PC1`, `PSI1`: NLTE fudge factors for H, C, Si departure coefficients
- `PRDDOP`, `PRDPOW`: Partial redistribution parameters (for NLTE)

### BFUDGE Calculation

```fortran
DO 4 J=1,NRHOX
  BFUDGE(J)=BHYD(J,1)**PH1*(BC1(J,1)/BC2(J,1))**PC1*
           (BSI1(J,1)/BSI2(J,1))**PSI1
4 CONTINUE
```

**Purpose**: Adjust NLTE departure coefficients for selected elements.

- `BHYD(J,1)`: H I ground state departure coefficient
- `BC1(J,1)/BC2(J,1)`: C I/C II ratio (proxy for ionization)
- `BSI1(J,1)/BSI2(J,1)`: Si I/Si II ratio

**Usage**: Later used in source function calculation:
```fortran
SLINE(J)=BNU(J)*STIM(J)/(BFUDGE(J)-EHVKT(J))
```

This allows **empirical corrections** to the source function without full NLTE calculations.

🐉 **Dragon Alert**: The physical justification for this particular combination of departure coefficients is unclear from code alone. Likely based on Kurucz's experience with stellar spectra, but needs validation.

### FSCAT Calculation

```fortran
FSCAT(J)=0.
IF(RHOX(J)/RHOXJ.LT.100.)FSCAT(J)=EXP(-RHOX(J)/RHOXJ)
```

**Purpose**: Weighting function for scattering vs absorption.

- `FSCAT=1` near surface (RHOX=0): Full scattering
- `FSCAT→0` at depth (RHOX>>RHOXJ): Pure absorption

**Usage**:
```fortran
ALINE(J)=ASYNTH(J)*(1.-FSCAT(J))  ! Absorption component
SIGMAL(J)=ASYNTH(J)*FSCAT(J)      ! Scattering component
```

### Atmosphere Model Reading

```fortran
OPEN(UNIT=5,SHARED,READONLY,TYPE='OLD')
CALL READIN(20)
CLOSE(UNIT=5)
```

**READIN** is from ATLAS7V library. It reads the standard ATLAS atmosphere model format from stdin (redirected to unit 5).

**What it reads**:
- Depth grid (RHOX, NRHOX)
- Temperature (T, TKEV, HKT, etc.)
- Pressure (P, XNE, PTOTAL)
- Abundances (ABUND, XABUND)
- Turbulence (VTURB)
- And many other COMMON blocks (see Section 10)

---

## 5. Wavelength Loop Structure

### Grid Setup

```fortran
READ(9)WLBEG,RESOLU,WLEND,LENGTH,N,LINOUT,TURBV,IFVAC
```

Reads wavelength grid parameters from fort.9 (written by synthe.for):
- `WLBEG`, `WLEND`: Wavelength range (Angstroms)
- `RESOLU`: Resolving power R = λ/Δλ (e.g., 500000)
- `LENGTH`: Number of wavelength points
- `LINOUT`: Number of lines to print diagnostics for
- `TURBV`: Additional turbulence velocity (km/s)
- `IFVAC`: Vacuum (1) or air (0) wavelengths

### Logarithmic Wavelength Grid

```fortran
RATIO=1.+1./RESOLU
RATIOLG=DLOG(RATIO)
IXWL=DLOG(WLBEG)/RATIOLG
WBEGIN=DEXP(IXWL*RATIOLG)
IF(WBEGIN.LT.WLBEG)THEN
  IXWL=IXWL+1
  WBEGIN=DEXP(IXWL*RATIOLG)
ENDIF
```

**Purpose**: Snap WLBEG to nearest grid point for logarithmic spacing.

**Wavelength at point NU**:
```fortran
WAVE=WBEGIN*RATIO**(NU-1)
```

This ensures **constant resolving power** across the entire spectrum:
- Δλ/λ = 1/RESOLU = constant
- Logarithmic spacing: λ[i+1] = λ[i] × (1 + 1/R)

### Main Loop

```fortran
DO 25 NU=NULO,NUHI
  WAVE=WBEGIN*RATIO**(NU-1)

  ! Find wavelength bin for continuum opacity interpolation
  2004 IF(WAVE.LT.WLEDGE(IEDGE+1))GO TO 2005
       IEDGE=IEDGE+1
       GO TO 2004

  ! Interpolate continuum opacity (see Section 6)
  2005 [... parabolic interpolation ...]

  ! Compute Planck function and stimulated emission
  FREQ=2.99792458E17/WAVE
  DO 20 J=1,NRHOX
    EHVKT(J)=EXP(-FREQ*HKT(J))
    STIM(J)=1.-EHVKT(J)
    BNU(J)=1.47439E-02*FREQ15**3*EHVKT(J)/STIM(J)
  20 CONTINUE

  ! Solve continuum-only radiative transfer
  CALL JOSH(IFSCAT,IFSURF)
  DO 21 MU=1,NMU
    SURF(MU)=HNU(1)  ! or SURFI(MU) for intensity
  21 CONTINUE

  ! Read line opacity for this wavelength
  READ(9)ASYNTH

  ! Add line opacity and solve again
  DO 241 J=1,NRHOX
    ALINE(J)=ASYNTH(J)*(1.-FSCAT(J))
    SLINE(J)=BNU(J)*STIM(J)/(BFUDGE(J)-EHVKT(J))
    SIGMAL(J)=ASYNTH(J)*FSCAT(J)
  241 CONTINUE
  CALL JOSH(1,IFSURF)

  ! Compute residual intensity and write output
  RESID=HNU(1)/SURF(MU)  ! Line depth
  WRITE(7)(Q(I),I=1,NMU2)

25 CONTINUE
```

### Two JOSH Calls Per Wavelength

**Why two calls?**

1. **First JOSH call**: Continuum only (to get SURF = continuum flux)
2. **Second JOSH call**: Continuum + lines (to get HNU = total flux)
3. **Residual intensity**: RESID = (continuum+line) / continuum

This allows computing **line depth** relative to local continuum, which is what observers measure.

---

## 6. Continuum Opacity Handling

### Castelli Approach: Pre-computed Tables

#### Data Structure

Fort.10 contains:
```fortran
! Record 1: Header
READ(10)

! Record 2: Wavelength edges for opacity bins
READ(10)NEDGE,(FRQEDG(IEDGE),WLEDGE(IEDGE),CMEDGE(IEDGE),IEDGE=1,NEDGE)

! Record 3: Continuum frequency grid
READ(10)NCON,(CONFRQ(NU),NU=1,NCON)

! Records 4+: For each depth point J=1,NRHOX
DO 2003 J=1,NRHOX
  READ(10)  ! Separator
  READ(10)QCONTABS   ! Absorption opacity at NEDGE-1 edges × 3 points
  READ(10)QCONTSCAT  ! Scattering opacity at NEDGE-1 edges × 3 points
  READ(10)  ! Separator

  ! Unpack into 3D array
  NU=0
  DO 2002 IEDGE=1,NEDGE-1
    NU=NU+1
    CONTABS(1,IEDGE,J)=QCONTABS(NU)    ! Left edge
    NU=NU+1
    CONTABS(2,IEDGE,J)=QCONTABS(NU)    ! Midpoint
    NU=NU+1
    CONTABS(3,IEDGE,J)=QCONTABS(NU)    ! Right edge
  2002 CONTINUE
2003 CONTINUE
```

**Key insight**: Stores opacity at **3 points per bin** (left, middle, right) to enable parabolic interpolation.

**Array dimensions**:
```fortran
REAL*8 CONTABS(3,377,kw),CONTSCAT(3,377,kw)
```
- Dimension 1: 3 points per bin (for parabolic fit)
- Dimension 2: 377 wavelength edges (376 bins)
- Dimension 3: kw=99 depth points

**Memory**: ~3 × 377 × 99 × 8 bytes × 2 arrays = ~1.8 MB

#### Parabolic Interpolation

Given wavelength `WAVE`, find bin `IEDGE` such that:
```
WLEDGE(IEDGE) < WAVE < WLEDGE(IEDGE+1)
```

Then compute parabolic coefficients:
```fortran
HALFEDGE(IEDGE)=(WLEDGE(IEDGE)+WLEDGE(IEDGE+1))*.5
DELEDGE(IEDGE)=(WLEDGE(IEDGE+1)-WLEDGE(IEDGE))**2*.5

C1=(WAVE-HALFEDGE(IEDGE))*(WAVE-WLEDGE(IEDGE+1))/DELEDGE(IEDGE)
C2=(WLEDGE(IEDGE)-WAVE)*(WAVE-WLEDGE(IEDGE+1))*2./DELEDGE(IEDGE)
C3=(WAVE-WLEDGE(IEDGE))*(WAVE-HALFEDGE(IEDGE))/DELEDGE(IEDGE)
```

**Parabolic fit through 3 points**:
- Point 1: WLEDGE(IEDGE) → CONTABS(1,IEDGE,J)
- Point 2: HALFEDGE(IEDGE) → CONTABS(2,IEDGE,J)
- Point 3: WLEDGE(IEDGE+1) → CONTABS(3,IEDGE,J)

**Interpolated value**:
```fortran
ACONT(J)=10.**(C1*CONTABS(1,IEDGE,J)+C2*CONTABS(2,IEDGE,J)+C3*CONTABS(3,IEDGE,J))
SIGMAC(J)=10.**(C1*CONTSCAT(1,IEDGE,J)+C2*CONTSCAT(2,IEDGE,J)+C3*CONTSCAT(3,IEDGE,J))
```

**Note**: Opacities are stored as **log10(opacity)**, hence `10.**` to convert back.

🐉 **Dragon Alert**: The parabolic interpolation formula looks unusual. The coefficients C1, C2, C3 should sum to 1 for proper interpolation, but this needs verification. Also, why interpolate in log-space? Likely because opacities span many orders of magnitude.

### Kurucz Approach: On-the-Fly Calculation

```fortran
! Kurucz version (lines 98-110):
CALL POPS(1.00D0,12,XNFH)   ! H I populations
CALL POPS(2.01D0,12,XNFHE)  ! He I
! ... etc for all elements

! In wavelength loop:
CALL CONT3(WAVE,SURF,RHOXJ)
```

**CONT3** computes continuum opacity at wavelength `WAVE` using:
- Bound-free opacities (H-, H I, He I, metals)
- Free-free opacities (H, He)
- Rayleigh scattering (H I, He I, H2)
- Electron scattering

**Trade-off**:
- ✅ **Simpler code**: No need to manage opacity tables
- ✅ **More flexible**: Easy to change opacity sources
- ❌ **Slower**: Recomputes opacities at every wavelength
- ❌ **Duplicates work**: xnfpelsyn already computed these opacities

For Julia migration, the **Castelli approach** is preferred for performance.

---

## 7. Line Opacity Integration

### Reading Line Opacities

```fortran
! For each wavelength point:
READ(9)ASYNTH
```

**ASYNTH** is a `REAL*4` array of dimension `ASYNTH(kw)` containing line opacity at all depth points for this wavelength.

**Fort.9 Structure** (written by synthe.for):
```
Record 1: WLBEG,RESOLU,WLEND,LENGTH,N,LINOUT,TURBV,IFVAC
Record 2: NEDGE,(FRQEDG(IEDGE),WLEDGE(IEDGE),CMEDGE(IEDGE),IEDGE=1,NEDGE)
Record 3: ASYNTH(1:NRHOX) for wavelength 1
Record 4: ASYNTH(1:NRHOX) for wavelength 2
...
Record 2+LENGTH: ASYNTH(1:NRHOX) for wavelength LENGTH
Record 3+LENGTH: NLINES
Record 4+LENGTH: Line 1 data (LINDAT8, LINDAT, ALINEC)
...
```

### Combining Line and Continuum

```fortran
DO 241 J=1,NRHOX
  ! Split line opacity into absorption and scattering
  ALINE(J)=ASYNTH(J)*(1.-FSCAT(J))    ! Absorption
  SIGMAL(J)=ASYNTH(J)*FSCAT(J)        ! Scattering

  ! Line source function (NLTE fudge)
  SLINE(J)=BNU(J)*STIM(J)/(BFUDGE(J)-EHVKT(J))
241 CONTINUE
```

**FSCAT** weighting (see Section 4):
- Near surface (RHOX ≈ 0): FSCAT ≈ 1 → mostly scattering
- Deep (RHOX >> RHOXJ): FSCAT ≈ 0 → mostly absorption

### Total Opacity in JOSH

Inside JOSH (from ATLAS7V library), total opacity is:
```fortran
KAPPA_TOTAL = ACONT + ALINE + SIGMAC + SIGMAL
```

Where:
- `ACONT`: Continuum absorption
- `ALINE`: Line absorption
- `SIGMAC`: Continuum scattering (electron scattering, Rayleigh)
- `SIGMAL`: Line scattering

**Scattering vs Absorption**: Important distinction for radiative transfer!
- **Absorption**: Photons removed from beam
- **Scattering**: Photons redirected (coherent scattering assumed)

---

## 8. Radiative Transfer Solution

### JOSH Subroutine

```fortran
CALL JOSH(IFSCAT,IFSURF)
```

**JOSH** is defined in `atlas7v.for:7941` (Castelli version has 17K lines of ATLAS7V library code).

**Purpose**: Solve radiative transfer equation:
```
dI/dτ = I - S
```

Where:
- `I` = intensity
- `τ` = optical depth
- `S` = source function

**Method**: Feautrier method (second-order finite differences)

### Source Function

For LTE (thermal lines):
```fortran
SCONT(J)=BNU(J)  ! Continuum source = Planck function
SLINE(J)=BNU(J)  ! Line source = Planck function
```

With NLTE fudge:
```fortran
SLINE(J)=BNU(J)*STIM(J)/(BFUDGE(J)-EHVKT(J))
```

**Stimulated emission**:
```fortran
STIM(J)=1.-EHVKT(J)  where EHVKT=exp(-hν/kT)
```

This is the correction factor for stimulated emission: `(1 - e^(-hν/kT))`.

### Angle Integration

```fortran
COMMON /MUS/ANGLE(20),SURFI(20),NMU
```

**Two modes**:

**Mode 1**: `IFSURF=1` → Emergent **flux**
```fortran
IF(IFSURF.EQ.1)SURF(MU)=HNU(1)
```
- Integrates intensity over all angles
- Output: `HNU(1)` = emergent flux at surface (RHOX=0)

**Mode 2**: `IFSURF=2` → Emergent **intensity** at multiple angles
```fortran
IF(IFSURF.EQ.2)SURF(MU)=SURFI(MU)
```
- Computes intensity at each angle MU
- Output: `SURFI(MU)` for MU=1 to NMU (typically NMU=17)
- Used for limb darkening studies

**Angles** (typical):
```fortran
ANGLE = [cos(θ) for θ from 0° to 90°]
```
- ANGLE(1) = 1.0 = disk center (θ=0°)
- ANGLE(NMU) ≈ 0.05 = extreme limb (θ≈87°)

### Boundary Conditions

🐉 **Dragon**: Boundary conditions are set inside JOSH. Need to inspect JOSH source to document:
- Lower boundary: Diffusion approximation? Eddington approximation?
- Upper boundary: Zero incoming intensity?

This is critical for migration accuracy.

---

## 9. Output Format

### Fort.7: Spectrum File

**Binary UNFORMATTED output**

#### Header Record
```fortran
IF(NU.EQ.1)THEN
  REWIND 7
  WRITE(7)TEFF,GLOG,TITLE,WBEGIN,DELTAW,NUMNU,IFSURF,NMU,ANGLE,NEDGE,WLEDGE
ENDIF
```

Contains:
- `TEFF`, `GLOG`: Stellar parameters
- `TITLE`: 74-character model description
- `WBEGIN`, `DELTAW`, `NUMNU`: Wavelength grid
- `IFSURF`, `NMU`: Output mode and number of angles
- `ANGLE(1:NMU)`: Angle grid
- `NEDGE`, `WLEDGE`: Continuum wavelength edges

#### Wavelength Records
```fortran
WRITE(7)(Q(I),I=1,NMU2)
```

For each wavelength NU=1 to NUMNU:
- `Q(1:NMU)`: Emergent intensity or flux (with lines)
- `Q(NMU+1:NMU2)`: Continuum flux (no lines)

**Array packing**:
```fortran
Q(MU)=RESID*SURF(MU)      ! Total (continuum+lines)
Q(MU+NMU)=SURF(MU)        ! Continuum only
```

**RESID**: Residual intensity = (continuum+lines)/continuum
- RESID = 1.0 → no line absorption
- RESID < 1.0 → line absorption
- Typical core of strong line: RESID ~ 0.1-0.5

#### Line List Record
```fortran
WRITE(7)N910  ! Total number of lines
```

Where `N910 = NLINES + N10`:
- `NLINES`: Lines from fort.9 (synthe.for output)
- `N10`: Lines from fort.20 (supplementary)

#### Individual Line Records
```fortran
DO 90 ILINE=1,NLINES
  READ(9)LINDAT8,LINDAT,ALINEC
  WRITE(7)LINDAT8,LINDAT
90 CONTINUE
```

Each line record contains (from `/LINDAT/` COMMON):
- `LINDAT8`: 14 REAL*8 values (WL, E, EP, LABEL, etc.)
- `LINDAT`: 28 REAL*4 values (NELION, GFLOG, broadening, etc.)

### Fort.16: Line Identification File

**ASCII output** (unlike fort.7 which is binary)

```fortran
IF(WL.GT.0.)WRITE(16,98)WL,GFLOG,XJ,E,XJP,EP,CODE,LABEL,LABELP,
     1WL,NELION,GR,GS,GW,REF,NBLO,NBUP,ISO1,X1,ISO2,X2,OTHER1,OTHER2,
     2DWL,DGFLOG,DGAMMAR,DGAMMAS,DGAMMAW
```

**Format 98**:
```fortran
98 FORMAT(F10.4,F7.3,F5.1,F12.3,F5.1,F12.3,F9.2,A8,A2,A8,A2/
     1 0PF10.4,I4,F6.2,F6.2,F6.2,A4,I2,I2,I3,F7.3,I3,F7.3,
     2A8,A2,A8,A2,F7.4,F7.3,3F6.2,F10.4)
```

**Purpose**: Human-readable line list with:
- Wavelength (air or vacuum depending on IFVAC)
- log(gf) oscillator strength
- Lower/upper level energies and quantum numbers
- Broadening parameters
- Element/ion identification

**Used for**: Line identification in observed spectra, abundance analysis

---

## 10. COMMON Block Architecture

SPECTRV uses **~30 COMMON blocks** from ATLAS7V library. Key blocks:

### Atmosphere Structure
```fortran
COMMON /RHOX/RHOX(kw),NRHOX              ! Column density grid
COMMON /TEMP/T(kw),TKEV(kw),TK(kw),...  ! Temperature
COMMON /STATE/P(kw),XNE(kw),RHO(kw),... ! Pressure, density
```

### Abundances and Populations
```fortran
COMMON /ELEM/ABUND(99),ATMASS(99),...   ! Elemental abundances
COMMON /BHYD/BHYD(kw,8),AHYD(kw),...    ! H populations & opacities
COMMON /BHE/BHE1(kw,29),...             ! He populations
COMMON /BC/BC1(kw,14),...               ! C populations
! ... similar for Mg, Si, Fe, Ca, etc.
```

### Opacity
```fortran
COMMON /OPTOT/ACONT(kw),SCONT(kw),ALINE(kw),SLINE(kw),SIGMAC(kw),SIGMAL(kw)
```
- `ACONT`, `ALINE`: Absorption opacity (continuum, line)
- `SCONT`, `SLINE`: Source function (continuum, line)
- `SIGMAC`, `SIGMAL`: Scattering opacity (continuum, line)

### Radiative Transfer
```fortran
COMMON /TAUSHJ/TAUNU(kw),SNU(kw),HNU(kw),JNU(kw),JMINS(kw)
```
- `TAUNU`: Optical depth
- `SNU`: Source function
- `HNU`: Eddington flux (H = ∫ I μ dω)
- `JNU`: Mean intensity (J = ∫ I dω)

### Wavelength Grid
```fortran
COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw),WAVENO
COMMON /FRESET/FRESET(500),RCOSET(500),NULO,NUHI,NUMNU,IFWAVE,WBEGIN,DELTAW
```

### Line Data
```fortran
COMMON /LINDAT/WL,E,EP,LABEL(2),LABELP(2),...
```
Contains all line parameters (see Section 9 for details).

### Control Flags
```fortran
COMMON /IF/IFCORR,IFPRES,IFSURF,IFSCAT,IFMOL,NLTEON,IFOP(20)
```
- `IFSURF`: 1=flux, 2=intensity
- `IFSCAT`: Include scattering?
- `IFMOL`: Include molecules?
- `NLTEON`: NLTE mode?

---

## 11. Migration Strategy

### Phase 1: Understand Dependencies

**Before migrating SPECTRV**, must have:
1. ✅ **ATLAS7V library** (or at least JOSH subroutine)
2. ✅ **Fort.10 reader** (xnfpelsyn output format)
3. ✅ **Fort.9 reader** (synthe output format)
4. ✅ **ATLAS model reader** (READIN functionality)

**Dependency graph**:
```
SPECTRV
  ├─ JOSH (radiative transfer solver from ATLAS7V)
  ├─ READIN (atmosphere reader from ATLAS7V)
  ├─ W (output utility from ATLAS7V)
  └─ PFSAHA (partition functions from ATLAS7V - Kurucz version only)
```

### Phase 2: Julia Translation Approach

**Option A: Direct Translation (Recommended)**

```julia
struct SpectrumSynthesizer
    # Atmosphere
    atmosphere::AtmosphereModel  # From ATLAS12 or read from file

    # Opacities
    continuum_opacity::ContinuumOpacityTable  # From xnfpelsyn
    line_opacity::LineOpacityGrid             # From synthe

    # Wavelength grid
    wavelengths::Vector{Float64}
    resolving_power::Float64

    # Control parameters
    rhoxj::Float64
    bfudge_params::BFudgeParams
    output_mode::OutputMode  # Flux or Intensity
end

function synthesize_spectrum(synth::SpectrumSynthesizer)
    # Initialize
    fscat = compute_fscat(synth.atmosphere.rhox, synth.rhoxj)
    bfudge = compute_bfudge(synth.atmosphere, synth.bfudge_params)

    # Wavelength loop
    spectrum = zeros(length(synth.wavelengths), synth.nmu*2)
    for (i, wave) in enumerate(synth.wavelengths)
        # Interpolate continuum opacity
        acont, sigmac = interpolate_continuum(synth.continuum_opacity, wave)

        # Get line opacity
        aline_total = synth.line_opacity[i, :]

        # Split into absorption and scattering
        aline = aline_total .* (1 .- fscat)
        sigmal = aline_total .* fscat

        # Solve radiative transfer
        flux_cont = solve_radiative_transfer(acont, sigmac, ...)
        flux_total = solve_radiative_transfer(acont.+aline, sigmac.+sigmal, ...)

        # Store result
        spectrum[i, 1:nmu] = flux_total
        spectrum[i, nmu+1:end] = flux_cont
    end

    return spectrum
end
```

**Advantages**:
- ✅ Clean separation from Fortran
- ✅ Can use modern Julia radiative transfer libraries
- ✅ Easy to test and validate

**Challenges**:
- ❌ Need to migrate JOSH radiative transfer solver
- ❌ Need to understand JOSH boundary conditions and numerical method

### Phase 3: Validate Radiative Transfer

**Critical**: JOSH uses Feautrier method. Julia has `Korg.jl` which implements modern radiative transfer.

**Validation strategy**:
1. Extract test case from Kurucz/Castelli (atmosphere + opacities)
2. Run Fortran SPECTRV → get reference spectrum
3. Run Julia SPECTRV with same inputs → compare
4. Tolerance: Flux differences < 0.1% (numerical precision)

**If JOSH migration is too complex**, consider:
- Use `Korg.jl` radiative transfer instead
- Validate that `Korg.jl` gives same results as JOSH for simple cases
- Document any differences

### Phase 4: Continuum Opacity Interpolation

**Parabolic interpolation** needs careful testing:

```julia
function interpolate_continuum_opacity(
    continuum::ContinuumOpacityTable,
    wave::Float64,
    j::Int  # Depth index
)
    # Find wavelength bin
    iedge = searchsortedfirst(continuum.wledge, wave) - 1

    # Parabolic coefficients
    halfedge = (continuum.wledge[iedge] + continuum.wledge[iedge+1]) / 2
    deledge = (continuum.wledge[iedge+1] - continuum.wledge[iedge])^2 / 2

    c1 = (wave - halfedge) * (wave - continuum.wledge[iedge+1]) / deledge
    c2 = (continuum.wledge[iedge] - wave) * (wave - continuum.wledge[iedge+1]) * 2 / deledge
    c3 = (wave - continuum.wledge[iedge]) * (wave - halfedge) / deledge

    # Interpolate (opacities stored as log10)
    log_acont = c1*continuum.contabs[1,iedge,j] +
                c2*continuum.contabs[2,iedge,j] +
                c3*continuum.contabs[3,iedge,j]

    return 10.0^log_acont
end
```

**Test**:
- Verify c1+c2+c3 = 1 (or close) for proper interpolation
- Check that interpolated values match synthe.for calculations
- Edge cases: wavelength exactly at bin edge

### Phase 5: Line-by-Line Output

**Fort.16 output** is human-readable line list:

```julia
function write_line_list(io::IO, lines::Vector{SpectralLine}, residuals::Vector{Float64})
    for (line, resid) in zip(lines, residuals)
        @printf(io, "%10.4f %7.3f %5.1f ...\n",
                line.wavelength, line.loggf, line.j_lower, ...)
    end
end
```

**Fort.7 output** is binary:

```julia
function write_spectrum_binary(io::IO, spectrum::SpectrumGrid)
    # Write header
    write(io, Float64, spectrum.teff)
    write(io, Float64, spectrum.glog)
    write(io, spectrum.title)  # 74 chars
    # ... etc

    # Write wavelength records
    for i in 1:spectrum.nwave
        write(io, spectrum.flux[i, :])  # NMU*2 values
    end

    # Write line list
    write(io, Int32, spectrum.nlines)
    for line in spectrum.lines
        write(io, line)  # Binary line record
    end
end
```

**Format compatibility**: Must match Fortran UNFORMATTED exactly for downstream tools (rotate, broaden, plotsyn).

---

## 12. Testing Strategy

### Unit Tests

**Test 1: Wavelength Grid**
```julia
@testset "Wavelength Grid" begin
    wlbeg = 5000.0
    resolu = 500000.0
    nwave = 1000

    grid = create_wavelength_grid(wlbeg, resolu, nwave)

    # Check logarithmic spacing
    ratio = grid.wavelengths[2] / grid.wavelengths[1]
    for i in 2:length(grid.wavelengths)-1
        @test grid.wavelengths[i+1] / grid.wavelengths[i] ≈ ratio rtol=1e-10
    end

    # Check resolving power
    @test ratio ≈ 1.0 + 1.0/resolu rtol=1e-10
end
```

**Test 2: Parabolic Interpolation**
```julia
@testset "Continuum Interpolation" begin
    # Create test opacity table with known function
    wledge = [5000, 5100, 5200, 5300]  # Angstroms
    # ... setup continuum table

    # Test interpolation at midpoint
    wave = 5150.0
    opacity = interpolate_continuum_opacity(table, wave, 1)

    # Compare to analytic value
    @test opacity ≈ expected_value rtol=1e-6
end
```

**Test 3: FSCAT and BFUDGE**
```julia
@testset "NLTE Corrections" begin
    rhox = [1e-6, 1e-4, 1e-2, 1, 100]
    rhoxj = 0.1

    fscat = compute_fscat(rhox, rhoxj)

    @test fscat[1] ≈ exp(-rhox[1]/rhoxj)  # Near surface
    @test fscat[end] ≈ 0.0 atol=1e-6      # Deep atmosphere
end
```

### Integration Tests

**Test 4: Full Spectrum Synthesis**
```julia
@testset "End-to-End Synthesis" begin
    # Load test atmosphere (e.g., solar model)
    atmos = load_atmosphere("test_data/solar_atlas12.mod")

    # Load opacity tables
    cont_opacity = load_continuum_opacity("test_data/fort10_solar")
    line_opacity = load_line_opacity("test_data/fort9_solar")

    # Synthesize spectrum
    synth = SpectrumSynthesizer(atmos, cont_opacity, line_opacity, ...)
    spectrum = synthesize_spectrum(synth)

    # Load reference spectrum from Fortran
    ref_spectrum = load_reference("test_data/fort7_solar_ref")

    # Compare
    for i in 1:length(spectrum)
        @test spectrum[i] ≈ ref_spectrum[i] rtol=0.001  # 0.1% tolerance
    end
end
```

**Test 5: Radiative Transfer Validation**
```julia
@testset "JOSH vs Korg" begin
    # Simple test: pure continuum, LTE, plane-parallel
    atmos = load_simple_atmosphere()
    opacity = ConstantOpacity(1.0)

    flux_josh = solve_radiative_transfer_josh(atmos, opacity)
    flux_korg = solve_radiative_transfer_korg(atmos, opacity)

    @test flux_josh ≈ flux_korg rtol=0.01  # 1% tolerance
end
```

### Physics Validation Tests

**Test 6: Limb Darkening**
```julia
@testset "Limb Darkening" begin
    # Compute intensity at multiple angles
    synth = SpectrumSynthesizer(..., output_mode=Intensity, nmu=17)
    intensity = synthesize_spectrum(synth)

    # Check limb darkening law
    # I(μ) / I(1) should decrease with decreasing μ=cos(θ)
    for wave_idx in 1:100:length(wavelengths)
        for mu_idx in 2:nmu
            @test intensity[wave_idx, mu_idx] < intensity[wave_idx, mu_idx-1]
        end
    end
end
```

**Test 7: Energy Conservation**
```julia
@testset "Energy Conservation" begin
    # Emergent flux should match effective temperature
    synth = SpectrumSynthesizer(...)
    spectrum = synthesize_spectrum(synth)

    # Integrate flux over wavelength
    total_flux = integrate_spectrum(spectrum, synth.wavelengths)
    expected_flux = σ * synth.atmosphere.teff^4  # Stefan-Boltzmann

    @test total_flux ≈ expected_flux rtol=0.05  # 5% tolerance (due to sampling)
end
```

---

## 13. Open Questions

### For Domain Expert (Astrophysicist)

1. **BFUDGE Formula**: What is the physical justification for the specific combination `BHYD^PH1 * (BC1/BC2)^PC1 * (BSI1/BSI2)^PSI1`?
   - Why these particular elements (H, C, Si)?
   - How were the exponents (PH1, PC1, PSI1) determined?
   - Is this empirically calibrated, or theory-based?

2. **FSCAT Weighting**: For scattering vs absorption split:
   - What is typical value of RHOXJ for different types of stars?
   - When is scattering important (early-type stars with significant electron scattering)?
   - Can we use coherent scattering approximation, or need angle-dependent redistribution?

3. **Partial Redistribution**: Parameters PRDDOP and PRDPOW appear in code but PRDJNU is stubbed out in Castelli version:
   - Is partial redistribution needed for any realistic cases?
   - If so, what is the algorithm (need to inspect Kurucz PRDJNU)?

### For Code Archaeology

4. **Parabolic Interpolation**: The formula for C1, C2, C3 needs verification:
   - Do the coefficients sum to 1?
   - Is this standard Lagrange interpolation or something custom?
   - Why use HALFEDGE instead of midpoint between log(WLEDGE) values?

5. **JOSH Boundary Conditions**: Need to inspect JOSH source:
   - Lower boundary: Diffusion? Eddington? Specified intensity?
   - Upper boundary: Zero incoming intensity?
   - How does it handle scattering (iterative solution)?

6. **Fort.10 Format**: The continuum opacity file format needs full documentation:
   - Why 377 edges (376 bins)?
   - How are the 3 points per bin chosen (equal spacing? Optimized positions)?
   - What is the wavelength range covered?

### For Migration Decisions

7. **ATLAS7V Dependency**: How much of ATLAS7V library is actually needed?
   - JOSH: ~200 lines? (need to check)
   - READIN: ~100 lines?
   - W: ~10 lines (simple output utility)
   - Can we extract just these, or need full library?

8. **Radiative Transfer Method**: Should we migrate JOSH or use modern library?
   - Pros of migrating JOSH: Exact compatibility with Fortran
   - Pros of modern library: Better tested, more flexible, potentially more accurate
   - Which approach?

9. **Binary Output Format**: Fort.7 and fort.9 are UNFORMATTED binary:
   - Do downstream tools (rotate, broaden, plotsyn) need exact binary format?
   - Or can we switch to HDF5/netCDF/Arrow for Julia version?
   - Need to check all downstream dependencies

10. **Corona Extension**: IFCORO flag and CORINT subroutine (stubbed in Castelli):
    - What is this for? (Chromospheric extension?)
    - Is it used in practice?
    - Can we ignore for initial migration?

---

## 14. Key Takeaways

### Architecture

1. **SPECTRV is a post-processor**: It does NOT calculate opacities, only uses pre-computed values from synthe.for and xnfpelsyn
2. **Two divergent versions exist**: Castelli (1997) reads pre-computed continuum tables, Kurucz (1993) computes on-the-fly
3. **Recommend Castelli version** for migration (more efficient, matches existing pipeline)

### Algorithm

4. **Three-pass strategy**: (1) Continuous spectrum, (2) Line-by-line analysis, (3) Supplementary lines
5. **Two JOSH calls per wavelength**: First for continuum-only (reference), second for continuum+lines (total)
6. **Logarithmic wavelength grid**: Ensures constant resolving power across spectrum
7. **Parabolic interpolation**: Used for continuum opacity between wavelength bins

### Physics

8. **BFUDGE empirical correction**: Adjusts LTE source function using departure coefficients for H, C, Si
9. **FSCAT scattering weighting**: Splits line opacity into absorption (deep) and scattering (surface) components
10. **Partial redistribution**: Parameters present but not used in Castelli version (stubbed PRDJNU)

### Migration Priorities

11. **Critical dependency**: JOSH radiative transfer solver must be migrated or replaced
12. **Format compatibility**: Binary I/O formats (fort.7, fort.9, fort.10) must match Fortran exactly for validation
13. **Testing strategy**: End-to-end comparison with Fortran output essential (tolerance ~0.1% for flux)

### Open Questions

14. **JOSH implementation details**: Boundary conditions, scattering treatment, numerical stability
15. **Parabolic interpolation verification**: Mathematical correctness of C1,C2,C3 coefficients
16. **ATLAS7V extraction**: Can we extract just JOSH, READIN, W or need full 17K-line library?

---

*End of Deep Dive 08*

**Next**: Deep Dive 09 will analyze the Binary program (line merging and sorting) and the fort.12 format.
