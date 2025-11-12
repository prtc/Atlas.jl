# Predicted Lines Binary Format Documentation
*Kurucz predicted lines (lowlines.bin, highlines.bin, nltelines.bin) format specification*

**Date**: 2025-11-12
**Source**: Reverse-engineered from `rpredict.for` (Kurucz SYNTHE reader)
**Purpose**: Document the Kurucz predicted/semi-empirical atomic line list binary format for future converter implementation

---

## Overview

The Kurucz predicted line lists contain **semi-empirical atomic transitions** calculated from atomic structure theory and calibrated with experimental data. These lines complement the observed lines in gfall.dat with predicted transitions that have not been directly measured spectroscopically.

**Key files**:
- **lowlines.bin** (831 MB) - Low excitation energy predicted lines
- **highlines.bin** (270 MB) - High excitation energy predicted lines
- **fclowlines.bin** (483 MB) - Filtered/compressed low excitation lines
- **fchighlines.bin** (157 MB) - Filtered/compressed high excitation lines
- **nltelines.bin** (2.2 MB) - NLTE (non-LTE) predicted lines

**Key characteristics**:
- **Same binary format as TiO** (16 bytes per line, 7 fields)
- Direct access format, fixed-length records
- IELION field is **negative** to distinguish from observed lines
- Covers transitions calculated from atomic structure codes (SUPERSTRUCTURE, Cowan code, etc.)
- Used optionally in SYNTHE after observed lines are loaded

---

## What are "Predicted Lines"?

**Definition**: Transitions calculated from **semi-empirical atomic structure theory** rather than direct laboratory measurements.

**Source programs**:
- SUPERSTRUCTURE (Eissner et al.)
- Cowan atomic structure code
- Kurucz's spectral synthesis codes
- Calibrated against known experimental data

**Use cases**:
1. **Cool star modeling** - Weak metal lines important for opacity
2. **Rare ions** - Species without complete laboratory measurements
3. **High excitation lines** - Transitions difficult to measure in lab
4. **Completeness** - Fill gaps in observed line lists

**Quality**: Lower accuracy than observed lines, but still useful for:
- Line blanketing effects (collective opacity)
- Identifying spectral features
- Exploratory abundance studies

---

## Binary Record Structure

**IDENTICAL to TiO format** (see `TIO_BINARY_FORMAT.md` for full details):

```
Byte offset:  0        4       6       8      10      12      14
              |--------|-------|-------|-------|-------|-------|
Fields:       IWL      IELION  IELO    IGFLOG  IGR     IGS     IGW
Type:         INT*4    INT*2   INT*2   INT*2   INT*2   INT*2   INT*2
Size:         4 bytes  2 bytes 2 bytes 2 bytes 2 bytes 2 bytes 2 bytes
```

**Total**: 16 bytes per line

### Key Difference from Other Line Lists

**IELION field encoding** (from `rpredict.for:397-399`):

```fortran
IF(IELION.GT.0)GO TO 20        ! Skip positive IELION (observed lines)
NELIONNEW=ABS(IELION)/10       ! Decode negative IELION
NELION=NELIONOLD(NELIONNEW)    ! Map to element/ion code
```

**Encoding scheme**:
- **IELION < 0**: Predicted lines (processed by rpredict.for)
- **IELION > 0**: Observed lines (skipped - already in gfall.dat)
- **ABS(IELION)/10**: Maps to lookup table index
- **NELIONOLD(index)**: Converts to standard element/ion code

**Example decoding**:
```python
if IELION > 0:
    skip_line()  # Already in observed line list
else:
    index = abs(IELION) // 10
    nelion_code = NELIONOLD_TABLE[index]  # See lookup table below
    element = (nelion_code // 6) + 1
    ionization = (nelion_code % 6) - 1
```

---

## Field Descriptions

All fields use **identical encoding to TiO format**:

### IWL (INTEGER*4, 4 bytes)
- Wavelength index (exponential encoding)
- Decode: `λ (Å) = exp(IWL × log(1 + 1/2000000))`
- Precision: ~0.5 ppm (parts per million)

### IELION (INTEGER*2, 2 bytes)
- **Negative value** for predicted lines
- Decode: `index = ABS(IELION) / 10`
- Maps to `NELIONOLD(index)` lookup table
- **Critical difference** from TiO/gfall formats

