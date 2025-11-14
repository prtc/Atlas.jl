"""
Atlas7v Fortran Library ccall Interface

Provides Julia wrappers for atlas7v Fortran subroutines:
- POPS: Population solver (LTE/NLTE ionization fractions)
- KAPP: Opacity dispatcher (continuum opacities from 20 sources)
- JOSH: Radiative transfer solver (Feautrier algorithm)

These subroutines communicate via Fortran COMMON blocks, which we must
carefully replicate in Julia to match the exact memory layout.

Critical: atlas7v uses kw=99 depth points (not 72 like ATLAS12)!

References:
- docs/archaeology/ATLAS7V_PHASE4_CRITICAL_DEEP_DIVE.md
- docs/archaeology/ATLAS12_VS_ATLAS7V_COMPARISON.md
- docs/archaeology/PHASE5_MIGRATION_PLAN.md

Author: Claude (Task 1: Atlas7v ccall interface)
Date: 2025-11-11
"""

#-------------------------------------------------------------------
# Library Configuration
#-------------------------------------------------------------------

"""
Path to the compiled atlas7v shared library.

This must be compiled by Paula from the atlas7v Fortran source code.
See test/phase5_minimal_synthe/README.md for compilation instructions:

```bash
cd upstream/kurucz/source_codes/programs/atlas12/
gfortran -shared -fPIC -O2 -o libaslave7v.so atlas7v.for
```
"""
const ATLAS7V_LIBRARY = joinpath(
    dirname(dirname(@__DIR__)),
    "lib", "atlas7v.so"
)

"""
Check if the atlas7v library is available and can be loaded.
"""
function atlas7v_library_available()::Bool
    return isfile(ATLAS7V_LIBRARY)
end

#-------------------------------------------------------------------
# Fortran COMMON Block Structures
#-------------------------------------------------------------------

"""
COMMON /RHOX/ - Depth scale (column mass density)

Fortran:
```fortran
COMMON /RHOX/ RHOX(99), NRHOX
```

- RHOX: Column mass density (g cm⁻²) at 99 depths
- NRHOX: Number of depth points (should be 99)
"""
mutable struct RhoxCommon
    rhox::NTuple{99, Float64}
    nrhox::Int32
    _pad::Int32  # Fortran may add padding for alignment
end

"""
COMMON /TEMP/ - Temperature structure

Fortran:
```fortran
COMMON /TEMP/ T(99)
```

- T: Temperature (K) at 99 depths
"""
mutable struct TempCommon
    t::NTuple{99, Float64}
end

"""
COMMON /STATE/ - Atomic number densities

Fortran:
```fortran
COMMON /STATE/ XNATOM(99)
```

- XNATOM: Total atom number density (cm⁻³) at 99 depths
"""
mutable struct StateCommon
    xnatom::NTuple{99, Float64}
end

"""
COMMON /ELEM/ - Element abundances

Fortran:
```fortran
COMMON /ELEM/ ABUND(99), XABUND(99)
```

- ABUND: Element abundances (log scale, N_X/N_H + 12)
- XABUND: Linear abundances (number fractions relative to total atoms)

NOTE: In atlas7v these are 1D arrays (constant with depth),
unlike ATLAS12 where they can vary with depth.
"""
mutable struct ElemCommon
    abund::NTuple{99, Float64}
    xabund::NTuple{99, Float64}
end

"""
COMMON /FREQ/ - Current frequency/wavelength

Fortran:
```fortran
COMMON /FREQ/ FREQ
```

- FREQ: Frequency (Hz) for opacity calculations
"""
mutable struct FreqCommon
    freq::Float64
end

"""
COMMON /OPTOT/ - Total opacities

Fortran:
```fortran
COMMON /OPTOT/ ACONT(99), SCONT(99), ALINE(99), SLINE(99), SIGMAC(99), SIGMAL(99)
```

- ACONT: Continuum absorption opacity (cm⁻¹)
- SCONT: Continuum scattering opacity (cm⁻¹)
- ALINE: Line absorption opacity (cm⁻¹)
- SLINE: Line scattering opacity (cm⁻¹)
- SIGMAC: Continuum extinction (ACONT + SCONT)
- SIGMAL: Line extinction (ALINE + SLINE)
"""
mutable struct OptotCommon
    acont::NTuple{99, Float64}
    scont::NTuple{99, Float64}
    aline::NTuple{99, Float64}
    sline::NTuple{99, Float64}
    sigmac::NTuple{99, Float64}
    sigmal::NTuple{99, Float64}
