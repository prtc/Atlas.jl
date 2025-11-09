# House Cleaning Protocol
*Quality assurance for documentation sprints*

**Purpose**: After rapid documentation work, pause to review with "fresh eyes" and ensure quality, consistency, and completeness.

**When to use**: After completing major documentation deliverables, deep dives, or multi-hour work sessions. Think of this as a "code review" but for documentation.

**Created**: 2025-11-08 (Phase 2B post-completion review)

---

## Core Context (Read This First)

### What is this project?

**ATLAS Suite Code Archaeology Mission**: Documenting 487K lines of Fortran 77 stellar atmosphere modeling code (ATLAS12, SYNTHE, and related tools) to guide future Julia migration.

**Key documentation files** (as of Phase 2B completion):
- `MISSION.md` - Project roadmap and task tracking
- `docs/archaeology/CENSUS_REPORT.md` - Initial code survey
- `docs/archaeology/ARCHITECTURE_DETAILS.md` - Comprehensive code catalog
- `docs/archaeology/ARCHITECTURE_INSIGHTS.md` - Julia migration guidance (PRIMARY)
- `docs/archaeology/DEEP_DIVES/` - Detailed analysis of high-risk code sections

### Why house cleaning matters

Fast documentation work can create:
- **Inconsistencies**: Document A says X, Document B says Y
- **Unresolved references**: "See Section 5" but Section 5 says "TODO"
- **Missed connections**: Deep dive answers a question from earlier but no cross-reference
- **Redundancy**: Same information repeated in multiple places
- **Stale TODOs**: Questions that were answered but flags not updated

House cleaning finds and fixes these issues before they confuse future readers (including Paula and future-you).

---

## House Cleaning Tasks

### Task 1: Cross-Reference Opportunities

**Goal**: Connect related information across documents.

**What to look for**:
- Deep dives that answer questions from ARCHITECTURE_INSIGHTS.md
- Code examples mentioned abstractly in one doc, detailed in another
- Decision points that were resolved through analysis
- Risk assessments that were addressed through investigation

**How to do it**:
1. Read ARCHITECTURE_INSIGHTS.md and note questions/flags
2. Search DEEP_DIVES/ for answers to those questions
3. Add bidirectional links: "See Deep Dive 02" ↔ "This answers Section V.4"

**Example from 2025-11-08 house cleaning**:
```markdown
# Before (ARCHITECTURE_INSIGHTS.md Section VI.1)
**Example 1 - Voigt Profile Calculation**:
- Magic constants (5.0, 10.0) - what if these are changed?
**Mitigation**:
- [ ] Obtain original Humlicek 1982 paper

# After
**Example 1 - Voigt Profile Calculation**:
- Magic constants (5.0, 10.0) - what if these are changed?
**✅ ANALYZED** - See `docs/archaeology/DEEP_DIVES/01_VOIGT_PROFILE.md`:
- Identified 4-regime piecewise algorithm with 13 undocumented magic constants
**Mitigation**:
- [x] ~~Obtain paper~~ → Actually uses DIFFERENT algorithm (see Deep Dive 01)
```

---

### Task 2: Resolve TODOs and Flags

**Goal**: Update flags that are no longer accurate.

**What to look for**:
- `TODO`, `FIXME`, `⚠️`, `📋`, `🚧` markers
- Questions followed by "Decision needed"
- "Unknown" or "Need to investigate" statements
- Mitigation checklists with incomplete items

**How to do it**:
1. Grep for flag patterns: `grep -r "TODO\|⚠️\|📋\|Decision needed" docs/`
2. For each flag, ask: "Was this answered in later work?"
3. Update flags to reflect current knowledge
4. Use strikethrough for obsolete items: `~~old text~~`

**Example from 2025-11-08 house cleaning**:
```markdown
# Before
📋 **Decision needed**: Float64 everywhere or match Fortran precision?

# After
✅ **Decision V.4 RESOLVED** (from Deep Dive 02):
**Mixed precision strategy**:
- Populations: Float64 REQUIRED (no compromise)
- Voigt profiles: Float32 acceptable
```

---

### Task 3: Consistency Check

**Goal**: Ensure all documents tell the same story.

**What to look for**:
- Conflicting statements (e.g., one doc says "57 COMMON blocks", another says "50+")
- Line counts that don't match (e.g., CENSUS vs ARCHITECTURE_DETAILS)
- Different descriptions of the same subroutine
- Terminology inconsistencies (e.g., "opacity sampling" vs "line-by-line")

**How to do it**:
1. Pick a key fact (e.g., "ATLAS12 has 57 COMMON blocks")
2. Search for all mentions across docs: `grep -r "COMMON block" docs/`
3. Verify they agree or have valid reasons to differ
4. Update to use consistent terminology

**Example checks**:
- Does MISSION.md Phase 2 summary match actual deliverables?
- Do line counts in different docs match CONSOLIDATED_LINE_COUNTS.csv?
- Do COMMON block counts agree across ARCHITECTURE_DETAILS and ARCHITECTURE_INSIGHTS?
- Are subroutine names spelled consistently?

---

### Task 4: Pruning and Clarity