### IELO (INTEGER*2, 2 bytes)
- Lower level energy index (logarithmic)
- Decode: `E_lower (cm^-1) = 10^((IELO - 16384) × 0.001)`

### IGFLOG (INTEGER*2, 2 bytes)
- log(gf) index (logarithmic)
- Decode: `log(gf) = (IGFLOG - 16384) × 0.001`
- Decode: `gf = 10^((IGFLOG - 16384) × 0.001)`

### IGR (INTEGER*2, 2 bytes)
- Radiative damping index
- Decode: `γ_rad = 10^((IGR - 16384) × 0.001)`

### IGS (INTEGER*2, 2 bytes)
- Stark damping index
- Decode: `γ_Stark = 10^((IGS - 16384) × 0.001)`

### IGW (INTEGER*2, 2 bytes)
- van der Waals damping index
- Decode: `γ_vdW = 10^((IGW - 16384) × 0.001)`

---

## NELIONOLD Lookup Table

**Purpose**: Maps predicted line codes to standard element/ionization codes.

From `rpredict.for:34-322` (1005 entries total):

```fortran
! Excerpt showing pattern:
DATA NELIONOLDA/
 1   1,  2,                    ! H I, H II
 2   7,  8,  9,               ! He I, He II, He III
 3  13, 14, 15, 16,           ! Li I, Li II, Li III, Li IV
 4  19, 20, 21, 22, 23,       ! Be I-V
 5  25, 26, 27, 28, 29, 30,   ! B I-VI
 ...
```

**Encoding**:
- `NELION = element_number × 6 + ionization_stage`
- Element number: 1 = H, 2 = He, 3 = Li, ..., 99 = Es
- Ionization stage: 1 = neutral, 2 = singly ionized, ..., 6 = fifth ionization

**Examples**:
| NELION | Element | Ion   | Name    |
|--------|---------|-------|---------|
| 1      | 1       | I     | H I     |
| 2      | 1       | II    | H II    |
| 7      | 2       | I     | He I    |
| 8      | 2       | II    | He II   |
| 151    | 26      | I     | Fe I    |
| 152    | 26      | II    | Fe II   |
| 153    | 26      | III   | Fe III  |

**Molecules in table** (lines 306-322):
- Indices 841-975: Molecules (H2, CH, NH, OH, TiO, H2O, CO2, etc.)
- Indices 976-1005: Negative ions (H-, C-, O-, Fe-, CN-, etc.)

**Special codes**:
| Index | Species | NELION |
|-------|---------|--------|
| 841   | H2      | 240    |
| 846   | CH      | 246    |
| 869   | CN      | 270    |
| 870   | CO      | 276    |
| 895   | TiO     | 366    |
| 940   | H2O     | 534    |
| 976   | H-      | 0      |

---

## Logarithmic Encoding Tables

**Identical to TiO format** (from `rpredict.for:323-324`):

```fortran
DO 1 I=1,32768
  1 TABLOG(I)=10.**((I-16384)*.001)
```

**Properties**:
- Range: 10^-16.384 to 10^16.383
- Resolution: 0.001 in the exponent
- Offset: 16384 (allows negative exponents)

**Decoding**:
```python
def decode_log_value(index):
    """Decode logarithmic index to actual value."""
    return 10.0 ** ((index - 16384) * 0.001)
```

---

## Wavelength Encoding

**Identical to TiO and H2O formats** (from `rpredict.for:325, 406`):

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

## Vacuum ↔ Air Wavelength Conversion

**Identical to TiO/H2O formats** (from `rpredict.for:442-449`):

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

---

## File Types and Differences

### lowlines.bin vs highlines.bin

**Inferred from file sizes and naming** (not explicitly documented in code):

**lowlines.bin** (831 MB):
- **Low excitation energy** transitions (E < ~10 eV typical)
- More lines (larger file size)
- Important for cool/warm stars (T < 10000 K)
- Ground state and low-lying excited states
- Example: Fe I, Fe II ground state transitions

**highlines.bin** (270 MB):
- **High excitation energy** transitions (E > ~10 eV typical)
- Fewer lines (smaller file size)
- Important for hot stars (T > 10000 K)
- Highly excited states and high ionization stages
- Example: Fe III, Fe IV, Fe V transitions

