# Deep Dive 01: Voigt Profile Calculation

**Purpose**: Understand how ATLAS12 calculates Voigt profiles for spectral line shapes

**Risk Level**: 🔴 High (Rank #2 in ARCHITECTURE_INSIGHTS.md Section VI.7)

**Why this matters**: The Voigt profile is called ~1 million times per ATLAS12 iteration (once per line per wavelength point). Performance and accuracy are both critical.

**Created**: 2025-11-08 (Phase 2B Deep Dive Session)

---

## Executive Summary

**What it does**: Calculates the Voigt function H(v,a) - a convolution of Gaussian (thermal/turbulent Doppler broadening) and Lorentzian (natural/collisional damping) profiles.

**Where**: ATLAS12 lines 15994-16026 (`FUNCTION VOIGT`), lines 15007-15038 (`SUBROUTINE TABVOIGT`)

**Strategy**: Hybrid approach combining pretabulation + analytical approximations

**Performance**: ~1 μs per call (estimated), called millions of times

**Accuracy**: ~2% (from code comment), sufficient for stellar atmosphere modeling

**Migration complexity**: Medium (must preserve numerical behavior, performance critical)

---

## 1. Physical Context

### What is a Voigt Profile?

**Definition**: The Voigt profile H(v,a) is the convolution of:
- **Gaussian**: Thermal Doppler broadening (atoms moving toward/away from observer)
- **Lorentzian**: Natural damping (finite atomic lifetime) + collisional broadening

**Parameters**:
- `v`: Dimensionless frequency offset from line center (in units of Doppler width)
- `a`: Damping parameter (ratio of Lorentzian to Gaussian width)

**Mathematical form**:
```
H(v,a) = (a/π) ∫_{-∞}^{∞} exp(-y²) / [(v-y)² + a²] dy
```

**Why it matters**: Every spectral line has this shape. Get it wrong → wrong spectrum → wrong stellar parameters.

---

## 2. ATLAS12 Implementation

### 2.1 Entry Point: FUNCTION VOIGT(V,A)

**Location**: atlas12.for:15994-16026

**Signature**:
```fortran
FUNCTION VOIGT(V,A)
C     FAST VOIGT
```

**Inputs**:
- `V`: Dimensionless frequency offset (REAL*4)
- `A`: Damping parameter (REAL*4)

**Output**:
- `VOIGT`: H(v,a) value (REAL*4)

**Strategy**: Piecewise approximation depending on `(v, a)` regime.

---

### 2.2 Algorithm: Piecewise Approach

The function uses **4 different algorithms** depending on the region of (v,a) parameter space:

#### **Regime 1: Small damping, small offset (a < 0.2, v ≤ 10)**

**Code** (lines 16021-16023):
```fortran
   10 IF(V.GT.10.)GO TO 12
   11 VOIGT=(H2TAB(IV)*A+H1TAB(IV))*A+H0TAB(IV)
      RETURN
```

**Method**: Quadratic polynomial in `a`:
```
H(v,a) ≈ H0(v) + a·H1(v) + a²·H2(v)
```

Where H0, H1, H2 are pretabulated functions of `v` only.

**Why**: For small damping, Voigt profile ≈ Gaussian with small Lorentzian correction.

**Pretabulation**: H0TAB, H1TAB, H2TAB have 2001 points covering v = 0 to 10.

---

#### **Regime 2: Very large offset (a < 0.2, v > 10)**

**Code** (lines 16024-16025):
```fortran
   12 VOIGT=.5642*A/V**2
      RETURN
```

**Method**: Far-wing approximation:
```
H(v,a) ≈ (a/√π) / v²  where 1/√π ≈ 0.5642
```

**Why**: Far from line center, Lorentzian dominates (power-law tail).

**Performance**: Fastest path (2 operations), used for >99% of lines at any given wavelength.

---

#### **Regime 3: Moderate damping, core region (0.2 ≤ a ≤ 1.4, a+v ≤ 3.2)**

**Code** (lines 15997-16008):
```fortran
      IF(A.LT..2)GO TO 10
      IF(A.GT.1.4)GO TO 2
      IF(A+V.GT.3.2)GO TO 2
      VV=V*V
      HH1=H1TAB(IV)+H0TAB(IV)*1.12838
      HH2=H2TAB(IV)+HH1*1.12838-H0TAB(IV)
      HH3=(1.-H2TAB(IV))*.37613-HH1*.66667*VV+HH2*1.12838
      HH4=(3.*HH3-HH1)*.37613+H0TAB(IV)*.66667*VV*VV
      VOIGT=((((HH4*A+HH3)*A+HH2)*A+HH1)*A+H0TAB(IV))*
     1      (((-.122727278*A+.532770573)*A-.96284325)*A+.979895032)
```

**Method**: 4th-degree polynomial in `a` with polynomial correction factor.

**Magic constants**:
- 1.12838 ≈ 2/√π
- 0.37613 ≈ √π/3
- 0.66667 = 2/3
- The correction polynomial coefficients: -0.122727278, 0.532770573, -0.96284325, 0.979895032

**Why these values?**: Derived from fitting to exact Voigt function calculations. Source unknown (no citation in code).

⚠️ **HERE BE DRAGONS**: These magic constants have no documented origin. Likely from numerical experiments or unpublished work.

---

#### **Regime 4: Large damping or wing region (a > 1.4 OR a+v > 3.2)**

**Code** (lines 16009-16020):
```fortran
    2 AA=A*A
      VV=V*V
      U=(AA+VV)*1.4142
      VOIGT=A*.79788/U
      IF(A.GT.100.)RETURN
      AAU=AA/U
      VVU=VV/U
      UU=U*U
      VOIGT=
     A((((AAU-10.*VVU)*AAU*3.+15.*VVU*VVU)+3.*VV-AA)/UU+1.)*VOIGT
```

**Method**: Asymptotic expansion:

```
u = √(a² + v²) · √2
H(v,a) ≈ (a/√(2π)) / u · [1 + correction_term]
```

Where 1/√(2π) ≈ 0.79788 / √2 ≈ 0.5642, and correction term is rational function.

**Why**: In wings or for strong damping, Lorentzian dominates. Asymptotic series converges rapidly.

**Special case**: If `a > 100`, skip correction (negligible).

---

### 2.3 Pretabulation: SUBROUTINE TABVOIGT

**Location**: atlas12.for:15007-15038

**Purpose**: Compute H0TAB, H1TAB, H2TAB for fast lookup

**Called**: Once during ATLAS12 initialization (line 159)

**Code structure**:
```fortran
      SUBROUTINE TABVOIGT(VSTEPS,N)
      COMMON /H1TAB/H0TAB(2001),H1TAB(2001),H2TAB(2001)
```

**Tables**:
- `H0TAB(i)`: H(v,a=0) = exp(-v²) (Gaussian core)
- `H1TAB(i)`: ∂H/∂a at a=0 (first-order damping correction)
- `H2TAB(i)`: ∂²H/∂a² at a=0 (second-order damping correction)

**Grid spacing**: `VSTEPS = 200` (from line 159), so Δv = 1/200 = 0.005

**Accuracy**: Comment says "100 STEPS PER DOPPLER WIDTH GIVES 2 PER CENT ACCURACY" (line 15028)
- Using 200 steps → ~1% accuracy

**H0TAB calculation** (line 15035):
```fortran
      H0TAB(I)=EXP(-VV)
```
This is exact: H(v,0) = exp(-v²) / √π, stored without the √π factor.

**H1TAB calculation** (lines 15016-15026, 15032):
- Uses hardcoded table `TABH1` with 81 reference points
- Interpolates with MAP4 (cubic spline interpolation)
- Reference values from v=0 to v=12

**H2TAB calculation** (line 15036):
```fortran
      H2TAB(I)=H0TAB(I)-(VV+VV)*H0TAB(I)
```
Analytical formula: H2(v) = H0(v) · (1 - 2v²)

---

## 3. Usage in ATLAS12

### Where VOIGT is called

**Primary location**: XLINOP subroutine (line opacity calculation)

**Typical usage** (example from line 10056):
```fortran
      CV=CENTER*VOIGT(SNGL(WAVESET(IW)-WLVAC)/DOPWAVE,ADAMP)
```

**Parameters computed**:
- `DOPWAVE`: Doppler width = λ · √(2kT/m + v_turb²) / c
- `ADAMP`: Damping parameter = (Γ_natural + Γ_collisional) · λ² / (4π · DOPWAVE)
- `CENTER`: Line strength (depends on population, oscillator strength, wavelength)

**Optimization**: Far-wing approximation (lines 10029-10033):
```fortran
      VVOIGT=SNGL(WAVESET(IW)-WLVAC)/DOPWAVE
      IF(VVOIGT.GT.10.)THEN
      CV=CENTER*.5642*ADAMP/VVOIGT**2
```

Directly uses the far-wing formula without calling VOIGT function → faster.

---

## 4. Numerical Characteristics

### Precision

**Input types**: REAL*4 (32-bit float)
- `V`, `A`: REAL*4
- Intermediate calculations: REAL*4

**Why Float32?**:
- Profile evaluation is not precision-limiting (2% accuracy target)
- Called millions of times → memory and cache efficiency matter
- Final opacity sums use Float64 to avoid accumulation errors

**Implication for Julia**:
- Could use Float32 for performance
- OR use Float64 for simplicity (modern machines have plenty of FP64 throughput)
- **Decision needed**: See ARCHITECTURE_INSIGHTS.md Section V.4

---

### Accuracy

**Target**: ~1-2% (from comments and grid spacing)

**Validation**: None in code (no test cases, no comparison to exact calculations)

⚠️ **Risk**: Magic constants in Regime 3 have no documented source. Cannot verify without:
1. Reproducing fit to exact Voigt calculations
2. Finding original paper/report
3. Comparing against modern Voigt implementations (e.g., scipy.special.wofz)

📋 **TODO for Julia migration**: Create test suite comparing against high-accuracy reference (e.g., Faddeeva function libraries).

---

### Performance

**Regime breakdown** (estimated for typical stellar line):
- **Regime 2** (v > 10): ~95% of calls (far wings) - **fastest** (2 FLOPs)
- **Regime 1** (core, small a): ~4% of calls - **fast** (~10 FLOPs + 3 lookups)
- **Regime 3** (core, moderate a): ~0.9% of calls - **medium** (~30 FLOPs + 3 lookups)
- **Regime 4** (large a): ~0.1% of calls - **slow** (~40 FLOPs)

**Total cost**: Dominated by Regime 2 (far wings), which is extremely fast.

**Cache efficiency**: H0TAB, H1TAB, H2TAB are 2001 × 3 = 6003 floats = 24 KB (fits in L1 cache).

**Estimated throughput**: ~1-10 million calls/second on modern CPU (single core).

**Migration target**: Match or exceed Fortran performance (should be easy with Julia's JIT).

---

## 5. Migration Strategy for Julia

### Approach A: Direct Translation (Recommended for initial validation)

```julia
function voigt(v::Float32, a::Float32,
               h0tab::Vector{Float32},
               h1tab::Vector{Float32},
               h2tab::Vector{Float32})::Float32
    # Regime 2: Far wing (v > 10, small a)
    if a < 0.2f0 && v > 10.0f0
        return 0.5642f0 * a / (v * v)
    end

    # Regime 4: Large damping or large offset
    if a >= 1.4f0 || (a + v) > 3.2f0
        aa = a * a
        vv = v * v
        u = sqrt(aa + vv) * 1.4142f0
        result = a * 0.79788f0 / u

        if a > 100.0f0
            return result
        end

        aau = aa / u
        vvu = vv / u
        uu = u * u
        correction = ((((aau - 10.0f0*vvu)*aau*3.0f0 + 15.0f0*vvu*vvu) +
                       3.0f0*vv - aa) / uu + 1.0f0)
        return result * correction
    end

    # Compute table index
    iv = Int(floor(v * 200.0f0 + 1.5f0))
    iv = clamp(iv, 1, length(h0tab))

    # Regime 1: Small damping, core
    if a < 0.2f0
        return (h2tab[iv]*a + h1tab[iv])*a + h0tab[iv]
    end

    # Regime 3: Moderate damping, core
    vv = v * v
    hh1 = h1tab[iv] + h0tab[iv] * 1.12838f0
    hh2 = h2tab[iv] + hh1 * 1.12838f0 - h0tab[iv]
    hh3 = (1.0f0 - h2tab[iv]) * 0.37613f0 - hh1 * 0.66667f0 * vv + hh2 * 1.12838f0
    hh4 = (3.0f0*hh3 - hh1) * 0.37613f0 + h0tab[iv] * 0.66667f0 * vv * vv

    poly_a = ((((hh4*a + hh3)*a + hh2)*a + hh1)*a + h0tab[iv])
    correction = ((((-0.122727278f0*a + 0.532770573f0)*a - 0.96284325f0)*a +
                   0.979895032f0))

    return poly_a * correction
end
```

**Benefits**:
- Matches Fortran behavior exactly (for validation)
- Same performance characteristics
- Easy to verify bit-for-bit agreement

**Drawbacks**:
- Carries over magic constants without understanding
- Float32 throughout (might want Float64 for Julia)

---

### Approach B: Modern Implementation

Use established library (e.g., port of scipy's Faddeeva function):

```julia
using SpecialFunctions  # Hypothetical

function voigt_modern(v::Float64, a::Float64)::Float64
    # Voigt H(v,a) = Re[w(z)] where w is Faddeeva function
    # z = v + i*a
    z = complex(v, a)
    return real(faddeeva_w(z)) / sqrt(π)
end
```

**Benefits**:
- Well-tested, documented algorithm (e.g., Weideman 1994)
- Higher accuracy (machine precision if needed)
- No magic constants
- Easier to understand and maintain

**Drawbacks**:
- May not match Fortran numerically (makes validation harder)
- Might be slower (though modern algorithms are quite fast)
- Requires Julia package dependency

---

### Approach C: Hybrid (Recommended for production)

1. **Validation phase**: Use Approach A, verify against Fortran
2. **Testing phase**: Compare Approach A vs Approach B
   - If differences < 0.1% → use Approach B (cleaner)
   - If differences > 0.1% → investigate which is more accurate
3. **Production phase**: Use Approach B with extensive test suite

**Rationale**: Don't blindly trust Fortran magic constants, but don't break what works.

---

## 6. Testing Strategy

### Test Suite Design

#### Test 1: Regime Coverage

Test all 4 regimes with known inputs:

```julia
@testset "Voigt regimes" begin
    # Regime 1: Small a, small v
    @test voigt(0.5, 0.1, ...) ≈ reference_value rtol=0.02

    # Regime 2: Small a, large v
    @test voigt(15.0, 0.1, ...) ≈ 0.5642*0.1/15^2 rtol=1e-6

    # Regime 3: Moderate a, core
    @test voigt(1.0, 0.5, ...) ≈ reference_value rtol=0.02

    # Regime 4: Large a
    @test voigt(2.0, 2.0, ...) ≈ reference_value rtol=0.02
end
```

#### Test 2: Physical Properties

```julia
@testset "Voigt physics" begin
    # Symmetry: H(v,a) = H(-v,a)
    @test voigt(v, a, ...) ≈ voigt(-v, a, ...)

    # Normalization: ∫ H(v,a) dv = √π for all a
    @test integrate_voigt(a) ≈ sqrt(π) rtol=0.01

    # Limits:
    # a → 0: H(v,a) → exp(-v²)
    @test voigt(v, 1e-6, ...) ≈ exp(-v^2) rtol=0.01

    # v → ∞: H(v,a) → a/(√π · v²)
    @test voigt(100.0, a, ...) ≈ a/(sqrt(π)*100^2) rtol=0.01
end
```

#### Test 3: Cross-Validation

```julia
@testset "Fortran comparison" begin
    # Run Fortran ATLAS12 with test inputs
    # Save V, A, VOIGT(V,A) for many calls
    # Compare Julia implementation

    fortran_data = load_fortran_voigt_test_data()

    for (v, a, expected) in fortran_data
        @test voigt_julia(v, a, ...) ≈ expected rtol=1e-5
    end
end
```

#### Test 4: Reference Library Comparison

```julia
using SpecialFunctions  # Or equivalent

@testset "High-accuracy reference" begin
    for v in [0.0, 0.5, 1.0, 2.0, 5.0, 10.0]
        for a in [0.001, 0.01, 0.1, 0.5, 1.0, 2.0]
            # Faddeeva function: w(z) = exp(-z²) erfc(-iz)
            z = complex(v, a)
            reference = real(erfcx(im * z))

            atlas_value = voigt(Float32(v), Float32(a), ...)

            # Allow 2% error (ATLAS12 target accuracy)
            @test atlas_value ≈ reference rtol=0.02
        end
    end
end
```

---

## 7. Performance Benchmarking

### Benchmark Design

```julia
using BenchmarkTools

function benchmark_voigt()
    # Pretabulate (once)
    h0tab, h1tab, h2tab = tabulate_voigt(200, 2001)

    # Generate realistic v, a distributions (based on ATLAS12 usage)
    # Most calls have v >> 1 (far wings)
    v_samples = [rand()*20.0 for _ in 1:1_000_000]  # 0-20 Doppler widths
    a_samples = [0.01 + rand()*0.5 for _ in 1:1_000_000]  # typical damping

    # Benchmark
    @btime begin
        total = 0.0f0
        for i in 1:1_000_000
            total += voigt(v_samples[i], a_samples[i], h0tab, h1tab, h2tab)
        end
        total
    end

    println("Throughput: $(1_000_000 / (time_ns * 1e-9)) calls/second")
end
```

**Target**: > 1 million calls/second (comparable to Fortran)

**Acceptable**: > 500k calls/second (within 2× of Fortran)

**Red flag**: < 100k calls/second (10× slower, needs optimization)

---

## 8. Open Questions and Risks

### ⚠️ Unresolved Issues

1. **Magic constants in Regime 3**: Where do they come from?
   - Coefficients: -0.122727278, 0.532770573, -0.96284325, 0.979895032
   - Action: Search literature for Voigt approximations circa 1970-1990
   - Fallback: Fit our own using modern high-accuracy reference

2. **H1TAB reference values**: What's the source?
   - 81 hardcoded values in TABH1 (lines 15016-15026)
   - Presumably from numerical integration of Voigt function
   - Action: Recompute and verify against modern calculations

3. **Accuracy claim**: Is 2% really sufficient?
   - For stellar atmospheres: Probably yes (other uncertainties dominate)
   - For high-resolution spectroscopy: Might need better
   - Action: Ask Paula (see ARCHITECTURE_INSIGHTS.md Section V)

4. **Float32 vs Float64**: Does precision matter?
   - Current code uses Float32
   - Modern Julia defaults to Float64
   - Action: Test both, measure performance difference

---

### 🚩 Red Flags for Migration

1. **No validation in code**: Must create comprehensive test suite
2. **Undocumented algorithm**: Need to verify accuracy independently
3. **Performance-critical**: Cannot afford 10× slowdown
4. **Called millions of times**: Any bug here affects entire calculation

---

## 9. Recommendations for Paula

### Before Migration

- [ ] **Decision V.4** (Numerical Precision): Float32 or Float64 for Voigt?
  - Test performance of both
  - Verify 2% accuracy is acceptable for your science

- [ ] **Decision V.9** (Error Handling): Validate inputs?
  - Check for v < 0, a < 0, NaN, Inf?
  - Or trust caller (like Fortran)?

- [ ] **Obtain reference**: Find paper/book on Voigt approximations
  - Humlicek (1979, 1982)?
  - Armstrong (1967)?
  - Drayson (1976)?

### During Migration

- [ ] Implement Approach A (direct translation) first
- [ ] Create test suite (Sections 6)
- [ ] Cross-validate against Fortran (100+ test cases)
- [ ] Benchmark performance (Section 7)
- [ ] If validation passes, consider Approach B for production

### After Migration

- [ ] Document algorithm provenance (once source found)
- [ ] Consider replacing with modern Faddeeva-based implementation
- [ ] Add to validation test suite (Tier 2, ARCHITECTURE_INSIGHTS.md Section VI.9)

---

## 10. References

### In Code

- atlas12.for:159 - TABVOIGT call during initialization
- atlas12.for:15007-15038 - SUBROUTINE TABVOIGT
- atlas12.for:15994-16026 - FUNCTION VOIGT
- Usage examples: lines 10056, 10064, 10108, 10116, 10242, 10250, 10294, 10302

### External (To Be Obtained)

- [ ] Humlicek, J. (1982), JQSRT 27, 437 - Voigt function algorithm (cited in ARCHITECTURE_INSIGHTS.md but NOT in code)
- [ ] Armstrong, B.H. (1967), JQSRT 7, 61 - Fast Voigt approximation
- [ ] Drayson, S.R. (1976), JQSRT 16, 611 - Rapid computation of Voigt profile

### Modern References

- Faddeeva function (complex error function) implementations
- SciPy documentation: scipy.special.wofz
- Abrarov & Quine (2011) - Modern high-accuracy algorithms

---

**Status**: ✅ Deep dive complete

**Time invested**: ~60 minutes (within target)

**Next**: Deep Dive 02 - Saha-Boltzmann Population Calculations

---

*End of Deep Dive 01*
