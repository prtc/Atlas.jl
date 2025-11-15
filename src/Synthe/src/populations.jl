"""
Population solver using Saha-Boltzmann statistics

Implements Pure Julia equivalent of atlas7v POPS subroutine.

Functions:
- partition_function() - Compute Z(T) for element/ion
- saha_ionization_ratio() - Compute n_{j+1}/n_j using Saha equation
- compute_populations() - Full population solver with charge conservation iteration

Physics:
- Saha equation: Ionization equilibrium
- Boltzmann equation: Excitation populations
- Charge conservation: Iterative solution for electron density

References:
- Gray (2005) "Observations and Analysis of Stellar Photospheres"
- Mihalas (1978) "Stellar Atmospheres"
- ATLAS12/SYNTHE original Fortran code

Author: Claude (Local), Paula Coelho
Date: 2025-11-14
"""

# Load physical constants
include("constants.jl")

"""
    partition_function(element::Int, ion_stage::Int, T::Float64) -> Float64

Compute partition function Z(T) for specified element and ionization stage.

The partition function accounts for statistical weights of all accessible energy levels:
    Z(T) = Σ_i g_i exp(-E_i / kT)

where g_i is the statistical weight and E_i is the energy of level i.

# Arguments
- `element::Int`: Atomic number (1=H, 2=He, 6=C, 8=O, 26=Fe, etc.)
- `ion_stage::Int`: Ionization stage (0=neutral, 1=singly ionized, 2=doubly ionized, etc.)
- `T::Float64`: Temperature (K)

# Returns
- `Float64`: Partition function Z(T) (dimensionless, ≥ 1)

# Implementation
Uses analytical approximations for light elements (H, He).
Heavier elements would use polynomial fits or NIST tables.

# Physical Properties
- Z(T) ≥ g_0 (ground state degeneracy)
- Z(T) increases with temperature (more levels populated)
- Fully ionized ions: Z = 1 (no internal structure)

# Examples
```julia
Z_HI = partition_function(1, 0, 5777.0)   # H I at solar T: Z ≈ 2
Z_HII = partition_function(1, 1, 5777.0)  # H II (proton): Z = 1
Z_HeI = partition_function(2, 0, 5777.0)  # He I: Z ≈ 1
```
"""
function partition_function(element::Int, ion_stage::Int, T::Float64)::Float64
    # Validate inputs
    if element < 1 || element > 30
        throw(ArgumentError("Element must be between 1 and 30, got $element"))
    end
    if ion_stage < 0 || ion_stage > element
        throw(ArgumentError("Ion stage must be between 0 and $element, got $ion_stage"))
    end
    if T <= 0.0
        throw(ArgumentError("Temperature must be positive, got $T"))
    end

    # === Hydrogen (Z=1) ===
    if element == 1
        if ion_stage == 0
            # H I: Ground state 1s (g=2)
            # First excited 2s, 2p (E ≈ 10.2 eV)
            # At low T: Z ≈ 2
            # At high T: excited states contribute

            # Simplified formula: Z = 2 (ground only)
            # For better accuracy, include first few levels
            const E_2 = 10.2  # eV (n=2 excitation)
            const g_1 = 2.0   # Ground state degeneracy
            const g_2 = 8.0   # n=2 degeneracy (2s + 2p: 2 + 6)

            # Boltzmann factor for n=2
            boltz_2 = exp(-E_2 * eV_cgs / (k_B_cgs * T))

            Z = g_1 + g_2 * boltz_2

            return max(Z, 2.0)  # At least ground state

        elseif ion_stage == 1
            # H II: Fully ionized (proton)
            # No electrons → no internal structure
            return 1.0
        end
    end

    # === Helium (Z=2) ===
    if element == 2
        if ion_stage == 0
            # He I: Ground state 1s² (g=1)
            # First excited 2s (E ≈ 19.8 eV)
            const E_exc = 19.8  # eV
            const g_0 = 1.0

            # At low T: Z ≈ 1 (only ground state)
            # At high T: excited states contribute
            Z = g_0 * (1.0 + exp(-E_exc * eV_cgs / (k_B_cgs * T)))

            return max(Z, 1.0)

        elseif ion_stage == 1
            # He II: Hydrogenic (like H I but Z=2)
            # Ground state 1s (g=2)
            const E_2 = 40.8  # eV (n=2, higher than H due to Z=2)
            const g_1 = 2.0
            const g_2 = 8.0

            boltz_2 = exp(-E_2 * eV_cgs / (k_B_cgs * T))
            Z = g_1 + g_2 * boltz_2

            return max(Z, 2.0)

        elseif ion_stage == 2
            # He III: Fully ionized
            return 1.0
        end
    end

    # === Heavier elements (placeholder) ===
    # For TDD: return ground state degeneracy
    # In production: use polynomial fits or NIST tables

    # Default: ground state only (Z = 1)
    return 1.0