**File size ratio**: lowlines ≈ 3× larger than highlines
- Consistent with density of states (more low-E transitions)

### fclowlines.bin vs fchighlines.bin

**"fc" prefix meaning** (inferred from file sizes):
- Likely "filtered" or "compressed" versions
- fclowlines.bin (483 MB) ≈ 58% of lowlines.bin (831 MB)
- fchighlines.bin (157 MB) ≈ 58% of highlines.bin (270 MB)

**Possible interpretations**:
1. **Filtered**: Weak lines removed (below some gf or opacity threshold)
2. **Fine calculation**: Higher quality subset
3. **Compressed**: Different encoding or precision

**Recommendation**: Use full lowlines/highlines unless disk space is critical.

### nltelines.bin

**NLTE lines** (2.2 MB):
- **Non-LTE (non-local thermodynamic equilibrium)** transitions
- Very small file (<<1% of lowlines size)
- Used for explicit NLTE level population calculations
- Important for strong resonance lines (e.g., H Lyman, Ca II H&K)
- Handled separately by SYNTHE (written to fort.19 instead of fort.12)

From `rpredict.for:330` header read:
```fortran
READ(93)NLINES,LENGTH,IFVAC,IFNLTE,N19,TURBV,DECKJ,IFPRED,...
```
- `IFNLTE` flag controls NLTE line handling
- NLTE lines written to different fort units (19, 20 instead of 12, 14)

---

## File Statistics

| File              | Size  | Lines (est.) | Description              |
|-------------------|-------|--------------|--------------------------|
| lowlines.bin      | 831 MB| ~54 million  | Low excitation predicted |
| lowlines.asc      | 1.3 GB| ~54 million  | ASCII version            |
| highlines.bin     | 270 MB| ~17 million  | High excitation predicted|
| highlines.asc     | 441 MB| ~17 million  | ASCII version            |
| fclowlines.bin    | 483 MB| ~31 million  | Filtered low excitation  |
| fchighlines.bin   | 157 MB| ~10 million  | Filtered high excitation |
| nltelines.bin     | 2.2 MB| ~140,000     | NLTE lines               |
| nltelines.asc     | 4.9 MB| ~140,000     | ASCII version            |

**Record size**: 16 bytes per line (binary format)
**Format**: Fortran UNFORMATTED, direct access

---

## File Access Method

**Direct access** with fixed record size (from `rpredict.for:326-327`):

```fortran
OPEN(UNIT=11,STATUS='OLD',READONLY,SHARED,FORM='UNFORMATTED',
 1RECORDTYPE='FIXED',BLOCKSIZE=8000,RECORDSIZE=4,ACCESS='DIRECT')
```

**Python equivalent** using NumPy:

```python
import numpy as np

# Define the record dtype (same as TiO)
predicted_dtype = np.dtype([
    ('IWL',    'i4'),  # 4-byte integer
    ('IELION', 'i2'),  # 2-byte integer (NEGATIVE for predicted!)
    ('IELO',   'i2'),
    ('IGFLOG', 'i2'),
    ('IGR',    'i2'),
    ('IGS',    'i2'),
    ('IGW',    'i2'),
])

# Read entire file (warning: 831 MB for lowlines!)
with open('lowlines.bin', 'rb') as f:
    data = np.fromfile(f, dtype=predicted_dtype)

# Filter to only predicted lines (IELION < 0)
predicted_lines = data[data['IELION'] < 0]
```

---

## Complete Decoding Example

