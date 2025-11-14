# CCW Task: Phase 5 Step 2 - Line Readers & Continuum Opacity

**Author**: Claude (Local), Paula Coelho
**Date**: 2025-11-13
**For**: Claude Code Web (CCW) instance
**Estimated Budget**: $13-20 (fits remaining CCW credit)

---

## Context

Phase 5 Step 1 is **complete** with 250/250 tests passing:
- ✅ Physical constants, unit conversions, physics formulas
- ✅ Voigt profile (14.9 ns/call, 67M calls/sec)
- ✅ Line opacity framework
- ✅ Zero dependencies (pure Julia stdlib)

**Your mission**: Implement Step 2 (line readers + continuum opacity) using **strict TDD** to enable full spectrum synthesis.

---

## Development Philosophy: Strict Test-Driven Development (TDD)

### Red-Green-Refactor Cycle

**CRITICAL**: You MUST follow this workflow for ALL implementations:

1. **RED**: Write a failing test first
   - Test describes desired behavior
   - Run test → should FAIL (function not implemented yet)
   - Test is clear, specific, and validates one behavior

2. **GREEN**: Write minimal code to pass the test
   - Implement just enough to make the test pass
   - Don't over-engineer
   - Don't add features not tested

3. **REFACTOR**: Clean up code while tests pass
   - Remove duplication
   - Improve names
   - Optimize performance
   - All tests must still pass

### Example TDD Workflow

```julia
# RED: Write failing test
@testset "Parse single gfall line" begin
    line_str = "4045.8138  0.280 26.0  0.000 28520.868 4.0 6.0 -7.640 -6.420 -5.970"
    line = parse_gfall_line(line_str)

    @test line.wavelength ≈ 4045.8138
    @test line.loggf ≈ 0.280
    @test line.element_ion ≈ 26.0  # Fe I
end
# Run test → FAILS (parse_gfall_line not defined)

# GREEN: Implement minimal function
function parse_gfall_line(line_str::String)::SpectralLine
    parts = split(line_str)
    wavelength = parse(Float64, parts[1])
    loggf = parse(Float64, parts[2])
    element_ion = parse(Float64, parts[3])
    # ... parse remaining fields

    return SpectralLine(0, wavelength, loggf, element_ion, ...)
end
# Run test → PASSES

# REFACTOR: Add error handling, validation
function parse_gfall_line(line_str::String)::SpectralLine
    isempty(line_str) && error("Empty line string")
    parts = split(line_str)
    length(parts) < 10 && error("Insufficient fields in gfall line")

    wavelength = parse(Float64, parts[1])
    wavelength > 0 || error("Invalid wavelength: $wavelength")
    # ... improved parsing with validation

    return SpectralLine(...)
end
# Run test → STILL PASSES
```

---

## Task 2.1: Atomic Line Reader (gfall format)

**Priority**: CRITICAL
**Estimated**: ~$5-8
**Status**: Test stubs created, awaiting test data from Paula

### Goal

Parse Kurucz gfall format atomic line lists and return `Vector{SpectralLine}`.

### Gfall Format Specification

**Fixed-width columns** (from SYNTHE documentation):

```
Column  Content                  Type      Example
------  -------                  ----      -------
1-10    Wavelength (Å)           Float     4045.8138
12-17   log(gf)                  Float     0.280
19-24   Element.ion code         Float     26.0 (Fe I), 26.01 (Fe II)
26-36   E_lower (cm⁻¹)           Float     0.000
38-48   E_upper (cm⁻¹)           Float     28520.868
50-54   J_lower                  Float     4.0
56-60   J_upper                  Float     6.0
62-68   log(gamma_rad)           Float     -7.640
70-76   log(gamma_stark)         Float     -6.420
78-84   log(gamma_vdW)           Float     -5.970
```

**Example line**:
```
4045.8138  0.280 26.0  0.000 28520.868 4.0 6.0 -7.640 -6.420 -5.970
```
This is Fe I (neutral iron) at 4045.8 Å.

### Required Functions

#### 1. `read_gfall_lines(filepath, λ_start, λ_end, margin=10.0)`

**Purpose**: Read atomic lines from gfall file, filter by wavelength range.

**Parameters**:
- `filepath::String` - Path to gfall file
- `λ_start::Float64` - Start wavelength (Å)
- `λ_end::Float64` - End wavelength (Å)
- `margin::Float64` - Extra margin for Voigt wings (default 10 Å)

