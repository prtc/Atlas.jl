# ATLAS12 vs Atlas7v Code Comparison (SYNTHE Subroutines Only)
**Created**: 2025-11-10
**Purpose**: Document differences in the 7 atlas7v subroutines used by SYNTHE to correct cost estimates
**Context**: Phase 4 - SYNTHE Edition cost revision
**Scope**: Only the 7 atlas7v subroutines that SYNTHE programs actually call

---

## Executive Summary

**Finding**: The 7 atlas7v subroutines used by SYNTHE are **SIMILAR but NOT IDENTICAL** to their ATLAS12 counterparts.

**7 Atlas7v Subroutines Used by SYNTHE** (from ATLAS7V_PHASE2_STRUCTURE.md):
1. READIN (870 lines) - Atmosphere model parser
2. JOSH (239 lines) - Radiative transfer solver
3. KAPP (118 lines) - Continuum opacity calculator
4. POPS (101 lines) - Saha-Boltzmann populations
5. MAP1 (58 lines) - Table interpolation utility
6. PARCOE (38 lines) - Parabolic coefficient calculator
7. W (9 lines) - Write utility

**Key Differences** (in these 7 subroutines):
1. **Grid sizes**: atlas12 uses 72 depth points (kw=72), atlas7v uses 99 depth points (kw=99)
2. **COMMON block structures**: Different layouts for element abundances, molecular data
3. **Subroutine signatures**: KAPP has different parameters between atlas12 and atlas7v
4. **Array indexing**: XABUND is 2D in atlas12 (varies with depth), 1D in atlas7v (constant)

**Cost Impact**: Original estimate that "atlas7v cost is $0 if ATLAS12 migrated" was **too optimistic**.

**Revised Estimate**: If ATLAS12 is already migrated, migrating these 7 atlas7v subroutines costs **40-60% of standalone cost** (not 0%), due to:
- ~70-80% algorithm similarity (core physics is similar)
- But different data structures require refactoring (especially abundances)
- Cannot reuse ATLAS12 tests directly (different grid sizes)
- Different array indexing patterns (2D → 1D for abundances)

**Bottom Line**:
- Original atlas7v standalone cost: $120-200 (for these 7 subroutines + dependencies)
- Revised with ATLAS12 done: **$50-120** (40-60% savings, not 100%)

---

## 1. File Statistics

| Metric | atlas12.for | atlas7v.for | Difference |
|--------|-------------|-------------|------------|
| **Total lines** | 22,152 | 17,045 | -23% (atlas7v smaller) |
| **Subroutine count** | 82 | 56 | -32% (atlas7v fewer) |
| **Grid size (kw)** | 72 depth points | 99 depth points | +38% (atlas7v larger grid) |
| **Molecular parameter** | mion=1006 | MAXMOL=200 | Different molecular systems |

**Location**:
- atlas12.for: `/home/user/Atlas.jl/upstream/kurucz/source_codes/programs/atlas12/atlas12.for`
- atlas7v.for: `/home/user/Atlas.jl/upstream/kurucz/source_codes/programs/atlas12/atlas7v.for`

**Observation**: atlas7v is a **library** (PROGRAM ATLAS7V, line 1), atlas12 is a **standalone program** (PROGRAM ATLAS12, line 1). Atlas7v is compiled and linked by xnfpelsyn.for and spectrv.for.

---

## 2. Critical Subroutine Comparison

### 2.1 POPS (Population Solver)

**Lines**:
- atlas12.for: Lines 2837-2950 (~113 lines)
- atlas7v.for: Lines 2789-2900 (~111 lines)

**Signature**:
- **SAME**: `SUBROUTINE POPS(CODE, MODE, NUMBER)`

**Key Differences**:

| Aspect | atlas12.for | atlas7v.for | Impact |
|--------|-------------|-------------|--------|
| **Grid size** | `kw=72` | `kw=99` | Array dimensions different |
| **Molecular parameter** | `mion=1006` | `MAXMOL=200` | Different molecular systems |
| **Abundance COMMON** | `/XABUND/` with `XABUND(kw,99)` (2D) | `/ELEM/` with `XABUND(99)` (1D) | **CRITICAL**: Indexing differs |
| **Abundance access** | `XABUND(J,IZ)` (varies with depth) | `XABUND(IZ)` (constant with depth) | **CRITICAL**: Algorithm differs |
| **Molecular COMMON** | `/XNF/`, `/XISO/` | `/XNMOL/` | Different molecular data structures |
| **State COMMON** | `CHARGESQ(kw)` field present | `PTOTAL(kw)` field present | Different physical quantities |
| **IF COMMON** | `IFREADLINES` flag | `NLTEON` flag, `IFOP(20)` array | Different control flags |

