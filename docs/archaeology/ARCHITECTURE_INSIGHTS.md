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

**Progress Update** (2025-11-09):
- **Deep Dive 01** (Voigt Profile): Analyzed highest-risk numerical algorithm, validated Float32 precision acceptable
- **Deep Dive 02** (Populations): Resolved critical precision decision (Float64 required), validated state management design
- **Section V.4** (Precision): Decision RESOLVED via code analysis - mixed precision strategy documented
- **Section VI** (Risk Assessment): Updated with cross-references to deep dive findings

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

**✅ PARTIALLY RESOLVED** - See Deep Dives 01 & 02 for precision analysis:
- **Populations (Deep Dive 02)**: Float64 REQUIRED - ratios span 40+ orders of magnitude, Float32 underflows
- **Voigt profiles (Deep Dive 01)**: Float32 acceptable - target accuracy ~2%, measured error <1.5%
- **Remaining**: Line arrays (XLINES), opacity sums, RT integration (need testing)

**Julia Approach** (validated by code analysis):
1. **~~Analyze first~~**: ✅ Done for populations & Voigt (see deep dives)
2. **Parameterize**: Use type parameters for flexibility
   ```julia
   struct AtmosphereState{T<:AbstractFloat}
       temperature::Vector{T}
       pressure::Vector{T}
       # ...
   end
   ```
3. **Mixed precision strategy** (from Deep Dive 02):
   - Float64: populations, electron density, partition functions
   - Float32: Voigt profiles, possibly line arrays (need validation)

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

| Subroutine | ATLAS9 | ATLAS12 | SYNTHE | KAPPA9 | Purpose | Analysis |
|------------|--------|---------|--------|--------|---------|----------|
| READIN | ✓ | ✓ | - | ✓ | Read input parameters | |
| POPS | ✓ | ✓ | - | ✓ | LTE atomic populations (Saha-Boltzmann) | ✅ Deep Dive 02 |
| PFSAHA | ✓ | ✓ | - | ✓ | Partition functions via Saha equation | ✅ Deep Dive 02 |
| KAPP | ✓ | ✓ | - | ✓ | Total opacity (sum all sources) | |
| ROSS | ✓ | ✓ | - | - | Rosseland mean opacity | |
| DERIV | ✓ | ✓ | - | ✓ | Numerical derivatives | |
| INTEG | ✓ | ✓ | ✓ | ✓ | Numerical integration | |
| SOLVIT | ✓ | ✓ | - | ✓ | Linear equation solver | |
| PARCOE | ✓ | ✓ | ✓ | ✓ | Parabolic interpolation coefficients | |
| TABVOIGT | - | ✓ | ✓ | - | Pretabulate Voigt profiles | ✅ Deep Dive 01 |
| XLINOP | - | ✓ | ✓ | - | Line opacity calculation (newer method) | |

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

Understanding data flow is critical for redesigning the architecture. This section maps what data enters, transforms through, and exits the major computational pipelines.

### 3.1 ATLAS12 Data Flow

**High-level view**:
```
USER INPUTS → STAGE 1 (Line Selection) → INTERMEDIATE STATE → STAGE 2 (Iteration) → ATMOSPHERE MODEL
```

#### 3.1.1 Stage 1: Line Selection

**Inputs**:
1. **fort.3** (ATLAS atmosphere model - .dat format)
   - 72 depth points × (T, P, ρ, XNE, abundances, ...)
   - Starting guess (often from previous ATLAS9 or ATLAS12 run)

2. **fort.11** (Complete atomic line lists - binary, millions of lines)
   - Also fort.31 (diatomic molecules), fort.41 (TiO), fort.51 (H2O)
   - Wavelength, log(gf), E_lower, E_upper, element, ionization

3. **fort.2** (molecules.dat - molecular equilibrium constants)

4. **stdin** (Control cards)
   ```
   MOLECULES ON
   READ MOLECULES
   READ PUNCH
   READ LINES
   CONVECTION OVER 1.25 0 36
   ITERATIONS 1 PRINT 1 PUNCH 0
   ABUNDANCE CHANGE ...
   BEGIN
   END
   ```

**Process**:
1. Read atmosphere model (T, P profiles)
2. Read molecular equilibrium data
3. **SELECTLINES subroutine**: For each line in fort.11:
   - Check if wavelength relevant for this Teff
   - Check if ionization stage present in atmosphere
   - Check if oscillator strength > threshold
   - Select ~0.1-1% of input lines (millions → hundreds of thousands)

**Outputs**:
- **fort.12** (selected lines - binary, much smaller than fort.11)
- **fort.55** (completion flag - tells user Stage 1 finished)

**Data that does NOT persist to Stage 2**:
- Atmosphere structure (fort.3 is read again in Stage 2)
- Molecular equilibrium (fort.2 is read again)
- Complete line lists (fort.11 etc. not used in Stage 2)

**Data that DOES persist**:
- **Only fort.12** (selected lines)

**Between stages**: User must:
```bash
mv fort.55 fort.5    # Signal to run Stage 2
```

⚠️ **Architectural smell**: Stage 1 and Stage 2 share almost no state in memory. They are effectively separate programs that happen to be compiled together.

#### 3.1.2 Stage 2: Atmosphere Iteration

**Inputs**:
1. **fort.3** (same as Stage 1 - atmosphere model)
2. **fort.12** (selected lines from Stage 1)
3. **fort.2** (same as Stage 1 - molecules.dat)
4. **fort.19** (NLTE line data - optional)
5. **stdin** (Control cards - different from Stage 1):
   ```
   MOLECULES ON
   READ MOLECULES
   READ PUNCH
   TITLE ATLAS12
   OPACITY ON LINES
   OPACITY ON XLINES
   CONVECTION OVER 1.25 0 36
   ITERATIONS 45
   SCALE MODEL 72 -6.875 0.125 5500. 4.6
   VTURB 1.23E+05
   ABUNDANCE CHANGE ...
   BEGIN
   END
   ```

**Process** (45 iterations typical):

**Per iteration**:
1. **Population calculations** (→ /XNF/, /XNFP/ COMMON blocks):
   - POPS: Compute atomic populations (Saha-Boltzmann) - See Deep Dive 02
   - POPSALL: Add molecular populations
   - NELECT: Update electron density with damping factor 0.3 - See Deep Dive 02, Section 3.2

2. **Opacity tabulation** (→ /TABCONT/, /XLINES/ COMMON blocks):
   - KAPCONT: Continuum opacity at all depths (once per iteration)
   - XLINOP: Line opacity from fort.12 at all wavelengths

3. **Frequency integration** (30,000 wavelengths):
   For each λ:
   - KAPP: Total opacity = continuum + line
   - JOSH: Solve radiative transfer (→ JNU, HNU, SNU)
   - Accumulate: RADIAP, ROSS, TCORR (weighted sums)

4. **Apply corrections**:
   - RADIAP: Update radiative acceleration → affects pressure structure
   - ROSS: Rosseland mean → affects temperature correction
   - TCORR: Adjust temperatures for radiative equilibrium
   - CONVEC: Add convective energy transport (if needed)

5. **Check convergence**: Compare T, P, XNE to previous iteration

**Data flow during iteration**:
```
Atmosphere state (T, P, ρ, XNE)
    ↓
POPS/POPSALL → Populations (XNF, XNFP)
    ↓
KAPCONT → Continuum opacity tables
    ↓
XLINOP + fort.12 → Line opacity (XLINES array)
    ↓
Frequency loop:
    KAPP → Total opacity
        ↓
    JOSH → Radiation field (J, H, S)
        ↓
    Accumulate → Corrections (RADIAP, ROSS, TCORR)
    ↓
Apply corrections → Updated atmosphere state (T, P, ρ, XNE)
    ↓
Check convergence
```

**Outputs**:
- **fort.7** (converged atmosphere model - .dat format)
  - Same format as input fort.3, but converged
  - Can be used as input to SYNTHE or another ATLAS12 run
- **fort.8**, **fort.9** (additional diagnostic outputs - optional)

#### 3.1.3 ATLAS12 State Dependencies

**Critical COMMON blocks and their dependencies**:

```
/ELEM/, /ABUND/  (Element data, abundances)
    ↓ read by
/XNF/, /XNFP/  (Populations - computed by POPS, POPSALL)
    ↓ read by
/XNFDOP/  (Doppler-weighted populations)
    ↓ read by
XLINOP, KAPCONT  (Opacity calculations)
    ↓ produces
/TABCONT/, /XLINES/  (Opacity tables)
    ↓ read by
KAPP  (Total opacity)
    ↓ read by
JOSH  (Radiative transfer)
    ↓ produces
/TAUSHJ/ (τ, S, H, J)
    ↓ read by
RADIAP, ROSS, TCORR  (Corrections)
    ↓ modifies
/TEMP/, /STATE/  (T, P, ρ, XNE)
    ↓ (loop back to POPS)
```

**Julia implication**: This is a dependency tree, not a dependency graph (no cycles within one iteration). Can be represented as:

```julia
struct IterationState
    # Input (from previous iteration or initial guess)
    atmosphere::Atmosphere  # T, P, ρ, XNE

    # Computed each iteration (in this order):
    populations::Populations  # From POPS, POPSALL
    continuum_opacity::ContinuumOpacity  # From KAPCONT
    line_opacity::LineOpacity  # From XLINOP
    radiation_field::RadiationField  # From JOSH (frequency loop)
    corrections::Corrections  # From RADIAP, ROSS, TCORR

    # Output (for next iteration)
    updated_atmosphere::Atmosphere
end
```

