# Fortran Validation Mode Integration Guide

**Date**: 2025-11-15
**Author**: Claude (Local), Paula Coelho
**Status**: Ready for implementation in Task 6+

---

## Overview

This guide explains how to integrate the `use_fortran_validation` flag throughout the synthesis pipeline to enable bit-for-bit Fortran validation.

## Configuration Flag

**File**: `src/Synthe/src/structs.jl`

The `SyntheConfig` struct now includes:

```julia
struct SyntheConfig
    # ... existing fields ...
    use_fortran_validation::Bool  # true = Fortran-exact mode, false = optimized
end
```

**Default**: `false` (use optimized Julia implementations)

**Usage**:
```julia
# Enable Fortran validation mode
config = SyntheConfig(
    wave_start = 5000.0,
    wave_end = 5100.0,
    use_fortran_validation = true  # <-- Enable validation
)
```

---

## Integration Points

There are **3 main locations** where validation mode affects behavior:

### 1. Voigt Profile (Line Shapes)

**Files**:
- `src/Synthe/src/voigt.jl` - Optimized 4-regime Julia implementation
- `src/Synthe/src/voigt_fortran_exact.jl` - Fortran-exact 3-regime implementation

**Integration location**: `src/Synthe/src/line_opacity.jl` (Task 6)

**Dispatch strategy**:

```julia
"""
Compute Voigt profile with validation mode support
"""
function compute_voigt_profile(v::Float64, a::Float64, config::SyntheConfig)
    if config.use_fortran_validation
        # Use Fortran-exact 3-regime approximation
        # Matches atlas12.for VOIGT function exactly
        return voigt_profile_fortran_exact(v, a)
    else
        # Use optimized Julia 4-regime implementation
        # ~2-5% accuracy, faster than Fortran
        return voigt_profile(v, a)
    end
end
```

**Why two implementations**:
- **Fortran mode**: Matches atlas12.for for opacity table validation
- **Julia mode**: Higher accuracy in regime 1, better performance

**When to use Fortran mode**:
- Validating against ATLAS12 opacity tables
- Debugging numerical differences
- Reproducing Kurucz reference spectra

**When to use Julia mode**:
- Production synthesis runs
- Research applications requiring accuracy
- Performance-critical applications

---

### 2. Radiative Transfer (JOSH Algorithm)

**Files**:
- `src/Synthe/src/radiative_transfer.jl` - Optimized Feautrier solver
- `src/Synthe/src/radiative_transfer_fortran_exact.jl` - JOSH with COEFJ/COEFH tables

**Integration location**: `src/Synthe/src/radiative_transfer.jl`

**Dispatch strategy**:

```julia
"""
Solve radiative transfer equation with validation mode support
"""
function solve_radiative_transfer(
    atmosphere::AtmosphereModel,
    opacity::Vector{Float64},
    config::SyntheConfig
)
    if config.use_fortran_validation
        # Use JOSH algorithm with pretabulated COEFJ/COEFH
        # Matches SYNTHE spectrv.for exactly
        return solve_radiative_transfer_josh(atmosphere, opacity)
    else
        # Use optimized Feautrier solver
        # More accurate, better numerical stability
        return solve_radiative_transfer_feautrier(atmosphere, opacity)
    end
end
```

**Why two implementations**:
- **Fortran JOSH**: Matches SYNTHE for spectrum validation
- **Julia Feautrier**: Better conditioning, more robust

**When to use Fortran mode**:
- Validating against SYNTHE output spectra
- Reproducing published Kurucz line profiles
- Debugging radiative transfer convergence

**When to use Julia mode**:
- New atmospheric models
- Extreme parameter regimes
- Publication-quality spectra

---

### 3. Partition Functions (Statistical Equilibrium)

**Files**:
- `src/Synthe/src/partition_functions.jl` - Optimized analytical formulas
- `src/Synthe/src/partition_functions_fortran.jl` - NNN array interpolation

**Integration location**: `src/Synthe/src/populations.jl`

**Dispatch strategy**:

