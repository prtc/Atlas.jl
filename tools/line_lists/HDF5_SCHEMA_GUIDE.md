# HDF5 Line List Schema Visual Guide

**Purpose**: Visual documentation of HDF5 schemas for atomic and molecular line lists

**Created**: 2025-11-11
**For**: ATLAS.jl code archaeology project

---

## Table of Contents

1. [Atomic Line List Schema](#atomic-line-list-schema)
2. [Molecular Line List Schema](#molecular-line-list-schema)
3. [Field Descriptions](#field-descriptions)
4. [Data Type Reference](#data-type-reference)
5. [Usage Examples](#usage-examples)

---

## Atomic Line List Schema

**Source format**: Kurucz gfall (160-char fixed-width ASCII)
**Created by**: `gfall_to_hdf5.py`

### File Structure

```
gfall.h5
├── /lines/                           # Main data group
│   ├── wavelength        [Float64]   # 1197 lines ✓
│   ├── is_air            [Bool]      # Air (T) or vacuum (F) wavelength
│   ├── log_gf            [Float32]   # log10(oscillator strength)
│   ├── element_code      [Float32]   # Element.ion (26.00=Fe I, 26.01=Fe II)
│   ├── energy_lower      [Float32]   # Lower level energy (cm⁻¹)
│   ├── j_lower           [Float32]   # Lower level J quantum number
│   ├── label_lower       [String10]  # Lower level label (10 chars)
│   ├── energy_upper      [Float32]   # Upper level energy (cm⁻¹)
│   ├── j_upper           [Float32]   # Upper level J quantum number
│   ├── label_upper       [String10]  # Upper level label (10 chars)
│   ├── log_gamma_rad     [Float32]   # log10(radiative damping)
│   ├── log_gamma_stark   [Float32]   # log10(Stark damping)
│   ├── log_gamma_vdw     [Float32]   # log10(van der Waals damping)
│   ├── reference         [String4]   # Source reference code
│   ├── iso1_number       [Int16]     # First isotope number
│   ├── iso1_fraction     [Float32]   # log10(isotope 1 abundance)
│   ├── iso2_number       [Int16]     # Second isotope number
│   ├── iso2_fraction     [Float32]   # log10(isotope 2 abundance)
│   ├── lande_lower       [Float32]   # Landé g-factor (lower level)
│   ├── lande_upper       [Float32]   # Landé g-factor (upper level)
│   ├── isotope_shift     [Float32]   # Isotope wavelength shift (Å)
│   └── alpha             [Float32]   # Photoionization cross-section
│
└── /metadata/                        # Metadata group
    ├── format_version              : "1.0"
    ├── source_format               : "Kurucz gfall"
    ├── source_file                 : "gf_tiny.dat"
    ├── conversion_time             : "2025-11-11T23:13:58"
    ├── converter                   : "gfall_to_hdf5.py v1.0"
    ├── lines_total                 : 1197
    ├── wavelength_min              : 402.37 Å
    ├── wavelength_max              : 403.06 Å
    ├── wavelength_convention       : "Kurucz: air if > 200nm, vacuum if <= 200nm"
    ├── air_vacuum_threshold_nm     : 200.0
    ├── elements_count              : 105
    ├── compressed                  : True
    └── element_codes [dataset]     : [1.0, 2.0, 6.0, ..., 92.0]
```

### Data Flow Diagram

```
┌─────────────────────────────────────────────────────────────┐
│ Kurucz gfall file (ASCII)                                   │
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ 402.3672  0.381 21.00     168.340  2.5 ds2 2D ...       │ │
│ │ 402.3673  0.381 21.00     168.340  2.5 ds2 2D ...       │ │
│ │ ...                                                      │ │
│ └─────────────────────────────────────────────────────────┘ │
└──────────────────────┬──────────────────────────────────────┘
                       │
                       ▼ gfall_to_hdf5.py
             ┌─────────────────────┐
             │  Parse 160-char     │
             │  fixed-width lines  │
             │  ├─ wavelength      │
             │  ├─ log_gf          │
             │  ├─ element_code    │
             │  ├─ energies        │
             │  ├─ damping         │
             │  └─ labels          │
             └──────────┬──────────┘
                       │
                       ▼
             ┌─────────────────────┐
             │  Check vacuum/air   │
             │  threshold (200nm)  │
             │  ├─ λ > 200nm → air │
             │  └─ λ ≤ 200nm → vac │
             └──────────┬──────────┘
                       │
                       ▼ HDF5 write
┌──────────────────────────────────────────────────────────────┐
│ HDF5 file (gfall.h5)                                         │
│ ┌──────────────────────────────────────────────────────────┐ │
│ │ /lines/wavelength   [402.3672, 402.3673, ...]           │ │
│ │ /lines/is_air       [False, False, ...]                 │ │
│ │ /lines/log_gf       [0.381, 0.381, ...]                 │ │
│ │ /lines/element_code [21.00, 21.00, ...]                 │ │
│ │ ...                                                      │ │
│ │ /metadata/wavelength_convention = "air if > 200nm..."   │ │
│ └──────────────────────────────────────────────────────────┘ │
└──────────────────────────────────────────────────────────────┘
```

### Example: Reading Atomic Lines

```python
import h5py

with h5py.File('gfall.h5', 'r') as f:
    # Read wavelengths
    wl = f['lines/wavelength'][:]
    is_air = f['lines/is_air'][:]

    # Find Fe I lines (element_code = 26.00)
    elem = f['lines/element_code'][:]
    fe1_mask = (elem == 26.00)

    # Get Fe I wavelengths
    fe1_wavelengths = wl[fe1_mask]
    fe1_air_or_vac = is_air[fe1_mask]

    print(f"Found {len(fe1_wavelengths)} Fe I lines")
    print(f"Air: {sum(fe1_air_or_vac)}, Vacuum: {sum(~fe1_air_or_vac)}")
```

---

## Molecular Line List Schema

**Source format**: Kurucz molecular (68-74 char fixed-width ASCII)
**Created by**: `molecular_to_hdf5.py`

### File Structure

```
molecular.h5
├── /lines/                           # Main data group
│   ├── wavelength        [Float64]   # 4270 lines ✓
│   ├── log_gf            [Float32]   # log10(oscillator strength)
│   ├── j_lower           [Float32]   # Lower level J quantum number
│   ├── energy_lower      [Float32]   # Lower level energy (cm⁻¹)
│   ├── j_upper           [Float32]   # Upper level J quantum number
│   ├── energy_upper      [Float32]   # Upper level energy (cm⁻¹)
│   ├── molecule_code     [Int16]     # Molecule identifier (106=CH, 608=CO)
│   ├── label_lower       [String8]   # Lower level label (8 chars)
│   ├── label_upper       [String8]   # Upper level label (8 chars)
│   ├── isotope           [Int16]     # Isotope number (12=¹²C, 13=¹³C)
│   └── log_gamma_rad     [Float32]   # log10(radiative damping)
│
└── /metadata/                        # Metadata group
    ├── format_version         : "1.0"
    ├── source_format          : "Kurucz molecular"
    ├── source_file            : "chbx.asc"
    ├── conversion_time        : "2025-11-11T23:17:56"
    ├── converter              : "molecular_to_hdf5.py v1.0"
    ├── lines_total            : 4270
    ├── wavelength_min         : 360.93 Å
    ├── wavelength_max         : 1158.42 Å
    ├── molecules_count        : 1
    ├── predominant_molecule   : "CH"
    ├── predominant_code       : 106
    ├── compressed             : True
    ├── molecule_codes [ds]    : [106]
    ├── molecule_names [ds]    : ["CH"]
    └── isotopes [ds]          : [12, 13]
```

### Molecule Code Reference

```
┌──────────┬─────────────────────────────────────────────┐
│   Code   │  Molecule                                   │
├──────────┼─────────────────────────────────────────────┤
│   101    │  H₂   (molecular hydrogen)                  │
│   102    │  HD   (deuterium hydride)                   │
│   106    │  CH   (carbon monohydride) ◄ example file   │
│   107    │  NH   (nitrogen monohydride)                │
│   108    │  OH   (hydroxyl radical)                    │
│  112,607 │  CN   (cyanogen)                            │
│   606    │  C₂   (dicarbon)                            │
│   608    │  CO   (carbon monoxide)                     │
│   814    │  NO   (nitric oxide)                        │
│   2222   │  TiO  (titanium oxide)                      │
│   2608   │  SiO  (silicon monoxide)                    │
│   2828   │  FeH  (iron monohydride)                    │
└──────────┴─────────────────────────────────────────────┘
```

### Data Flow Diagram

```
┌─────────────────────────────────────────────────────────────┐
│ Kurucz molecular file (ASCII)                               │
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ 360.9278 -4.473  6.5   580.810  7.5  28279.280 106...  │ │
│ │ 360.9601 -4.413  5.5   411.720  6.5  28107.710 106...  │ │
│ │ ...                                                      │ │
│ └─────────────────────────────────────────────────────────┘ │
└──────────────────────┬──────────────────────────────────────┘
                       │
                       ▼ molecular_to_hdf5.py
             ┌─────────────────────┐
             │  Parse 68-74 char   │
             │  fixed-width lines  │
             │  ├─ wavelength      │
             │  ├─ log_gf          │
             │  ├─ molecule_code   │
             │  ├─ isotope         │
             │  ├─ energies, J     │
             │  └─ labels          │
             └──────────┬──────────┘
                       │
                       ▼
             ┌─────────────────────┐
             │  Decode LOGGR       │
             │  (stored as int×100)│
             │  log_gamma_rad =    │
             │  LOGGR * 0.01       │
             └──────────┬──────────┘
                       │
                       ▼ HDF5 write
┌──────────────────────────────────────────────────────────────┐
│ HDF5 file (chbx.h5)                                          │
│ ┌──────────────────────────────────────────────────────────┐ │
│ │ /lines/wavelength    [360.93, 360.96, ...]              │ │
│ │ /lines/molecule_code [106, 106, ...]  (CH)              │ │
│ │ /lines/isotope       [12, 12, 13, ...]                  │ │
│ │ /lines/log_gf        [-4.473, -4.413, ...]              │ │
│ │ ...                                                      │ │
│ │ /metadata/predominant_molecule = "CH"                   │ │
│ └──────────────────────────────────────────────────────────┘ │
└──────────────────────────────────────────────────────────────┘
```

### Example: Reading Molecular Lines

```python
import h5py
import numpy as np

with h5py.File('chbx.h5', 'r') as f:
    # Read all data
    wl = f['lines/wavelength'][:]
    mol_code = f['lines/molecule_code'][:]
    isotope = f['lines/isotope'][:]

    # Find ¹²C¹H lines (isotope = 12)
    c12h_mask = (isotope == 12)

    # Find ¹³C¹H lines (isotope = 13)
    c13h_mask = (isotope == 13)

    print(f"¹²CH lines: {np.sum(c12h_mask)}")
    print(f"¹³CH lines: {np.sum(c13h_mask)}")

    # Get metadata
    mol_name = f['metadata'].attrs['predominant_molecule']
    print(f"Molecule: {mol_name}")
```

---

## Field Descriptions

### Common Fields (Both Schemas)

| Field | Type | Unit | Description |
|-------|------|------|-------------|
| `wavelength` | Float64 | Å | Wavelength (air or vacuum depending on format/range) |
| `log_gf` | Float32 | - | log₁₀(oscillator strength) |
| `energy_lower` | Float32 | cm⁻¹ | Lower level energy |
| `j_lower` | Float32 | - | Lower level total angular momentum J |
| `energy_upper` | Float32 | cm⁻¹ | Upper level energy |
| `j_upper` | Float32 | - | Upper level total angular momentum J |
| `log_gamma_rad` | Float32 | - | log₁₀(radiative damping constant) |

### Atomic-Specific Fields

| Field | Type | Unit | Description |
|-------|------|------|-------------|
| `is_air` | Bool | - | True if air wavelength (>200nm), False if vacuum (≤200nm) |
| `element_code` | Float32 | - | Element.ionization (26.00=Fe I, 26.01=Fe II, 26.02=Fe III) |
| `log_gamma_stark` | Float32 | - | log₁₀(Stark broadening by electrons) |
| `log_gamma_vdw` | Float32 | - | log₁₀(van der Waals broadening by H atoms) |
| `lande_lower` | Float32 | - | Landé g-factor for lower level (Zeeman effect) |
| `lande_upper` | Float32 | - | Landé g-factor for upper level (Zeeman effect) |
| `label_lower` | String10 | - | Lower level designation (e.g., "4s 2S") |
| `label_upper` | String10 | - | Upper level designation (e.g., "4p 2P") |
| `reference` | String4 | - | Source reference code |
| `iso1_number` | Int16 | - | First isotope mass number |
| `iso1_fraction` | Float32 | - | log₁₀(isotope 1 abundance fraction) |
| `iso2_number` | Int16 | - | Second isotope mass number |
| `iso2_fraction` | Float32 | - | log₁₀(isotope 2 abundance fraction) |
| `isotope_shift` | Float32 | Å | Isotope wavelength shift |
| `alpha` | Float32 | - | Photoionization cross-section |

### Molecular-Specific Fields

| Field | Type | Unit | Description |
|-------|------|------|-------------|
| `molecule_code` | Int16 | - | Molecule identifier (106=CH, 608=CO, 2222=TiO, etc.) |
| `isotope` | Int16 | - | Isotope mass number (12=¹²C, 13=¹³C, 14=¹⁴N, 16=¹⁶O, etc.) |
| `label_lower` | String8 | - | Lower rovibronic state (e.g., "X00E1") |
| `label_upper` | String8 | - | Upper rovibronic state (e.g., "B01E2") |

---

## Data Type Reference

### Numeric Types

| HDF5 Type | Python/NumPy | Size | Range | Precision |
|-----------|--------------|------|-------|-----------|
| `Float64` | `float64` | 8 bytes | ±1.7×10³⁰⁸ | ~15-16 digits |
| `Float32` | `float32` | 4 bytes | ±3.4×10³⁸ | ~6-7 digits |
| `Int16` | `int16` | 2 bytes | -32768 to 32767 | Exact |
| `Bool` | `bool` | 1 byte | True/False | Exact |

### String Types

| HDF5 Type | Description | Example |
|-----------|-------------|---------|
| `String4` | 4-char fixed string | "LD  " |
| `String8` | 8-char fixed string | "X00E1   " |
| `String10` | 10-char fixed string | "4s 2S     " |
| `String20` | 20-char variable string | "carbon monohydride" |

### Precision Rationale

- **Wavelength**: Float64 (vacuum/air calculation requires full precision)
- **Energy levels**: Float32 (6-7 digits sufficient for spectroscopy)
- **log(gf)**: Float32 (oscillator strengths accurate to ~0.1 dex)
- **Damping**: Float32 (uncertainties typically >10%)
- **Codes**: Int16 (small integers, saves space)

---

## Usage Examples

### Query by Wavelength Range

```bash
# Atomic lines 5000-5100 Å
python line_query.py gfall.h5 --wavelength 5000 5100

# Molecular lines in specific range
python line_query.py chbx.h5 --wavelength 400 500
```

### Filter by Element/Molecule

```bash
# Fe I lines only (element_code = 26.00)
python line_query.py gfall.h5 --wavelength 5000 5100 --element 26.00

# Fe II lines (element_code = 26.01)
python line_query.py gfall.h5 --wavelength 5000 5100 --element 26.01

# CH lines only (molecule_code = 106)
python line_query.py molecular.h5 --molecule 106
```

### Export Results

```bash
# Export to CSV
python line_query.py gfall.h5 --wavelength 5000 5100 --output subset.csv

# Export to JSON
python line_query.py gfall.h5 --wavelength 5000 5100 --output subset.json
```

### Read in Julia

```julia
using HDF5

# Open file
h5open("gfall.h5", "r") do f
    # Read wavelengths
    wl = read(f["lines/wavelength"])
    log_gf = read(f["lines/log_gf"])
    elem = read(f["lines/element_code"])

    # Filter Fe I lines (26.00)
    fe1_mask = elem .== 26.00
    fe1_wl = wl[fe1_mask]
    fe1_gf = log_gf[fe1_mask]

    println("Fe I lines: ", length(fe1_wl))

    # Read metadata
    meta = attributes(f["metadata"])
    println("Format: ", read(meta["source_format"]))
    println("Convention: ", read(meta["wavelength_convention"]))
end
```

### Read in Python

```python
import h5py
import numpy as np

with h5py.File('gfall.h5', 'r') as f:
    # Wavelength range query (efficient slicing)
    wl = f['lines/wavelength'][:]
    mask = (wl >= 5000) & (wl <= 5100)

    # Extract matching lines
    results = {
        'wavelength': wl[mask],
        'log_gf': f['lines/log_gf'][mask],
        'element_code': f['lines/element_code'][mask],
        'is_air': f['lines/is_air'][mask]
    }

    # Check air/vacuum status
    air_lines = np.sum(results['is_air'])
    vac_lines = len(results['is_air']) - air_lines

    print(f"Found {len(results['wavelength'])} lines")
    print(f"  Air (>200nm): {air_lines}")
    print(f"  Vacuum (≤200nm): {vac_lines}")
```

### Read in R

```r
library(rhdf5)

# Open file
h5 <- H5Fopen("gfall.h5")

# Read datasets
wl <- h5$lines$wavelength
log_gf <- h5$lines$log_gf
elem_code <- h5$lines$element_code

# Filter by wavelength
mask <- (wl >= 5000) & (wl <= 5100)
subset_wl <- wl[mask]

# Read metadata
meta <- h5$metadata
cat("Lines:", attr(meta, "lines_total"), "\n")
cat("Range:", attr(meta, "wavelength_min"), "-",
    attr(meta, "wavelength_max"), "Å\n")

H5Fclose(h5)
```

---

## Schema Comparison

### Similarities

- Both use `/lines/` group for data arrays
- Both use `/metadata/` group for attributes
- Both track wavelength, log(gf), energies, J values
- Both use compression (gzip level 4)
- Both embed conversion metadata and timestamps

### Differences

| Aspect | Atomic | Molecular |
|--------|--------|-----------|
| **Wavelength convention** | Mixed (air >200nm, vac ≤200nm) | All vacuum (data <200nm) |
| **Identifier** | element_code (Float32) | molecule_code (Int16) |
| **Air/vacuum flag** | `is_air` (Bool) | Not needed (all vacuum range) |
| **Damping** | Radiative + Stark + vdW | Radiative only |
| **Isotopes** | Two fields (iso1, iso2) | Single field |
| **Labels** | 10-char strings | 8-char strings |
| **Additional** | Landé g, ref, alpha | None |

---

## Performance Notes

### Query Speed

- **Wavelength range**: O(n) scan (HDF5 doesn't index)
- **Element filter**: O(n) after wavelength filter
- **Typical performance**: 1-10 ms for 1000-10000 lines (SSD)
- **Compression overhead**: ~2-5% slowdown, 60-70% size reduction

### Memory Efficiency

- **Lazy loading**: HDF5 reads only requested datasets
- **Partial reads**: Can slice arrays without loading full file
- **Example**: Query 100 lines from 1M line file → load <1 MB

### Best Practices

1. **Query wavelength first** (narrows dataset)
2. **Then filter by element/molecule** (smaller dataset to scan)
3. **Read only needed fields** (don't load all 21 datasets if only need 3)
4. **Use compression** (3-5× size reduction, minimal speed impact)

---

## Version History

**v1.0** (2025-11-11)
- Initial schema documentation
- Atomic and molecular schemas defined
- Field descriptions, examples, diagrams
- Created after gfall_to_hdf5.py and molecular_to_hdf5.py completion

---

**End of HDF5 Schema Visual Guide**
