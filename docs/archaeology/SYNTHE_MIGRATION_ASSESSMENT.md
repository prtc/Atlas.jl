# SYNTHE Suite Migration Assessment
**Phase 4 - SYNTHE Edition | Deliverable 2**

**Created**: 2025-11-10
**Purpose**: Complete migration planning for SYNTHE spectrum synthesis pipeline
**Related**: See MIGRATION_ASSESSMENT.md for ATLAS12 analysis

---

## Executive Summary

SYNTHE migration is **significantly more tractable** than ATLAS12 due to its modular pipeline architecture:

**ATLAS12**: Monolithic (23K lines, 80 subroutines, 57 COMMON blocks, all tightly coupled)

**SYNTHE**: Modular pipeline (11 programs, ~20K lines total, 50 COMMON blocks, loosely coupled)

### Key Findings

**Module Classification**:
- **Easy (8 programs)**: 73% of programs, ~1,800 lines total, 0-4 COMMON blocks each
- **Hard (3 programs + library)**: 27% of programs, ~18K lines total, 30-72 COMMON blocks each

**Critical Insight**: SYNTHE's major challenge is **fort.X file elimination** (inter-process communication), NOT COMMON block refactoring. The 8 simple programs are natural quick wins.

**Migration Timeline**: 14-21 weeks (3.5-5 months) for complete SYNTHE migration
- **Comparison**: ATLAS12 requires 36-58 weeks (9-14 months)
- **Reason**: SYNTHE's clean modular design vs ATLAS12's monolithic architecture

