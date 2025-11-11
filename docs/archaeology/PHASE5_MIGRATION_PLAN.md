# Phase 5: Minimal Working SYNTHE Pipeline - Migration Plan

**Version**: 1.1 (Updated after Task 0 documentation review)
**Created**: 2025-11-11
**Budget**: ~$100 (estimate 40-60 iterations)
**Status**: Task 0 complete, ready for implementation

---

## Executive Summary

**Goal**: Implement minimal viable SYNTHE pipeline in Julia to synthesize solar spectrum (5000-5100 Å, flux only) as a feasibility test.

**Approach**: Test-Driven Development (TDD) with atlas7v Fortran ccall fallback

**Success Criteria**: Julia-generated spectrum matches Fortran output < 1% error

**Revised Task Order** (after documentation review):
- ✅ Task 0: Preparation (documentation, directory structure)
- Tasks 2-4: Line readers (pure Julia, no atlas7v needed)
- **Checkpoint**: Wait for Paula to compile atlas7v.so
- Task 1: Atlas7v ccall interface
- Tasks 5-9: Complete pipeline with atlas7v

---

## Task 0 Findings (Documentation Review)

### Atlas7v Subroutine Specifications

From ATLAS7V_PHASE4_CRITICAL_DEEP_DIVE.md and ATLAS12_VS_ATLAS7V_COMPARISON.md:

#### 1. POPS (Population Solver) - 101 lines

**Signature**:
```fortran
SUBROUTINE POPS(CODE, MODE, NUMBER)
  REAL*8 CODE         ! Element.ion code (26.00 = Fe I, 26.01 = Fe II)
  INTEGER MODE        ! 1=fraction, 2=number density, 10+=multiple ions
  REAL*8 NUMBER(kw,10) ! Output: populations (99 depths × 10 ionization stages)
```

**Element Code Format**:
- Integer part: Atomic number (1=H, 2=He, 6=C, 26=Fe)
- Decimal × 100: Ionization stage (0=neutral, 1=singly ionized)
- Examples: 1.00 → H I, 1.01 → H II, 26.00 → Fe I, 26.01 → Fe II

**Grid Size**: **kw=99 depths** (not 72 like ATLAS12!)

**Key COMMON Blocks**:
- `/RHOX/`: RHOX(99), NRHOX - depth scale
- `/STATE/`: XNATOM(99) - total atom density
- `/ELEM/`: ABUND(99), XABUND(99) - element abundances (1D, constant with depth)
- `/XNMOL/`: Molecular populations (MAXMOL=200)

**Complexity**: LOW (dispatcher to PFSAHA)

---

#### 2. KAPP (Opacity Dispatcher) - 118 lines

**Signature**:
```fortran
SUBROUTINE KAPP(N, NSTEPS, STEPWT)
  INTEGER N       ! 0=initialize+continuum, >0=lines only
  INTEGER NSTEPS  ! Frequency integration steps
  REAL*8 STEPWT   ! Integration step weight
```

**Purpose**: Dispatcher for 20 opacity sources (HOP, HMINOP, HE1OP, etc.)

**Critical Opacity Sources** (solar synthesis):
- IFOP(1): H I bound-free (HOP) - CRITICAL
- IFOP(3): H⁻ opacity (HMINOP) - CRITICAL
- IFOP(4): H Rayleigh (HRAYOP) - HIGH
- IFOP(5): He I bound-free (HE1OP) - CRITICAL
- IFOP(6): He II bound-free (HE2OP) - HIGH
- IFOP(12): Electron scattering (ELECOP) - HIGH

**Typical Solar**: IFOP = [1,0,1,1,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0]

**Key COMMON Blocks**:
- `/BHYD/`, `/BHE/`: Element-specific opacity arrays
- `/OPTOT/`: ACONT, SCONT, ALINE, SLINE, SIGMAC, SIGMAL
- `/FREQ/`: Current frequency

**Complexity**: LOW (dispatcher), but 6-20 subroutine dependencies

---

#### 3. JOSH (Radiative Transfer) - 239 lines

**Signature**:
```fortran
SUBROUTINE JOSH(IFSCAT, IFSURF)
  INTEGER IFSCAT  ! 0=no scattering, 1=solve source function
  INTEGER IFSURF  ! 0=compute J and H, 1=surface flux only
```

