# SYNTHE Deep Dive Briefing
*Instructions for Fresh Claude Instance - Autonomous Code Archaeology*

**Mission**: Systematically analyze SYNTHE computational kernels using proven "here be dragons" methodology
**Expected Duration**: 6-8 hours of autonomous work
**Deliverables**: 5-7 deep dive documents (~800-1200 lines each)
**Context Budget**: Assume ~150K tokens available

---

## Background

You are continuing Phase 2B of the ATLAS Suite Code Archaeology Mission. ATLAS12 deep dives are **complete** (7 deep dives, all major computational kernels documented). Your task is to apply the same methodology to **SYNTHE**.

### What You Have Access To

**Existing documentation** (read these first):
- `MISSION.md` - Overall project context and progress
- `docs/archaeology/METHODOLOGY_NOTES.md` - "Here be dragons" approach
- `docs/archaeology/ARCHITECTURE_DETAILS.md` - SYNTHE architecture (Section II)
- `docs/archaeology/DEEP_DIVES/01-07_*.md` - ATLAS12 examples of deep dive format

**Source code locations**:
- `upstream/castelli/source_codes/synthe/` - Main SYNTHE pipeline programs
- `upstream/castelli/source_codes/atlas7v/` - ATLAS7V library (shared routines)

**Key SYNTHE programs** (11-program pipeline):
1. **xnfpelsyn** - Prepare populations and continuous opacities
2. **rgfalllinesnew** - Read line lists, apply wavelength limits
3. **rmolecasc** - Read molecular line data
4. **rpredict** - Read predicted (weak) lines
5. **PartitionFunctions** - Compute partition functions
6. **Binary** - Merge and sort all lines → binary fort.12
7. **spectrv** - Spectrum synthesis (MAIN computational kernel)
8. **rotate** - Rotational broadening
9. **broaden** - Instrumental broadening
10. **smooth** - Final smoothing
11. (Various support programs)

---

## Proven Methodology: "Here Be Dragons"

**Core principle**: Document what's clear, flag the unclear, move on. Breadth beats depth for initial archaeology.

### Deep Dive Template Structure

Each deep dive should follow this proven structure:

```markdown
# Deep Dive NN: [Subroutine/Topic Name]
*Brief description*

**Risk Rank**: [If applicable]
**Code Section**: [File:lines]
**Risk Type**: [e.g., Algorithm, Precision, Performance]
**Analysis Date**: YYYY-MM-DD
**Time Invested**: ~XX minutes

## Executive Summary
[3-5 paragraph overview of findings]

## Table of Contents
[10-12 sections typical]

## 1. Overview
[Context, when/how called]

## 2-8. [Technical Analysis Sections]
[Algorithm details, code walkthroughs, numerical methods]

## 9. Migration Strategy
[Julia implementation approach, validation plan]

## 10. Testing Strategy
[Unit tests, integration tests, physics validation]

## 11. Open Questions
[For domain expert, for validation, for migration decisions]

## 12. Key Takeaways
[Numbered list of critical points]
```

**Typical deep dive metrics** (from ATLAS12):
- 800-1200 lines per document
- 60-90 minutes analysis time
- 10-12 main sections
- 3-5 migration strategies proposed
- 5-10 open questions flagged

---

## SYNTHE Priority Rankings

### High-Priority Targets (Do These First)

Based on ARCHITECTURE_DETAILS.md analysis and migration risk:

#### Priority 1: **spectrv** Computational Kernel
**File**: `upstream/castelli/source_codes/synthe/spectrv.f`
**Why critical**:
- Main spectrum synthesis loop
- Integrates opacities over all lines at each wavelength
- Performance bottleneck (processes millions of lines)
- Similar to ATLAS12's LINOP1/XLINOP (see Deep Dive 03)

**Key aspects to analyze**:
- Line selection and filtering (wavelength windows)
- Opacity accumulation strategy (precision critical)
- Voigt profile evaluation (reuse from Deep Dive 01?)
- Doppler shift handling (rotation, turbulence)
- Output spectrum format

**Expected findings**:
- Likely Float32 accumulation (check precision requirements)
- Nested loops over wavelength × lines
- Early-exit optimizations for performance
- Binary I/O for line data (cross-reference Deep Dive 04)

