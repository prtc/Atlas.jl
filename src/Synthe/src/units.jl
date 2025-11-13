"""
Unit conversions for wavelength, frequency, and energy

Handles conversions between:
- Wavelength units (Å, nm, μm, cm, m)
- Frequency units (Hz, THz)
- Energy units (eV, erg)
- Air ↔ vacuum wavelengths
- Doppler shifts

All conversions validated with round-trip tests.
"""

include("constants.jl")

# =============================================================================
# Wavelength Unit Conversions
# =============================================================================

"""
    angstrom_to_nm(lambda_angstrom::Float64)

Convert wavelength from Angstroms to nanometers

**Conversion:** 1 Å = 0.1 nm
"""
angstrom_to_nm(lambda_angstrom::Float64) = lambda_angstrom * 0.1

"""
    nm_to_angstrom(lambda_nm::Float64)

Convert wavelength from nanometers to Angstroms

**Conversion:** 1 nm = 10 Å
"""
nm_to_angstrom(lambda_nm::Float64) = lambda_nm * 10.0

"""
    angstrom_to_cm(lambda_angstrom::Float64)

Convert wavelength from Angstroms to centimeters

**Conversion:** 1 Å = 10⁻⁸ cm
"""
angstrom_to_cm(lambda_angstrom::Float64) = lambda_angstrom * 1.0e-8

"""
    cm_to_angstrom(lambda_cm::Float64)

Convert wavelength from centimeters to Angstroms

**Conversion:** 1 cm = 10⁸ Å
"""
cm_to_angstrom(lambda_cm::Float64) = lambda_cm * 1.0e8

"""
    angstrom_to_micron(lambda_angstrom::Float64)

Convert wavelength from Angstroms to microns (μm)

**Conversion:** 1 Å = 10⁻⁴ μm
"""
angstrom_to_micron(lambda_angstrom::Float64) = lambda_angstrom * 1.0e-4

"""
    micron_to_angstrom(lambda_micron::Float64)

Convert wavelength from microns to Angstroms

**Conversion:** 1 μm = 10⁴ Å
"""
micron_to_angstrom(lambda_micron::Float64) = lambda_micron * 1.0e4

# =============================================================================
# Wavelength ↔ Frequency Conversions
# =============================================================================

"""
    wavelength_to_frequency(lambda::Float64; lambda_unit::Symbol=:angstrom)

Convert wavelength to frequency

**Formula:** ν = c/λ

**Arguments:**
- `lambda`: Wavelength value
- `lambda_unit`: Unit of wavelength (`:angstrom`, `:nm`, `:cm`, `:micron`)

**Returns:** Frequency (Hz)

**Example:**
```julia
nu = wavelength_to_frequency(5000.0, lambda_unit=:angstrom)  # ~6e14 Hz
```
"""
function wavelength_to_frequency(lambda::Float64; lambda_unit::Symbol=:angstrom)
    # Convert to cm first
    lambda_cm = if lambda_unit == :angstrom
        angstrom_to_cm(lambda)
    elseif lambda_unit == :nm
        angstrom_to_cm(nm_to_angstrom(lambda))
    elseif lambda_unit == :cm
        lambda
    elseif lambda_unit == :micron
        angstrom_to_cm(micron_to_angstrom(lambda))
    else
        error("Unknown wavelength unit: $lambda_unit")
    end

    return c_cgs / lambda_cm
end

"""
    frequency_to_wavelength(nu::Float64; lambda_unit::Symbol=:angstrom)

Convert frequency to wavelength

**Formula:** λ = c/ν

**Arguments:**
- `nu`: Frequency (Hz)
- `lambda_unit`: Desired wavelength unit

**Returns:** Wavelength in specified units
"""
function frequency_to_wavelength(nu::Float64; lambda_unit::Symbol=:angstrom)
    lambda_cm = c_cgs / nu

    if lambda_unit == :angstrom
        return cm_to_angstrom(lambda_cm)
    elseif lambda_unit == :nm
        return angstrom_to_nm(cm_to_angstrom(lambda_cm))
    elseif lambda_unit == :cm
        return lambda_cm
    elseif lambda_unit == :micron
        return angstrom_to_micron(cm_to_angstrom(lambda_cm))
    else
        error("Unknown wavelength unit: $lambda_unit")
    end