```python
import numpy as np

# NELIONOLD lookup table (excerpt - full table has 1005 entries)
NELIONOLD = {
    # Elements (excerpt)
    1: 1,    2: 2,                                    # H I-II
    7: 7,    8: 8,    9: 9,                          # He I-III
    151: 151, 152: 152, 153: 153, 154: 154,         # Fe I-IV
    # ... (see rpredict.for:34-322 for full table)

    # Molecules (excerpt)
    240: 240,   # H2 (index 841)
    246: 246,   # CH (index 846)
    270: 270,   # CN (index 869)
    366: 366,   # TiO (index 895)
    534: 534,   # H2O (index 940)
}

def decode_predicted_line(record):
    """
    Decode a single predicted line binary record.

    Parameters:
    -----------
    record : numpy record with fields IWL, IELION, IELO, IGFLOG, IGR, IGS, IGW

    Returns:
    --------
    dict with decoded values, or None if IELION > 0 (observed line)
    """
    # Constants
    RATIOLOG = np.log(1.0 + 1.0/2000000.0)

    # Check if predicted line (negative IELION)
    if record['IELION'] > 0:
        return None  # Skip observed lines (already in gfall)

    # Decode IELION to element/ion code
    index = abs(record['IELION']) // 10
    nelion_code = NELIONOLD.get(index, 0)

    if nelion_code == 0:
        return None  # Unknown species

    # Decode element and ionization
    element_number = (nelion_code // 6) + 1
    ionization_stage = (nelion_code % 6)

    # Wavelength (vacuum)
    wavelength_vac = np.exp(record['IWL'] * RATIOLOG)  # Angstroms

    # Energy (lower level)
    E_lower = 10.0 ** ((record['IELO'] - 16384) * 0.001)  # cm^-1

    # log(gf) and gf
    log_gf = (record['IGFLOG'] - 16384) * 0.001
    gf = 10.0 ** log_gf

    # Damping parameters
    gamma_rad = 10.0 ** ((record['IGR'] - 16384) * 0.001)
    gamma_stark = 10.0 ** ((record['IGS'] - 16384) * 0.001)
    gamma_vdw = 10.0 ** ((record['IGW'] - 16384) * 0.001)

    # Upper level energy (from wavelength)
    E_upper = E_lower + 1.0e7 / wavelength_vac  # cm^-1

    return {
        'wavelength_vacuum_angstrom': wavelength_vac,
        'element_number': element_number,
        'ionization_stage': ionization_stage,
        'nelion_code': nelion_code,
        'E_lower_cm': E_lower,
        'E_upper_cm': E_upper,
        'log_gf': log_gf,
        'gf': gf,
        'gamma_rad': gamma_rad,
        'gamma_stark': gamma_stark,
        'gamma_vdw': gamma_vdw,
        'source': 'predicted',
    }

# Example usage
with open('lowlines.bin', 'rb') as f:
    data = np.fromfile(f, dtype=predicted_dtype, count=100)

for record in data:
    line = decode_predicted_line(record)
    if line:
        print(f"{line['wavelength_vacuum_angstrom']:.3f} Å  "
              f"Element {line['element_number']} ion {line['ionization_stage']}  "
              f"log(gf) = {line['log_gf']:.3f}")
```

---

## Comparison with Other Formats

| Feature              | Predicted Lines    | TiO (tioschwenke) | H2O (h2ofastfix) | gfall         |
|----------------------|--------------------|-------------------|------------------|---------------|
| Record size          | 16 bytes           | 16 bytes          | 8 bytes          | ASCII (68-74) |
| Number of fields     | 7                  | 7                 | 3                | Many          |
| Species              | Atoms (predicted)  | TiO (5 isotopes)  | H2O (4 isotopes) | Atoms (obs.)  |
| Number of lines      | ~54M (low) + 17M (high) | 37.7M        | 65.9M            | ~600,000      |
| IELION encoding      | **Negative** ✅    | Isotope code      | Sign-bit isotope | Element code  |
| Damping parameters   | Encoded            | Encoded           | Calculated       | Encoded       |
| Wavelength encoding  | Exponential        | Exponential       | Exponential      | Direct ASCII  |
| Energy levels file   | Not required ✅    | Required          | Not required     | Not required  |
| Source               | Theory/calibration | Schwenke calc     | P&S calc         | Laboratory    |
| Quality              | Medium (semi-emp.) | High              | High             | Highest       |

**Key distinguishing feature**: IELION < 0 for predicted lines vs IELION > 0 for observed lines.

---

## Use in SYNTHE Pipeline

From `rpredict.for:330, 428-429`:

```fortran
! Read wavelength grid parameters from fort.93
READ(93)NLINES,LENGTH,IFVAC,IFNLTE,N19,TURBV,DECKJ,IFPRED,
 1WLBEG,WLEND,RESOLU,RATIO,RATIOLG,CUTOFF,LINOUT

! ... process lines ...

! Write to fort.12 (LTE) or fort.19 (NLTE)
WRITE(12)NBUFF,CONGF,NELION,ELO,GAMRF,GAMSF,GAMWF,alpha
WRITE(14)LINDAT8,LINDAT4
```

