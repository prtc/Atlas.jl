# Deep Dive Index
*ATLAS Suite Computational Kernel Analysis - Complete Reference*

**Mission**: Phase 2B-3 Code Archaeology
**Status**: ✅ COMPLETE - All branches merged into main
- ATLAS12: 7 of 7 deep dives complete (100%)
- SYNTHE: 5 of 5 deep dives complete (100%)
- ATLAS7V: 4 of 4 dependency analysis phases complete (100%)
**Total Documentation**: 16,097 lines across 12 deep dives + 3 synthesis documents + 4 ATLAS7V analysis phases
**Date Range**: 2025-11-07 to 2025-11-09

**Synthesis Documents**:
- `PHYSICS_PIPELINE_ATLAS12.md` (1,547 lines) - Physics of ATLAS12 iteration (WHAT/WHY)
- `PHYSICS_PIPELINE_SYNTHE.md` (1,607 lines) - Physics of SYNTHE synthesis (WHAT/WHY)
- `SYNTHE_DEEP_DIVE_SUMMARY.md` (915 lines) - SYNTHE migration roadmap (HOW)

---

## Quick Reference Table

### ATLAS12 Deep Dives (01-07)

| # | Title | Risk Rank | Lines | Key Topic | Status |
|---|-------|-----------|-------|-----------|--------|
| 01 | Voigt Profile | #2 | 628 | Algorithm, Performance | 🐲✨ Complete |
| 02 | Populations | #1 | 754 | Precision, Overflow | 🐲✨ Complete |
| 03 | Line Opacity | #3 | 934 | Precision, Performance | 🐲✨ Complete |
| 04 | Binary I/O | #4 | 966 | Format Compatibility | 🐲✨ Complete |
| 05 | Radiative Transfer | #6 | 918 | Algorithm, Precision | 🐲✨ Complete |
| 06 | Iteration Damping | #5 | 1,132 | Convergence | 🐲✨ Complete |
| 07 | Convective Transport | N/A | 1,371 | Physics, Numerics | 🐲✨ Complete |
| **ATLAS12 Total** | | | **6,703** | | |

### SYNTHE Deep Dives (08-12)

| # | Title | Priority | Lines | Key Topic | Status |
|---|-------|----------|-------|-----------|--------|
| 08 | SPECTRV (Synthesis) | Critical | 1,205 | RT, Line Opacity | 🐲✨ Complete |
| 09 | Line Accumulation | High | 977 | Merging, Binary I/O | 🐲✨ Complete |
| 10 | XNFPELSYN (Populations) | High | 1,004 | ATLAS7V, Opacities | 🐲✨ Complete |
| 11 | Broadening | Medium | 760 | Rotation, Convolution | 🐲✨ Complete |
| 12 | Line Readers | High | 1,379 | Input Formats, Validation | 🐲✨ Complete |
| **SYNTHE Total** | | | **5,325** | | |

### ATLAS7V Dependency Analysis (4 Phases)

| Phase | Document | Lines | Key Topic | Status |
|-------|----------|-------|-----------|--------|
| 1 | ATLAS7V_PHASE1_DEPENDENCIES.md | 243 | Evidence-based discovery | 🐲✨ Complete |
| 2 | ATLAS7V_PHASE2_STRUCTURE.md | 361 | Structure mapping | 🐲✨ Complete |
| 3 | ATLAS7V_PHASE3_DEPENDENCIES.md | 419 | Transitive closure | 🐲✨ Complete |
| 4 | ATLAS7V_PHASE4_CRITICAL_DEEP_DIVE.md | 1,104 | Critical subroutines | 🐲✨ Complete |
| **ATLAS7V Total** | | **2,127** | | |

### Combined Statistics

| Suite | Deep Dives | Lines | Synthesis Docs | Total |
|-------|------------|-------|----------------|-------|
| ATLAS12 | 7 | 6,703 | 1,547 (physics) | 8,250 |
| SYNTHE | 5 | 5,325 | 2,522 (physics + migration) | 7,847 |
| ATLAS7V | - | 2,127 | - | 2,127 |
| **TOTAL** | **12** | **14,155** | **4,069** | **18,224** |

**Note**: Risk ranks for ATLAS12 from ARCHITECTURE_INSIGHTS.md Section 6.7 (top 10 migration risks)

---

## Deep Dive Summaries

### 01: Voigt Profile Evaluation
**File**: `DEEP_DIVES/01_VOIGT_PROFILE.md` (628 lines)
**Code**: HVOIGT subroutine (atlas12.for:16173-16284)
**Risk**: Algorithm complexity, performance bottleneck

**Key Findings**:
- 4-regime piecewise algorithm (Humlicek-inspired but divergent)
- 13 undocumented magic constants
- Pretabulated H0TAB, H1TAB, H2TAB (200-point tables)
- Float32 acceptable (target ~2%, measured <1.5%)
- ~1 μs/call, millions of calls per iteration