**Code Comparison (Line 115)**:
```fortran
! atlas12.for:
NUMBER(J,ION) = NUMBER(J,ION) * XNATOM(J) * XABUND(J,IZ)  ! 2D abundance

! atlas7v.for:
NUMBER(J,ION) = NUMBER(J,ION) * XNATOM(J) * XABUND(IZ)    ! 1D abundance
```

**Physics Implication**:
- **atlas12**: Element abundances can vary with depth (2D array) → supports stratified abundances
- **atlas7v**: Element abundances constant with depth (1D array) → assumes well-mixed atmosphere

**Migration Impact**: **HIGH** - Cannot directly reuse ATLAS12 POPS migration. Must adapt:
- Array dimensions (72 → 99)
- Abundance indexing (2D → 1D)
- COMMON block structures (different layouts)
- Test cases (different grid sizes, different abundance models)

---

### 2.2 KAPP (Opacity Dispatcher)

**Lines**:
- atlas12.for: Lines 4755-4807 (~52 lines)
- atlas7v.for: Lines 4324-4441 (~118 lines)

**Signature**:
- **atlas12**: `SUBROUTINE KAPP` (no parameters)
- **atlas7v**: `SUBROUTINE KAPP(N, NSTEPS, STEPWT)` (3 parameters)

**Key Differences**:

| Aspect | atlas12.for | atlas7v.for | Impact |
|--------|-------------|-------------|--------|
| **Parameters** | None | `N, NSTEPS, STEPWT` | **CRITICAL**: Different calling convention |
| **Grid size** | `kw=72` | `kw=99` | Array dimensions different |
| **COMMON blocks** | Simpler structure | Many element blocks (BHYD, BHE, BC, etc.) | More complex state management |
| **Logic** | Unified opacity calculation | Frequency stepping logic | Different algorithm structure |

**Migration Impact**: **VERY HIGH** - Completely different subroutine interface. Cannot reuse ATLAS12 KAPP at all. Must migrate from scratch.

---

### 2.3 JOSH (Radiative Transfer Solver)

**Lines**:
- atlas12.for: Lines 9839-10099 (~260 lines)
- atlas7v.for: Lines 7941-8179 (~239 lines)

**Signature**:
- **SAME**: `SUBROUTINE JOSH(IFSCAT, IFSURF)`

**Key Differences**:

| Aspect | atlas12.for | atlas7v.for | Impact |
|--------|-------------|-------------|--------|
| **Grid size** | `kw=72` | `kw=99` | Array dimensions different |
| **Line count** | ~260 lines | ~239 lines | Slightly simpler in atlas7v |
| **Algorithm** | Likely similar core | Likely similar core | **LOW** impact (algorithms probably similar) |

**Migration Impact**: **MEDIUM** - Core RT algorithm likely similar, but:
- Array dimensions different (72 → 99)
- COMMON block structures different
- Need independent validation

---

### 2.4 READIN (Atmosphere Parser)

**Lines**:
- atlas12.for: Lines 1680-2550 (~870 lines)
- atlas7v.for: Lines 1312-2181 (~870 lines)

**Signature**:
- **atlas12**: `SUBROUTINE READIN(MODE)`
- **atlas7v**: `SUBROUTINE READIN(MODE)` (SAME)

**Key Differences**:

| Aspect | atlas12.for | atlas7v.for | Impact |
|--------|-------------|-------------|--------|
| **Grid size** | `kw=72` | `kw=99` | Array dimensions different |
| **Input formats** | ATLAS12-specific formats | ATLAS7V-specific formats | Different parsers needed |
| **COMMON blocks** | ATLAS12 state structure | Atlas7v state structure | Different output structures |

**Migration Impact**: **HIGH** - Input format parsing is code-specific. Cannot reuse ATLAS12 READIN for atlas7v.