```julia
"""
Compute partition function with validation mode support
"""
function compute_partition_function(
    element::Int,
    ion_stage::Int,
    T::Float64,
    config::SyntheConfig
)
    if config.use_fortran_validation
        # Use NNN array interpolation with POTION ionization potentials
        # Matches atlas7v.for PFSAHA exactly
        return partition_function_fortran(element, ion_stage, T)
    else
        # Use optimized analytical formulas
        # More accurate, no interpolation error
        return partition_function(element, ion_stage, T)
    end
end
```

**Why two implementations**:
- **Fortran mode**: Uses pretabulated NNN data + POTION IPs
- **Julia mode**: Direct calculation from energy levels

**When to use Fortran mode**:
- Validating population fractions
- Reproducing Kurucz abundances
- Debugging LTE/NLTE solver

**When to use Julia mode**:
- Arbitrary temperature grids
- Custom atomic data
- Research on partition function accuracy

---

## Implementation Checklist

When implementing Task 6 (Line Opacity Integration):

### Step 1: Add config parameter to all functions

```julia
# Before
function compute_line_opacity(atmosphere, lines)
    # ...
end

# After
function compute_line_opacity(atmosphere, lines, config::SyntheConfig)
    # Now config.use_fortran_validation is available
end
```

### Step 2: Add dispatch wrappers

For each of the 3 integration points above, create wrapper functions that:
1. Check `config.use_fortran_validation` flag
2. Call appropriate implementation
3. Log which mode was used (optional, for debugging)

```julia
function compute_voigt(v, a, config)
    if config.use_fortran_validation
        @debug "Using Fortran validation mode for Voigt"
        return voigt_profile_fortran_exact(v, a)
    else
        @debug "Using optimized Julia Voigt"
        return voigt_profile(v, a)
    end
end
```

### Step 3: Update calling code

Ensure all callers pass the `config` parameter:

```julia
# In line_opacity_integration.jl
function integrate_line_opacity(atmosphere, lines, config)
    for line in lines
        # ...
        H = compute_voigt(v, a, config)  # <-- Pass config
        # ...
    end
end
```

### Step 4: Write validation tests

Create tests that compare Fortran mode against reference data:

```julia
@testset "Voigt Fortran validation" begin
    config = SyntheConfig(use_fortran_validation = true)

    # Load reference from Fortran test_voigt.f output
    ref = CSV.read("test/reference/voigt_fortran.csv")

    for row in eachrow(ref)
        H_julia = compute_voigt(row.v, row.a, config)
        @test H_julia ≈ row.voigt_value rtol=1e-10
    end
end
```

---

## Testing Strategy

### Unit Tests (Per-function validation)

**Location**: `test/unit/`

Test each validation function independently:

1. **test_voigt_fortran.jl** - Voigt profile validation
   - Test all 3 regimes against Fortran output
   - Verify regime boundaries
   - Check special cases (a=0, v=0, etc.)

2. **test_josh_fortran.jl** - Radiative transfer validation
   - Test COEFJ/COEFH table indexing
   - Verify integration weights
   - Compare emergent intensity with SYNTHE

3. **test_partition_fortran.jl** - Partition function validation
   - Test NNN decoding
   - Verify POTION indexing
   - Compare with PFSAHA output

### Integration Tests (End-to-end validation)

**Location**: `test/integration/`

Test complete synthesis pipeline:

```julia
@testset "Full synthesis with Fortran validation" begin
    # Enable Fortran mode
    config = SyntheConfig(
        wave_start = 5000.0,
        wave_end = 5010.0,
        use_fortran_validation = true
    )

    # Load test atmosphere
    atm = read_atmosphere("test/data/solar_atlas.mod")

    # Load test lines
    lines = read_linelist("test/data/fe_lines.dat")

    # Synthesize spectrum
    spectrum = synthesize_spectrum(atm, lines, config)

    # Load Fortran reference
    ref_spectrum = read_synthe_output("test/reference/solar_fe.syn")

    # Compare (should match to ~1e-6)
    @test spectrum.flux ≈ ref_spectrum.flux rtol=1e-6
end
```

---

## Performance Comparison

Expected performance characteristics:

| Component | Fortran Mode | Julia Mode | Speedup |
|-----------|--------------|------------|---------|
| Voigt profile | 100 ns/call | 80 ns/call | 1.25× |
| Radiative transfer | 50 μs/depth | 30 μs/depth | 1.67× |
| Partition function | 200 ns/call | 150 ns/call | 1.33× |
| **Full synthesis** | **~10 s** | **~7 s** | **1.43×** |

**Notes**:
- Fortran mode is slower due to table lookups and interpolation
- Julia mode benefits from JIT optimization and SIMD
- For validation, use Fortran mode; for production, use Julia mode

---

## Example Usage Patterns

### Pattern 1: Development and Debugging

```julia
# Start with Fortran validation to ensure correctness
config_debug = SyntheConfig(
    wave_start = 5000.0,
    wave_end = 5100.0,
    use_fortran_validation = true  # Validate first
)

spectrum_debug = synthesize_spectrum(atm, lines, config_debug)

# Once validated, switch to optimized mode
config_prod = SyntheConfig(
    wave_start = 5000.0,
    wave_end = 5100.0,
    use_fortran_validation = false  # Use optimized
)

spectrum_prod = synthesize_spectrum(atm, lines, config_prod)

# Verify they're close
@test spectrum_debug.flux ≈ spectrum_prod.flux rtol=1e-4
```

### Pattern 2: Continuous Integration Tests

```julia
# In CI/CD pipeline, run both modes
@testset "CI validation" begin
    for use_fortran in [true, false]
        config = SyntheConfig(use_fortran_validation = use_fortran)

        # Test standard cases
        test_solar_spectrum(config)
        test_metal_poor_star(config)
        test_hot_star(config)
    end

    # Compare modes
    @test fortran_result ≈ julia_result rtol=1e-3
end
```

### Pattern 3: Research Applications

```julia
# For publication-quality spectra, use Julia mode
config_publication = SyntheConfig(
    wave_start = 3000.0,
    wave_end = 10000.0,
    resolving_power = 500000.0,  # High resolution
    use_fortran_validation = false  # Use accurate Julia mode
)

# Only use Fortran mode to validate against Kurucz references
config_reference = SyntheConfig(
    wave_start = 5000.0,
    wave_end = 5100.0,
    use_fortran_validation = true  # Match Kurucz exactly
)
```

---

## Implementation Status

### ✅ Completed

1. **Config flag added** (`structs.jl`)
   - `use_fortran_validation::Bool` field
   - Documentation for usage
   - Default = false

2. **Fortran-exact implementations ready**
   - `voigt_fortran_exact.jl` (282 lines) - 3-regime Voigt
   - `radiative_transfer_fortran_exact.jl` (279 lines) - JOSH algorithm
   - `partition_functions_fortran.jl` (373 lines) - NNN interpolation

3. **POTION ionization potentials extracted**
   - `potion_data.jl` (999 ionization potentials)
   - Verified against NIST values (H, He, Fe)
   - Integrated with partition_function_fortran()

4. **Data files extracted**
   - NNN partition function array (2,244 integers)
   - POTION ionization potentials (999 values)
   - COEFJ/COEFH radiative transfer tables (65 values each)

### ⏳ Pending (Task 6+)

1. **Dispatch wrappers** - Create wrapper functions for 3 integration points
2. **Config parameter threading** - Pass config through all function calls
3. **Validation tests** - Compare Fortran mode against reference outputs
4. **Documentation updates** - Add examples to user guide
5. **Performance benchmarks** - Measure Fortran vs Julia mode timing

---

## References

- **CODE_REVIEW_2025-11-15.md** - Issue #1 (Integration)
- **FORTRAN_VALIDATION_MODE.md** - Phase 1 & 2 implementation details
- **HANDOFF_TO_PAULA.md** - Steps 1-4 completion summary
- **VOIGT_PROFILE_ANALYSIS.md** - SYNTHE vs ATLAS12 Voigt differences

---

## Questions?

If you encounter issues during integration:

1. Check that config parameter is passed to all functions
2. Verify that validation functions are exported from Synthe module
3. Test each integration point independently before full synthesis
4. Compare Fortran mode against reference data files in `test/reference/`

For Fortran driver compilation issues, see `test/fortran_drivers/README.md`.
