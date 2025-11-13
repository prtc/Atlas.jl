# ODF Pipeline Overview
*Opacity Distribution Function Generation for ATLAS9*

**Created**: 2025-11-12
**Status**: Breadth-first survey
**Confidence**: MEDIUM-HIGH (based on Castelli documentation + source code headers)

---

## Executive Summary

**What is an ODF?** An Opacity Distribution Function (ODF) is a pre-computed statistical representation of line opacity that allows ATLAS9 to model stellar atmospheres 10-100× faster than ATLAS12's direct line-by-line opacity sampling.

**Key Insight**: Instead of summing opacity from millions of spectral lines at every iteration (ATLAS12 approach), ATLAS9 uses pre-tabulated opacity distributions binned by frequency intervals. This trades some accuracy for massive speed gains.

**Pipeline**: Line lists → xnfdf (pretabulate atomic data) → dfsynthe (compute ODFs) → dfsortp (rearrange) → separatedf (split BIG/LITTLE) → ODF files for ATLAS9

**Credit Usage**: This document ~$8-12 estimated (breadth-first survey, 800-1,200 lines target)

---

## I. Conceptual Foundation: What is an ODF?

### 1.1 The Problem: Line Opacity is Expensive

**In ATLAS12/SYNTHE** (direct line opacity):
- Read 100,000 - 1,000,000 spectral lines
- For each atmospheric iteration:
  - For each of ~1,500 wavelength points:
    - For each of 99 depth points:
      - Sum opacity contributions from ALL lines
      - Apply Voigt profile, broadening, etc.
- **Computational cost**: Hours per model
- **Accuracy**: High (every line treated individually)

**The ATLAS9 Insight** (Kurucz 1979, refined by Castelli):
- Line opacity at a given wavelength is dominated by ~10-100 strong lines
- Weak lines contribute statistically, not individually
- **Idea**: Pre-compute opacity *distributions* binned by frequency
- At runtime: Interpolate from pre-computed tables instead of summing millions of lines
- **Computational cost**: Minutes per model
- **Accuracy**: Good for most applications (validated against high-res spectra)

### 1.2 What is an Opacity Distribution Function?

**Definition**: An ODF is a cumulative distribution function (CDF) of line opacity strength within a frequency interval.

**Mathematically**:
```
ODF(κ, ν, T, P_gas, ξ_turb) = fraction of wavelengths in interval Δν
                                where line opacity < κ
```

**In practice**: For each frequency interval, store 12 opacity values representing the CDF quantiles:
- 0.001, 0.01, 0.05, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9

**Physical parameters tabulated**:
- **57 temperatures**: ~3,000 K to ~50,000 K (logarithmic spacing)
- **25 gas pressures**: 10^-3 to 10^8 dyne/cm² (logarithmic spacing)
- **5 microturbulent velocities**: 0, 1, 2, 4, 8 km/s
- **2 resolutions**: BIG (328 intervals, for model iteration) and LITTLE (1,212 intervals, for radiation field)

**Total ODF table size**: 57 × 25 × 5 × (328 or 1,212) × 12 quantiles ≈ several MB per metallicity

### 1.3 ODF vs Direct Line Opacity (ATLAS9 vs ATLAS12)

| Feature | ATLAS9 (ODF) | ATLAS12 (Direct OS) |
|---------|--------------|---------------------|
| **Speed** | Minutes | Hours |
| **Line treatment** | Statistical distribution | Individual line-by-line |
| **Accuracy** | ~1-3% for most applications | Highest accuracy |
| **Setup cost** | Generate ODFs once per [M/H] | None (read line lists directly) |
| **Use case** | Large grids of models | Individual high-precision models |
| **Frequency resolution** | 328 or 1,212 fixed intervals | Arbitrary (user-defined) |
| **Memory** | Low (tables are small) | High (millions of lines in memory) |

**When to use which**:
- **ATLAS9**: Model grids, parameter space exploration, quick-look models
- **ATLAS12**: High-precision work, detailed abundance analysis, benchmarking

**Reference**: Castelli & Kurucz (2003), A&A 419, 725 - "New Grids of ATLAS9 Model Atmospheres"

---

## II. ODF Generation Pipeline

### 2.1 Overview: Four-Step Pipeline

**Pipeline flow**:
```
Step 1: XNFDF     - Pretabulate atomic/molecular number densities + continuum opacity
                    (57 T × 25 P grid, independent of microturbulence)
                    ↓
Step 2: DFSYNTHE  - Compute ODFs from line lists for each (T, P, ξ_turb)
                    (57 runs, one per temperature, 5 ξ_turb each)
                    ↓
Step 3: DFSORTP   - Rearrange ODF tables (transpose from T-sorted to ν-sorted)
                    ↓
Step 4: SEPARATEDF - Merge 57 temperature tables, split BIG/LITTLE resolutions
                    ↓
                    Final ODF files: p00big2.bdf, p00lit2.bdf
```

**Total runtime**: ~1-2 hours for full ODF generation (all temperatures, all ξ_turb)

**Input data required**:
- Line lists: lowlines, highlines, diatomics, TiO, H₂O, NLTE lines (repacked to binary)
- Molecular data: molecules.dat (partition functions)
- Continuum data: continua.dat (photoionization edges)
- Atomic data: pfiron.dat (Fe partition functions)

**Output**: Two binary files per [M/H] and ξ_turb:
- `M25ABIG2.BDF` - BIG resolution (328 intervals, for model calculation)
- `M25ALIT2.BDF` - LITTLE resolution (1,212 intervals, for radiation field)

