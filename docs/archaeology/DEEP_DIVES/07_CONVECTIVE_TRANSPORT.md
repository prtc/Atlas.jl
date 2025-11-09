# Deep Dive 07: Convective Energy Transport
*ATLAS12 Mixing Length Theory Implementation*

**Risk Rank**: Not in top 10 (but critical dependency for Deep Dive 06)
**Code Section**: CONVEC subroutine (atlas12.for:4847-5090)
**Risk Type**: Physics complexity, numerical derivatives, iterative coupling
**Analysis Date**: 2025-11-08
**Time Invested**: ~75 minutes

---

## Executive Summary

The **CONVEC** subroutine computes convective energy transport using **mixing length theory (MLT)** for cool stellar atmospheres (T_eff < ~8000 K). This is essential for:
- Stars with significant convective zones (solar-type and cooler)
- Accurate temperature structure in superadiabatic regions
- Computing convective flux that feeds into TCORR damping (Deep Dive 06)

**Key implementation features**:
1. **Numerical derivatives via finite differences**: Perturbs T and P by ±0.1%, calls POPS 4× to compute thermodynamic quantities
2. **Mihalas optically-thin bubble correction**: Reduces convective efficiency in optically thin regions
3. **Iterative opacity convergence**: 30-iteration loop to self-consistently determine convective opacity
4. **Convective overshooting**: Extends convection into formally stable regions (mixing)
5. **Artifact removal**: Patches to eliminate numerical noise at boundaries

**Migration challenge**: Numerical derivatives require expensive state recalculations (4× POPS calls). Julia version could use automatic differentiation (AD) for efficiency, but must validate against Fortran's finite-difference approach first.

---

## Table of Contents

