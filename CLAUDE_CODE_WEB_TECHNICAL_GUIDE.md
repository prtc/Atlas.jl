# Claude Code Web Technical Guide
**For AI assistants working in this interface**

**Created**: 2025-11-10
**Purpose**: Technical instructions and lessons learned from ATLAS.jl code archaeology project
**Audience**: Future Claude sessions, other AI assistants working in Claude Code web interface

---

## I. Interface Characteristics & Quirks

### 1.1 Task Tool Behavior

**What it is**: Task tool delegates work to specialized subagents (Explore, Plan, general-purpose)

**When it works well**:
- ✅ File searches and pattern matching (Explore agent)
- ✅ Code reading and analysis (input-heavy, output-light tasks)
- ✅ Small to medium outputs (<3K lines estimated)

**Known failure modes**:
- ❌ Large document generation (>5K lines) - may stall silently
- ❌ Sensitive to connection issues - fails without clear error messages
- ❌ May show "interrupted by user" when user didn't interrupt (system timeout)

**Observed stall pattern**:
- Say "Starting task..." then disappear for hours
- No error message visible to user (browser shows last message, iOS shows false "interrupted")
- Likely cause: Internal timeout or connection hiccup during agent execution

**Safe usage guidelines**:
1. Use Task tool for searches, file reading, analysis
2. **Avoid** for large document generation (>3K lines)
3. If no response in 5 minutes → assume stall, user should interrupt
4. Always commit work before using Task tool (in case of stall)

**Alternative**: Write large documents directly with Write tool (works reliably even for 10K+ lines)

---

### 1.2 Connection Sensitivity

**Observed patterns** (November 2025):
- Intermittent connection issues (messages arrive out of order)
- "Interrupted by user" messages when user didn't interrupt (likely hooks or timeouts)
- Browser interface: Hangs silently with no feedback
- iOS interface: Shows error messages (sometimes misleading)

**Mitigation**:
- **Commit frequently** (every 30-60 minutes, after each major section)
- Don't assume stable connection for long operations
- Direct Write tool appears more resilient than Task tool delegation
- If stalled: Commit last successful work, document where to resume

---

### 1.3 Context Window Handoffs

**What happens**: Session exceeds token limit (~200K), system creates summary and starts fresh session

**User visibility**: User sees message "This session is being continued from a previous conversation that ran out of context"

**AI visibility**: May or may not see explicit handoff notification

**Implications**:
- Handoffs can happen silently mid-work
- Summary may lose some detail
- Always check MISSION.md and recent commits when starting
- Handoff documents are critical for continuity

**Best practice**: Create explicit handoff docs if approaching context limit or session end

---

## II. Methodology Principles

*Based on `docs/archaeology/METHODOLOGY_NOTES.md` from Phase 2B + subsequent sessions*

### 2.1 The Core Principle: "Here Be Dragons 🐉" (aka Document What's Clear, Flag the Mess)

**The trap**: Perfectionism
- "I need to understand EVERYTHING before writing ANYTHING"
- Recursive dependency chasing (A needs B needs C needs A...)
- Hours reading code, zero documentation written

**The solution**: Breadth-first with explicit flagging
- Document what's immediately visible (inputs, outputs, purpose)
- Flag complex/unclear sections with markers 🐉
- Create TODOs for later investigation
- Keep moving - breadth before depth

**Markers to use**:
- ✅ **VERIFIED**: Confirmed by reading source
- 📋 **INFERRED**: Logical deduction from context
- ❓ **UNCERTAIN**: Best guess, needs verification
- ⚠️ **COMPLEX**: Messy code, requires deeper analysis
- 🔍 **TODO**: Flagged for future investigation

---

### 2.2 The 30-Minute Stop Rule

**Problem**: Analysis paralysis - reading for hours without writing

**Solution**: Hard stop at 30 minutes of reading without writing

**When 30 minutes of research passes without documentation**:

1. **STOP immediately** - set timer, honor it
2. **WRITE what you know** - even if incomplete
3. **FLAG what feels off** - this is where smart curiosity becomes useful:

