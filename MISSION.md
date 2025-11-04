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

## Progress Tracker

### Phase 1: Repository Census ✱ ACTIVE
**Target**: Days 1-2 | **Status**: 🔄 In progress

#### Tasks:
- [x] 1.1 - Catalog all .for files in `upstream/castelli/source_codes/`
- [ ] 1.2 - Catalog all .for files in `upstream/kurucz/source_codes/`
- [ ] 1.3 - Count total lines of code per file
- [ ] 1.4 - Identify file types (main program / subroutine / function)
- [ ] 1.5 - Create initial dependency map
- [ ] 1.6 - Write `docs/archaeology/CENSUS_REPORT.md`

**Notes**: Task 1.1 complete. Cataloged 68 Fortran files in Castelli codes (282K lines). Created CASTELLI_CATALOG.md with detailed breakdown by component. Identified duplicate/variant pattern ("g" suffix) and heavy utility presence (40% of files).

---

### Phase 2: Architecture Mapping ✱ NOT STARTED
**Target**: Days 3-5 | **Status**: ⬜ Not started

#### Major Components to Map:
- [ ] 2.1 - ATLAS9 architecture
- [ ] 2.2 - ATLAS12 architecture
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

## Working Instructions for Claude Code Web

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