end

"""
COMMON /TAUSHJ/ - Optical depth arrays for JOSH

Fortran:
```fortran
COMMON /TAUSHJ/ TAUS(51), SH(51), SOURCE(51), TAUMAX
```

- TAUS: Optical depth grid (51 points, logarithmic)
- SH: Source function at 51 optical depth points
- SOURCE: Source function workspace
- TAUMAX: Maximum optical depth
"""
mutable struct TaushjCommon
    taus::NTuple{51, Float64}
    sh::NTuple{51, Float64}
    source::NTuple{51, Float64}
    taumax::Float64
end

"""
COMMON /FLUXHH/ - Radiative flux arrays

Fortran:
```fortran
COMMON /FLUXHH/ HH(99), HHFLUX
```

- HH: Eddington flux H at 99 depths
- HHFLUX: Surface flux
"""
mutable struct FluxhhCommon
    hh::NTuple{99, Float64}
    hhflux::Float64
end

"""
COMMON /RADMEAN/ - Mean intensity

Fortran:
```fortran
COMMON /RADMEAN/ XJ(99)
```

- XJ: Mean intensity J at 99 depths
"""
mutable struct RadmeanCommon
    xj::NTuple{99, Float64}
end

#-------------------------------------------------------------------
# Global COMMON Block Instances
#-------------------------------------------------------------------

# These must be initialized before calling Fortran routines
# In a real implementation, these would be global variables shared with Fortran

# Note: Julia doesn't support true Fortran COMMON blocks.
# We'll need to use a different strategy:
# 1. Pass data through subroutine arguments where possible
# 2. Write wrapper subroutines in Fortran that accept data as arguments
# 3. Or use C interop with global variables (less clean)

# For Phase 5, we'll use strategy #1 (pass through arguments) where possible,
# and document that a Fortran wrapper layer may be needed for production.

#-------------------------------------------------------------------
# POPS - Population Solver
#-------------------------------------------------------------------

"""
    call_pops(code::Float64, mode::Int32, atm::AtmosphereModel) -> Matrix{Float64}

Call atlas7v POPS subroutine to compute ionization populations.

# Arguments
- `code`: Element.ion code (e.g., 26.00 = Fe I, 26.01 = Fe II)
  - Integer part: Atomic number (1=H, 2=He, 6=C, 8=O, 26=Fe)
  - Decimal × 100: Ionization stage (0=neutral, 1=singly ionized)
- `mode`: Population mode
  - 1 = fractions (sum to 1 at each depth)
  - 2 = number densities (cm⁻³)
  - 10+ = multiple ions simultaneously
- `atm`: AtmosphereModel with temperature, pressure, density structure

# Returns
- `populations`: Matrix{Float64}(99, 10) - populations at 99 depths for up to 10 ions
  - populations[depth, ion_stage] where ion_stage=1 is neutral, 2 is singly ionized, etc.

# Example
```julia
# Compute Fe I populations
atm = read_atlas_model("solar.mod")
fe_pops = call_pops(26.00, 2, atm)  # Mode 2 = number densities

# Fe I neutral density at surface
n_fe_i_surface = fe_pops[1, 1]  # cm⁻³
```

# Fortran Signature
```fortran
SUBROUTINE POPS(CODE, MODE, NUMBER)
  REAL*8 CODE
  INTEGER MODE
  REAL*8 NUMBER(KW, 10)  ! KW=99 for atlas7v
END
```

# Notes
- Requires COMMON blocks /RHOX/, /TEMP/, /STATE/, /ELEM/ to be initialized
- POPS is a dispatcher to PFSAHA (Saha-Boltzmann) or PFNLTE (non-LTE)
- For LTE (most cases), uses Saha equation with partition functions
- Populations are computed from temperature, electron pressure, and abundances
"""
function call_pops(code::Float64, mode::Int32, atm::AtmosphereModel)::Matrix{Float64}
    if !atlas7v_library_available()
        error("atlas7v library not found at: $ATLAS7V_LIBRARY\n" *
              "See test/phase5_minimal_synthe/README.md for compilation instructions.")
    end

    # TODO: Initialize COMMON blocks from atm
    # This requires either:
    # 1. A Fortran wrapper that accepts atmosphere as arguments
    # 2. Direct manipulation of global Fortran COMMON blocks (tricky in Julia)
    # 3. Rewrite POPS in Julia (Phase 6+)

    # Allocate output array: 99 depths × 10 ionization stages
    number = zeros(Float64, 99, 10)

    # Call Fortran POPS
    # Note: Fortran symbol names are typically lowercase with trailing underscore
    ccall(
        (:pops_, ATLAS7V_LIBRARY),
        Cvoid,
        (Ref{Float64}, Ref{Int32}, Ptr{Float64}),
        code,
        mode,
        number
    )

    return number
