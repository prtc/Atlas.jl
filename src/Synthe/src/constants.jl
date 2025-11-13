"""
Physical constants in CGS units for stellar atmosphere calculations

All constants match ATLAS12/SYNTHE Fortran codes exactly.
Based on CODATA 2018 recommended values where applicable.

**Units**: CGS (centimeter-gram-second) system throughout
"""

# Fundamental constants
const c_cgs = 2.99792458e10       # Speed of light (cm/s)
const h_cgs = 6.62607015e-27      # Planck constant (erg·s)
const k_B_cgs = 1.380649e-16      # Boltzmann constant (erg/K)
const G_cgs = 6.67430e-8          # Gravitational constant (cm³/g/s²)

# Particle masses
const m_e_cgs = 9.1093837015e-28  # Electron mass (g)
const m_p_cgs = 1.67262192369e-24 # Proton mass (g)
const m_H_cgs = 1.673534e-24      # Hydrogen atom mass (g)
const amu_cgs = 1.66053906660e-24 # Atomic mass unit (g)

# Electromagnetic constants
const e_cgs = 4.80320425e-10      # Elementary charge (esu, Gaussian units)
const eV_cgs = 1.602176634e-12    # Electron volt (erg)

# Radiation constants
const sigma_SB_cgs = 5.670374419e-5  # Stefan-Boltzmann constant (erg/cm²/s/K⁴)
const a_rad_cgs = 7.5657e-15          # Radiation density constant (erg/cm³/K⁴)
const sigma_T_cgs = 6.6524587321e-25  # Thomson cross-section (cm²)

# Astronomical constants
const M_sun_cgs = 1.98892e33      # Solar mass (g)
const R_sun_cgs = 6.957e10        # Solar radius (cm)
const L_sun_cgs = 3.828e33        # Solar luminosity (erg/s)
const au_cgs = 1.495978707e13     # Astronomical unit (cm)
const pc_cgs = 3.085677581e18     # Parsec (cm)

# Derived constants commonly used in ATLAS/SYNTHE

"""
    classical_electron_radius()

Classical electron radius r₀ = e²/(mₑc²) in cm
"""
classical_electron_radius() = e_cgs^2 / (m_e_cgs * c_cgs^2)

"""
    bohr_radius()

Bohr radius a₀ = ℏ²/(mₑe²) in cm
"""
bohr_radius() = (h_cgs / (2π))^2 / (m_e_cgs * e_cgs^2)

"""
    rydberg_energy()

Rydberg energy in erg (13.6 eV)
"""
rydberg_energy() = 13.605693122994 * eV_cgs

"""
    rydberg_frequency()

Rydberg frequency ν∞ = Ry/h in Hz
"""
rydberg_frequency() = rydberg_energy() / h_cgs

"""
    fine_structure_constant()

Fine structure constant α = e²/(ℏc) (dimensionless)
"""
fine_structure_constant() = e_cgs^2 / ((h_cgs / (2π)) * c_cgs)

"""
    saha_constant(T::Float64, n_e::Float64)

Saha equation constant for ionization equilibrium

CF = 2 × (2πmₑkT/h²)^(3/2) / nₑ

**Arguments:**
- `T`: Temperature (K)
- `n_e`: Electron density (cm⁻³)

**Returns:** Saha constant (cm³)

**Formula:** `CF = 2 × 2.4148e15 × T^(3/2) / n_e`
"""
function saha_constant(T::Float64, n_e::Float64)
    # Saha constant prefactor: 2 × (2πmₑk/h²)^(3/2)
    saha_prefactor = 2.0 * 2.4148e15  # cm⁻³ K⁻³/²
    return saha_prefactor * T^1.5 / n_e
end

"""
    planck_function(nu::Float64, T::Float64)

Planck function for blackbody radiation

B_ν(T) = (2hν³/c²) / [exp(hν/kT) - 1]

**Arguments:**
- `nu`: Frequency (Hz)
- `T`: Temperature (K)

**Returns:** Specific intensity (erg/s/cm²/Hz/sr)
"""
function planck_function(nu::Float64, T::Float64)
    x = h_cgs * nu / (k_B_cgs * T)
    if x > 100.0
        # Wien limit: exp(-x) dominates, avoid overflow
        return (2.0 * h_cgs * nu^3 / c_cgs^2) * exp(-x)
    else
        return (2.0 * h_cgs * nu^3 / c_cgs^2) / (exp(x) - 1.0)
    end
end

"""
    planck_function_wavelength(lambda::Float64, T::Float64)

Planck function in wavelength units

B_λ(T) = (2hc²/λ⁵) / [exp(hc/λkT) - 1]

**Arguments:**
- `lambda`: Wavelength (cm)
- `T`: Temperature (K)

**Returns:** Specific intensity (erg/s/cm²/cm/sr)
"""
function planck_function_wavelength(lambda::Float64, T::Float64)
    x = h_cgs * c_cgs / (lambda * k_B_cgs * T)
    if x > 100.0
        return (2.0 * h_cgs * c_cgs^2 / lambda^5) * exp(-x)
    else
        return (2.0 * h_cgs * c_cgs^2 / lambda^5) / (exp(x) - 1.0)
    end
end

"""
    wien_displacement_wavelength(T::Float64)

Wien displacement law: λ_max = b/T

**Arguments:**
- `T`: Temperature (K)

**Returns:** Peak wavelength (cm)

**Constant:** b = 0.2897771955 cm·K
"""
wien_displacement_wavelength(T::Float64) = 0.2897771955 / T

"""
    wien_displacement_frequency(T::Float64)

Wien displacement law: ν_max = c₁·T

**Arguments:**
- `T`: Temperature (K)

**Returns:** Peak frequency (Hz)

**Constant:** c₁ = 5.878925757e10 Hz/K
"""
wien_displacement_frequency(T::Float64) = 5.878925757e10 * T

# Export all constants and functions
export c_cgs, h_cgs, k_B_cgs, G_cgs
export m_e_cgs, m_p_cgs, m_H_cgs, amu_cgs
export e_cgs, eV_cgs
export sigma_SB_cgs, a_rad_cgs, sigma_T_cgs
export M_sun_cgs, R_sun_cgs, L_sun_cgs, au_cgs, pc_cgs
export classical_electron_radius, bohr_radius
export rydberg_energy, rydberg_frequency, fine_structure_constant
export saha_constant
export planck_function, planck_function_wavelength
export wien_displacement_wavelength, wien_displacement_frequency
