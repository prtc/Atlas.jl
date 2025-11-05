# ATLAS Suite Repository Census
*Phase 1 Final Report - Complete Code Archaeology*

**Report Date**: 2025-11-04
**Mission**: Legacy Code Documentation for Julia Migration
**Analyst**: Claude Code (Anthropic)
**Stakeholder**: Paula (Astrophysicist)

---

## Executive Summary

The ATLAS Suite Fortran codebase has been comprehensively cataloged and analyzed. This 1990s-era scientific computing code consists of **231 Fortran 77 files** totaling **487,000 lines of code** split between two repositories (Castelli and Kurucz). The code implements stellar atmosphere modeling and synthetic spectrum synthesis - scientifically important work from the late Robert Kurucz that requires preservation via migration to modern Julia.

### Key Findings

**Scale & Complexity**:
- 7 "mega-programs" (>20K lines each) contain 31% of the entire codebase
- Top 24 programs account for 65% of all code
- 80% of files are small utilities (<500 lines)

**Architecture**:
- Tool-oriented: 79% standalone executables (PROGRAM statements)
- Procedural: Pure Fortran 77 (no modules, extensive GOTO likely)
- Monolithic: Even 23K-line programs rarely use internal subroutines
- Data sharing: Heavy COMMON block usage (15-57 per program)

