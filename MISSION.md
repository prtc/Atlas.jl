# ATLAS Suite Code Archaeology Mission
*Legacy Code Documentation for Julia Migration*

## Mission Status
**Current Phase**: Phase 3 - Physics Pipeline Documentation ✅ COMPLETE
**Last Updated**: 2025-11-09
**Days Remaining**: 9

---

## Mission Objective
Create comprehensive documentation of the ATLAS Fortran suite to:
1. Guide future Julia migration work
2. Provide API usage estimates for research credit application  
3. Generate material for Astronomy & Computing publication

**Time Budget**: 2 weeks | **Resource**: $250 Claude Code Web credits (they expire on November 18 at 11:59 PM PT)

---

## Critical Context from Paula

### Migration Priority
**Primary targets**: ATLAS12 and SYNTHE
- **ATLAS12** is the main goal for API credit application and Astronomy & Computing paper
- These are Paula's active research tools
- Other components (ATLAS9, WIDTH, KAPPA9, etc.) are lower priority but still need documentation

### The "g" Suffix Mystery - Working Hypothesis
**Hypothesis**: "g" likely means "gfortran" compatibility
- Castelli ported Kurucz's original codes to compile with gfortran
- Patterns observed: atlas9 vs atlas9g, synthe vs syntheg, width9 vs width9g
- **VERIFY THIS**: Check source code comments, compilation notes, or version history
- **If confirmed**: Document what changes were needed for gfortran compatibility

### Code Provenance - Critical for Phase 2
- **Kurucz**: Original author (deceased March 2025) - authoritative but older compilers
- **Castelli**: Maintained and ported the codes - gfortran compatible, possible bug fixes
- **IMPORTANT**: Castelli and Kurucz versions may have diverged over time with independent bug fixes
- **Phase 2 task**: Carefully compare Castelli vs Kurucz versions of ATLAS12 and its dependencies
- **Decision needed**: Which version forms the migration base? Or do we need to merge fixes from both?

### Questions for Phase 2 Analysis
1. What exactly changed between Kurucz and Castelli "g" versions?
2. Are there bug fixes in one version but not the other?
3. Which version is more numerically stable/accurate?
4. Are there compilation flags or precision differences that matter?

---

## Progress Tracker

### Phase 1: Repository Census ✅ COMPLETE
**Target**: Days 1-2 | **Status**: ✅ Complete

#### Tasks:
- [x] 1.1 - Catalog all .for files in `upstream/castelli/source_codes/`
- [x] 1.2 - Catalog all .for files in `upstream/kurucz/source_codes/`
- [x] 1.3 - Count total lines of code per file
- [x] 1.4 - Identify file types (main program / subroutine / function)
- [x] 1.5 - Create initial dependency map
- [x] 1.6 - Write `docs/archaeology/CENSUS_REPORT.md`

**Summary**:
Comprehensively cataloged 231 Fortran 77 files (487K lines) across both repositories. Created 7 detailed reports (CASTELLI_CATALOG.md, KURUCZ_CATALOG.md, CONSOLIDATED_LINE_COUNTS.md+.csv, FILE_TYPES.md, DEPENDENCY_MAP.md, CENSUS_REPORT.md) totaling ~2,500 lines of analysis. Key findings: Tool-oriented architecture (79% standalone executables), 7 mega-programs contain 31% of code, ATLAS12 (23K lines, 72 subroutines) and SYNTHE (3K + 17K library) are primary migration targets, heavy COMMON block usage (15-57 per program), Pure F77 style with no modules.

---

### Phase 2: Architecture Mapping ✅ COMPLETE
**Target**: Days 3-6 | **Status**: ✅ Complete (2025-11-08)

#### Phase 2A (Days 3-4): ✅ COMPLETE
- [x] Analyzed .com and .html workflow documentation
- [x] Created WORKFLOW_ANALYSIS.md - Documents ATLAS12 two-stage execution, SYNTHE 11-program pipeline, DFSYNTHE → ATLAS9 connection
- [x] Created VERSION_COMPARISON.md - Castelli vs Kurucz source code comparison, bug fix tracking, migration recommendations
- [x] Updated DEPENDENCY_MAP.md with Runtime Architecture and Fort Unit Communication sections

#### Phase 2B (Days 5-6): ✅ COMPLETE
**Focus**: Architectural redesign analysis and breadth-first code surveys