end

"""
    call_pops(element::Int, ion_stage::Int, mode::Int32, atm::AtmosphereModel) -> Matrix{Float64}

Convenience wrapper for call_pops using element and ion_stage separately.

# Example
```julia
# Compute Fe I populations (element 26, neutral = stage 0)
fe_pops = call_pops(26, 0, 2, atm)

# Compute Fe II populations (element 26, singly ionized = stage 1)
fe_ii_pops = call_pops(26, 1, 2, atm)
```
"""
function call_pops(element::Int, ion_stage::Int, mode::Int32, atm::AtmosphereModel)::Matrix{Float64}
    code = Float64(element) + Float64(ion_stage) / 100.0
    return call_pops(code, mode, atm)
end

#-------------------------------------------------------------------
# KAPP - Opacity Dispatcher
#-------------------------------------------------------------------

"""
    call_kapp(n::Int32, nsteps::Int32, stepwt::Float64, atm::AtmosphereModel) -> Nothing

Call atlas7v KAPP subroutine to compute continuum opacities.

# Arguments
- `n`: Mode selector
  - 0 = Initialize + compute continuum opacities
  - >0 = Add line opacities only
- `nsteps`: Number of frequency integration steps
- `stepwt`: Integration step weight
- `atm`: AtmosphereModel

# Side Effects
- Updates COMMON /OPTOT/ with opacity arrays:
  - ACONT: Continuum absorption
  - SCONT: Continuum scattering
  - ALINE: Line absorption
  - SLINE: Line scattering

# Opacity Sources (controlled by IFOP array)
KAPP is a dispatcher for ~20 opacity sources:
1. H I bound-free (HOP)
2. H⁻ bound-free (HMINOP) - CRITICAL for optical
3. H Rayleigh scattering (HRAYOP)
4. He I bound-free (HE1OP)
5. He II bound-free (HE2OP)
6. Electron scattering (ELECOP)
... and 14 more

For solar spectrum synthesis, typically use:
  IFOP = [1,0,1,1,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0]
  (H I, H⁻, H Ray, He I, He II, e⁻ scattering)

# Example
```julia
# Initialize and compute continuum opacities at 5000 Å
set_wavelength!(5000.0)
call_kapp(0, 0, 0.0, atm)

# Read results from COMMON /OPTOT/
acont = get_continuum_absorption()
scont = get_continuum_scattering()
```

# Fortran Signature
```fortran
SUBROUTINE KAPP(N, NSTEPS, STEPWT)
  INTEGER N, NSTEPS
  REAL*8 STEPWT
END
```

# Notes
- Requires wavelength/frequency to be set in COMMON /FREQ/
- Requires populations from POPS in COMMON /STATE/
- Computes wavelength-dependent opacities
- H⁻ opacity dominates in solar photosphere (optical)
"""
function call_kapp(n::Int32, nsteps::Int32, stepwt::Float64, atm::AtmosphereModel)::Nothing
    if !atlas7v_library_available()
        error("atlas7v library not found at: $ATLAS7V_LIBRARY\n" *
              "See test/phase5_minimal_synthe/README.md for compilation instructions.")
    end

    # TODO: Initialize COMMON blocks /FREQ/, /STATE/, /TEMP/, etc.

    # Call Fortran KAPP
    ccall(
        (:kapp_, ATLAS7V_LIBRARY),
        Cvoid,
        (Ref{Int32}, Ref{Int32}, Ref{Float64}),
        n,
        nsteps,
        stepwt
    )

    return nothing
