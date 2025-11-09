# ATLAS12 COMMON Block Comprehensive Dependency Map

> Phase 4 Migration Planning Document - November 2025

## Overview

This document provides a COMPLETE mapping of all 57 COMMON blocks in ATLAS12.
Each COMMON block represents shared global state that must be refactored into Julia
structs and data structures during the Fortran-to-Julia migration.

## Quick Summary

| Category | Count | Examples |
|----------|-------|----------|
| **Critical** | 7 | /TEMP/, /STATE/, /FREQ/, /XNF/, /OPS/, /FLUX/, /RHOX/ |
| **High** | 10 | /DEPART/, /XABUND/, /XISO/, /ABTOT/, /CONV/, /OPTOT/, etc. |
| **Medium** | 15 | /RAD/, /HEIGHT/, /TURBPR/, /PZERO/, /IF/, /JUNK/, etc. |
| **Low/Utility** | 25 | /FREE/, /FILENAME/, /TABLOG/, /EXTAB/, /IIIIIII/, etc. |
| **TOTAL** | **57** | Complete ATLAS12 state |

## Architecture Overview

### Data Flow

```
READIN → TEMP, STATE, XNF, RHOX, DEPART
  ↓
Frequency Loop: FREQ set for each wavelength
  ↓
KAPP: Computes OPS (opacity) using TEMP, STATE, XNF, FREQ
  ↓
TCORR: Iteratively solves radiative transfer
  ├→ Updates TEMP via temperature correction
  ├→ Updates flux arrays
  └→ Computes radiation field (FLUX, FLXRAD)
  ↓
STATEQ: Updates STATE (pressure, densities)
  ↓
POPS: Updates XNF (populations)
  ↓
PUTOUT: Outputs results
```

## CRITICAL Priority Blocks (7 blocks)

### /RHOX/ (56 subroutines)
**Depth grid (Rosseland optical depth)**

**Declaration**: `COMMON /RHOX/` with 2 variables

**Subroutines**:
BLOCKR | C1OP | C2OP | CA2OP | CHOP | CONVEC | COOLOP | ELECOP
ENERGYDENSITY | FE1OP | H2COLLOP | H2PLOP | H2RAOP | HE1OP | HE2OP | HEMIOP
HERAOP | HIGH | HLINOP | HMINOP | HOP | HOTOP | HPROFL | HRAYOP
INPUT | JOSH | KAPCONT | KAPP | LINOP | LINOP1 | LUKEOP | MG1OP
MG2OP | MOLEC | N1OP | NELECT | NMOLEC | OHOP | POPS | POPSALL
PRELINOP | PUTOUT | RADIAP | READIN | ROSS | ROSSTAB | SELECTLINES | SI1OP
SI2OP | STARK | STATEQ | TCORR | TURB | VTURBSTANDARD | XCONOP | XLINOP

### /STATE/ (49 subroutines)
**Physical state variables**

**Declaration**: `COMMON /STATE/` with 5 variables

**Subroutines**:
C1OP | C2OP | CHOP | CONVEC | COOLOP | ELECOP | ENERGYDENSITY | FE1OP
H2COLLOP | H2PLOP | H2RAOP | HE1OP | HE2OP | HEMIOP | HERAOP | HIGH
HLINOP | HMINOP | HOP | HOTOP | HPROFL | HRAYOP | INPUT | KAPP
LINOP | LINOP1 | LUKEOP | MG1OP | MG2OP | MOLEC | NELECT | NMOLEC
OHOP | PFSAHA | POPS | POPSALL | PRELINOP | PUTOUT | READIN | ROSSTAB
SELECTLINES | SI1OP | SI2OP | STARK | STATEQ | TCORR | TURB | XCONOP
XLINOP

### /TEMP/ (46 subroutines)
**Temperature arrays**

**Declaration**: `COMMON /TEMP/` with 7 variables

