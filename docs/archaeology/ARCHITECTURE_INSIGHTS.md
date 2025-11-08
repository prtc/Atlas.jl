# ATLAS Suite Architecture Insights for Julia Migration
*Phase 2B - Extracting Computational Intent from Implementation Details*

**Created**: 2025-11-09
**Purpose**: Guide architectural decisions for Julia migration
**Key Insight**: Direct Fortran → Julia translation won't work. The COMMON block spaghetti and implicit state dependencies require re-architecture.

---

## Executive Summary

This document bridges "what the Fortran does" to "how to design clean Julia." Unlike ARCHITECTURE_DETAILS.md (which catalogs the existing structure), this focuses on **implications for redesign**.

**Critical realization**: The ATLAS Suite's architecture is a product of Fortran 77 constraints (no modules, no dynamic memory, fixed array sizes). Julia migration is an opportunity to extract the computational science from these implementation artifacts.

**Core challenge**: 57 COMMON blocks in ATLAS12 create implicit dependencies that make it impossible to reason about data flow. Julia migration must make these dependencies explicit.

---

## I. Critical Architectural Challenges

These are fundamental problems that make direct translation impossible or inadvisable:

### 1.1 Global State Chaos (COMMON Blocks)

**The Problem**:
ATLAS12 has 57 COMMON blocks containing ~100 arrays totaling 40MB of global mutable state. Every subroutine can (potentially) read or modify any of these arrays.

**Example from ATLAS12**:
```fortran
COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw),CHARGESQ(kw)
COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),HCKT(kw),TLOG(kw),ITEMP
COMMON /XNF/XNF(kw,mion),XNFP(kw,mion),XNH2(kw)
```

Every one of ATLAS12's 80 subroutines declares some subset of these COMMON blocks. Without reading every line of every subroutine, you cannot know:
- Which subroutines READ which data
- Which subroutines WRITE which data
- What order subroutines must be called
- What state must be initialized before calling a subroutine

**Consequence**:
- Cannot parallelize (shared mutable state)
- Cannot test subroutines in isolation (implicit dependencies)
- Cannot reason about correctness (hidden data flow)
- Cannot refactor safely (breaking unknown dependencies)

**Julia Solution Options**:
1. **Struct-based state**: Bundle related data into immutable/mutable structs, pass explicitly
2. **Module-level constants**: True constants (physical constants, element data) in module scope
3. **Dependency injection**: Pass state objects to functions that need them

**Migration Strategy**:
⚠️ **CRITICAL**: Before translating any subroutine, we must map COMMON block usage:
- Which blocks are read-only vs read-write?
- Which blocks are initialized once vs updated every iteration?
- What's the dependency tree? (e.g., XNF depends on STATE which depends on TEMP)

**Estimated effort**: 2-3 weeks of analysis before writing Julia code

---

### 1.2 Implicit Dependencies and Execution Order

**The Problem**:
Fortran subroutines communicate via side effects (modifying COMMON blocks), not explicit parameters.

**Example from ATLAS12 main loop** (ARCHITECTURE_DETAILS.md, lines 219-397):
```fortran
CALL POPS(0.D0,1,XNE)        ! Modifies /XNF/ and /XNFP/ via COMMON
CALL POPSALL                  ! Reads /XNF/, modifies it further
... ! Later
CALL KAPCONT                  ! Reads /XNFP/, modifies /TABCONT/
CALL LINOP1                   ! Reads /TABCONT/, /XNFDOP/, modifies /XLINES/
```

If you call these out of order, or skip one, the program fails silently (wrong answers, not crashes).

**Worse**: The dependencies are not documented. You must trace through every CALL statement and COMMON block usage to build the dependency graph.

**Consequence**:
- Fragile code (easy to break)
- Hard to understand (what does this subroutine actually do?)
- Cannot reuse subroutines (they expect specific global state)

