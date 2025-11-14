"""
Molecular Line Reader for SYNTHE ASCII Format

Reads molecular line data (CH, CN, CO, MgH, etc.) from ASCII format files.

Functions:
- `parse_molecular_line(line_str, molecule)` - Parse single molecular line
- `iso_to_nelion(iso_code, molecule)` - Convert ISO code to NELION code
- `isotopic_abundance_factor(iso_code, molecule)` - Get isotopic abundance
- `read_molecular_lines(filepath, molecule, λ_start, λ_end, margin)` - Read and filter
"""

# Import compute_nbuff from atomic reader
include("line_readers.jl")

"""
    iso_to_nelion(iso_code::Int, molecule::String) -> Int

Convert isotope code to NELION element code used in SYNTHE.

# NELION Mapping:
- CH: 101→246 (¹²C¹H), 102→346 (¹³C¹H), 104→446 (¹²C²H)
- CN: 201→270 (¹²C¹⁴N), 202→370 (¹³C¹⁴N), 301→470 (¹²C¹⁵N)
- CO: 101→276 (¹²C¹⁶O), 102→376 (¹³C¹⁶O), 201→476 (¹²C¹⁷O), 301→576 (¹²C¹⁸O)
- MgH: 24→124 (²⁴Mg¹H), 25→125 (²⁵Mg¹H), 26→126 (²⁶Mg¹H)

# Example
```julia
nelion = iso_to_nelion(101, "CH")  # Returns 246
```
"""
function iso_to_nelion(iso_code::Int, molecule::String)::Int
    molecule_upper = uppercase(molecule)
    
    if molecule_upper == "CH"
        # CH isotopes
        if iso_code == 101
            return 246  # ¹²C¹H
        elseif iso_code == 102
            return 346  # ¹³C¹H
        elseif iso_code == 104
            return 446  # ¹²C²H (deuterium)
        else
            return 246  # Default to main isotope
        end
        
    elseif molecule_upper == "CN"
        # CN isotopes
        if iso_code == 201
            return 270  # ¹²C¹⁴N
        elseif iso_code == 202
            return 370  # ¹³C¹⁴N
        elseif iso_code == 301
            return 470  # ¹²C¹⁵N
        else
            return 270  # Default to main isotope
        end
        
    elseif molecule_upper == "CO"
        # CO isotopes
        if iso_code == 101
            return 276  # ¹²C¹⁶O
        elseif iso_code == 102
            return 376  # ¹³C¹⁶O
        elseif iso_code == 201
            return 476  # ¹²C¹⁷O
        elseif iso_code == 301
            return 576  # ¹²C¹⁸O
        else
            return 276  # Default to main isotope
        end
        
    elseif molecule_upper == "MGH"
        # MgH isotopes (simpler: just add 100 to Mg mass number)
        return 100 + iso_code  # 24→124, 25→125, 26→126
        
    else
        # Generic fallback for other molecules
        return 100 + iso_code
    end
end

"""
    isotopic_abundance_factor(iso_code::Int, molecule::String) -> Float64

Get relative isotopic abundance factor for molecular line.

Returns the fractional abundance of this isotope relative to all isotopes.
Based on solar/terrestrial abundances.

# Example
```julia
abundance = isotopic_abundance_factor(101, "CH")  # ¹²C¹H ≈ 0.989
```
"""
function isotopic_abundance_factor(iso_code::Int, molecule::String)::Float64
    molecule_upper = uppercase(molecule)
    
    if molecule_upper == "CH"
        # Carbon isotopes: ¹²C ≈ 98.9%, ¹³C ≈ 1.1%
        # Hydrogen: ¹H ≈ 99.98%, ²H ≈ 0.02%
        if iso_code == 101
            return 0.989 * 0.9998  # ¹²C¹H
        elseif iso_code == 102
            return 0.011 * 0.9998  # ¹³C¹H
        elseif iso_code == 104
            return 0.989 * 0.0002  # ¹²C²H
        else
            return 1.0
        end
        
    elseif molecule_upper == "CN"
        # Carbon: ¹²C ≈ 98.9%, ¹³C ≈ 1.1%
        # Nitrogen: ¹⁴N ≈ 99.6%, ¹⁵N ≈ 0.4%
        if iso_code == 201
            return 0.989 * 0.996  # ¹²C¹⁴N
        elseif iso_code == 202
            return 0.011 * 0.996  # ¹³C¹⁴N
        elseif iso_code == 301
            return 0.989 * 0.004  # ¹²C¹⁵N
        else
            return 1.0
        end
        
    elseif molecule_upper == "CO"
        # Carbon: ¹²C ≈ 98.9%, ¹³C ≈ 1.1%
        # Oxygen: ¹⁶O ≈ 99.76%, ¹⁷O ≈ 0.04%, ¹⁸O ≈ 0.20%
        if iso_code == 101
            return 0.989 * 0.9976  # ¹²C¹⁶O
        elseif iso_code == 102
            return 0.011 * 0.9976  # ¹³C¹⁶O
        elseif iso_code == 201
            return 0.989 * 0.0004  # ¹²C¹⁷O
        elseif iso_code == 301
            return 0.989 * 0.0020  # ¹²C¹⁸O
        else
            return 1.0
        end
        
    elseif molecule_upper == "MGH"
        # Magnesium isotopes (solar): ²⁴Mg ≈ 79%, ²⁵Mg ≈ 10%, ²⁶Mg ≈ 11%
        # Hydrogen: ¹H ≈ 99.98%
        if iso_code == 24
            return 0.79 * 0.9998  # ²⁴Mg¹H
        elseif iso_code == 25
            return 0.10 * 0.9998  # ²⁵Mg¹H
        elseif iso_code == 26
            return 0.11 * 0.9998  # ²⁶Mg¹H
        else
            return 1.0
        end
        
    else
        # Generic fallback
        return 1.0
    end