**Returns**: `Vector{SpectralLine}`

**Behavior**:
- Read all lines from file
- Parse each line with `parse_gfall_line()`
- Filter wavelength: `λ_start - margin <= λ <= λ_end + margin`
- Skip comment lines (starting with '#')
- Skip blank lines
- Return filtered vector

**TDD Steps**:
1. Test: Empty file → returns empty vector
2. Test: File with one valid line → returns 1-element vector
3. Test: Wavelength filtering (3 lines, request middle range) → returns 1 line
4. Test: Margin handling (line at edge) → included with margin, excluded without
5. Test: Comment and blank line skipping → ignored in output

#### 2. `parse_gfall_line(line_str)`

**Purpose**: Parse single gfall line into `SpectralLine` struct.

**Parameters**:
- `line_str::String` - Single line from gfall file

**Returns**: `SpectralLine`

**Behavior**:
- Parse fixed-width or space-delimited columns
- Convert log(gamma) → gamma (10^log_gamma)
- Calculate NBUFF index (wavelength → logarithmic grid position)
- Validate all fields are finite and physical

**TDD Steps**:
1. Test: Parse wavelength field → correct value
2. Test: Parse element code 26.0 → Fe I identification
3. Test: Parse element code 26.01 → Fe II identification
4. Test: Parse energy levels → E_lower, E_upper correct
5. Test: Parse damping: log(gamma_rad) = -7.640 → gamma_rad = 2.29×10⁻⁸
6. Test: Invalid input (missing fields) → error
7. Test: Invalid input (non-numeric) → error

#### 3. `compute_nbuff(wavelength, λ_min, λ_max, n_points)`

**Purpose**: Map wavelength to logarithmic grid index for opacity sampling.

**Parameters**:
- `wavelength::Float64` - Line wavelength (Å)
- `λ_min::Float64` - Grid minimum wavelength
- `λ_max::Float64` - Grid maximum wavelength
- `n_points::Int` - Number of grid points

**Returns**: `Int` - Grid index (1-based)

**Formula**:
```julia
log_λ = log10(wavelength)
log_min = log10(λ_min)
log_max = log10(λ_max)
index = floor(Int, (log_λ - log_min) / (log_max - log_min) * (n_points - 1)) + 1
```

**TDD Steps**:
1. Test: λ = λ_min → index = 1
2. Test: λ = λ_max → index = n_points
3. Test: λ = geometric mean → index ≈ n_points/2
4. Test: λ < λ_min → index = 0 or error
5. Test: λ > λ_max → index = n_points+1 or error

### Test Data Location

Paula will provide: `test/data/atomic/gf5000.asc`

This file contains ~1000-10000 atomic lines in the 5000-5100 Å range.

### Files to Create/Edit

**Implementation**:
- `src/Synthe/src/line_readers.jl`

**Tests**:
- `test/synthe/test_line_readers.jl`

**Success Criteria**:
- All tests passing
- Can read real gfall file
- Wavelength filtering works correctly
- Element/ion codes parsed correctly
- Damping parameters computed from log(gamma) values
- NBUFF indexing validated

---

## Task 2.2: Molecular Line Reader (ASCII format)

**Priority**: HIGH
**Estimated**: ~$4-6
**Status**: Test stubs created, awaiting test data from Paula

### Goal

Parse ASCII molecular line lists (CH, CN, CO) and return `Vector{SpectralLine}` with molecular metadata.

### Molecular Line Format

**ASCII space-delimited** (simpler than gfall):

```
Column  Content              Example
------  -------              -------
1       Wavelength (Å)       5165.2340
2       log(gf)             -2.450
3       ISO code             101 (¹²C¹H)
4       E_lower (cm⁻¹)       15234.67
5       E_upper (cm⁻¹)       34567.89
6       J_lower              2.5
7       J_upper              3.5
```

**Example line**:
```
5165.2340 -2.450 101 15234.67 34567.89 2.5 3.5
```

### ISO Code → NELION Mapping

SYNTHE uses NELION codes for molecular species:

| Molecule | ISO Code | NELION | Description |
|----------|----------|--------|-------------|
| ¹²C¹H    | 101      | 246    | Carbon monoxide hydride (main isotope) |
| ¹³C¹H    | 102      | 246    | Carbon-13 variant |
| ¹²C¹⁴N   | 201      | 270    | Cyanogen (main isotope) |
| ¹³C¹⁴N   | 202      | 270    | Carbon-13 variant |
| ¹²C¹⁶O   | 301      | 276    | Carbon monoxide (main isotope) |
| ¹³C¹⁶O   | 302      | 276    | Carbon-13 variant |