**Subroutines**:
C1OP | C2OP | CA2OP | CHOP | CONVEC | COULFF | ENERGYDENSITY | FE1OP
H2COLLOP | H2PLOP | H2RAOP | HE1OP | HE2OP | HEMIOP | HLINOP | HMINOP
HOP | HOTOP | HPROFL | INPUT | KAPCONT | LINOP | LINOP1 | MG1OP
MG2OP | MOLEC | N1OP | NELECT | NMOLEC | OHOP | PFSAHA | POPS
POPSALL | PRELINOP | PUTOUT | READIN | ROSS | ROSSTAB | SELECTLINES | SI1OP
SI2OP | STARK | STATEQ | TCORR | XCONOP | XLINOP

### /FREQ/ (43 subroutines)
**Current frequency quantities**

**Declaration**: `COMMON /FREQ/` with 7 variables

**Subroutines**:
AL1OP | C1OP | C2OP | CA2OP | CHOP | COOLOP | COULFF | FE1OP
H2COLLOP | H2PLOP | H2RAOP | HE1OP | HE2OP | HEMIOP | HERAOP | HLINOP
HMINOP | HOP | HOTOP | HRAYOP | INPUT | JOSH | KAPCONT | KAPP
LINOP | LINOP1 | LUKEOP | MG1OP | MG2OP | N1OP | O1OP | OHOP
PRELINOP | PUTOUT | ROSS | ROSSTAB | SEATON | SELECTLINES | SI1OP | SI2OP
STARK | STATEQ | TCORR

### /XNF/ (37 subroutines)
**Ionization/excitation populations**

**Declaration**: `COMMON /XNF/` with 3 variables

**Subroutines**:
C1OP | C2OP | CONVEC | COOLOP | ENERGYDENSITY | H2COLLOP | H2PLOP | H2RAOP
HE1OP | HE2OP | HEMIOP | HERAOP | HLINOP | HMINOP | HOP | HOTOP
HPROFL | HRAYOP | INPUT | LINOP | LINOP1 | LUKEOP | MG1OP | MG2OP
MOLEC | NELECT | NMOLEC | POPS | POPSALL | PRELINOP | PUTOUT | READIN
SELECTLINES | SI1OP | SI2OP | STATEQ | XLINOP

### /OPS/ (23 subroutines)
**Opacity sources (all types)**

**Declaration**: `COMMON /OPS/` with 25 variables

**Subroutines**:
CONVEC | COOLOP | ELECOP | H2PLOP | H2RAOP | HE1OP | HE2OP | HEMIOP
HERAOP | HLINOP | HMINOP | HOP | HOTOP | HRAYOP | INPUT | KAPP
LINSOP | LUKEOP | PUTOUT | SELECTLINES | XCONOP | XLISOP | XSOP

### /FLUX/ (9 subroutines)
**Radiation field quantities**

**Declaration**: `COMMON /FLUX/` with 4 variables

**Subroutines**:
BLOCKR | CONVEC | INPUT | PUTOUT | RADIAP | READIN | SELECTLINES | TCORR
VTURBSTANDARD

## HIGH Priority Blocks (9 blocks)

### /XABUND/ (29 subroutines)
**Elemental abundances**

**Declaration**: `COMMON /XABUND/` with 3 variables

**Subroutines**:
BLOCKE | CONVEC | COOLOP | ENERGYDENSITY | H2PLOP | H2RAOP | HE1OP | HE2OP
HEMIOP | HERAOP | HLINOP | HMINOP | HOP | HOTOP | HRAYOP | INPUT
LINOP | LINOP1 | LUKEOP | MOLEC | NELECT | NMOLEC | POPS | POPSALL
PRELINOP | PUTOUT | READIN | SELECTLINES | STATEQ

### /XISO/ (28 subroutines)
**Isotopic composition**

**Declaration**: `COMMON /XISO/` with 2 variables

**Subroutines**:
CONVEC | COOLOP | ENERGYDENSITY | H2PLOP | H2RAOP | HE1OP | HE2OP | HEMIOP
HERAOP | HLINOP | HMINOP | HOP | HOTOP | HRAYOP | INPUT | LINOP
LINOP1 | LUKEOP | MOLEC | NELECT | NMOLEC | POPS | POPSALL | PRELINOP
PUTOUT | READIN | SELECTLINES | STATEQ

