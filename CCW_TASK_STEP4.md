# CCW Task: Phase 5 Step 4 - Radiative Transfer (JOSH Equivalent)

**Date**: 2025-11-14
**Budget**: $36 available
**Approach**: Strict Test-Driven Development (TDD)
**Prerequisites**: Steps 1, 2, 3 complete (700+ tests passing)

---

## Mission Statement

Implement Pure Julia **radiative transfer solver** equivalent to atlas7v's **JOSH** (formal solution) using the same TDD methodology that successfully delivered Steps 1-3.

**Why Pure Julia** (vs atlas7v.so ccall):
- Steps 1-3 proved TDD works brilliantly (~$71-95, 700+ tests, production-ready)
- COMMON blocks in Fortran make integration impractical
- Pure Julia: cleaner, maintainable, extendable, no dependencies
- We now have all building blocks: opacity (Step 3), physics (Step 1)

**Success Criteria**:
- Solve radiative transfer equation (RTE) in 1D plane-parallel geometry
- Compute emergent spectrum I(λ) from atmosphere model
- LTE source function S = B_ν(T)
- Validation against literature values (Eddington-Barbier relation, limb darkening)
- All tests passing (estimate 150-200 new tests)
- Code clean, documented, ready for spectrum synthesis

---

## Background: Radiative Transfer Equation

From `docs/archaeology/PHYSICS_PIPELINE_SYNTHE.md`:

**The Radiative Transfer Equation (RTE)**:
```
dI_λ/dτ_λ = I_λ - S_λ
```

Where:
- `I_λ` = Specific intensity at wavelength λ (erg/s/cm²/Å/sr)
- `τ_λ` = Optical depth at wavelength λ (dimensionless)
- `S_λ` = Source function at wavelength λ

**For LTE** (Local Thermodynamic Equilibrium):
```
S_λ = B_λ(T)  (Planck function)
```

**Optical Depth**:
```
dτ_λ = -κ_λ dz
```
Where κ_λ is opacity from Step 3 (Task 3.2).

**Formal Solution** (emergent intensity):
```
I_λ(0, μ) = ∫₀^∞ S_λ(τ) exp(-τ/μ) dτ/μ
```
Where μ = cos(θ), θ = angle from vertical.

**Eddington-Barbier Relation** (approximation):
```
I_λ(0, μ) ≈ B_λ(T(τ=μ))
```
The emergent intensity comes from optical depth τ ≈ μ.

---

## Task 4.1: Optical Depth Calculation

**Priority**: CRITICAL
**Estimated Budget**: $8-12
**Purpose**: Integrate opacity to get optical depth scale

---

### Functions to Implement

#### 4.1.1: Optical Depth Integration

**`compute_optical_depth(λ::Float64, atm::AtmosphereModel, pops::Vector{PopulationResult}) -> Vector{Float64}`**

Compute optical depth scale τ(z) for given wavelength.

**Inputs**:
- `λ`: Wavelength (Å)
- `atm`: Atmosphere model (T, P, z profiles)
- `pops`: Population results at each depth point

**Returns**:
- `τ`: Optical depth at each depth (dimensionless, increases inward)

**Algorithm**:
```julia
function compute_optical_depth(λ, atm, pops)
    n_depth = length(atm.temperature)
    τ = zeros(n_depth)

    # Start from top (τ = 0)
    τ[1] = 0.0

    # Integrate inward using trapezoidal rule
    for i in 2:n_depth
        # Opacity at both depth points
        κ_i = continuum_opacity_total(λ, atm.temperature[i], atm.electron_pressure[i], pops[i])
        κ_im1 = continuum_opacity_total(λ, atm.temperature[i-1], atm.electron_pressure[i-1], pops[i-1])

        # Distance step (geometric height, cm)
        dz = atm.height[i] - atm.height[i-1]  # Negative (going inward)

        # Optical depth increment: dτ = -κ dz (negative dz, so positive dτ)
        dτ = -0.5 * (κ_i + κ_im1) * dz

        τ[i] = τ[i-1] + dτ
    end

    return τ
end
```

