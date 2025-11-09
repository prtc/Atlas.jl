# ATLAS7V Phase 1: SYNTHE Suite Dependencies

## Executive Summary

This document captures the **direct dependencies** of the SYNTHE suite programs on atlas7v.for subroutines, discovered by grepping all SYNTHE Fortran source files for CALL statements.

**Key Finding**: Only **3 out of 11** SYNTHE pipeline programs directly call atlas7v subroutines. The line readers and broadening programs are self-contained.

**Date**: 2025-11-09
**Method**: `grep -i "^ *CALL " *.for` on all SYNTHE programs
**Next Steps**: Map these calls to atlas7v.for, build transitive dependency graph

---

## SYNTHE Suite Programs Analyzed

### Core 11-Program Pipeline

1. **synbeg** - Pipeline initializer
2. **rgfalllinesnew** - Atomic line reader (gfall format)
3. **rmolecasc** - Molecular line reader (ASCII)
4. **rschwenk** - TiO line reader (binary)
5. **rh2ofast** - H₂O line reader (binary)
6. **rpredict** - Predicted line reader (binary)
7. **xnfpelsyn** - Atmosphere preparation
8. **spectrv** - Spectrum synthesis kernel
9. **rotate** - Rotational broadening
10. **broaden** - Instrumental broadening
11. **synthe** - Alternative synthesis program (?)

---

## Direct Dependencies

### Programs with NO atlas7v Dependencies

**Line Readers** (self-contained):
- synbeg.for: Only calls `EXIT`
- rgfalllinesnew.for: Only calls `EXIT`
- rmolecasc.for: Only calls `EXIT`
- rschwenk.for: Only calls `EXIT`
- rh2ofast.for: Only calls `EXIT`
- rpredict.for: Only calls `EXIT`

**Broadening**:
- broaden.for: Only calls `EXIT`

**Implication**: These 7 programs can be migrated **independently** without atlas7v. They only depend on:
- File I/O (fort.12, fort.14, fort.93)
- Standard Fortran functions

### Programs with atlas7v Dependencies

#### 1. xnfpelsyn.for (Atmosphere Preparation)

**Atlas7v Calls**:
```fortran
CALL KAPP(N,NSTEPS,STEPWT)      # Continuum opacity calculator
CALL POPS(element, stages, output_array)  # Saha-Boltzmann populations
```

**POPS invocations** (44 total calls for different elements):
```fortran
CALL POPS(1.00D0,12,XNFH)       # H I  (neutral hydrogen)
CALL POPS(1.01D0,11,XNFPH)      # H II (ionized hydrogen)
CALL POPS(2.01D0,12,XNFHE)      # He I
CALL POPS(2.02D0,11,XNFPHE)     # He II
CALL POPS(5.00D0,11,XNFPB)      # B
CALL POPS(6.01D0,11,XNFPC)      # C
CALL POPS(8.00D0,11,XNFPO)      # O
CALL POPS(10.05D0,11,XNFP(1,1,10))  # Ne
CALL POPS(11.00D0,11,XNFPNA)    # Na
CALL POPS(12.01D0,11,XNFPMG)    # Mg
CALL POPS(13.01D0,11,XNFPAL)    # Al
CALL POPS(14.01D0,11,XNFPSI)    # Si
CALL POPS(19.00D0,11,XNFPK)     # K
CALL POPS(20.01D0,11,XNFPCA)    # Ca
CALL POPS(26.00D0,11,XNFPFE)    # Fe
# + many more for different ionization stages
```

**Element Code Format**: `XX.YY` where XX = atomic number, YY = ionization stage
- X.00 = neutral (stage I)
- X.01 = singly ionized (stage II)
- X.05 = multiple stages up to VI

**Unique Subroutines Called**: 2
- `POPS` (population solver)
- `KAPP` (opacity calculator)

#### 2. spectrv.for (Spectrum Synthesis)

**Atlas7v Calls**:
```fortran
CALL READIN(20)                  # Read atmosphere model
CALL JOSH(1,IFSURF)              # Radiative transfer (continuum)
CALL JOSH(IFSCAT,IFSURF)         # Radiative transfer (total)
CALL CORINT                      # Continuum integration (?)
CALL LINCEN                      # Line center calculation (?)
CALL W(6HBFUDGE,BFUDGE,NRHOX)    # Write utility (?)
CALL W(6HFSCAT ,FSCAT,NRHOX)     # Write utility (?)
```

**Unique Subroutines Called**: 5 (+W utility)
- `READIN` (atmosphere parser)
- `JOSH` (radiative transfer solver)
- `CORINT` (continuum integration)
- `LINCEN` (line center calculation)
- `W` (write/output utility)

#### 3. rotate.for (Rotational Broadening)

**Atlas7v Calls**:
```fortran
CALL WTROT(0.,0.,0,NWT,WTMU,NRADIUS)       # Rotation weights (continuum?)
CALL WTROT(VEL,VSTEP,NV,NWT,WTMU,NRADIUS)  # Rotation weights (velocity)
CALL INTSORT(MUNWT,N3)                     # Integer sorting
```