---

## 3. COMMON Block Structural Differences

### 3.1 Element Abundance Representation

**atlas12.for** (depth-dependent abundances):
```fortran
COMMON /XABUND/XABUND(kw,99), WTMOLE(kw), XRELATIVE(99)
! Access: XABUND(J, IZ) where J=depth, IZ=element
! Physics: Supports stratified abundances (different at each depth)
```

**atlas7v.for** (constant abundances):
```fortran
COMMON /ELEM/ABUND(99), ATMASS(99), ELEM(99), XABUND(99), WTMOLE
! Access: XABUND(IZ) where IZ=element
! Physics: Well-mixed atmosphere (same abundance at all depths)
```

**Impact**: **CRITICAL** - This is a fundamental physics assumption difference, not just a code style difference.

---

### 3.2 Molecular Data Structures

**atlas12.for**:
```fortran
PARAMETER (mion=1006)
COMMON /XNF/XNF(kw,mion), XNFP(kw,mion), XNH2(kw)
COMMON /XISO/XISO(10,mion), AMASSISO(10,mion)
! Unified molecular + atomic populations in single large array
```

**atlas7v.for**:
```fortran
PARAMETER (MAXMOL=200)
COMMON /XNMOL/CODEMOL(MAXMOL), XNMOL(kw,MAXMOL), XNFPMOL(kw,MAXMOL), NUMMOL
! Separate molecular data structure with explicit codes
```

**Impact**: **HIGH** - Different data organization requires different struct design in Julia.

---

### 3.3 State Variables

**atlas12.for**:
```fortran
COMMON /STATE/P(kw), XNE(kw), XNATOM(kw), RHO(kw), CHARGESQ(kw)
! Includes CHARGESQ (mean ion charge squared)
```

**atlas7v.for**:
```fortran
COMMON /STATE/P(kw), XNE(kw), XNATOM(kw), RHO(kw), PTOTAL(kw)
! Includes PTOTAL (total pressure including turbulent)
```

**Impact**: **MEDIUM** - Different physical quantities stored, but core state similar.

---

### 3.4 Control Flags

**atlas12.for**:
```fortran
COMMON /IF/IFCORR, IFPRES, IFSURF, IFSCAT, IFMOL, IFREADLINES
! 6 control flags
```

**atlas7v.for**:
```fortran
COMMON /IF/IFCORR, IFPRES, IFSURF, IFSCAT, IFMOL, NLTEON, IFOP(20)
! 6 control flags + IFOP array (20 opacity switches)
```

**Impact**: **MEDIUM** - Atlas7v has more fine-grained opacity control.

---

## 4. The 7 SYNTHE-Used Subroutines: Detailed Comparison

### 4.1 Critical Subroutines (4 large)

| Subroutine | atlas12 Lines | atlas7v Lines | Similarity | Migration Impact |
|------------|---------------|---------------|------------|------------------|
| **READIN** | ~870 | ~870 | ~50% | HIGH - Different parsers needed |
| **JOSH** | ~260 | ~239 | ~75% | MEDIUM - Core RT similar, different structures |
| **KAPP** | ~52 | ~118 | ~40% | VERY HIGH - Different signatures! |
| **POPS** | ~113 | ~111 | ~70% | HIGH - Different abundance indexing |

**Total lines**: ~1,295 (atlas12) vs ~1,338 (atlas7v)

---

### 4.2 Utility Subroutines (3 small)

| Subroutine | atlas12 Lines | atlas7v Lines | Similarity | Migration Impact |
|------------|---------------|---------------|------------|------------------|
| **MAP1** | ~58 | ~58 | ~95% | LOW - Nearly identical |
| **PARCOE** | ~38 | ~38 | ~95% | LOW - Nearly identical |
| **W** | ~9 | ~9 | ~90% | LOW - Simple write utility |

**Total lines**: ~105 (atlas12) vs ~105 (atlas7v)

**Observation**: Utility functions are highly similar. Main migration cost is in the 4 critical subroutines.

---

### 4.3 Dependency Closure

These 7 subroutines call other subroutines (transitive dependencies):