**Method**: Feautrier algorithm on 51-point optical depth grid

**Algorithm**:
1. Compute total opacity and source function
2. Integrate optical depth scale
3. Interpolate to standard τ grid (51 points, logarithmic)
4. Solve integral equation for source function (if IFSCAT=1)
5. Compute mean intensity J and flux H via COEFJ/COEFH matrices
6. Return surface flux (if IFSURF=1)

**Key COMMON Blocks**:
- `/MATXJ/`, `/MATXH/`: COEFJ(51,51), COEFH(51,51) - Feautrier weights
- `/TAUSHJ/`: Optical depth arrays
- `/OPTOT/`: Opacities

**Complexity**: MEDIUM-HIGH (iterative solver, matrix operations)

---

### Line Format Specifications

From DEEP_DIVES/12_SYNTHE_LINE_READERS.md:

#### Atomic Lines (gfall format)

**Format**: Fixed-width ASCII
```
F11.4  F7.3  F6.2  F12.3  F5.1  F12.3  F5.1  A1  A10  A10
```

**Fields**:
- Columns 1-11: Wavelength (Å)
- Columns 12-18: log(gf)
- Columns 19-24: Element.ion code (26.00 = Fe I)
- Columns 25-36: E_lower (cm⁻¹)
- Columns 37-41: J_lower
- Columns 42-53: E_upper (cm⁻¹)
- Columns 54-58: J_upper
- Columns 59: ID flag
- Columns 60-69: Lower term label
- Columns 70-79: Upper term label

**Example**:
```
 2600.1720 -2.570 26.0  18500.123  3.5  57002.456  2.5 'a 5D      ' 'z 5P*     '
```

---

#### Molecular Lines (ASCII format)

**Format**: Space-delimited ASCII (format varies by molecule)

**Typical fields**:
```
wavelength  log(gf)  E_lower  E_upper  ISO  [molecule-specific fields]
```

**ISO Codes** (isotopologue identifiers):
- 1: ¹H₂
- 12-13: CN (¹²C¹⁴N, ¹³C¹⁴N)
- 17: ¹²C¹⁶O (most abundant CO)
- 24-26: MgH
- 28-30: SiH
- 40-48: CaH

**Abundance Corrections**:
```julia
# Example for ¹²C¹⁶O (ISO=17):
X1 = -0.005    # log₁₀([¹²C/C_solar])
X2 = 0.0       # log₁₀([¹⁶O/O_solar])
FUDGE = 0.0

gf_corrected = exp((loggf + X1 + X2 + FUDGE) * ln(10))
```

---

### Key Differences: ATLAS12 vs Atlas7v

From ATLAS12_VS_ATLAS7V_COMPARISON.md:

| Aspect | ATLAS12 | Atlas7v | Impact |
|--------|---------|---------|--------|
| **Grid size** | kw=72 | kw=99 | Array dimensions different |
| **Abundances** | XABUND(kw,99) - 2D | XABUND(99) - 1D | Indexing differs |
| **KAPP signature** | No parameters | (N, NSTEPS, STEPWT) | Different interface |
| **Molecular param** | mion=1006 | MAXMOL=200 | Different systems |

**Implication**: Cannot directly reuse ATLAS12 code. Must adapt for atlas7v specifics.

---

## Updated Task Sequence

### Task 0: Preparation ✅ COMPLETE

**Deliverables**:
- ✅ Documentation review (atlas7v, line formats)
- ✅ `test/phase5_minimal_synthe/` directory structure
- ✅ Comprehensive README.md for Paula
- ✅ `src/Synthe/` package skeleton
- ✅ This migration plan (PHASE5_MIGRATION_PLAN.md)

**Findings**:
- Atlas7v specifications documented
- Line format specifications clear
- Can proceed with Tasks 2-4 without atlas7v compilation

---

### Task 2: synbeg - Initialize Parameters

**Test**:
```julia
@testset "synbeg initialization" begin
    params = synbeg_initialize(
        wave_start=5000.0,
        wave_end=5100.0,
        resolving_power=50000.0
    )

    # Validate wavelength grid
    @test params.wave_start ≈ 5000.0
    @test params.wave_end ≈ 5100.0

    # Validate logarithmic grid spacing
    @test params.ratio_lg ≈ log(1 + 1/resolving_power)
end
```

