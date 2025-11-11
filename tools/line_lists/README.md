# Line List Conversion Tools

**Purpose**: Standalone Python tools to convert legacy Kurucz/Castelli line list formats to modern HDF5 for:
- Fast random access by wavelength
- Efficient storage with compression
- Easy integration with Julia, Python, R, MATLAB
- Well-documented schema for SYNTHE migration

**Context**: Part of ATLAS.jl code archaeology project (Phase 5 pivot to standalone tools)

---

## Available Tools

### 1. gfall_to_hdf5.py - Atomic Line Lists

Converts Kurucz gfall format (fixed-width ASCII, 160 chars/line) to HDF5.

**Input format**: Kurucz atomic line database format
- Example: `upstream/castelli/input_data/gf_tiny.dat`
- Format spec: `upstream/castelli/source_codes/synthe/rgfalllinesnew.for:127-128`
- Documentation: `docs/archaeology/DEEP_DIVES/09_SYNTHE_LINE_ACCUMULATION.md`

**Output format**: HDF5 with datasets:
```
/lines/
  wavelength        Float64  Wavelength (Å) as written in gfall file
  is_air            Bool     True if wavelength > 200nm (air), False if <= 200nm (vacuum)
  log_gf            Float32  log10(oscillator strength)
  element_code      Float32  Element.ion (26.00=Fe I, 26.01=Fe II)
  energy_lower      Float32  Lower level energy (cm^-1)
  j_lower           Float32  Lower level J quantum number
  label_lower       String   Lower level label (10 chars)
  energy_upper      Float32  Upper level energy (cm^-1)
  j_upper           Float32  Upper level J quantum number
  label_upper       String   Upper level label (10 chars)
  log_gamma_rad     Float32  log10(radiative damping)
  log_gamma_stark   Float32  log10(Stark damping)
  log_gamma_vdw     Float32  log10(van der Waals damping)
  reference         String   Source reference (4 chars)
  iso1_number       Int16    First isotope number
  iso1_fraction     Float32  log10(isotope 1 abundance)
  iso2_number       Int16    Second isotope number
  iso2_fraction     Float32  log10(isotope 2 abundance)
  lande_lower       Float32  Lande g factor (lower level)
  lande_upper       Float32  Lande g factor (upper level)
  isotope_shift     Float32  Isotope wavelength shift (Å)
  alpha             Float32  Photoionization cross-section

/metadata/
  format_version              "1.0"
  source_format               "Kurucz gfall"
  source_file                 Original filename
  conversion_time             ISO8601 timestamp
  lines_total                 Number of lines
  wavelength_min              Minimum wavelength (Å)
  wavelength_max              Maximum wavelength (Å)
  wavelength_convention       "Kurucz: air if > 200nm, vacuum if <= 200nm"
  air_vacuum_threshold_nm     200.0
  elements_count              Number of unique elements
  element_codes               Array of element codes found
  compressed                  Boolean (gzip used?)
```

**Important**: The Kurucz gfall format uses a **mixed convention** for wavelengths:
- **Vacuum wavelengths** for λ ≤ 200 nm (2000 Å)
- **Air wavelengths** for λ > 200 nm (2000 Å)

This is tracked in the HDF5 file via:
- `is_air` boolean array (True for air, False for vacuum)
- Metadata attributes on the wavelength dataset
- Global `wavelength_convention` metadata

See `upstream/castelli/source_codes/synthe/rgfalllinesnew.for:16` for the original Fortran comment.

**Usage**:
```bash
# Basic conversion
python3 gfall_to_hdf5.py input.dat output.h5

# With compression and validation
python3 gfall_to_hdf5.py input.dat output.h5 --compress --validate --verbose

# Help
python3 gfall_to_hdf5.py --help
```

**Performance**:
- `gf_tiny.dat` (1,197 lines): 0.09 MB compressed HDF5, <1 second
- Expected ~50-100× faster access than reading ASCII
- Compression ratio ~3-5× (depending on data)

**Dependencies**:
```bash
pip3 install h5py numpy
```

**Note**: pip works perfectly in Claude Code Web sandbox (tested 2025-11-11).

**Tested with**:
- Python 3.11.14
- h5py 3.15.1 (installed via pip)
- numpy 2.3.4 (installed via pip)
- Claude Code Web sandbox environment ✅

---

### 2. molecular_to_hdf5.py - Molecular Line Lists

Converts Kurucz molecular line formats (CH, OH, NH, CO, TiO, etc.) to HDF5.