**Migration Targets** (Per Paula's Priorities):
- **ATLAS12**: 22-23K lines, 72-78 subroutine calls → Primary target
- **SYNTHE**: 3K lines, 7 subroutine calls → Secondary target
- **Supporting libraries**: ATLAS7V (17K lines), ~10 core shared subroutines

### Repository Structure

**Castelli** (Fiorella Castelli, gfortran ports):
- 68 files, 282K lines
- 12 component directories
- Focus: Core computation engines
- More self-contained, duplicate variants

**Kurucz** (Robert Kurucz, original):
- 163 files, 205K lines
- 6 functional categories
- Better organization, more utilities
- Atomic data tools, photometric systems, solar tools

**Overlap**: ~40-50% of files appear in both repositories with potential version differences.

---

## Repository Census Details

### File Count and Line Distribution

| Category | Files | Total Lines | Avg Lines/File | % of Codebase |
|----------|-------|-------------|----------------|---------------|
| **Castelli Total** | 68 | 282,000 | 4,147 | 58% |
| **Kurucz Total** | 163 | 204,690 | 1,256 | 42% |
| **Combined Total** | 231 | 486,690 | 2,107 | 100% |

### Size Distribution

| Size Category | Count | % of Files | Lines Range | Notable Examples |
|---------------|-------|------------|-------------|------------------|
| **Mega** (>20K) | 7 | 3% | 20K-23K | ATLAS9, ATLAS12, WIDTH9 |
| **Large** (5K-20K) | 17 | 7% | 5K-20K | KAPPA9, DFSYNTHE, plotpack |
| **Medium** (500-5K) | 23 | 10% | 500-5K | SYNTHE, utilities |
| **Small** (100-500) | 103 | 45% | 100-500 | Readers, converters |
| **Tiny** (<100) | 81 | 35% | <100 | Trivial utilities |

**Code Concentration**: 10% of files (24 large/mega programs) contain 65% of the code.

---

## Component Breakdown

### Castelli Repository Categories

| Rank | Component | Files | Lines | Description |
|------|-----------|-------|-------|-------------|
| 1 | atlas12 | 4 | 46,981 | ATLAS12 atmosphere code (2 versions) |
| 2 | width | 3 | 42,912 | Line width calculations |
| 3 | atlas9g | 2 | 40,396 | ATLAS9 gfortran variant |
| 4 | atlas9 | 2 | 39,515 | ATLAS9 standard |
| 5 | synthe | 20 | 34,053 | Spectrum synthesis + utilities |
| 6 | syntheg | 14 | 24,657 | SYNTHE gfortran variant |
| 7 | dfsynthe | 10 | 22,006 | Detailed opacity synthesis |
| 8 | kappa9 | 2 | 19,773 | Opacity calculator |
| 9 | Hbeta | 3 | 11,222 | Hydrogen beta line |
| 10-12 | utilities | 7 | 485 | Small converters |

### Kurucz Repository Categories

| Rank | Component | Files | Lines | Description |
|------|-----------|-------|-------|-------------|
| 1 | programs | 88 | 192,402 | Main computation engines (94% of Kurucz) |
| 2 | grids | 15 | 4,203 | Photometric system calculators |
| 3 | atoms | 28 | 3,428 | Element-specific atomic data processing |
| 4 | LINELISTS | 12 | 2,303 | Line list format converters |
| 5 | molecules | 14 | 1,785 | Molecular opacity (H2O, TiO, H3+) |
| 6 | sun | 6 | 569 | Solar spectrum-specific tools |

**Key Difference**: Castelli focuses on core engines; Kurucz includes extensive data processing utilities.

---

## Architecture Analysis

### File Type Distribution

| File Type | Count | % of Files | Description |
|-----------|-------|------------|-------------|
| **Main Programs** | 182 | 78.8% | Standalone executables |
| **Main + Embedded Subs** | 35 | 15.2% | Programs with helper subroutines |
| **Subroutine Libraries** | 13 | 5.6% | Reusable subroutine files |
| **Function Libraries** | 1 | 0.4% | Single function file |

**Architectural Pattern**: Tool-oriented design where each file is typically its own executable rather than a shared library. This contrasts with modern software architecture.

### Programming Style

**Fortran 77 Only** (Circa 1977-1990s):
- No Fortran 90+ features (modules, interfaces, derived types)
- PROGRAM / SUBROUTINE / FUNCTION / COMMON structure
- Likely heavy GOTO usage for flow control (not yet analyzed)
- Fixed-form source format (column-based)

**Implications for Julia**:
- No modern module system to preserve
- Can use Julia's module/struct system freely
- Will need to untangle GOTO-based control flow
- Can improve data structures significantly

---

## Dependency Analysis

### Major Program Complexity

| Program | Lines | Subroutine Calls | COMMON Blocks | Complexity |
|---------|-------|------------------|---------------|------------|
| **ATLAS12** | 22-23K | 72-78 | 56-57 | Very High |
| **ATLAS9** | 18-20K | 61-66 | 46-49 | High |
| **KAPPA9** | 19K | 52 | 49 | High |
| **WIDTH9** | 21K | ? | ? | High (not analyzed) |
| **DFSYNTHE** | 3.7K | 9 | 18 | Low-Medium |
| **SYNTHE** | 3K | 7 | 15 | Low |

### Shared Computational Kernel

~10 subroutines appear across multiple programs (ATLAS9, ATLAS12, KAPPA9):

**Core Functions**:
- `READIN` - Input parsing
- `POPS` / `PFSAHA` - Population calculations
- `KAPP` / `ROSS` - Opacity calculations
- `DERIV` / `INTEG` / `SOLVIT` - Numerical methods
- `W` / `EXIT` - I/O and control

**Migration Strategy**: Translate these core functions once, reuse everywhere.

### COMMON Block Data Sharing

Programs share data via global COMMON blocks rather than argument passing:

**Most Frequent Blocks** (appear in 3+ programs):
- `/ABROSS/`, `/ABTOT/` - Abundances
- `/ELEM/`, `/EDENS/` - Composition, electron density
- `/DEPART/` - NLTE departure coefficients
- `/FLUX/` - Radiation flux
- `/EXTAB/`, `/H1TAB/` - Opacity tables

**Julia Translation**: COMMON blocks → structs or module-level constants.

### Critical Dependency: ATLAS7V

ATLAS7V is a **~17K line subroutine library** for atmosphere model interpolation:
- Appears in 4 locations (Castelli: synthe/, syntheg/; Kurucz: SYNTHE/, atlas12/)
- Used by SYNTHE to read pre-computed ATLAS atmosphere models
- Represents separation between atmosphere computation (ATLAS9/12) and synthesis (SYNTHE)

**Architecture**:
```
ATLAS9/12 → .mod files (atmosphere models) → SYNTHE + ATLAS7V → synthetic spectra
```

---

## Version Comparison: Castelli vs. Kurucz

### ATLAS12 Differences

| Metric | Castelli | Kurucz | Difference |
|--------|----------|--------|------------|
| Lines | 23,247 | 22,152 | -1,095 (-4.7%) |
| Subroutine calls | 72 | 78 | +6 |
| COMMON blocks | 57 | 56 | -1 |

**Additional subroutines in Kurucz**: BEGTIME, ENDTIME, PRELINOP, etc.

### SYNTHE Differences

| Metric | Castelli | Kurucz | Difference |
|--------|----------|--------|------------|
| Lines | 2,993 | 2,985 | -8 (nearly identical) |
| Subroutine calls | 7 | 7 | Identical |
| COMMON blocks | 15 | 15 | Identical |

**Conclusion**: SYNTHE versions are functionally identical.

### "g" Suffix Variants

Multiple programs have "g" suffixed variants (atlas9g, width9g, syntheg):

**Working Hypothesis** (per Paula): "g" = **gfortran compatibility**
- Castelli ported Kurucz's codes to compile with modern gfortran
- May include bug fixes and compiler compatibility changes
- Version comparison needed in Phase 2

---

## Migration Complexity Assessment

### By Program Category

**Priority 1: ATLAS12** (Primary migration target)
- **Effort**: Very High
- **Lines**: 22-23K
- **Complexity**: 72-78 subroutine calls, 56-57 COMMON blocks
- **Challenges**: Largest program, NLTE calculations, molecular opacity
- **Timeline Estimate**: 60-80% of total migration effort

**Priority 2: SYNTHE** (Secondary target)
- **Effort**: Medium
- **Lines**: 3K main program + 17K ATLAS7V library
- **Complexity**: Only 7 subroutine calls
- **Challenges**: Depends on ATLAS7V, needs atmosphere model I/O
- **Timeline Estimate**: 15-20% of migration effort

**Supporting Infrastructure**:
- **Core Utilities** (~10 shared subroutines): 10% of effort
- **ATLAS7V Library** (atmosphere interpolation): 10% of effort

### By File Size

| Size | Files | Est. Effort | Priority |
|------|-------|-------------|----------|
| Mega (>20K) | 7 | Very High | Critical path |
| Large (5K-20K) | 17 | High | Major components |
| Medium (500-5K) | 23 | Medium | Standard translation |
| Small (100-500) | 103 | Low | Batch translation |
| Tiny (<100) | 81 | Very Low | Automated/templated |

**Pareto Principle**: The top 7 mega-programs (3% of files) will likely require 80% of the migration effort.

---

## Code Provenance & Version Control

### Kurucz (Original)

**Source**: Robert Kurucz (1938-2025)
**Era**: 1970s-2000s
**Compiler**: Older Fortran compilers (possibly VAX, CDC, early Unix)
**Status**: Authoritative scientific implementation
**Maintenance**: Frozen (author deceased March 2025)

### Castelli (Maintained Port)

**Source**: Fiorella Castelli (astrophysicist, maintains codes)
**Era**: 2000s-2020s
**Compiler**: gfortran (GNU Fortran)
**Status**: Actively maintained, bug fixes applied
**Maintenance**: Available for consultation

### Migration Decision Point

**Question for Phase 2**: Which version forms the migration base?

**Options**:
1. **Kurucz** (authoritative, possibly older bugs)
2. **Castelli** (maintained, gfortran fixes, possibly newer bugs)
3. **Hybrid** (merge fixes from both)

**Action Required**: Detailed diff analysis in Phase 2 to identify all differences.

---

## Unique Capabilities

### Kurucz-Only Components

**Atomic Data Processing** (28 files, 3.4K lines):
- Element-specific calculations (Fe II, Fe III, Fe IV, Fe V, Co II, Ni I, Ni II)
- Energy level expansion
- Forbidden transition handling
- gf-value processing

**Photometric Systems** (15 files, 4.2K lines):
- UBV, Strömgren uvby, Geneva, Cousins, DDO, Vilnius, RIJKL, JHK, etc.
- 15 different photometric system calculators
- Converts synthetic spectra to observed colors/magnitudes

**Solar Tools** (6 files, 570 lines):
- Kitt Peak solar atlas processing
- Solar flux synthesis

**Impact on Migration**: These are lower priority but demonstrate the suite's comprehensiveness.

---

## Data Files & External Dependencies

### Input File Requirements

Programs require extensive external data files (not in scope for Phase 1):

**Atomic Data**:
- Line lists (millions of spectral lines)
- Energy levels
- Partition functions
- Ionization potentials

**Molecular Data**:
- H2O, TiO, H3+ line lists
- Molecular partition functions

**Model Atmospheres**:
- Pre-computed grids for interpolation
- .mod file format (binary or ASCII)

**Opacity Tables**:
- Opacity Distribution Functions (ODFs)
- Rosseland mean opacities

**Action for Phase 2**: Document file formats, locate data files, assess data migration needs.

---

## Questions for Phase 2 Investigation

### Critical Questions (From MISSION.md):

**Q1: Atomic Number Codes**
- Directories like `2603`, `2604` likely mean Fe III, Fe IV
- Need definitive element/ionization mapping table

**Q2: "g" Suffix Verification**
- Hypothesis: gfortran compatibility
- Need source file header comparison

**Q3: ATLAS12 Version Differences**
- 1,095 line difference between Castelli and Kurucz
- Detailed diff analysis required

### Architectural Questions:

**Q4: Subroutine Definitions**
- Where are the 60-80 called subroutines defined?
- Likely embedded after main PROGRAM END statement
- Need full-file analysis

**Q5: COMMON Block Layouts**
- What variables are in each block?
- What are their types and dimensions?
- Critical for Julia struct design

**Q6: Compilation & Linking**
- How were programs originally built?
- Need Makefiles or build documentation
- Which files link together?

**Q7: Control Flow Patterns**
- How extensive is GOTO usage?
- Are there computed GOTOs, assigned GOTOs?
- Control flow graph analysis needed

---

## Recommended Migration Roadmap

### Phase I: Foundation (20% of effort)

1. **Core Utilities** (~10 shared subroutines)
   - READIN, POPS, PFSAHA, KAPP, ROSS
   - DERIV, INTEG, SOLVIT, PARCOE
   - Establish Julia module structure

2. **COMMON Block Infrastructure**
   - Define Julia structs for major blocks
   - Abundance, opacity, state structures

3. **File I/O Layer**
   - Atmosphere model readers (.mod files)
   - Line list readers
   - Output formatters

### Phase II: SYNTHE (20% of effort)

1. **ATLAS7V Library** (17K lines)
   - Atmosphere interpolation
   - Independent of ATLAS12

2. **SYNTHE Main Program** (3K lines)
   - Only 7 subroutine calls
   - Good first complete program

3. **Validation**
   - Test against Kurucz synthetic spectra
   - Ensure numerical agreement

### Phase III: ATLAS12 (60% of effort)

1. **Opacity Modules**
   - KAPCONT, LINOP, XLINOP
   - TABVOIGT, SELECTLINES

2. **Population Solver**
   - POPS, POPSALL
   - NLTE calculations

3. **Radiative Transfer**
   - RADIAP, ROSS, TCORR
   - STATEQ

4. **Integration & Testing**
   - Full ATLAS12 program
   - Validate against test models

### Phase IV: Polish & Extension (Variable)

1. **Remaining Programs** (as needed)
   - ATLAS9, KAPPA9, WIDTH9
   - DFSYNTHE, utilities

2. **Modern Features**
   - Parallel computation
   - Modern I/O formats
   - Documentation & tests

---

## Resource Estimates

### API Call Projections (For Research Credit Application)

**Assumptions**:
- Average 100 API calls per subroutine translation (code generation + debugging)
- Average 50 API calls per small utility
- 2× multiplier for mega-programs (complexity)

**Estimates**:

| Component | Lines | Multiplier | Est. API Calls |
|-----------|-------|------------|----------------|
| Core utilities | 2-3K | 1× | 2,000-3,000 |
| ATLAS7V | 17K | 1× | 15,000-20,000 |
| SYNTHE | 3K | 1× | 3,000 |
| ATLAS12 | 23K | 2× | 40,000-50,000 |
| Testing/Debug | - | - | 10,000-15,000 |
| **Total** | **~45K** | - | **70,000-90,000** |

**Confidence**: ±30% (high uncertainty until pilot translation attempted)

**Critical Variables**:
- GOTO untangling complexity
- COMMON block refactoring difficulty
- Numerical validation iteration count

---

## Phase 1 Deliverables Summary

All deliverables completed and committed to repository:

1. **CASTELLI_CATALOG.md** - 68 files, comprehensive breakdown
2. **KURUCZ_CATALOG.md** - 163 files, hierarchical analysis
3. **CONSOLIDATED_LINE_COUNTS.md** - Combined statistics, size distribution
4. **CONSOLIDATED_LINE_COUNTS.csv** - Machine-readable data (231 entries)
5. **FILE_TYPES.md** - Program vs. library classification
6. **DEPENDENCY_MAP.md** - Call graphs, COMMON blocks (8 programs analyzed)
7. **CENSUS_REPORT.md** (this document) - Comprehensive synthesis

**Total Documentation**: ~2,500 lines of analysis across 7 reports.

---

## Recommendations for Phase 2

### Immediate Actions:

1. **Version Comparison** (Priority: HIGH)
   - Diff Castelli vs. Kurucz ATLAS12
   - Identify all code differences
   - Decide on migration base version

2. **Subroutine Mapping** (Priority: HIGH)
   - Parse full files to find embedded subroutines
   - Document which subroutines are in which files
   - Create complete call graph

3. **COMMON Block Documentation** (Priority: HIGH)
   - Extract all COMMON block declarations
   - Document variable lists, types, dimensions
   - Design Julia struct equivalents

4. **Control Flow Analysis** (Priority: MEDIUM)
   - Sample programs for GOTO usage
   - Identify patterns (error handling, loops, etc.)
   - Plan refactoring strategy

5. **File Format Documentation** (Priority: MEDIUM)
   - Document .mod file format
   - Document line list formats
   - Locate example data files

### Long-term Planning:

1. **Pilot Translation**: Select one small utility (~100-500 lines) for trial Julia translation to calibrate effort estimates

2. **Validation Strategy**: Establish numerical comparison framework using existing Fortran output as ground truth

3. **Stakeholder Communication**: Regular check-ins with Paula to validate architectural decisions and priorities

---

## Conclusion

The ATLAS Suite represents **~487,000 lines of 1970s-1990s scientific Fortran** implementing state-of-the-art stellar atmosphere modeling. The code is **scientifically valuable but architecturally dated**, making migration to modern Julia both necessary and challenging.

**Key Takeaways**:

1. **Scope**: Larger than initially apparent - 231 files, extensive dependencies
2. **Concentration**: 7 mega-programs dominate the workload (65% of code)
3. **Architecture**: Procedural F77 style with heavy COMMON block usage
4. **Priorities**: ATLAS12 and SYNTHE are primary targets
5. **Challenges**: GOTO untangling, COMMON block refactoring, version reconciliation
6. **Opportunities**: Modern Julia can significantly improve code structure

This census provides the foundational knowledge needed to proceed with Phase 2 (Architecture Mapping) and ultimately the Julia migration itself.

---

**Report Status**: ✅ COMPLETE
**Phase 1 Status**: ✅ COMPLETE (Tasks 1.1-1.6)
**Next Phase**: Architecture Mapping (Days 3-5)

---

*End of Report*