**Implementation**:
- Fort93Params struct (wavelength grid, NBUFF calculation)
- Logarithmic wavelength grid: `λ_i = λ_0 × exp(i × Δln(λ))`
- NBUFF calculation (wavelength index)

**Dependencies**: None (pure Julia)

**Estimated Iterations**: 3-5

**Commit**: "Implement synbeg: fort.93 parameter initialization"

---

### Task 3: rgfalllinesnew - Atomic Line Reader

**Test**:
```julia
@testset "Atomic line reader" begin
    lines = read_gfalllines(
        "test/phase5_minimal_synthe/input/line_lists/atomic/gf5000.asc",
        5000.0,
        5100.0
    )

    # Basic validation
    @test length(lines) > 0
    @test all(5000 .<= [l.wavelength for l in lines] .<= 5100)

    # Format validation
    @test all(l.element_ion > 0 for l in lines)
    @test all(l.e_lower >= 0 for l in lines)

    # Optional: Compare with Paula's Fortran count
    # ref = load_fortran_reference("line_counts.txt")
    # @test length(lines) ≈ ref.atomic_lines rtol=0.01
end
```

**Implementation**:
1. Fixed-width text parser
   ```julia
   function parse_gfall_line(line::String)
       wl = parse(Float64, line[1:11])
       loggf = parse(Float64, line[12:18])
       code = parse(Float64, line[19:24])
       e_lower = parse(Float64, line[25:36])
       # ... etc
   end
   ```

2. Wavelength filtering (add 10 Å margin for line wings)
3. Damping width calculations:
   - Radiative: From Unsöld approximation or data
   - Stark: Default 1e-5 (unless data available)
   - van der Waals: Default 1e-7

4. Convert to SpectralLine struct

**Dependencies**: None (pure Julia I/O)

**Estimated Iterations**: 5-8

**Commit**: "Implement rgfalllinesnew: atomic line reader"

---

### Task 4: rmolecasc - Molecular Line Reader

**Test**:
```julia
@testset "Molecular line reader" begin
    lines_ch = read_molecular_lines(
        "test/phase5_minimal_synthe/input/line_lists/molecular/ch.asc",
        "CH",
        5000.0,
        5100.0
    )

    lines_cn = read_molecular_lines(
        "test/phase5_minimal_synthe/input/line_lists/molecular/cn.asc",
        "CN",
        5000.0,
        5100.0
    )

    lines_co = read_molecular_lines(
        "test/phase5_minimal_synthe/input/line_lists/molecular/co.asc",
        "CO",
        5000.0,
        5100.0
    )

    # Validate species codes
    @test all(l.element_ion == 246 for l in lines_ch)  # CH
    @test all(l.element_ion == 270 for l in lines_cn)  # CN
    @test all(l.element_ion == 276 for l in lines_co)  # CO
end
```

**Implementation**:
1. Parse molecular ASCII format (space-delimited)
2. ISO code → NELION mapping:
   ```julia
   const ISO_TO_NELION = Dict(
       1 => 240,    # H₂
       12 => 270,   # CN
       17 => 276,   # CO
       24 => 246,   # CH
       # ... etc from Deep Dive 12
   )
   ```

3. Isotopic abundance corrections (X1, X2, FUDGE from lookup table)
4. Default damping widths (molecules less well-characterized):
   ```julia
   gamma_rad = 10^(loggr * 0.01)  # If available
   gamma_stark = 3e-5  # Default guess
   gamma_vdw = 1e-7    # Default guess
   ```

**Dependencies**: None (pure Julia I/O)

**Estimated Iterations**: 5-8

**Commit**: "Implement rmolecasc: molecular line reader (CH, CN, CO)"

---

### 🛑 CHECKPOINT 1: Line Readers Complete

**After Tasks 2-4**:
1. Stop work
2. Report to Paula:
   - Tasks 2-4 complete
   - Line reader tests passing
   - Estimated credit consumed (~$15-25)
3. Ask Paula to compile atlas7v.so (while we wait)
4. Wait for approval to continue

**Minimum Viable** achieved at this point:
- ✅ Line readers working
- ✅ TDD framework established
- ✅ Can read test data

**Next**: Need atlas7v.so for Tasks 1, 5-7

---

### Task 1: Atlas7v Library Compilation + Interface

