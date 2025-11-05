# Initial Dependency Map
*Task 1.5 - Subroutine Calls and Data Sharing Analysis*

**Generated**: 2025-11-04
**Programs Analyzed**: 8 key computational engines

---

## Executive Summary

The ATLAS Suite uses a **procedural programming model** with:
- **Extensive subroutine decomposition**: 50-80 subroutine calls per major program
- **Heavy COMMON block usage**: 15-57 shared data structures per program
- **No external libraries**: All code is self-contained Fortran

**Architecture Pattern**: Large main programs orchestrate 50-80 computational subroutines, sharing data globally via COMMON blocks rather than passing arguments.

---

## Dependency Analysis by Program

### ATLAS12 (Stellar Atmosphere with Molecules & NLTE)

**Complexity**: Very High (70-80 subroutine calls, 56-57 COMMON blocks)

#### Castelli ATLAS12 (23,247 lines)
- **Subroutine calls**: 72 unique
- **COMMON blocks**: 57 unique
- **Architecture**: Monolithic main program + 72 helper subroutines

#### Kurucz ATLAS12 (22,152 lines)
- **Subroutine calls**: 78 unique
- **COMMON blocks**: 56 unique
- **Differences**: +6 subroutines (BEGTIME, ENDTIME, PRELINOP, etc.)

#### Key Subroutine Categories (ATLAS12):

**Initialization**:
- `READIN` - Read input parameters
- `IONPOTS` - Initialize ionization potentials
- `ISOTOPES` - Handle isotopic abundances
- `TABVOIGT` - Pre-tabulate Voigt profiles
- `PRETABLOG` - Pre-tabulate logarithms

**Population Calculations**:
- `POPS` - Calculate atomic level populations
- `POPSALL` - Calculate all populations (NLTE)
- `ENERGYDENSITY` - Compute radiation energy density

**Opacity**:
- `KAPCONT` - Continuum opacity
- `SELECTLINES` - Select relevant spectral lines
- `LINOP1` / `LINOP` - Line opacity calculations
- `XLINOP` - Explicit line opacity
- `KAPP` - Total opacity

**Radiative Transfer**:
- `RADIAP` - Radiative equilibrium
- `ROSS` - Rosseland mean opacity
- `TCORR` - Temperature correction
- `STATEQ` - Statistical equilibrium (NLTE)

**Output**:
- `PUTOUT` - Write results
- `W` - Formatted write utility
- `EXIT` - Program termination

#### Critical COMMON Blocks (ATLAS12):

**Abundance & Composition**:
- `/ABROSS/` - Rosseland abundance data
- `/ABTOT/` - Total abundances
- `/ELEM/` - Element information
- `/ISOTOPES/` - Isotopic data

**Physical State**:
- `/EDENS/` - Electron density
- `/DEPART/` - NLTE departure coefficients
- `/FLUX/` - Radiation flux
- `/TEMPERATURE/` - Temperature structure

**Opacity Data**:
- `/EXTAB/` - Extinction coefficient tables
- `/H1TAB/` - Hydrogen tables
- `/LINDAT/` - Line data

**Control**:
- `/CONV/` - Convergence criteria
- `/FILENAME/` - I/O filenames

---

### ATLAS9 (Standard Stellar Atmosphere)

**Complexity**: High (61-66 subroutine calls, 46-49 COMMON blocks)

#### Castelli ATLAS9mem (19,763 lines)
- **Subroutine calls**: 61 unique
- **COMMON blocks**: 49 unique

#### Kurucz ATLAS9 (18,725 lines)
- **Subroutine calls**: 66 unique
- **COMMON blocks**: 46 unique
- **Differences**: +5 subroutines (ABORT, etc.)

#### Key Subroutine Categories (ATLAS9):

**Core Calculation** (Shared with ATLAS12):
- `READIN`, `POPS`, `PFSAHA`, `PUTOUT`
- `ROSS`, `RADIAP`, `TCORR`, `STATEQ`
- `KAPP`, `W`, `EXIT`

