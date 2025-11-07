# ATLAS12 Abundance System Analysis

**Date:** August 22, 2025  
**Authors:** Analysis by Claude Code  
**Project:** Atlas.jl - Julia refactor of ATLAS Suite

## Executive Summary

This document provides a detailed analysis of how elemental abundances are handled in the ATLAS12 stellar atmosphere code (`upstream/kurucz/source_codes/programs/atlas12/atlas12.for`). Our investigation reveals that ATLAS12 uses a unique abundance system that differs from standard astronomical conventions.

## Key Findings

### 1. Abundance Storage Convention

**ATLAS12 uses log number abundances relative to total number of atoms**, not relative to hydrogen as is conventional in astronomy.

- **H, He**: Stored as number fractions (0.911, 0.089)
- **Z≥3**: Stored as log₁₀(N_element/N_total)
- **Sum constraint**: H + He + Σ(heavy elements) = 1.000 (number fractions)

**Evidence:**
- Comment at line 1573: `C     H has been defined to be -.04 instead of 12 so that the sum is 1.`
- H = 0.911 = log₁₀⁻¹(-0.040) confirms this is N_H/N_total
- Mean molecular weight calculation requires number fractions relative to total

### 2. Mean Molecular Weight Calculation

**Location:** Lines 2173-2175 in `atlas12.for`

```fortran
WTMOLE(J)=0.
DO 1514 IZ=1,99
1514 WTMOLE(J)=WTMOLE(J)+XABUND(J,IZ)*ATMASS(IZ)
```

**Mathematical basis:**
⟨μ⟩ = Σ (N_element/N_total) × M_element

This formula **only works correctly** if `XABUND(J,IZ)` represents number fractions relative to total number of atoms, confirming our interpretation.

### 3. Abundance Input Processing

**Five input methods** (lines 1912-1958):

1. **SCALE** - Global metallicity scaling factor
2. **CHANGE** - Individual element modifications before scaling  
3. **ABSOLUTE** - Direct abundance specification (bypasses scaling)
4. **RELATIVE** - [X/Fe] style relative offsets
5. **TABLE** - Full abundance table input

**Format:** `(7X,F10.6,10X,F10.6/(5(7X,F7.3,F6.3)))`

### 4. Final Abundance Computation

**Location:** Lines 2169-2175

```fortran
DO 1513 IZ=3,99
 1513 XABUND(J,IZ)=10.**(ABUND(IZ)+XRELATIVE(IZ))  ! Elements Z≥3
      XABUND(J,1)=ABUND(1)                           ! H number fraction
      XABUND(J,2)=ABUND(2)                           ! He number fraction
```

**Key features:**
- Final abundances computed as: `10^(log_abundance + relative_offset)`
- H and He passed through directly as number fractions
- No explicit normalization (assumes input is correctly normalized)

### 5. Usage in Stellar Atmosphere Calculations

**Primary usage in ionization equilibrium:**

```fortran
NUMBER(J,ION) = NUMBER(J,ION) * XNATOM(J) * XABUND(J,IZ)
```

**Where:**
- `XNATOM(J)` = total atomic number density at depth J [atoms/cm³]
- `XABUND(J,IZ)` = number fraction for element IZ
- Result = element-specific number density for ionization calculations

**Density calculation:**
```fortran
RHO(J) = XNATOM(J) * WTMOLE(J) * 1.660E-24
```

Converts from number density and mean molecular weight to mass density [g/cm³].

## Comparison with Standard Astronomical Practice

| Aspect | Standard Astronomy | ATLAS12 |
|--------|-------------------|---------|
| H abundance | log(N_H/N_H) = 12.00 | N_H/N_total = 0.911 |
| He abundance | log(N_He/N_H) ≈ 10.93 | N_He/N_total = 0.089 |
| Heavy elements | log(N_Z/N_H) + 12 | log(N_Z/N_total) |
| Normalization | Relative to H | Relative to total |
| Sum constraint | N/A | Σ(fractions) = 1.000 |

## Advantages of ATLAS12 System

1. **Direct usage**: No normalization factors needed in calculations
2. **Correct molecular weight**: Automatic via weighted sum
3. **Physical meaning**: Direct number fractions for gas properties
4. **Computational efficiency**: Eliminates hydrogen correction factors

## Default Solar Abundances

**Reference:** Grevesse & Anders (1989)

```fortran
DATA ABUND/ 0.911,0.089,                    ! H, He (number fractions)
C  Elements 3-99 as log(N_element/N_total)
   -10.88,-10.89, -9.44, -3.48, -3.99,     ! Li, Be, B, C, N
   -3.11, -7.48, -3.95, -5.71, -4.46,      ! O, F, Ne, Na, Mg
   [... continues for all elements ...]
```

## Implementation Notes for Julia Translation

1. **Abundance arrays**: 
   - `ABUND(99)` - base abundances (H,He as fractions, Z≥3 as log)
   - `XABUND(kw,99)` - final abundances at each depth point
   - `XRELATIVE(99)` - relative abundance offsets

2. **Input parsing**: Support all five abundance specification methods

3. **Validation**: Ensure abundance fractions sum to ≈1.000

4. **Mean molecular weight**: Critical for density calculations

## File Locations

- **Main abundance code**: `upstream/kurucz/source_codes/programs/atlas12/atlas12.for`
- **Input processing**: Lines 1910-1958
- **Final computation**: Lines 2169-2175  
- **Usage examples**: Lines 2867, 3047, 3055, 3767

## Conclusion

ATLAS12's abundance system, while unconventional, is mathematically elegant and computationally efficient for stellar atmosphere modeling. The key insight is that abundances are stored as number fractions relative to the total number of atoms, not relative to hydrogen as in standard astronomical practice. This system eliminates normalization issues and provides direct physical quantities for atmospheric calculations.

Understanding this system is crucial for accurate translation to Julia and for maintaining numerical compatibility with the original Fortran code.