---

#### Priority 2: **Binary** Line Merging
**File**: `upstream/castelli/source_codes/synthe/Binary.f`
**Why critical**:
- Creates fort.12 (binary line database)
- Same IIIIIII format documented in Deep Dive 04
- Merging/sorting millions of lines from multiple sources
- Migration must preserve exact binary format for validation

**Key aspects to analyze**:
- Sort algorithm (stability matters for duplicate wavelengths)
- Memory management (can't hold all lines in RAM)
- Wavelength log-encoding (RATIOLG, IWL - see Deep Dive 04)
- TABLOG compression (INTEGER*2 indices)

**Expected findings**:
- External sort or chunked processing
- Same 16-byte record format as ATLAS12
- Potential for Julia optimization (better sorting algorithms)

---

#### Priority 3: **xnfpelsyn** Population Preparation
**File**: `upstream/castelli/source_codes/synthe/xnfpelsyn.f`
**Why critical**:
- Reads ATLAS12 atmosphere model
- Calls POPS (Saha-Boltzmann populations - see Deep Dive 02)
- Computes continuous opacities
- Sets up initial state for spectrum synthesis

**Key aspects to analyze**:
- Input file parsing (fort.8 from ATLAS12)
- POPS iteration (electron density convergence)
- Continuous opacity sources (H-, H2+, electron scattering, etc.)
- Depth interpolation (if needed)

**Expected findings**:
- Shares POPS code with ATLAS12 (same precision requirements: Float64)
- Fixed-format input parsing (fragile - needs schema validation)
- Cross-reference to ATLAS12's COMMON blocks

---

#### Priority 4: **Broadening Kernels** (rotate, broaden, smooth)
**Files**: `rotate.f`, `broaden.f`, `smooth.f`
**Why important**:
- Post-processing spectrum (convolution)
- Rotation: v sin i broadening
- Instrumental: Gaussian/Lorentzian profile
- Smooth: Final aesthetic smoothing

**Key aspects to analyze**:
- Convolution algorithms (FFT? Direct sum?)
- Limb-darkening treatment (rotation)
- Profile shapes and normalization
- Edge effects and boundary conditions

**Expected findings**:
- Relatively simple convolution kernels
- Performance depends on spectrum resolution
- May benefit from Julia's FFT libraries

---

#### Priority 5: **Line Reading Pipeline** (rgfalllinesnew, rmolecasc, rpredict)
**Why important**:
- Input validation critical
- Multiple line list formats (atomic vs molecular)
- Wavelength filtering and selection
- Error handling for corrupted data

**Key aspects to analyze**:
- File format documentation (what columns mean)
- Atomic vs molecular line differences
- Predicted line handling (lower quality data)
- Duplicate detection and removal

---

### Medium-Priority (If Time Permits)

- **PartitionFunctions**: Partition function calculation (cross-ref Deep Dive 02)
- **ATLAS7V library routines**: Shared with ATLAS12 (may already be covered)

### Low-Priority (Skip Unless Obvious Issues)

- **support programs**: File conversion utilities, one-off scripts
- **deprecated versions**: Old code in commented sections

---

## Methodology: Step-by-Step Process

### Phase 1: Survey (15-20 minutes per target)

For each priority target:

1. **Read the source file**
   ```bash
   cd /home/user/Atlas.jl
   cat upstream/castelli/source_codes/synthe/[filename].f | head -200
   ```

2. **Identify structure**:
   - Is it a main program or subroutine collection?
   - What COMMON blocks does it use?
   - What files does it read/write?
   - What's the main computational loop?

3. **Flag dragons** 🐉:
   - Undocumented algorithms
   - Magic numbers
   - Precision-sensitive calculations
   - Binary I/O
   - Performance bottlenecks

4. **Note cross-references**:
   - "This looks like ATLAS12's XLINOP" → link to Deep Dive 03
   - "Uses same POPS routine" → link to Deep Dive 02
   - "Binary format matches fort.12" → link to Deep Dive 04

### Phase 2: Deep Dive (45-75 minutes per target)

Following the template above:

1. **Extract key code sections**:
   - Main loop (show code, explain logic)
   - Critical algorithms (Voigt, opacity sum, sorting, etc.)
   - I/O operations (format documentation)
   - Precision-sensitive calculations

2. **Analyze numerical methods**:
   - What algorithm is being used? (Name it if known)
   - What are the stability/accuracy requirements?
   - Are there edge cases or failure modes?
   - What precision (Float32/Float64) is appropriate?

3. **Document migration strategy**:
   - Direct translation approach
   - Julia-specific optimizations available
   - Validation strategy (how to test correctness)
   - Performance considerations

4. **Flag open questions**:
   - Things unclear from code alone
   - Physics questions for domain expert
   - Migration tradeoffs needing decisions

### Phase 3: Cross-Reference (10-15 minutes per deep dive)

After writing each deep dive:

1. **Update ARCHITECTURE_INSIGHTS.md**:
   - Add findings to relevant sections
   - Update risk assessments if needed
   - Link to new deep dive

2. **Note reusable patterns**:
   - "spectrv line loop similar to ATLAS12 XLINOP"
   - "Binary format identical - single implementation can handle both"

3. **Track dependencies**:
   - Which SYNTHE programs must be migrated first?
   - What shared code (ATLAS7V) is needed?

---

## Example Walkthroughs

### Example 1: Analyzing spectrv Main Loop

**Step 1: Find the main loop**
```bash
grep -n "DO.*NWAVE\|DO.*NU" spectrv.f | head -20
```

**Step 2: Extract ~50 lines around the loop**
```bash
sed -n '1234,1284p' spectrv.f  # Adjust line numbers as found
```

**Step 3: Analyze the loop**:
- What's the wavelength stepping?
- How are lines selected for this wavelength?
- How is opacity accumulated?
- What profile function is called?

**Step 4: Document findings**:
```markdown
## 3. Main Spectrum Synthesis Loop

**Location**: spectrv.f:1234-1567

**Structure**:
\`\`\`fortran
DO 100 IW=1,NWAVE
   WAVE=WAVESET(IW)
   ! ... select lines contributing at this wavelength
   DO 200 ILINE=ISTART,IEND
      ! ... compute Voigt profile
      ! ... accumulate opacity
   200 CONTINUE
   ! ... compute emergent intensity
100 CONTINUE
\`\`\`

**Key findings**:
- Wavelength loop is outermost (cannot parallelize easily)
- Line selection via binary search on sorted wavelength array
- Float32 accumulation (SAME AS ATLAS12 - acceptable)
- Early exit when line wing contribution < 1e-6
```

---

### Example 2: Documenting Binary Format

**If you find binary I/O**:

1. **Look for WRITE statements**:
   ```bash
   grep -n "WRITE(.*)" Binary.f | grep -v "WRITE(6"  # Exclude stdout
   ```

2. **Find the record structure**:
   ```bash
   grep -B5 -A5 "COMMON.*IIIIIII\|EQUIVALENCE" Binary.f
   ```

3. **Cross-reference to Deep Dive 04**:
   ```markdown
   ## 4. Binary Output Format

   **SYNTHE uses identical format to ATLAS12** - see Deep Dive 04 for full documentation.

   **Brief summary**:
   - 16-byte records (IIIIIII structure)
   - IWL: INTEGER*4 wavelength index
   - IELION, IELO, IGFLOG, IGR, IGS, IGW: INTEGER*2 packed line data

   **Migration**: Single implementation can handle both ATLAS12 fort.12 and SYNTHE fort.12
   ```

---

## Expected Deliverables

By end of session, you should have created:

### Required Deliverables (Minimum)

1. **DEEP_DIVES/08_SYNTHE_SPECTRV.md** (~1000 lines)
   - Main spectrum synthesis kernel
   - Line opacity accumulation
   - Wavelength loop structure

2. **DEEP_DIVES/09_SYNTHE_BINARY_MERGE.md** (~800 lines)
   - Line merging and sorting
   - Binary format (cross-ref DD04)
   - Memory management

3. **DEEP_DIVES/10_SYNTHE_POPULATIONS.md** (~700 lines)
   - xnfpelsyn analysis
   - POPS integration (cross-ref DD02)
   - Input file parsing

### Stretch Goals (If Context Permits)

4. **DEEP_DIVES/11_SYNTHE_BROADENING.md** (~600 lines)
   - Rotation, instrumental, smoothing kernels
   - Convolution algorithms

5. **DEEP_DIVES/12_SYNTHE_LINE_READERS.md** (~700 lines)
   - rgfalllinesnew, rmolecasc, rpredict
   - Input format documentation

### Summary Document

6. **SYNTHE_DEEP_DIVE_SUMMARY.md** (~500 lines)
   - Overview of all SYNTHE deep dives
   - Migration dependency graph
   - Shared code with ATLAS12 identified
   - Recommended migration order

---

## Quality Checklist

Before finishing, verify each deep dive has:

- [ ] Executive summary (3-5 paragraphs)
- [ ] Clear code section references (file:line)
- [ ] At least one code walkthrough with line-by-line explanation
- [ ] Migration strategy section (Julia implementation approach)
- [ ] Testing strategy section (unit + integration tests)
- [ ] 5-10 open questions flagged
- [ ] Cross-references to ATLAS12 deep dives (where applicable)
- [ ] Key takeaways summary (numbered list)

---

## Git Workflow

Commit frequently (every deep dive completed):

```bash
git add docs/archaeology/DEEP_DIVES/[number]_*.md
git commit -m "Add Deep Dive [NN]: [Topic] ([NNN] lines)"
git push -u origin claude/phase-2b-documentation-architecture-011CUtZTwX29Tt1LCdtuf9pf
```

**CRITICAL**: Use the **same branch name** as ATLAS12 deep dives to maintain continuity.

---

## Success Criteria

You've succeeded if:

1. ✅ 3-5 deep dives completed (minimum: spectrv, Binary, xnfpelsyn)
2. ✅ Each deep dive is 700-1200 lines, following template
3. ✅ Cross-references to ATLAS12 deep dives identified
4. ✅ Migration strategies documented for each component
5. ✅ All code committed and pushed to git
6. ✅ Summary document ties everything together

---

## What NOT to Do

**Don't**:
- ❌ Try to understand every line of code (here be dragons approach)
- ❌ Get stuck on undocumented algorithms (flag and move on)
- ❌ Spend > 90 minutes on any single deep dive
- ❌ Write code (this is archaeology, not implementation)
- ❌ Skip the migration strategy section (critical for future work)
- ❌ Forget to commit frequently (connection instability possible)

**Do**:
- ✅ Flag unclear sections with 🐉 emoji and move on
- ✅ Cross-reference liberally to ATLAS12 deep dives
- ✅ Document what's clear, note what's not
- ✅ Keep momentum (breadth over depth)
- ✅ Write clear, scannable documentation
- ✅ Think about future-you reading this in 6 months

---

## Helpful Commands

**Search for main loops**:
```bash
grep -n "DO.*IW\|DO.*NWAVE\|DO.*LINE" [file].f
```

**Find COMMON blocks**:
```bash
grep -n "COMMON /" [file].f | head -20
```

**Extract line range**:
```bash
sed -n '[start],[end]p' [file].f
```

**Search across all SYNTHE files**:
```bash
grep -r "PATTERN" upstream/castelli/source_codes/synthe/
```

**Check file line count**:
```bash
wc -l upstream/castelli/source_codes/synthe/*.f
```

---

## Final Notes

**Philosophy**: You're building a map for future travelers (including future-you). The map doesn't need to explain every tree in the forest - it needs to show the paths, warn about cliffs (🐉), and note landmarks for navigation.

**Mindset**: Think of yourself as a technical archaeologist, not a software engineer. Your job is to document and understand, not to fix or improve. Future sessions will handle implementation.

**Output quality**: Aim for "clear and useful" over "complete and perfect". A 90% complete deep dive is infinitely more valuable than a 10% perfect one.

**Good luck!** 🐲✨ You've got this. The ATLAS12 deep dives prove the methodology works.

---

**Document prepared by**: Claude (Phase 2B session, 2025-11-08)
**For use by**: Fresh Claude instance (autonomous SYNTHE analysis)
**Expected start date**: 2025-11-08 or later
**Branch**: claude/phase-2b-documentation-architecture-011CUtZTwX29Tt1LCdtuf9pf