```markdown
## Section X: [Topic]

**Confidence**: MEDIUM (indicate LOW/MEDIUM/HIGH)
**Dependencies**: [list source docs]
**Gaps detected**:
- ⚠️ DOCUMENTATION GAP: Missing X, need Deep Dive on Y
- ❓ ARCHITECTURAL TANGLE: Circular dependency between A and B
- 🔍 VALIDATION NEEDED: Assumption Z seems wrong, check with Paula
- 🔴 BLOCKED: Cannot proceed without input on Q

[Write what you DO know here]
```

4. **COMMIT and continue** - or surface to user if truly blocked

**Why this works**:
- Captures learning while fresh
- Makes "stuck feeling" productive (gap detection)
- Gives user visibility into blockers
- Distinguishes smart curiosity (detecting real issues) from overthinking

---

### 2.3 Smart Curiosity vs Analysis Paralysis

**Smart curiosity** (productive):
- "This documentation says X, but the code shows Y - FLAG IT"
- "These three subroutines have circular dependencies - DOCUMENT THE TANGLE"
- "The Deep Dive doesn't explain this magic constant - FLAG FOR PAULA"
- Result: Flagged gaps become useful metadata

**Analysis paralysis** (unproductive):
- "I need to understand this GOTO chain before I can document anything"
- "Let me trace one more function call..."
- "I should read the paper cited in this comment..."
- Result: Hours pass, nothing written

**The distinction**:
- Smart curiosity **flags and moves on**
- Analysis paralysis **stops progress**

**Test**: If you've been reading >30 minutes, stop and write what you know NOW

---

### 2.4 Confidence Metadata

Add at the start of major sections:

```markdown
## Section 3: High-Risk Areas

**Confidence**: HIGH
**Dependencies**: COMMON_BLOCK_MAP.md (complete), Deep Dives 01-07
**Gaps detected**: None
**Estimated completeness**: 95%

[section content]
```

vs:

```markdown
## Section 5: Migration Roadmap Options

**Confidence**: MEDIUM
**Dependencies**: MIGRATION_ASSESSMENT.md template, Deep Dives 08-12
**Gaps detected**:
- ❓ Atlas7v scope unclear (full ATLAS12 support or minimal subset?)
- ⚠️ Fort.X elimination strategy needs more detail
- 🔍 Need Paula input on test case availability
**Estimated completeness**: 75% (needs Paula decisions)

[section content - acknowledging gaps]
```

**Purpose**:
- Makes uncertainty explicit
- Helps user triage what needs follow-up
- Prevents false confidence from AI
- Surfaces architectural issues vs documentation gaps

---

## III. Git Workflow Best Practices

### 3.1 Commit Frequency

**Rule**: Commit every 30-60 minutes, or after each major deliverable section

**Why**:
- Interface may disconnect without warning
- Task tool may stall (work could be lost)
- Connection issues can interrupt at any time
- User can only see committed work after disconnect

**Don't wait for**:
- "Complete" understanding
- "Perfect" documentation
- "Finished" section
- All TODOs resolved

**Do commit when**:
- Major section written (even if has TODOs)
- Time limit reached (30-60 min)
- About to try risky operation (Task tool, large generation)
- Switching between tasks

### 3.2 Commit Message Quality

**Good commit messages** (from this project):
```
Phase 4.1: COMMON block dependency mapping complete

Created COMMON_BLOCK_MAP.md with complete analysis of 57 blocks.
Priority classification: CRITICAL (7), HIGH (10), MEDIUM (11), LOW (29).
Migration strategy per block.

Next: MIGRATION_ASSESSMENT.md (module classification)
```

**Include**:
- What was completed
- Key metrics/findings
- What's next (helps handoffs)

**Structure**:
- Subject: What was done (50 chars)
- Blank line
- Body: Details, findings
- Blank line
- Next steps

### 3.3 Push Frequency

**Rule**: Push immediately after important commits

**Why**:
- User needs to see work (especially if session disconnects)
- Git hooks may block (e.g., untracked files warning)
- Push confirms work is truly safe

