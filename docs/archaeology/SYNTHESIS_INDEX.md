# Synthesis Index
*Tracking synthesis documents to avoid duplication and identify opportunities*

**Purpose**: This index tracks all synthesis documents that combine multiple source materials (deep dives, papers, analyses). It helps avoid duplicate work and identifies gaps where synthesis would be valuable.

**Last Updated**: 2025-11-10 (Phase 4 Part 2 - cost revision house cleaning)

---

## Active Synthesis Documents

### PHYSICS_PIPELINE_ATLAS12.md
**Created**: 2025-11-09 (Phase 3)
**Location**: `docs/archaeology/PHYSICS_PIPELINE_ATLAS12.md`
**Type**: Physics synthesis (WHAT/WHY focus)
**Lines**: 1,547

**Sources**:
- Deep Dive 01: Voigt Profile (HVOIGT subroutine)
- Deep Dive 02: Saha-Boltzmann Populations (POPS subroutine)
- Deep Dive 03: Line Opacity Summation (XLINOP, LINOP1)
- Deep Dive 04: Binary I/O Formats (fort.12, fort.11/21)
- Deep Dive 05: Radiative Transfer (JOSH subroutine)
- Deep Dive 06: Iteration Damping (TCORR subroutine)
- Deep Dive 07: Convective Transport (CONVEC subroutine)

**Topics Covered**:
- Physics of one complete ATLAS12 iteration
- 7-step iteration pipeline with governing equations
- Population calculations (Saha-Boltzmann, Float64 required)
- Continuum and line opacity (25+ sources, Voigt profiles)
- Radiative transfer (Feautrier-like, COEFJ/COEFH weights)
- Temperature correction (6 damping mechanisms)
- Convection (MLT, numerical derivatives)
- Convergence criteria and failure modes

**Related Synthesis**:
- ARCHITECTURE_INSIGHTS.md Section VI (migration considerations)
- Deep Dives 01-07 (detailed HOW analysis)

**Questions for Paula**: 4 flagged (OVERWT bug, TABCONT tuning, COEFJ origin, damping values)

**Status**: ✅ Complete - Phase 3 deliverable

---

### PHYSICS_PIPELINE_SYNTHE.md
**Created**: 2025-11-09 (Phase 3 extension)
**Location**: `docs/archaeology/PHYSICS_PIPELINE_SYNTHE.md`
**Type**: Physics synthesis (WHAT/WHY focus)
**Lines**: 1,607

**Sources**:
- Deep Dive 08: SPECTRV (spectrum synthesis kernel)
- Deep Dive 09: Line Accumulation (synbeg, binary format)
- Deep Dive 10: XNFPELSYN (atmosphere preparation)
- Deep Dive 11: Broadening (rotation, instrumental)
- Deep Dive 12: Line Readers (5 heterogeneous formats)
- Atlas7v Phase 1-4 (dependency analysis)
- SYNTHE_JAUREGI_2005.md (user guide paper)

**Topics Covered**:
- Physics of spectrum synthesis (fixed atmosphere, wavelength-by-wavelength RT)
- 5-stage pipeline: line prep → atmosphere prep → synthesis loop → broadening
- Line list preparation (10K-1M lines, wavelength filtering)
- Populations and continuum opacities (POPS, KAPP from Atlas7v)
- Spectrum synthesis loop (line opacity + RT at each wavelength)
- Rotational and instrumental broadening
- LTE validity, energy conservation, failure modes

**Related Synthesis**:
- SYNTHE_DEEP_DIVE_SUMMARY.md (migration roadmap)
- PHYSICS_PIPELINE_ATLAS12.md (shared physics: POPS, JOSH, Voigt)
- Atlas7v Phase 4 (critical subroutines deep dive)

**Questions for Paula**: 10 flagged (line completeness, NLTE effects, validation targets)

**Status**: ✅ Complete - Phase 3 deliverable

---

### SYNTHE_DEEP_DIVE_SUMMARY.md
**Created**: 2025-11-09 (Phase 2B extension)
**Location**: `docs/archaeology/SYNTHE_DEEP_DIVE_SUMMARY.md`
**Type**: Migration roadmap (HOW focus)
**Lines**: 922

**Sources**:
- Deep Dive 08: SPECTRV
- Deep Dive 09: Line Accumulation
- Deep Dive 10: XNFPELSYN
- Deep Dive 11: Broadening
- Deep Dive 12: Line Readers
- Atlas7v Phase 1-4 (dependency analysis)