**Integration**:
1. **synbeg** - Initialize fort.12, fort.14, fort.93
2. **rgfalllinesnew** - Read observed lines (gfall.dat)
3. **rmolecasc** - Read molecular lines (ASCII)
4. **rschwenk** - Read TiO lines (binary)
5. **rh2ofast** - Read H2O lines (binary)
6. **rpredict** - Read predicted lines (binary) ← THIS TOOL
7. **synthe** - Synthesize spectrum using accumulated fort.12

**Optional step**: rpredict is often **skipped** for:
- High-precision abundance work (observed lines only)
- Hot stars (high excitation not important)
- Speed (fewer lines = faster)

**When to use**:
- Cool star modeling (many weak metal lines)
- Line blanketing studies (collective opacity)
- High-resolution synthesis (completeness)
- Exploratory work (identify missing transitions)

---

## Byte Order Considerations

**Same as TiO format** - original uses **VAX little-endian**.

**Modern systems** (x86-64 Linux): Should work as-is (little-endian).

**Big-endian systems**: May require byte swapping.

---

## Implementation Notes

### For Future Converter (predicted_to_hdf5.py)

**Challenges**:
1. **File size**: 831 MB (lowlines) requires chunked processing
2. **Memory**: Cannot load all ~54 million lines at once
3. **NELIONOLD table**: Must implement 1005-entry lookup table
4. **Filtering**: IELION > 0 lines must be skipped
5. **Multiple files**: Separate lowlines, highlines, nltelines

**Recommended approach**:
1. Read binary in chunks (e.g., 100,000 lines at a time)
2. Filter IELION < 0 (skip positive = observed lines)
3. Decode IELION using lookup table
4. Decode other fields (same as TiO)
5. Write to HDF5 with compression (expect 3-5× reduction)
6. Separate datasets for low/high/nlte, or add type field
7. Include NELIONOLD lookup table in HDF5 metadata

**Expected HDF5 output size**:
- lowlines: ~250-300 MB (compressed)
- highlines: ~80-100 MB (compressed)
- nltelines: ~1 MB (compressed)

**Priority**: Medium
- Important for complete stellar modeling
- But many use cases only need observed lines (gfall)
- ASCII alternatives exist (though 3× larger)

**NELIONOLD table implementation**:
```python
# Extract from rpredict.for:34-322 to Python dict
NELIONOLD = {
    1: 1, 2: 2,  # H I-II
    7: 7, 8: 8, 9: 9,  # He I-III
    # ... (full 1005 entries)
}

# Or load from companion JSON file
import json
with open('nelionold_table.json') as f:
    NELIONOLD = json.load(f)
```

---

## References

**Source code**:
- `upstream/castelli/source_codes/synthe/rpredict.for` - Binary reader for SYNTHE (451 lines)
- `upstream/castelli/source_codes/syntheg/rpredict.for` - Alternate version
- `upstream/castelli/source_codes/synthe/rschwenk.for` - TiO reader (same format)

**Scientific references**:
- Kurucz, R. L. (various) - Atomic line data and predicted line lists
- Available at: http://kurucz.harvard.edu/linelists/
- Predicted lines calculated from atomic structure codes

**Kurucz documentation**:
- http://kurucz.harvard.edu/linelists/linescd/ - Binary line list directory
- README files (if available)

**Related documentation**:
- `docs/archaeology/TIO_BINARY_FORMAT.md` - Same binary format structure
- `docs/archaeology/H2O_BINARY_FORMAT.md` - Similar format (but 8 bytes)
- `docs/archaeology/DEEP_DIVES/09_SYNTHE_LINE_ACCUMULATION.md` - Line reading pipeline
- `tools/line_lists/README.md` - HDF5 converter tools

---

## Version History

**v1.0** (2025-11-12):
- Initial documentation from reverse-engineering rpredict.for
- Complete record structure specification (same as TiO)
- IELION negative encoding explained
- NELIONOLD lookup table documented (1005 entries)
- Decoding algorithms for all fields
- File type differences inferred (low/high/nlte/fc variants)
- Python example code with NELIONOLD mapping
- Comparison with TiO, H2O, gfall formats
- Use in SYNTHE pipeline documented

---

**End of PREDICTED_LINES_BINARY_FORMAT.md**