#### Major Components Completed:
- [x] 2.2c - ATLAS12 detailed architecture (✅ ARCHITECTURE_DETAILS.md Section I-II)
  - Main program flow (Stage 1 vs Stage 2)
  - 80 subroutines categorized
  - 57 COMMON blocks cataloged
  - Migration implications documented
- [x] 2.3b - SYNTHE pipeline detailed architecture (✅ ARCHITECTURE_DETAILS.md Section II)
  - All 11 programs surveyed
  - ATLAS7V library interface documented
  - Fort unit data flow mapped
- [x] 2.1 - ATLAS9 architecture (✅ ARCHITECTURE_DETAILS.md Section III - Breadth-first survey)
- [x] 2.5 - DFSYNTHE architecture (✅ ARCHITECTURE_DETAILS.md Section IV - Breadth-first survey)
- [x] 2.6 - KAPPA9 architecture (✅ ARCHITECTURE_DETAILS.md Section V - Breadth-first survey)
- [x] Cross-code architecture summary (✅ ARCHITECTURE_DETAILS.md Section VI)
- [x] Architectural insights for Julia migration (✅ ARCHITECTURE_INSIGHTS.md)

⏭️ **Deferred** (not migration priorities):
- WIDTH architecture
- Hbeta architecture
- ODF generation pipeline

**Notes**:
Phase 2 successfully completed with **twelve major deliverables** (5 architecture + 7 ATLAS12 deep dives).
Phase 3 added **two major deliverables** (PHYSICS_PIPELINE_ATLAS12.md, PHYSICS_PIPELINE_SYNTHE.md).

**Total deliverables: 14 documents** (6 architecture + 7 ATLAS12 deep dives + 1 ATLAS12 physics + 5 SYNTHE deep dives + 2 SYNTHE synthesis)

1. **WORKFLOW_ANALYSIS.md** (1,066 lines) - Comprehensive workflow documentation revealing ATLAS12's two-stage execution model and SYNTHE's 11-program pipeline architecture. Includes compilation instructions, fort unit conventions, and data flow analysis.

2. **VERSION_COMPARISON.md** (580 lines) - Detailed comparison of Castelli vs Kurucz versions showing 4 years of bug fixes (2005-2009) in Castelli version, molecule database expansion (39→139) in Kurucz version, and migration recommendations for hybrid approach.

3. **ARCHITECTURE_DETAILS.md** (1,604 lines) - Comprehensive architecture documentation:
   - ATLAS12: 80 subroutines, 57 COMMON blocks, execution flow
   - SYNTHE: 11-program pipeline, fort unit communication
   - ATLAS9, DFSYNTHE, KAPPA9: Breadth-first surveys
   - Cross-code analysis: ~10,500 lines of shared computational kernel
   - Proposed Julia package structure (AtlasBase.jl + specialized modules)

4. **ARCHITECTURE_INSIGHTS.md** (2,560 lines) - **Primary Phase 2B deliverable** guiding Julia migration:
   - Section I: 6 critical architectural challenges (COMMON blocks, implicit dependencies, two-stage architecture)
   - Section II: Computational patterns across codes (~10.5K lines shared kernel)
   - Section III: Data flow analysis (ATLAS12 stages, SYNTHE pipeline, redesign principles)
   - Section IV: State management redesign (57 COMMON → 5 Julia struct types)
   - Section V: **10 critical decision points requiring Paula's domain expertise** (1 RESOLVED via code analysis)
   - Section VI: Migration risk assessment (validation strategy, high-risk code sections)

5. **METHODOLOGY_NOTES.md** (303 lines) - Documents "here be dragons" methodology breakthrough: breadth-first documentation beats depth-first analysis paralysis. Key lesson for human-AI collaboration on complex legacy codebases.

6. **DEEP_DIVES/01_VOIGT_PROFILE.md** (628 lines) - Deep analysis of Rank #2 highest-risk code section:
   - 4-regime piecewise algorithm with 13 undocumented magic constants
   - Hybrid pretabulation + analytical approximation strategy
   - Performance critical (~1 μs/call, millions of calls per iteration)
   - Precision analysis: Float32 acceptable (target ~2%, measured <1.5%)
   - Migration strategy with test suite design

7. **DEEP_DIVES/02_POPULATIONS.md** (731 lines) - Deep analysis of Rank #1 highest-risk code section:
   - Saha-Boltzmann population calculations spanning 40+ orders of magnitude
   - RESOLVED Decision V.4 (Precision): Float64 REQUIRED for populations
   - Validated COMMON block categorization and Julia struct design
   - Identified damping factor 0.3 in electron density iteration
   - 2190-line partition function tables documented