end

#-------------------------------------------------------------------
# JOSH - Radiative Transfer (Feautrier)
#-------------------------------------------------------------------

"""
    call_josh(ifscat::Int32, ifsurf::Int32, atm::AtmosphereModel) -> Float64

Call atlas7v JOSH subroutine for radiative transfer calculation.

Uses Feautrier algorithm on 51-point logarithmic optical depth grid.

# Arguments
- `ifscat`: Scattering mode
  - 0 = No scattering (pure absorption)
  - 1 = Include scattering, solve source function iteratively
- `ifsurf`: Output mode
  - 0 = Compute mean intensity J and flux H at all depths
  - 1 = Return surface flux only (faster)
- `atm`: AtmosphereModel

# Returns
- If `ifsurf=1`: Surface flux (erg s⁻¹ cm⁻² Hz⁻¹ sr⁻¹)
- If `ifsurf=0`: Updates J and H in COMMON blocks, returns 0.0

# Algorithm Overview
1. Compute total opacity (continuum + line) at 99 depths
2. Integrate optical depth scale
3. Interpolate to standard 51-point logarithmic τ grid
4. If IFSCAT=1: Solve integral equation for source function
5. Compute J (mean intensity) and H (flux) via Feautrier matrices
6. If IFSURF=1: Return surface flux

# Example
```julia
# Compute surface flux with scattering
flux_surface = call_josh(1, 1, atm)

# Or compute full J and H profiles
call_josh(1, 0, atm)
J = get_mean_intensity()
H = get_eddington_flux()
```

# Fortran Signature
```fortran
SUBROUTINE JOSH(IFSCAT, IFSURF)
  INTEGER IFSCAT, IFSURF
END
```

# Notes
- Requires total opacity set in COMMON /OPTOT/ (from KAPP + line opacity)
- Uses precomputed Feautrier matrices COEFJ(51,51), COEFH(51,51)
- Iterates to convergence if IFSCAT=1 (typically 5-10 iterations)
- Critical for spectrum synthesis: called once per wavelength point
"""
function call_josh(ifscat::Int32, ifsurf::Int32, atm::AtmosphereModel)::Float64
    if !atlas7v_library_available()
        error("atlas7v library not found at: $ATLAS7V_LIBRARY\n" *
              "See test/phase5_minimal_synthe/README.md for compilation instructions.")
    end

    # TODO: Initialize COMMON blocks /OPTOT/, /TAUSHJ/, etc.

    # Call Fortran JOSH
    ccall(
        (:josh_, ATLAS7V_LIBRARY),
        Cvoid,
        (Ref{Int32}, Ref{Int32}),
        ifscat,
        ifsurf
    )

    # TODO: Read surface flux from COMMON /FLUXHH/
    # For now, return placeholder
    flux_surface = 0.0

    return flux_surface
end

#-------------------------------------------------------------------
# COMMON Block Helper Functions
#-------------------------------------------------------------------
# These functions set and get data from Fortran COMMON blocks
# NOTE: This is a simplified interface. Full implementation requires
# either Fortran wrapper subroutines or careful global memory management.

"""
Set COMMON /RHOX/ from AtmosphereModel.
"""
function set_rhox!(atm::AtmosphereModel)::Nothing
    # TODO: Write to Fortran COMMON /RHOX/
    # This requires either ccall to a wrapper or direct memory manipulation
    @warn "set_rhox! not yet implemented - requires Fortran wrapper"
    return nothing
end

"""
Get COMMON /RHOX/ rhox array.
"""
function get_rhox()::Vector{Float64}
    # TODO: Read from Fortran COMMON /RHOX/
    @warn "get_rhox not yet implemented - requires Fortran wrapper"
    return zeros(Float64, 99)