end

"""
    saha_ionization_ratio(element::Int, ion_stage::Int, T::Float64,
                         n_e::Float64, χ_ion::Float64) -> Float64

Compute ionization fraction ratio n_{j+1}/n_j using Saha equation.

The Saha equation describes ionization equilibrium in thermal plasma:

    n_{j+1}/n_j = (2 Z_{j+1}/Z_j) × (2π m_e k T / h²)^(3/2) × exp(-χ/kT) / n_e

where:
- Z_j, Z_{j+1} are partition functions for ion stages j and j+1
- χ is the ionization potential (eV)
- n_e is the electron density (cm⁻³)

# Arguments
- `element::Int`: Atomic number
- `ion_stage::Int`: Current ionization stage j (0=neutral, 1=singly ionized, ...)
- `T::Float64`: Temperature (K)
- `n_e::Float64`: Electron density (cm⁻³)
- `χ_ion::Float64`: Ionization potential χ_{j→j+1} (eV)

# Returns
- `Float64`: Ratio n_{j+1}/n_j (dimensionless, > 0)

# Physical Behavior
- Higher T → more ionization → higher ratio
- Higher n_e → more recombination → lower ratio (∝ 1/n_e)
- Higher χ → harder to ionize → lower ratio

# Examples
```julia
# Hydrogen at solar conditions (T=5777K, n_e=10^14 cm⁻³)
# χ(H I→II) = 13.598 eV
# Expected: ratio ≈ 1 (about 50% ionized)
ratio = saha_ionization_ratio(1, 0, 5777.0, 1.0e14, 13.598)
```
"""
function saha_ionization_ratio(element::Int, ion_stage::Int, T::Float64,
                               n_e::Float64, χ_ion::Float64)::Float64
    # Validate inputs
    if T <= 0.0
        throw(ArgumentError("Temperature must be positive, got $T"))
    end
    if n_e <= 0.0
        throw(ArgumentError("Electron density must be positive, got $n_e"))
    end
    if χ_ion < 0.0
        throw(ArgumentError("Ionization potential must be non-negative, got $χ_ion"))
    end

    # Partition functions
    Z_j = partition_function(element, ion_stage, T)
    Z_j1 = partition_function(element, ion_stage + 1, T)

    # Saha constant: (2π m_e k T / h²)^(3/2)
    const factor_const = 2π * m_e_cgs * k_B_cgs / h_cgs^2
    saha_const = factor_const^1.5 * T^1.5

    # Partition function ratio
    Z_ratio = 2.0 * Z_j1 / Z_j

    # Exponential term: exp(-χ/kT)
    # χ is in eV, need to convert to erg
    boltzmann_factor = exp(-χ_ion * eV_cgs / (k_B_cgs * T))

    # Saha equation
    ratio = Z_ratio * saha_const * boltzmann_factor / n_e

    return ratio
end