**Migration opportunity**: Make dependency tree explicit in type system. Can't accidentally skip a step.

---

### 3.2 SYNTHE Pipeline Data Flow

**High-level view**:
```
ATLAS MODEL → xnfpelsyn → ATMOSPHERE DATA
LINE LISTS → synbeg + readers → ACCUMULATED LINES
ATMOSPHERE DATA + LINES → synthe → LINE OPACITIES
LINE OPACITIES + ATMOSPHERE → spectrv → SPECTRUM
SPECTRUM → rotate → broaden → FINAL SPECTRUM
```

#### 3.2.1 Detailed Fort Unit Flow

From ARCHITECTURE_DETAILS.md Section II:

| Program | Reads | Writes | Data Description |
|---------|-------|--------|------------------|
| xnfpelsyn | stdin (model), fort.2, fort.17 | fort.10 | Atmosphere: T, P, ρ, XNE, populations |
| synbeg | stdin (params) | fort.12 (header), fort.14 | Line list header, control parameters |
| rgfalllinesnew | fort.11, fort.12, fort.14 | fort.12 | Append atomic lines |
| rmolecasc | fort.11, fort.12, fort.14 | fort.12 | Append molecular lines |
| rschwenk | fort.11, fort.48, fort.12 | fort.12 | Append TiO lines |
| rh2ofast | fort.11, fort.12 | fort.12 | Append H2O lines |
| synthe | fort.10, fort.12, fort.14, fort.18 | fort.16 | Line opacities vs λ vs depth |
| spectrv | stdin (model), fort.2, fort.25, fort.16 | fort.7 | Emergent intensity/flux |
| rotate | fort.1 (=fort.7), stdin | ROT1 | Rotationally broadened |
| broaden | fort.21 (=ROT1), stdin | fort.22 | Instrumentally broadened |
| converfsynnmtoa | fort.1 (=fort.22) | fort.2 | ASCII conversion |

**Key observation**: Fort.12 is the "accumulator" pattern:
1. synbeg initializes fort.12 with header
2. Each line reader appends to fort.12
3. synthe reads complete fort.12

**Sequential dependency**:
```
synbeg must complete before any line reader
All line readers must complete before synthe
```

**Parallel opportunity**:
```
xnfpelsyn can run independently
Line readers can run in parallel if they write to separate files, then merge
```

#### 3.2.2 Data Transformations

**xnfpelsyn transform**:
```
ATLAS model (.mod format - ASCII)
    ↓ parse, interpolate, compute
Atmosphere data (binary fort.10)
    - T(depth), P(depth), ρ(depth)
    - Populations for all elements/ions
    - Continuum opacities
```

**Line accumulation transform**:
```
Line databases (various formats, millions of lines)
    ↓ filter by wavelength range, oscillator strength
Accumulated line list (binary fort.12, thousands of lines)
    - λ, log(gf), E_low, E_up, element, ion
    - For all lines in wavelength range
```

**synthe transform**:
```
Atmosphere data (fort.10) + Line list (fort.12)
    ↓ compute line profiles at each depth
Line opacity table (binary fort.16)
    - κ_line(λ, depth) for all wavelengths
    - Includes Voigt profiles, broadening
```

**spectrv transform**:
```
Atmosphere + Line opacities + Continuum
    ↓ solve radiative transfer at each λ
Spectrum (fort.7)
    - I(λ,μ) at 17 angles, or
    - F(λ) flux
```

**rotate/broaden transforms**:
```
Spectrum → Convolution with kernel → Broadened spectrum
```

#### 3.2.3 Could SYNTHE Be a Single Program?

**Current total execution time**: ~10-60 minutes

**Time breakdown** (rough estimates from ARCHITECTURE_DETAILS.md):
- xnfpelsyn: ~1 min (atmosphere processing)
- synbeg: <1 sec (initialize)
- Line readers: ~2-5 min total (I/O bound - reading files)
- synthe: ~10-50 min (compute bound - line profile calculations) ⭐ BOTTLENECK
- spectrv: ~1-5 min (radiative transfer)
- rotate/broaden: <1 min (convolutions)

**File I/O overhead**: ~10-20% of total time
- Writing fort.10 (~MB)
- Writing fort.12 (~10-100 MB depending on wavelength range)
- Writing fort.16 (~100 MB - 1 GB depending on resolution)

**Julia unified pipeline benefits**:
1. **Eliminate I/O**: Keep all data in memory
   - Save ~10-20% time
   - No disk space needed for intermediate files
   - No risk of corrupted partial files

2. **Simplify workflow**:
   ```julia
   spectrum = synthe_pipeline(
       model_file="atmosphere.dat",
       line_lists=["gf*.100", "CH.asc", "TiO.bin", ...],
       wavelength_range=(700.0, 721.0),
       resolution=500000.0,
       rotation_vsini=2.0,
       broadening=:gaussian(48000.0)
   )
   ```

3. **Better error handling**: If synthe crashes mid-calculation, can inspect state in debugger

**Trade-off - Memory usage**:
- Atmosphere data: ~1 MB
- Line list: ~10-100 MB
- Line opacity table: ~100 MB - 1 GB
- **Total**: ~200 MB - 1.1 GB

Modern system with 16-32 GB RAM: No problem.

**Trade-off - Modularity**:
Current: Can run line readers separately to inspect what lines are selected
Unified: Would need to add explicit "save intermediate" flags

**Recommendation**: Implement unified pipeline, with optional intermediate saves:
```julia
spectrum = synthe_pipeline(
    ...
    save_intermediate=true,  # Write fort.10, fort.12, fort.16 equivalents
    intermediate_dir="/tmp/synthe_debug/"
)
```

---

### 3.3 Common Data Structures Across Codes

**Atmosphere representation** (shared by ATLAS12, SYNTHE, ATLAS9):
- 1D arrays vs depth (column density RHOX)
- ~72 depth points
- Same file format (.dat/.mod)
- Same physical quantities (T, P, ρ, XNE)

**Line representation** (shared by ATLAS12, SYNTHE, DFSYNTHE):
- λ (wavelength in Å)
- log(gf) (oscillator strength)
- E_lower, E_upper (energy levels in eV or cm⁻¹)
- Element code, ionization stage
- Broadening parameters (γ_rad, γ_Stark, γ_vdW)

**Opacity** (shared by all atmosphere codes):
- Function of (frequency, depth)
- Continuum + line contributions
- Stored as tables for efficiency

**Julia advantage**: Define these structures once, use everywhere:

```julia
# shared/atmosphere.jl
struct Atmosphere
    ...
end

# shared/spectroscopy.jl
struct SpectralLine
    ...
end

struct Opacity
    ...
end

# All programs import from shared
using Atlas.Shared
```

---

### 3.4 Data Flow Redesign Principles

Based on the analysis above:

**Principle 1 - Make Data Flow Explicit**:
- No COMMON blocks
- All data passed through function arguments or returned
- Type system enforces correct flow

**Principle 2 - Minimize State**:
- Immutable data where possible (physical constants, element properties)
- Mutable state only for iteration (atmosphere during convergence)
- Clear ownership (who can modify what)

**Principle 3 - Pipeline Composition**:
- Each stage is a function with clear input/output types
- Compose stages using function composition or pipelines
- Easy to add diagnostic logging between stages

**Example - SYNTHE redesign**:
```julia
# Current: 11 programs with fort.X communication
# Julia: Function pipeline

atmosphere_data = process_atmosphere(model)
lines = accumulate_lines(line_databases, wavelength_range)
opacities = calculate_line_opacities(atmosphere_data, lines)
spectrum = solve_radiative_transfer(atmosphere_data, opacities)
broadened = apply_broadening(spectrum, vsini, instrument)

# Or as pipeline:
spectrum = model |>
    process_atmosphere |>
    (atm -> calculate_opacities(atm, lines)) |>
    solve_radiative_transfer |>
    (spec -> apply_rotation(spec, vsini)) |>
    (spec -> apply_broadening(spec, instrument))
```

**Principle 4 - Preserve Compatibility**:
- Read/write ATLAS file formats (for validation)
- Match numerical behavior (for scientific continuity)
- Provide legacy mode if needed

---

## IV. State Management Redesign

**Challenge**: ATLAS12 uses 57 COMMON blocks for global state. SYNTHE uses ~20. This makes dependencies implicit, testing impossible, and parallelization dangerous.

**Goal**: Categorize all global state and propose explicit Julia structures.

**✅ VALIDATED** - See `docs/archaeology/DEEP_DIVES/02_POPULATIONS.md` Section 6:
- Traced actual COMMON block usage in POPS/NELECT subroutines
- Confirmed categorization is correct (constants, config, state, populations, workspace)
- Validated dependency tree is acyclic (no circular dependencies)
- Verified proposed Julia structs match actual code patterns

### 4.1 COMMON Block Taxonomy

Analyzing ATLAS12's 57 COMMON blocks, they fall into 5 categories:

#### Category 1: Physical Constants (Immutable)
**Fortran pattern**:
```fortran
COMMON/CONST/BOLTZ,HPLANK,CLIGHT,GRAV,RGAS,RHCC,EVOLT
COMMON/ATOMDAT/XMASS(100),IONPOT(100,5)
```

