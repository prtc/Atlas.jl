# TiO Binary Format Documentation
*Kurucz tioschwenke.bin format specification*

**Date**: 2025-11-11
**Source**: Reverse-engineered from `rschwenk.for` (Kurucz SYNTHE reader)
**Purpose**: Document the Schwenke (1998) TiO line list binary format for future converter implementation

---

## Overview

The Kurucz TiO line list uses a packed binary format containing **37.7 million transitions** from Schwenke (1998, Faraday Discussion 109, pp 321-334). The data is stored in two files:

1. **tioschwenke.bin** (576 MB) - Line transitions (wavelength, gf, energies, damping)
2. **eschwenk.bin** - Energy level data (269,300 levels per isotope × 5 isotopes)

**Key characteristics**:
- 16 bytes per line
- Fixed-length records (8000 bytes per block, 500 lines per block)
- Direct access format
- Covers transitions up to V=19, J=300
- 5 isotopes: 46Ti16O, 47Ti16O, 48Ti16O, 49Ti16O, 50Ti16O

---

## Binary Record Structure

Each line is stored in **16 bytes** as follows:

```
Byte offset:  0        4       6       8      10      12      14
              |--------|-------|-------|-------|-------|-------|
Fields:       IWL      IELION  IELO    IGFLOG  IGR     IGS     IGW
Type:         INT*4    INT*2   INT*2   INT*2   INT*2   INT*2   INT*2
Size:         4 bytes  2 bytes 2 bytes 2 bytes 2 bytes 2 bytes 2 bytes
```

### Field Descriptions

**IWL** (INTEGER*4, 4 bytes):
- Wavelength index (logarithmic encoding)
- Decode: `λ (Å) = exp(IWL × log(1 + 1/2000000))`
- Allows wavelength compression with ~1 part in 2 million precision

**IELION** (INTEGER*2, 2 bytes):
- Isotope identifier (encoded)
- Decode: `ISO = ABS(IELION) - 8949`
  - ISO=1 → 46Ti16O
  - ISO=2 → 47Ti16O
  - ISO=3 → 48Ti16O
  - ISO=4 → 49Ti16O
  - ISO=5 → 50Ti16O
- Isotope code: `ISO2 = ISO + 45` (yields 46, 47, 48, 49, 50)

**IELO** (INTEGER*2, 2 bytes):
- Lower level energy index (logarithmic encoding)
- Decode: `E_lower (cm^-1) = 10^((IELO - 16384) × 0.001)`
- Offset by 16384 to allow negative exponents

**IGFLOG** (INTEGER*2, 2 bytes):
- log(gf) index (logarithmic encoding)
- Decode: `log(gf) = (IGFLOG - 16384) × 0.001`
- Decode: `gf = 10^((IGFLOG - 16384) × 0.001)`
- Offset by 16384, resolution 0.001 dex

**IGR** (INTEGER*2, 2 bytes):
- Radiative damping index
- Decode: `log(γ_rad) = (IGR - 16384) × 0.001`
- Decode: `γ_rad = 10^((IGR - 16384) × 0.001)`

**IGS** (INTEGER*2, 2 bytes):
- Stark damping index (often set to constant)
- Decode: Same as IGR
- Note: Often overridden in code (see rschwenk.for:165-166)

**IGW** (INTEGER*2, 2 bytes):
- van der Waals damping index + level encoding
- Decode damping: Same as IGR
- **Also encodes level information**:
  - `LEVELLO = KGS*10 + MOD(ABS(KGW), 10)`
  - `LEVELUP = KGW/10 + LEVELLO`
  - These indices reference eschwenk.bin energy levels

---

## Logarithmic Encoding Tables

The binary format uses lookup tables to save space. From `rschwenk.for:35-36`:

```fortran
DO 1 I=1,32768
  1 TABLOG(I)=10.**((I-16384)*.001)
```

This creates a table with:
- Range: 10^-16.384 to 10^16.383
- Resolution: 0.001 in the exponent (1 part in 1000 in log space)
- Offset: 16384 (allows negative exponents)

**Example decoding**:
```python
def decode_log_value(index):
    """Decode logarithmic index to actual value."""
    return 10.0 ** ((index - 16384) * 0.001)

# Example: IGFLOG = 14384 → log(gf) = (14384-16384)*0.001 = -2.0
```

---

## Wavelength Encoding

Wavelength uses exponential spacing with constant fractional resolution:

```fortran
RATIOLOG = LOG(1.D0 + 1.D0/2000000.D0)  ! ≈ 5.0×10^-7
WLVAC = EXP(IWL * RATIOLOG)
```