8. **DEEP_DIVES/03_LINE_OPACITY_SUMMATION.md** (921 lines) - Deep analysis of Rank #3 highest-risk code section:
   - Line opacity accumulation from 100K-500M spectral lines
   - Float32 accumulation with no error compensation
   - Analysis shows Float32 adequate (error < 0.01% typical)
   - Early exit optimization critical for performance (600 GFLOP XLINOP)
   - Recommend Float64 accumulation for Julia (cheap insurance)
   - Migration strategy with 3 approaches and testing plan

9. **DEEP_DIVES/04_BINARY_IO.md** (966 lines) - Deep analysis of Rank #4 highest-risk code section:
   - Fortran UNFORMATTED binary format documentation
   - Fort.12: 16-byte records (IIIIIII packed line data)
   - Fort.11/21: Direct-access line databases
   - Wavelength log-encoding and TABLOG index compression
   - Compiler-specific issues (gfortran vs ifort, endianness)
   - Migration strategy: FortranFiles.jl for validation, manual parsing for production

10. **DEEP_DIVES/05_RADIATIVE_TRANSFER.md** (918 lines) - Deep analysis of Rank #6 highest-risk code section:
    - JOSH subroutine: Feautrier-like radiative transfer solver
    - Pretabulated integration weights: COEFJ/COEFH (51×51 matrices)
    - Fixed optical depth grid (XTAU8, 51 points τ=0 to τ=20)
    - Gauss-Seidel iteration for scattering source function
    - MAP1 parabolic interpolation analysis
    - Mixed Float32/Float64 precision: weights Float32, source functions Float64
    - Migration strategy: validate COEFJ/COEFH, expose iteration limits

11. **DEEP_DIVES/06_ITERATION_DAMPING.md** (1,117 lines) - Deep analysis of Rank #5 highest-risk code section:
    - TCORR subroutine: Multi-mechanism temperature correction
    - Fixed limiting: ±T_eff/25 temperature, ±τ/4 optical depth corrections
    - Adaptive damping: oscillation detection (0.5×) vs convergence acceleration (1.25×)
    - Temperature smoothing (3-point weighted), monotonicity enforcement
    - No early-exit convergence test: always runs NUMITS iterations
    - Convection coupling: DTFLUX includes radiative+convective energy transport
    - Migration strategy: expose diagnostics, optional early exit, preserve Fortran fixed-iteration default

12. **DEEP_DIVES/07_CONVECTIVE_TRANSPORT.md** (1,178 lines) - Deep analysis of convective energy transport:
    - CONVEC subroutine: Mixing length theory (MLT) implementation
    - Numerical thermodynamic derivatives: 4× POPS calls for ∂E/∂T, ∂E/∂P, ∂ρ/∂T, ∂ρ/∂P
    - Iterative opacity convergence: 30-iteration loop for convective opacity self-consistency
    - Mihalas optically-thin bubble correction: τ_b^2/(2+τ_b^2) factor
    - Convective overshooting: spatial averaging over ±0.5 H_P (but 0.5D-5 factor suspicious - potential typo)
    - Finite difference perturbations: ±0.1% in T and P, central differences
    - Migration strategy: start with FD (match Fortran), transition to AD for efficiency

**Methodology Discovery** (Phase 2B):
Discovered critical insight: **"Document what's clear, flag the mess, move on"** beats **"understand everything before documenting anything"**. This "breadth-first" approach improved productivity 13× (45 min vs 6+ hrs projected for same output). Documented in METHODOLOGY_NOTES.md as reusable pattern for future sessions.

---

### Phase 3: Physics Pipeline Documentation ✅ COMPLETE
**Target**: Days 6-9 | **Status**: ✅ Complete (2025-11-09)

#### Tasks:
- [x] 3.1 - Trace computational flow of one stellar atmosphere calculation
- [x] 3.2 - Document physics at each major step
- [x] 3.3 - Identify numerical methods used
- [x] 3.4 - Flag unusual or legacy-specific algorithms
- [x] 3.5 - Document precision requirements (REAL*4 vs REAL*8)
- [x] 3.6 - Note convergence criteria and stability considerations
- [x] 3.7 - Write `docs/archaeology/PHYSICS_PIPELINE_ATLAS12.md`

**Focus**: Understand WHAT the code does physically, not just HOW

**Deliverable**:

13. **PHYSICS_PIPELINE_ATLAS12.md** (1,548 lines) - **Phase 3 Major Deliverable** documenting the physics of one ATLAS12 iteration:
    - Section I: Overview of iterative atmosphere convergence
    - Section II: Input state and assumptions (LTE, plane-parallel, hydrostatic equilibrium)
    - Section III: Complete 7-step iteration pipeline with governing equations:
      1. Population calculations (Saha-Boltzmann, Float64 required)
      2. Continuum opacity (25+ sources, H⁻ dominant in solar-type stars)
      3. Line opacity (Voigt profiles, 100K-1M lines, early-exit optimization)
      4. Radiative transfer (Feautrier-like, pretabulated COEFJ/COEFH weights)
      5. Temperature correction (6 damping mechanisms, Avrett-Krook method)
      6. Convection (MLT, 4× POPS calls for derivatives, possible OVERWT bug)
      7. Convergence check (flux + temperature tolerances)
    - Section IV-VI: Physical constraints, numerical methods, failure modes
    - Section VII: ATLAS12 vs ATLAS9 comparison (opacity sampling vs ODFs)
    - Section VIII: **Migration considerations** (what to preserve exactly, where optimizations are safe)
    - Section IX-XII: Glossary, equation reference, units, typical values
    - Cross-references all 7 Deep Dives with physics context
    - 4 questions flagged for Paula (OVERWT bug, TABCONT tuning, COEFJ origin, damping values)
    - Comprehensive validation test suite specified

14. **PHYSICS_PIPELINE_SYNTHE.md** (1,950 lines) - **Phase 3 Extension** documenting the physics of SYNTHE spectrum synthesis:
    - Section I: Overview of spectrum synthesis (fixed atmosphere, wavelength-by-wavelength RT)
    - Section II: Input state (ATLAS model, line lists, continuum opacities)
    - Section III: Complete 5-stage pipeline with governing equations:
      1. Line list preparation (wavelength filtering, 10K-1M lines)
      2. Atmosphere preparation (POPS populations, KAPP continuum opacities)
      3. Spectrum synthesis loop (line opacity + RT at each wavelength)
      4. Rotational broadening (v sin i, limb darkening)
      5. Instrumental broadening (resolving power, macroturbulence)
    - Section IV-VI: Physical constraints (LTE validity, energy conservation), numerical methods, failure modes
    - Section VII: SYNTHE vs other synthesis codes (SPECTRUM, Turbospectrum, MOOG)
    - Section VIII: **Migration considerations** (what to preserve, safe optimizations)
    - Section IX-XII: Glossary, equation reference, units, typical values
    - Cross-references all 5 SYNTHE Deep Dives (DD08-12) with physics context
    - 10 questions flagged for Paula (line list completeness, NLTE effects, validation targets)
    - Parallels PHYSICS_PIPELINE_ATLAS12.md structure for consistency

---

### Phase 4: Migration Complexity Assessment ✱ NOT STARTED
**Target**: Days 10-12 | **Status**: ⬜ Not started

#### Tasks:
- [ ] 4.1 - **COMMON block usage mapping** (CRITICAL - must do before migration)
  - Map which COMMON blocks are read-only vs read-write in each subroutine
  - Identify initialization order dependencies
  - Document implicit data flow between subroutines
  - Create dependency graph: subroutine → COMMON blocks → subroutines
  - Flag circular dependencies or problematic patterns
  - Output: `docs/archaeology/COMMON_BLOCK_MAP.md`
- [ ] 4.2 - Categorize all modules by difficulty (Easy/Medium/Hard)
- [ ] 4.3 - Identify "quick wins" (standalone utilities)
- [ ] 4.4 - Flag high-risk areas (✅ started in ARCHITECTURE_INSIGHTS.md Section VI)
- [ ] 4.5 - Document external dependencies
- [ ] 4.6 - Create prioritized migration roadmap
- [ ] 4.7 - Write `docs/archaeology/MIGRATION_ASSESSMENT.md`

**Difficulty Criteria**:
- **Easy**: Standalone, well-documented, standard algorithms
- **Medium**: Some dependencies, moderate complexity
- **Hard**: Complex algorithms, precision-sensitive, undocumented behavior, many dependencies

**Notes**: Task 4.1 (COMMON block mapping) is CRITICAL per ARCHITECTURE_INSIGHTS.md Section I.1. Must be completed before translating any subroutines to understand implicit dependencies.

---

### Phase 5: API Usage Projection ✱ NOT STARTED
**Target**: Days 13-14 | **Status**: ⬜ Not started