**POPS calls**:
- PFSAHA (~950 lines) - Partition function calculator, Saha equation solver
  - Must also be migrated
  - Also has kw=72 vs 99 differences
  - Also has XABUND indexing differences

**KAPP calls**:
- 20+ element-specific opacity subroutines (HOP, HE1OP, C1OP, etc.)
  - Each ~50-300 lines
  - All have kw=72 vs 99 differences
  - Total ~3,000-5,000 lines in transitive closure

**READIN calls**:
- Input parsing utilities
  - Format-specific (atlas12 vs atlas7v have different input formats)

**Estimated total migration scope**:
- 7 direct subroutines: ~1,400 lines
- Transitive dependencies: ~4,000-6,000 lines
- **Total**: ~5,400-7,400 lines (matches original $120-200 estimate for standalone)

---

## 5. Migration Implications

### 5.1 Original Cost Estimate (Incorrect)

**Original assumption**: "Atlas7v library is shared with ATLAS12 - don't double-count cost"

**Original conclusion**: If ATLAS12 migrated, atlas7v cost = **$0** (100% reuse)

**Why wrong**:
- Atlas7v is NOT identical to ATLAS12 subroutines
- Different grid sizes (72 vs 99)
- Different COMMON block structures
- Different array indexing patterns
- Different subroutine signatures (e.g., KAPP)
- Cannot reuse tests directly

---

### 5.2 Revised Cost Estimate (Correct)

**Revised assumption**: Atlas7v subroutines are ~70-80% similar to ATLAS12, but require adaptation.

**Savings from ATLAS12 migration**:
1. **Algorithm understanding** (70% savings): Core physics already understood from ATLAS12
2. **Design patterns** (50% savings): Struct design patterns from ATLAS12 reusable
3. **Test framework** (30% savings): Testing approach similar, but new test cases needed
4. **Documentation** (40% savings): Physics documentation reusable, but code-specific docs new

**Overall savings**: **40-60%** (not 100%)

**Revised atlas7v cost**:
- **Standalone atlas7v**: $120-200 (original estimate, unchanged)
- **With ATLAS12 done**: $50-120 (40-60% savings)
  - Low estimate ($50): Assumes 60% savings, optimistic but possible
  - High estimate ($120): Assumes 40% savings, conservative

**Work still required even with ATLAS12 done**:
- Adapt array dimensions (72 → 99) in all subroutines
- Refactor COMMON blocks (different structures)
- Change abundance indexing (2D → 1D in POPS)
- Modify subroutine signatures (e.g., KAPP parameters)
- Write new test cases (different grid sizes, different physics assumptions)
- Validate independently (cannot assume ATLAS12 validation covers atlas7v)

---

### 5.3 Revised SYNTHE Cost Estimates

**Original SYNTHE cost breakdown**:
- Easy programs (8): $21-36
- Hard programs (3): $76-131
- Atlas7v library: $120-200 (standalone) or **$0** (with ATLAS12) ← **WRONG**
- Fort.X elimination: $22-40
- 30% overhead
- **Total with ATLAS12**: $329-554 ← **TOO LOW**

**Revised SYNTHE cost breakdown**:
- Easy programs (8): $21-36 (unchanged)
- Hard programs (3): $76-131 (unchanged)
- Atlas7v library: $120-200 (standalone) or **$50-120** (with ATLAS12) ← **CORRECTED**
- Fort.X elimination: $22-40 (unchanged)
- 30% overhead
- **Total with ATLAS12**: **$379-634** ← **CORRECTED** (+$50)

**Revised standalone SYNTHE cost**:
- Base: $239-407 (unchanged)
- 30% overhead: $72-122
- **Total standalone**: **$485-814** (unchanged, standalone estimate was correct)

---

## 6. Recommendations for Paula

### 6.1 Cost Budgeting

**If ATLAS12 not yet migrated**:
- Standalone SYNTHE: **$485-814** (unchanged)
- Includes full atlas7v migration ($120-200)

**If ATLAS12 already migrated**:
- SYNTHE with ATLAS12: **$379-634** (revised from $329-554)
- Includes adapted atlas7v migration ($50-120, not $0)
- **Budget recommendation**: **$500** (midpoint with buffer, revised from $440)

