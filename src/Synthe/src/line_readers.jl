"""
Line readers for SYNTHE pipeline

**Tasks 2-4**: Implement rgfalllinesnew and rmolecasc

Based on Deep Dive 12: SYNTHE Line Reading Pipeline
"""

"""
    read_gfalllines(filename::String, wave_start::Float64, wave_end::Float64)

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
5. Return vector of lines

**Returns**: `Vector{SpectralLine}`

**Status**: NOT IMPLEMENTED (Task 3)
"""
function read_gfalllines(filename::String, wave_start::Float64, wave_end::Float64)
    error("Task 3 not yet implemented: rgfalllinesnew atomic line reader")
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
