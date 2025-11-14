"""
Line opacity integration - combining Voigt profiles with populations

Implements line absorption coefficient calculation weighted by level populations.

Functions:
- boltzmann_level_population() - Boltzmann distribution for excitation
- line_absorption_coefficient() - κ_line for single line
- accumulate_line_opacity() - Sum over all lines near wavelength
- total_opacity_with_lines() - Continuum + line opacity

Physics:
- Boltzmann equation: n_lower = (n_ion × g_lower / Z) × exp(-E_lower/kT)
- Line absorption: κ_line = (πe²/m_e c) × f × n_lower × φ(ν)
- Voigt profile: φ(ν) from Step 1

References:
- Gray (2005) Chapter 11 "The Line Absorption Coefficient"
- Mihalas (1978) Chapter 10
- Hubeny & Mihalas (2014) Chapter 8

Author: Claude (Local), Paula Coelho
Date: 2025-11-14
"""

# Load physical constants
include("constants.jl")

"""
    boltzmann_level_population(E_lower::Float64, g_lower::Float64, T::Float64,
                               Z::Float64, n_ion::Float64) -> Float64

Compute level population using Boltzmann distribution.

For a given ionization stage, the population of excitation level i is:

    n_i = (n_ion × g_i / Z) × exp(-E_i / kT)

where:
- n_ion = total density of this ionization stage (from POPS)
- g_i = statistical weight of level i
- Z = partition function
- E_i = excitation energy (cm⁻¹ or eV)

# Arguments
- `E_lower::Float64`: Lower level energy (cm⁻¹)
- `g_lower::Float64`: Statistical weight g = 2J + 1
- `T::Float64`: Temperature (K)
- `Z::Float64`: Partition function for this ion
- `n_ion::Float64`: Number density of this ionization stage (cm⁻³)

# Returns
- `Float64`: Level population n_lower (cm⁻³)

# Example
```julia
# Fe I level at E = 7000 cm⁻¹, g = 11
n_FeI = 1.0e12  # cm⁻³ (from POPS)
Z_FeI = 25.0
E_lower = 7000.0  # cm⁻¹
g_lower = 11.0

n_lower = boltzmann_level_population(E_lower, g_lower, 5777.0, Z_FeI, n_FeI)
```
"""
function boltzmann_level_population(E_lower::Float64, g_lower::Float64, T::Float64,
                                    Z::Float64, n_ion::Float64)::Float64
    # Boltzmann factor: exp(-E/kT)
    # E is in cm⁻¹, need to convert to erg
    const h = h_cgs  # 6.62607015e-27 erg·s
    const c = c_cgs  # 2.99792458e10 cm/s
    const k = k_B_cgs  # 1.380649e-16 erg/K

    # Convert E from cm⁻¹ to erg: E_erg = h × c × E_cm
    E_erg = h * c * E_lower

    # Boltzmann distribution
    boltz_factor = exp(-E_erg / (k * T))

    # Level population
    n_lower = (n_ion * g_lower / Z) * boltz_factor

    return n_lower
end

"""
    line_absorption_coefficient(λ::Float64, line::SpectralLine, T::Float64,
                                n_lower::Float64, v_turb::Float64=2.0e5) -> Float64

Compute line absorption coefficient κ_line at wavelength λ.

The line absorption coefficient is:

    κ_line(λ) = (πe²/m_e c) × f × n_lower × φ(λ)

where:
- f = oscillator strength (from gf value)
- n_lower = lower level population (cm⁻³)
- φ(λ) = line profile (Voigt function, cm)

# Arguments
- `λ::Float64`: Wavelength (Å)
- `line::SpectralLine`: Line data (wavelength, loggf, damping, energies)
- `T::Float64`: Temperature (K)
- `n_lower::Float64`: Lower level population (cm⁻³)
- `v_turb::Float64`: Microturbulent velocity (cm/s), default 2 km/s

# Returns
- `Float64`: Line absorption coefficient κ_line (cm⁻¹)

# Example
```julia
κ_line = line_absorption_coefficient(5000.5, fe_line, 5777.0, n_lower)
```
"""
function line_absorption_coefficient(λ::Float64, line::SpectralLine, T::Float64,
                                     n_lower::Float64, v_turb::Float64=2.0e5)::Float64
    # Line center wavelength
    λ_0 = line.wavelength

    # Oscillator strength from log(gf)
    gf = 10^line.loggf
    f = gf / (2.0 * line.j_lower + 1.0)  # f = gf / g_lower

    # Doppler width (thermal + turbulent)
    # For now, use simplified version (would need atomic mass)
    # Δλ_D = (λ_0 / c) × sqrt(2kT/m + v_turb²)
    # Simplified: assume iron (m ≈ 56 amu)
    const amu = 1.66053906660e-24  # g
    m_atom = 56.0 * amu  # Rough estimate

    const k = k_B_cgs
    const c = c_cgs

    v_thermal = sqrt(2.0 * k * T / m_atom)
    v_total = sqrt(v_thermal^2 + v_turb^2)

    Δλ_D = (λ_0 / c) * v_total

    # Damping parameter a = γ / (4π Δν_D)
    # γ_total = γ_rad + γ_stark + γ_vdw
    γ_total = line.gamma_rad + line.gamma_stark + line.gamma_vdw

    # Convert to frequency domain for Voigt
    Δν_D = c / (λ_0 * 1.0e-8)^2 * (Δλ_D * 1.0e-8)  # Hz

    a = γ_total / (4.0 * π * Δν_D)

    # Frequency offset in Doppler widths
    # v = (λ - λ_0) / Δλ_D (wavelength units)
    v = (λ - λ_0) / Δλ_D

    # Voigt profile H(v, a) - use function from Step 1
    H = voigt_profile(v, a)

    # Line profile normalized: φ(λ) = H(v,a) / (Δλ_D × sqrt(π))
    φ_λ = H / (Δλ_D * 1.0e-8 * sqrt(π))  # cm⁻¹ (in wavelength)

    # Absorption coefficient
    const e = e_cgs  # 4.80320425e-10 esu
    const m_e = m_e_cgs  # 9.1093837015e-28 g

    # κ_line = (πe²/m_e c) × f × n_lower × φ(λ)
    const_factor = (π * e^2) / (m_e * c)

    κ_line = const_factor * f * n_lower * φ_λ

    return max(0.0, κ_line)
