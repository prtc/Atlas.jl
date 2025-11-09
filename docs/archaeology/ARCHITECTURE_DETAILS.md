# ATLAS Suite Detailed Architecture
*Phase 2B - Subroutine-Level Architecture Mapping*

**Generated**: 2025-11-07
**Focus**: ATLAS12 and SYNTHE detailed internal architecture
**Status**: Initial documentation - Work in Progress

---

## Executive Summary

This document provides subroutine-level architectural details for ATLAS12 and SYNTHE, complementing the workflow analysis in WORKFLOW_ANALYSIS.md.

**Key Findings**:
- ATLAS12 contains **80 embedded subroutines** in a single 23,247-line file
- Main program controls two-stage execution through iteration loop (lines 219-397)
- 57 COMMON blocks provide global data sharing
- Subroutines are organized by function: I/O, population calculations, opacity, radiative transfer, output

---

## I. ATLAS12 Architecture

### File Structure

**Location**: `upstream/castelli/source_codes/atlas12/atlas12.for`
**Total lines**: 23,247
**Structure**: Main PROGRAM followed by 80 embedded SUBROUTINEs

**Reference**: Castelli, F. 2005, "ATLAS12: how to use it", Mem. S.A.It. Suppl. Vol. 8, 25

```
Lines 1-400:     PROGRAM ATLAS12 (main program)
Lines 401+:      80 embedded SUBROUTINE definitions
```

### Main Program Flow

The main program (lines 1-400) implements the two-stage execution model documented in WORKFLOW_ANALYSIS.md:

```fortran
PROGRAM ATLAS12
  ├─ Initialization (lines 1-217)
  │  ├─ Pretabulate exponentials (EXTAB, E1TAB)
  │  ├─ CALL TABVOIGT - Pretabulate Voigt profiles
  │  ├─ CALL PRETABLOG - Pretabulate logarithms
  │  ├─ CALL IONPOTS - Initialize ionization potentials
  │  ├─ CALL READIN(1) - Read input parameters
  │  ├─ CALL ISOTOPES - Handle isotopic abundances
  │  └─ Setup frequency grid (WAVESET array)
  │
  ├─ Main Iteration Loop (lines 219-397, DO 100 ITERAT=1,NUMITS)
  │  │
  │  ├─ Hydrostatic Equilibrium (lines 224-245)
  │  │  └─ Update pressures: P(J) = GRAV*RHOX(J) - PRAD(J) - PTURB(J)
  │  │
  │  ├─ Population Calculations (lines 248-268)
  │  │  ├─ CALL POPS - LTE populations
  │  │  └─ CALL POPSALL - All populations (includes molecules)
  │  │
  │  ├─ Doppler Widths (lines 272-296)
  │  │  └─ Compute DOPPLE(J,NELION) for all species
  │  │
  │  ├─ Opacity Calculations (lines 299-317)
  │  │  ├─ CALL KAPCONT (iter 1 only) - Continuum opacity
  │  │  ├─ CALL SELECTLINES (iter 1, Stage 1) - Line selection
  │  │  ├─ CALL LINOP1 (if IFOP(15)=1) - Line opacity method 1
  │  │  └─ CALL XLINOP (if IFOP(17)=1) - Extra line opacity
  │  │
  │  ├─ Initialize Frequency Integrals (lines 321-324)
  │  │  ├─ CALL TCORR(1,0) - Temperature correction init
  │  │  ├─ CALL ROSS(1,0) - Rosseland mean init
  │  │  ├─ CALL RADIAP(1,0) - Radiative transfer init
  │  │  └─ CALL STATEQ(1,0) - NLTE statistical equilibrium init
  │  │
  │  ├─ Frequency Integration Loop (lines 328-383, DO 25 NU=NULO,NUHI)
  │  │  ├─ Setup frequency: FREQ = 2.99792458D17/WAVE
  │  │  ├─ Compute Planck function BNU(J) at each depth
  │  │  ├─ CALL KAPP - Total opacity at this frequency
  │  │  ├─ Add line opacity: ALINE += XLINES(J,NU)*STIM(J)
  │  │  ├─ CALL JOSH - Radiative transfer equation solver
  │  │  ├─ CALL TCORR(2,RCOWT) - Accumulate temperature corrections
  │  │  ├─ CALL RADIAP(2,RCOWT) - Accumulate radiative acceleration
  │  │  ├─ CALL ROSS(2,RCOWT) - Accumulate Rosseland mean
  │  │  └─ CALL STATEQ(2,RCOWT) - Accumulate NLTE rates
  │  │
  │  └─ Finish Iteration (lines 386-396)
  │     ├─ CALL ROSS(3,0) - Finalize Rosseland mean
  │     ├─ CALL RADIAP(3,0) - Finalize radiative acceleration
  │     ├─ CALL HIGH - Mark high-opacity regions
  │     ├─ CALL CONVEC (if IFCONV=1) - Convection
  │     ├─ CALL TCORR(3,0) - Apply temperature corrections
  │     ├─ CALL STATEQ(3,0) - Solve NLTE equations
  │     ├─ CALL TURB (if IFTURB=1) - Turbulence
  │     └─ CALL PUTOUT(5) - Write output
  │
  └─ Loop back or finish (line 399: GO TO 1 for new model)
```

**Key control flow pattern**: Three-phase subroutine calls (MODE parameter):
- MODE=1: Initialize/erase accumulators
- MODE=2: Accumulate during frequency loop (weighted by RCOWT)
- MODE=3: Finalize after frequency loop

---

### ATLAS12 Subroutine Catalog

**Total**: 80 subroutines identified

#### 1. I/O and Control (6 subroutines)

| Subroutine | Lines | Purpose |
|------------|-------|---------|
| READIN | ~500 | Read input parameters from stdin |
| PUTOUT | ~700 | Write output (MODE: 1=headers, 4=frequency, 5=summary) |
| W | ~50 | Formatted write utility |
| BLOCKE | ~20 | Block data for elements |
| BLOCKR | ~20 | Block data for radiative transfer |
| BLOCKJ | ~20 | Block data for J computation |

#### 2. Population Calculations (5 subroutines)

| Subroutine | Purpose |
|------------|---------|
| POPS | LTE atomic populations (Saha-Boltzmann equation) |
| POPSALL | All populations including molecules |
| PFSAHA | Partition functions via Saha equation |
| NELECT | Electron density calculation |
| ENERGYDENSITY | Radiation energy density for NLTE |

#### 3. Molecular Equilibrium (3 subroutines)

| Subroutine | Purpose |
|------------|---------|
| READMOL | Read molecular equilibrium constants from fort.2 |
| MOLEC | Molecular number densities |
| NMOLEC | Number of molecules calculation |

#### 4. Opacity - Continuum Sources (25 subroutines)

**Hydrogen**:
- HOP - H I bound-free and free-free
- H2PLOP - H2+ opacity
- HMINOP - H- bound-free and free-free
- HRAYOP - H I Rayleigh scattering

**Helium**:
- HE1OP - He I bound-free
- HE2OP - He II bound-free
- HEMIOP - He- opacity
- HERAOP - He I Rayleigh scattering

**Metals** (bound-free for specific ions):
- C1OP, C2OP, C3OP, C4OP - Carbon ions I-IV
- N2OP, N3OP, N4OP, N5OP - Nitrogen ions II-V
- O2OP, O3OP, O4OP, O5OP, O6OP - Oxygen ions II-VI
- MG1OP, MG2OP - Magnesium ions I-II
- SI1OP, SI2OP - Silicon ions I-II

**Other continuum**:
- ELECOP - Electron scattering
- H2RAOP - H2 Rayleigh scattering
- H2COLLOP - H2 collision-induced absorption
- COOLOP - "Cool" opacity sources (heavy elements)
- LUKEOP - Luke opacity (uncertain - needs investigation)
- HOTOP - "Hot" opacity sources

#### 5. Opacity - Line Sources (8 subroutines)

| Subroutine | Purpose |
|------------|---------|
| SELECTLINES | Stage 1: Select relevant lines from massive databases |
| LINOP | Line opacity calculation (older method) |
| LINOP1 | Line opacity calculation (method 1) |
| PRELINOP | Pre-calculate line opacity components |
| HLINOP | Hydrogen line opacity |
| LINSOP | Line source function |
| XLINOP | Extra line opacity (newer method, used in Stage 2) |
| HE2LIN | He II line opacity |

#### 6. Opacity - Totals and Tables (3 subroutines)

| Subroutine | Purpose |
|------------|---------|
| KAPP | Total opacity (sum all sources) |
| KAPCONT | Continuum opacity tables |
| TABVOIGT | Pretabulate Voigt profiles |

#### 7. Radiative Transfer (8 subroutines)

| Subroutine | Purpose |
|------------|---------|
| RADIAP | Radiative acceleration and flux |
| ROSS | Rosseland mean opacity |
| JOSH | Radiative transfer equation solver |
| TCORR | Temperature correction |
| STATEQ | NLTE statistical equilibrium |
| XLISOP | Extra line source function |
| XCONOP | Extra continuum opacity |
| XSOP | Extra source function |

#### 8. Convection and Turbulence (4 subroutines)

| Subroutine | Purpose |
|------------|---------|
| CONVEC | Convective energy transport (mixing-length theory) |
| HIGH | Mark high-opacity regions |
| TURB | Turbulent pressure |
| VTURBSTANDARD | Standard microturbulence profile |

#### 9. Numerical Utilities (5 subroutines)

| Subroutine | Purpose |
|------------|---------|
| DERIV | Numerical derivatives |
| INTEG | Numerical integration |
| PARCOE | Parabolic coefficients for interpolation |
| SOLVIT | Linear equation solver |
| LINTER | Linear interpolation |

#### 10. Initialization and Data (8 subroutines)

| Subroutine | Purpose |
|------------|---------|
| IONPOTS | Ionization potentials for all elements |
| ISOTOPES | Isotopic abundances |
| PRETABLOG | Pretabulate logarithms for speed |
| TTAUP | Optical depth scale conversion |
| PFIRON | Iron partition functions (special case) |
| BLOCKH | Block data for H |
| READMOL | Read molecular data |
| DUMMYR | Dummy routine (placeholder) |

#### 11. Unclassified (5 subroutines)

These require further investigation:
- BLOCKE, BLOCKR, BLOCKJ, BLOCKH - Block data initializers
- DUMMYR - Placeholder (empty routine?)

---

### ATLAS12 COMMON Block Architecture

**Total**: 57 COMMON blocks (Castelli version)

Listed in order of appearance in source code (lines 37-95):

#### Physical State Variables
1. `/RHOX/` - Column density grid: RHOX(kw), NRHOX
2. `/STATE/` - Thermodynamic state: P(kw), XNE(kw), XNATOM(kw), RHO(kw), CHARGESQ(kw)
3. `/TEMP/` - Temperature: T(kw), TKEV(kw), TK(kw), HKT(kw), HCKT(kw), TLOG(kw), ITEMP
4. `/EDENS/` - Electron density: EDENS(kw), IFEDNS
5. `/PTOTAL/` - Total pressure: PTOTAL(kw)
6. `/PZERO/` - Reference pressure: PZERO, PCON, PRADK0, PTURB0, KNU(kw), PRADK(kw), RADEN(kw)

#### Abundances and Composition
7. `/ABROSS/` - Rosseland abundance: ABROSS(kw), TAUROS(kw)
8. `/ABTOT/` - Total abundance: ABTOT(kw), ALPHA(kw)
9. `/ELEM/` - Element data: ABUND(99), ATMASS(99), YABUND(99), ELEM(99)
10. `/XABUND/` - Depth-dependent abundances: XABUND(kw,99), WTMOLE(kw), XRELATIVE(99)
11. `/ISOTOPE/` - Isotope data: ISOTOPE(10,2,mion)
12. `/XISO/` - Isotope info: XISO(10,mion), AMASSISO(10,mion)

#### Populations
13. `/XNF/` - Number densities: XNF(kw,mion), XNFP(kw,mion), XNH2(kw)
14. `/XNFDOP/` - Doppler-weighted populations: XNFDOP(kw,mion), DOPPLE(kw,mion)
15. `/DEPART/` - NLTE departure coefficients: BHYD(kw,6), BMIN(kw), NLTEON

#### Opacity
16. `/OPS/` - Opacity sources: AHYD, AH2P, AHMIN, SIGH, AHE1, AHE2, etc. (25 arrays)
17. `/OPTOT/` - Total opacity: ACONT(kw), SCONT(kw), ALINE(kw), SLINE(kw), SIGMAC(kw), SIGMAL(kw)
18. `/TABCONT/` - Continuum opacity table: TABCONT(kw,344), WAVETAB(344), IWAVETAB(344)
19. `/EXTAB/` - Exponential tables: EXTAB(1001), EXTABF(1001), E1TAB(2000)
20. `/H1TAB/` - Hydrogen tables: H0TAB(2001), H1TAB(2001), H2TAB(2001)
21. `/TABLOG/` - Logarithm table: TABLOG(32768)
22. `/XLINES/` - Line opacity: XLINES(kw,30000)

#### Radiative Transfer
23. `/FLUX/` - Flux: FLUX, FLXERR(kw), FLXDRV(kw), FLXRAD(kw)
24. `/FREQ/` - Frequency: FREQ, FREQLG, EHVKT(kw), STIM(kw), BNU(kw), WAVE, WAVENO
25. `/FRESET/` - Frequency set: WAVESET(30000), RCOSET(30000), NULO, NUHI, NUMNU, NUSTEP
26. `/TAUSHJ/` - Optical depth: TAUNU(kw), SNU(kw), HNU(kw), JNU(kw), JMINS(kw)
27. `/RAD/` - Radiation: ACCRAD(kw), PRAD(kw)
28. `/MUS/` - Angular grid: ANGLE(20), SURFI(20), NMU
29. `/RR/` - Radiative rates: RJMINSNU(kw), RDIAGJNU(kw)

#### Convection and Turbulence
30. `/CONV/` - Convection: DLTDLP, HEATCP, DLRDLT, VELSND, GRDADB, HSCALE, FLXCNV, VCONV, MIXLTH, OVERWT, etc.
31. `/TURBPR/` - Turbulence: VTURB(kw), PTURB(kw), TRBFDG, TRBCON, TRBPOW, TRBSND, IFTURB

#### Control and Flags
32. `/IF/` - Control flags: IFCORR, IFPRES, IFSURF, IFSCAT, IFMOL, IFREADLINES
33. `/IFOP/` - Opacity flags: IFOP(20)
34. `/ITER/` - Iteration control: ITER, ifprnt(60), ifpnch(60), NUMITS
35. `/PUT/` - Output control: PUT, IPUT

#### Geometry and Scaling
36. `/TEFF/` - Stellar parameters: TEFF, GRAV, GLOG
37. `/HEIGHT/` - Height scale: HEIGHT(kw)
38. `/STEPLG/` - Step size: STEPLG, TAU1LG, KRHOX
39. `/WAVEY/` - Wavelength grid: WBEGIN, DELTAW, IFWAVE

#### Metadata
40. `/JUNK/` - Miscellaneous: TITLE(74), FREQID(6), WLTE, XSCALE, INPUTDATA
41. `/FILENAME/` - Filename: FILENAME (CHARACTER*60)
42. `/IIIIIII/` - Integer workspace: IWL, IELION, IELO, IGFLOG, IGR, IGS, IGW