**Goal**: Remove redundancy, improve clarity.

**What to look for**:
- Information repeated verbatim in multiple docs (consolidate or link)
- Overly verbose explanations (can we tighten?)
- Unclear antecedents ("this" referring to what?)
- Section headings that don't match content

**How to do it**:
1. Read sections out loud (or carefully)
2. Ask: "Would this confuse a reader encountering it fresh?"
3. Remove redundant text, add clarifying parentheticals
4. Consider: "Could I explain this to Paula in 1-2 sentences?"

**Examples**:
- If Deep Dive 02 explains Saha-Boltzmann in detail, ARCHITECTURE_INSIGHTS can just link to it
- If a section says "as mentioned above" - verify the reference is clear
- If using acronyms (OS, ODF, RT) - define on first use or link to glossary

---

### Task 5: Synthesis Opportunities

**Goal**: Summarize key insights at strategic points.

**What to look for**:
- Multiple related findings that could be summarized
- Patterns across deep dives (e.g., "precision is critical everywhere")
- Tables that could track progress (e.g., "Which risks analyzed?")
- Executive summaries that are now outdated

**How to do it**:
1. After completing several deep dives, add a progress summary
2. Update executive summaries to reflect new findings
3. Create tracking tables for systematic work (risk analysis, decisions, etc.)

**Example from 2025-11-08 house cleaning**:
```markdown
# Added to ARCHITECTURE_INSIGHTS.md Section II.1
| Subroutine | ATLAS9 | ATLAS12 | ... | Analysis |
|------------|--------|---------|-----|----------|
| POPS       | ✓      | ✓       | ... | ✅ Deep Dive 02 |
| TABVOIGT   | -      | ✓       | ... | ✅ Deep Dive 01 |
```

---

### Task 6: Multi-Phase Analysis Validation

**Goal**: Ensure consistency across sequential analysis phases.

**What to look for**:
- Multi-phase analyses (e.g., atlas7v Phases 1→2→3→4) where later conclusions depend on earlier findings
- Dependency chains that span multiple documents
- Migration estimates that should be consistent across documents
- Transitive closures (e.g., "7 direct deps → 32 total deps")

**How to do it**:
1. Identify analysis sequences (Phase 1 discovery → Phase 2 structure → Phase 3 dependencies → Phase 4 deep dive)
2. Verify later phases correctly reference earlier findings
3. Check that dependency counts are consistent (e.g., Phase 1 identifies 13 deps, Phase 3 expands to 32)
4. Validate migration timeline estimates across summary docs and index

**Example from 2025-11-09 atlas7v analysis**:
- Phase 1: Identified 13 unique dependencies (7 in atlas7v, 6 elsewhere)
- Phase 2: Located 7 atlas7v subroutines needed by SYNTHE
- Phase 3: Traced 7 → 32 subroutines via transitive closure
- Phase 4: Deep dive on 4 critical subroutines with 12-13 week migration estimate

**Validation checks**:
- Does Phase 3 count (32 subs) include all Phase 2 targets (7 subs)? ✓
- Does Phase 4 migration estimate (12-13 weeks) appear in SYNTHE summary? ✓
- Are line counts consistent (Phase 2: ~10,500 lines = 61% of 17,336)? ✓

---

### Task 7: Summary Document Updates

**Goal**: Ensure high-level summaries reflect detailed analysis.

**What to look for**:
- Summary documents (e.g., SYNTHE_DEEP_DIVE_SUMMARY.md) that should reference new deep dives
- Index documents that track completion status
- Timeline estimates that appear in multiple places
- Dependency graphs that need updating

**How to do it**:
1. List all summary/index documents (00_INDEX.md, *_SUMMARY.md, BRIEFING.md)
2. For each new deep dive or analysis phase, check if summary is updated
3. Verify completion percentages and status markers
4. Update "Grand Total" statistics (line counts, analysis time, etc.)

**Example from 2025-11-09**:
- Updated 00_INDEX.md to include SYNTHE deep dives (08-12) and atlas7v phases (1-4)
- Added statistics: 13,911 lines total, 23 hours analysis time
- Updated completion status: 12 deep dives + 4 atlas7v phases = Phase 2B complete

---

### Task 8: Status Table Updates

**Goal**: Keep progress tracking accurate.

**What to look for**:
- Decision tables with outdated "Pending Paula" markers
- Risk priority tables without "analyzed" status
- Phase completion summaries that don't match reality
- Roadmap checklists with stale items

**How to do it**:
1. Find all status/progress tables
2. Update based on work completed since last review
3. Add "Status" or "Progress" columns if missing
4. Use emojis consistently: ✅ Complete, 🔲 Pending, ⚠️ Blocked

**Example tables to check**:
- MISSION.md phase task lists
- ARCHITECTURE_INSIGHTS.md Section V.10 (Decision Priority)
- ARCHITECTURE_INSIGHTS.md Section VI.7 (High-Risk Code Sections)
- Any "TODO" or milestone tracking tables

---

## House Cleaning Checklist

Use this as a systematic walkthrough:

### Pre-flight
- [ ] Read MISSION.md to understand current phase
- [ ] List all documents created since last house cleaning
- [ ] Note any major decisions or findings from recent work

