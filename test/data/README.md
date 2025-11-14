# Test Data for Atlas.jl

This directory contains test data files for Phase 5 Step 2 testing.

## Directory Structure

```
test/data/
├── atomic/          # Kurucz gfall atomic line lists
├── molecular/       # Molecular line lists (CH, CN, CO, etc.)
└── models/          # ATLAS atmosphere models
```

## Currently available files

- atomic/gf0600_sample.dat - Sample atomic line list (not full gfall)
- molecular/mgh_sample.asc - Sample molecular line list (not full)
- models/ap00t5777g44377k1odfnew.dat - Solar atmosphere model abundances from Grevesse & Sauval, 1998, Space Sci. Rev., 85, 161

## Required Files (Paula to provide)

### High Priority (CRITICAL for CCW Step 2)

1. **test/data/atomic/gf5000.asc** (or similar)
   - Kurucz gfall format atomic lines
   - Wavelength range: 5000-5100 Å (or similar test range)
   - Source: Extract from Kurucz gfall master file
   - Used by: Task 2.1 (Atomic line reader tests)

2. **test/data/molecular/ch_lines.asc** (or similar)
   - ASCII format molecular lines for CH
   - Wavelength range: 5000-5100 Å (or similar test range)
   - Source: Kurucz molecular line database
   - Used by: Task 2.2 (Molecular line reader tests)

### Medium Priority (Helpful but not blocking)

3. **test/data/molecular/cn_lines.asc**
   - CN molecular lines (ASCII format)

4. **test/data/molecular/co_lines.asc**
   - CO molecular lines (ASCII format)

5. **test/data/models/sun.mod**
   - Solar atmosphere model (T_eff=5777K, log g=4.44)
   - ATLAS9 or ATLAS12 format
   - Used by: Task 2.3 continuum opacity tests (can use mock data if unavailable)

## Data Sources

### Atomic Lines (gfall)
- **Location on Paula's machines**: Check `upstream/kurucz/documentation/` or Kurucz website
- **Format**: Space-delimited, columns as documented in CCW_TASK_STEP2.md
- **Extraction**: Can use `awk` to filter wavelength range from full gfall file

### Molecular Lines
- **Location**: Check `upstream/kurucz/documentation/` molecular section
- **Format**: ASCII space-delimited
- **Species**: CH (NELION 246), CN (NELION 270), CO (NELION 276)

### Atmosphere Models
- **Location**: Check `upstream/castelli/examples/` or `upstream/kurucz/documentation/`
- **Format**: ATLAS .mod format (text file with depth-dependent T, P, ρ, etc.)

## Usage in Tests

Tests will check for file existence and use `@test_skip` if files not available:

```julia
test_file = joinpath(@__DIR__, "../data/atomic/gf5000.asc")

if !isfile(test_file)
    @test_skip "Test data not yet available: $test_file"
else
    # Run test with real data
    lines = read_gfall_lines(test_file, 5000.0, 5100.0)
    @test length(lines) > 0
end
```

This allows CCW to run tests with real data once Paula provides the files.

## File Size Recommendations

To keep repository size manageable:
- Atomic line lists: ~1000-10000 lines (not millions)
- Molecular line lists: ~1000 lines per species
- Atmosphere models: Single model file (~100 depth points, ~50 KB)

Total test data: ~1-10 MB (acceptable for git)

## Git Tracking

This directory and its contents SHOULD be committed to git (test data is small enough and essential for validation).

---
**Last updated**: 2025-11-13
**Author**: Claude (Local), Paula Coelho