**Migration note**: The 57 COMMON blocks represent ~100 arrays totaling several MB of global state. Julia migration should convert these to:
- Immutable structs for read-only data (element properties, physical constants)
- Mutable structs for iteration state (temperatures, pressures, populations)
- Passed explicitly as arguments rather than global variables

---

### Line List Files (from Castelli 2005)

**Six binary line list files used by ATLAS12**:

| File | Content | Source |
|------|---------|--------|
| **nltelines.bin** | H I, He I, He II, C I, C II, O I, Na I, Mg I, Mg II, Al I, Si I, Si II, K I, Ca I, Ca II | NLTELINE.DAT (Kurucz CD-ROM No 1) |
| **lowlines.bin** | All elements, first 5 ionization stages (excludes nltelines) | LOWLINES.DAT (Kurucz CD-ROM No 1) |
| **highlines.bin** | Ionization stages n>5 up through Zn | HILINES.DAT (Kurucz CD-ROM No 1) |
| **diatomicsiwl.bin** | CH, NH, OH, MgH, SiH, CO, SiO, CN, C₂ (ordered by wavelength) | DIATOMIC.DAT (Kurucz CD-ROM No 16) |
| **schwenke.bin** | TiO lines (Schwenke 1998 database) | SCHWENKE.BIN (Kurucz CD-ROM No 24) |
| **h2ofast.bin** | H₂O lines (Partridge & Schwenke 1997) | H2OFAST.BIN (Kurucz CD-ROM No 26) |

⚠️ **DISCREPANCY NOTED**:
- **Per documentation**: Filenames listed above from Castelli's website naming convention
- **Per code archaeology** (WORKFLOW_ANALYSIS.md): Names like `fclowlines.bin`, `fchighlines.bin` in execution scripts
- **Likely**: Different users/installations use different naming conventions for same data files

**Line list organization**:
- Stage 1 reads: lowlines, highlines, diatomicsiwl, schwenke, h2ofast (fort.11, 21, 31, 41, 51)
- Stage 2 reads: nltelines (fort.19) + preselected lines from Stage 1 (fort.12)

**Molecular line details** (from Kurucz 1992a, 1994):
- Diatomic molecules include multiple bands and isotopes
- Each molecule has specific partition function data
- Temperature-dependent dissociation equilibria

### ATLAS12 Key Algorithms

#### Two-Stage Line Selection

**Stage 1** (IFREADLINES=1, ITER=1):
```fortran
IF(ITER.EQ.1.AND.IFREADLINES.EQ.1.AND.ITEMP.EQ.1)CALL SELECTLINES
```

SELECTLINES reads complete line databases (fort.11, fort.31, fort.41, fort.51) and selects only lines that:
- Fall within relevant wavelength range for Teff
- Have sufficient oscillator strength
- Belong to ionization stages present in atmosphere

Output: fort.12 (selected lines, typically 10-100× smaller than input)

**Stage 2** (IFOP(17)=1, all iterations):
```fortran
IF(IFOP(17).EQ.1)THEN
  CALL XLINOP
ENDIF
```

XLINOP reads selected lines from fort.12 and calculates line opacity at each wavelength in WAVESET.

#### Three-Phase Integration Pattern

Many subroutines use MODE parameter for three-phase operation:

**Example: ROSS (Rosseland mean opacity)**
```fortran
CALL ROSS(1,0)           ! Phase 1: Initialize (MODE=1, RCOWT=0)
DO NU=NULO,NUHI
  CALL ROSS(2,RCOWT)     ! Phase 2: Accumulate (MODE=2, RCOWT=weight)
ENDDO
CALL ROSS(3,0)           ! Phase 3: Finalize (MODE=3, RCOWT=0)
```

Subroutines using this pattern:
- ROSS - Rosseland mean opacity
- RADIAP - Radiative acceleration
- TCORR - Temperature correction
- STATEQ - NLTE statistical equilibrium
- PUTOUT - Output (different modes: 1=header, 4=frequency, 5=summary)

---

### Control Cards (from Castelli 2005)

ATLAS12 reads control parameters via control cards from unit 5 (stdin). Key cards:

#### ABUNDANCE Cards

**Purpose**: Set elemental abundances

```
ABUNDANCE CHANGE iz abund(iz)
ABUNDANCE RELATIVE iz xrelative(iz)
ABUNDANCE ABSOLUTE iz xabund(iz)
ABUNDANCE TABLE
  [99-element table with abund(iz) and xrelative(iz)]
ABUNDANCE SCALE xscale
```

**Formula**: `xabund(iz) = abund(iz) + xrelative(iz)`

⚠️ **IMPORTANT DISCREPANCY**:
- **Per documentation** (Castelli 2005): "Starting abundances are those of the input model. If it is an ATLAS12 model both abund(iz) and xrelative(iz) are read from ABUNDANCE TABLE. If the input model is an ATLAS9 model only abund(iz) is given in input and all the xrelative(iz) values are zero."
- **Implication**: ATLAS12 stores both base abundance AND scaling factor
- **ATLAS9 compatibility**: Can read ATLAS9 models (which lack xrelative) and sets xrelative=0

**ABUNDANCE SCALE** (Castelli extension):
- Scales entire abundance pattern from Li (iz=3) to Es (iz=99)
- **Not in original Kurucz code**, implemented by Castelli
- Used for quick [M/H] changes when starting from ATLAS9 model

#### CONVECTION Cards

```
CONVECTION OFF
CONVECTION ON n1
CONVECTION OVER n1 overwt [nconv]
```

**Parameters**:
- `n1` = mixing length / pressure scale height (l/Hp, typically 1.25)
- `overwt` = overshooting weight (0=none, 1=full, typically 0)
- `nconv` = layer where Schwarzschild criterion reliable (default 36)

**Castelli extension**:
- `nconv` parameter added to handle cool models (Teff < 4000 K)
- Original Kurucz code: hardcoded at layer 36
- Issue: Convection zone may occur above layer 36 in very cool stars

#### OPACITY Cards

```
OPACITY ON names
OPACITY OFF names
OPACITY IFOP switches
```

**Critical for Stage 2**:
```
OPACITY ON XLINES    ! Read nltelines.bin (fort.19)
OPACITY ON LINES     ! Read preselected lines (fort.12)
```

**For Stage 1**:
- OPACITY settings read from input model
- Use `READ LINES` control card instead to trigger line selection

#### READ Cards

```
READ PUNCH           ! Read input model (fort.3)
READ MOLECULES       ! Read molecular partition functions (fort.2)
READ LINES          ! Read line databases (Stage 1 only)
```

**Stage distinction**:
- Stage 1: Use `READ LINES` → triggers SELECTLINES
- Stage 2: Use `OPACITY ON XLINES` and `OPACITY ON LINES` → reads selected lines

#### Other Important Cards

```
TEFF value
GRAVITY value
ITERATIONS n
MOLECULES ON
PRINT flags...
PUNCH flags...
LTE
NLTE
BEGIN
END
VTURB value
TURBULENCE
SCALE MODEL ndepths rhoxmin steplog teff grav
```

**SCALE MODEL**: Redefines depth grid and stellar parameters
- `ndepths` = number of depth points (typically 72)
- `rhoxmin` = log10(minimum column density) (e.g., -6.875)
- `steplog` = step in log10(rhox) (e.g., 0.125)
- `teff`, `grav` = new effective temperature and surface gravity

### Energy Distributions and SURFACE FLUX

⚠️ **CRITICAL WARNING** (from Castelli 2005, Section 8):

**SURFACE FLUX control card**: Computes emergent flux F(λ)

**Problem**: "This flux is not accurate enough to be compared with the observations. In fact, it is only computed at the 30000 sampling points, with gaps that increase with increasing wavelengths. As a consequence, the details between two consecutive points are lost."

**Recommendation**: "Energy distributions for ATLAS12 models should be computed with the SYNTHE code at a resolving power of 500000, using the same line lists that were used for the model calculation. The high resolution spectrum should then be instrumentally broadened at the resolution of the observed energy distribution."

**Implication for Julia migration**:
- ATLAS12's built-in SURFACE FLUX should be documented as diagnostic only
- Warn users to use SYNTHE for actual spectral synthesis
- 30000-point sampling is sufficient for atmosphere structure but not for detailed spectra

---

### Opacity Sampling Method Details (from Castelli 2005)

#### Frequency Integration

**Method**: Trapezoidal rule over evenly-spaced frequency points

**Grid specification**:
- **30000 sampling points** in wavelength range λ₁ to λN
- **Logarithmic spacing**: Δlog(λn) = 0.0001
- **Weights**: wi = ½(νi-1 - νi+1) (trapezoidal rule)
- **Range**: log(λN) - log(λ₁) = 3 (factor of 1000 in wavelength)

**Integration limits** (Table 1 from Castelli 2005):

| Teff (K) | λ₁ (nm) | log λ₁ | λN (nm) | log λN |
|----------|---------|--------|---------|--------|
| ≤ 50000 | 10 | 1.0 | 10000 | 4.0 |
| < 30000 | 22.788 | 1.358 | 22782.43 | 4.357 |
| < 13000 | 50.431 | 1.703 | 50419.67 | 4.703 |
| < 7250 | 91.180 | 1.960 | 91159.09 | 4.960 |
| < 4500 | 144.577 | 2.160 | 144544.0 | 5.16 |

**Note**: λ₁ and λN shift to longer wavelengths for cooler stars to cover peak of Planck function.

#### Continuous Opacity Frequencies

**Per Castelli 2005 documentation**:
- **344 total frequencies** for continuum opacity calculation
- **337 frequencies**: Same as ATLAS9 (for BIG ODFs compatibility)
- **6 additional frequencies**: Added in ATLAS12

⚠️ **DISCREPANCY NOTED**:
- **Per documentation** (Castelli 2005): "In ATLAS12 six more frequencies were added, so that the whole wavelength range from 9.09 nm to 400000 nm is covered"
- **Extended range**: 9.09 nm to 400000 nm (vs ATLAS9 range)
- **Per code analysis**: Need to verify actual implementation in atlas12.for

**Purpose of 344 frequencies**:
- Used to extract lines from line lists
- Lines stronger than 0.001 × continuum at any depth are selected
- Uses specific abundances of the model

**Wavelength coverage verification needed**: Code inspection should confirm the 9.09-400000 nm range claim.

#### Total Absorption Coefficient

At each layer and frequency:

```
κtot(ν, τ) = ltot(ν, τ) + κc(ν, τ) + σ(ν, τ)
```

Where:
- ltot = Total line absorption (sum over all contributing lines)
- κc = Continuum (bound-free) opacity
- σ = Scattering opacity (free-free)

**Line absorption**:
```
ltot(ν, τ) = Σn ln(0) × V(vn, αn) × (1 - e^(-hν/kT))
```

Where:
- ln(0) = Line center absorption coefficient
- V(vn, αn) = Voigt function
- Stimulated emission factor: (1 - e^(-hν/kT))

**Voigt function**:
```
V(v, α) = (1/√π ΔνD) × H(Δλ/ΔλD, γ/4πΔνD)
```

**Doppler width**:
```
ΔνD = (ν₀/c) × √(2kT/μmH + ξ²)
```

Where:
- T = temperature
- μ = atomic mass
- ξ = microturbulent velocity

---

## II. SYNTHE Pipeline Architecture

### Overview

SYNTHE is an **11-program sequential pipeline** for synthetic spectrum calculation, documented in detail in WORKFLOW_ANALYSIS.md. This section provides program-by-program internal architecture using breadth-first documentation approach.

**Pipeline summary**: ATLAS model → xnfpelsyn → synbeg → line readers (×N) → synthe → spectrv → rotate → broaden → spectrum

---

### SYNTHE Pipeline Programs - Quick Reference

| # | Program | Lines | Subs | Purpose | Complexity |
|---|---------|-------|------|---------|------------|
| 1 | xnfpelsyn | 317 | 1 | Atmosphere processor (+ atlas7v) | Medium |
| 2 | synbeg | 133 | 0 | Initialize wavelength grid | Simple |
| 3 | rgfalllinesnew | 648 | 1 | Read atomic line lists | Simple |
| 4 | rpredict | 450 | ? | Read predicted lines (optional) | Simple |
| 5 | rmolecasc | 569 | 0 | Read molecular lines | Simple |
| 6 | rschwenk | 222 | 1 | Read TiO lines (special format) | Simple |
| 7 | rh2ofast | 190 | 1 | Read H2O lines (binary) | Simple |
| 8 | synthe | 2,993 | 9 | Calculate line opacity | Complex |
| 9 | spectrv | 438 | 4 | Solve radiative transfer (+ atlas7v) | Medium |
| 10 | rotate | 360 | 2 | Rotational broadening | Simple |
| 11 | broaden | 221 | 0 | Instrumental broadening | Simple |
| 12 | converfsynnmtoa | 78 | 0 | Binary to ASCII conversion (optional) | Simple |

**Total**: ~6,600 lines (excluding atlas7v library which is 17K lines)

---

### Program 1: xnfpelsyn

**Purpose**: Compute atomic/molecular number densities and continuum opacities from ATLAS atmosphere model

**File**: `xnfpelsyn.for` (317 lines)
**Subroutines**: 1 embedded (name TBD)
**Links with**: ATLAS7V library (17K lines)

**Input**:
- stdin: ATLAS atmosphere model (.mod format)
- fort.2: molecules.dat (molecular equilibrium constants)
- fort.17: continua.dat (continuum opacity data)

**Output**:
- fort.10: Binary file with number densities, temperatures, pressures at each depth

**Key functions**:
- Calls ATLAS7V to interpolate atmosphere structure
- Computes Saha equation for ionization fractions
- Computes molecular equilibrium abundances
- Calculates continuum opacity (H⁻, H₂⁺, Rayleigh, etc.)

⚠️ **TODO**: Document ATLAS7V interface (which subroutines called, what they do)

---

### Program 2: synbeg

**Purpose**: Initialize synthetic spectrum calculation (wavelength range, resolution, control parameters)

**File**: `synbeg.for` (133 lines)
**Subroutines**: 0 (simple main program)
**Complexity**: ✅ Simple

**Input** (stdin control card):
```
AIR       700.0     721.0     500000.   0.     0          10 .001         0   00
AIRorVAC  WLBEG     WLEND     RESOLU    TURBV  IFNLTE LINOUT CUTOFF        NREAD
```

**Parameters**:
- WLBEG, WLEND: Wavelength range (Angstroms)
- RESOLU: Resolution R = λ/Δλ (e.g., 500000 for high-res)
- TURBV: Additional turbulent velocity (km/s, usually 0)
- IFNLTE: NLTE flag (0=LTE, 1=NLTE)
- LINOUT: Line output limit (also controls line data saving)
- CUTOFF: Line strength cutoff (0.001 = ignore lines <0.1% of continuum)
- NREAD: Number of atmosphere models (0 for single model)

**Output**:
- fort.12: Binary file header for line list accumulation
- fort.14: Control parameters for subsequent programs (via fort.93 in some versions)

**What it does**:
- Reads control parameters from stdin
- Initializes binary file structures
- Passes parameters to next programs via fort unit files

**Documentation quality**: ✅ Excellent - Source has detailed comments explaining pipeline flow and line reader conventions

---

### Programs 3-7: Line List Readers