**Pattern**: First digit = molecule type, second two digits = isotope variant.

### Required Functions

#### 1. `read_molecular_lines(filepath, molecule, λ_start, λ_end, margin=10.0)`

**Purpose**: Read molecular lines from ASCII file.

**Parameters**:
- `filepath::String` - Path to molecular line file
- `molecule::String` - "CH", "CN", or "CO"
- `λ_start::Float64` - Start wavelength (Å)
- `λ_end::Float64` - End wavelength (Å)
- `margin::Float64` - Extra margin for Voigt wings

**Returns**: `Vector{SpectralLine}`

**Behavior**:
- Read all lines from file
- Parse with `parse_molecular_line()`
- Filter by wavelength range
- Apply isotopic abundance corrections
- Return filtered vector

**TDD Steps**:
1. Test: Read CH lines → NELION = 246
2. Test: Read CN lines → NELION = 270
3. Test: Read CO lines → NELION = 276
4. Test: Wavelength filtering works
5. Test: Isotopic abundance correction applied

#### 2. `parse_molecular_line(line_str, molecule)`

**Purpose**: Parse single molecular line.

**Parameters**:
- `line_str::String` - Single line from molecular file
- `molecule::String` - "CH", "CN", or "CO"

**Returns**: `SpectralLine`

**Behavior**:
- Parse space-delimited columns
- Map ISO code → NELION using `iso_to_nelion()`
- Store NELION in `element_ion` field (reusing atomic struct)
- Apply isotopic abundance correction to gf value

**TDD Steps**:
1. Test: Parse wavelength and log(gf)
2. Test: Parse ISO 101 (¹²C¹H) → NELION 246
3. Test: Parse energy levels and J values
4. Test: Isotopic abundance factor applied to gf

#### 3. `iso_to_nelion(iso_code, molecule)`

**Purpose**: Map ISO isotope code to SYNTHE NELION species code.

**Parameters**:
- `iso_code::Int` - ISO code from file (e.g., 101)
- `molecule::String` - "CH", "CN", or "CO"

**Returns**: `Float64` - NELION code (e.g., 246.0 for CH)

**Mapping Table**:
```julia
function iso_to_nelion(iso_code::Int, molecule::String)::Float64
    if molecule == "CH"
        return 246.0  # All CH isotopes → NELION 246
    elseif molecule == "CN"
        return 270.0  # All CN isotopes → NELION 270
    elseif molecule == "CO"
        return 276.0  # All CO isotopes → NELION 276
    else
        error("Unknown molecule: $molecule")
    end
end
```

**TDD Steps**:
1. Test: CH with ISO 101 or 102 → 246.0
2. Test: CN with ISO 201 or 202 → 270.0
3. Test: CO with ISO 301 or 302 → 276.0
4. Test: Unknown molecule → error

#### 4. `isotopic_abundance_factor(iso_code, molecule)`

**Purpose**: Compute abundance correction for isotopic variants.

**Parameters**:
- `iso_code::Int` - ISO code
- `molecule::String` - Molecule name

**Returns**: `Float64` - Abundance factor (1.0 for main isotope, <1.0 for rare)

**Example abundances** (solar):
- ¹²C / ¹³C ≈ 89 → ¹³C factor = 1/89 ≈ 0.011
- ¹⁴N is dominant (¹⁵N rare)
- ¹⁶O is dominant (¹⁸O, ¹⁷O rare)

**TDD Steps**:
1. Test: Main isotopes (101, 201, 301) → factor = 1.0
2. Test: ¹³C variant → factor ≈ 0.011
3. Test: Abundance factor modifies gf value correctly

### Test Data Location

Paula will provide: `test/data/molecular/ch_lines.asc` (or CN, CO)

### Files to Create/Edit

**Implementation**:
- `src/Synthe/src/line_readers_molecular.jl`

**Tests**:
- `test/synthe/test_line_readers_molecular.jl`

**Success Criteria**:
- All tests passing
- Can read real molecular line file
- ISO → NELION mapping correct
- Isotopic abundance corrections applied
- Wavelength filtering works

---

## Task 2.3: Continuum Opacity (Pure Julia)

**Priority**: MEDIUM
**Estimated**: ~$4-6
**Status**: Test stubs created, can use literature values for validation