**Test**:
```julia
@testset "Atlas7v ccall interface" begin
    # Test library loading
    @test isfile(ATLAS7V_LIBRARY)

    # Test POPS call
    atm = load_solar_atmosphere()
    populations = call_pops(26.00, 2, atm)  # Fe I number densities

    @test size(populations) == (99, 10)  # 99 depths, up to 10 ions
    @test all(isfinite.(populations))
    @test all(populations .>= 0)

    # Optional: Compare with Fortran reference
    # ref = h5read("pops_reference.h5", "fe_populations")
    # @test populations ≈ ref rtol=1e-6
end
```

**Implementation**:

**1a. Compilation** (Paula does this):
```bash
cd upstream/kurucz/source_codes/programs/atlas12/
gfortran -shared -fPIC -O2 -o libaslave7v.so atlas7v.for

# Verify symbols
nm -D libaslave7v.so | grep -E 'pops_|kapp_|josh_'
```

**1b. Julia ccall wrappers**:
```julia
const ATLAS7V_LIBRARY = "test/phase5_minimal_synthe/fortran_reference/atlas7v_library/libaslave7v.so"

# COMMON block structures (must match Fortran memory layout)
mutable struct RhoxCommon
    rhox::NTuple{99, Float64}
    nrhox::Int32
end

mutable struct StateCommon
    xnatom::NTuple{99, Float64}
    # ... other fields
end

# Global COMMON blocks (match Fortran)
const RHOX_BLOCK = Ref(RhoxCommon(...))
const STATE_BLOCK = Ref(StateCommon(...))

function call_pops(code::Float64, mode::Int, atm::AtmosphereModel)
    # Set COMMON blocks
    set_rhox!(atm)
    set_state!(atm)

    # Allocate output
    number = zeros(Float64, 99, 10)

    # Call Fortran (note: lowercase + underscore naming)
    ccall(
        (:pops_, ATLAS7V_LIBRARY),
        Cvoid,
        (Ref{Float64}, Ref{Int32}, Ref{Float64}),
        code, mode, number
    )

    return number
end
```

**1c. COMMON block interface**:
```julia
function set_rhox!(atm::AtmosphereModel)
    RHOX_BLOCK[].rhox = tuple(atm.rhox...)
    RHOX_BLOCK[].nrhox = atm.n_depths
end

# Similar for other blocks: STATE, ELEM, TEMP, FREQ, etc.
```

**Dependencies**:
- atlas7v.so compiled by Paula
- Understanding of Fortran COMMON block memory layout

**Estimated Iterations**: 8-12 (ccall debugging can be tricky)

**Commit**: "Add Atlas7v Fortran library interface (ccall wrappers)"

---

### Task 5: xnfpelsyn - Atmosphere Preparation

**Test**:
```julia
@testset "xnfpelsyn atmosphere" begin
    # Read ATLAS model
    atm = read_atlas_model("test/phase5_minimal_synthe/input/atmosphere/solar_atlas12.mod")

    @test atm.n_depths > 0
    @test all(atm.temperature .> 0)

    # Compute populations (via ccall)
    populations = compute_populations(atm)

    @test size(populations, 1) == atm.n_depths
    @test all(isfinite.(populations))

    # Compute continuum opacities (via ccall)
    opacities = compute_continuum_opacities(atm, populations)

    @test length(opacities) == atm.n_depths
    @test all(opacities .> 0)  # Opacity must be positive
end
```

**Implementation**:
1. ATLAS model parser:
   ```julia
   function read_atlas_model(filename::String)
       # Parse header: T_eff, log g, [M/H], etc.
       # Parse depth points: τ_ross, T, P_gas, P_e, ρ, etc.
       # Return AtmosphereModel struct
   end
   ```

2. Population loop:
   ```julia
   function compute_populations(atm::AtmosphereModel)
       elements = [1.0, 2.0, 6.0, 7.0, 8.0, ..., 26.0]  # H, He, C, N, O, ..., Fe
       populations = Dict()

       for elem in elements
           pops = call_pops(elem, 2, atm)  # Mode 2 = number density
           populations[elem] = pops
       end

       return populations
   end
   ```

