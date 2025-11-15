"""
Core data structures for Synthe pipeline
"""

"""
    SpectralLine

Represents a single spectral line (atomic or molecular)

Fields from fort.12 binary format (see Deep Dive 12):
- `nbuff::Int`: Wavelength index in logarithmic grid
- `wavelength::Float64`: Wavelength in Angstroms (vacuum or air)
- `loggf::Float64`: log₁₀(gf) - oscillator strength
- `element_ion::Float64`: Element.ion code (e.g., 26.00 = Fe I, 26.01 = Fe II)
- `e_lower::Float64`: Lower level energy (cm⁻¹)
- `e_upper::Float64`: Upper level energy (cm⁻¹)
- `j_lower::Float64`: Lower level J quantum number
- `j_upper::Float64`: Upper level J quantum number
- `gamma_rad::Float64`: Radiative damping width (per-frequency units)
- `gamma_stark::Float64`: Stark broadening width
- `gamma_vdw::Float64`: van der Waals broadening width
- `alpha::Float64`: van der Waals exponent (typically 0.4)
"""
struct SpectralLine
    nbuff::Int              # Wavelength grid index
    wavelength::Float64     # Wavelength (Å)
    loggf::Float64          # log(gf)
    element_ion::Float64    # Element.ion code
    e_lower::Float64        # Lower energy (cm⁻¹)
    e_upper::Float64        # Upper energy (cm⁻¹)
    j_lower::Float64        # Lower J
    j_upper::Float64        # Upper J
    gamma_rad::Float64      # Radiative damping
    gamma_stark::Float64    # Stark damping
    gamma_vdw::Float64      # van der Waals damping
    alpha::Float64          # vdW exponent
end

"""
    AtmosphereModel

ATLAS-format atmosphere model

Contains T(τ), P(τ), electron density, abundances, etc.
"""
struct AtmosphereModel
    n_depths::Int                    # Number of depth points
    tau_ross::Vector{Float64}        # Rosseland optical depth
    temperature::Vector{Float64}     # Temperature (K)
    pressure::Vector{Float64}        # Gas pressure (dyne/cm²)
    electron_density::Vector{Float64} # Electron density (cm⁻³)
    density::Vector{Float64}         # Mass density (g/cm³)
    abundances::Vector{Float64}      # Element abundances (solar = 12.0 for H)
end

"""
    SyntheConfig

Configuration for SYNTHE synthesis run

# Keyword Constructor
```julia
SyntheConfig(;
    wave_start = 5000.0,
    wave_end = 5100.0,
    resolving_power = 50000.0,
    turbulent_velocity = 2.0,
    vacuum_wavelengths = true,
    nlte = false,
    cutoff = 0.001,
    use_fortran_validation = false
)
```

# Validation Mode

When `use_fortran_validation = true`, the pipeline uses Fortran-exact implementations
for numerical validation:

- **Voigt profile**: 3-regime approximation matching atlas12.for exactly
- **Radiative transfer**: JOSH algorithm with COEFJ/COEFH tables
- **Partition functions**: NNN array interpolation with POTION ionization potentials

This mode is intended for:
1. Validating against Fortran reference outputs
2. Debugging numerical differences
3. Ensuring bit-for-bit reproducibility

Default is `false` (use optimized Julia implementations).
"""
struct SyntheConfig
    wave_start::Float64          # Start wavelength (Å)
    wave_end::Float64            # End wavelength (Å)
    resolving_power::Float64     # R = λ/Δλ
    turbulent_velocity::Float64  # Microturbulence (km/s)
    vacuum_wavelengths::Bool     # true = vacuum, false = air
    nlte::Bool                   # true = NLTE, false = LTE
    cutoff::Float64              # Line cutoff threshold
    use_fortran_validation::Bool # true = Fortran-exact mode, false = optimized
end

# Keyword constructor with sensible defaults
function SyntheConfig(;
    wave_start::Float64 = 5000.0,
    wave_end::Float64 = 5100.0,
    resolving_power::Float64 = 50000.0,
    turbulent_velocity::Float64 = 2.0,
    vacuum_wavelengths::Bool = true,
    nlte::Bool = false,
    cutoff::Float64 = 0.001,
    use_fortran_validation::Bool = false
)
    SyntheConfig(wave_start, wave_end, resolving_power, turbulent_velocity,
                 vacuum_wavelengths, nlte, cutoff, use_fortran_validation)
end

"""
    Spectrum

Output spectrum: wavelength and flux
"""
struct Spectrum
    wavelength::Vector{Float64}  # Wavelength grid (Å)
    flux::Vector{Float64}        # Emergent flux (erg/s/cm²/Å)
end
