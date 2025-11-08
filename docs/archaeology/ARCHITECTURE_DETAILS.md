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

**Status**: SYNTHE pipeline survey complete (breadth-first approach)

**Coverage**:
- ✅ All 11 programs cataloged with purpose, I/O, complexity
- ✅ Data flow mapped end-to-end
- ✅ Migration strategies outlined
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

**Status**: Phase 2B initial architecture documentation complete. Further detail will be added iteratively.

**Next**: Commit this document and continue with call-chain diagrams and COMMON block details.
