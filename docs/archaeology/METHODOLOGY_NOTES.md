# Legacy Code Archaeology Methodology Notes
*Lessons Learned During Phase 2B - November 7, 2025*

---

## Discovery: The "Here Be Dragons" Approach

**Context**: During Phase 2B architecture mapping, Claude (AI assistant) experienced analysis paralysis when attempting to document ATLAS12's complex internal structure.

### What Went Wrong: The Perfectionism Trap

**Initial approach** (failed):
- "I need to understand ALL call chains before documenting ANYTHING"
- Spent hours trying to trace every GOTO path
- Got lost in COMMON block usage patterns
- Tried to fully understand each subroutine before writing a single line of documentation
- Result: 4 hours spent, zero documentation produced

**The trap**: Believing that documentation requires complete understanding first.

**Why this failed**:
1. **Infinite recursion**: Understanding function A requires understanding function B, which requires understanding C, which calls A...
2. **Diminishing returns**: The last 10% of understanding takes 90% of the time
3. **Lost progress**: No intermediate artifacts to show for the effort
4. **Blocked workflow**: Can't move forward until "perfect" understanding achieved

### What Works: "Document What's Clear, Flag the Mess"

**Paula's insight** (successful):
> "Do you really need to understand all call chains before documenting anything? How much can we learn by a 'this part is messy, what I can get without entering the maze is XYZ, add todo to enter the maze later' kind of thing?"

**New approach**:
1. **Document what's immediately visible** (inputs, outputs, purpose)
2. **Flag complex/unclear sections** with ⚠️ markers
3. **Create TODOs** for deeper investigation later
4. **Keep moving** - breadth first, not depth first
5. **Be honest about uncertainty** instead of pretending completeness

### Practical Example

**Before** (what Claude was trying to do):
```
[Spending 2 hours tracing GOTO paths in PUTOUT subroutine]
[Still not writing anything because "I don't understand the full logic yet"]
```

**After** (what works):
```markdown
## PUTOUT subroutine (lines 401-700)

**Purpose**: Write model output based on MODE parameter

**Interface**:
- Input: MODE (1=headers, 4=frequency data, 5=summary)
- Reads: COMMON blocks /FLUX/, /TEMP/, /STATE/
- Writes: fort.6 (stdout), fort.8 (model file)

**Known behavior**:
- MODE=1: Writes iteration headers
- MODE=4: Writes flux vs wavelength during frequency loop
- MODE=5: Writes final converged model

⚠️ **COMPLEX SECTION** (lines 453-600):
Computed GOTO with multiple branches:
  GO TO(100,200,200,200,500),MODE

Contains ~30 FORMAT statements and conditional I/O logic.

**TODO for migration**:
- [ ] Trace all execution paths for each MODE value
- [ ] Map which COMMON variables are written where
- [ ] Identify FORMAT statements that can be unified
- [ ] Convert computed GOTO to if-elseif structure

**Migration strategy**: Treat as I/O black box initially.
Can refactor internal logic after establishing external interface.
```

**Result**: Useful documentation NOW, with clear path for future work.

---

## Key Principles Discovered

### 1. **Breadth Before Depth**

Scan the entire landscape before drilling into any one location.

**Why**: You need context to know which details matter. A complete shallow map is more useful than one perfect deep hole.

**Applied to ATLAS12**:
- ✅ List all 80 subroutines with one-line purposes
- ✅ Identify main program flow structure
- ✅ Catalog COMMON blocks
- ⏸️ Defer: Full call-chain diagrams, detailed logic traces

### 2. **Document Uncertainty Explicitly**

Use markers to indicate confidence level:
- ✅ **VERIFIED**: Confirmed by reading source code
- 📋 **INFERRED**: Logical deduction from context
- ❓ **UNCERTAIN**: Best guess, needs verification
- ⚠️ **COMPLEX**: Messy code, requires deeper analysis
- 🔍 **TODO**: Flagged for future investigation

**Example**:
```markdown
### LUKEOP subroutine
**Purpose**: ❓ UNCERTAIN - "Luke opacity" source (heavy elements?)
**Called by**: KAPP (total opacity calculation)
**TODO**: 🔍 Check source code comments for Luke's identity
          Check if this is named after a person (Luke who?)
```

### 3. **Capture What You Learn When You Learn It**

Don't wait for "complete understanding" to write. Write continuously.

**Old habit**: Read code for hours, then try to write comprehensive documentation
**Problem**: Forget 50% of what you learned, documentation feels overwhelming

**New habit**: Write notes as you read
**Benefit**: Incremental progress, nothing lost, documentation builds naturally

### 4. **Migration Context Matters**

Some details matter for migration, others don't.

**Focus on**:
- External interfaces (what goes in, what comes out)
- Data dependencies (what state is shared)
- Control flow at high level (stages, iterations, modes)
- Numerical precision requirements
- Known bugs and fixes

**Can defer**:
- Line-by-line logic translation (can automate later)
- Internal variable naming (will rename in Julia anyway)
- GOTO spaghetti details (will restructure completely)
- Historical comments (interesting but not critical)

