"""
Physics formulas for stellar atmosphere calculations

Core physics calculations used in SYNTHE spectrum synthesis:
- Doppler broadening (thermal + microturbulent)
- Damping parameters for Voigt profiles
- Boltzmann distribution
- Ideal gas law variants
- Optical depth calculations

All formulas match ATLAS12/SYNTHE Fortran implementations.
**Units**: CGS (centimeter-gram-second) system throughout
"""

# Load constants
include("constants.jl")

"""
    thermal_velocity(T::Float64, mass::Float64)

Calculate thermal velocity for Maxwell-Boltzmann distribution

v_thermal = √(2kT/m)

**Arguments:**
- `T`: Temperature (K)
- `mass`: Particle mass (g)

**Returns:** Thermal velocity (cm/s)

**Example:**
```julia
v_th = thermal_velocity(5000.0, m_H_cgs)  # Hydrogen at 5000K
```
"""
function thermal_velocity(T::Float64, mass::Float64)
    return sqrt(2.0 * k_B_cgs * T / mass)
end

"""
    doppler_width(lambda0::Float64, T::Float64, mass::Float64, xi::Float64=0.0)

Calculate Doppler width for spectral line broadening

Δλ_D = (λ₀/c) × √(2kT/m + ξ²)

where:
- λ₀ = rest wavelength
- T = temperature
- m = atomic mass
- ξ = microturbulent velocity

**Arguments:**
- `lambda0`: Rest wavelength (Å)
- `T`: Temperature (K)
- `mass`: Atomic mass (g)
- `xi`: Microturbulent velocity (cm/s), default 0.0

**Returns:** Doppler width Δλ_D (Å)

**Formula:** Combines thermal and turbulent broadening in quadrature
"""
function doppler_width(lambda0::Float64, T::Float64, mass::Float64, xi::Float64=0.0)
    # Thermal velocity contribution
    v_thermal_sq = 2.0 * k_B_cgs * T / mass

    # Total velocity squared (thermal + turbulent)
    v_total_sq = v_thermal_sq + xi^2

    # Doppler width: Δλ = (λ/c) × √(v²)
    return (lambda0 / c_cgs) * sqrt(v_total_sq)
end

"""
    doppler_width_frequency(nu0::Float64, T::Float64, mass::Float64, xi::Float64=0.0)

Calculate Doppler width in frequency units

Δν_D = (ν₀/c) × √(2kT/m + ξ²)

**Arguments:**
- `nu0`: Rest frequency (Hz)
- `T`: Temperature (K)
- `mass`: Atomic mass (g)
- `xi`: Microturbulent velocity (cm/s), default 0.0

**Returns:** Doppler width Δν_D (Hz)
"""
function doppler_width_frequency(nu0::Float64, T::Float64, mass::Float64, xi::Float64=0.0)
    v_thermal_sq = 2.0 * k_B_cgs * T / mass
    v_total_sq = v_thermal_sq + xi^2
    return (nu0 / c_cgs) * sqrt(v_total_sq)
end

"""
    damping_parameter(gamma_rad::Float64, gamma_stark::Float64, gamma_vdw::Float64,
                     delta_nu_D::Float64)

Calculate damping parameter 'a' for Voigt profile

a = (γ_rad + γ_stark + γ_vdW) / (4π × Δν_D)

where:
- γ_rad = radiative damping (natural broadening)
- γ_stark = Stark broadening (electric field)
- γ_vdW = van der Waals broadening (collisions)
- Δν_D = Doppler width in frequency

**Arguments:**
- `gamma_rad`: Radiative damping constant (Hz)
- `gamma_stark`: Stark damping constant (Hz)
- `gamma_vdw`: van der Waals damping constant (Hz)
- `delta_nu_D`: Doppler width (Hz)

**Returns:** Dimensionless damping parameter a

**Usage:** This parameter determines the Lorentzian wings in the Voigt profile
"""
function damping_parameter(gamma_rad::Float64, gamma_stark::Float64,
                          gamma_vdw::Float64, delta_nu_D::Float64)
    gamma_total = gamma_rad + gamma_stark + gamma_vdw
    return gamma_total / (4.0 * π * delta_nu_D)
end