**Topics Covered**:
- SYNTHE migration roadmap (20-32 weeks)
- 5-tier migration strategy (utilities → I/O → populations → synthesis → broadening)
- Atlas7v library as critical path (12-13 weeks, Tier 1)
- Binary I/O validation requirements
- Line list infrastructure
- Testing and validation strategy

**Related Synthesis**:
- PHYSICS_PIPELINE_SYNTHE.md (physics context)
- ARCHITECTURE_INSIGHTS.md Section V (decision points)

**Status**: ✅ Complete - Ready for implementation planning

---

### DEEP_DIVES/00_INDEX.md
**Created**: 2025-11-07 (updated 2025-11-09)
**Location**: `docs/archaeology/DEEP_DIVES/00_INDEX.md`
**Type**: Reference index and meta-synthesis
**Lines**: 673

**Sources**:
- All 12 deep dives (DD01-12)
- Atlas7v Phase 1-4 analysis
- Synthesis documents (physics pipelines, SYNTHE summary)

**Topics Covered**:
- Quick reference tables for all deep dives
- Thematic organization (precision, performance, I/O, physics)
- Migration dependency graph
- Testing strategy summary
- Open questions summary (40+ flagged)
- Statistics and completion status

**Related Synthesis**:
- All deep dives and synthesis documents
- ARCHITECTURE_INSIGHTS.md (cross-code analysis)

**Status**: ✅ Complete - Updated with merge conflict resolution

---

### PHASE4_MIGRATION_INDEX.md
**Created**: 2025-11-09 (Phase 4)
**Location**: `docs/archaeology/PHASE4_MIGRATION_INDEX.md`
**Type**: Primary entry point for migration planning
**Lines**: 185

**Sources**:
- COMMON_BLOCK_MAP.md (57 blocks analyzed)
- MIGRATION_ASSESSMENT.md (112 subroutines classified)
- API_PROJECTION.md (cost estimates)
- Deep Dives 01-07 (ATLAS12 analysis)

**Topics Covered**:
- 3-phase implementation timeline (17+ weeks)
- Quick reference tables for COMMON blocks and subroutines
- Links to detailed analysis documents
- Validation checklist

**Related Synthesis**:
- COMMON_BLOCK_MAP.md (detailed dependency maps)
- MIGRATION_ASSESSMENT.md (roadmap options)
- ARCHITECTURE_INSIGHTS.md (architecture decisions)

**Status**: ✅ Complete - Phase 4 deliverable

---

### COMMON_BLOCK_MAP.md
**Created**: 2025-11-09 (Phase 4)
**Location**: `docs/archaeology/COMMON_BLOCK_MAP.md`
**Type**: Dependency analysis (state management)
**Lines**: 563

**Sources**:
- upstream/castelli/source_codes/atlas12/atlas12.for (automated analysis)
- ARCHITECTURE_INSIGHTS.md (COMMON block overview)
- Deep Dives 01-07 (subroutine context)

**Topics Covered**:
- Complete inventory of 57 COMMON blocks in ATLAS12
- Priority classification (CRITICAL: 7, HIGH: 10, MEDIUM: 11, LOW: 29)
- Most-used blocks: RHOX (56 refs), STATE (49), TEMP (45), FREQ (42), XNF (37)
- Subroutine dependency analysis for each block
- Migration strategy recommendations

**Related Synthesis**:
- COMMON_BLOCK_ANALYSIS_SUMMARY.md (executive summary)
- MIGRATION_ASSESSMENT.md (uses block counts for difficulty rating)
- ARCHITECTURE_INSIGHTS.md Section IV (state management)

**Status**: ✅ Complete - Phase 4 deliverable 1

---

### COMMON_BLOCK_ANALYSIS_SUMMARY.md
**Created**: 2025-11-09 (Phase 4)
**Location**: `docs/archaeology/COMMON_BLOCK_ANALYSIS_SUMMARY.md`
**Type**: Executive summary (state management)
**Lines**: 228

**Sources**:
- COMMON_BLOCK_MAP.md (complete inventory)
- ARCHITECTURE_INSIGHTS.md (architecture context)

**Topics Covered**:
- Executive summary of COMMON block architecture
- Data flow diagram showing block interconnections
- Deep analysis of 7 critical blocks (RHOX, STATE, TEMP, etc.)
- Julia struct design examples
- Validation requirements