### Goal

Implement continuum opacity sources for stellar atmospheres in pure Julia.

**Why continuum matters**: Total opacity = line opacity (Task 2.1/2.2) + continuum opacity (this task).

### Required Opacity Sources

#### 1. H⁻ Bound-Free Opacity

**Dominant opacity source in solar-type star photospheres**.

**Formula** (Wishart 1979):
```julia
function hminus_bf(λ::Float64, T::Float64, P_e::Float64)::Float64
    # λ in Ångstroms, T in Kelvin, P_e in dyne/cm²
    # Returns opacity in cm²/H⁻ ion

    λ_nm = λ / 10.0  # Convert to nm
    λ_threshold = 165.0  # nm, H⁻ photodetachment threshold

    λ_nm > λ_threshold && return 0.0  # No absorption beyond threshold

    # Wishart 1979 formula (simplified)
    θ = 5040.0 / T
    x = λ_nm / λ_threshold

    σ_bf = C * (1 - x)^1.5 * x^3  # Cross-section
    # C is wavelength-dependent coefficient (see literature)

    return σ_bf
end
```

**Validation**: Gray (2005) Table 8.1, λ=5000 Å, T=5000 K → opacity ≈ 10⁻²⁶ cm²/H⁻

**TDD Steps**:
1. Test: λ > 1650 Å → opacity = 0 (beyond threshold)
2. Test: λ = 5000 Å, T = 5000 K → matches literature value
3. Test: Opacity increases with decreasing wavelength (blue stronger than red)
4. Test: Temperature dependence correct

#### 2. H⁻ Free-Free Opacity

**Inverse bremsstrahlung** (free electron + neutral H).

**Formula** (Gray 2005):
```julia
function hminus_ff(λ::Float64, T::Float64, P_e::Float64)::Float64
    # Returns opacity in cm²/H⁻ ion

    θ = 5040.0 / T
    λ_μm = λ / 10000.0  # Convert to microns

    # Gray (2005) Eq. 8.11
    σ_ff = 1.47e-24 * (1 + 0.13θ) * θ^(-2.5) * λ_μm^3

    return σ_ff
end
```

**Validation**: Gray (2005), λ=10000 Å, T=6000 K → opacity ≈ 10⁻²⁶ cm²

**TDD Steps**:
1. Test: Opacity ∝ λ³ (infrared dominates)
2. Test: Match literature value at standard conditions
3. Test: Temperature dependence (decreases with increasing T)

#### 3. H I Bound-Free Opacity

**Hydrogen photoionization** from levels n=1,2,3,... (Lyman, Balmer, Paschen series).

**Formula** (Hydrogenic cross-section):
```julia
function hydrogen_bf(λ::Float64, T::Float64, n_level::Int)::Float64
    # n_level = 1 (Lyman), 2 (Balmer), 3 (Paschen), etc.
    # Returns opacity in cm²/H atom

    λ_threshold = 911.8 * n_level^2  # Å, series threshold

    λ > λ_threshold && return 0.0  # No absorption beyond threshold

    # Kramers formula (scaled for H)
    ν = c0 / (λ * 1e-8)  # Frequency (Hz)
    ν_threshold = c0 / (λ_threshold * 1e-8)

    σ_bf = 7.9e-18 * n_level / (ν/ν_threshold)^3  # cm²

    # Apply Gaunt factor correction (order unity)
    g_bf = gaunt_factor(n_level, ν/ν_threshold)

    return σ_bf * g_bf
end
```

**Validation**:
- Lyman edge (912 Å, n=1) → σ ≈ 6×10⁻¹⁸ cm²
- Balmer edge (3646 Å, n=2) → σ ≈ 10⁻¹⁷ cm²

**TDD Steps**:
1. Test: λ > threshold → opacity = 0
2. Test: Lyman edge discontinuity at 912 Å
3. Test: Balmer edge discontinuity at 3646 Å
4. Test: Opacity ∝ n^5 (higher levels weaker)
5. Test: Match literature cross-sections

#### 4. Electron Scattering (Thomson)

**Non-thermal opacity** (wavelength-independent).

**Formula**:
```julia
function electron_scattering(n_e::Float64)::Float64
    # n_e in cm⁻³
    # Returns opacity in cm⁻¹

    σ_thomson = 6.65e-25  # cm² (Thomson cross-section constant)
    κ_es = n_e * σ_thomson

    return κ_es
end
```