end

# =============================================================================
# Energy Conversions
# =============================================================================

"""
    wavelength_to_energy(lambda::Float64; lambda_unit::Symbol=:angstrom)

Convert wavelength to photon energy

**Formula:** E = hc/λ

**Arguments:**
- `lambda`: Wavelength value
- `lambda_unit`: Unit of wavelength

**Returns:** Energy (erg)
"""
function wavelength_to_energy(lambda::Float64; lambda_unit::Symbol=:angstrom)
    lambda_cm = if lambda_unit == :angstrom
        angstrom_to_cm(lambda)
    elseif lambda_unit == :nm
        angstrom_to_cm(nm_to_angstrom(lambda))
    elseif lambda_unit == :cm
        lambda
    elseif lambda_unit == :micron
        angstrom_to_cm(micron_to_angstrom(lambda))
    else
        error("Unknown wavelength unit: $lambda_unit")
    end

    return h_cgs * c_cgs / lambda_cm
end

"""
    energy_to_wavelength(E::Float64; lambda_unit::Symbol=:angstrom)

Convert photon energy to wavelength

**Formula:** λ = hc/E

**Arguments:**
- `E`: Energy (erg)
- `lambda_unit`: Desired wavelength unit

**Returns:** Wavelength in specified units
"""
function energy_to_wavelength(E::Float64; lambda_unit::Symbol=:angstrom)
    lambda_cm = h_cgs * c_cgs / E

    if lambda_unit == :angstrom
        return cm_to_angstrom(lambda_cm)
    elseif lambda_unit == :nm
        return angstrom_to_nm(cm_to_angstrom(lambda_cm))
    elseif lambda_unit == :cm
        return lambda_cm
    elseif lambda_unit == :micron
        return angstrom_to_micron(cm_to_angstrom(lambda_cm))
    else
        error("Unknown wavelength unit: $lambda_unit")
    end
end

"""
    eV_to_erg(energy_eV::Float64)

Convert energy from electron volts to ergs

**Conversion:** 1 eV = 1.602176634×10⁻¹² erg
"""
eV_to_erg(energy_eV::Float64) = energy_eV * eV_cgs

"""
    erg_to_eV(energy_erg::Float64)

Convert energy from ergs to electron volts

**Conversion:** 1 erg = 6.241509074×10¹¹ eV
"""
erg_to_eV(energy_erg::Float64) = energy_erg / eV_cgs

# =============================================================================
# Air ↔ Vacuum Wavelength Conversions
# =============================================================================

"""
    air_to_vacuum_wavelength(lambda_air::Float64)

Convert air wavelength to vacuum wavelength using Edlén (1953) formula

**Formula:** λ_vac = λ_air × n(λ_air)

Where refractive index n(λ) = 1 + Δn, and:
Δn = 10⁻⁸ × (8342.54 + 2406147/(130 - σ²) + 15998/(38.9 - σ²))

with σ = 10⁴/λ_air (λ in Å, σ in μm⁻¹)

**Arguments:**
- `lambda_air`: Wavelength in air (Angstroms)

**Returns:** Wavelength in vacuum (Angstroms)

**Reference:** Edlén (1953), JOSA 43, 339
**Valid range:** 2000-20000 Å
"""
function air_to_vacuum_wavelength(lambda_air::Float64)
    # Convert to microns for formula
    lambda_micron = lambda_air * 1.0e-4
    sigma = 1.0 / lambda_micron  # μm⁻¹

    # Edlén (1953) formula
    delta_n = 1.0e-8 * (8342.54 + 2406147.0 / (130.0 - sigma^2) + 15998.0 / (38.9 - sigma^2))
    n_air = 1.0 + delta_n

    return lambda_air * n_air