**Julia redesign** - Immutable structs:
```julia
struct PhysicalConstants
    boltzmann::Float64
    planck::Float64
    speed_of_light::Float64
    gravitational_const::Float64
    gas_constant::Float64
    rydberg_hc::Float64
    ev_to_ergs::Float64
end

const PHYSICAL_CONSTANTS = PhysicalConstants(...)

struct AtomicData
    atomic_mass::Vector{Float64}  # [element]
    ionization_potential::Matrix{Float64}  # [element, ion_stage]
end

const ATOMIC_DATA = AtomicData(...)
```

**COMMON blocks in this category** (~8 blocks):
- /CONST/, /ATOMDAT/, /MOLDAT/, /VOIGT_CONST/

**Migration**: Load once at module initialization, never mutate.

---

#### Category 2: Run Configuration (Immutable After Setup)
**Fortran pattern**:
```fortran
COMMON/CONV/CONVL,CONVT,ITER,ITMAXL
COMMON/ABUNDL/ELEM(16,100)
COMMON/GRIDP/NDP,NDT,NDPMAX
```

**Julia redesign** - Configuration structs:
```julia
struct ConvergenceCriteria
    flux_tolerance::Float64
    temp_tolerance::Float64
    max_iterations::Int
end

struct Abundances
    log_abundance::Matrix{Float64}  # [element, ionization]
end

struct GridParameters
    num_depth_points::Int
    num_temp_points::Int
    max_depth_points::Int
end

struct AtlasConfig
    convergence::ConvergenceCriteria
    abundances::Abundances
    grid::GridParameters
    # ... other config
end
```

**COMMON blocks in this category** (~15 blocks):
- /CONV/, /ABUNDL/, /GRIDP/, /WLGRID/, /LINDAT/ (config portion)

**Migration**: Initialize from input files, pass to all functions that need it. Make immutable.

---

#### Category 3: Atmosphere State (Mutable During Iteration)
**Fortran pattern**:
```fortran
COMMON/TEMP/T(100),TI(100)
COMMON/PRESSURE/P(100),PI(100)
COMMON/RHO/RHO(100),RHOI(100)
COMMON/XNE/XNE(100),XNEI(100)
```

**Julia redesign** - Explicit state struct:
```julia
struct AtmosphereState
    temperature::Vector{Float64}      # T(depth)
    pressure::Vector{Float64}         # P(depth)
    density::Vector{Float64}          # ρ(depth)
    electron_density::Vector{Float64} # XNE(depth)
end

mutable struct IterationState
    current::AtmosphereState
    previous::AtmosphereState  # For convergence checking
    iteration::Int
    converged::Bool
end
```

**COMMON blocks in this category** (~12 blocks):
- /TEMP/, /PRESSURE/, /RHO/, /XNE/, /FLUX/, /ABUND/ (if computed)

**Migration**: Pass explicitly through iteration loop. Clone for convergence tests.

---

#### Category 4: Computational Workspace (Should Be Local)
**Fortran pattern**:
```fortran
COMMON/WORK/A(100),B(100),C(100),D(100),W(100)
COMMON/KAPPAS/KAPREF(100),KAPPAGAS(100,5)
```

These are temporary arrays used during calculations.

**Julia redesign** - Function-local allocations:
```julia
function calculate_opacity(atmosphere::AtmosphereState, config::AtlasConfig)
    # Allocate workspace locally, not globally
    kappa_continuum = zeros(Float64, config.grid.num_depth_points)
    kappa_line = zeros(Float64, config.grid.num_depth_points)

    # Do calculation...

    return Opacity(kappa_continuum, kappa_line)
end
```

**COMMON blocks in this category** (~18 blocks):
- /WORK/, /KAPPAS/ (temporary), /SCRATCH/, /BUFFER/

**Migration**: Eliminate entirely. Allocate locally or reuse pre-allocated buffers.

⚠️ **Performance consideration**: If allocation overhead matters, consider passing workspace as argument or using static arrays.

---

#### Category 5: Control Flow and Mode Flags
**Fortran pattern**:
```fortran
COMMON/MODE/IMODE,JMODE,KMODE
COMMON/IOUNIT/IN,IOUT,IDAT
```

**Julia redesign** - Enums and explicit parameters:
```julia
@enum ExecutionMode begin
    STAGE1_LINE_SELECTION = 1
    STAGE2_ITERATION = 2
end

@enum OutputMode begin
    HEADERS = 1
    FREQUENCY_DATA = 4
    FINAL_MODEL = 5
end

struct IOConfig
    input_unit::Int  # Or IOStream
    output_unit::Int
    data_unit::Int
end
```

**COMMON blocks in this category** (~4 blocks):
- /MODE/, /IOUNIT/, /FLAGS/

**Migration**: Replace with enums and configuration. Avoid mutable global state.

---

### 4.2 Complete ATLAS12 COMMON Block Classification

From ARCHITECTURE_DETAILS.md, ATLAS12 has 57 COMMON blocks. Full categorization:

| Category | Count | Examples | Julia Strategy |
|----------|-------|----------|----------------|
| Physical Constants | 8 | /CONST/, /ATOMDAT/, /MOLDAT/ | `const` immutable structs |
| Run Configuration | 15 | /CONV/, /ABUNDL/, /GRIDP/ | Immutable config struct |
| Atmosphere State | 12 | /TEMP/, /P/, /RHO/, /XNE/ | Mutable iteration state |
| Workspace | 18 | /WORK/, /SCRATCH/, /BUFFER/ | Local allocation |
| Control/Mode | 4 | /MODE/, /IOUNIT/, /FLAGS/ | Enums + parameters |

📋 **TODO**: Create detailed mapping table for all 57 COMMON blocks (see ARCHITECTURE_DETAILS.md:300-350).

---

### 4.3 State Dependency Tree

Based on Section III analysis, COMMON block dependencies form a **tree** (not graph):

```
Configuration (read once)
├── Physical Constants (CONST, ATOMDAT)
├── Abundances (ABUNDL)
├── Grid Parameters (GRIDP)
└── Convergence Criteria (CONV)
    ↓
Iteration State (updated each loop)
├── Atmosphere (TEMP, P, RHO, XNE)
│   ↓
├── Populations (computed from Atmosphere + ATOMDAT)
│   ↓
├── Opacities (computed from Populations + Lines)
│   ↓
├── Radiation Field (computed from Opacities + Atmosphere)
│   ↓
└── Corrections (computed from Radiation + Atmosphere)
    ↓
Updated Atmosphere (for next iteration)
```

**Key insight**: Dependencies flow **downward** only. No circular dependencies.

**Julia advantage**: Can enforce this with type system:
```julia
function calculate_populations(
    atm::AtmosphereState,
    atomic_data::AtomicData
) -> Populations
    # Cannot accidentally modify atm or atomic_data
    # Can only compute and return populations
end
```

---

### 4.4 Proposed Julia State Management Architecture

#### Top-Level Organization
```julia
# 1. Constants (never change)
const PHYSICAL_CONSTANTS = PhysicalConstants(...)
const ATOMIC_DATA = AtomicData(...)

# 2. Configuration (set once per run)
struct AtlasConfig
    convergence::ConvergenceCriteria
    abundances::Abundances
    grid::GridParameters
    wavelength::WavelengthGrid
    # ...
end

# 3. Mutable state (iteration)
mutable struct AtlasIteration
    atmosphere::AtmosphereState
    populations::Union{Populations, Nothing}
    opacities::Union{OpacitySet, Nothing}
    radiation::Union{RadiationField, Nothing}
    iteration_number::Int
    converged::Bool
end

# 4. Main computation
function run_atlas12(config::AtlasConfig, initial_atmosphere::AtmosphereState)
    iteration = AtlasIteration(initial_atmosphere, nothing, nothing, nothing, 0, false)

    while !iteration.converged && iteration.iteration_number < config.convergence.max_iterations
        iteration.populations = calculate_populations(iteration.atmosphere, ATOMIC_DATA)
        iteration.opacities = calculate_opacities(iteration.populations, iteration.atmosphere)
        iteration.radiation = solve_radiative_transfer(iteration.atmosphere, iteration.opacities)

        new_atmosphere = apply_corrections(iteration.atmosphere, iteration.radiation, config)
        iteration.converged = check_convergence(new_atmosphere, iteration.atmosphere, config)
        iteration.atmosphere = new_atmosphere
        iteration.iteration_number += 1
    end

    return iteration.atmosphere
end
```

#### Benefits of This Design

1. **Explicit dependencies**: Function signatures show what data is needed
2. **Immutability by default**: Can't accidentally corrupt constants or config
3. **Testability**: Can test each function in isolation with mock data
4. **Parallelization**: No global state = safe parallel execution
5. **Type safety**: Compiler catches missing data dependencies
6. **Debuggability**: Can inspect `iteration` object at any point

---

### 4.5 SYNTHE State Management

SYNTHE's 11-program pipeline currently uses fort.X files for communication. Each program has ~5-20 COMMON blocks.

**Proposed Julia design** - Pipeline with explicit types:

```julia
struct SyntheInput
    atmosphere_model::AtmosphereState
    wavelength_range::Tuple{Float64, Float64}
    wavelength_step::Float64
    line_databases::Vector{String}  # Paths to line lists
    vsini::Float64
    instrument_profile::InstrumentProfile
end

function synthesize_spectrum(input::SyntheInput) -> Spectrum
    # Stage 1: Prepare atmosphere data
    atm_data = prepare_atmosphere(input.atmosphere_model)

    # Stage 2-4: Accumulate line lists
    lines = accumulate_lines(
        input.line_databases,
        input.wavelength_range,
        atm_data
    )

    # Stage 5-8: Calculate opacities and solve RT
    spectrum = calculate_spectrum(
        atm_data,
        lines,
        input.wavelength_range,
        input.wavelength_step
    )

    # Stage 9-11: Apply instrumental effects
    spectrum = apply_rotation(spectrum, input.vsini)
    spectrum = apply_broadening(spectrum, input.instrument_profile)

    return spectrum
end
```

**Compare to Fortran**:
- **Fortran**: 11 programs × ~10 COMMON blocks = ~110 global state variables
- **Julia**: 1 function, 5 explicit structs, 0 global mutable state

---

### 4.6 Migration Strategy for State Management

#### Phase 1: Identify State Categories
- [x] Catalog all COMMON blocks (done in ARCHITECTURE_DETAILS.md)
- [x] Classify into 5 categories (done above)
- [ ] Create detailed mapping for all 57 ATLAS12 blocks
- [ ] Repeat for SYNTHE, ATLAS9, DFSYNTHE

#### Phase 2: Design Julia Structs
- [ ] Define all immutable constant structs
- [ ] Define all configuration structs
- [ ] Define iteration state structs
- [ ] Define workspace allocation strategy

#### Phase 3: Refactor Step-by-Step
1. Replace constants first (easiest, no state changes)
2. Replace configuration (requires input file parsers)
3. Replace iteration state (hardest, requires understanding update logic)
4. Eliminate workspace COMMON blocks (move to local scope)
5. Replace control flags with enums

#### Phase 4: Validation
- Compare output against Fortran for identical inputs
- Verify numerical precision matches
- Test edge cases and convergence behavior

---

### 4.7 Critical Decision for Paula

**Question**: Should Julia migration support **multiple execution modes**?

**Option A - Legacy Compatibility Mode**:
```julia
# Matches Fortran behavior exactly, including global state
global_state = AtlasGlobalState()
run_atlas12_legacy!(global_state, input_file)
```

**Option B - Clean Architecture Only**:
```julia
# Modern design, no global state
config = load_config(input_file)
atmosphere = run_atlas12(config, initial_guess)
```

**Option C - Both** (recommended):
- Provide clean API as primary interface
- Provide legacy-compatible wrapper for validation
- Allows incremental migration and testing

📋 **TODO**: Paula, which approach do you prefer?

---

## V. Critical Decision Points

These decisions require **Paula's astrophysics domain knowledge**. Programming can't answer them - science must.

---

### 5.1 ODF vs Opacity Sampling (OS)

**Context**: Two competing approaches for line opacity calculations.

**Fortran status**:
- **ATLAS9**: Uses Opacity Distribution Functions (ODFs)
  - Pre-computed opacity probability distributions
  - Fast but lower spectral resolution
  - Kurucz spent decades building ODF tables
- **ATLAS12**: Uses Opacity Sampling (OS)
  - Direct line-by-line calculations
  - Slower but more accurate
  - ~1 million lines per iteration (Stage 2)

**Julia migration question**: Which to implement first?

**Option A - ODF-based (ATLAS9 route)**:
- ✅ Faster execution (minutes vs hours)
- ✅ Proven for stellar atmosphere grids
- ✅ ODF tables already exist
- ❌ Lower spectral resolution
- ❌ Less flexible for non-standard abundances
- ❌ ODF generation is complex (separate tool chain)

**Option B - OS-based (ATLAS12 route)**:
- ✅ Higher accuracy and flexibility
- ✅ Simpler conceptually (just sum lines)
- ✅ Works for any abundance pattern
- ❌ Computationally expensive
- ❌ Requires massive line databases
- ❌ Convergence may be slower

**Option C - Both**:
- Implement OS first (simpler, more general)
- Add ODF support later for production runs
- Use OS for validation, ODF for speed

**Questions for Paula**:
1. For your research, is OS accuracy essential? Or is ODF sufficient?
2. Do you need non-standard abundances (where ODF breaks down)?
3. Is computation time a limiting factor?
4. Are Kurucz's ODF tables still scientifically valid?

✅ **Decision 5.1 RESOLVED** - Opacity Sampling (Option B: ATLAS12 route)

**Paula's answers**:
1. OS accuracy is **almost always essential**
2. **Yes**, non-standard abundances needed
3. Computation time is a factor, but not limiting
4. ODF tables exist but **are not primary targets** for migration

**Recommendation**: Implement Opacity Sampling (ATLAS12 method) as primary approach. ODF support can be deferred or skipped entirely.

---

### 5.2 ATLAS12 Two-Stage Architecture

**Context**: ATLAS12 runs as two separate programs:
- **Stage 1**: Select wavelength points for opacity sampling (~10-20 min)
- **Stage 2**: Iterate atmosphere model using selected points (~1-4 hours)

**Why separate?**: Line selection is expensive, done once. Iteration uses cached results.

**Julia migration question**: Keep two-stage design or unify?

**Option A - Keep Two Stages**:
```julia
# Stage 1: Line selection
selected_wavelengths = atlas12_stage1(config, line_databases)
save("selected_lines.dat", selected_wavelengths)

# Stage 2: Iteration (can run multiple times with different T_eff, log g, etc.)
atmosphere = atlas12_stage2(config, selected_wavelengths, initial_guess)
```

**Benefits**:
- ✅ Matches Fortran workflow (easier validation)
- ✅ Can reuse line selection for parameter studies
- ✅ Separates concerns cleanly

**Drawbacks**:
- ❌ Two separate programs to maintain
- ❌ Requires intermediate file format
- ❌ Users might find it confusing

**Option B - Unified Single Program**:
```julia
# Single call, handles caching internally
atmosphere = atlas12(config, line_databases, initial_guess;
                     cache_lines=true)  # Saves for reuse
```

**Benefits**:
- ✅ Simpler user interface
- ✅ Single program to test and debug
- ✅ Caching handled automatically

**Drawbacks**:
- ❌ May be slower for parameter studies (if caching fails)
- ❌ Harder to validate against Fortran

**Questions for Paula**:
1. In your workflow, do you typically run Stage 1 once and Stage 2 many times?
2. Or do you usually run the full pipeline end-to-end?
3. Would automatic caching be preferable to manual file management?

✅ **Decision 5.2 RESOLVED** - Unified Architecture (Option B)

**Paula's workflow**:
- **Grid-based parallelization**: Creates parameter grids, runs N models in parallel (each on different core)
- **Occasional parameter iteration**: Sometimes tweaks parameters and re-runs, but less common
- **Preference**: Unified architecture with automatic caching

**Recommendation**: Implement unified single-program design. Line selection caching should be automatic and transparent. Users shouldn't need to manage intermediate files manually.

```julia
# Clean unified API
atmosphere = atlas12(config, line_databases, initial_guess;
                     cache_dir="~/.atlas_cache")  # Automatic caching
```

---

### 5.3 SYNTHE Pipeline Unification

**Context**: SYNTHE is 11 separate Fortran programs:
1. **synbeg** - Process atmosphere model
2. **rgfalllinesmol** - Read molecular lines
3. **rgfalllines** - Read atomic lines
4. **rwavedf** - Accumulate more lines
5. **spectrv** - Calculate spectrum (core RT solver)
6. **rotate** - Apply rotational broadening
7. **broaden** - Apply instrumental broadening
8-11. Additional line accumulation steps

**Fortran workflow**: Run sequentially, communicate via fort.X files.

**Julia migration question**: Unified program or pipeline?

**Option A - Single Unified Program**:
```julia
spectrum = synthesize_spectrum(
    atmosphere_model,
    line_databases,
    wavelength_range,
    vsini,
    instrument_profile
)
```

**Benefits**:
- ✅ Clean, simple API
- ✅ No intermediate files
- ✅ Easier error handling
- ✅ Faster (no I/O between stages)

**Drawbacks**:
- ❌ Harder to validate individual stages
- ❌ Must load all data at once (memory: ~200MB to 1.1GB, see Section III)
- ❌ Less flexible for non-standard workflows

**Option B - Separate Stages (Fortran-like)**:
```julia
atm = synthe_prepare_atmosphere(model)
lines = synthe_accumulate_lines(databases, wavelength_range)
spec = synthe_calculate_spectrum(atm, lines)
spec = synthe_rotate(spec, vsini)
spec = synthe_broaden(spec, instrument)
```

**Benefits**:
- ✅ Matches Fortran (easier validation)
- ✅ Can inspect intermediate results
- ✅ Can skip stages if needed

**Drawbacks**:
- ❌ More complex API
- ❌ Requires understanding 11-step pipeline
- ❌ Intermediate data structures exposed

**Option C - Both (Recommended)**:
Provide both high-level unified API and low-level stage-by-stage interface:
```julia
# High-level (for most users)
spectrum = synthesize_spectrum(atmosphere, line_lists, ...)

# Low-level (for validation and debugging)
pipeline = SynthePipeline(atmosphere, line_lists, ...)
run_stage!(pipeline, :prepare_atmosphere)
run_stage!(pipeline, :accumulate_lines)
# ... inspect intermediate results ...
run_stage!(pipeline, :calculate_spectrum)
```