end

"""
Set COMMON /TEMP/ from AtmosphereModel.
"""
function set_temp!(atm::AtmosphereModel)::Nothing
    # TODO: Write to Fortran COMMON /TEMP/
    @warn "set_temp! not yet implemented - requires Fortran wrapper"
    return nothing
end

"""
Get COMMON /TEMP/ temperature array.
"""
function get_temp()::Vector{Float64}
    # TODO: Read from Fortran COMMON /TEMP/
    @warn "get_temp not yet implemented - requires Fortran wrapper"
    return zeros(Float64, 99)
end

"""
Set COMMON /STATE/ from AtmosphereModel.
"""
function set_state!(atm::AtmosphereModel)::Nothing
    # TODO: Write to Fortran COMMON /STATE/
    @warn "set_state! not yet implemented - requires Fortran wrapper"
    return nothing
end

"""
Get COMMON /STATE/ xnatom array.
"""
function get_xnatom()::Vector{Float64}
    # TODO: Read from Fortran COMMON /STATE/
    @warn "get_xnatom not yet implemented - requires Fortran wrapper"
    return zeros(Float64, 99)
end

"""
Set wavelength in COMMON /FREQ/.

# Arguments
- `wavelength`: Wavelength in Å

# Notes
- Converts to frequency (Hz) internally: ν = c / λ
"""
function set_wavelength!(wavelength::Float64)::Nothing
    # TODO: Write to Fortran COMMON /FREQ/
    @warn "set_wavelength! not yet implemented - requires Fortran wrapper"
    return nothing
end

"""
Get continuum absorption opacity from COMMON /OPTOT/.

# Returns
- `acont`: Vector{Float64}(99) - continuum absorption (cm⁻¹) at 99 depths
"""
function get_continuum_absorption()::Vector{Float64}
    # TODO: Read from Fortran COMMON /OPTOT/
    @warn "get_continuum_absorption not yet implemented - requires Fortran wrapper"
    return zeros(Float64, 99)
end

"""
Get continuum scattering opacity from COMMON /OPTOT/.

# Returns
- `scont`: Vector{Float64}(99) - continuum scattering (cm⁻¹) at 99 depths
"""
function get_continuum_scattering()::Vector{Float64}
    # TODO: Read from Fortran COMMON /OPTOT/
    @warn "get_continuum_scattering not yet implemented - requires Fortran wrapper"
    return zeros(Float64, 99)
end

"""
Set total opacity in COMMON /OPTOT/.

# Arguments
- `opacity`: Vector{Float64}(99) - total extinction opacity (cm⁻¹)
- `atm`: AtmosphereModel
"""
function set_total_opacity!(opacity::Vector{Float64}, atm::AtmosphereModel)::Nothing
    if length(opacity) != 99
        error("Opacity array must have 99 elements (atlas7v depth points)")
    end

    # TODO: Write to Fortran COMMON /OPTOT/
    @warn "set_total_opacity! not yet implemented - requires Fortran wrapper"
    return nothing
end

"""
Get mean intensity J from COMMON /RADMEAN/.

# Returns
- `J`: Vector{Float64}(99) - mean intensity at 99 depths
"""
function get_mean_intensity()::Vector{Float64}
    # TODO: Read from Fortran COMMON /RADMEAN/
    @warn "get_mean_intensity not yet implemented - requires Fortran wrapper"
    return zeros(Float64, 99)
end

"""
Get Eddington flux H from COMMON /FLUXHH/.

# Returns
- `H`: Vector{Float64}(99) - Eddington flux at 99 depths
"""
function get_eddington_flux()::Vector{Float64}
    # TODO: Read from Fortran COMMON /FLUXHH/
    @warn "get_eddington_flux not yet implemented - requires Fortran wrapper"
    return zeros(Float64, 99)
end

#-------------------------------------------------------------------
# High-Level Initialization Functions
#-------------------------------------------------------------------