**Recommended Strategy**: Pipeline-First approach (leverage SYNTHE's natural modularity)

---

## Section 1: Module Difficulty Classification

### 1.1 Classification Criteria

**Easy** (0-4 COMMON blocks, <500 lines, standalone):
- No complex physics algorithms
- Minimal state dependencies
- Well-defined input/output
- Standard numerical methods
- Estimated effort: 0.5-1 week per program

**Medium** (Not applicable to SYNTHE):
- SYNTHE has bimodal distribution (8 easy + 3+library hard)
- No programs fall in "medium" complexity range

**Hard** (30-72 COMMON blocks, >300 lines, complex physics/dependencies):
- Complex physics algorithms (RT, populations, opacity)
- Heavy COMMON block usage (atlas7v library interface)
- Precision-sensitive calculations
- Performance-critical code
- Estimated effort: 3-6 weeks per program, 4-6 weeks for library

---

### 1.2 Easy Programs (8 total, 73% of programs)

#### 1.2.1 Trivial Utilities (0 COMMON blocks)

**Program 1: synbeg.for**
- **Lines**: ~100
- **COMMON blocks**: 0
- **Purpose**: Initialize synthesis calculation (wavelength range, resolution setup)
- **Dependencies**: None (pure I/O utility)
- **Complexity**: TRIVIAL - Reads control parameters, writes fort.12 header + fort.14 control file
- **Migration effort**: 0.5 days
- **Rationale**: No state, no physics, pure data formatting. First migration target.

**Program 2: broaden.for**
- **Lines**: ~200
- **COMMON blocks**: 0
- **Purpose**: Apply instrumental broadening to spectrum
- **Dependencies**: None (reads fort.7, writes broadened fort.7)
- **Complexity**: TRIVIAL - Convolution with Gaussian/Lorentzian kernel
- **Migration effort**: 1 day
- **Rationale**: Standard numerical convolution. No state management.

**Estimated effort (2 programs)**: 1.5 days total

---

#### 1.2.2 Line Reader Utilities (1-4 COMMON blocks)

**Program 3: rgfalllinesnew.for**
- **Lines**: ~300
- **COMMON blocks**: 4 (LINDAT, POTION, and 2 small utility blocks)
- **Purpose**: Read atomic line lists (Kurucz gf*.100 format)
- **Dependencies**: LINDAT (shared line data format), POTION (partition functions)
- **Complexity**: EASY - ASCII parsing, wavelength filtering, append to fort.12
- **Migration effort**: 2-3 days
- **Rationale**: Straightforward I/O. LINDAT becomes SpectralLine struct. POTION is lookup table (small).

**Program 4: rpredict.for**
- **Lines**: ~200
- **COMMON blocks**: 2 (LINDAT, IIIIIII field indices)
- **Purpose**: Read predicted atomic lines
- **Dependencies**: LINDAT
- **Complexity**: EASY - Similar to rgfalllinesnew but different file format
- **Migration effort**: 1-2 days
- **Rationale**: Nearly identical to rgfalllinesnew, just different parser.

**Program 5: rmolecasc.for**
- **Lines**: ~250
- **COMMON blocks**: 1 (LINDAT)
- **Purpose**: Read molecular line lists (CH, MgH, CN, CO, etc.)
- **Dependencies**: LINDAT
- **Complexity**: EASY - ASCII molecular line format, append to fort.12
- **Migration effort**: 2 days
- **Rationale**: Simpler than atomic readers (fewer fields per line).

**Program 6: rschwenk.for**
- **Lines**: ~300
- **COMMON blocks**: 2 (LINDAT, IIIIIII)
- **Purpose**: Read TiO lines (Schwenke binary format)
- **Dependencies**: LINDAT, binary fort.11 + fort.48
- **Complexity**: EASY - Binary I/O, but well-structured format
- **Migration effort**: 2-3 days
- **Rationale**: Use FortranFiles.jl for binary reading. TiO format is documented.

**Program 7: rh2ofast.for**
- **Lines**: ~250
- **COMMON blocks**: 1 (LINDAT)
- **Purpose**: Read H2O lines (Partridge & Schwenke binary format)
- **Dependencies**: LINDAT, binary fort.11
- **Complexity**: EASY - Binary I/O, massive line count (~millions) but simple format
- **Migration effort**: 2-3 days
- **Rationale**: Similar to rschwenk but H2O-specific format. Use FortranFiles.jl.

**Program 8: rotate.for**
- **Lines**: ~300
- **COMMON blocks**: 3 (LINDAT, HROT kernel, WT weights)
- **Purpose**: Apply rotational broadening (v sin i)
- **Dependencies**: LINDAT, limb darkening convolution kernel
- **Complexity**: EASY - Convolution with rotation kernel
- **Migration effort**: 2-3 days
- **Rationale**: Standard numerical convolution. HROT/WT are temporary buffers (can be local variables).

**Estimated effort (6 line readers + rotate)**: 13-19 days total

---

**Total Easy Programs Effort**: 14.5-20.5 days (2-3 weeks)

**Quick win strategy**: Migrate all 8 easy programs first. This gives:
- Complete line list infrastructure (SpectralLine struct)
- Wavelength grid setup (synbeg)
- Post-processing utilities (rotate, broaden)
- Early validation capability
- Momentum and confidence before tackling hard programs

---

### 1.3 Hard Programs + Library (3 programs + atlas7v, 27% of programs)

#### 1.3.1 Atlas7v Library (17,336 lines, 32 subroutines)

**File**: atlas7v.for
- **Lines**: 17,336
- **COMMON blocks**: 38 total (32 core + 6 optional)
- **Subroutines**: 32 (atmosphere calculation library)
- **Purpose**: Atmosphere interpolation, ionization/population calculations, continuum opacity
- **Used by**: xnfpelsyn.for, spectrv.for (library linkage)
- **Complexity**: HARD - Core atmosphere state management
  - 5 thermodynamic state blocks (RHOX, TEMP, STATE, TEFF, HEIGHT)
  - 13 element ionization blocks (BHYD, BHE, BC, BO, etc.)
  - 7 opacity & RT blocks (ABTOT, OPTOT, TAUSHJ, FREQ, MUS, etc.)
  - 7 control/utility blocks (ITER, IF, FLUX, JUNK, etc.)
- **Physics**: Saha equation, molecular equilibrium, continuum opacity (25+ sources)
- **Migration effort**: 4-6 weeks
- **Rationale**:
  - Must refactor 38 COMMON blocks as AtmosphereState module
  - Element-specific blocks (BHYD, BHE, etc.) become ElementPopulations structs
  - Already analyzed in Atlas7v Phase 1-4 documents
  - Critical path: Blocks ALL other SYNTHE programs (xnfpelsyn, spectrv depend on this)

**Deep Dive coverage**: Not yet (only dependency analysis in Atlas7v Phase 1-4)

**Critical subroutines** (from Atlas7v Phase 4):
1. **POPS** - Saha-Boltzmann populations (Float64 required, see ATLAS12 DD02)
2. **KAPP** - Continuum opacity dispatcher (20 IFOP flags, 20 subroutines)
3. **XNFPEL** - Partition function calculations
4. **SAHA** - Ionization equilibrium
5. **GAUSS** - Gaussian quadrature (MUS angles)
6. **JOSH** - Radiative transfer (if used in SYNTHE context)

**Known issues**:
- Mixed precision (Float32 pretabulated tables, Float64 calculations)
- Platform-dependent binary I/O (fort.X files)
- Undocumented magic constants (similar to ATLAS12)

**Validation**: Must match ATLAS12 atmosphere outputs (T, P, ρ, XNE at each depth)

---

#### 1.3.2 xnfpelsyn.for (317 lines)

**Program**: xnfpelsyn.for
- **Lines**: 317
- **COMMON blocks**: 39 (all from atlas7v library, 0 unique)
- **Purpose**: Atmosphere preparation - compute populations, continuum opacities
- **Dependencies**:
  - Links atlas7v.for (library)
  - Reads: stdin (atmosphere model), fort.2 (molecules.dat), fort.17 (continua.dat)
  - Writes: fort.10 (binary atmosphere data)
- **Complexity**: HARD - But primarily due to atlas7v dependency
  - Main program is thin wrapper (~300 lines)
  - All complexity is in atlas7v library calls
- **Migration effort**: 1-2 weeks (after atlas7v complete)
- **Rationale**:
  - Wait for atlas7v migration
  - Then xnfpelsyn is straightforward (calls library functions)
  - Main task: Parse atmosphere model input format, call AtmosphereState functions, write output

**Fort.10 output format** (binary):
- Temperature T(kw)
- Pressure P(kw)
- Electron density XNE(kw)
- Atomic populations XNFPEL(kw, element)
- Molecular populations XNFMOL(kw, molecule)
- Continuum opacity sources

**Migration**: Replace fort.10 with AtmosphereData struct (HDF5 or in-memory)

---

#### 1.3.3 synthe.for (2,993 lines)

**Program**: synthe.for
- **Lines**: 2,993
- **COMMON blocks**: 72 total (7 unique + subset of atlas7v)
- **Purpose**: Line opacity calculation at each depth and wavelength
- **Dependencies**:
  - Reads: fort.10 (atmosphere from xnfpelsyn), fort.12 (line list), fort.93 (control), fort.18 (He I Stark tables), fort.19 (NLTE lines)
  - Writes: fort.9 (opacity vectors), fort.13 (line IDs), fort.15 (line center opacities)
- **Complexity**: HARD - Computationally intensive, millions of line profile calculations
  - Unique blocks: BUFFER (spectrum buffer, 2M elements), CONTIN (continuum), NLINES (wavelength grid), LINDAT, XNFDOP (partition functions), TXNXN (emergent intensity), EXTAB/H1TAB (lookup tables)
  - Atlas7v subset: BHYD, BHE (hydrogen/helium for Stark broadening) - **NOTE**: No atlas7v linkage (standalone program)
- **Physics**: Voigt profile calculation, line opacity accumulation, H/He Stark broadening
- **Performance**: This is the bottleneck (millions of lines × thousands of wavelengths × 99 depths = billions of operations)
- **Migration effort**: 4-5 weeks (revised from 3-4 weeks after DD13 analysis)
- **Rationale**:
  - Core LTE synthesis algorithm well-defined (DD13)
  - XLINOP NLTE synthesis adds complexity (H/He Stark profiles)
  - Voigt profile calculation already analyzed (DD01, reuse ATLAS12 analysis)
  - Memory transposition pattern (direct I/O) can be simplified in Julia
  - Early exit optimization critical for performance (~90% line rejection)

**Deep Dive coverage**:
- **DD13: SYNTHE Core** (NEW) - Complete focused analysis
  - XLINOP NLTE line opacity (~490 lines)
  - HPROF4 hydrogen profiles with fine structure (~425 lines)
  - He I Stark profiles (5 specialized functions, ~700 lines)
  - LTE line loop with early exit optimization
  - Memory management (2M-element BUFFER, direct I/O transposition)
- DD01: Voigt profile (reusable from ATLAS12)
- DD09: Fort.12 line list format
- DD12: Line readers (5 formats)

**Critical sections** (from DD13):
1. **LTE line loop** (lines 235-308) - Core synthesis, 90% of lines rejected by early exit
2. **XLINOP** (lines 469-958) - NLTE line opacity with H/He Stark broadening
3. **HPROF4** (lines 959-1382) - Hydrogen line profiles with fine structure components
4. **He I profiles** (lines 1762-2746) - 5 specialized functions for He I Stark broadening
5. **Memory transposition** (lines 314-347) - Direct I/O optimization (can simplify in Julia)

**Validation**: Compare opacity vectors (fort.9) and line center opacities (fort.15) against Fortran output

---

#### 1.3.4 spectrv.for (438 lines)

**Program**: spectrv.for
- **Lines**: 438
- **COMMON blocks**: 40 total (4 unique + atlas7v core)
- **Purpose**: Radiative transfer - compute emergent intensity/flux
- **Dependencies**:
  - Links atlas7v.for (library)
  - Reads: stdin (atmosphere model), fort.2 (molecules.dat), fort.16 (line opacities from synthe), fort.25 (PRD parameters)
  - Writes: fort.7 (emergent spectrum)
- **Complexity**: HARD - Radiative transfer + atlas7v library
  - Unique blocks: TRASH (temp variables), CORONO (extended atmosphere), BONE (opacity scaling), PRD (partial redistribution)
  - Atlas7v blocks: All 32 core blocks (atmosphere state, opacity, RT)
- **Physics**: Radiative transfer equation, angle integration (17 μ points)
- **Migration effort**: 2-3 weeks (after atlas7v complete)
- **Rationale**:
  - Depends on atlas7v library (must migrate atlas7v first)
  - RT algorithm is standard (Deep Dive 08: SPECTRV)
  - TRASH/BONE/PRD are optional features (low priority)
  - CORONO (extended atmosphere) rarely used (can defer)

**Deep Dive coverage**:
- DD08: SPECTRV synthesis kernel
- DD05: JOSH radiative transfer (ATLAS12, similar algorithm)

**Fort.7 output format**:
- Wavelength grid
- Intensity I(λ, μ) at 17 angles, OR
- Flux F(λ) = ∫ I(λ, μ) dμ

**Migration**: Replace fort.7 with Spectrum struct (wavelength, intensity/flux)

---

**Total Hard Programs + Library Effort**: 11-17 weeks (revised from 10-15 weeks after DD13)
- atlas7v library: 4-6 weeks
- xnfpelsyn: 1-2 weeks (after atlas7v)
- synthe: 4-5 weeks (revised from 3-4 weeks, standalone)
- spectrv: 2-3 weeks (after atlas7v)

**Critical path**: atlas7v library (4-6 weeks) must be completed before xnfpelsyn and spectrv can be migrated. **Note**: synthe.for is STANDALONE (no atlas7v linkage), can be migrated in parallel.

---

### 1.4 Summary Statistics

| Difficulty | Count | Programs | Lines | COMMON Blocks | Estimated Effort |
|------------|-------|----------|-------|---------------|------------------|
| **Easy** | 8 | synbeg, broaden, 6 line readers, rotate | ~1,800 | 0-4 each | 2-3 weeks |
| **Medium** | 0 | (none) | 0 | N/A | 0 weeks |
| **Hard** | 4 | atlas7v, synthe, spectrv, xnfpelsyn | ~21,000 | 30-72 each | 11-17 weeks |
| **TOTAL** | 12 | 11 programs + library | ~23,000 | ~50 unique | **15-22 weeks** |

**Revised after DD13**: synthe.for effort increased from 3-4 weeks to 4-5 weeks (H/He Stark profiles more complex than initially estimated)

**Distribution**:
- Easy: 67% of programs, 8% of lines, 15% of effort
- Hard: 33% of programs, 92% of lines, 85% of effort

**Comparison to ATLAS12**:
- ATLAS12: 26 easy (33%), 5 medium (6%), 49 hard (61%) → 36-58 weeks
- SYNTHE: 8 easy (67%), 0 medium (0%), 4 hard (33%) → 15-22 weeks (revised from 14-21)
- **SYNTHE is ~2-2.5× faster** due to cleaner architecture

---

## Section 2: Quick Wins (All 8 Easy Programs)

### 2.1 Week 1: Trivial Utilities + Simple Readers (4 programs)

**Day 1-2: synbeg + broaden** (0 COMMON blocks each)
- synbeg.for: Wavelength setup (0.5 days)
- broaden.for: Instrumental broadening (1 day)
- **Deliverable**: WavelengthGrid struct, instrumental broadening function
- **Validation**: Compare fort.12 header, fort.14 control file against Fortran

**Day 3-5: rmolecasc + rpredict** (1-2 COMMON blocks each)
- rmolecasc.for: Molecular line reader (2 days)
- rpredict.for: Predicted line reader (1-2 days)
- **Deliverable**: SpectralLine struct (from LINDAT), molecular line parser
- **Validation**: Read CH, CO line lists, compare parsed data against Fortran

**Total Week 1**: 4 programs, ~850 lines, SpectralLine struct established

---

### 2.2 Week 2: Binary Readers + Rotation (4 programs)

**Day 6-8: rgfalllinesnew** (4 COMMON blocks)
- Atomic line reader (2-3 days)
- POTION partition function table (small lookup)
- **Deliverable**: Atomic line parser, partition function module
- **Validation**: Read gf0800.100, gf1200.100, compare against Fortran fort.12

**Day 9-11: rschwenk + rh2ofast** (1-2 COMMON blocks each)
- rschwenk.for: TiO binary reader (2-3 days)
- rh2ofast.for: H2O binary reader (2 days)
- **Deliverable**: Binary line readers using FortranFiles.jl
- **Validation**: Read tioschwenke.bin, h2ofastfix.bin, verify parsed data

**Day 12-14: rotate** (3 COMMON blocks)
- Rotational broadening (2-3 days)
- HROT convolution kernel
- **Deliverable**: Rotational broadening function with limb darkening
- **Validation**: Apply v sin i = 10 km/s, compare broadened spectrum

**Total Week 2**: 4 programs, ~1,100 lines, complete line list infrastructure

---

### 2.3 Quick Wins Summary

**Total effort**: 2-3 weeks (10-15 days)

**Programs migrated**: 8 of 12 (67%)

**Lines migrated**: ~1,900 of ~23,000 (8%)

**Infrastructure gained**:
- ✅ SpectralLine struct (LINDAT replacement)
- ✅ WavelengthGrid struct (NLINES replacement)
- ✅ Line readers for 6 formats (atomic, molecular, TiO, H2O, predicted)
- ✅ Rotational and instrumental broadening
- ✅ Early validation capability (read line lists, compare against Fortran)

**Why this works**:
- All 8 programs are independent (no cross-dependencies)
- Can be migrated in parallel by 2-3 developers
- Provides immediate value (line list infrastructure for SYNTHE core)
- Builds confidence before tackling atlas7v library

---

## Section 3: High-Risk Areas (4 components)

### 3.1 Rank #1: Atlas7v Library State Management (17,336 lines)

**Risk level**: CRITICAL

**Component**: atlas7v.for (32 subroutines, 38 COMMON blocks)

**Why high-risk**:
1. **Massive scope**: 17K lines, 38 COMMON blocks, 32 subroutines
2. **Shared library**: Used by both xnfpelsyn and spectrv (breaks both if wrong)
3. **Complex physics**: Saha equation, molecular equilibrium, 25+ opacity sources
4. **Precision-sensitive**: Population calculations (Float64 required, see DD02)
5. **Undocumented algorithms**: Similar to ATLAS12 (magic constants, heuristics)
6. **Critical path**: Blocks xnfpelsyn and spectrv migration

**Specific risks**:
- **BHYD block** (hydrogen populations): Float64 required for ionization (exp(-31.6) underflows in Float32)
- **KAPP dispatcher** (20 IFOP flags): Complex branching, 20 opacity subroutines
- **Element blocks** (13 elements): Pattern duplication (BHYD, BHE, BC, etc.) - must refactor consistently
- **Binary I/O**: Fort.X files used by xnfpelsyn/spectrv

**Mitigation actions**:
1. **Defer until Week 4** (after quick wins complete)
2. **Allocate 4-6 weeks** (longest single component)
3. **Reuse ATLAS12 analysis**: POPS (DD02), KAPP (Atlas7v Phase 4)
4. **Create comprehensive test suite**:
   - Unit tests: Per-block initialization, per-subroutine validation
   - Integration tests: Full atmosphere calculation (compare against ATLAS12 output)
5. **Phased approach**:
   - Week 4-5: Thermodynamic state (5 blocks) + element populations (13 blocks)
   - Week 6-7: Opacity & RT (7 blocks)
   - Week 8-9: Control & utilities (7 blocks), validation

**Owner**: Senior developer with astrophysics background

**Priority**: P0 (critical path)

---

### 3.2 Rank #2: Fort.X File Elimination (Pipeline Architecture)

**Risk level**: HIGH

**Component**: Inter-process communication via binary fort.X files

**Why high-risk**:
1. **Fundamental architecture change**: 11 sequential programs → unified pipeline
2. **Binary format complexity**: Fort.12 (line list), fort.10 (atmosphere), fort.16 (opacities)
3. **Brittle**: If one program crashes, corrupted fort.X files break entire pipeline
4. **Platform-dependent**: Fortran UNFORMATTED I/O not portable
5. **Performance**: GB of I/O overhead between programs

**Fort.X files to eliminate**:
- **fort.10** (binary): Atmosphere data from xnfpelsyn → spectrv
- **fort.12** (binary): Line list, iteratively built by 6 programs → used by synthe
- **fort.14** (text): Control parameters from synbeg → all programs
- **fort.16** (binary): Line opacities from synthe → spectrv
- **fort.7** (text/binary): Spectrum output from spectrv

**Specific risks**:
- **Fort.12 append mode**: 6 programs sequentially append to same file (must preserve order)
- **Binary format validation**: Fortran record markers, padding, endianness
- **Backwards compatibility**: Do we need to read/write Fortran fort.X files for validation?

**Mitigation actions**:
1. **Decision 5.3 resolution**: Unified pipeline with optional stage-by-stage mode
2. **Replace binary files with structs**:
   - fort.10 → AtmosphereData struct (from xnfpelsyn)
   - fort.12 → Vector{SpectralLine} (from line readers)
   - fort.16 → LineOpacityGrid struct (from synthe)
   - fort.7 → Spectrum struct (from spectrv)
3. **Validation mode**: Keep FortranFiles.jl reader/writer for fort.X formats
   - Read Fortran fort.12 → convert to Vector{SpectralLine}
   - Write Vector{SpectralLine} → Fortran fort.12 for comparison
4. **Phased elimination**:
   - Phase 1 (Weeks 1-3): Line readers write Vector{SpectralLine} (no fort.12)
   - Phase 2 (Weeks 4-9): Atlas7v returns AtmosphereData struct (no fort.10)
   - Phase 3 (Weeks 10-12): Synthe returns LineOpacityGrid struct (no fort.16)
   - Phase 4 (Weeks 13-14): Spectrv returns Spectrum struct (no fort.7)
   - Phase 5 (Week 15+): Unified pipeline wraps all components

**Owner**: Lead architect

**Priority**: P0 (architectural foundation)

---

### 3.3 Rank #3: SYNTHE Line Opacity Loop (2,993 lines)

**Risk level**: MEDIUM-HIGH

**Component**: synthe.for main calculation loop

**Why high-risk**:
1. **Performance-critical**: Bottleneck (millions of lines × thousands of wavelengths × 99 depths)
2. **Complex loop**: Triple-nested (line, wavelength, depth) with early-exit optimization
3. **Voigt profile**: Computationally intensive, precision-sensitive
4. **Fort.12 binary I/O**: Must read 100K-1M lines from fort.12
5. **Large arrays**: BUFFER (2M elements), CONTIN (2M elements)

**Specific risks**:
- **Performance regression**: Julia must be <2× Fortran speed (acceptable for CPU-bound code)
- **Voigt profile accuracy**: Must match Fortran (reuse DD01 analysis)
- **Fort.12 reading**: Binary line list format (DD09) - use FortranFiles.jl
- **Early-exit optimization**: CUTOFF parameter skips weak lines (must preserve logic)

**Mitigation actions**:
1. **Defer until Week 10-12** (after atlas7v + line readers complete)
2. **Allocate 3-4 weeks**
3. **Reuse ATLAS12 analysis**:
   - Voigt profile (DD01): Float32 acceptable, 4-regime algorithm
   - Line opacity accumulation (DD03): Float32 adequate, Float64 recommended
4. **Performance optimization**:
   - LoopVectorization.jl for inner loops
   - @simd, @inbounds for tight loops
   - Preallocate BUFFER/CONTIN arrays
5. **Validation**:
   - Unit test: Single line profile (compare against Fortran)
   - Integration test: Full opacity calculation (compare fort.16 output)
   - Performance benchmark: Measure Julia vs Fortran time (target <2×)

**Owner**: Senior developer (performance optimization experience)

**Priority**: P1 (high, but after atlas7v)

---

### 3.4 Rank #4: SPECTRV Radiative Transfer (438 lines)

**Risk level**: MEDIUM

**Component**: spectrv.for radiative transfer loop

**Why medium-risk** (not high):
- **Small program**: Only 438 lines (simpler than synthe)
- **Standard RT**: Well-defined algorithm (Deep Dive 08)
- **Atlas7v dependency**: Most complexity is in library (already handled in Rank #1)

**Specific risks**:
- **Angle integration**: 17 μ = cos θ points (Gaussian quadrature)
- **Optional features**: CORONO (extended atmosphere), PRD (partial redistribution) rarely used
- **Fort.16 reading**: Must read line opacities from synthe

**Mitigation actions**:
1. **Defer until Week 13-14** (after atlas7v + synthe complete)
2. **Allocate 2-3 weeks**
3. **Skip optional features**: Defer CORONO, PRD until needed
4. **Reuse ATLAS12 RT analysis**: DD05 (JOSH) similar algorithm
5. **Validation**:
   - Compare emergent spectrum (fort.7) against Fortran
   - Test both intensity (17 angles) and flux modes

**Owner**: Mid-level developer (after atlas7v team frees up)

**Priority**: P2 (medium)

---

### 3.5 High-Risk Summary Table

| Rank | Component | Lines | Risk | Effort | Priority | Owner | Start Week |
|------|-----------|-------|------|--------|----------|-------|------------|
| 1 | Atlas7v library | 17,336 | CRITICAL | 4-6 weeks | P0 | Senior + physics | Week 4 |
| 2 | Fort.X elimination | N/A | HIGH | 3-5 weeks | P0 | Architect | Weeks 1-15 |
| 3 | SYNTHE line opacity | 2,993 | MED-HIGH | 3-4 weeks | P1 | Senior perf | Week 10 |
| 4 | SPECTRV RT | 438 | MEDIUM | 2-3 weeks | P2 | Mid-level | Week 13 |

**Total high-risk effort**: 12-18 weeks (out of 14-21 total)

**Comparison to ATLAS12**:
- ATLAS12 has 15 high-risk components (POPS, LINOP1, TCORR, etc.)
- SYNTHE has 4 high-risk components
- **SYNTHE risk is more concentrated** (atlas7v library dominates)

---

## Section 4: External Dependencies

SYNTHE shares most dependencies with ATLAS12. Reusing analysis from MIGRATION_ASSESSMENT.md Section 4.

### 4.1 Existing Julia Packages (20 packages)

**File I/O**:
1. **FortranFiles.jl** - Read/write Fortran UNFORMATTED binary files (fort.10, fort.12, fort.16)
2. **HDF5.jl** - Portable binary format (replace fort.X files)
3. **Arrow.jl** - Columnar data format (alternative to HDF5 for line lists)
4. **DelimitedFiles.jl** - ASCII input/output (atmosphere models, fort.14 control)

**Numerical Computing**:
5. **LoopVectorization.jl** - SIMD optimization (Voigt profile, opacity loop)
6. **StaticArrays.jl** - Fixed-size arrays (small grids, angle quadrature)
7. **LinearAlgebra.jl** - Matrix operations (RT, if needed)
8. **SpecialFunctions.jl** - Exponential integrals (E1, E2 for RT)
9. **Interpolations.jl** - Atmosphere interpolation (atlas7v)
10. **FastGaussQuadrature.jl** - Angle quadrature (μ = cos θ points)

**Physical Constants & Data**:
11. **PhysicalConstants.jl** - Universal constants (h, c, k, electron mass, etc.)
12. **Unitful.jl** - Unit checking (wavelength Å, energy eV, etc.)
13. **PeriodicTable.jl** - Element data (atomic masses, ionization potentials)

**Performance & Parallelization**:
14. **ThreadsX.jl** - Parallel line loop (embarrassingly parallel)
15. **Folds.jl** - Parallel reductions
16. **Strided.jl** - Multithreaded BLAS (if matrix RT)

**Testing & Validation**:
17. **Test.jl** - Unit tests (stdlib)
18. **ReferenceTests.jl** - Golden output comparison
19. **BenchmarkTools.jl** - Performance validation (<2× Fortran)

**Documentation**:
20. **Documenter.jl** - API documentation

---

### 4.2 Custom Packages Needed (2 packages)

**1. AtlasLineFormats.jl** (Shared with ATLAS12)
- **Purpose**: Read/write spectral line formats (Kurucz gf*.100, molecular, TiO, H2O, etc.)
- **Scope**:
  - LINDAT struct (SpectralLine in Julia)
  - 6 line format parsers (rgfalllinesnew, rpredict, rmolecasc, rschwenk, rh2ofast, rotate)
  - Fort.12 binary format reader/writer (SYNTHE-specific)
  - ASCII line list writers (for debugging)
- **Estimated effort**: 2-3 weeks
- **Dependencies**: FortranFiles.jl (fort.12 binary), DelimitedFiles.jl (ASCII)
- **Note**: Already needed for ATLAS12 (fort.11/21 line databases). SYNTHE adds fort.12 format.

**2. AtlasAtmosphereIO.jl** (New for SYNTHE)
- **Purpose**: Read/write ATLAS atmosphere models
- **Scope**:
  - Parse .mod format (ATLAS9/ATLAS12 output with control cards)
  - Fort.10 binary format (xnfpelsyn output)
  - AtmosphereData struct (T, P, ρ, XNE, populations, continuum opacities)
  - HDF5 serialization (portable alternative to fort.10)
- **Estimated effort**: 2 weeks
- **Dependencies**: FortranFiles.jl (fort.10), HDF5.jl (portable format)

**Total custom package effort**: 4-5 weeks

---

### 4.3 Dependency Timeline

**Week 1-2** (Quick wins):
- FortranFiles.jl (binary line readers)
- DelimitedFiles.jl (ASCII parsers)
- SpecialFunctions.jl (if needed for line profile)

**Week 3-5** (AtlasLineFormats.jl development):
- Build SpectralLine struct
- Implement 6 line format parsers
- Fort.12 binary format support

**Week 4-9** (Atlas7v library):
- PhysicalConstants.jl, Unitful.jl (constants)
- Interpolations.jl (atmosphere interpolation)
- FastGaussQuadrature.jl (angle quadrature)
- PeriodicTable.jl (element data)

**Week 6-7** (AtlasAtmosphereIO.jl development):
- Atmosphere model parser (.mod format)
- Fort.10 binary I/O
- AtmosphereData struct

**Week 10-14** (SYNTHE/SPECTRV):
- LoopVectorization.jl (performance optimization)
- ThreadsX.jl (parallel line loop)
- HDF5.jl (portable output)

**Week 15+** (Testing & optimization):
- Test.jl, ReferenceTests.jl (validation)
- BenchmarkTools.jl (performance)

---

## Section 5: Migration Roadmap Options

Three migration strategies for SYNTHE, adapted for pipeline architecture.

### 5.1 Option A: Pipeline-First (Recommended)

**Duration**: 14-18 weeks (3.5-4.5 months)

**Philosophy**: Leverage SYNTHE's natural modularity. Migrate programs in pipeline order.

**Sequence**:
1. **Weeks 1-3: Quick wins** (8 easy programs)
   - All line readers, synbeg, broaden, rotate
   - Establishes SpectralLine struct and line infrastructure
   - **Deliverable**: Complete line list processing (no fort.12)

2. **Weeks 4-9: Atlas7v library core** (critical path)
   - Refactor 38 COMMON blocks as AtmosphereState module
   - Migrate xnfpelsyn.for as thin wrapper
   - **Deliverable**: Atmosphere preparation (no fort.10)

3. **Weeks 10-12: SYNTHE synthesis core**
   - Migrate synthe.for main loop
   - Eliminate fort.12 input, fort.16 output
   - **Deliverable**: Line opacity calculation (in-memory)

4. **Weeks 13-14: SPECTRV radiative transfer**
   - Migrate spectrv.for
   - Eliminate fort.16 input, fort.7 output
   - **Deliverable**: Emergent spectrum (Spectrum struct)

5. **Weeks 15-18: Unified pipeline + validation**
   - Create synthe_pipeline() API (wraps all components)
   - End-to-end validation against Fortran
   - Performance optimization (<2× Fortran)
   - **Deliverable**: Complete working SYNTHE in Julia

**Pros**:
- ✅ Follows natural pipeline flow (easy to understand)
- ✅ Early validation at each stage (compare fort.X files)
- ✅ Incremental fort.X file elimination (low risk)
- ✅ Critical path (atlas7v) is clear
- ✅ Quick wins provide momentum (Weeks 1-3)

**Cons**:
- ❌ No working spectrum until Week 14 (late value delivery)
- ❌ Atlas7v blocks all downstream work (Weeks 4-9)
- ❌ Testing requires Fortran fort.X files until unified

**Best for**:
- Solo developer or small team (2-3 people)
- Conservative risk tolerance
- Strong Fortran validation requirement

---

### 5.2 Option B: Vertical Slice (Minimal Pipeline)

**Duration**: 14-16 weeks (3.5-4 months)

**Philosophy**: Implement end-to-end minimal functionality first, then expand.

**Sequence**:
1. **Weeks 1-2: Minimal infrastructure**
   - synbeg (wavelength setup)
   - rgfalllinesnew (single atomic line reader)
   - **Deliverable**: Basic SpectralLine struct, simple line parsing

2. **Weeks 3-7: Minimal atlas7v** (subset only)
   - Thermodynamic state (5 blocks): RHOX, TEMP, STATE, TEFF, HEIGHT
   - Hydrogen only (BHYD block): Minimal ionization
   - Skip: Other elements, molecular equilibrium, full opacity
   - **Deliverable**: Minimal atmosphere state (H-only)

3. **Weeks 8-10: Minimal SYNTHE**
   - Simple line opacity (Voigt profile for H lines only)
   - Single wavelength range (e.g., 5000-6000 Å)
   - **Deliverable**: Minimal line opacity grid

4. **Weeks 11-12: Minimal SPECTRV**
   - Simple RT (no PRD, no extended atmosphere)
   - Flux mode only (no angle-dependent intensity)
   - **Deliverable**: Minimal emergent spectrum

5. **Weeks 13-14: End-to-end validation**
   - Compare minimal pipeline against Fortran (H-only, 5000-6000 Å)
   - **Deliverable**: Working proof-of-concept

6. **Weeks 15-16+: Expansion**
   - Add all elements (BHE, BC, BO, etc.)
   - Add all line readers (molecular, TiO, H2O)
   - Add full wavelength coverage
   - Add all features (PRD, extended atmosphere, intensity mode)

**Pros**:
- ✅ Working spectrum by Week 12 (early value)
- ✅ Early proof-of-concept reduces risk
- ✅ Can parallelize expansion (Week 15+)
- ✅ Validates architecture before full investment

**Cons**:
- ❌ Minimal pipeline may need rework during expansion
- ❌ More complex planning (what's "minimal"?)
- ❌ Two validation phases (minimal + full)
- ❌ Harder to reuse ATLAS12 atlas7v work (need full, not minimal)

**Best for**:
- Research validation urgency (need working spectrum ASAP)
- Larger team (can parallelize expansion)
- Uncertain requirements (minimal proves viability)

---

### 5.3 Option C: Library-First (Atlas7v Priority)

**Duration**: 16-21 weeks (4-5 months)

**Philosophy**: Complete atlas7v library first (reusable by ATLAS12 and SYNTHE), then build SYNTHE pipeline.

**Sequence**:
1. **Weeks 1-3: Quick wins** (same as Option A)
   - All 8 easy programs
   - **Deliverable**: Line infrastructure

2. **Weeks 4-12: Complete atlas7v library** (longest phase)
   - All 38 COMMON blocks refactored
   - All 32 subroutines migrated
   - Comprehensive test suite (unit + integration)
   - **Deliverable**: Production-ready AtmosphereState module (usable by ATLAS12 and SYNTHE)

3. **Weeks 13-15: XNFPELSYN + SYNTHE** (parallel)
   - Migrate xnfpelsyn (uses atlas7v)
   - Migrate synthe.for (uses atlas7v subset)
   - **Deliverable**: Atmosphere + line opacity

4. **Weeks 16-18: SPECTRV + unified pipeline**
   - Migrate spectrv (uses atlas7v)
   - Create synthe_pipeline() wrapper
   - **Deliverable**: Complete SYNTHE

5. **Weeks 19-21: Cross-validation** (ATLAS12 + SYNTHE)
   - Validate atlas7v library against both ATLAS12 and SYNTHE Fortran outputs
   - **Deliverable**: Dual-validated library

**Pros**:
- ✅ Atlas7v library reusable by both ATLAS12 and SYNTHE (efficiency)
- ✅ Comprehensive atlas7v testing before SYNTHE depends on it (low risk)
- ✅ Can parallelize xnfpelsyn + synthe migration (Week 13+)
- ✅ Long-term efficiency (shared library for all ATLAS codes)

**Cons**:
- ❌ No working SYNTHE until Week 16 (late value)
- ❌ Longest critical path (atlas7v Weeks 4-12)
- ❌ Highest upfront investment before validation
- ❌ Risk of over-engineering atlas7v for SYNTHE needs

**Best for**:
- Multi-code migration strategy (ATLAS12 + SYNTHE + future codes)
- Larger team with library architecture expertise
- Long-term maintenance priority (shared codebase)

---

### 5.4 Decision Matrix

| Criterion | Option A: Pipeline-First | Option B: Vertical Slice | Option C: Library-First |
|-----------|-------------------------|-------------------------|------------------------|
| **Duration** | 14-18 weeks | 14-16 weeks | 16-21 weeks |
| **Working spectrum by** | Week 14 | Week 12 | Week 16 |
| **Critical path** | Atlas7v (Weeks 4-9) | Minimal atlas7v (Weeks 3-7) | Atlas7v (Weeks 4-12) |
| **Risk** | LOW (incremental) | MEDIUM (minimal may need rework) | LOW (comprehensive testing) |
| **Complexity** | LOW (linear pipeline) | MEDIUM (what's minimal?) | MEDIUM (library scope) |
| **Reusability** | SYNTHE-specific | SYNTHE-specific | Shared with ATLAS12 |
| **Fortran compatibility** | HIGH (validates at each stage) | MEDIUM (minimal only) | HIGH (comprehensive) |
| **Team size** | 1-3 (sequential) | 3-5 (parallel expansion) | 3-5 (parallel after Week 12) |

**Recommendation**: **Option A (Pipeline-First)** for SYNTHE-only migration, **Option C (Library-First)** for multi-code strategy.

**Rationale**:
- SYNTHE's pipeline architecture naturally fits Pipeline-First approach
- Atlas7v library is shared with ATLAS12 (already analyzed in MIGRATION_ASSESSMENT.md)
- If migrating both ATLAS12 and SYNTHE, complete atlas7v once (Option C), reuse for both
- If migrating SYNTHE only (as stated in mission brief: "Priority #2"), use Pipeline-First (Option A)

**User (Paula) decision needed**:
1. Is SYNTHE migration standalone, or part of larger ATLAS12+SYNTHE strategy?
2. If standalone, proceed with Option A (Pipeline-First)
3. If multi-code, proceed with Option C (Library-First)

---

## Section 6: Timeline Estimates

### 6.1 Solo Developer (1 person)

**Option A (Pipeline-First)**: 18-24 weeks (4.5-6 months)
- Weeks 1-3: Quick wins (3 weeks)
- Weeks 4-11: Atlas7v library (8 weeks, no parallelization)
- Weeks 12-15: SYNTHE (4 weeks)
- Weeks 16-18: SPECTRV (3 weeks)
- Weeks 19-24: Unified pipeline, validation, optimization (6 weeks)
- **Total**: 24 weeks (6 months)

**Option B (Vertical Slice)**: 16-22 weeks (4-5.5 months)
- Weeks 1-2: Minimal infrastructure (2 weeks)
- Weeks 3-9: Minimal atlas7v (7 weeks)
- Weeks 10-13: Minimal SYNTHE + SPECTRV (4 weeks)
- Weeks 14-16: End-to-end validation (3 weeks)
- Weeks 17-22: Expansion (6 weeks)
- **Total**: 22 weeks (5.5 months)

**Option C (Library-First)**: 21-28 weeks (5-7 months)
- Weeks 1-3: Quick wins (3 weeks)
- Weeks 4-15: Complete atlas7v (12 weeks)
- Weeks 16-19: XNFPELSYN + SYNTHE (4 weeks, sequential)
- Weeks 20-22: SPECTRV (3 weeks)
- Weeks 23-28: Unified pipeline, cross-validation (6 weeks)
- **Total**: 28 weeks (7 months)

**Recommended**: Option A or B (shorter)

---

### 6.2 Two-Person Team (Parallel Work)

**Option A (Pipeline-First)**: 12-16 weeks (3-4 months)
- Weeks 1-3: Quick wins (both work on different programs, 3 weeks)
- Weeks 4-9: Atlas7v library (both work on different blocks, 6 weeks)
- Weeks 10-12: SYNTHE (Person 1) + XNFPELSYN (Person 2, parallel, 3 weeks)
- Weeks 13-14: SPECTRV (Person 1) + Unified pipeline (Person 2, parallel, 2 weeks)
- Weeks 15-16: Validation + optimization (both, 2 weeks)
- **Total**: 16 weeks (4 months)

**Option B (Vertical Slice)**: 11-14 weeks (2.75-3.5 months)
- Weeks 1-2: Minimal infrastructure (both, 2 weeks)
- Weeks 3-7: Minimal atlas7v (both, 5 weeks)
- Weeks 8-10: Minimal SYNTHE (Person 1) + Minimal SPECTRV (Person 2, parallel, 3 weeks)
- Weeks 11-12: End-to-end validation (both, 2 weeks)
- Weeks 13-14: Expansion start (both, 2 weeks) *ongoing*
- **Total**: 14 weeks to minimal, +expansion time

**Option C (Library-First)**: 14-18 weeks (3.5-4.5 months)
- Weeks 1-3: Quick wins (both, 3 weeks)
- Weeks 4-11: Complete atlas7v (both, 8 weeks)
- Weeks 12-13: XNFPELSYN (Person 1) + SYNTHE (Person 2, parallel, 2 weeks)
- Weeks 14-15: SPECTRV (Person 1) + Unified pipeline (Person 2, parallel, 2 weeks)
- Weeks 16-18: Cross-validation (both, 3 weeks)
- **Total**: 18 weeks (4.5 months)

**Recommended**: Option A or B (4 months or less)

---

### 6.3 Three-Person Team (Full Parallelization)

**Option A (Pipeline-First)**: 10-14 weeks (2.5-3.5 months)
- Weeks 1-2: Quick wins (all 3, different programs, 2 weeks)
- Weeks 3-8: Atlas7v library (all 3, different block groups, 6 weeks)
- Weeks 9-10: XNFPELSYN (P1) + SYNTHE (P2) + Line formats (P3, parallel, 2 weeks)
- Weeks 11-12: SPECTRV (P1) + Unified pipeline (P2) + Testing (P3, parallel, 2 weeks)
- Weeks 13-14: Validation + optimization (all 3, 2 weeks)
- **Total**: 14 weeks (3.5 months)

**Option B (Vertical Slice)**: 9-12 weeks (2.25-3 months)
- Weeks 1-2: Minimal infrastructure (all 3, 2 weeks)
- Weeks 3-6: Minimal atlas7v (all 3, 4 weeks)
- Weeks 7-8: Minimal SYNTHE (P1) + SPECTRV (P2) + Testing (P3, parallel, 2 weeks)
- Weeks 9-10: End-to-end validation (all 3, 2 weeks)
- Weeks 11-12: Expansion start (all 3, 2 weeks) *ongoing*
- **Total**: 12 weeks to minimal, +expansion time

**Option C (Library-First)**: 12-16 weeks (3-4 months)
- Weeks 1-2: Quick wins (all 3, 2 weeks)
- Weeks 3-10: Complete atlas7v (all 3, 8 weeks)
- Weeks 11-12: XNFPELSYN (P1) + SYNTHE (P2) + AtmosphereIO (P3, parallel, 2 weeks)
- Weeks 13-14: SPECTRV (P1) + Unified pipeline (P2) + Testing (P3, parallel, 2 weeks)
- Weeks 15-16: Cross-validation (all 3, 2 weeks)
- **Total**: 16 weeks (4 months)

**Recommended**: Option A or B (3-3.5 months)

---

### 6.4 Comparison to ATLAS12

| Team Size | ATLAS12 | SYNTHE (Pipeline-First) | Speedup |
|-----------|---------|------------------------|---------|
| Solo | 9-18 months | 4.5-6 months | 2-3× |
| 2-person | 5-10 months | 3-4 months | 1.7-2.5× |
| 3-person | 3-9 months | 2.5-3.5 months | 1.2-2.6× |

**SYNTHE is consistently 2-3× faster** than ATLAS12 due to cleaner modular architecture.

---

## Section 7: Validation Strategy

SYNTHE validation reuses the 6-tier approach from ATLAS12 (MIGRATION_ASSESSMENT.md Section 7), adapted for pipeline architecture.

### 7.1 Tier 1: Smoke Tests (Week 1+, ongoing)

**Purpose**: Verify program doesn't crash, produces output in expected format

**Per-program tests**:
1. **synbeg**: Parse control card, write fort.12 header + fort.14
2. **Line readers**: Read line list, populate SpectralLine vector
3. **xnfpelsyn**: Read atmosphere model, write AtmosphereData
4. **synthe**: Read lines + atmosphere, compute line opacities
5. **spectrv**: Read opacities, compute spectrum
6. **rotate/broaden**: Apply broadening kernels

**Acceptance**: Program runs without errors, output files/structs exist

**Timing**: After each program migration (rolling validation)

---

### 7.2 Tier 2: Fortran Comparison Tests (Week 3+, ongoing)

**Purpose**: Verify Julia outputs match Fortran outputs numerically

**Per-program comparisons**:
1. **synbeg**: Compare fort.12 header bytes, fort.14 text (should be identical)
2. **rgfalllinesnew**: Read gf0800.100, compare parsed lines against Fortran fort.12 dump
3. **xnfpelsyn**: Compare AtmosphereData (T, P, XNE, populations) against Fortran fort.10
4. **synthe**: Compare LineOpacityGrid against Fortran fort.16 (tolerance ~1e-6 for Float64)
5. **spectrv**: Compare Spectrum against Fortran fort.7 (tolerance ~0.1% for flux)

**Test cases** (5 minimum):
1. Solar (T_eff=5777K, log g=4.44, [M/H]=0.0)
2. Cool (T_eff=4000K, log g=2.0) - tests molecular lines
3. Hot (T_eff=10000K, log g=4.0) - tests H/He ionization
4. Metal-rich ([M/H]=+0.5)
5. Metal-poor ([M/H]=-2.0) - tests weak lines

**Tolerance**:
- Fort.12 header: Exact (binary identical)
- Fort.14 control: Exact (text identical)
- Atmosphere (fort.10): ~1e-6 relative (Float64 rounding)
- Line opacities (fort.16): ~1e-6 relative
- Spectrum (fort.7): ~0.1% relative (accumulated from many lines)

**Timing**: After each program migration, before proceeding to next

---

### 7.3 Tier 3: Physics Validation Tests (Week 10+)

**Purpose**: Verify physical correctness (beyond Fortran comparison)

**Tests**:
1. **Energy conservation**: ∫ F_ν dν = σ T_eff^4 (integrated flux matches)
2. **LTE validity**: Check atmospheric parameters (T > 4000K, ρ > threshold)
3. **Line identification**: Known spectral features (Balmer lines, Na D, Ca H&K, etc.) present and correct
4. **Equivalent width**: Measure EW for strong lines, compare against literature
5. **Continuum shape**: Compare continuum vs blackbody (should match in line-free regions)

**Reference data**:
- Observed solar spectrum (Kurucz solar atlas)
- Literature EW measurements (Vesta, Arcturus, etc.)
- Theoretical predictions (Balmer decrement, etc.)

**Acceptance**: Physics checks pass within ~5-10% (typical observational uncertainty)

**Timing**: After complete pipeline (Week 14+)

---

### 7.4 Tier 4: Edge Case Tests (Week 12+)

**Purpose**: Verify robustness at parameter boundaries

**Test cases**:
1. **Extreme T_eff**: 3500K (molecular), 15000K (fully ionized H)
2. **Extreme log g**: 0.0 (giant), 5.0 (white dwarf)
3. **Extreme metallicity**: [M/H]=-4.0 (primordial), +1.0 (super-solar)
4. **Extreme wavelength**: UV (1000 Å), IR (10000 Å)
5. **Extreme line count**: 10 lines (minimal), 10M lines (H2O)
6. **Extreme v sin i**: 0 km/s (no rotation), 300 km/s (fast rotator)
7. **Extreme resolution**: R=1000 (low-res), R=500000 (high-res)

**Acceptance**: Program handles edge cases gracefully (no crashes, warnings if unphysical)

**Timing**: After physics validation (Week 14+)

---

### 7.5 Tier 5: Performance & Stability Tests (Week 15+)

**Purpose**: Verify production readiness

**Performance benchmarks**:
1. **Baseline**: Fortran pipeline (serial, single core)
2. **Julia (serial)**: Single-threaded Julia, compare against Fortran
   - **Target**: <2× Fortran time (acceptable for CPU-bound code)
3. **Julia (parallel)**: Multi-threaded line loop (ThreadsX.jl)
   - **Target**: ~N× speedup on N cores (embarrassingly parallel)

**Typical workload** (benchmark case):
- Solar atmosphere (T_eff=5777K, log g=4.44)
- Wavelength range: 5000-6000 Å (1000 Å)
- Resolution: R=50000
- Line count: ~100,000 lines
- **Fortran time**: ~10-30 minutes (typical)
- **Julia target**: <60 minutes (serial), <10 minutes (8 cores parallel)

**Stability tests**:
1. **Memory leaks**: Run 100 iterations, monitor memory (should be constant)
2. **Numerical stability**: Run with different random seeds (should get same answer)
3. **Convergence**: RT iteration should converge (if iterative RT used)

**Timing**: After edge case tests (Week 15+)

---

### 7.6 Tier 6: Cross-Code Validation (Week 16+, if applicable)

**Purpose**: Verify atlas7v library consistency between ATLAS12 and SYNTHE

**Tests** (only if atlas7v shared between codes):
1. **Atmosphere comparison**: Run ATLAS12 atmosphere iteration, use output as SYNTHE input
   - Julia ATLAS12 atmosphere → Julia SYNTHE spectrum
   - Fortran ATLAS12 atmosphere → Fortran SYNTHE spectrum
   - Compare: Julia vs Fortran spectrum should match
2. **Population consistency**: Compare POPS output in ATLAS12 vs xnfpelsyn
   - Should get identical populations for same T, P, XNE
3. **Opacity consistency**: Compare KAPCONT output in ATLAS12 vs xnfpelsyn
   - Should get identical continuum opacities

**Acceptance**: Atlas7v library produces consistent results when called from different programs

**Timing**: Only if Option C (Library-First) chosen (Weeks 19-21)

---

### 7.7 Validation Summary

| Tier | Purpose | Timing | Test Count | Acceptance Criteria |
|------|---------|--------|------------|---------------------|
| 1. Smoke | No crashes | Week 1+ | 11 programs | Runs without errors |
| 2. Fortran | Numerical match | Week 3+ | 5 test cases × 5 programs | <1e-6 or 0.1% tolerance |
| 3. Physics | Physical correctness | Week 10+ | 5 physics checks | ~5-10% of literature |
| 4. Edge | Robustness | Week 12+ | 7 edge cases | Handles gracefully |
| 5. Performance | Production ready | Week 15+ | <2× Fortran (serial) | Meets target |
| 6. Cross-code | Library consistency | Week 16+ | 3 tests (if applicable) | Consistent across codes |

**Total validation effort**: ~4-6 weeks (included in timeline estimates)

**Critical path**: Tier 2 (Fortran comparison) must pass before proceeding to next program

---

## Section 8: Risk Mitigation Actions

### 8.1 Risk #1: Atlas7v Library Complexity (CRITICAL)

**Risk**: Atlas7v is massive (17K lines, 38 blocks, 32 subroutines). If migration fails or takes too long, entire SYNTHE blocked.

**Impact**: CRITICAL (blocks xnfpelsyn, spectrv)

**Mitigation actions**:

1. **Defer to Week 4** (after quick wins build confidence)
   - **Timing**: Weeks 4-9 (6 weeks allocated)
   - **Owner**: Senior developer + astrophysics consultant (Paula)
   - **Priority**: P0

2. **Phased refactoring** (reduce risk of big-bang failure):
   - **Phase 1** (Weeks 4-5): Thermodynamic state (5 blocks) + basic tests
   - **Phase 2** (Weeks 6-7): Element populations (13 blocks) + validation
   - **Phase 3** (Weeks 8-9): Opacity & RT (7 blocks) + integration tests
   - Validate each phase before proceeding

3. **Reuse ATLAS12 analysis**:
   - POPS (DD02): Float64 required, damping factor 0.3
   - KAPP (Atlas7v Phase 4): 20 opacity sources, IFOP flags
   - Element blocks pattern: Consistent refactoring across 13 elements

4. **Comprehensive test suite**:
   - **Unit tests**: Per-block initialization, per-subroutine validation
   - **Integration tests**: Full atmosphere calculation (compare against ATLAS12)
   - **Reference**: Use ATLAS12 Fortran output as ground truth

5. **Fallback plan**: If atlas7v refactoring stalls (>9 weeks):
   - **Option**: Keep atlas7v.for in Fortran, call via C interface (ccall)
   - **Pros**: Unblocks xnfpelsyn/spectrv, preserves exact Fortran behavior
   - **Cons**: Not pure Julia, complicates build, less portable
   - **Decision point**: Week 8 (if behind schedule)

**Success criteria**: atlas7v test suite passes (100% Fortran comparison) by Week 9

---

### 8.2 Risk #2: Fort.X File Format Incompatibility (HIGH)

**Risk**: Fortran UNFORMATTED I/O is platform-dependent (endianness, record markers). Julia may not read/write fort.X files correctly.

**Impact**: HIGH (breaks validation, prevents incremental migration)

**Mitigation actions**:

1. **Use FortranFiles.jl** (tested library):
   - **Timing**: Week 1 (validate with simple test)
   - **Owner**: Lead developer
   - **Test**: Read Fortran fort.12 (line list), verify parsed data matches

2. **Validation mode** (dual output):
   - Julia writes both Struct (in-memory) AND fort.X file (for comparison)
   - Compare Julia fort.X vs Fortran fort.X byte-by-byte
   - **Example**: synthe writes LineOpacityGrid struct + fort.16 file
   - **Timing**: Throughout migration (rolling validation)

3. **Binary format documentation**:
   - Fort.12 (DD09): Line list format
   - Fort.10: Atmosphere data format (document during xnfpelsyn migration)
   - Fort.16: Opacity grid format (document during synthe migration)
   - **Create**: Binary format specification documents (for future reference)

4. **Portable alternative** (long-term):
   - Replace fort.X with HDF5/Arrow (platform-independent)
   - **Timing**: Week 15+ (after Fortran validation complete)
   - Keep FortranFiles.jl reader for backwards compatibility

5. **Platform testing**:
   - Test on multiple systems: Linux (gfortran), macOS (gfortran), Windows (if needed)
   - Verify endianness handling (Intel little-endian is standard)

**Success criteria**: Julia reads Fortran fort.12, writes fort.16, Fortran reads Julia fort.16 (round-trip) by Week 10

---

### 8.3 Risk #3: Performance Regression (MEDIUM-HIGH)

**Risk**: Julia SYNTHE is >2× slower than Fortran (unacceptable for production).

**Impact**: MEDIUM-HIGH (users won't adopt if too slow)

**Mitigation actions**:

1. **Performance budget**: <2× Fortran (acceptable), <1.5× Fortran (target)
   - **Baseline**: Measure Fortran pipeline time (typical case: ~10-30 min)
   - **Julia target**: <60 minutes (2× acceptable), <45 minutes (1.5× target)

2. **Optimization strategy** (progressive):
   - **Week 10**: First working Julia synthe (don't optimize yet, measure baseline)
   - **Week 11-12**: Apply standard optimizations:
     - @simd, @inbounds for tight loops
     - LoopVectorization.jl for Voigt profile
     - Preallocate BUFFER/CONTIN arrays (avoid allocations in loop)
     - Use StaticArrays for small fixed-size data
   - **Week 15+**: Profile and optimize hotspots if >2× Fortran:
     - Identify bottlenecks with @profview
     - Optimize hot loops (likely Voigt profile calculation)
     - Consider ThreadsX.jl parallelization (embarrassingly parallel)

3. **Acceptable slowdowns** (where 2× is fine):
   - I/O (file reading): Not performance-critical
   - Setup (synbeg, xnfpelsyn): Run once per spectrum
   - Post-processing (rotate, broaden): Fast anyway

4. **Critical performance** (must be <2×):
   - **synthe.for line loop**: Millions of iterations (dominant time)
   - **Voigt profile**: Called ~millions of times
   - **Opacity accumulation**: Inner loop

5. **Parallelization** (if needed):
   - Line loop is embarrassingly parallel (no dependencies)
   - Use ThreadsX.jl to parallelize over lines or wavelengths
   - **Target**: ~N× speedup on N cores (ideal parallel efficiency)
   - **Example**: 8 cores → <8 minutes (vs Fortran 10-30 min)

**Success criteria**: Julia SYNTHE completes benchmark case in <60 minutes (serial) by Week 15

---

### 8.4 Risk #4: Line List Format Compatibility (MEDIUM)

**Risk**: 6 different line list formats (gf*.100, molecular, TiO binary, H2O binary, predicted). Julia may not parse correctly.

**Impact**: MEDIUM (missing lines → wrong spectrum)

**Mitigation actions**:

1. **Test-driven development** (per format):
   - **Week 1-2**: Create test suite with known line lists
   - For each format: Read Fortran fort.12, parse in Julia, compare line-by-line
   - **Acceptance**: 100% line match (no missing/wrong lines)

2. **Reference implementations**:
   - Use Fortran readers as specification (not just documentation)
   - If ambiguous, run Fortran reader, dump output, replicate in Julia

3. **AtlasLineFormats.jl package** (Weeks 3-5):
   - Centralize all line format parsers
   - Comprehensive test suite (per format)
   - Documentation with format specifications

4. **Validation strategy** (per format):
   - **gf*.100** (rgfalllinesnew): Read gf0800.100, compare against Fortran
   - **Molecular** (rmolecasc): Read CH, CO line lists
   - **TiO binary** (rschwenk): Read tioschwenke.bin (use FortranFiles.jl)
   - **H2O binary** (rh2ofast): Read h2ofastfix.bin (millions of lines)
   - **Predicted** (rpredict): Read predicted line lists

5. **Error handling**:
   - Detect malformed line lists (wrong format, corrupted files)
   - Provide clear error messages (not cryptic crashes)

**Success criteria**: All 6 line formats parse correctly, 100% line match vs Fortran by Week 3

---

### 8.5 Risk #5: Validation Test Case Availability (LOW-MEDIUM)

**Risk**: Paula may not have reference SYNTHE outputs (fort.7 spectra) for validation.

**Impact**: LOW-MEDIUM (can still validate, but harder without golden reference)

**Mitigation actions**:

1. **Generate reference outputs** (Week 1):
   - Run Fortran SYNTHE for 5 test cases (solar, cool, hot, metal-rich, metal-poor)
   - Save fort.7 outputs as golden reference
   - Document input parameters (atmosphere model, line lists, wavelength range, etc.)

2. **Alternative validation** (if no reference):
   - Use Fortran SYNTHE as reference (run alongside Julia SYNTHE)
   - Compare Julia fort.7 vs Fortran fort.7 output
   - **Requirement**: Paula must have working Fortran SYNTHE installation

3. **Test case repository**:
   - Create `test/reference/` directory with:
     - 5 atmosphere models (.mod files)
     - Line lists (or symbolic links to Kurucz databases)
     - Control parameters (wavelength range, resolution, etc.)
     - Reference outputs (Fortran fort.7 spectra)
   - Commit to Git (or provide download link if too large)

4. **Fallback**: If no Fortran reference available:
   - Validate physics instead (energy conservation, line identification, etc.)
   - Compare against observed spectra (solar atlas, Vesta, etc.)

**Success criteria**: 5 reference test cases available by Week 1

---

### 8.6 Risk #6: Undocumented Fortran Behavior (MEDIUM)

**Risk**: Fortran code has undocumented quirks (magic constants, edge case handling) that Julia must replicate.

**Impact**: MEDIUM (subtle bugs, hard to debug)

**Mitigation actions**:

1. **Document as you go**:
   - When encountering magic constant (e.g., damping factor 0.3), document in code comments
   - Flag for Paula review (is this physically motivated or numerical hack?)
   - Add to "Questions for Paula" section

2. **Reuse ATLAS12 analysis**:
   - Many algorithms shared between ATLAS12 and SYNTHE
   - Voigt profile (DD01): 4-regime algorithm, 13 magic constants
   - Populations (DD02): Float64 required, damping factor 0.3
   - Line opacity (DD03): Early-exit optimization, CUTOFF parameter

3. **Conservative approach**:
   - When in doubt, replicate Fortran exactly (even if seems suboptimal)
   - Optimize later, after validation passes

4. **Edge case testing** (Tier 4 validation):
   - Test extreme parameters to find hidden assumptions
   - Compare Julia vs Fortran behavior at boundaries

**Success criteria**: No unexplained discrepancies between Julia and Fortran outputs

---

### 8.7 Risk Summary Table

| Risk | Impact | Probability | Mitigation | Owner | Timing |
|------|--------|-------------|------------|-------|--------|
| 1. Atlas7v complexity | CRITICAL | MEDIUM | Phased refactoring, reuse ATLAS12 | Senior + Paula | Weeks 4-9 |
| 2. Fort.X incompatibility | HIGH | LOW | FortranFiles.jl, validation mode | Lead dev | Weeks 1-15 |
| 3. Performance regression | MED-HIGH | MEDIUM | Optimization strategy, parallelization | Senior perf | Weeks 10-15 |
| 4. Line format errors | MEDIUM | LOW | TDD, AtlasLineFormats.jl | Mid-level | Weeks 1-5 |
| 5. Missing test cases | LOW-MED | LOW | Generate references, fallback physics | Paula + team | Week 1 |
| 6. Undocumented behavior | MEDIUM | MEDIUM | Document, reuse ATLAS12, conservative | All | Ongoing |

**Overall risk**: MEDIUM (atlas7v is highest single risk, but mitigated by phased approach)

**Comparison to ATLAS12**: SYNTHE has LOWER overall risk due to cleaner architecture (8 easy programs reduce risk concentration)

---

## Section 9: Open Questions for Paula

1. **Migration strategy** (Section 5): Which option do you prefer?
   - Option A: Pipeline-First (14-18 weeks, SYNTHE-only)
   - Option B: Vertical Slice (14-16 weeks, minimal proof-of-concept)
   - Option C: Library-First (16-21 weeks, reusable atlas7v for ATLAS12+SYNTHE)

2. **Atlas7v scope** (Rank #1 risk): Should atlas7v library support:
   - Full ATLAS12 atmosphere iteration (all features)
   - OR minimal SYNTHE subset (atmosphere interpolation only)?

3. **Test case availability** (Validation): Do you have reference SYNTHE outputs (fort.7 spectra) for 5 test cases?
   - Solar (T_eff=5777K, log g=4.44)
   - Cool (T_eff=4000K, log g=2.0)
   - Hot (T_eff=10000K, log g=4.0)
   - Metal-rich ([M/H]=+0.5)
   - Metal-poor ([M/H]=-2.0)

4. **Optional features** (SPECTRV): Are these features used in your research?
   - CORONO (extended atmosphere/chromosphere)
   - PRD (partial redistribution in line scattering)
   - If not used, can defer or skip

5. **Line databases** (Section 4): Which line lists do you use?
   - Kurucz gf*.100 (atomic): Which element ranges?
   - Molecular: Which molecules (CH, CO, CN, TiO, H2O, etc.)?
   - Predicted lines: Used?

6. **Performance requirements**: Is 2× Fortran speed acceptable for SYNTHE?
   - Typical Fortran time: ~10-30 minutes for 5000-6000 Å, R=50000
   - Julia target: <60 minutes serial, <10 minutes parallel (8 cores)

7. **Fortran SYNTHE availability**: Do you have working Fortran SYNTHE installation for validation?
   - Needed for Tier 2 (Fortran comparison) validation

8. **Team composition** (Section 6): Will migration be:
   - Solo (you + occasional Claude assistance)
   - 2-person team (you + Marcos Diaz?)
   - Larger team?

9. **Timeline urgency**: Is there a deadline for SYNTHE migration?
   - Publication deadline?
   - Research project timeline?
   - Or flexible?

10. **Atlas7v fallback** (Risk #1): If atlas7v refactoring stalls, is C interface (call Fortran via ccall) acceptable fallback?
    - Pros: Unblocks SYNTHE, exact Fortran behavior
    - Cons: Not pure Julia, build complexity

---

## Section 10: Cross-References

**Related archaeology documents**:
- **SYNTHE_COMMON_BLOCK_MAP.md**: Detailed COMMON block analysis (this assessment's foundation)
- **Deep Dive 08**: SPECTRV synthesis kernel
- **Deep Dive 09**: Fort.12 line accumulation format
- **Deep Dive 10**: XNFPELSYN atmosphere preparation
- **Deep Dive 11**: Rotational and instrumental broadening
- **Deep Dive 12**: Line readers (6 formats)
- **PHYSICS_PIPELINE_SYNTHE.md**: Physics of spectrum synthesis
- **SYNTHE_DEEP_DIVE_SUMMARY.md**: Initial migration roadmap (Phase 2B)
- **Atlas7v Phase 1-4**: Library dependency analysis, KAPP deep dive

**ATLAS12 comparison**:
- **MIGRATION_ASSESSMENT.md**: ATLAS12 migration planning (same structure)
- **COMMON_BLOCK_MAP.md**: ATLAS12 COMMON blocks (57 blocks vs SYNTHE's 50)
- **API_PROJECTION.md**: Cost estimates (SYNTHE $257-438 included in total)

**Architecture decisions**:
- **ARCHITECTURE_INSIGHTS.md Decision 5.2**: ATLAS12 unified architecture (applies to SYNTHE)
- **ARCHITECTURE_INSIGHTS.md Decision 5.3**: SYNTHE unification strategy (unified + stages)
- **ARCHITECTURE_INSIGHTS.md Decision 5.4**: Numerical precision (Float64 populations, mixed elsewhere)

---

## Section 11: Conclusion

SYNTHE migration is **significantly more tractable** than ATLAS12:

**Why SYNTHE is easier**:
1. **Modular architecture**: 11 independent programs vs ATLAS12's monolithic 23K-line program
2. **Natural quick wins**: 8 of 11 programs are trivial (0-4 COMMON blocks, <500 lines)
3. **Cleaner dependencies**: Fort.X file communication is loose coupling (vs ATLAS12's tight COMMON block coupling)
4. **Shorter timeline**: 14-21 weeks vs ATLAS12's 36-58 weeks (2-3× faster)

**SYNTHE's unique challenge**: Fort.X file elimination
- Not a COMMON block problem (those are well-isolated in atlas7v)
- But a pipeline architecture problem (11 sequential programs)
- Solution: Unified pipeline with optional stage-by-stage mode (Decision 5.3)

**Recommended approach**: Pipeline-First (Option A)
- Leverage SYNTHE's natural modularity
- Early wins (Weeks 1-3) build confidence
- Atlas7v library (Weeks 4-9) is critical path but manageable
- Working spectrum by Week 14

**Risk level**: MEDIUM overall
- Atlas7v library is highest single risk (17K lines, 38 blocks)
- But mitigated by phased refactoring + reuse of ATLAS12 analysis
- Fort.X elimination is architectural challenge but well-understood

**Estimated timeline**:
- **Solo**: 18-24 weeks (4.5-6 months)
- **2-person team**: 12-16 weeks (3-4 months)
- **3-person team**: 10-14 weeks (2.5-3.5 months)

**Next step**: Paula decides on migration strategy (Option A/B/C) and answers 10 open questions

---

**Document status**: ✅ Complete
**Next deliverable**: SYNTHE_API_PROJECTION.md (detailed cost breakdown)
