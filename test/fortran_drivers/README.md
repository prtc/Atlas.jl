# Fortran Driver Programs for Reference Data Generation

This directory contains Fortran programs that generate reference data for validating the Pure Julia implementation.

## Prerequisites

1. **Fortran compiler**: gfortran (GCC Fortran)
2. **Kurucz source code**:
   - `atlas12.for` (for VOIGT function)
   - `atlas7v.for` (for HMINBF, HMINFF, PFSAHA functions)

You should have these in `../../upstream/kurucz/source_codes/programs/`.

## Driver Programs

### 1. test_voigt.f
**Purpose**: Generate Voigt profile reference data
**Output**: `voigt_fortran.csv` (707 test cases)
**Tests**: All Fortran regimes (core, wing, transition)

**Compile**:
```bash
gfortran -o test_voigt test_voigt.f ../../upstream/kurucz/source_codes/programs/atlas12/atlas12.for
```

**Run**:
```bash
./test_voigt
```

**Output format**:
```csv
v,a,voigt_value
0.0000,0.000000,1.000000000000E+00
0.1000,0.000000,9.900498337915E-01
...
```

---

### 2. test_hminus.f
**Purpose**: Generate H⁻ opacity reference data
**Output**: `hminus_fortran.csv` (280 test cases)
**Tests**: Bound-free and free-free opacity

**Compile**:
```bash
gfortran -o test_hminus test_hminus.f ../../upstream/kurucz/source_codes/programs/SYNTHE/atlas7v.for
```

**Run**:
```bash
./test_hminus
```

**Output format**:
```csv
opacity_type,wavelength,temperature,electron_pressure,cross_section
bf,4000.00,4000.00,1.0000E+02,2.345678901234E-17
ff,4000.00,4000.00,1.0000E+02,1.234567890123E-18
...
```

---

### 3. test_pops.f
**Purpose**: Generate partition function reference data
**Output**: `populations_fortran.csv` (50 test cases)
**Tests**: PFSAHA partition functions for H and He

**Compile**:
```bash
gfortran -o test_pops test_pops.f ../../upstream/kurucz/source_codes/programs/SYNTHE/atlas7v.for
```

**Run**:
```bash
./test_pops
```

**Output format**:
```csv
temperature,gas_pressure,n_e,partition_H_I,partition_H_II,partition_He_I,partition_He_II,partition_He_III
5000.0,1.0000E+05,1.0000E+14,2.0000E+00,1.0000E+00,1.0000E+00,2.0000E+00,1.0000E+00
...
```

---

## Quick Start (Using Makefile)

A Makefile is provided for convenience:

```bash
# Compile all drivers
make all

# Run all drivers and generate CSV files
make run

# Clean up executables
make clean

# Full cycle: compile, run, move CSVs to test/reference/
make reference
```

## Output Files

After running the drivers, move the CSV files to `../reference/`:

```bash
mv voigt_fortran.csv ../reference/
mv hminus_fortran.csv ../reference/
mv populations_fortran.csv ../reference/
```

Or use the Makefile:
```bash
make reference
```

## Validation

Once the CSV files are in `../reference/`, run the Julia tests:

```bash
cd ../..
julia --project=. test/runtests.jl
```

The integration tests will automatically detect the reference files and run comparisons.

## Expected Tolerances

From CODE_REVIEW_2025-11-15.md and test/reference/README.md:

| Component | Metric | Target Tolerance |
|-----------|--------|------------------|
| Voigt Profile | H(v,a) | rtol < 1e-4 (0.01%) |
| H⁻ Opacity | σ(λ,T) | rtol < 1e-4 (0.01%) |
| Partition Functions | Z(T) | rtol < 1e-4 (0.01%) |

## Troubleshooting

**Compilation errors**:
- Check that paths to atlas12.for and atlas7v.for are correct
- Ensure gfortran is installed: `gfortran --version`
- Try adding `-std=legacy` flag for old Fortran syntax

**Runtime errors**:
- PFSAHA requires common blocks to be initialized - driver handles this
- If output files are empty, check permissions

**Missing functions**:
- VOIGT, TABVOIGT are in atlas12.for
- HMINBF, HMINFF, PFSAHA are in atlas7v.for
- Ensure you're using the correct source file

## Notes

- These drivers call the original Fortran subroutines directly
- Output precision matches Fortran Float32/Float64 as appropriate
- Test grids cover representative parameter ranges for stellar atmospheres
- Drivers are minimal - just enough to generate reference data

## Authors

Created by Claude (AI Assistant) for Atlas.jl validation
Date: 2025-11-15
