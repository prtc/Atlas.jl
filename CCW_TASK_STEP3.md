# CCW Task: Phase 5 Step 3 - Population Solver & Opacity Integration

**Date**: 2025-11-14  
**Budget**: $13-20 (out of $40 available)  
**Approach**: Strict Test-Driven Development (TDD)  
**Prerequisites**: Steps 1 & 2 complete (300+ tests passing)

---

## Mission Statement

Implement Pure Julia equivalents of atlas7v's **POPS** (population solver) and **KAPP** (opacity integration) subroutines using the same TDD methodology that successfully delivered Steps 1 & 2.

**Why Pure Julia** (vs atlas7v.so ccall):
- COMMON blocks require Fortran wrappers → same effort as Pure Julia
- Steps 1 & 2 proved TDD works brilliantly ($60, 300+ tests, production-ready)
- Only 2 subroutines needed from atlas7v: POPS + KAPP
- Pure Julia: cleaner, maintainable, extendable, no dependencies

**Success Criteria**:
- All tests passing (estimate 100-150 new tests)
- Populations match Saha-Boltzmann expectations
- Opacity integration validated against literature values
- Code clean, documented, ready for Step 4 (radiative transfer)

---

## Task 3.1: Population Solver (POPS Equivalent)

**Priority**: CRITICAL  
**Estimated Budget**: $10-15  
**Purpose**: Compute ionization and excitation populations using Saha-Boltzmann statistics

---

### Background: What POPS Does

From `docs/archaeology/PHYSICS_PIPELINE_SYNTHE.md`:

**POPS computes**:
- Ionization fractions: n_i,j / n_total (what fraction of element i is in ion stage j)
- Excitation populations: n_i,j,k / n_i,j (what fraction of ion i,j is in level k)
- Solves for electron density n_e via charge conservation iteration

**Governing Equations**:

1. **Saha Equation** (ionization equilibrium):
   ```
   n_i,j+1 / n_i,j = (2 Z_i,j+1 / Z_i,j) × (2π m_e k T / h²)^(3/2) × exp(-χ_i,j / kT) / n_e
   ```
   Where:
   - Z_i,j = partition function for element i, ion stage j
   - χ_i,j = ionization potential (eV)
   - n_e = electron density (cm⁻³)

2. **Boltzmann Equation** (level populations):
   ```
   n_i,j,k / n_i,j = (g_k / Z_i,j) × exp(-E_k / kT)
   ```
   Where:
   - g_k = statistical weight of level k
   - E_k = excitation energy (cm⁻¹ or eV)

3. **Charge Conservation** (electron density):
   ```
   n_e = Σ_i Σ_j (j × n_i,j × abundance_i)
   ```
   Iterate on n_e until self-consistent (damping factor 0.3)

---

### Functions to Implement

#### 3.1.1: Partition Functions

**`partition_function(element::Int, ion_stage::Int, T::Float64) -> Float64`**

Compute partition function Z(T) for element/ion.

**Inputs**:
- `element`: Atomic number (1=H, 2=He, 6=C, 8=O, 26=Fe, etc.)
- `ion_stage`: Ionization stage (0=neutral, 1=singly ionized, etc.)
- `T`: Temperature (K)

**Returns**:
- Z(T): Partition function (dimensionless)

**Implementation Options**:

Option A: **Analytical approximations** (recommended for TDD):
```julia
# Hydrogen (simple)
if element == 1 && ion_stage == 0
    # H I: Z = 2 (ground state only, g=2)
    return 2.0
elseif element == 1 && ion_stage == 1
    # H II: Z = 1 (no electrons)
    return 1.0
end

# Helium
if element == 2 && ion_stage == 0
    # He I: approximate
    return 1.0 + exp(-19.8 / (8.617e-5 * T))  # First excitation
elseif element == 2 && ion_stage == 1
    # He II: hydrogenic
    return 2.0
end

# Heavier elements: use polynomial fits or tables
# See Gray (2005) Appendix B for typical values
```

Option B: **NIST tables** (if Paula provides):
- Load precomputed Z(T) for T=1000K to 50000K in steps
- Interpolate for arbitrary T
- More accurate but requires data files