3. Continuum opacity via KAPP:
   ```julia
   function compute_continuum_opacities(atm::AtmosphereModel, populations)
       call_kapp(0, 0, 0.0, atm)  # N=0: initialize + continuum
       return get_continuum_opacity()  # Read from COMMON /OPTOT/
   end
   ```

**Dependencies**: Task 1 (atlas7v ccall)

**Estimated Iterations**: 6-10

**Commit**: "Implement xnfpelsyn: atmosphere preparation with Atlas7v ccall"

---

### Task 6: synthe - Line Opacity Accumulation

**Test**:
```julia
@testset "synthe line opacity" begin
    atm = load_solar_atmosphere()
    lines = read_gfalllines("gf5000.asc", 5000.0, 5100.0)
    config = SyntheConfig(...)

    opacity_grid = compute_line_opacities(atm, lines, config)

    # Validate grid dimensions
    n_wavelengths = calculate_n_wavelengths(config)
    @test size(opacity_grid) == (n_wavelengths, atm.n_depths)

    # Validate opacity values
    @test all(opacity_grid .>= 0)  # Non-negative
    @test all(isfinite.(opacity_grid))

    # Optional: Compare with Fortran
    # ref = h5read("fort_9_opacity_grid.h5")
    # @test opacity_grid ≈ ref rtol=1e-3  # Line opacity is approximate
end
```

**Implementation**:

**1. Wavelength grid**:
```julia
function wavelength_grid(config::SyntheConfig)
    ratio_lg = log(1 + 1/config.resolving_power)
    n_points = floor(Int, log(config.wave_end / config.wave_start) / ratio_lg) + 1

    wavelengths = [config.wave_start * exp(i * ratio_lg) for i in 0:n_points-1]
    return wavelengths
end
```

**2. Voigt profile**:
```julia
using SpecialFunctions  # erfcx for Voigt

function voigt_profile(nu::Float64, nu0::Float64, gamma_total::Float64, doppler_width::Float64)
    # Normalized frequency offset
    x = (nu - nu0) / doppler_width

    # Damping parameter
    a = gamma_total / doppler_width

    # Voigt function via Faddeeva
    # H(a, x) = Re[erfcx(x + i*a)] / (√π * doppler_width)

    z = x + im * a
    w = erfcx(-im * z)  # Faddeeva function

    return real(w) / (sqrt(π) * doppler_width)
end
```

**3. Opacity loop**:
```julia
function compute_line_opacities(atm, lines, config)
    wavelengths = wavelength_grid(config)
    n_wave = length(wavelengths)
    n_depth = atm.n_depths

    opacity = zeros(n_wave, n_depth)

    for (i, wave) in enumerate(wavelengths)
        # Find lines within ~10 Å (Voigt wings)
        nearby_lines = filter(l -> abs(l.wavelength - wave) < 10.0, lines)

        for line in nearby_lines
            for j in 1:n_depth
                # Compute line profile
                gamma_total = compute_damping(line, atm, j)
                doppler_width = compute_doppler_width(line, atm, j, config)

                nu = c / (wave * 1e-8)  # Hz
                nu0 = c / (line.wavelength * 1e-8)

                profile = voigt_profile(nu, nu0, gamma_total, doppler_width)

                # Accumulate opacity
                opacity[i, j] += line_opacity_coefficient(line, atm, j) * profile
            end
        end
    end

    return opacity
end
```

**Dependencies**: None (pure Julia), but uses SpecialFunctions.jl

**Estimated Iterations**: 10-15 (most complex pure-Julia task)

**Commit**: "Implement synthe: line opacity accumulation loop"

---

### 🛑 CHECKPOINT 2: Core Pipeline Complete

**After Tasks 5-6**:
1. Stop work
2. Report to Paula:
   - Atmosphere preparation working
   - Line opacity calculation working
   - Estimated credit consumed (~$50-70 total)
3. Decision: Continue to spectrum synthesis or wrap up?

---

### Task 7: spectrv - Spectrum Synthesis

**Test**:
```julia
@testset "spectrv synthesis" begin
    atm = load_solar_atmosphere()
    line_opacity = load("test_opacity_grid.jld2")
    config = SyntheConfig(...)

    spectrum = synthesize_spectrum(atm, line_opacity, config)

    @test length(spectrum.wavelength) > 0
    @test length(spectrum.flux) == length(spectrum.wavelength)
    @test all(spectrum.flux .> 0)  # Flux must be positive

    # Optional: Compare with Fortran
    # ref = load_fortran_spectrum("fort.7")
    # @test spectrum.flux ≈ ref.flux rtol=0.01  # 1% tolerance
end
```

