"""
Atomic Line Reader for SYNTHE gfall Format

Reads gfall-format atomic line data from Kurucz/VALD databases.

Functions:
- `parse_gfall_line(line_str)` - Parse single gfall line to SpectralLine
- `read_gfall_lines(filepath, λ_start, λ_end, margin)` - Read and filter lines
- `compute_nbuff(wavelength, λ_min, λ_max, n_points)` - Wavelength grid indexing
"""

"""
    parse_gfall_line(line_str::String) -> SpectralLine

Parse a single gfall-format line into a SpectralLine struct.

# Gfall Format (fixed-width columns):
- Columns 1-11:   Wavelength (Å)
- Columns 12-18:  loggf
- Columns 19-24:  Element.ion code (e.g., 26.00 = Fe I)
- Columns 25-36:  E_lower (cm⁻¹)
- Columns 37-43:  J_lower
- Columns 44-58:  Label_lower (not used)
- Columns 59-70:  E_upper (cm⁻¹)
- Columns 71-77:  J_upper
- Columns 78-92:  Label_upper (not used)
- Columns 93-97:  log(gamma_rad)
- Columns 98-103: log(gamma_stark)
- Columns 104-109: log(gamma_vdw)

# Example
```julia
line = "   500.0003 -6.421 29.00   77905.500  2.5 s(3D)5d 4D   57911.090  3.5 5f 2F       7.86 -3.96 -7.13K12"
sl = parse_gfall_line(line)
```
"""
function parse_gfall_line(line_str::String)::SpectralLine
    # Parse fixed-width columns
    wavelength = parse(Float64, line_str[1:11])
    loggf = parse(Float64, line_str[12:18])
    element_ion = parse(Float64, line_str[19:24])
    e_lower = parse(Float64, line_str[25:36])
    j_lower = parse(Float64, line_str[37:43])
    # Skip labels (44-58, 78-92)
    e_upper = parse(Float64, line_str[59:70])
    j_upper = parse(Float64, line_str[71:77])
    
    # Parse damping parameters (log values)
    # Some lines may not have all damping parameters, use defaults
    log_gamma_rad = length(line_str) >= 97 ? parse(Float64, line_str[93:97]) : 0.0
    log_gamma_stark = length(line_str) >= 103 ? parse(Float64, line_str[98:103]) : 0.0
    log_gamma_vdw = length(line_str) >= 109 ? parse(Float64, line_str[104:109]) : 0.0
    
    # Convert from log to linear
    gamma_rad = 10.0^log_gamma_rad
    gamma_stark = 10.0^log_gamma_stark
    gamma_vdw = 10.0^log_gamma_vdw
    
    # Default alpha for vdW (typical value)
    alpha = 0.4
    
    # nbuff will be computed later by compute_nbuff
    nbuff = 0  # Placeholder
    
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
end

"""
    compute_nbuff(wavelength, λ_min, λ_max, n_points) -> Int

Compute wavelength grid index for logarithmic wavelength grid.

SYNTHE uses a logarithmic wavelength grid where:
- Spacing is uniform in log(λ)
- Index 1 corresponds to λ_min
- Index n_points corresponds to λ_max

# Arguments
- `wavelength::Float64`: Line wavelength (Å)
- `λ_min::Float64`: Minimum wavelength of grid (Å)
- `λ_max::Float64`: Maximum wavelength of grid (Å)
- `n_points::Int`: Number of grid points

# Returns
- `nbuff::Int`: Grid index (clamped to [1, n_points])

# Example
```julia
# For a grid from 5000-5100 Å with 10000 points
nbuff = compute_nbuff(5050.0, 5000.0, 5100.0, 10000)
```
"""
function compute_nbuff(wavelength::Float64, λ_min::Float64, λ_max::Float64, n_points::Int)::Int
    # Logarithmic spacing: index = (log(λ) - log(λ_min)) / (log(λ_max) - log(λ_min)) * (n_points - 1) + 1
    if wavelength <= λ_min
        return 1
    elseif wavelength >= λ_max
        return n_points
    else
        log_ratio = (log(wavelength) - log(λ_min)) / (log(λ_max) - log(λ_min))
        nbuff = round(Int, log_ratio * (n_points - 1) + 1)
        # Clamp to valid range
        return clamp(nbuff, 1, n_points)
    end
end

"""
    read_gfall_lines(filepath, λ_start, λ_end, margin=10.0) -> Vector{SpectralLine}

Read and filter atomic lines from gfall-format file.

Reads all lines from file and filters to wavelength range [λ_start - margin, λ_end + margin].
The margin ensures lines with wings extending into the synthesis range are included.

# Arguments
- `filepath::String`: Path to gfall file
- `λ_start::Float64`: Start wavelength (Å)
- `λ_end::Float64`: End wavelength (Å)
- `margin::Float64`: Safety margin for line wings (default 10.0 Å)

# Returns
- `lines::Vector{SpectralLine}`: Filtered lines within wavelength range

# Example
```julia
# Read Fe I lines around 5000 Å with 10 Å margin
lines = read_gfall_lines("gfall.dat", 4990.0, 5010.0, 10.0)
```
"""
function read_gfall_lines(filepath::String, λ_start::Float64, λ_end::Float64, margin::Float64=10.0)::Vector{SpectralLine}
    lines = SpectralLine[]

    # Extended wavelength range with margin
    λ_min = λ_start - margin
    λ_max = λ_end + margin

    # Compute grid parameters for nbuff
    # Use a standard high-resolution grid (this matches SYNTHE convention)
    n_points = 100000

    open(filepath, "r") do file
        for line_str in eachline(file)
            # Skip empty lines
            if length(line_str) < 11
                continue
            end

            # Quick wavelength check before full parsing
            # (optimization: only parse lines in range)
            try
                wavelength_str = strip(line_str[1:11])
                wavelength = parse(Float64, wavelength_str)

                # Only parse lines within wavelength range
                if wavelength >= λ_min && wavelength <= λ_max
                    spectral_line = parse_gfall_line(line_str)

                    # Compute nbuff for this line
                    nbuff = compute_nbuff(wavelength, λ_start, λ_end, n_points)

                    # Create new SpectralLine with computed nbuff
                    spectral_line_with_nbuff = SpectralLine(
                        nbuff,
                        spectral_line.wavelength,
                        spectral_line.loggf,
                        spectral_line.element_ion,
                        spectral_line.e_lower,
                        spectral_line.e_upper,
                        spectral_line.j_lower,
                        spectral_line.j_upper,
                        spectral_line.gamma_rad,
                        spectral_line.gamma_stark,
                        spectral_line.gamma_vdw,
                        spectral_line.alpha
                    )

                    push!(lines, spectral_line_with_nbuff)
                end
            catch e
                # Skip malformed lines
                continue
            end
        end
    end

    return lines
end