**Properties**:
- Constant Δλ/λ ≈ 5×10^-7 (0.5 ppm)
- Absolute precision: Δλ ≈ λ × 5×10^-7
  - At 5000 Å: Δλ ≈ 0.0025 Å
  - At 10000 Å: Δλ ≈ 0.005 Å
- Efficient for wide wavelength coverage

---

## Companion File: eschwenk.bin

Contains energy level data for all 5 isotopes:

```fortran
REAL*4 XJTIO(269300)              ! J quantum numbers
REAL*8 ETIO(269300,5)             ! Energies (cm^-1) for each isotope
REAL*8 STATETIO(269300,5)         ! State labels (Hollerith strings)
```

**Structure**:
- 269,300 energy levels per isotope
- 5 isotopes total
- Levels referenced by LEVELLO and LEVELUP indices from IGW/IGS

**Reading** (from rschwenk.for:48-50):
```fortran
OPEN(UNIT=48, TYPE='OLD', FORM='UNFORMATTED', READONLY)
READ(48) ETIO, XJTIO, STATETIO
CLOSE(UNIT=48)
```

---

## Isotope Abundances

From `rschwenk.for:30-32`:

```fortran
DATA XISO  / 0.0793,  0.0728,  0.7394,  0.0551,  0.0534 /
DATA X2ISO / -1.101, -1.138,  -0.131,  -1.259,  -1.272 /
```

Where:
- `XISO(ISO)` = Isotopic abundance fraction
- `X2ISO(ISO)` = log10(isotope abundance correction)

**Isotope details**:
| ISO | Isotope  | XISO   | X2ISO   | % Abundance |
|-----|----------|--------|---------|-------------|
| 1   | 46Ti16O  | 0.0793 | -1.101  | 7.93%       |
| 2   | 47Ti16O  | 0.0728 | -1.138  | 7.28%       |
| 3   | 48Ti16O  | 0.7394 | -0.131  | 73.94%      |
| 4   | 49Ti16O  | 0.0551 | -1.259  | 5.51%       |
| 5   | 50Ti16O  | 0.0534 | -1.272  | 5.34%       |

---

## Vacuum ↔ Air Wavelength Conversion

TiO wavelengths in the binary are **vacuum wavelengths**. Conversion to air for λ > 200 nm:

From `rschwenk.for:214-221`:

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
- Build lookup table `AIRSHIFT(KWL)` for vacuum → air conversion
- `KWL = INT(WLVAC * 10 + 0.5)` (wavelength in tenths of Angstrom)
- `WL_air = WL_vac + AIRSHIFT(KWL)`

---

## gf Correction for Isotopic Abundance

From `rschwenk.for:157`:

```fortran
CONGF = 0.01502 * TABLOG(IGFLOG) / FREQ * XISO(ISO)
```

Where:
- `FREQ = 2.99792458E17 / WLVAC` (frequency in Hz)
- Factor 0.01502 is conversion constant
- Accounts for isotopic abundance in partition function

---

## Byte Order Considerations

The binary file uses **Digital/VAX byte order** (little-endian). On other systems, byte swapping may be required.

From `rschwenk.for:106-116` (commented out for VAX):

```fortran
! IF COMPUTER REQUIRES BYTE ROTATION
DO 17 I=1,4,2
  ONEBYTE = IIBYTE(I)
  IIBYTE(I) = IIBYTE(I+1)
  17 IIBYTE(I+1) = ONEBYTE
ONEBYTE = IIBYTE(1)
IIBYTE(1) = IIBYTE(3)
IIBYTE(3) = ONEBYTE
! ... etc
```

**Modern systems**: Most likely need byte swapping on x86-64 Linux (little-endian should work).

---

## File Access Method

**Direct access** with fixed record size:

```fortran
OPEN(UNIT=11, STATUS='OLD', READONLY, SHARED,
     FORM='UNFORMATTED',
     RECORDTYPE='FIXED',
     BLOCKSIZE=8000,      ! 8000 bytes per block
     RECORDSIZE=4,        ! 4-byte integers (16 bytes = 4 integers)
     ACCESS='DIRECT')
```

**Python equivalent** using NumPy:

```python
import numpy as np

# Define the record dtype
tio_dtype = np.dtype([
    ('IWL',    'i4'),  # 4-byte integer
    ('IELION', 'i2'),  # 2-byte integer
    ('IELO',   'i2'),
    ('IGFLOG', 'i2'),
    ('IGR',    'i2'),
    ('IGS',    'i2'),
    ('IGW',    'i2'),
])

# Read entire file
with open('tioschwenke.bin', 'rb') as f:
    data = np.fromfile(f, dtype=tio_dtype)
```

---

## Complete Decoding Example