**Implementation**:
```julia
function synthesize_spectrum(atm::AtmosphereModel, line_opacity::Matrix{Float64}, config::SyntheConfig)
    wavelengths = wavelength_grid(config)
    flux = zeros(length(wavelengths))

    for (i, wave) in enumerate(wavelengths)
        # Get total opacity: continuum + line
        total_opacity = continuum_opacity[i, :] .+ line_opacity[i, :]

        # Call JOSH for radiative transfer
        set_opacity!(total_opacity)
        flux[i] = call_josh(1, 1, atm)  # Scattering=1, Surface flux=1
    end

    return Spectrum(wavelengths, flux)
end
```

**Dependencies**: Task 1 (JOSH ccall)

**Estimated Iterations**: 5-8

**Commit**: "Implement spectrv: spectrum synthesis with JOSH ccall"

---

### Task 8: broaden - Instrumental Broadening

**Test**:
```julia
@testset "broaden instrumental" begin
    # Create test spectrum (Gaussian line)
    wavelengths = 5000.0:0.01:5001.0
    flux = exp.(-((wavelengths .- 5000.5) ./ 0.05).^2)
    spectrum = Spectrum(wavelengths, flux)

    # Apply broadening
    fwhm = 0.1  # Å
    broadened = gaussian_broaden(spectrum, fwhm)

    # Validate broadening
    @test length(broadened.flux) == length(spectrum.flux)
    @test maximum(broadened.flux) < maximum(spectrum.flux)  # Peak reduced

    # Optional: Compare with Fortran
    # ref = load_fortran_spectrum("fort.7_broadened")
    # @test broadened.flux ≈ ref.flux rtol=1e-3
end
```

**Implementation**:
```julia
using FFTW

function gaussian_broaden(spectrum::Spectrum, fwhm::Float64)
    n = length(spectrum.wavelength)
    dwave = spectrum.wavelength[2] - spectrum.wavelength[1]

    # Gaussian kernel
    sigma = fwhm / (2 * sqrt(2 * log(2)))
    kernel_size = ceil(Int, 5 * sigma / dwave)  # 5σ cutoff
    x = (-kernel_size:kernel_size) * dwave
    kernel = exp.(-x.^2 / (2 * sigma^2))
    kernel ./= sum(kernel)  # Normalize

    # FFT convolution
    flux_padded = [spectrum.flux; zeros(2*kernel_size)]
    kernel_padded = [kernel; zeros(n - 2*kernel_size - 1)]

    flux_fft = fft(flux_padded)
    kernel_fft = fft(kernel_padded)

    result_fft = flux_fft .* kernel_fft
    result = real(ifft(result_fft))

    return Spectrum(spectrum.wavelength, result[1:n])
end
```

**Dependencies**: FFTW.jl

**Estimated Iterations**: 3-5

**Commit**: "Implement broaden: Gaussian instrumental broadening"

---

### Task 9: End-to-End Pipeline Test

**Test**:
```julia
@testset "Full SYNTHE pipeline" begin
    config = SyntheConfig(
        wave_start = 5000.0,
        wave_end = 5100.0,
        resolving_power = 50000.0,
        turbulent_velocity = 2.0,
        vacuum_wavelengths = true,
        nlte = false,
        cutoff = 0.001
    )

    spectrum = synthe_pipeline(
        "test/phase5_minimal_synthe/input/atmosphere/solar_atlas12.mod",
        [
            "test/phase5_minimal_synthe/input/line_lists/atomic/gf5000.asc",
            "test/phase5_minimal_synthe/input/line_lists/molecular/ch.asc",
            "test/phase5_minimal_synthe/input/line_lists/molecular/cn.asc",
            "test/phase5_minimal_synthe/input/line_lists/molecular/co.asc"
        ],
        config
    )

    # Load Fortran reference
    ref = load_fortran_spectrum("test/phase5_minimal_synthe/fortran_reference/fort.7")

    # Validate
    @test spectrum.wavelength ≈ ref.wavelength rtol=1e-10
    @test spectrum.flux ≈ ref.flux rtol=0.01  # 1% error acceptable

    # Save output
    save_spectrum("test/phase5_minimal_synthe/julia_output/spectrum.dat", spectrum)

    # Visual validation
    plot_comparison(spectrum, ref, "solar_comparison.png")
end
```