**Tests**:
- Isothermal atmosphere: τ should increase exponentially
- Opacity scaling: 2× κ → 2× τ
- Physical bounds: τ[1] = 0, τ increasing monotonically
- Solar model: τ_5000 ≈ 1 at specific depth (validate)

---

## Task 4.2: Formal Solution (Feautrier Method)

**Priority**: CRITICAL
**Estimated Budget**: $15-20
**Purpose**: Solve RTE to get emergent intensity

---

### Background: Feautrier Method

The Feautrier method reformulates the RTE as a second-order differential equation.

**Define mean intensity and flux**:
```
u = (I⁺ + I⁻) / 2  (mean intensity)
v = (I⁺ - I⁻) / 2  (flux-like quantity)
```

Where I⁺ = outward intensity, I⁻ = inward intensity.

**Second-order equation**:
```
d²u/dτ² = u - S
```

**Boundary conditions**:
- Top: v = u (no incident radiation)
- Bottom: du/dτ = 0 (diffusion approximation)

**Solution**: Tridiagonal system Au = b

---

### Functions to Implement

#### 4.2.1: Source Function

**`source_function_lte(λ::Float64, T::Float64) -> Float64`**

Compute LTE source function (Planck function).

```julia
function source_function_lte(λ, T)
    # Convert λ from Å to cm
    λ_cm = λ * 1.0e-8

    # Planck function (from Step 1)
    B_λ = planck_function_wavelength(λ_cm, T)

    return B_λ
end
```

#### 4.2.2: Feautrier Solver

**`solve_radiative_transfer_feautrier(λ::Float64, atm::AtmosphereModel, τ::Vector{Float64}) -> (Vector{Float64}, Float64)`**

Solve RTE using Feautrier method.

**Inputs**:
- `λ`: Wavelength (Å)
- `atm`: Atmosphere model (T, P, z profiles)
- `τ`: Optical depth scale (from Task 4.1)

**Returns**:
- `u`: Mean intensity at each depth (erg/s/cm²/Å/sr)
- `I_emergent`: Emergent intensity at μ=1 (erg/s/cm²/Å/sr)

**Algorithm**:
```julia
function solve_radiative_transfer_feautrier(λ, atm, τ)
    n_depth = length(τ)

    # Source function at each depth (LTE)
    S = [source_function_lte(λ, T) for T in atm.temperature]

    # Set up tridiagonal system: A u = b
    # A is tridiagonal matrix, u is mean intensity, b is RHS

    a = zeros(n_depth)  # Sub-diagonal
    b_diag = zeros(n_depth)  # Diagonal
    c = zeros(n_depth)  # Super-diagonal
    rhs = zeros(n_depth)  # Right-hand side

    # Interior points (i = 2 to n_depth-1)
    for i in 2:(n_depth-1)
        Δτ_minus = τ[i] - τ[i-1]
        Δτ_plus = τ[i+1] - τ[i]

        # Coefficients for d²u/dτ² = u - S
        a[i] = 2.0 / (Δτ_minus * (Δτ_minus + Δτ_plus))
        c[i] = 2.0 / (Δτ_plus * (Δτ_minus + Δτ_plus))
        b_diag[i] = -(a[i] + c[i]) + 1.0

        rhs[i] = S[i]
    end

    # Boundary condition: Top (i=1)
    # v = u at surface (no incident radiation)
    # Simplified: u[1] ≈ S[1] (optically thin)
    b_diag[1] = 1.0
    rhs[1] = S[1]

    # Boundary condition: Bottom (i=n_depth)
    # du/dτ = 0 (diffusion approximation)
    # Simplified: u[n_depth] ≈ S[n_depth] (LTE deep in atmosphere)
    b_diag[n_depth] = 1.0
    rhs[n_depth] = S[n_depth]

    # Solve tridiagonal system
    u = solve_tridiagonal(a, b_diag, c, rhs)

    # Emergent intensity (Eddington-Barbier approximation)
    # I_emergent ≈ u[surface] + (du/dτ)[surface] for μ=1
    I_emergent = u[1]

    return u, I_emergent
end
```

