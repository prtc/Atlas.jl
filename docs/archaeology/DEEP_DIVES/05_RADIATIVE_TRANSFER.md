# Deep Dive 05: JOSH - Radiative Transfer Integration

**Purpose**: Understand how ATLAS12 solves the radiative transfer equation to compute radiation field (J, H, flux)

**Risk Level**: 🟡 High (Rank #6 in ARCHITECTURE_INSIGHTS.md Section VI.7)

**Why this matters**: JOSH is the physics heart of ATLAS12. It computes the radiation field that drives temperature structure and atmosphere convergence. Errors here → wrong radiation field → wrong atmosphere model. The pretabulated integration weights and iterative solution method must be preserved exactly for numerical validation.

**Created**: 2025-11-08 (Phase 2B Deep Dive Session)

---

## Executive Summary

**What it does**: Solves the 1D radiative transfer equation to compute mean intensity J(τ), Eddington flux H(τ), and surface flux/intensity for a given frequency and opacity distribution.

**Where**: ATLAS12 lines 10342-10609 (`SUBROUTINE JOSH`)

**Method**: Feautrier-like method using pretabulated integration weights (51×51 matrices COEFJ, COEFH) on fixed optical depth grid (τ = 0 to 20)

**Algorithm**:
1. Map atmosphere opacity to standard τ grid (51 points)
2. Interpolate source function S̄ and scattering albedo α to τ grid
3. Solve integral equation iteratively: S = (1-α)S̄ + αJ
4. Compute J and H from S using pretabulated weights
5. Map J, H, S back to atmosphere depth grid

**Precision**: Mixed Float32 (integration weights, working arrays) + Float64 (source function, optical depth)

**Performance**: Called once per wavelength per iteration (~30,000 calls per atmosphere model)

**Migration complexity**: High (pretabulated weights must be ported, iterative solver is sensitive, mixed precision requires care)

---

## 1. Physical Context

### 1.1 What is Radiative Transfer?

**Definition**: The radiative transfer equation describes how radiation propagates through an absorbing, emitting, scattering medium:

```
μ dI/dτ = I - S
```

where:
- I: Specific intensity (radiation field)
- τ: Optical depth (∫ κ dz)
- μ: Cosine of angle from normal
- S: Source function (emission / opacity)

**Integrated quantities**:
- **Mean intensity**: J = (1/4π) ∫ I dΩ
- **Eddington flux**: H = (1/4π) ∫ μ I dΩ
- **K-integral**: K = (1/4π) ∫ μ² I dΩ

**Physical meaning**:
- J: Local radiation energy density (drives heating/cooling)
- H: Net radiation flux (energy transport)
- K: Radiation pressure

---

### 1.2 The Source Function

**Definition**:
```
S = ε/κ = (emission) / (opacity)
```

**Components in ATLAS12**:
```fortran
ABTOT(J) = ACONT(J) + ALINE(J) + SIGMAC(J) + SIGMAL(J)
ALPHA(J) = (SIGMAC(J) + SIGMAL(J)) / ABTOT(J)
SNUBAR(J) = (ACONT(J)*SCONT(J) + ALINE(J)*SLINE(J)) / (ACONT(J) + ALINE(J))
```

**Interpretation**:
- ABTOT: Total opacity (continuum + lines + scattering)
- ALPHA: Scattering albedo (fraction of opacity that scatters)
- SNUBAR: Thermal source function (weighted average of continuum and line emission)

**Source function equation** (with scattering):
```
S = (1 - α) S̄ + α J
```

This is an **integral equation** because J depends on S everywhere.

---

## 2. JOSH Implementation

### 2.1 Subroutine Signature

**Location**: atlas12.for:10342

```fortran
SUBROUTINE JOSH(IFSCAT,IFSURF)
IMPLICIT REAL*8 (A-H,O-Z)
```

**Parameters**:
- `IFSCAT=0`: No scattering (set S=S̄, compute J and H)
- `IFSCAT=1`: With scattering (solve integral equation for S)
- `IFSURF=0`: Compute J and H at all depths
- `IFSURF=1`: Compute surface flux only
- `IFSURF=2`: Compute surface specific intensity (angle-dependent)

**Key COMMON blocks**:
```fortran
COMMON /OPTOT/ACONT(kw),SCONT(kw),ALINE(kw),SLINE(kw),SIGMAC(kw),SIGMAL(kw)
COMMON /TAUSHJ/TAUNU(kw),SNU(kw),HNU(kw),JNU(kw),JMINS(kw)
```

---

### 2.2 Fixed Optical Depth Grid (XTAU8)

**Definition** (atlas12.for:10400-10405):
```fortran
DATA XTAU8/0.,.0000032,.0000056,.00001,.000018,.000032,.000056,
 1.0001,.00018,.00032,.00056,.001,.0018,.0032,.0056,.01,.016,.025,
 2.042,.065,.096,.139,.196,.273,.375,.5,.63,.78,.95,1.15,1.35,1.6,
 3 1.85,2.15,2.45,2.75,3.15,3.65,4.25,5.0,6.,7.,8.,9.,10.,11.5,
 4 13.,14.5,16.,18.,20./
DATA NXTAU/51/
```

**Grid points**: 51 values from τ = 0 (top of atmosphere) to τ = 20 (deep interior)

**Grid spacing**:
- Very fine at surface: Δτ ≈ 0.000003 (resolves thin surface layers)
- Coarse at depth: Δτ ≈ 2 (adequate for smooth deep atmosphere)

**Purpose**: Standard grid for pretabulated integration weights. Atmosphere depth grid (TAUNU) is interpolated to/from this grid.

---

### 2.3 Pretabulated Integration Weights

**COEFJ Matrix** (51×51): J-integral weights

```fortran
COMMON /MATXJ/COEFJ(51,51)
```

**Meaning**: `COEFJ(i,j)` = contribution of source function at τⱼ to mean intensity at τᵢ

**Mathematical form**:
```
J(τᵢ) = Σⱼ COEFJ(i,j) × S(τⱼ)
```

**Populated by**: `SUBROUTINE BLOCKJ` (atlas12.for:10610+) - massive DATA statements with precomputed values

---

**COEFH Matrix** (51×51): H-integral weights

```fortran
COMMON /MATXH/COEFH(51,51)
```

**Meaning**: `COEFH(i,j)` = contribution of source function at τⱼ to Eddington flux at τᵢ

**Mathematical form**:
```
H(τᵢ) = Σⱼ COEFH(i,j) × S(τⱼ)
```

**Populated by**: `SUBROUTINE BLOCKH` (similar to BLOCKJ)

---

**CK and CH Arrays**: Surface K and H integrals

```fortran
DATA CK/
 1 3.57771910E-07, 7.45730404E-07, ..., 3.81791959E-11/
DATA CH/
 1 7.15528131E-07, 1.49142693E-06, ..., 3.90236420E-11/
```

**Purpose**: Weights for computing surface flux and K-integral:
```
K(τ=0) = Σⱼ CK(j) × S(τⱼ)
H(τ=0) = Σⱼ CH(j) × S(τⱼ)
```

**Magic constants**: 51 values each, origin unknown (probably from published RT method)

---

### 2.4 Algorithm: No Scattering (IFSCAT=0)

**Code path** (atlas12.for:10416-10427):

```fortran
IF(IFSCAT.EQ.1)GO TO 30

! Set source function = thermal source
DO 20 J=1,NRHOX
20 SNU(J)=SNUBAR(J)

! Map to XTAU grid
MAXJ=MAP1(TAUNU,SNU,NRHOX,XTAU8,XS8,NXTAU)

! Compute J and H using weights
...
```

**Steps**:
1. S(τ) ← S̄(τ) (no scattering, thermal emission only)
2. Interpolate S from atmosphere grid (TAUNU) to standard grid (XTAU8)
3. Apply integration weights: J = COEFJ·S, H = COEFH·S
4. Interpolate J and H back to atmosphere grid

**Simplification**: When scattering is negligible (continuum-dominated), no iteration needed.

---

### 2.5 Algorithm: With Scattering (IFSCAT=1)

**Code path** (atlas12.for:10428-10522):

```fortran
30 IF(TAUNU(1).GT.XTAU8(NXTAU))MAXJ=1
IF(MAXJ.EQ.1)GO TO 401

! Map SNUBAR and ALPHA to XTAU grid
MAXJ=MAP1(TAUNU,SNUBAR,NRHOX,XTAU8,XSBAR8,NXTAU)
MAXJ=MAP1(TAUNU,ALPHA,NRHOX,XTAU8,XALPHA8,NXTAU)

! Set up linear system
DO 31 L=1,NXTAU
  XALPHA8(L)=MAX(XALPHA8(L),0.D0)
  XSBAR8(L)=MAX(XSBAR8(L),1.D-38)
  XS(L)=XSBAR(L)
  DIAG(L)=1.-XALPHA(L)*COEFJ(L,L)
31 XSBAR(L)=(1.-XALPHA(L))*XSBAR(L)

! Iterate to solve S = (1-α)S̄ + αJ
DO 34 L=1,NXTAU
  K=NXTAU+1
  DO 33 KK=1,NXTAU
    K=K-1
    DELXS=0.
    DO 32 M=1,NXTAU
32  DELXS=DELXS+COEFJ(K,M)*XS(M)
    DELXS=(DELXS*XALPHA(K)+XSBAR(K)-XS(K))/DIAG(K)
    ERRORX=ABS(DELXS/XS(K))
    IF(ERRORX.GT..00001)IFERR=1
33  XS(K)=MAX(XS(K)+DELXS,1.E-37)
39 IF(IFERR.EQ.0)GO TO 35
34 CONTINUE
```

**Iteration scheme**:
1. Initialize S^(0) = S̄
2. For iteration n:
   - Compute J^(n) = COEFJ · S^(n-1)
   - Update S^(n) = (1-α)S̄ + α J^(n)
3. Repeat until |ΔS/S| < 10^-5 for all depths
4. Maximum iterations: NXTAU (51) - this is arbitrary and may not converge

**Iterative solver**: Gauss-Seidel with backward sweep (K=NXTAU down to K=1)

**Convergence criterion**: Relative change < 10^-5 (ERRORX < 0.00001)

---

### 2.6 Interpolation Between Grids (MAP1)

**Purpose**: Interpolate from atmosphere grid (TAUNU, irregular spacing) to standard grid (XTAU8, fixed) and back.

**Function signature** (atlas12.for:1304):
```fortran
FUNCTION MAP1(XOLD,FOLD,NOLD,XNEW,FNEW,NNEW)
```

**Method**: Parabolic interpolation (quadratic fit through 3 points)

**Algorithm**:
1. Find interval: locate XOLD(L-1) < XNEW(K) < XOLD(L)
2. Fit parabola through points (L-2, L-1, L) and (L-1, L, L+1)
3. Blend two parabolas using weighted average (WT factor)
4. Evaluate parabola at XNEW(K)

**Why parabolic?** Smoother than linear, captures curvature, avoids Runge phenomenon of high-order polynomials.

**Edge cases**:
- Near boundaries (L=2, L=3): Use available points only
- Extrapolation: Clamp to boundary values

---

### 2.7 Surface Flux Calculation (IFSURF=1,2)

**Surface flux** (IFSURF=1, atlas12.for:10544-10548):
```fortran
60 XH(1)=0.
DO 61 M=1,NXTAU
61 XH(1)=XH(1)+CH(M)*XS(M)
HNU(1)=XH(1)
RETURN
```

**Simple**: H(τ=0) = Σ CH(M) × S(τₘ)

---

**Surface specific intensity** (IFSURF=2, atlas12.for:10551-10575):
```fortran
670 CALL PARCOE(XS8,XTAU8,A,B,C,NXTAU)
...
DO 675 MU=1,NMU
  SURFI(MU)=0.
  DO 674 J=1,N1
    IF(EXTAU(J,MU).EQ.0.)GO TO 675
674 SURFI(MU)=SURFI(MU)+
   1EXTAU(J,MU)*(XS8(J)+(B2CT(J)+CTWO(J)*ANGLE(MU))*ANGLE(MU))-
   2EXTAU(J+1,MU)*(XS8(J+1)+(B2CT1(J)+CTWO(J)*ANGLE(MU))*ANGLE(MU))
675 CONTINUE
```

**Method**:
1. Fit parabolic coefficients A, B, C to S(τ) using PARCOE
2. For each angle μ (ANGLE array):
   - Integrate I(μ) = ∫ S(τ) exp(-τ/μ) dτ using parabolic representation
   - Result: SURFI(MU) = emergent intensity at angle μ

**Purpose**: Detailed surface spectrum (limb darkening, line profiles)

---

## 3. Numerical Precision Analysis

### 3.1 Mixed Precision

**Float64** (REAL*8):
```fortran
IMPLICIT REAL*8 (A-H,O-Z)
REAL*8 XSBAR8(51),XALPHA8(51),XS8(51),XH8(51),XJS8(51),XTAU8(51)
REAL*8 A(kw),B(kw),C(kw),SNUBAR(kw),CTWO(kw)
```

**Float32** (REAL*4):
```fortran
REAL*4 COEFJ,COEFH,XTAU
REAL*4 XS(51),XSBAR(51),XALPHA(51),DIAG(51),XH(51),XJS(51)
REAL*4 CK(51),CH(51),DELXS,ERRORX,XJ,XBETA(51),XK
```

**Pattern**:
- Optical depth grid (XTAU8): Float64
- Source function on grid (XS8): Float64
- Integration weights (COEFJ, COEFH, CK, CH): Float32
- Working arrays during iteration (XS, XSBAR, etc.): Float32
- Atmosphere arrays (SNU, TAUNU, JNU, HNU): Float64

**Rationale** (guessed):
- Float32 for integration weights saves memory (51×51×4 = 10KB vs 20KB)
- Float32 adequate for weights (pretabulated, ~7 significant digits)
- Float64 for source function preserves accuracy during iteration
- Conversion overhead minimal (one-time per frequency)

---

### 3.2 Iterative Convergence Concerns

**Convergence criterion**:
```fortran
ERRORX=ABS(DELXS/XS(K))
IF(ERRORX.GT..00001)IFERR=1
```

**Tolerance**: 10^-5 relative change

**Maximum iterations**: NXTAU = 51 (seems arbitrary)

**Problem**: What if 51 iterations insufficient?
- Code continues anyway (no error flagged)
- Unconverged S → wrong J → wrong atmosphere

**Evidence of concern** (atlas12.for:10451):
```fortran
C     THE LIMIT ON DO 34, THE MAXIMUM NUMBER OF ITERATIONS, IS ARBITRARY
```

**Implication**: This is a known weak point. In practice, probably converges quickly for typical atmospheres.

---

### 3.3 Source Function Floor

**Multiple floor operations**:
```fortran
XSBAR8(L)=MAX(XSBAR8(L),1.D-38)
XS(K)=MAX(XS(K)+DELXS,1.E-37)
SNU(J)=MAX(SNU(J),1.D-38)
JNU(J)=MAX(JMINS(J)+SNU(J),1.D-38)
```

**Purpose**: Prevent S, J → 0 (unphysical, causes division by zero in iteration)

**Values**: 10^-37 to 10^-38 (tiny but non-zero)

**Risk**: Arbitrary floors could bias results in extreme cases (very cold, very optically thick)

---

### 3.4 Negative Source Function Handling

**Code** (atlas12.for:10484-10505):
```fortran
DO 442 J=M,NRHOX
  IF(SNU(J).LE.0.)THEN
    IFNEG=1
    DO 440 JJ=M,NRHOX
      SNUBAR(JJ)=BNU(JJ)
440   SNU(JJ)=BNU(JJ)
    GO TO 441
  ENDIF
442 CONTINUE
```

**Recovery**: If S < 0 anywhere, reset S = B (Planck function) for all affected depths

**Similarly for H**:
```fortran
DO 444 J=M,NRHOX
  IF(HNU(J).LE.0.)THEN
    IFNEG=1
    ...
```

**Interpretation**: Negative S or H indicates numerical instability. Fallback to LTE (S=B).

**Concern**: This is a **silent failure** mode. No warning to user.

---

## 4. Algorithm Origin and Published Methods

### 4.1 Likely Method: Feautrier or Auer-Mihalas

**Feautrier Method** (1964):
- Reduces RT equation to second-order ODE
- Discretizes on τ grid
- Solves tridiagonal system for u = (J + S)/2
- Standard method for 1D RT in stellar atmospheres

**Auer-Mihalas Method** (1969):
- Similar to Feautrier but with improvements for scattering
- Pretabulates angle quadrature weights
- Widely used in stellar atmosphere codes (PHOENIX, MARCS, etc.)

**ATLAS evidence**:
- 51-point τ grid is typical for Feautrier/Auer-Mihalas
- Pretabulated COEFJ/COEFH matrices match Feautrier approach
- Gauss-Seidel iteration for S matches scattering treatment

**Hypothesis**: JOSH implements Feautrier or similar method. COEFJ/COEFH come from solving RT equation + angle quadrature on fixed grid.

---

### 4.2 Where Do COEFJ/COEFH Come From?

**Source**: `SUBROUTINE BLOCKJ` and `SUBROUTINE BLOCKH` (atlas12.for:10610+)

**Format**: Massive DATA statements

**Example** (atlas12.for:10620+):
```fortran
DIMENSION CJ   1(36),CJ   2(36),...,CJ  51(36)
EQUIVALENCE (CJ(1),CJ   1(1))
DATA CJ   1/
 1 2.96417952E-01, 1.91556811E-01, ... /
```

**Total**: 51×51 = 2,601 Float32 values

**Origin**: Precomputed by separate program (probably by Kurucz or Auer-Mihalas codes)

**Portability concern**: These values are **compiler-specific Float32 representations**. Bit-for-bit reproduction requires exact values.

---

### 4.3 Magic Constants in CK and CH

**From** (atlas12.for:10372-10399):
```fortran
DATA CH/
 1 7.15528131E-07, 1.49142693E-06, ..., 3.90236420E-11/
DATA CK/
 1 3.57771910E-07, 7.45730404E-07, ..., 3.81791959E-11/
```

**Pattern**: Exponentially decreasing values

**Physical interpretation**:
- CH: Weights for H-integral at surface (flux-weighted)
- CK: Weights for K-integral at surface (second-moment)

**Origin**: Derived from angle quadrature + exponential integral functions

**Reference**: Probably from Auer-Mihalas (1969) or Mihalas (1978) textbook

---

## 5. Migration Strategy for Julia

### 5.1 Challenge Summary

**Problems**:
1. Pretabulated COEFJ/COEFH matrices (5KB each) must be ported exactly
2. Mixed Float32/Float64 precision requires careful handling
3. Iterative solver convergence not guaranteed (51 iteration limit arbitrary)
4. Silent failure modes (negative S, unconverged iteration)
5. MAP1 interpolation is complex (blended parabolas)

**Requirements**:
1. Reproduce Fortran results numerically (validation)
2. Preserve iteration behavior (convergence rate matters)
3. Handle mixed precision correctly (avoid spurious differences)
4. Flag convergence failures (improve on Fortran's silent mode)

---

### 5.2 Approach A: Direct Translation (Mixed Precision)

**Match Fortran exactly**:

```julia
function josh!(ifscat::Int, ifsurf::Int,
               taunu::Vector{Float64}, snu::Vector{Float64},
               hnu::Vector{Float64}, jnu::Vector{Float64}, ...)
    # Pretabulated weights (Float32, from DATA statements)
    coefj = Float32[...] # 51×51 matrix
    coefh = Float32[...] # 51×51 matrix
    ck = Float32[...]    # 51-element vector
    ch = Float32[...]    # 51-element vector
    xtau8 = Float64[0.0, 0.0000032, ..., 20.0]  # 51 points

    # Working arrays (Float32, matching Fortran)
    xs = zeros(Float32, 51)
    xsbar = zeros(Float32, 51)
    xalpha = zeros(Float32, 51)

    # Algorithm...
    if ifscat == 0
        # No scattering path
        snu .= snubar
        maxj = map1!(taunu, snu, nrhox, xtau8, xs8, nxtau)
        ...
    else
        # With scattering
        maxj = map1!(taunu, snubar, nrhox, xtau8, xsbar8, nxtau)
        maxj = map1!(taunu, alpha, nrhox, xtau8, xalpha8, nxtau)

        # Gauss-Seidel iteration
        for iter in 1:nxtau
            iferr = 0
            for kk in nxtau:-1:1
                delxs = sum(coefj[kk, m] * xs[m] for m in 1:nxtau)
                delxs = (delxs * xalpha[kk] + xsbar[kk] - xs[kk]) / diag[kk]
                errorx = abs(delxs / xs[kk])
                errorx > 1e-5 && (iferr = 1)
                xs[kk] = max(xs[kk] + delxs, 1f-37)
            end
            iferr == 0 && break
        end
        ...
    end
end
```

**Benefits**:
- ✅ Matches Fortran numerically
- ✅ Same convergence behavior
- ✅ Easy to validate

**Drawbacks**:
- ❌ Mixed precision awkward in Julia
- ❌ Float32 integration weights may accumulate error

---

### 5.3 Approach B: All Float64

**Use Float64 throughout**:

```julia
function josh!(ifscat::Int, ifsurf::Int, ...)
    # Pretabulated weights (convert to Float64)
    coefj = Float64[...] # 51×51 matrix
    coefh = Float64[...] # 51×51 matrix
    ck = Float64[...]    # 51-element vector
    ch = Float64[...]    # 51-element vector

    # All working arrays Float64
    xs = zeros(Float64, 51)
    xsbar = zeros(Float64, 51)
    ...
end
```

**Benefits**:
- ✅ Simpler code (no type juggling)
- ✅ Better precision (especially in iteration)
- ✅ Idiomatic Julia

**Drawbacks**:
- ❌ Won't match Fortran exactly (~10^-7 level differences)
- ❌ 2× memory for matrices (negligible: 20KB vs 10KB)
- ❌ Slightly slower matrix multiply (probably unmeasurable)

---

### 5.4 Approach C: Hybrid (Recommended)

**Float64 computation, Float32 storage**:

```julia
# Store weights as Float32 (save memory, match Fortran)
const COEFJ_F32 = Float32[...]
const COEFH_F32 = Float32[...]

# Convert to Float64 for computation
function josh!(...)
    coefj = Float64.(COEFJ_F32)
    coefh = Float64.(COEFH_F32)

    # All computation in Float64
    xs = zeros(Float64, 51)
    ...
end
```

**Benefits**:
- ✅ Float64 precision in iteration (better convergence)
- ✅ Float32 storage (matches Fortran data)
- ✅ Minimal performance cost (one-time conversion)

**Drawbacks**:
- ❌ Still won't match Fortran exactly (Float64 iteration vs Float32)

**Recommendation**: Use Approach C for production. Approach A only for validation.

---

### 5.5 Porting COEFJ/COEFH Matrices

**Option 1**: Extract from Fortran source
- Parse DATA statements from BLOCKJ/BLOCKH
- Convert to Julia arrays
- Validate: sum rows, check symmetry properties

**Option 2**: Binary dump from Fortran
- Run Fortran program, write COEFJ to binary file
- Read in Julia, verify matches DATA statements

**Option 3**: Recompute from first principles
- Implement Feautrier/Auer-Mihalas method
- Generate COEFJ/COEFH on XTAU8 grid
- Validate against Fortran values

**Recommendation**: Option 1 (parse source) for initial migration, Option 3 (recompute) for long-term maintainability.

---

### 5.6 Improving Convergence Monitoring

**Fortran weakness**:
```fortran
DO 34 L=1,NXTAU
  ...
34 CONTINUE
! No warning if IFERR still 1
```

**Julia improvement**:
```julia
converged = false
for iter in 1:max_iterations
    error_max = 0.0
    for k in nxtau:-1:1
        ...
        error_max = max(error_max, errorx)
    end
    if error_max < tolerance
        converged = true
        break
    end
end

if !converged
    @warn "JOSH iteration did not converge" max_error=error_max max_iter=max_iterations
end
```

**Benefits**:
- Warns user of convergence failure
- Reports max error for debugging
- Allows adaptive max_iterations

---

## 6. Testing Strategy

### 6.1 Unit Tests

**Test 1: No Scattering**
```julia
@testset "JOSH no scattering" begin
    # Set up test atmosphere
    taunu = [0.0, 0.1, 0.5, 1.0, 2.0, 5.0, 10.0]
    snubar = [1.0, 1.1, 1.3, 1.5, 1.8, 2.2, 2.5]  # Monotonic S̄
    alpha = zeros(7)  # No scattering

    snu, hnu, jnu = josh(0, 0, taunu, snubar, alpha, ...)

    # Verify S = S̄
    @test snu ≈ snubar

    # Verify J > 0 (mean intensity always positive)
    @test all(jnu .> 0)

    # Verify H > 0 in atmosphere (outward flux)
    @test all(hnu .> 0)
end
```

---

**Test 2: Conservative Scattering**
```julia
@testset "JOSH conservative scattering" begin
    # α = 1 everywhere (pure scattering, no emission)
    alpha = ones(7)
    snubar = zeros(7)  # No thermal emission

    # Should converge to S = constant (isotropic radiation field)
    snu, hnu, jnu = josh(1, 0, taunu, snubar, alpha, ...)

    @test all(diff(snu) .< 1e-4)  # S approximately constant
    @test abs(hnu[1]) < 1e-4     # No net flux
end
```

---

**Test 3: Convergence**
```julia
@testset "JOSH iteration convergence" begin
    # Moderate scattering
    alpha = fill(0.5, 7)
    snubar = [1.0, 1.1, 1.3, 1.5, 1.8, 2.2, 2.5]

    snu, converged, iterations = josh(1, 0, taunu, snubar, alpha, ...)

    @test converged == true
    @test iterations < 20  # Should converge quickly
end
```

---

### 6.2 Cross-Validation Against Fortran

**Test 4: Bit-for-Bit Comparison**
```julia
@testset "Fortran comparison" begin
    # Run Fortran ATLAS12, save JOSH inputs/outputs
    fortran_data = load("josh_fortran_test.jld2")

    # Run Julia JOSH with same inputs
    snu, hnu, jnu = josh(fortran_data["ifscat"],
                         fortran_data["ifsurf"],
                         fortran_data["taunu"],
                         fortran_data["snubar"],
                         fortran_data["alpha"], ...)

    # Compare outputs
    @test snu ≈ fortran_data["snu"] rtol=1e-6
    @test hnu ≈ fortran_data["hnu"] rtol=1e-6
    @test jnu ≈ fortran_data["jnu"] rtol=1e-6
end
```

**Expected tolerance**: ~10^-6 if using Float64, ~10^-7 if matching Float32 exactly

---

### 6.3 Physical Validation

**Test 5: Flux Conservation**
```julia
@testset "Flux conservation" begin
    # Compute flux at multiple depths
    snu, hnu, jnu = josh(1, 0, taunu, snubar, alpha, ...)

    # Flux should be approximately constant with depth (energy conservation)
    @test std(hnu) / mean(hnu) < 0.1  # Within 10%
end
```

**Test 6: Eddington Approximation**
```julia
@testset "Eddington limit" begin
    # Deep atmosphere (large τ): K ≈ J/3 (Eddington approximation)
    # This requires computing K (not done in standard JOSH)
    # Skip or implement K calculation for test
end
```

---

## 7. Open Questions

### 7.1 Iteration Limit

**Question**: Is 51 iterations always sufficient?

**Investigation**: Run ATLAS12 on extreme test cases, monitor IFERR flag

**Resolution**: Increase limit if needed, or implement adaptive iteration

---

### 7.2 COEFJ/COEFH Validation

**Question**: Can we verify COEFJ/COEFH are correct?

**Tests**:
1. Sum of each row should satisfy normalization
2. Symmetry properties (J is symmetric in τ space for isotropic scattering)
3. Reproduce known analytical solutions (e.g., Milne-Eddington atmosphere)

**Priority**: High - incorrect weights → systematically wrong J and H

---

### 7.3 Mixed Precision Impact

**Question**: Does Float32 vs Float64 affect atmosphere convergence?

**Resolution**: Test full ATLAS12 runs with both, compare final T(τ)

**Priority**: Medium - likely negligible, but worth confirming

---

### 7.4 Alternative RT Methods

**Question**: Should Julia migration use modern RT solver instead?

**Options**:
- Keep JOSH (proven, validated)
- Replace with DISORT (discrete ordinate, more accurate angles)
- Replace with short characteristics (better for 2D/3D extension)

**Recommendation**: Keep JOSH for initial migration (validation), consider alternatives later

---

## 8. Conclusions

### What We Learned

✅ **Identified RT method**: Likely Feautrier or Auer-Mihalas method with pretabulated weights

✅ **Found pretabulated data**: COEFJ (51×51), COEFH (51×51), CK (51), CH (51) - origin unclear but probably from published method

✅ **Documented algorithm**: Gauss-Seidel iteration for scattering, parabolic interpolation (MAP1)

✅ **Identified precision issues**: Mixed Float32/Float64, convergence limit arbitrary (51 iterations)

✅ **Found silent failure modes**: No warning if iteration doesn't converge, negative S/H reset to Planck

### Migration Strategy

1. **Phase 1**: Port COEFJ/COEFH from DATA statements (Approach A for validation)
2. **Phase 2**: Validate against Fortran JOSH outputs (tolerance ~10^-6)
3. **Phase 3**: Implement Approach C (Float64 computation, Float32 storage)
4. **Phase 4**: Add convergence monitoring and warnings
5. **Phase 5**: Test on full ATLAS12 atmosphere calculations

### Critical Path Items

🔴 **Must do**:
- Extract COEFJ/COEFH/CK/CH from Fortran source exactly
- Port MAP1 interpolation (critical for accuracy)
- Validate iteration convergence matches Fortran
- Test on known RT solutions (Milne-Eddington, etc.)

🟡 **Should do**:
- Add convergence failure warnings
- Increase iteration limit (51 → 100 or adaptive)
- Validate COEFJ/COEFH properties (normalization, etc.)

🟢 **Nice to have**:
- Recompute COEFJ/COEFH from first principles (long-term maintainability)
- Consider alternative RT methods (DISORT, SC)
- Performance optimization (SIMD for matrix multiply)

---

**Status**: ✅ Deep dive complete

**Time invested**: ~75 minutes

**Next**: Update tracking documents, or continue with remaining deep dives

---

*End of Deep Dive 05*