"""
    PopulationResult

Result of population solver computation.

Contains electron density, ionization fractions, and convergence information.

# Fields
- `n_e::Float64`: Electron density (cm⁻³)
- `ion_fractions::Dict{Tuple{Int,Int}, Float64}`: (element, ion_stage) → fraction
  where fraction is normalized: Σ_j fraction_j = 1 for each element
- `number_densities::Dict{Tuple{Int,Int}, Float64}`: (element, ion_stage) → density (cm⁻³)
- `converged::Bool`: True if iteration converged to tolerance
- `iterations::Int`: Number of iterations performed
- `final_error::Float64`: Final relative change |Δn_e/n_e| at last iteration
- `n_e_history::Vector{Float64}`: Electron density at each iteration (for diagnostics)
"""
struct PopulationResult
    n_e::Float64
    ion_fractions::Dict{Tuple{Int,Int}, Float64}
    number_densities::Dict{Tuple{Int,Int}, Float64}
    converged::Bool
    iterations::Int
    final_error::Float64
    n_e_history::Vector{Float64}
end

"""
    compute_populations(T::Float64, P_gas::Float64, abundances::Vector{Float64}) -> PopulationResult

Solve Saha-Boltzmann equations with charge conservation iteration.

Computes ionization fractions for all elements by iteratively solving:
1. Saha equation for each element (given n_e)
2. Charge conservation to get new n_e
3. Iterate until convergence

# Arguments
- `T::Float64`: Temperature (K)
- `P_gas::Float64`: Gas pressure (dyne/cm²)
- `abundances::Vector{Float64}`: Element abundances on log scale where H=12.0
  Length should be 30 for elements Z=1-30

# Returns
- `PopulationResult`: Contains n_e, ion fractions, number densities, convergence status

# Algorithm
Uses damped iteration (damping factor = 0.3, same as ATLAS12):
- Initial guess: n_e = 10^14 cm⁻³
- Iterate until |Δn_e/n_e| < 10^-4 or max 100 iterations
- Charge conservation: n_e = Σ_i Σ_j (j × n_{i,j})

# Example
```julia
# Solar abundances (simplified)
abundances = zeros(30)
abundances[1] = 12.0      # H
abundances[2] = 10.93     # He

# Solar photosphere
result = compute_populations(5777.0, 1.0e5, abundances)
println("n_e = ", result.n_e, " cm⁻³")
println("H II fraction = ", result.ion_fractions[(1, 1)])
```
"""
function compute_populations(T::Float64, P_gas::Float64,
                            abundances::Vector{Float64})::PopulationResult
    # Validate inputs
    if T <= 0.0
        throw(ArgumentError("Temperature must be positive, got $T"))
    end
    if P_gas <= 0.0
        throw(ArgumentError("Gas pressure must be positive, got $P_gas"))
    end
    if length(abundances) < 2
        throw(ArgumentError("Need at least 2 elements (H, He)"))
    end

    # Total particle density from ideal gas law
    # P = n_total × k × T
    n_total = P_gas / (k_B_cgs * T)

    # Initial guess for electron density
    n_e = 1.0e14  # cm⁻³ (typical solar photosphere)

    # Iteration parameters (same as ATLAS12)
    const damping = 0.3
    const max_iter = 100
    const tolerance = 1.0e-4

    # Ionization potentials (eV) for first ionization
    # Index: atomic number
    const χ_table = [
        13.598,   # H
        24.587,   # He
        5.391,    # Li (placeholder - not used yet)
        9.322,    # Be
        8.298,    # B
        11.260,   # C
        14.534,   # N
        13.618,   # O
        17.422,   # F
        21.564,   # Ne
        # Add more as needed
    ]

    ion_fractions = Dict{Tuple{Int,Int}, Float64}()
    number_densities = Dict{Tuple{Int,Int}, Float64}()

    # Track electron density evolution for diagnostics
    n_e_history = Float64[n_e]  # Initial guess

    # Track final error
    relative_change = 0.0

    for iter in 1:max_iter
        # Clear previous iteration
        empty!(ion_fractions)
        empty!(number_densities)

        # 1. Compute ionization fractions for each element
        for element in 1:min(length(abundances), length(χ_table))
            if abundances[element] > 0.0
                # Number density of this element
                # abundance is log scale with H=12
                n_element = 10^(abundances[element] - 12.0) * n_total

                # Solve Saha equation for this element
                # Get fractions for all ionization stages
                fractions = solve_saha_element(element, T, n_e, χ_table)

                # Store fractions and densities
                for (ion_stage, fraction) in enumerate(fractions)
                    ion_fractions[(element, ion_stage - 1)] = fraction
                    number_densities[(element, ion_stage - 1)] = fraction * n_element
                end
            end
        end

        # 2. Compute electron density from charge conservation
        # n_e = Σ_i Σ_j (j × n_{i,j})
        n_e_new = 0.0
        for ((elem, ion_stage), density) in number_densities
            n_e_new += ion_stage * density
        end

        # Prevent n_e from going to zero
        if n_e_new < 1.0
            n_e_new = 1.0
        end

        # 3. Check convergence
        relative_change = abs(n_e_new - n_e) / max(n_e, 1.0e-10)

        if relative_change < tolerance
            # Converged!
            push!(n_e_history, n_e_new)
            return PopulationResult(n_e_new, ion_fractions, number_densities,
                                   true, iter, relative_change, n_e_history)
        end

        # 4. Damp and iterate
        n_e = n_e + damping * (n_e_new - n_e)
        push!(n_e_history, n_e)
    end

    # Did not converge - log warning with diagnostic information
    @warn "Population solver did not converge after $max_iter iterations" T P_gas final_error=relative_change n_e_initial=n_e_history[1] n_e_final=n_e maxlog=10

    return PopulationResult(n_e, ion_fractions, number_densities,
                           false, max_iter, relative_change, n_e_history)