**Input format**: Kurucz molecular line format (68-74 chars/line)
- Example: `upstream/kurucz/input_data/chbx.asc` (CH lines, 4,270 lines)
- Format spec: `upstream/castelli/source_codes/synthe/rmolecasc.for:105`
- Documentation: `docs/archaeology/DEEP_DIVES/09_SYNTHE_LINE_ACCUMULATION.md`

**Output format**: HDF5 with datasets:
```
/lines/
  wavelength        Float64  Vacuum wavelength (Å)
  log_gf            Float32  log10(oscillator strength)
  j_lower           Float32  Lower level J quantum number
  energy_lower      Float32  Lower level energy (cm^-1)
  j_upper           Float32  Upper level J quantum number
  energy_upper      Float32  Upper level energy (cm^-1)
  molecule_code     Int16    Molecule identifier (106=CH, 608=CO, etc.)
  label_lower       String   Lower level label (8 chars)
  label_upper       String   Upper level label (8 chars)
  isotope           Int16    Isotope number (12=12C, 13=13C, etc.)
  log_gamma_rad     Float32  log10(radiative damping)

/metadata/
  format_version         "1.0"
  source_format          "Kurucz molecular"
  source_file            Original filename
  conversion_time        ISO8601 timestamp
  lines_total            Number of lines
  wavelength_min         Minimum wavelength (Å)
  wavelength_max         Maximum wavelength (Å)
  molecules_count        Number of unique molecules
  predominant_molecule   Name of main molecule (e.g., "CH")
  predominant_code       Code of main molecule (e.g., 106)
  molecule_codes         Array of molecule codes found
  molecule_names         Array of molecule names
  isotopes               Array of isotope numbers found
  compressed             Boolean (gzip used?)
```

**Supported molecules** (via molecule_code):
- **106**: CH (carbon monohydride)
- **107**: NH (nitrogen monohydride)
- **108**: OH (hydroxyl radical)
- **112, 607**: CN (cyanogen)
- **606**: C2 (dicarbon)
- **608**: CO (carbon monoxide)
- **101**: H2 (molecular hydrogen)
- **102**: HD (deuterium hydride)
- **814**: NO (nitric oxide)
- **2222**: TiO (titanium oxide)
- **2608**: SiO (silicon monoxide)
- **2828**: FeH (iron monohydride)
- ... and more (see MOLECULE_NAMES dict in source code)

**Usage**:
```bash
# Basic conversion
python3 molecular_to_hdf5.py input.asc output.h5

# With compression and validation
python3 molecular_to_hdf5.py chbx.asc chbx.h5 --compress --validate --verbose

# Help
python3 molecular_to_hdf5.py --help
```

**Performance**:
- `chbx.asc` (4,270 CH lines): 0.09 MB compressed HDF5, <1 second
- Expected ~50-100× faster access than reading ASCII

**Dependencies**: Same as gfall_to_hdf5.py (h5py, numpy)

**Tested with**:
- Python 3.11.14
- chbx.asc (CH B-X transitions, 4,270 lines, 0 errors)

**Status**: ✅ **COMPLETE** (v1.0, 2025-11-11)

---

### 3. line_query.py - HDF5 Line List Query Tool

Interactive command-line tool to query atomic and molecular line lists in HDF5 format.

**Features**:
- Query by wavelength range
- Filter by element/molecule/ionization
- Export results to CSV, JSON, or ASCII table
- Display file info and statistics
- Fast queries using HDF5 slicing

**Usage**:
```bash
# Show file information
python3 line_query.py gf_tiny.h5 --info

# Query wavelength range
python3 line_query.py gf_tiny.h5 --wavelength 402 403

# Filter by element (Fe I = 26.00)
python3 line_query.py gfall.h5 --wavelength 5000 5100 --element 26.00

# Export to CSV
python3 line_query.py gfall.h5 --wavelength 5000 5100 --output subset.csv

# Show statistics
python3 line_query.py gf_tiny.h5 --stats
```

**Performance**:
- Wavelength query: 1-10 ms for 1000-10000 lines (SSD)
- Lazy loading: Only reads requested datasets
- Memory efficient: Slicing without loading full file

**Dependencies**: Same as converters (h5py, numpy)

**Tested with**:
- Python 3.11.14
- gf_tiny.h5 (1,197 atomic lines) ✅
- chbx.h5 (4,270 molecular lines) ✅

**Status**: ✅ **COMPLETE** (v1.0, 2025-11-11)

---

### 4. HDF5_SCHEMA_GUIDE.md - Visual Schema Documentation

Comprehensive visual guide to HDF5 line list schemas with diagrams, examples, and cross-language usage.

**Contents**:
- Atomic line list schema (21 datasets)
- Molecular line list schema (11 datasets)
- Field descriptions with units and precision
- Data flow diagrams (ASCII→HDF5)
- Molecule code reference table
- Usage examples (Python, Julia, R)
- Schema comparison and performance notes