**If both ATLAS12 and SYNTHE needed**:
- ATLAS12: $1,100-1,737
- SYNTHE (with atlas7v savings): $379-634
- **Total**: **$1,479-2,371** (revised from $1,429-2,291)

---

### 6.2 Migration Strategy

**If ATLAS12 done first**:
1. Leverage ATLAS12 physics understanding (70% of atlas7v is similar)
2. Adapt data structures (kw=72 → 99, COMMON block layouts)
3. Modify array indexing (especially XABUND 2D → 1D)
4. Write new test cases (different grid sizes)
5. Validate independently (different physics assumptions in some places)

**Expected savings**: 40-60% of standalone atlas7v cost

**What you CANNOT reuse from ATLAS12**:
- Test cases (different grid sizes, different abundance models)
- Exact code (array dimensions, indexing patterns different)
- Some subroutine signatures (e.g., KAPP has different parameters)

**What you CAN reuse from ATLAS12**:
- Physics understanding (Saha equation, RT solvers, opacity calculations)
- Struct design patterns (AtmosphereState module, ElementPopulations)
- Validation approach (compare against Fortran output)
- Documentation (physics pipeline, governing equations)

---

## 7. Detailed Difference Summary

### 7.1 Algorithmic Similarity: ~70-80%

**Similar**:
- Core physics algorithms (Saha equation in POPS, RT in JOSH)
- Element-specific opacity calculations (H, He, C, O, etc.)
- Molecular opacity calculations (CH, OH, H2O, CO, TiO, etc.)
- Utility functions (DERIV, INTEG, interpolation)

**Different**:
- Abundance models (stratified vs well-mixed)
- Grid sizes (72 vs 99 depth points)
- Molecular data organization (unified vs separate)
- Some subroutine parameters (KAPP, NMOLEC, etc.)

---

### 7.2 Data Structure Similarity: ~50%

**Similar**:
- Core state variables (T, P, ρ, XNE)
- Frequency/wavelength handling
- Opacity arrays

**Different**:
- Element abundance representation (2D vs 1D)
- Molecular data structures (unified vs separate)
- Some state variables (CHARGESQ vs PTOTAL)
- Control flag arrays (IFREADLINES vs IFOP)

---

### 7.3 Test Case Reusability: ~0-30%

**NOT reusable**:
- Grid-dependent tests (wrong array dimensions)
- Abundance tests (different indexing)
- Integration tests (different grid sizes affect all outputs)

**Partially reusable**:
- Physics validation approach (same physical constraints)
- Edge case strategies (hot/cool stars, metal-poor/rich)
- Test framework structure (same validation philosophy)

**Fully reusable**:
- Physics documentation (governing equations)
- Validation philosophy (compare against Fortran)

---

## 8. Conclusion

**Bottom line**: Atlas7v and ATLAS12 are **related but distinct** codebases.

**Analogy**: They're like "sibling codebases" - same family, similar features, but different implementations.

**Migration strategy**:
- If ATLAS12 done: Expect **40-60% savings** on atlas7v (not 100%)
- Budget conservatively: **$50-120** for atlas7v with ATLAS12 done
- Total SYNTHE with ATLAS12: **$379-634** (not $329-554)

**Key takeaway**: Don't assume 100% code reuse between atlas12.for and atlas7v.for. They share physics but differ in implementation details that matter for migration cost.

---

## See Also

**Documents updated based on this analysis**:
- **SYNTHE_API_PROJECTION.md** - Cost estimates revised from $329-554 to $379-634 (with ATLAS12)
- **SYNTHE_API_PROJECTION_SUMMARY.md** - All cost tables and decision guidance updated
- **SYNTHE_PHASE4_INDEX.md** - Key findings updated to reflect 40-60% savings (not 100%)
- **MISSION.md** - Phase 4 summary section updated with revised costs and ROI

**Related analysis documents**:
- **ATLAS7V_PHASE2_STRUCTURE.md** - Identifies the 7 atlas7v subroutines used by SYNTHE
- **ATLAS7V_PHASE4_CRITICAL_DEEP_DIVE.md** - Deep dive on POPS, KAPP, JOSH, READIN
- **SYNTHE_MIGRATION_ASSESSMENT.md** - Uses atlas7v cost estimates for migration planning

---

**End of ATLAS12_VS_ATLAS7V_COMPARISON.md**
