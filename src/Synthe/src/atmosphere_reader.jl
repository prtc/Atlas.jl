"""
Atmosphere model reader for ATLAS9/ATLAS12 format

Reads model atmosphere files in ATLAS9 format and returns AtmosphereModel struct.

Functions:
- read_atlas9_model() - Read ATLAS9 .dat file
- parse_atlas9_header() - Parse header (T_eff, log g, abundances)
- parse_atlas9_structure() - Parse depth structure (T, P, n_e, τ_ross)

Format:
- Header: TEFF, GRAVITY, abundances, opacity switches
- Structure: RHOX (τ_ross), T (K), P (dyne/cm²), XNE (cm⁻³), ...

References:
- Kurucz (1970) "ATLAS: A Computer Program for Calculating Model Atmospheres"
- Kurucz (1993) ATLAS9 documentation

Author: Claude (Local), Paula Coelho
Date: 2025-11-14
"""

"""
    read_atlas9_model(filepath::String) -> AtmosphereModel

Read ATLAS9 format atmosphere model file.

# Arguments
- `filepath::String`: Path to .dat file

# Returns
- `AtmosphereModel`: Parsed atmosphere structure

# File Format
ATLAS9 files contain:
1. Header: TEFF, GRAVITY, abundances
2. Data: τ_ross, T, P, n_e for each depth point

# Example
```julia
atm = read_atlas9_model("test/data/models/ap00t5777g44377k1odfnew.dat")
println("T_eff = ", atm.teff, " K")
println("log g = ", atm.logg)
println("Number of depths = ", atm.n_depths)
```
"""
function read_atlas9_model(filepath::String)
    if !isfile(filepath)
        throw(ArgumentError("File not found: $filepath"))
    end

    lines = readlines(filepath)

    # Parse header
    teff, logg, abundances = parse_atlas9_header(lines)

    # Parse depth structure
    tau_ross, temperature, pressure, electron_density = parse_atlas9_structure(lines)

    n_depths = length(tau_ross)

    # Compute mass density from ideal gas law
    # P = (ρ/μ) * (k_B * T / m_H)
    # where μ = mean molecular weight ≈ 1.3 for solar composition
    # ρ = P * μ * m_H / (k_B * T)

    const k_B = 1.380649e-16  # erg/K (Boltzmann constant)
    const m_H = 1.673557e-24  # g (proton mass)
    const μ_solar = 1.3       # Mean molecular weight (solar composition)

    density = similar(pressure)
    for i in 1:n_depths
        density[i] = pressure[i] * μ_solar * m_H / (k_B * temperature[i])
    end

    # Create AtmosphereModel struct (matching exact struct definition in structs.jl)
    return AtmosphereModel(
        n_depths,
        tau_ross,
        temperature,
        pressure,
        electron_density,
        density,
        abundances
    )
end

"""
    parse_atlas9_header(lines::Vector{String}) -> (Float64, Float64, Vector{Float64})

Parse ATLAS9 file header to extract T_eff, log g, and abundances.

# Returns
- `teff::Float64`: Effective temperature (K)
- `logg::Float64`: Surface gravity log g (cgs)
- `abundances::Vector{Float64}`: Element abundances (log scale, H=12.0)
"""
function parse_atlas9_header(lines::Vector{String})
    teff = 0.0
    logg = 0.0
    abundances = zeros(99)  # Up to 99 elements

    # Default solar abundances (Asplund 2009)
    # H = 12.0 by definition
    abundances[1] = 12.00   # H
    abundances[2] = 10.93   # He

    for line in lines
        # TEFF line
        if startswith(line, "TEFF")
            # Format: "TEFF   5777.  GRAVITY 4.43770 LTE"
            parts = split(line)
            teff = parse(Float64, parts[2])

            # Find GRAVITY
            for (i, p) in enumerate(parts)
                if p == "GRAVITY" && i < length(parts)
                    logg = parse(Float64, parts[i+1])
                    break
                end
            end
        end

        # ABUNDANCE CHANGE lines
        if startswith(strip(line), "ABUNDANCE CHANGE")
            # Format: " ABUNDANCE CHANGE  3 -10.94  4 -10.64  5  -9.49 ..."
            parts = split(line)

            # Skip "ABUNDANCE" and "CHANGE"
            i = 3
            while i < length(parts)
                elem_num = tryparse(Int, parts[i])
                if elem_num !== nothing && i + 1 <= length(parts)
                    abund = tryparse(Float64, parts[i+1])
                    if abund !== nothing && elem_num <= 99
                        abundances[elem_num] = abund
                    end
                    i += 2
                else
                    i += 1
                end
            end
        end
    end

    return teff, logg, abundances
end

"""
    parse_atlas9_structure(lines::Vector{String}) -> (Vector{Float64}, ...)

Parse ATLAS9 depth structure.

# Returns
- `tau_ross::Vector{Float64}`: Rosseland optical depth
- `temperature::Vector{Float64}`: Temperature (K)
- `pressure::Vector{Float64}`: Gas pressure (dyne/cm²)
- `electron_density::Vector{Float64}`: Electron density (cm⁻³)
"""
function parse_atlas9_structure(lines::Vector{String})
    tau_ross = Float64[]
    temperature = Float64[]
    pressure = Float64[]
    electron_density = Float64[]

    # Find start of data section
    in_data = false
    for line in lines
        # Data starts after "READ DECK6" line
        if contains(line, "READ DECK6") || contains(line, "RHOX,T,P,XNE")
            in_data = true
            continue
        end

        if !in_data
            continue
        end

        # Parse data line
        # Format: RHOX  T  P  XNE  ABROSS  ACCRAD  VTURB  FLXCNV  VCONV  VELSND
        # Example: 5.85641157E-04   3650.6 1.604E+01 2.691E+09 ...

        # Skip empty lines or lines starting with non-numeric characters
        stripped = strip(line)
        if isempty(stripped) || !(isdigit(stripped[1]) || stripped[1] == '-')
            continue
        end

        # Try to parse the line
        parts = split(stripped)
        if length(parts) >= 4
            try
                rhox = parse(Float64, parts[1])
                T = parse(Float64, parts[2])
                P = parse(Float64, parts[3])
                XNE = parse(Float64, parts[4])

                push!(tau_ross, rhox)
                push!(temperature, T)
                push!(pressure, P)
                push!(electron_density, XNE)
            catch
                # Skip lines that don't parse
                continue
            end
        end
    end

    return tau_ross, temperature, pressure, electron_density
end