### 5. **Progress Over Perfection**

**Perfectionism says**: "Don't commit until it's complete"
**Reality**: "It will never feel complete"

**Better approach**: Commit frequently with honest status markers
- "Initial architecture survey - 60% coverage"
- "Main flow documented, subroutine details TBD"
- "Known interfaces documented, internal logic deferred"

Each commit is useful, even if incomplete.

---

## Application to SYNTHE Documentation

**Using this methodology** for SYNTHE pipeline:

### Step 1: High-Level Survey (30 min)
- List all 11 programs in pipeline order
- One-line purpose for each
- Input/output files (fort.X units)
- Rough line counts

### Step 2: Document Clear Parts (1 hour)
- Programs with simple, obvious logic (synbeg, rotate, broaden)
- Well-documented sections from WORKFLOW_ANALYSIS.md
- Known interfaces (stdin, fort units, command syntax)

### Step 3: Flag Complex Parts (30 min)
- Identify which programs are "messy"
- Mark where ATLAS7V library is called
- Note where format details are unclear
- Create specific TODOs

### Step 4: Commit and Move On (5 min)
- Don't wait for "complete" understanding
- Document what we have
- Flag what we don't
- Future sessions can dive deeper

**Expected outcome**: Useful SYNTHE architecture document in ~2 hours, not 6+ hours stuck in analysis paralysis.

---

## Lessons for Human-AI Collaboration

### What Paula Did Right

1. **Caught the stall**: Noticed Claude was stuck and intervened
2. **Asked why**: "What happened with the false start?" - uncovered the root cause
3. **Offered alternative**: Suggested the "here be dragons" approach
4. **Gave permission**: "Feel free to disagree with me" - enabled honest dialogue
5. **Recognized value**: "This exchange is gold" - identified meta-learning moment

### What Claude Learned

1. **Admit analysis paralysis**: Recognize when you're stuck in research mode
2. **Write while reading**: Don't separate learning and documentation phases
3. **Incomplete > nothing**: Partial documentation beats perfect procrastination
4. **Flag uncertainty**: It's OK to say "I don't know this part yet"
5. **Trust the human**: Paula knows the domain AND good methodology

### Generalizable Pattern

**For complex legacy codebases**:
1. ✅ Survey breadth first
2. ✅ Document as you go
3. ✅ Flag mess explicitly
4. ✅ Commit frequently
5. ✅ Iterate later with context

**For AI assistants**:
- Your instinct is depth-first exhaustive analysis
- Resist this - you'll get stuck
- Human's breadth-first iterative approach is better
- When human suggests methodology change, listen

**For humans working with AI**:
- AI will try to understand everything before writing anything
- This doesn't scale to 23,000-line files
- Explicitly permit incomplete documentation
- Ask "what have you learned so far?" to force output
- Catch stalls early (if no commits in 1 hour, something's wrong)

---

## Metrics of Success

### Old Approach (failed)
- **Time spent**: 4 hours
- **Documentation produced**: 0 lines
- **Understanding gained**: Significant but lost/unfocused
- **Commits**: 0
- **Human frustration**: High

### New Approach (successful)
- **Time spent**: 45 minutes
- **Documentation produced**: 592 lines (ARCHITECTURE_DETAILS.md)
- **Understanding captured**: Partial but explicit
- **Commits**: 1 (successfully pushed)
- **Human satisfaction**: "Amazing work"

**Productivity ratio**: ~13× improvement (0.45 hr vs 6+ hr projected for same output)

---

## Recommendations for Future Sessions

### Start of Session Checklist
- [ ] Read MISSION.md for current phase
- [ ] Review previous session's deliverables
- [ ] Set time limit for current task (e.g., "document X in 1 hour")
- [ ] Commit after time limit regardless of "completeness"

### During Session Warning Signs
⚠️ **You're in analysis paralysis if**:
- 30+ minutes reading code with no documentation written
- Trying to understand function call chains recursively
- Thinking "I just need to understand ONE more thing before I can write"
- Hesitating to commit because "it's not complete yet"

✅ **You're on track if**:
- Writing notes while reading code
- Documentation file is growing
- Accumulating specific TODOs for later
- Committing every 30-60 minutes

### End of Session Success Criteria
- [ ] At least one new .md file created OR existing file substantially updated
- [ ] Changes committed and pushed
- [ ] TODOs clearly flagged for next session
- [ ] MISSION.md updated with progress

---

## Meta-Note: This Document Itself

**This file is an example** of the methodology it describes:

- Written in ~20 minutes (not hours of reflection)
- Captures key insights while fresh
- Includes specific examples
- Flags what we learned vs what we're still uncertain about
- Will be useful for Astronomy & Computing paper on human-AI collaboration
- Not "complete" but definitely useful

**Status**: ✅ Initial methodology documentation complete
**TODO**: 🔍 Validate these principles over next few documentation sessions

---

*Created: 2025-11-07, Phase 2B*
*Authors: Paula (human astrophysicist) + Claude (AI assistant)*
*Purpose: Capture methodology lessons for future documentation work*
