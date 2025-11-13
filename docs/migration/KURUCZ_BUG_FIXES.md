# Kurucz Bug Fixes Implementation Plan

**Date:** 2025-11-13
**Session:** claude/investigate-isotope-handling-011CV4FgpwSxa99JDCLWymqq
**Purpose:** Document exact changes needed to apply Kurucz bug fixes after Castelli baseline validation
**Status:** Planning Document

---

## Executive Summary

This document provides a detailed roadmap for applying 6 critical bug fixes from Kurucz's 2002-2017 updates to the Julia implementation **after** successful validation against Castelli's Linux ports.

**Strategy**:
1. **Phase 1**: Validate Julia against Castelli Fortran (byte-for-byte)
2. **Phase 2**: Apply Kurucz bug fixes incrementally with testing
3. **Phase 3**: Integration testing of all fixes together

**Parallel Development Paths**:
- **SYNTHE pathway**: 4 bug fixes (can develop independently)
- **ATLAS12 pathway**: 2 bug fixes (can develop independently)
- These can be worked on in parallel by different developers

**Reference**: See `docs/archaeology/KURUCZ_VS_CASTELLI_COMPARISON.md` for detailed version analysis.

---

## Table of Contents

1. [SYNTHE Pathway Bug Fixes](#synthe-pathway-bug-fixes)
2. [ATLAS12 Pathway Bug Fixes](#atlas12-pathway-bug-fixes)
3. [Implementation Order](#implementation-order)
4. [Validation Strategy](#validation-strategy)
5. [Git Workflow](#git-workflow)
6. [Integration Testing](#integration-testing)

---

## SYNTHE Pathway Bug Fixes

### Overview

**Source Files**: `upstream/kurucz/source_codes/programs/SYNTHE/`

**4 Bug Fixes** from Kurucz not in Castelli:
1. CONTX array size (5mar02)
2. Molecule number parameter (13jul15)
3. Double precision constants (4nov14)
4. He I line broadening (11nov14) - *partially in Castelli, verify only*

**Affected Julia modules**:
- `src/synthe/constants.jl`
- `src/synthe/opacity.jl`
- `src/synthe/synthe.jl`
- `src/synthe/line_readers.jl`

---

### SYNTHE Bug Fix #1: CONTX Array Size

**Date**: 5 March 2002
**Reported by**: Jo Bruls
**Severity**: High (potential array overflow)

#### Problem

CONTX array dimension too small for certain opacity calculations with many continuum sources.

#### Castelli Baseline
```fortran
C     From upstream/castelli/source_codes/synthe/synthe.for
C     Line ~52 (exact line depends on version)
      COMMON /CONTIN/CONTX(25,kw),CONTY(25,kw),ECONTY(25,kw),
     1               ICONWV(25),NCONTY(kw)
```

#### Kurucz Fix
```fortran
C     From upstream/kurucz/source_codes/programs/SYNTHE/synthe.for
C     revised 5mar02   Jo Bruls found dimensions of CONTX too small, now 26
      COMMON /CONTIN/CONTX(26,kw),CONTY(26,kw),ECONTY(26,kw),
     1               ICONWV(26),NCONTY(kw)
```

#### Julia Implementation

**File**: `src/synthe/constants.jl`

**Before** (Castelli baseline):
```julia
# Castelli baseline - matches upstream/castelli exactly
# KNOWN ISSUE: May overflow with many continuum sources (Kurucz fixed 5mar02)
const CONTX_SIZE = 25  # Continuum opacity array dimension
```

**After** (Kurucz fix #1):
```julia
# Kurucz bug fix (5mar02): Increased from 25 to 26
# Prevents array overflow in metal-rich models
const CONTX_SIZE = 26  # Continuum opacity array dimension
```

**File**: `src/synthe/opacity.jl`

**Before**:
```julia
struct ContinuumOpacity
    contx::Matrix{Float64}   # (25, kw)
    conty::Matrix{Float64}   # (25, kw)
    econty::Matrix{Float64}  # (25, kw)
    iconwv::Vector{Int}      # (25,)
    nconty::Vector{Int}      # (kw,)
end

function ContinuumOpacity(kw::Int)
    ContinuumOpacity(
        zeros(Float64, 25, kw),
        zeros(Float64, 25, kw),
        zeros(Float64, 25, kw),
        zeros(Int, 25),
        zeros(Int, kw)
    )
end
```

**After**:
```julia
struct ContinuumOpacity
    contx::Matrix{Float64}   # (CONTX_SIZE, kw)
    conty::Matrix{Float64}   # (CONTX_SIZE, kw)
    econty::Matrix{Float64}  # (CONTX_SIZE, kw)
    iconwv::Vector{Int}      # (CONTX_SIZE,)
    nconty::Vector{Int}      # (kw,)
end

function ContinuumOpacity(kw::Int)
    ContinuumOpacity(
        zeros(Float64, CONTX_SIZE, kw),
        zeros(Float64, CONTX_SIZE, kw),
        zeros(Float64, CONTX_SIZE, kw),
        zeros(Int, CONTX_SIZE),
        zeros(Int, kw)
    )
end
```

#### Testing

**Test file**: `test/bugfixes/test_contx_size.jl`

```julia
@testset "SYNTHE Bug Fix #1: CONTX Array Size" begin
    using Atlas.Synthe: CONTX_SIZE, ContinuumOpacity

    # Verify constant is correct
    @test CONTX_SIZE == 26

    # Verify struct uses correct size
    kw = 72
    cont = ContinuumOpacity(kw)
    @test size(cont.contx) == (26, kw)
    @test size(cont.conty) == (26, kw)
    @test size(cont.econty) == (26, kw)
    @test length(cont.iconwv) == 26

    # Test model with many opacity sources (would crash with size=25)
    model = load_model("metal_rich_test.mod")
    # Should not throw BoundsError
    @test_nowarn compute_continuum_opacity(model)
end
```

#### Expected Impact

- Prevents crashes in metal-rich models
- May slightly change continuum opacities in models with >25 continuum sources
- Most models use <25 sources, so minimal impact on standard cases

---

### SYNTHE Bug Fix #2: Molecule Number Parameter

**Date**: 13 July 2015
**Reported by**: Kurucz development
**Severity**: Medium (limits molecular line lists)

#### Problem

No explicit parameter for molecular species count. Implicit limit of 594 (99 elements × 6) insufficient for modern molecular databases.

#### Castelli Baseline
```fortran
C     From upstream/castelli/source_codes/synthe/synthe.for
C     Line ~19
      PARAMETER (kw=99)
C     Line ~52 (COMMON blocks use hardcoded 594)
      COMMON /XNFDOP/XNFPEL(594),DOPPLE(594),XNFDOP(594)
```

#### Kurucz Fix
```fortran
C     From upstream/kurucz/source_codes/programs/SYNTHE/synthe.for
C     revised 13jul15   molecule number increased, parameter mw=139, mw6=mw*6
      PARAMETER (kw=99,mw=139,mw6=mw*6)
C     ...
      COMMON /XNFDOP/XNFPEL(mw6),DOPPLE(mw6),XNFDOP(mw6)
```

Calculation: mw=139, mw6=139×6=834

#### Julia Implementation

**File**: `src/synthe/constants.jl`

**Before** (Castelli baseline):
```julia
# Castelli baseline - implicit molecular limit
# KNOWN ISSUE: Insufficient for complete molecular databases (Kurucz fixed 13jul15)
const KW = 99  # Depth points in atmosphere model
const MOLECULAR_SPECIES_LIMIT = 594  # Implicit: 99 × 6
```

**After** (Kurucz fix #2):
```julia
# Kurucz bug fix (13jul15): Explicit molecular parameter
const KW = 99   # Depth points in atmosphere model
const MW = 139  # Molecular species count
const MW6 = MW * 6  # 834: expanded molecular species limit
const MOLECULAR_SPECIES_LIMIT = MW6
```

**File**: `src/synthe/synthe.jl`

**Before**:
```julia
struct SyntheData
    # Partition functions and Doppler widths
    xnfpel::Vector{Float64}  # (594,) Number densities
    dopple::Vector{Float64}  # (594,) Doppler widths
    xnfdop::Vector{Float64}  # (594,) Combined doppler/number density
end

function SyntheData()
    SyntheData(
        zeros(Float64, 594),
        zeros(Float64, 594),
        zeros(Float64, 594)
    )
end
```

**After**:
```julia
struct SyntheData
    # Partition functions and Doppler widths
    xnfpel::Vector{Float64}  # (MW6,) Number densities
    dopple::Vector{Float64}  # (MW6,) Doppler widths
    xnfdop::Vector{Float64}  # (MW6,) Combined doppler/number density
end

function SyntheData()
    SyntheData(
        zeros(Float64, MW6),
        zeros(Float64, MW6),
        zeros(Float64, MW6)
    )
end
```

#### Testing

**Test file**: `test/bugfixes/test_molecule_limit.jl`

```julia
@testset "SYNTHE Bug Fix #2: Molecule Number Parameter" begin
    using Atlas.Synthe: MW, MW6, MOLECULAR_SPECIES_LIMIT, SyntheData

    # Verify constants
    @test MW == 139
    @test MW6 == 834
    @test MOLECULAR_SPECIES_LIMIT == 834

    # Verify struct uses correct size
    data = SyntheData()
    @test length(data.xnfpel) == 834
    @test length(data.dopple) == 834
    @test length(data.xnfdop) == 834

    # Test with large molecular line list
    lines = load_molecular_lines("complete_molecules.dat")
    n_species = count_unique_species(lines)

    # Should handle all species without truncation
    @test n_species <= MW6
    @test_nowarn process_molecular_lines(lines)
end
```

#### Expected Impact

- Enables full molecular line lists in cool stars
- Critical for M dwarfs, brown dwarfs with extensive TiO, VO, H₂O
- Backward compatible (models with <594 species unchanged)
- Increases memory usage: 834×8 bytes = 6.7 KB per array (negligible)

---

### SYNTHE Bug Fix #3: Double Precision Constants

**Date**: 4 November 2014
**Reported by**: Kurucz development
**Severity**: Low (precision improvement)

#### Problem

Mixed single/double precision constants in Fortran cause numerical errors in long calculations.

#### Castelli Baseline
```fortran
C     From upstream/castelli/source_codes/synthe/synthe.for
C     Mixed precision throughout
      C1=1.0        ! Single precision (implicit)
      C2=1.0E0      ! Single precision (explicit E exponent)
      C3=1.0D0      ! Double precision (D exponent)
```

#### Kurucz Fix
```fortran
C     From upstream/kurucz/source_codes/programs/SYNTHE/synthe.for
C     revised 4nov14   constants given D exponents
      C1=1.0D0      ! All double precision
      C2=1.0D0
      C3=1.0D0
```

#### Julia Implementation

**All Files**: Julia uses `Float64` by default, so this is **automatically fixed**.

**Verification needed**:
```julia
# Audit all numeric constants to ensure Float64 (not Float32)

# CORRECT (Float64 by default)
const C = 2.99792458e8   # Speed of light
const H = 6.62607015e-34  # Planck constant

# INCORRECT (would be Float32)
const C_BAD = 2.99792458f8  # Don't use 'f' suffix

# Check types
@assert typeof(C) == Float64
@assert typeof(H) == Float64
```

**File**: `src/synthe/constants.jl`

Add type assertions:
```julia
# Physical constants (all Float64 for numerical precision)
const C_LIGHT = 2.99792458e10  # cm/s
const H_PLANCK = 6.62607015e-27  # erg⋅s
const K_BOLTZ = 1.380649e-16  # erg/K
const AMU = 1.66053906660e-24  # g

# Verify all are Float64
@assert typeof(C_LIGHT) == Float64 "C_LIGHT must be Float64"
@assert typeof(H_PLANCK) == Float64 "H_PLANCK must be Float64"
@assert typeof(K_BOLTZ) == Float64 "K_BOLTZ must be Float64"
@assert typeof(AMU) == Float64 "AMU must be Float64"
```

#### Testing

**Test file**: `test/bugfixes/test_precision.jl`

```julia
@testset "SYNTHE Bug Fix #3: Double Precision Constants" begin
    using Atlas.Synthe

    # Verify all physical constants are Float64
    @test typeof(C_LIGHT) == Float64
    @test typeof(H_PLANCK) == Float64
    @test typeof(K_BOLTZ) == Float64

    # Test long calculation precision
    # Run synthesis over 10,000 Å range
    model = load_model("sun_t5777_g44.mod")
    lines = load_lines("test_lines.dat")

    spectrum = synthesize_spectrum(model, lines,
                                   wavelength_range=(3000.0, 13000.0))

    # Verify no NaN or Inf from precision loss
    @test all(isfinite, spectrum.flux)
    @test !any(isnan, spectrum.flux)

    # Compare to reference (should match to ~1e-7)
    ref_spectrum = load_reference("sun_wide_range.dat")
    @test isapprox(spectrum.flux, ref_spectrum.flux, rtol=1e-6)
end
```

#### Expected Impact

- Improved numerical stability in long calculations
- Better precision accumulation over many wavelength points
- Minimal change to results (few parts in 10⁷)
- Julia naturally uses Float64, so mostly verification

---

### SYNTHE Bug Fix #4: He I Line Broadening

**Date**: 11 November 2014
**Reported by**: Kurucz development
**Severity**: Low (Castelli already has most of this)

#### Problem

Kurucz comment says: "modified to agree with Fiorella Castelli's Linux version including He I lines and reverting to her HPROF"

#### Status

**ALREADY IN CASTELLI** - This fix represents Kurucz *adopting* Castelli's improvements.

#### Action Required

**Verify** that Castelli's HPROF function is used correctly.

**File to check**: `src/synthe/line_profiles.jl`

**Compare**:
- Castelli's HPROF implementation
- Kurucz's comment about "reverting to her HPROF"
- Ensure Julia uses same profile function

#### Testing

**Test file**: `test/bugfixes/test_hei_broadening.jl`

```julia
@testset "SYNTHE Bug Fix #4: He I Line Broadening" begin
    # Verify HPROF function matches Castelli's implementation
    # (This is the version Kurucz adopted)

    # Test He I line profile calculation
    λ = 5876.0  # He I D3 line
    model = load_model("he_rich_test.mod")

    profile = compute_line_profile(λ, "He", 1, model)

    # Should have correct broadening
    @test !isnan(profile.gamma_rad)
    @test !isnan(profile.gamma_stark)
    @test !isnan(profile.gamma_vdw)

    # Compare to Castelli Fortran reference
    fortran_profile = load_reference("hei_5876_profile.dat")
    @test isapprox(profile.flux, fortran_profile.flux, rtol=1e-5)
end
```

#### Expected Impact

- None if Castelli's HPROF already implemented correctly
- This is a verification step, not a fix

---

## ATLAS12 Pathway Bug Fixes

### Overview

**Source Files**: `upstream/kurucz/source_codes/programs/SYNTHE/rgfall.for`

**2 Bug Fixes** from Kurucz not in Castelli:
1. Ni ionization potential typo (21jun17)
2. Lande g-factor storage (23mar16)

**Affected Julia modules**:
- `src/atlas12/atomic_data.jl`
- `src/atlas12/line_readers.jl`
- `src/atlas12/ionization.jl`

**Note**: These fixes apply to the **line reading** part of ATLAS12, specifically rgfall.for

---

### ATLAS12 Bug Fix #5: Ni Ionization Potential Typo

**Date**: 21 June 2017
**Reported by**: John Lester
**Severity**: Medium (affects Ni line strengths in hot stars)

#### Problem

Typo in nickel ionization potentials lookup table affects high ionization states.

#### Location in Source

**File**: `upstream/kurucz/source_codes/programs/SYNTHE/rgfall.for`
**Line**: ~535 in ionpots DATA statement

**Version comment**:
```fortran
c     revised 21jun17  John Lester corrects typo in Ni in ionpots
```

#### Finding the Exact Typo

**Action**: Compare Castelli vs Kurucz ionpot data for Ni (Z=28)

```bash
# Extract Ni ionization potentials from both versions
grep -A5 "DATA POTNi" upstream/castelli/source_codes/synthe/rgfalllinesnew.for
grep -A5 "DATA POTNi" upstream/kurucz/source_codes/programs/SYNTHE/rgfall.for
```

**Expected format** (from code inspection):
```fortran
DATA POTNi/ value1, value2, value3, ... /
```

#### Julia Implementation

**File**: `src/atlas12/ionization.jl`

**Before** (Castelli baseline - extract actual values):
```julia
# Nickel (Z=28) ionization potentials (eV)
# Source: Castelli rgfalllinesnew.for
# KNOWN ISSUE: Has typo fixed by Kurucz 21jun17
const NI_IONIZATION_POTENTIALS = [
    # Values from Castelli version
    # TODO: Extract exact values from rgfalllinesnew.for line ~535
]
```

**After** (Kurucz fix #5):
```julia
# Nickel (Z=28) ionization potentials (eV)
# Source: Kurucz SYNTHE/rgfall.for (21jun17 fix)
# Fixed typo reported by John Lester
const NI_IONIZATION_POTENTIALS = [
    # Values from Kurucz version
    # TODO: Extract exact values from rgfall.for line ~535
]
```

**TODO**: Extract exact values by:
1. Reading both files
2. Finding DATA POTNi statements
3. Comparing values to identify typo
4. Documenting the exact change

#### Testing

**Test file**: `test/bugfixes/test_ni_ionpots.jl`

```julia
@testset "ATLAS12 Bug Fix #5: Ni Ionization Potentials" begin
    using Atlas.ATLAS12: NI_IONIZATION_POTENTIALS, ionization_potential

    # Verify correct values loaded
    @test length(NI_IONIZATION_POTENTIALS) >= 2  # At least Ni I → Ni II

    # Test ionization potential lookup
    ni_i_ionpot = ionization_potential(28, 0)  # Ni I
    ni_ii_ionpot = ionization_potential(28, 1)  # Ni II

    @test ni_i_ionpot > 7.0  # Reasonable value
    @test ni_ii_ionpot > ni_i_ionpot  # Should increase with ionization

    # Test Ni line strength calculation
    lines = load_atomic_lines("ni_lines.dat")
    ni_3858 = find_line(lines, 3858.0, "Ni", 0)  # Ni I λ3858

    model = load_model("hot_star_t15000.mod")
    strength = compute_line_strength(ni_3858, model)

    # Compare to Kurucz reference
    kurucz_strength = load_reference("ni_3858_strength_kurucz.dat")
    @test isapprox(strength, kurucz_strength, rtol=1e-3)
end
```

#### Expected Impact

- Corrected Ni I and Ni II line strengths in hot stars (Teff > 10000 K)
- May affect Ni abundance determinations
- Minimal impact on cool stars (Ni weakly ionized)

---

### ATLAS12 Bug Fix #6: Lande g-factor Storage

**Date**: 23 March 2016
**Reported by**: Kurucz development
**Severity**: Low (code clarity, not numerical)

#### Problem

Lande g-factors stored as REAL in OTHER1 array, not explicitly typed. Memory layout unclear.

#### Castelli Baseline
```fortran
C     From upstream/castelli/source_codes/synthe/rgfalllinesnew.for
C     Line ~44
C     OTHER1 IS NOW USED TO STORE LANDE G VALUES AS 2 I5 INTEGERS IN UNITS
C     OF .001 .  EXAMPLE  GLANDE=-.007 GLANDEP=2.499   OTHER1=   -7 2499
      COMMON /LINDAT/WL,E,EP,LABEL(2),LABELP(2),OTHER1(2),OTHER2(2),
     1        WLVAC,CENTER,CONCEN, NELION,GAMMAR,GAMMAS,GAMMAW,REF,
     2      NBLO,NBUP,ISO1,X1,ISO2,X2,GFLOG,XJ,XJP,CODE,ELO,GF,GS,GR,GW,
     3        DWL,DGFLOG,DGAMMAR,DGAMMAS,DGAMMAW,DWLISO,ISOSHIFT,EXTRA3
```

#### Kurucz Fix
```fortran
C     From upstream/kurucz/source_codes/programs/SYNTHE/rgfall.for
C     revised 23mar16  lande and landep made integer*2 and
C                      inserted into lindat4(28)
C     LANDE G VALUES ARE STORED AS 2I5 INTEGER*2 IN UNITS OF .001.
C     EXAMPLE  GLANDE=-.007 GLANDEP=2.499   LANDE=   -7 LANDEP= 2499
      INTEGER*2 LANDE,LANDEP
      COMMON /LINDAT/WL,E,EP,LABEL(2),LABELP(2),OTHER1(2),OTHER2(2),
     1        WLVAC,CENTER,CONCEN, NELION,GAMMAR,GAMMAS,GAMMAW,REF,
     2      NBLO,NBUP,ISO1,X1,ISO2,X2,GFLOG,XJ,XJP,CODE,ELO,GF,GS,GR,GW,
     3        DWL,DGFLOG,DGAMMAR,DGAMMAS,DGAMMAW,DWLISO,ISOSHIFT,
     4        LANDE,LANDEP
```

#### Julia Implementation

**File**: `src/atlas12/line_readers.jl`

**Before** (Castelli baseline):
```julia
# Line data structure matching Castelli COMMON /LINDAT/
struct LineData
    wl::Float64          # Wavelength
    e::Float64           # Lower level energy
    ep::Float64          # Upper level energy
    label::NTuple{2, String}    # Lower level label
    labelp::NTuple{2, String}   # Upper level label
    other1::NTuple{2, Float32}  # Lande factors (stored here in Castelli)
    other2::NTuple{2, Float32}  # Additional data
    # ... other fields
    isoshift::Int16      # Isotope shift
    # No explicit lande/landep fields in Castelli version
end

# Extract Lande factors from other1
function lande_factor(line::LineData)
    # Castelli stores as 2 I5 integers in OTHER1
    # Units of 0.001
    g_lower = line.other1[1] * 0.001
    g_upper = line.other1[2] * 0.001
    return (g_lower, g_upper)
end
```

**After** (Kurucz fix #6):
```julia
# Line data structure matching Kurucz COMMON /LINDAT/
struct LineData
    wl::Float64          # Wavelength
    e::Float64           # Lower level energy
    ep::Float64          # Upper level energy
    label::NTuple{2, String}    # Lower level label
    labelp::NTuple{2, String}   # Upper level label
    other1::NTuple{2, Float32}  # General purpose (not Lande)
    other2::NTuple{2, Float32}  # Additional data
    # ... other fields
    isoshift::Int16      # Isotope shift
    lande::Int16         # Lande g-factor (lower level) × 1000
    landep::Int16        # Lande g-factor (upper level) × 1000
end

# Extract Lande factors (explicit fields)
function lande_factor(line::LineData)
    # Kurucz stores as explicit Int16 fields
    # Units of 0.001
    g_lower = line.lande * 0.001
    g_upper = line.landep * 0.001
    return (g_lower, g_upper)
end
```

#### Testing

**Test file**: `test/bugfixes/test_lande_storage.jl`

```julia
@testset "ATLAS12 Bug Fix #6: Lande g-factor Storage" begin
    using Atlas.ATLAS12: LineData, lande_factor

    # Test structure has explicit lande fields
    @test :lande in fieldnames(LineData)
    @test :landep in fieldnames(LineData)

    # Test type is Int16
    @test fieldtype(LineData, :lande) == Int16
    @test fieldtype(LineData, :landep) == Int16

    # Test extraction function
    line = LineData(
        wl=5000.0,
        # ... other fields
        lande=Int16(-7),    # g_lower = -0.007
        landep=Int16(2499)  # g_upper = 2.499
    )

    g_lower, g_upper = lande_factor(line)
    @test g_lower ≈ -0.007
    @test g_upper ≈ 2.499

    # Test reading from gfall file preserves Lande factors
    lines = read_gfall("test_lines.gfall")
    @test all(l -> hasfield(typeof(l), :lande), lines)
    @test all(l -> hasfield(typeof(l), :landep), lines)
end
```

#### Expected Impact

- Better code clarity (explicit types)
- Improved memory efficiency (Int16 vs Float32 storage)
- **No numerical changes** (just reorganization)
- Easier to understand and maintain

---

## Implementation Order

### Recommended Sequence

Apply fixes from **least invasive to most invasive**:

#### Phase 1: Trivial Fixes (Week 1)

**SYNTHE #3: Double Precision** (automated verification)
- Audit all constants
- Add type assertions
- Run precision tests
- **Effort**: 1 day
- **Risk**: None (Julia already uses Float64)

**ATLAS12 #6: Lande Storage** (struct reorganization)
- Update LineData struct
- Update accessor functions
- Run validation tests
- **Effort**: 2 days
- **Risk**: Low (refactoring only)

#### Phase 2: Data Updates (Week 2)

**ATLAS12 #5: Ni Ionization Potentials** (data table update)
- Extract exact typo from source comparison
- Update ionization potential table
- Run Ni line strength tests
- **Effort**: 3 days
- **Risk**: Low (isolated data change)

**SYNTHE #4: He I Broadening** (verification)
- Compare HPROF implementations
- Run He I profile tests
- Document findings
- **Effort**: 2 days
- **Risk**: None (verification only)

#### Phase 3: Structural Changes (Week 3-4)

**SYNTHE #1: CONTX Array Size** (single constant change)
- Update CONTX_SIZE constant
- Update ContinuumOpacity struct
- Run metal-rich model tests
- **Effort**: 3 days
- **Risk**: Medium (may change results)

**SYNTHE #2: Molecule Limit** (array size changes - most invasive)
- Update MW, MW6 constants
- Update all affected structs
- Run molecular line tests
- Validate memory usage
- **Effort**: 5 days
- **Risk**: Medium (structural change)

### Parallel Development

**SYNTHE pathway** and **ATLAS12 pathway** can be developed independently:

```
Developer A: SYNTHE fixes (#1, #2, #3, #4)
Developer B: ATLAS12 fixes (#5, #6)

Integration: Both merge to main after individual validation
```

---

## Validation Strategy

### For Each Bug Fix

#### 1. Pre-Implementation Validation
```julia
# Run full test suite with Castelli baseline
julia --project test/runtests.jl

# Generate reference outputs
julia --project scripts/generate_castelli_reference.jl
```

#### 2. Implement Fix
- Create feature branch: `bugfix/XX-description`
- Make minimal changes
- Document in code comments

#### 3. Unit Testing
```julia
# Run fix-specific tests
julia --project test/bugfixes/test_fix_XX.jl

# Verify no regressions
julia --project test/runtests.jl
```

#### 4. Integration Testing
```julia
# Compare to Castelli reference (may differ slightly)
julia --project scripts/compare_to_castelli.jl

# Document differences
# Expected: Small numerical changes for fixes #1, #2, #5
# Expected: No change for fixes #3, #4, #6
```

#### 5. Merge
- Code review
- Update CHANGELOG.md
- Merge to main

---

## Git Workflow

### Branch Naming

```
bugfix/synthe-01-contx-size
bugfix/synthe-02-molecule-limit
bugfix/synthe-03-precision
bugfix/synthe-04-hei-broadening
bugfix/atlas12-05-ni-ionpots
bugfix/atlas12-06-lande-storage
```

### Commit Message Template

```
Apply Kurucz bug fix #X: [Short description]

[Detailed description of the bug and fix]

Reported by: [Name]
Date: [Date in format DDmmmYY]
Severity: [High/Medium/Low]

Changes:
- [List of changed files/modules]
- [Specific changes made]

Impact:
- [Expected impact on results]
- [Any backward compatibility notes]

Testing:
- [New tests added]
- [Validation performed]

References:
- See: docs/archaeology/KURUCZ_VS_CASTELLI_COMPARISON.md
- See: docs/migration/KURUCZ_BUG_FIXES.md
- Source: upstream/kurucz/source_codes/programs/[SYNTHE|ATLAS12]/[file]
```

### Example Commit

```bash
git checkout -b bugfix/synthe-01-contx-size

# Make changes to constants.jl and opacity.jl
git add src/synthe/constants.jl src/synthe/opacity.jl
git add test/bugfixes/test_contx_size.jl

git commit -m "Apply Kurucz bug fix #1: CONTX array size 25→26

Fixes potential array overflow in opacity calculations with many
continuum sources. Reported by Jo Bruls (5mar02).

Castelli baseline: CONTX_SIZE = 25 (upstream/castelli)
Kurucz fix: CONTX_SIZE = 26 (upstream/kurucz SYNTHE)

Changes:
- src/synthe/constants.jl: CONTX_SIZE 25 → 26
- src/synthe/opacity.jl: ContinuumOpacity struct uses CONTX_SIZE
- test/bugfixes/test_contx_size.jl: New test for array bounds

Impact:
- Prevents crashes in metal-rich models
- May slightly change continuum opacities (models with >25 sources)
- Backward compatible for models with <25 sources

Testing:
- Unit test verifies array size = 26
- Integration test runs metal-rich model without crash
- Reference comparison shows <0.1% flux difference

References:
- See: docs/archaeology/KURUCZ_VS_CASTELLI_COMPARISON.md (Bug Fixes #1)
- See: docs/migration/KURUCZ_BUG_FIXES.md (SYNTHE Bug Fix #1)
- Source: upstream/kurucz/source_codes/programs/SYNTHE/synthe.for (line ~52)"

git push -u origin bugfix/synthe-01-contx-size
```

---

## Integration Testing

### After All Fixes Applied

**Test file**: `test/integration/test_all_kurucz_fixes.jl`

```julia
@testset "All Kurucz Bug Fixes Integration" begin
    # Verify all 6 fixes are active
    @testset "Fix Activation" begin
        # SYNTHE fixes
        @test CONTX_SIZE == 26
        @test MW == 139
        @test MW6 == 834
        @test typeof(C_LIGHT) == Float64

        # ATLAS12 fixes
        @test :lande in fieldnames(LineData)
        @test length(NI_IONIZATION_POTENTIALS) > 0
    end

    # Test complex model requiring multiple fixes
    @testset "Complex Model" begin
        # Metal-rich M dwarf (needs fixes #1, #2, #5)
        model = load_model("metal_rich_m_dwarf.mod")
        lines = load_lines("complete_linelist.dat")

        spectrum = synthesize_spectrum(model, lines,
                                       wavelength_range=(3000.0, 10000.0))

        # Should not crash (fix #1: CONTX overflow)
        @test !any(isnan, spectrum.flux)
        @test all(isfinite, spectrum.flux)

        # Should handle all molecular species (fix #2: MW=139)
        molecular_lines = filter(is_molecular, lines)
        @test count_unique_species(molecular_lines) <= MW6

        # Should have correct Ni line strengths (fix #5)
        ni_idx = find_wavelength(spectrum, 3858.0)
        @test 0.5 < spectrum.flux[ni_idx] < 0.95
    end

    # Compare to Castelli baseline
    @testset "Baseline Comparison" begin
        # Load Castelli reference
        castelli_spectrum = load_reference("castelli_baseline_spectrum.dat")

        # Load Kurucz-fixed spectrum
        kurucz_spectrum = load_reference("kurucz_fixed_spectrum.dat")

        # Should be similar but not identical
        @test isapprox(castelli_spectrum.flux, kurucz_spectrum.flux, rtol=0.01)

        # Document differences
        diff_percent = 100 * abs.(kurucz_spectrum.flux .- castelli_spectrum.flux) ./
                       castelli_spectrum.flux
        max_diff = maximum(diff_percent)

        @test max_diff < 1.0  # Less than 1% difference

        println("Maximum flux difference: $(max_diff)%")
        println("Median flux difference: $(median(diff_percent))%")
    end
end
```

### Performance Testing

```julia
@testset "Performance After Fixes" begin
    # Verify no significant slowdown from MW6 increase
    model = load_model("test_model.mod")
    lines = load_lines("test_lines.dat")

    # Benchmark
    t_castelli = @elapsed synthesize_spectrum_castelli(model, lines)
    t_kurucz = @elapsed synthesize_spectrum_kurucz(model, lines)

    # Should be within 10% (MW6 increases from 594 to 834)
    @test t_kurucz < t_castelli * 1.1
end
```

---

## Validation Checklist

### Before Starting
- [ ] Castelli baseline validated (byte-for-byte match with Fortran)
- [ ] Reference outputs generated and archived
- [ ] Full test suite passing
- [ ] Git repository clean (no uncommitted changes)

### For Each Fix
- [ ] Feature branch created
- [ ] Minimal changes made (only what's needed for fix)
- [ ] Fix-specific unit test written and passing
- [ ] Full test suite still passing
- [ ] Reference comparison documented
- [ ] Code reviewed
- [ ] CHANGELOG.md updated
- [ ] Commit message follows template
- [ ] Branch merged to main

### After All Fixes
- [ ] Integration test suite passing
- [ ] Performance benchmarks acceptable
- [ ] Documentation updated
- [ ] Migration guide completed
- [ ] Version tagged (v0.2.0-with-kurucz-fixes)

---

## Next Steps

1. **Extract Ni Ionization Potential Typo**:
   ```bash
   diff -u <(grep -A10 "DATA POTNi" upstream/castelli/source_codes/synthe/rgfalllinesnew.for) \
           <(grep -A10 "DATA POTNi" upstream/kurucz/source_codes/programs/SYNTHE/rgfall.for)
   ```

2. **Create Test Infrastructure**:
   - `test/bugfixes/` directory
   - Test templates for each fix
   - Reference data for validation

3. **Set Up Parallel Development**:
   - Assign SYNTHE pathway to Developer A
   - Assign ATLAS12 pathway to Developer B
   - Create tracking board for progress

4. **Begin Implementation**:
   - Start with Phase 1 (trivial fixes)
   - Validate each fix independently
   - Integrate after all pass

---

**Document Metadata**:
- **Created**: 2025-11-13
- **Author**: Claude Code (Anthropic)
- **Session**: claude/investigate-isotope-handling-011CV4FgpwSxa99JDCLWymqq
- **Status**: Planning Document
- **Implementation**: Not started
- **Estimated Effort**: 3-4 weeks (2 developers working in parallel)