**Julia Solution**:
Make dependencies explicit through function signatures:
```julia
# Instead of side-effect-based flow:
function pops!(state::AtmosphereState, abundances::Abundances)
    # Updates state.xnf, state.xnfp in-place
    # Returns nothing (or returns updated state for immutable version)
end

function kapcont(state::AtmosphereState, frequencies::FrequencyGrid) ::ContinuumOpacity
    # Pure function: doesn't modify state, returns new data
end

# Explicit dependency chain:
state = initialize_atmosphere(params)
pops!(state, abundances)
popsall!(state)
continuum = kapcont(state, frequencies)
line_opacity = linop1(state, continuum, selected_lines)
```

**Benefit**: Dependencies are visible in the function signature. Can't call out of order.

---

### 1.3 Fort.X File-Based Communication (SYNTHE Pipeline)

**The Problem**:
SYNTHE consists of 11 separate programs that communicate by reading/writing fort.X files:
- Program 1 writes fort.10 (atmosphere data)
- Program 2 writes fort.12 header + fort.14 (control params)
- Programs 3-7 append to fort.12 (line lists)
- Program 8 reads fort.10, fort.12, fort.14 → writes fort.16 (opacities)
- Program 9 reads fort.16 → writes fort.7 (spectrum)
- Etc.

**Consequences**:
- Massive I/O overhead (GB of data written to disk between steps)
- Brittle (if one program crashes, partial files corrupt the pipeline)
- Hard to debug (intermediate files are binary, unreadable)
- Cannot run in parallel (sequential file dependencies)
- Platform-dependent (Fortran UNFORMATTED I/O is not portable)

**Example from WORKFLOW_ANALYSIS.md**:
Line readers (rgfalllinesnew, rmolecasc, rschwenk, rh2ofast) all append to fort.12 sequentially. If rschwenk crashes, fort.12 is corrupted and you must restart the entire pipeline from synbeg.

**Julia Solution Options**:

**Option A - Unified Pipeline** (Paula's preference per WORKFLOW_ANALYSIS.md Q4):
```julia
spectrum = synthe_pipeline(
    atmosphere_model,
    line_lists,
    wavelength_range,
    resolution
)
```
All data stays in memory. Fort.X files become internal data structures.

**Option B - Modular Pipeline with Clean I/O**:
```julia
# Save/load with portable formats (HDF5, Arrow)
atm_data = process_atmosphere(model)
save("atmosphere.h5", atm_data)

lines = accumulate_lines(line_lists, wavelength_range)
save("lines.arrow", lines)

opacities = calculate_opacities("atmosphere.h5", "lines.arrow")
save("opacities.h5", opacities)
```
Each step can be run independently, outputs are portable and inspectable.

**Option C - Hybrid**:
Unified pipeline for production (fast), modular for debugging (inspectable).

**Decision needed**: Paula must choose based on:
- Typical workflow (run full pipeline or step-by-step?)
- Debugging needs (inspect intermediate data?)
- Performance requirements (memory vs disk I/O)

---

### 1.4 Mixed Precision and Numerical Stability

**The Problem**:
ATLAS codes mix REAL*4 (single precision) and REAL*8 (double precision) inconsistently.

**From VERSION_COMPARISON.md**:
- Castelli uses DFLOAT() and D exponents → double precision literals
- Kurucz uses FLOAT() and E exponents → single precision literals
- But final variables are REAL*8 in both (implicit conversion)

**Example from ATLAS12**:
```fortran
REAL*8 DOPPLE(kw,mion)        ! Double precision array
REAL*4 XNFDOP(kw,mion)        ! Single precision array (why?)
REAL*4 TABCONT(kw,344)        ! Single precision table
REAL*4 XLINES(kw,30000)       ! Single precision line opacity

dopple8=dopple(j,nelion)       ! Temp variable to preserve precision
XNFDOP(J,NELION)=XNFP(J,NELION)/DOPPLE8/RHO(J)  ! Mixed precision math
```

**Questions**:
- Is single precision for large arrays (XLINES) a memory optimization?
- Does precision loss in XLINES affect final spectrum accuracy?
- Are there numerical stability issues we need to preserve?

**Consequence**: Cannot blindly use Float64 everywhere in Julia. Need to understand:
- Which calculations are precision-sensitive?
- Where is precision loss acceptable for memory savings?
- Are there accumulated rounding errors we must match?

**Julia Approach**:
1. **Analyze first**: Run tests comparing Float32 vs Float64 for each calculation
2. **Parameterize**: Use type parameters for flexibility
   ```julia
   struct AtmosphereState{T<:AbstractFloat}
       temperature::Vector{T}
       pressure::Vector{T}
       # ...
   end
   ```
3. **Default to Float64**: Only use Float32 where proven safe and necessary

**Migration risk**: ⚠️ If we change precision, we may get subtly different results that are hard to debug.

---

### 1.5 Undocumented Algorithms and "Magic Numbers"

**The Problem**:
Many algorithms are poorly documented, with unexplained constants and thresholds.

**Examples from ARCHITECTURE_DETAILS.md**:

**ATLAS12 frequency range selection** (lines 196-199):
```fortran
NUCI=11601
NULYMAN=9599
NUHEI=7027
NUHEII=3577
NUSTART=1
IF(TEFF.LT.30000.)NUSTART=NUHEII
IF(TEFF.LT.13000.)NUSTART=NUHEI
IF(TEFF.LT.7250.)NUSTART=NULYMAN
IF(TEFF.LT.4500.)NUSTART=NUCI
```
What do 11601, 9599, 7027, 3577 represent? Wavelength indices? Why those specific Teff thresholds?

**SYNTHE cutoff parameter**:
```
CUTOFF=0.001    # Ignore lines <0.1% of continuum
```
Is 0.001 optimal? Tested? Rule of thumb?

**ATLAS12 convection parameter**:
```
CONVECTION OVER 1.25 0 36
```
α=1.25 is mixing-length parameter. What are 0 and 36?

**Consequence**:
- Cannot validate without understanding physical meaning
- Risk breaking subtle numerical behaviors
- May need to preserve "wrong" code if it's been empirically calibrated

**Migration Strategy**:
1. **Document as-is**: Preserve exact values in Julia, mark with ⚠️ EMPIRICAL
2. **Test sensitivity**: Vary parameters to understand impact
3. **Ask Paula**: Flag for physics review
4. **Future work**: Replace with physics-based derivations

**Risk**: High. Changing any of these could invalidate years of scientific results.

---

### 1.6 Two-Stage vs Single-Pass Architecture (ATLAS12)

**The Problem**:
ATLAS12's two-stage execution (documented in WORKFLOW_ANALYSIS.md) is a workaround for memory limitations, not a computational necessity.

**Current approach**:
- **Stage 1**: Read millions of lines from fort.11, select relevant subset, write to fort.12
- **Stage 2**: Read selected lines from fort.12, iterate atmosphere

**Between stages**: User manually renames files (mv fort.55 fort.5)

**Why two stages?**:
- In 1970s-90s, couldn't fit millions of lines in memory
- Line selection is I/O bound (reading massive files)
- Atmosphere iteration is CPU bound (45 iterations × frequency loop)
- Separating them allows different resource optimization

**Julia opportunity**:
Modern systems have GB of RAM. Can we:
1. Load all lines into memory once?
2. Select relevant lines on-the-fly during iteration?
3. Eliminate file I/O entirely?

**Trade-offs**:
- **Pro**: Simpler workflow, faster (no disk I/O)
- **Con**: High memory usage, must reload lines if parameters change
- **Con**: Validating against legacy output requires matching two-stage behavior

**Decision needed**:
- Keep two-stage for compatibility?
- Single-pass for performance?
- Provide both options?

**Paula's input needed**: What's typical workflow? Run once or iterate on parameters?

---

## Summary of Architectural Challenges

| Challenge | Impact | Julia Strategy | Risk Level |
|-----------|--------|----------------|------------|
| COMMON blocks (57) | Cannot reason about data flow | Explicit state structs | Medium-High |
| Implicit dependencies | Fragile, hard to test | Explicit function signatures | Medium |
| Fort.X file I/O | Slow, brittle, unportable | In-memory or HDF5/Arrow | Low |
| Mixed precision | Unknown accuracy impact | Parameterize, test carefully | High |
| Magic numbers | May break calibrations | Preserve, document, flag | High |
| Two-stage execution | Awkward workflow | Unify or provide both | Medium |

**Overall Assessment**: ATLAS12 and SYNTHE are scientifically valuable but architecturally constrained by Fortran 77 limitations. Julia migration is not just translation—it's **computational archaeology** followed by **scientific software engineering**.

**Next steps**: Map COMMON block dependencies before writing any Julia code.

---

## II. Computational Patterns Across Codes

The ATLAS Suite shows significant code reuse—not through libraries or modules (Fortran 77 doesn't have them), but through **copy-paste** of entire subroutines into each program. Identifying these patterns reveals opportunities for shared Julia modules.

### 2.1 The Shared Computational Kernel

From DEPENDENCY_MAP.md analysis, ~10 subroutines appear in multiple programs with identical or near-identical implementations:

| Subroutine | ATLAS9 | ATLAS12 | SYNTHE | KAPPA9 | Purpose |
|------------|--------|---------|--------|--------|---------|
| READIN | ✓ | ✓ | - | ✓ | Read input parameters |
| POPS | ✓ | ✓ | - | ✓ | LTE atomic populations (Saha-Boltzmann) |
| PFSAHA | ✓ | ✓ | - | ✓ | Partition functions via Saha equation |
| KAPP | ✓ | ✓ | - | ✓ | Total opacity (sum all sources) |
| ROSS | ✓ | ✓ | - | - | Rosseland mean opacity |
| DERIV | ✓ | ✓ | - | ✓ | Numerical derivatives |
| INTEG | ✓ | ✓ | ✓ | ✓ | Numerical integration |
| SOLVIT | ✓ | ✓ | - | ✓ | Linear equation solver |
| PARCOE | ✓ | ✓ | ✓ | ✓ | Parabolic interpolation coefficients |
| TABVOIGT | - | ✓ | ✓ | - | Pretabulate Voigt profiles |
| XLINOP | - | ✓ | ✓ | - | Line opacity calculation (newer method) |

**Observation**: Two distinct groups emerge:
1. **Core physics/numerics** (POPS, PFSAHA, KAPP, ROSS, DERIV, INTEG, SOLVIT, PARCOE)
   - Used by atmosphere codes (ATLAS9, ATLAS12, KAPPA9)
   - Pure computational kernels
   - ~2,000-3,000 lines total

2. **Line opacity** (TABVOIGT, XLINOP)
   - Used by ATLAS12 and SYNTHE
   - Shared between atmosphere calculation and spectrum synthesis
   - ~500-1,000 lines total

**Julia Migration Strategy**:

**Option A - Monorepo with shared modules**:
```julia
module AtlasCore
    # Shared computational kernels
    include("physics/populations.jl")      # POPS, PFSAHA
    include("physics/opacity.jl")          # KAPP, ROSS
    include("numerics/integration.jl")     # INTEG, DERIV
    include("numerics/linear_algebra.jl")  # SOLVIT, PARCOE
    include("spectroscopy/line_profiles.jl") # TABVOIGT, XLINOP
end

module Atlas12
    using ..AtlasCore
    # Atlas12-specific code
end

module Synthe
    using ..AtlasCore
    # SYNTHE-specific code
end
```

**Option B - Separate packages with dependencies**:
```julia
# AtlasCore.jl - standalone package
# Atlas12.jl depends on AtlasCore
# Synthe.jl depends on AtlasCore
```

**Recommendation**: Option A (monorepo) for easier coordination during migration. Can split into packages later.

**Validation critical**: These ~10 subroutines are used in multiple contexts. Must test that Julia versions work correctly for:
- Different input ranges (ATLAS9 vs ATLAS12 vs SYNTHE may call with different parameters)
- Different precision requirements
- Different iteration patterns

---

### 2.2 Opacity Calculation Pattern

**Pattern identified**: All atmosphere codes (ATLAS9, ATLAS12, KAPPA9) follow the same opacity calculation structure:

**Step 1 - Continuum Sources** (20-30 separate subroutines):
```fortran
CALL HOP        ! H I bound-free + free-free
CALL HMINOP     ! H- opacity
CALL H2PLOP     ! H2+ opacity
CALL HE1OP      ! He I bound-free
CALL HE2OP      ! He II bound-free
CALL C1OP       ! C I bound-free
! ... 20+ more element-specific opacity sources
CALL ELECOP     ! Electron scattering
```

Each subroutine computes opacity for one source at the current frequency, stores in COMMON block /OPS/.

**Step 2 - Sum Continuum**:
```fortran
CALL KAPCONT    ! Or similar - sum all continuum sources
```

**Step 3 - Line Opacity** (method varies):
- ATLAS9: Simple LINOP
- ATLAS12: SELECTLINES + LINOP1 or XLINOP
- SYNTHE: XLINOP only (no line selection, uses pre-selected lists)

**Step 4 - Total**:
```fortran
CALL KAPP       ! Total = continuum + line
```

**Julia Redesign Opportunity**:

Instead of 25+ separate subroutines modifying COMMON blocks:

```julia
struct ContinuumSources
    h_bf_ff::Float64
    h_minus::Float64
    h2_plus::Float64
    he1_bf::Float64
    # ... all ~25 sources
end

function continuum_opacity(
    frequency::Float64,
    state::AtmosphereState,
    abundances::Abundances
) ::ContinuumSources

    # Compute all sources, return struct
    ContinuumSources(
        h_bf_ff = hydrogen_opacity(frequency, state),
        h_minus = h_minus_opacity(frequency, state),
        # ...
    )
end

# Total is just sum of struct fields
total_continuum = sum(sources)
```

**Benefits**:
- All continuum sources computed together (clearer logic)
- No global state modification
- Easy to inspect (sources is a struct you can print/plot)
- Parallelizable (pure function)

**Question for Paula**: Are there interdependencies between continuum sources? Or are they truly independent and summable?

---

### 2.3 Line List Handling Pattern

**Pattern identified**: Three different approaches across the codes:

**ATLAS9 - Opacity Distribution Functions (ODFs)**:
- Pre-computed opacity tables (from DFSYNTHE)
- Read from fort.8 (ODF file)
- No individual line data during atmosphere iteration
- Fast but approximate

**ATLAS12 - Two-Stage Line Selection**:
- Stage 1: Read millions of lines, filter to relevant subset
- Stage 2: Use selected lines for opacity calculation
- Slower but accurate

**SYNTHE - Sequential Line Accumulation**:
- 11 separate programs each append lines to fort.12
- Different readers for different formats (atomic, molecular, TiO, H2O)
- Final accumulated list used for synthesis

**Common computational kernel**:
Despite different workflows, all three eventually do the same calculation:
1. For each line: λ, log(gf), E_lower, E_upper, element, ionization
2. Compute line profile (Voigt function)
3. Calculate opacity contribution at current frequency/wavelength

**Julia Abstraction**:

```julia
# Unified line representation
struct SpectralLine
    wavelength::Float64
    log_gf::Float64
    element::Int
    ionization::Int
    E_lower::Float64
    E_upper::Float64
    # ... broadening parameters
end

# Generic line list
const LineList = Vector{SpectralLine}

# Different loading strategies:
load_lines_from_odf(file::String) ::ODFTable     # ATLAS9 approach
select_lines(database::LineDatabase, criteria::SelectionCriteria) ::LineList  # ATLAS12
accumulate_lines(readers::Vector{LineReader}) ::LineList  # SYNTHE

# But same calculation kernel:
function line_opacity(
    lines::LineList,
    frequency::Float64,
    state::AtmosphereState
) ::Float64
    # Same Voigt profile calculation for all three codes
end
```

**Migration benefit**: Write Voigt profile code once, use in ATLAS12 and SYNTHE. Validate against both simultaneously.

---

### 2.4 Atmosphere Data Structure Pattern

**Pattern identified**: All programs represent stellar atmosphere as 1D arrays indexed by depth:

**Common arrays** (from COMMON blocks):
```fortran
COMMON /RHOX/RHOX(kw),NRHOX          ! Column density grid (kw=72 depth points)
COMMON /TEMP/T(kw),TK(kw),...       ! Temperature (Kelvin, cgs units, etc.)
COMMON /STATE/P(kw),XNE(kw),...     ! Pressure, electron density, etc.
```

**Constant across all codes**: `kw=72` depth points (sometimes 99, but always ~70-100)

**Julia Canonical Representation**:

```julia
struct Atmosphere
    ndepths::Int                    # Typically 72

    # Depth coordinate
    column_density::Vector{Float64} # RHOX - mass column density (g/cm²)

    # Thermodynamic state
    temperature::Vector{Float64}    # T (K)
    pressure::Vector{Float64}       # P (dyne/cm²)
    density::Vector{Float64}        # ρ (g/cm³)
    electron_density::Vector{Float64}  # n_e (cm⁻³)

    # Derived quantities
    scale_height::Vector{Float64}   # H
    # ...
end
```

**Validation**: All three codes (ATLAS9, ATLAS12, SYNTHE) can read/write the same atmosphere file format (.dat/.mod). Julia should preserve this:
```julia
function save_atmosphere(file::String, atm::Atmosphere)
    # Write in ATLAS-compatible format
end

function load_atmosphere(file::String) ::Atmosphere
    # Read ATLAS .dat or .mod files
end
```

**Benefit**: Can use ATLAS12 output directly with SYNTHE, just like the Fortran codes do.

---

### 2.5 Iteration Pattern

**Pattern identified**: ATLAS9 and ATLAS12 both iterate to convergence:

```fortran
DO ITERAT=1,NUMITS
    ! 1. Update populations (POPS, POPSALL)
    ! 2. Compute opacities (KAPCONT, LINOP, KAPP)
    ! 3. Frequency loop:
    DO NU=NULO,NUHI
        ! Radiative transfer (JOSH)
        ! Accumulate corrections (RADIAP, ROSS, TCORR)
    END DO
    ! 4. Apply corrections (CONVEC, TCORR)
    ! 5. Check convergence
END DO
```

**Three-phase subroutine pattern** (from ARCHITECTURE_DETAILS.md):
Many subroutines use MODE parameter:
- MODE=1: Initialize accumulators
- MODE=2: Accumulate during frequency loop (weighted)
- MODE=3: Finalize (compute means, apply corrections)

**Julia Redesign**:

Instead of MODE parameter magic:
```julia
struct FrequencyIntegrator
    accumulators::Dict{Symbol, Vector{Float64}}
end

# Clear separation of phases:
integrator = FrequencyIntegrator(ndepths=72)

for frequency in frequency_grid
    weight = integration_weight(frequency)

    # Compute at this frequency
    opacity = total_opacity(frequency, state)
    source = source_function(frequency, state)
    intensity = radiative_transfer(opacity, source, state)

    # Accumulate weighted contributions
    accumulate!(integrator, :rosseland_mean, weight * opacity)
    accumulate!(integrator, :radiation_pressure, weight * intensity)
end

# Finalize
rosseland_mean = finalize(integrator, :rosseland_mean)
prad = finalize(integrator, :radiation_pressure)
```

**Benefit**: Explicit accumulation pattern, no MODE magic, clear data flow.

---

### 2.6 Pattern Summary and Reuse Opportunities

| Pattern | Used In | Julia Opportunity | Est. Code Reuse |
|---------|---------|-------------------|-----------------|
| Core numerics | ATLAS9, ATLAS12, KAPPA9 | `AtlasCore.Numerics` module | ~2,000 lines |
| Population calculations | ATLAS9, ATLAS12, KAPPA9 | `AtlasCore.Populations` | ~1,500 lines |
| Continuum opacity | ATLAS9, ATLAS12, KAPPA9 | `AtlasCore.Continuum` | ~5,000 lines |
| Line profiles | ATLAS12, SYNTHE | `AtlasCore.Spectroscopy` | ~1,000 lines |
| Atmosphere I/O | All | `AtlasCore.IO` | ~500 lines |
| Frequency integration | ATLAS9, ATLAS12 | `AtlasCore.Integration` | ~500 lines |

**Total shared code**: ~10,500 lines (out of ~80,000 total in ATLAS Suite)

**Migration strategy**:
1. Translate shared kernel first (~10K lines)
2. Test kernel extensively (used by multiple codes = high leverage)
3. Build ATLAS12, SYNTHE, etc. on top of tested kernel
4. Confidence: If ATLAS12 and SYNTHE both validate, kernel is correct

---

## III. Data Flow Analysis

[SECTION IN PROGRESS - TO BE COMPLETED]

---

*Document continues with Sections III-VI...*
