# Deep Dive Index
*ATLAS12 Computational Kernel Analysis - Complete Reference*

**Mission**: Phase 2B Code Archaeology
**Status**: 7 of 7 ATLAS12 deep dives complete (100%)
**Total Documentation**: ~7,900 lines across 7 documents
**Date Range**: 2025-11-07 to 2025-11-08
**Branch**: claude/phase-2b-documentation-architecture-011CUtZTwX29Tt1LCdtuf9pf

**Phase 3 Synthesis**: See `PHYSICS_PIPELINE_ATLAS12.md` (1,548 lines) for physics context integrating all 7 deep dives into one complete ATLAS12 iteration pipeline

---

## Quick Reference Table

| # | Title | Risk Rank | Lines | Key Topic | Status |
|---|-------|-----------|-------|-----------|--------|
| 01 | Voigt Profile | #2 | 628 | Algorithm, Performance | 🐲✨ Complete |
| 02 | Populations | #1 | 731 | Precision, Overflow | 🐲✨ Complete |
| 03 | Line Opacity | #3 | 921 | Precision, Performance | 🐲✨ Complete |
| 04 | Binary I/O | #4 | 966 | Format Compatibility | 🐲✨ Complete |
| 05 | Radiative Transfer | #6 | 918 | Algorithm, Precision | 🐲✨ Complete |
| 06 | Iteration Damping | #5 | 1,117 | Convergence | 🐲✨ Complete |
| 07 | Convective Transport | N/A | 1,178 | Physics, Numerics | 🐲✨ Complete |
| **Total** | | | **6,459** | | |

**Note**: Risk ranks from ARCHITECTURE_INSIGHTS.md Section 6.7 (top 10 migration risks)

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

**Total analysis time**: ~9 hours (7 deep dives × 60-90 min each)
**Total documentation**: 6,459 lines across 7 files
**Average deep dive**: 923 lines, 77 minutes
**Code coverage**: All critical ATLAS12 computational kernels analyzed
**Cross-references**: 15+ links between deep dives
**Open questions**: 27 flagged (9 high priority)
**Migration strategies**: 21 distinct approaches documented
**Test cases**: 40+ tests proposed across all deep dives

---

## Next Steps

### Immediate (This Session)
- [ ] House cleaning: Add cross-references to deep dive documents
- [ ] Update ARCHITECTURE_INSIGHTS.md with all deep dive findings
- [ ] Commit all updates

### Near-Term (Next Session)
- [ ] SYNTHE deep dives (5-7 documents expected)
- [ ] Cross-code analysis (ATLAS12 vs SYNTHE shared components)
- [ ] Migration critical path document

### Future Work
- [ ] Generate Fortran reference outputs for validation
- [ ] Answer open questions with Paula
- [ ] Begin Julia package architecture design
- [ ] Start test suite development

---

**Document Status**: Living index - update as new deep dives added
**Last Updated**: 2025-11-08
**Maintained By**: Claude (Phase 2B archaeology sessions)