**Migration Strategy**: Port as-is, validate against Fortran, create test suite with edge cases

**Open Questions**: Origin of magic constants, Humlicek citation inaccurate (algorithm differs)

**Cross-References**:
- Referenced by Deep Dive 03 (line opacity uses Voigt profiles)
- Referenced by Deep Dive 07 (CONVEC opacity iteration)

---

### 02: Saha-Boltzmann Populations
**File**: `DEEP_DIVES/02_POPULATIONS.md` (731 lines)
**Code**: POPS subroutine (atlas12.for:4143-4665)
**Risk**: Precision-critical, 40+ order of magnitude range

**Key Findings**:
- **Float64 REQUIRED** (no compromise) - ratios span 1e-42 to 1e+2
- Electron density iteration with 0.3 damping factor
- 2190-line partition function tables (PARTTAB)
- COMMON block /POPUL/ with 840 ionization levels
- Validated ARCHITECTURE_INSIGHTS.md struct design

**Migration Strategy**: Use Float64 throughout, preserve damping logic, extensive validation

**Open Questions**: Why 0.3 damping? Can we expose as parameter?

**Cross-References**:
- Referenced by Deep Dive 06 (TCORR depends on populations)
- Referenced by Deep Dive 07 (CONVEC calls POPS 4× for derivatives)
- Resolves Decision V.4 in ARCHITECTURE_INSIGHTS.md (precision)

---

### 03: Line Opacity Summation
**File**: `DEEP_DIVES/03_LINE_OPACITY_SUMMATION.md` (921 lines)
**Code**: XLINOP, LINOP1 subroutines (atlas12.for:15229+)
**Risk**: Precision (accumulation), performance (100K-500M lines)

**Key Findings**:
- Float32 accumulation adequate (error <0.01% typical)
- Early exit optimization critical: 600 GFLOP XLINOP, 3 PFLOP LINOP1
- No Kahan summation (simple accumulation)
- Recommend Float64 for Julia ("cheap insurance")

**Migration Strategy**: Three approaches (simple, optimized, SIMD), extensive profiling

**Open Questions**: TABCONT threshold tuning, parallelization opportunities

**Cross-References**:
- Uses Deep Dive 01 (Voigt profiles)
- Binary input from Deep Dive 04 (fort.12)

---

### 04: Binary I/O Formats
**File**: `DEEP_DIVES/04_BINARY_IO.md` (966 lines)
**Code**: Fort.12 writing (atlas12.for:9947+), Fort.11/21 reading
**Risk**: Format compatibility breaks validation

**Key Findings**:
- Fort.12: 16-byte IIIIIII records (4× INTEGER*4 equivalenced)
- Wavelength log-encoding: IWL = floor(log(λ)/RATIOLG)
- TABLOG compression: REAL → INTEGER*2 index lookup
- Compiler-specific: gfortran vs ifort, endianness
- FortranFiles.jl for validation, manual parsing for production

**Migration Strategy**: Bit-for-bit validation, extensive test suite, schema documentation

**Open Questions**: Platform-specific quirks, error handling for corrupted files

**Cross-References**:
- Used by Deep Dive 03 (line data input)
- Shared format with SYNTHE (future deep dives)

---

### 05: Radiative Transfer (JOSH)
**File**: `DEEP_DIVES/05_RADIATIVE_TRANSFER.md` (918 lines)
**Code**: JOSH subroutine (atlas12.for:10342-10609)
**Risk**: Algorithm complexity, pretabulated data

**Key Findings**:
- Feautrier-like RT method with 51×51 pretabulated COEFJ/COEFH matrices
- Fixed optical depth grid (XTAU8, 51 points τ=0 to τ=20)
- Gauss-Seidel iteration (51 iteration limit, arbitrary)
- MAP1 parabolic interpolation for grid remapping
- Mixed Float32/Float64: weights Float32, source functions Float64

**Migration Strategy**: Validate COEFJ/COEFH generation, expose iteration limits, unit tests

**Open Questions**: How were COEFJ/COEFH computed? Can we recompute for validation?

**Cross-References**:
- Called in main frequency loop (with opacity from Deep Dive 03)

---

