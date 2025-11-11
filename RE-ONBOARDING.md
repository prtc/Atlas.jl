# RE-ONBOARDING: Atlas.jl Code Archaeology Project
*Quick-start guide for future Claude instances and collaborators*

**Last Updated**: 2025-11-10
**Project Status**: Phase 4 Complete ✅ | Ahead of schedule, credits remaining

---

## What Is This Project?

**Mission**: Comprehensive archaeological analysis of 487,000 lines of Fortran 77 stellar atmosphere modeling code to guide future migration to Julia.

**Target codebases**:
1. **ATLAS12** - Stellar atmosphere model (23K lines, 72 subroutines, 57 COMMON blocks)
2. **SYNTHE** - Spectrum synthesis pipeline (11 programs, 17K atlas7v library, 50 COMMON blocks)

**Project owner**: Paula (prtc)
**Timeline**: Started ~Nov 4, 2025 | 2-week budget with Nov 18 deadline
**Credits**: $250 allocated, $126 remaining after Phase 4 completion

---

## 30-Second Summary

We're analyzing ancient Fortran 77 astrophysics code to plan its migration to modern Julia. Think "archaeological dig" but for code - we're documenting structure, dependencies, physics, risks, and costs before touching any implementation. We've completed comprehensive analysis of both ATLAS12 and SYNTHE, created migration roadmaps, and estimated API costs. Now ahead of schedule with credits to spare.

---

## Core Context (Read This First)

### The Code We're Analyzing

