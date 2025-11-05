# ATLAS Suite Code Archaeology Mission
*Legacy Code Documentation for Julia Migration*

## Mission Status
**Current Phase**: Phase 1 - Repository Census
**Last Updated**: 2025-11-04
**Days Remaining**: 14

---

## Mission Objective
Create comprehensive documentation of the ATLAS Fortran suite to:
1. Guide future Julia migration work
2. Provide API usage estimates for research credit application  
3. Generate material for Astronomy & Computing publication

**Time Budget**: 2 weeks | **Resource**: $250 Claude Code Web credits

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

### Phase 1: Repository Census ✱ ACTIVE
**Target**: Days 1-2 | **Status**: 🔄 In progress

#### Tasks:
- [x] 1.1 - Catalog all .for files in `upstream/castelli/source_codes/`
- [x] 1.2 - Catalog all .for files in `upstream/kurucz/source_codes/`
- [x] 1.3 - Count total lines of code per file
- [ ] 1.4 - Identify file types (main program / subroutine / function)
- [ ] 1.5 - Create initial dependency map
- [ ] 1.6 - Write `docs/archaeology/CENSUS_REPORT.md`

**Notes**:
- Task 1.1 complete: 68 Castelli files (282K lines). Created CASTELLI_CATALOG.md.
- Task 1.2 complete: 163 Kurucz files (205K lines). Created KURUCZ_CATALOG.md. More modular organization with 6 functional categories. Unique capabilities: atomic data tools (28 files), photometric systems (15 files), solar tools (6 files). Significant code overlap with Castelli - version comparison needed in Phase 2.
- Task 1.3 complete: Created CONSOLIDATED_LINE_COUNTS.md with comprehensive analysis. Total: 231 files, 487K lines. Key finding: 7 mega-programs (3% of files) contain 31% of code. Top 24 files contain 65% of codebase. CSV export created for further analysis.

---

### Phase 2: Architecture Mapping ✱ NOT STARTED
**Target**: Days 3-5 | **Status**: ⬜ Not started

#### Major Components to Map:
- [ ] 2.1 - ATLAS9 architecture
- [ ] 2.2 - ATLAS12 architecture ⭐ **HIGH PRIORITY - MIGRATION TARGET**
  - Compare Castelli vs Kurucz versions line-by-line if both exist
  - Document all differences (bug fixes, gfortran compatibility changes, numerical changes)
  - Identify which version should be the migration base
  - Flag any merged fixes needed from both versions
- [ ] 2.3 - SYNTHE architecture
- [ ] 2.4 - ODF architecture
- [ ] 2.5 - DFSYNTHE architecture
- [ ] 2.6 - KAPPA9 architecture
- [ ] 2.7 - WIDTH architecture
- [ ] 2.8 - Hbeta architecture
- [ ] 2.9 - Write `docs/archaeology/ARCHITECTURE_MAP.md`

For each component document:
- Main program entry point
- Subroutine call chain (create ASCII diagram)
- Input file requirements
- Output file formats
- Shared utility functions

**Notes**: [Claude Code Web adds notes here]

---

### Phase 3: Physics Pipeline Documentation ✱ NOT STARTED
**Target**: Days 6-9 | **Status**: ⬜ Not started

#### Tasks:
- [ ] 3.1 - Trace computational flow of one stellar atmosphere calculation
- [ ] 3.2 - Document physics at each major step
- [ ] 3.3 - Identify numerical methods used
- [ ] 3.4 - Flag unusual or legacy-specific algorithms
- [ ] 3.5 - Document precision requirements (REAL*4 vs REAL*8)
- [ ] 3.6 - Note convergence criteria and stability considerations
- [ ] 3.7 - Write `docs/archaeology/PHYSICS_PIPELINE.md`

**Focus**: Understand WHAT the code does physically, not just HOW

**Notes**: [Claude Code Web adds notes here]

---

### Phase 4: Migration Complexity Assessment ✱ NOT STARTED
**Target**: Days 10-12 | **Status**: ⬜ Not started

#### Tasks:
- [ ] 4.1 - Categorize all modules by difficulty (Easy/Medium/Hard)
- [ ] 4.2 - Identify "quick wins" (standalone utilities)
- [ ] 4.3 - Flag high-risk areas
- [ ] 4.4 - Document external dependencies
- [ ] 4.5 - Create prioritized migration roadmap
- [ ] 4.6 - Write `docs/archaeology/MIGRATION_ASSESSMENT.md`

**Difficulty Criteria**:
- **Easy**: Standalone, well-documented, standard algorithms
- **Medium**: Some dependencies, moderate complexity
- **Hard**: Complex algorithms, precision-sensitive, undocumented behavior, many dependencies

**Notes**: [Claude Code Web adds notes here]

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