**TDD Strategy**:
- Start with H, He (simple analytical)
- Add C, N, O, Fe with polynomial fits
- Validate: Z(T) should increase with T (more levels populated)
- Test bounds: Z ≥ ground state degeneracy g_0

---

#### 3.1.2: Saha Equation

**`saha_ionization_ratio(element::Int, ion_stage::Int, T::Float64, n_e::Float64, χ_ion::Float64) -> Float64`**

Compute ionization fraction ratio n_{j+1}/n_j using Saha equation.

**Inputs**:
- `element`: Atomic number
- `ion_stage`: Current ionization stage j
- `T`: Temperature (K)
- `n_e`: Electron density (cm⁻³)
- `χ_ion`: Ionization potential for j→j+1 (eV)

**Returns**:
- Ratio n_{j+1}/n_j (dimensionless)

**Formula** (already in `physics.jl`, expand it):
```julia
function saha_ionization_ratio(element, ion_stage, T, n_e, χ_ion)
    # Partition functions
    Z_j = partition_function(element, ion_stage, T)
    Z_j1 = partition_function(element, ion_stage+1, T)

    # Saha constant (from constants.jl)
    const m_e = 9.1093837015e-28  # g
    const k_B = 1.380649e-16      # erg/K
    const h = 6.62607015e-27      # erg·s
    const eV = 1.602176634e-12    # erg

    # Saha equation
    factor = (2.0 * Z_j1 / Z_j) * (2π * m_e * k_B * T / h^2)^1.5
    ratio = factor * exp(-χ_ion * eV / (k_B * T)) / n_e

    return ratio
end
```

**Tests**:
- High T: ratio should increase (more ionization)
- High n_e: ratio should decrease (recombination favored)
- Large χ_ion: ratio should decrease (hard to ionize)
- Hydrogen at 5777K: ~50% H I, ~50% H II (validate against literature)

---

#### 3.1.3: Population Solver with Iteration

**`compute_populations(T::Float64, P_gas::Float64, abundances::Vector{Float64}) -> PopulationResult`**

Solve Saha-Boltzmann equations with charge conservation.

**Inputs**:
- `T`: Temperature (K)
- `P_gas`: Gas pressure (dyne/cm²)
- `abundances`: Element abundances (H=12.0 scale, length 30 for Z=1-30)

**Returns** (struct):
```julia
struct PopulationResult
    n_e::Float64                              # Electron density (cm⁻³)
    ion_fractions::Dict{Tuple{Int,Int}, Float64}  # (element, ion_stage) → fraction
    number_densities::Dict{Tuple{Int,Int}, Float64}  # (element, ion_stage) → n (cm⁻³)
    converged::Bool                           # Did iteration converge?
    iterations::Int                           # Number of iterations
end
```

**Algorithm** (from ATLAS12/SYNTHE):
```julia
function compute_populations(T, P_gas, abundances)
    # Initial guess for n_e from ideal gas law
    n_total = P_gas / (k_B * T)  # Total particle density
    n_e = 1.0e14  # Initial guess (cm⁻³)

    # Iteration with damping
    damping = 0.3  # Same as ATLAS12
    max_iter = 100
    tolerance = 1.0e-4

    for iter in 1:max_iter
        # 1. Compute ionization fractions for each element
        ion_fractions = Dict()
        for element in 1:30
            if abundances[element] > 0.0
                # Solve Saha equation for this element
                # Get n_0, n_1, n_2, ... (normalized Σ n_j = 1)
                fractions = solve_saha_element(element, T, n_e, abundances[element])
                for (ion_stage, fraction) in enumerate(fractions)
                    ion_fractions[(element, ion_stage-1)] = fraction
                end
            end
        end

        # 2. Compute electron density from charge conservation
        n_e_new = 0.0
        for element in 1:30
            if abundances[element] > 0.0
                # Number density of this element
                n_element = 10^(abundances[element] - 12.0) * n_total

                # Contribution to n_e
                for ion_stage in 0:element
                    if haskey(ion_fractions, (element, ion_stage))
                        fraction = ion_fractions[(element, ion_stage)]
                        n_e_new += ion_stage * fraction * n_element
                    end
                end
            end
        end

        # 3. Check convergence
        relative_change = abs(n_e_new - n_e) / n_e
        if relative_change < tolerance
            # Converged! Compute final number densities
            number_densities = compute_number_densities(ion_fractions, abundances, n_total)
            return PopulationResult(n_e, ion_fractions, number_densities, true, iter)
        end

        # 4. Damp and iterate
        n_e = n_e + damping * (n_e_new - n_e)
    end

    # Did not converge
    return PopulationResult(n_e, Dict(), Dict(), false, max_iter)
end
```

