# Fortran Reference Data

This directory contains reference outputs from the original Fortran ATLAS/SYNTHE code,
used to validate the Pure Julia implementation.

## Required Reference Files

### 1. `hminus_fortran.csv`
H⁻ opacity test cases from Fortran HMINOP subroutine.

**Format**:
```csv
opacity_type,wavelength,temperature,electron_pressure,cross_section
bf,500.0,5777.0,1.0e14,2.923e-17
ff,5000.0,5777.0,1.0e14,1.234e-18
...
```

**Columns**:
- `opacity_type`: "bf" (bound-free) or "ff" (free-free)
- `wavelength`: Wavelength in Ångströms
- `temperature`: Temperature in K
- `electron_pressure`: Electron pressure in dyne/cm²
- `cross_section`: Cross-section in cm²

**Generation**: Write Fortran driver that calls HMINOP and saves outputs to CSV.

---

### 2. `voigt_fortran.csv`
Voigt profile test cases from Fortran VOIGT function.

**Format**:
```csv
v,a,voigt_value
0.0,0.0,1.0
0.5,0.01,0.778801
1.0,0.1,0.367879
...
```

**Columns**:
- `v`: Velocity in Doppler widths (dimensionless)
- `a`: Damping parameter (dimensionless)
- `voigt_value`: H(v,a) profile value

**Generation**: Call Fortran VOIGT function from atlas12.for on grid of (v,a) pairs.

**Test grid suggestion**:
- v: 0.0, 0.1, 0.2, ..., 10.0 (101 points)
- a: 0.0, 0.001, 0.01, 0.1, 1.0, 10.0 (6 values)
- Total: 606 test cases

---

### 3. `populations_fortran.csv`
Population solver test cases from Fortran POPS subroutine.

**Format**:
```csv
temperature,gas_pressure,n_e_fortran,f_HI_fortran,f_HII_fortran,f_HeI_fortran,f_HeII_fortran,f_HeIII_fortran
5777.0,1.0e5,1.234e14,0.456,0.544,0.987,0.013,0.0
...
```

**Columns**:
- `temperature`: Temperature in K
- `gas_pressure`: Gas pressure in dyne/cm²
- `n_e_fortran`: Electron density from Fortran POPS (cm⁻³)
- `f_*_fortran`: Ionization fractions for H I, H II, He I, He II, He III

**Generation**: Call Fortran PFSAHA subroutine with solar abundances.

**Test cases suggestion**:
- Temperature range: 3000 K to 20000 K (10 points)
- Pressure range: 1e3 to 1e7 dyne/cm² (5 points)
- Total: 50 test cases

---

### 4. `radiative_transfer_fortran.csv`
Radiative transfer test cases from Fortran JOSH subroutine.

**Format**:
```csv
test_case,depth_index,tau,source_function,J_fortran,H_fortran,K_fortran
isothermal_no_scat,1,0.0,1.0,0.987,0.345,0.124
isothermal_no_scat,2,0.01,1.0,0.991,0.338,0.121
...
```

**Columns**:
- `test_case`: Descriptive name of test case
- `depth_index`: Depth point index (1 to 51)
- `tau`: Optical depth
- `source_function`: Input source function S(τ)
- `J_fortran`, `H_fortran`, `K_fortran`: Computed radiation field moments

**Generation**: Call Fortran JOSH subroutine with controlled test cases.

**Test cases suggestion**:
1. Isothermal, no scattering (S = constant)
2. Isothermal, with scattering
3. Temperature gradient
4. Eddington-Barbier test (analytical solution exists)

---

## How to Generate Reference Data

### Step 1: Write Fortran Driver Programs

Create small Fortran programs that:
1. Link with original atlas7v.for or atlas12.for
2. Call the target subroutines (HMINOP, VOIGT, POPS, JOSH)
3. Write outputs in CSV format

Example (VOIGT driver):
```fortran
      PROGRAM TEST_VOIGT
      COMMON /H1TAB/H0TAB(2001),H1TAB(2001),H2TAB(2001)

C     Initialize tables
      CALL TABVOIGT(200, 2001)

C     Open output file
      OPEN(10, FILE='voigt_fortran.csv')
      WRITE(10,*) 'v,a,voigt_value'

C     Test grid
      DO IV = 0, 100
        V = FLOAT(IV) * 0.1
        DO IA = 1, 6
          IF(IA.EQ.1) A = 0.0
          IF(IA.EQ.2) A = 0.001
          IF(IA.EQ.3) A = 0.01
          IF(IA.EQ.4) A = 0.1
          IF(IA.EQ.5) A = 1.0
          IF(IA.EQ.6) A = 10.0

          H = VOIGT(V, A)
          WRITE(10,100) V, A, H
        ENDDO
      ENDDO

  100 FORMAT(F8.4,',',F8.4,',',E15.8)
      CLOSE(10)
      END
```

### Step 2: Compile and Run Fortran Drivers

```bash
gfortran -o test_voigt test_voigt.f atlas12.for
./test_voigt
```

### Step 3: Place CSV Files in This Directory

Move generated CSV files to `test/reference/`:
```bash
mv voigt_fortran.csv Atlas.jl/test/reference/
mv hminus_fortran.csv Atlas.jl/test/reference/
mv populations_fortran.csv Atlas.jl/test/reference/
mv radiative_transfer_fortran.csv Atlas.jl/test/reference/
```

### Step 4: Run Julia Tests

```bash
cd Atlas.jl
julia --project=. test/runtests.jl
```

The integration tests will automatically detect the reference files and run comparisons.

---

## Validation Tolerances

**Expected accuracy**:
- H⁻ opacity: rtol=1e-4 (0.01%, accounting for Float32 in Fortran vs Float64 in Julia)
- Voigt profile: rtol=1e-4 (table lookup differences)
- Populations: rtol=1e-4 (iteration convergence differences)
- Radiative transfer: rtol=1e-4

**If tolerance fails**, investigate:
1. Algorithm differences (e.g., different interpolation methods)
2. Iteration convergence (different stopping criteria)
3. Numerical precision (Float32 vs Float64)
4. Input data differences (e.g., partition functions)

---

**Author**: Claude (Local), Paula Coelho
**Date**: 2025-11-15
**Status**: Reference data generation pending
