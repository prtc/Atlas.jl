# HDF5 Line Data Strategy
*Best practices for managing large line lists in HDF5 format*

**Date**: 2025-11-12
**Purpose**: Document strategies for handling ~650 MB of HDF5 line data efficiently
**Context**: High metallicity cool star photometry requires all line sources including predicted lines

---

## The Size Problem

### Current Reality (All Line Sources)

| Source              | Binary/ASCII | HDF5 (compressed) | Lines      | Priority |
|---------------------|--------------|-------------------|------------|----------|
| gfall.dat           | 60 MB        | ~0.1 MB           | ~600,000   | Always   |
| Molecular (ASCII)   | 50 MB        | ~2-5 MB           | ~500,000   | Always   |
| TiO (binary)        | 576 MB       | ~150-200 MB       | 37.7M      | T < 4000K|
| H₂O (binary)        | 503 MB       | ~150-200 MB       | 65.9M      | T < 5000K|
| Predicted low-E     | 831 MB       | ~250-300 MB       | ~54M       | [M/H] > 0|
| Predicted high-E    | 270 MB       | ~80-100 MB        | ~17M       | T > 8000K|
| **TOTAL**           | **~2.3 GB**  | **~650-800 MB**   | **~175M**  |          |

**Challenge**: Cannot load 175 million lines into memory simultaneously.

**Reality**: High metallicity cool stars need predicted lines for accurate photometry - can't skip them entirely.

---

## Solution Overview

Four complementary strategies:

1. **Separate HDF5 files** - Load only needed line sources
2. **Wavelength filtering** - Extract only relevant spectral ranges
3. **Lazy loading** - Memory-map HDF5, don't load entire file
4. **Pre-filtered subsets** - Create working sets for common cases

---

## Strategy 1: Separate HDF5 Files

### Design

Keep each line source in its own HDF5 file:

```
tools/line_lists/output/
├── gfall.h5                 # ~0.1 MB  - observed atomic
├── molecular.h5             # ~5 MB    - observed molecular
├── molecular_partfuncs.h5   # ~0.05 MB - partition functions
├── continua.h5              # ~0.01 MB - continuum opacities
├── tio_schwenke.h5          # ~200 MB  - TiO 5 isotopes
├── h2o_partridge.h5         # ~200 MB  - H₂O 4 isotopes
├── predicted_lowlines.h5    # ~300 MB  - low excitation predicted
└── predicted_highlines.h5   # ~100 MB  - high excitation predicted
```

### Load Logic (Conditional)

**Load based on stellar parameters**:

```julia
using HDF5

function load_lines_for_star(Teff, metallicity, wavelength_range)
    lines = []

    # Always load observed atomic + molecular
    append!(lines, load_hdf5("gfall.h5", wavelength_range))
    append!(lines, load_hdf5("molecular.h5", wavelength_range))

    # Conditional loading by temperature
    if Teff < 4000
        append!(lines, load_hdf5("tio_schwenke.h5", wavelength_range))
    end

    if Teff < 5000
        append!(lines, load_hdf5("h2o_partridge.h5", wavelength_range))
    end

    # Conditional loading by metallicity
    if metallicity > 0.0  # Metal-rich stars
        append!(lines, load_hdf5("predicted_lowlines.h5", wavelength_range))
    end

    if Teff > 8000  # Hot stars
        append!(lines, load_hdf5("predicted_highlines.h5", wavelength_range))
    end

    return lines
end

# Example: Solar metallicity, cool star, optical photometry
lines = load_lines_for_star(
    Teff = 5000,           # K
    metallicity = 0.0,     # [M/H]
    wavelength_range = (3000, 10000)  # Å
)
```

**Benefits**:
- Only load what you need (saves memory)
- Easy to update individual line sources
- Clear provenance (know where each line comes from)

**Drawbacks**:
- Multiple file opens (small overhead)
- Must manage file paths

---

## Strategy 2: Wavelength Filtering

### During Conversion (Recommended!)

**Add wavelength range filter to all converters**:

