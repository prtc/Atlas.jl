# Handoff Briefing for Session 2025-11-13
**Prepared**: 2025-11-12 end of session
**For**: Fresh Claude Code session starting 2025-11-13
**Project**: Atlas.jl - Kurucz ATLAS/SYNTHE archaeology and standalone tool development
**Branch**: claude/review-onboarding-guides-011CV2vtzLMxaKANHeEzn4kT

---

## TL;DR - What You Need to Know

**Current status**: Task Bundle 1 (Standalone Python Tools) in progress. Binary format documentation complete. HDF5 strategy guide complete. Converters have wavelength filtering.

**What's done**:
- ✅ 6 tools built/tested (gfall, molecular linelist, molecular partfuncs, line_query, schema guide, continua)
- ✅ Binary format docs (TiO, H2O, predicted lines) - comprehensive reverse-engineering
- ✅ HDF5 usage strategy guide - addresses data size concerns
- ✅ Wavelength filtering added to converters (v1.1)

**What's next**: User will decide - possibly more tools, possibly binary converters, possibly testing.

**User context**: Paula, experienced astronomer, high metallicity cool star photometry, needs predicted lines, concerned about ~650 MB HDF5 data size (addressed with filtering strategy).

---

## Quick Start

### 1. Read These First (in order):
1. `docs/archaeology/RE-ONBOARDING.md` - Project overview, current status
2. `docs/archaeology/MISSION.md` - Task Bundle 1 details, pivot from Phase 5
3. `docs/archaeology/journal/2025-11-12_binary_format_docs_and_hdf5_strategy.md` - What we just did
4. `tools/line_lists/README.md` - Tools completed, tools pending

### 2. Key Files to Know:
- **HDF5 strategy**: `docs/archaeology/HDF5_USAGE_STRATEGY.md` - Comprehensive guide user requested
- **Binary formats**: `docs/archaeology/{TIO,H2O,PREDICTED_LINES}_BINARY_FORMAT.md`
- **Converters**: `tools/line_lists/*.py` - All have --wl-min/--wl-max now

### 3. Git Status:
```bash
Branch: claude/review-onboarding-guides-011CV2vtzLMxaKANHeEzn4kT
Status: Clean (all committed and pushed)
Recent commits: See journal entry for details
```

---

## User Profile: Paula