**Unique Subroutines Called**: 2
- `WTROT` (rotation weight calculator)
- `INTSORT` (sorting utility)

#### 4. synthe.for (Alternative Synthesis?)

**Atlas7v Calls**:
```fortran
CALL TABVOIGT(VSTEPS,2001)                        # Voigt profile tabulation
CALL READBCS(1,J,TEMP,XNFHP,XNFHEP,E,DL,PHIHE)  # Read boundary conditions (?)
CALL READBCS(2,J,TEMP,XNFHP,XNFHEP,E,DL,PHIHE)
CALL READBCS(4,J,TEMP,XNFHP,XNFHEP,E,DL,PHIHE)
CALL MAP1(TABVI,TABH1,81,H0TAB,H1TAB,N)          # Table interpolation (?)
CALL PARCOE(F,X,A,B,C,N)                         # Parabolic coefficients (?)
```

**Unique Subroutines Called**: 4
- `TABVOIGT` (Voigt profile table)
- `READBCS` (boundary condition reader)
- `MAP1` (table mapping/interpolation)
- `PARCOE` (parabolic coefficient calculator)

**Note**: synthe.for appears to be an alternative to spectrv? Need to investigate which is the canonical version.

---

## Summary of Atlas7v Dependencies

### Tier 1: Critical (Used by Core Synthesis)

| Subroutine | Called By | Purpose | Priority |
|------------|-----------|---------|----------|
| **POPS** | xnfpelsyn | Saha-Boltzmann population solver | **CRITICAL** |
| **KAPP** | xnfpelsyn | Continuum opacity calculator | **CRITICAL** |
| **READIN** | spectrv | Atmosphere model parser | **CRITICAL** |
| **JOSH** | spectrv | Radiative transfer solver (Feautrier) | **CRITICAL** |

### Tier 2: Important (Used by Variants/Extensions)

| Subroutine | Called By | Purpose | Priority |
|------------|-----------|---------|----------|
| **CORINT** | spectrv | Continuum integration | **HIGH** |
| **LINCEN** | spectrv | Line center calculation | **HIGH** |
| **WTROT** | rotate | Rotation weight calculator | **MEDIUM** |
| **TABVOIGT** | synthe | Voigt profile tabulation | **MEDIUM** |

### Tier 3: Utilities

| Subroutine | Called By | Purpose | Priority |
|------------|-----------|---------|----------|
| **W** | spectrv | Write/output utility | **LOW** |
| **INTSORT** | rotate | Integer sorting | **LOW** |
| **READBCS** | synthe | Boundary condition reader | **LOW** |
| **MAP1** | synthe | Table interpolation | **LOW** |
| **PARCOE** | synthe | Parabolic coefficients | **LOW** |

**Total Direct Dependencies**: 13 unique subroutines

**Estimated atlas7v Coverage**: ~5-10% of 18K lines (most of atlas7v is likely unused by SYNTHE)

---

## Next Steps (Phase 2-4)

### Phase 2: Atlas7v Structure Survey

- [ ] Build subroutine index (SUBROUTINE/FUNCTION declarations)
- [ ] Identify COMMON blocks
- [ ] Count lines per subroutine
- [ ] Create high-level map of atlas7v organization

**Output**: `ATLAS7V_STRUCTURE_MAP.md`

### Phase 3: Transitive Dependency Analysis

For each Tier 1 subroutine, trace the call chain:
- [ ] POPS → calls which subroutines?
- [ ] KAPP → calls which subroutines?
- [ ] READIN → calls which subroutines?
- [ ] JOSH → calls which subroutines?

Build complete dependency closure (all functions in the call chain).

**Output**: Call graph diagram + dependency list

### Phase 4: Focused Deep Dive

Write detailed analysis for:
- **Tier 1**: Full deep dive (algorithm, data structures, migration strategy)
- **Tier 2**: Moderate detail (purpose, key algorithms)
- **Tier 3**: Brief summary (interface, can defer migration)

**Output**: `ATLAS7V_SYNTHE_DEPENDENCIES.md` (comprehensive deep dive)

---

## Open Questions

1. **synthe.for vs spectrv.for**: Which is the canonical synthesis program? Are they alternatives or complementary?

2. **CORINT and LINCEN**: Are these essential or optional? Not found in deep dive analysis of spectrv.

3. **WTROT source**: Is WTROT in atlas7v or in a separate library? Need to verify.

4. **COMMON block dependencies**: Which COMMON blocks do these subroutines access? Need to map data flow.

5. **Library organization**: Is atlas7v.for a monolithic file or does it reference external modules?

---

## Validation

**Method**: Cross-reference with Deep Dive documents
- Deep Dive 08 (SYNTHE_SPECTRV): Mentions READIN, POPS, KAPP, JOSH ✓
- Deep Dive 10 (SYNTHE_XNFPELSYN): Mentions POPS, KAPP extensively ✓
- Deep Dive 11 (SYNTHE_BROADENING): No atlas7v mentions for broaden ✓

**Consistency Check**: PASSED

---

**Document Status**: Phase 1 Complete
**Next Action**: Survey atlas7v.for structure (Phase 2)
**Commit**: Ready for git commit/push
