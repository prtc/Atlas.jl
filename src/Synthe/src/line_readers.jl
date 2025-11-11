"""
Line readers for SYNTHE pipeline

**Tasks 3-4**: Implement rgfalllinesnew and rmolecasc

Based on Deep Dive 12: SYNTHE Line Reading Pipeline
"""

"""
    parse_gfall_line(line_str::String)

Parse a single gfall format line

**Format** (from Deep Dive 12):
```
F11.4  F7.3  F6.2  F12.3  F5.1  F12.3  F5.1  A1  A10  A10
```

**Returns**: `SpectralLine` or `nothing` if parsing fails
"""
function parse_gfall_line(line_str::String)
    # Skip empty or comment lines
    if isempty(strip(line_str)) || startswith(line_str, "#")
        return nothing
    end

    # Ensure line is long enough
    if length(line_str) < 58
        return nothing
    end

    try
        # Parse fixed-width fields
        wavelength = parse(Float64, line_str[1:11])
        loggf = parse(Float64, line_str[12:18])
        element_ion = parse(Float64, line_str[19:24])
        e_lower = parse(Float64, line_str[25:36])
        j_lower = parse(Float64, line_str[37:41])
        e_upper = parse(Float64, line_str[42:53])
        j_upper = parse(Float64, line_str[54:58])

        # Extract element and ionization stage
        iz = floor(Int, element_ion)
        ion_stage = round(Int, (element_ion - iz) * 100)

        # Compute damping parameters
        # Radiative damping: Unsöld approximation (approximate)
        gamma_rad = compute_radiative_damping(wavelength, e_lower, e_upper, loggf)

        # Collisional damping: Default values (order of magnitude estimates)
        # Stark (electron collisions)
        gamma_stark = 1.0e-5  # Default for neutrals

        # van der Waals (H collisions)
        gamma_vdw = 1.0e-7    # Default
        alpha = 0.4           # Typical exponent

        # Note: NBUFF will be set later if params provided
        nbuff = 0

        return SpectralLine(
            nbuff,
            wavelength,
            loggf,
            element_ion,
            e_lower,
            e_upper,
            j_lower,
            j_upper,
            gamma_rad,
            gamma_stark,
            gamma_vdw,
            alpha
        )
    catch e
        # Failed to parse - skip this line
        return nothing
    end
end

"""
    compute_radiative_damping(wavelength::Float64, e_lower::Float64, e_upper::Float64, loggf::Float64)

Compute radiative damping width using Unsöld approximation

**Formula** (approximate):
```
Γ_rad ≈ (2π e² / (m_e c)) × (ν² / c) × gf
```

**Returns**: Radiative damping in Hz
"""
function compute_radiative_damping(wavelength::Float64, e_lower::Float64, e_upper::Float64, loggf::Float64)
    # Constants (CGS)
    c = 2.99792458e10      # cm/s
    e = 4.80320425e-10     # esu
    m_e = 9.10938356e-28   # g

    # Frequency
    nu = c / (wavelength * 1.0e-8)  # Hz (wavelength in Å → cm)

    # gf value
    gf = 10.0^loggf

    # Classical damping constant
    gamma_classical = (8 * π^2 * e^2) / (3 * m_e * c^3)  # s⁻¹ Hz⁻²

    # Radiative damping
    gamma_rad = gamma_classical * nu^2 * gf  # Hz

    return gamma_rad
end

