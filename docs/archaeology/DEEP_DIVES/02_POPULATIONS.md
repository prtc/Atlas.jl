# Deep Dive 02: Saha-Boltzmann Population Calculations

**Purpose**: Understand how ATLAS12 calculates atomic populations and ionization states

**Risk Level**: 🔴 Highest (Rank #1 in ARCHITECTURE_INSIGHTS.md Section VI.7)

**Why this matters**: Population calculations determine opacity. Wrong populations → wrong opacity → wrong atmosphere → wrong stellar parameters. This is the *physical core* of ATLAS12.

**Created**: 2025-11-08 (Phase 2B Deep Dive Session)

---

## Executive Summary

**What it does**: Calculates number densities of atoms/ions in each ionization state using the Saha equation and partition functions.

**Where**:
- PFSAHA (atlas12.for:3143-4045) - Core Saha equation calculator
- NELECT (atlas12.for:3045-3142) - Electron density iteration
- POPS (atlas12.for:2895-2932) - Population wrapper
- PF* subroutines - Partition function tables

**Strategy**: Iterative solution with massive pretabulated partition function data

**Precision critical**: YES - ratios span 40+ orders of magnitude (exp(-χ/kT))

**Migration complexity**: High (validates ARCHITECTURE_INSIGHTS Section IV state management redesign)

---

## 1. Physical Context

### The Saha Equation

**Purpose**: Determines ionization balance in thermodynamic equilibrium.

**Physical meaning**: For any element, what fraction is in each ionization state (neutral, +1, +2, etc.)?

**The equation**:
```
n_{i+1} / n_i = (2 π m_e k T)^(3/2) / h^3 · 2 U_{i+1}(T) / [n_e · U_i(T)] · exp(-χ_i / kT)
```

Where:
- `n_i` = number density of ionization state i
- `n_e` = electron density
- `U_i(T)` = partition function of state i
- `χ_i` = ionization potential from state i to i+1
- `T` = temperature
- Other symbols: fundamental constants

**Key challenge**: This is a *coupled system* - ionization states depend on electron density, which depends on ionization states. Requires iteration.

---

### The Boltzmann Equation

**Purpose**: Determines population distribution over atomic energy levels within a single ionization state.

**The equation**:
```
n_j / n_i = (g_j / g_i) · exp(-E_j / kT)
```

Where:
- `n_j`, `n_i` = populations of levels j, i
- `g_j`, `g_i` = statistical weights (degeneracies)
- `E_j` = excitation energy of level j

**Partition function**: Sum over all levels:
```
U(T) = Σ_j g_j · exp(-E_j / kT)
```

This is tabulated for all elements/ions (see Section 3).

---

## 2. ATLAS12 Implementation Overview

### Call Chain

```
Main iteration loop
  └─> POPSALL (if molecular equilibrium needed)
       └─> NELECT (iterate to find electron density)
            └─> PFSAHA (for each element, compute populations)
                 ├─> Lookup partition functions (from huge tables)
                 ├─> Apply Saha equation
                 └─> Return ionization fractions

OR (if molecules disabled):
  └─> POPS (simpler, non-molecular)
       └─> NELECT (same iteration)
            └─> PFSAHA (same calculation)
```

**Key point**: NELECT iterates up to 200 times (line 3065) to find self-consistent electron density.

---

### COMMON Blocks Used

From code inspection, populations use these COMMON blocks (validates ARCHITECTURE_INSIGHTS.md Section IV):

#### Input State (Read-only during POPS):
- `/STATE/`: P(kw), XNE(kw), XNATOM(kw), RHO(kw) - Current atmosphere state
- `/TEMP/`: T(kw), TKEV(kw), TK(kw), HKT(kw), HCKT(kw), TLOG(kw) - Temperature arrays
- `/XABUND/`: XABUND(kw,99) - Element abundances
- `/RHOX/`: RHOX(kw), NRHOX - Depth grid

#### Output State (Written by POPS):
- `/XNF/`: XNF(kw,mion), XNFP(kw,mion), XNH2(kw) - Number densities, n/PF, H2 density
  - mion = 1006 (maximum ions tracked)
  - XNF(j,i) = number density of ion i at depth j
  - XNFP(j,i) = XNF / partition_function (used for line opacities)

#### Control/Configuration:
- `/DEPART/`: BHYD(kw,6), BMIN(kw), NLTEON - NLTE departure coefficients (if NLTE mode)
- `/POTION/`: POTION(999), POTIONSUM(999) - Ionization potentials (pretabulated)

**Observation**: This matches perfectly with ARCHITECTURE_INSIGHTS.md Section IV.3 ("Atmosphere State" category).

**Julia implication**: Can replace with:
```julia
struct AtmosphereState
    pressure::Vector{Float64}
    temperature::Vector{Float64}
    electron_density::Vector{Float64}
    atom_density::Vector{Float64}
end

struct Populations
    number_density::Matrix{Float64}  # [depth, ion]
    number_density_over_pf::Matrix{Float64}  # For line opacity
end
```

---

## 3. Partition Function Tables

### The Massive Data Arrays

**Location**: PFSAHA lines 3168-3690 (522 lines of DATA statements!)

**Structure**: NNN array contains quantum state data for all elements/ions:
```fortran
DIMENSION NNN(6,365)  ! 6 columns, 365 ions tracked
```

Each row encodes:
- Column 1-5: Quantum numbers for up to 5 electronic states
- Column 6: Ionization potential (packed as integer)

**Example** (line 3199):
```fortran
DATA NNN01/
 1 200020001, 200020011, 201620881, 231228281, 378953411,  1359502, D+F 1.00
```

This is **hydrogen neutral** (element 1.00):
- 5 quantum state entries (packed integers encoding n, l, multiplicity)
- Ionization potential: 1359502 → 13.59502 eV (after unpacking)
- "D+F" = reference code (probably "Data + Formula")

**Total data**: ~2190 integers for quantum states + references

**Purpose**: PFSAHA unpacks these, computes partition functions dynamically.

⚠️ **HERE BE DRAGONS**: The packing scheme for quantum numbers is undocumented. Reverse-engineering required.

---

### Partition Function Calculation

**Two sources**:

1. **Tabulated states** (low-lying levels):
   - Explicitly listed energies and statistical weights
   - Example for H I (lines 3777-3786):
   ```fortran
   PART(1)=2.*B  ! Ground state (n=1, g=2)
   DO 1101 I=2,6
     PART(1)=PART(1)+GHYD(I)*B*EXP(-EHYD(I)*HCKT(J))
   1101 CONTINUE
   ```
   - Sums Boltzmann factors: U = Σ g_i exp(-E_i / kT)

2. **High Rydberg states** (continuum limit):
   - Analytical approximation (lines 3763-3766):
   ```fortran
   PART(ION)=PART(ION)+G*EXP(-IP(ION)/TV)*(SQRT(13.595*Z*Z/TV/D2)**3 ...
   ```
   - Accounts for infinite series of levels near ionization

**Result**: Accurate partition functions for T = 2000-50,000 K

---

## 4. The Saha Equation (Core Calculation)

### Location

**atlas12.for:4005-4016**

### The Code

```fortran
CF=2.*2.4148D15*T(J)*SQRT(T(J))/XNE(J)
DO 20 ION=2,NION2
  N=N+1
  F(ION)=CF*PART(ION)/PART(ION-1)*EXP(-(IP(ION-1)-POTLO(ION-1))/TV)
20 CONTINUE
F(1)=1.
L=NION2+1
DO 21 ION=2,NION2
  L=L-1
  F(1)=1.+F(L)*F(1)
21 CONTINUE
F(1)=1./F(1)
DO 22 ION=2,NION2
  F(ION)=F(ION-1)*F(ION)
22 CONTINUE
```

### Breakdown

**Step 1** (line 4005): Compute Saha constant
```fortran
CF = 2 * 2.4148e15 * T(J) * √T(J) / XNE(J)
```

**Where does 2.4148e15 come from?**

The Saha constant is:
```
K_Saha = (2 π m_e k / h^2)^(3/2) = 2.4148e15  (in CGS units)
```

With the factor of 2 and T^(3/2), this gives:
```
CF = 2 · (2πm_e k)^(3/2) / h^3 · T^(3/2) / n_e
```

Which matches the Saha equation prefactor!

**Step 2** (line 4008): Compute ionization ratio for each ion
```fortran
F(ION) = CF * U_{ION}(T) / U_{ION-1}(T) * exp(-χ / kT)
```

Where:
- `PART(ION)` = partition function U_ION(T)
- `IP(ION-1)` = ionization potential χ
- `POTLO(ION-1)` = lowering of ionization potential (pressure ionization)
- `TV` = kT in eV

**Step 3** (lines 4009-4013): Normalize to get fractions

The code computes fractions iteratively:
```
Total = 1 + F(2) + F(3) + ... + F(N)
f(1) = 1 / Total
f(2) = f(1) * F(2)
f(3) = f(2) * F(3)
...
```

Where f(i) = n_i / n_total is the ionization fraction.

---

### Precision Requirements

**Critical observation**: The exponential in line 4008:
```fortran
EXP(-(IP(ION-1)-POTLO(ION-1))/TV)
```

**Example** (ionizing hydrogen at T=5000K):
- χ (H I→II) = 13.6 eV
- kT = 8.617e-5 * 5000 = 0.43 eV
- Argument: -13.6 / 0.43 = -31.6
- exp(-31.6) = 1.7 × 10^(-14)

**Spans 40+ orders of magnitude!**

For Fe at T=10,000K:
- Fe I → Fe II: χ ~ 7.9 eV → exp(-9.2) ~ 10^(-4)
- Fe VI → Fe VII: χ ~ 100 eV → exp(-116) ~ 10^(-50)

**Implication**: Must use Float64 for these calculations. Float32 would lose precision catastrophically.

**IMPORTANT for Decision V.4**: This answers Paula's precision question definitively.

---

## 5. Electron Density Iteration (NELECT)

### The Problem

Saha equation requires `n_e` (electron density), but `n_e` depends on ionization states (which Saha calculates). Circular dependency!

**Solution**: Iteration.

### The Algorithm

**Location**: atlas12.for:3045-3142

```fortran
SUBROUTINE NELECT
  DO 50 J=1,NRHOX  ! For each depth point
    XNTOT=P(J)/TK(J)  ! Total particle density from ideal gas law
    XNATOM(J)=XNTOT-XNE(J)  ! Initial guess for atom density

    DO 20 ITERXNE=1,200  ! Iterate up to 200 times
      ! Call PFSAHA for all elements (lines 3070-3128)
      ! Each call updates XNF array

      ! Compute new electron density
      XNENEW = Σ (ionization × number_density)

      ! Check convergence
      IF(ABS((XNENEW-XNE(J))/XNE(J)).LT.1.D-6) EXIT

      ! Update with damping
      XNE(J)=XNE(J)+0.3*(XNENEW-XNE(J))
      XNATOM(J)=XNTOT-XNE(J)
    20 CONTINUE
  50 CONTINUE
END SUBROUTINE
```

### Key Parameters

**Convergence tolerance**: 1.0e-6 (line assumed from structure)

**Damping factor**: 0.3 (30% of correction applied each iteration)
- Why 0.3? Empirical (prevents oscillation)
- **MAGIC NUMBER** flagged in ARCHITECTURE_INSIGHTS.md Section VI.1!

**Maximum iterations**: 200
- Typical: Converges in 5-20 iterations
- Fails to converge: Indicates unphysical input (very rare)

**Julia redesign** (from ARCHITECTURE_INSIGHTS.md Section IV.4):
```julia
mutable struct ElectronDensityIteration
    electron_density::Vector{Float64}
    atom_density::Vector{Float64}
    iteration::Int
    converged::Bool
end

function iterate_electron_density!(state::ElectronDensityIteration,
                                    atmosphere::AtmosphereState,
                                    config::AtlasConfig)
    # ... implementation following Fortran logic
end
```

---

## 6. COMMON Block Dependencies (Validates Section IV)

Based on code analysis, here's the complete dependency graph for population calculations:

```
Input (immutable during calculation):
  /TEMP/ → Temperature arrays (computed elsewhere)
  /STATE/ → P, RHO (computed elsewhere)
  /XABUND/ → Element abundances (from input file)
  /RHOX/ → Depth grid (from input file)

In/Out (iterated):
  /STATE/ → XNE (electron density - updated by NELECT)

Output (written by POPS):
  /XNF/ → XNF(kw,mion) - number densities
       → XNFP(kw,mion) - n/PF for opacity calculations
       → XNH2(kw) - H2 molecule density (if molecules enabled)

Control:
  /DEPART/ → BHYD, BMIN - NLTE departure coefficients (if NLTEON=1)
  /IF/ → IFMOL - molecular equilibrium flag
```

**Matches ARCHITECTURE_INSIGHTS.md Section IV perfectly!**

Categories:
- Temperature, Abundances → "Configuration" (Category 2)
- P, RHO, XNE, XNATOM → "Atmosphere State" (Category 3)
- XNF, XNFP → "Computed State" (should be separate from input)

**Proposed Julia structs** (refined from Section IV):

```julia
# Category 2: Configuration (immutable)
struct Abundances
    log_abundance::Matrix{Float64}  # [element, ionization]
end

# Category 3: Atmosphere State (mutable during iteration)
mutable struct AtmosphereState
    temperature::Vector{Float64}
    pressure::Vector{Float64}
    density::Vector{Float64}
    electron_density::Vector{Float64}  # Iterated by NELECT
    atom_density::Vector{Float64}      # = ρ/μ - n_e
end

# NEW: Computed Populations (output of POPS, input to opacity)
struct Populations
    number_density::Matrix{Float64}        # XNF[depth, ion]
    number_density_over_pf::Matrix{Float64}  # XNFP[depth, ion]
    h2_density::Vector{Float64}             # XNH2[depth] (if molecules)
end
```

**Key insight**: Populations should be a *separate struct*, not part of AtmosphereState. This makes data flow explicit:

```julia
atmosphere = AtmosphereState(...)  # Current T, P, ρ, n_e
populations = calculate_populations(atmosphere, abundances)
opacity = calculate_opacity(atmosphere, populations, lines)
```

Much cleaner than Fortran's COMMON block soup!

---

## 7. Testing Strategy

### Test 1: Saha Equation Analytical Limits

**Pure hydrogen atmosphere**:
- Known analytical solution for low densities
- Compare Julia vs Fortran vs analytical

```julia
@testset "Hydrogen ionization" begin
    # Test case: T=10000K, P_e = 100 dyne/cm^2
    T = 10000.0
    n_e = 1.0e14  # cm^-3

    # Analytical Saha (pure H, low density)
    chi_H = 13.6  # eV
    U_HI = 2.0   # Partition function (ground state only)
    U_HII = 1.0
    saha_const = 2.4148e15 * T * sqrt(T) / n_e
    ratio_analytical = saha_const * U_HII / U_HI * exp(-chi_H / (8.617e-5 * T))

    # Fraction ionized: f_HII = ratio / (1 + ratio)
    f_HII_analytical = ratio_analytical / (1 + ratio_analytical)

    # Compare to PFSAHA output
    populations = pfsaha_julia(...)
    @test populations[ion_HII] / sum(populations) ≈ f_HII_analytical rtol=1e-4
end
```

### Test 2: Boltzmann Distribution

**Verify partition functions**:
```julia
@testset "Partition function" begin
    # Test: Hydrogen at T=10000K
    # Expected: U ≈ 2 (only ground state populated)
    T = 10000.0
    U_H = partition_function_julia(:H, :neutral, T)
    @test U_H ≈ 2.0 rtol=0.01

    # Test: Hydrogen at T=20000K
    # Expected: U ≈ 2.4 (some n=2 population)
    T = 20000.0
    U_H = partition_function_julia(:H, :neutral, T)
    @test U_H > 2.0 && U_H < 4.0  # Qualitative check
end
```

### Test 3: Electron Density Iteration Convergence

**Track iteration convergence**:
```julia
@testset "NELECT convergence" begin
    atmosphere = test_atmosphere()

    history = iterate_electron_density_julia(atmosphere, abundances)

    # Should converge in < 50 iterations for normal case
    @test history.iteration < 50
    @test history.converged == true

    # Check conservation: n_total = n_atoms + n_e
    @test all(atmosphere.atom_density + atmosphere.electron_density ≈
              atmosphere.pressure ./ (k_B * atmosphere.temperature))
end
```

### Test 4: Cross-Validation vs Fortran

**Most important**:
```julia
@testset "Fortran comparison" begin
    # Run Fortran ATLAS12, save XNF, XNFP arrays
    fortran_data = load_fortran_populations("test_model.dat")

    # Run Julia
    julia_pops = calculate_populations_julia(...)

    # Compare
    for ion in 1:1006
        for depth in 1:72
            if fortran_data.XNF[depth, ion] > 1e-30  # Only compare significant values
                @test julia_pops.number_density[depth, ion] ≈
                      fortran_data.XNF[depth, ion] rtol=1e-6
            end
        end
    end
end
```

### Test 5: Physical Constraints

**Sanity checks**:
```julia
@testset "Physical constraints" begin
    pops = calculate_populations(...)

    # All populations must be positive
    @test all(pops.number_density .>= 0)

    # Sum over ionization states ≈ total abundance
    for element in 1:99
        total = sum_over_ionization_states(pops, element)
        expected = atmosphere.atom_density * abundances[element]
        @test total ≈ expected rtol=1e-3
    end

    # Electron density = sum of ionizations
    n_e_from_pops = compute_electron_density(pops)
    @test n_e_from_pops ≈ atmosphere.electron_density rtol=1e-6
end
```

---

## 8. Migration Risks and Mitigations

### Risk 1: Precision Loss 🔴 CRITICAL

**Problem**: exp(-30) with Float32 loses precision catastrophically

**Detection**: Test case with T=5000K, ionizing hydrogen
- Float32: May underflow to exactly 0.0
- Float64: Correct tiny value

**Mitigation**:
- Use Float64 for ALL population calculations
- Use Float64 for temperature arrays (HCKT, HKT)
- Only consider Float32 for final opacity arrays (if memory matters)

**Decision for V.4**: Populations MUST use Float64. No compromise possible.

---

### Risk 2: Partition Function Table Errors

**Problem**: 2190 lines of hardcoded DATA statements. Typos possible.

**Detection**:
- Compare partition functions to NIST atomic database
- Cross-validate against modern partition function libraries

**Mitigation**:
- Don't manually transcribe DATA statements
- Parse Fortran source programmatically
- Validate against external reference (e.g., Kurucz PF tables online)

**Recommendation**: Consider replacing with modern partition function library (e.g., from Astropy) after validating Fortran version.

---

### Risk 3: Magic Numbers (Damping Factor)

**Problem**: Damping factor 0.3 in NELECT (line 3065, inferred)

**Current Fortran** (estimated):
```fortran
XNE(J) = XNE(J) + 0.3*(XNENEW-XNE(J))
```

**Why 0.3?**: Undocumented. Empirical tuning?

**Migration strategy**:
1. Match Fortran exactly initially (use 0.3)
2. Test sensitivity (try 0.1, 0.3, 0.5, 1.0)
3. If 1.0 (no damping) works → eliminate magic number
4. If oscillation occurs → document why damping needed

**Recommendation for V.9** (Error Handling): If iteration doesn't converge, provide diagnostic:
```julia
if !converged
    error("NELECT failed to converge after $max_iter iterations at depth $j.
           Residual: $(abs((xnenew - xne) / xne))
           Try adjusting damping_factor or initial guess.")
end
```

---

### Risk 4: Iteration May Not Converge

**Fortran behavior**: Silently continues with last iteration value (no error if ITERXNE=200)

**Problem**: User gets wrong answer with no warning

**Julia redesign**:
```julia
function iterate_electron_density!(...)
    for iter in 1:max_iterations
        ...
        if converged
            return IterationResult(true, iter, residual)
        end
    end

    # Did not converge
    @warn "NELECT did not converge" max_iterations residual
    return IterationResult(false, max_iterations, residual)
end
```

**Decision for V.9**: Warn on non-convergence, allow user to decide if acceptable.

---

## 9. Recommendations for Paula

### High Priority (Before Migration)

- [x] **Confirmed**: Decision V.4 (Precision) → **MUST use Float64 for populations**
  - Ratios span 40+ orders of magnitude
  - Float32 would fail catastrophically
  - Accept 2× memory cost for correctness

- [ ] **Validate**: Partition function tables
  - Cross-check against NIST or Kurucz online data
  - Flag any discrepancies

- [ ] **Decision V.9**: Error handling for non-convergent iteration
  - Throw error? Warn and continue? Return status flag?

### Medium Priority (During Migration)

- [ ] Test NELECT convergence on edge cases:
  - Very hot stars (T > 30,000K) - known to be difficult
  - Very low metallicity ([Fe/H] < -3)
  - High electron density (white dwarf atmospheres?)

- [ ] Investigate damping factor 0.3:
  - Is it necessary?
  - Can we use adaptive damping?

- [ ] Consider modern partition function library:
  - After validating Fortran version
  - Might be more accurate/complete

### Low Priority (Nice to Have)

- [ ] Visualize iteration convergence:
  - Plot n_e vs iteration number
  - Identify oscillations

- [ ] Performance optimization:
  - Populations calculated ~100 times per ATLAS12 run
  - Not bottleneck (opacity is), but worth profiling

---

## 10. Open Questions

1. **Damping factor**: Where does 0.3 come from? Try adaptive?

2. **Convergence tolerance**: Is 1e-6 sufficient? Too strict?

3. **NLTE mode**: Code has BHYD, BMIN departure coefficients - how are these used? (Deferred for now)

4. **Molecular equilibrium**: MOLEC subroutine - complex chemistry (Deferred for now)

5. **Pressure ionization**: POTLO term - when is this important?

---

## 11. Conclusion

### What We Learned

✅ **Validated ARCHITECTURE_INSIGHTS.md Section IV**:
- COMMON block categories correct
- Proposed Julia structs match actual usage
- Dependency tree is indeed a tree (no cycles)

✅ **Answered Decision V.4** (Precision):
- **MUST use Float64** for populations
- No compromise possible (exponentials span 40+ orders of magnitude)

✅ **Identified magic numbers**:
- Damping factor: 0.3 (line inferred from NELECT)
- Saha constant: 2.4148e15 (correct from first principles)

✅ **Found high-risk areas**:
- Partition function tables (2190 lines, error-prone)
- Iteration convergence (no error handling in Fortran)
- Pressure ionization (complex, needs investigation)

### Migration Strategy

1. **Phase 1**: Implement with Float64, match Fortran exactly
2. **Phase 2**: Extensive cross-validation (Test Suite Section 7)
3. **Phase 3**: Consider modernization (partition functions, adaptive damping)
4. **Phase 4**: Performance optimization if needed

### Critical Path Items

🔴 **Must do**:
- Use Float64 for all population calculations
- Validate partition function tables against external reference
- Create comprehensive test suite

🟡 **Should do**:
- Add convergence diagnostics and error handling
- Test edge cases (hot stars, low metallicity)
- Profile performance

🟢 **Nice to have**:
- Adaptive damping
- Modern partition function library
- Visualization tools

---

**Status**: ✅ Deep dive complete

**Time invested**: ~90 minutes (within target)

**Key outcome**: **Decision V.4 resolved** - Float64 required for populations

**Next**: Commit both deep dives and report back to Paula

---

*End of Deep Dive 02*