**Tests**:
- Solar conditions (T=5777K, solar abundances): n_e ≈ 10^14 cm⁻³
- Pure hydrogen (abundance_H=12, rest=0): test against analytical Saha
- High T (10000K): more ionization
- Low T (4000K): mostly neutral
- Convergence: should reach tolerance in <20 iterations

---

### TDD Workflow for Task 3.1

**RED → GREEN → REFACTOR cycle**:

1. **Test: partition_function for H I, H II**
   - Write failing test
   - Implement simplest case (H)
   - Refactor, commit

2. **Test: partition_function for He I, He II**
   - Failing test for He
   - Implement analytical approximation
   - Commit

3. **Test: saha_ionization_ratio for H**
   - Test at solar conditions
   - Implement using physics.jl formula
   - Validate: ~50% H II at 5777K
   - Commit

4. **Test: solve_saha_element (helper function)**
   - Normalize fractions to Σ = 1
   - Test for H (2 stages), He (3 stages)
   - Commit

5. **Test: charge_conservation iteration**
   - Pure H test case
   - Should converge to self-consistent n_e
   - Commit

6. **Test: compute_populations full solver**
   - Solar conditions
   - Multiple elements
   - Check convergence
   - Commit

7. **Refactor**: Clean up, optimize, add documentation

**Deliverables**:
- `src/Synthe/src/populations.jl` (~400-500 lines)
- `test/synthe/test_populations.jl` (~200-300 lines)
- All tests passing
- Demo script: `examples/demo_populations.jl`

---

## Task 3.2: Opacity Integration (KAPP Equivalent)

**Priority**: HIGH  
**Estimated Budget**: $3-5  
**Purpose**: Combine line + continuum opacity, weight by populations

---

### Background: What KAPP Does

**KAPP integrates**:
- All continuum sources (already implemented in Step 2!)
- Weight by populations from POPS
- Sum over wavelength grid
- Return total opacity at each (λ, depth) point

**We already have**:
- ✅ `hminus_bf(λ, T, P_e)` - H⁻ bound-free
- ✅ `hminus_ff(λ, T, P_e)` - H⁻ free-free  
- ✅ `hydrogen_bf(λ, T, n_level)` - H I bound-free
- ✅ `electron_scattering(n_e)` - Thomson scattering
- ✅ Line opacity utilities from Step 1

**Task 3.2 just needs to**:
1. Weight continuum opacity by populations (H I, H II fractions)
2. Sum all sources
3. Add line opacity contribution
4. Return κ_total(λ)

---

### Functions to Implement

#### 3.2.1: Total Continuum Opacity at Depth Point

**`continuum_opacity_total(λ::Float64, T::Float64, P_e::Float64, pops::PopulationResult) -> Float64`**

Combine all continuum sources weighted by populations.

**Inputs**:
- `λ`: Wavelength (Å)
- `T`: Temperature (K)
- `P_e`: Electron pressure (dyne/cm²)
- `pops`: Population result from Task 3.1

**Returns**:
- κ_continuum(λ): Total continuum opacity (cm⁻¹)

**Implementation**:
```julia
function continuum_opacity_total(λ, T, P_e, pops)
    # Extract populations
    n_e = pops.n_e
    n_HI = pops.number_densities[(1, 0)]   # H I (neutral)
    n_HII = pops.number_densities[(1, 1)]  # H II (ionized)
    # ... other elements as needed

    # H⁻ opacity (proportional to n_HI * n_e)
    κ_hminus_bf = n_HI * n_e * hminus_bf(λ, T, P_e)
    κ_hminus_ff = n_HI * n_e * hminus_ff(λ, T, P_e)

    # H I bound-free (sum over levels)
    κ_h1_bf = 0.0
    for n_level in 1:5  # Lyman, Balmer, Paschen, Brackett, Pfund
        κ_h1_bf += n_HI * hydrogen_bf(λ, T, n_level)
    end

    # Electron scattering (wavelength-independent)
    κ_es = electron_scattering(n_e)

    # Sum all sources
    κ_total = κ_hminus_bf + κ_hminus_ff + κ_h1_bf + κ_es

    return κ_total
end
```