end

"""
    accumulate_line_opacity(λ::Float64, lines::Vector{SpectralLine},
                           T::Float64, pops::PopulationResult,
                           cutoff::Float64=10.0, v_turb::Float64=2.0e5) -> Float64

Accumulate line opacity from all lines within cutoff distance.

Sum κ_line for all lines where |λ - λ_0| < cutoff Å.

# Arguments
- `λ::Float64`: Wavelength (Å)
- `lines::Vector{SpectralLine}`: All spectral lines
- `T::Float64`: Temperature (K)
- `pops::PopulationResult`: Populations from POPS
- `cutoff::Float64`: Only include lines within ±cutoff Å (default 10 Å)
- `v_turb::Float64`: Microturbulent velocity (cm/s)

# Returns
- `Float64`: Total line opacity κ_line (cm⁻¹)

# Example
```julia
κ_line_total = accumulate_line_opacity(5000.0, lines, 5777.0, pops)
```
"""
function accumulate_line_opacity(λ::Float64, lines::Vector{SpectralLine},
                                T::Float64, pops::PopulationResult,
                                cutoff::Float64=10.0, v_turb::Float64=2.0e5)::Float64
    κ_line_total = 0.0

    for line in lines
        # Only consider lines within cutoff distance
        if abs(line.wavelength - λ) > cutoff
            continue
        end

        # Extract element and ion stage from element_ion code
        # Format: 26.00 = Fe I, 26.01 = Fe II
        element = floor(Int, line.element_ion)
        ion_stage = round(Int, (line.element_ion - element) * 100)

        # Get ion population from POPS result
        if !haskey(pops.number_densities, (element, ion_stage))
            continue  # This ion not present
        end

        n_ion = pops.number_densities[(element, ion_stage)]

        # Partition function for this ion (from Step 3)
        Z = partition_function(element, ion_stage, T)

        # Boltzmann population of lower level
        E_lower = line.e_lower  # cm⁻¹
        g_lower = 2.0 * line.j_lower + 1.0

        n_lower = boltzmann_level_population(E_lower, g_lower, T, Z, n_ion)

        # Line absorption coefficient
        κ_line = line_absorption_coefficient(λ, line, T, n_lower, v_turb)

        κ_line_total += κ_line
    end

    return κ_line_total
end

"""
    total_opacity_with_lines(λ::Float64, T::Float64, P_e::Float64,
                            pops::PopulationResult, lines::Vector{SpectralLine},
                            cutoff::Float64=10.0) -> Float64

Compute total opacity (continuum + lines).

    κ_total = κ_continuum + κ_lines

# Arguments
- `λ::Float64`: Wavelength (Å)
- `T::Float64`: Temperature (K)
- `P_e::Float64`: Electron pressure (dyne/cm²)
- `pops::PopulationResult`: Populations
- `lines::Vector{SpectralLine}`: Spectral lines
- `cutoff::Float64`: Line cutoff distance (Å)

# Returns
- `Float64`: Total opacity κ_total (cm⁻¹)

# Example
```julia
κ = total_opacity_with_lines(5000.0, 5777.0, 1.0e3, pops, lines)
```
"""
function total_opacity_with_lines(λ::Float64, T::Float64, P_e::Float64,
                                  pops::PopulationResult, lines::Vector{SpectralLine},
                                  cutoff::Float64=10.0)::Float64
    # Continuum opacity (from Step 3)
    κ_cont = continuum_opacity_total(λ, T, P_e, pops)

    # Line opacity
    κ_line = accumulate_line_opacity(λ, lines, T, pops, cutoff)

    # Total
    κ_total = κ_cont + κ_line

    return κ_total
end
