"""
Molecular line reader support functions

ISO code mapping, isotopic abundances, and molecular line parsing
"""

# ISO code to NELION (species code) mapping
# From Deep Dive 12, rmolecasc dispatch table
const ISO_TO_NELION = Dict{Int, Int}(
    1 => 240,    # ¹H₂ (H2)
    2 => 240,    # HD (deuterated H2)
    10 => 246,   # ¹²C¹H (CH)
    11 => 246,   # ¹³C¹H (CH isotopologue)
    12 => 270,   # ¹²C¹⁴N (CN)
    13 => 270,   # ¹³C¹⁴N (CN isotopologue)
    14 => 252,   # ¹⁴N¹H (NH)
    15 => 252,   # ¹⁵N¹H (NH isotopologue)
    16 => 258,   # ¹⁶O¹H (OH)
    17 => 276,   # ¹²C¹⁶O (CO) - most abundant
    18 => 276,   # ¹³C¹⁶O (CO isotopologue)
    19 => 276,   # ¹²C¹⁸O (CO isotopologue)
    24 => 300,   # ²⁴Mg¹H (MgH)
    25 => 300,   # ²⁵Mg¹H (MgH isotopologue)
    26 => 300,   # ²⁶Mg¹H (MgH isotopologue)
    28 => 312,   # ²⁸Si¹H (SiH)
    29 => 312,   # ²⁹Si¹H (SiH isotopologue)
    30 => 312,   # ³⁰Si¹H (SiH isotopologue)
    40 => 342,   # ⁴⁰Ca¹H (CaH)
    42 => 342,   # ⁴²Ca¹H (CaH isotopologue)
    43 => 342,   # ⁴³Ca¹H (CaH isotopologue)
    44 => 342,   # ⁴⁴Ca¹H (CaH isotopologue)
    56 => 432,   # ⁵⁶Fe¹H (FeH)
    57 => 432,   # ⁵⁷Fe¹H (FeH isotopologue)
    58 => 432,   # ⁵⁸Fe¹H (FeH isotopologue)
)

# Isotopic abundance corrections (X1, X2, FUDGE)
# Based on solar abundances, from Deep Dive 12
const ISOTOPIC_ABUNDANCES = Dict{Int, NamedTuple}(
    1 => (X1=0.0, X2=0.0, FUDGE=0.0),      # ¹H₂ (most abundant)
    10 => (X1=-0.005, X2=0.0, FUDGE=0.0),  # ¹²C¹H
    12 => (X1=-0.005, X2=0.0, FUDGE=0.0),  # ¹²C¹⁴N
    17 => (X1=-0.005, X2=0.0, FUDGE=0.0),  # ¹²C¹⁶O (most abundant CO)
    24 => (X1=0.0, X2=0.0, FUDGE=0.0),     # ²⁴Mg¹H (most abundant Mg)
    28 => (X1=0.0, X2=0.0, FUDGE=0.0),     # ²⁸Si¹H (most abundant Si)
    # Add more as needed, defaulting to zeros for unlisted
)

"""
    iso_to_nelion(iso::Int)

Convert ISO code to NELION (species code)
"""
function iso_to_nelion(iso::Int)
    return ISO_TO_NELION[iso]
end

"""
    get_isotopic_abundance(iso::Int)

Get isotopic abundance corrections for ISO code
"""
function get_isotopic_abundance(iso::Int)
    return get(ISOTOPIC_ABUNDANCES, iso, (X1=0.0, X2=0.0, FUDGE=0.0))
end

"""
    parse_molecular_line(line_str::String, iso::Int)

Parse a single molecular line (space-delimited format)
"""
function parse_molecular_line(line_str::String, iso::Int)
    if isempty(strip(line_str)) || startswith(line_str, "#")
        return nothing
    end

    try
        fields = split(strip(line_str))
        if length(fields) < 5
            return nothing
        end

        wavelength = parse(Float64, fields[1])
        loggf = parse(Float64, fields[2])
        e_lower = parse(Float64, fields[3])
        e_upper = parse(Float64, fields[4])

        nelion = iso_to_nelion(iso)
        abund = get_isotopic_abundance(iso)
        loggf_corrected = loggf + abund.X1 + abund.X2 + abund.FUDGE

        gamma_rad = 1.0e6
        gamma_stark = 3.0e-6
        gamma_vdw = 1.0e-8
        alpha = 0.4

        return SpectralLine(
            0, wavelength, loggf_corrected, Float64(nelion),
            e_lower, e_upper, 0.0, 0.0,
            gamma_rad, gamma_stark, gamma_vdw, alpha
        )
    catch e
        return nothing
    end
end

"""
    read_molecular_lines(filename::String, molecule::String, wave_start::Float64, wave_end::Float64, params::Union{Fort93Params,Nothing}=nothing)

Read molecular lines from ASCII format
"""
function read_molecular_lines(filename::String, molecule::String, wave_start::Float64, wave_end::Float64, params::Union{Fort93Params,Nothing}=nothing)
    lines = SpectralLine[]
    margin = 10.0

    iso = if molecule == "CH"
        10
    elseif molecule == "CN"
        12
    elseif molecule == "CO"
        17
    elseif molecule == "NH"
        14
    elseif molecule == "OH"
        16
    elseif molecule == "MgH"
        24
    elseif molecule == "SiH"
        28
    elseif molecule == "CaH"
        40
    elseif molecule == "FeH"
        56
    else
        error("Unknown molecule: $molecule")
    end

    open(filename, "r") do file
        for line_str in eachline(file)
            line = parse_molecular_line(line_str, iso)

            if isnothing(line)
                continue
            end

            if line.wavelength < wave_start - margin || line.wavelength > wave_end + margin
                continue
            end

            if !isnothing(params)
                nbuff = wavelength_to_nbuff(line.wavelength, params)
                line = SpectralLine(
                    nbuff, line.wavelength, line.loggf, line.element_ion,
                    line.e_lower, line.e_upper, line.j_lower, line.j_upper,
                    line.gamma_rad, line.gamma_stark, line.gamma_vdw, line.alpha
                )
            end

            push!(lines, line)
        end
    end

    return lines
end

"""
    combine_line_lists(atomic_lines::Vector{SpectralLine}, molecular_lines::Vector{SpectralLine})

Combine and sort atomic and molecular line lists
"""
function combine_line_lists(atomic_lines::Vector{SpectralLine}, molecular_lines::Vector{SpectralLine})
    combined = vcat(atomic_lines, molecular_lines)
    sort!(combined, by = line -> line.wavelength)
    return combined
end
