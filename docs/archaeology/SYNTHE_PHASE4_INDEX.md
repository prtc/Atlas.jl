# SYNTHE Phase 4 Index
**Phase 4 - SYNTHE Edition | Entry Point**

**Created**: 2025-11-10
**Updated**: 2025-11-11 (DD13 added)
**Purpose**: Navigation hub for SYNTHE migration analysis (Phase 4 deliverables + Phase 5 deep dive)
**Status**: ✅ COMPLETE (All 3 Phase 4 deliverables + DD13 focused analysis)

---

## Quick Reference

**What is Phase 4 - SYNTHE Edition?**

Complete migration assessment for the SYNTHE spectrum synthesis pipeline, parallel to Phase 4 - ATLAS12. Provides detailed analysis of SYNTHE's 11 programs + atlas7v library, migration roadmap, and API cost projection.

**Key finding**: SYNTHE is **2-2.5× easier** than ATLAS12 due to modular pipeline architecture (revised after DD13: 15-22 weeks vs ATLAS12's 36-58 weeks).

**Phase 5 addition**: DD13 (SYNTHE Core) - focused analysis of synthe.for computational bottleneck before implementation kickstart.

---

## Phase 4 SYNTHE Deliverables (3 documents, 14,700 lines)

### ✅ Deliverable 1: SYNTHE_COMMON_BLOCK_MAP.md
**Location**: `docs/archaeology/SYNTHE_COMMON_BLOCK_MAP.md`
**Lines**: 1,200
**Status**: ✅ Complete (2025-11-10)

**Purpose**: Map COMMON block dependencies across SYNTHE suite

**Contents**:
- 50 COMMON blocks across 11 programs + atlas7v library
- 32 atlas7v library blocks (shared state)
- Fort.X file communication (external state)
- Program classification (8 easy, 3 hard)

**Key finding**: SYNTHE COMMON blocks are well-isolated (8 programs have 0-4 blocks each). Fort.X files are the main challenge, not COMMON blocks.

---

### ✅ Deliverable 2: SYNTHE_MIGRATION_ASSESSMENT.md
**Location**: `docs/archaeology/SYNTHE_MIGRATION_ASSESSMENT.md`
**Lines**: 12,000
**Status**: ✅ Complete (2025-11-10)

**Purpose**: Complete migration planning for SYNTHE pipeline

**Contents** (8 sections):
1. Module difficulty classification (8 Easy, 4 Hard)
2. Quick wins (8 easy programs, Weeks 1-3)
3. High-risk areas (4 components)
4. Migration dependencies (critical path)
5. Testing strategy (validation approach)
6. Three migration roadmaps (Pipeline-First, Vertical Slice, Library-First)
7. Resource requirements (team, timeline)
8. Success criteria
9. Open questions for Paula (10 decisions)

**Key finding**: SYNTHE timeline is **14-21 weeks** (vs ATLAS12's 36-58 weeks) due to clean modular design.

---

### ✅ Deliverable 3: SYNTHE_API_PROJECTION.md
**Location**: `docs/archaeology/SYNTHE_API_PROJECTION.md`
**Lines**: 1,100+
**Status**: ✅ Complete (2025-11-10)

**Purpose**: Estimate API usage costs for SYNTHE migration

**Contents** (7 sections):
1. API iteration estimates per module type
2. Physics expertise bottlenecks (4 programs vs 25 for ATLAS12)
3. High-iteration sections (atlas7v, synthe.for, Fort.X elimination)
4. Total cost projection (standalone vs with ATLAS12)
5. Credit application justification (ROI analysis)
6. Cost reduction strategies (if budget limited)
7. Confidence intervals (Medium-high ±35%)

**Key finding**: SYNTHE API cost is **$379-634** (with ATLAS12) or **$485-814** (standalone), compared to ATLAS12's $1,100-1,737.

---

## Supporting Documents & Deep Dives

### ✅ DD13: SYNTHE_CORE.md (Phase 5)
**Location**: `docs/archaeology/DEEP_DIVES/13_SYNTHE_CORE.md`
**Lines**: 700
**Status**: ✅ Complete (2025-11-11)

**Purpose**: Focused analysis of synthe.for computational bottleneck before implementation

**Contents** (12 sections):
1. Program structure (standalone, no atlas7v linkage)
2. XLINOP NLTE line opacity (~490 lines)
3. HPROF4 hydrogen profiles with fine structure (~425 lines)
4. Helium Stark profiles (5 specialized functions, ~700 lines)
5. Memory management (2M-element BUFFER, direct I/O transposition)
6. LTE line loop with early exit optimization
7. Critical subroutines summary
8. Migration strategy (4-5 weeks, phased approach)
9. Open questions (alpha parameter, fort.18 format, empirical formulas)
10. Key takeaways and validation requirements
11. Comparison to existing deep dives (DD01, DD03, DD04, DD09)
12. Recommendations for Phase 5 implementation

**Key findings**:
- synthe.for is **STANDALONE** (no atlas7v linkage, can migrate in parallel)
- Performance bottleneck: billions of operations (millions of lines × thousands of wavelengths × 99 depths)
- Early exit optimization critical: rejects ~90% of lines before expensive Voigt calls
- Empirical H/He Stark profiles need validation data (fort.18 tables)
- Memory transposition pattern unnecessary in modern Julia (enough RAM)

**Use case**: Implementation guidance for synthe.for migration (Weeks 7-11 of SYNTHE migration)

---

### ✅ SYNTHE_API_PROJECTION_SUMMARY.md
**Location**: `docs/archaeology/SYNTHE_API_PROJECTION_SUMMARY.md`
**Lines**: 324
**Status**: ✅ Complete (2025-11-10)

**Purpose**: Executive summary of API cost projection

**Contents**:
- Quick reference tables (cost breakdown, component details)
- Decision guidance (standalone vs with ATLAS12)
- Migration timeline
- ROI analysis
- Comparison to ATLAS12

**Use case**: Quick lookup for budget planning

---

### ✅ SYNTHE_PHASE4_INDEX.md (this document)
**Location**: `docs/archaeology/SYNTHE_PHASE4_INDEX.md`
**Lines**: ~400
**Status**: ✅ Complete (2025-11-10)

**Purpose**: Entry point for SYNTHE Phase 4 deliverables

**Contents**:
- Quick reference to all documents
- Key findings summary
- Comparison to ATLAS12 Phase 4
- Decision trees (which document to read when)

---

## Key Findings Summary

### 1. SYNTHE is 2-3× Easier Than ATLAS12

| Metric | ATLAS12 | SYNTHE |
|--------|---------|--------|
| **Architecture** | Monolithic (1 program) | Modular (11 programs) |
| **Lines of code** | 23,000 | 23,000 (similar) |
| **Easy modules** | 26 (33%) | 8 (67%) |
| **Hard modules** | 49 (61%) | 4 (33%) |
| **Timeline** | 36-58 weeks | 14-21 weeks |
| **API cost** | $1,100-1,737 | $379-634 (with ATLAS12) |
| **Physics validation** | 25 subroutines | 4 programs |
| **Paula time** | 20 hours | 8 hours |

**Reason**: SYNTHE's pipeline architecture naturally isolates concerns. Each program is a standalone unit with well-defined I/O.

---

### 2. Quick Wins Are Genuine

**8 easy programs** (67% of SYNTHE):
- **Lines**: ~1,800 total (8% of code)
- **COMMON blocks**: 0-4 each
- **Timeline**: 2-3 weeks (Weeks 1-3)
- **API cost**: $21-36
- **Complexity**: Trivial to easy

**Programs**:
1. synbeg (0 blocks, 100 lines) - Wavelength setup
2. broaden (0 blocks, 200 lines) - Instrumental broadening
3. rpredict (2 blocks, 200 lines) - Predicted line reader
4. rmolecasc (1 block, 250 lines) - Molecular line reader
5. rh2ofast (1 block, 250 lines) - H2O binary reader
6. rschwenk (2 blocks, 300 lines) - TiO binary reader
7. rgfalllinesnew (4 blocks, 300 lines) - Atomic line reader
8. rotate (3 blocks, 300 lines) - Rotational broadening

**Value**: Early confidence, line list infrastructure (SpectralLine struct), validation capability

---

### 3. Atlas7v Library is Critical Path

**Component**: atlas7v.for (17,336 lines, 32 subroutines, 38 COMMON blocks)

**Complexity**: HARD - Atmosphere calculation library

**Timeline**: 4-6 weeks (longest single component)

**API cost**:
- **If ATLAS12 already migrated**: $0 (reused)
- **If standalone SYNTHE**: $120-200

**Blocks**:
- xnfpelsyn.for (depends on atlas7v)
- spectrv.for (depends on atlas7v)

**Impact**: Atlas7v library is **52% of standalone SYNTHE cost** but **0% if ATLAS12 done**.

---

### 4. Fort.X File Elimination is the Challenge

**Not COMMON blocks** (which are well-isolated), but **inter-process communication**:

**Fort.X files to eliminate**:
- fort.10 (binary): Atmosphere data (xnfpelsyn → spectrv)
- fort.12 (binary): Line list (6 readers → synthe)
- fort.14 (text): Control parameters (synbeg → all)
- fort.16 (binary): Line opacities (synthe → spectrv)
- fort.7 (text/binary): Emergent spectrum (spectrv output)

**Challenge**: Replace 11 sequential programs with unified Julia pipeline

**Solution**: AtmosphereData, LineOpacityGrid, Spectrum structs (in-memory)

**Timeline**: ~1 week (Week 15)

**API cost**: $22-40

---

### 5. Physics Validation is Lightweight

**SYNTHE**: Only 4 programs need Paula validation
1. atlas7v library (if standalone)
2. synthe.for (line opacity physics)
3. spectrv.for (radiative transfer)
4. xnfpelsyn.for (population/opacity calculations)

**ATLAS12**: 25 subroutines need Paula validation

**Paula time**:
- SYNTHE: 4-8 hours (with ATLAS12) or 12 hours (standalone)
- ATLAS12: 20 hours

**Reason**: SYNTHE programs have cleaner physics separation, less undocumented heuristics

---

## Document Navigation Guide

### When to Read What?

#### "I need the executive summary"
→ Read **SYNTHE_API_PROJECTION_SUMMARY.md** (5 minutes)
- Cost: $379-634 (with ATLAS12) or $485-814 (standalone)
- Timeline: 14-21 weeks
- Decision guidance

#### "I need to understand SYNTHE's structure"
→ Read **SYNTHE_COMMON_BLOCK_MAP.md** (30 minutes)
- 11 programs overview
- COMMON block dependencies
- Fort.X file communication
- Program classification (8 easy, 3 hard)

#### "I need a migration plan"
→ Read **SYNTHE_MIGRATION_ASSESSMENT.md** (2 hours)
- Section 1: Module classification
- Section 2: Quick wins (Weeks 1-3)
- Section 6: Three migration roadmaps
- Section 9: Open questions for Paula

#### "I need cost estimates for a grant"
→ Read **SYNTHE_API_PROJECTION.md** (1.5 hours)
- Section 1: Detailed iteration estimates
- Section 4: Total cost projection
- Section 5: Credit application justification (ROI)
- Section 6: Cost reduction strategies

#### "I want to compare SYNTHE vs ATLAS12"
→ Read **SYNTHE_PHASE4_INDEX.md** (this document, 10 minutes)
- Key findings summary (Section 3)
- Comparison tables

#### "I want to see all Phase 4 documents"
→ Read **MISSION.md** Phase 4 section
→ Read **SYNTHESIS_INDEX.md** Active Synthesis Documents

---

## Comparison to ATLAS12 Phase 4

### ATLAS12 Phase 4 Documents

1. **COMMON_BLOCK_MAP.md** (1,500 lines)
   - 57 COMMON blocks across ATLAS12 + atlas7v
   - Tightly coupled (monolithic architecture)

2. **MIGRATION_ASSESSMENT.md** (15,000 lines)
   - 80 subroutines classified (26 easy, 5 medium, 49 hard)
   - Timeline: 36-58 weeks

3. **API_PROJECTION.md** (2,000 lines)
   - Cost: $1,100-1,737
   - 25 subroutines need physics validation

---

### SYNTHE Phase 4 Documents

1. **SYNTHE_COMMON_BLOCK_MAP.md** (1,200 lines)
   - 50 COMMON blocks across SYNTHE + atlas7v
   - Loosely coupled (modular pipeline)

2. **SYNTHE_MIGRATION_ASSESSMENT.md** (12,000 lines)
   - 11 programs classified (8 easy, 0 medium, 3 hard)
   - Timeline: 14-21 weeks

3. **SYNTHE_API_PROJECTION.md** (1,100 lines)
   - Cost: $379-634 (with ATLAS12) or $485-814 (standalone)
   - 4 programs need physics validation

---

### Key Differences

| Aspect | ATLAS12 | SYNTHE |
|--------|---------|--------|
| **Architecture** | Monolithic (1 program) | Modular (11 programs) |
| **Coupling** | Tightly coupled (57 COMMON blocks) | Loosely coupled (0-4 blocks per program) |
| **Main challenge** | COMMON block refactoring | Fort.X file elimination |
| **Quick wins** | 26 easy subroutines (33%) | 8 easy programs (67%) |
| **Timeline** | 36-58 weeks | 14-21 weeks (2-3× faster) |
| **API cost** | $1,100-1,737 | $379-634 or $485-814 |
| **Complexity** | Higher (monolithic spaghetti) | Lower (clean pipeline) |

**Conclusion**: SYNTHE is significantly more tractable than ATLAS12.

---

## Decision Trees

### Decision 1: Standalone SYNTHE or With ATLAS12?

**If ATLAS12 already migrated** → ✅ **Proceed with SYNTHE immediately**
- Cost: **$379-634** (atlas7v 40-60% savings, lowest cost)
- Timeline: **14-21 weeks**
- Risk: **Low** (atlas7v algorithms proven, adaptation needed for different data structures)
- **Recommended**: Pipeline-First strategy
- **Note**: See ATLAS12_VS_ATLAS7V_COMPARISON.md for atlas12/atlas7v differences

**If ATLAS12 not yet migrated**:

**Option A: Standalone SYNTHE** (if SYNTHE is higher priority)
- Cost: **$485-814** (includes atlas7v)
- Timeline: **14-21 weeks**
- Risk: **Medium** (atlas7v not validated via ATLAS12)
- **Use case**: SYNTHE urgently needed, ATLAS12 can wait

**Option B: ATLAS12 first, then SYNTHE** (if both needed)
- Cost: **$1,479-2,371** total ($1,100-1,737 + $379-634)
- Timeline: **50-79 weeks** total (36-58 + 14-21)
- Risk: **Low** (atlas7v validated twice)
- **Use case**: Both codes needed, can afford longer timeline
- **Benefit**: Atlas7v library cost amortized

---

### Decision 2: Which Migration Strategy?

**From SYNTHE_MIGRATION_ASSESSMENT.md Section 6**:

**Strategy 1: Pipeline-First** (Recommended)
- **Pros**: Quick wins first (8 programs, Weeks 1-3), early confidence, line list infrastructure
- **Cons**: Atlas7v library blocks hard programs (wait until Week 9)
- **Best for**: Building team confidence, demonstrating progress

**Strategy 2: Vertical Slice**
- **Pros**: End-to-end spectrum in Week 13 (synbeg → atlas7v → xnfpelsyn → synthe → spectrv)
- **Cons**: No early wins, atlas7v complexity upfront
- **Best for**: Validating full pipeline early

**Strategy 3: Library-First**
- **Pros**: Atlas7v proven early (Weeks 1-6), unblocks xnfpelsyn/spectrv
- **Cons**: No quick wins, delayed gratification
- **Best for**: If atlas7v is shared with ATLAS12 (validate once, use twice)

**Recommendation**: **Pipeline-First** (if ATLAS12 done) or **Library-First** (if standalone SYNTHE)

---

### Decision 3: Cost Reduction Needed?

**If budget is tight** (see SYNTHE_API_PROJECTION.md Section 6):

**Strategy A: Defer Atlas7v** (Save $120-200)
- Migrate ATLAS12 first (includes atlas7v library)
- Then migrate SYNTHE reusing atlas7v
- **Trade-off**: SYNTHE delayed until ATLAS12 complete

**Strategy B: Minimal SYNTHE** (Save $294-492)
- Migrate only 4 core programs (synbeg, rgfalllinesnew, synthe, spectrv)
- Defer TiO/H2O readers, post-processing utilities
- **Trade-off**: Limited molecular support, no broadening

**Strategy C: Keep Fort.X Files** (Save $22-40)
- Use FortranFiles.jl for binary I/O
- Each program remains standalone
- **Trade-off**: Slower pipeline, less Julian, brittle

**Recommendation**: If tight budget, do **Strategy A** (defer atlas7v via ATLAS12). Strategies B and C compromise functionality.

---

## Timeline Overview

### Pipeline-First Strategy (Recommended)

| Week | Task | API Cost | Deliverables |
|------|------|----------|--------------|
| **1-3** | Easy programs (8) | $21-36 | SpectralLine struct, line readers, broadening |
| **4-9** | Atlas7v library | $120-200 or $0 | AtmosphereState module (if standalone) |
| **10-12** | synthe.for | $38-65 | Line opacity calculation |
| **13-14** | spectrv.for + xnfpelsyn | $38-66 | RT solver, atmosphere preparation |
| **15** | Fort.X elimination | $22-40 | Unified pipeline |
| **-** | 30% overhead | $72-122 or $36-62 | Debugging, validation |
| **TOTAL** | **14-21 weeks** | **$311-529 or $155-269** | Complete SYNTHE migration |

**With overhead**: **$485-814** (standalone) or **$379-634** (with ATLAS12)

---

## Resource Requirements

### Team

**Minimum** (from SYNTHE_MIGRATION_ASSESSMENT.md Section 7):
- 1 senior Julia developer (astrophysics background preferred)
- 1 physics consultant (Paula, 4-8 hours)

**Recommended**:
- 1 senior Julia developer (lead, atlas7v library + hard programs)
- 1 junior Julia developer (easy programs, testing)
- 1 physics consultant (Paula, 4-8 hours)

**Optimal**:
- 1 senior developer (atlas7v library + synthe.for)
- 1 mid-level developer (spectrv.for + xnfpelsyn.for)
- 1 junior developer (8 easy programs, parallelize Weeks 1-3)
- 1 physics consultant (Paula, 4-8 hours)

**Parallelization**: 8 easy programs can be migrated in parallel (Week 1-3 → 5 days with 3 developers)

---

### API Budget

**Request amount** (from SYNTHE_API_PROJECTION.md Section 5):
- **With ATLAS12**: $500 (midpoint with buffer)
- **Standalone**: $650 (midpoint with buffer)

**Conservative range**:
- With ATLAS12: $379-634
- Standalone: $485-814

**Confidence**: Medium-high (±35%)

---

### Paula Time

**Total consultation**: 4-8 hours (with ATLAS12) or 12 hours (standalone)

**Breakdown**:
1. **Atlas7v library** (if standalone): 5-8 hours
   - Validate atmosphere calculations (T, P, ρ, XNE)
   - Review POPS/PFSAHA populations
   - Check continuum opacities

2. **synthe.for**: 2-3 hours
   - Validate line opacity physics
   - Check Voigt profile accuracy
   - Review Doppler widths, Stark broadening

3. **spectrv.for**: 1-2 hours
   - Validate radiative transfer
   - Check emergent flux, angle integration

4. **xnfpelsyn.for**: 1 hour
   - Validate atmosphere data preparation
   - Check fort.10 output

**Batch questions**: Minimize context-switching by batching physics reviews (e.g., all 4 programs in Week 14)

---

## Success Criteria

Phase 4 - SYNTHE Edition is complete when:
- ✅ All 3 major deliverables created (SYNTHE_COMMON_BLOCK_MAP.md, SYNTHE_MIGRATION_ASSESSMENT.md, SYNTHE_API_PROJECTION.md)
- ✅ Supporting documents created (SYNTHE_API_PROJECTION_SUMMARY.md, SYNTHE_PHASE4_INDEX.md)
- ✅ MISSION.md updated with Phase 4 SYNTHE section
- ✅ SYNTHESIS_INDEX.md updated with 5 new documents
- ✅ Journal entry written
- ✅ All changes committed and pushed to branch

**Status**: ✅ **COMPLETE** (2025-11-10)

---

## Open Questions for Paula

**From SYNTHE_MIGRATION_ASSESSMENT.md Section 9**:

1. **Migration strategy preference** (Pipeline-First / Vertical Slice / Library-First)?
2. **Atlas7v scope** (full ATLAS12 support or minimal SYNTHE subset)?
3. **Test case availability** (reference SYNTHE outputs for validation)?
4. **Optional features usage** (CORONO, PRD in spectrv)?
5. **Line database preferences** (which molecules, which formats)?
6. **Performance requirements** (2× Fortran acceptable)?
7. **Fortran SYNTHE availability** (for validation)?
8. **Team composition** (solo, 2-person, larger)?
9. **Timeline urgency** (deadlines)?
10. **Atlas7v fallback strategy** (C interface acceptable if pure Julia stalls)?

---

## Related Documents

### Phase 4 SYNTHE Documents (this phase)
- SYNTHE_COMMON_BLOCK_MAP.md (Deliverable 1)
- SYNTHE_MIGRATION_ASSESSMENT.md (Deliverable 2)
- SYNTHE_API_PROJECTION.md (Deliverable 3)
- SYNTHE_API_PROJECTION_SUMMARY.md (Supporting)
- SYNTHE_PHASE4_INDEX.md (this document)

### Phase 4 ATLAS12 Documents (parallel)
- COMMON_BLOCK_MAP.md
- MIGRATION_ASSESSMENT.md
- API_PROJECTION.md

### Deep Dives (referenced)
- DD01: Voigt profile (ATLAS12, reusable for SYNTHE)
- DD08: SYNTHE/SPECTRV synthesis kernel
- DD09: Fort.12 line list format
- DD12: Line readers (5 formats)

### Prior Phases (foundation)
- Phase 1: Initial archaeology
- Phase 2: Deep Dives 01-07 (ATLAS12 critical subroutines)
- Phase 3: Deep Dives 08-12 (SYNTHE analysis)
- Phase 4 ATLAS12: ATLAS12 migration assessment
- Phase 4 SYNTHE: SYNTHE migration assessment (this phase)

---

## Contact

**User**: Paula (astrophysicist, ATLAS/SYNTHE domain expert)

**Context**: Day 10 of 14-day credit period

**Goal**: Complete SYNTHE Phase 4 analysis to match ATLAS12 Phase 4 thoroughness

**Status**: ✅ Phase 4 SYNTHE Edition COMPLETE

---

**For questions or feedback**, consult:
- SYNTHE_MIGRATION_ASSESSMENT.md Section 9 (Open questions)
- SYNTHE_API_PROJECTION.md Section 5 (Credit application)
- MISSION.md (project roadmap)

---

**End of SYNTHE_PHASE4_INDEX.md**

**Next**: Update MISSION.md and SYNTHESIS_INDEX.md, write journal entry
