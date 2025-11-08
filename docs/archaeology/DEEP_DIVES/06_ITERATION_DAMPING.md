# Deep Dive 06: Iteration Damping and Convergence Control
*ATLAS12 Temperature Correction and Stability Mechanisms*

**Risk Rank**: #5 (Medium-High priority)
**Code Section**: TCORR subroutine (atlas12.for:606-995)
**Risk Type**: Convergence stability, numerical robustness
**Analysis Date**: 2025-11-08
**Time Invested**: ~90 minutes

---

## Executive Summary

ATLAS12's convergence stability depends critically on the **TCORR** (Temperature CORRection) subroutine, which implements a sophisticated multi-mechanism damping strategy. Unlike simple damping (e.g., `XNEW = XOLD + α*ΔX`), TCORR employs:

1. **Fixed amplitude limiting** (±T_eff/25, ±τ/4)
2. **Adaptive damping** (oscillation detection → 0.5×, consistent progress → 1.25×)
3. **Temperature smoothing** (3-point weighted average)
4. **Monotonicity enforcement** (T must decrease inward)
5. **Multi-component corrections** (flux balance, optical depth, surface boundary)

**Critical finding**: ATLAS12 has **no early-exit convergence test**. It always runs exactly NUMITS iterations regardless of convergence state. Convergence is assessed post-facto by examining flux errors (FLXERR) in output.

**Migration implication**: Julia version should expose convergence diagnostics and optionally support early exit when converged, but must preserve Fortran's fixed-iteration behavior as default for validation.

---

## Table of Contents