**Line Opacity**:
- `LINOP` - Line opacity (simpler than ATLAS12's LINOP1/SELECTLINES)
- `HIGH` - High-opacity lines

**Convection**:
- `CONVEC` - Convective transport
- `TURB` - Turbulent velocities

**Integration**:
- `DERIV` - Derivatives
- `INTEG` - Integration
- `TTAUP` - Tau integration
- `SOLVIT` - Equation solver
- `JOSH` - (Purpose TBD)

#### ATLAS9 vs ATLAS12 Key Differences:

| Feature | ATLAS9 | ATLAS12 |
|---------|--------|---------|
| Lines of code | ~19K | ~23K |
| Subroutines | 61-66 | 72-78 |
| Molecules | No | Yes |
| NLTE | Limited | Full (POPSALL, STATEQ) |
| Line selection | Simple (HIGH) | Advanced (SELECTLINES) |
| Opacity | LINOP | LINOP1/XLINOP |

**Implication**: ATLAS12 is ATLAS9 + molecular opacity + improved NLTE + better line handling.

---

### SYNTHE (Synthetic Spectrum Synthesis)

**Complexity**: Low (7 subroutine calls, 15 COMMON blocks)

#### Both Versions Identical
- **Subroutine calls**: 7 unique (same in Castelli and Kurucz)
- **COMMON blocks**: 15 unique (same structure)
- **Lines**: Castelli 2,993 / Kurucz 2,985 (nearly identical)

#### Subroutine List (SYNTHE):

**Spectrum Calculation**:
- `TABVOIGT` - Pre-tabulate Voigt profiles
- `XLINOP` - Calculate line opacity for synthesis
- `MAP1` - Map opacity to frequency grid
- `INTEG` - Integration
- `PARCOE` - Parse coefficients

**I/O**:
- `READBCS` - Read boundary conditions (from ATLAS model)
- `EXIT` - Terminate

#### Architecture Insight:

SYNTHE is **much simpler** than ATLAS9/12 because:
1. **No atmosphere calculation**: Reads pre-computed ATLAS models
2. **No population solver**: Uses populations from ATLAS
3. **Focused task**: Just compute synthetic spectrum given atmosphere

**Dependency**: SYNTHE requires ATLAS7V subroutine library (17K lines) for atmosphere interpolation. ATLAS7V is compiled separately and linked in.

#### COMMON Blocks (SYNTHE):

**Atmospheric Structure**:
- `/RHOX/` - Density vs depth
- `/STATE/` - Thermodynamic state
- `/BHE/` - Helium data
- `/BHYD/` - Hydrogen data

**Line Data**:
- `/LINDAT/` - Line parameters
- `/NLINES/` - Number of lines
- `/BUFFER/` - I/O buffer

**Opacity**:
- `/EXTAB/` - Extinction tables
- `/H1TAB/` - Hydrogen tables
- `/CONTIN/` - Continuum opacity

---

### DFSYNTHE (Detailed Opacity Synthesis)

**Complexity**: Low-Medium (9 subroutine calls, 18 COMMON blocks)

- **Subroutine calls**: 9 unique
- **COMMON blocks**: 18 unique
- **Lines**: 3,733 (slightly larger than SYNTHE)

#### Subroutine List (DFSYNTHE):

**Shared with SYNTHE**:
- `TABVOIGT`, `XLINOP`, `MAP1`, `EXIT`

**Unique to DFSYNTHE**:
- `DFINTERVALS` - Define opacity distribution function intervals
- `DFCALC` - Calculate ODF
- `VTTAB` - Velocity-temperature table
- `SELECTLINES` - Select lines for ODF
- `BISORT` - Binary sort

#### DFSYNTHE vs SYNTHE:

| Feature | SYNTHE | DFSYNTHE |
|---------|--------|----------|
| Output | High-res spectrum | Opacity distribution functions (ODFs) |
| Subroutines | 7 | 9 |
| Purpose | Direct synthesis | Pre-compute ODFs for faster ATLAS runs |
| Complexity | Low | Low-Medium |

---

### KAPPA9 (Opacity Calculator)

**Complexity**: High (52 subroutine calls, 49 COMMON blocks)

- **Subroutine calls**: 52 unique
- **COMMON blocks**: 49 unique
- **Lines**: 19,715

#### Key Subroutines (KAPPA9):

**Shared with ATLAS9**:
- `READIN`, `POPS`, `PFSAHA`, `KAPP`, `W`, `EXIT`
- `DERIV`, `INTEG`, `TTAUP`, `SOLVIT`, `PARCOE`

**Molecular Opacity**:
- `READMOL` - Read molecular line lists
- `MOLEC` - Molecular opacity
- `NMOLEC` - Number of molecules
- `NELECT` - Number of electrons
- `PFIRON` - Iron partition functions

**Specific Opacity Sources**:
- `HOP` - H opacity
- `H2PLOP` - H2+ opacity
- `HMINOP` - H- opacity
- `H2OP` - H2 opacity (inferred)

#### Architecture:

KAPPA9 is like **ATLAS9 without radiative transfer** - it just computes opacity at given T, P, composition but doesn't solve for atmosphere structure.

**Use case**: Generate opacity tables for use in ATLAS9/12.

---

## Shared Subroutine Patterns

### Core Computational Kernel (Present in ATLAS9, ATLAS12, KAPPA9):

These subroutines form the **shared foundation**:

| Subroutine | Purpose |
|------------|---------|
| `READIN` | Read input parameters |
| `POPS` | Atomic populations (LTE) |
| `PFSAHA` | Partition functions (Saha equation) |
| `KAPP` | Total opacity |
| `W` | Formatted output |
| `EXIT` | Clean termination |
| `DERIV` | Numerical derivatives |
| `INTEG` | Numerical integration |
| `SOLVIT` | Linear equation solver |
| `PARCOE` | Coefficient parsing |

**Migration Implication**: These ~10 subroutines can be translated once and reused across all ATLAS programs.

### Opacity Calculation Kernel (ATLAS + SYNTHE):

| Subroutine | ATLAS9 | ATLAS12 | SYNTHE | DFSYNTHE | KAPPA9 |
|------------|--------|---------|--------|----------|--------|
| `TABVOIGT` | No | Yes | Yes | Yes | No |
| `XLINOP` | No | Yes | Yes | Yes | No |
| `LINOP` | Yes | Yes | No | No | No |
| `KAPP` | Yes | Yes | No | No | Yes |
| `ROSS` | Yes | Yes | No | No | No |

**Pattern**: ATLAS12/SYNTHE use newer opacity methods (XLINOP, TABVOIGT). ATLAS9 uses older LINOP.

---

## COMMON Block Data Architecture

### Global Data Sharing Model

Fortran COMMON blocks are **named global memory regions** shared across subroutines:

```fortran
C In main program:
      COMMON /FLUX/ FLUXME(100), FLUXH(100)

C In subroutine:
      SUBROUTINE RADIAP
      COMMON /FLUX/ FLUXME(100), FLUXH(100)
      C Can now access FLUXME, FLUXH directly
```

**Implication for Julia Migration**: COMMON blocks should become:
1. **Struct types** for data organization
2. **Module-level constants** for read-only data
3. **Passed arguments** for mutable state (better practice)

### Most Common COMMON Blocks:

Present in 3+ programs:

| Block Name | Purpose | Programs |
|------------|---------|----------|
| `/ABROSS/` | Rosseland abundance | ATLAS9, ATLAS12, KAPPA9 |
| `/ABTOT/` | Total abundances | ATLAS9, ATLAS12, KAPPA9 |
| `/DEPART/` | NLTE departure | ATLAS9, ATLAS12, KAPPA9 |
| `/ELEM/` | Element data | ATLAS9, ATLAS12, KAPPA9 |
| `/EDENS/` | Electron density | ATLAS9, ATLAS12, KAPPA9 |
| `/FLUX/` | Radiation flux | ATLAS9, ATLAS12 |
| `/EXTAB/` | Extinction tables | ATLAS12, SYNTHE, DFSYNTHE |
| `/H1TAB/` | Hydrogen tables | ATLAS12, SYNTHE, DFSYNTHE |
| `/CONV/` | Convergence criteria | ATLAS9, ATLAS12 |

**Pattern**: Abundance, composition, and opacity data are universally shared.

---

## Dependency Graph (High-Level)

```
┌─────────────────────────────────────────────────────────┐
│                   USER WORKFLOW                          │
└─────────────────────────────────────────────────────────┘
                           │
                           ├─────────────┬──────────────┐
                           ▼             ▼              ▼
                      ┌─────────┐  ┌─────────┐   ┌──────────┐
                      │ ATLAS9  │  │ ATLAS12 │   │  KAPPA9  │
                      │         │  │         │   │          │
                      │ 19K loc │  │ 23K loc │   │  19K loc │
                      └────┬────┘  └────┬────┘   └─────┬────┘
                           │            │              │
                           │ writes     │ writes       │ writes
                           │            │              │
                           ▼            ▼              ▼
                    ┌────────────────────────────────────┐
                    │   Atmosphere Models (.mod files)   │
                    │   Opacity Tables                   │
                    └─────────────┬──────────────────────┘
                                  │
                                  │ read by
                                  ▼
                        ┌──────────────────┐
                        │   SYNTHE         │
                        │                  │
                        │   3K loc         │
                        │   + ATLAS7V lib  │
                        │     (17K loc)    │
                        └────────┬─────────┘
                                 │
                                 │ writes
                                 ▼
                        ┌─────────────────┐
                        │ Synthetic       │
                        │ Spectra         │
                        └─────────────────┘

Alternative path:
    DFSYNTHE (3.7K loc)
         │
         │ writes
         ▼
    Opacity Distribution Functions (ODFs)
         │
         │ used by
         ▼
    ATLAS9/12 (faster runs)
```

---

## Critical Missing Pieces for Phase 2

### 1. Subroutine Definitions

Where are these 50-80 subroutines **defined**?

**Hypothesis**: They're embedded in the main program files as internal subroutines (after the END of the main PROGRAM).

**Evidence**: Task 1.4 found that most files are "main_program" type, not "subroutines". Yet ATLAS12 calls 72 subroutines!

**Action for Phase 2**: Read past the main PROGRAM END statement to find embedded SUBROUTINEs.

### 2. ATLAS7V Linking

SYNTHE calls subroutines not found in synthe.for itself. Where?

**Answer**: ATLAS7V library files (17K lines each, 4 copies identified).

**Action for Phase 2**: Document ATLAS7V API - what subroutines does it export?

### 3. Compilation and Linking

How are programs built?

**Missing**: Makefiles, build scripts, compilation notes

**Action for Phase 2**: Search for Makefiles, README files with compilation instructions.

### 4. COMMON Block Layouts

What variables are in each COMMON block?

**Current**: Only know block names
**Needed**: Variable lists, types, dimensions

**Action for Phase 2**: Extract COMMON block declarations from each program.

---

## Migration Strategy Implications

### Shared Core (Priority 1)

Translate once, use everywhere:
- `READIN`, `POPS`, `PFSAHA`, `KAPP`, `ROSS`
- `DERIV`, `INTEG`, `SOLVIT`, `PARCOE`
- ~10 subroutines, ~2K-3K lines estimated

### ATLAS12 (Priority 2)

Primary migration target (per Paula):
- Main program: 22-23K lines
- 72-78 subroutine calls
- 56-57 COMMON blocks
- Most complex program

**Strategy**:
1. Translate shared core first
2. Translate ATLAS12-specific routines
3. Convert COMMON blocks to Julia structs

### SYNTHE (Priority 3)

Simpler than ATLAS:
- Main program: 3K lines
- Only 7 subroutine calls
- Requires ATLAS7V library

**Strategy**:
1. Translate ATLAS7V library first
2. Translate SYNTHE main program
3. Much easier than ATLAS12

---

## Task 1.5 Status: ✅ COMPLETE

**Key Findings**:
- ATLAS9/12 are massive programs with 60-80 subroutine calls each
- SYNTHE is much simpler (7 calls) but depends on ATLAS7V library
- 10 core subroutines shared across all programs
- Heavy COMMON block usage (15-57 blocks per program)
- No external library dependencies - all self-contained

**Critical Discovery**: Most subroutines are likely **embedded in main program files** (defined after END statement), not in separate library files.

**Next**: Task 1.6 - Write comprehensive CENSUS_REPORT.md synthesizing all findings