**File location**: `tools/line_lists/HDF5_SCHEMA_GUIDE.md`

**Use cases**:
- Quick reference for HDF5 structure
- Integration guide for Julia/Python/R
- Schema documentation for SYNTHE migration
- Cross-language compatibility guide

**Status**: ✅ **COMPLETE** (v1.0, 2025-11-11)

---

## Planned Tools (TODO)

### 5. continua_to_hdf5.py - Continuum Opacity Tables

Converts continua.dat format to HDF5:
- H, H-, He I, He II continua
- Rayleigh scattering
- Electron scattering

**Example input**: `upstream/castelli/input_data/continua.dat` (5K)

**Status**: Format analysis needed (see `synbeg.for`)

### 4. line_query.py - HDF5 Line List Query Tool

Interactive tool to query HDF5 line lists:
```bash
# Find all Fe I lines in wavelength range
python3 line_query.py gfall.h5 --element 26.00 --wavelength 5000 5100

# Export subset to CSV
python3 line_query.py gfall.h5 --wavelength 5000 5100 --output subset.csv

# Statistics
python3 line_query.py gfall.h5 --stats
```

**Status**: Not started

### 5. fort12_inspector.py - Binary Fort.12 Inspector

Read and analyze SYNTHE fort.12 binary line databases:
- Parse Fortran unformatted records
- Extract line data for validation
- Compare with HDF5 conversions

**Status**: Not started (blocked on understanding Fortran binary format)

---

## Research Utility

These tools have **immediate value** for Paula's research:

1. **Fast wavelength queries**: HDF5 allows efficient range queries without loading entire database
2. **Cross-platform compatibility**: No Fortran compiler needed to read line data
3. **Modern analysis workflows**: Easy integration with pandas, Julia DataFrames, R
4. **Reproducibility**: Documented schema, version tracking, conversion metadata
5. **Validation baseline**: Convert legacy data → compare with Fortran output → verify Julia implementation

---

## Future SYNTHE Migration Support

When implementing Julia SYNTHE, these tools enable:

1. **Test data generation**: Convert known-good gfall files to HDF5 → use as validation data
2. **Format documentation**: HDF5 schema documents implicit Fortran format
3. **Performance baseline**: HDF5 read performance → target for Julia implementation
4. **Incremental migration**: Can use HDF5 as intermediate format during transition
5. **Reproducibility**: Same input data for Fortran vs Julia comparison

---

## Design Decisions

### Why HDF5?

- **Fast partial reads**: Only load wavelength range needed (vs reading entire ASCII)
- **Compression**: 3-5× smaller than ASCII with gzip
- **Self-documenting**: Metadata embedded in file
- **Language-agnostic**: Fortran, C, Python, Julia, R, MATLAB all have HDF5 libraries
- **Industry standard**: Used in astronomy (FITS compatibility), climate science, genomics

**Alternatives considered**:
- Parquet: Good, but less astronomy adoption
- SQLite: Slower for numerical arrays
- Binary flat file: Not self-documenting
- Keep ASCII: Too slow for large files

### Field Precision Choices

Following ATLAS12 migration analysis (see `docs/archaeology/MIGRATION_ASSESSMENT.md`):

- **Float64 for wavelength**: Need full precision for vacuum wavelength calculation
- **Float32 for most fields**: log(gf), energies, damping (sufficient precision)
- **Int16 for isotope numbers**: Saves space, max isotope number << 32767
- **String for labels**: Fixed-length strings are efficient in HDF5

### Compression Strategy

- **gzip level 4**: Good balance of speed (fast) and compression (70-80%)
- **Per-dataset compression**: Allows selective decompression
- **No chunking by default**: Line lists are typically read sequentially or by range

---

## Testing

### Test with gf_tiny.dat (included in repo)

```bash
cd /home/user/Atlas.jl

# Convert
python3 tools/line_lists/gfall_to_hdf5.py \
    upstream/castelli/input_data/gf_tiny.dat \
    /tmp/gf_tiny.h5 \
    --compress --validate --verbose

# Inspect with Python
python3 -c "
import h5py
with h5py.File('/tmp/gf_tiny.h5', 'r') as f:
    print('Lines:', len(f['lines/wavelength_air']))
    print('Range:', f['metadata'].attrs['wavelength_min'],
                 '-', f['metadata'].attrs['wavelength_max'], 'Å')
    print('Elements:', f['metadata'].attrs['elements_count'])
"

# Inspect with h5dump (if available)
h5dump -H /tmp/gf_tiny.h5
```

### Test with Julia (when available locally)

