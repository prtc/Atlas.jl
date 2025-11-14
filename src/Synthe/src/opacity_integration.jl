"""
Opacity integration (continuum + line) weighted by populations

Implements Pure Julia equivalent of atlas7v KAPP subroutine.

Functions:
- continuum_opacity_total() - Sum all continuum sources, weighted by populations
- total_opacity() - Combine continuum + line opacity

Physics:
- Continuum sources: H⁻ bf/ff, H I bf, electron scattering (from Step 2)
- Population weighting: Use densities from population solver (Task 3.1)
- Line opacity: Framework for future line integration

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
    continuum_opacity_total(λ::Float64, T::Float64, P_e::Float64,
                           pops::PopulationResult) -> Float64

Compute total continuum opacity at given wavelength and atmospheric conditions.

Combines all continuum sources weighted by populations:
- H⁻ bound-free (n_HI × n_e × σ_bf)
- H⁻ free-free (n_HI × n_e × σ_ff)
- H I bound-free for n=1,2,3,4,5 (Lyman through Pfund series)
- Electron scattering (Thomson, wavelength-independent)

# Arguments
- `λ::Float64`: Wavelength (Å)
- `T::Float64`: Temperature (K)
- `P_e::Float64`: Electron pressure (dyne/cm²)
- `pops::PopulationResult`: Population result from compute_populations()

# Returns
- `Float64`: Total continuum opacity κ_continuum (cm⁻¹)

# Physics
The continuum opacity is the sum of all absorption and scattering processes:

    κ_continuum = κ(H⁻ bf) + κ(H⁻ ff) + κ(H I bf) + κ(e⁻ scattering)

Each opacity is weighted by the density of the absorbing species:
- H⁻: Proportional to n(H I) × n_e (requires neutral H + free electron)
- H I: Proportional to n(H I) (photoionization from bound levels)
- Scattering: Proportional to n_e (Thomson scattering)

# Implementation Notes
- Uses continuum opacity functions from Step 2 (continuum_opacity.jl)
- Population densities from Task 3.1 (populations.jl)
- H I bound-free sums contributions from n=1 through n=5 levels
- Returns total in cm⁻¹ (per unit length)

# Example
```julia
# Solar photosphere
abundances = zeros(30)
abundances[1] = 12.0  # H

pops = compute_populations(5777.0, 1.0e5, abundances)
κ = continuum_opacity_total(5000.0, 5777.0, 1.0e3, pops)

println("Continuum opacity at 5000Å: ", κ, " cm⁻¹")
```
"""
function continuum_opacity_total(λ::Float64, T::Float64, P_e::Float64,
                                pops::PopulationResult)::Float64
    # Extract electron density and populations
    n_e = pops.n_e

    # Hydrogen populations (need both neutral and ionized)
    # Check if keys exist (they should from population solver)
    if !haskey(pops.number_densities, (1, 0))
        throw(ArgumentError("H I population not found in PopulationResult"))
    end

    n_HI = pops.number_densities[(1, 0)]   # H I (neutral hydrogen)

    # H II is optional (fully ionized regions might not have it)
    # n_HII = haskey(pops.number_densities, (1, 1)) ? pops.number_densities[(1, 1)] : 0.0

    # === 1. H⁻ Opacity ===
    # H⁻ forms from H I + e⁻, so opacity ∝ n_HI × n_e
    # Cross-sections from continuum_opacity.jl (Step 2)

    σ_hminus_bf = hminus_bf(λ, T, P_e)
    σ_hminus_ff = hminus_ff(λ, T, P_e)

    # Opacity = density × cross-section
    # For H⁻: need both H I and free electron, so ∝ n_HI × n_e
    # But hminus_bf/ff already account for thermodynamic equilibrium
    # Just multiply by neutral H density
    κ_hminus_bf = n_HI * σ_hminus_bf
    κ_hminus_ff = n_HI * σ_hminus_ff

    # === 2. H I Bound-Free Opacity ===
    # Photoionization from bound levels n=1,2,3,4,5
    # Each level contributes based on its population (Boltzmann distribution)
    # For now: use total n_HI (simplification - should use level populations)

    κ_h1_bf = 0.0
    for n_level in 1:5  # Lyman, Balmer, Paschen, Brackett, Pfund
        σ_h1 = hydrogen_bf(λ, T, n_level)

        # Weight by level population (simplified: equal weight for now)
        # In full implementation: use Boltzmann equation for level populations
        # For now: total H I density distributed across levels
        κ_h1_bf += n_HI * σ_h1 / 5.0  # Simplified equal distribution
    end

    # === 3. Electron Scattering ===
    # Thomson scattering: wavelength-independent
    κ_es = electron_scattering(n_e)

    # === 4. Sum All Sources ===
    κ_total = κ_hminus_bf + κ_hminus_ff + κ_h1_bf + κ_es

    return max(0.0, κ_total)  # Ensure non-negative
