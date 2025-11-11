"""
Spectrum synthesis (spectrv equivalent)

**Task 7**: Implement spectrv with JOSH ccall

**Purpose**: Solve radiative transfer to get emergent flux

**Algorithm** (from spectrv.for):
1. Loop over wavelength grid
2. For each wavelength:
   - Read continuum opacity (from Task 5)
   - Read line opacity (from Task 6)
   - Call JOSH to solve RT (via ccall to Fortran)
   - Store emergent flux
3. Return spectrum

**Status**: NOT IMPLEMENTED (Task 7, requires Task 1)
"""

"""
    synthesize_spectrum(atm::AtmosphereModel, line_opacity::Matrix{Float64}, config::SyntheConfig)

Synthesize emergent spectrum using radiative transfer

Calls atlas7v JOSH subroutine via ccall for each wavelength

**Returns**: `Spectrum` (wavelength, flux)

**Status**: NOT IMPLEMENTED (Task 7, requires Task 1)
"""
function synthesize_spectrum(atm::AtmosphereModel, line_opacity::Matrix{Float64}, config::SyntheConfig)
    error("Task 7 not yet implemented: synthesize_spectrum")
end