### 06: Iteration Damping (TCORR)
**File**: `DEEP_DIVES/06_ITERATION_DAMPING.md** (1,117 lines)
**Code**: TCORR subroutine (atlas12.for:606-995)
**Risk**: Convergence stability

**Key Findings**:
- 6 damping mechanisms: optical depth (±τ/4), temperature (±T_eff/25), adaptive (1.25×/0.5×), smoothing, monotonicity, grid adjustment
- No early-exit convergence test (always runs NUMITS iterations)
- Adaptive: detects oscillation (0.5× damp) vs steady convergence (1.25× accelerate)
- Convection coupling: DTFLUX from Deep Dive 07

**Migration Strategy**: Expose diagnostics, optional early exit, preserve Fortran default

**Open Questions**: Why T_eff/25 and τ/4 specifically? Empirical tuning history?

**Cross-References**:
- Uses Deep Dive 07 (FLXCNV convective flux)
- Main iteration loop (called 3× per iteration: MODE=1,2,3)

---

### 07: Convective Energy Transport (CONVEC)
**File**: `DEEP_DIVES/07_CONVECTIVE_TRANSPORT.md` (1,178 lines)
**Code**: CONVEC subroutine (atlas12.for:4847-5090)
**Risk**: Physics complexity, numerical derivatives

**Key Findings**:
- Mixing length theory (MLT) implementation
- 4× POPS calls for ∂E/∂T, ∂ρ/∂T, ∂E/∂P, ∂ρ/∂P (finite differences ±0.1%)
- 30-iteration opacity convergence loop (self-consistent convective opacity)
- Mihalas optically-thin correction: τ_b²/(2+τ_b²)
- **Potential bug**: Overshooting factor 0.5D-5 (should be 0.5?)

**Migration Strategy**: Start with FD (match Fortran), migrate to AD for efficiency, validate thermodynamics

**Open Questions**: Overshooting factor typo? OVERWT typical values? Why 30 iterations?

**Cross-References**:
- Calls Deep Dive 02 (POPS) 4 times
- Output used by Deep Dive 06 (TCORR convection coupling)

---

<<<<<<< HEAD
### 08: SYNTHE SPECTRV - Spectrum Synthesis Kernel
**File**: `DEEP_DIVES/08_SYNTHE_SPECTRV.md` (1,205 lines)
**Code**: spectrv.for (main synthesis program)
**Focus**: Main computational kernel for synthetic spectrum generation

**Key Findings**:
- Wavelength-by-wavelength synthesis loop (outer loop)
- Interpolates continuum opacity from fort.10 (377 bins)
- Accumulates line opacities from fort.12 (millions of lines)
- Calls JOSH (radiative transfer) for emergent intensity
- Fort.9 fast mode: Pre-computed line opacities (~10× speedup)

**Migration Strategy**: Layer-based approach (utilities → I/O → opacity → RT integration)

**Open Questions**: Parabolic interpolation coefficients (C1, C2, C3 formula verification needed)

**Cross-References**:
- Uses Deep Dive 05 (JOSH radiative transfer)
- Uses Deep Dive 04 (Binary I/O for fort.10, fort.12)
- Uses Deep Dive 09 (Line list format)

---

### 09: SYNTHE Line Accumulation - Binary Line Merging
**File**: `DEEP_DIVES/09_SYNTHE_LINE_ACCUMULATION.md` (977 lines)
**Code**: synbeg.for (line list initialization and binary format)
**Focus**: Fort.12 binary line database format and accumulation

**Key Findings**:
- Fort.12 format: 7-field records (NBUFF, CONGF, NELION, ELO, GAMRF, GAMSF, GAMWF)
- NBUFF: Logarithmic wavelength encoding
- CONGF: Pre-multiplied line opacity constant (0.01502 factor)
- Lines appended sequentially (NOT sorted by wavelength)
- No format validation (no magic number or version tag)

**Migration Strategy**: Three-phase (schema design → readers/writers → validation)

**Open Questions**: Should Julia version add sorting? Add format validation header?

**Cross-References**:
- Used by Deep Dive 08 (spectrv reads fort.12)
- Similar format to Deep Dive 04 (ATLAS12 binary I/O)
- Populated by Deep Dive 12 (line reader programs)

---

### 10: SYNTHE xnfpelsyn - Atmosphere Preparation
**File**: `DEEP_DIVES/10_SYNTHE_XNFPELSYN.md` (1,004 lines)
**Code**: xnfpelsyn.for (atmosphere setup and continuum opacity pre-computation)
**Focus**: ATLAS7V library integration, population solver, opacity tables

**Key Findings**:
- Reads ATLAS12 converged model from fort.7
- Calls POPS (Saha-Boltzmann populations) - same as DD02
- Calls KAPP (continuum opacity dispatcher) with 20 IFOP flags
- Creates fort.10: Pre-computed continuum opacity table (377 wavelength bins × N depths)
- Heavy ATLAS7V dependency: READIN, POPS, KAPP, ~50 COMMON blocks

**Migration Strategy**: ATLAS7V library migration is critical path (12-13 weeks estimated)

**Open Questions**: H₂ equilibrium formula validation (polynomial approximation lacks citation)

**Cross-References**:
- Uses Deep Dive 02 (POPS populations solver)
- Requires ATLAS7V library (see Atlas7v Phase 4 analysis)
- Output consumed by Deep Dive 08 (spectrv reads fort.10)

---

### 11: SYNTHE Broadening - Rotation & Instrumental Profiles
**File**: `DEEP_DIVES/11_SYNTHE_BROADENING.md` (760 lines)
**Code**: rotate.for, broaden.for (post-processing convolution kernels)
**Focus**: Rotational and instrumental broadening of synthetic spectra

**Key Findings**:
- **rotate.for**: Rotational broadening with limb darkening
  - 17-point numerical integration over stellar disk
  - Limb darkening: I(μ) = I(1)[1 - ε + ε·μ]
  - v sin i parameter controls rotation speed
- **broaden.for**: Instrumental profile convolution
  - Gaussian broadening (FWHM → σ conversion)
  - Sinc function for rectangular slit
  - Macroturbulence profiles
  - **Potential issue**: 0.8325546 × 2 constant (should be 2.3548?)

**Migration Strategy**: Port convolution kernels, validate limb darkening, cross-check constants

**Open Questions**: Gaussian broadening constant discrepancy - verify against test spectra

**Cross-References**:
- Operates on output from Deep Dive 08 (spectrv emergent spectrum)

---

### 12: SYNTHE Line Readers - Line List Pipeline
**File**: `DEEP_DIVES/12_SYNTHE_LINE_READERS.md` (1,379 lines)
**Code**: rgfalllinesnew.for, rmolecasc.for, rschwenk.for, rh2ofast.for, rpredict.for
**Focus**: Line list preparation from multiple heterogeneous sources

**Key Findings**:
- **rgfalllinesnew**: Kurucz gfall atomic lines
  - Complex damping width calculations (Unsöld, Barklem, Cowley formulas)
  - ~100 lines of special-case damping logic
  - Wavelength filtering and isotope selection
- **rmolecasc**: Molecular lines (ASCII format)
- **rschwenk**: TiO Schwenke lines (binary format)
- **rh2ofast**: H₂O Partridge-Schwenke (binary, 65.9M lines hardcoded)
- **rpredict**: Kurucz predicted lines (weaker lines, lower priority)
- All append to fort.12 (shared binary format from DD09)

**Migration Strategy**: Migrate readers in parallel (independent), defer complex damping initially

**Open Questions**: NELION3 mapping (requires ATLAS7V IONPOTS subroutine extraction)

**Cross-References**:
- Populates Deep Dive 09 (fort.12 binary format)
- Requires damping formulas (shared with Deep Dive 03)

---

## Atlas7v Dependency Analysis Summary

**Documents**: ATLAS7V_PHASE1-4_*.md (4 phases, 2,127 lines total)

**Phase 1: Evidence-Based Discovery** (243 lines)
- Grepped all 11 SYNTHE programs for CALL statements
- Found only 3/11 programs call atlas7v subroutines (xnfpelsyn, spectrv, rotate, synthe)
- 7 programs self-contained (synbeg, rgfalllinesnew, rmolecasc, rschwenk, rh2ofast, rpredict, broaden)
- Identified 13 unique dependencies (7 in atlas7v, 6 in SYNTHE programs)

**Phase 2: Structure Survey** (361 lines)
- Mapped all 72 subroutines in atlas7v.for (17,336 lines total)
- Located 7 SYNTHE-needed subroutines: POPS, KAPP, READIN, JOSH, W, MAP1, PARCOE
- Discovered PFIRON monster: 6,037 lines (35% of atlas7v) - partition function tables

**Phase 3: Transitive Dependency Analysis** (419 lines)
- 7 direct dependencies → 32 total subroutines (~10,500 lines, 61% of atlas7v)
- Level 0 (Direct): 7 subs, 1,433 lines
- Level 1 (Indirect): 24 subs, ~2,900 lines (PFSAHA + 20 opacity subs + utilities)
- Level 2 (Deep): 1 sub, 6,037 lines (PFIRON)
- KAPP dispatcher calls 20 opacity subroutines conditionally (IFOP flags)

**Phase 4: Critical Subroutines Deep Dive** (1,104 lines)
- **POPS** (101 lines): Simple dispatcher, calls PFSAHA for Saha-Boltzmann solver
- **KAPP** (118 lines): Opacity dispatcher with 20 IFOP flags (HOP, HMINOP, HE1OP, etc.)
- **JOSH** (239 lines): Feautrier radiative transfer solver, 51-point optical depth grid
- **READIN** (870 lines): Keyword-based atmosphere parser (MIAC encoding), DECK6 format
- Documented ~50 COMMON blocks, 400 arrays
- Migration estimate: 12-13 weeks for Tier 1 (excluding PFIRON)

**Key Insight**: ATLAS7V library is the critical path for both ATLAS12 and SYNTHE migrations. Should be developed as separate Julia module with comprehensive unit tests.

**Cross-References**:
- POPS/KAPP/JOSH used by Deep Dive 10 (xnfpelsyn)
- JOSH used by Deep Dive 08 (spectrv)
- POPS algorithm same as Deep Dive 02 (ATLAS12 populations)
- Binary I/O patterns similar to Deep Dive 04
=======
### 08: SYNTHE SPECTRV (Spectrum Synthesis)
**File**: `DEEP_DIVES/08_SYNTHE_SPECTRV.md` (1,205 lines)
**Code**: spectrv.f (438 lines main program + ATLAS7V library)
**Priority**: Critical (main computational kernel)

**Key Findings**:
- Wavelength loop with line opacity accumulation (similar to ATLAS12 DD03)
- Uses JOSH (radiative transfer - see DD05) for each wavelength
- Binary input: fort.10 (continuum), fort.12 (lines), fort.7 (atmosphere)
- Fast mode: fort.9 (pre-computed line opacities, ~10× speedup)
- Mixed precision: Float32 for opacities, Float64 for populations

**Migration Strategy**: Modular design with pluggable RT solver, validate against Fortran output, optimize wavelength loop

**Open Questions**: ATLAS7V library dependencies, parallelization opportunities

**Cross-References**:
- Uses DD05 (JOSH radiative transfer solver)
- Uses DD02 (populations from xnfpelsyn)
- Input from DD09 (fort.12 line list)

---

### 09: SYNTHE Line Accumulation (synbeg + Binary format)
**File**: `DEEP_DIVES/09_SYNTHE_LINE_ACCUMULATION.md` (977 lines)
**Code**: synbeg.f (133 lines)
**Priority**: High (creates pipeline infrastructure)

**Key Findings**:
- Initializes fort.12, fort.14, fort.93 (shared pipeline state)
- Sets wavelength range, resolution, line selection criteria
- Sequential dependency: synbeg → line readers → spectrv
- Binary format matches ATLAS12 fort.12 (see DD04)

**Migration Strategy**: Julia struct for pipeline configuration, clean initialization API

**Open Questions**: Wavelength grid optimization, memory-efficient line storage

**Cross-References**:
- Binary format from DD04 (fort.12 IIIIIII records)
- Feeds DD08 (spectrv), DD10 (xnfpelsyn)
- Uses DD12 (line readers append to fort.12)

---

### 10: SYNTHE XNFPELSYN (Population Preparation)
**File**: `DEEP_DIVES/10_SYNTHE_XNFPELSYN.md` (1,004 lines)
**Code**: xnfpelsyn.f (317 lines + ATLAS7V library)
**Priority**: High (sets up initial state)

**Key Findings**:
- Reads ATLAS12 atmosphere model (fort.7)
- Calls POPS (see DD02) for populations
- Calls KAPP for continuum opacities (25+ sources)
- Creates fort.10: continuum opacity table (377 wavelength bins × depths)
- ATLAS7V library shared with ATLAS12 (POPS, KAPP, READIN)

**Migration Strategy**: Reuse ATLAS12 POPS/KAPP implementations, validate opacity interpolation

**Open Questions**: ATLAS7V exact interface, fort.10 wavelength grid generation

**Cross-References**:
- Uses DD02 (POPS populations - same code as ATLAS12)
- Produces input for DD08 (spectrv)
- Depends on DD09 (fort.93 configuration)

---

### 11: SYNTHE Broadening (rotate, broaden, smooth)
**File**: `DEEP_DIVES/11_SYNTHE_BROADENING.md` (760 lines)
**Code**: rotate.f (360 lines), broaden.f (221 lines)
**Priority**: Medium (post-processing)

**Key Findings**:
- Rotation: v sin i with Gray limb darkening (linear + quadratic coefficients)
- Instrumental: Gaussian, sinc, or macroturbulence convolution
- Direct convolution (no FFT - spectra are small ~few thousand points)
- Can chain: rotation → instrumental → smoothing

**Migration Strategy**: Use Julia convolution libraries (DSP.jl), validate limb darkening

**Open Questions**: FFT for large spectra, limb darkening coefficient sources

**Cross-References**:
- Post-processes DD08 output (fort.5 spectrum)
- Standalone (no dependencies on other deep dives)

---

### 12: SYNTHE Line Readers (rgfalllinesnew, rmolecasc, etc.)
**File**: `DEEP_DIVES/12_SYNTHE_LINE_READERS.md` (1,379 lines)
**Code**: 5 reader programs (648+570+223+191+451 lines)
**Priority**: High (data ingestion)

**Key Findings**:
- 5 heterogeneous input formats (atomic, molecular, binary databases)
- Wavelength filtering (λ_min, λ_max from fort.93)
- Damping parameter calculations (radiative, Stark, van der Waals)
- Element/ion encoding (NELION3 for atomics, special for molecules)
- Appends to fort.12 (sequential, not parallel - file locking issues)

**Migration Strategy**: Unified LineList type, parallel readers with merging, validation parsers

**Open Questions**: Format documentation completeness, error handling for corrupted data

**Cross-References**:
- Appends to DD09 (fort.12 line database)
- Uses DD04 binary format for some inputs
- Feeds DD08 (spectrv line opacity calculations)
>>>>>>> origin/claude/phase-3-archaeology-011CUwQjaQw6prCQbWCg27nc

---

## Thematic Organization

### Precision Analysis Deep Dives
1. **02 - Populations**: Float64 REQUIRED (40+ order magnitude range)
2. **01 - Voigt**: Float32 acceptable (~2% target accuracy)
3. **03 - Line Opacity**: Float32 adequate, Float64 recommended
4. **05 - JOSH/RT**: Mixed precision (weights Float32, sources Float64)

**Summary**: Migration should use Float64 for populations/opacities, can use Float32 for Voigt profiles and pretabulated data.

---

### Performance-Critical Deep Dives
1. **03 - Line Opacity**: 600 GFLOP (XLINOP), 3 PFLOP (LINOP1) - early exit critical
2. **01 - Voigt**: ~1 μs/call, millions of calls → vectorization opportunity
3. **05 - JOSH/RT**: 51-iteration Gauss-Seidel → parallelizable?
4. **07 - CONVEC**: 4× POPS + 30× opacity → expensive, AD could help

**Summary**: Line opacity and Voigt profiles are main performance targets. Early optimization focus.

---

### I/O and Format Deep Dives
1. **04 - Binary I/O**: Fort.12 (IIIIIII), Fort.11/21 (direct-access)
2. **06 - TCORR**: Fort.7 output (model deck)
3. **07 - CONVEC**: No direct I/O (uses in-memory state)

**Summary**: Binary I/O is critical validation dependency. Break it → break everything.

---

### Physics Method Deep Dives
1. **02 - Populations**: Saha-Boltzmann (ionization equilibrium)
2. **05 - JOSH/RT**: Feautrier-like radiative transfer
3. **07 - CONVEC**: Mixing length theory (convection)
4. **06 - TCORR**: Avrett-Krook temperature correction

**Summary**: All standard astrophysics methods, but implementations have subtle tuning/quirks.

---

## Migration Dependency Graph

```
┌─────────────┐
│ 04: Binary  │◄────────────────┐
│    I/O      │                 │
└──────┬──────┘                 │
       │                        │
       │ (reads fort.12)        │ (writes fort.12)
       │                        │
       ▼                        │