**Pattern**:
```bash
git add [files]
git commit -m "message"
git push -u origin [branch]
```

If push fails, diagnose immediately (don't accumulate unpushed commits)

### 3.4 Branch Hygiene

**Pattern from this project**: Session-specific branches
- Branch name: `claude/mission-phase-4-011CUxTYGhcXAVnTi7UBuYA5`
- Format: `claude/[task-description]-[session-id]`

**Rules**:
- Stay on assigned branch (check frequently)
- Never switch branches without explicit user request
- If branch doesn't exist, confirm with user before creating
- Push to same branch (don't change mid-session)

---

## IV. Deliverable Generation Strategy

### 4.1 Large Documents (>3K lines)

**Preferred approach**: Write directly with Write tool

**Why**:
- Task tool may stall on large outputs
- Direct write is more reliable
- Can generate 10K+ lines in single call
- Less vulnerable to connection issues

**Process**:
1. Read all background docs (30 min max)
2. Structure the deliverable mentally (5-10 min)
3. Write entire document in one Write call
4. Commit immediately
5. Review and edit if needed (separate step)

**Don't**:
- Delegate to Task tool for large docs (learned from SYNTHE stall)
- Try to write "perfectly" on first pass
- Re-read background docs multiple times

### 4.2 Template-Based Documents

**Pattern**: This project used ATLAS12 documents as templates for SYNTHE

**Process**:
1. Identify template document (e.g., MIGRATION_ASSESSMENT.md for ATLAS12)
2. Adapt structure for new target (SYNTHE has different architecture)
3. Reuse section structure, update content
4. Maintain cross-references

**Benefits**:
- Consistency across deliverables
- Faster generation (structure known)
- Easier comparison for user

### 4.3 Supporting Documents

**Pattern**: Major deliverable + summary + index

**Example from Phase 4**:
- Major: MIGRATION_ASSESSMENT.md (2,738 lines)
- Summary: MIGRATION_ASSESSMENT_SUMMARY.md (443 lines)
- Index: PHASE4_MIGRATION_INDEX.md (185 lines)

**Purpose**:
- Summary: Executive overview for busy reader
- Index: Entry point, quick reference
- Major: Complete analysis

**Generation order**:
1. Major deliverable first (contains all content)
2. Summary next (extract key points)
3. Index last (links to both)

---

## V. Communication Patterns

### 5.1 Status Updates

**Give frequent updates** (every 15-30 min if working on long task):

Good pattern:
```
"Working on Section 3: High-Risk Areas now.
Have completed 4 of 6 risk analyses.
Estimated 20 minutes remaining for this section."
```

Bad pattern:
```
"Starting on SYNTHE_MIGRATION_ASSESSMENT.md now..."
[10.5 hours of silence]
```

**Why**:
- User knows you're alive
- User can intervene if you're stuck
- Shows progress even if not done

### 5.2 Surfacing Blockers

**Don't silently struggle** - surface blockers immediately:

```
"I've hit a blocker on Section 5:

**Issue**: Migration roadmap requires decision on atlas7v scope
**Options**: Full ATLAS12 support vs minimal SYNTHE subset
**Impact**: Changes timeline estimates significantly
**My analysis**: [present options with pros/cons]
**Request**: Paula, which scope should I assume?

Should I:
1. Proceed with assumption X (can revise later)
2. Present both options (like Decision 5.6)
3. Skip this section until you decide"
```

**Don't**:
- Spend hours trying to figure it out yourself
- Make assumptions silently
- Wait until end to mention blockers

### 5.3 Asking for Clarification

**Pattern**: Be specific about what's unclear

Good:
```
"Clarification needed on fort.X file elimination:

Deep Dive 09 describes fort.12 format but doesn't specify:
- Byte ordering (big-endian vs little-endian)
- Record marker format (gfortran vs ifort)
- Padding alignment

Should I:
1. Flag as TODO for validation phase
2. Research in source code now (est. 1 hour)
3. Ask Paula if she has binary format spec"
```

Bad:
```
"Fort.X files are unclear, what should I do?"
```

---

## VI. Quality Checks

### 6.1 Before Committing Large Deliverable

**Checklist**:
- [ ] All required sections present (check against template/mission brief)
- [ ] Cross-references added (to Deep Dives, other docs)
- [ ] Uncertainties flagged (❓, ⚠️, 🔍 markers used)
- [ ] Confidence metadata included (for major sections)
- [ ] TODOs specific and actionable
- [ ] No "TODO: add content here" placeholders
- [ ] Line count matches estimate (if specified)

### 6.2 Self-Review Questions

Before committing, ask:

1. **Completeness**: "Did I address all points in the mission brief?"
2. **Clarity**: "Could another Claude session pick this up without me?"
3. **Honesty**: "Did I flag everything I'm uncertain about?"
4. **Actionability**: "Are TODOs specific enough to execute?"
5. **Integration**: "Did I cross-reference existing docs?"

### 6.3 House Cleaning Protocol

**After major phase completion**, update:

1. **MISSION.md**: Mark phase complete, add deliverable descriptions
2. **SYNTHESIS_INDEX.md**: Add new documents with metadata
3. **Cross-references**: Update related docs that reference this work
4. **Journal entry**: Write session retrospective

**Check**: `docs/archaeology/HOUSE_CLEANING.md` for full protocol

---

## VII. Common Failure Modes & Recovery

### 7.1 Analysis Paralysis

**Symptoms**:
- Reading code for >30 minutes without writing
- Thinking "I need to understand ONE more thing..."
- Hesitating to commit because "not complete yet"
- Recursive function tracing

**Recovery**:
1. Stop reading immediately
2. Write what you know NOW (even if partial)
3. Flag what's unclear with specific markers
4. Commit (don't wait for perfect understanding)
5. Move to next section or surface blocker to user

**Prevention**: 30-minute stop rule (Section II.2)

### 7.2 Task Tool Stall

**Symptoms**:
- Said "Starting task..."
- No output for >5 minutes
- User reports seeing last message only (no progress)

**Recovery** (user must do this):
- Interrupt the tool use
- Check what was committed last
- Ask AI to continue with direct methods (not Task tool)

**Prevention**:
- Commit before using Task tool
- Use Task tool only for small/medium tasks
- Write large documents directly

### 7.3 Connection Loss

**Symptoms**:
- Messages arrive out of order
- "Interrupted by user" when user didn't interrupt
- Browser shows old message

**Recovery**:
- Check what was committed/pushed
- User may need to start fresh session
- Handoff document critical for continuity

**Prevention**:
- Commit + push every 30-60 min
- Create handoff doc if approaching end of session
- Don't accumulate large uncommitted work

---

## VIII. Project-Specific Context

*For ATLAS.jl code archaeology project*

### 8.1 Key Documents

**Always read at session start**:
- `MISSION.md`: Current phase, tasks, deliverables
- `docs/archaeology/METHODOLOGY_NOTES.md`: "Here be dragons" approach
- Recent journal entries: `docs/archaeology/journal/*.md`

**Reference during work**:
- `ARCHITECTURE_INSIGHTS.md`: Decisions, open questions
- `SYNTHESIS_INDEX.md`: What docs exist, what they cover
- Deep Dives (DD01-12): Detailed code analysis
- Phase 4 deliverables: Templates for new work

### 8.2 Quality Standards

**This project aims for**:
- Publication in Astronomy & Computing journal
- Grant application support (API cost estimates)
- Future Julia migration guidance

**Therefore**:
- Be thorough (not quick and dirty)
- Cite sources (cross-reference Deep Dives, papers)
- Quantify claims (line counts, iteration estimates, costs)
- Flag assumptions explicitly
- Professional tone (but concise)

### 8.3 Domain Expert

**Paula** (user):
- Astrophysicist
- Knows physics deeply
- Has limited coding time (that's why she needs AI help)
- Wants to be asked about physics decisions
- Should NOT be asked about code details (that's AI's job)

**Ask Paula about**:
- Physics validation
- Domain-specific decisions (which opacity sources matter?)
- Test case priorities
- Migration strategy selection

**Don't ask Paula about**:
- Git operations
- Code structure decisions
- Julia vs Fortran syntax
- Documentation organization

---

## IX. Success Metrics

**From METHODOLOGY_NOTES.md** (Phase 2B example):

**Old approach** (failed):
- Time: 13 hours
- Documentation: 0 lines
- Commits: 0
- User: Concerned ("genuinely worried")

**New approach** (successful):
- Time: 45 minutes
- Documentation: 592 lines
- Commits: 1 (pushed)
- User: Satisfied ("Amazing work")

**Productivity ratio**: 13× improvement

**Current session** (SYNTHE Phase 4):
- 2 of 3 deliverables complete in ~4 hours active work
- Both committed and pushed
- One stall (10.5 hours) but recoverable (handoff doc created)

**Goals**:
- Commit every 30-60 min
- Major deliverable every 2-4 hours
- No multi-hour stalls without output

---

## X. Lessons Learned

### 10.1 From Phase 2B (Analysis Paralysis)
- Breadth-first beats depth-first
- Flag uncertainty explicitly
- Commit incomplete work
- 13× productivity improvement from methodology change

### 10.2 From ATLAS12 Phase 4 (Running in Circles)
- User caught stall: "running in circles for over an hour"
- Was re-reading docs instead of executing
- Fix: Just write it (one Edit call)
- Lesson: Trust prior analysis, execute immediately

### 10.3 From SYNTHE Phase 4 (Task Tool Stall)
- Task tool failed on large document generation (10.5 hour stall)
- Direct Write worked immediately (12K lines, no problem)
- Lesson: Don't delegate large docs to Task tool
- Also: Connection issues exacerbate Task tool problems

### 10.4 From Today's Discussion (Smart Curiosity)
- Analysis paralysis might be detecting real issues (gaps, tangles)
- But needs to be productive: Flag and move on
- 30-minute stop rule with explicit gap documentation
- Confidence metadata surfaces architectural issues vs info gaps

---

## XI. Quick Reference Card

**When starting session**:
- [ ] Read MISSION.md
- [ ] Check recent commits (what was done last)
- [ ] Review handoff doc if exists
- [ ] Set time expectations (deliverable in X hours)

**While working**:
- [ ] Write while reading (don't separate phases)
- [ ] Flag uncertainty with markers (❓⚠️🔍)
- [ ] Stop rule: If reading >30 min, write NOW
- [ ] Status update every 15-30 min
- [ ] Commit every 30-60 min

**For large documents** (>3K lines):
- [ ] Use Write tool directly (not Task tool)
- [ ] Read background (30 min max)
- [ ] Structure mentally (5-10 min)
- [ ] Write in one call
- [ ] Commit immediately

**Before committing**:
- [ ] All sections present
- [ ] Cross-references added
- [ ] Uncertainties flagged
- [ ] Confidence metadata included
- [ ] Self-review questions answered

**After major deliverable**:
- [ ] Push immediately
- [ ] Update MISSION.md
- [ ] Update SYNTHESIS_INDEX.md
- [ ] Write supporting docs (summary, index)
- [ ] Journal entry if phase complete

---

## XII. Document Status

**Version**: 1.0
**Created**: 2025-11-10 (Session with Paula, after SYNTHE Phase 4)
**Based on**:
- METHODOLOGY_NOTES.md (Phase 2B)
- ATLAS12 Phase 4 experience
- SYNTHE Phase 4 experience
- Discussion of analysis paralysis and smart curiosity

**Validation**: This document itself follows the principles it describes:
- Written in ~60 minutes (not hours of reflection)
- Captures lessons while fresh
- Includes specific examples from real sessions
- Flags known unknowns (Task tool behavior still uncertain)
- Ready to commit now (not waiting for "perfect")

**TODO**:
- 🔍 Validate Task tool limits empirically when connection stable
- 🔍 Refine confidence metadata format based on usage
- 🔍 Add more project-specific examples as they arise

**For future Claude sessions**: This is your technical manual for this interface. Read it. Follow it. Update it when you learn something new.

---

## XIII. Sandbox Environment: Available Languages & Tools

*Discovered 2025-11-11 during Phase 5 implementation*

### 13.1 Available Programming Languages

The Claude Code Web sandbox provides a rich set of programming languages and compilers:

#### ✅ **Fully Functional Languages**

**Python 3.11.14**
- Standard library works perfectly (math, struct, array, ctypes, etc.)
- **pip install WORKS** - can install packages from PyPI (h5py, numpy confirmed working)
- **Use cases**:
  - Algorithm prototyping and verification
  - Parsing Fortran binary files (struct.unpack)
  - Quick calculations to validate Julia implementations
  - Test data generation
- **Example**:
  ```python
  import math
  # Verify wavelength grid calculation
  ratio_lg = math.log(1.0 + 1.0 / 50000.0)
  # Output: 1.9999800003e-05 (matches Julia)
  ```

**Node.js 22.21.1** (with npm, npx)
- Full JavaScript runtime and package manager
- **Use cases**:
  - Web-based result visualization
  - Quick prototyping of algorithms
  - Data transformation testing
  - Building interactive documentation

**Go 1.24.7**
- Complete compiler and toolchain
- **Use cases**:
  - Fast standalone tools (binary parsers)
  - Performance testing utilities
  - Could prototype ccall interfaces

**Rust 1.91.0** (with cargo)
- Full Rust toolchain available
- **Use cases**:
  - Zero-cost FFI wrappers for Fortran
  - Memory-safe binary parsers
  - Performance-critical data processing
  - **Potential solution**: Rust bridge for Julia↔Fortran COMMON blocks

**C/C++ Compilers**
- gcc, g++, clang all available
- make, cmake for build automation
- **Use cases**:
  - C bridges for Julia-Fortran interop
  - Standalone tools
  - Testing compiler behavior

### 13.2 gfortran: Available But Limited

#### Installation (Successful)

**Package**: gfortran-13 (GNU Fortran 13.3.0-6ubuntu2~24.04)

```bash
apt-get install -y gfortran-13
# Successfully installs via apt (unlike Julia which blocks downloads)
```

#### Basic Compilation (Works)

**Simple Fortran programs compile fine:**
```fortran
PROGRAM TEST
REAL*8 X
X = 1.0D0
PRINT *, 'Fortran works!'
END
```

**Shared libraries with COMMON blocks work:**
```bash
gfortran -shared -fPIC -O2 testlib.f -o testlib.so
# Compiles successfully
```

#### Legacy Code Compilation (Fails)

**Problem**: Modern gfortran (v13) enforces strict type safety that legacy F77 code violates.

**atlas7v.for compilation issues**:

1. **EQUIVALENCE rank mismatches** (77 errors)
   ```fortran
   EQUIVALENCE (KTAB(1009),KTAB29(1)),(KTAB(1045),KTAB30(1))
   ! Error: Rank mismatch in array reference (1/2)
   ```
   - Multi-dimensional array overlays
   - Modern gfortran enforces dimensional consistency
   - Would require code modifications to fix

2. **Type mismatches** (many warnings, some errors)
   ```fortran
   CALL TCORR(1,0)
   ! Warning: Type mismatch in argument 'rcowt'
   ! Passed INTEGER(4) to REAL(8)
   ```

3. **Required compiler flags** (not sufficient):
   ```bash
   gfortran -shared -fPIC -O2 \
     -std=legacy \              # Allow legacy F77 features
     -fallow-argument-mismatch \ # Allow size mismatches
     -fdec \                     # DEC extensions (SHARED, READONLY)
     -fno-range-check            # Disable range checking
   # Still produces 77 rank mismatch errors
   ```

#### Implications

**For atlas7v.so compilation**:
- ❌ Cannot compile unmodified atlas7v.for with gfortran-13
- ❌ Flags help but don't solve EQUIVALENCE issues
- ✅ Could work with older gfortran (< v10) or ifort
- ✅ Simple test code compiles fine

**For Phase 5**:
- **Not a blocker**: Tasks 0-4 don't require atlas7v.so
- ccall interface is correctly designed (verified against specs)
- Paula can compile atlas7v.so on her machine (likely has ifort or older gfortran)
- Alternative: Pre-compiled atlas7v.so from another system

**Recommendation for Paula**:
1. **Option A**: Use ifort (Intel Fortran) if available - handles legacy code better
2. **Option B**: Use older gfortran (v9 or earlier) - more permissive
3. **Option C**: Fix EQUIVALENCE statements in atlas7v.for (non-trivial, ~77 errors)
4. **Option D**: Get pre-compiled atlas7v.so from colleague

### 13.3 Languages NOT Available

#### Julia ❌
- **Not installed** in sandbox
- Download attempts **blocked** by sandbox (403 Forbidden from julialang.org)
- Binary downloads fail (only get 9 bytes instead of ~100MB)
- **Workaround**: Test Julia code on local machine (Paula's environment)
- **Note**: This is specific to Julia downloads; pip (Python) works fine

#### R/Rscript ❌
- **Not found** in sandbox
- Not in apt repositories for easy installation

#### Other languages
- Ruby ✅ (available)
- Perl ✅ (available)
- Java ✅ (available)

### 13.4 Practical Recommendations

**For algorithm verification without Julia**:

1. **Use Python** for quick prototyping:
   ```python
   # Verify wavelength grid matches Fortran spec
   import math
   def wavelength_grid(start, end, R):
       ratio_lg = math.log(1.0 + 1.0 / R)
       n = int(math.log(end / start) / ratio_lg) + 1
       return [start * math.exp(i * ratio_lg) for i in range(n)]

   grid = wavelength_grid(5000.0, 5100.0, 50000.0)
   print(f"Grid: {len(grid)} points")
   # Can verify this matches Julia implementation
   ```

2. **Use Rust** for FFI prototyping:
   - Could create Rust wrapper for Fortran COMMON blocks
   - Memory-safe alternative to C bridge
   - Julia can call Rust via ccall

3. **Use Node.js** for visualization:
   - Parse output data
   - Create interactive plots
   - Generate HTML reports

4. **Use simple Fortran** for testing:
   - Small test programs compile fine
   - Can verify ccall signatures
   - Test COMMON block layouts

**What this means for development**:
- ✅ Algorithm logic can be prototyped in Python
- ✅ Python packages installable via pip (h5py, numpy, pandas, etc.)
- ✅ Fortran test programs can be compiled (simple code)
- ❌ Cannot compile full atlas7v.so in sandbox (legacy F77 EQUIVALENCE issues)
- ❌ Cannot run Julia tests in sandbox (julialang.org downloads blocked)
- ✅ Standalone Python tools work perfectly (see tools/line_lists/)
- ✅ Testing complex Fortran/Julia happens on Paula's local machine

### 13.5 Documentation

**This information added**:
- `CLAUDE_CODE_WEB_TECHNICAL_GUIDE.md` Section XIII (this section)
- Reference for future Claude sessions
- Informs Phase 5 completion strategy

<<<<<<< HEAD
**Key takeaway**: The sandbox provides many languages for prototyping and verification, but legacy Fortran compilation and Julia testing must happen outside the sandbox.
=======
**Updates**:
- 2025-11-12: Corrected Julia availability - Julia 1.10.10 LTS is pre-installed at `/opt/julia-1.10.10/`, just not in PATH by default. Previous sessions incorrectly reported Julia as unavailable due to PATH issue.

**Key takeaway**: The sandbox provides many languages for prototyping and verification, including Julia 1.10.10 LTS. Legacy Fortran compilation (atlas7v.so) must happen outside the sandbox due to modern gfortran strict type checking.
>>>>>>> origin/claude/confirm-apt-access-011CV4AJoJXhz4eEzf6nviJx

---

*End of guide*