**Implementation**:
```julia
function synthe_pipeline(atmosphere_file::String, line_lists::Vector{String}, config::SyntheConfig)
    # 1. Read atmosphere
    atm = read_atlas_model(atmosphere_file)

    # 2. Read line lists
    atomic_lines = read_gfalllines(line_lists[1], config.wave_start, config.wave_end)
    molecular_lines = vcat([
        read_molecular_lines(f, molecule_from_filename(f), config.wave_start, config.wave_end)
        for f in line_lists[2:end]
    ]...)

    lines = vcat(atomic_lines, molecular_lines)

    # 3. Atmosphere preparation
    populations = compute_populations(atm)
    continuum_opacity = compute_continuum_opacities(atm, populations)

    # 4. Line opacities
    line_opacity = compute_line_opacities(atm, lines, config)

    # 5. Spectrum synthesis
    spectrum = synthesize_spectrum(atm, line_opacity, config)

    # 6. Broadening
    fwhm = compute_instrumental_fwhm(config)
    spectrum_broadened = gaussian_broaden(spectrum, fwhm)

    return spectrum_broadened
end
```

**Dependencies**: All previous tasks

**Estimated Iterations**: 5-10 (integration and debugging)

**Commit**: "Add end-to-end pipeline test and validation"

---

## Checkpoint Protocol

**After Tasks 1-2** (setup complete):
- Stop and report to Paula
- Credit check
- Decision: Continue?

**After Tasks 3-4** (line readers complete):
- Stop and report to Paula
- Wait for atlas7v compilation
- Credit check

**After Tasks 5-6** (core pipeline complete):
- Stop and report to Paula
- Credit check
- Decision: Finish or wrap up?

**After Task 9** (complete):
- Final report to Paula
- Total credit usage
- Success metrics

---

## Success Criteria

### Minimum Viable (if credit runs low)
- ✅ Atlas7v ccall interface working (Task 1)
- ✅ At least one line reader working (Task 3)
- ✅ TDD framework in place
- ✅ Clear documentation of what's complete

### Target Success (if budget allows)
- ✅ All 9 tasks complete
- ✅ End-to-end test passing (< 1% error)
- ✅ Comparison plot showing Julia vs Fortran
- ✅ Documentation of what works

---

## Documentation Deliverables

### Phase 5 Completion

1. **PHASE5_RESULTS.md**: What works, what doesn't, comparison plots
2. **ATLAS7V_CCALL_GUIDE.md**: How to call Fortran from Julia (for future work)
3. **NEXT_STEPS.md**: Roadmap for Phase 6 (if funded)
4. **Journal entry**: 2025-11-14_phase5_completion.md

---

## Estimated Credit Usage

| Task | Description | Iterations | Credit |
|------|-------------|------------|--------|
| 0 | Preparation | 3-5 | ~$10-15 |
| 2 | synbeg | 3-5 | ~$5-10 |
| 3 | rgfalllinesnew | 5-8 | ~$10-15 |
| 4 | rmolecasc | 5-8 | ~$10-15 |
| **Checkpoint** | **Line readers** | **~20** | **~$35-55** |
| 1 | atlas7v ccall | 8-12 | ~$15-25 |
| 5 | xnfpelsyn | 6-10 | ~$10-20 |
| 6 | synthe | 10-15 | ~$20-30 |
| 7 | spectrv | 5-8 | ~$10-15 |
| 8 | broaden | 3-5 | ~$5-10 |
| 9 | Pipeline | 5-10 | ~$10-20 |
| **Total** | | **40-60** | **$80-135** |

**Notes**:
- Task 6 (line opacity) is most expensive
- Task 1 (ccall) may require debugging
- If budget tight, stop after Task 6 (core pipeline working)

---

**Version History**:
- v1.0: Initial mission brief (2025-11-11, before Task 0)
- v1.1: Updated after Task 0 documentation review (2025-11-11)

**Created by**: Claude (Task 0)
**For**: Paula + future Claude sessions
**Status**: Ready for implementation (Tasks 1-9)
