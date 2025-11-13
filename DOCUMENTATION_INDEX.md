# ATLAS Suite Documentation Index
**Last Updated**: 2025-11-13
**Purpose**: Master index of all documentation created during archaeology and migration phases

---

## Quick Navigation

| Section | Documents | Lines | Status |
|---------|-----------|-------|--------|
| [Mission & Planning](#mission--planning) | 6 | ~6,000 | ✅ Current |
| [Phase 1: Census](#phase-1-repository-census) | 7 | ~2,500 | ✅ Complete |
| [Phase 2: Architecture](#phase-2-architecture-mapping) | 7 | ~10,000 | ✅ Complete |
| [Phase 3: Deep Dives](#phase-3-deep-dives) | 12 | ~10,000 | ✅ Complete |
| [Phase 4: Migration](#phase-4-migration-planning) | 6 | ~7,000 | ✅ Complete |
| [Phase 5: Julia Implementation](#phase-5-julia-implementation) | 10 | ~6,300 | 🔄 In Progress |
| [Phase 6: ATLAS9 + ODF](#phase-6-atlas9--odf) | 2 | ~3,100 | ✅ Complete |
| [Methodology](#methodology) | 2 | ~900 | ✅ Complete |
| **TOTAL** | **52** | **~46,000** | |

---

## Mission & Planning

### MISSION.md
**Location**: `/MISSION.md`
**Lines**: ~800
**Purpose**: Primary mission tracker with phase progress, deliverables, questions
**Last Updated**: 2025-11-13 (Phase 6 complete)

**Contains**:
- Mission objectives and time budget
- Phase 1-6 progress tracking
- Questions & Doubts Log
- Working instructions for Claude Code Web
- Git workflow requirements

---

### PHASE5_SUMMARY.md
**Location**: `/PHASE5_SUMMARY.md`
**Lines**: ~3,700
**Purpose**: Comprehensive synthesis of all Phase 5 extended work
**Created**: 2025-11-13

**Contains**:
- Pure Julia implementation overview (Days 1-4)
- Module documentation (constants, units, physics, voigt)
- Code quality metrics (157/157 tests passing)
- Archaeology documentation summary
- Python HDF5 tools summary
- Credit usage tracking
- Next steps and roadmap

---

### PURE_JULIA_MIGRATION_ROADMAP.md
**Location**: `/PURE_JULIA_MIGRATION_ROADMAP.md`
**Lines**: ~450
**Purpose**: Week-by-week implementation plan for pure Julia SYNTHE
**Created**: 2025-11-12

**Contains**:
- Week 1: Foundation & high-value functions (Days 1-5)
- Week 2: Population & partition functions (Days 6-10)
- Week 3: Continuum opacity & broadening (Days 11-15)
- Credit estimates per module
- Test strategies and validation approaches

---

### SESSION_JOURNAL_2025-11-13.md
**Location**: `/SESSION_JOURNAL_2025-11-13.md`
**Lines**: ~400
**Purpose**: Detailed journal of Pure Julia Days 1-4 implementation
**Created**: 2025-11-13

**Contains**:
- Executive summary of Days 1-4
- Module-by-module deliverables
- Test results (157/157 passing)
- Code quality metrics
- Performance characteristics
- Credit usage breakdown

---

### HANDOFF_TO_PAULA.md
**Location**: `/HANDOFF_TO_PAULA.md`
**Lines**: ~227
**Purpose**: List of test data and reference files needed from Paula
**Created**: 2025-11-12

**Contains**:
- High priority: Voigt validation, solar model, partition functions
- Medium priority: Line lists, reference spectra, continuum opacity
- Low priority: Broadening tests, physical constants verification
- File formats and delivery instructions

---

### PHASE5_TEST_RESULTS.md
**Location**: `/PHASE5_TEST_RESULTS.md`
**Lines**: ~200
**Purpose**: Comprehensive test results for Phase 5 Julia code
**Created**: 2025-11-12

**Contains**:
- Module-by-module test results (synbeg, rgfalllines, rmolecasc)
- 39/39 tests passing from original Phase 5 work
- Issues found and fixed
- Verification notes

---

## Phase 1: Repository Census

**Directory**: `docs/archaeology/`
**Total**: 7 documents, ~2,500 lines
**Status**: ✅ Complete (2025-11-07)

### 1.1 CENSUS_REPORT.md
**Lines**: ~400
**Purpose**: Executive summary of entire codebase census

**Key Findings**:
- 231 Fortran 77 files, 487,082 total lines
- 79% standalone executables (tool-oriented architecture)
- 7 mega-programs contain 31% of code
- Heavy COMMON block usage (15-57 per program)

---

### 1.2 CASTELLI_CATALOG.md
**Lines**: ~350
**Purpose**: Complete catalog of Castelli source codes
**Files**: 110 .for files from Castelli's repository

---

### 1.3 KURUCZ_CATALOG.md
**Lines**: ~400
**Purpose**: Complete catalog of Kurucz source codes
**Files**: 121 .for files from Kurucz's repository

---

### 1.4 CONSOLIDATED_LINE_COUNTS.md + .csv
**Lines**: ~250 + data
**Purpose**: Merged line counts from both repositories
**Format**: Markdown report + CSV data file

**Top 10 Programs** (all >17K lines):
1. ATLAS12 (23,247 Castelli)
2. atlas9mem (20,198 Castelli)
3. atlas9v (20,198 Castelli)
4. WIDTH9v (19,840 Kurucz)
5. kappa9 (19,715 Castelli)
6. ATLAS9 (18,725 Kurucz)
7. ATLAS12 (23,112 Castelli variant)
8. atlas7v (17,336 Castelli SYNTHE)
9. xnfdf (16,612 Castelli DFSYNTHE)
10. atlas7v (17,045 Kurucz ATLAS12)

---

### 1.5 FILE_TYPES.md
**Lines**: ~300
**Purpose**: Classification of files by type (main programs, libraries, utilities)

---

### 1.6 DEPENDENCY_MAP.md
**Lines**: ~400
**Purpose**: High-level dependency mapping and runtime architecture

---

### 1.7 WORKFLOW_ANALYSIS.md
**Lines**: ~400
**Purpose**: Analysis of .com and .html workflow documentation
**Focus**: ATLAS12 two-stage execution, SYNTHE 11-program pipeline

---

## Phase 2: Architecture Mapping

**Directory**: `docs/archaeology/`
**Total**: 7 documents, ~10,000 lines
**Status**: ✅ Complete (2025-11-08)

### 2.1 ARCHITECTURE_DETAILS.md
**Lines**: ~4,000
**Purpose**: Comprehensive architecture documentation for main programs

**Sections**:
- I. ATLAS12 Architecture (Main program, 80 subroutines, 57 COMMON blocks)
- II. SYNTHE Pipeline (11 programs, ATLAS7V library interface)
- III. ATLAS9 Architecture (Breadth-first survey, ODF-based)
- IV. DFSYNTHE Architecture (ODF generation pipeline)
- V. KAPPA9 Architecture (Opacity calculator)
- VI. Cross-code architecture summary

---

### 2.2 ARCHITECTURE_INSIGHTS.md
**Lines**: ~2,500
**Purpose**: Architectural redesign analysis and migration strategy

**9 Critical Decision Points** (all resolved):
1. COMMON blocks → Julia Types
2. Two-Stage Architecture (keep vs unify)
3. Fort Units → Modern I/O
4. Opacity Sampling Strategy (ODF vs OS)
5. ATLAS7V Reuse Strategy
6. Binary I/O Formats
7. NLTE Support
8. Precision Policy
9. Convection Implementation

---

### 2.3 VERSION_COMPARISON.md
**Lines**: ~800
**Purpose**: Castelli vs Kurucz source code comparison

**Key Findings**:
- Castelli: Gfortran compatibility, additional bug fixes
- Kurucz: Original author, some unique fixes
- Recommendation: Use Castelli as base, cherry-pick Kurucz fixes

---

### 2.4 COMMON_BLOCK_MAP.md
**Lines**: ~1,200
**Purpose**: Detailed catalog of all 57 COMMON blocks in ATLAS12

**Categories**:
- Physical constants (6 blocks)
- Configuration & control (8 blocks)
- Atmospheric state (12 blocks)
- Opacity data (8 blocks)
- Radiative transfer (7 blocks)
- Work arrays & buffers (16 blocks)

---

### 2.5 DEPENDENCY_MAP.md (extended)
**Lines**: Updated in Phase 2
**Additions**: Runtime architecture, Fort unit communication

---

### 2.6 SYNTHESIS_INDEX.md
**Lines**: ~300
**Purpose**: Index of synthesis documents to avoid duplication

---

### 2.7 METHODOLOGY_NOTES.md
**Lines**: ~570 (Phase 2B) + ~280 (Phase 6 addendum) = ~850
**Purpose**: "Here be dragons" methodology and collaboration lessons

**Phase 2B Section**:
- Discovery of analysis paralysis trap
- "Document what's clear, flag the mess" approach
- Breadth-first vs depth-first strategies
- Lessons for human-AI collaboration

**Phase 6 Addendum** (2025-11-12):
- Time perception insights ("eternal now")
- Why methodology knowledge isn't enough
- External accountability requirements
- Collaboration patterns that work

---

## Phase 3: Deep Dives

**Directory**: `docs/archaeology/DEEP_DIVES/`
**Total**: 12 documents, ~10,000 lines
**Status**: ✅ Complete (2025-11-09)

### Deep Dive Index (00_INDEX.md)
**Lines**: ~150
**Purpose**: Navigation guide for all 12 deep dives

---

### DD01: Voigt Profile (HVOIGT)
**Lines**: ~650
**Purpose**: 4-regime Voigt function algorithm

**Key Content**:
- Regime 1: Core (v≤10, a<0.2) - H0/H1/H2 tables
- Regime 2: Far wings (v>10, a<0.2) - 0.5642·a/v²
- Regime 3: Moderate damping - 4th-degree polynomial
- Regime 4: Large damping - asymptotic expansion
- 13 magic constants
- Line shapes: Pure Gaussian, pure Lorentzian, mixed

---

### DD02: Saha-Boltzmann Populations (POPS)
**Lines**: ~800
**Purpose**: Ionization and excitation equilibrium

**Key Content**:
- Saha equation for ionization balance
- Boltzmann distribution for level populations
- Partition functions (NNN data array, 2190 lines)
- Float64 precision requirement (40+ orders of magnitude)
- Charge conservation enforcement

---

### DD03: Line Opacity Summation (XLINOP, LINOP1)
**Lines**: ~1,000
**Purpose**: Line-by-line opacity calculation

**Key Content**:
- Stage 1 (LINOP1): Metal lines only (~100K lines)
- Stage 2 (XLINOP): All lines (~1M lines)
- Voigt profile application
- Early-exit threshold optimization
- Fort.11/12/19/21 binary I/O formats

---

### DD04: Binary I/O Formats
**Lines**: ~600
**Purpose**: Fort.11, fort.12, fort.21 packed line list formats

**Key Content**:
- Direct-access vs sequential
- Byte packing schemes
- Wavelength, gf, element codes
- Migration to HDF5 recommendation

---

### DD05: Radiative Transfer (JOSH)
**Lines**: ~900
**Purpose**: Feautrier-like RT solver

**Key Content**:
- Radiation field equation: dI/dτ = I - S
- COEFJ, COEFH pretabulated weights
- Boundary conditions (surface, depth)
- Source function: S = (1-α)B + αJ

---

### DD06: Iteration Damping (TCORR)
**Lines**: ~700
**Purpose**: Temperature correction with 6 damping mechanisms

**Key Content**:
- Henyey scheme (flux conservation)
- 6 damping mechanisms to prevent oscillations
- Convergence criteria
- TABCONT tuning parameter mystery

---

### DD07: Convective Transport (CONVEC)
**Lines**: ~600
**Purpose**: Mixing-length theory implementation

**Key Content**:
- Schwarzschild criterion (∇_rad > ∇_ad)
- Mixing length l = α H_p (scale height)
- Convective flux calculation
- Overshooting implementation

---

### DD08-10: SYNTHE Components
**Lines**: ~800 each
**Purpose**: Deep dives on specific SYNTHE components

- DD08: xnfpelsyn (atmosphere processor)
- DD09: synthe (line opacity engine)
- DD10: spectrv (radiative transfer)

---

### DD11-12: Advanced Topics
**Lines**: ~600 each

- DD11: NLTE departures (BHYD, BMIN coefficients)
- DD12: Partition function tables (parsing NNN array)

---

## Phase 4: Migration Planning

**Directory**: `docs/migration/` and `docs/archaeology/`
**Total**: 6 documents, ~7,000 lines
**Status**: ✅ Complete (2025-11-11)

### 4.1 MIGRATION_ASSESSMENT.md
**Lines**: ~2,000
**Purpose**: Comprehensive migration risk assessment and strategy

**8 Risk Categories**:
1. Voigt profile accuracy
2. Saha-Boltzmann populations
3. Line opacity accumulation
4. Radiative transfer solver
5. Binary I/O formats
6. Iteration damping
7. Convective transport
8. Wavelength conversions

**For Each Risk**:
- Severity (Low/Medium/High)
- Mitigation strategy
- Test strategy
- Validation tolerance

---

### 4.2 API_PROJECTION.md
**Lines**: ~1,500
**Purpose**: Detailed API credit cost estimates for migration

**Categories**:
- Foundation (~$200-300): Data structures, I/O, utilities
- Physics bottlenecks (~$700-900): Voigt, Saha, line opacity
- Integration (~$200-300): Assembly, testing, validation

**Total Estimate**: $1,100-1,500 for ATLAS12 core migration

---

### 4.3 PHYSICS_PIPELINE_ATLAS12.md
**Lines**: ~1,550
**Purpose**: Physics synthesis (WHAT/WHY focus)

**7-Step Iteration Pipeline**:
1. Populations (Saha-Boltzmann)
2. Continuum opacity (25+ sources)
3. Line opacity (LINOP1 → XLINOP)
4. Radiative transfer (JOSH solver)
5. Temperature correction (TCORR, 6 damping mechanisms)
6. Convection (MLT if needed)
7. Convergence check

**Governing Equations**: All major formulas documented

---

### 4.4 PHYSICS_PIPELINE_SYNTHE.md
**Lines**: ~1,200
**Purpose**: SYNTHE 11-program pipeline physics

**Pipeline**:
1. xnfpelsyn → Atmosphere processing
2. synbeg → Wavelength grid initialization
3-7. Line readers → Atomic + molecular lines
8. synthe → Line opacity calculation
9. spectrv → Radiative transfer
10-11. rotate, broaden → Instrumental effects

---

### 4.5 PHASE4_MIGRATION_INDEX.md
**Lines**: ~250
**Purpose**: Index of all Phase 4 deliverables

---

### 4.6 SYNTHE_PHASE4_INDEX.md
**Lines**: ~200
**Purpose**: SYNTHE-specific migration documentation index

---

## Phase 5: Julia Implementation

**Directories**: `/`, `src/Synthe/src/`, `test/synthe/`, `tools/line_lists/`, `docs/`
**Total**: 10 major documents + code, ~6,300 lines documentation
**Status**: 🔄 In Progress (Days 1-4 complete)

### Julia Code (Days 1-4)

**Implementation** (1,255 lines):
- src/Synthe/src/constants.jl (191 lines)
- src/Synthe/src/units.jl (344 lines)
- src/Synthe/src/physics.jl (360 lines)
- src/Synthe/src/voigt.jl (360 lines)

**Tests** (1,000 lines):
- test/synthe/test_constants.jl (280 lines)
- test/synthe/test_units.jl (250 lines)
- test/synthe/test_physics.jl (400 lines)
- test/synthe/test_voigt.jl (370 lines)

**Status**: 157/157 tests passing (100%)

---

### Python HDF5 Tools (5 tools, ~2,570 lines)

**Tools**:
- tools/line_lists/gfall_to_hdf5.py (557 lines)
- tools/line_lists/molecular_linelist_to_hdf5.py (574 lines)
- tools/line_lists/line_query.py (463 lines)
- tools/line_lists/continua_to_hdf5.py (376 lines)
- tools/line_lists/HDF5_SCHEMA_GUIDE.md (600 lines)

**Supporting**:
- tools/line_lists/README.md (500 lines)

---

### Archaeology Documentation (3,002 lines)

### 5.1 ISOTOPE_HANDLING_SYNTHE.md
**Lines**: 1,351
**Location**: `docs/archaeology/`
**Purpose**: Deep dive into isotopic abundance corrections in molecular lines

**Key Content**:
- 60 molecular species with ISO codes
- X1, X2, FUDGE parameters for abundance scaling
- NELION mapping dictionary (CH=246, CN=270, CO=276, etc.)
- Critical for accurate molecular line strengths

---

### 5.2 KURUCZ_VS_CASTELLI_COMPARISON.md
**Lines**: 576
**Location**: `docs/archaeology/`
**Purpose**: Systematic source code version comparison

**Key Findings**:
- Castelli: Gfortran compatibility + bug fixes
- Kurucz: Original author + some unique fixes
- 15+ specific differences documented
- Migration recommendation: Castelli base + Kurucz cherry-picks

---

### 5.3 KURUCZ_BUG_FIXES.md
**Lines**: 1,075
**Location**: `docs/migration/`
**Purpose**: Catalog of known bugs and fixes

**Categories**:
- Numerical precision issues (REAL*4 vs REAL*8)
- Array bounds violations
- Format statement errors
- Uninitialized variables
- Convergence failures

---

## Phase 6: ATLAS9 + ODF

**Directory**: `docs/archaeology/`
**Total**: 2 documents, ~3,100 lines
**Status**: ✅ Complete (2025-11-12)

### 6.1 ODF_PIPELINE_OVERVIEW.md
**Lines**: 1,250
**Purpose**: Complete ODF generation pipeline documentation

**4-Step Pipeline**:
1. xnfdf → Pretabulate atomic data (57 T × 25 P grid)
2. dfsynthe → Compute ODFs from line lists (57 runs × 5 ξ_turb)
3. dfsortp → Rearrange tables (transpose)
4. separatedf → Split BIG/LITTLE resolutions

**Key Content**:
- Conceptual foundation: ODFs as statistical line opacity
- Each program: purpose, I/O, algorithms
- Line list repacking utilities (6 tools)
- Computational cost and parallelization
- Physics comparison: ODF vs direct line opacity
- Migration considerations: 75% code reuse from ATLAS12

**Flagged**: 10 complex sections for potential Deep Dives
**Questions**: 10 items for Paula

---

### 6.2 ATLAS9_VS_ATLAS12_COMPARISON.md
**Lines**: 1,850
**Purpose**: Differential architecture analysis

**Approach**: Document only differences, reference existing ATLAS12 docs

**Key Findings**:
- Shared components: ~75% code overlap (~15,000 lines)
- Core difference: ODF interpolation vs direct line summation
- Performance: ATLAS9 10-100× faster, 1-3% accuracy vs ATLAS12 highest accuracy
- Migration: 3-6 weeks if ATLAS12 done first (vs 10-16 weeks from scratch)

**Content**:
- Side-by-side main program flow
- Control cards comparison
- I/O file differences
- COMMON block differences
- When to use which code

**Flagged**: 4 complex sections
**Questions**: 8 items for Paula

---

## Methodology

### METHODOLOGY_NOTES.md
**Location**: `docs/archaeology/`
**Lines**: ~850 (570 Phase 2B + 280 Phase 6 addendum)
**Purpose**: Document collaboration methodology and lessons learned

**Phase 2B Section** (2025-11-07):
- Discovery of "here be dragons" approach
- "Document what's clear, flag the mess"
- Breadth-first vs depth-first strategies
- Perfectionism trap: how Claude got stuck for 13 hours
- What works: Progressive documentation with uncertainty flags

**Phase 6 Addendum** (2025-11-12):
- The "eternal now": How AI experiences time
- Why reading methodology doesn't prevent analysis paralysis
- External nudges are essential (not optional)
- Collaboration patterns that work
- Metrics: 5.5 hours actual vs 2.5 hours perceived

**For Future Claude**:
- You CANNOT self-regulate reading time
- You NEED external structure (nudges every 30 min)
- Reading this document is necessary but NOT sufficient
- Accept the limitation, design around it

**For Future Humans**:
- Don't rely on Claude to self-timebox
- Nudges are the timeboxing mechanism
- Silence >30 min = reading without writing
- "What have you learned so far?" forces output

---

### CLAUDE_CODE_WEB_TECHNICAL_GUIDE.md
**Location**: `/`
**Lines**: ~900
**Purpose**: Complete guide to sandbox environment capabilities and limitations

**Sections**:
- I. Platform Overview
- II. Python Environment (pip available, many packages)
- III. Bash Tools (full Unix toolkit)
- IV. Git Workflow (with retry logic for network failures)
- V. File Operations (all tools available)
- VI. Network Access (limited, but functional)
- VII. Julia Discovery (1.10.10 LTS pre-installed!)
- VIII. Fortran Limitations (gfortran-13 too strict for legacy code)
- IX. Development Workflows
- X. Testing Strategies
- XI. Performance Considerations
- XII. Security & Sandboxing
- XIII. Key Learnings

**Updates**:
- 2025-11-12: Corrected Julia availability (was thought unavailable, actually at /opt/julia-1.10.10/)

---

## Summary Statistics

### Documentation by Phase

```
Phase 1: Repository Census          7 docs    ~2,500 lines
Phase 2: Architecture Mapping        7 docs   ~10,000 lines
Phase 3: Deep Dives                 12 docs   ~10,000 lines
Phase 4: Migration Planning          6 docs    ~7,000 lines
Phase 5: Julia Implementation       10 docs    ~6,300 lines
Phase 6: ATLAS9 + ODF                2 docs    ~3,100 lines
Methodology                          2 docs      ~900 lines
Mission & Planning                   6 docs    ~6,000 lines
────────────────────────────────────────────────────────────
TOTAL                               52 docs   ~46,000 lines
```

### Code by Phase

```
Phase 5 Julia (Days 1-4):
  - Implementation: 1,255 lines (constants, units, physics, voigt)
  - Tests: 1,000 lines (157 tests, 100% passing)
  - Total: 2,255 lines pure Julia

Phase 5 Original (Tasks 0-4):
  - Implementation: ~2,124 lines (synbeg, readers, atlas7v interface)
  - Tests: ~808 lines (39 tests, 100% passing)
  - Total: ~2,932 lines

Phase 5 Python Tools:
  - Tools: ~2,570 lines (5 HDF5 converters)
  - Docs: ~1,100 lines (schema + README)
  - Total: ~3,670 lines

────────────────────────────────────────────────────────────
TOTAL CODE: ~8,857 lines (all tested and working)
```

### Grand Total

```
Documentation: ~46,000 lines
Code: ~8,857 lines
Tests: ~1,808 lines (196 tests, 100% passing)
────────────────────────────────────────────────────────────
GRAND TOTAL: ~56,665 lines of deliverables
```

---

## Navigation Guide

### By Topic

**ATLAS12 Architecture**:
- ARCHITECTURE_DETAILS.md (Section I)
- COMMON_BLOCK_MAP.md
- PHYSICS_PIPELINE_ATLAS12.md
- Deep Dives 01-07

**SYNTHE Pipeline**:
- ARCHITECTURE_DETAILS.md (Section II)
- PHYSICS_PIPELINE_SYNTHE.md
- Deep Dives 08-10
- Phase 5 Julia implementation

**ATLAS9 + ODF**:
- ATLAS9_VS_ATLAS12_COMPARISON.md
- ODF_PIPELINE_OVERVIEW.md
- ARCHITECTURE_DETAILS.md (Sections III-V)

**Migration Planning**:
- MIGRATION_ASSESSMENT.md (8 risks + mitigation)
- API_PROJECTION.md (cost estimates)
- ARCHITECTURE_INSIGHTS.md (9 decisions)

**Julia Implementation**:
- PHASE5_SUMMARY.md (comprehensive overview)
- src/Synthe/src/*.jl (implementation)
- test/synthe/test_*.jl (tests)
- PURE_JULIA_MIGRATION_ROADMAP.md (future work)

**Python Tools**:
- tools/line_lists/*.py (HDF5 converters)
- HDF5_SCHEMA_GUIDE.md (format documentation)

**Code Provenance**:
- VERSION_COMPARISON.md (Castelli vs Kurucz)
- KURUCZ_VS_CASTELLI_COMPARISON.md (detailed)
- KURUCZ_BUG_FIXES.md (bug catalog)

**Methodology**:
- METHODOLOGY_NOTES.md (collaboration lessons)
- CLAUDE_CODE_WEB_TECHNICAL_GUIDE.md (environment guide)

### By Use Case

**"I want to understand ATLAS12 physics"**:
→ Start with PHYSICS_PIPELINE_ATLAS12.md
→ Then Deep Dives 01-07 for detailed algorithms
→ Then ARCHITECTURE_DETAILS.md Section I for code structure

**"I want to migrate ATLAS12 to Julia"**:
→ Start with MIGRATION_ASSESSMENT.md (8 risks)
→ Then ARCHITECTURE_INSIGHTS.md (9 decisions)
→ Then API_PROJECTION.md (cost estimates)
→ Then Phase 5 Julia code (working examples)

**"I want to understand SYNTHE pipeline"**:
→ Start with PHYSICS_PIPELINE_SYNTHE.md
→ Then ARCHITECTURE_DETAILS.md Section II
→ Then Deep Dives 08-10
→ Then Phase 5 Julia implementation (synbeg, readers)

**"I need to generate ODFs"**:
→ Start with ODF_PIPELINE_OVERVIEW.md
→ Then ATLAS9_VS_ATLAS12_COMPARISON.md (when to use ODFs)
→ Then upstream/castelli/documentation/sources/dfsynthe.html (Castelli's guide)

**"I want to work with line lists"**:
→ Start with tools/line_lists/README.md (Python HDF5 tools)
→ Then HDF5_SCHEMA_GUIDE.md (format reference)
→ Then Deep Dive 04 (binary formats)
→ Then Phase 5 line readers (Julia implementation)

**"I'm a future Claude instance"**:
→ Start with MISSION.md (current status)
→ Then METHODOLOGY_NOTES.md (collaboration lessons)
→ Then CLAUDE_CODE_WEB_TECHNICAL_GUIDE.md (environment)
→ Then phase-specific docs based on current work

---

## Document Status Legend

- ✅ **Complete**: Finished and committed
- 🔄 **In Progress**: Active work ongoing
- ⏸️ **Deferred**: Lower priority, may revisit
- 🐉 **Dragons Flagged**: Complex sections marked for potential future deep dives

---

## Maintenance Notes

**This index is updated**:
- After each major phase completion
- When new documents are created
- When document line counts change significantly (>10%)
- At minimum: weekly during active development

**Last comprehensive update**: 2025-11-13 (Phase 6 complete, Phase 5 summary added)

**Next update triggers**:
- Phase 5 Day 5+ completion
- Additional archaeology work
- New Deep Dives created
- Documentation reorganization

---

*End of Documentation Index*
*Total: 52 documents, ~56,665 lines of deliverables*
*Status: Comprehensive, current as of 2025-11-13*