**Background**:
- Experienced astronomer/computational scientist
- Working on high metallicity cool star models
- Uses photometry (SDSS ugriz filters, 3000-10000 Å)
- Needs predicted lines (can't skip - impacts high [M/H] stars)

**Communication style**:
- Appreciates thoroughness and documentation
- Practical/pragmatic - "I don't want to forget"
- Technical but asks clarifying questions (e.g., "what is a lookup table?")
- Gives good context when asking (e.g., mentioned Fiorella Castelli insight)

**Recent concerns addressed**:
- ✅ Data size (~650 MB worried her) → Strategy guide created
- ✅ Lookup table confusion → Explained (only needed during conversion)
- ✅ Whether to convert predicted lines → Depends on use case, strategy provided

**User quotes to remember**:
> "I use predicted lines when modelling photometry, it impacts high metallicity cool stars. Can't skip them entirely."

> "The massive size of the line lists when all is considered worries me to be honest."

> "That was incredibly useful, thank you. I don't want to forget but I will if it is not written."

---

## Current State Details

### Task Bundle 1: Line List Conversion Tools

**Context**: Phase 5 (Julia migration) blocked because Julia unavailable in sandbox. Pivoted to building standalone Python tools instead.

**Tools completed** (6 of 7+):
1. ✅ **gfall_to_hdf5.py** (574 lines) - Atomic lines, tested with gf_tiny.dat
2. ✅ **molecular_linelist_to_hdf5.py** (574 lines) - Molecular lines (CH, OH, etc.)
3. ✅ **molecular_partfuncs_to_hdf5.py** (395 lines) - Partition functions, tested with molecules.dat (87 molecules)
4. ✅ **line_query.py** (183 lines) - Query HDF5 by wavelength/element
5. ✅ **HDF5_SCHEMA_GUIDE.md** (486 lines) - Visual documentation
6. ✅ **continua_to_hdf5.py** (383 lines) - Continuum opacities

**Tools pending** (not started, may not be needed):
- fort12_inspector.py (optional, for debugging)
- abundances_extractor.py (suggested)
- constants_catalog.py (suggested)
- tio_to_hdf5.py (binary converter - user has files but they're large)
- h2o_to_hdf5.py (binary converter)
- predicted_to_hdf5.py (binary converter - needs NELIONOLD table)

**Recent additions**:
- Wavelength filtering (--wl-min, --wl-max) added to gfall and molecular converters
- Metadata tracking for filters
- Version bumped to v1.1

### Documentation Completed This Session

**1. TIO_BINARY_FORMAT.md** (418 lines)
- Schwenke (1998) TiO line list: 37.7M lines, 576 MB
- 16 bytes/line: 7 fields (IWL, IELION, IELO, IGFLOG, IGR, IGS, IGW)
- Requires companion eschwenk.bin (269K energy levels)
- 5 isotopes of TiO

**2. H2O_BINARY_FORMAT.md** (446 lines)
- Partridge & Schwenke (1997) H2O: 65.9M lines, 503 MB
- 8 bytes/line: 3 fields only (simpler than TiO!)
- Clever isotope encoding using sign bits
- Self-contained (no companion file)
- 4 isotopes of H2O

**3. PREDICTED_LINES_BINARY_FORMAT.md** (605 lines)
- Kurucz predicted/semi-empirical lines
- Same 16-byte format as TiO
- Multiple files: lowlines (831 MB), highlines (270 MB), nltelines (2.2 MB)
- **Key insight**: Negative IELION distinguishes predicted from observed
- NELIONOLD lookup table (1005 entries) - atoms, molecules, negative ions
- "fc" prefix = Fiorella Castelli (user's insight!)

**4. HDF5_USAGE_STRATEGY.md** (756 lines)
- **User specifically requested this** ("I don't want to forget")
- Addresses concern about ~650 MB total HDF5 size
- Four strategies: separate files, wavelength filtering, lazy loading, pre-filtered subsets
- Shows how to reduce to ~150 MB for typical photometry use case
- Includes Julia/Python examples, decision tree, migration path

---

## Technical Context You Should Know

### Binary Format Commonalities

All Kurucz binary formats share:

1. **Exponential wavelength spacing**: Constant Δλ/λ ≈ 5×10^-7
   ```
   λ = exp(IWL × log(1 + 1/2000000))
   ```

2. **Logarithmic value encoding**: Lookup table, offset 16384, resolution 0.001 dex
   ```
   value = 10^((index - 16384) × 0.001)
   ```

3. **Vacuum wavelengths**: All binary uses vacuum, convert to air if λ > 200 nm

### NELIONOLD Lookup Table (for predicted lines)

**What it is**: 1005-entry array mapping predicted line codes → element/ion codes

**Where it lives**: Hardcoded in rpredict.for lines 34-322

**When needed**: Only during conversion (one-time use)

**User was confused about this** - clarified that:
- It's just a static translation dictionary
- Copy it into converter code
- Convert to decoded values in HDF5
- Never needed again after conversion
- No validation needed (it's a hardcoded mapping)

### HDF5 Data Size Strategy

**Problem**: ~2.3 GB binary → ~650 MB HDF5 (gfall + molecular + TiO + H2O + predicted)

**Solution**: Wavelength filtering reduces typical use case to ~150 MB

**For user's use case** (high metallicity cool stars, SDSS photometry):
```bash
python gfall_to_hdf5.py gfall.dat gfall_optical.h5 --wl-min 3000 --wl-max 10000
python predicted_to_hdf5.py lowlines.bin predicted_optical.h5 --wl-min 3000 --wl-max 10000
# Result: 300 MB → 100 MB (77% reduction)
```

---

## Likely Next Steps

### Option 1: Test Wavelength Filtering
User may want to test the new --wl-min/--wl-max feature:
```bash
cd tools/line_lists
python gfall_to_hdf5.py ../../upstream/castelli/input_data/gf_tiny.dat \
    output/gf_tiny_optical.h5 --wl-min 3000 --wl-max 10000 --verbose
```

Verify:
- Filtering works correctly
- Metadata records filter settings
- File size reduction as expected

### Option 2: Build Binary Converters
If user wants to convert TiO/H2O/predicted lines:
- Start with H2O (simplest - 8 bytes, 3 fields, no companion file)
- Then TiO (needs companion file handling)
- Then predicted (needs NELIONOLD table implementation)

**Implementation notes**:
- Reuse structure from molecular_linelist_to_hdf5.py
- Add wavelength filtering from start (--wl-min/--wl-max)
- Chunked processing (100K lines at a time for memory efficiency)
- Test with small subset first before full conversion

### Option 3: Other Task Bundle 1 Tools
User may request:
- abundances_extractor.py - Extract abundance tables from Kurucz files
- constants_catalog.py - Catalog physical constants used in SYNTHE
- fort12_inspector.py - Debug tool for SYNTHE fort.12 binary format

### Option 4: Pre-filtered Subsets
Create working set for user's photometry:
```bash
# Merge gfall + molecular + TiO + H2O + predicted (optical only)
# into single photometry_ugriz.h5 (~150 MB)
```

Needs: create_subset.py script (not built yet)

---

## Important Context from Previous Sessions

### Session Continuity
- Previous session ran out of context (200K tokens)
- User provided excellent summary for continuity
- This session picked up H2O documentation seamlessly
- Extended to predicted lines (logical progression)
- Addressed emerging concern (data size) proactively

### Phase 5 Status
**Blocked**: Julia not available in Claude Code web sandbox
- Migration plan exists (PHASE5_MIGRATION_PLAN.md)
- Dependencies mapped (13 Fortran files, 4 phases)
- But can't execute until Julia support added

**Pivot**: Build standalone tools instead (Task Bundle 1)
- Tools are useful regardless of Phase 5 timeline
- Can be used independently
- Compatible with future Julia implementation

### House Cleaning Protocol
If you see TODOs or consistency issues:
- Read HOUSE_CLEANING.md protocol
- Systematically check cross-references
- Update version histories
- Fix technical inaccuracies

Done this in multiple sessions - user appreciates thoroughness.

---

## Git Workflow

### Branch Strategy
```
Main branch: (not specified, user didn't mention)
Working branch: claude/review-onboarding-guides-011CV2vtzLMxaKANHeEzn4kT
```

**Always use this branch for commits** - it matches the session ID pattern.

### Commit Style
User appreciates detailed commit messages:
- Summary line (50 chars)
- Blank line
- Detailed description with bullet points
- File changes, line counts
- Technical insights
- Cross-references

See journal entry for examples.

### Push Frequency
- Commit logical units of work
- Push at reasonable checkpoints
- User hasn't expressed preference for batching vs frequent pushes
- If network errors, retry with exponential backoff (2s, 4s, 8s, 16s)

---

## Communication Tips

### What User Appreciates
- **Documentation**: "I don't want to forget but I will if it is not written"
- **Thoroughness**: Comprehensive guides with examples
- **Clarity**: Explain technical concepts (lookup tables, encoding schemes)
- **Practical solutions**: Wavelength filtering addresses real concern

### What to Watch For
- **Size/complexity concerns**: User worried about 650 MB data
- **Practicality**: User needs tools for actual work (photometry)
- **Context**: User often provides helpful context (Fiorella Castelli, file sizes, use cases)

### Response Style
- Be concise but thorough
- Use examples and code snippets
- Provide comparisons/tables when explaining technical details
- Ask clarifying questions if ambiguous
- Acknowledge user insights ("Excellent insight about Fiorella Castelli!")

---

## Red Flags / Watch Out For

### Don't Build These Unless Asked
- Converters for binary formats (user has files but may not need conversions yet)
- Additional tools beyond Task Bundle 1 scope
- Phase 5 Julia code (blocked - Julia unavailable)

### Ask Before
- Creating new documentation files (unless clearly needed for deliverable)
- Modifying multiple files in ways that aren't directly requested
- Making architectural decisions about future work

### Always Check
- Is this file too large to share? (User can't share 576 MB TiO file)
- Does user actually need this? (Predicted lines - yes, but for specific use case)
- Have I explained technical concepts clearly? (Lookup tables required explanation)

---

## File Locations Quick Reference

```
Atlas.jl/
├── docs/archaeology/
│   ├── RE-ONBOARDING.md ⭐ Read first
│   ├── MISSION.md ⭐ Current mission
│   ├── HDF5_USAGE_STRATEGY.md ⭐ Just created, user loves it
│   ├── TIO_BINARY_FORMAT.md
│   ├── H2O_BINARY_FORMAT.md
│   ├── PREDICTED_LINES_BINARY_FORMAT.md
│   ├── HOUSE_CLEANING.md
│   ├── journal/
│   │   └── 2025-11-12_binary_format_docs_and_hdf5_strategy.md ⭐ Today's work
│   └── DEEP_DIVES/ (13 deep dives, 01-13)
│
├── tools/line_lists/ ⭐ Current work area
│   ├── README.md
│   ├── gfall_to_hdf5.py (v1.1 - has wavelength filtering)
│   ├── molecular_linelist_to_hdf5.py (v1.1 - has wavelength filtering)
│   ├── molecular_partfuncs_to_hdf5.py
│   ├── line_query.py
│   ├── continua_to_hdf5.py
│   └── HDF5_SCHEMA_GUIDE.md
│
└── upstream/ (Reference Fortran code - read-only)
    ├── castelli/ (Fiorella Castelli's SYNTHE distribution)
    │   └── source_codes/synthe/*.for
    └── kurucz/ (Robert Kurucz's files)
        └── input_data/ (test data files)
```

---

## Budget Status

- **Session today**: ~70K tokens / 200K (35%)
- **Project status**: Well within budget
- **No cost constraints mentioned**

---

## Success Criteria

### For Next Session
- User is satisfied with deliverables
- Any requested tools/docs are complete and tested
- Git commits are clean and pushed
- Documentation is thorough ("I don't want to forget")
- Practical concerns are addressed (size, performance, usability)

### For Task Bundle 1
- Core tools complete and tested
- Documentation comprehensive
- User can use tools for actual work (photometry pipeline)
- Optional tools built only if requested

### For Project Overall
- Archaeology complete (pretty much done)
- Standalone tools useful independently
- Ready for Phase 5 when Julia available
- Knowledge preserved for future team members

---

## Emergency Contacts / Resources

**None specified** - User is the primary contact.

**If stuck**:
1. Read RE-ONBOARDING.md for context
2. Check journal entries for recent decisions
3. Look at similar completed work (e.g., other converters)
4. Ask user for clarification - they provide good context

---

## Final Notes

**User sentiment**: Very positive, appreciative, satisfied with progress

**Last words**: "thx a lot i owe you one (more than one). good night and see you tomorrow"

**Your mission tomorrow**:
- Wait for user to specify next priority
- Could be testing, could be new tools, could be binary converters
- Be ready to build on what we've completed
- Maintain same quality/thoroughness user appreciates

**Key file to review before starting**:
`docs/archaeology/journal/2025-11-12_binary_format_docs_and_hdf5_strategy.md`

---

**Handoff complete. Good luck with tomorrow's session!**

---

## Appendix: Quick Commands

### Testing wavelength filtering
```bash
cd /home/user/Atlas.jl/tools/line_lists
python gfall_to_hdf5.py \
    ../../upstream/castelli/input_data/gf_tiny.dat \
    output/gf_tiny_optical.h5 \
    --wl-min 3000 --wl-max 10000 --compress --verbose --validate
```

### Git status check
```bash
git status
git log --oneline -5
git diff origin/claude/review-onboarding-guides-011CV2vtzLMxaKANHeEzn4kT
```

### Documentation locations
```bash
ls -lh docs/archaeology/*BINARY*.md
ls -lh docs/archaeology/HDF5_USAGE_STRATEGY.md
ls -lh tools/line_lists/*.py
```

### File sizes
```bash
du -h docs/archaeology/*BINARY*.md
du -h docs/archaeology/HDF5_USAGE_STRATEGY.md
wc -l tools/line_lists/*.py
```
