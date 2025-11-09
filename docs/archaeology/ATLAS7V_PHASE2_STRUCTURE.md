# ATLAS7V Phase 2: Structure Map

## Executive Summary

Complete structural analysis of atlas7v.for (17,336 lines) identifying all 72 subroutines/functions and locating the 7 atlas7v subroutines needed by SYNTHE.

**Key Finding**: Of 13 subroutines identified in Phase 1, only **7 are in atlas7v.for**. The other 6 are embedded in SYNTHE programs themselves (spectrv.for, rotate.for, synthe.for).

**Target Subroutines**: ~1,500 lines across 7 subroutines (8.7% of atlas7v)

---

## Revised Dependency Classification

### Atlas7v Dependencies (7 subroutines)

| Subroutine | Lines | Line Range | Size | Priority | Purpose |
|------------|-------|------------|------|----------|---------|
| **READIN** | 870 | 1312-2181 | LARGE | CRITICAL | Atmosphere model parser |
| **JOSH** | 239 | 7941-8179 | Medium | CRITICAL | Radiative transfer solver |
| **KAPP** | 118 | 4324-4441 | Medium | CRITICAL | Continuum opacity calculator |
| **POPS** | 101 | 2789-2889 | Medium | CRITICAL | Saha-Boltzmann populations |
| **MAP1** | 58 | 1136-1193 | Small | Low | Table interpolation utility |
| **PARCOE** | 38 | 1098-1135 | Small | Low | Parabolic coefficient calculator |
| **W** | 9 | 1303-1311 | Tiny | Low | Write utility |

**Total**: 1,433 lines (8.3% of atlas7v.for)

### Self-Contained in SYNTHE Programs (6 subroutines)

| Subroutine | File | Lines | Purpose |
|------------|------|-------|---------|
| **CORINT** | spectrv.for | 431 | Continuum integration |
| **LINCEN** | spectrv.for | 428 | Line center calculation |
| **WTROT** | rotate.for | 208 | Rotation weight calculator |
| **INTSORT** | rotate.for | 322 | Integer sorting |
| **READBCS** | synthe.for | 2747 | Boundary condition reader |
| **TABVOIGT** | synthe.for | 1574 | Voigt profile tabulation |

**Implication**: These 6 subroutines will be migrated with their parent programs, not from atlas7v.

---

## Complete Atlas7v Structure (72 Subroutines)

### Target Subroutines (for SYNTHE)

```
W                    | Lines  1303- 1311 (   9 lines) *** TARGET ***
PARCOE               | Lines  1098- 1135 (  38 lines) *** TARGET ***
MAP1                 | Lines  1136- 1193 (  58 lines) *** TARGET ***
POPS                 | Lines  2789- 2889 ( 101 lines) *** TARGET ***
KAPP                 | Lines  4324- 4441 ( 118 lines) *** TARGET ***
JOSH                 | Lines  7941- 8179 ( 239 lines) *** TARGET ***
READIN               | Lines  1312- 2181 ( 870 lines) *** TARGET ***
```

### All Subroutines (Alphabetical)