#### 4.2.3: Tridiagonal Solver

**`solve_tridiagonal(a, b, c, d) -> Vector{Float64}`**

Solve tridiagonal system using Thomas algorithm.

```julia
function solve_tridiagonal(a, b, c, d)
    n = length(d)
    x = zeros(n)

    # Forward sweep
    c_prime = zeros(n-1)
    d_prime = zeros(n)

    c_prime[1] = c[1] / b[1]
    d_prime[1] = d[1] / b[1]

    for i in 2:(n-1)
        denom = b[i] - a[i] * c_prime[i-1]
        c_prime[i] = c[i] / denom
        d_prime[i] = (d[i] - a[i] * d_prime[i-1]) / denom
    end

    d_prime[n] = (d[n] - a[n] * d_prime[n-1]) / (b[n] - a[n] * c_prime[n-1])

    # Back substitution
    x[n] = d_prime[n]
    for i in (n-1):-1:1
        x[i] = d_prime[i] - c_prime[i] * x[i+1]
    end

    return x
end
```

**Tests**:
- Simple diagonal system: A = I → u = b
- Isothermal atmosphere: u ≈ S everywhere (constant)
- Eddington-Barbier: I_emergent ≈ B(T at τ=1)
- Energy conservation: ∫ I dΩ = flux
- Limb darkening: I(μ) decreases toward limb

---

## Task 4.3: Emergent Spectrum

**Priority**: HIGH
**Estimated Budget**: $5-8
**Purpose**: Compute full spectrum I(λ) for wavelength range

---

### Functions to Implement

#### 4.3.1: Spectrum Calculation

**`compute_emergent_spectrum(wavelengths::Vector{Float64}, atm::AtmosphereModel, pops::Vector{PopulationResult}, μ::Float64=1.0) -> Vector{Float64}`**

Compute emergent spectrum for wavelength range.

**Inputs**:
- `wavelengths`: Wavelength grid (Å)
- `atm`: Atmosphere model
- `pops`: Populations at each depth
- `μ`: Viewing angle (cos θ, default μ=1 for disk center)

**Returns**:
- `I_emergent`: Emergent intensity at each wavelength

**Algorithm**:
```julia
function compute_emergent_spectrum(wavelengths, atm, pops, μ=1.0)
    n_wavelength = length(wavelengths)
    I_emergent = zeros(n_wavelength)

    for (i, λ) in enumerate(wavelengths)
        # Compute optical depth
        τ = compute_optical_depth(λ, atm, pops)

        # Solve RTE
        u, I = solve_radiative_transfer_feautrier(λ, atm, τ)

        I_emergent[i] = I
    end

    return I_emergent
end
```

**Tests**:
- Blackbody limit: Optically thick → I ≈ B(T_eff)
- Wavelength dependence: Continuous spectrum shape
- Hydrogen edges: Balmer jump visible at 3646 Å
- Solar spectrum: Compare to observed solar flux

---

## TDD Workflow for Step 4

**RED → GREEN → REFACTOR cycle**:

1. **Test: Optical depth for isothermal slab**
   - Write failing test
   - Implement compute_optical_depth()
   - Validate: τ ∝ κ × z
   - Commit

2. **Test: Tridiagonal solver**
   - Test identity matrix case
   - Test known solution
   - Implement solve_tridiagonal()
   - Commit

3. **Test: Source function (Planck)**
   - Test at solar T
   - Wien limit, Rayleigh-Jeans limit
   - Implement source_function_lte()
   - Commit

4. **Test: Feautrier solver - isothermal**
   - Constant T, S → u ≈ S
   - Implement solve_radiative_transfer_feautrier()
   - Commit

