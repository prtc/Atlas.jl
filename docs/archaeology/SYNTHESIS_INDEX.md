# Synthesis Index
*Tracking synthesis documents to avoid duplication and identify opportunities*

**Purpose**: This index tracks all synthesis documents that combine multiple source materials (deep dives, papers, analyses). It helps avoid duplicate work and identifies gaps where synthesis would be valuable.

**Last Updated**: 2025-11-09 (Deep clean session)

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
- DD01 (Voigt) → PHYSICS_PIPELINE_ATLAS12, 00_INDEX
- DD02 (Populations) → PHYSICS_PIPELINE_ATLAS12, 00_INDEX, ARCHITECTURE_INSIGHTS (Decision V.4)
- DD03 (Line Opacity) → PHYSICS_PIPELINE_ATLAS12, 00_INDEX
- DD04 (Binary I/O) → PHYSICS_PIPELINE_ATLAS12, 00_INDEX
- DD05 (RT/JOSH) → PHYSICS_PIPELINE_ATLAS12, 00_INDEX
- DD06 (Damping) → PHYSICS_PIPELINE_ATLAS12, 00_INDEX
- DD07 (Convection) → PHYSICS_PIPELINE_ATLAS12, 00_INDEX
- DD08 (SPECTRV) → PHYSICS_PIPELINE_SYNTHE, SYNTHE_SUMMARY, 00_INDEX
- DD09 (Line Accum) → PHYSICS_PIPELINE_SYNTHE, SYNTHE_SUMMARY, 00_INDEX
- DD10 (XNFPELSYN) → PHYSICS_PIPELINE_SYNTHE, SYNTHE_SUMMARY, 00_INDEX
- DD11 (Broadening) → PHYSICS_PIPELINE_SYNTHE, SYNTHE_SUMMARY, 00_INDEX
- DD12 (Line Readers) → PHYSICS_PIPELINE_SYNTHE, SYNTHE_SUMMARY, 00_INDEX

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
- ✅ SYNTHE physics pipeline (5 deep dives + Atlas7v → 1 synthesis)
- ✅ SYNTHE migration roadmap (5 deep dives + Atlas7v → 1 summary)
- ✅ Deep dive index and organization (12 deep dives → 1 index)

### Gaps Requiring Synthesis
- ⚠️ Binary I/O formats (scattered across DD04, DD09, DD12)
- ⚠️ Numerical precision decisions (scattered across DD01, DD02, DD03, DD05)
- ⚠️ Opacity methods (scattered across DD03, DD10, Atlas7v Phase 4)

### Future Synthesis Triggers
- After processing 3+ opacity papers → Create opacity methods literature review
- After processing Kurucz user guides → Create workflow best practices
- After completing Phase 4 COMMON block analysis → Create state management guide
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

**Document Status**: Created during deep clean session (2025-11-09)
**Version**: 1.0
**Next Review**: After Phase 4 completion or when 3+ new deep dives created