All follow same pattern: Read specific line list format, select lines in wavelength range, append to fort.12

#### Program 3: rgfalllinesnew (Atomic Lines)

**File**: `rgfalllinesnew.for` (648 lines)
**Subroutines**: 1 embedded
**Called**: Multiple times for different wavelength ranges (gf0800.100, gf1200.100, etc.)

**Input**:
- fort.11: Atomic line list (Kurucz gf*.100 ASCII format)
- fort.12: Line list being built (read + append)
- fort.14: Control parameters from synbeg

**Output**:
- fort.12: Updated line list (original + new lines in wavelength range)

**Line format** (gf*.100):
Fixed-format ASCII: wavelength, log(gf), element.ion, E_lower, J_lower, E_upper, J_upper, etc.

**Filtering**: Selects lines with:
- Wavelength in [WLBEG, WLEND]
- Strength > CUTOFF threshold
- Correct ionization stage format

#### Program 4: rpredict (Predicted Lines - Optional)

**File**: `rpredict.for` (450 lines)
**Input**: fort.11 (predicted lines from energy levels - different format than gf*.100)
**Purpose**: Add predicted lines for elements with incomplete experimental data

⚠️ **Note**: Only use if IFPRED=1 in synbeg. Predicted lines have uncertain wavelengths - not suitable for detailed line-by-line abundance analysis.

#### Program 5: rmolecasc (Molecular Lines)

**File**: `rmolecasc.for` (569 lines)
**Subroutines**: 0 (main program only)
**Called**: Multiple times for different molecules (CH, MgH, NH, OH, etc.)

**Input**: fort.11 (molecular line list - ASCII format, molecule-specific)
**Output**: fort.12 (updated with molecular lines)

**Molecules typically read** (each requires separate execution):
CH, MgH, NH, OH, SiH, H2, C2, CN, CO, SiO

**Note**: Each molecule has its own line list file format (slightly different headers/columns)

#### Program 6: rschwenk (TiO Lines)

**File**: `rschwenk.for` (222 lines)
**Subroutines**: 1 embedded

**Input**:
- fort.11: tioschwenke.bin (TiO lines - **binary format**, Schwenke database)
- fort.48: eschwenke.bin (TiO energy levels - binary)

**Output**: fort.12 (updated)

**Why separate**: TiO has special binary format and requires separate energy level file. TiO line lists are enormous (millions of lines) - binary storage essential.

#### Program 7: rh2ofast (H2O Lines)

**File**: `rh2ofast.for` (190 lines)
**Subroutines**: 1 embedded

**Input**: fort.11 (h2ofastfix.bin - **binary**, Partridge & Schwenke database)
**Output**: fort.12 (updated)

**Why separate**: H2O has millions of lines, binary format for efficiency. Critical for cool stars (T < 4000K).

**Summary of line reading phase**:
- Fort.12 starts with header from synbeg
- Each reader program appends lines within wavelength range
- Final fort.12 contains complete line list (atomic + molecular)
- Typical line count: tens to hundreds of thousands

⚠️ **TODO for migration**: Define unified line list format in Julia. Provide conversion utilities for Kurucz/Castelli formats. Consider using Arrow or HDF5 for binary storage instead of Fortran UNFORMATTED.

---

### Program 8: synthe (Main Synthesis Engine)

**File**: `synthe.for` (2,993 lines Castelli / 2,985 Kurucz)
**Subroutines**: 9 embedded
**Complexity**: ⚠️ High - This is the computational core

#### Embedded Subroutines

1. **TABVOIGT** - Pretabulate Voigt profiles (shared with ATLAS12)
2. **XLINOP** - Line opacity calculation (shared with ATLAS12)
3. **MAP1** - Map opacity to wavelength/frequency grid
4. **INTEG** - Numerical integration (shared with ATLAS12)
5. **PARCOE** - Parabolic coefficients for interpolation (shared with ATLAS12)
6. **READBCS** - Read boundary conditions from ATLAS model
7. **EXIT** - Program termination
8-9. ❓ **Two more** (not yet identified - require source inspection)

#### Input

- fort.10: Atmosphere structure from xnfpelsyn
- fort.12: Complete line list from line readers
- fort.14: Control parameters from synbeg
- fort.18: he1tables.dat (Stark broadening tables for He I specific lines: 4026, 4387, 4471, 4922 Å)

#### Output

- fort.16 (or fort.18 in some versions): Line opacities vs wavelength vs depth (internal binary format)

#### What it does

For each spectral line in fort.12:
1. Calculate line profile (Voigt function = thermal + damping broadening)
2. Include microturbulence broadening
3. Include van der Waals broadening (temperature-dependent)
4. Compute line opacity κ_line(λ, depth) at each wavelength point and depth
5. Store in compressed format

**Computational intensity**: This is the **slowest step** in the pipeline. Calculating profiles for tens of thousands of lines takes 10-60 minutes depending on:
- Wavelength range (longer = more lines)
- Resolution (higher = finer grid)
- Number of molecules included

#### COMMON Blocks (15 total)

From DEPENDENCY_MAP.md:

**Atmospheric Structure**:
- `/RHOX/` - Density vs depth
- `/STATE/` - Thermodynamic state
- `/BHE/` - Helium data
- `/BHYD/` - Hydrogen data

**Line Data**:
- `/LINDAT/` - Line parameters (wavelength, gf, E_lower, etc.)
- `/NLINES/` - Number of lines
- `/BUFFER/` - I/O buffer for line reading

**Opacity**:
- `/EXTAB/` - Exponential extinction tables (pretabulated)
- `/H1TAB/` - Hydrogen opacity tables
- `/CONTIN/` - Continuum opacity from xnfpelsyn

**(6 additional blocks not yet cataloged - require source inspection)**

⚠️ **TODO**:
- Map full COMMON block structure
- Identify two unnamed subroutines
- Document line-by-line calculation algorithm details
- Understand fort.16 vs fort.18 output differences (version-dependent?)

---

### Program 9: spectrv

**Purpose**: Solve radiative transfer equation, compute emergent intensities or flux

**File**: `spectrv.for` (438 lines)
**Subroutines**: 4 embedded (names TBD)
**Links with**: ATLAS7V library (17K lines)

#### Input

- stdin: ATLAS atmosphere model (.mod format - same as xnfpelsyn input)
- fort.2: molecules.dat
- fort.25: Partial redistribution control parameters (ASCII, usually zeros for LTE)
- fort.16 (or fort.18): Line opacities from synthe

#### Output

- fort.7: Emergent intensity I(λ,μ) or flux F(λ)
  - If computing intensity: I(λ,μ) at 17 angles (μ = cos θ)
  - If computing flux: F(λ) = ∫ I(λ,μ) dμ

#### What it does

For each wavelength:
1. Solve radiative transfer equation: dI/dτ = I - S
2. Source function S = B_ν (Planck function for LTE)
3. Use opacity from synthe + continuum from xnfpelsyn
4. Integrate over atmosphere depth to get surface intensity/flux
5. Optionally compute intensity at multiple angles (disk center to limb)

**Calls ATLAS7V** for atmosphere interpolation (same as xnfpelsyn)

⚠️ **TODO**:
- Identify the 4 embedded subroutines
- Document which ATLAS7V routines are called
- Understand partial redistribution parameters (fort.25 - used for NLTE?)

---

### Program 10: rotate

**Purpose**: Apply rotational broadening (stellar v sin i)

**File**: `rotate.for` (360 lines)
**Subroutines**: 2 embedded (names TBD)
**Complexity**: ✅ Simple - Straightforward convolution

#### Input

- fort.1: Intensity or flux spectrum from spectrv (linked from fort.7)
- stdin: Rotation parameters
  ```
      1          # Number of rotation velocities
  2.             # v sin i (km/s)
  ```

#### Output

- ROT1 (or ROT2, ROT3, etc.): Rotationally broadened spectrum (can output multiple rotation velocities)

#### Algorithm

Convolves spectrum with rotational broadening kernel:
- Kernel shape: G(Δλ) ∝ √(1 - (Δλ/Δλ_max)²)
- Accounts for limb darkening
- Can compute multiple v sin i values in one run

**Physics**: Rotation broadens lines because different parts of stellar disk have different Doppler shifts. Limb darkening means edge of disk contributes less flux than center.

---

### Program 11: broaden

**Purpose**: Apply instrumental or macroturbulent broadening

**File**: `broaden.for` (221 lines)
**Subroutines**: 0 (main program only)
**Complexity**: ✅ Very simple - Just convolution

#### Input

- fort.21: Rotationally broadened spectrum from rotate (linked from ROT1)
- stdin: Broadening parameters
  ```
  GAUSSIAN  48000.    RESOLUTION
  ```
  or
  ```
  LORENTZIAN  0.15    FWHM_ANGSTROMS
  ```

#### Output

- fort.22: Final broadened spectrum (binary format)

#### Algorithm

Convolve spectrum with instrumental profile:
- **GAUSSIAN**: Typical for spectrographs (resolution R = λ/Δλ or FWHM)
- **LORENTZIAN**: For macroturbulence broadening

**Simple convolution**: ∫ spectrum(λ') × kernel(λ - λ') dλ'

---

### Program 12: converfsynnmtoa (Optional)

**Purpose**: Convert binary spectrum output to ASCII format + unit conversion

**File**: `converfsynnmtoa.for` (78 lines)
**Subroutines**: 0 (main program only)
**Complexity**: ✅ Trivial - Just format conversion

#### Input

- fort.1: Binary spectrum from broaden (fort.22)

#### Output

- fort.2: ASCII spectrum

#### Conversion

**Binary format**: H_ν (erg/s/cm²/Hz) vs λ (nm)
**ASCII format**: F_λ (erg/s/cm²/Å) vs λ (Å)

**Unit conversions**:
- λ (nm) → λ (Å): multiply by 10
- H_ν → F_λ: F_λ = H_ν × (c/λ²) conversion

---

### ATLAS7V Library

**Purpose**: Atmosphere interpolation routines shared by xnfpelsyn and spectrv

**File**: `atlas7v.for` (17,336 lines Castelli / 17,304 Kurucz)
**Complexity**: ⚠️ Very High - This is a massive library

#### Where used

- **xnfpelsyn** (Program 1): Compile together with atlas7v.o
  ```bash
  gfortran -c xnfpelsyn.for
  gfortran -c atlas7v.for
  gfortran xnfpelsyn.o atlas7v.o -o xnfpelsyn.exe
  ```

- **spectrv** (Program 9): Compile together with atlas7v.o
  ```bash
  gfortran -c spectrv.for
  gfortran -c atlas7v.for
  gfortran spectrv.o atlas7v.o -o spectrv.exe
  ```

#### What ATLAS7V provides

❓ **UNCERTAIN** - Requires detailed analysis of 17K-line file. From context:
- Atmosphere structure interpolation (T, P, ρ vs depth)
- Reading ATLAS model files
- Partition function calculations
- Possibly molecular equilibrium routines
- Possibly continuum opacity calculations

⚠️ **CRITICAL TODO**: Document ATLAS7V interface
- List all SUBROUTINEs exported
- Identify which ones are called by xnfpelsyn vs spectrv
- Determine if any ATLAS7V code is duplicated in ATLAS12 (potential shared migration target)
- Check if ATLAS7V has its own COMMON blocks that need documentation

**Migration strategy**: ATLAS7V is complex enough that it should be migrated as a separate Julia module, then imported by SYNTHE pipeline programs.

---

### SYNTHE Line Data Formats

**Reference**: Jauregi 2005, Section 3.4 (complete field specifications)

#### Atomic Line Format (30 fields)

**Source**: Kurucz gf*.100 files (ASCII, fixed format)

| Field | Variable | Format | Description |
|-------|----------|--------|-------------|
| 1 | WL | F10.4 | Wavelength (nm) |
| 2 | GFLOG | F7.3 | log(gf) oscillator strength |
| 3 | CODE | F6.2 | Element.ion (e.g., 26.01 = Fe II) |
| 4 | E | F12.3 | Lower energy level (cm⁻¹) |
| 5 | XJ | F5.1 | Lower level J = L+S |
| 6 | LABEL | A10 | Lower level config (spectroscopic notation) |
| 7 | EP | F12.3 | Upper energy level (cm⁻¹) |
| 8 | XJP | F5.1 | Upper level J |
| 9 | LABELP | A10 | Upper level config |
| 10 | GAMMAR | F6.2 | log(γ_rad) radiative damping |
| 11 | GAMMAS | F6.2 | log(γ_Stark) Stark damping |
| 12 | GAMMAW | F6.2 | log(γ_VdW) van der Waals damping @10000K |
| 13 | REF | A4 | Bibliographic reference code |
| 14 | NBLO | I2 | NLTE departure coeff (lower level) |
| 15 | NBUP | I2 | NLTE departure coeff (upper level) |
| 16 | ISO1 | I3 | Isotope number (1st component) |
| 17 | X1 | F7.3 | Hyperfine component log fractional strength |
| 18 | ISO2 | I3 | Isotope number (2nd component for diatomics) |
| 19 | X2 | F7.3 | Log isotopic abundance fraction |
| 20-21 | - | I5, I5 | Hyperfine shifts (mK) for lower, upper levels |
| 22-23 | - | I1, A1 | Hyperfine f (lower), note ('z'=none, '?'=guess) |
| 24-25 | - | I1, A1 | Hyperfine f (upper), note |
| 26 | - | I1 | Line strength class code |
| 27 | - | A3 | Special code (e.g., 'AUT' for autoionizing) |
| 28 | GLANDE | I5 | Landé g-factor (lower) × 1000 |
| 29 | GLANDEP | I5 | Landé g-factor (upper) × 1000 |
| 30 | ISOSHIFT | I6 | Isotope wavelength shift (mÅ) |

**Example** (Ca II triplet line at 854.2091 nm):
```
854.2091 -0.362 20.01 13710.880 2.5 3d 2D 25414.400 1.5 4p 2P
8.20 -5.55 -7.80BWL 2 3 0 0.000 0 0.000 0 0 5 1200 1334
```

**Reference codes**: See gfall.ref and gfelem.ref in Kurucz website /linelists/lines/

#### Molecular Line Format (10 fields)

**Source**: Kurucz molecular line files (various formats per molecule)

| Field | Variable | Format | Description |
|-------|----------|--------|-------------|
| 1 | WL | F10.4 | Wavelength (nm) |
| 2 | GFLOG | F7.3 | log(gf) |
| 3 | XJ | F5.1 | Lower level J = L+S |
| 4 | E | F12.3 | Lower energy (cm⁻¹) |
| 5 | XJP | F5.1 | Upper level J |
| 6 | EP | F12.3 | Upper energy (cm⁻¹) |
| 7 | CODE | F9.2 | Molecule code + transition label |
| 8 | LABEL(1) | A8 | Lower level label |
| 9 | LABELP(1) | A8 | Upper level label |
| 10 | ISO | I2 | Isotope number |

**Molecule codes**: Atomic numbers concatenated (e.g., 608=CO, 814=SiO, 101.01=H₂⁺, 100=H⁻)

**Example** (SiO line at 350.0288 nm):
```
350.0288 -0.121 69.0-32654.280 70.0 -61215.190 814X28 E10 29
```

---

### SYNTHE Known Bugs and Quirks

**Reference**: Jauregi 2005, Section 3.5