**Validation**: Solar photosphere n_e ≈ 10¹⁴ cm⁻³ → κ_es ≈ 6.65×10⁻¹¹ cm⁻¹

**TDD Steps**:
1. Test: Correct Thomson cross-section constant
2. Test: Linear with electron density
3. Test: Wavelength-independent

#### 5. Helper: Gaunt Factor

**Quantum correction to Kramers formula**.

**Approximation** (Menzel & Pekeris 1935):
```julia
function gaunt_factor(n::Int, x::Float64)::Float64
    # n = principal quantum number
    # x = ν/ν_threshold (frequency ratio)

    # Approximation for bound-free
    g = 1.0 + 0.1728 * (x - 1) / n^2 - 0.0496 * (x - 1)^2 / n^4

    return clamp(g, 0.8, 1.2)  # Physical bounds
end
```

**TDD Steps**:
1. Test: At threshold (x=1) → g ≈ 1.0
2. Test: x > 1 (above threshold) → g slightly > 1
3. Test: Higher n → weaker n-dependence

### Test Data: Literature Values

Use these values to validate implementations (no external data file needed):

**H⁻ bound-free** (Gray 2005, Table 8.1):
- λ=5000 Å, T=5000 K, θ=1.008 → σ ≈ 4.0×10⁻²⁶ cm²/H⁻

**H⁻ free-free** (Gray 2005):
- λ=10000 Å, T=6000 K → σ ≈ 1.5×10⁻²⁶ cm²

**H I bound-free** (Mihalas 1978):
- Lyman continuum at 912 Å → σ ≈ 6.3×10⁻¹⁸ cm²
- Balmer continuum at 3646 Å → σ ≈ 1.0×10⁻¹⁷ cm²

**Electron scattering**:
- σ_thomson = 6.6524587×10⁻²⁵ cm² (CODATA 2018)

### Files to Create/Edit

**Implementation**:
- `src/Synthe/src/continuum_opacity.jl`

**Tests**:
- `test/synthe/test_continuum_opacity.jl`

**Success Criteria**:
- All tests passing
- H⁻, H I, electron scattering implemented
- Opacity values match literature within 10%
- Wavelength thresholds (edges) correct
- Temperature dependence validated

---

## Project Structure

```
Atlas.jl/
├── src/
│   └── Synthe/
│       └── src/
│           ├── Synthe.jl                      # Module definition (you'll edit exports)
│           ├── constants.jl                   # ✅ Step 1 complete
│           ├── units.jl                       # ✅ Step 1 complete
│           ├── physics.jl                     # ✅ Step 1 complete
│           ├── voigt.jl                       # ✅ Step 1 complete
│           ├── line_opacity_utils.jl          # ✅ Step 1 complete
│           ├── structs.jl                     # ✅ SpectralLine defined
│           ├── line_readers.jl                # 🔄 YOU CREATE (Task 2.1)
│           ├── line_readers_molecular.jl      # 🔄 YOU CREATE (Task 2.2)
│           └── continuum_opacity.jl           # 🔄 YOU CREATE (Task 2.3)
│
├── test/
│   ├── synthe/
│   │   ├── test_constants.jl                 # ✅ 74 tests passing
│   │   ├── test_units.jl                     # ✅ 46 tests passing
│   │   ├── test_physics.jl                   # ✅ 39 tests passing
│   │   ├── test_voigt.jl                     # ✅ 23 tests passing
│   │   ├── test_line_opacity_utils.jl        # ✅ 19 tests passing
│   │   ├── test_integration.jl               # ✅ 49 tests passing
│   │   ├── test_line_readers.jl              # 🔄 YOU CREATE (Task 2.1)
│   │   ├── test_line_readers_molecular.jl    # 🔄 YOU CREATE (Task 2.2)
│   │   └── test_continuum_opacity.jl         # 🔄 YOU CREATE (Task 2.3)
│   │
│   └── data/                                  # 🔄 Paula will provide before you start
│       ├── atomic/
│       │   └── gf5000.asc                    # Kurucz gfall lines
│       ├── molecular/
│       │   └── ch_lines.asc                  # Molecular lines
│       └── models/
│           └── sun.mod                        # Solar atmosphere (optional)
│
└── CCW_TASK_STEP2.md                         # THIS FILE
```

---

## TDD Workflow Summary

### For Each Function:

1. **Write the test FIRST** (RED phase)
   ```julia
   @testset "Function description" begin
       result = my_function(input)
       @test result == expected
   end
   ```
   Run test → should FAIL