**Tests**:
- Solar photosphere: H⁻ should dominate in optical
- Hot star (T>10000K): H I bf should dominate
- Wavelength scan: H I edges should be visible
- Compare to literature values (Gray 2005, Mihalas 1978)

---

#### 3.2.2: Line Opacity Contribution (Already Exists!)

From Step 1, we have `line_opacity_utils.jl` with:
- `accumulate_line_opacity(lines, λ_grid, conditions)`

Just need to integrate with populations:
```julia
function line_opacity_at_wavelength(λ, lines, T, pops)
    # For each line, compute opacity weighted by lower level population
    κ_line = 0.0
    for line in lines
        # Get population of lower level
        element = round(Int, line.element_ion)
        ion_stage = round(Int, 100 * (line.element_ion - element))
        
        n_lower = boltzmann_population(line.e_lower, T, pops, element, ion_stage)
        
        # Line absorption coefficient (from Step 1)
        κ_line += line_absorption(λ, line, T, n_lower)
    end
    return κ_line
end
```

---

#### 3.2.3: Total Opacity (Line + Continuum)

**`total_opacity(λ::Float64, T::Float64, P_e::Float64, pops::PopulationResult, lines::Vector{SpectralLine}) -> Float64`**

Final integration: sum everything.

```julia
function total_opacity(λ, T, P_e, pops, lines)
    κ_continuum = continuum_opacity_total(λ, T, P_e, pops)
    κ_line = line_opacity_at_wavelength(λ, lines, T, pops)
    
    return κ_continuum + κ_line
end
```

**Tests**:
- Zero lines: should match continuum-only
- Strong line (Fe I 5000Å): line should dominate at line center
- Line wings: continuum should dominate far from line center
- Wavelength scan: realistic opacity profile

---

### TDD Workflow for Task 3.2

**RED → GREEN → REFACTOR**:

1. **Test: continuum_opacity_total at solar conditions**
   - Compute populations (from Task 3.1)
   - Sum continuum sources
   - Validate against literature
   - Commit

2. **Test: wavelength scan showing H I edges**
   - Lyman edge at 912 Å
   - Balmer edge at 3646 Å
   - Should see jumps in opacity
   - Commit

3. **Test: H⁻ dominance in solar optical**
   - λ=5000 Å, T=5777K
   - κ_hminus > κ_h1 + κ_es
   - Commit

4. **Test: line_opacity integration**
   - Single line test case
   - Voigt profile shape preserved
   - Weighted by population
   - Commit

5. **Test: total_opacity with real line list**
   - Read gfall lines (from Step 2)
   - Compute populations (from Task 3.1)
   - Generate opacity spectrum
   - Commit

6. **Refactor**: Optimize, document

**Deliverables**:
- `src/Synthe/src/opacity_integration.jl` (~100-200 lines)
- `test/synthe/test_opacity_integration.jl` (~100-150 lines)
- Demo: `examples/demo_total_opacity.jl`

---

## Acceptance Criteria (Step 3 Complete)

**Code Quality**:
- ✅ All functions type-stable
- ✅ Zero allocations in hot paths (opacity loops)
- ✅ Comprehensive docstrings
- ✅ Julia style guide followed

**Testing**:
- ✅ 100-150 new tests passing (estimate)
- ✅ Integration tests with real data (ATLAS model, gfall lines)
- ✅ Literature validation (Gray 2005, Mihalas 1978)
- ✅ Edge cases covered (pure H, high/low T, convergence failures)

**Validation**:
- ✅ Solar populations: n_e ≈ 10^14 cm⁻³, ~50% H I/H II
- ✅ Continuum opacity matches literature within 20%
- ✅ H⁻ dominates in solar optical (validated)
- ✅ H I edges visible at correct wavelengths
- ✅ Saha equation convergence <20 iterations

