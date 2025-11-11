"""
Atmosphere preparation (xnfpelsyn equivalent)

**Task 5**: Implement xnfpelsyn main loop with atlas7v ccall

**Purpose**: Prepare atmosphere model with populations and continuum opacities

**Algorithm** (from xnfpelsyn.for):
1. Read ATLAS model (.mod format)
2. Loop over wavelength bins (377 bins for full synthesis)
3. For each bin:
   - Call POPS for each element/ion (via ccall to Fortran)
   - Call KAPP for continuum opacities (via ccall to Fortran)
4. Store results for use by synthe and spectrv

**Status**: NOT IMPLEMENTED (Task 5)
"""

"""
    read_atlas_model(filename::String)

Read ATLAS-format atmosphere model

**Format**: ASCII text with header + depth points
- Header: T_eff, log g, metallicity, etc.
- Depth points: τ_ross, T, P_gas, P_e, etc.

**Returns**: `AtmosphereModel`

**Status**: NOT IMPLEMENTED (Task 5)
"""
function read_atlas_model(filename::String)
    error("Task 5 not yet implemented: read_atlas_model")
end

"""
    compute_populations(atm::AtmosphereModel)

Compute Saha-Boltzmann populations for all elements

Calls atlas7v POPS subroutine via ccall for each element

**Status**: NOT IMPLEMENTED (Task 5, requires Task 1)
"""
function compute_populations(atm::AtmosphereModel)
    error("Task 5 not yet implemented: compute_populations")
end

"""
    compute_continuum_opacities(atm::AtmosphereModel, populations)

Compute continuum opacities (H⁻, H I, He, electron scattering)

Calls atlas7v KAPP subroutine via ccall

**Status**: NOT IMPLEMENTED (Task 5, requires Task 1)
"""
function compute_continuum_opacities(atm::AtmosphereModel, populations)
    error("Task 5 not yet implemented: compute_continuum_opacities")
end
