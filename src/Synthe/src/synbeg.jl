"""
synbeg: Initialize SYNTHE parameters (fort.93 equivalent)

**Task 2**: Parameter initialization and wavelength grid generation

Based on synbeg.for from SYNTHE pipeline
"""

"""
    Fort93Params

Parameters initialized by synbeg (fort.93 file in Fortran)

Corresponds to the shared state in fort.93 that all SYNTHE programs read
"""
struct Fort93Params
    wave_start::Float64          # Starting wavelength (Å)
    wave_end::Float64            # Ending wavelength (Å)
    resolving_power::Float64     # Spectral resolution R = λ/Δλ
    ratio_lg::Float64            # Logarithmic spacing: ln(1 + 1/R)
    ix_wave_start::Int           # Starting wavelength index
    n_points::Int                # Number of wavelength points
    turbulent_velocity::Float64  # Microturbulence (km/s)
    vacuum_wavelengths::Bool     # true = vacuum, false = air
    nlte::Bool                   # true = NLTE, false = LTE
    cutoff::Float64              # Line cutoff threshold
end

"""
    synbeg_initialize(config::SyntheConfig)

Initialize SYNTHE parameters (equivalent to synbeg.for)

**Algorithm** (from synbeg.for):
1. Compute logarithmic wavelength spacing: ratio_lg = ln(1 + 1/R)
2. Compute starting wavelength index in logarithmic grid
3. Compute number of wavelength points
4. Store parameters

**Returns**: `Fort93Params`

**Example**:
```julia
config = SyntheConfig(
    wave_start = 5000.0,
    wave_end = 5100.0,
    resolving_power = 50000.0,
    turbulent_velocity = 2.0,
    vacuum_wavelengths = true,
    nlte = false,
    cutoff = 0.001
)

params = synbeg_initialize(config)
```
"""
function synbeg_initialize(config::SyntheConfig)
    # Logarithmic wavelength spacing
    # For resolution R = λ/Δλ, adjacent wavelengths satisfy:
    # λ_{i+1}/λ_i = 1 + 1/R
    # Therefore: ln(λ_{i+1}) - ln(λ_i) = ln(1 + 1/R) = ratio_lg
    ratio_lg = log(1.0 + 1.0 / config.resolving_power)

    # Starting wavelength index
    # Compute index such that exp(ix_wave_start * ratio_lg) ≈ wave_start
    ix_wave_start_real = log(config.wave_start) / ratio_lg
    ix_wave_start = floor(Int, ix_wave_start_real)

    # Adjust if needed to ensure exp(ix_wave_start * ratio_lg) <= wave_start
    if exp(ix_wave_start * ratio_lg) < config.wave_start
        ix_wave_start += 1
    end

    # Number of wavelength points
    # Find how many steps to reach wave_end
    ix_wave_end_real = log(config.wave_end) / ratio_lg
    ix_wave_end = ceil(Int, ix_wave_end_real)

    n_points = ix_wave_end - ix_wave_start + 1

    return Fort93Params(
        config.wave_start,
        config.wave_end,
        config.resolving_power,
        ratio_lg,
        ix_wave_start,
        n_points,
        config.turbulent_velocity,
        config.vacuum_wavelengths,
        config.nlte,
        config.cutoff
    )
end

"""
    wavelength_grid(config::SyntheConfig)

Generate logarithmically-spaced wavelength grid

**Algorithm**:
```
λ_i = λ_start × exp(i × ratio_lg)
```

where `ratio_lg = ln(1 + 1/R)` and `R` is resolving power.

**Returns**: `Vector{Float64}` of wavelengths (Å)

**Example**:
```julia
wavelengths = wavelength_grid(config)
# [5000.0, 5000.1, 5000.2, ..., 5100.0]
```
"""
function wavelength_grid(config::SyntheConfig)
    ratio_lg = log(1.0 + 1.0 / config.resolving_power)

    # Compute starting index
    ix_start_real = log(config.wave_start) / ratio_lg
    ix_start = floor(Int, ix_start_real)

    # Adjust to ensure first wavelength >= wave_start
    if exp(ix_start * ratio_lg) < config.wave_start
        ix_start += 1
    end

    # Compute ending index
    ix_end_real = log(config.wave_end) / ratio_lg
    ix_end = ceil(Int, ix_end_real)

    # Generate grid
    n_points = ix_end - ix_start + 1
    wavelengths = zeros(n_points)

    for i in 1:n_points
        ix = ix_start + i - 1
        wavelengths[i] = exp(ix * ratio_lg)
    end

    return wavelengths
end

"""
    wavelength_to_nbuff(wavelength::Float64, params::Fort93Params)

Convert wavelength to NBUFF index in logarithmic grid

**Algorithm** (from SYNTHE line readers):
```
IXWL = log(wavelength) / ratio_lg + 0.5  # Round to nearest
NBUFF = IXWL - ix_wave_start + 1
```

**Returns**: `Int` (index in wavelength grid, 1-indexed)

**Example**:
```julia
nbuff = wavelength_to_nbuff(5050.0, params)  # Index of 5050 Å
```
"""
function wavelength_to_nbuff(wavelength::Float64, params::Fort93Params)
    # Compute index in full logarithmic grid
    ix_wave = round(Int, log(wavelength) / params.ratio_lg)

    # Convert to offset from grid start (1-indexed)
    nbuff = ix_wave - params.ix_wave_start + 1

    return nbuff
end