| Subroutine | Lines | Range | Category |
|------------|-------|-------|----------|
| AL1OP | 77 | 6107-6183 | Opacity: Aluminum |
| BLOCKE | 59 | 2641-2699 | COMMON block setup |
| BLOCKH | 780 | 8967-9746 | COMMON block (H) |
| BLOCKJ | 787 | 8180-8966 | COMMON block (J) |
| BLOCKR | 89 | 2700-2788 | COMMON block setup |
| C1OP | 328 | 5704-6031 | Opacity: Carbon |
| CA2OP | 26 | 7497-7522 | Opacity: Calcium II |
| CHOP | 265 | 6511-6775 | Opacity: CH molecule |
| CONVEC | 179 | 9747-9925 | Convection |
| COOLOP | 29 | 5675-5703 | Cooling opacity |
| COULFF | 35 | 5016-5050 | Coulomb free-free |
| COULX | 15 | 7820-7834 | Coulomb cross-section |
| DERIV | 20 | 1060-1079 | Derivative utility |
| DUMMYR | 6 | 2182-2187 | Dummy routine |
| ELECOP | 12 | 7659-7670 | Electron opacity |
| EXPI | 46 | 1257-1302 | Exponential integral |
| FE1OP | 43 | 6468-6510 | Opacity: Iron |
| FREEFF | 107 | 2203-2309 | Free-free opacity |
| FREEFR | 15 | 2188-2202 | Free-free (read?) |
| H2COLLOP | 259 | 7093-7351 | H₂ collision opacity |
| H2PLOP | 23 | 5051-5073 | H₂⁺ opacity |
| H2RAOP | 27 | 7671-7697 | H₂ Rayleigh opacity |
| HE1OP | 206 | 5341-5546 | Opacity: Helium I |
| HE2OP | 89 | 5547-5635 | Opacity: Helium II |
| HEMIOP | 24 | 5636-5659 | He⁻ opacity |
| HERAOP | 15 | 5660-5674 | He Rayleigh opacity |
| HIGH | 16 | 9926-9941 | High atmosphere? |
| HLINOP | 56 | 7698-7753 | H line opacity |
| HMINOP | 105 | 5074-5178 | H⁻ opacity |
| HOP | 122 | 4442-4563 | Opacity: Hydrogen |
| HOTOP | 128 | 7523-7650 | Hot opacity? |
| HRAYOP | 148 | 5193-5340 | H Rayleigh opacity |
| INTEG | 18 | 1080-1097 | Integration utility |
| IONPOTS | 317 | 15996-16312 | Ionization potentials |
| IWORDF | 73 | 2310-2382 | Word parsing (?) |
| **JOSH** | **239** | **7941-8179** | **RT solver** ⭐ |
| **KAPP** | **118** | **4324-4441** | **Continuum opacity** ⭐ |
| LINTER | 14 | 5179-5192 | Linear interpolation |
| LINOP | 67 | 7835-7901 | Line opacity |
| LINSOP | 9 | 7902-7910 | Line opacity (scatter?) |
| LUKEOP | 54 | 7352-7405 | Luke opacity (?) |
| **MAP1** | **58** | **1136-1193** | **Table mapping** ⭐ |
| MG1OP | 75 | 6032-6106 | Opacity: Magnesium |
| NELECT | 59 | 2890-2948 | Electron number density |
| NMOLEC | 330 | 3994-4323 | Molecular number density |
| O1OP | 37 | 7406-7442 | Opacity: Oxygen I |
| OHOP | 317 | 6776-7092 | Opacity: OH molecule |
| **PARCOE** | **38** | **1098-1135** | **Parabolic coeff** ⭐ |
| PFGROUND | 1024 | 16313-17336 | Partition fn (ground) |
| PFIRON | 6037 | 9959-15995 | Partition fn (iron) |
| PFSAHA | 950 | 2949-3898 | Partition fn (Saha) |
| **POPS** | **101** | **2789-2889** | **Populations** ⭐ |
| PUTOUT | 263 | 296-558 | Output routine |
| RADIAP | 39 | 993-1031 | Radiative pressure |
| **READIN** | **870** | **1312-2181** | **Model parser** ⭐ |
| READMOL | 95 | 3899-3993 | Read molecular data |
| ROSS | 28 | 1032-1059 | Rosseland mean |
| SEATON | 8 | 7651-7658 | Seaton formula |
| SI1OP | 284 | 6184-6467 | Opacity: Silicon I |
| SI2OP | 54 | 7443-7496 | Opacity: Silicon II |
| SOLVIT | 63 | 1194-1256 | Linear equation solver |
| STARK | 66 | 7754-7819 | Stark broadening |
| STATEQ | 158 | 835-992 | State equation |
| TCORR | 276 | 559-834 | Temperature correction |
| TTAUP | 258 | 2383-2640 | T-tau relation |
| TURB | 17 | 9942-9958 | Turbulence |
| **W** | **9** | **1303-1311** | **Write utility** ⭐ |
| XCONOP | 9 | 7923-7931 | Continuum opacity (X?) |
| XKARSAS | 452 | 4564-5015 | Kramer opacity |
| XLINOP | 3 | 7911-7913 | Line opacity (X?) |
| XLISOP | 9 | 7914-7922 | Line scatter opacity (X?) |
| XSOP | 9 | 7932-7940 | Scatter opacity (X?) |

**Total**: 72 subroutines, 17,336 lines

---

## Size Distribution

### Monster Subroutines (>500 lines)