end

"""
    parse_molecular_line(line_str::String, molecule::String) -> SpectralLine

Parse a single molecular line from ASCII format.

# Molecular Format (space-delimited):
- Column 1:  Wavelength (Å)
- Column 2:  loggf
- Column 3:  J_lower
- Column 4:  E_lower (cm⁻¹)
- Column 5:  J_upper
- Column 6:  E_upper (cm⁻¹)
- Column 7:  Label_lower (not used)
- Column 8:  Label_upper (not used)
- Column 9:  ISO code

# Example
```julia
line = "  500.0010 -1.505  9.5  4666.690  8.5  24661.070 112X03F2   B03F2   24"
sl = parse_molecular_line(line, "MgH")
```
"""
function parse_molecular_line(line_str::String, molecule::String)::SpectralLine
    # Split by whitespace
    fields = split(strip(line_str))
    
    # Parse fields
    wavelength = parse(Float64, fields[1])
    loggf = parse(Float64, fields[2])
    j_lower = parse(Float64, fields[3])
    e_lower = parse(Float64, fields[4])
    j_upper = parse(Float64, fields[5])
    e_upper = parse(Float64, fields[6])
    # Skip labels (fields 7-8)
    iso_code = parse(Int, fields[9])
    
    # Convert ISO code to NELION element code
    nelion = iso_to_nelion(iso_code, molecule)
    element_ion = Float64(nelion)
    
    # Default damping parameters for molecules
    # (In real SYNTHE, these come from quantum chemistry calculations)
    gamma_rad = 1e7   # Hz (typical radiative damping)
    gamma_stark = 1e8  # Hz (collisional broadening)
    gamma_vdw = 1e8    # Hz (van der Waals)
    alpha = 0.4        # vdW exponent
    
    # nbuff will be computed later
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
end

"""
    read_molecular_lines(filepath, molecule, λ_start, λ_end, margin=10.0) -> Vector{SpectralLine}

Read and filter molecular lines from ASCII file.

# Arguments
- `filepath::String`: Path to molecular line file
- `molecule::String`: Molecule name (e.g., "CH", "CN", "CO", "MgH")
- `λ_start::Float64`: Start wavelength (Å)
- `λ_end::Float64`: End wavelength (Å)
- `margin::Float64`: Safety margin for line wings (default 10.0 Å)

# Returns
- `lines::Vector{SpectralLine}`: Filtered lines within wavelength range

# Example
```julia
lines = read_molecular_lines("mgh.asc", "MgH", 5000.0, 5100.0, 10.0)
```
"""
function read_molecular_lines(filepath::String, molecule::String, 
                             λ_start::Float64, λ_end::Float64, 
                             margin::Float64=10.0)::Vector{SpectralLine}
    lines = SpectralLine[]
    
    # Extended wavelength range with margin
    λ_min = λ_start - margin
    λ_max = λ_end + margin
    
    # Grid parameters for nbuff (standard high-resolution)
    n_points = 100000
    
    open(filepath, "r") do file
        for line_str in eachline(file)
            # Skip empty lines
            if isempty(strip(line_str))
                continue
            end
            
            try
                # Quick wavelength check before full parsing
                fields = split(strip(line_str))
                if length(fields) < 9
                    continue  # Skip malformed lines
                end
                
                wavelength = parse(Float64, fields[1])
                
                # Only parse lines within wavelength range
                if wavelength >= λ_min && wavelength <= λ_max
                    spectral_line = parse_molecular_line(line_str, molecule)
                    
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