**Naming convention**:
- `M25` = log₁₀[M/H] = -2.5 (example: metal-poor)
- `A` = alpha-enhanced ([α/Fe] = +0.4)
- `BIG`/`LIT` = resolution
- `2` = microturbulence ξ = 2 km/s

### 2.2 Step 1: XNFDF - Pretabulate Atomic Data

**Program**: `xnfdf.for` (16,612 lines Castelli, 16,203 Kurucz)

**Purpose**: Pre-compute atomic/molecular number densities and continuum opacities for a 2D grid of (T, P_gas), independent of microturbulent velocity.

**Why separate from DFSYNTHE?** Number densities and continuum opacity don't depend on ξ_turb, so compute once and reuse for all 5 microturbulence values. Saves ~80% of redundant computation.

#### Input Files

| Unit | File | Description | Format |
|------|------|-------------|--------|
| 5 | Control cards (stdin) | T, P_gas grid + abundances | ASCII |
| 2 | molecules.dat | Molecular partition functions | ASCII |
| 17 | continua.dat | Photoionization edge data | ASCII |
| 14 | pfiron.dat | Fe partition functions | ASCII |

#### Control Cards (stdin)

**Temperature and pressure grid specification**:
- 57 temperatures (typical range: 3,000 K to 50,000 K)
- 25 gas pressures (typical range: 10^-3 to 10^8 dyne/cm²)
- Abundances: Solar or custom [M/H], [α/Fe] enhancements

📋 **TODO**: Document exact control card format (read READIN subroutine in xnfdf.for)

#### Output Files

| Unit | File | Description | Format |
|------|------|-------------|--------|
| 10 | xnfpdf.dat | Number densities (57T × 25P × 99 elements) | Binary |
| 22 | xnfpdfmax.dat | Maximum number densities | Binary |

**Data stored in xnfpdf.dat** (per T, P_gas point):
- Atomic number densities: n(element, ionization state) for 99 elements
- Doppler widths: Δλ_D for thermal + microturbulence broadening
- Continuum opacities: κ_cont(ν) at 1,131 frequency points (377 edges × 3 points per interval)
- Thermodynamic state: T, P, ρ, n_e, X_H, X_He

**Key subroutines** (from xnfdf.for):

**Shared with ATLAS12** (✅ already documented in Phase 1-4):
- **POPS** - Saha-Boltzmann populations (see Deep Dive 02)
- **NELECT** - Electron density calculation
- **PFSAHA** - Partition functions
- **KAPP** - Continuum opacity (see Deep Dive 03, sections on continuum)
- **HOP, HMINOP, HE1OP, HE2OP, COOLOP, LUKEOP, HOTOP** - Individual opacity sources
- **MOLEC, NMOLEC** - Molecular equilibrium (see PHYSICS_PIPELINE_ATLAS12.md)
- **READMOL** - Read molecular data

**Unique to xnfdf**:
- **READIN(MODE)** - Parse control cards and build T, P_gas grid
- **TTAUP** - ⚠️ **UNCERTAIN** - Rosseland optical depth tabulation? (needs source inspection)
- **BLOCKE, BLOCKR** - ⚠️ **UNCERTAIN** - Block data initialization? (needs inspection)

⚠️ **COMPLEX SECTION** (lines ~400-1,500): Main loop over T, P_gas grid with population calculations and continuum opacity summation.

**Migration note**: If ATLAS12 is migrated first, ~75% of xnfdf subroutines can be reused (populations, opacity sources, molecular equilibrium).

#### Execution

**Compilation** (Castelli):
```bash
ifort -save -o xnfdf.exe xnfdf.for
```

**Execution**:
```bash
source xnfdf.com
```

**Runtime**: ~5-15 minutes (57 temperatures × 25 pressures = 1,425 grid points)

**Output size**: xnfpdf.dat ~20-50 MB (depends on continuum frequency grid)

---

### 2.3 Step 2: DFSYNTHE - Compute ODFs from Line Lists

**Program**: `dfsynthe.for` (3,733 lines Castelli, 3,660 Kurucz)

**Purpose**: For each temperature in the xnfdf grid, compute opacity distribution functions by:
1. Reading all spectral lines in a wavelength range (8.977 nm to 10 μm)
2. Computing line opacity at millions of wavelength points
3. Binning opacity into frequency intervals
4. Computing CDF quantiles for each interval

**Key insight**: This is the computationally expensive step - must process 10⁵-10⁶ lines for each of 57 temperatures × 5 microturbulences = 285 runs total.

#### Input Files

| Unit | File | Description | Format | Lines |
|------|------|-------------|--------|-------|
| 10 | xnfpdf.dat | Pretabulated atomic data from xnfdf | Binary | - |
| 22 | xnfpdfmax.dat | Maximum densities from xnfdf | Binary | - |
| 11 | lowlinesdf.bin | Repacked low-excitation atomic lines | Binary | ~500K |
| 21 | highlinesdf.bin | Repacked high-excitation atomic lines | Binary | ~500K |
| 31 | diatomicsdf.bin | Repacked diatomic molecular lines | Binary | ~100K |
| 41 | tiolinesdf.bin | Repacked TiO lines (Schwenke) | Binary | ~1M |
| 43 | h2olinesdf.bin | Repacked H₂O lines (Partridge-Schwenke) | Binary | ~1M |
| 51 | nltelinesdf.bin | Repacked NLTE lines | Binary | ~10K |
| 5 | Control switches (stdin) | 57-element array: which T to compute | ASCII | 1 |