**Documentation**:
- ✅ Demo scripts show realistic use cases
- ✅ Validation results documented
- ✅ Ready for Step 4 (radiative transfer)

---

## Budget Breakdown

| Task | Description | Estimated Cost |
|------|------------|---------------|
| 3.1.1 | Partition functions (H, He, C, N, O, Fe) | $2-3 |
| 3.1.2 | Saha equation + tests | $2-3 |
| 3.1.3 | Population solver with iteration | $5-7 |
| 3.2.1 | Continuum opacity integration | $1-2 |
| 3.2.2 | Line opacity integration | $1-2 |
| 3.2.3 | Total opacity + validation | $1-2 |
| **Total** | | **$12-19** |

**Margin**: $40 budget - $19 max = $21 remaining for Step 4 or extensions

---

## Resources & References

**Physics Formulas**:
- `docs/archaeology/PHYSICS_PIPELINE_SYNTHE.md` - Saha-Boltzmann equations
- `docs/archaeology/PHYSICS_PIPELINE_ATLAS12.md` - POPS algorithm details
- `docs/archaeology/DEEP_DIVES/` - Deep dive documents

**Literature**:
- Gray (2005) "Observations and Analysis of Stellar Photospheres" - Partition functions, opacity values
- Mihalas (1978) "Stellar Atmospheres" - Saha equation, population statistics
- Kurucz & Bell (1995) - Partition function tables (if available)

**Existing Code** (Steps 1 & 2 to build on):
- `src/Synthe/src/physics.jl` - Saha equation stub, Boltzmann distribution
- `src/Synthe/src/continuum_opacity.jl` - All continuum sources ready!
- `src/Synthe/src/line_opacity_utils.jl` - Line opacity machinery
- `src/Synthe/src/constants.jl` - All physical constants

**Test Data**:
- `test/data/models/ap00t5777g44377k1odfnew.dat` - Solar ATLAS model (for validation)
- `test/data/atomic/gf0600_sample.dat` - Atomic lines (20k lines)
- `test/data/molecular/mgh_sample.asc` - Molecular lines (5k lines)

---

## Timeline & Workflow

**Recommended approach**: Work in sequence, commit frequently

**Task 3.1** (Populations): 
1. Start with partition functions (2-3 hours)
2. Saha equation (2-3 hours)
3. Population solver (5-7 hours)
4. Testing & validation (2-3 hours)
5. Demo script (1 hour)

**Task 3.2** (Opacity Integration):
1. Continuum integration (1-2 hours)
2. Line integration (1-2 hours)
3. Total opacity (1-2 hours)
4. Testing & demo (2 hours)

**Total estimated time**: 15-25 hours of focused work

**Commits**: Expect 15-20 commits (one per test cycle)

---

## Success Looks Like

**At completion of Step 3**:

```julia
# Load atmosphere model
model = read_atlas_model("ap00t5777g44377k1odfnew.dat")

# Load line lists
atomic_lines = read_gfall_lines("gfall.dat", 5000.0, 5100.0)
molecular_lines = read_molecular_lines("mgh.asc", "MgH", 5000.0, 5100.0)

# Compute populations at one depth point
T = model.temperature[1]
P = model.pressure[1]
abundances = model.abundances

pops = compute_populations(T, P, abundances)
println("Electron density: $(pops.n_e) cm⁻³")  # ~10^14 for solar
println("H I fraction: $(pops.ion_fractions[(1,0)])")  # ~0.5 for solar
println("H II fraction: $(pops.ion_fractions[(1,1)])")  # ~0.5 for solar

# Compute total opacity at λ=5000 Å
λ = 5000.0
P_e = pops.n_e * k_B * T  # Electron pressure
all_lines = vcat(atomic_lines, molecular_lines)

κ_total = total_opacity(λ, T, P_e, pops, all_lines)
println("Total opacity at 5000 Å: $κ_total cm⁻¹")

# Ready for Step 4: Radiative transfer!
```

**Output**: Realistic opacity values, populations, ready for spectrum synthesis

---

*Author: Claude Code (Sonnet 4.5)*  
*Date: 2025-11-14*  
*Status: Approved, Ready to Start*