"""
Initialize all atlas7v COMMON blocks from AtmosphereModel.

Sets:
- /RHOX/: Depth scale
- /TEMP/: Temperature structure
- /STATE/: Number densities
- /ELEM/: Element abundances

# Arguments
- `atm`: AtmosphereModel with complete atmosphere structure
"""
function initialize_atlas7v!(atm::AtmosphereModel)::Nothing
    set_rhox!(atm)
    set_temp!(atm)
    set_state!(atm)
    # TODO: set_elem! for abundances
    return nothing
end

"""
Initialize atmosphere for KAPP opacity calculations.

Computes populations for all relevant elements and prepares COMMON blocks.

# Arguments
- `atm`: AtmosphereModel
"""
function initialize_atmosphere_for_kapp!(atm::AtmosphereModel)::Nothing
    initialize_atlas7v!(atm)

    # Compute populations for key elements (H, He, C, N, O, etc.)
    # This is needed before KAPP can compute opacities
    elements = [1.0, 2.0, 6.0, 7.0, 8.0, 11.0, 12.0, 13.0, 14.0, 20.0, 26.0]

    for elem in elements
        pops = call_pops(elem, 2, atm)  # Mode 2 = number density
        # TODO: Store populations in COMMON blocks
    end

    return nothing
end

"""
Initialize atmosphere for JOSH radiative transfer.

Prepares all COMMON blocks needed for radiative transfer calculation.

# Arguments
- `atm`: AtmosphereModel
"""
function initialize_atmosphere_for_josh!(atm::AtmosphereModel)::Nothing
    initialize_atlas7v!(atm)
    # TODO: Initialize /TAUSHJ/, /MATXJ/, /MATXH/
    return nothing
end

#-------------------------------------------------------------------
# Documentation and Warnings
#-------------------------------------------------------------------

"""
IMPORTANT LIMITATIONS (Phase 5):

The atlas7v ccall interface in Phase 5 is **incomplete** because Fortran COMMON
blocks cannot be directly manipulated from Julia without additional infrastructure.

Three strategies for completion:

1. **Fortran Wrapper Layer** (RECOMMENDED for Phase 6):
   Write thin Fortran subroutines that accept atmosphere data as arguments
   and populate COMMON blocks internally. Example:

   ```fortran
   SUBROUTINE set_atmosphere(rhox_in, temp_in, n_depths)
     REAL*8 rhox_in(99), temp_in(99)
     INTEGER n_depths
     COMMON /RHOX/ RHOX(99), NRHOX
     COMMON /TEMP/ T(99)

     RHOX = rhox_in
     T = temp_in
     NRHOX = n_depths
   END SUBROUTINE
   ```

   Then call from Julia:
   ```julia
   ccall((:set_atmosphere_, lib), Cvoid,
         (Ptr{Float64}, Ptr{Float64}, Ref{Int32}),
         atm.rhox, atm.temperature, atm.n_depths)
   ```

2. **C Bridge Layer**:
   Use C interop to define global variables matching Fortran COMMON layout.
   More portable but requires careful memory management.

3. **Pure Julia Rewrite** (Phase 6+):
   Reimplement POPS, KAPP, JOSH in Julia. This is the long-term goal but
   requires ~500-1000 USD in development time.

For Phase 5 minimal viable pipeline, we will:
- Document the interface design (this file)
- Create tests assuming interface works (@test_skip)
- Wait for Paula to test with compiled atlas7v.so
- Use actual errors to guide wrapper development

This is acceptable for Phase 5 because our goal is to prove Julia can call
Fortran efficiently, not to have a complete working pipeline.
"""
const PHASE5_LIMITATIONS = """
Atlas7v ccall interface is incomplete in Phase 5.

COMMON block manipulation requires either:
1. Fortran wrapper layer (recommended for Phase 6)
2. C bridge with global variables
3. Pure Julia rewrite (long-term goal)

Tests are marked @test_skip and will be completed when:
1. Paula compiles atlas7v.so
2. We implement one of the strategies above based on real error messages

See atlas7v.jl documentation for implementation strategies.
"""

println("Atlas7v ccall interface loaded.")
println("Library path: ", ATLAS7V_LIBRARY)
println("Library available: ", atlas7v_library_available())
println()
println(PHASE5_LIMITATIONS)