5. **Test: Eddington-Barbier relation**
   - I_emergent ≈ B(T at τ=1)
   - Validate against literature
   - Commit

6. **Test: Emergent spectrum wavelength scan**
   - Solar model
   - Continuum shape
   - Commit

7. **Refactor**: Clean up, optimize, add documentation

---

## Budget Breakdown

| Task | Description | Estimated Cost |
|------|------------|---------------|
| 4.1.1 | Optical depth integration | $3-5 |
| 4.2.1 | Source function (LTE) | $2-3 |
| 4.2.2 | Feautrier solver | $8-12 |
| 4.2.3 | Tridiagonal solver | $2-3 |
| 4.3.1 | Emergent spectrum | $3-5 |
| Testing | Integration tests, validation | $5-8 |
| **Total** | | **$23-36** |

**Fits within $36 budget!**

---

## Deliverables

**Code**:
- `src/Synthe/src/radiative_transfer.jl` (~400-500 lines)
- `src/Synthe/src/tridiagonal_solver.jl` (~100 lines)

**Tests**:
- `test/synthe/test_radiative_transfer.jl` (~200-300 lines)
- `test/synthe/test_optical_depth.jl` (~100 lines)

**Demo**:
- `examples/demo_radiative_transfer.jl` - Show emergent spectrum

**Documentation**:
- Update PHASE5_STATUS.md with Step 4 completion
- CCW_TASK_STEP4.md (this file)

---

## Validation Strategy

**Analytical Tests**:
- Isothermal atmosphere: u = S
- Eddington-Barbier: I(0) ≈ B(T at τ=1)
- Blackbody limit: Thick atmosphere → I ≈ B(T_eff)

**Literature Comparison**:
- Gray (2005) - Limb darkening laws
- Mihalas (1978) - Eddington approximation
- Solar spectrum - Continuum shape

**Physical Consistency**:
- Energy conservation
- Second law (I ≤ B)
- Correct wavelength dependence

---

## Simplifications for Step 4

To fit within $36 budget:

**Include**:
- ✅ 1D plane-parallel geometry
- ✅ LTE source function only
- ✅ Continuum opacity (from Step 3)
- ✅ Feautrier formal solution
- ✅ Single viewing angle (μ=1)

**Defer to future**:
- ⏭ Line opacity integration (use continuum-only for now)
- ⏭ Angle-dependent solution (limb darkening)
- ⏭ NLTE (non-LTE source function)
- ⏭ Scattering (assume pure absorption)
- ⏭ Multi-D geometry

---

## Success Example

After Step 4 completion, user can run:

```julia
using Synthe

# Load atmosphere model
atm = read_atmosphere("models/sun_t5777g44.dat")

# Compute populations at each depth
pops = [compute_populations(T, P, abundances) for (T, P) in zip(atm.temperature, atm.gas_pressure)]

# Compute emergent spectrum
wavelengths = 4000.0:1.0:7000.0  # Å
I_emergent = compute_emergent_spectrum(wavelengths, atm, pops)

# Plot spectrum
plot(wavelengths, I_emergent, xlabel="λ (Å)", ylabel="I_λ (erg/s/cm²/Å/sr)")
```

**Output**: Solar continuum spectrum with Balmer jump at 3646 Å

---

## References

**Numerical Methods**:
- Mihalas (1978) "Stellar Atmospheres" - Chapter 4 (Radiative Transfer)
- Hubeny & Mihalas (2014) "Theory of Stellar Atmospheres" - Chapter 13 (Formal Solution)
- Gray (2005) - Chapter 8 (Line Formation)

**Physics**:
- Eddington-Barbier relation
- Limb darkening laws
- Emergent flux vs intensity

**Validation Data**:
- Kurucz solar spectrum
- ATLAS12 model atmospheres
- Observed solar flux (Thuillier et al. 2003)

---

**Ready to implement!** Let's start with TDD: RED → GREEN → REFACTOR