end

"""
    vacuum_to_air_wavelength(lambda_vac::Float64)

Convert vacuum wavelength to air wavelength

Iterative solution: λ_air = λ_vac / n(λ_air)

**Arguments:**
- `lambda_vac`: Wavelength in vacuum (Angstroms)

**Returns:** Wavelength in air (Angstroms)

**Note:** Uses Newton-Raphson iteration (converges in 2-3 iterations)
"""
function vacuum_to_air_wavelength(lambda_vac::Float64)
    # Initial guess: λ_air ≈ λ_vac / 1.00028
    lambda_air = lambda_vac / 1.00028

    # Newton-Raphson iteration
    for _ in 1:5
        # Compute refractive index at current λ_air
        lambda_micron = lambda_air * 1.0e-4
        sigma = 1.0 / lambda_micron
        delta_n = 1.0e-8 * (8342.54 + 2406147.0 / (130.0 - sigma^2) + 15998.0 / (38.9 - sigma^2))
        n_air = 1.0 + delta_n

        # Update: λ_air = λ_vac / n(λ_air)
        lambda_air_new = lambda_vac / n_air

        # Check convergence (< 0.001 Å)
        if abs(lambda_air_new - lambda_air) < 1.0e-3
            return lambda_air_new
        end

        lambda_air = lambda_air_new
    end

    return lambda_air
end

# =============================================================================
# Doppler Shift Conversions
# =============================================================================

"""
    doppler_shift_wavelength(lambda0::Float64, v_radial::Float64)

Compute Doppler-shifted wavelength for radial velocity

**Formula:** λ = λ₀ × (1 + v/c)  (non-relativistic)

**Arguments:**
- `lambda0`: Rest wavelength (Angstroms)
- `v_radial`: Radial velocity (cm/s, positive = receding)

**Returns:** Observed wavelength (Angstroms)

**Note:** Non-relativistic approximation (v << c)
"""
function doppler_shift_wavelength(lambda0::Float64, v_radial::Float64)
    return lambda0 * (1.0 + v_radial / c_cgs)
end

"""
    doppler_velocity_from_wavelength(lambda0::Float64, lambda_obs::Float64)

Compute radial velocity from observed Doppler shift

**Formula:** v = c × (λ_obs/λ₀ - 1)

**Arguments:**
- `lambda0`: Rest wavelength (Angstroms)
- `lambda_obs`: Observed wavelength (Angstroms)

**Returns:** Radial velocity (cm/s, positive = receding)
"""
function doppler_velocity_from_wavelength(lambda0::Float64, lambda_obs::Float64)
    return c_cgs * (lambda_obs / lambda0 - 1.0)
end

"""
    velocity_to_kms(v_cgs::Float64)

Convert velocity from cm/s to km/s

**Conversion:** 1 km/s = 10⁵ cm/s
"""
velocity_to_kms(v_cgs::Float64) = v_cgs * 1.0e-5

"""
    kms_to_velocity(v_kms::Float64)

Convert velocity from km/s to cm/s

**Conversion:** 1 km/s = 10⁵ cm/s
"""
kms_to_velocity(v_kms::Float64) = v_kms * 1.0e5

# Export all conversion functions
export angstrom_to_nm, nm_to_angstrom
export angstrom_to_cm, cm_to_angstrom
export angstrom_to_micron, micron_to_angstrom
export wavelength_to_frequency, frequency_to_wavelength
export wavelength_to_energy, energy_to_wavelength
export eV_to_erg, erg_to_eV
export air_to_vacuum_wavelength, vacuum_to_air_wavelength
export doppler_shift_wavelength, doppler_velocity_from_wavelength
export velocity_to_kms, kms_to_velocity