### /DEPART/ (15 subroutines)
**Departure coefficients (NLTE)**

**Declaration**: `COMMON /DEPART/` with 3 variables

**Subroutines**:
BLOCKR | H2COLLOP | H2PLOP | H2RAOP | HLINOP | HMINOP | HOP | HRAYOP
INPUT | PFSAHA | PUTOUT | READIN | SELECTLINES | STATEQ | TCORR

### /ITER/ (14 subroutines)
**Iteration control**

**Declaration**: `COMMON /ITER/` with 4 variables

**Subroutines**:
BLOCKR | ENERGYDENSITY | INPUT | LINOP1 | NELECT | NMOLEC | POPSALL | PUTOUT
READIN | ROSSTAB | SELECTLINES | STATEQ | TCORR | VTURBSTANDARD

### /ABROSS/ (9 subroutines)
**Rosseland mean absorption**

**Declaration**: `COMMON /ABROSS/` with 2 variables

**Subroutines**:
CONVEC | INPUT | PUTOUT | READIN | ROSS | ROSSTAB | SELECTLINES | TCORR
VTURBSTANDARD

### /CONV/ (9 subroutines)
**Convection parameters**

**Declaration**: `COMMON /CONV/` with 14 variables

**Subroutines**:
BLOCKR | CONVEC | INPUT | PUTOUT | READIN | SELECTLINES | TCORR | TURB
VTURBSTANDARD

### /ABTOT/ (8 subroutines)
**Total absorption coefficient**

**Declaration**: `COMMON /ABTOT/` with 2 variables

**Subroutines**:
HIGH | INPUT | JOSH | PUTOUT | RADIAP | ROSS | SELECTLINES | TCORR

### /TAUSHJ/ (6 subroutines)
**Optical depth quantities**

**Declaration**: `COMMON /TAUSHJ/` with 5 variables

**Subroutines**:
INPUT | JOSH | PUTOUT | RADIAP | STATEQ | TCORR

### /OPTOT/ (6 subroutines)
**Total opacity arrays**

**Declaration**: `COMMON /OPTOT/` with 6 variables

**Subroutines**:
INPUT | JOSH | KAPCONT | KAPP | PUTOUT | SELECTLINES

## MEDIUM Priority Blocks (11 blocks)

### /ELEM/ (13 subroutines)
**Element data**

**Declaration**: `COMMON /ELEM/` with 4 variables

**Subroutines**:
BLOCKE | ENERGYDENSITY | INPUT | LINOP | LINOP1 | MOLEC | NELECT | NMOLEC
POPSALL | PRELINOP | PUTOUT | READIN | SELECTLINES

### /TURBPR/ (10 subroutines)
**Turbulence parameters**

**Declaration**: `COMMON /TURBPR/` with 7 variables

**Subroutines**:
BLOCKR | CONVEC | INPUT | PUTOUT | READIN | SELECTLINES | TCORR | TURB
VTURBSTANDARD | XCONOP

### /IF/ (9 subroutines)
**Control flags**

**Declaration**: `COMMON /IF/` with 6 variables

**Subroutines**:
BLOCKR | CONVEC | INPUT | MOLEC | POPS | POPSALL | PUTOUT | READIN
SELECTLINES

### /RAD/ (7 subroutines)
**Radiation field**

**Declaration**: `COMMON /RAD/` with 2 variables

**Subroutines**:
BLOCKR | CONVEC | INPUT | PUTOUT | RADIAP | READIN | TCORR

### /PZERO/ (7 subroutines)
**Pressure reference values**

**Declaration**: `COMMON /PZERO/` with 7 variables

**Subroutines**:
CONVEC | INPUT | JOSH | PUTOUT | RADIAP | READIN | TCORR

### /JUNK/ (7 subroutines)
**Miscellaneous parameters**

**Declaration**: `COMMON /JUNK/` with 5 variables

**Subroutines**:
BLOCKR | FREEFR | INPUT | MOLEC | PUTOUT | READIN | SELECTLINES