#### Tasks:
- [ ] 5.1 - Estimate API iterations per module type
- [ ] 5.2 - Identify sections needing extensive back-and-forth
- [ ] 5.3 - Note where physics expertise will be most critical
- [ ] 5.4 - Calculate total estimated API cost for full migration
- [ ] 5.5 - Write `docs/archaeology/API_PROJECTION.md`

**This is the key deliverable for the research credit application**

**Notes**: [Claude Code Web adds notes here]

---

## Questions & Doubts Log
*Running list of items for Paula to investigate asynchronously*

### Phase 1 Discoveries:

**Q1: Atomic Number Codes in `atoms/` Directory**
- **Location**: `upstream/kurucz/source_codes/atoms/`
- **Observation**: Directories named with 4-digit codes (e.g., 2603, 2604, 2605)
- **Working Hypothesis**: Format = `[atomic_number][ionization_state]`
  - 2603 = Element 26 (Fe), ionization III → Fe III
  - 2604 = Element 26 (Fe), ionization IV → Fe IV
  - 0602 = Element 6 (C), ionization II → C II (?)
- **Question**: Is this mapping correct? Should I create a definitive reference table?
- **Impact**: Documentation accuracy for atomic data processing section
- **Status**: ⏸️ Awaiting Paula's confirmation

**Q2: "g" Suffix Meaning - Verification Needed**
- **Location**: Multiple files (atlas9g, width9g, syntheg, etc.)
- **Working Hypothesis**: "g" = gfortran compatibility (per Paula's MISSION.md update)
- **Question**: Should I spot-check source file headers/comments to verify?
- **Potential Check**: Compare first 50 lines of atlas9.for vs atlas9g.for for compilation notes
- **Impact**: Understanding which versions to prioritize for migration
- **Status**: ⏸️ Deferred to Phase 2 unless Paula wants preliminary check

**Q3: ATLAS12 Version Differences - Scale Unknown**
- **Location**: Castelli atlas12.for (23,247 lines) vs Kurucz atlas12.for (22,152 lines)
- **Observation**: 1,095 line difference (4.7% smaller in Kurucz)
- **Question**: Quick diff to assess scale? Whole-file restructure or targeted bug fixes?
- **Impact**: Migration strategy - merge both or choose one as base?
- **Status**: ⏸️ Explicitly deferred to Phase 2 Architecture Mapping

---

## Working Instructions for Claude Code Web

## Git Workflow Requirements

IMPORTANT: Due to connection instability, please commit and push your work frequently:
- After completing each subtask (not just full phases)
- After updating MISSION.md progress markers
- After creating each report file
- Use clear commit messages like "Phase 1.3: Add line count analysis"

If you lose connection, Paula needs to see what work was completed.

### How to use this file:
1. **Read this file at the start of each session**
2. **Update your current task** with ✱ ACTIVE marker
3. **Check off completed tasks** with [x]
4. **Add notes** in the Notes section of each phase
5. **Update "Last Updated"** timestamp at top
6. **Update status** (⬜ Not started | 🔄 In progress | ✅ Complete)

### When starting work:
```
Example: "Working on Phase 1, Task 1.3 - Counting lines of code"
```

Update the status marker:
```
### Phase 1: Repository Census ✱ ACTIVE
**Status**: 🔄 In progress
```

### When completing a phase:
- Mark all tasks [x]
- Update status to ✅ Complete
- Move ✱ ACTIVE marker to next phase
- Write the deliverable markdown file
- Add summary notes

### Critical Reminders:
- Create `docs/archaeology/` directory if it doesn't exist
- All deliverable reports go in `docs/archaeology/`
- Be thorough but efficient - we have limited time
- If you discover something unexpected, note it prominently
- Focus on what Paula (astrophysicist) needs to know, not just code details

---

## Context About This Project

**Paula's Role**: Astrophysicist with deep domain knowledge, limited coding time
**Your Role**: Code archaeologist documenting legacy Fortran for future migration
**End Goal**: Preserve Robert Kurucz's scientifically important ATLAS suite by migrating to Julia
**Publication Goal**: Document human-AI collaboration methodology for Astronomy & Computing

**Remember**: This documentation will be read by:
1. Future-Claude helping with actual migration
2. Paula when making physics decisions
3. Peer reviewers for the Astronomy & Computing paper
4. Grant reviewers for the research credit application

Make it thorough, clear, and scientifically rigorous.