### Systematic review
- [ ] **Cross-references**: Search for answered questions, add links
- [ ] **TODOs**: Grep for flags, update resolved items
- [ ] **Consistency**: Pick 5 key facts, verify across docs
- [ ] **Clarity**: Read 2-3 sections fresh, prune redundancy
- [ ] **Synthesis**: Add progress summaries, update executive summaries
- [ ] **Multi-phase validation**: Check sequential analysis consistency
- [ ] **Summary updates**: Update index and summary documents with new work
- [ ] **Status tables**: Update decision/risk/progress tracking tables

### Commit and document
- [ ] Commit changes with descriptive message
- [ ] Update MISSION.md if deliverable counts changed
- [ ] Note any patterns/insights for future house cleaning sessions

---

## Tips for Effective House Cleaning

**Treat yourself as the reader**: Imagine you're encountering these docs for the first time. What would confuse you?

**Use grep liberally**: Search for keywords, section numbers, TODO patterns to find related content.

**Don't overthink**: If something is "good enough", move on. Perfect is the enemy of done.

**Time-box it**: Allocate 30-60 minutes per house cleaning session. Don't let this become another analysis paralysis trap.

**Document patterns**: If you find the same type of issue repeatedly, note it here for future house cleaning sessions.

---

## Example House Cleaning Session (2025-11-08)

**Context**: Just completed Deep Dives 01 & 02 (~1,300 lines of analysis). Need to connect these findings back to earlier documents.

**Time invested**: ~45 minutes

**Changes made**:
1. **Cross-references** (3 commits):
   - Added Deep Dive 01 & 02 references to ARCHITECTURE_INSIGHTS Section VI.1 (risk examples)
   - Linked precision discussions (Section I.4) to deep dive findings
   - Updated COMMON block validation (Section IV) with Deep Dive 02 confirmation

2. **TODOs resolved**:
   - Decision V.4 (Precision) → marked as RESOLVED
   - Section V.10 decision table → added status column
   - Section VI.7 risk table → added "Deep Dive" column showing progress

3. **Status updates**:
   - MISSION.md Phase 2 deliverables: 5 → 7 (added deep dives)
   - Section VI.8 pre-migration roadmap: checked off deep dive items
   - Decision summary: 1/10 → 5/10 resolved (with Paula's input)

4. **Synthesis**:
   - Added progress update to Executive Summary
   - Created analysis tracking column in shared subroutine table
   - Updated high-risk code sections with completion status

**Outcome**: Documents now have clear traceability from high-level questions to detailed analysis.

---

## Example House Cleaning Session (2025-11-09)

**Context**: Completed SYNTHE deep dives (08-12) and atlas7v dependency analysis (Phases 1-4). Need to update index, verify consistency across multi-phase analysis, and prepare for implementation planning phase.

**Time invested**: ~60 minutes

**Changes made**:
1. **Protocol improvements** (2 commits):
   - Added Task 6: Multi-Phase Analysis Validation (atlas7v sequential phases)
   - Added Task 7: Summary Document Updates (index and summary tracking)
   - Updated house cleaning checklist with new tasks
   - Added example session documentation (2025-11-09)

2. **Index updates** (1 commit):
   - Updated 00_INDEX.md with SYNTHE deep dives (08-12) and atlas7v phases (1-4)
   - Added Quick Reference Tables for SYNTHE and atlas7v sections
   - Added detailed summaries for all 5 SYNTHE deep dives
   - Added atlas7v dependency analysis summary
   - Updated statistics: 13,911 lines, 23 hours, 16 documents
   - Added Phase 2B Completion Summary section
   - Updated Next Steps for Implementation Planning phase

3. **Multi-phase validation**:
   - Verified atlas7v dependency chain: 13 direct → 7 atlas7v → 32 total (with transitive closure)
   - Confirmed migration estimates consistent: 12-13 weeks (atlas7v) mentioned in both Phase 4 and SYNTHE summary
   - Validated line counts: 10,500 lines = 61% of 17,336 (atlas7v.for)

4. **Cross-references**:
   - Linked atlas7v Phase 4 analysis to Deep Dive 10 (xnfpelsyn uses POPS/KAPP)
   - Linked atlas7v JOSH to Deep Dive 08 (spectrv uses radiative transfer)
   - Connected atlas7v POPS to Deep Dive 02 (same algorithm, different context)

**Outcome**: Complete Phase 2B documentation ready for stakeholder review and implementation planning. All 16 documents have consistent statistics, cross-references, and migration estimates.

---

## When NOT to House Clean

- **During rapid exploration**: Don't interrupt flow to fix cross-references
- **When under time pressure**: Finish the analysis first, clean later
- **For minor typos**: Small fixes don't need full house cleaning protocol

House cleaning is for **quality assurance after major work**, not micro-optimizing during active research.

---

**Version**: 1.1 (2025-11-09)
**Changes in v1.1**: Added Task 6 (Multi-Phase Validation), Task 7 (Summary Updates), 2025-11-09 example session
**Next review**: After Phase 3 completion or next major documentation sprint