"""
    radiative_damping(lambda0::Float64, f_value::Float64)

Calculate natural (radiative) damping constant (Einstein A coefficient)

γ_rad ≈ (8π²e²)/(m_e c λ²) × f

For typical solar lines: γ_rad ≈ 10⁷ - 10⁸ Hz

**Arguments:**
- `lambda0`: Rest wavelength (Å)
- `f_value`: Oscillator strength (dimensionless)

**Returns:** Radiative damping constant γ_rad (Hz)

**Formula:** Einstein A coefficient (classical approximation)
"""
function radiative_damping(lambda0::Float64, f_value::Float64)
    # Convert wavelength to cm
    lambda_cm = lambda0 * 1.0e-8

    # Radiative damping: γ = (8π²e²)/(m_e c λ²) × f
    gamma_rad = (8.0 * π^2 * e_cgs^2) / (m_e_cgs * c_cgs * lambda_cm^2) * f_value

    return gamma_rad
end

"""
    boltzmann_ratio(E_upper::Float64, E_lower::Float64, g_upper::Float64,
                   g_lower::Float64, T::Float64)

Calculate Boltzmann population ratio

n_upper/n_lower = (g_upper/g_lower) × exp(-(E_upper - E_lower)/(kT))

**Arguments:**
- `E_upper`: Upper level energy (erg)
- `E_lower`: Lower level energy (erg)
- `g_upper`: Upper level statistical weight (degeneracy)
- `g_lower`: Lower level statistical weight
- `T`: Temperature (K)

**Returns:** Population ratio n_upper/n_lower (dimensionless)

**Note:** For level energies in cm⁻¹, multiply by hc to convert to erg
"""
function boltzmann_ratio(E_upper::Float64, E_lower::Float64,
                        g_upper::Float64, g_lower::Float64, T::Float64)
    delta_E = E_upper - E_lower
    exponent = -delta_E / (k_B_cgs * T)

    # Avoid overflow for very large negative exponents
    if exponent < -100.0
        return 0.0
    end

    return (g_upper / g_lower) * exp(exponent)
end

"""
    boltzmann_ratio_wavenumber(chi_upper::Float64, chi_lower::Float64,
                              g_upper::Float64, g_lower::Float64, T::Float64)

Calculate Boltzmann ratio with energies in wavenumber units (cm⁻¹)

Converts cm⁻¹ to erg using E = h·c·χ

**Arguments:**
- `chi_upper`: Upper level energy (cm⁻¹)
- `chi_lower`: Lower level energy (cm⁻¹)
- `g_upper`: Upper level statistical weight
- `g_lower`: Lower level statistical weight
- `T`: Temperature (K)

**Returns:** Population ratio n_upper/n_lower
"""
function boltzmann_ratio_wavenumber(chi_upper::Float64, chi_lower::Float64,
                                   g_upper::Float64, g_lower::Float64, T::Float64)
    # Convert wavenumber to energy: E = h·c·χ
    E_upper = h_cgs * c_cgs * chi_upper
    E_lower = h_cgs * c_cgs * chi_lower

    return boltzmann_ratio(E_upper, E_lower, g_upper, g_lower, T)
end

"""
    partition_function_cutoff(E_max::Float64, T::Float64)

Calculate exponential cutoff factor for partition function truncation

exp(-E_max / kT)

**Arguments:**
- `E_max`: Maximum energy to include (erg)
- `T`: Temperature (K)

**Returns:** Cutoff factor (dimensionless)

**Usage:** Determines which energy levels contribute significantly to partition sum
"""
function partition_function_cutoff(E_max::Float64, T::Float64)
    exponent = -E_max / (k_B_cgs * T)

    # Return zero if too small to matter
    if exponent < -100.0
        return 0.0
    end

    return exp(exponent)
end

"""
    ideal_gas_pressure(T::Float64, n_total::Float64)

Calculate gas pressure from ideal gas law

P = n·k·T

**Arguments:**
- `T`: Temperature (K)
- `n_total`: Total particle number density (cm⁻³)

**Returns:** Pressure (dyne/cm²)

**Formula:** P = nkT (CGS units)
"""
function ideal_gas_pressure(T::Float64, n_total::Float64)
    return n_total * k_B_cgs * T
end

"""
    ideal_gas_density(P::Float64, T::Float64, mean_mass::Float64)

Calculate gas density from ideal gas law

ρ = (P·μ)/(k·T)

where μ is the mean particle mass

**Arguments:**
- `P`: Pressure (dyne/cm²)
- `T`: Temperature (K)
- `mean_mass`: Mean particle mass (g)

**Returns:** Mass density ρ (g/cm³)

**Formula:** ρ = P·μ/(kT)
"""
function ideal_gas_density(P::Float64, T::Float64, mean_mass::Float64)
    return (P * mean_mass) / (k_B_cgs * T)