**Questions for Paula**:
1. Do you ever need to inspect intermediate SYNTHE outputs (fort.19, fort.20)?
2. Do you ever run non-standard SYNTHE workflows (skipping steps)?
3. Would a unified interface meet 90% of your needs?

✅ **Decision 5.3 RESOLVED** - Unified with Flexibility (Option C)

**Paula's answers**:
1. **Occasionally** needs to inspect/debug individual stages
2. **Yes**, variations at instrumental broadening stage (e.g., adding/skipping rotation)
3. **Yes**, understands trade-offs

**Recommendation**: Provide both high-level unified API (for 90% of use cases) and low-level stage-by-stage interface (for debugging and non-standard workflows).

```julia
# High-level (most common)
spectrum = synthesize_spectrum(atmosphere, line_lists, wavelength_range,
                               vsini=10.0, instrumental_profile=:gaussian)

# Low-level (debugging/flexibility)
pipeline = SynthePipeline(atmosphere, line_lists, wavelength_range)
run_stage!(pipeline, :accumulate_lines)
# ... inspect intermediate results ...
spectrum = run_stage!(pipeline, :calculate_spectrum)
spectrum = apply_rotation(spectrum, vsini=10.0)  # Optional
spectrum = apply_broadening(spectrum, :gaussian)  # Flexible
```

---

### 5.4 Numerical Precision Requirements

**Context**: Fortran code uses mixed precision:
- **REAL*4** (32-bit): Some arrays, intermediate calculations
- **REAL*8** (64-bit): Critical physics (populations, opacities, RT)

**Julia default**: `Float64` (64-bit) everywhere.

**Julia migration question**: Match Fortran precision mix or use Float64 everywhere?

**Option A - All Float64**:
```julia
# Everything is Float64
temperature::Vector{Float64}  # Was REAL*4 in Fortran
opacity::Vector{Float64}       # Was REAL*8 in Fortran
```

**Benefits**:
- ✅ Simpler code (no type conversions)
- ✅ Avoids precision loss bugs
- ✅ Julia's JIT optimizes Float64 well
- ✅ Modern machines have plenty of RAM

**Drawbacks**:
- ❌ Uses 2× memory for some arrays
- ❌ Slightly slower for large arrays (more cache misses)
- ❌ Won't match Fortran output exactly

**Option B - Match Fortran Precision**:
```julia
# Replicate Fortran's REAL*4/REAL*8 split
temperature::Vector{Float32}  # Matches Fortran REAL*4
opacity::Vector{Float64}      # Matches Fortran REAL*8
```

**Benefits**:
- ✅ Matches Fortran numerical behavior exactly
- ✅ Lower memory usage
- ✅ Potentially faster for big arrays

**Drawbacks**:
- ❌ Complex type juggling
- ❌ Risk of precision loss bugs
- ❌ Harder to maintain

**Option C - Float64 with Validation Mode**:
- Use Float64 everywhere in production
- Provide `Float32` mode for Fortran validation
- After validation, recommend Float64

**Questions for Paula**:
1. ~~Are there known precision-sensitive calculations where Float32 → Float64 matters?~~ **ANSWERED** (see Deep Dive 02)
2. How closely must Julia outputs match Fortran? (Exact? ~1e-6 tolerance? ~1%)
3. Do you have reference calculations to test against?

✅ **Decision V.4 RESOLVED** (from Deep Dive 02 - Saha-Boltzmann Populations):

**Mixed precision strategy**:
- **Populations: Float64 REQUIRED** (no compromise)
  - Ratios span 40+ orders of magnitude: exp(-χ/kT) ranges from 10^(-50) to 10^(0)
  - Example: H ionization at 5000K → exp(-31.6) = 1.7 × 10^(-14)
  - Float32 would underflow to exactly 0.0 → catastrophic failure
  - See `docs/archaeology/DEEP_DIVES/02_POPULATIONS.md` Section 4 for analysis

- **Voigt profiles: Float32 acceptable**
  - Target accuracy: ~1-2% (from code comments)
  - Performance critical (~1 million calls/iteration)
  - Float32 sufficient for this accuracy level
  - See `docs/archaeology/DEEP_DIVES/01_VOIGT_PROFILE.md` Section 4 for analysis

**Recommendation**: Use Float64 for all physics calculations (populations, opacities, radiative transfer). Consider Float32 only for final large arrays if memory becomes limiting.

---

### 5.5 Version Merging Strategy

**Context**: Two source code lineages (from VERSION_COMPARISON.md):

**Castelli version**:
- 4 years of bug fixes (2005-2009)
- Fixed convergence issues
- Fixed opacity calculation bugs
- gfortran compatible

**Kurucz version**:
- Expanded molecule databases (39 → 139 molecules)
- Possible independent bug fixes
- Original author's final version

**Julia migration question**: Which version forms the base?

**Option A - Castelli Base**:
- ✅ More bug fixes (documented)
- ✅ Tested by community over 15+ years
- ✅ Known to work with gfortran
- ❌ Missing Kurucz's molecule expansions
- ❌ May have missed some Kurucz improvements

**Option B - Kurucz Base**:
- ✅ Authoritative (original author)
- ✅ Expanded molecule data
- ✅ Latest scientific updates
- ❌ May lack Castelli's bug fixes
- ❌ Less community testing

**Option C - Merged Base** (Recommended):
1. Start with Castelli structure (proven stable)
2. Incorporate Kurucz molecule data
3. Cross-check bug fixes in both versions
4. Test against both Fortran outputs

**Questions for Paula**:
1. Are there known scientific differences between the two versions?
2. Do you have test cases that fail in one version but not the other?
3. Are the expanded molecules in Kurucz version scientifically important?

✅ **Decision 5.5 RESOLVED** - Merged Base (Option C)

**Paula's answers**:
1. **Not aware** of known numerical differences between versions
2. **No** bug reports to cross-reference between versions
3. **Yes**, agrees with hybrid approach rationale

**Recommendation**: Start with **Castelli structure** (proven stable, documented bug fixes) as base. Incorporate **Kurucz molecule data** (39→139 molecules expansion). Cross-check both versions during validation phase to catch any divergent bug fixes.

**Migration strategy**:
1. Use Castelli atlas12.for as primary reference (better documented bug fix history)
2. Merge Kurucz molecule database expansions
3. Create dual validation: test Julia output against **both** Fortran versions
4. If outputs diverge, investigate which version is more physically accurate
5. Document any differences discovered during migration

---

### 5.6 Migration Priority Ranking

**Context**: Limited time and resources. Can't migrate everything at once.

**Paula's stated priorities** (from MISSION.md):
1. **ATLAS12** - Primary target (API credit application, paper)
2. **SYNTHE** - Primary target (active research tool)
3. Lower priority: ATLAS9, WIDTH, KAPPA9, DFSYNTHE, Hbeta

**Refined priority question**: Within ATLAS12 and SYNTHE, what order?

**Option A - ATLAS12 First, Then SYNTHE**:
Rationale: SYNTHE depends on ATLAS12 output (atmosphere models)

**Migration sequence**:
1. ATLAS12 core iteration loop
2. ATLAS12 input/output parsers
3. ATLAS12 validation against test cases
4. SYNTHE spectrum synthesis
5. SYNTHE line handling
6. SYNTHE validation

**Option B - Core Modules First, Then Integration**:
Rationale: Extract shared computational kernels first

**Migration sequence**:
1. Shared opacity calculations (used by both)
2. Shared atomic data handling (used by both)
3. ATLAS12 specific code
4. SYNTHE specific code
5. Integration and validation

**Option C - Vertical Slice First**:
Rationale: End-to-end functionality proves concept

**Migration sequence**:
1. Minimal ATLAS12 (simple case, e.g., solar abundances)
2. Minimal SYNTHE (limited wavelength range)
3. Validate complete pipeline
4. Expand features incrementally

**Questions for Paula**:
1. Do you need a complete working ATLAS12 ASAP? Or can it be minimal initially?
2. Would an end-to-end demo (even if limited) be valuable early?
3. Are there specific test cases you'd want to validate first?

📋 **Decision needed**: Migration sequence priority?

---

### 5.7 Line Database Strategy

**Context**: SYNTHE requires massive atomic/molecular line databases.

**Current Fortran approach**:
- Binary fort.X files
- Multiple separate line lists (atoms, molecules, etc.)
- ~1-10 GB of data for full wavelength coverage

**Julia migration questions**:

#### Q7a: Line Database Format?
- **Option A**: Keep Fortran binary format (for compatibility)
- **Option B**: Convert to HDF5/JLD2 (faster Julia I/O)
- **Option C**: Use Arrow or Parquet (standard formats)
- **Option D**: SQL database (queryable, scalable)

#### Q7b: Line Database Scope?
- **Option A**: Full Kurucz/Castelli line lists (~10 GB)
- **Option B**: Wavelength-limited subsets (e.g., optical only)
- **Option C**: On-demand download (like AstroPy)

#### Q7c: Line Database Preprocessing?
- **Option A**: Keep line selection in Stage 1 (like ATLAS12)
- **Option B**: Pre-filter databases by wavelength/strength
- **Option C**: Use spatial indexing (k-d tree) for fast lookup

**Questions for Paula**:
1. What wavelength ranges do you typically work with?
2. Do you need all molecules? Or subset?
3. Is download time a concern? Or can we assume local copies?
4. Do you use custom line lists?

