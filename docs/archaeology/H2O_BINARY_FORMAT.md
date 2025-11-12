# H2O Binary Format Documentation
*Kurucz h2ofastfix.bin format specification*

**Date**: 2025-11-11
**Source**: Reverse-engineered from `rh2ofast.for` (Kurucz SYNTHE reader)
**Purpose**: Document the Partridge & Schwenke (1997) H2O line list binary format for future converter implementation

---

## Overview

The Kurucz H2O line list uses a packed binary format containing **65.9 million transitions** from Partridge & Schwenke (1997). Unlike TiO, this format is simpler with **no separate energy level file required**.

**File**: h2ofastfix.bin (503 MB)

**Key characteristics**:
- 8 bytes per line (much simpler than TiO's 16 bytes)
- Fixed-length records
- Direct access format
- 65,912,356 lines total
- 4 isotopes: H₂¹⁶O, H₂¹⁷O, H₂¹⁸O, HD¹⁶O

---

## Binary Record Structure

Each line is stored in **8 bytes** as follows:

```
Byte offset:  0        4       6
              |--------|-------|-------|
Fields:       IWL      IELO    IGFLOG
Type:         INT*4    INT*2   INT*2
Size:         4 bytes  2 bytes 2 bytes
```

**Much simpler than TiO!** Only 3 fields vs TiO's 7 fields.

### Field Descriptions

**IWL** (INTEGER*4, 4 bytes):
- Wavelength index (logarithmic encoding)
- Decode: `λ (Å) = exp(IWL × log(1 + 1/2000000))`
- Same encoding as TiO
- Resolution: ~0.5 ppm (parts per million)

**IELO** (INTEGER*2, 2 bytes):
- Lower level energy index (logarithmic encoding)
- **Sign encodes isotope** (see below)
- Decode: `E_lower (cm^-1) = 10^((ABS(IELO) - 16384) × 0.001)`
- Take absolute value before decoding!

**IGFLOG** (INTEGER*2, 2 bytes):
- log(gf) index (logarithmic encoding)
- **Sign encodes isotope** (see below)
- Decode: `log(gf) = (ABS(IGFLOG) - 16384) × 0.001`
- Decode: `gf = 10^((ABS(IGFLOG) - 16384) × 0.001)`
- Take absolute value before decoding!

**No damping parameters encoded!** These are calculated or set to constants (see below).

---

## Isotope Encoding (Clever!)

Isotopes are encoded using the **signs of IELO and IGFLOG**:

From `rh2ofast.for:133-138`:

```fortran
ISO = 1                              ! Default: both positive
IF(IELO.GT.0 .AND. IGFLOG.GT.0) GO TO 19
ISO = 2                              ! IELO > 0, IGFLOG < 0
IF(IELO.GT.0) GO TO 19
ISO = 3                              ! IELO < 0, IGFLOG > 0
IF(IGFLOG.GT.0) GO TO 19
ISO = 4                              ! Both negative
```

**Isotope table**:

| ISO | Isotope  | IELO sign | IGFLOG sign | XISO   | X2ISO   | Abundance |
|-----|----------|-----------|-------------|--------|---------|-----------|
| 1   | H₂¹⁶O    | +         | +           | 0.9976 | -0.001  | 99.76%    |
| 2   | H₂¹⁷O    | +         | -           | 0.0004 | -3.398  | 0.04%     |
| 3   | H₂¹⁸O    | -         | +           | 0.0020 | -2.690  | 0.20%     |
| 4   | HD¹⁶O    | -         | -           | 0.00001| -5.000  | 0.001%    |

From `rh2ofast.for:28-30`:
```fortran
DATA XISO  / 0.9976,  0.0004,  0.0020, 0.00001 /
DATA X2ISO / -0.001,  -3.398,  -2.690, -5.000  /
DATA LABELISO / 2H16, 2H17,   2H18,   2H26    /
```

**Note**: LABELISO "26" means HD (mass 2 + mass 6 → deuterium + oxygen)

---

## Wavelength Encoding

Identical to TiO format:

```fortran
RATIOLOG = LOG(1.D0 + 1.D0/2000000.D0)  ! ≈ 5.0×10^-7
WLVAC = EXP(IWL * RATIOLOG)
```

**Properties**:
- Constant Δλ/λ ≈ 5×10^-7 (0.5 ppm)
- Absolute precision: Δλ ≈ λ × 5×10^-7
  - At 5000 Å: Δλ ≈ 0.0025 Å
  - At 10000 Å: Δλ ≈ 0.005 Å

---

## Logarithmic Encoding Tables

Same lookup table as TiO (from `rh2ofast.for:33-34`):

```fortran
DO 1 I=1,32768
  1 TABLOG(I) = 10.**((I-16384)*.001)
```

This creates a table with:
- Range: 10^-16.384 to 10^16.383
- Resolution: 0.001 in the exponent
- Offset: 16384 (allows negative exponents)

**Decoding**:
```python
def decode_log_value(index):
    """Decode logarithmic index to actual value."""
    return 10.0 ** ((abs(index) - 16384) * 0.001)
```

---

## Damping Parameters (Calculated, Not Stored!)

**Major difference from TiO**: H2O binary does NOT store damping parameters!

From `rh2ofast.for:145-154`:

```fortran
C     GAMMAS=0
C     LOG GAMMAW=-7
C     IGR=
IGS = 1
IGW = 9384
GAMMAR = 2.223E13 / WLVAC**2 * 0.001
GAMRF = GAMMAR / FRQ4PI
GAMSF = TABLOG(IGS) / FRQ4PI
GAMWF = TABLOG(IGW) / FRQ4PI
```

**Radiative damping** (calculated):
- Formula: `γ_rad = 2.223×10^13 / λ^2 × 0.001`
- Where λ is wavelength in Angstroms
- Units: s^-1

**Stark damping** (constant):
- `IGS = 1` → `log(γ_Stark) = (1 - 16384) × 0.001 = -16.383`
- Essentially zero

**van der Waals damping** (constant):
- `IGW = 9384` → `log(γ_vdW) = (9384 - 16384) × 0.001 = -7.0`
- Constant value for all lines

---

## Vacuum ↔ Air Wavelength Conversion

Same formula as TiO (from `rh2ofast.for:182-189`):

```fortran
FUNCTION VACAIR(W)
  IMPLICIT REAL*8 (A-H,O-Z)
  ! W is vacuum wavelength in nm
  WAVEN = 1.D7 / W
  VACAIR = W / (1.0000834213D0 +
       2406030.D0/(1.30D10 - WAVEN**2) +
       15997.D0/(3.89D9 - WAVEN**2))
  RETURN
END
```

**Usage**:
- Wavelengths in binary are vacuum
- Convert to air for λ > 200 nm using VACAIR function
- Lookup table approach for efficiency: `AIRSHIFT(KWL)` where `KWL = INT(WLVAC × 10 + 0.5)`

---

## gf Correction for Isotopic Abundance

From `rh2ofast.for:143`:

```fortran
FREQ = 2.99792458E17 / WLVAC
CONGF = 0.01502 * TABLOG(IGFLOG) / FREQ * XISO(ISO)
```

Where:
- `FREQ` = frequency in Hz
- Factor 0.01502 is conversion constant
- `XISO(ISO)` = isotopic abundance fraction
- Corrected gf accounts for isotope abundance in partition function

---

## Byte Order Considerations

Same as TiO - original format uses **VAX little-endian**.

From `rh2ofast.for:51-57, 111-122` (commented out):

```fortran
c     on some computers need byte rotation
c     onebyte=iwlbytes(1)
c     iwlbytes(1)=iwlbytes(4)
c     iwlbytes(4)=onebyte
c     onebyte=iwlbytes(2)
c     iwlbytes(2)=iwlbytes(3)
c     iwlbytes(3)=onebyte
```

**Modern systems**: Most likely work as-is on x86-64 Linux (little-endian).

---

## File Access Method

**Direct access** with fixed record size:

```fortran
OPEN(UNIT=11, STATUS='OLD', READONLY, SHARED,
     FORM='UNFORMATTED',
     RECORDTYPE='FIXED',
     RECORDSIZE=2,         ! 2-byte words (total 8 bytes = 4 words)
     ACCESS='DIRECT')
```

**Python equivalent** using NumPy:

```python
import numpy as np

# Define the record dtype
h2o_dtype = np.dtype([
    ('IWL',    'i4'),  # 4-byte integer
    ('IELO',   'i2'),  # 2-byte integer (signed, isotope encoded)
    ('IGFLOG', 'i2'),  # 2-byte integer (signed, isotope encoded)
])

# Read entire file (warning: 503 MB!)
with open('h2ofastfix.bin', 'rb') as f:
    data = np.fromfile(f, dtype=h2o_dtype)
```

---

## Complete Decoding Example

```python
import numpy as np

def decode_h2o_line(record):
    """
    Decode a single H2O binary record.

    Parameters:
    -----------
    record : numpy record with fields IWL, IELO, IGFLOG

    Returns:
    --------
    dict with decoded values
    """
    # Constants
    RATIOLOG = np.log(1.0 + 1.0/2000000.0)
    C_LIGHT = 2.99792458e17  # cm/s

    # Isotopic abundances
    XISO = [0.9976, 0.0004, 0.0020, 0.00001]

    # Wavelength
    wavelength_vac = np.exp(record['IWL'] * RATIOLOG)  # Angstroms

    # Isotope (encoded in signs)
    ielo = record['IELO']
    igflog = record['IGFLOG']

    if ielo > 0 and igflog > 0:
        iso = 1  # H2-16O
        iso_name = 'H2-16O'
    elif ielo > 0 and igflog < 0:
        iso = 2  # H2-17O
        iso_name = 'H2-17O'
    elif ielo < 0 and igflog > 0:
        iso = 3  # H2-18O
        iso_name = 'H2-18O'
    else:  # both negative
        iso = 4  # HD-16O
        iso_name = 'HD-16O'

    # Energy (lower level) - use absolute value
    E_lower = 10.0 ** ((abs(ielo) - 16384) * 0.001)  # cm^-1

    # log(gf) - use absolute value
    log_gf = (abs(igflog) - 16384) * 0.001
    gf = 10.0 ** log_gf

    # Damping (calculated, not stored)
    gamma_rad = 2.223e13 / wavelength_vac**2 * 0.001  # s^-1
    gamma_stark = 10.0 ** ((1 - 16384) * 0.001)       # ≈ 0
    gamma_vdw = 10.0 ** ((9384 - 16384) * 0.001)      # 10^-7

    # Frequency and corrected gf
    frequency = C_LIGHT / wavelength_vac  # Hz
    gf_corrected = 0.01502 * gf / frequency * XISO[iso-1]

    return {
        'wavelength_vacuum_angstrom': wavelength_vac,
        'isotope_number': iso,
        'isotope_name': iso_name,
        'isotopic_abundance': XISO[iso-1],
        'E_lower_cm': E_lower,
        'log_gf': log_gf,
        'gf': gf,
        'gf_corrected': gf_corrected,
        'gamma_rad': gamma_rad,
        'gamma_stark': gamma_stark,
        'gamma_vdw': gamma_vdw,
        'frequency_hz': frequency,
    }
```

---

## File Statistics

**h2ofastfix.bin**:
- Size: 503 MB
- Lines: 65,912,356
- Record size: 8 bytes
- Format: Fortran UNFORMATTED, direct access

**ASCII alternative** (h2ofastfix.asc):
- Size: 1.6 GB (uncompressed)
- Same data in human-readable format
- Not practical for routine use

**Slow version** (h2oslowfix.bin):
- Same format and size as h2ofastfix.bin
- Different wavelength coverage or line selection
- Uses `rh2oslow.for` (8.0K) reader

---

## Comparison with TiO Format

| Feature              | H2O (h2ofastfix)    | TiO (tioschwenke)      |
|----------------------|---------------------|------------------------|
| Record size          | 8 bytes             | 16 bytes               |
| Number of fields     | 3                   | 7                      |
| Number of lines      | 65.9 million        | 37.7 million           |
| File size            | 503 MB              | 576 MB                 |
| Isotopes             | 4 (encoded in signs)| 5 (explicit field)     |
| Energy levels file   | Not required ✅     | Required (eschwenk.bin)|
| Damping parameters   | Calculated ✅       | Encoded in binary      |
| Wavelength encoding  | Same (exponential)  | Same (exponential)     |
| Complexity           | Simpler ✅          | More complex           |

**Key advantage of H2O format**: Self-contained (no companion file needed), simpler structure.

---

## References

**Source code**:
- `upstream/castelli/source_codes/synthe/rh2ofast.for` - Binary reader for SYNTHE (190 lines)
- `upstream/kurucz/source_codes/molecules/H2O/rh2ofast.for` - Alternate version
- `upstream/kurucz/source_codes/molecules/H2O/rh2oslow.for` - Slow version reader
- `upstream/kurucz/source_codes/molecules/H2O/rh2oir.for` - Infrared version
- `upstream/kurucz/source_codes/molecules/H2O/rh2ocool.for` - Cool stars version

**Scientific reference**:
- Partridge, H. & Schwenke, D. W. (1997). "The determination of an accurate isotope dependent potential energy surface for water from extensive ab initio calculations and experimental data". Journal of Chemical Physics, 106, 4618-4639.

**Kurucz documentation**:
- `h2ofastfix.readme` - Available at http://kurucz.harvard.edu/molecules/h2o/
- `partridgeschwenke.readme` - Original format description
- `00readme.asc` - Directory README

**Related documentation**:
- `docs/archaeology/DEEP_DIVES/09_SYNTHE_LINE_ACCUMULATION.md` - Line reading pipeline
- `docs/archaeology/TIO_BINARY_FORMAT.md` - TiO format for comparison
- `tools/line_lists/README.md` - HDF5 converter tools

---

## Implementation Notes

### For Future Converter (h2o_partridge_to_hdf5.py)

**Challenges**:
1. **File size**: 503 MB binary requires chunked processing
2. **Memory**: Cannot load all 65.9M lines at once
3. **Isotope decoding**: Must check signs of IELO and IGFLOG
4. **Damping calculation**: Radiative damping must be calculated, not just decoded

**Recommended approach**:
1. Read binary in chunks (e.g., 100,000 lines at a time)
2. Decode isotopes from field signs first
3. Take absolute values before decoding indices
4. Calculate radiative damping: `γ_rad = 2.223×10^13 / λ^2 × 0.001`
5. Write to HDF5 with compression (expect 3-5× reduction)
6. Separate datasets per isotope, or add isotope_code field

**Expected HDF5 output size**: ~150-200 MB (compressed)

**Advantages over TiO**:
- Simpler format (only 3 fields)
- No companion file needed
- Easier to implement

**Priority**: Low-Medium (H2O important for cool stars, but ASCII alternatives exist)

---

## Version History

**v1.0** (2025-11-11):
- Initial documentation from reverse-engineering rh2ofast.for
- Complete record structure specification
- Isotope encoding via sign bits explained
- Decoding algorithms for all fields
- Python example code
- Comparison with TiO format
- References to source files

---

**End of H2O_BINARY_FORMAT.md**