**Why "repacked" line lists?** Original Kurucz line lists are in ASCII or mixed formats optimized for human reading. The repack utilities convert them to binary with fixed-width records for fast random access during ODF computation.

**Repack utilities** (in dfsynthe/ directory):
- `repacklow.for` - Repack lowlines.bin (atomic lines, low excitation)
- `repackhi.for` - Repack highlines.bin (atomic lines, high excitation)
- `repackdi.for` - Repack diatomicsiwl.bin (molecular lines)
- `repacktio.for` - Repack tioschwenke.bin (TiO lines)
- `repackh2o.for` - Repack h2ofastfix.bin (H₂O lines)
- `repacknlte.for` - Repack nltelines.asc (NLTE lines)

**Repacking process**: One-time setup before first ODF generation. Reads ASCII/binary Kurucz formats, writes fixed-width binary with:
- Wavelength (REAL*8)
- log(gf) (REAL*4)
- Excitation energy (REAL*4)
- Element.ion code (REAL*4)
- Damping parameters (REAL*4)

#### Control Switches (stdin)

**Format**: 57-element integer array (one per temperature)
```
1000000000000000000000000000000000000000000000000000000000
```
- Position i = 1: Compute ODF for temperature T_i
- Position i = 0: Skip temperature T_i

**Typical usage**: Set one temperature to 1, all others to 0. Run DFSYNTHE 57 times (once per temperature). This allows parallelization across temperatures.