2. **Implement minimal code** (GREEN phase)
   ```julia
   function my_function(input)
       # Just enough to pass the test
       return expected
   end
   ```
   Run test → should PASS

3. **Refactor and validate** (REFACTOR phase)
   ```julia
   function my_function(input)
       # Add validation, error handling, optimization
       validate_input(input)
       result = compute_result(input)
       return result
   end
   ```
   Run test → should STILL PASS

4. **Repeat** for next test case

### Running Tests

```bash
# Individual test files
julia test/synthe/test_line_readers.jl
julia test/synthe/test_line_readers_molecular.jl
julia test/synthe/test_continuum_opacity.jl

# All tests together
julia --project=. -e 'using Pkg; Pkg.test()'
```

---

## Acceptance Criteria

### Task 2.1 Complete When:
- [ ] All tests in `test_line_readers.jl` passing
- [ ] Can read real gfall file (Paula's test data)
- [ ] Wavelength filtering works (with margin)
- [ ] Element/ion codes parsed correctly (26.0 vs 26.01)
- [ ] Damping parameters computed from log(gamma)
- [ ] NBUFF indexing validated
- [ ] Function signatures match SpectralLine struct

### Task 2.2 Complete When:
- [ ] All tests in `test_line_readers_molecular.jl` passing
- [ ] Can read molecular line file (CH, CN, or CO)
- [ ] ISO → NELION mapping correct (101→246, 201→270, 301→276)
- [ ] Isotopic abundance corrections applied
- [ ] Wavelength filtering works
- [ ] Function signatures match SpectralLine struct

### Task 2.3 Complete When:
- [ ] All tests in `test_continuum_opacity.jl` passing
- [ ] H⁻ bound-free opacity matches literature (±10%)
- [ ] H⁻ free-free opacity matches literature (±10%)
- [ ] H I bound-free edges correct (912 Å, 3646 Å)
- [ ] Electron scattering constant correct
- [ ] Temperature and wavelength dependencies validated
- [ ] All functions return physically sensible values (non-negative, finite)

### Step 2 Complete When:
- [ ] All three tasks complete
- [ ] All tests passing (estimate 50-100 new tests total)
- [ ] Code is clean, documented, and follows Julia style guide
- [ ] Ready for integration testing (combining line + continuum opacity)

---

## Tips for Success

1. **Start with the simplest test**: Don't try to parse a full file on the first test. Parse one line first.

2. **One behavior per test**: Each @test should verify one thing.

3. **Use @testset for organization**: Group related tests together.

4. **Validate edge cases**: Empty files, missing fields, out-of-range wavelengths, etc.

5. **Check your math**: Opacity formulas are from literature, but validate units and constants.

6. **Use existing Step 1 code**: You have constants, unit conversions, and physics functions ready to use.

7. **Ask questions**: If gfall format is unclear, if literature values don't match, or if test data is wrong, document it in test comments.

8. **Commit frequently**: After each passing test, commit. Message format: "✅ Task 2.1: Parse gfall wavelength field"

9. **Performance is secondary**: Get it working first (tests passing), optimize later if needed. Step 1 proved Julia is fast enough.

10. **Trust the process**: TDD feels slow at first, but prevents bugs and provides confidence in correctness.

---

## Questions or Issues?

If you encounter:
- **Missing test data**: Paula will provide before you start. Skip tests with `@test_skip` until data available.
- **Unclear gfall format**: Check `docs/archaeology/PHASE5_MIGRATION_PLAN.md` lines 123-147.
- **Opacity formula questions**: See Gray (2005) "Observations and Analysis of Stellar Photospheres" or Mihalas (1978).
- **SpectralLine struct issues**: See `src/Synthe/src/structs.jl` for field definitions.
- **Test failures**: Validate test expectations first, then implementation.

Document any blocking issues in comments or commit messages for Paula to review.

---

## Budget Tracking

| Task | Estimated | Actual | Status |
|------|-----------|--------|--------|
| 2.1 Atomic reader | $5-8 | - | 🔄 Pending |
| 2.2 Molecular reader | $4-6 | - | 🔄 Pending |
| 2.3 Continuum opacity | $4-6 | - | 🔄 Pending |
| **Total** | **$13-20** | **-** | **Fits CCW credit** |

Update this table as you complete tasks to track progress.

---

**Good luck! The foundation is strong (250 tests passing), now build on it with disciplined TDD. 🚀**