```julia
using HDF5

# Read HDF5
h5open("/tmp/gf_tiny.h5", "r") do f
    wl = read(f["lines/wavelength_air"])
    gf = read(f["lines/log_gf"])
    elem = read(f["lines/element_code"])

    println("Loaded $(length(wl)) lines")
    println("Range: $(minimum(wl)) - $(maximum(wl)) Å")

    # Find Fe I lines
    fe1_mask = elem .== 26.00
    println("Fe I lines: $(sum(fe1_mask))")
end
```

---

## File Locations

```
Atlas.jl/
├── tools/
│   └── line_lists/
│       ├── README.md                    # This file
│       ├── HDF5_SCHEMA_GUIDE.md         # Visual schema documentation ✅
│       ├── gfall_to_hdf5.py             # Atomic line converter ✅
│       ├── molecular_to_hdf5.py         # Molecular line converter ✅
│       ├── line_query.py                # HDF5 query tool ✅
│       ├── continua_to_hdf5.py          # Continuum opacity (TODO)
│       └── fort12_inspector.py          # Binary inspector (TODO)
│
├── upstream/castelli/input_data/
│   ├── gf_tiny.dat                      # Test atomic line list (1,197 lines)
│   ├── continua.dat                     # Continuum opacity data (5K)
│   └── ...
│
├── upstream/kurucz/input_data/
│   ├── chbx.asc                         # CH molecular lines (6,824 lines)
│   ├── molecules.dat                    # Molecular partition functions
│   └── ...
│
└── docs/archaeology/DEEP_DIVES/
    ├── 09_SYNTHE_LINE_ACCUMULATION.md   # Line list format documentation
    └── ...
```

---

## References

**Fortran Readers** (format specifications):
- `upstream/castelli/source_codes/synthe/rgfalllinesnew.for` - Atomic lines
- `upstream/castelli/source_codes/synthe/rmolecasc.for` - Molecular lines (CH, OH, etc.)
- `upstream/castelli/source_codes/synthe/rschwenk.for` - TiO lines
- `upstream/castelli/source_codes/synthe/rh2ofast.for` - H2O lines
- `upstream/castelli/source_codes/synthe/synbeg.for` - Continua format

**Archaeological Documentation**:
- `docs/archaeology/DEEP_DIVES/09_SYNTHE_LINE_ACCUMULATION.md` - Pipeline architecture
- `docs/archaeology/PHASE5_MIGRATION_PLAN.md` - Julia migration context
- `docs/archaeology/SYNTHE_MIGRATION_ASSESSMENT.md` - Cost/risk analysis

**Kurucz Database**:
- http://kurucz.harvard.edu/linelists.html - Official source
- gfall format description (implicit in Fortran code)

---

## Version History

**v1.0** (2025-11-11):
- ✅ `gfall_to_hdf5.py` - Atomic line converter (557 lines)
- ✅ Tested with gf_tiny.dat (1,197 lines, 0 errors, 0.10 MB)
- ✅ `molecular_to_hdf5.py` - Molecular line converter (574 lines)
- ✅ Tested with chbx.asc (4,270 CH lines, 0 errors, 0.09 MB)
- ✅ `line_query.py` - HDF5 query tool (463 lines)
- ✅ Tested with gf_tiny.h5 and chbx.h5 (info, query, stats, export)
- ✅ `HDF5_SCHEMA_GUIDE.md` - Visual schema documentation (600+ lines)
- ✅ HDF5 schemas documented with diagrams and examples
- ✅ Compression and validation working
- ✅ Vacuum/air wavelength tracking (atomic lines)
- ✅ Cross-language examples (Python, Julia, R)
- ✅ README created and updated

**Planned v1.1**:
- ⏳ Continuum opacity converter (continua.dat)
- ⏳ Fort.12 inspector (fort12_inspector.py)
- ⏳ TiO lines (Schwenke format, rschwenk.for)
- ⏳ H2O lines (fast format, rh2ofast.for)
- ⏳ Interactive web interface (optional)

---

## Contributing

When adding new tools to this directory:

1. **Follow naming convention**: `<format>_to_<format>.py` or `<function>.py`
2. **Include docstring**: Format spec, usage, examples
3. **Add validation**: `--validate` flag to verify output
4. **Update README**: Add tool to "Available Tools" section
5. **Test with examples**: Use files in `upstream/*/input_data/`
6. **Document schema**: HDF5 structure, field meanings, units
7. **Commit frequently**: Per Claude Code Web best practices

---

## License

MIT License (same as ATLAS.jl project)

Tools created by Claude (Anthropic) for Paula's ATLAS.jl code archaeology project.

---

**End of README**