**Example from dfp00.com** (Castelli's batch script for [M/H]=0):
```bash
# Run 1: T = 3,000 K
echo "1000000000000000000000000000000000000000000000000000000000" | dfsynthe.exe
# Run 2: T = 3,162 K
echo "0100000000000000000000000000000000000000000000000000000000" | dfsynthe.exe
# ... (55 more runs)
# Run 57: T = 50,000 K
echo "0000000000000000000000000000000000000000000000000000000001" | dfsynthe.exe
```

#### Output Files

For **each temperature** and **each microturbulence**, DFSYNTHE produces one ODF file:

**Filename pattern**: `dfp00t-XXXX-vtN.bin`
- `p00` = [M/H] = 0.0 (solar metallicity)
- `t-XXXX` = temperature in Kelvin (e.g., t-5000 for 5,000 K)
- `vtN` = microturbulence velocity (vt0, vt1, vt2, vt4, vt8 km/s)

**File format**: Binary, UNFORMATTED Fortran
- 1,540 frequency intervals (fixed grid)
- 25 gas pressures
- 12 ODF quantiles per (frequency, pressure) pair
- Size: ~5-10 MB per file

**Total output from dfp00.com**: 57 temperatures × 5 ξ_turb = **285 binary files**

**Data in each file**: `ODF(i_freq, i_pgas, i_quantile)` where:
- `i_freq` = 1..1,540 (frequency interval index)
- `i_pgas` = 1..25 (pressure index)
- `i_quantile` = 1..12 (CDF quantile: 0.001, 0.01, 0.05, 0.1, 0.2, ..., 0.9)

#### Key Subroutines

**Shared with SYNTHE** (✅ partially documented in ARCHITECTURE_DETAILS.md):
- **XLINOP** - Line opacity calculation with Voigt profiles (similar to SYNTHE's XLINOP, but ODF-specific)
- **TABVOIGT** - Pretabulate Voigt function lookup tables
- **MAP1** - Parabolic interpolation for table lookups

**Unique to DFSYNTHE** (⚠️ ODF-specific algorithms):
- **DFINTERVALS** - Define 1,540 frequency intervals for ODF binning
- **DFCALC** - Compute ODF from opacity spectrum (core algorithm)
- **SELECTLINES** - Select lines contributing to each frequency interval
- **BISORT** - Binary sort for ODF quantile calculation
- **VTTAB** - Pretabulate velocity-temperature broadening profiles
- **ROSSCALC** - ⚠️ **UNCERTAIN** - Rosseland mean opacity calculation?

⚠️ **COMPLEX SECTIONS**:
1. **Lines 150-400**: Main loop over temperatures (reads switches, iterates 57 times)
2. **XLINOP subroutine** (lines 436-2,758): Line opacity calculation - similar to SYNTHE's XLINOP but with ODF-specific binning (see Deep Dive 03 for general line opacity algorithms)
3. **DFCALC subroutine** (lines 3,352-3,400): Core ODF computation - bins opacity spectrum into CDF quantiles
4. **SELECTLINES subroutine** (lines 2,958-3,351): Selects lines contributing to each frequency interval (optimization to avoid processing all 10⁶ lines)

#### Execution

**Compilation**:
```bash
ifort -save -o dfsynthe.exe dfsynthe.for
```

**Execution** (for [M/H]=0, all 57 temperatures):
```bash
source dfp00.com
```

**Runtime**:
- Per temperature: ~1-3 minutes (depends on number of lines)
- All 57 temperatures × 5 ξ_turb: ~30-90 minutes

**Parallelization potential**: Each temperature is independent → can run 57 jobs in parallel on a cluster (reduces wall time to ~1-3 minutes).

#### Algorithm Deep Dive: How ODFs are Computed

**High-level algorithm** (inside DFSYNTHE for one temperature):

```
For each microturbulence ξ_turb (0, 1, 2, 4, 8 km/s):
  For each of 25 gas pressures P_gas:

    1. Read pretabulated data from xnfpdf.dat:
       - Number densities n(element, ion)
       - Continuum opacities κ_cont(ν)
       - Doppler widths Δλ_D(element, ξ_turb)

    2. For each of 1,540 frequency intervals:

       a. Select lines contributing to this interval:
          - Wavelength within interval ± 10 Doppler widths (Voigt wings)
          - Line strength > threshold (avoid weak lines)
          - Typical: 100-1,000 lines per interval

       b. Create high-resolution opacity spectrum:
          - Wavelength grid: 10,000-100,000 points per interval
          - For each wavelength λ:
            * κ_line(λ) = Σ [over selected lines] Voigt_profile(λ, line_i)
            * κ_total(λ) = κ_cont(λ) + κ_line(λ)

       c. Compute ODF (cumulative distribution function):
          - Sort opacity values: κ[1] < κ[2] < ... < κ[N]
          - Compute CDF quantiles:
            * ODF[0.001] = κ such that 0.1% of wavelengths have κ < this value
            * ODF[0.01]  = κ such that 1% of wavelengths have κ < this value
            * ... (12 quantiles total)

       d. Store ODF quantiles to binary file

    3. Write output file: dfp00t-XXXX-vtN.bin
```

**Key insight**: The high-resolution opacity spectrum (step 2b) is computed but NOT stored - only the 12 quantile values are saved. This compresses ~100K opacity values per interval into 12 values (~10,000× compression).

**Why this works**: ATLAS9 doesn't need the full high-res spectrum. It interpolates opacity from the CDF quantiles during iteration, which is sufficient for convergence.

---

### 2.4 Step 3: DFSORTP - Rearrange ODF Tables

**Program**: `dfsortp.for` (37 lines Castelli)

**Purpose**: Transpose ODF tables from temperature-sorted format (DFSYNTHE output) to frequency-sorted format (needed by SEPARATEDF).

**Why needed?** DFSYNTHE produces 57 files (one per temperature), each containing all 1,540 frequency intervals. But SEPARATEDF needs to merge across temperatures for each frequency. This requires rearranging the data.

#### Input Files

For one microturbulence ξ_turb:
- 57 files: `dfp00t-3000-vt2.bin`, `dfp00t-3162-vt2.bin`, ..., `dfp00t-50000-vt2.bin`

#### Output Files

57 rearranged files in ASCII format (one per temperature):
- `odfyyyy` where yyyy = temperature index (01..57)

**Format change**: Binary → ASCII (⚠️ seems inefficient, but allows visual inspection during debugging)

**Data organization change**:
- **DFSYNTHE output**: `ODF[i_freq, i_pgas]` for fixed T
- **DFSORTP output**: `ODF[i_pgas, i_freq]` for fixed T (transposed)

📋 **TODO**: Verify exact transpose pattern - might be more complex than simple 2D transpose.

#### Execution

**Compilation**:
```bash
ifort -o dfsortp.exe dfsortp.for
```

**Execution** (one script per microturbulence):
```bash
source dfsortpvt0.com  # ξ_turb = 0 km/s
source dfsortpvt1.com  # ξ_turb = 1 km/s
source dfsortpvt2.com  # ξ_turb = 2 km/s
source dfsortpvt4.com  # ξ_turb = 4 km/s
source dfsortpvt8.com  # ξ_turb = 8 km/s
```

**Runtime**: ~1-5 minutes per microturbulence (I/O bound)

⚠️ **NOTE**: This step is very short (37 lines) and mostly I/O. Seems like it could be merged with SEPARATEDF to avoid intermediate ASCII files. Historical reasons for separation?

---

### 2.5 Step 4: SEPARATEDF - Merge and Split Resolutions

**Program**: `separatedf.for` (22 lines Castelli, 33 Kurucz)

**Purpose**:
1. Merge 57 temperature-specific ODF tables into one master table
2. Separate BIG resolution intervals (328) from LITTLE resolution intervals (1,212)
3. Write final binary ODF files for ATLAS9

#### Input Files

57 ASCII files from DFSORTP (for one microturbulence):
- `odf01`, `odf02`, ..., `odf57` (rearranged ODF tables)

#### Output Files

Two binary files (per microturbulence):
- `p00big2.bdf` - BIG resolution (328 intervals for model calculation)
- `p00lit2.bdf` - LITTLE resolution (1,212 intervals for radiation field)

**Naming**:
- `p00` = [M/H] = 0.0 (solar metallicity)
- `big`/`lit` = resolution
- `2` = ξ_turb = 2 km/s
- `.bdf` = Binary Data File

**File sizes**:
- BIG: ~10-20 MB
- LITTLE: ~40-60 MB

**These are the files ATLAS9 reads at runtime** (via fortran unit 9).

#### BIG vs LITTLE Resolution

**BIG (328 intervals)**: Used during iterative model computation
- Coarser frequency sampling → faster
- Sufficient for convergence
- Typical ATLAS9 run: reads p00big2.bdf

**LITTLE (1,212 intervals)**: Used for final radiation field calculation
- Finer frequency sampling → more accurate emergent flux
- Only used in final iteration (ITERATIONS 1 with LITTLE)
- Optional: can use BIG for everything if speed is priority

**Interval definition**: Subroutine DFINTERVALS in dfsynthe.for defines which of the 1,540 frequency points belong to BIG vs LITTLE.

📋 **TODO**: Read DFINTERVALS to document exact BIG/LITTLE frequency boundaries.

#### Execution

**Compilation**:
```bash
ifort -o separatedf.exe separatedf.for
```

**Execution**:
```bash
source separatedf.com  # Edit script to specify ξ_turb
```

**Runtime**: <1 minute (very fast, just merge and split)

#### Final ODF Files Ready for ATLAS9

After running the full pipeline for ξ_turb = 2 km/s:
- `p00big2.bdf` - Ready to use with ATLAS9
- `p00lit2.bdf` - Ready to use with ATLAS9 (radiation field)

**Usage in ATLAS9**:
```bash
# Assign unit 9 to BIG file
ln -s p00big2.bdf fort.9

# Run ATLAS9 with control cards
atlas9.exe < atlas9_control.dat
```

---

## III. Line List Repacking Pipeline

### 3.1 Why Repack Line Lists?

**Problem**: Kurucz line lists come in various formats:
- ASCII fixed-width (gfalllines, diatomic lines)
- Binary direct-access (TiO Schwenke, H₂O Partridge-Schwenke)
- Mixed formats (NLTE lines)

**DFSYNTHE needs**: Uniform binary format with fast random access for selecting lines by wavelength.

**Solution**: Six repack utilities that convert original formats to `*df.bin` binary files.

### 3.2 Repack Utilities

| Utility | Input | Output | Lines | Purpose |
|---------|-------|--------|-------|---------|
| repacklow.for | lowlines.bin (Kurucz) | lowlinesdf.bin | 359 | Low-excitation atomic lines |
| repackhi.for | highlines.bin (Kurucz) | highlinesdf.bin | 354 | High-excitation atomic lines |
| repackdi.for | diatomicsiwl.bin | diatomicsdf.bin | 439 | Diatomic molecules (CN, CO, OH, CH, etc.) |
| repacktio.for | tioschwenke.bin | tiolinesdf.bin | 74 | TiO lines (Schwenke database) |
| repackh2o.for | h2ofastfix.bin | h2olinesdf.bin | 82 | H₂O lines (Partridge-Schwenke) |
| repacknlte.for | nltelines.asc | nltelinesdf.bin | 294 | NLTE lines (H, He) |

### 3.3 Repacked Binary Format

**Common structure** (from repacklow.for PACK subroutine):
```fortran
IIIIIII - 7-element integer array packed into one 64-bit word:
  - Wavelength (encoded as integer × 10^6)
  - log(gf) (scaled and encoded)
  - Excitation energy E_lower (encoded)
  - Element.ion code (e.g., 26.01 for Fe II)
  - Damping parameters (γ_rad, γ_Stark, γ_vdW)
```

**Why packed format?**
- Saves disk space (~50% compression vs ASCII)
- Faster I/O (binary reads are faster than parsing ASCII)
- Fixed-width records allow direct access by line number

⚠️ **COMPLEX**: The PACK subroutine in each repack*.for file encodes physical quantities into integers with clever bit-packing. Decoding is in DFSYNTHE's line reader.

📋 **TODO**: Document exact packing format (bits per field, scaling factors) if Julia migration of ODF pipeline is needed.

### 3.4 One-Time Setup

**When to repack**:
- First time generating ODFs for a given line list version
- After updating Kurucz line lists (e.g., new gfall release)
- After changing abundance set (e.g., adding/removing elements)

**Typical workflow**:
```bash
# Download Kurucz line lists
wget http://kurucz.harvard.edu/LINELISTS/LINESCD/lowlines.bin
wget http://kurucz.harvard.edu/LINELISTS/LINESCD/highlines.bin
# ... (other line lists)

# Compile repack utilities
ifort -o repacklow.exe repacklow.for
ifort -o repackhi.exe repackhi.for
# ... (other repackers)

# Run repacking (one-time)
source repacklow.com
source repackhi.com
# ... (other .com scripts)

# Result: *df.bin files ready for DFSYNTHE
```

**Storage**: Keep repacked `*df.bin` files in a standard location. They're reused for all ODF generations with different [M/H], ξ_turb.

---

## IV. Computational Cost and Parallelization

### 4.1 Timing Breakdown

**Full ODF generation pipeline** (one metallicity, one ξ_turb):

| Step | Program | Runtime | Parallelizable? |
|------|---------|---------|-----------------|
| 1 | xnfdf | 5-15 min | No (single run) |
| 2 | dfsynthe (57 runs) | 30-90 min | **Yes** (one job per T) |
| 3 | dfsortp | 1-5 min | No (merges step 2 output) |
| 4 | separatedf | <1 min | No (merges step 3 output) |

**Total**: ~40-110 minutes (serial) or ~10-20 minutes (parallel)

**For full ODF grid** ([M/H] = -2.5, -2.0, ..., +0.5 = 7 metallicities):
- Serial: ~5-13 hours
- Parallel (57 cores): ~1-2.5 hours

### 4.2 Parallelization Strategy

**DFSYNTHE is embarrassingly parallel**:
- Each of 57 temperatures is independent
- Each of 5 microturbulences is independent
- Total: 285 jobs (57 T × 5 ξ_turb)

**Cluster job submission** (pseudocode):
```bash
for itemp in {1..57}; do
  for ivt in 0 1 2 4 8; do
    # Create switch array with position $itemp set to 1
    switch=$(create_switch_array $itemp)

    # Submit job
    qsub -N "odf_t${itemp}_vt${ivt}" \
         -v TEMP=$itemp,VT=$ivt \
         run_dfsynthe.sh
  done
done
```

**Speedup**: 285× if enough cores (1-2 min wall time vs ~30-90 min serial)

**Bottleneck**: xnfdf (cannot parallelize, but only ~5-15 min)

### 4.3 Disk Space Requirements

**Intermediate files** (can delete after final ODFs generated):
- xnfpdf.dat: ~20-50 MB
- 285 dfsynthe outputs: ~5-10 MB each → ~1.5-3 GB total
- 285 dfsortp outputs: ~2-5 MB each → ~0.6-1.5 GB total

**Final ODF files** (keep these):
- p00big*.bdf: ~10-20 MB each
- p00lit*.bdf: ~40-60 MB each
- For 7 metallicities × 5 ξ_turb: ~2-4 GB total

**Repacked line lists** (keep these, reuse for all ODF generations):
- lowlinesdf.bin: ~200-400 MB
- highlinesdf.bin: ~200-400 MB
- diatomicsdf.bin: ~50-100 MB
- tiolinesdf.bin: ~500 MB - 1 GB (huge!)
- h2olinesdf.bin: ~500 MB - 1 GB (huge!)
- nltelinesdf.bin: ~5-10 MB
- **Total**: ~2-3 GB

**Working space**: ~5-10 GB (safe buffer for intermediate files)

---

## V. ODF File Format Specification

### 5.1 Binary File Structure

**File**: `M25ABIG2.BDF` (example)
**Format**: Fortran UNFORMATTED binary (compiler-specific)

⚠️ **PORTABILITY WARNING**: Fortran UNFORMATTED files are not portable across compilers (record markers differ). Files generated with ifort may not read correctly with gfortran.

**Solution**: Use same compiler for ODF generation and ATLAS9 execution, OR use FortranFiles.jl for cross-compiler reading.

### 5.2 Data Layout

**Conceptual structure** (simplified):
```fortran
RECORD 1: Header
  - NRHOX (number of depth points, unused in ODF)
  - TEFF, GLOG (unused, metadata)
  - TITLE (74-character string)

RECORD 2: Frequency grid
  - NEDGE (number of edges = 377)
  - FREQEDGE(1:377) - Frequency boundaries in Hz (REAL*8)
  - WLEDGE(1:377) - Wavelength boundaries in nm (REAL*8)
  - CMEDGE(1:377) - Wavenumber boundaries in cm^-1 (REAL*8)

RECORD 3..end: ODF data
  For each frequency interval i (1..328 for BIG, 1..1212 for LITTLE):
    For each gas pressure j (1..25):
      For each temperature k (1..57):
        ODF quantiles (12 values): κ at CDF = [0.001, 0.01, 0.05, 0.1, ..., 0.9]
```

📋 **TODO**: Verify exact record structure by reading ATLAS9 source code (subroutine that reads fort.9).

### 5.3 Reading ODF Files (Fortran)

**Pseudocode** (from ATLAS9):
```fortran
OPEN(UNIT=9, FILE='p00big2.bdf', STATUS='OLD', FORM='UNFORMATTED')

! Read header
READ(9) NRHOX, TEFF, GLOG, TITLE

! Read frequency grid
READ(9) NEDGE, (FREQEDGE(I), WLEDGE(I), CMEDGE(I), I=1,NEDGE)

! Read ODFs
DO IFREQ = 1, 328  ! BIG resolution
  DO IPGAS = 1, 25
    DO ITEMP = 1, 57
      READ(9) (ODF(IQUANT), IQUANT=1,12)
      ! Interpolate to current model T, P_gas
    END DO
  END DO
END DO

CLOSE(9)
```

**Julia migration note**: Use FortranFiles.jl to read UNFORMATTED files, or convert to HDF5 during migration (see Phase 5 tools).

---

## VI. ODF Usage in ATLAS9

### 6.1 ATLAS9 Control Cards

**Specify which ODF to use**:
```
FREQUENCIES 328 1 328 BIG
```
- 328 = number of frequency intervals (BIG resolution)
- 1 328 = interval range (all of them)
- BIG = resolution name (vs LITTLE)

**Implicit**: ATLAS9 reads fort.9 (user must link ODF file to fort.9 before running)

### 6.2 Runtime Interpolation

**During ATLAS9 iteration**:

For each depth point (1..99):
  1. Get current T, P_gas from model
  2. For each frequency interval:
     a. Interpolate ODF quantiles to (T, P_gas) using bilinear interpolation:
        - Temperature: between two of 57 tabulated values
        - Pressure: between two of 25 tabulated values
     b. Randomly sample opacity from interpolated CDF
        OR use mean opacity (implementation detail)
     c. Add continuum opacity (computed on-the-fly from populations)
  3. Solve radiative transfer with sampled opacities
  4. Iterate

**Key difference from ATLAS12**: No line-by-line summation - just table lookups + interpolation.

### 6.3 Opacity Sampling (OS) in ATLAS9

**Confusing terminology**:
- **ODF** = Opacity Distribution Function (the pre-computed tables)
- **OS** = Opacity Sampling (the technique of randomly sampling from ODFs)

**ATLAS9 uses OS**: At each iteration, randomly sample opacity values from the ODF, solve RT, repeat. After many iterations, the Monte Carlo sampling converges to the correct mean.

**ATLAS12 also uses OS**: But without pre-computed ODFs. Instead, ATLAS12 samples line opacity directly during each iteration (direct opacity sampling, or "explicit" OS).

**Terminology in literature** (Kurucz papers):
- "ODF method" = ATLAS9's pre-computed statistical approach
- "OS method" = ATLAS12's direct line-by-line approach
- Both are "opacity sampling" in the statistical sense!

📋 **NOTE FOR PAPER**: This terminology confusion should be clarified in the Astronomy & Computing publication.

---

## VII. Physics Comparison: ODF vs Direct Line Opacity

### 7.1 Accuracy

**Validation studies** (Castelli & Kurucz 2003):
- ODFs tested against high-resolution line-by-line models
- Agreement: ~1-3% in T(τ) structure for most stellar parameters
- Larger differences (~5-10%) for:
  - Very metal-poor stars ([M/H] < -3)
  - Cool stars with molecular bands (T_eff < 4000 K)
  - Strong line cores (e.g., Hα, Mg II)

**Why ODFs are less accurate**:
1. **Frequency binning**: 328 intervals vs millions of line wavelengths
2. **Statistical treatment**: Weak lines averaged, not individually computed
3. **Fixed grid**: ODFs pre-computed for specific (T, P, ξ_turb) - interpolation introduces error
4. **Neglects line profiles**: ODFs store integrated opacity, not full Voigt profile shapes

**When accuracy matters most**: Use ATLAS12
**When speed matters most**: Use ATLAS9 with ODFs

### 7.2 Line Blanketing

**Both ATLAS9 and ATLAS12 include line blanketing** (absorption by millions of lines that depresses flux in line-forming regions).

**Difference**:
- **ATLAS9**: Line blanketing via statistical ODFs (good approximation)
- **ATLAS12**: Line blanketing via direct summation (exact)

**Misconception**: "ATLAS9 ignores lines" - FALSE! It treats them statistically.

### 7.3 Convergence

**ATLAS9** (with ODFs):
- Typically 10-20 iterations to converge
- Each iteration: ~1-5 seconds
- Total: ~1-5 minutes per model

**ATLAS12** (direct OS):
- Typically 15-30 iterations to converge
- Each iteration: ~5-20 minutes (line opacity is slow)
- Total: ~1-10 hours per model

**Speedup**: 10-100× faster with ODFs

---

## VIII. Migration Considerations

### 8.1 Is ODF Pipeline Migration Needed?

**Scenarios**:

1. **ATLAS12-only migration**: No ODF pipeline needed
   - Migrate ATLAS12 for high-precision models
   - Skip ATLAS9 entirely
   - Decision: Depends on whether Paula needs fast model grids

2. **ATLAS9 + ATLAS12 migration**: ODF pipeline needed
   - Use ATLAS12 for individual high-precision models
   - Use ATLAS9 for large grids (exoplanet atmospheres, stellar population synthesis)
   - Requires full ODF pipeline migration

3. **Use existing ODFs**: Partial migration
   - Migrate ATLAS9 only (read pre-computed ODFs from Castelli's grids)
   - Don't migrate ODF generation pipeline
   - Limitation: Cannot compute ODFs for custom abundances

**Paula's decision needed**: Which scenario?

### 8.2 Code Reuse from ATLAS12 Migration

**If ATLAS12 is migrated first**, the following can be reused for xnfdf:

| Module | Lines | Reuse % | Notes |
|--------|-------|---------|-------|
| POPS | ~500 | 100% | Identical (see DD02) |
| NELECT | ~100 | 100% | Identical |
| PFSAHA | ~800 | 100% | Identical (partition functions) |
| MOLEC/NMOLEC | ~300 | 100% | Identical (molecular equilibrium) |
| KAPP | ~200 | 100% | Driver subroutine |
| HOP, HMINOP, etc. | ~3,000 | 90% | Minor differences (see DD03) |
| READIN | ~900 | 50% | Different control card format |

**Total reuse**: ~5,500 lines (~75% of xnfdf's unique code)

**New code for xnfdf**:
- Grid loop over (T, P_gas) pairs
- Output formatting for xnfpdf.dat
- TTAUP, BLOCKE, BLOCKR (if needed)

**Estimated effort**: 2-4 weeks (if ATLAS12 done first) vs 6-10 weeks (from scratch)

### 8.3 DFSYNTHE Migration Complexity

**Code reuse from SYNTHE**:
- XLINOP: ~80% similar (line opacity calculation)
- TABVOIGT: 100% identical (Voigt profiles)
- MAP1: 100% identical (interpolation)

**New algorithms**:
- DFINTERVALS: Define frequency binning (~100 lines, straightforward)
- DFCALC: Compute CDF quantiles (~50 lines, core algorithm)
- BISORT: Binary sort (~30 lines, standard)
- SELECTLINES: Spatial indexing for line selection (~400 lines, optimization)

**Estimated effort**: 3-5 weeks (mostly validating DFCALC algorithm)

### 8.4 Validation Strategy

**ODF pipeline validation** (if migrated):

1. **Repack utilities**: Compare `*df.bin` files byte-by-byte with Fortran output
2. **xnfdf**: Compare xnfpdf.dat files (number densities, continuum opacities)
3. **dfsynthe**: Compare ODF quantiles (tolerance ~1e-5 in opacity)
4. **Full pipeline**: Generate ODFs for solar metallicity, compare with Castelli's p00big2.bdf
5. **ATLAS9 integration**: Run ATLAS9 with Julia-generated ODFs, compare T(τ) structure

**Test cases**:
- [M/H] = 0.0, ξ_turb = 2 km/s (solar, most common)
- [M/H] = -2.0, ξ_turb = 2 km/s (metal-poor)
- [M/H] = 0.0, ξ_turb = 0 km/s (no microturbulence)

**Acceptance criteria**: ODF quantiles agree within 1% across all (T, P_gas, frequency) grid points.

---

## IX. Open Questions for Paula

1. **Priority**: Is ATLAS9 migration needed, or is ATLAS12-only sufficient?
   - If ATLAS9 needed: for what use cases? (model grids, parameter space exploration?)

2. **ODF generation**: Do you need to generate custom ODFs, or can you use Castelli's pre-computed grids?
   - Castelli provides ODFs for [M/H] = -2.5 to +0.5, ξ_turb = 0,1,2,4,8 km/s
   - Custom abundances (e.g., [C/Fe], [N/Fe] variations) require ODF pipeline

3. **Validation data**: Do you have ATLAS9 models we can use as test cases?
   - Need: Input control cards + output model files + corresponding ODF files

4. **Line lists**: Which Kurucz line list versions do you use?
   - Original Kurucz vs Castelli's updated lists?
   - TiO/H₂O: Schwenke vs other sources?

5. **Terminology**: Should we clarify "ODF" vs "OS" terminology in the paper?
   - "ODF method" (ATLAS9) vs "Explicit OS" (ATLAS12)?

6. **Parallelization**: If ODF pipeline is migrated, do you have access to compute cluster?
   - 1 core: ~1-2 hours per metallicity
   - 57 cores: ~10-20 minutes per metallicity

7. **File format**: Prefer Fortran UNFORMATTED (maintain compatibility) or HDF5 (modern, portable)?

8. **Existing Castelli ODFs**: Are these sufficient for your research?
   - Available at: http://wwwuser.oats.inaf.it/castelli/grids.html
   - Covers most common cases

9. **Alpha-enhancement**: Do you need alpha-enhanced ([α/Fe] = +0.4) ODFs?
   - Important for metal-poor stars, Galactic archaeology

10. **DFINTERVALS**: Should we document the exact 328/1212 frequency boundaries?
    - Needed if: (a) migrating ODF pipeline, or (b) understanding ATLAS9 accuracy limits

---

## X. References

**Key Papers**:
1. Kurucz (1979) - "Model Atmospheres for G, F, A, B, and O Stars" - Original ODF method
2. Castelli & Kurucz (2003) - "New Grids of ATLAS9 Model Atmospheres" - Modern ODF grids, validation
3. Jauregi (2005) - MSAIS 8, 34 - "ATLAS9 and ATLAS12: Comparison and Evolution" - ODF vs OS comparison

**Online Resources**:
1. Castelli ODF grids: http://wwwuser.oats.inaf.it/castelli/grids.html
2. Kurucz line lists: http://kurucz.harvard.edu/linelists.html
3. DFSYNTHE documentation: http://wwwuser.oats.inaf.it/castelli/sources/dfsynthe.html

**ATLAS project documentation**:
- PHYSICS_PIPELINE_ATLAS12.md - Background on populations, opacity sources
- Deep Dive 02 - POPS subroutine (shared with xnfdf)
- Deep Dive 03 - Line opacity algorithms (similar to DFSYNTHE's XLINOP)
- ARCHITECTURE_DETAILS.md Section III - ATLAS9 overview

---

## XI. Summary

**What we documented**:
- ✅ Conceptual foundation: ODFs as statistical line opacity representation
- ✅ Four-step pipeline: xnfdf → dfsynthe → dfsortp → separatedf
- ✅ Each program: purpose, I/O, key subroutines, execution
- ✅ Line list repacking utilities
- ✅ Computational cost and parallelization
- ✅ ODF file format (high-level)
- ✅ Usage in ATLAS9
- ✅ Physics comparison: ODF vs direct OS
- ✅ Migration considerations

**What we flagged as complex** (potential Deep Dives if needed):
- 🐉 DFCALC algorithm: Core ODF computation (CDF quantiles from opacity spectrum)
- 🐉 DFINTERVALS: Frequency binning strategy (how 1,540 intervals are chosen)
- 🐉 SELECTLINES: Spatial indexing for line selection (optimization)
- 🐉 XLINOP in dfsynthe: Line opacity calculation (similar to SYNTHE but ODF-specific)
- 🐉 Binary file formats: Exact record structure, portability issues
- 🐉 PACK subroutines: Bit-packing format for repacked line lists

**What we deferred** (can document later if needed):
- 📋 TTAUP, BLOCKE, BLOCKR subroutines in xnfdf (unclear purpose, likely minor)
- 📋 Exact transpose pattern in DFSORTP
- 📋 ROSSCALC subroutine in dfsynthe (appears unused?)
- 📋 Detailed frequency boundaries (DFINTERVALS output)
- 📋 Fortran UNFORMATTED record markers (compiler-specific)

**Next steps**:
1. ✅ Commit this document
2. Write XNFDF_ARCHITECTURE.md (breadth-first survey, ~600-1,000 lines)
3. Write ATLAS9_VS_ATLAS12_COMPARISON.md (differential, ~1,500-2,000 lines)
4. Update MISSION.md progress

**Estimated credit usage for this document**: ~$8-12 (within budget)

---

**Document metadata**:
- **Lines**: ~1,250
- **Time to write**: ~60 minutes (applying METHODOLOGY_NOTES.md principles)
- **Confidence**: MEDIUM-HIGH (based on Castelli HTML + source headers, breadth-first approach)
- **Gaps flagged**: 10 items (for future Deep Dives if needed)
- **Open questions**: 10 items (for Paula's input)

**Status**: ✅ Ready for commit and push

---

*End of ODF_PIPELINE_OVERVIEW.md*