```bash
# Convert only optical range (saves 50-70% disk space!)
python gfall_to_hdf5.py \
    --input gfall.dat \
    --output gfall_optical.h5 \
    --wl-min 3000 \
    --wl-max 10000

# Or convert UV range separately
python gfall_to_hdf5.py \
    --input gfall.dat \
    --output gfall_uv.h5 \
    --wl-min 1000 \
    --wl-max 3000
```

**File organization**:

```
output/
├── full/                       # Complete wavelength coverage
│   ├── predicted_lowlines.h5  # 300 MB (1000-100000 Å)
│   └── predicted_highlines.h5 # 100 MB (1000-100000 Å)
│
├── optical/                    # Optical only (3000-10000 Å)
│   ├── gfall_optical.h5       # 0.05 MB (was 0.1 MB)
│   ├── predicted_low_optical.h5  # 100 MB (was 300 MB)
│   └── predicted_high_optical.h5 # 30 MB (was 100 MB)
│
├── uv/                         # UV only (1000-3000 Å)
│   └── ...
│
└── infrared/                   # IR only (7000-30000 Å)
    └── ...
```

**Typical use case** - Photometry with SDSS filters:

| Filter | λ_min (Å) | λ_max (Å) | Data size needed |
|--------|-----------|-----------|------------------|
| u      | 3000      | 4000      | ~50 MB           |
| g      | 4000      | 5500      | ~70 MB           |
| r      | 5500      | 7000      | ~60 MB           |
| i      | 7000      | 8500      | ~50 MB           |
| z      | 8000      | 9500      | ~40 MB           |

**For all 5 filters**: ~200 MB total instead of 650 MB!

### During Loading (Alternative)

If you keep full wavelength range in HDF5, filter when loading:

```julia
function load_hdf5_wavelength_range(filename, wl_min, wl_max)
    h5open(filename, "r") do f
        wl = read(f["lines/wavelength_angstrom"])

        # Create boolean mask
        mask = (wl .>= wl_min) .& (wl .<= wl_max)

        # Load only matching lines
        lines = (
            wavelength = wl[mask],
            element = read(f["lines/element"])[mask],
            ion = read(f["lines/ionization"])[mask],
            log_gf = read(f["lines/log_gf"])[mask],
            E_lower = read(f["lines/E_lower_eV"])[mask],
            # ... other fields
        )

        return lines
    end
end
```

**Benefits**:
- Keep full dataset on disk (archival)
- Flexible runtime filtering

**Drawbacks**:
- Must read wavelength array to create mask (slower)
- Still uses full disk space

---

## Strategy 3: Lazy Loading (Memory Mapping)

### HDF5 Memory-Mapped Access

**Don't load entire file** - HDF5 can read subsets directly:

```julia
using HDF5

# Open file WITHOUT loading into RAM
h5open("predicted_lowlines.h5", "r") do f
    # Get dataset handle (no data loaded yet!)
    wl_dset = f["lines/wavelength_angstrom"]

    # Read only the subset you need
    # (HDF5 does this efficiently with chunking)
    wl = wl_dset[10000:20000]  # Load lines 10k-20k only

    # Or use logical indexing (slower but flexible)
    all_wl = read(wl_dset)
    mask = (all_wl .> 5000) .& (all_wl .< 6000)

    # Load only masked subset
    subset = (
        wavelength = all_wl[mask],
        log_gf = read(f["lines/log_gf"])[mask],
        # ...
    )
end
```

### HDF5 Chunking Strategy

**Configure chunking** when creating HDF5 files:

```python
import h5py
import numpy as np

# Create HDF5 with optimal chunking
with h5py.File('predicted_lowlines.h5', 'w') as f:
    # Create dataset with chunking
    f.create_dataset(
        'lines/wavelength_angstrom',
        data=wavelengths,
        chunks=(10000,),      # 10k lines per chunk
        compression='gzip',    # Compress each chunk
        compression_opts=6     # Compression level 1-9
    )
```

**Benefits**:
- Fast access to subsets
- Automatic decompression of only needed chunks
- Memory-efficient

