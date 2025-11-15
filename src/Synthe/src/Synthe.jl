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
include("line_readers_molecular.jl")

# Continuum opacity (Task 2.3 - Step 2)
include("continuum_opacity.jl")

# Population solver (Task 3.1 - Step 3)
include("populations.jl")

# Fortran-exact partition functions using NNN data
include("partition_functions_fortran.jl")

# Opacity integration (Task 3.2 - Step 3)
include("opacity_integration.jl")

# Radiative transfer (Task 4 - Step 4)
include("radiative_transfer.jl")

# Fortran-exact radiative transfer using COEFJ/COEFH (Validation mode)
include("radiative_transfer_fortran_exact.jl")

# Fortran-exact Voigt profile (Validation mode)
include("voigt_fortran_exact.jl")

# Atmosphere model reader (Task 5.1)
include("atmosphere_reader.jl")

# Line opacity integration (Task 5.2)
include("line_opacity_integration.jl")

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

    # Atlas7v ccall interface (Task 1)
    ATLAS7V_LIBRARY,
    atlas7v_library_available,
    call_pops,
    call_kapp,
    call_josh,
    set_rhox!,
    get_rhox,
    set_temp!,
    get_temp,
    set_state!,
    get_xnatom,
    set_wavelength!,
    get_continuum_absorption,
    get_continuum_scattering,
    set_total_opacity!,
    get_mean_intensity,
    get_eddington_flux,
    initialize_atlas7v!,
    initialize_atmosphere_for_kapp!,
    initialize_atmosphere_for_josh!,

    # synbeg (Task 2)
    synbeg_initialize,
    wavelength_grid,
    wavelength_to_nbuff,

    # Line readers (Tasks 3-4, Step 2 Tasks 2.1-2.2)
    read_gfalllines,
    parse_gfall_line,
    read_molecular_lines,
    parse_molecular_line,
    iso_to_nelion,
    get_isotopic_abundance,
    isotopic_abundance_factor,
    combine_line_lists,
    compute_nbuff,
    read_gfall_lines,

    # Continuum opacity (Step 2 Task 2.3)
    hminus_bf,
    hminus_ff,
    hydrogen_bf,
    electron_scattering,
    gaunt_factor,

    # Population solver (Step 3 Task 3.1)
    partition_function,
    saha_ionization_ratio,
    compute_populations,
    PopulationResult,

    # Fortran-exact partition functions (Validation mode)
    partition_function_fortran,
    partition_function_fortran_available,

    # Opacity integration (Step 3 Task 3.2)
    continuum_opacity_total,
    total_opacity,
    line_opacity_at_wavelength,

    # Radiative transfer (Step 4)
    solve_tridiagonal,
    source_function_lte,
    compute_optical_depth,
    solve_radiative_transfer_feautrier,
    compute_emergent_spectrum,
    compute_limb_darkening,
    limb_darkening_coefficient,
    synthesize_spectrum_full,

    # Fortran-exact radiative transfer (Validation mode)
    solve_radiative_transfer_josh,
    josh_fortran_mode_available,

    # Fortran-exact Voigt profile (Validation mode)
    voigt_profile_fortran_exact,
    voigt_fortran_mode_available,

    # Atmosphere reader (Task 5.1)
    read_atlas9_model,
    parse_atlas9_header,
    parse_atlas9_structure,

    # Line opacity integration (Task 5.2)
    boltzmann_level_population,
    line_absorption_coefficient,
    accumulate_line_opacity,
    total_opacity_with_lines,

    # Pipeline
    synthe_pipeline,

    # Broadening
    gaussian_broaden

end # module Synthe