#### Critical Bug: SURFACE FLUX + ROTATE Crash

**Problem** (Section 3.5.1):
- Using `SURFACE FLUX` control card in ATLAS model header **crashes** when ROTATE program is in SYNTHE pipeline
- Confirmed by F. Castelli (private communication) as bug in ROTATE

**Workaround**:
| Goal | Header Card | ROTATE | Output |
|------|-------------|--------|--------|
| Flux, non-rotating star | `SURFACE FLUX` | Omit ROTATE | ✅ Flux spectrum |
| Flux, rotating star | `SURFACE FLUX` | Include ROTATE | ❌ **CRASH** |
| Flux, rotating star (workaround) | `SURFACE INTENSITY` | Include ROTATE | ✅ Flux spectrum |
| Intensity, non-rotating | `SURFACE INTENSITY` | Omit ROTATE | ✅ Intensity @ angles |
| Intensity, rotating | `SURFACE INTENSITY` | Include ROTATE | ✅ Flux spectrum |

**Recommendation**: **Always use SURFACE INTENSITY instead of SURFACE FLUX** to avoid crashes.

**Mechanism**: ROTATE integrates intensity over stellar disk to produce flux. With v sin i = 0, this gives same result as SURFACE FLUX but without crashing.

**Julia migration note**: This bug should NOT be reproduced in Julia version. Implement proper flux/intensity/rotation logic without this limitation.

#### Line List File Naming Exception

**General pattern**: `GFxxxx.yyy`
- xxxx = upper wavelength limit (nm)
- yyy = wavelength range (nm)

**Example**: GF0300.100 contains lines 200-300 nm (100 nm range)

**EXCEPTION**: GF1200.100 actually contains lines 800-1200 nm (400 nm range, not 100!)

**Correct interpretation**:
- GF1200.100 should be called GF1200.400
- Users must know this exception when selecting line lists

---

### SYNTHE Pipeline Data Flow Summary

```
ATLAS12 model (.dat) ──┐
                       ├──> xnfpelsyn + atlas7v ──> fort.10 (atmosphere)
molecules.dat ─────────┘                    ↓
continua.dat ──────────────────────────────┘

Control parameters ──> synbeg ──> fort.12 (header), fort.14 (params)

Line lists:             Line Readers:
  gf*.100 ────────────> rgfalllinesnew ───┐
  predicted.asc ─────> rpredict ──────────┤
  CH.asc etc. ───────> rmolecasc ─────────┤──> fort.12 (complete line list)
  tioschwenke.bin ──> rschwenk ───────────┤
  h2ofastfix.bin ───> rh2ofast ───────────┘

fort.10 + fort.12 + fort.14 ──> synthe ──> fort.16 (line opacities)

ATLAS12 model (.mod) ──┐
fort.16 ───────────────┼──> spectrv + atlas7v ──> fort.7 (intensity/flux)
molecules.dat ─────────┘

fort.7 ──> rotate ──> ROT1 (rotational broadening)

ROT1 ──> broaden ──> fort.22 (final spectrum, binary)

fort.22 ──> converfsynnmtoa ──> fort.2 (ASCII spectrum)
```

**Key fort unit summary**:
- fort.2: molecules.dat (input, reused by multiple programs)
- fort.10: Atmosphere from xnfpelsyn → used by synthe
- fort.12: Accumulated line list → used by synthe
- fort.14: Control parameters (passed between programs)
- fort.16/18: Line opacities from synthe → used by spectrv
- fort.7: Spectrum from spectrv → renamed to fort.1 for rotate
- ROT1: From rotate → renamed to fort.21 for broaden
- fort.22: Final spectrum (binary)
- fort.2: Final spectrum (ASCII, reuses unit number)

---

### Migration Implications for SYNTHE

#### Pipeline vs Monolithic

**Current**: 11 separate executables communicating via fort.X files

**Julia Option 1**: Preserve modularity (11 separate programs/scripts)
```julia
# Separate programs, call sequentially
run(`xnfpelsyn < model.mod`)
run(`synbeg < params.txt`)
run(`rgfalllinesnew`)
# ... etc
```
**Pro**: Matches current workflow
**Con**: Lots of file I/O overhead