**Optimal chunk size**: 10,000-100,000 lines per chunk
- Too small: overhead from many chunks
- Too large: must decompress large blocks

---

## Strategy 4: Pre-Filtered Subsets

### Common Use Cases

Create **pre-filtered working sets** for typical scenarios:

```
output/subsets/
├── solar_optical.h5           # 50 MB
│   # [M/H]=0, 3000-10000Å, gfall + molecular + TiO + H2O
│
├── metal_rich_cool_optical.h5# 100 MB
│   # [M/H]>0, T<5000K, 3000-10000Å, all sources including predicted
│
├── metal_poor_hot_uv.h5       # 30 MB
│   # [M/H]<0, T>8000K, 1000-5000Å, gfall + high excitation predicted
│
└── photometry_ugriz.h5        # 150 MB
    # 3000-10000Å, all sources, optimized for SDSS photometry
```

### Creation Script

```python
# create_subsets.py
def create_photometry_subset():
    """Create working set for SDSS ugriz photometry."""
    wl_min, wl_max = 3000, 10000  # Cover all 5 filters

    # Load and merge from all sources
    lines = []
    lines.extend(load_filtered('gfall.h5', wl_min, wl_max))
    lines.extend(load_filtered('molecular.h5', wl_min, wl_max))
    lines.extend(load_filtered('tio_schwenke.h5', wl_min, wl_max))
    lines.extend(load_filtered('h2o_partridge.h5', wl_min, wl_max))
    lines.extend(load_filtered('predicted_lowlines.h5', wl_min, wl_max))

    # Sort by wavelength (important for binary search!)
    lines.sort(key=lambda x: x['wavelength'])

    # Write combined subset
    write_hdf5('subsets/photometry_ugriz.h5', lines,
               metadata={
                   'description': 'SDSS ugriz photometry line list',
                   'wavelength_range': '3000-10000 Angstrom',
                   'sources': 'gfall, molecular, TiO, H2O, predicted_low',
                   'created': '2025-11-12',
                   'total_lines': len(lines)
               })
```

**Benefits**:
- Single file to load (simplest!)
- Pre-sorted and optimized
- Minimal memory footprint

**Drawbacks**:
- Must recreate if source data updates
- Less flexible (fixed wavelength range, fixed sources)

---

## Recommended Workflow

### For Development/Exploration

Use **Strategy 1 + Strategy 3** (separate files + lazy loading):

```julia
# Load only what you need, when you need it
lines = load_lines_for_star(Teff=5000, metallicity=0.5,
                            wavelength_range=(4000, 5500))
```

**Advantages**:
- Maximum flexibility
- Easy to update individual sources
- Good for exploratory work

### For Production/Photometry

Use **Strategy 2 + Strategy 4** (wavelength filtering + pre-filtered subsets):

```bash
# One-time setup: create photometry subset
python create_photometry_subset.py --filters ugriz --output photometry_ugriz.h5
```

```julia
# In production code: load single optimized file
lines = h5read("subsets/photometry_ugriz.h5", "lines")
```

**Advantages**:
- Fastest loading
- Smallest memory footprint
- Simplest code

### For Archival/Distribution

Use **Strategy 1** (separate files, full wavelength range):

```
archive/
├── gfall_full.h5              # Complete observed atomic
├── predicted_lowlines_full.h5 # Complete predicted low-E
└── predicted_highlines_full.h5# Complete predicted high-E
```

**Advantages**:
- Complete data preserved
- Clear provenance
- Users can create their own subsets

---

## Implementation in Converters

### Wavelength Filtering Support

**Add to all converters** (`gfall_to_hdf5.py`, `molecular_linelist_to_hdf5.py`, etc.):