### /H1TAB/ (7 subroutines)
**Hydrogen transition tables**

**Declaration**: `COMMON /H1TAB/` with 3 variables

**Subroutines**:
INPUT | LINOP | LINOP1 | PRELINOP | TABVOIGT | VOIGT | XLINOP

### /TABLOG/ (7 subroutines)
**Logarithmic tables**

**Declaration**: `COMMON /TABLOG/` with 1 variables

**Subroutines**:
INPUT | LINOP | LINOP1 | PRELINOP | PRETABLOG | SELECTLINES | XLINOP

### /TABCONT/ (7 subroutines)
**Continuum opacity tables**

**Declaration**: `COMMON /TABCONT/` with 3 variables

**Subroutines**:
INPUT | KAPCONT | LINOP | LINOP1 | PRELINOP | SELECTLINES | XLINOP

### /EDENS/ (7 subroutines)
**Energy density**

**Declaration**: `COMMON /EDENS/` with 2 variables

**Subroutines**:
CONVEC | ENERGYDENSITY | INPUT | NELECT | NMOLEC | POPSALL | SELECTLINES

### /HEIGHT/ (6 subroutines)
**Depth grid heights**

**Declaration**: `COMMON /HEIGHT/` with 1 variables

**Subroutines**:
CONVEC | HIGH | INPUT | PUTOUT | READIN | SELECTLINES

## LOW Priority Blocks (29 blocks)

### /FRESET/ (12 subroutines)
**Reset frequency set**

**Declaration**: `COMMON /FRESET/` with 6 variables

**Subroutines**:
BLOCKR | INPUT | KAPCONT | LINOP | LINOP1 | PRELINOP | PUTOUT | READIN
ROSS | SELECTLINES | TCORR | XLINOP

### /EXTAB/ (8 subroutines)
**Extinction tables**

**Declaration**: `COMMON /EXTAB/` with 3 variables

**Subroutines**:
FASTE1 | HPROFL | INPUT | LINOP | LINOP1 | PRELINOP | VCSE1F | XLINOP

### /TEFF/ (7 subroutines)
**Effective temperature**

**Declaration**: `COMMON /TEFF/` with 3 variables

**Subroutines**:
BLOCKR | CONVEC | INPUT | PUTOUT | READIN | TCORR | VTURBSTANDARD

### /IFOP/ (7 subroutines)
**Opacity control flags**

**Declaration**: `COMMON /IFOP/` with 1 variables

**Subroutines**:
BLOCKR | INPUT | KAPCONT | KAPP | PUTOUT | READIN | SELECTLINES

### /XNFDOP/ (7 subroutines)
**Doppler width populations**

**Declaration**: `COMMON /XNFDOP/` with 2 variables

**Subroutines**:
HPROFL | INPUT | LINOP | LINOP1 | PRELINOP | SELECTLINES | XLINOP

### /MUS/ (6 subroutines)
**Angular integration**

**Declaration**: `COMMON /MUS/` with 3 variables

**Subroutines**:
BLOCKR | INPUT | JOSH | PUTOUT | READIN | SELECTLINES

### /IIIIIII/ (5 subroutines)
**Line data indices**

**Declaration**: `COMMON /IIIIIII/` with 7 variables

**Subroutines**:
INPUT | LINOP | LINOP1 | PRELINOP | SELECTLINES

### /STEPLG/ (5 subroutines)
**Step control parameters**

**Declaration**: `COMMON /STEPLG/` with 3 variables

**Subroutines**:
BLOCKR | INPUT | READIN | TCORR | VTURBSTANDARD

### /WAVEY/ (5 subroutines)
**Wavelength parameters**

**Declaration**: `COMMON /WAVEY/` with 3 variables

**Subroutines**:
BLOCKR | INPUT | PUTOUT | READIN | SELECTLINES

### /POTION/ (5 subroutines)
**Chemical species data**

**Declaration**: `COMMON /POTION/` with 2 variables

**Subroutines**:
ENERGYDENSITY | IONPOTS | NELECT | PFSAHA | POPSALL