```python
import numpy as np

def decode_tio_line(record):
    """
    Decode a single TiO binary record.

    Parameters:
    -----------
    record : numpy record with fields IWL, IELION, IELO, IGFLOG, IGR, IGS, IGW

    Returns:
    --------
    dict with decoded values
    """
    # Constants
    RATIOLOG = np.log(1.0 + 1.0/2000000.0)

    # Wavelength
    wavelength_vac = np.exp(record['IWL'] * RATIOLOG)  # Angstroms

    # Isotope
    iso = abs(record['IELION']) - 8949
    iso_code = iso + 45  # 46, 47, 48, 49, or 50

    # Energy (lower level)
    E_lower = 10.0 ** ((record['IELO'] - 16384) * 0.001)  # cm^-1

    # log(gf)
    log_gf = (record['IGFLOG'] - 16384) * 0.001
    gf = 10.0 ** log_gf

    # Damping parameters
    log_gamma_rad = (record['IGR'] - 16384) * 0.001
    gamma_rad = 10.0 ** log_gamma_rad

    log_gamma_stark = (record['IGS'] - 16384) * 0.001
    gamma_stark = 10.0 ** log_gamma_stark

    log_gamma_vdw = (record['IGW'] - 16384) * 0.001
    gamma_vdw = 10.0 ** log_gamma_vdw

    # Level indices (encoded in IGS and IGW)
    kgs = record['IGS']
    kgw = record['IGW']
    level_lower = kgs * 10 + abs(kgw) % 10
    level_upper = kgw // 10 + level_lower

    return {
        'wavelength_vacuum_angstrom': wavelength_vac,
        'isotope': iso_code,
        'E_lower_cm': E_lower,
        'log_gf': log_gf,
        'gf': gf,
        'gamma_rad': gamma_rad,
        'gamma_stark': gamma_stark,
        'gamma_vdw': gamma_vdw,
        'level_lower_index': level_lower,
        'level_upper_index': level_upper,
    }
```

---

## File Statistics

**tioschwenke.bin**:
- Size: 576 MB
- Lines: 37,744,499
- Record size: 16 bytes
- Block size: 8000 bytes (500 records per block)
- Format: Fortran UNFORMATTED, direct access

**eschwenk.bin**:
- Size: ~8.5 MB per isotope file (ASCII versions)
- Binary format contains all 5 isotopes merged
- Levels: 269,300 per isotope

**ASCII alternative** (tioschwenke.asc):
- Size: 1.7 GB (uncompressed)
- Same data in human-readable format
- Not practical for routine use

---

## References

**Source code**:
- `upstream/castelli/source_codes/synthe/rschwenk.for` - Binary reader for SYNTHE
- `upstream/kurucz/source_codes/molecules/TiO/rschwenk.for` - Alternate version
- `upstream/kurucz/source_codes/molecules/TiO/eschwbin.for` - Energy file builder
- `upstream/kurucz/source_codes/molecules/TiO/rtiobinasc.for` - Binary→ASCII converter
- `upstream/kurucz/source_codes/molecules/TiO/rtiobincard.for` - Card reader

**Scientific reference**:
- Schwenke, D. W. (1998). "Opacity of TiO from a coupled electronic state calculation parametrized by ab initio and experimental data". Faraday Discussions, 109, 321-334.

**Kurucz documentation**:
- CDROM No. 24 README (reproduced in email from user, dated 19 January 1999)
- Available files at: http://kurucz.harvard.edu/molecules/tio/

**Related documentation**:
- `docs/archaeology/DEEP_DIVES/09_SYNTHE_LINE_ACCUMULATION.md` - Line reading pipeline
- `tools/line_lists/README.md` - HDF5 converter tools

---

## Implementation Notes

### For Future Converter (tio_schwenke_to_hdf5.py)

**Challenges**:
1. **File size**: 576 MB binary requires streaming or chunked processing
2. **Memory**: Cannot load all 37.7M lines in memory at once
3. **Dependencies**: Requires both tioschwenke.bin and eschwenk.bin
4. **Testing**: Need small sample file (first N records) for development

**Recommended approach**:
1. Read binary in chunks (e.g., 100,000 lines at a time)
2. Decode indices to physical values
3. Write to HDF5 with compression (expect 3-5× reduction)
4. Include isotope-specific datasets
5. Cross-reference energy levels from eschwenk.bin

**Expected HDF5 output size**: ~150-200 MB (compressed)

**Priority**: Low (TiO is specialized use case, ASCII alternatives exist)

---

## Version History

**v1.0** (2025-11-11):
- Initial documentation from reverse-engineering rschwenk.for
- Complete record structure specification
- Decoding algorithms for all fields
- Python example code
- References to source files

---

**End of TIO_BINARY_FORMAT.md**
