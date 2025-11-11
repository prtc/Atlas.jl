"""
    Synthe

SYNTHE spectrum synthesis pipeline - Julia implementation

Phase 5: Minimal viable implementation for solar 5000-5100 Å

**Architecture**:
- Line readers (rgfalllinesnew, rmolecasc) - Pure Julia
- Atmosphere preparation (xnfpelsyn) - Julia with atlas7v ccall
- Line opacity (synthe) - Pure Julia
- Spectrum synthesis (spectrv) - Julia with atlas7v ccall
- Broadening (broaden) - Pure Julia

**Atlas7v Dependencies** (via ccall):
- POPS: Saha-Boltzmann populations
- KAPP: Continuum opacity
- JOSH: Radiative transfer solver
- XSEC: Photoionization cross-sections (if needed)

**Test-Driven Development**:
Each module has corresponding tests in test/phase5_minimal_synthe/
"""
module Synthe

using SpecialFunctions  # erf, erfc for Voigt profile
using Interpolations    # Continuum opacity interpolation
using FFTW              # Gaussian broadening (FFT-based)

# Core data structures
include("structs.jl")

# Atlas7v Fortran library interface (ccall wrappers)
include("atlas7v.jl")

# synbeg: Parameter initialization (Task 2)
include("synbeg.jl")

# Line readers (Tasks 3-4)
include("line_readers.jl")

# Atmosphere preparation (Task 5)
include("atmosphere.jl")

# Line opacity accumulation (Task 6)
include("line_opacity.jl")

# Spectrum synthesis (Task 7)
include("spectrum_synthesis.jl")

# Instrumental broadening (Task 8)
include("broadening.jl")

# High-level pipeline (Task 9)
include("pipeline.jl")

# Exports
export
    # Data structures
    SpectralLine,
    AtmosphereModel,
    SyntheConfig,
    Spectrum,
    Fort93Params,

    # synbeg (Task 2)
    synbeg_initialize,
    wavelength_grid,
    wavelength_to_nbuff,

    # Line readers (Tasks 3-4)
    read_gfalllines,
    read_molecular_lines,

    # Pipeline
    synthe_pipeline,

    # Broadening
    gaussian_broaden

end # module Synthe