### /FREE/ (4 subroutines)
**Free format parsing**

**Declaration**: `COMMON /FREE/` with 7 variables

**Subroutines**:
FREEFF | FREEFR | IWORDF | READIN

### /ACOOL/ (4 subroutines)
**Cool metal opacity**

**Declaration**: `COMMON /ACOOL/` with 5 variables

**Subroutines**:
C1OP | COOLOP | MG1OP | SI1OP

### /ALUKE/ (4 subroutines)
**Molecular opacity**

**Declaration**: `COMMON /ALUKE/` with 6 variables

**Subroutines**:
C2OP | LUKEOP | MG2OP | SI2OP

### /XLINES/ (4 subroutines)
**Line data storage**

**Declaration**: `COMMON /XLINES/` with 1 variables

**Subroutines**:
INPUT | LINOP | LINOP1 | XLINOP

### /FILENAME/ (3 subroutines)
**Input/output filenames**

**Declaration**: `COMMON /FILENAME/` with 1 variables

**Subroutines**:
INPUT | READIN | SELECTLINES

### /TAUSTD/ (3 subroutines)
**Standard optical depth**

**Declaration**: `COMMON /TAUSTD/` with 1 variables

**Subroutines**:
READIN | TCORR | VTURBSTANDARD

### /TSMOOTH/ (3 subroutines)
**Smoothing parameters**

**Declaration**: `COMMON /TSMOOTH/` with 6 variables

**Subroutines**:
BLOCKR | READIN | TCORR

### /IFEQUA/ (3 subroutines)
**Equation control**

**Declaration**: `COMMON /IFEQUA/` with 9 variables

**Subroutines**:
MOLEC | NMOLEC | READMOL

### /WWWWWWW/ (3 subroutines)
**Line feature data**

**Declaration**: `COMMON /WWWWWWW/` with 7 variables

**Subroutines**:
LINOP | LINOP1 | PRELINOP

### /PUT/ (2 subroutines)
**Output control**

**Declaration**: `COMMON /PUT/` with 2 variables

**Subroutines**:
INPUT | PUTOUT

### /ISOTOPE/ (2 subroutines)
**Isotope data**

**Declaration**: `COMMON /ISOTOPE/` with 1 variables

**Subroutines**:
INPUT | ISOTOPES

### /RR/ (2 subroutines)
**Radiation field diagonals**

**Declaration**: `COMMON /RR/` with 2 variables

**Subroutines**:
PUTOUT | TCORR

### /XNMOL/ (2 subroutines)
**Molecular populations**

**Declaration**: `COMMON /XNMOL/` with 2 variables

**Subroutines**:
MOLEC | NMOLEC

### /MATXJ/ (2 subroutines)
**Matrix J coefficients**

**Declaration**: `COMMON /MATXJ/` with 1 variables

**Subroutines**:
BLOCKJ | JOSH

### /MATXH/ (2 subroutines)
**Matrix H coefficients**

**Declaration**: `COMMON /MATXH/` with 1 variables

**Subroutines**:
BLOCKH | JOSH

### /TABTP/ (1 subroutines)
**Temperature-Pressure tables**

**Declaration**: `COMMON /TABTP/` with 10 variables

**Subroutines**:
READIN

### /IFPOP/ (1 subroutines)
**Population flags**

**Declaration**: `COMMON /IFPOP/` with 1 variables

**Subroutines**:
MOLEC

### /XNSAVE/ (1 subroutines)
**Saved populations**

**Declaration**: `COMMON /XNSAVE/` with 1 variables

**Subroutines**:
NMOLEC

### /PRD/ (1 subroutines)
**Partial Redistribution**

**Declaration**: `COMMON /PRD/` with 7 variables

**Subroutines**:
JOSH

## Statistics

| Metric | Value |
|--------|-------|
| Total COMMON blocks | 57 |
| Most used (RHOX) | 56 subroutines |
| Average usage | 10 subroutines |
| Depth grid size | kw=72 |
| Species dimension | mion=1006 |