"""
    read_gfalllines(filename::String, wave_start::Float64, wave_end::Float64, params::Union{Fort93Params,Nothing}=nothing)

Read atomic lines from Kurucz gfall format

**Task 3**: Implement rgfalllinesnew atomic line reader

**Format** (from Deep Dive 12):
```
F11.4  F7.3  F6.2  F12.3  F5.1  F12.3  F5.1  A1  A10  A10
```

**Fields**:
- Column 1-11: Wavelength (Å)
- Column 12-18: log(gf)
- Column 19-24: Element.ion code (26.00 = Fe I, 26.01 = Fe II)
- Column 25-36: Lower level energy (cm⁻¹)
- Column 37-41: Lower level J
- Column 42-53: Upper level energy (cm⁻¹)
- Column 54-58: Upper level J
- Column 59: Identification flag
- Column 60-69: Lower level term
- Column 70-79: Upper level term

**Example line**:
```
 2600.1720 -2.570 26.0  18500.123  3.5  57002.456  2.5 'a 5D      ' 'z 5P*     '
```

**Algorithm**:
1. Open gfall file
2. Read each line with fixed-width format
3. Filter by wavelength range [wave_start - 10, wave_end + 10]
4. Convert to SpectralLine struct
5. If params provided, compute NBUFF index
6. Return vector of lines

**Returns**: `Vector{SpectralLine}`
"""
function read_gfalllines(filename::String, wave_start::Float64, wave_end::Float64, params::Union{Fort93Params,Nothing}=nothing)
    lines = SpectralLine[]

    # Wavelength filtering margin (for Voigt wings)
    margin = 10.0  # Å

    open(filename, "r") do file
        for line_str in eachline(file)
            # Parse line
            line = parse_gfall_line(line_str)

            if isnothing(line)
                continue  # Skip invalid lines
            end

            # Wavelength filtering
            if line.wavelength < wave_start - margin || line.wavelength > wave_end + margin
                continue  # Outside wavelength range
            end

            # Compute NBUFF if params provided
            if !isnothing(params)
                nbuff = wavelength_to_nbuff(line.wavelength, params)
                line = SpectralLine(
                    nbuff,
                    line.wavelength,
                    line.loggf,
                    line.element_ion,
                    line.e_lower,
                    line.e_upper,
                    line.j_lower,
                    line.j_upper,
                    line.gamma_rad,
                    line.gamma_stark,
                    line.gamma_vdw,
                    line.alpha
                )
            end

            push!(lines, line)
        end
    end

    return lines
end

"""
    read_molecular_lines(filename::String, molecule::String, wave_start::Float64, wave_end::Float64)

Read molecular lines from ASCII format

**Task 4**: Implement rmolecasc molecular line reader

**Supported molecules** (from Deep Dive 12):
- CH (NELION=246)
- CN (NELION=270)
- CO (NELION=276)
- NH (NELION=252)
- OH (NELION=258)
- MgH (NELION=300)
- SiH (NELION=312)
- CaH (NELION=342)
- FeH (NELION=432)

**Skipped for Phase 5** (cool stars only):
- TiO (rschwenk.for - binary format)
- H2O (rh2ofast.for - binary format)

**Format**: Varies by molecule, but typically ASCII with columns:
```
wavelength  log(gf)  E_lower  E_upper  ISO  [additional fields]
```

**Algorithm**:
1. Open molecular file
2. Read ASCII format (space-delimited or fixed-width)
3. Map ISO code to NELION (species code)
4. Apply isotopic abundance corrections
5. Filter by wavelength
6. Convert to SpectralLine struct

**Isotopic abundance corrections** (from Deep Dive 12):
```julia
# Example for ¹²C¹⁶O (ISO=17):
X1 = -0.005    # log₁₀([¹²C/C_solar])
X2 = 0.0       # log₁₀([¹⁶O/O_solar]) - most abundant
FUDGE = 0.0    # Empirical correction

gf_corrected = exp((loggf + X1 + X2 + FUDGE) * ln(10))
```

**Returns**: `Vector{SpectralLine}`

**Status**: NOT IMPLEMENTED (Task 4)
"""
function read_molecular_lines(filename::String, molecule::String, wave_start::Float64, wave_end::Float64)
    error("Task 4 not yet implemented: rmolecasc molecular line reader")
end

"""
    combine_line_lists(atomic_lines::Vector{SpectralLine}, molecular_lines::Vector{SpectralLine})

Combine atomic and molecular line lists

**Algorithm**:
1. Concatenate atomic + molecular lines
2. Sort by wavelength (for efficient opacity loop)
3. Return combined list

**Note**: Fortran fort.12 format appends without sorting. We sort here for performance.

**Returns**: `Vector{SpectralLine}` (sorted by wavelength)

**Status**: NOT IMPLEMENTED (Tasks 3-4)
"""
function combine_line_lists(atomic_lines::Vector{SpectralLine}, molecular_lines::Vector{SpectralLine})
    error("Tasks 3-4 not yet implemented: line readers")
end