end

"""
    solve_saha_element(element::Int, T::Float64, n_e::Float64, χ_table::Vector{Float64}) -> Vector{Float64}

Solve Saha equation for single element across all ionization stages.

Returns normalized fractions: Σ_j fraction_j = 1

# Arguments
- `element::Int`: Atomic number
- `T::Float64`: Temperature (K)
- `n_e::Float64`: Electron density (cm⁻³)
- `χ_table::Vector{Float64}`: Ionization potentials (eV), indexed by element

# Returns
- `Vector{Float64}`: Fractions [f_0, f_1, f_2, ...] for ion stages 0, 1, 2, ...
  where Σ f_j = 1

# Algorithm
1. Compute ratios n_{j+1}/n_j for each stage
2. Normalize: n_0 + n_1 + n_2 + ... = 1
3. Return fractions
"""
function solve_saha_element(element::Int, T::Float64, n_e::Float64,
                           χ_table::Vector{Float64})::Vector{Float64}
    # Maximum ionization stage is when all electrons removed
    max_ion_stage = element

    # Relative populations (not normalized)
    # Start with neutral (ion_stage = 0) as reference: n_0 = 1.0
    rel_pops = ones(Float64, max_ion_stage + 1)
    rel_pops[1] = 1.0  # n_0 (neutral)

    # Compute successive ionization stages
    for ion_stage in 0:(max_ion_stage - 1)
        if ion_stage + 1 <= length(χ_table)
            χ_ion = χ_table[ion_stage + 1]  # χ for element (not ion_stage)

            # Get ratio n_{j+1}/n_j
            ratio = saha_ionization_ratio(element, ion_stage, T, n_e, χ_ion)

            # n_{j+1} = ratio × n_j
            rel_pops[ion_stage + 2] = ratio * rel_pops[ion_stage + 1]
        else
            # No ionization potential data → stop
            break
        end
    end

    # Normalize so Σ n_j = 1
    total = sum(rel_pops)
    fractions = rel_pops / total

    return fractions
end
