"""
Line opacity accumulation (synthe equivalent)

**Task 6**: Implement synthe line opacity loop

**Purpose**: Compute line opacity at each wavelength and depth

**Algorithm** (from synthe.for):
1. Loop over wavelength grid (5000-5100 Å, ~5000 points for R=50000)
2. For each wavelength:
   - Find lines within ~10 Å (Voigt wings)
   - For each line:
     - Compute line profile (Voigt function)
     - Accumulate opacity contribution
3. Store opacity grid: opacity(wavelength, depth)

**Voigt profile**: Combination of Lorentzian (natural+damping) and Gaussian (thermal+turbulent)

**Status**: NOT IMPLEMENTED (Task 6)
"""

"""
    compute_line_opacities(atm::AtmosphereModel, lines::Vector{SpectralLine}, config::SyntheConfig)

Compute line opacity grid for all wavelengths and depths

**Returns**: `opacity_grid::Matrix{Float64}` (n_wavelengths × n_depths)

**Status**: NOT IMPLEMENTED (Task 6)
"""
function compute_line_opacities(atm::AtmosphereModel, lines::Vector{SpectralLine}, config::SyntheConfig)
    error("Task 6 not yet implemented: compute_line_opacities")
end

"""
    voigt_profile(nu::Float64, nu0::Float64, gamma_total::Float64, doppler_width::Float64)

Compute Voigt profile: convolution of Lorentzian and Gaussian

**Parameters**:
- `nu`: Frequency (Hz)
- `nu0`: Line center frequency (Hz)
- `gamma_total`: Total damping width (Hz)
- `doppler_width`: Thermal + turbulent Doppler width (Hz)

**Returns**: Profile value at frequency nu

**Implementation**: Faddeeva function or empirical approximation

**Status**: NOT IMPLEMENTED (Task 6)
"""
function voigt_profile(nu::Float64, nu0::Float64, gamma_total::Float64, doppler_width::Float64)
    error("Task 6 not yet implemented: voigt_profile")
end