📋 **Decision needed**: Line database format and scope?

---

### 5.8 Convergence Criteria

**Context**: ATLAS12 iterates until atmosphere converges.

**Fortran approach** (from code inspection):
- Flux conservation tolerance: `CONVL`
- Temperature change tolerance: `CONVT`
- Maximum iterations: `ITMAXL`
- Heuristic adjustments during iteration

**Julia migration question**: Keep Fortran criteria or modernize?

**Option A - Match Fortran Exactly**:
```julia
struct ConvergenceCriteria
    flux_tolerance::Float64    # CONVL
    temp_tolerance::Float64    # CONVT
    max_iterations::Int        # ITMAXL
end
```

**Option B - Enhanced Criteria**:
```julia
struct ConvergenceCriteria
    flux_tolerance::Float64
    temp_tolerance::Float64
    pressure_tolerance::Float64  # NEW
    max_iterations::Int
    min_iterations::Int          # NEW: prevent premature convergence
    convergence_window::Int      # NEW: require N consecutive converged iterations
end
```

**Option C - Adaptive Criteria**:
- Start with loose tolerances (fast initial convergence)
- Tighten automatically as iterations progress
- Detect oscillations and adjust damping

**Questions for Paula**:
1. Are Fortran's convergence criteria scientifically adequate?
2. Do you ever manually adjust CONVL/CONVT? Why?
3. Have you observed convergence problems (oscillations, premature stop)?
4. Would adaptive tolerances be useful?

📋 **Decision needed**: Convergence criteria design?

---

### 5.9 Error Handling Philosophy

**Context**: Fortran codes have minimal error handling. Bad inputs → crashes or silent wrong answers.

**Julia migration question**: How aggressive should error checking be?

**Option A - Strict Validation** (Recommended):
```julia
function run_atlas12(config::AtlasConfig, atmosphere::AtmosphereState)
    # Validate inputs
    @assert all(config.abundances.log_abundance .> -20) "Unphysical abundances"
    @assert all(atmosphere.temperature .> 0) "Negative temperature"
    @assert issorted(atmosphere.depth) "Depth must be monotonic"

    # ... run calculation
end
```

**Option B - Fortran-Compatible (Permissive)**:
- Accept any input Fortran would accept
- Fail the same way Fortran fails
- Easier validation but less robust

**Option C - Modes**:
- `strict=true` mode for safety (default)
- `legacy=true` mode for Fortran compatibility

**Questions for Paula**:
1. Would you prefer Julia to catch unphysical inputs early?
2. Or match Fortran behavior even when it's wrong?
3. Are there known "bad inputs" that Fortran silently accepts?

📋 **Decision needed**: Error handling strategy?

---

### 5.10 Summary Table - Decision Priority

Ranking decisions by urgency and impact:

| Decision | Urgency | Impact | Can Defer? | Status |
|----------|---------|--------|------------|--------|
| 5.1 ODF vs OS | 🔴 High | Critical for architecture | No - affects entire design | ✅ RESOLVED (OS) |
| 5.2 Two-stage design | 🟡 Medium | Moderate | Somewhat - can start with unified | ✅ RESOLVED (Unified) |
| 5.3 SYNTHE unification | 🟡 Medium | Moderate | Yes - Stage 2 work | ✅ RESOLVED (Unified + stages) |
| 5.4 Precision | 🔴 High | Critical for validation | No - affects all numerics | ✅ RESOLVED (Mixed Float64/32) |
| 5.5 Version merging | 🔴 High | Critical for baseline | No - needed before coding | ✅ RESOLVED (Castelli + Kurucz) |
| 5.6 Migration priority | 🟢 Low | Moderate | Yes - can adjust as we go | 🔲 Deferred |
| 5.7 Line databases | 🟡 Medium | Large | Somewhat - can start simple | 🔲 Deferred |
| 5.8 Convergence | 🟢 Low | Small | Yes - can match Fortran initially | 🔲 Deferred |
| 5.9 Error handling | 🟢 Low | Small | Yes - can add gradually | 🔲 Deferred |

**Status Update (2025-11-08)**:
- ✅ **All high-urgency decisions resolved** (5.1, 5.4, 5.5)
- ✅ **Medium-urgency architectural decisions resolved** (5.2, 5.3)
- 🔲 **Lower-priority decisions deferred** (5.6-5.9) - can be decided during implementation

**Recommended next steps**:
1. ✅ ~~Paula decides on high-urgency items~~ - **COMPLETE**
2. Document decisions in MISSION.md ✱ **IN PROGRESS**
3. Use decisions to guide Phase 3 (Physics Pipeline) and Phase 4 (Migration Assessment)

---

## VI. Migration Risk Assessment

Identifying what can go wrong and how to prevent it.

---

### 6.1 Undocumented Algorithms ("Here Be Dragons" 🐉)

**Risk**: Fortran code contains calculations with minimal comments. Incorrect translation → silent wrong answers.

#### High-Risk Examples from Code Inspection:

**Example 1 - Voigt Profile Calculation**:
```fortran
C     Humlicek approximation (JQSRT 27, 437, 1982)
      IF(X.LT.5.0 .AND. ABS(Y).LT.10.0)THEN
        ... complex polynomial ...
      ELSE
        ... different approximation ...
      ENDIF
```

**Risk factors**:
- Magic constants (5.0, 10.0) - what if these are changed?
- No comment on accuracy requirements
- Citation to 1982 paper (need to verify algorithm)

**✅ ANALYZED** - See `docs/archaeology/DEEP_DIVES/01_VOIGT_PROFILE.md` for complete analysis:
- Identified 4-regime piecewise algorithm with 13 undocumented magic constants
- Algorithm uses polynomial approximations with coefficients derived from H0TAB/H1TAB lookup tables
- Float32 acceptable (target accuracy ~2%, measured max error 1.5%)
- Critical boundary: `IF(A+V.GT.3.2)` switches between regimes

**Mitigation**:
- [x] ~~Obtain original Humlicek 1982 paper~~ → Actually uses DIFFERENT algorithm (see Deep Dive 01)
- [x] ~~Verify algorithm~~ → Regime boundaries and coefficients documented in Deep Dive 01
- [ ] Add test cases with known Voigt profile values (use Fortran output as reference)
- [x] ~~Document accuracy requirements~~ → Target ~2% for spectral synthesis applications

---

**Example 2 - Opacity Interpolation**:
```fortran
C     Log-log interpolation for opacity
      KAPPA = 10.0**(A0 + A1*LOG10(T) + A2*LOG10(T)**2)
```

**Risk factors**:
- Assumes T > 0 (no bounds checking)
- Polynomial degree (quadratic) - is this physically justified?
- No handling of extrapolation outside valid range

**Mitigation**:
- [ ] Document valid temperature range
- [ ] Add bounds checking in Julia
- [ ] Test edge cases (very low/high T)
- [ ] Flag extrapolation warnings

---

**Example 3 - Population Corrections**:
```fortran
C     Iterative correction with damping factor
      XNEW = XOLD + 0.3*(XCALC - XOLD)
```

**Risk factors**:
- Magic constant 0.3 - why this value?
- No adaptive damping (might be too aggressive or too conservative)
- No comment on convergence theory

**✅ ANALYZED** - See `docs/archaeology/DEEP_DIVES/02_POPULATIONS.md` for complete analysis:
- Damping factor 0.3 found in NELECT subroutine (electron density iteration)
- Used because Saha equation ratios span 40+ orders of magnitude (exp(-31.6) for H ionization at 5000K)
- Undamped iteration would oscillate wildly; 0.3 provides stable convergence
- Float64 REQUIRED for populations (Float32 underflows to exactly 0.0)

**Mitigation**:
- [x] ~~Test sensitivity~~ → Damping is critical for stability (see Deep Dive 02, Section 3.2)
- [ ] Consider adaptive damping in Julia (but only after validating against Fortran)
- [x] ~~Document when/why~~ → Needed because population ratios are exponentially sensitive to T

---

#### Categories of Undocumented Code:

| Category | Examples | Risk Level | Mitigation Strategy | Status |
|----------|----------|------------|---------------------|--------|
| Published algorithms | Voigt profiles, Rosseland means | 🟢 Low | Verify against papers | ✅ Voigt analyzed (Deep Dive 01) |
| Numerical recipes | Interpolation, integration | 🟡 Medium | Test edge cases | 🔲 Not yet |
| Heuristics | Damping factors, iteration limits | 🟡 Medium | Sensitivity tests | ✅ Damping analyzed (Deep Dive 02) |
| Unknown origin | Magic constants, unexplained conditionals | 🔴 High | Flag for Paula review | ⚠️ ~13 constants in Voigt alone |

**Progress Update**:
- **Voigt profile** (Deep Dive 01): Analyzed 4-regime algorithm, documented 13 magic constants, validated Float32 precision
- **Saha-Boltzmann** (Deep Dive 02): Analyzed population calculations, validated Float64 requirement, documented damping factor
- **Remaining**: Rosseland means, interpolation methods, integration algorithms, convergence criteria

📋 **TODO**: Create catalog of all "magic numbers" in ATLAS12 (scan for REAL constants) - partially done for Voigt, need systematic scan

---

### 6.2 Precision-Sensitive Calculations

**Risk**: Julia uses different default precision or rounding. Tiny differences accumulate → wrong results.

#### Known Precision-Sensitive Areas:

**Area 1 - Saha-Boltzmann Equation**:
- Computes population ratios (can span 40+ orders of magnitude)
- Uses `EXP(-chi/kT)` where chi is ionization potential
- **Risk**: Overflow/underflow if not handled carefully
- **✅ ANALYZED** - See `docs/archaeology/DEEP_DIVES/02_POPULATIONS.md`:
  - Example: H ionization at 5000K → exp(-31.6) = 1.7 × 10^(-14)
  - Float32 underflows to exactly 0.0 → catastrophic failure
  - Float64 REQUIRED (no compromise)
- **Mitigation**: Julia Float64 for all population variables, preserve Fortran's iterative method with damping

**Area 2 - Line Opacity Summation**:
- Sums ~1 million lines per depth point
- Each line: strength × profile × damping
- **Risk**: Catastrophic cancellation, accumulation of rounding errors
- **Mitigation**: Kahan summation or compensated summation in Julia

**Area 3 - Radiative Transfer Integration**:
- Integrates source function over optical depth
- Uses trapezoidal rule over 50-100 depth points
- **Risk**: Different numerical integration → different flux
- **Mitigation**: Match Fortran integration method exactly initially

**Area 4 - Convergence Tests**:
```fortran
IF(ABS((TNEW-TOLD)/TOLD).LT.1.0E-4)THEN
```
- Relative change tolerance 1e-4
- **Risk**: Float32 vs Float64 affects when this triggers
- **Mitigation**: Use same precision for iteration variables as Fortran

---

#### Precision Validation Strategy:

1. **Bit-for-bit validation** (initial):
   - Use same precision as Fortran (Float32 where used)
   - Match intermediate values (not just final output)
   - Tolerance: < 1e-7 relative difference

2. **Physics validation** (post-initial):
   - Compare final model atmospheres
   - Tolerance: ~0.1% in T(depth), flux
   - Verify physical conservation laws

3. **Cross-validation**:
   - Compare Julia vs Castelli Fortran
   - Compare Julia vs Kurucz Fortran
   - If Julia is between the two Fortran versions, probably OK

---

### 6.3 Performance Bottlenecks

**Risk**: Julia migration is slower than Fortran → unusable for production science.

#### Profiling Fortran Performance (from code inspection):

**ATLAS12 runtime breakdown** (estimated from structure):
- **Stage 1**: Line selection (~10-20 min)
  - Reading line databases: ~60% (I/O bound)
  - Sorting and filtering: ~40% (CPU bound)
- **Stage 2**: Iteration (~1-4 hours)
  - Opacity calculation: ~70% (most expensive)
  - RT integration: ~20%
  - Population calculation: ~8%
  - Convergence tests, I/O: ~2%

**SYNTHE runtime breakdown** (estimated):
- Line accumulation: ~40% (I/O + merging)
- Opacity calculation: ~40%
- RT solving: ~15%
- Broadening: ~5%

---

#### Critical Performance Requirements:

| Operation | Fortran Performance | Julia Target | Concern Level |
|-----------|---------------------|--------------|---------------|
| Voigt profile eval | ~1 μs/call | < 1.5 μs | 🟡 Medium |
| Line opacity sum | ~100 ms (1M lines) | < 150 ms | 🟡 Medium |
| RT integration | ~10 ms/iteration | < 15 ms | 🟢 Low |
| File I/O (binary) | ~1 GB/min | Match | 🔴 High |

**Why file I/O is critical**: SYNTHE reads multi-GB line databases. If Julia I/O is 10× slower, pipeline becomes unusable.

---

#### Performance Optimization Strategy:

**Phase 1 - Get it working**:
- Don't optimize prematurely
- Focus on correctness first
- Profile to find actual bottlenecks (not guessed ones)

**Phase 2 - Match Fortran speed**:
- Optimize hot loops (identified by profiling)
- Use `@inbounds`, `@simd` where safe
- Preallocate arrays, avoid allocations in loops

**Phase 3 - Beat Fortran** (if needed):
- Parallelize embarrassingly parallel parts (depth point loops)
- Use Julia's strengths (metaprogramming, dispatch)
- Consider GPU acceleration for opacity summation

**Acceptable outcomes**:
- ✅ Within 2× of Fortran: Good enough
- ✅ Within 5× of Fortran: Acceptable if workflow improvements compensate
- ❌ > 10× slower: Needs optimization before publication

---

### 6.4 Testing and Validation Challenges

**Risk**: Tests pass but code is scientifically wrong.

#### Challenge 1: Lack of Reference Data

**Problem**: No comprehensive test suite exists for Fortran codes.

**What we have**:
- Example input files (upstream/*/examples/)
- HTML documentation showing some outputs
- Paula's domain knowledge

**What we don't have**:
- Ground truth test cases with known correct answers
- Edge case tests
- Regression test suite

**Mitigation**:
1. **Generate Fortran outputs as test fixtures**:
   - Run Castelli ATLAS12 with various inputs → save outputs
   - Run Kurucz ATLAS12 with same inputs → save outputs
   - Julia must reproduce within tolerance
2. **Create physics-based tests**:
   - Flux conservation: ∫F_ν dν should match σT^4
   - Population ratios: Should match Saha equation
   - Optical depth: τ = ∫κρ dz (testable independently)
3. **Boundary cases**:
   - Solar abundances (well-studied reference)
   - Pure H atmosphere (analytically solvable in some limits)
   - Isothermal atmosphere (simpler convergence)

---

#### Challenge 2: Non-Deterministic Behavior

**Problem**: Some Fortran codes have iteration-dependent output.

**Example - ATLAS12 convergence**:
- Different damping on different iterations
- Convergence may take 10-50 iterations (variable)
- Final answer depends on iteration history

**Implications**:
- Can't do exact bit-for-bit comparison of final output
- Must test convergence properties, not exact values
- Need tolerance-based tests

**Test strategy**:
```julia
@testset "ATLAS12 convergence" begin
    result = run_atlas12(test_config, initial_guess)

    # Test physical properties, not exact values
    @test all(result.temperature .> 0)  # Positive temperature
    @test flux_conservation(result) < 0.01  # 1% flux error
    @test result.converged == true  # Did converge
    @test result.iterations < 100  # Reasonable iteration count

    # Test against Fortran within tolerance
    fortran_result = load_fortran_output("test_case_1.out")
    @test isapprox(result.temperature, fortran_result.temperature, rtol=0.01)
end
```

---

#### Challenge 3: Undocumented Input Format Assumptions

**Problem**: Fortran codes silently assume input format details.

**Examples**:
- Column positions in fixed-format files
- Units (are abundances log or linear? Normalized to H or total?)
- Required vs optional parameters

**Risk**: Julia parser reads input differently → garbage in, wrong answer out.

**Mitigation**:
- [ ] Document ALL input file formats with examples
- [ ] Create schema or validation for input files
- [ ] Test with Fortran example inputs (upstream/*/examples/)
- [ ] Add strict input validation in Julia (fail fast on bad input)

---

### 6.5 File I/O and Format Compatibility Risks

**Risk**: Julia can't read/write Fortran's binary fort.X files → can't validate or interoperate.

#### Fortran Binary Format Issues:

**Problem 1 - Unformatted I/O**:
```fortran
WRITE(12)N,X,Y,Z  ! Unformatted write
```

Fortran adds **record markers** (4-byte integers before/after each record). Format is compiler-dependent.

**Julia solution**:
```julia
# Read Fortran unformatted file (gfortran format)
function read_fortran_record(io::IO)
    # Read record length (4 bytes, little-endian)
    len1 = read(io, Int32)

    # Read data
    data = read(io, len1)

    # Read trailing record length (should match len1)
    len2 = read(io, Int32)
    @assert len1 == len2 "Fortran record marker mismatch"

    return data
end
```

**Testing**: Use actual fort.X files from Fortran runs to validate reader.

---

**Problem 2 - Mixed Precision in Binary Files**:
Some files mix REAL*4 and REAL*8. Must know exact layout.

**Example - SYNTHE fort.19** (hypothetical):
```
Record 1: N (INT*4), WLBEG (REAL*8), WLEND (REAL*8)
Record 2: X(1:N) (REAL*4)
Record 3: Y(1:N) (REAL*8)
```

**Julia solution**: Document format, create struct-based reader:
```julia
struct Fort19Header
    n::Int32
    wl_begin::Float64
    wl_end::Float64
end

function read_fort19(path::String)
    open(path) do io
        header_data = read_fortran_record(io)
        header = reinterpret(Fort19Header, header_data)[1]

        x_data = read_fortran_record(io)
        x = reinterpret(Float32, x_data)

        y_data = read_fortran_record(io)
        y = reinterpret(Float64, y_data)

        return (header=header, x=x, y=y)
    end
end
```

📋 **TODO**: Document binary format for ALL fort.X files used in ATLAS12/SYNTHE pipeline

---

**Problem 3 - Endianness**:
Fortran binaries may be big-endian or little-endian depending on system.

**Mitigation**: Auto-detect or require format specification.

---

### 6.6 Convergence and Numerical Stability Risks

**Risk**: Julia code doesn't converge, or converges to wrong solution.

#### Known Fortran Convergence Issues (from VERSION_COMPARISON.md):

1. **Castelli 2005 fix**: "Fixed convergence failure for hot stars (T > 30,000 K)"
   - **Implication**: Original algorithm was unstable in some regimes
   - **Risk**: Julia might reintroduce this bug if not careful