1. [Overview: Temperature Correction Architecture](#1-overview-temperature-correction-architecture)
2. [TCORR Three-Mode Structure](#2-tcorr-three-mode-structure)
3. [Damping Mechanisms (MODE=3 Analysis)](#3-damping-mechanisms-mode3-analysis)
4. [Adaptive Damping Logic](#4-adaptive-damping-logic)
5. [Convergence Testing (or Lack Thereof)](#5-convergence-testing-or-lack-thereof)
6. [Numerical Stability Features](#6-numerical-stability-features)
7. [Migration Strategy](#7-migration-strategy)
8. [Testing Strategy](#8-testing-strategy)
9. [Open Questions](#9-open-questions)

---

## 1. Overview: Temperature Correction Architecture

### 1.1 Role in ATLAS12 Iteration

**Context**: ATLAS12 iterates to find temperature structure T(τ) that satisfies:
- Radiative equilibrium (flux conservation)
- Hydrostatic equilibrium (pressure balance)
- Ionization/excitation balance (Saha-Boltzmann)

**Main iteration loop** (atlas12.for:219-397):
```fortran
DO 100 ITERAT=1,NUMITS
   ITER=ITERAT
   ! ... compute populations (POPS, POPSALL)
   ! ... compute opacities (LINOP1, XLINOP)

   ! Frequency integration over all wavelengths
   IF(IFCORR.EQ.1)CALL TCORR(1,0)      ! MODE=1: Erase integrals
   DO 25 NU=NULO,NUHI,NUSTEP            ! Loop over frequencies
      ! ... RT solution (JOSH)
      IF(IFCORR.EQ.1)CALL TCORR(2,RCOWT)  ! MODE=2: Accumulate corrections
   25 CONTINUE

   ! Apply temperature correction
   IF(IFCORR.EQ.1)CALL TCORR(3,0)      ! MODE=3: Update T(τ)

100 CONTINUE
```

**IFCORR flag**: Controls whether temperature correction is active
- IFCORR=1: Normal mode (temperature correction ON)
- IFCORR=0: Fixed temperature (useful for testing opacity calculations)

---

### 1.2 Avrett-Krook Method Background

**TCORR implements** a variant of the Avrett-Krook temperature correction method:

**Basic principle**: Use flux error and its derivative to predict temperature change:
```
ΔT(τ) ∝ -[F_rad(τ) - F_*] / (dF_rad/dT)
```

**Complications in ATLAS12**:
1. **Convection**: Flux = F_rad + F_conv (mixed radiative/convective energy transport)
2. **Depth-dependent grid**: Correction in optical depth (τ), not physical depth (z)
3. **Hydrostatic coupling**: Changing T changes pressure structure → changes τ grid
4. **Nonlinearity**: Temperature change affects opacity → affects flux → iterative

**Comment in code** (line 704):
```fortran
C     AVRETT-KROOK TAU CORRECTION MODIFIED FOR CONVECTION
```

---

## 2. TCORR Three-Mode Structure

### 2.1 MODE=1: Initialize (Erase Integrals)

**Purpose**: Zero out frequency-integrated quantities before starting new iteration

**Code** (atlas12.for:652-657):
```fortran
   10 DO 11 J=1,NRHOX
      RJMINS(J)=0.        ! Integrated J-S (radiation field correction)
      RDABH(J)=0.         ! Integrated ∂α/∂T * H (opacity temperature derivative)
      RDIAGJ(J)=0.        ! Integrated diagonal Λ operator contribution
   11 FLXRAD(J)=0.        ! Integrated radiative flux
      RETURN
```

**Called once** per iteration before frequency loop.

---

### 2.2 MODE=2: Frequency Integration

**Purpose**: Accumulate corrections over all frequencies

**Code** (atlas12.for:662-701):
```fortran
   20 CALL DERIV(RHOX,ABTOT,DABTOT,NRHOX)  ! ∂α_total/∂ρx
      DO 21 J=1,NRHOX
         ! Opacity temperature derivative contribution
         RDABH(J)=RDABH(J)+DABTOT(J)/ABTOT(J)*HNU(J)*RCOWT

         ! Radiation field correction
         RJMINSNU(J)=ABTOT(J)*JMINS(J)*RCOWT
         RJMINS(J)=RJMINS(J)+RJMINSNU(J)

         ! Radiative flux accumulation
   21    FLXRAD(J)=FLXRAD(J)+HNU(J)*RCOWT

      ! ... Λ operator diagonal calculation (lines 671-701)
      ! This is complex - involves exponential integrals for RT geometry
```

**Key variables**:
- **RCOWT**: Integration weight for current frequency
- **HNU(J)**: Eddington flux at depth J, frequency ν
- **JMINS(J)**: J-S (mean intensity minus source function)
- **ABTOT(J)**: Total line+continuum opacity

**Called** once per frequency (typically 300-3000 times per iteration).

---

### 2.3 MODE=3: Apply Temperature Correction

**Purpose**: Compute and apply ΔT(τ) using accumulated frequency integrals

**Structure** (simplifying 300+ lines):
```fortran
   30 ! Step 1: Compute flux-based correction (DTFLUX)
      CALL DERIV(RHOX,T,DTDRHX,NRHOX)  ! dT/dρx
      ! ... integrate flux error → DTFLUX(τ)

      ! Step 2: Compute lambda-based correction (DTLAMB)
      DTLAMB(J)=-FLXDRV(J)*FLUX/100./RDIAGJ(J)*ABROSS(J)

      ! Step 3: Compute surface correction (DTSUR)
      DTSUR=(FLUX-FLXRAD(1))/FLUX*.25*T(1)

      ! Step 4: Combine corrections
      T1(J)=DTFLUX(J)+DTLAMB(J)+DTSURF(J)

      ! Step 5: Apply adaptive damping (see Section 4)
      ! Step 6: Update temperature
      T(J)=T(J)+T1(J)

      ! Step 7: Post-processing (smoothing, monotonicity, etc.)
```

**Detailed analysis** of each step follows in Section 3.

---

## 3. Damping Mechanisms (MODE=3 Analysis)

### 3.1 Optical Depth Correction Limiting

**Location**: atlas12.for:767

**Code**:
```fortran
DTAU(J)=DMAX1(-TAUROS(J)/4.,DMIN1(TAUROS(J)/4.,DTAU(J)))
```

**Meaning**: Limit optical depth correction to **±τ(J)/4** (±25% of local optical depth)

**Rationale**: Optical depth τ = ∫κρ dz is cumulative. Large changes at one depth affect all depths below. Limiting prevents runaway corrections.

**Historical evolution** (commented lines 766-769):
```fortran
c      DTAU(J)=DMAX1(-TAUROS(J)/5.,DMIN1(TAUROS(J)/5.,DTAU(J)))   ! ±20%
       DTAU(J)=DMAX1(-TAUROS(J)/4.,DMIN1(TAUROS(J)/4.,DTAU(J)))   ! ±25% (current)
c      DTAU(J)=DMAX1(-TAUROS(J)/3.,DMIN1(TAUROS(J)/3.,DTAU(J)))   ! ±33%
c      DTAU(J)=DMAX1(-TAUROS(J)/2.,DMIN1(TAUROS(J)/2.,DTAU(J)))   ! ±50%
```

**Tuning history**: Code developers experimented with factors /2, /3, /4, /5. Current choice **/4** represents balance between:
- **Smaller factor** (e.g., /5): Slower convergence, more stable
- **Larger factor** (e.g., /2): Faster convergence, risk of oscillation

**Migration note**: Preserve /4 default, but expose as tunable parameter.

---

### 3.2 Temperature Correction Limiting

**Location**: atlas12.for:802, 806

**Code**:
```fortran
TEFF25=TEFF/25.
! Lambda-based correction
DTLAMB(J)=DMAX1(-TEFF25,DMIN1(TEFF25,DTLAMB(J)))
! Surface correction
DTSUR=DMAX1(-TEFF25,DMIN1(TEFF25,DTSUR))
```

**Meaning**: Limit temperature changes to **±T_eff/25**

**Example**: For T_eff = 6000 K:
- Maximum ΔT = ±240 K per iteration
- Deep layers (T ≈ 20,000 K): Limit is 1.2% of local T
- Surface layers (T ≈ 5000 K): Limit is 4.8% of local T

**Comment** (line 801):
```fortran
C     FUDGE TO AVOID VERY LARGE TEMPERATURE CORRECTIONS
```

**Rationale**:
- Prevents "temperature runaway" from bad intermediate states
- Especially important for first few iterations with poor initial guess
- Forces gradual approach to solution

**Why T_eff/25 specifically?** Empirical tuning. Not derived from theory.

---

### 3.3 Flux-Based Correction (DTFLUX)

**Location**: atlas12.for:724-770

**Purpose**: Correct temperature to balance radiative + convective flux

**Key equations**:
```fortran
! Convection correction factor (lines 726-735)
IF(CNVFLX(J).GT.0..AND.FLXCNV0(J).GT.0.)THEN
   DEL=DLTDLP(J)-GRDADB(J)  ! Superadiabatic excess
   VCO=.5*MIXLTH*SQRT(MAX(-.5*PTOTAL(J)/RHO(J)*DLRDLT(J),0.D0))
   ! ... complex convection correction (lines 730-735)
   DDEL(J)=(1.+D/(D+DEL))/DEL
ENDIF

! Flux correction (lines 743-745)
CODRHX(J)=(RDABH(J)+CNVFL*(DTDRHX(J)/T(J)*(1.-9.*D/(D+DEL))+
 1         1.5*DDLT(J)/DEL*(1.+D/(D+DEL))))/(FLXRAD(J)+CNVFLX(J)*
 2         1.5*DLTDLP(J)/DEL*(1.+D/(D+DEL)))
```

**What this does**:
1. Computes dT/dρx needed to balance flux at each depth
2. Integrates to get ΔT(τ)
3. Accounts for coupling between radiation and convection

**Convection variables**:
- **DLTDLP**: ∇ (actual temperature gradient)
- **GRDADB**: ∇_ad (adiabatic gradient)
- **MIXLTH**: Mixing length parameter (usually ~1-2 pressure scale heights)
- **DEL**: Superadiabatic excess (∇ - ∇_ad)

**Why complex?** Convection is nonlocal (mixing length theory). Must account for:
- Convective flux contribution
- Coupling between ∇ and convective efficiency
- Optical depth of convective "bubbles" (Mihalas correction, line 4996)

---

### 3.4 Lambda-Based Correction (DTLAMB)

**Location**: atlas12.for:792

**Code**:
```fortran
DTLAMB(J)=-FLXDRV(J)*FLUX/100./RDIAGJ(J)*ABROSS(J)
```

**Variables**:
- **FLXDRV(J)**: Derivative of flux error with respect to τ
- **RDIAGJ(J)**: Frequency-integrated diagonal Λ operator contribution
- **ABROSS(J)**: Rosseland mean opacity

**Purpose**: Corrects temperature based on flux error gradient

**Related code** (lines 785-791):
```fortran
CALL DERIV(TAUROS,FLXERR,FLXDRV,NRHOX)  ! d(flux error)/dτ

! Flux error (line 784):
FLXERR(J)=(FLXRAD(J)+CNVFLX(J)-FLUX)/FLUX*100.  ! % error
```

**Selective zeroing** (lines 793-800):
```fortran
IF(CNVFLX(J)/FLXRAD(J).LT.1.D-5.AND.TAUROS(J).LT.1.)GO TO 42
DTLAMB(J)=0.
DTLAMB(J-1)=DTLAMB(J-1)/2.   ! Reduce correction for 5 layers
DTLAMB(J-2)=DTLAMB(J-2)/2.   ! above convective regions
DTLAMB(J-3)=DTLAMB(J-3)/2.
DTLAMB(J-4)=DTLAMB(J-4)/2.
DTLAMB(J-5)=DTLAMB(J-5)/2.
```

**Why zero DTLAMB in convective regions?**
- Lambda operator correction assumes radiative-only transport
- In convective zones, flux balance involves convective overshoot
- Safer to rely on DTFLUX (which accounts for convection)

---

### 3.5 Surface Correction (DTSUR)

**Location**: atlas12.for:805-822

**Purpose**: Correct surface temperature to match boundary flux

**Basic formula** (line 805):
```fortran
DTSUR=(FLUX-FLXRAD(1))/FLUX*.25*T(1)
```

**Derivation**: Stefan-Boltzmann law F ∝ T^4
```
δF/F ≈ 4·δT/T
⟹ δT ≈ (δF/F) · T/4 = (FLUX-FLXRAD(1))/FLUX * .25*T(1)
```

**Subtlety** (lines 811-816): Redistribution to avoid double-counting
```fortran
! Integrate combined correction from τ=0.1 to τ=2.0
TAV=(TTWO-TONE)/2.  ! Average correction in that range

IF(DTSUR*TAV.LE.0.)TAV=0.           ! Same sign check
IF(ABS(TAV).GT.ABS(DTSUR))TAV=DTSUR ! Magnitude check

DTSUR=DTSUR-TAV  ! Reduce surface correction by overlap amount
```

**Why?** DTFLUX + DTLAMB already include some surface correction. This avoids applying it twice.

**Convection reduction** (lines 827-831, commented out):
```fortran
C     REDUCE SURFACE CORRECTION TO THE FRACTION OF RADIATIVE FLUX
cc    DTSURF(J)=DTSURF(J)*(1.-HRATIO(J))  ! HRATIO = F_conv/(F_rad+F_conv)
```

Original intent: Reduce surface correction in convective atmospheres. Currently disabled.

---

## 4. Adaptive Damping Logic

### 4.1 Oscillation Detection and Response

**Location**: atlas12.for:847-850

**Code**:
```fortran
IF(ITER.EQ.1)GO TO 62                           ! Skip on first iteration
IF(OLDT1(J)*T1(J).GT.0..AND.ABS(OLDT1(J)).GT.ABS(T1(J)))
 1   T1(J)=T1(J)*1.25                           ! Accelerate convergence
IF(OLDT1(J)*T1(J).LT.0.)T1(J)=T1(J)*.5         ! Damp oscillation
62 OLDT1(J)=T1(J)                               ! Store for next iteration
```

**Variables**:
- **T1(J)**: Current iteration temperature correction
- **OLDT1(J)**: Previous iteration temperature correction

**Logic**:

| Condition | Action | Factor | Rationale |
|-----------|--------|--------|-----------|
| `OLDT1*T1 > 0` AND `|OLDT1| > |T1|` | Accelerate | ×1.25 | Correction getting smaller with same sign → converging steadily |
| `OLDT1*T1 < 0` | Damp | ×0.5 | Sign flip → oscillation detected |
| Other | Keep | ×1.0 | First iteration or increasing correction |

**Example scenario**:

| Iter | T(τ=1) | DTLAMB | DTFLUX | T1 (before adaptive) | OLDT1 | Adaptive action | T1 (final) | T(τ=1) after |
|------|--------|--------|--------|----------------------|-------|-----------------|------------|--------------|
| 1    | 8000 K | +200 K | +50 K  | +250 K               | 0     | None (ITER=1)   | +250 K     | 8250 K       |
| 2    | 8250 K | +180 K | +40 K  | +220 K               | +250 K| Accelerate (×1.25) | +275 K  | 8525 K       |
| 3    | 8525 K | -50 K  | -30 K  | -80 K                | +275 K| Damp (×0.5)     | -40 K      | 8485 K       |
| 4    | 8485 K | +30 K  | +20 K  | +50 K                | -40 K | Damp (×0.5)     | +25 K      | 8510 K       |
| 5    | 8510 K | +20 K  | +10 K  | +30 K                | +25 K | Accelerate (×1.25) | +38 K   | 8548 K       |

**Effectiveness**: Automatically responds to convergence behavior without manual tuning.

---

### 4.2 Convection Zone Exception

**Location**: atlas12.for:843-845

**Code**:
```fortran
IF(IFCONV.EQ.1.AND.HRATIO(J).GT.0.)GO TO 62     ! Skip adaptive damping
cc IF(IFCONV.EQ.1.AND.J.GE.NRHOX/2)GO TO 62     ! Alternative (commented)
cc IF(IFCONV.EQ.1.AND.J.GE.NRHOX/3)GO TO 62     ! Alternative (commented)
```

**Meaning**: **Disable adaptive damping in convective zones**

**Rationale**:
- Convective temperature structure changes more slowly (large thermal inertia)
- Oscillations in convective zones are less harmful than in radiative zones
- Convection correction (DTFLUX) already includes implicit damping via mixing length

**Note**: Commented-out alternatives suggest developers experimented with:
- Disabling in outer half of model (J ≥ NRHOX/2)
- Disabling in outer third (J ≥ NRHOX/3)
- Current: Disable only where convection is actually active (HRATIO > 0)

---

## 5. Convergence Testing (or Lack Thereof)

### 5.1 Fixed Iteration Count

**Critical finding**: ATLAS12 **does not test for convergence during iteration**

**Main loop** (atlas12.for:219-397):
```fortran
DO 100 ITERAT=1,NUMITS
   ! ... [all iteration work]
100 CONTINUE
```

**Always runs exactly NUMITS iterations**, regardless of:
- Flux error magnitude
- Temperature change magnitude
- Convergence rate

**Why?** Historical reasons:
1. Original ATLAS codes (1970s) assumed fixed iteration count
2. Convergence criteria are problem-dependent (hot vs cool stars, OS vs ODF)
3. User controls NUMITS based on experience with similar models

---

### 5.2 Post-Iteration Diagnostics

**Convergence assessed** by examining final output:

**Flux error** (line 784):
```fortran
FLXERR(J)=(FLXRAD(J)+CNVFLX(J)-FLUX)/FLUX*100.  ! % error
```

**Typical convergence criteria** (not enforced by code, user judgment):
- **Good convergence**: max|FLXERR| < 1% at all depths
- **Acceptable**: max|FLXERR| < 5% except near boundaries
- **Poor**: max|FLXERR| > 10% in deep layers

**Output** (if IFPRNT(ITER) > 0):
```fortran
WRITE(6,100) (J,RHOX(J),T(J),DTLAMB(J),DTSURF(J),DTFLUX(J),T1(J),
 1HRATIO(J),FLXERR(J),FLXDRV(J),J=1,NRHOX)
```

Prints:
- Current temperature T(J)
- Individual corrections: DTLAMB, DTSURF, DTFLUX
- Combined correction T1(J)
- Flux error FLXERR(J)

**User manually inspects** this output to decide if model converged.

---

### 5.3 Abort Mechanism (Disabled)

**Location**: atlas12.for:348-370

**Code**:
```fortran
IFABORT=0
DO 7654 J=1,NRHOX
   IF(SNU(J).LT.0.)GO TO 7653   ! Negative source function
   IF(JNU(J).LT.0.)GO TO 7653   ! Negative mean intensity
7654 CONTINUE
DO 7651 J=1,NRHOX
   IF(HNU(J).LT.0.)GO TO 7651   ! Negative Eddington flux
7651 CONTINUE
GO TO 7655
7653 IFABORT=1

IFABORT=0   ! ← Immediately reset!

7652 PRINT 7657,NU,WAVE
! ... [diagnostic output]
c    IF(IFABORT.EQ.1)CALL ABORT
IF(IFABORT.EQ.1)CALL EXIT   ! Never executed (IFABORT=0)
```

**Analysis**:
- Code checks for negative (unphysical) values
- Sets IFABORT=1 if found
- **Immediately resets IFABORT=0** (line 359)
- Subsequent EXIT check (line 370) never triggers

**Likely history**:
1. Original code aborted on negative values
2. Developers found this too strict (numerical noise can cause transient negatives)
3. Disabled abort but left diagnostic output
4. Current behavior: Print warning, clamp to 1e-99 (lines 372-374), continue

---

## 6. Numerical Stability Features

### 6.1 Temperature Smoothing

**Location**: atlas12.for:893-898

**Code**:
```fortran
IF(J1SMOOTH.GT.0)THEN
   DO 3001 J=J1SMOOTH,J2SMOOTH
3001    TSMOOTH(J)=WTJM1*T(J-1)+WTJ*T(J)+WTJP1*T(J+1)
   DO 3002 J=J1SMOOTH,J2SMOOTH
3002    T(J)=TSMOOTH(J)
ENDIF
```

**Purpose**: Apply 3-point weighted average to temperature distribution

**Parameters** (set in COMMON /TSMOOTH/):
- **J1SMOOTH, J2SMOOTH**: Depth range to smooth
- **WTJM1, WTJ, WTJP1**: Weights (typically sum to 1.0)

**Typical usage**:
```fortran
! Example: Smooth optical depth range τ=0.1 to τ=2.0
J1SMOOTH = depth index where τ ≈ 0.1
J2SMOOTH = depth index where τ ≈ 2.0
WTJM1 = 0.25
WTJ   = 0.50
WTJP1 = 0.25
```

**When enabled**: Usually for problematic models (oscillations, sharp features)

**Default**: J1SMOOTH=0 → smoothing disabled

---

### 6.2 Monotonicity Enforcement

**Location**: atlas12.for:901-905

**Code**:
```fortran
c    if(teff.gt.4250)then   ! Temperature-dependent (commented)
DO 6050 I=2,NRHOX
   J=NRHOX+1-I             ! Loop backward (deep to surface)
   T(J)=MIN(T(J),T(J+1)-1.)  ! Force T(τ_i) ≤ T(τ_{i+1}) - 1K
6050 CONTINUE
c    endif
```

**Meaning**: Temperature must **decrease monotonically outward**, with minimum 1 K spacing

**Rationale**:
- Stellar atmospheres are generally radiatively heated from below
- Monotonic T(τ) is physically expected (except for temperature inversion in chromospheres)
- Non-monotonic T can cause numerical instabilities in RT solution

**Why 1 K minimum?** Prevents layers from becoming isothermal (which causes division by zero in some derivatives)

**Commented condition**: `if(teff.gt.4250)` suggests this was originally applied only to hot stars, but now applied unconditionally

---

### 6.3 Minimum Temperature (Disabled)

**Location**: atlas12.for:908-910 (commented out)

**Code**:
```fortran
c     DO 6051 J=1,NRHOX
c        T(J)=MAX(T(J),2089.0D0)  ! Minimum T = 2089 K
c 6051 CONTINUE
```

**Why 2089 K?** Approximate H^- ionization temperature
- Below ~2000 K, H^- (dominant opacity source in cool stars) freezes out
- Opacities become very small → numerical issues

**Currently disabled**: Suggests modern code handles low-temperature opacities better

---

### 6.4 Rhox Grid Adjustment

**Location**: atlas12.for:856-888, 954-955

**Purpose**: Maintain constant optical depth grid (TAUROS) despite temperature changes

**Problem**: Temperature changes affect opacity κ(T)
```
τ(z) = ∫_z^∞ κ(z')ρ(z') dz'
```
If T changes → κ changes → τ grid changes → no longer comparing same physical depths

**Solution**: Adjust mass column density grid (RHOX) to compensate

**Code** (simplified):
```fortran
! Compute how T change affects pressure (∝ ρ)
IDUM=MAP1(TAUROS,T,NRHOX,TAUSTD,TNEW1,NRHOX)       ! Old T on std τ grid
IDUM=MAP1(TAUROS,TPLUS,NRHOX,TAUSTD,TNEW2,NRHOX)   ! New T on std τ grid

CALL TTAUP(TNEW1,TAUSTD,AB1,PTOT1,P1,...)  ! Pressure for old T
CALL TTAUP(TNEW2,TAUSTD,AB2,PTOT2,P2,...)  ! Pressure for new T

PPP(J)=(PTOT2(J)-PTOT1(J))/PTOT1(J)        ! Fractional pressure change
IDUM=MAP1(TAUSTD,PPP,NRHOX,TAUROS,RRR,NRHOX)
DRHOX(J)=RRR(J)*RHOX(J)                     ! Rhox adjustment

RHOX(J)=RHOX(J)+DRHOX(J)                    ! Apply adjustment (line 955)
```

**Effect**: TAUROS grid stays fixed at:
```fortran
TAUSTD(J)=10.**(TAU1LG+DFLOAT(J-1)*STEPLG)
```
Even though T, P, κ all change iteration to iteration.

---

## 7. Migration Strategy

### 7.1 Julia Package Structure

**Recommended design**:
```julia
# Core types
struct ConvergenceControl
    # Fixed limits
    max_tau_correction::Float64      # TAUROS(J)/factor (default: 4)
    max_temp_correction::Float64     # Teff/factor (default: 25)

    # Adaptive damping
    enable_adaptive::Bool            # default: true
    accel_factor::Float64            # default: 1.25
    damp_factor::Float64             # default: 0.5

    # Smoothing
    enable_smoothing::Bool           # default: false
    smooth_range::Tuple{Int,Int}     # (J1SMOOTH, J2SMOOTH)
    smooth_weights::Tuple{Float64,Float64,Float64}  # (WTJM1, WTJ, WTJP1)

    # Monotonicity
    enforce_monotonic::Bool          # default: true
    min_temp_diff::Float64           # default: 1.0 K

    # Convergence
    max_iterations::Int              # NUMITS
    enable_early_exit::Bool          # default: false (match Fortran)
    flux_tol::Float64                # Early exit if max|FLXERR| < flux_tol
end

# Main correction function
function temperature_correction!(
    atmosphere::AtmosphereModel,
    iteration::Int,
    control::ConvergenceControl,
    diagnostics::ConvergenceDiagnostics
)
    # MODE=3 implementation
    # ... (see Section 7.2)
end
```

---

### 7.2 Correction Algorithm Implementation

**Pseudocode**:
```julia
function temperature_correction!(atm, iter, control, diag)
    # Step 1: Compute component corrections
    dtflux = flux_correction(atm)          # DTFLUX (Section 3.3)
    dtlamb = lambda_correction(atm)        # DTLAMB (Section 3.4)
    dtsurf = surface_correction(atm)       # DTSUR (Section 3.5)

    # Step 2: Apply fixed limits
    dtlamb = clamp.(dtlamb, -control.max_temp_correction, control.max_temp_correction)
    dtsurf = clamp(dtsurf, -control.max_temp_correction, control.max_temp_correction)

    # Step 3: Combine corrections
    t1 = dtflux .+ dtlamb .+ dtsurf

    # Step 4: Adaptive damping
    if control.enable_adaptive && iter > 1
        t1 = adaptive_damp(t1, diag.prev_correction, atm.convective_fraction, control)
    end

    # Step 5: Update temperature
    atm.temperature .+= t1

    # Step 6: Post-processing
    if control.enable_smoothing
        smooth_temperature!(atm, control)
    end

    if control.enforce_monotonic
        enforce_monotonicity!(atm, control.min_temp_diff)
    end

    # Step 7: Adjust rhox grid
    adjust_rhox_grid!(atm)

    # Step 8: Store for next iteration
    diag.prev_correction .= t1
    diag.flux_error = compute_flux_error(atm)
    diag.max_flux_error = maximum(abs, diag.flux_error)

    return diag
end
```

---

### 7.3 Adaptive Damping Implementation

**Julia code**:
```julia
function adaptive_damp(
    t1::Vector{Float64},
    oldt1::Vector{Float64},
    conv_fraction::Vector{Float64},
    control::ConvergenceControl
)::Vector{Float64}

    result = copy(t1)

    for j in eachindex(t1)
        # Skip convective zones
        if conv_fraction[j] > 0.0
            continue
        end

        # Detect same-sign convergence (getting smaller)
        if oldt1[j] * t1[j] > 0.0 && abs(oldt1[j]) > abs(t1[j])
            # Accelerate convergence
            result[j] *= control.accel_factor  # 1.25

        # Detect oscillation (sign flip)
        elseif oldt1[j] * t1[j] < 0.0
            # Damp oscillation
            result[j] *= control.damp_factor   # 0.5
        end
    end

    return result
end
```

---

### 7.4 Convergence Diagnostics

**Julia implementation**:
```julia
struct ConvergenceDiagnostics
    iteration::Int
    flux_error::Vector{Float64}         # FLXERR
    max_flux_error::Float64             # max|FLXERR|
    prev_correction::Vector{Float64}    # OLDT1
    temp_change::Vector{Float64}        # T1
    max_temp_change::Float64            # max|T1|
    oscillation_detected::BitVector     # Sign flips
end

function check_convergence(diag::ConvergenceDiagnostics, control::ConvergenceControl)::Bool
    # Early exit if enabled
    if !control.enable_early_exit
        return false  # Match Fortran: never exit early
    end

    # Flux error criterion
    if diag.max_flux_error < control.flux_tol
        return true
    end

    return false
end
```

**Usage**:
```julia
for iter in 1:control.max_iterations
    # ... [iteration work]

    diag = temperature_correction!(atm, iter, control, diag)

    if check_convergence(diag, control)
        @info "Converged at iteration $iter (max flux error: $(diag.max_flux_error)%)"
        break
    end
end
```

---

### 7.5 Validation Strategy

**Phase 1**: Bit-for-bit reproduction
```julia
# Use Fortran defaults
control = ConvergenceControl(
    max_tau_correction = 4.0,
    max_temp_correction = teff / 25.0,
    enable_adaptive = true,
    accel_factor = 1.25,
    damp_factor = 0.5,
    enable_smoothing = false,
    enforce_monotonic = true,
    min_temp_diff = 1.0,
    max_iterations = numits,
    enable_early_exit = false  # Match Fortran
)

# Compare iteration-by-iteration
for iter in 1:control.max_iterations
    # Julia iteration
    diag_julia = temperature_correction!(atm_julia, iter, control, diag_julia)

    # Fortran output (from saved files)
    t_fortran = read_fortran_output("iter_$(iter)_temp.dat")

    # Compare
    @test t_julia ≈ t_fortran rtol=1e-10
end
```

**Phase 2**: Enhanced features
```julia
# Enable early exit
control.enable_early_exit = true
control.flux_tol = 1.0  # Exit if max flux error < 1%

# Run same model
run_atlas12_julia(model_params, control)

# Should converge in fewer iterations (if model is well-behaved)
@test diag_julia.iteration < control.max_iterations
```

---

## 8. Testing Strategy

### 8.1 Unit Tests

**Test 1**: Fixed limiting
```julia
@testset "Temperature correction limiting" begin
    teff = 6000.0
    max_corr = teff / 25.0  # 240 K

    # Test clamping
    @test clamp(300.0, -max_corr, max_corr) == max_corr
    @test clamp(-300.0, -max_corr, max_corr) == -max_corr
    @test clamp(100.0, -max_corr, max_corr) == 100.0
end
```

**Test 2**: Adaptive damping
```julia
@testset "Adaptive damping" begin
    control = ConvergenceControl(accel_factor=1.25, damp_factor=0.5)

    # Convergence case (same sign, decreasing)
    t1 = [100.0]
    oldt1 = [150.0]
    conv_frac = [0.0]
    result = adaptive_damp(t1, oldt1, conv_frac, control)
    @test result[1] ≈ 100.0 * 1.25  # Accelerated

    # Oscillation case (sign flip)
    t1 = [100.0]
    oldt1 = [-150.0]
    result = adaptive_damp(t1, oldt1, conv_frac, control)
    @test result[1] ≈ 100.0 * 0.5   # Damped

    # Convective zone (no damping)
    conv_frac = [0.5]
    result = adaptive_damp(t1, oldt1, conv_frac, control)
    @test result[1] ≈ 100.0         # Unchanged
end
```

**Test 3**: Monotonicity
```julia
@testset "Monotonicity enforcement" begin
    t = [6000.0, 7000.0, 7500.0, 7200.0, 8000.0]  # Non-monotonic
    enforce_monotonicity!(t, 1.0)

    # Should be monotonic increasing (deeper layers hotter)
    for j in 1:length(t)-1
        @test t[j+1] >= t[j] + 1.0
    end

    @test t == [6000.0, 7000.0, 7500.0, 7501.0, 8000.0]
end
```

---

### 8.2 Integration Tests

**Test 1**: Solar model convergence
```julia
@testset "Solar model convergence" begin
    model = read_model("solar_teff5777_logg4.44.mod")
    control = default_convergence_control()
    control.max_iterations = 50
    control.enable_early_exit = true
    control.flux_tol = 1.0  # 1% max flux error

    result = run_atlas12(model, control)

    @test result.converged == true
    @test result.iterations < 50
    @test maximum(abs, result.flux_error) < 1.0
end
```

**Test 2**: Hot star (convergence challenge)
```julia
@testset "Hot star convergence (Teff=30000K)" begin
    # Known convergence challenge (Castelli 2005 fix)
    model = read_model("hot_star_teff30000_logg4.0.mod")
    control = default_convergence_control()
    control.max_iterations = 100

    result = run_atlas12(model, control)

    # Should converge (with Castelli's fixes)
    @test result.converged == true
    @test !any(result.diagnostics.oscillation_detected)
end
```

**Test 3**: Oscillation detection
```julia
@testset "Oscillation handling" begin
    # Deliberately poor initial guess
    model = read_model("poor_initial_guess.mod")
    control = default_convergence_control()
    control.max_iterations = 30

    result = run_atlas12(model, control)

    # Should detect and damp oscillations
    oscillation_count = sum(result.diagnostics.oscillation_detected)
    @test oscillation_count > 0  # Did detect oscillations

    # Should still converge (damping works)
    @test result.converged == true
end
```

---

### 8.3 Regression Tests

**Test against Fortran output**:
```julia
@testset "Fortran comparison" begin
    # Run same model with both codes
    model_params = (teff=6000.0, logg=4.0, metal=0.0)

    # Julia run
    result_julia = run_atlas12_julia(model_params, default_convergence_control())

    # Fortran output (pre-generated)
    result_fortran = read_fortran_output("solar_model_ref.dat")

    # Compare final temperature structure
    @test result_julia.temperature ≈ result_fortran.temperature rtol=1e-4

    # Compare convergence history
    for iter in 1:min(length(result_julia.history), length(result_fortran.history))
        @test result_julia.history[iter].max_flux_error ≈
              result_fortran.history[iter].max_flux_error rtol=1e-3
    end
end
```

---

## 9. Open Questions

### 9.1 For Domain Expert (Paula)

**Q1**: Is the /4 optical depth limiting factor (Section 3.1) scientifically justified, or purely empirical?
- **Context**: Code has /2, /3, /4, /5 as commented alternatives
- **Impact**: Affects convergence speed vs stability tradeoff
- **Julia decision**: Keep /4 default, expose as parameter?

**Q2**: Under what conditions should temperature smoothing be enabled (Section 6.1)?
- **Context**: Currently controlled by J1SMOOTH, J2SMOOTH (typically 0 → disabled)
- **Impact**: Need to document when/why user should enable
- **Examples**: Oscillating models? Sharp abundance gradients?

**Q3**: Why is surface correction reduced by TAV (Section 3.5, lines 811-816)?
- **Context**: Complex logic to avoid double-counting
- **Physics**: Is this specific to Avrett-Krook method?
- **Validation**: How to test this is working correctly?

**Q4**: What is the physical significance of RDIAGJ (diagonal Λ operator, Section 3.4)?
- **Context**: Used in DTLAMB calculation, involves exponential integrals
- **Physics**: How does this relate to RT operator theory?
- **Literature**: Is there a reference paper?

---

### 9.2 For Code Validation

**Q5**: Why are convective zones excluded from adaptive damping (Section 4.2)?
- **Test**: Does disabling this improve or worsen convergence for convective models?
- **Julia**: Should we make this configurable?

**Q6**: What is the optimal NUMITS for different stellar types?
- **Observation**: Code always runs fixed iterations
- **Data needed**: Survey typical NUMITS used by community
  - Solar-type: ? iterations
  - Hot stars (T > 20,000 K): ? iterations
  - Cool stars (T < 4000 K): ? iterations
- **Julia advantage**: Early exit could auto-tune this

**Q7**: How often do models fail to converge in NUMITS iterations?
- **Community experience**: Anecdotal reports of non-convergence
- **Julia opportunity**: Better diagnostics, adaptive strategies
- **Data needed**: Failed model examples for testing

---

### 9.3 For Migration Decisions

**Q8**: Should Julia version support "restart from iteration N"?
- **Use case**: Model diverges at iteration 45 → adjust damping → resume
- **Fortran**: Must restart from scratch
- **Julia**: Could checkpoint iteration state

**Q9**: Should we implement alternative correction methods?
- **Avrett-Krook**: Current method (complex, mature)
- **Simpler alternatives**: Unsöld-Lucy? Cannon?
- **Research**: Are there modern improvements to A-K method?

**Q10**: How to handle convection correction (Section 3.3)?
- **Complexity**: Lines 726-735 have intricate convection coupling
- **Comment** (line 4996): "CORRECTION FOR OPTICALLY THIN BUBBLES AFTER MIHALAS"
- **Literature**: Need Mihalas reference to understand physics
- **Validation**: How to test convection correction independently?

---

## 10. Summary of Migration Risks

| Risk | Severity | Likelihood | Mitigation |
|------|----------|------------|------------|
| Wrong damping factors break convergence | High | Medium | Extensive validation suite, Fortran comparison |
| Adaptive damping logic bug causes oscillation | High | Low | Unit tests for all logic branches |
| Convection correction implementation error | High | Medium | Validate with convective models |
| Optical depth grid adjustment drift | Medium | Low | Test τ grid constancy over iterations |
| Early exit introduces numerical differences | Low | High | Default to Fortran behavior (fixed iterations) |

---

## 11. Key Takeaways for Migration

1. **TCORR is complex**: 350+ lines, 6+ damping mechanisms, non-trivial convection coupling
2. **No magic convergence test**: Fortran always runs fixed iterations (NUMITS)
3. **Adaptive damping is clever**: Automatically responds to oscillation vs steady convergence
4. **Multiple length scales**: Corrections limited at both temperature (±T_eff/25) and optical depth (±τ/4) scales
5. **Grid adjustment is critical**: Rhox must be updated to maintain constant τ grid
6. **Convection complicates everything**: Special handling in damping, corrections, diagnostics
7. **Fortran tuning is empirical**: /4 factor, 1.25× acceleration, 0.5× damping - all from experience
8. **Julia opportunity**: Add early exit, better diagnostics, adaptive strategies - but **validate first with fixed-iteration mode**

---

**Status**: Deep Dive complete. Ready for code implementation.

**Next steps**:
1. Implement ConvergenceControl and ConvergenceDiagnostics types
2. Implement temperature_correction! function (MODE=3)
3. Port convection correction logic (coordinate with CONVEC subroutine analysis)
4. Create validation test suite
5. Generate Fortran reference outputs for iteration-by-iteration comparison

**Time to implement**: Estimated 10-15 hours (complex algorithm, extensive testing needed)

**Priority**: High (Rank #5, convergence is critical for any working ATLAS12)