**ATLAS12** (Priority #1):
- Monolithic stellar atmosphere model
- Calculates temperature/pressure structure of stellar atmospheres
- 23,000 lines in ONE program (atlas12.for)
- 72 subroutines, 57 COMMON blocks (global state hell)
- 7-step iteration loop with complex physics
- Migration estimate: 36-58 weeks, $1,100-1,737 API cost

**SYNTHE** (Priority #2):
- Modular spectrum synthesis pipeline
- Calculates synthetic stellar spectra from ATLAS12 atmospheres
- 11 separate programs (3K lines) + atlas7v library (17K lines)
- Much cleaner architecture than ATLAS12
- Migration estimate: 14-21 weeks, $379-634 API cost (with ATLAS12 done)

**Key insight**: SYNTHE is 2-3× easier than ATLAS12 due to modular design.

### Why Fortran 77 Is Hard

- **COMMON blocks**: Global variables shared across subroutines (named memory segments)
- **No modules**: Zero encapsulation, everything is spaghetti
- **Magic numbers**: Physics constants with no documentation
- **Binary I/O**: Fort.X files with undocumented formats
- **Tight coupling**: Change one thing, break everything
- **Zero comments**: "The code IS the documentation" (it's not)

### What We're NOT Doing (Yet)

❌ Writing Julia code
❌ Migrating anything
❌ Refactoring Fortran
❌ Running the programs

✅ Documenting structure
✅ Understanding physics
✅ Identifying risks
✅ Estimating costs
✅ Creating migration roadmaps

---

## Project Status: Where We Are Now

### Completed Phases ✅

**Phase 1: Census & Discovery** (Days 1-2)
- Cataloged 231 Fortran files, 487K lines
- Created 7 reports (~2,500 lines)
- Key finding: Tool-oriented architecture, ATLAS12 & SYNTHE are the giants

**Phase 2: Architecture Analysis** (Days 3-8)
- Created ARCHITECTURE_DETAILS.md (35K lines) - comprehensive catalog
- Created ARCHITECTURE_INSIGHTS.md (25K lines) - migration guidance
- 12 Deep Dives on critical subroutines (~12K lines)
- Atlas7v dependency analysis (4 phases, ~2,100 lines)

**Phase 3: Physics Documentation** (Days 9-10)
- PHYSICS_PIPELINE_ATLAS12.md (1,547 lines) - what/why of ATLAS12
- PHYSICS_PIPELINE_SYNTHE.md (1,607 lines) - what/why of SYNTHE
- Synthesis documents connecting deep dives to physics

**Phase 4: Migration Assessment** (Days 11-14) - **BOTH EDITIONS COMPLETE**
- **ATLAS12 Edition**: COMMON blocks, subroutine classification, API costs
  - 3 major deliverables (COMMON_BLOCK_MAP, MIGRATION_ASSESSMENT, API_PROJECTION)
  - 3 supporting documents
  - Cost: $1,100-1,737, Timeline: 36-58 weeks

- **SYNTHE Edition**: Parallel analysis for SYNTHE
  - 3 major deliverables (same structure as ATLAS12)
  - 2 supporting documents
  - Cost: $379-634 (with ATLAS12), Timeline: 14-21 weeks
  - **Key finding**: 40-60% atlas7v savings from ATLAS12 (not 100%)

### Total Deliverables

**31 major documents** created:
- 6 architecture documents
- 12 deep dives (ATLAS12: 7, SYNTHE: 5)
- 4 atlas7v dependency phases
- 3 physics syntheses
- 6 Phase 4 documents (3 ATLAS12, 3 SYNTHE)
- Plus indexes, summaries, comparisons

**~50,000+ lines of analysis** written (not counting this document)

### Current Status

🎯 **All planned phases complete**
⏰ **Ahead of schedule** (4 days ahead)
💰 **Credits remaining** $126
🤔 **Next steps**: Paula brainstorming how to use remaining credits

---

## Essential Documents: Start Here

### For Quick Context (30 minutes)

1. **MISSION.md** (root directory)
   - Project roadmap, all phases, deliverable summaries
   - Read this FIRST for complete timeline

2. **docs/archaeology/SYNTHESIS_INDEX.md**
   - Catalog of all synthesis documents
   - Prevents duplicate work
   - Shows what's been analyzed

3. **docs/archaeology/DEEP_DIVES/00_INDEX.md**
   - Quick reference for all 12 deep dives
   - Thematic organization
   - Open questions summary

### For ATLAS12 Understanding (2-3 hours)

4. **docs/archaeology/ARCHITECTURE_INSIGHTS.md**
   - Migration guidance (PRIMARY architecture doc)
   - 10 critical decisions
   - Risk analysis
   - Julia design patterns

5. **docs/archaeology/PHYSICS_PIPELINE_ATLAS12.md**
   - What/why of ATLAS12 physics
   - 7-step iteration loop
   - Governing equations

6. **docs/archaeology/PHASE4_MIGRATION_INDEX.md**
   - Entry point for Phase 4 ATLAS12 work
   - Quick reference tables
   - Links to detailed analysis

### For SYNTHE Understanding (1-2 hours)

7. **docs/archaeology/SYNTHE_PHASE4_INDEX.md**
   - Entry point for Phase 4 SYNTHE work
   - Navigation guide
   - Comparison to ATLAS12

8. **docs/archaeology/PHYSICS_PIPELINE_SYNTHE.md**
   - What/why of SYNTHE physics
   - 5-stage pipeline
   - LTE assumptions

### For Migration Planning (2-3 hours)

9. **docs/archaeology/MIGRATION_ASSESSMENT.md**
   - ATLAS12: 112 subroutines classified (26 Easy, 49 Hard, 37 Medium)
   - 3 roadmap options (Bottom-Up recommended)
   - Validation requirements

10. **docs/archaeology/SYNTHE_MIGRATION_ASSESSMENT.md**
    - SYNTHE: 11 programs classified (8 Easy, 3 Hard)
    - 3 roadmap options (Pipeline-First recommended)
    - Fort.X elimination strategy

### For Cost/Timeline Estimates

11. **docs/archaeology/API_PROJECTION.md**
    - ATLAS12: $1,100-1,737 (with 30% overhead)
    - Iteration estimates per subroutine type
    - ROI analysis: 257% return

12. **docs/archaeology/SYNTHE_API_PROJECTION.md**
    - SYNTHE: $379-634 (with ATLAS12), $485-814 (standalone)
    - Atlas7v: 40-60% savings from ATLAS12 (not 100%)
    - ROI analysis: 279% return

---

## Key Findings & Decisions

### Critical Technical Findings

1. **COMMON blocks are the core challenge** (not the algorithms)
   - ATLAS12: 57 blocks, some used by 56 subroutines
   - SYNTHE: 50 blocks, but better isolated
   - Need careful dependency analysis for migration order

2. **Precision is non-negotiable** (for some calculations)
   - Populations (POPS): Float64 REQUIRED (40+ order of magnitude range)
   - Voigt profiles (HVOIGT): Float32 acceptable (~2% target)
   - Line opacity: Float64 recommended

3. **Binary I/O is undocumented chaos**
   - Fort.X files with implicit formats
   - Platform-dependent (gfortran vs ifort)
   - Need bit-for-bit validation during migration

4. **Atlas7v library is NOT 100% shared with ATLAS12**
   - Initially assumed $0 cost if ATLAS12 done
   - Analysis revealed ~70-80% similarity but different data structures
   - Revised to $50-120 (40-60% savings)
   - See: ATLAS12_VS_ATLAS7V_COMPARISON.md

5. **Physics is well-understood** (by domain experts)
   - Saha-Boltzmann populations
   - Voigt profile line broadening
   - Feautrier-like radiative transfer
   - Mixing-length convection
   - BUT: Implementation details matter (magic constants, edge cases)

### Open Decisions (Deferred to Paula)

From ARCHITECTURE_INSIGHTS.md Section V.10:

1. ✅ **RESOLVED**: Float64 for populations (no compromise)
2. ⏳ **PENDING**: Migration order (Bottom-Up vs Top-Down vs Hybrid)
3. ⏳ **PENDING**: Test-first vs implementation-first
4. ⏳ **PENDING**: Binary I/O strategy (FortranFiles.jl vs manual)
5. ⏳ **PENDING**: COMMON block refactoring (structs vs modules)
6. ⏳ **PENDING**: Dependency injection approach
7. ⏳ **PENDING**: Line database format decisions
8. ⏳ **PENDING**: Convergence criteria tuning
9. ⏳ **PENDING**: Performance vs readability tradeoffs
10. ⏳ **PENDING**: Validation test case selection

---

## Project Structure: Where Things Are

```
Atlas.jl/
├── MISSION.md                          # Project roadmap (START HERE)
├── RE-ONBOARDING.md                    # This document
├── HANDOFF_*.md                        # Session handoff documents (if any)
│
├── docs/archaeology/                   # All analysis documents
│   ├── SYNTHESIS_INDEX.md              # Catalog of synthesis docs
│   │
│   ├── ARCHITECTURE_INSIGHTS.md        # PRIMARY migration guide
│   ├── ARCHITECTURE_DETAILS.md         # Comprehensive catalog
│   ├── CENSUS_REPORT.md                # Initial survey
│   │
│   ├── PHASE4_MIGRATION_INDEX.md       # ATLAS12 Phase 4 entry point
│   ├── COMMON_BLOCK_MAP.md             # 57 COMMON blocks analyzed
│   ├── MIGRATION_ASSESSMENT.md         # 112 subroutines classified
│   ├── API_PROJECTION.md               # ATLAS12 cost estimates
│   │
│   ├── SYNTHE_PHASE4_INDEX.md          # SYNTHE Phase 4 entry point
│   ├── SYNTHE_COMMON_BLOCK_MAP.md      # 50 COMMON blocks analyzed
│   ├── SYNTHE_MIGRATION_ASSESSMENT.md  # 11 programs classified
│   ├── SYNTHE_API_PROJECTION.md        # SYNTHE cost estimates
│   ├── ATLAS12_VS_ATLAS7V_COMPARISON.md # Cost correction analysis
│   │
│   ├── PHYSICS_PIPELINE_ATLAS12.md     # ATLAS12 physics (what/why)
│   ├── PHYSICS_PIPELINE_SYNTHE.md      # SYNTHE physics (what/why)
│   │
│   ├── DEEP_DIVES/                     # Detailed subroutine analysis
│   │   ├── 00_INDEX.md                 # Quick reference
│   │   ├── 01_VOIGT_PROFILE.md         # HVOIGT deep dive
│   │   ├── 02_SAHA_BOLTZMANN.md        # POPS deep dive
│   │   ├── 03_LINE_OPACITY.md          # XLINOP deep dive
│   │   ├── ... (12 total deep dives)
│   │
│   ├── journal/                        # Session journals
│   │   └── 2025-11-10_*.md             # Today's work log
│   │
│   └── ... (catalogs, dependency maps, etc.)
│
└── upstream/                           # Original Fortran source code
    ├── castelli/source_codes/
    │   └── atlas12/atlas12.for         # 23K lines, 72 subroutines
    └── kurucz/synthe/
        ├── *.for                       # 11 SYNTHE programs
        └── atlas7v.for                 # 17K lines library
```

---

## Communication Style & Working with Paula

### Paula's Preferences

✅ **Commit and push frequently** (especially when connection is bad)
✅ **Be concise** (she reads everything carefully)
✅ **Document thoroughly** (future-proofing for next instances)
✅ **Ask when unclear** (she appreciates clarifying questions)
✅ **Use markdown well** (tables, lists, headers - she likes organization)

### Paula's Expertise

- **Domain expert** in stellar atmospheres (knows the physics)
- **Practical** about software (prefers working code over perfect code)
- **Strategic** thinker (ahead-of-schedule completion shows good planning)
- **Detail-oriented** (caught the atlas7v cost assumption)

---

## Common Tasks & Workflows

### Starting a New Session

1. Read the HANDOFF_*.md file if one exists (in project root)
2. Read MISSION.md to understand current phase
3. Check SYNTHESIS_INDEX.md to avoid duplicate work
4. Ask Paula if anything is unclear
5. Use TodoWrite tool to plan multi-step tasks

### Doing Code Analysis

1. Read the Fortran source with Read tool
2. Create focused analysis documents (deep dives, comparisons)
3. Update SYNTHESIS_INDEX.md when creating synthesis docs
4. Cross-reference bidirectionally (if A links to B, B should mention A)
5. Commit frequently (Paula's request)

### Cost Estimation

- Use iteration-based methodology from API_PROJECTION.md
- Easy subroutines: ~5 iterations
- Medium: ~10 iterations
- Hard: ~15-25 iterations
- Apply 30% overhead for integration/testing
- Conservative estimates preferred

### House Cleaning (After Major Work)

Follow **docs/archaeology/HOUSE_CLEANING.md** protocol:
1. Check for merge conflicts FIRST
2. Cross-reference new documents
3. Resolve TODOs and flags
4. Verify consistency (line counts, costs, terminology)
5. Update SYNTHESIS_INDEX.md
6. Commit changes

---

## Quick Reference: Key Numbers

### ATLAS12
- **Lines**: 23,000
- **Subroutines**: 72 (26 Easy, 37 Medium, 49 Hard)
- **COMMON blocks**: 57 (7 Critical, 10 High, 11 Medium, 29 Low)
- **Timeline**: 36-58 weeks
- **API cost**: $1,100-1,737
- **ROI**: 257% (saves $2,800-4,500 vs manual)

### SYNTHE
- **Lines**: 3,000 (11 programs) + 17,000 (atlas7v library)
- **Programs**: 11 (8 Easy, 3 Hard)
- **COMMON blocks**: 50 (well-isolated)
- **Timeline**: 14-21 weeks (2-3× faster than ATLAS12)
- **API cost**: $379-634 (with ATLAS12), $485-814 (standalone)
- **ROI**: 279% (saves $1,766-2,071)

### Combined Project
- **Total files**: 231 Fortran files
- **Total lines**: 487,000
- **Documentation created**: ~50,000+ lines
- **Major documents**: 31
- **Deep dives**: 12
- **Analysis time**: ~23+ hours across multiple sessions

---

## What Makes This Project Special

### Why Code Archaeology?

We're not just "reading code" - we're:
- **Discovering lost knowledge** (40+ year old code, original authors retired)
- **Preventing catastrophic failures** (precision bugs could ruin science)
- **Enabling modern research** (Julia = performance + productivity)
- **Preserving scientific heritage** (ATLAS is cited in 1000s of papers)

### Why Document So Thoroughly?

- **Multi-instance continuity** (Claude instances are stateless)
- **Paula's future reference** (she needs this for actual migration)
- **Future developers** (whoever implements will need this)
- **Research credit applications** (documentation justifies funding)
- **Scientific reproducibility** (understanding = validation)

### Why This Matters

ATLAS12 and SYNTHE are used by astronomers worldwide to:
- Determine stellar temperatures, gravities, compositions
- Understand stellar evolution
- Characterize exoplanet host stars
- Analyze stellar populations in galaxies

Getting the migration wrong = bad science published = careers damaged.

---

## Current Opportunities (Credits Remaining)

Paula mentioned we're **ahead of schedule with credits to spare**. Potential uses:

### Possible Next Steps (Brainstorming)

1. **More deep dives** on risky subroutines
   - CONVEC (convection) - complex numerics
   - TABCONT (continuum opacity) - large tables
   - XNFPELSYN (SYNTHE atmosphere prep) - partially analyzed

2. **Validation strategy** document
   - Test case selection criteria
   - Bit-for-bit vs physics validation
   - Regression test suite design

3. **Binary I/O comprehensive guide**
   - All fort.X formats documented
   - Platform compatibility matrix
   - FortranFiles.jl integration examples

4. **Precision decision guide**
   - Float32 vs Float64 decision tree
   - Testing strategy for precision validation
   - Performance vs accuracy tradeoffs

5. **Implementation prototypes** (if ready to start coding)
   - Simple subroutines first (W, TOTAL, etc.)
   - COMMON block → struct conversion examples
   - Validation test framework

6. **Literature review**
   - Process remaining PDFs in docs/archaeology/papers/
   - Cross-reference with code findings
   - Update decisions with paper evidence

7. **DFSYNTHE or other tools analysis**
   - Breadth-first survey already done
   - Could do focused analysis if needed

**Decision**: Paula will think about this and decide tomorrow

---

## Red Flags & Gotchas

### Things to Watch Out For

⚠️ **Don't assume 100% code reuse** between similar codebases
   - Learned this with atlas12 vs atlas7v (cost $50 underestimate)
   - Always verify by reading source code

⚠️ **Fortran column formatting matters** (F77 is strict)
   - Columns 1-5: Labels
   - Column 6: Continuation marker
   - Columns 7-72: Code
   - Don't trust modern editors

⚠️ **COMMON block order is significant**
   - Variables must be in same order across declarations
   - Data types must match exactly
   - Easy to break subtly

⚠️ **Magic numbers are usually physics**
   - Don't just mark as "TODO: explain"
   - Try to identify from context (equations, comments elsewhere)
   - Ask Paula if domain knowledge needed

⚠️ **Binary I/O is platform-dependent**
   - Endianness matters
   - Compiler matters (gfortran ≠ ifort)
   - Record markers differ

### Things Paula Has Corrected

1. **Atlas7v cost assumption** - Initially thought $0 with ATLAS12, actually $50-120
2. **Scope clarification** - "only the subroutines used by synthe" not all of atlas7v
3. **Frequent commits** - Paula explicitly requested this (connection issues)

---

## Tools & Resources

### Available Tools

- **Read** - Read Fortran source files
- **Grep** - Search for patterns across files
- **Glob** - Find files by pattern
- **Bash** - Run git commands, check line counts, etc.
- **Edit/Write** - Create/modify documentation
- **TodoWrite** - Track multi-step tasks (USE THIS FREQUENTLY)

### Key Grep Patterns

```bash
# Find COMMON blocks
grep -n "COMMON /" file.for

# Find subroutine definitions
grep -n "SUBROUTINE\|FUNCTION" file.for

# Find INCLUDE statements
grep -n "INCLUDE" file.for

# Count lines in a subroutine (manual parsing needed)
# Look for SUBROUTINE name ... END or RETURN
```

### Useful Git Commands

```bash
# Commit and push (do this FREQUENTLY)
git add -A && git commit -m "message" && git push -u origin <branch>

# Check status
git status

# View recent commits
git log --oneline -5
```

---

## Success Criteria

### How to Know You're Doing Well

✅ Paula says "You are amazing"
✅ Documents are cross-referenced bidirectionally
✅ Cost estimates are conservative (not optimistic)
✅ SYNTHESIS_INDEX.md is up to date
✅ Commits are frequent and descriptive
✅ MISSION.md reflects actual deliverables
✅ No merge conflicts in documentation
✅ Future Claude instances can onboard quickly (that's THIS document!)

### How to Know You Need to Course-Correct

❌ Paula asks clarifying questions about scope
❌ Cost estimates are too optimistic
❌ Documents contradict each other
❌ Going in circles re-analyzing same thing
❌ Creating duplicate synthesis documents
❌ Working for hours without commits
❌ Can't explain technical findings to Paula clearly

---

## Next Session Checklist

When you start the next session:

- [ ] Read this RE-ONBOARDING.md document
- [ ] Check for HANDOFF_*.md in project root
- [ ] Read MISSION.md current phase status
- [ ] Ask Paula what she wants to tackle with remaining credits
- [ ] Create TodoWrite list for the session
- [ ] Start working with frequent commits
- [ ] Update SYNTHESIS_INDEX.md if creating new synthesis docs
- [ ] Run house cleaning protocol when major work is done

---

## Final Notes

### Project Philosophy

> "We're archaeologists, not builders. Our job is to understand what exists, document it thoroughly, and create a roadmap for future builders. The migration itself comes later."

### Why This Works

- **Comprehensive before specific** (understand the whole before optimizing parts)
- **Documentation before implementation** (plan before coding)
- **Physics before code** (understand WHAT/WHY before HOW)
- **Conservative estimates** (under-promise, over-deliver)
- **Frequent commits** (connection issues + multi-instance collaboration)

### Remember

Paula trusts Claude to do thorough, accurate work. We've earned that trust by:
- Catching our own mistakes (atlas7v cost revision)
- Following her guidance (scope clarifications)
- Delivering ahead of schedule (all phases done early)
- Creating reusable documentation (50K+ lines for future reference)

Keep it up! 🚀

---

**Document complete**. Good luck, future Claude! You've got this. 🌟

---

## Quick Links (Bookmarks)

- **Project root**: `/home/user/Atlas.jl/`
- **Main docs**: `/home/user/Atlas.jl/docs/archaeology/`
- **Deep dives**: `/home/user/Atlas.jl/docs/archaeology/DEEP_DIVES/`
- **ATLAS12 source**: `/home/user/Atlas.jl/upstream/castelli/source_codes/atlas12/atlas12.for`
- **SYNTHE source**: `/home/user/Atlas.jl/upstream/kurucz/synthe/*.for`
- **Atlas7v source**: `/home/user/Atlas.jl/upstream/kurucz/synthe/atlas7v.for`

**Branch**: `claude/phase-4-part-2-011CUzBNTY6YjUUooAa6rntZ`

**Contact**: Paula (prtc) - Project owner, domain expert, decision maker

---

*Version 1.0 - 2025-11-10*