```python
import argparse

def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('--input', required=True)
    parser.add_argument('--output', required=True)

    # Wavelength filtering (OPTIONAL)
    parser.add_argument('--wl-min', type=float, default=None,
                        help='Minimum wavelength (Angstrom, vacuum)')
    parser.add_argument('--wl-max', type=float, default=None,
                        help='Maximum wavelength (Angstrom, vacuum)')

    return parser.parse_args()

def convert_with_filtering(input_file, output_file, wl_min=None, wl_max=None):
    """Convert to HDF5 with optional wavelength filtering."""

    lines = []
    with open(input_file) as f:
        for line_text in f:
            parsed = parse_line(line_text)

            # Apply wavelength filter if specified
            if wl_min is not None and parsed['wavelength'] < wl_min:
                continue
            if wl_max is not None and parsed['wavelength'] > wl_max:
                continue

            lines.append(parsed)

    # Write to HDF5
    write_hdf5(output_file, lines,
               metadata={
                   'wavelength_min': wl_min or 'none',
                   'wavelength_max': wl_max or 'none',
                   'total_lines': len(lines),
                   'filtered': wl_min is not None or wl_max is not None
               })

    # Report statistics
    print(f"Converted {len(lines):,} lines")
    if wl_min or wl_max:
        print(f"Wavelength range: {wl_min or 'none'}-{wl_max or 'none'} Å")
```

### Usage Examples

```bash
# Convert full wavelength range
python gfall_to_hdf5.py \
    --input gfall.dat \
    --output gfall_full.h5

# Convert optical only (saves 60% space)
python gfall_to_hdf5.py \
    --input gfall.dat \
    --output gfall_optical.h5 \
    --wl-min 3000 \
    --wl-max 10000

# Convert UV only
python gfall_to_hdf5.py \
    --input gfall.dat \
    --output gfall_uv.h5 \
    --wl-min 1000 \
    --wl-max 3000

# Convert predicted lines for SDSS photometry
python predicted_to_hdf5.py \
    --input lowlines.bin \
    --output predicted_low_photometry.h5 \
    --wl-min 3000 \
    --wl-max 10000
```

---

## Performance Comparison

### Memory Usage

| Strategy                      | RAM needed        | Load time |
|-------------------------------|-------------------|-----------|
| Load all (~175M lines)        | ~14 GB            | ~60 sec   |
| Separate files (conditional)  | ~2 GB (typical)   | ~10 sec   |
| Wavelength filtered (optical) | ~800 MB           | ~5 sec    |
| Pre-filtered subset           | ~500 MB           | ~2 sec    |

**Assumptions**:
- 8 bytes/field × 10 fields × N lines
- Typical cool star: gfall + molecular + TiO + H2O + predicted_low

### Disk Space

| Strategy              | Disk usage        | Flexibility |
|-----------------------|-------------------|-------------|
| Full HDF5 (all)       | ~650 MB           | Maximum     |
| Optical only          | ~200 MB (30%)     | Medium      |
| Per-filter subsets    | ~300 MB total     | Low         |
| Compressed archives   | ~150 MB (gzip)    | Archival    |

---

## Decision Tree

```
Do you need predicted lines?
├─ No (observed only): Strategy 1 (separate files)
│  └─ Load: gfall.h5 + molecular.h5 (~5 MB total)
│
└─ Yes (high metallicity cool stars)
   │
   ├─ Working with single wavelength range? (e.g., one photometry filter)
   │  └─ Yes: Strategy 2 (wavelength filtering during conversion)
   │     └─ Creates small HDF5 files (~50-100 MB)
   │
   ├─ Working with fixed set of filters? (e.g., always SDSS ugriz)
   │  └─ Yes: Strategy 4 (pre-filtered subset)
   │     └─ Create photometry_ugriz.h5 once (~150 MB)
   │
   └─ Exploring different stellar parameters?
      └─ Yes: Strategy 1 + Strategy 3 (separate files + lazy loading)
         └─ Load conditionally based on Teff, [M/H], wavelength
```

---

## Metadata Best Practices

### Store Filtering Information

Always record what filtering was applied:

```python
metadata = {
    # Source information
    'source_file': 'lowlines.bin',
    'source_format': 'Kurucz predicted lines (binary)',
    'conversion_date': '2025-11-12',
    'converter_version': '1.0',

    # Filtering applied
    'wavelength_min_angstrom': 3000.0,
    'wavelength_max_angstrom': 10000.0,
    'filtered': True,
    'filter_description': 'Optical range for SDSS photometry',

    # Statistics
    'total_lines': 12500000,
    'lines_filtered_out': 41500000,
    'file_size_mb': 98.5,

    # Usage notes
    'recommended_use': 'SDSS ugriz photometry, [M/H] > 0 stars',
    'complete_data_location': 'archive/predicted_lowlines_full.h5'
}

# Store in HDF5 attributes
for key, value in metadata.items():
    f.attrs[key] = value
```

### Query Metadata Before Loading

```julia
# Check what's in the file before loading
using HDF5

h5open("predicted_low_optical.h5", "r") do f
    wl_min = read(f.attrs["wavelength_min_angstrom"])
    wl_max = read(f.attrs["wavelength_max_angstrom"])
    total_lines = read(f.attrs["total_lines"])

    println("Wavelength range: $wl_min - $wl_max Å")
    println("Total lines: $(total_lines)")

    # Decide if this file meets your needs
    if wl_min <= 4000 && wl_max >= 5500
        # Good for g-band!
        lines = read(f["lines"])
    else
        # Need different file
        error("File doesn't cover g-band (4000-5500 Å)")
    end
end
```

---

## Migration from Current Setup

### Phase 1: Convert with Full Wavelength Range

```bash
# Create complete archives (one-time)
python gfall_to_hdf5.py --input gfall.dat --output archive/gfall_full.h5
python molecular_linelist_to_hdf5.py --input molecular.asc --output archive/molecular_full.h5
# ... etc for all sources
```

### Phase 2: Create Optical Subsets

```bash
# Create working files for photometry (most common use case)
for source in gfall molecular tio h2o predicted_low predicted_high; do
    python ${source}_to_hdf5.py \
        --input ${source}.dat \
        --output working/${source}_optical.h5 \
        --wl-min 3000 --wl-max 10000
done
```

### Phase 3: Create Pre-Filtered Subsets

```bash
# Combine into single-file subsets
python create_subset.py \
    --sources working/*_optical.h5 \
    --output subsets/photometry_ugriz.h5 \
    --description "SDSS ugriz photometry (3000-10000 Å)"
```

### Phase 4: Use in Production

```julia
# Simple loading in production code
lines = h5read("subsets/photometry_ugriz.h5", "lines")
```

**Timeline**:
- Phase 1: 2-3 hours (conversion time)
- Phase 2: 1 hour (re-convert with filtering)
- Phase 3: 30 min (merge and optimize)
- Phase 4: Immediate (start using!)

---

## Summary

**For your use case** (high metallicity cool stars, photometry):

1. ✅ **Convert all sources to HDF5** (including predicted lines)
   - Full wavelength range for archive
   - Wavelength-filtered for working files

2. ✅ **Add `--wl-min` and `--wl-max` to all converters**
   - Enables creating optical-only subsets
   - Reduces size by 60-70%

3. ✅ **Create photometry subset** (3000-10000 Å)
   - Single file: `photometry_ugriz.h5` (~150 MB)
   - Contains: gfall + molecular + TiO + H2O + predicted_low

4. ✅ **Use conditional loading** for exploration
   - Load full files with wavelength filtering
   - Load based on Teff, [M/H]

**Result**:
- Archive: ~650 MB (complete data)
- Working: ~150 MB (photometry subset)
- Memory: ~500 MB-2 GB (depending on stars modeled)

**Instead of worrying about 650 MB, you'll typically use 150 MB** - perfectly manageable!

---

## Cross-References

- `PREDICTED_LINES_BINARY_FORMAT.md` - Predicted line format specification
- `TIO_BINARY_FORMAT.md` - TiO binary format specification
- `H2O_BINARY_FORMAT.md` - H2O binary format specification
- `tools/line_lists/README.md` - Converter tool documentation
- `PHASE5_MIGRATION_PLAN.md` - Julia migration strategy (blocked, pivoted to tools)

---

**End of HDF5_USAGE_STRATEGY.md**