1. [Mixing Length Theory Background](#1-mixing-length-theory-background)
2. [Thermodynamic Derivatives (Numerical)](#2-thermodynamic-derivatives-numerical)
3. [Convective Flux Calculation](#3-convective-flux-calculation)
4. [Mihalas Optically-Thin Correction](#4-mihalas-optically-thin-correction)
5. [Iterative Opacity Convergence](#5-iterative-opacity-convergence)
6. [Convective Overshooting](#6-convective-overshooting)
7. [Numerical Artifact Removal](#7-numerical-artifact-removal)
8. [Migration Strategy](#8-migration-strategy)
9. [Testing Strategy](#9-testing-strategy)
10. [Open Questions](#10-open-questions)

---

## 1. Mixing Length Theory Background

### 1.1 Physical Concept

**When does convection occur?**
Temperature gradient exceeds adiabatic value:
```
∇ ≡ d ln T / d ln P > ∇_ad
```

**Why?**
- Gas heated from below becomes buoyant
- Rises, expands adiabatically, cools
- If still hotter than surroundings → continues rising → **convection**

**Mixing length theory**:
- Assume convective "bubbles" travel characteristic distance **ℓ** before dissolving
- Typically **ℓ ≈ α H_P** (α ≈ 1-2 pressure scale heights)
- Bubbles transport energy via mass motion: **F_conv = ρ c_p v T_excess**

---

### 1.2 Key Variables (COMMON /CONV/)

**From COMMON block** (atlas12.for:4851-4853):
```fortran
COMMON /CONV/DLTDLP(kw),HEATCP(kw),DLRDLT(kw),VELSND(kw),
 1           GRDADB(kw),HSCALE(kw),FLXCNV(kw),VCONV(kw),MIXLTH,
 2           OVERWT,FLXCNV0(kw),FLXCNV1(kw),IFCONV,NCONV
```

**Variables**:
- **DLTDLP**: ∇ = d ln T / d ln P (actual temperature gradient)
- **GRDADB**: ∇_ad (adiabatic gradient)
- **HEATCP**: c_P (specific heat at constant pressure)
- **DLRDLT**: d ln ρ / d ln T |_P (density-temperature coupling)
- **VELSND**: Sound speed
- **HSCALE**: H_P = P/(ρg) (pressure scale height)
- **FLXCNV**: Convective flux
- **VCONV**: Convective velocity
- **MIXLTH**: Mixing length ℓ (user input, typically 1.0-2.0 H_P)
- **OVERWT**: Overshooting weight (0-1, typically 0.5)
- **IFCONV**: Flag (1=convection on, 0=off)
- **NCONV**: Number of surface layers to force F_conv = 0

---

### 1.3 When CONVEC is Called

**Main iteration loop** (atlas12.for:391):
```fortran
IF(IFPRES.EQ.1.AND.IFCONV.EQ.1)CALL CONVEC
```

**Sequence**:
1. Frequency integration completes (all wavelengths processed)
2. RADIAP(3,0) computes radiation pressure
3. HIGH computes geometric heights
4. **CONVEC** computes convective flux
5. TCORR(3,0) applies temperature correction (uses FLXCNV from CONVEC)

**Once per iteration**, after RT solution converges.

---

## 2. Thermodynamic Derivatives (Numerical)

### 2.1 Required Derivatives

**To compute convective flux**, need:
- **∂E/∂T |_P**: Energy derivative at constant pressure
- **∂E/∂P |_T**: Energy derivative at constant temperature
- **∂ρ/∂T |_P**: Density derivative at constant pressure
- **∂ρ/∂P |_T**: Density derivative at constant temperature

**From these**, compute:
- **c_V**: Specific heat at constant volume
- **c_P**: Specific heat at constant pressure
- **∇_ad**: Adiabatic gradient
- **d ln ρ / d ln T |_P**: Density-temperature coupling

**Problem**: ATLAS12 has no analytic equations of state. Populations computed via Saha-Boltzmann (POPS), which is iterative and non-analytic.

**Solution**: **Numerical derivatives via finite differences**

---

### 2.2 Finite Difference Implementation

**Strategy**: Perturb state, call POPS, measure change

**Code** (atlas12.for:4879-4947):

#### Step 1: T + 0.1% perturbation
```fortran
DO 10 J=1,NRHOX
   TLOG(J)=TLOG(J)+.0009995003    ! ln(1.001) ≈ 0.0009995003
   T(J)=T(J)*1.001                 ! T → T×1.001
   TK(J)=TK(J)*1.001               ! k_B T
   HKT(J)=HKT(J)/1.001             ! h/(k_B T)
   HCKT(J)=HCKT(J)/1.001           ! hc/(k_B T)
   TKEV(J)=TKEV(J)*1.001           ! T in eV
10 CONTINUE
ITEMP=ITEMP+1
CALL POPS(0.D0,1,XNE)              ! Recompute populations at T+ΔT

DO 11 J=1,NRHOX
   EDENS1(J)=EDENS(J)+3.*PRADK(J)/RHO(J)*(1.+DILUT(J)*(1.001**4-1.))
   RHO1(J)=RHO(J)
   ! Restore and perturb opposite direction
   TLOG(J)=TLOG(J)-.0009995003-.0010005003  ! ln(0.999)
   T(J)=T(J)/1.001*.999            ! T → T×0.999
   ! ... (similar for TK, HKT, HCKT, TKEV)
11 CONTINUE
```

**Energy density correction**:
```fortran
EDENS1(J)=EDENS(J)+3.*PRADK(J)/RHO(J)*(1.+DILUT(J)*(1.001**4-1.))
```
- **EDENS(J)**: Material energy density (from POPS)
- **3.*PRADK(J)/RHO(J)**: Radiation energy density (Stefan-Boltzmann: E_rad ∝ T^4)
- **DILUT(J)**: Dilution factor (1 - e^(-τ)), accounts for optically thin regions
- **1.001^4 - 1 ≈ 0.004**: Radiation energy change for 0.1% temperature change

**Why 3×PRADK?**
- Radiation energy density: u_rad = (4σ/c) T^4
- Radiation pressure: P_rad = u_rad/3 = (4σ/3c) T^4
- Therefore: u_rad = 3 × P_rad

---

#### Step 2: T - 0.1% perturbation
```fortran
ITEMP=ITEMP+1
CALL POPS(0.D0,1,XNE)              ! Populations at T-ΔT

DO 12 J=1,NRHOX
   EDENS2(J)=EDENS(J)+3.*PRADK(J)/RHO(J)*(1.+DILUT(J)*(.999**4-1.))
   RHO2(J)=RHO(J)
   ! Restore to original T, perturb P
   P(J)=P(J)*1.001                 ! P → P×1.001
12 CONTINUE
```

---

#### Step 3: P + 0.1% perturbation
```fortran
ITEMP=ITEMP+1
CALL POPS(0.D0,1,XNE)              ! Populations at P+ΔP

DO 13 J=1,NRHOX
   EDENS3(J)=EDENS(J)+3.*PRADK(J)/RHO(J)
   RHO3(J)=RHO(J)
   P(J)=P(J)/1.001*.999            ! P → P×0.999
13 CONTINUE
```

---

#### Step 4: P - 0.1% perturbation
```fortran
ITEMP=ITEMP+1
CALL POPS(0.D0,1,XNE)              ! Populations at P-ΔP

DO 14 J=1,NRHOX
   EDENS4(J)=EDENS(J)+3.*PRADK(J)/RHO(J)
   RHO4(J)=RHO(J)
   ! Restore original state
   XNE(J)=SAVXNE(J)
   XNATOM(J)=SAVXNA(J)
   RHO(J)=SAVRHO(J)
   P(J)=P(J)/.999
14 CONTINUE
```

---

### 2.3 Derivative Computation

**From 4 perturbed states**, compute derivatives (atlas12.for:4941-4946):
```fortran
DO 30 J=1,NRHOX
   ! Central differences
   DEDT=(EDENS1(J)-EDENS2(J))/T(J)*500.     ! ∂E/∂T |_P
   DRDT=(RHO1(J)-RHO2(J))/T(J)*500.         ! ∂ρ/∂T |_P
   DEDPG=(EDENS3(J)-EDENS4(J))/P(J)*500.    ! ∂E/∂P |_T
   DRDPG=(RHO3(J)-RHO4(J))/P(J)*500.        ! ∂ρ/∂P |_T
```

**Why ×500?**
- T_1 - T_0 = T × (1.001 - 1.000) = T × 0.001
- T_2 - T_0 = T × (0.999 - 1.000) = T × (-0.001)
- T_1 - T_2 = T × 0.002
- (E_1 - E_2) / T = (E_1 - E_2) / (T × 0.002) = (E_1 - E_2) / T × 500

Central difference over ±0.1% → factor of 500 to get ∂E/∂T.

---

### 2.4 Thermodynamic Quantities

**From derivatives**, compute (atlas12.for:4950-4967):

```fortran
! Pressure derivatives (Stefan-Boltzmann radiation)
DPDPG=1.                                          ! ∂P_total/∂P_gas ≈ 1
DPDT=4.*PRADK(J)/T(J)*DILUT(J)                   ! ∂P_total/∂T

! Actual temperature gradient
DLTDLP(J)=PTOTAL(J)/T(J)/GRAV*DTDRHX(J)          ! ∇ = d ln T / d ln P

! Specific heats
HEATCV=DEDT-DEDPG*DRDT/DRDPG                     ! c_V
HEATCP(J)=DEDT-DEDPG*DPDT/DPDPG-PTOTAL(J)/RHO(J)**2*
          (DRDT-DRDPG*DPDT/DPDPG)                ! c_P

! Sound speed
VELSND(J)=SQRT(MAX(HEATCP(J)/HEATCV*DPDPG/DRDPG,0.D0))

! Density-temperature coupling
DLRDLT(J)=T(J)/RHO(J)*(DRDT-DRDPG*DPDT/DPDPG)   ! d ln ρ / d ln T |_P

! Adiabatic gradient
GRDADB(J)=-PTOTAL(J)/RHO(J)/T(J)*DLRDLT(J)/HEATCP(J)  ! ∇_ad

! Pressure scale height
HSCALE(J)=PTOTAL(J)/RHO(J)/GRAV                  ! H_P
```

**Safety check** (lines 4960-4963):
```fortran
if(heatcv.le.0)then
   velsnd(j)=0.         ! Negative c_V → set sound speed to 0
   go to 144            ! Skip convection for this layer
endif
```

Negative c_V is unphysical (thermodynamic instability). Likely numerical artifact from finite differences.

---

## 3. Convective Flux Calculation

### 3.1 Convection Criterion

**Code** (atlas12.for:4973-4976):
```fortran
IF(MIXLTH.EQ.0.)GO TO 30      ! Mixing length = 0 → no convection
IF(J.LT.4)GO TO 30             ! Skip first 3 layers (boundary)
DEL=DLTDLP(J)-GRDADB(J)        ! Superadiabatic excess
IF(DEL.LT.0.)GO TO 30          ! Stable (∇ < ∇_ad) → no convection
```

**Superadiabatic excess**: DEL = ∇ - ∇_ad
- DEL > 0 → **Unstable** → convection
- DEL ≤ 0 → **Stable** → no convection

---

### 3.2 Convective Velocity

**Code** (atlas12.for:4977-4978):
```fortran
VCO=.5*MIXLTH*SQRT(MAX(-.5*PTOTAL(J)/RHO(J)*DLRDLT(J),0.D0))
IF(VCO.EQ.0.)GO TO 30
```

**Derivation**: From buoyancy equation
```
v_conv ∝ ℓ × sqrt(g × α_P × ΔT/T)
```
where:
- ℓ = MIXLTH × H_P (mixing length)
- g = GRAV
- α_P = (1/ρ) ∂ρ/∂T |_P = -DLRDLT/T (thermal expansion)

**Simplified**:
```fortran
VCO = 0.5 * ℓ * sqrt(-0.5 * P/ρ * d ln ρ / d ln T)
    = 0.5 * MIXLTH * H_P * sqrt(buoyancy factor)
```

**Factor of 0.5**: Empirical calibration to match solar convection zone.

---

### 3.3 Convective Heat Flux (Preliminary)

**Code** (atlas12.for:4979):
```fortran
FLUXCO=.5*RHO(J)*HEATCP(J)*T(J)*MIXLTH/12.5664
```

**Formula**:
```
F_conv = 0.5 × ρ × c_P × T × ℓ / (4π)
```

**Why /12.5664?**
- 4π ≈ 12.5664
- Factor from spherical geometry (flux divergence)

**Note**: This is **preliminary flux**. Actual flux computed iteratively (Section 5) to account for opacity changes due to convective temperature fluctuations.

---

## 4. Mihalas Optically-Thin Correction

### 4.1 Physical Motivation

**Problem**: Standard MLT assumes optically thick bubbles
- Bubbles exchange energy only via convection
- No radiation leakage

**Reality**: In optically thin regions (near surface), bubbles radiate
- Reduces convective efficiency (energy leaks out as radiation)
- Must reduce F_conv accordingly

**Reference** (atlas12.for:4996):
```fortran
C     CORRECTION FOR OPTICALLY THIN BUBBLES AFTER MIHALAS
```

Mihalas, D. 1978, *Stellar Atmospheres*, 2nd ed. (Freeman), Section 7-4.

---

### 4.2 Optical Thickness of Bubbles

**Code** (atlas12.for:4997-4998):
```fortran
TAUB=ABCONV(J)*RHO(J)*MIXLTH*HSCALE(J)
D=D*TAUB**2/(2.+TAUB**2)
```

**Bubble optical depth**:
```
τ_bubble = κ × ρ × ℓ
         = ABCONV × RHO × MIXLTH × HSCALE
```

**Correction factor**:
```
f_corr = τ_b^2 / (2 + τ_b^2)
```

**Behavior**:
- τ_b → 0 (optically thin): f_corr → 0 (strong suppression)
- τ_b → ∞ (optically thick): f_corr → 1 (no correction)
- τ_b = sqrt(2): f_corr = 0.5 (half efficiency)

**Applied to D parameter** (defined in Section 5.2), which controls convective efficiency.

---

## 5. Iterative Opacity Convergence

### 5.1 The Problem

**Convective temperature fluctuations** affect opacity:
```
T_bubble = T + ΔT_conv
κ(T_bubble) ≠ κ(T)
```

Must use **convection-weighted average opacity**:
```
κ_conv = 2 / (1/κ(T+ΔT) + 1/κ(T-ΔT))  [harmonic mean]
```

**But**: ΔT_conv depends on convective flux, which depends on κ_conv → **circular dependency**

**Solution**: Iterate to self-consistency

---

### 5.2 Iteration Loop

**Code** (atlas12.for:4982-5023):
```fortran
ROSST(J)=ROSSTAB(T(J),P(J),VTURB(J))      ! Rosseland mean at T
OLDDELT=0.
ITS30=30
IF(IFCONV.EQ.0)ITS30=1                    ! Skip iteration if IFCONV=0
DO 29 IDELTAT=1,ITS30                      ! Up to 30 iterations

   ! Evaluate opacity at T±ΔT
   DPLUS=ROSSTAB(T(J)+DELTAT(J),P(J),VTURB(J))/ROSST(J)
   DMINUS=ROSSTAB(T(J)-DELTAT(J),P(J),VTURB(J))/ROSST(J)

   ! Harmonic mean (convective opacity)
   ABCONV(J)=2./(1./DPLUS+1./DMINUS)*ABROSS(J)

   ! D parameter (dimensionless convective efficiency)
   D=8.*5.6697D-5*T(J)**4/(ABCONV(J)*HSCALE(J)*RHO(J))/
     (FLUXCO*12.5664)/VCO

   ! Mihalas correction (optically thin bubbles)
   TAUB=ABCONV(J)*RHO(J)*MIXLTH*HSCALE(J)
   D=D*TAUB**2/(2.+TAUB**2)

   ! Convective efficiency parameter
   D=D**2/2.
   DDD=(DEL/(D+DEL))**2

   ! Compute DELTA (superadiabatic excess parameter)
   IF(DDD.LT..5)GO TO 24
   DELTA=(1.-SQRT(1.-DDD))/DDD
   GO TO 26
24 DELTA=.5                              ! Series expansion for small DDD
   TERM=.5
   UP=-1.
   DOWN=2.
25 UP=UP+2.
   DOWN=DOWN+2.
   TERM=UP/DOWN*DDD*TERM
   DELTA=DELTA+TERM
   IF(TERM.GT.1.D-6)GO TO 25

26 DELTA=DELTA*DEL**2/(D+DEL)

   ! Convective velocity and flux
   VCONV(J)=VCO*SQRT(DELTA)
   FLXCNV(J)=FLUXCO*VCONV(J)*DELTA
   flxcnv(j)=max(flxcnv(j),0.D0)        ! Force non-negative

   ! Temperature fluctuation
   DELTAT(J)=T(J)*MIXLTH*DELTA
   DELTAT(J)=DMIN1(DELTAT(J),T(J)*.15)  ! Limit to 15% of T
   DELTAT(J)=DELTAT(J)*.7+OLDDELT*.3     ! Damp (0.7 new + 0.3 old)

   ! Convergence check
   IF(DELTAT(J).LT.OLDDELT+.5.AND.DELTAT(J).GT.OLDDELT-.5)GO TO 30
   OLDDELT=DELTAT(J)
29 CONTINUE
```

---

### 5.3 D Parameter

**Physical meaning**: Ratio of radiative to convective efficiency

**Formula** (line 4994):
```fortran
D=8.*5.6697D-5*T(J)**4/(ABCONV(J)*HSCALE(J)*RHO(J))/(FLUXCO*12.5664)/VCO
```

**Derivation**:
```
D = (radiative flux gradient) / (convective flux gradient)
  = (σ T^4 / κ H_P) / (ρ c_P ℓ v ΔT/H_P)
```

**Stefan-Boltzmann constant**: σ = 5.6697×10^-5 erg cm^-2 s^-1 K^-4

**Factor of 8**: From MLT theory (Cox & Giuli 1968)

---

### 5.4 DELTA Parameter

**Superadiabatic excess parameter** (dimensionless)

**Formula** (lines 5001-5014):
```
DELTA = solution to:  DELTA = (DEL/(D+DEL))^2 / (some function of DELTA)
```

**Two solution methods**:

**Method 1** (DDD ≥ 0.5): Analytic
```fortran
DDD=(DEL/(D+DEL))**2
DELTA=(1.-SQRT(1.-DDD))/DDD
```

**Method 2** (DDD < 0.5): Series expansion
```fortran
DELTA = 0.5 + (1/4) DDD + (3/8) DDD^2 + (5/16) DDD^3 + ...
      = 0.5 × Σ [(2n-1)!!/(2n)!!] × DDD^n
```

Series converges rapidly for small DDD (DDD < 0.5).

---

### 5.5 Convergence Criterion

**Code** (line 5021):
```fortran
IF(DELTAT(J).LT.OLDDELT+.5.AND.DELTAT(J).GT.OLDDELT-.5)GO TO 30
```

**Exit iteration if**: |DELTAT_new - DELTAT_old| < 0.5 K

**Typical behavior**:
- Iteration 1: Large change (DELTAT jumps from 0 to ~100-1000 K)
- Iterations 2-5: Rapid convergence (exponential decay)
- Iterations 6-30: Fine-tuning (usually not reached)

**If 30 iterations exhausted**: Proceed anyway (no warning). Rare in practice.

---

### 5.6 Damping

**Code** (line 5020):
```fortran
DELTAT(J)=DELTAT(J)*.7+OLDDELT*.3
```

**Successive over-relaxation (SOR)** with ω = 0.7:
- 70% new value
- 30% old value

**Prevents oscillation** in DELTAT between iterations.

---

## 6. Convective Overshooting

### 6.1 Physical Motivation

**Standard MLT**: Convection stops abruptly at ∇ = ∇_ad boundary

**Reality**: Convective bubbles have inertia
- Overshoot into formally stable regions
- Mixing extends beyond convection zone proper
- Important for stellar evolution (changes composition gradients)

**Implementation**: Extend F_conv into adjacent layers via spatial smoothing

---

### 6.2 Overshooting Calculation

**Code** (atlas12.for:5057-5082):
```fortran
IF(OVERWT.GT.0.)THEN
   ! Find maximum convective flux fraction
   WTCNV=0.
   DO 774 J=1,NRHOX
774   WTCNV=MAX(WTCNV,FLXCNV(J)/FLUX)
   WTCNV=MIN(WTCNV,1.D0)*OVERWT          ! Scale by overshooting weight

   DO 776 J=1,NRHOX
      ! Overshooting distance (fraction of H_P)
      DELHGT(J)=MIN(HSCALE(J)*.5D-5*WTCNV,HEIGHT(NRHOX)-HEIGHT(J),
                    HEIGHT(J)-HEIGHT(1))
      FLXCNV0(J)=FLXCNV(J)               ! Save original
      FLXCNV1(J)=0.
776 CONTINUE

   ! Integrate convective flux vs height
   CALL INTEG(HEIGHT,FLXCNV,CNVINT,NRHOX,0.D0)

   ! Compute overshooting flux (average over ±DELHGT)
   DO 777 J=NRHOX/2,NRHOX-1
      IF(DELHGT(J).EQ.0.)GO TO 777
      M=MAP1(HEIGHT,CNVINT,NRHOX,HEIGHT(J)-DELHGT(J),CNV1,1)
      M=MAP1(HEIGHT,CNVINT,NRHOX,HEIGHT(J)+DELHGT(J),CNV2,1)
      FLXCNV1(J)=FLXCNV1(J)+(CNV2-CNV1)/DELHGT(J)/2.
777 CONTINUE

   ! Take maximum of original and overshooting flux
   DO 779 J=1,NRHOX
779   FLXCNV(J)=MAX(FLXCNV0(J),FLXCNV1(J))
ENDIF
```

---

### 6.3 Overshooting Distance

**Code** (line 5066):
```fortran
DELHGT(J)=MIN(HSCALE(J)*.5D-5*WTCNV,HEIGHT(NRHOX)-HEIGHT(J),
              HEIGHT(J)-HEIGHT(1))
```

**Distance**:
```
Δh = min(0.5 H_P × WTCNV, geometric limits)
```

where:
- **WTCNV**: Convective weight (0-1), based on max F_conv/F_total
- **OVERWT**: User parameter (0-1, typically 0.5)

**Typical values**:
- Strong convection (WTCNV ≈ 1): Δh ≈ 0.5 H_P × OVERWT
- Weak convection (WTCNV ≈ 0.1): Δh ≈ 0.05 H_P × OVERWT

**Why ×0.5D-5?** This looks like a typo! Should be **×0.5**
- Line 5065 (commented): `DELHGT(J)=MIN(HSCALE(J)*MIXLTH*.5D-5,...)`
- Current (5066): `DELHGT(J)=MIN(HSCALE(J)*.5D-5*WTCNV,...)`

**Factor of 10^-5** makes Δh negligibly small. Likely should be:
```fortran
DELHGT(J)=MIN(HSCALE(J)*0.5*WTCNV,...)
```

**Migration action**: Check Fortran behavior, ask Paula if this is intentional.

---

### 6.4 Overshooting Flux Formula

**Spatial average**:
```
F_overshoot(z) = [∫(z-Δh to z+Δh) F_conv(z') dz'] / (2Δh)
```

Implemented via:
1. Integrate F_conv vs height → cumulative integral CNVINT
2. Evaluate CNVINT at z±Δh
3. Difference → average flux over interval

**Final flux**:
```fortran
FLXCNV(J)=MAX(FLXCNV0(J),FLXCNV1(J))
```

Take **maximum** of original and overshooting flux → ensures F_conv never decreases.

---

## 7. Numerical Artifact Removal

### 7.1 Surface Layer Suppression

**Code** (atlas12.for:7084-7086):
```fortran
DO 7779 J=1,NCONV
7779 FLXCNV(J)=0.
```

**Force F_conv = 0** for first NCONV layers (typically 2-5)

**Rationale**:
- Surface boundary condition: No mass flux through surface
- Numerical noise can create spurious convection at τ < 0.01
- Hard cutoff prevents this

---

### 7.2 Commented-Out Smoothing

**Code** (atlas12.for:5044-5049, commented):
```fortran
cc      DO 7735 J=1,NRHOX/2
cc 7735 FLXCNV(J)=0.               ! Zero outer half
cc      DO 7736 J=1,NRHOX
cc 7736 FLXCNV0(J)=FLXCNV(J)
cc      DO 7737 J=2,NRHOX-1
cc 7737 FLXCNV(J)=.3*FLXCNV0(J-1)+.4*FLXCNV0(J)+.3*FLXCNV0(J+1)
```

**3-point weighted smoothing** (0.3, 0.4, 0.3)

**Why commented?** Probably found unnecessary after other fixes.

**Current smoothing** (lines 5050-5051):
```fortran
DO 735 J=1,NRHOX
735 FLXCNV0(J)=FLXCNV(J)     ! Just save for overshooting, no smoothing
```

---

### 7.3 Single-Point Dropout Removal

**Code** (atlas12.for:5030-5042, commented):
```fortran
C     ELIMINATE ARTIFACTUAL CONVECTION ABOVE THE MAIN CONVECTION ZONE
C      DO 730 J=3,NRHOX
C      K=NRHOX+1-J
C      IF(FLXCNV(K).GT.0.)GO TO 731
C  730 CONTINUE
C      RETURN
C  731 DO 732 J=1,K
C      L=K+1-J
C      IF(FLXCNV(L).EQ.0.)GO TO 733
C  732 CONTINUE
C  733 DO 734 J=1,L
C      VCONV(J)=0.
C  734 FLXCNV(J)=0.
```

**Logic**:
1. Find deepest convective layer (K)
2. Find shallowest convective layer (L) above K
3. Zero out all layers above L

**Effect**: Removes isolated convective "islands" in upper atmosphere

**Why commented?** Surface suppression (NCONV) handles this more robustly.

---

## 8. Migration Strategy

### 8.1 Julia Package Structure

**Recommended design**:
```julia
struct ConvectionParameters
    mixing_length::Float64           # α H_P (typically 1.0-2.0)
    overshooting_weight::Float64     # 0-1 (typically 0.5)
    n_surface_suppress::Int          # Layers to force F_conv=0 (typically 3-5)
    enable_convection::Bool          # IFCONV flag
    max_iterations::Int              # Opacity iteration limit (30)
    delta_tolerance::Float64         # ΔT convergence (0.5 K)
end

struct ConvectionState
    # Temperature gradient
    dlT_dlP::Vector{Float64}         # ∇ = d ln T / d ln P
    adiabatic_grad::Vector{Float64}  # ∇_ad

    # Thermodynamic quantities
    cp::Vector{Float64}              # Specific heat at constant P
    dlρ_dlT::Vector{Float64}         # d ln ρ / d ln T |_P
    sound_speed::Vector{Float64}     # c_s
    scale_height::Vector{Float64}    # H_P

    # Convective quantities
    convective_flux::Vector{Float64} # F_conv
    convective_velocity::Vector{Float64}  # v_conv
    temperature_fluctuation::Vector{Float64}  # ΔT_conv
end

function compute_convection!(
    atm::AtmosphereModel,
    params::ConvectionParameters
)::ConvectionState
    # ... (see Section 8.2)
end
```

---

### 8.2 Thermodynamic Derivatives: Two Approaches

**Approach A: Finite Differences (Match Fortran)**
```julia
function thermodynamic_derivatives_fd(
    atm::AtmosphereModel,
    δ::Float64 = 0.001  # ±0.1% perturbation
)
    nrhox = length(atm.temperature)

    # Save original state
    T_orig = copy(atm.temperature)
    P_orig = copy(atm.pressure)

    # Allocate for 4 perturbed states
    edens = zeros(nrhox, 4)
    rho = zeros(nrhox, 4)

    # Perturbation 1: T × (1 + δ)
    atm.temperature .= T_orig .* (1 + δ)
    compute_populations!(atm)  # Calls equivalent of POPS
    edens[:, 1] = atm.energy_density + radiation_energy_density(atm, 1+δ)
    rho[:, 1] = atm.density

    # Perturbation 2: T × (1 - δ)
    atm.temperature .= T_orig .* (1 - δ)
    compute_populations!(atm)
    edens[:, 2] = atm.energy_density + radiation_energy_density(atm, 1-δ)
    rho[:, 2] = atm.density

    # Perturbation 3: P × (1 + δ)
    atm.temperature .= T_orig
    atm.pressure .= P_orig .* (1 + δ)
    compute_populations!(atm)
    edens[:, 3] = atm.energy_density + radiation_energy_density(atm, 1.0)
    rho[:, 3] = atm.density

    # Perturbation 4: P × (1 - δ)
    atm.pressure .= P_orig .* (1 - δ)
    compute_populations!(atm)
    edens[:, 4] = atm.energy_density + radiation_energy_density(atm, 1.0)
    rho[:, 4] = atm.density

    # Restore original state
    atm.temperature .= T_orig
    atm.pressure .= P_orig
    compute_populations!(atm)

    # Compute derivatives (central differences)
    dE_dT = (edens[:, 1] .- edens[:, 2]) ./ T_orig ./ (2δ)
    dρ_dT = (rho[:, 1] .- rho[:, 2]) ./ T_orig ./ (2δ)
    dE_dP = (edens[:, 3] .- edens[:, 4]) ./ P_orig ./ (2δ)
    dρ_dP = (rho[:, 3] .- rho[:, 4]) ./ P_orig ./ (2δ)

    return (dE_dT=dE_dT, dρ_dT=dρ_dT, dE_dP=dE_dP, dρ_dP=dρ_dP)
end
```

**Cost**: 4 × POPS calls (expensive!)

---

**Approach B: Automatic Differentiation (Julia advantage)**
```julia
using ForwardDiff

function thermodynamic_derivatives_ad(atm::AtmosphereModel)
    nrhox = length(atm.temperature)

    # Allocate
    dE_dT = zeros(nrhox)
    dρ_dT = zeros(nrhox)
    dE_dP = zeros(nrhox)
    dρ_dP = zeros(nrhox)

    for j in 1:nrhox
        # ∂E/∂T, ∂ρ/∂T at constant P
        T_dual = ForwardDiff.Dual(atm.temperature[j], 1.0)
        atm_dual = perturb_temperature(atm, j, T_dual)
        edens_dual, rho_dual = compute_state(atm_dual)
        dE_dT[j] = ForwardDiff.partials(edens_dual, 1)
        dρ_dT[j] = ForwardDiff.partials(rho_dual, 1)

        # ∂E/∂P, ∂ρ/∂P at constant T
        P_dual = ForwardDiff.Dual(atm.pressure[j], 1.0)
        atm_dual = perturb_pressure(atm, j, P_dual)
        edens_dual, rho_dual = compute_state(atm_dual)
        dE_dP[j] = ForwardDiff.partials(edens_dual, 1)
        dρ_dP[j] = ForwardDiff.partials(rho_dual, 1)
    end

    return (dE_dT=dE_dT, dρ_dT=dρ_dT, dE_dP=dE_dP, dρ_dP=dρ_dP)
end
```

**Advantages**:
- Exact derivatives (no truncation error)
- Potentially faster (compiler optimizations)
- No manual state management

**Challenges**:
- Requires all code to support dual numbers
- POPS must be differentiable (complex with iterative solver)

**Recommendation**:
1. **Phase 1**: Use finite differences (match Fortran)
2. **Phase 2**: Implement AD version, validate against FD
3. **Phase 3**: Performance comparison, choose best

---

### 8.3 Convective Flux Calculation

**Julia implementation**:
```julia
function compute_convective_flux!(
    state::ConvectionState,
    atm::AtmosphereModel,
    params::ConvectionParameters
)
    for j in 1:atm.nrhox
        # Skip surface layers
        if j < 4
            state.convective_flux[j] = 0.0
            state.convective_velocity[j] = 0.0
            state.temperature_fluctuation[j] = 0.0
            continue
        end

        # Convection criterion
        del = state.dlT_dlP[j] - state.adiabatic_grad[j]
        if del < 0.0
            state.convective_flux[j] = 0.0
            state.convective_velocity[j] = 0.0
            state.temperature_fluctuation[j] = 0.0
            continue
        end

        # Convective velocity (buoyancy-driven)
        vco = 0.5 * params.mixing_length * state.scale_height[j] *
              sqrt(max(-0.5 * atm.pressure[j] / atm.density[j] *
                       state.dlρ_dlT[j], 0.0))

        if vco == 0.0
            state.convective_flux[j] = 0.0
            state.convective_velocity[j] = 0.0
            state.temperature_fluctuation[j] = 0.0
            continue
        end

        # Preliminary flux
        fluxco = 0.5 * atm.density[j] * state.cp[j] * atm.temperature[j] *
                 params.mixing_length * state.scale_height[j] / (4π)

        # Iterative opacity correction
        rosseland_T = rosseland_opacity(atm.temperature[j], atm.pressure[j], atm)
        delta_T_old = 0.0

        for iter in 1:params.max_iterations
            # Opacity at T±ΔT
            ross_plus = rosseland_opacity(atm.temperature[j] + delta_T_old,
                                         atm.pressure[j], atm) / rosseland_T
            ross_minus = rosseland_opacity(atm.temperature[j] - delta_T_old,
                                          atm.pressure[j], atm) / rosseland_T

            # Harmonic mean
            opacity_conv = 2.0 / (1.0/ross_plus + 1.0/ross_minus) * atm.opacity[j]

            # D parameter (radiative/convective efficiency)
            D = 8.0 * 5.6697e-5 * atm.temperature[j]^4 /
                (opacity_conv * state.scale_height[j] * atm.density[j]) /
                (fluxco * 4π) / vco

            # Mihalas optically-thin correction
            tau_bubble = opacity_conv * atm.density[j] * params.mixing_length *
                        state.scale_height[j]
            D = D * tau_bubble^2 / (2.0 + tau_bubble^2)
            D = D^2 / 2.0

            # DELTA parameter
            ddd = (del / (D + del))^2
            if ddd >= 0.5
                delta = (1.0 - sqrt(1.0 - ddd)) / ddd
            else
                # Series expansion
                delta = 0.5
                term = 0.5
                up = -1.0
                down = 2.0
                while true
                    up += 2.0
                    down += 2.0
                    term = up / down * ddd * term
                    delta += term
                    term < 1e-6 && break
                end
            end
            delta = delta * del^2 / (D + del)

            # Convective quantities
            state.convective_velocity[j] = vco * sqrt(delta)
            state.convective_flux[j] = fluxco * state.convective_velocity[j] * delta
            state.convective_flux[j] = max(state.convective_flux[j], 0.0)

            # Temperature fluctuation
            delta_T = atm.temperature[j] * params.mixing_length * delta
            delta_T = min(delta_T, atm.temperature[j] * 0.15)  # Limit to 15%
            delta_T = 0.7 * delta_T + 0.3 * delta_T_old  # SOR damping

            # Convergence check
            if abs(delta_T - delta_T_old) < params.delta_tolerance
                state.temperature_fluctuation[j] = delta_T
                break
            end

            delta_T_old = delta_T
        end
    end

    return state
end
```

---

### 8.4 Convective Overshooting

**Julia implementation**:
```julia
function apply_overshooting!(
    state::ConvectionState,
    atm::AtmosphereModel,
    params::ConvectionParameters
)
    if params.overshooting_weight == 0.0
        return state
    end

    # Find maximum convective weight
    wtcnv = maximum(state.convective_flux ./ atm.total_flux)
    wtcnv = min(wtcnv, 1.0) * params.overshooting_weight

    # Compute overshooting distances
    delhgt = similar(atm.height)
    for j in 1:atm.nrhox
        delhgt[j] = min(
            state.scale_height[j] * 0.5 * wtcnv,  # NOTE: Check if 0.5D-5 is typo!
            atm.height[end] - atm.height[j],
            atm.height[j] - atm.height[1]
        )
    end

    # Integrate convective flux vs height
    cnvint = cumtrapz(atm.height, state.convective_flux)

    # Compute overshooting flux
    flux_overshoot = zero(state.convective_flux)
    for j in atm.nrhox÷2:atm.nrhox-1
        delhgt[j] == 0.0 && continue

        # Average flux over ±delhgt
        cnv1 = interpolate(atm.height, cnvint, atm.height[j] - delhgt[j])
        cnv2 = interpolate(atm.height, cnvint, atm.height[j] + delhgt[j])
        flux_overshoot[j] = (cnv2 - cnv1) / (2 * delhgt[j])
    end

    # Take maximum
    state.convective_flux .= max.(state.convective_flux, flux_overshoot)

    return state
end
```

---

### 8.5 Validation Strategy

**Phase 1**: Bit-for-bit reproduction (finite differences)
```julia
# Use Fortran parameters
params = ConvectionParameters(
    mixing_length = 1.25,        # Match Fortran MIXLTH
    overshooting_weight = 0.5,   # Match Fortran OVERWT
    n_surface_suppress = 3,      # Match Fortran NCONV
    enable_convection = true,    # IFCONV=1
    max_iterations = 30,
    delta_tolerance = 0.5
)

# Run CONVEC
state = compute_convection!(atm_julia, params)

# Load Fortran output
fortran_output = read_fortran_convec_output("convec_output.dat")

# Compare
@testset "CONVEC validation" begin
    @test state.dlT_dlP ≈ fortran_output.DLTDLP rtol=1e-8
    @test state.adiabatic_grad ≈ fortran_output.GRDADB rtol=1e-8
    @test state.cp ≈ fortran_output.HEATCP rtol=1e-8
    @test state.convective_flux ≈ fortran_output.FLXCNV rtol=1e-6
    @test state.convective_velocity ≈ fortran_output.VCONV rtol=1e-6
end
```

**Phase 2**: Automatic differentiation comparison
```julia
# Compare FD vs AD derivatives
deriv_fd = thermodynamic_derivatives_fd(atm)
deriv_ad = thermodynamic_derivatives_ad(atm)

@testset "AD vs FD derivatives" begin
    @test deriv_ad.dE_dT ≈ deriv_fd.dE_dT rtol=1e-4  # AD should be more accurate
    @test deriv_ad.dρ_dT ≈ deriv_fd.dρ_dT rtol=1e-4
end
```

---

## 9. Testing Strategy

### 9.1 Unit Tests

**Test 1**: Thermodynamic derivatives
```julia
@testset "Thermodynamic derivatives" begin
    # Simple test: Ideal gas
    atm = create_ideal_gas_atmosphere(T=6000.0, P=1e5, γ=5/3)
    deriv = thermodynamic_derivatives_fd(atm)

    # For ideal gas: c_P = γ/(γ-1) × P/ρ/T
    cp_analytic = 5/2 * atm.pressure ./ atm.density ./ atm.temperature
    cp_numeric = deriv.dE_dT - deriv.dE_dP .* deriv.dρ_dT ./ deriv.dρ_dP

    @test cp_numeric ≈ cp_analytic rtol=0.01  # 1% accuracy
end
```

**Test 2**: Convection criterion
```julia
@testset "Convection criterion" begin
    # Unstable: ∇ > ∇_ad
    state = ConvectionState(
        dlT_dlP = [0.5],
        adiabatic_grad = [0.4],
        # ... other fields
    )

    flux = compute_convective_flux_single_layer(state, 1, params)
    @test flux > 0.0  # Should have convection

    # Stable: ∇ < ∇_ad
    state.dlT_dlP[1] = 0.3
    flux = compute_convective_flux_single_layer(state, 1, params)
    @test flux == 0.0  # Should have no convection
end
```

**Test 3**: Iteration convergence
```julia
@testset "Opacity iteration convergence" begin
    # Track DELTAT convergence
    history = Float64[]

    # Modified compute_convective_flux! to record history
    state = compute_convective_flux!(atm, params, history=history)

    # Should converge monotonically (with SOR damping)
    diffs = diff(history)
    @test all(abs.(diffs) .< abs.(history[1:end-1]))  # Decreasing
    @test history[end] < 0.5  # Below tolerance
end
```

---

### 9.2 Integration Tests

**Test 1**: Solar convection zone
```julia
@testset "Solar convection zone" begin
    # Solar model (T_eff = 5777 K, log g = 4.44)
    atm = read_atlas_model("solar_model.mod")
    params = ConvectionParameters(mixing_length=1.25)

    state = compute_convection!(atm, params)

    # Solar convection zone: τ ≈ 1 to τ ≈ 100
    conv_region = findall(state.convective_flux .> 0.0)

    @test minimum(atm.tau_ross[conv_region]) ≈ 1.0 rtol=0.5
    @test maximum(atm.tau_ross[conv_region]) > 10.0

    # Peak convective velocity ~1-2 km/s
    @test maximum(state.convective_velocity) / 1e5 > 0.5  # > 0.5 km/s
    @test maximum(state.convective_velocity) / 1e5 < 5.0  # < 5 km/s
end
```

**Test 2**: Hot star (no convection)
```julia
@testset "Hot star (no convection)" begin
    # T_eff = 20000 K → radiative atmosphere
    atm = read_atlas_model("hot_star_teff20000.mod")

    state = compute_convection!(atm, params)

    # Should have no convection anywhere
    @test all(state.convective_flux .== 0.0)
    @test all(state.convective_velocity .== 0.0)
end
```

**Test 3**: Cool star (strong convection)
```julia
@testset "Cool star (strong convection)" begin
    # T_eff = 3500 K → deep convection zone
    atm = read_atlas_model("cool_star_teff3500.mod")

    state = compute_convection!(atm, params)

    # Convection dominates energy transport
    conv_fraction = state.convective_flux ./ (state.convective_flux .+ atm.radiative_flux)

    @test maximum(conv_fraction) > 0.5  # > 50% convective in some layers
end
```

---

### 9.3 Physics Validation Tests

**Test 1**: Energy conservation
```julia
@testset "Energy conservation" begin
    state = compute_convection!(atm, params)

    # Total flux should be constant with depth
    total_flux = atm.radiative_flux .+ state.convective_flux

    @test std(total_flux) / mean(total_flux) < 0.05  # < 5% variation
end
```

**Test 2**: Adiabatic gradient
```julia
@testset "Adiabatic gradient" begin
    state = compute_convection!(atm, params)

    # In deep convection zone, ∇ → ∇_ad
    deep_conv = findall((state.convective_flux ./ atm.total_flux) .> 0.9)

    if !isempty(deep_conv)
        @test all(abs.(state.dlT_dlP[deep_conv] .- state.adiabatic_grad[deep_conv])
                  .< 0.01)  # Within 1% of ∇_ad
    end
end
```

---

## 10. Open Questions

### 10.1 For Domain Expert (Paula)

**Q1**: Is the overshooting distance factor (0.5D-5 in line 5066) a typo?
```fortran
DELHGT(J)=MIN(HSCALE(J)*.5D-5*WTCNV,...)
```
- **Expected**: `*.5*WTCNV` (half pressure scale height)
- **Actual**: `*.5D-5*WTCNV` (factor of 10^-5 smaller)
- **Impact**: If typo, overshooting is currently negligible
- **Test**: Compare Fortran FLXCNV0 vs FLXCNV1 (should differ if overshooting active)

**Q2**: What is typical value of OVERWT?
- **Code default**: Not set in CONVEC (from input file)
- **Recommendation**: 0-0.5 range?
- **Impact**: Controls convective mixing extent

**Q3**: Why 30 iterations for opacity convergence?
- **Observation**: Most models converge in 5-10 iterations
- **Cost**: ROSSTAB calls are expensive (opacity table lookups)
- **Question**: Can we reduce to 15 without loss of accuracy?

**Q4**: What is NCONV (surface suppression) typically set to?
- **Code**: User input
- **Recommendation**: 3-5 layers?
- **Impact**: Prevents spurious surface convection

---

### 10.2 For Code Validation

**Q5**: How accurate are finite-difference derivatives?
- **Perturbation**: ±0.1% (δ = 0.001)
- **Truncation error**: O(δ^2) ≈ 10^-6
- **Roundoff error**: ~10^-15 / δ ≈ 10^-12
- **Question**: Is this adequate? Or should we use Richardson extrapolation?

**Q6**: Does POPS preserve differentiability?
- **Issue**: POPS has iterative solver (electron density) with damping
- **Concern**: Discontinuous derivatives if iteration count varies
- **Test**: Perturb T by ±0.01%, check if POPS converges to same iteration count

**Q7**: How often does opacity iteration fail to converge (30 iterations)?
- **Data needed**: Run statistics from community models
- **Action**: Add convergence diagnostics in Julia version

---

### 10.3 For Migration Decisions

**Q8**: Should we implement AD for thermodynamic derivatives?
- **Pros**: Exact derivatives, potentially faster
- **Cons**: Requires differentiable POPS (complex)
- **Recommendation**: Start with FD, migrate to AD in Phase 2

**Q9**: Can we vectorize the opacity iteration?
- **Current**: Loop over layers (J), 30 iterations per layer
- **Alternative**: Vectorize over all layers simultaneously
- **Benefit**: SIMD, GPU acceleration potential
- **Challenge**: Variable iteration counts per layer

**Q10**: Should we expose more tuning parameters?
- **Current Fortran**: MIXLTH, OVERWT, NCONV (user inputs)
- **Potential**: δ (FD step), max_iterations, delta_tolerance, SOR weight (0.7)
- **Tradeoff**: Flexibility vs simplicity

---

## 11. Summary of Migration Risks

| Risk | Severity | Likelihood | Mitigation |
|------|----------|------------|------------|
| Finite-difference derivatives differ from Fortran | High | Medium | Careful implementation, bit-for-bit validation |
| POPS non-differentiability breaks AD approach | Medium | Medium | Validate FD approach first, AD as Phase 2 |
| Opacity iteration doesn't converge | Medium | Low | Preserve 30-iteration limit, add diagnostics |
| Overshooting distance factor is typo | Medium | High | Check with Paula, validate against Fortran output |
| Radiation energy density correction wrong | High | Low | Validate EDENS1-4 against Fortran intermediate values |
| Performance degradation (4× POPS calls) | Low | Low | Profile, optimize POPS if needed |

---

## 12. Key Takeaways for Migration

1. **CONVEC is expensive**: 4 POPS calls for derivatives + 30 iterations × ROSSTAB calls
2. **Numerical derivatives are fragile**: ±0.1% perturbations, must preserve exact Fortran logic
3. **Iterative opacity convergence is critical**: Can't use single-pass opacity in convective zones
4. **Overshooting may be broken**: Factor of 10^-5 suspicious, needs verification
5. **Physics validation is key**: Energy conservation, ∇→∇_ad tests required
6. **AD is future work**: Start with FD for validation, migrate to AD after proving correctness
7. **Fortran's empirical tuning matters**: 30 iterations, 0.7 SOR weight, 0.5 K tolerance - preserve these
8. **Julia opportunity**: Vectorization, GPU acceleration, better diagnostics - but validate first

---

## Cross-References

**Related Deep Dives**:
- **Deep Dive 02 (Populations)**: CONVEC calls POPS 4× for thermodynamic derivative calculations (±0.1% T and P perturbations)
- **Deep Dive 06 (TCORR)**: CONVEC output (FLXCNV, DLTDLP, GRDADB) feeds into TCORR MODE=3 for convection coupling

**Referenced in**:
- `docs/archaeology/ARCHITECTURE_INSIGHTS.md` Sections 3.3, 5.1, 6.6 (convection in data flow, decisions, risks)
- `docs/archaeology/DEEP_DIVES/00_INDEX.md` (Physics methods, performance-critical)

**Key physics**: Mixing length theory (MLT) connects convective energy transport to temperature structure, critical for T_eff < 8000 K stars.

---

**Status**: Deep Dive complete. Ready for code implementation.

**Next steps**:
1. Verify overshooting distance factor (0.5D-5) with Paula
2. Implement thermodynamic_derivatives_fd() function
3. Implement compute_convective_flux!() with opacity iteration
4. Create validation test suite (compare against Fortran CONVEC output)
5. Profile performance (identify if 4× POPS is bottleneck)

**Time to implement**: Estimated 15-20 hours (complex physics, extensive validation needed)

**Priority**: Medium-High (essential for cool stars T_eff < 8000 K, tightly coupled to TCORR)