end

"""
    total_opacity(λ::Float64, T::Float64, P_e::Float64,
                  pops::PopulationResult, lines::Vector{SpectralLine}) -> Float64

Compute total opacity (continuum + line) at given wavelength.

Combines:
1. Continuum opacity from all sources (Task 3.2.1)
2. Line opacity from spectral lines (future: Task 3.2.2)

# Arguments
- `λ::Float64`: Wavelength (Å)
- `T::Float64`: Temperature (K)
- `P_e::Float64`: Electron pressure (dyne/cm²)
- `pops::PopulationResult`: Population result from compute_populations()
- `lines::Vector{SpectralLine}`: List of spectral lines

# Returns
- `Float64`: Total opacity κ_total = κ_continuum + κ_line (cm⁻¹)

# Physics
The total opacity is the sum of all processes:

    κ_total(λ) = κ_continuum(λ) + κ_line(λ)

where:
- κ_continuum: H⁻, H I, scattering (wavelength-smooth)
- κ_line: Line absorption (sharp features)

# Implementation Status
- ✅ Continuum opacity: Fully implemented
- 🚧 Line opacity: Basic framework (to be expanded in future tasks)

# Example
```julia
# Solar spectrum synthesis
pops = compute_populations(5777.0, 1.0e5, abundances)
lines = read_gfall_lines("gfall.dat")

# Wavelength scan
for λ in 5000.0:0.1:5100.0
    κ = total_opacity(λ, 5777.0, 1.0e3, pops, lines)
    # ... use in radiative transfer
end
```
"""
function total_opacity(λ::Float64, T::Float64, P_e::Float64,
                      pops::PopulationResult,
                      lines::Vector{SpectralLine})::Float64
    # 1. Continuum opacity (always present)
    κ_continuum = continuum_opacity_total(λ, T, P_e, pops)

    # 2. Line opacity (to be implemented in future tasks)
    # For now: return 0 (lines not yet integrated)
    # Future: compute Voigt profiles for each line, weighted by populations
    κ_line = 0.0

    # Placeholder for line opacity calculation:
    # for line in lines
    #     if abs(line.wavelength_air - λ) < 10.0  # Within 10Å
    #         # Get lower level population from pops
    #         # Compute Voigt profile
    #         # Add to κ_line
    #     end
    # end

    # 3. Total
    κ_total = κ_continuum + κ_line

    return max(0.0, κ_total)
end

"""
    line_opacity_at_wavelength(λ::Float64, lines::Vector{SpectralLine},
                               T::Float64, pops::PopulationResult) -> Float64

Compute line opacity contribution at given wavelength (PLACEHOLDER).

This function will integrate line opacity using:
- Voigt profiles from Step 1
- Level populations from Boltzmann equation
- Ion populations from pops result

# Status
🚧 To be implemented in future tasks (Step 4: Radiative Transfer)

For now, returns 0.0 (continuum-only mode).

# Arguments
- `λ::Float64`: Wavelength (Å)
- `lines::Vector{SpectralLine}`: Spectral lines
- `T::Float64`: Temperature (K)
- `pops::PopulationResult`: Populations

# Returns
- `Float64`: Line opacity κ_line (cm⁻¹)
"""
function line_opacity_at_wavelength(λ::Float64, lines::Vector{SpectralLine},
                                   T::Float64, pops::PopulationResult)::Float64
    # Placeholder: to be implemented
    # Will use Voigt profiles and level populations
    return 0.0
end