**Related Synthesis**:
- COMMON_BLOCK_MAP.md (detailed analysis)
- MIGRATION_ASSESSMENT.md (migration planning)

**Status**: ✅ Complete - Phase 4 supporting document

---

### MIGRATION_ASSESSMENT.md
**Created**: 2025-11-09 (Phase 4)
**Location**: `docs/archaeology/MIGRATION_ASSESSMENT.md`
**Type**: Migration roadmap and planning
**Lines**: 2,738

**Sources**:
- COMMON_BLOCK_MAP.md (dependency analysis)
- Deep Dives 01-07 (subroutine complexity)
- ARCHITECTURE_INSIGHTS.md (architecture decisions)
- Atlas7v Phase 1-4 (library dependencies)

**Topics Covered**:
- Section 1: Module difficulty classification (80 ATLAS12 + 32 Atlas7v subroutines)
  - Easy: 26 (32.5%), Medium: 5 (6.3%), Hard: 49 (61.2%)
- Section 2: Quick wins (15 subroutines for Week 1-3)
- Section 3: High-risk areas expansion (Ranks #8-15)
- Section 4: External dependencies (22 Julia packages)
- Section 5: Migration roadmap options (Foundation-First, Vertical Slice, Hybrid)
- Section 6: Timeline estimates (9-18 months solo, 3-9 months with 3-person team)
- Section 7: Validation strategy (6-tier: Smoke → Fortran → Physics → Edge → Stability → Cross)
- Section 8: Risk mitigation actions (concrete actions for 15 high-risk components)

**Related Synthesis**:
- MIGRATION_ASSESSMENT_SUMMARY.md (executive summary)
- COMMON_BLOCK_MAP.md (dependency context)
- API_PROJECTION.md (cost estimates for implementation)
- ARCHITECTURE_INSIGHTS.md (decisions and open questions)

**Questions for Paula**: Deferred 4 architectural decisions (Decision 5.6-5.9) pending migration strategy selection

**Status**: ✅ Complete - Phase 4 deliverable 2

---

### MIGRATION_ASSESSMENT_SUMMARY.md
**Created**: 2025-11-09 (Phase 4)
**Location**: `docs/archaeology/MIGRATION_ASSESSMENT_SUMMARY.md`
**Type**: Executive summary (migration planning)
**Lines**: 443

**Sources**:
- MIGRATION_ASSESSMENT.md (detailed assessment)

**Topics Covered**:
- Timeline estimates and resource planning
- Module classification summary
- Optimization opportunities
- Validation strategy overview
- Key risks and mitigation

**Related Synthesis**:
- MIGRATION_ASSESSMENT.md (detailed analysis)
- PHASE4_MIGRATION_INDEX.md (entry point)

**Status**: ✅ Complete - Phase 4 supporting document

---

### API_PROJECTION.md
**Created**: 2025-11-09 (Phase 4)
**Location**: `docs/archaeology/API_PROJECTION.md`
**Type**: Cost estimation and credit justification
**Lines**: 1,547

**Sources**:
- MIGRATION_ASSESSMENT.md (module classification)
- COMMON_BLOCK_MAP.md (complexity indicators)
- Deep Dives 01-07 (iteration estimates)
- ARCHITECTURE_INSIGHTS.md (open questions)

**Topics Covered**:
- Total estimated API cost: $2,500-5,700 for full ATLAS migration
- Section 1: API iteration estimates per module type
  - Easy modules (26): 65 iterations, $78-143
  - Medium modules (5): 38 iterations, $50-88
  - Hard modules (49): 467 iterations, $718-1,105
- Section 2: Physics expertise bottlenecks (25 modules requiring consultation)
- Section 3: High-iteration sections (11 modules >15 iterations each)
  - POPS+PFSAHA: 28-35 iterations, $50-70
  - LINOP1+XLINOP: 25-32 iterations, $45-65
  - TCORR: 22-28 iterations, $40-55
- Section 4: Total cost projection breakdown (ATLAS12 + Atlas7v + SYNTHE)
- Section 5: Ready-to-paste credit application justification
- Section 6: Cost reduction strategies (if budget limited)
- Section 7: Confidence intervals and uncertainty analysis

**Related Synthesis**:
- MIGRATION_ASSESSMENT.md (roadmap context)
- COMMON_BLOCK_MAP.md (complexity factors)
- ARCHITECTURE_INSIGHTS.md (decision points)

**Status**: ✅ Complete - Phase 4 deliverable 3

---

### SYNTHE_COMMON_BLOCK_MAP.md
**Created**: 2025-11-10 (Phase 4 - SYNTHE Edition)
**Location**: `docs/archaeology/SYNTHE_COMMON_BLOCK_MAP.md`
**Type**: Dependency analysis (SYNTHE pipeline)
**Lines**: 1,200

**Sources**:
- SYNTHE programs (13 .for files)
- atlas7v.for library
- Deep Dives 08-12 (SYNTHE analysis)

**Topics Covered**:
- 50 COMMON blocks across SYNTHE suite
- 32 atlas7v library blocks (shared state)
- Fort.X file communication (external state)
- Program classification: 8 Easy (0-4 blocks), 3 Hard (30-72 blocks)
- Migration recommendations

**Key Finding**: COMMON blocks are well-isolated in SYNTHE (unlike ATLAS12). Fort.X file elimination is the main challenge, NOT COMMON block refactoring.

**Related Synthesis**:
- SYNTHE_MIGRATION_ASSESSMENT.md
- COMMON_BLOCK_MAP.md (ATLAS12 comparison)

**Status**: ✅ Complete - Phase 4 SYNTHE Deliverable 1

---

### SYNTHE_MIGRATION_ASSESSMENT.md
**Created**: 2025-11-10 (Phase 4 - SYNTHE Edition)
**Location**: `docs/archaeology/SYNTHE_MIGRATION_ASSESSMENT.md`
**Type**: Migration roadmap (SYNTHE pipeline)
**Lines**: 12,000

**Sources**:
- SYNTHE_COMMON_BLOCK_MAP.md
- Deep Dives 08-12
- PHYSICS_PIPELINE_SYNTHE.md
- MIGRATION_ASSESSMENT.md (ATLAS12 template)

**Topics Covered**:
- 8 sections (same structure as ATLAS12 assessment)
- Module classification: 8 Easy (67%), 4 Hard (33%)
- Quick wins strategy (Weeks 1-3, all 8 easy programs)
- Three migration roadmap options:
  - Pipeline-First (recommended): Easy → atlas7v → hard → unification
  - Vertical Slice: End-to-end minimal first
  - Library-First: Atlas7v first (if shared with ATLAS12)
- Timeline: 15-22 weeks vs ATLAS12's 36-58 weeks (2-3× faster)
- Resource requirements (1-3 developers)
- 10 open questions for Paula (strategy, atlas7v scope, test cases, etc.)

**Key Finding**: SYNTHE is significantly more tractable than ATLAS12 due to modular pipeline architecture (13 programs vs 1 monolithic program).

**Related Synthesis**:
- SYNTHE_API_PROJECTION.md
- MIGRATION_ASSESSMENT.md (ATLAS12 comparison)

**Status**: ✅ Complete - Phase 4 SYNTHE Deliverable 2

---

### SYNTHE_API_PROJECTION.md
**Created**: 2025-11-10 (Phase 4 - SYNTHE Edition)
**Location**: `docs/archaeology/SYNTHE_API_PROJECTION.md`
**Type**: Cost estimation (SYNTHE-specific)
**Lines**: 1,100+

**Sources**:
- SYNTHE_MIGRATION_ASSESSMENT.md
- API_PROJECTION.md (ATLAS12 template)
- Deep Dives 08-12

**Topics Covered**:
- Total API cost: $379-634 (with ATLAS12, revised from $329-554) or $485-814 (standalone)
- Section 1: API iteration estimates per module type
  - Easy programs (8): 35 iterations, $21-36
  - Hard programs (3): 53 iterations, $76-131
  - Atlas7v library: 80-120 iterations, $120-200 (or $50-120 if ATLAS12 done, 40-60% savings)
  - Fort.X elimination: 15-25 iterations, $22-40
- Section 2: Physics expertise bottlenecks (4 programs vs 25 ATLAS12 subroutines)
- Section 3: High-iteration sections (atlas7v, synthe.for, Fort.X, spectrv.for)
- Section 4: Total cost projection (standalone vs with ATLAS12)
- Section 5: Credit application justification (279% ROI, revised from 1,516%)
- Section 6: Cost reduction strategies (minimal SYNTHE, defer atlas7v, keep fort.X)
- Section 7: Confidence intervals (Medium-high ±35%, higher than ATLAS12's ±40%)

**Key Finding**: SYNTHE-specific cost is $329-514 (excluding atlas7v). Atlas7v library shows 40-60% savings from ATLAS12 (not 100% reuse). See ATLAS12_VS_ATLAS7V_COMPARISON.md for details.

**Related Synthesis**:
- API_PROJECTION.md (full ATLAS cost)
- SYNTHE_MIGRATION_ASSESSMENT.md

**Status**: ✅ Complete - Phase 4 SYNTHE Deliverable 3

---

### SYNTHE_API_PROJECTION_SUMMARY.md
**Created**: 2025-11-10 (Phase 4 - SYNTHE Edition)
**Location**: `docs/archaeology/SYNTHE_API_PROJECTION_SUMMARY.md`
**Type**: Executive summary (SYNTHE cost projection)
**Lines**: 324

**Sources**:
- SYNTHE_API_PROJECTION.md (detailed analysis)

**Topics Covered**:
- Quick reference tables (cost breakdown, component details)
- Decision guidance (standalone vs with ATLAS12)
- Migration timeline (15-22 weeks)
- ROI analysis (279% ROI, $1,766-2,071 savings, revised from 1,516%)
- Comparison to ATLAS12 (2-3× easier)

**Related Synthesis**:
- SYNTHE_API_PROJECTION.md (detailed analysis)
- SYNTHE_PHASE4_INDEX.md (entry point)

**Status**: ✅ Complete - Phase 4 SYNTHE supporting document

---

### SYNTHE_PHASE4_INDEX.md
**Created**: 2025-11-10 (Phase 4 - SYNTHE Edition)
**Location**: `docs/archaeology/SYNTHE_PHASE4_INDEX.md`
**Type**: Navigation hub (SYNTHE Phase 4)
**Lines**: 545

**Sources**:
- SYNTHE_COMMON_BLOCK_MAP.md
- SYNTHE_MIGRATION_ASSESSMENT.md
- SYNTHE_API_PROJECTION.md
- SYNTHE_API_PROJECTION_SUMMARY.md

**Topics Covered**:
- Quick reference to all 5 SYNTHE Phase 4 documents
- Key findings summary (SYNTHE vs ATLAS12)
- Document navigation guide (when to read what)
- Decision trees (standalone vs with ATLAS12, migration strategy)
- Timeline overview (15-22 weeks)
- Resource requirements (1-3 developers, Paula time)
- Comparison to ATLAS12 Phase 4

**Related Synthesis**:
- All SYNTHE Phase 4 documents
- PHASE4_MIGRATION_INDEX.md (ATLAS12 equivalent)

**Status**: ✅ Complete - Phase 4 SYNTHE entry point

---

### ATLAS12_VS_ATLAS7V_COMPARISON.md
**Created**: 2025-11-10 (Phase 4 - SYNTHE Edition, cost revision)
**Location**: `docs/archaeology/ATLAS12_VS_ATLAS7V_COMPARISON.md`
**Type**: Code comparison analysis (cost correction)
**Lines**: 488

**Sources**:
- upstream/castelli/source_codes/atlas12/atlas12.for
- upstream/kurucz/synthe/atlas7v.for
- SYNTHE_MIGRATION_ASSESSMENT.md (atlas7v dependencies)
- ATLAS7V_PHASE2_STRUCTURE.md (7 subroutines used by SYNTHE)

**Topics Covered**:
- Detailed comparison of 7 atlas7v subroutines used by SYNTHE vs atlas12 counterparts
- Grid size differences (kw=72 vs kw=99)
- COMMON block structure differences
- Subroutine signature differences (KAPP parameters)
- Array indexing patterns (2D XABUND in atlas12, 1D in atlas7v)
- Migration cost impact: 40-60% savings (not 100%) if ATLAS12 migrated
- Transitive dependency closure (~5,400-7,400 lines total)

**Key Finding**: Atlas7v subroutines are ~70-80% algorithmically similar to ATLAS12, but different data structures require adaptation. Cost revised from $0 to $50-120 when ATLAS12 already migrated.

**Related Synthesis**:
- SYNTHE_API_PROJECTION.md (updated with revised costs)
- SYNTHE_API_PROJECTION_SUMMARY.md (cost tables revised)
- ATLAS7V_PHASE2_STRUCTURE.md (7 subroutines identified)
- ATLAS7V_PHASE4_CRITICAL_DEEP_DIVE.md (POPS, KAPP, JOSH, READIN analysis)

**Status**: ✅ Complete - Phase 4 SYNTHE cost correction document

---

## Potential Synthesis Opportunities

### Binary I/O Comprehensive Guide
**Trigger**: 3+ sources on binary formats
**Sources Available**:
- Deep Dive 04: ATLAS12 Binary I/O (fort.12 IIIIIII format, fort.11/21 direct-access)
- Deep Dive 09: SYNTHE Line Accumulation (fort.12 format, 7-field records)
- Deep Dive 12: Line Readers (5 heterogeneous binary/ASCII formats)
- Potential paper sources (if processed): Binary format specifications

**Synthesis Scope**:
- Unified binary I/O reference
- Platform-specific issues (gfortran vs ifort, endianness)
- Migration strategy: FortranFiles.jl vs manual parsing
- Bit-for-bit validation requirements
- Schema documentation templates

**Priority**: Medium (valuable for implementation but not blocking)
**Estimated effort**: 500-800 lines

---

### Numerical Precision Decision Guide
**Trigger**: 4 deep dives analyze precision
**Sources Available**:
- Deep Dive 01: Voigt Profile (Float32 acceptable, ~2% target)
- Deep Dive 02: Populations (Float64 REQUIRED, 40+ order magnitude range)
- Deep Dive 03: Line Opacity (Float32 adequate, Float64 recommended)
- Deep Dive 05: Radiative Transfer (mixed precision: Float32 weights, Float64 sources)
- PHYSICS_PIPELINE_ATLAS12.md Section VIII (migration considerations)

**Synthesis Scope**:
- Decision tree: When to use Float32 vs Float64
- Performance vs accuracy tradeoffs
- Testing strategy for precision validation
- Fortran REAL*4 vs REAL*8 mapping to Julia

**Priority**: High (critical for implementation decisions)
**Estimated effort**: 400-600 lines

---

### Opacity Methods Synthesis
**Trigger**: 3+ sources on opacity calculations
**Sources Available**:
- Deep Dive 03: Line Opacity Summation
- Deep Dive 10: XNFPELSYN (KAPP continuum opacity dispatcher)
- Atlas7v Phase 4: KAPP deep dive (20 IFOP flags, 20 opacity subroutines)
- VERSION_COMPARISON.md: Castelli vs Kurucz opacity differences
- Potential papers (if processed): Opacity theory and methods

**Synthesis Scope**:
- Complete opacity calculation pipeline
- 25+ continuum opacity sources (H⁻, H, He, metals, molecules)
- Line opacity methods (Voigt profiles, early-exit optimization)
- ODF vs OS (Opacity Distribution Functions vs Opacity Sampling)
- Migration strategy and performance targets

**Priority**: Medium-High (important for understanding but covered in deep dives)
**Estimated effort**: 700-1000 lines

---

### Manuscript/Paper Synthesis (If Applicable)
**Status**: Awaiting manuscript processing completion
**Sources Available**:
- SYNTHE_JAUREGI_2005.md (SYNTHE user guide)
- Potential additional papers (check docs/archaeology/papers/ or upstream/papers/)

**Synthesis Opportunity**: After processing 3+ papers, create:
- Literature review synthesis
- Historical context (Kurucz methods evolution)
- Validation case studies
- User workflow best practices

**Priority**: TBD (depends on manuscript processing phase)

---

## Source → Synthesis Mapping

### Deep Dives → Synthesis
- DD01 (Voigt) → PHYSICS_PIPELINE_ATLAS12, 00_INDEX, src/Synthe/src/voigt.jl (implemented)
- DD02 (Populations) → PHYSICS_PIPELINE_ATLAS12, 00_INDEX, ARCHITECTURE_INSIGHTS (Decision V.4), src/Synthe/src/populations.jl (implemented)
- DD03 (Line Opacity) → PHYSICS_PIPELINE_ATLAS12, 00_INDEX, src/Synthe/src/line_opacity_utils.jl (implemented)
- DD04 (Binary I/O) → PHYSICS_PIPELINE_ATLAS12, 00_INDEX, src/Synthe/src/line_readers.jl (implemented)
- DD05 (RT/JOSH) → PHYSICS_PIPELINE_ATLAS12, 00_INDEX, src/Synthe/src/radiative_transfer_fortran_exact.jl (implemented)
- DD06 (Damping) → PHYSICS_PIPELINE_ATLAS12, 00_INDEX
- DD07 (Convection) → PHYSICS_PIPELINE_ATLAS12, 00_INDEX
- DD08 (SPECTRV) → PHYSICS_PIPELINE_SYNTHE, SYNTHE_SUMMARY, 00_INDEX
- DD09 (Line Accum) → PHYSICS_PIPELINE_SYNTHE, SYNTHE_SUMMARY, 00_INDEX
- DD10 (XNFPELSYN) → PHYSICS_PIPELINE_SYNTHE, SYNTHE_SUMMARY, 00_INDEX, src/Synthe/src/populations.jl + continuum_opacity.jl (implemented)
- DD11 (Broadening) → PHYSICS_PIPELINE_SYNTHE, SYNTHE_SUMMARY, 00_INDEX, src/Synthe/src/broadening.jl (implemented)
- DD12 (Line Readers) → PHYSICS_PIPELINE_SYNTHE, SYNTHE_SUMMARY, 00_INDEX, src/Synthe/src/line_readers.jl + line_readers_molecular.jl (implemented)
- DD13 (SYNTHE Core) → 00_INDEX, PHASE5_STATUS (Phase 5 implementation foundation)

### Atlas7v Phases → Synthesis
- Phase 1 (Dependencies) → SYNTHE_SUMMARY, 00_INDEX
- Phase 2 (Structure) → SYNTHE_SUMMARY, 00_INDEX
- Phase 3 (Transitive Deps) → SYNTHE_SUMMARY, 00_INDEX
- Phase 4 (Critical Deep Dive) → SYNTHE_SUMMARY, 00_INDEX

### Papers → Synthesis
- SYNTHE_JAUREGI_2005.md → PHYSICS_PIPELINE_SYNTHE, SYNTHE_SUMMARY

---

## Synthesis Coverage Analysis

### Well-Synthesized Topics
- ✅ ATLAS12 physics pipeline (7 deep dives → 1 synthesis)
- ✅ SYNTHE physics pipeline (6 deep dives + Atlas7v → 1 synthesis)
- ✅ SYNTHE migration roadmap (6 deep dives + Atlas7v → 1 summary)
- ✅ Deep dive index and organization (13 deep dives → 1 index)

### Gaps Requiring Synthesis
- ⚠️ Binary I/O formats (scattered across DD04, DD09, DD12)
- ⚠️ Numerical precision decisions (scattered across DD01, DD02, DD03, DD05)
- ⚠️ Opacity methods (scattered across DD03, DD10, Atlas7v Phase 4)

### Future Synthesis Triggers
- After processing 3+ opacity papers → Create opacity methods literature review
- After processing Kurucz user guides → Create workflow best practices
- ✅ After completing Phase 4 COMMON block analysis → State management guide complete (COMMON_BLOCK_MAP.md, COMMON_BLOCK_ANALYSIS_SUMMARY.md)
- Before implementation phase → Create "Implementation Kickoff Guide"

---

## Usage Notes

**For future instances**:
1. Check this index BEFORE creating new synthesis documents
2. Update this index AFTER creating new synthesis
3. Flag synthesis opportunities when you find 3+ related sources
4. Cross-reference synthesis docs to maintain bidirectional links

**Maintenance schedule**:
- Update during house cleaning sessions
- Review after major phase completions
- Validate during handoffs between instances

---

**Document Status**: Updated during house cleaning session (2025-11-15)
**Version**: 1.2
**Purpose**: Track synthesis documents to avoid duplication and identify opportunities
**Scope**: Archaeological documentation only (for Phase 5+ implementation docs, see DOCUMENTATION_INDEX.md in root)

**Changes in v1.2**:
- Removed Phase 5 Migration Documents section (moved to DOCUMENTATION_INDEX.md - better fit)
- Clarified scope: archaeology synthesis only
- Added cross-reference to DOCUMENTATION_INDEX.md

**Changes in v1.1**:
- Added Deep Dive 13 (SYNTHE_CORE)
- Updated deep dive counts (12 → 13)
- Cross-referenced archaeology docs with actual Julia implementation

**Next Review**: When new synthesis documents are created or synthesis opportunities identified