| Subroutine | Lines | Purpose |
|------------|-------|---------|
| **PFIRON** | 6037 | Iron partition functions (tables) |
| **PFGROUND** | 1024 | Ground state partition functions |
| **PFSAHA** | 950 | Saha equation partition functions |
| **READIN** ⭐ | 870 | Atmosphere model parser |
| **BLOCKJ** | 787 | COMMON block setup (J) |
| **BLOCKH** | 780 | COMMON block setup (H) |

**Note**: PFIRON alone is **35% of atlas7v.for**!

### Large Subroutines (200-500 lines)

| Subroutine | Lines | Purpose |
|------------|-------|---------|
| XKARSAS | 452 | Kramer opacity calculations |
| C1OP | 328 | Carbon opacity |
| NMOLEC | 330 | Molecular number densities |
| OHOP | 317 | OH molecule opacity |
| IONPOTS | 317 | Ionization potentials |
| SI1OP | 284 | Silicon I opacity |
| TCORR | 276 | Temperature correction |
| CHOP | 265 | CH molecule opacity |
| PUTOUT | 263 | Output routine |
| H2COLLOP | 259 | H₂ collision opacity |
| TTAUP | 258 | T-tau relation |
| **JOSH** ⭐ | 239 | Radiative transfer solver |
| HE1OP | 206 | Helium I opacity |

### Medium Subroutines (50-200 lines)

Includes our targets:
- **KAPP** ⭐ (118 lines)
- **POPS** ⭐ (101 lines)

Plus many opacity calculators (HOP, HMINOP, HRAYOP, etc.)

### Small Subroutines (<50 lines)

Includes our targets:
- **MAP1** ⭐ (58 lines)
- **PARCOE** ⭐ (38 lines)
- **W** ⭐ (9 lines)

Plus utilities (DERIV, INTEG, SOLVIT, COULFF, etc.)

---

## Functional Categories

### Opacity Calculators (~35 subroutines, ~8K lines)

**Bound-Free (Photoionization)**:
- HOP (H I), HMINOP (H⁻), H2PLOP (H₂⁺)
- HE1OP (He I), HE2OP (He II), HEMIOP (He⁻)
- C1OP (C I), MG1OP (Mg I), AL1OP (Al I), SI1OP (Si I), FE1OP (Fe I)
- O1OP (O I), SI2OP (Si II), CA2OP (Ca II)

**Free-Free (Thermal Bremsstrahlung)**:
- FREEFF, COULFF, XKARSAS

**Molecular**:
- CHOP (CH), OHOP (OH), H2COLLOP (H₂ collisions)

**Rayleigh Scattering**:
- HRAYOP (H), HERAOP (He), H2RAOP (H₂)

**Line Opacity**:
- HLINOP (H lines), LINOP (general), LINSOP, XLINOP, XLISOP

**Continuum**:
- **KAPP** ⭐ (dispatcher), XCONOP, COOLOP, HOTOP, ELECOP

### Population Calculators (~5 subroutines, ~2.5K lines)

- **POPS** ⭐ (Saha-Boltzmann solver)
- PFSAHA (partition functions via Saha)
- PFIRON (iron partition functions - 6K lines!)
- PFGROUND (ground state partition functions)
- NELECT (electron number density)
- NMOLEC (molecular number densities)
- READMOL (read molecular data)

### Radiative Transfer (~4 subroutines, ~1.1K lines)

- **JOSH** ⭐ (Feautrier solver, 239 lines)
- BLOCKJ (COMMON block setup for JOSH, 787 lines)
- RADIAP (radiative pressure, 39 lines)
- ROSS (Rosseland mean, 28 lines)

### Atmosphere Structure (~10 subroutines, ~2K lines)

- **READIN** ⭐ (parse atmosphere model, 870 lines)
- BLOCKE, BLOCKR, BLOCKH (COMMON block setup, ~900 lines)
- TTAUP (T-tau relation, 258 lines)
- STATEQ (state equation, 158 lines)
- CONVEC (convection, 179 lines)
- TCORR (temperature correction, 276 lines)
- PUTOUT (output, 263 lines)
- HIGH, TURB (16-17 lines each)

### Utilities (~15 subroutines, ~500 lines)