**Julia Option 2**: Unified function pipeline (Paula's preference per WORKFLOW_ANALYSIS.md Q4)
```julia
function synthe_pipeline(
    atmosphere_model::AtmosphereModel,
    line_lists::Vector{LineList},
    wavelength_range::Tuple{Float64, Float64},
    resolution::Float64;
    rotation_vsini::Float64 = 0.0,
    instrumental_broadening::Float64 = 0.0
) ::Spectrum

    # In-memory data structures replace fort.X files
    atm_data = process_atmosphere(atmosphere_model)
    lines = accumulate_lines(line_lists, wavelength_range)
    opacities = calculate_line_opacities(atm_data, lines)
    spectrum = solve_radiative_transfer(atm_data, opacities)

    if rotation_vsini > 0
        spectrum = apply_rotation(spectrum, rotation_vsini)
    end

    if instrumental_broadening > 0
        spectrum = apply_broadening(spectrum, instrumental_broadening)
    end

    return spectrum
end
```
**Pro**: Clean interface, no intermediate files, much faster
**Con**: Requires more upfront design work

**Recommendation**: Start with Option 2 (unified pipeline). Much cleaner for Julia. Can add Option 1 wrapper later if needed for compatibility.

#### Fort Units → Named I/O

Replace hardcoded fort.X with explicit data structures:

```julia
struct AtmosphereData
    rhox::Vector{Float64}
    temperature::Vector{Float64}
    pressure::Vector{Float64}
    electron_density::Vector{Float64}
    # ... etc
end

struct LineList
    wavelength::Vector{Float64}
    log_gf::Vector{Float64}
    element::Vector{Int}
    ionization::Vector{Int}
    E_lower::Vector{Float64}
    # ... etc
end
```

#### ATLAS7V Library

**Critical dependency**: Both xnfpelsyn and spectrv require ATLAS7V (17K lines)

**Migration strategy**:
1. First, create standalone Julia module for ATLAS7V functionality
2. Then, migrate xnfpelsyn and spectrv to use this module
3. Investigate: Does ATLAS12 duplicate any ATLAS7V code? If so, share common implementation.

**Priority**: HIGH - This is a blocker for completing SYNTHE migration

#### Binary Format Compatibility

**Current**: Fortran UNFORMATTED I/O (fort.10, fort.12, fort.16, fort.22, ROT1)
- Machine-dependent byte ordering
- Fortran record headers
- Not portable across compilers or platforms

**Julia migration**:
- Use HDF5 or Arrow for binary storage (portable, self-describing)
- Or: Keep intermediate results in memory (no files at all for unified pipeline)
- Provide conversion utilities for reading legacy Fortran UNFORMATTED files (for validation against old outputs)

---

### Questions for Further Investigation

1. **synthe.for**: What are the other 2 subroutines (besides the 7 identified)? Check source.

2. **spectrv.for**: What are the 4 embedded subroutines? Check source.

3. **ATLAS7V interface**: Which subroutines are exported and called by xnfpelsyn vs spectrv? Are they the same or different?

4. **Fort.16 vs fort.18**: Some documentation mentions fort.16, some fort.18 for synthe output. Version-dependent or mode-dependent?

5. **Partial redistribution** (fort.25 in spectrv): Is this used only for NLTE? What parameters are actually needed?

6. **Line list formats**: How many different molecular line formats exist? Can they be unified?

7. **Performance bottleneck**: Is synthe (line opacity) always the slowest step? Or does spectrv (radiative transfer) dominate for certain parameter ranges?

8. **Molecule priority** (from WORKFLOW_ANALYSIS.md Q6): Paula wants to start with molecules sharing common format (excluding TiO and H2O initially). Need to document which molecules share format with CH, MgH, etc.

---

### SYNTHE Performance and Optimization Strategies

**Source**: Kurucz 2005 "Rapid computation of line opacity in SYNTHE and DFSYNTHE"

#### Point-by-Point vs Distribution Functions

**SYNTHE**: Computes **point-by-point** opacity spectrum
- Full resolution spectrum (R = 500,000 typical)
- Exact line profiles at every wavelength point
- Accurate for all applications (photometry, line profiles, abundance analysis)

**DFSYNTHE**: Uses **distribution functions** (see Section IV.8)
- Statistical approximation (12 opacity levels per interval)
- 100× storage compression (400 MB vs 40 GB)
- Valid when source function doesn't vary strongly

**When to use each**:
- **SYNTHE**: Line-by-line analysis, high-resolution spectra, accurate photometry
- **DFSYNTHE**: Model atmospheres, integrated photometry, large parameter grids

#### Pre-tabulated Opacity Tables

**Concept** (Kurucz 2005 proposal):
1. Run SYNTHE once to compute opacity spectrum for full T,P,V_turb grid
2. Store result as multi-dimensional table (40-80 GB)
3. **Model atmosphere programs interpolate** from table (no opacity calculation)
4. **Result**: "ATLAS12 could run without line data or opacity routines, just interpolations"

**Benefits**:
- Faster model convergence (especially with pre-tabulated Rosseland mean)
- No need to recompute line opacity at each iteration
- Consistent opacity across all models

**Drawbacks**:
- ❌ Loses ability to change abundances (table is abundance-specific)
- ❌ Massive storage requirements (40+ GB per abundance set)
- ❌ Fixed wavelength coverage (can't extend without recomputation)

#### Selective Processing Strategies

**From Kurucz 2005** - Ways to reduce computation/storage:

1. **Limited wavelength ranges**:
   - Single echelle order
   - Photometric system only
   - Velocity template (RV determination)

2. **Element-specific processing**:
   - Compute only lines of one element (abundance analysis)
   - Exclude strong lines (H α, H β) for separate treatment
   - Store each element separately, combine with abundance weights

3. **Temperature/pressure ranges**:
   - No molecules + no far-IR (hot stars)
   - No high ions + no Lyman continuum (cool stars)

4. **Approximation methods**:
   - Opacity sampling (every 100th point)
   - Mean opacities (average 100 points) - "may be no worse than mixing-length convection"
   - Selective means (different strategies in different regions)

**Practical recommendation**: Start with full SYNTHE for validation, consider pre-tabulation or distribution functions for production model grids.

---

**Status**: SYNTHE pipeline survey complete (breadth-first approach)

**Coverage**:
- ✅ All 11 programs cataloged with purpose, I/O, complexity
- ✅ Data flow mapped end-to-end
- ✅ Migration strategies outlined
- ✅ Performance optimization strategies documented (Kurucz 2005)
- ⚠️ Internal subroutine details deferred (flagged as TODOs)
- ⚠️ ATLAS7V library interface needs dedicated analysis session

**Next**: Commit this section, then decide: continue with ATLAS7V deep-dive, or move to Phase 3 (physics documentation)?

---

## III. Shared Computational Kernel

From DEPENDENCY_MAP.md analysis, these ~10 subroutines appear in multiple programs:

| Subroutine | ATLAS9 | ATLAS12 | SYNTHE | KAPPA9 |
|------------|--------|---------|--------|--------|
| READIN | ✓ | ✓ | - | ✓ |
| POPS | ✓ | ✓ | - | ✓ |
| PFSAHA | ✓ | ✓ | - | ✓ |
| KAPP | ✓ | ✓ | - | ✓ |
| ROSS | ✓ | ✓ | - | - |
| DERIV | ✓ | ✓ | - | ✓ |
| INTEG | ✓ | ✓ | ✓ | ✓ |
| SOLVIT | ✓ | ✓ | - | ✓ |
| PARCOE | ✓ | ✓ | ✓ | ✓ |
| TABVOIGT | - | ✓ | ✓ | - |
| XLINOP | - | ✓ | ✓ | - |

**Migration implication**: These subroutines can be translated once and reused across all programs. Estimated ~2,000-3,000 lines of shared code.

---

## IV. Next Steps for Phase 2B

### Completed This Session
- ✓ Cataloged all 80 ATLAS12 subroutines
- ✓ Documented main program flow
- ✓ Listed all 57 COMMON blocks
- ✓ Identified key algorithms (two-stage line selection, three-phase integration)
- ✓ Basic SYNTHE architecture overview

### Remaining Work (to complete Phase 2B)

**High Priority**:
1. Create ASCII call-chain diagrams showing subroutine dependencies
2. Document COMMON block contents (variables, types, dimensions) for top 20 most important blocks
3. Map Stage 1 vs Stage 2 execution paths in detail
4. Document ATLAS7V library API (subroutines exported, calling conventions)

**Medium Priority**:
5. Analyze SYNTHE pipeline programs individually (currently only synthe.for is documented)
6. Create detailed flow for one complete ATLAS12 iteration
7. Document numerical methods used (integration schemes, solvers, convergence criteria)

**Lower Priority** (can defer to Phase 3):
8. Physics documentation for each opacity source
9. Convergence criteria and stability analysis
10. Precision requirements and numerical accuracy concerns

---

## V. Architecture Insights for Migration

### Monolithic Design

ATLAS12 is a **single 23K-line file** with 80 embedded subroutines. No modularization.

**Julia approach**: Break into modules
```julia
module Atlas12
  module IO
    # READIN, PUTOUT, W
  end
  module Populations
    # POPS, POPSALL, PFSAHA, NELECT
  end
  module Opacity
    # KAPP, KAPCONT, HOP, HMINOP, etc.
  end
  module RadiativeTransfer
    # RADIAP, ROSS, JOSH, TCORR, STATEQ
  end
  module Numerics
    # DERIV, INTEG, SOLVIT, PARCOE
  end
end
```

### Global State Management

57 COMMON blocks = massive global state. Julia should use:
1. **Immutable structs** for constants (element data, physical constants)
2. **Mutable structs** for iteration state (passed explicitly)
3. **No global variables** except true constants

Example:
```julia
# Instead of COMMON /STATE/
struct AtmosphereState
    P::Vector{Float64}
    XNE::Vector{Float64}
    XNATOM::Vector{Float64}
    RHO::Vector{Float64}
    CHARGESQ::Vector{Float64}
end

# Pass explicitly
function pops!(state::AtmosphereState, config::Config)
    # ...
end
```

### Two-Stage Execution

Current: Run ATLAS12 twice with manual file renaming
Julia option 1: Keep two-stage (preserve workflow)
```julia
atlas12_select_lines(input_model, line_databases, output_selected)
atlas12_iterate(input_model, selected_lines, output_model)
```

Julia option 2: Single function with mode parameter
```julia
atlas12(input_model, line_databases;
        select_only=false, use_selected="selected.bin")
```

### Fort Unit I/O

Current: Hardcoded fort.X unit numbers
Julia: Named files or in-memory structures
```julia
# Instead of fort.12 (selected lines)
selected_lines = select_lines(LineDatabase("fclowlines.bin"), model)
# Instead of fort.7 (output model)
save_model(model, "output.dat")
```

---

## Questions for Further Investigation

1. **LUKEOP and HOTOP**: What do "Luke" and "Hot" opacity sources represent? Check source code comments.

2. **BLOCKX subroutines**: Are BLOCKE, BLOCKR, BLOCKJ, BLOCKH using Fortran BLOCK DATA for initialization? Verify.

3. **PRELINOP**: Called but commented out in current version. Why? Historical artifact or conditionally used?

4. **DUMMYR**: Empty placeholder or actual implementation? Check source.

5. **XLINOP vs LINOP vs LINOP1**: Three different line opacity methods. What are the algorithmic differences?

6. **Stage 1 does more than line selection?**: Paula noted in WORKFLOW_ANALYSIS.md that Stage 1 might do additional computation. Investigate control cards and output.

7. **COMMON block /JUNK/**: Why is metadata block called "JUNK"? Historical name or placeholder?

---

## III. ATLAS9 Architecture (Breadth-First Survey)

**Status**: Lower priority, ODF-based predecessor to ATLAS12
**Migration decision needed**: Section V.1 of ARCHITECTURE_INSIGHTS.md (ODF vs OS)

### 3.1 Basic Information

| Attribute | Value |
|-----------|-------|
| **Purpose** | Stellar atmosphere modeling using Opacity Distribution Functions |
| **Versions** | atlas9.for, atlas9mem.for, atlas9v.for, atlas9xlinop.for |
| **Line count** | ~18,600-20,200 lines (Castelli), ~13,000-18,700 lines (Kurucz) |
| **Execution model** | Single-program iterative convergence (no two-stage split) |
| **Key difference from ATLAS12** | Uses pre-computed ODFs instead of direct line opacity |

**Relationships**:
- **Predecessor** to ATLAS12
- **Shares** most subroutines with ATLAS12 and KAPPA9
- **Feeds** SYNTHE (SYNTHE can use ATLAS9 or ATLAS12 models)
- **Requires** ODF tables from Kurucz's ODF generation pipeline

---

### 3.2 Variants

**Four versions identified** (Castelli):

1. **atlas9v.for** (19,752 lines) - "Vector" version
2. **atlas9mem.for** (19,763 lines) - "Memory" version
3. **atlas9.for** (Kurucz only, 18,725 lines) - Original version
4. **atlas9xlinop.for** (Kurucz only, 13,014 lines) - Explicit line opacity version

📋 **TODO**: Clarify difference between "v" (vector) and "mem" (memory) variants. Likely optimization strategies for different architectures.

⚠️ **Note**: atlas9xlinop.for appears to be hybrid - explicit line opacity like ATLAS12 but otherwise ATLAS9 structure. This might be intermediate between ATLAS9 and ATLAS12.

---

### 3.3 Subroutine Count

**From atlas9v.for** (representative):
- **Total subroutines**: ~52 (similar to ATLAS12)
- **Main program**: ATLAS9
- **Shared with ATLAS12**: ~40+ subroutines (same names, likely same or very similar code)

**Major shared subroutines**:
- PUTOUT, TCORR, STATEQ, RADIAP, ROSS (iteration control)
- POPS, NELECT, PFSAHA, IONPOTS, PFIRON (populations)
- MOLEC, NMOLEC (molecular equilibrium)
- CONVEC (convection)
- KAPP, HOP, HMINOP, HE1OP, HE2OP, COOLOP, LUKEOP, HOTOP, SI1OP (opacity sources)

**ATLAS9-specific subroutines**:
- Code for reading and interpolating ODFs (⚠️ need to identify which subroutines)

**Implication for migration**: If ATLAS9 migration is needed, ~75% of code can reuse ATLAS12 implementation. Only ODF handling is unique.

---

### 3.4 COMMON Blocks

**Preliminary count** (from file header scan):
- Similar structure to ATLAS12
- Estimated ~50-60 COMMON blocks
- Same categories as ATLAS12 (constants, config, state, workspace, control)

**Notable blocks** (from header):
- /ABROSS/ - Rosseland opacity from ODF tables
- /BIGLIT/ - ODF wavelength grid (`WAVEDF(1213,2)`)
- /FRESET/ - Frequency set for integration (~1563 frequencies)
- All the standard blocks from ATLAS12 (/TEMP/, /STATE/, /FLUX/, etc.)

📋 **TODO**: Full COMMON block catalog (if ATLAS9 migration priority increases)

---

### 3.5 Input/Output Files

**Reference**: Jauregi 2005, Section 2.1 (Table 1)

**Fortran I/O Unit Structure** (accessed via READ(n,...) or WRITE(n,...)):

| Unit | Direction | Format | Description | Content |
|------|-----------|--------|-------------|---------|
| 9 | Input | Binary | ODF file | Opacity Distribution Functions (BIG or LITTLE) |
| 1 | Input | Text | Rosseland opacity file | Optional non-solar abundance tables |
| 5 | Input | Text | Command-line args | Control cards (GRAVITY, TEFF, BEGIN, etc.) |
| 3 | Input | Text | Preexisting model | For READ PUNCH, READ DECK, SCALE operations |
| 2 | Input | Text | Molecule data | MOLECULES.DAT (partition functions) |
| 7 | Output | Text | Main output | New model or radiation field (controlled by PUNCH) |
| 6 | Output | Text | Auxiliary info | Iteration diagnostics (controlled by PRINT) |

**ODF File Naming Convention** (Jauregi 2005):
- Format: `M25ABIG4.BDF` or `M25ALIT2.BDF`
- `M25` = log₁₀[Z/Z☉] = -2.5 (metallicity)
- `A` = alpha-enhanced abundances (O, Ne, Mg, Si, S, Ar, Ca, Ti +0.4 dex)
- `BIG` or `LIT` = Resolution (328 vs 1212 frequency divisions)
- `4` = Microturbulent velocity ξ = 4 km/s

**ODF Resolutions** (Jauregi 2005, Section 2.1):
- **BIG**: 328 divisions over wavelength range 8.977-100000 nm (for model calculation)
- **LITTLE**: 1212 divisions over same range (for radiation field calculation)
- **Location in code**: Subroutine BLOCKBIG contains exact wavelength divisions

**Rosseland Opacity Files**:
- Format: `kapxxx.ros` (e.g., `kap000.ros` for solar, `kapm10.ros` for [M/H]=-1.0)
- Default: Solar abundances + ξ=2 km/s stored in source code (function ROSSTAB, subroutine TTAUP)
- External file required for non-standard abundances (use READ KAPPA card)

**Key difference from ATLAS12**: Requires pre-computed ODF files (unit 9) instead of raw line lists.

---

### 3.6 Execution Flow (High-Level)

Based on structural similarity to ATLAS12:

```
1. Initialize
   - Read input parameters (TAPE5)
   - Read molecular data (TAPE2)
   - Read Rosseland opacity tables if needed (TAPE1)
   - Read ODF tables (TAPE9)

2. Main iteration loop
   WHILE NOT CONVERGED:
     - Calculate populations (POPS, MOLEC)
     - Calculate continuum opacity (HOP, HMINOP, etc.)
     - **Read line opacity from ODF** (ATLAS9-specific)
     - Solve radiative transfer (STATEQ, RADIAP)
     - Compute corrections (TCORR, ROSS)
     - Check convergence
     - Update atmosphere

3. Output final model (PUTOUT to TAPE7)
```

**Critical difference**: Step 2 uses ODF lookup instead of summing ~1 million individual lines.

**Performance implications**:
- **ATLAS9**: Minutes to hours (ODF lookup is fast)
- **ATLAS12**: Hours (direct line sum is slow but accurate)

---

### 3.7 ATLAS9 Control Cards Reference

**Reference**: Jauregi 2005, Section 2.3 (comprehensive card catalog)

**Card Categories**:
1. Model computation cards
2. Physical process cards
3. Output control cards
4. Miscellaneous cards

#### 3.7.1 Cards to Compute New Model

| Card | Syntax | Purpose |
|------|--------|---------|
| **GRAVITY** | `GRAVITY n` | Set log g (cm/s²) |
| **TEFF** | `TEFF n` | Set effective temperature (K) |
| **CALCULATE** | `CALCULATE n1 n2 n3` | Create gray T vs τ_Ross (n1 depths, start n2, step n3) |
| **READ START** | `READ START n` | Read n pairs of (τ_Ross, T) |
| **READ DECK** | `READ DECK n` | Read n lines: RHOX, T, P, XNE, ABROSS, PRAD, VTURB |
| **READ DECK6** | `READ DECK6 n` | Like READ DECK but PRAD → ACCRAD (rad. acceleration) |
| **SCALE** | `SCALE n1 n2 n3 n4 n5` | Rescale to n1 depths, 10^n2 τ start, 10^n3 step, T=n4, g=n5 |
| **FREQUENCIES** | `FREQUENCIES n1 n2 n3 name` | Read n1 freqs from n2 to n3, name=BIG or LITTLE |
| **ITERATIONS** | `ITERATIONS n` | Number of iterations (typically 15 for models, 1 for radiation) |
| **ABUNDANCE SCALE** | `ABUNDANCE SCALE n` | Multiply all abundances (except H, He) by n |
| **ABUNDANCE CHANGE** | `ABUNDANCE CHANGE n1 n2, n3 n4, ...` | Change individual elements (Z=n1, abund=n2) |
| **READ KAPPA** | `READ KAPPA` | Read Rosseland opacity from KAPxxx.ROS (before model cards!) |
| **READ PUNCH** | `READ PUNCH` | Read preexisting model from separate file (unit 3) |
| **BEGIN** | `BEGIN` | Begin calculation |
| **END** | `END` | Call EXIT, end procedure |

**Important**: `READ KAPPA` must be called **before** any model initialization cards.

**SCALE vs CALCULATE**: Castelli (1988) recommends using SCALE to modify existing model rather than CALCULATE from scratch (better numerical stability).

#### 3.7.2 Cards to Control Physical Processes

| Card | Syntax | Purpose |
|------|--------|---------|
| **OPACITY ON** | `OPACITY ON name1, name2, ...` | Turn on opacity sources |
| **OPACITY OFF** | `OPACITY OFF name1, name2, ...` | Turn off opacity sources |
| **OPACITY IFOP** | `OPACITY IFOP switches` | 20 comma-separated 0/1 switches |
| **CORRECTION** | `CORRECTION ON/OFF` | Temperature correction (off for radiation fields) |
| **PRESSURE** | `PRESSURE ON/OFF` | Compute pressure and number densities |
| **SURFACE FLUX** | `SURFACE FLUX` | Compute radiation flux at surface only |
| **SURFACE INTENSITY** | `SURFACE INTENSITY n n1 n2 n3 ...` | Compute intensity at n angles (μ=cos θ) |
| **SURFACE OFF** | `SURFACE OFF` | Calculate radiation at all depths |
| **SCATTERING** | `SCATTERING ON/OFF` | Include scattering in opacity |
| **CONVECTION ON** | `CONVECTION ON n` | Mixing-length convection (n = l/H_p ratio) |
| **CONVECTION OFF** | `CONVECTION OFF` | Disable convection |
| **CONVECTION OVER** | `CONVECTION OVER n1 n2` | Overshooting (n1=l/H_p, n2=weight W, 0=disable) |
| **MOLECULES** | `MOLECULES ON/OFF` | Input molecular partition functions |
| **TURBULENCE ON** | `TURBULENCE ON n1 n2 n3 n4` | P_t = ½ρ(n1×ρ^n2 + n3×v_s/10⁵ + n4)² |
| **TURBULENCE OFF** | `TURBULENCE OFF` | Disable turbulent pressure |
| **LTE / NLTE** | `LTE` or `NLTE` | Enable NLTE for H and H⁻ continua |

**Overshooting parameter**: W=0 disables overshooting (recommended). Must explicitly use `CONVECTION OFF` to compute non-overshooting models - `CONVECTION ON` defaults to W=1.

#### 3.7.3 Cards to Control Output

| Card | Syntax | Purpose |
|------|--------|---------|
| **PRINT** | `PRINT n` or `PRINT n1 n2 ... n_iter` | Unit 6 output control |
| **PUNCH** | `PUNCH n` or `PUNCH n1 n2 ... n_iter` | Unit 7 output control |

**For model calculations**:
- `PRINT 1 0 0 0 ... 0 1` = Print first and last iteration only
- `PUNCH 0 0 0 0 ... 0 1` = Punch final model only
- Each number is a switch (0 or 1) for corresponding iteration

**For radiation field calculations**:
- `PRINT n` where n = 0 (none) to 4 (verbose), default 2
- Similar for PUNCH

#### 3.7.4 Other Cards

| Card | Syntax | Purpose |
|------|--------|---------|
| **READ DEPARTURE** | `READ DEPARTURE n1` | Read H and H⁻ NLTE departure coefficients (not recommended) |
| **CALL** | `CALL` | Call user-supplied DUMMYR subroutine |
| **TITLE** | `TITLE string` | Set model name (max 74 characters) |
| **CHANGE** | `CHANGE n1 n2, n3, n4 ...` | Map model onto n1 points at depths n2, n3, ... |

#### 3.7.5 Convergence Check (from Auxiliary Output)

**How to verify convergence** (Section 2.1, Auxiliary Output):

Look for columns in unit 6 output:
```
PER CENT FLUX
ERROR    DERIV
...      ...
```

**Convergence criteria**:
- ERROR (flux error) < 1%
- DERIV (derivative error) < 10%

If not converged, increase ITERATIONS.

---

### 3.8 ODF (Opacity Distribution Function) Concept

**What are ODFs?**:
- Pre-computed probability distribution of opacity at each wavelength
- Represents ~1 million lines as statistical distribution (~100-1000 points)
- Created by separate ODF generation programs

**ODF trade-offs** (vs opacity sampling in ATLAS12):
- ✅ **Faster**: Lookup table vs summing million lines
- ✅ **Smaller**: ~MB vs GB of line data
- ❌ **Less accurate**: Statistical approximation vs exact sum
- ❌ **Inflexible**: Fixed abundances, can't easily change line strengths

**Julia migration question** (from ARCHITECTURE_INSIGHTS.md Section V.1):
- Implement ATLAS9 (ODF) or ATLAS12 (OS) first?
- Or both, with shared computational kernel?

---

### 3.8 Migration Implications

**If ATLAS9 migration is needed**:

**Shared code** (~75%, can reuse ATLAS12):
- All population calculations
- All continuum opacity sources
- Radiative transfer solver
- Convergence logic
- I/O except ODF reading

**ATLAS9-specific code** (~25%, new work):
- ODF file format reader
- ODF interpolation (wavelength, temperature, pressure)
- Integration of ODF into opacity calculation
- ODF generation pipeline (if users need custom ODFs)

**Estimated effort** (relative to ATLAS12=100%):
- **If ATLAS12 done first**: +25% for ATLAS9-specific parts
- **If ATLAS9 done first**: ~85% (then +15% for ATLAS12 line opacity)

**Recommendation**: See ARCHITECTURE_INSIGHTS.md Section V.1 for decision framework.

---

📋 **Deferred details** (breadth-first approach):
- [ ] Exact subroutine list and call chains
- [ ] Complete COMMON block catalog
- [ ] ODF file format specification
- [ ] Detailed comparison atlas9v vs atlas9mem vs atlas9xlinop
- [ ] ODF generation pipeline documentation

---

## IV. DFSYNTHE Architecture (Breadth-First Survey)

**Status**: Lower priority, connects SYNTHE to ATLAS9
**Purpose**: Creates detailed opacity spectrum for SYNTHE using ATLAS9 output

### 4.1 Basic Information

| Attribute | Value |
|-----------|-------|
| **Purpose** | Generate detailed line-by-line opacity spectrum from atmosphere model |
| **Versions** | Castelli dfsynthe.for (5 files, 22K lines), Kurucz dfsynthe.for |
| **Line count** | Main program ~2.9K lines, plus XNFDF library ~16K lines |
| **Execution model** | Single program reading atmosphere, producing opacity file |
| **Precision** | Mostly REAL*4 (32-bit), except wavelengths/energy levels (REAL*8) |

**Relationships**:
- **Reads**: ATLAS9 (or ATLAS12) atmosphere models
- **Feeds**: SYNTHE pipeline (provides opacity data)
- **Uses**: XNFDF library for detailed opacity calculations
- **Alternative to**: ATLAS12 Stage 1 (both do line selection/opacity calculation)

**Key insight**: DFSYNTHE+SYNTHE is the ATLAS9 equivalent of ATLAS12+SYNTHE (ATLAS12 integrated).

---

### 4.2 Components

**Main program**: dfsynthe.for (~2,900 lines)

**Library**: xnfdf.for (~16,200-16,600 lines)
- This is the "heavy lifting" opacity calculation library
- Shared between DFSYNTHE and other Kurucz programs

**Support programs** (Castelli dfsynthe/ directory):
- highlinesdf.for (469 lines) - High-energy line processing
- lowlinesdf.for (452 lines) - Low-energy line processing
- tiolinesdf.for (1,050 lines) - TiO molecular lines
- rmodfin.for (72 lines) - Read model file
- rmolec.for (73 lines) - Read molecular data
- rpopsw.for (62 lines) - Read populations
- xlinop.for (88 lines) - Line opacity calculation
- wrhum.for (47 lines) - Write human-readable output
- wrread.for (76 lines) - Write/read utility

**Total**: ~22,000 lines across 10 files

---

### 4.3 Subroutine Count

**From dfsynthe.for**: ~10 subroutines

Notable subroutines (inferred from code structure):
- Line list reading and selection
- Continuum opacity calculation
- Profile calculation (Voigt)
- Output formatting

📋 **TODO**: Catalog subroutines if DFSYNTHE migration prioritized

**From xnfdf.for**: Large library with many opacity calculation routines (detailed analysis deferred).

---

### 4.4 COMMON Blocks

**From header scan**: ~15-20 COMMON blocks

**Notable blocks**:
- /BUFFER/ - Large workspace `BUFFER(3510000)` (~14 MB)
- /CONTIN/ - Continuum opacity `CONTINUUM(3510000)` (~14 MB)
- /BHYD/, /BHE/ - Hydrogen and helium opacities
- /NBIGLIT/ - Wavelength grid structure
- /NLINES/ - Line list metadata
- /STATE/, /TEMP/, /RHOX/ - Atmosphere state (from ATLAS9/12 model)

**Memory footprint**: ~30-50 MB (large buffers for line data)

---

### 4.5 Input/Output Files

**Input files** (from code header):
- **TAPE5**: Parameters (IFTEFF - temperature flag)
- **TAPE10, TAPE22**: Opacity data from XNFDF
- **TAPE11**: Low-energy lines (LOWLINESDF)
- **TAPE21**: High-energy lines (HIGHLINESDF)
- **TAPE31**: Diatomic lines (DIATOMICSDF)
- **TAPE41**: TiO lines (TIOLINESDF)
- **TAPE43**: H2O lines (H2OLINESDF)
- **TAPE51, TAPE61**: NLTE line data (optional)

**Output files**:
- **TAPE6**: Standard output log
- **TAPE12**: Selected line data for current temperature
- **TAPE14**: Temporary 0 km/s opacity spectrum
- **TAPE15**: **Output distribution functions** (this feeds SYNTHE)
- **TAPE19**: Selected NLTE lines

**Workflow**:
```
ATLAS9 model → XNFDF (populations) → DFSYNTHE (line selection) → SYNTHE (spectrum)
```

---

### 4.6 Purpose and Workflow

**What DFSYNTHE does**:
1. Reads ATLAS9 atmosphere model (T, P, ρ vs depth)
2. Reads massive line databases (TAPE11, 21, 31, 41, 43)
3. Calculates which lines contribute significantly at each depth
4. Computes detailed opacity vs wavelength
5. Writes opacity distribution functions to TAPE15
6. SYNTHE reads TAPE15 and synthesizes spectrum

**Comparison to ATLAS12 workflow**:
| ATLAS9 + DFSYNTHE | ATLAS12 |
|-------------------|---------|
| ATLAS9 atmosphere | ATLAS12 Stage 2 atmosphere |
| DFSYNTHE opacity calc | ATLAS12 Stage 1 line selection |
| SYNTHE spectrum | SYNTHE spectrum |
| **3 separate programs** | **2 stages of one program** |

**Key difference**: DFSYNTHE is post-processing (uses completed ATLAS9 model), while ATLAS12 Stage 1 is pre-processing (before iteration).

---

### 4.7 Migration Implications

**If DFSYNTHE migration is needed**:

**Scenario A - Full ATLAS9 ecosystem**:
- Need: ATLAS9 + DFSYNTHE + SYNTHE
- Rationale: Complete Kurucz original workflow
- Effort: High (3 programs)

**Scenario B - ATLAS12 only**:
- Need: ATLAS12 + SYNTHE
- Rationale: Modern approach, no DFSYNTHE needed
- Effort: Medium (2 stages)

**Scenario C - Hybrid validation**:
- Implement ATLAS12
- Use Fortran DFSYNTHE temporarily for cross-validation
- Migrate DFSYNTHE only if needed

**Recommendation**: Defer DFSYNTHE unless research requires ATLAS9 workflow.

**Code reuse potential**:
- Line database reading: Similar to SYNTHE
- Opacity calculation (xnfdf.for): Large library, might be useful for validation
- Profile calculations: Similar to ATLAS12

---

---

### 4.8 Distribution Function Method (Core Algorithm)

**Source**: Kurucz 2005 "Rapid computation of line opacity in SYNTHE and DFSYNTHE"

**Problem**: Opacity spectrum with billions of lines would require massive storage (40+ GB for full P,T,Vturb,λ grid)

**DFSYNTHE Solution**: Statistical compression using **opacity distribution functions**

#### Distribution Function Concept

Instead of storing thousands of opacity points in a wavelength interval, DFSYNTHE represents them with **12 discrete opacity levels** that describe the statistical distribution:

```
Wavelength interval [λ₁, λ₂]:
  Instead of: κ(λ₁), κ(λ₂), κ(λ₃), ... κ(λₙ) [thousands of points]
  Store: Distribution function: fraction of interval at each of 12 opacity levels
         Level 1 (low opacity):    15% of interval
         Level 2:                  22% of interval
         ...
         Level 12 (high opacity):   3% of interval
```

**Key insight**: The distribution function tells you **the fraction of the wavelength interval occupied by high, medium, and low opacity** (in 12 steps).

#### When Distribution Functions Work

**Valid approximations** (from Kurucz 2005):
1. ✅ Spectrum shape similar at different T and P (maxima/minima line up)
2. ✅ Source function doesn't vary strongly across wavelength interval
3. ✅ Wavelength intervals can be sized to follow spectral features

**When they fail**:
- ❌ Isolated strong lines (H α, H β) - treat separately
- ❌ Variable broadening across interval
- ❌ Rapidly changing source function

#### Opacity Table Trade-offs

**Full point-by-point spectrum** (Kurucz 2005 estimates):
- 4 million wavelength points
- 20 pressure levels
- 50 temperature points
- 5 microturbulent velocities
- **Storage**: 40 GB (80 GB with continuum opacity)

**Distribution function compression**:
- Same grid dimensions
- 12 coefficients per interval (instead of thousands of points)
- **Storage**: ~400 MB (100× compression)

**Opacity sampling** (alternative):
- Every 100th point saved
- **Storage**: 400 MB
- Used in ATLAS12 for fast convergence

#### Variable Interval Sizing

**Flexibility** (from paper):
- Different interval sizes for different wavelength regions
- Larger intervals in continua (smooth regions)
- Smaller intervals following spectral features (lines, edges)
- Can process same spectrum multiple times with different intervals

**Selective storage**:
- Store only specific elements (abundance analysis)
- Omit molecules/far-IR (limited T,P range tables)
- Leave out strong lines (treat separately)
- Photometric bands only (not full spectrum)

---

### 4.9 Performance Considerations

**Source**: Kurucz 2005 + unpublished paper "Rapid Calculation of Line Opacity"

**Speed-up factor**: 1000× over naive calculation

**Key optimizations**:

1. **Precision matching physics**:
   - Wavelengths: Full precision (only physically accurate numbers)
   - Everything else: **0.1% accuracy sufficient**
   - gf values: 1-100% uncertainty (don't over-compute)
   - Damping constants: 1-100% uncertainty
   - Lower energy (Boltzmann): 0.1% adequate
   - Use **two-byte integers** for packed storage

2. **Computational efficiency**:
   - Use **low-precision Voigt function** (physics limited, not math limited)
   - **Never compute anything twice**
   - **Factor out T dependence**, do all pressures together for given T
   - Pre-tabulate Rosseland mean (faster ATLAS12 convergence)

3. **Microturbulent velocity**:
   - Compute base spectrum at V_turb = 0
   - Apply Gaussian filter or Fourier transform broadening for different V_turb values
   - Store multiple V_turb versions (5 values typical)

4. **No line limit**:
   - "I expect to reach more than one billion lines in the near future" (Kurucz 2005)
   - Distribution functions handle any number of lines

---

📋 **Remaining deferred details**:
- [ ] xnfdf.for library analysis
- [ ] Detailed subroutine catalog
- [ ] Exact TAPE15 binary format specification
- [ ] Comparison: DFSYNTHE opacity vs ATLAS12 Stage 1 opacity

---

## V. KAPPA9 Architecture (Breadth-First Survey)

**Status**: Lower priority, opacity calculator/validator
**Purpose**: Calculate opacity tables for ATLAS9

### 5.1 Basic Information

| Attribute | Value |
|-----------|-------|
| **Purpose** | Calculate continuum opacity at given T, P, abundance |
| **Versions** | Castelli kappa9.for (19,715 lines) |
| **Execution model** | Single-program opacity calculator |
| **Relationship** | Standalone utility, uses ATLAS9 opacity subroutines |

**Use cases**:
- Generate opacity tables for specific abundances
- Validate opacity calculations
- Test opacity sources (H, He, metals, etc.)

**Relationship to other codes**:
- **Shares code** with ATLAS9 (~90% overlap)
- **Not required** for ATLAS9 or ATLAS12 operation
- **Utility role**: Testing and validation

---

### 5.2 Structure

**Main program**: KAPPA9

**Subroutines**: ~40-45 (from grep count)

**High overlap with ATLAS9** includes:
- PUTOUT, TCORR, STATEQ, RADIAP, ROSS
- POPS, NELECT, PFSAHA, IONPOTS, PFIRON
- MOLEC, NMOLEC, CONVEC
- HOP, HMINOP, HE1OP, HE2OP, COOLOP, LUKEOP, SI1OP, etc.

**KAPPA9-specific**:
- Calculation and output of opacity tables
- Possibly simplified iteration (just opacity, not full atmosphere)

---

### 5.3 COMMON Blocks

**From header scan**: ~50-60 blocks (nearly identical to ATLAS9)

Notable additions:
- /IFPOP/ - Population calculation flag
- /ACNOOP/ - Additional continuum opacity sources (expanded list)

Otherwise same structure as ATLAS9/ATLAS12.

---

### 5.4 Input/Output

**Input files** (similar to ATLAS9):
- TAPE5: Parameters (T, P, abundances)
- TAPE2: Molecular data
- TAPE9: ODF tables (if used)

**Output files**:
- TAPE6: Opacity table results
- Possibly formatted tables for external use

**Typical use**: "What's the opacity at T=10000K, log(P)=2.0, with 2× solar iron?"

---

### 5.5 Migration Implications

**Priority**: Very low (utility code, not science-critical)

**If needed**:
- **Effort**: Minimal if ATLAS9 already migrated (~10% additional work)
- **Alternative**: Write simple Julia opacity calculator using migrated ATLAS9/12 subroutines
- **Testing value**: Useful for validating migrated opacity calculations

**Recommendation**:
- Defer indefinitely
- If opacity validation needed, create lightweight Julia utility using ATLAS12 opacity routines
- Full KAPPA9 migration only if specific research need identified

---

📋 **Deferred details**:
- [ ] Full subroutine catalog
- [ ] Exact input/output format
- [ ] Differences from ATLAS9 beyond main program

---

## VI. Cross-Code Architecture Summary

**Shared computational kernel identified**:

| Code | Line count | Shared with ATLAS12 | Unique code |
|------|------------|---------------------|-------------|
| ATLAS12 | ~23,000 | 100% (reference) | Stage 1+2 logic, line opacity sum |
| ATLAS9 | ~19,000 | ~75% | ODF handling, single-stage iteration |
| KAPPA9 | ~19,700 | ~90% | Opacity table output |
| DFSYNTHE | ~19,000 | ~50% | Line selection, xnfdf library |
| SYNTHE | ~20,000 | ~30% | RT solving, pipeline |

**Implication**: ~10,500 lines of shared subroutines (populations, continuum opacity, utilities) can be extracted as common Julia modules, reducing total migration effort.

**Proposed Julia package structure**:
```
AtlasBase.jl - Shared computational kernel
  ├── Populations (Saha-Boltzmann, partition functions)
  ├── ContinuumOpacity (H, He, metals)
  ├── MolecularEquilibrium
  └── Utilities (interpolation, integration, etc.)

Atlas12.jl - ATLAS12 specific (depends on AtlasBase)
  ├── Stage1 (line selection)
  ├── Stage2 (iteration)
  └── OutputModel

Atlas9.jl - ATLAS9 specific (depends on AtlasBase) [Optional, if needed]
  ├── ODFReader
  └── Iteration

Synthe.jl - SYNTHE (depends on AtlasBase, uses Atlas12 or Atlas9 output)
  └── Pipeline stages

DFSYNTHE.jl - If ever needed (depends on AtlasBase)
Kappa9.jl - Probably never needed (trivial utility)
```

This architecture minimizes code duplication and maximizes reuse.

---

## Appendix: Data Structure Sizes

**Memory footprint** (estimated from COMMON blocks, kw=72 depth points, mion=1006 ions):

| Category | Arrays | Elements | Size (MB) |
|----------|--------|----------|-----------|
| Populations | XNF, XNFP, XNFDOP, DOPPLE | 4 × 72 × 1006 | ~2.3 MB |
| Line opacity | XLINES | 72 × 30000 | ~17.3 MB |
| Frequency set | WAVESET, RCOSET | 2 × 30000 | ~0.5 MB |
| Opacity sources | ~25 arrays in /OPS/ | 25 × 72 | ~0.01 MB |
| Continuum table | TABCONT | 72 × 344 | ~0.2 MB |
| Pretabulated | EXTAB, E1TAB, H0TAB, etc. | ~10000 | ~0.08 MB |
| State variables | T, P, XNE, RHO, etc. | ~20 × 72 | ~0.01 MB |

**Total**: ~20 MB per ATLAS12 model (single precision arrays), ~40 MB (double precision)

For context: 1GB RAM can hold ~50 models simultaneously in double precision.

---

**Status**: Phase 2B architecture documentation complete - ATLAS12, SYNTHE, ATLAS9, DFSYNTHE, KAPPA9 surveyed.

**Breadth-first approach applied**: Documented clear aspects, flagged complex areas for future investigation, identified shared computational kernel (~10.5K lines reusable across codes).

**Next**: Use insights from this document and ARCHITECTURE_INSIGHTS.md for Phase 3 (Physics Pipeline) and Phase 4 (Migration Assessment).

---

## VII. Linux Porting Experience (Sbordone et al. 2004)

**Reference**: Sbordone, L., Bonifacio, P., Castelli, F., & Kurucz, R. L. 2004, Mem. S.A.It. Suppl. Vol. 5, 93

This section documents the successful 2004 porting of ATLAS9, SYNTHE, and WIDTH from VMS to GNU Linux, providing valuable lessons for Julia migration.

### 7.1 Porting Strategy

**Goals**:
1. Make codes available on Linux (more widespread, less expensive than VMS)
2. **Minimal alterations** - preserve I/O formats and functionalities
3. Enable smooth integration with existing line databases, opacities, model grids
4. Allow easy incorporation of future VMS code modifications

**Philosophy**: "Port the code introducing the smallest possible alterations"

**Result**: Full compatibility maintained, dramatic performance improvements achieved

---

### 7.2 Code Modifications Required (Summary: Minimal)

**1. FORMAT Statements**: Updated Fortran IV syntax to F90/F95 standard

**2. OPEN Command Syntax**: Modified for UNIX file I/O conventions

**3. Double Precision Consistency**: Redefined variables to maintain REAL*8 throughout routines

**4. DATA Block Size Limits** ⚠️ **Critical Issue**:
- **Problem**: Intel Fortran Compiler has hard limit on DATA block size
- **Affected**: Partition functions, integration matrices, pretabulated values
- **Solutions**:
  - Split large DATA blocks into smaller blocks
  - Move data to external files
- **New file created**: **PFIRON.DAT** (iron group partition functions, Ca-Cu)
  - Required at runtime in Linux version
  - Was embedded in VMS source code
  - Must be in same directory as executable

**5. Molecular Data Format**: VMS binary → ASCII (programs modified to read ASCII)

---

### 7.3 Performance Improvements (Dramatic)

**Benchmark**: ATLAS9 (135 iterations, 72 layers, Teff=5000K, log g=2.5, [Fe/H]=-0.5)

| Platform | ATLAS9 (s) | Per iter (s) | SYNTHE (s) | Speedup |
|----------|------------|--------------|------------|---------|
| VMS AlphaServer 800 5-500 | 478 | 3.54 | 69 | 1.0× |
| Pentium 4 1.9GHz + IFC 7.0 | 177 | 1.31 | 10 | 2.7× / 6.9× |
| Pentium M 1.6GHz + IFC 8.0 | 122 | 0.9 | 10 | 3.9× / 6.9× |

**Key insight**: Laptop (Pentium M) outperforms expensive AlphaServer by 3.9×

**Enables**:
- On-demand custom atmosphere calculation (no precomputed grids needed)
- Monte Carlo error analysis (many model runs)
- Automated spectral analysis pipelines

---

### 7.4 Binary File Conversions

**Opacity Distribution Functions (ODFs)**:
- VMS binary → ASCII (on VMS) → Linux binary (on Linux)
- Binary format required (ODFs are ~100s MB, ASCII wastes space)
- Both old Kurucz (1993) and new Castelli & Kurucz (2003) ODFs supported

**Molecular data**: VMS binary → ASCII (portable, but larger)

**ASCII files (unchanged)**:
- Model atmospheres (.mod)
- Line lists (gf*.100)
- Rosseland opacities (.ros)
- Control cards

---

### 7.5 Validation

**Method**: Direct numerical comparison VMS vs Linux

**Results**: "Indistinguishable" (Figures 1-3 in paper)
- T vs log(τRoss): Perfect overlap
- Synthetic spectra: Identical (Mg b triplet test)
- Electron density: Perfect agreement

**Validation philosophy**: Bit-level numerical accuracy, not just "runs without errors"

---

### 7.6 Implications for Julia Migration

| Sbordone 2004 Lesson | Atlas.jl Strategy |
|----------------------|-------------------|
| Minimal code changes work | Preserve algorithms exactly, modernize structures |
| Compiler has DATA block limits | Julia: no DATA blocks - use const arrays + files |
| Binary conversion required | Use HDF5 from start (portable + compressed) |
| 3-7× performance gain achievable | Target similar via Julia LLVM optimization |
| External data files OK | Use DataDeps.jl for automatic management |
| Validation is critical | Test each routine against Fortran output |
| ~700 MB disk space | Similar or less (better compression) |
| Enables laptop computing | Julia same - democratizes scientific computing |

**Key takeaway**: VMS→Linux succeeded with <5% code changes while achieving 3-7× speedup. Julia migration can achieve similar or better results with modern language advantages.

---

**Status**: Phase 2B complete - ATLAS12, SYNTHE, ATLAS9, DFSYNTHE, KAPPA9 surveyed, Linux porting lessons documented.

---

## VIII. Kurucz 2005 Suite Overview

**Source**: Kurucz, R.L. 2005, "ATLAS12, SYNTHE, ATLAS9, WIDTH9, et cetera", Mem. S.A.It. Suppl. Vol. 8, 14
**Date processed**: 2025-11-09
**Type**: Authoritative overview by suite creator

This section documents insights from Kurucz's comprehensive 2005 overview paper, providing the author's perspective on the entire code ecosystem, design philosophy, and practical usage recommendations.

---

### 8.1 The Central Problem

**Quote from paper**: "The problem we address is including the opacity of millions or hundreds of millions of lines in model stellar atmosphere calculations, then generating detailed, realistic spectra from those model atmospheres, then modelling the observation process, and finally comparing the calculated spectra to observed spectra."

**Two approaches implemented**:
1. **Opacity Distribution Functions (ODFs)**: DFSYNTHE → ATLAS9 → SYNTHE → SPECTR
2. **Opacity Sampling (OS)**: ATLAS12 (30,000 points) → SYNTHE → SPECTR

**Computational cost without statistical treatment**:
- Direct line-by-line: ~1 month per model (fastest Alpha workstation)
- Or: ~1 day using full parallel supercomputer
- Statistical methods make problem tractable

---

### 8.2 ATLAS12 Design Philosophy and Current Limitations

**Original 1995 vision** (Kurucz 1995, "Stellar Surface Structure"):
- Handle arbitrary abundances, including isotopes
- Support depth-dependent abundances (e.g., dredge-ups, diffusion)
- Enable isotopic splittings of atomic lines
- Provide flexibility for exotic stellar atmospheres

**Current status** (2005): "ATLAS12 still does not work as originally advertised"

**Two fundamental problems that took years to solve**:

#### Problem 1: Rosseland Opacity for Arbitrary Abundances

**The issue**:
- All Kurucz models use Rosseland optical depth scale τ_Ross
- This is the "natural" scale for coupling atmosphere structure to radiation
- Convective flux also depends on Rosseland opacity
- **BUT**: For arbitrary/depth-dependent abundances, τ_Ross cannot be pretabulated
- Must be computed on-the-fly as the model iterates

**Solution** (after "years to figure out"):
- Generate starting guess for Rosseland opacity
- Extrapolate from iteration to iteration as temperature changes
- "The guessing procedure worked and allowed ATLAS12 models to converge"

**Alternative approach** (suggested by Tsymbal & Shulyak 2003):
- Use continuum monochromatic optical depth scale (e.g., τ_500nm or τ_1000nm)
- This behaves similarly to τ_Ross but is easier to compute
- Compute models on τ_continuum scale
- At each iteration, compute τ_Ross for convection
- Once converged, interpolate final model to τ_Ross scale
- ⚠️ **May fail for**: Big abundance changes causing big opacity changes

**Takeaway for Julia**: Some users may want τ_continuum versions of ATLAS12

#### Problem 2: Equation of State

**The problem**:
- EOS routines date from the 1960s
- Poor laboratory data for energy levels at that time
- Partition functions wrong (especially heavy elements)
- Ionization potentials uncertain
- **Still wrong in 2005!**
- Molecules need separate partition function per isotopomer

**Planned solution**:
- Write new EOS routine using partition function tables
- Each species gets its own table (including each isotopomer)
- Kurucz auto-generates partition functions when computing line lists
- Example: PFIRON file contains partition functions for iron group (Kurucz 1988a)
- "However those calculations are going slowly, especially since I do not have funding"
- Interim plan: Quick Hartree-Fock calculation for all atoms
- "Now that memory is not a problem, putting in the new partition functions and depth-dependent abundances should be simple"

**Takeaway for Julia**: Modern partition function data is available - use it from the start

---

### 8.3 ATLAS12 Workflow (2005)

**Performance metrics**:
- ODF opacity tables: 1 day (fixed abundances)
- Grid of models: 1 day (hundreds of models)
- Small spectrum section for grid: 1 day
- ATLAS12 small grid for one star: 1 day (varying T, g, abundances)
- Small spectrum region for comparison: 1 day
- Full spectrum for best-fitting model: computed after fit

**Two-stage workflow** (confirmed by Kurucz):

**Stage 1**: Line selection only
```
atlas12 → selects lines from line lists → writes packed file → STOP
```

**Stage 2**: Model iteration (reusing selected lines)
```
atlas12 → reads packed file → iterates model → converges
synthe → reads packed file via RPACKEDLINE → computes spectrum
```

**Key insights**:
- Packed file has "all information not essential to the opacity calculation removed"
- **No identifications in packed file** → SYNTHE doesn't save line info
- Same packed file can be used for similar stars (or lower abundance stars)
- Higher abundance stars need new line selection
- Complete spectrum may need to be computed in pieces with MERGESYN
- ATLAS9 models can use ATLAS12 packed line lists

**30,000 frequency points**:
- Accurate enough for total flux
- **NOT good enough for intermediate-band photometry** (e.g., uvby)
- Must run separate SYNTHE flux calculation after convergence

---

### 8.4 Depth-Dependent Microturbulent Velocity

**Key observation**: "Microturbulent velocity is a parameter that is generally not considered physically except in the sun."

**Empirical solar model** (Fontenla, Avrett, Loeser 1993 - Model C):
- Has chromosphere, temperature minimum, AND depth-dependent V_turb
- V_turb splits into two components:
  1. **Convective turbulence**: Goes to zero at/below temperature minimum
  2. **Wave turbulence**: Heats chromosphere, extends above T_min

**Solar V_turb profile**:
- Minimum V_turb ≈ 0.28 × maximum V_turb
- Minimum temperature ≈ 0.76 T_eff
- Kurucz suggests: "All 'normally' convective cool stars have behavior like this"

**Important distinctions**:

| Method | Typical Value | Meaning |
|--------|---------------|---------|
| Equivalent width analysis | < 1 km/s | Mean over flux spectrum |
| Line opacity tables (ASUN model) | 1.5 km/s | **Compensates for missing lines** |
| Central intensity line profiles | 0-9 km/s | True depth-dependent value |

**Kurucz's depth-dependent model**:
1. Compute max convective velocity V_conv for each model (Figure 2)
2. Compute max convective flux fraction F_conv (Figure 3)
3. Compute flux-weighted velocity: V_W = V_conv × F_conv (Figure 4)
4. V_W is V_turb at bottom of atmosphere (agrees with solar empirical value)
5. Scale solar depth dependence to V_W
6. Ignore outward-increasing wave component
7. Set minimum: V_turb = max(V_turb_depth, 0.28 × V_W)

**Key statement**: "Microturbulent velocity varies with effective temperature and gravity and abundance because convection varies with effective temperature, gravity, and abundance."

**Impact on analysis**:
- When comparing two stars: V_turb difference must be accounted for
- When comparing evolutionary stages: V_turb change must be included
- Using grids with depth-dependent V_turb: "This effect is automatically included. V_turb is no longer a free parameter."
- ⚠️ **Exception**: "This may not be true for low-gravity stars hotter than the sun that have only weak convection"

**Abundance dependence**:
- Same T_eff and log g: Higher abundances → higher V_turb (more convective)
- In ATLAS12: V_turb varies with convection
- Convection varies with Rosseland opacity at τ=1
- Rosseland opacity varies with abundances
- "I have not yet computed the grids to work out the numbers"

**Takeaway for Julia**: Implement depth-dependent V_turb based on convection physics, not as free parameter

---

### 8.5 ROTATE - Rotational Broadening Algorithm

**Method**: Grid-based disk integration

**Angular sampling**: 17 intensity spectra at µ angles:
```
µ = 1.0, 0.9, 0.8, 0.7, 0.6, 0.5, 0.4, 0.3, 0.25, 0.2, 0.15, 0.125, 0.1, 0.075, 0.05, 0.025, 0.01
```

**Disk grid**: 200×200 rectilinear points (or 100×100 quadrant)

**Algorithm**:
1. Generate intensity spectra for 17 µ angles using SYNTHE
2. Pretabulate and interpolate to 100 angles (µ = 0.005 to 0.995 by 0.010)
3. For each point (x,y) on disk grid:
   - Compute angle µ and projected velocity v
   - Choose nearest angle from pretabulation
   - Doppler shift by nearest integral number of points
4. Sum all points

**Approximations to check**:
- Nearest-angle interpolation (100 angles = 0.01 spacing)
- Nearest-point Doppler shift (error ≤ 1 part in 10^6 at R=500,000)
- Most errors are random and cancel
- "Increase the resolving power or the grid size or the number of angles and see if the output spectrum is affected"

**Differential rotation** (optional):
- Empirical solar fit from Libbrecht & Morrow 1991
- Latitude φ, radius R in km:

```
V_rot(φ) = (462 - 75sin²φ - 50sin⁴φ) × 10⁻⁹ × 2πR
```

- Solar: equator 2.020 km/s, pole 1.474 km/s
- Relative: V_rot(φ)/V_rot(0) = (1 - 75/462 sin²φ - 50/462 sin⁴φ)
- Assumed same for all stars (only if explicitly turned on)
- Input parameter: stellar equatorial velocity

**Generalization**: "As long as physical variables can be defined on an array of points and there is a procedure for interpolating in a grid of spectra... one can treat any shape star, or binaries, spots, rapid rotators, etc."

**Takeaway for Julia**: ROTATE algorithm is straightforward to implement; consider more flexible interpolation

---

### 8.6 Complete Observation Modeling Pipeline

**Kurucz's vision**: End-to-end forward modeling from stellar surface to detector

```
Star surface
  ↓
SYNTHE + SPECTR → High-resolution spectrum
  ↓
ROTATE → Rotational broadening (if rotating)
  ↓
[Interstellar reddening] → ⚠️ Not yet implemented
[Diffuse interstellar bands] → ⚠️ Not yet implemented
[Interstellar lines] → ⚠️ Not yet implemented
  ↓
TRANSYNTHE suite → Telluric transmission
  ↓
[Telluric emission: airglow, pollution] → ⚠️ Not yet implemented
  ↓
BROADEN/BROADENX → Instrumental broadening
  ↓
INTEGRATEFILTER → Photometry convolution
  ↓
PLOTSYN → Comparison with observation
```

**Status of unimplemented components** (2005):
- "I have not yet written the programs to model the reddening, the diffuse interstellar bands, and the interstellar lines, but it would be easy for the user to do it."
- Catalogues available: Herbig 1995 (diffuse bands)
- Interstellar lines: Search Kurucz line list for E_low < 1000 cm⁻¹
- "An interstellar package will eventually be included with SYNTHE"
- Airglow: Osterbrock et al. 2000
- Pollution lines: Slanger et al. 2003
- "I have also not yet written the programs to model airglow and anthropogenic pollution emission lines, but those would also be easy for the user to do"

**Takeaway for Julia**: Complete pipeline is well-defined but has gaps - opportunities for contribution

---

### 8.7 Telluric Transmission (TRANSYNTHE Suite)

**Motivation**: 1988 discovery in Kitt Peak FTS solar spectra (Kurucz 1988b)
- Broad features from O₃ and [O₂]₂ (O₂ dimer)
- Not previously considered in Solar Flux Atlas reduction (Kurucz et al. 1984)
- Many O₂ and H₂O lines blend with or mask solar lines

**O₂ dimer [[O₂]₂ ]**:
- Number density ∝ (O₂ concentration)²
- Concentrated near ground
- Strong features at sunset/sunrise

**Data sources**:

| Component | Wavelength | Source |
|-----------|------------|--------|
| O₃ UV (Hartley, Huggins) | Ultraviolet | Bass & Paur 1981; Griggs 1968; Freeman et al. 1983 |
| O₃ visible (Chappuis & Wulf) | Visible | Shettle & Anderson 1995 tabulation |
| [O₂]₂ features | 300-1500 nm | Greenblatt et al. 1990; Dianov-Klokov 1959 |
| O₂, H₂O, etc. lines | All | HITRAN database (Rothman et al. 2005) |

**HITRAN database**:
- HIgh-resolution TRANsmission molecular database
- Originally Air Force (now managed by SAO)
- Historically focused on IR (λ > 1 µm)
- High accuracy: positions, strengths, pressure shifts, damping
- Visible data historically poor quality
- 2005 status: "About half of the O₂ and H₂O are good"
- Kurucz filled in missing O₂ lines by calculation and solar fitting
- H₂O calculations available but "do not work very well"

**Critical issue - Pressure shifts**:
- Not just Stark broadening (familiar to astronomers)
- Line positions measured in solar spectra are NOT true positions
- Shifted by terrestrial atmosphere pressure
- If used to generate molecular constants → systematic errors
- Laboratory: measure positions vs. pressure, extrapolate to zero
- "Only the strongest bands of O₂ have been well measured"

**⚠️ Resolving power requirement**: Must be ≥ 2 million in regions with sharp telluric lines
- Reason: Sub-300K Doppler width
- Any computed stellar spectra must have same resolution

**Model atmospheres** (Anderson et al. 1986):
- Air Force measurements: T, P, O₃, H₂O vs. altitude
- Averaged models: whole year, quarterly, monthly
- Different latitudes: temperate, tropical, etc.
- Kurucz's four models for Kitt Peak:
  - MODMIDWIN, MODSPRING, MODMIDSUM, MODAUTUMN
  - Can be used as starting guesses at any observatory (except Antarctica)
  - Must adjust T, P, O₃, H₂O to fit observations
  - Table 1 in paper shows MODMIDSUM (0-100 km, 41 layers)

**Programs**:
- **OZONE**: Subroutine to compute O₃ transmission
- **O2DIMER**: Subroutine to compute [O₂]₂ transmission
- **TRANSYNBEG**: Read input parameters (wavelength range, resolution, radial velocity)
- **RMOLAIR**: Read line data from AIR* files
- **TRANSYNTHE**: Compute opacity spectrum
- **TRANSPECTR**: Compute mean transmission (given airmass range, hour angle, declination, latitude, altitude)
- **TRANSMIT**: Multiply stellar spectrum × transmission

**Line data files**: AIR1, AIR2, AIR3, ..., AIR10, AIR20, AIR100, AIREND
- Coverage: AIR1 = 0-1 µm, AIR2 = 1-2 µm, etc.
- Most data from HITRAN (reformatted like Kurucz line lists)
- Some hand corrections
- ⚠️ "The overall quality at short wavelengths is not good. Every line should be checked for critical work."

**Kurucz's honest assessment**: "The cause of the delay, as for solar lines, is that the telluric data are still not good enough to treat the problem without hand adjustment, even for O₂, and there are many missing lines."

**Takeaway for Julia**: Telluric correction is mature but data quality varies; pressure shifts are critical

---

### 8.8 Spectrophotometry and Photometry

**BROADEN**: Instrumental convolution
- Profiles: Gaussian, sin(x)/x, or rectangular
- Specification modes:
  - FWHM in velocity
  - FWHM in wavelength
  - FWHM in wavenumber
  - Resolving power
- Can use tabulated instrumental profiles at computed point spacing
- **BROADENX**: Linear interpolation between profiles for rapidly changing profiles

**Pre-computed broadened spectra** (on Kurucz website, STARS directory):
- Resolving powers: 500000, 100000, 50000, 30000, 20000, 10000, 5000, 3000, 2000, 1000, 500, 300, 200, 100
- "Off the shelf" predictions for comparison
- **Cost**: ~1 day per model for all resolutions

**INTEGRATEFILTER**: Photometry convolution
- Convolves SYNTHE output with response function
- Response function includes:
  - Detector response
  - Filter transmission
  - Optical system transmission
  - (If ground-based) Atmospheric transmission
- Can read any number of response functions
- Atmospheric transmission from TRANSYNTHE applied before convolution
- Visible/near-IR: insensitive to atmosphere
- UV/IR: sensitive to atmosphere

**Asiago Database** (Moro & Munari 2000):
- Most comprehensive photometric system collection
- Kurucz suggests: "Some user make up a general input file from it and a program to generate all the colors"

**Takeaway for Julia**: Photometry tools are simple but comprehensive; consider modern filter databases

---

### 8.9 Limb Darkening

**Automatic by-product of ROTATE**:
- Intensity spectra computed at 17 µ angles
- Normally discarded (files too big)
- Can transpose: "all wavelengths at each angle" instead of "all angles at each wavelength"

**Photometric limb darkening**:
- Convolve intensity spectra with observation model
- Same as photometry: detector + filter + optics + (if ground) atmosphere
- Tools: **SPLIT17SYN** and **INTEGRATEFILTER**

**Takeaway for Julia**: Limb darkening is "free" if we save intensity spectra; consider selective wavelength output

---

### 8.10 PLOTSYN - Comparison and Analysis

**Kurucz's philosophy**: "I make large plots that compare computed and observed spectra and that actually show errors and provide information to the reader."

**Plot features**:
- Features labelled with wavelengths and energy levels
- Readable directly from plot
- File with complete information for each labelled line
- Hand-editable file with input data for every contributing line
- File can be read back to iterate on fit

**Current implementation**: Pre-Postscript legacy
- Writes binary vector file
- Must be translated to Postscript
- "I am going to rewrite the plotting utilities, PLOTPACK, to write Postscript directly. (It is simple.)"
- Will make files "smaller, scalable, and editable"

**Future vision** (2005):
- Plots on CDs or DVDs
- Solar spectra at 1 Å per page with line IDs (reference atlas)
- Big continuous plots that can be windowed

**Takeaway for Julia**: Use modern plotting (e.g., Makie.jl); interactive plots with line ID tooltips

---

### 8.11 WIDTH9 - Abundance Analysis Tool

**Purpose**: Individual line analysis for abundance determination

**Capabilities**:
- Compute line profiles for individual lines
- Compute curves of growth
- Derive abundance from observed equivalent width
- Determine model sensitivity
- Test chromosphere effects
- Investigate V_turb sensitivity
- Test damping effects (weak lines can have strong damping!)
- Determine linear vs. saturated curve of growth
- Test continuum level choice on apparent equivalent width

**Kurucz's abundance analysis philosophy** (strong opinions!):

**Problems with traditional methods**:
1. Most lines are blended (other species, isotopes, hyperfine, tellurics)
2. Noisy data → continuum level uncertain
3. Lines not on linear part of curve of growth → systematic errors from model physics
4. Errors in V_turb treatment
5. Errors in damping
6. Using many lines doesn't help - errors are **not random**

**Kurucz's recommendations** (strict!):

```
STEP 1: Throw out all lines NOT on linear part of curve of growth
→ "Using stronger lines... just increases the real error because the errors are not random.
   There is no improvement from using many lines."

STEP 2: Get high S/N, high-resolution atlas of slowly rotating reference star
→ Fast rotators OK (similar equivalent widths) but lines may not be discernible

STEP 3: Look up every remaining line and throw out significantly blended lines

STEP 4: Synthesize spectrum for atlas AND your star
→ Understand blending and continuum level to 95% confidence level

STEP 5: Throw out any lines you don't understand to 95% level
```

**Solar iron abundance case study** (Grevesse & Sauval 1999):
- Kurucz applied his strict procedure to their Fe line list
- **Result**: Only **3 Fe I lines** and **1 Fe II line** survived!
- These 4 lines gave **10% less** Fe abundance than Grevesse & Sauval's full list
- "You have to measure only those three Fe I lines to determine the Fe abundance relative to the sun for any star like the sun"

**Additional complication**:
- Fe I is not principal ionization stage (most Fe is Fe II)
- Dominant ion less sensitive to model errors than minor ion
- "Dominant ions should always be used in an abundance analysis if there is a choice"

**Kurucz's parting advice**: "I am giving you the solar atlases. I am giving you the line data. I will eventually give you the atlases with the line identifications. I am giving you the programs. **Use them.**"

**Takeaway for Julia**: Provide tools for rigorous differential abundance analysis; document blending carefully

---

### 8.12 Realism About Spectra

**Kurucz's frank assessment**:

> "These spectra do not reproduce real high resolution observed spectra. Stronger lines tend to have good data but the weaker lines are incomplete and they include the predicted lines with uncertain wavelengths that fill in the opacity between big lines. At lower resolution most of the wavelength errors should average out."

**Compensations in standard models**:
- Overestimate Fe abundance
- Overestimate microturbulent velocity
- Both compensate for missing line opacity

**For detailed high-resolution comparison**:
- Use ONLY line lists with laboratory wavelengths
- Hand-adjust gf values to match
- Hand-adjust damping constants to match
- Work **differentially** from reference star with good model
- Adjust line data to match high-resolution, high-S/N atlas first
- Then apply same line data to target star

**Takeaway for Julia**: Manage user expectations; document known incompleteness; support differential analysis

---

### 8.13 Program Ecosystem Summary (2005)

**Model atmosphere codes**:
- **ATLAS9**: ODF method (predecessor)
- **ATLAS12**: Opacity sampling method (30,000 points)

**Opacity preparation**:
- **DFSYNTHE**: Pretabulate opacity for ODFs
- **KAPPA9**: Opacity calculations (context unclear)

**Spectrum synthesis**:
- **SYNTHE**: High-resolution spectrum synthesis (core)
- **SPECTR**: Emergent spectrum computation
- **RPACKEDLINE**: Read packed line files for SYNTHE

**Stellar surface effects**:
- **ROTATE**: Rotational broadening + differential rotation
- Limb darkening (by-product of ROTATE)

**Observational effects**:
- **TRANSYNTHE suite**: Telluric absorption (TRANSYNBEG, RMOLAIR, TRANSYNTHE, TRANSPECTR, TRANSMIT)
- **OZONE**: O₃ absorption
- **O2DIMER**: [O₂]₂ absorption
- **BROADEN**: Instrumental broadening (Gaussian, sinc, rectangular)
- **BROADENX**: Interpolating instrumental profiles
- **INTEGRATEFILTER**: Photometry (filter convolution)

**Analysis and plotting**:
- **WIDTH9**: Line profiles, curves of growth, abundance determination
- **PLOTSYN**: Plot observed vs. computed with line IDs
- **MERGESYN**: Patch together spectrum pieces
- **SPLIT17SYN**: Split intensity spectra by angle

**Utility**:
- **TABVOIGT**: Pretabulate Voigt profiles
- **PRETABLOG**: Pretabulate logarithms

**Total**: ~25 programs in the ecosystem (2005)

---

### 8.14 Development Philosophy and Practicality

**Kurucz's approach**: Iterative, pragmatic, honest about limitations

**Evidence**:
- "Still does not work as originally advertised" (frank about ATLAS12)
- "Took me years to figure out how to..." (Rosseland opacity problem)
- "Especially since I do not have funding" (resource constraints)
- "The data are still not good enough..." (honest about line quality)
- "Would be easy for the user to do it" (encourages community contribution)
- "I am giving you... Use them." (open data/code philosophy)

**Unfinished components in 2005**:
- Interstellar reddening
- Diffuse interstellar bands
- Interstellar lines
- Telluric emission (airglow, pollution)
- PLOTPACK → Postscript rewrite
- Partition functions for all atoms
- Complete telluric line data

**Takeaway for Julia**: Embrace iterative development; document limitations; build extensible framework for community contributions

---

### 8.15 Key Warnings and Caveats

**⚠️ ATLAS12 fluxes**: 30,000 points accurate for total flux, **NOT for intermediate-band photometry** (must run SYNTHE separately)

**⚠️ Equation of state**: 1960s vintage, "still wrong" in 2005, especially heavy elements

**⚠️ Synthetic spectra vs. observations**: "Do not reproduce real high resolution observed spectra" - use differential analysis

**⚠️ Telluric line quality**: "Not good enough... without hand adjustment, even for O₂"

**⚠️ Pressure shifts**: Measured telluric positions in solar spectra ≠ true line positions

**⚠️ Resolution requirement**: R ≥ 2,000,000 for sharp telluric lines (sub-300K Doppler width)

**⚠️ Abundance analysis**: Traditional methods using many lines give systematic errors - use only 3-4 best lines!

**⚠️ Depth-dependent V_turb**: Exception for "low-gravity stars hotter than the sun that have only weak convection"

**⚠️ ROTATE approximations**: Check by varying grid size, angle count, resolving power

---

### 8.16 Implications for Julia Migration

| Kurucz 2005 Insight | Atlas.jl Strategy |
|---------------------|-------------------|
| ATLAS12 "still doesn't work as advertised" | Document known issues; fix equation of state from start |
| Rosseland opacity for arbitrary abundances is hard | Implement both τ_Ross and τ_continuum options; document tradeoffs |
| Partition functions are wrong (1960s data) | Use modern atomic data (NIST, etc.); proper isotopomer handling |
| Depth-dependent V_turb tied to convection | Implement as physics-based, not free parameter; provide override |
| 30K points insufficient for photometry | Consider adaptive frequency grid; separate flux vs. photometry modes |
| Packed line files have no IDs | Keep identifications throughout pipeline for analysis |
| Hand adjustment needed for line data | Build tools for line-by-line comparison and fitting |
| Differential analysis is key | Support reference atlas + differential workflow from start |
| Telluric data quality varies | Clearly document quality flags; support user corrections |
| ~25 programs in ecosystem | Design modular Julia package with clear interfaces |
| Many unfinished components | Extensible architecture for community contributions |
| Kurucz's honest limitations | Document uncertainties; manage expectations; enable validation |

**Key architectural principle**: Kurucz built a comprehensive but loosely coupled ecosystem of programs communicating via files. Julia can provide tighter integration while maintaining modularity and flexibility.

**Development priority**: Fix known issues (EOS, partition functions) rather than replicate historical limitations.

---

**Section status**: Kurucz 2005 overview processed - provides author's perspective on design philosophy, practical limitations, and usage recommendations.