┌─────────────┐          ┌─────┴──────┐
│ 02: Popula- │◄─────────┤ ATLAS12    │
│    tions    │          │ Stage 1    │
└──────┬──────┘          └────────────┘
       │                        ▲
       │ (called by)            │ (creates)
       │                        │
       ▼                        │
┌─────────────┐                 │
│ 07: CONVEC  │─────────────────┘
└──────┬──────┘  (computes FLXCNV)
       │
       │ (feeds into)
       │
       ▼
┌─────────────┐
│ 06: TCORR   │
│  (damping)  │
└──────┬──────┘
       │
       │ (uses)
       │
       ▼
┌─────────────┐          ┌─────────────┐
│ 05: JOSH    │◄─────────┤ 03: Line    │
│    (RT)     │          │   Opacity   │
└─────────────┘          └──────┬──────┘
       ▲                        │
       │                        │
       └────────────────────────┘
              (uses 01: Voigt)
```

**Migration Order Recommendation**:
1. **04 - Binary I/O** (no dependencies, needed for validation)
2. **02 - Populations** (depends on I/O for testing)
3. **01 - Voigt Profiles** (standalone, needed by line opacity)
4. **03 - Line Opacity** (depends on Voigt, binary I/O)
5. **07 - CONVEC** (depends on populations)
6. **05 - JOSH/RT** (depends on line opacity)
7. **06 - TCORR** (depends on convection, RT, everything)

---

## Testing Strategy Summary

### Unit Tests (from all deep dives)
- **Voigt (DD01)**: Edge cases (ν→0, ν→∞, extreme damping)
- **Populations (DD02)**: Saha equation validation, partition function interpolation
- **Line Opacity (DD03)**: Accumulation accuracy, early exit correctness
- **Binary I/O (DD04)**: Round-trip write/read, cross-platform compatibility
- **JOSH (DD05)**: Diagonal operator convergence, optical depth grid consistency
- **TCORR (DD06)**: Adaptive damping logic, limiting correctness
- **CONVEC (DD07)**: Thermodynamic derivative accuracy, adiabatic gradient

### Integration Tests
- **Solar model convergence** (uses all components)
- **Hot star (no convection)** (tests radiative-only path)
- **Cool star (strong convection)** (tests convection path)
- **Extreme metallicity** ([Fe/H] = ±3.0)

### Physics Validation Tests
- **Flux conservation**: ∫F_ν dν = σT_eff⁴
- **Hydrostatic equilibrium**: dP/dz = ρg
- **Population ratios**: Match Saha equation
- **Optical depth monotonic**: dτ/dz > 0

### Regression Tests
- **Fortran comparison**: Iteration-by-iteration T(τ), flux error
- **Cross-validation**: Castelli vs Kurucz vs Julia

---

## Open Questions Summary

### For Domain Expert (Paula)

**High Priority**:
1. **DD07-Q1**: Is overshooting factor 0.5D-5 a typo? (Should be 0.5?)
2. **DD06-Q1**: Why τ/4 and T_eff/25 specifically for damping limits?
3. **DD02-Q1**: Why 0.3 damping in electron density iteration?

**Medium Priority**:
4. **DD01-Q1**: Origin of 13 magic constants in Voigt algorithm?
5. **DD05-Q4**: How were COEFJ/COEFH matrices computed originally?
6. **DD07-Q2**: Typical OVERWT values for overshooting?

**Low Priority**:
7. **DD03-Q1**: TABCONT threshold tuning guidance?
8. **DD04-Q3**: Platform-specific binary format quirks?
9. **DD06-Q9**: Alternative temperature correction methods to try?

### For Code Validation

**Critical**:
1. **DD04-Q5**: How often do files have platform-specific issues?
2. **DD05-Q6**: Do we need to regenerate COEFJ/COEFH or trust tables?
3. **DD07-Q5**: Finite difference accuracy sufficient or use Richardson?

**Important**:
4. **DD02-Q6**: How often does POPS fail to converge?
5. **DD06-Q7**: How often do models fail to converge in NUMITS?
6. **DD03-Q3**: Can we parallelize line opacity summation?

### For Migration Decisions

**Architecture**:
1. **DD01-Q8**: Port Voigt as-is or use library (e.g., Voigt.jl)?
2. **DD02-Q8**: Expose damping parameters or keep fixed?
3. **DD07-Q8**: Implement AD for derivatives or stick with FD?

**Performance**:
4. **DD03-Q5**: GPU acceleration for line opacity?
5. **DD05-Q9**: Parallelize JOSH iteration?
6. **DD06-Q8**: Support restart from iteration N?

---

## Key Takeaways (All Deep Dives)

### Precision
1. **Populations must be Float64** - non-negotiable (DD02)
2. **Voigt can be Float32** - 2% target accuracy (DD01)
3. **Line opacity**: Float32 adequate, Float64 recommended (DD03)
4. **Mixed precision patterns**: Weights Float32, critical quantities Float64 (DD05)

### Performance
5. **Early exit optimization is critical** - 500× speedup for line opacity (DD03)
6. **Voigt profiles are hot path** - millions of calls, vectorize (DD01)
7. **Numerical derivatives are expensive** - 4× POPS, consider AD (DD07)

### Numerical Stability
8. **TCORR has 6 damping mechanisms** - all empirically tuned (DD06)
9. **No early-exit convergence** - always runs NUMITS iterations (DD06)
10. **Adaptive damping is clever** - auto-responds to oscillation (DD06)

### I/O and Validation
11. **Binary I/O is fragile** - compiler-specific, breaks validation (DD04)
12. **Fortran comparison is essential** - iteration-by-iteration (all)
13. **Cross-validation strategy** - Castelli vs Kurucz vs Julia (all)

### Migration Strategy
14. **Start with FD, migrate to AD** - validate first, optimize later (DD07)
15. **Expose tuning parameters** - MIXLTH, OVERWT, iteration limits (DD06, DD07)
16. **Preserve Fortran quirks initially** - validate exact behavior first (all)
17. **Julia opportunities**: Vectorization, AD, better diagnostics (all)

---

## Statistics

<<<<<<< HEAD
### ATLAS12 Deep Dives (01-07)
**Analysis time**: ~9 hours (7 deep dives × 60-90 min each)
**Documentation**: 6,459 lines across 7 files
**Average per dive**: 923 lines, 77 minutes
**Code coverage**: All critical ATLAS12 computational kernels
**Fortran analyzed**: ~5,000 lines

### SYNTHE Deep Dives (08-12)
**Analysis time**: ~8 hours (5 deep dives × 60-120 min each)
**Documentation**: 5,325 lines across 5 files
**Average per dive**: 1,065 lines, 96 minutes
**Code coverage**: Complete SYNTHE synthesis pipeline
**Fortran analyzed**: ~3,200 lines

### Atlas7v Dependency Analysis (Phases 1-4)
**Analysis time**: ~6 hours (4 phases × 60-120 min each)
**Documentation**: 2,127 lines across 4 files
**Average per phase**: 532 lines, 90 minutes
**Code coverage**: 32 critical atlas7v subroutines mapped
**Fortran analyzed**: ~10,500 lines (61% of atlas7v.for)

### Combined Totals
**Total analysis time**: ~23 hours over 3 days
**Total documentation**: 13,911 lines across 16 documents
**Total Fortran analyzed**: ~18,700 lines (ATLAS12: 5K, SYNTHE: 3.2K, Atlas7v: 10.5K)
**Cross-references**: 30+ links between documents
**Open questions**: 40+ flagged for validation and domain expert review
**Migration strategies**: 35+ distinct approaches documented
**Test cases**: 60+ tests proposed

---

## Phase 2B Completion Summary

### Completed Work ✓
- [x] ATLAS12 deep dives (01-07) - All critical computational kernels documented
- [x] SYNTHE deep dives (08-12) - Complete synthesis pipeline documented
- [x] SYNTHE Deep Dive Summary - Migration roadmap with timeline estimates
- [x] Atlas7v dependency analysis (Phases 1-4) - Critical path identified
- [x] Cross-code analysis - Shared components between ATLAS12/SYNTHE documented
- [x] Deep Dive Index updated - Complete reference with cross-links

### Key Deliverables
1. **12 Deep Dive Documents** (13,911 lines) - Detailed computational kernel analysis
2. **SYNTHE Summary** (916 lines) - 20-32 week migration roadmap
3. **Atlas7v Analysis** (2,127 lines) - 32 subroutines mapped, 12-13 week migration estimate
4. **Updated Index** - Complete cross-referenced catalog

### Critical Findings
1. **ATLAS7V is the critical path** - 17K-line shared library needed by both ATLAS12 and SYNTHE
2. **Precision requirements identified** - Float64 for populations, Float32 for Voigt/profiles
3. **Binary I/O is fragile** - Platform-specific format requires careful validation
4. **Performance hotspots mapped** - Line opacity and Voigt profiles are main targets
5. **Migration dependencies** - 5-layer dependency graph with 20-32 week timeline
=======
**Total analysis time**: ~18 hours (12 deep dives × 60-120 min each)
**Total documentation**: 12,028 lines across 12 deep dives
**Average deep dive**: 1,002 lines, 90 minutes
**Code coverage**: All critical ATLAS12 computational kernels analyzed
**Cross-references**: 15+ links between deep dives
**Open questions**: 27 flagged (9 high priority)
**Migration strategies**: 21 distinct approaches documented
**Test cases**: 40+ tests proposed across all deep dives
>>>>>>> origin/claude/phase-3-archaeology-011CUwQjaQw6prCQbWCg27nc

---

## Next Steps

<<<<<<< HEAD
### Implementation Planning (Ready to Start)
- [ ] Review Phase 2B documentation with stakeholders
- [ ] Finalize resource allocation (team size, timeline)
- [ ] Set up Julia package structure (Project.toml, src/, test/)
- [ ] Begin Phase 1: Foundation utilities (wavelength, binary I/O, Voigt profiles)

### Validation Preparation
- [ ] Generate Fortran reference outputs for all test cases
- [ ] Extract ATLAS7V as standalone Fortran library for testing
- [ ] Create cross-platform binary I/O test suite
- [ ] Set up CI/CD pipeline for regression testing

### Domain Expert Consultation
- [ ] Review 40+ open questions with astrophysics expert
- [ ] Verify undocumented constants and formulas
- [ ] Validate migration strategy and testing approach
- [ ] Discuss deferred features (PFIRON, complex damping, etc.)

### Future Archaeology (If Needed)
- [ ] ATLAS12 remaining subroutines (beyond deep dive coverage)
- [ ] SYNTHE dfsynthe (fort.9 fast mode generation)
- [ ] ODF (Opacity Distribution Functions) suite
- [ ] WIDTH (line width calculations) suite

---

**Document Status**: Complete - Phase 2B archaeology finished
**Last Updated**: 2025-11-09
**Maintained By**: Claude (Session: claude/hello-clau-011CUwQ8UG89mNYn9L5NQ1WU)
**Next Phase**: Implementation Planning (Phase 3)
=======
### Completed ✅
- [x] House cleaning: Add cross-references to deep dive documents
- [x] Update ARCHITECTURE_INSIGHTS.md with all deep dive findings
- [x] SYNTHE deep dives (5 documents completed: DD08-DD12)
- [x] SYNTHE migration roadmap (SYNTHE_DEEP_DIVE_SUMMARY.md)
- [x] Phase 3: PHYSICS_PIPELINE_ATLAS12.md synthesis document (1,547 lines)
- [x] Phase 3 extension: PHYSICS_PIPELINE_SYNTHE.md physics document (1,607 lines)

### Near-Term (Phase 4)
- [ ] Migration complexity assessment
- [ ] COMMON block usage mapping (critical for migration)
- [ ] Cross-code shared component analysis (ATLAS7V library)
- [ ] Migration critical path document

### Future Work
- [ ] Generate Fortran reference outputs for validation
- [ ] Answer open questions with Paula (~27 flagged across all deep dives)
- [ ] Begin Julia package architecture design
- [ ] Start test suite development
- [ ] API usage projection for research credit application

---

**Document Status**: Complete (all planned deep dives finished)
**Last Updated**: 2025-11-09
**Maintained By**: Claude (Phase 2B-3 archaeology sessions)
>>>>>>> origin/claude/phase-3-archaeology-011CUwQjaQw6prCQbWCg27nc