end

"""
    ideal_gas_number_density(P::Float64, T::Float64)

Calculate number density from ideal gas law

n = P/(k·T)

**Arguments:**
- `P`: Pressure (dyne/cm²)
- `T`: Temperature (K)

**Returns:** Number density n (cm⁻³)
"""
function ideal_gas_number_density(P::Float64, T::Float64)
    return P / (k_B_cgs * T)
end

"""
    mean_molecular_weight(X_H::Float64, X_He::Float64, X_metals::Float64)

Calculate mean molecular weight for fully ionized stellar atmosphere

For fully ionized gas:
- H: 2 particles (p + e) per atom → mass per particle = m_H/2
- He: 3 particles (nucleus + 2e) per atom → mass per particle = 4m_H/3
- Metals: ~9 particles per atom (A/Z ≈ 2) → mass per particle ≈ 16m_H/9

μ = 1 / Σ(X_i / μ_i) = m_H / (2X_H + 0.75X_He + 0.56X_metals)

**Arguments:**
- `X_H`: Hydrogen mass fraction
- `X_He`: Helium mass fraction
- `X_metals`: Metals mass fraction

**Returns:** Mean molecular weight (g)

**Typical values:**
- Solar: X_H=0.73, X_He=0.25, X_metals=0.02 → μ ≈ 0.60 m_H
"""
function mean_molecular_weight(X_H::Float64, X_He::Float64, X_metals::Float64)
    # Mean molecular weight for fully ionized gas
    # 1/μ = 2X_H/m_H + 0.75X_He/m_H + 0.56X_metals/m_H
    mu_inv_normalized = 2.0 * X_H + 0.75 * X_He + 0.56 * X_metals

    return m_H_cgs / mu_inv_normalized
end

"""
    optical_depth_increment(kappa::Float64, rho::Float64, dz::Float64)

Calculate optical depth increment

dτ = κ·ρ·dz

**Arguments:**
- `kappa`: Opacity coefficient (cm²/g)
- `rho`: Mass density (g/cm³)
- `dz`: Geometric path length (cm)

**Returns:** Optical depth increment dτ (dimensionless)

**Usage:** Integrate dτ to get total optical depth τ
"""
function optical_depth_increment(kappa::Float64, rho::Float64, dz::Float64)
    return kappa * rho * dz
end

"""
    column_density(rho::Float64, dz::Float64)

Calculate column density

N = ρ·dz

**Arguments:**
- `rho`: Mass density (g/cm³)
- `dz`: Geometric path length (cm)

**Returns:** Column density (g/cm²)
"""
function column_density(rho::Float64, dz::Float64)
    return rho * dz
end

"""
    scale_height(T::Float64, g::Float64, mean_mass::Float64)

Calculate atmospheric scale height

H = kT/(μg)

where:
- μ = mean particle mass
- g = surface gravity

**Arguments:**
- `T`: Temperature (K)
- `g`: Surface gravity (cm/s²)
- `mean_mass`: Mean particle mass (g)

**Returns:** Scale height H (cm)

**Physical meaning:** Characteristic height over which pressure/density drop by e
"""
function scale_height(T::Float64, g::Float64, mean_mass::Float64)
    return (k_B_cgs * T) / (mean_mass * g)
end

"""
    sound_speed(T::Float64, mean_mass::Float64, gamma::Float64=5.0/3.0)

Calculate adiabatic sound speed

c_s = √(γkT/μ)

**Arguments:**
- `T`: Temperature (K)
- `mean_mass`: Mean particle mass (g)
- `gamma`: Adiabatic index (default 5/3 for ideal monatomic gas)

**Returns:** Sound speed (cm/s)
"""
function sound_speed(T::Float64, mean_mass::Float64, gamma::Float64=5.0/3.0)
    return sqrt(gamma * k_B_cgs * T / mean_mass)
end

# Export all physics functions
export thermal_velocity, doppler_width, doppler_width_frequency
export damping_parameter, radiative_damping
export boltzmann_ratio, boltzmann_ratio_wavenumber
export partition_function_cutoff
export ideal_gas_pressure, ideal_gas_density, ideal_gas_number_density
export mean_molecular_weight
export optical_depth_increment, column_density
export scale_height, sound_speed