**Math**:
- SOLVIT (linear solver, 63 lines)
- DERIV (derivative, 20 lines)
- INTEG (integration, 18 lines)
- LINTER (linear interpolation, 14 lines)
- **PARCOE** ⭐ (parabolic coefficients, 38 lines)
- **MAP1** ⭐ (table mapping, 58 lines)
- EXPI (exponential integral, 46 lines)

**Data**:
- IONPOTS (ionization potentials, 317 lines)
- FREEFR, IWORDF (parsing, ~90 lines)
- DUMMYR (dummy, 6 lines)
- **W** ⭐ (write, 9 lines)

**Line Broadening**:
- STARK (Stark broadening, 66 lines)
- COULX (Coulomb cross-section, 15 lines)
- SEATON (Seaton formula, 8 lines)
- LUKEOP (54 lines)

---

## COMMON Block Structure

### Major COMMON Blocks (from subroutine names)

- **BLOCKE**: Electron/element data setup (59 lines)
- **BLOCKR**: General setup (89 lines)
- **BLOCKJ**: Radiative transfer (JOSH) data (787 lines)
- **BLOCKH**: Hydrogen/atmosphere data (780 lines)

**Total COMMON setup**: ~1,700 lines (10% of atlas7v!)

**Next Step**: Grep for actual COMMON declarations to map shared state.

---

## Target Subroutine Details

### Critical Tier (4 subroutines, 1,328 lines)

**1. READIN** (870 lines, 1312-2181)
- **Purpose**: Parse atmosphere model from input file
- **Size**: LARGE - most complex single routine
- **Dependencies**: Likely calls BLOCKE, BLOCKR, file I/O
- **Priority**: CRITICAL - needed by both xnfpelsyn and spectrv

**2. JOSH** (239 lines, 7941-8179)
- **Purpose**: Radiative transfer solver (Feautrier method)
- **Size**: Medium
- **Dependencies**: Likely uses BLOCKJ (787 lines)
- **Priority**: CRITICAL - core RT solver for spectrv

**3. KAPP** (118 lines, 4324-4441)
- **Purpose**: Continuum opacity dispatcher
- **Size**: Medium
- **Dependencies**: Calls opacity subroutines (HOP, HMINOP, HE1OP, etc.)
- **Priority**: CRITICAL - needed by xnfpelsyn

**4. POPS** (101 lines, 2789-2889)
- **Purpose**: Saha-Boltzmann population solver
- **Size**: Medium
- **Dependencies**: Calls PFSAHA? NELECT? IONPOTS?
- **Priority**: CRITICAL - needed by xnfpelsyn (44 calls!)

### Utility Tier (3 subroutines, 105 lines)

**5. MAP1** (58 lines, 1136-1193)
- **Purpose**: Table interpolation/mapping
- **Size**: Small
- **Dependencies**: Standalone utility
- **Priority**: LOW - used by synthe.for variant

**6. PARCOE** (38 lines, 1098-1135)
- **Purpose**: Parabolic coefficient calculator
- **Size**: Small
- **Dependencies**: Standalone utility
- **Priority**: LOW - used by synthe.for variant

**7. W** (9 lines, 1303-1311)
- **Purpose**: Write/output utility
- **Size**: Tiny
- **Dependencies**: File I/O only
- **Priority**: LOW - simple output wrapper

---

## Next Steps (Phase 3)

### Transitive Dependency Analysis

For each of the 4 critical subroutines, identify what they CALL:

1. **READIN** → grep for CALL statements in lines 1312-2181
2. **JOSH** → grep for CALL statements in lines 7941-8179 (+ BLOCKJ 8180-8966?)
3. **KAPP** → grep for CALL statements in lines 4324-4441
4. **POPS** → grep for CALL statements in lines 2789-2889

Build the **transitive closure**: all subroutines in the dependency chain.

**Hypothesis**:
- KAPP will call ~10-15 opacity subroutines (HOP, HMINOP, HE1OP, ...)
- POPS will call PFSAHA, IONPOTS, NELECT
- JOSH will need BLOCKJ setup
- READIN will call BLOCKE, BLOCKR

**Estimate**: Transitive closure will be ~3,000-5,000 lines (20-30% of atlas7v)

---

## Document Status

**Phase 2**: COMPLETE ✓
**Next**: Phase 3 - Transitive dependency analysis
**Commit**: Ready for git commit/push