2. **Castelli 2006 fix**: "Improved damping factor for electron density iteration"
   - **Implication**: Damping is critical for convergence
   - **Risk**: Different damping → different convergence behavior

3. **Oscillation reports** (anecdotal from documentation):
   - Some models oscillate between two solutions
   - Requires manual intervention (adjust damping, change initial guess)

---

#### Convergence Risk Mitigation:

**Strategy 1 - Start with Known-Good Cases**:
- Solar model (T_eff = 5777 K, log g = 4.44, solar abundances)
- This should converge easily
- If it doesn't, something is fundamentally wrong

**Strategy 2 - Implement Convergence Diagnostics**:
```julia
struct ConvergenceDiagnostics
    iteration::Int
    flux_residual::Float64
    temp_change::Float64
    damping_factor::Float64
    oscillation_detected::Bool
end

function detect_oscillation(history::Vector{ConvergenceDiagnostics})
    # Check if flux residual is alternating
    residuals = [h.flux_residual for h in history[end-3:end]]
    # If sign alternates, we're oscillating
    return sign.(residuals) == [+1, -1, +1, -1] || ...
end
```

**Strategy 3 - Adaptive Damping**:
- If oscillation detected, reduce damping
- If convergence is slow, increase damping
- Log all changes for debugging

**Strategy 4 - Fail Gracefully**:
- Don't return garbage if no convergence
- Throw informative error with diagnostics
- Suggest user actions (adjust tolerances, change initial guess)

---

### 6.7 High-Risk Code Sections (Prioritized)

Based on all above analysis, here are the highest-risk areas requiring extra care:

| Rank | Code Section | Risk Type | Likelihood | Impact | Mitigation Priority | Deep Dive |
|------|--------------|-----------|------------|--------|---------------------|-----------|
| 1 | Saha-Boltzmann population calculation | Precision, Overflow | High | Critical | 🔴 Highest | 🐲✨ Deep Dive 02 |
| 2 | Voigt profile evaluation | Algorithm, Performance | Medium | High | 🔴 Highest | 🐲✨ Deep Dive 01 |
| 3 | Line opacity summation | Precision, Performance | Medium | High | 🔴 Highest | 🐲✨ Deep Dive 03 |
| 4 | Fort.X binary I/O | Format compatibility | High | High | 🔴 Highest | 🐲✨ Deep Dive 04 |
| 5 | Iteration damping logic | Convergence | Medium | High | 🟡 High | 🐲✨ Deep Dive 06 |
| 6 | RT integration (JOSH) | Algorithm, Precision | Low | High | 🟡 High | 🐲✨ Deep Dive 05 |
| 7 | ODF interpolation (if used) | Algorithm | Low | Medium | 🟡 High | 🔲 Pending |
| 8 | Convergence criteria | Stability | Medium | Medium | 🟢 Medium | 🔲 Pending |
| 9 | Input file parsing | Format assumptions | High | Low | 🟢 Medium | 🔲 Pending |
| 10 | Output formatting | Compatibility | Low | Low | 🟢 Low | 🔲 Pending |

**High-priority validation** (do these first):
- Items ranked 1-4 above
- Solar abundance test case
- Comparison against both Castelli and Kurucz outputs

---

### 6.8 Risk Mitigation Roadmap

#### Pre-Migration (Before Writing Julia Code):
- [x] Document architecture (ARCHITECTURE_DETAILS.md)
- [x] Identify critical decision points (Section V)
- [x] Map high-risk areas (this section)
- [x] 🐲✨ Deep dive on Rank #1 risk (Populations) - Deep Dive 02
- [x] 🐲✨ Deep dive on Rank #2 risk (Voigt) - Deep Dive 01
- [x] 🐲✨ Deep dive on Rank #3 risk (Line Opacity) - Deep Dive 03
- [x] 🐲✨ Deep dive on Rank #4 risk (Binary I/O) - Deep Dive 04
- [x] 🐲✨ Deep dive on Rank #5 risk (Iteration Damping/TCORR) - Deep Dive 06
- [x] 🐲✨ Deep dive on Rank #6 risk (RT Integration/JOSH) - Deep Dive 05
- [x] Paula decides on critical questions (Section V) - 5/10 resolved (5.1-5.5)
- [ ] Generate Fortran reference outputs for test cases
- [x] ~~Obtain cited papers (Humlicek, etc.)~~ - Deep Dive 01 shows algorithm differs from citation

#### During Migration:
- [ ] Implement in order of dependency (constants → config → iteration)
- [ ] Write tests for each module BEFORE migrating it
- [ ] Validate against Fortran after each module
- [ ] Profile performance continuously
- [ ] Flag any "I don't understand this" sections for Paula

#### Post-Migration Validation:
- [ ] Bit-for-bit comparison (where precision matches)
- [ ] Physics validation (flux conservation, etc.)
- [ ] Cross-validation (Castelli vs Kurucz vs Julia)
- [ ] Edge case testing (extreme T, unusual abundances)
- [ ] Performance benchmarking
- [ ] Long-run stability tests (100+ iterations)

#### Red Flags to Watch For:
⚠️ **Stop and investigate if**:
- Julia and Fortran differ by > 1% in T(depth)
- Convergence takes > 2× iterations vs Fortran
- Performance is > 5× slower than Fortran
- Flux conservation fails (> 5% error)
- Models fail to converge for solar case

---

### 6.9 Validation Test Suite Proposal

#### Tier 1: Smoke Tests (Must Pass)
- ✅ Solar model (T=5777K, log g=4.44, solar abundances)
- ✅ Flux conservation (< 1% error)
- ✅ Positive temperature (all depths)
- ✅ Convergence achieved (< 100 iterations)

#### Tier 2: Fortran Comparison Tests
- ✅ Match Castelli output (< 1% RMSE in T, flux)
- ✅ Match Kurucz output (< 1% RMSE)
- ✅ Intermediate values match (populations, opacities)

#### Tier 3: Edge Cases
- ✅ Hot star (T=30,000K) - known convergence challenge
- ✅ Cool star (T=3,000K) - molecular opacity important
- ✅ High metallicity ([Fe/H] = +0.5)
- ✅ Low metallicity ([Fe/H] = -3.0)
- ✅ Pure H atmosphere

#### Tier 4: Physics Tests (Independent of Fortran)
- ✅ Hydrostatic equilibrium: dP/dz = ρg
- ✅ Flux conservation: ∫F_ν dν = σT_eff^4
- ✅ Population ratios match Saha equation
- ✅ Optical depth monotonic: dτ/dz > 0

#### Tier 5: Stress Tests
- ✅ 1000-iteration run (stability)
- ✅ Extreme abundances (0.01× to 100× solar)
- ✅ Large wavelength range (100 Å to 10 μm)
- ✅ Performance: 10 models in < 1 day

---

### 6.10 Risk Summary and Recommendations

#### Highest Risks:
1. **Precision errors in population calculation** - could fail silently
2. **Binary file format incompatibility** - prevents validation
3. **Performance degradation** - makes code unusable
4. **Undocumented algorithm misunderstanding** - wrong physics

#### Risk Reduction Priorities:
1. 🔴 **Immediate** (before writing code):
   - Document all binary file formats
   - Generate comprehensive Fortran test outputs
   - Get Paula's decisions on critical questions (Section V)
2. 🟡 **Early migration** (first modules):
   - Implement file I/O and validate against Fortran
   - Implement physical constants and validate
   - Create testing infrastructure
3. 🟢 **During migration**:
   - Continuous validation against Fortran
   - Profile performance at each step
   - Maintain risk log (what's unclear, what might fail)

#### Success Criteria for Low-Risk Migration:
- ✅ < 1% difference from Fortran on standard test cases
- ✅ Performance within 2× of Fortran
- ✅ 100% of Tier 1-2 tests passing
- ✅ Zero known "silent failure" modes
- ✅ Paula can reproduce her published results

---

## Conclusion

This document provides the **architectural foundation** for migrating ATLAS12 and SYNTHE from Fortran to Julia.

### Key Takeaways:

1. **Don't translate line-by-line** - the COMMON block architecture must be redesigned
2. **57 COMMON blocks → 5 clean struct types** (Section IV)
3. **10 critical decisions require Paula's input** (Section V)
4. **Validation strategy is critical** - need comprehensive Fortran reference data
5. **Risks are manageable** - if we validate continuously and test rigorously

### Next Steps for Paula:

1. **Review Section V** - Decide on high-priority architectural questions
2. **Generate test data** - Run Fortran codes with standard inputs, save outputs
3. **Prioritize features** - Which ATLAS12/SYNTHE features are essential for Phase 1?

### Next Steps for Migration:

1. **Phase 3** (current mission) - Physics pipeline documentation
2. **Phase 4** - Migration complexity assessment
3. **Phase 5** - API usage projection for research credit
4. **Future** - Begin Julia implementation using this architectural blueprint

---

**Document Status**: ✅ COMPLETE - All 6 sections finished

**Total Length**: ~2,000 lines (estimated)

**Created**: 2025-11-08, Phase 2B
**Authors**: Claude (AI assistant) + Paula (astrophysicist, guide)
**Purpose**: Guide architectural decisions for ATLAS Julia migration
**Audience**: Future-Claude (migration implementation), Paula (decision-making), Peer reviewers (A&C paper)

---

*End of ARCHITECTURE_INSIGHTS.md*
