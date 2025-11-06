# ATLAS Suite Workflow Analysis
*Phase 2A Part 1 - Execution Pipelines, Data Flow, and Scientific Context*

**Report Date**: 2025-11-06
**Analyst**: Claude Code Web
**Sources**: .com execution scripts, .html documentation files

---

## Executive Summary

The ATLAS Suite implements a **multi-stage computational pipeline** for stellar atmosphere modeling and synthetic spectrum synthesis. This analysis reveals critical architectural insights not visible from source code alone:

### Key Discoveries:

1. **ATLAS12 is a 2-stage program**: First run selects relevant lines from massive databases, second run performs atmosphere iterations with selected lines only
2. **SYNTHE is an 11-program pipeline**: Sequential execution of separate programs, each reading/writing specific fort.X units
3. **ATLAS9 vs ATLAS12 distinction**: ATLAS9 uses pre-computed ODFs (Opacity Distribution Functions), ATLAS12 uses Opacity Sampling (direct line-by-line calculation)
4. **DFSYNTHE generates ODFs**: Creates the opacity tables needed by ATLAS9 for faster computation
5. **ATLAS7V is a shared library**: Linked into both xnfpelsyn and spectrv for atmosphere interpolation

---

## I. ATLAS12 Workflow

### Scientific Purpose

ATLAS12 computes **LTE stellar atmosphere models** with:
- Full line-by-line opacity calculation (Opacity Sampling method)
- Molecular opacity (H2O, TiO, diatomics)
- Convective energy transport
- Radiative equilibrium + hydrostatic equilibrium
- Customizable elemental abundances

**Key difference from ATLAS9**: ATLAS12 uses **Opacity Sampling** (reads individual spectral lines and calculates opacity directly), while ATLAS9 uses pre-computed **Opacity Distribution Functions** (ODFs) for faster but less accurate computation.

**Note from Paula**: Current migration target is **ATLAS12 LTE only** (no NLTE).

---

### Compilation & Linking

**For gfortran** (Castelli 2017 version):
```bash
gfortran -fno-automatic -w -o atlas12.exe atlas12.for
```

**For Intel Fortran** (March 2012 version):
```bash
ifort -double-size 64 -save -o atlas12.exe atlas12_mar12.for
```

**Compiler flags explained**:
- `-fno-automatic`: Variables are SAVE'd by default (Fortran 77 static memory model)
- `-w`: Suppress warnings
- `-O3`: Optimization (optional, in some examples)
- `-double-size 64`: Intel-specific, ensures REAL is 64-bit
- `-save`: Intel equivalent of -fno-automatic

**Linking**: ATLAS12 is a **single monolithic program** - no external linking required. All subroutines are embedded in the single atlas12.for file.

---

### Execution Pipeline

ATLAS12 uses a **two-stage execution model** to handle massive line databases efficiently:

#### Stage 1: Line Selection
**Purpose**: Select relevant spectral lines from complete databases

**Input files** (via fort.X symbolic links):
- `fort.2` → molecules.dat (molecular equilibrium data)
- `fort.3` → input atmosphere model (.dat file from previous ATLAS run)
- `fort.11` → fclowlines.bin (lines from first 5 ionization stages, ~millions of lines)
- `fort.11` → fchighlines.bin (higher ionization stages) [Note: same unit, read sequentially]
- `fort.31` → diatomicsiwl.bin (diatomic molecular lines)
- `fort.41` → tioschwenke.bin (TiO lines from Schwenke)
- `fort.51` → h2ofastfix.bin (H2O lines from Partridge & Schwenke)

**Control cards** (stdin):
```
MOLECULES ON
READ MOLECULES
READ PUNCH        # Read input model from fort.3
READ LINES        # Select relevant lines
CONVECTION OVER 1.25 0 36
ITERATIONS 1 PRINT 1 PUNCH 0  # Only 1 iteration for line selection
ABUNDANCE CHANGE ...  # Modify abundances as needed
BEGIN
END
```

**Output**:
- `fort.12` → selected lines in binary format (typically renamed to sellin*.bin)

**Why necessary**: Full line databases contain millions of lines. Most are irrelevant for a given stellar atmosphere (wrong ionization stage, negligible strength, etc.). Stage 1 filters to ~tens of thousands of relevant lines.

---

#### Stage 2: Atmosphere Iteration
**Purpose**: Converge to self-consistent atmosphere model

**Input files**:
- `fort.2` → molecules.dat (same as stage 1)
- `fort.3` → input atmosphere model (same as stage 1)
- `fort.12` → selected lines from Stage 1
- `fort.19` → nltelines.bin (NLTE line data - optional)

**Control cards** (stdin):
```
MOLECULES ON
READ MOLECULES
READ PUNCH
TITLE ATLAS12
OPACITY ON LINES    # Use selected lines for opacity
OPACITY ON XLINES   # Include extra line opacity calculations
CONVECTION OVER 1.25 0 36
ITERATIONS 45       # Converge to solution (typically 30-50 iterations)
PRINT 1 0 0 ...     # Control diagnostic output frequency
PUNCH 0 0 0 ...     # Control model output frequency
SCALE MODEL 72 -6.875 0.125 5500. 4.6  # Set depth scale, Teff, logg
VTURB 1.23E+05      # Microturbulent velocity (cm/s)
ABUNDANCE CHANGE ...  # Element abundance modifications
BEGIN
END
```

**Output**:
- `fort.7` → converged atmosphere model (.dat format)

**Convergence**: ATLAS12 iterates between:
1. Radiative transfer equation (compute radiation field)
2. Radiative equilibrium (adjust temperatures)
3. Hydrostatic equilibrium (adjust pressures)
4. Population equations (compute ionization states)

Typically converges in 30-50 iterations.

---

### Data Dependencies

#### Fort Unit Number Conventions

| Unit | Stage | Purpose | Typical File |
|------|-------|---------|--------------|
| fort.2 | Both | Molecular data | molecules.dat |
| fort.3 | Both | Input model | *odfnew.dat or *at12.dat |
| fort.7 | 2 | Output model | *at12.dat |
| fort.11 | 1 | Line lists (read sequentially) | fclowlines.bin, fchighlines.bin |
| fort.12 | 1→2 | Selected lines | sellin*.bin |
| fort.19 | 2 | NLTE lines (optional) | nltelines.bin |
| fort.31 | 1 | Diatomic lines | diatomicsiwl.bin |
| fort.41 | 1 | TiO lines | tioschwenke.bin |
| fort.51 | 1 | H2O lines | h2ofastfix.bin |

**Important**: Stage 1 output (fort.12) becomes Stage 2 input (fort.12). Same symbolic unit number, different role.

#### Input File Formats

**molecules.dat**: ASCII molecular equilibrium constants
- Molecular species, dissociation energies, partition functions

**Line lists (.bin)**: Binary format, wavelength-sorted
- λ (wavelength), log(gf) (oscillator strength), E_lower, E_upper, element, ionization

**Model files (.dat)**: ASCII atmosphere structure
- RHOX (column density), T (temperature), P (pressure), XNE (electron density)
- Plus header with abundances, convection parameters

**Note from Paula**: ATLAS9 models (.odfnew.dat suffix) can be used as ATLAS12 input, but ATLAS12 models cannot be used as ATLAS9 input (different opacity methods).

---

### Typical Use Case Example

**Goal**: Compute [M/H]=-1.0, Teff=5500K, logg=4.6, vturb=1.23 km/s with Mg enhancement +0.3 dex

**Starting point**: ATLAS9 model with similar parameters (ap00t5500g45k1odfnew.dat)

**Process**:
1. Run ATLAS12 Stage 1 with READ LINES to select lines
2. Modify abundances via ABUNDANCE CHANGE cards (scaled solar + Mg adjustment)
3. Run ATLAS12 Stage 2 with SCALE MODEL to new Teff/logg
4. Output: am10t5500g46k123at12MgP03.dat (customized atmosphere model)

**Computing time** (rough estimates):
- Stage 1 (line selection): ~1-5 minutes
- Stage 2 (45 iterations): ~30-120 minutes (depends on model complexity)

---

## II. SYNTHE Suite Workflow

### Scientific Purpose

SYNTHE computes **high-resolution synthetic spectra** from pre-computed atmosphere models:
- Reads ATLAS9 or ATLAS12 atmosphere models
- Calculates line-by-line radiative transfer
- Includes atomic and molecular opacity
- Outputs emergent intensity (at 17 angles) or flux
- Applies rotational and instrumental broadening

**Key insight**: SYNTHE is a **spectrum synthesis pipeline**, not a single program. It consists of 11 separate programs executed sequentially, communicating via fort.X files.

---

### Compilation & Linking

Most SYNTHE programs are standalone, but **two require linking with atlas7v**:

#### Programs requiring ATLAS7V library:

**xnfpelsyn** (atmosphere processor):
```bash
gfortran -fno-automatic -w -O3 -c xnfpelsyn.for
gfortran -fno-automatic -w -O3 -c atlas7v.for
gfortran xnfpelsyn.o atlas7v.o -o xnfpelsyn.exe
```

**spectrv** (spectral intensity calculator):
```bash
gfortran -fno-automatic -w -O3 -c spectrv.for
gfortran -fno-automatic -w -O3 -c atlas7v.for
gfortran spectrv.o atlas7v.o -o spectrv.exe
```

#### Standalone programs:
```bash
gfortran -fno-automatic -w -O3 -o synbeg.exe synbeg.for
gfortran -fno-automatic -w -O3 -o rgfalllinesnew.exe rgfalllinesnew.for
gfortran -fno-automatic -w -O3 -o rpredict.exe rpredict.for
gfortran -fno-automatic -w -O3 -o rmolecasc.exe rmolecasc.for
gfortran -fno-automatic -w -O3 -o rschwenk.exe rschwenk.for
gfortran -fno-automatic -w -O3 -o rh2ofast.exe rh2ofast.for
gfortran -fno-automatic -w -O3 -o synthe.exe synthe.for
gfortran -fno-automatic -w -O3 -o rotate.exe rotate.for
gfortran -fno-automatic -w -O3 -o broaden.exe broaden.for
gfortran -fno-automatic -w -O3 -o converfsynnmtoa.exe converfsynnmtoa.for
```

**Total**: 13 source files (xnfpelsyn, spectrv, atlas7v + 10 standalone programs)

**Critical architectural point**: ATLAS7V is a **subroutine library**, not a main program. It provides atmosphere interpolation routines called by xnfpelsyn and spectrv.

---

### Execution Pipeline

SYNTHE pipeline consists of **11 sequential programs**. Each program reads input from fort.X units and writes output to other fort.X units. The pipeline builds up a complete line list, then synthesizes the spectrum.

#### Program 1: xnfpelsyn
**Purpose**: Compute atomic/molecular number densities and continuum opacities from atmosphere model

**Execution**:
```bash
ln -s molecules.dat fort.2
ln -s continua.dat fort.17
./xnfpelsyn.exe < atmosphere.mod > xnfpelsyn.out
mv fort.10 xnft*.dat
rm fort.*
```

**Input**:
- `stdin`: atmosphere model (.mod format - ATLAS12 output modified with control cards)
- `fort.2`: molecules.dat (molecular equilibrium data)
- `fort.17`: continua.dat (continuum opacity data)

**Output**:
- `fort.10`: Binary file with number densities, temperatures, pressures at each depth

**What it does**:
- Reads ATLAS atmosphere structure (T, P, ρ vs. depth)
- Calls ATLAS7V subroutines to interpolate atmosphere
- Computes atomic ionization fractions (Saha equation)
- Computes molecular equilibrium abundances
- Calculates continuum opacity sources (H⁻, H₂⁺, Rayleigh scattering, etc.)

---

#### Program 2: synbeg
**Purpose**: Initialize synthetic spectrum calculation (set wavelength range, resolution)

**Execution**:
```bash
./synbeg.exe << EOF > synbeg.out
AIR       700.0     721.0     500000.   0.     0          10 .001         0   00
AIRorVAC  WLBEG     WLEND     RESOLU    TURBV  IFNLTE LINOUT CUTOFF        NREAD
EOF
```

**Input**: Control card (stdin) specifying:
- AIR or VAC: wavelength scale (air or vacuum)
- WLBEG, WLEND: wavelength range (Angstroms)
- RESOLU: resolution (R = λ/Δλ, e.g., 500000 for high-res)
- TURBV: additional turbulent velocity (km/s, usually 0)
- IFNLTE: NLTE flag (0 = LTE)
- LINOUT: line output unit (typically 10)
- CUTOFF: line strength cutoff (.001 = ignore lines weaker than 0.1%)
- NREAD: number of atmosphere models to read (usually 0 for single model)

**Output**:
- `fort.12`: Binary file header for line list
- `fort.14`: Control parameters for subsequent programs

**What it does**: Sets up data structures for line list accumulation

---

#### Programs 3-6: Line List Readers (called multiple times)

##### Program 3: rgfalllinesnew (atomic lines)
Called multiple times for different wavelength ranges (gf0800.100, gf1200.100, etc.)

**Execution** (example for one line list):
```bash
ln -s gf0800.100 fort.11
./rgfalllinesnew.exe > gf0800.out
rm fort.11
```

**Input**:
- `fort.11`: Atomic line list (Kurucz gf*.100 format)
- `fort.12`: Line list being built (read + append)
- `fort.14`: Control parameters from synbeg

**Output**:
- `fort.12`: Updated line list (original + new lines)

**Format of gf*.100**:
- Fixed-format ASCII: wavelength, log(gf), element.ion, E_lower, J_lower, E_upper, J_upper, etc.

**What it does**:
- Reads atomic line data
- Selects lines within WLBEG-WLEND range
- Filters by line strength (CUTOFF parameter)
- Appends to fort.12

**Note**: Called multiple times to cover different element ranges (gf0500, gf0800, gf1200, etc. for different element groups)

---

##### Program 4: rpredict (predicted lines - optional)
**Execution**:
```bash
ln -s predicted_lines.asc fort.11
./rpredict.exe > rpredict.out
rm fort.11
```

**Purpose**: Read predicted lines from energy levels (for elements with incomplete experimental data)

**Similar to rgfalllinesnew** but handles different line format.

---

##### Program 5: rmolecasc (molecular lines)
Called multiple times for different molecules (CH, MgH, NH, OH, SiH, H2, C2, CN, CO, SiO, etc.)

**Execution** (example for CH):
```bash
ln -s chmasseron.asc fort.11
./rmolecasc.exe > chmasseron.out
rm fort.11
```

**Input**:
- `fort.11`: Molecular line list (ASCII format)
- `fort.12`: Line list being built

**Output**:
- `fort.12`: Updated line list

**Molecules typically included**: CH, MgH, NH, OH, SiH, H2, C2, CN, CO, SiO (each requires separate call to rmolecasc)

---

##### Program 6: rschwenk (TiO lines)
**Execution**:
```bash
ln -s tioschwenke.bin fort.11
ln -s eschwenke.bin fort.48
./rschwenk.exe > rschwenk.out
rm fort.11
rm fort.48
```

**Input**:
- `fort.11`: TiO line list (Schwenke, binary format)
- `fort.48`: TiO energy levels (Schwenke, binary format)

**Output**:
- `fort.12`: Updated line list

**Why separate**: TiO has special binary format and requires energy level file

---

##### Program 7: rh2ofast (H2O lines)
**Execution**:
```bash
ln -s h2ofastfix.bin fort.11
./rh2ofast.exe > h2ofastfix.out
rm fort.11
```

**Input**:
- `fort.11`: H2O line list (Partridge & Schwenke, binary format)

**Output**:
- `fort.12`: Updated line list

**Why separate**: H2O has millions of lines, special binary format for efficiency

---

**Summary of line reading phase** (Programs 3-7):
- Fort.12 starts with header from synbeg
- Each line reader program appends lines within wavelength range
- Final fort.12 contains complete line list (atomic + molecular) for synthesis
- Typical line count: tens to hundreds of thousands of lines

---

#### Program 8: synthe
**Purpose**: Calculate line opacity at each depth point

**Execution**:
```bash
ln -s xnft*.dat fort.10  # From xnfpelsyn
ln -s he1tables.dat fort.18  # Stark broadening for He I
./synthe.exe > synthe.out
```

**Input**:
- `fort.10`: Atmosphere structure from xnfpelsyn
- `fort.12`: Complete line list from readers
- `fort.14`: Control parameters from synbeg
- `fort.18`: he1tables.dat (Stark broadening for He I 4026, 4387, 4471, 4922 Å)

**Output**:
- `fort.16`: Line opacities at each depth (internal format)
- (or fort.18 in some versions)

**What it does**:
- For each spectral line:
  - Calculate line profile (Voigt function: thermal + damping broadening)
  - Include microturbulence
  - Compute line opacity at each wavelength point at each depth
- Store opacity vs wavelength vs depth

**This is the computationally intensive step** - calculating profiles for tens of thousands of lines.

---

#### Program 9: spectrv
**Purpose**: Compute emergent intensities or flux

**Execution**:
```bash
ln -s molecules.dat fort.2
cat << EOF > fort.25
0.0       0.        1.        0.        0.        0.        0.        0.
0.
RHOXJ     R1        R101      PH1       PC1       PSI1      PRDDOP    PRDPOW
EOF
./spectrv.exe < atmosphere.mod > spectrv.out
mv fort.7 intensity.dat
```

**Input**:
- `stdin`: atmosphere model (.mod format)
- `fort.2`: molecules.dat
- `fort.25`: Control parameters for partial redistribution (usually zeros for LTE)
- `fort.16` (or fort.18): Line opacities from synthe
- Calls ATLAS7V subroutines for atmosphere interpolation

**Output**:
- `fort.7`: Emergent intensity vs wavelength
  - If computing intensity: I(λ,μ) at 17 angles (μ = cos θ)
  - If computing flux: F(λ) = ∫ I(λ,μ) dμ

**What it does**:
- Solves radiative transfer equation for each wavelength:
  - dI/dτ = I - S (where S = source function = B_ν for LTE)
- Uses opacity from synthe + continuum opacity from xnfpelsyn
- Integrates over atmosphere to get surface intensity/flux

---

#### Program 10: rotate
**Purpose**: Apply rotational broadening (stellar v sin i)

**Execution**:
```bash
ln -s intensity.dat fort.1  # Fort.7 from spectrv
./rotate.exe << EOF > rotate.out
    1
2.
EOF
mv ROT1 flux_rotated.dat
```

**Input**:
- `fort.1`: Intensity or flux from spectrv
- Control cards:
  - Number of rotation velocities to compute
  - v sin i values (km/s)

**Output**:
- `ROT1`: Rotationally broadened spectrum

**What it does**:
- Convolves spectrum with rotational broadening kernel
- Accounts for limb darkening
- Formula: rotationally broadened flux = convolution with kernel G(Δλ) ∝ (1 - (Δλ/Δλ_max)²)^(1/2)

---

#### Program 11: broaden
**Purpose**: Apply instrumental or macroturbulent broadening

**Execution**:
```bash
ln -s flux_rotated.dat fort.21  # From rotate
./broaden.exe << EOF > broaden.out
GAUSSIAN  48000.    RESOLUTION
EOF
mv fort.22 final_spectrum.bin
```

**Input**:
- `fort.21`: Rotationally broadened spectrum from rotate
- Control cards:
  - GAUSSIAN or LORENTZIAN (profile shape)
  - Resolution (R = λ/Δλ) or FWHM

**Output**:
- `fort.22`: Final broadened spectrum (binary format)

**What it does**:
- Convolves spectrum with instrumental profile
- GAUSSIAN: typical for spectrographs
- LORENTZIAN: for macroturbulence

---

#### Optional Program 12: converfsynnmtoa
**Purpose**: Convert binary spectrum to ASCII

**Execution**:
```bash
ln -s final_spectrum.bin fort.1
./converfsynnmtoa.exe
mv fort.2 final_spectrum.asc
```

**Input**:
- `fort.1`: Binary spectrum (Hν vs λ in nm)

**Output**:
- `fort.2`: ASCII spectrum (Fλ vs λ in Angstroms)

**Format conversion**:
- Binary: Hν (erg/s/cm²/Hz) vs λ (nm)
- ASCII: Fλ (erg/s/cm²/Å) vs λ (Å)

---

### SYNTHE Pipeline Summary Diagram

```
Input: ATLAS12 atmosphere model (.dat)
         ↓
    ┌────────────┐
    │ xnfpelsyn  │  → fort.10 (atmosphere + opacities)
    └────────────┘
         ↓
    ┌────────────┐
    │  synbeg    │  → fort.12 (header), fort.14 (control)
    └────────────┘
         ↓
    ┌─────────────────────────┐
    │ rgfalllinesnew × N      │
    │ rmolecasc × M           │  → fort.12 (complete line list)
    │ rschwenk, rh2ofast      │
    └─────────────────────────┘
         ↓
    ┌────────────┐
    │  synthe    │  → fort.16/18 (line opacities)
    └────────────┘
         ↓
    ┌────────────┐
    │  spectrv   │  → fort.7 (emergent intensity/flux)
    └────────────┘
         ↓
    ┌────────────┐
    │  rotate    │  → ROT1 (rotationally broadened)
    └────────────┘
         ↓
    ┌────────────┐
    │  broaden   │  → fort.22 (final spectrum, binary)
    └────────────┘
         ↓
    ┌──────────────────┐
    │ converfsynnmtoa  │  → fort.2 (ASCII spectrum)
    └──────────────────┘
```

**Total execution time**: ~10-60 minutes depending on:
- Wavelength range (longer range = more lines)
- Resolution (higher R = finer wavelength grid)
- Number of molecules included

---

### Data Dependencies & Fort Units

| Program | Reads (fort.X) | Writes (fort.X) | Purpose |
|---------|---------------|-----------------|---------|
| xnfpelsyn | 2, 17, stdin | 10 | Atmosphere structure |
| synbeg | stdin | 12, 14 | Initialize line list |
| rgfalllinesnew | 11, 12, 14 | 12 | Add atomic lines |
| rpredict | 11, 12, 14 | 12 | Add predicted lines |
| rmolecasc | 11, 12, 14 | 12 | Add molecular lines |
| rschwenk | 11, 48, 12, 14 | 12 | Add TiO lines |
| rh2ofast | 11, 12, 14 | 12 | Add H2O lines |
| synthe | 10, 12, 14, 18 | 16/18 | Line opacities |
| spectrv | 2, 25, stdin, 16/18 | 7 | Emergent intensity |
| rotate | 1 | ROT1 | Rotation broadening |
| broaden | 21, stdin | 22 | Instrumental broadening |
| converfsynnmtoa | 1 | 2 | Binary to ASCII |

**Key insight**: Fort.12 is the "accumulator" - starts with header, each line reader appends.

---

### ATLAS Model Modifications for SYNTHE

ATLAS12 output (.dat format) must be **modified** before SYNTHE can use it:

**Add control cards at top** (creates .mod format):
```
SURFACE INTENSI 17 1.,.9,.8,.7,.6,.5,.4,.3,.25,.2,.15,.125,.1,.075,.05,.025,.01
ITERATIONS 1 PRINT 2 PUNCH 2
CORRECTION OFF
PRESSURE OFF
READ MOLECULES
MOLECULES ON
```

**Drop abundance table cards** (optional in latest SYNTHE):
- Lines starting with "ABUNDANCE TABLE"
- Periodic table listing (1H, 2He, 3Li, ... 99Es)

**Why necessary**: SYNTHE expects specific control cards for atmosphere reading. ATLAS12 output is structured for ATLAS input/output.

---

## III. DFSYNTHE → ATLAS9 Connection

### Scientific Context: ODFs vs Opacity Sampling

**Paula's key correction from Phase 1 review**:

The main difference between ATLAS9 and ATLAS12 is **NOT** just molecular opacity. It's the **opacity calculation method**:

| Feature | ATLAS9 | ATLAS12 |
|---------|--------|---------|
| **Opacity Method** | ODFs (Opacity Distribution Functions) | OS (Opacity Sampling) |
| **Computational approach** | Pre-computed opacity tables | Direct line-by-line calculation |
| **Speed** | Fast (~minutes) | Slow (~hours) |
| **Accuracy** | Approximate | High |
| **Line list** | Pre-processed into ODFs | Full line lists read directly |
| **Molecular opacity** | Limited (in ODFs) | Full (H2O, TiO, diatomics) |

---

### What are ODFs?

**Opacity Distribution Functions** are **statistical representations** of line opacity:

Instead of storing opacity for every wavelength:
- Divide spectrum into intervals (~1000 Å wide)
- In each interval, sort opacities by strength
- Store cumulative distribution: F(κ) = fraction of interval with opacity < κ
- Use ~12-24 opacity points per interval instead of millions of wavelengths

**Physical meaning**: "What fraction of the wavelength interval has opacity less than κ?"

**Advantage**: ATLAS9 iteration is 10-100× faster than ATLAS12
**Disadvantage**: Loses spectral details, less accurate for strong line regions

---

### DFSYNTHE Workflow

**Purpose**: Generate ODF tables for ATLAS9

#### Programs involved:
1. **xnfdf** - Pre-tabulate number densities and continuum opacities
2. **dfsynthe** - Calculate ODFs from line lists
3. **dfsortp** - Sort opacities
4. **separatedf** - Separate ODFs by optical depth

#### Preprocessing: Repack line lists
Before running DFSYNTHE, line lists must be "repacked" to a more efficient format:

```bash
./repacklow.exe   # fclowlines.bin → lowlinesdf.bin
./repackhi.exe    # fchighlines.bin → highlinesdf.bin
./repackdi.exe    # diatomicsiwl.bin → diatomicsdf.bin
./repacktio.exe   # tioschwenke.bin → tiolinesdf.bin
./repackh2o.exe   # h2ofastfix.bin → h2olinesdf.bin
./repacknlte.exe  # nltelines.asc → nltelinesdf.bin
```

**Repacking**: Converts line lists to format optimized for ODF calculation (sorted by wavelength subintervals).

---

#### Stage 1: xnfdf
**Purpose**: Create atmosphere-independent opacity tables

**Input**:
- molecules.dat, pfiron.dat, continua.dat
- Control cards specifying T, P grid and abundances

**Output**:
- xnfpdf.dat - Number densities for (T, P, abundance) grid
- xnfpdfmax.dat - Maximum opacities for (T, P) grid

**What it does**:
- Tabulates atomic/molecular number densities for 57 temperatures × 25 pressures
- Pre-computes continuum opacities
- Creates lookup tables for fast ODF generation

---

#### Stage 2: dfsynthe
**Purpose**: Calculate ODFs

**Input**:
- xnfpdf.dat, xnfpdfmax.dat (from xnfdf)
- Repacked line lists (lowlinesdf.bin, highlinesdf.bin, etc.)
- Control cards specifying wavelength intervals

**Output**:
- ODFs: opacity distribution functions F(κ) for each (T, P, interval)

**What it does**:
- For each (T, P) point and wavelength interval:
  1. Calculate opacity for all lines in interval
  2. Sort opacities
  3. Compute cumulative distribution
  4. Store as ODF

---

#### Stages 3-4: dfsortp and separatedf
**Purpose**: Post-process ODFs for ATLAS9 input

**dfsortp**: Sorts ODFs by optical depth
**separatedf**: Separates ODFs into files for different depth ranges

**Output**: ODF files ready for ATLAS9 (e.g., p00k2odfnew)

---

### ATLAS9 uses ODFs

ATLAS9 execution:
```bash
ln -s p00k2odfnew fort.8  # ODF file
./atlas9.exe << EOF
READ ODF
...
BEGIN
END
EOF
```

During ATLAS9 iteration:
- For each depth point, temperature, pressure
- Read pre-computed ODF from fort.8
- Interpolate F(κ) for current conditions
- Use ODF to compute mean opacity (Rosseland or Planck mean)
- NO line-by-line calculation

**Result**: ATLAS9 completes in ~5-10 minutes vs. ATLAS12 ~30-120 minutes.

---

### Why ATLAS12 for Migration?

**Paula's rationale**:
1. **Higher accuracy**: Opacity Sampling is more accurate than ODFs
2. **Simpler workflow**: No need to generate ODFs first
3. **Modern practice**: ATLAS12 is current standard
4. **LTE only initially**: NLTE can be added later

**Trade-off**: ATLAS12 is slower, but with modern hardware (parallel Julia), speed gap narrows.

---

## IV. Fortran IV Constructs & Legacy Features

### Fortran 77 vs Fortran IV

The ATLAS codes show evidence of **Fortran IV** (1962-1966) origins, later updated to Fortran 77 (1977) compatibility:

#### Hollerith Constants
**Fortran IV way** (likely in older Kurucz versions):
```fortran
WRITE (6, 100) 12HATLAS MODEL  ! 12H means 12-character Hollerith string
```

**Fortran 77 way** (in current codes):
```fortran
WRITE (6, 100) 'ATLAS MODEL  '  ! Character strings in quotes
```

**Watch for**: Older .for files may still have Hollerith (nH...) constants. Gfortran handles them but Julia won't.

---

#### Arithmetic IF Statement
**Fortran IV construct** (used extensively):
```fortran
IF (X) 10, 20, 30   ! If X<0 goto 10, if X==0 goto 20, if X>0 goto 30
```

**Modern equivalent**:
```fortran
IF (X .LT. 0.) THEN
  GOTO 10
ELSE IF (X .EQ. 0.) THEN
  GOTO 20
ELSE
  GOTO 30
END IF
```

**Julia translation challenge**: Arithmetic IF combines branching + comparison. Need to decompose into if-elseif-else.

---

#### Assigned GOTO
**Fortran IV construct**:
```fortran
ASSIGN 100 TO LABEL   ! Assign statement number to variable
...
GOTO LABEL, (100, 200, 300)  ! Jump to statement in LABEL
```

**Rare but possible** in older subroutines. Modern equivalent: CASE statement or if-elseif.

---

#### COMMON Blocks (Fortran IV origin, Fortran 77 style)
Extensively used throughout:
```fortran
COMMON /BLOCK/ VAR1, VAR2, VAR3
```

**Julia translation**: Named tuples, structs, or module-level constants.

---

#### Computed GOTO
**Fortran IV construct** (used in ATLAS codes):
```fortran
GOTO (100, 200, 300), INDEX  ! Jump to 100, 200, or 300 based on INDEX
```

**Julia equivalent**: Switch/case or dictionary dispatch.

---

#### Implicit Typing
**Fortran default** (unless IMPLICIT NONE):
- Variables starting with I-N are INTEGER
- All others are REAL

**Watch for**: Undeclared variables may cause type confusion. Need explicit declarations for Julia.

---

### Fort Unit Numbers (Fortran 77 I/O)

**Legacy practice**: Logical unit numbers hard-coded:
```fortran
OPEN (UNIT=12, FILE='lines.bin', STATUS='OLD', FORM='UNFORMATTED')
READ (12) ...
CLOSE (12)
```

**Modern practice**: Use symbolic names, but ATLAS codes use fixed fort.X numbers.

**Julia translation**: Replace with file handles, abstract I/O layer.

---

## V. Questions for Paula

### Q1: NLTE vs LTE in ATLAS12
You mentioned "ATLAS12 LTE only, no NLTE" as migration priority. However, ATLAS12 code has:
- `OPACITY ON XLINES` (extra line opacity)
- `fort.19` → `nltelines.bin` (NLTE line data)
- `IFNLTE` flag in synbeg

**Question**: Is NLTE functionality in current ATLAS12 unused/optional? Should Julia migration completely omit NLTE code paths, or just defer their implementation?

---

### Q2: ATLAS9 Migration Priority
Phase 1 report indicated ATLAS9 might be useful for faster computations. With DFSYNTHE dependency:

**Question**: Should ATLAS9 + DFSYNTHE be migrated at all? Or is ATLAS12 alone sufficient for your research needs? (Computational time vs. accuracy trade-off)

---

### Q3: Atmosphere Model Formats
ATLAS outputs .dat format, SYNTHE requires .mod format (with added control cards).

**Question**: In Julia migration, should we:
- Keep separate formats for compatibility?
- Create unified format?
- Auto-convert on-the-fly?

---

### Q4: SYNTHE Pipeline Simplification
Current SYNTHE is 11 sequential programs. In Julia, could consolidate into:
- Single monolithic program (like ATLAS12)
- Pipeline with fewer stages (e.g., combine all line readers)
- Keep separate programs for flexibility

**Question**: What's your preference? Maintain modularity or consolidate for simplicity?

---

### Q5: Line List Updates
Documentation shows Kurucz line lists dated 2016-2021, with notes like "last release not used" in examples.

**Question**:
- Which line list versions should Julia code support?
- Are line list formats stable, or do they evolve?
- Should we support multiple formats?

---

### Q6: Molecular Line Lists
Current pipeline handles ~15+ molecular species (CH, MgH, NH, OH, SiH, H2, C2, CN, CO, SiO, TiO, H2O).

**Question**: Which molecules are essential for your research? Can we prioritize subset for initial migration?

---

### Q7: Plotting Codes
SYNTHE includes plotting codes (plotsynimcol, plotobsimcol, plotpackimcol).

**Question**: Are these critical, or can modern plotting (Julia Plots.jl, Python matplotlib) replace them?

---

### Q8: Convective Models
ATLAS12 has `CONVECTION OVER 1.25 0 36` (mixing-length theory parameter).

**Question**: Do you use different convection models, or is MLT with α=1.25 standard?

---

## VI. Architecture Insights for Phase 2B

### Critical Findings for Architecture Mapping:

1. **ATLAS12 is monolithic but two-stage**: Line selection + iteration are logically separate but compiled together

2. **SYNTHE is truly a pipeline**: 11 programs with clear data flow via fort.X files

3. **ATLAS7V is the shared library**: Only library code linked into multiple programs

4. **Fort unit numbers are the API**: Programs communicate via fixed I/O units (fort.2, fort.10, fort.12, etc.)

5. **Binary formats are critical**: Most data exchange uses unformatted (binary) Fortran I/O

6. **Line databases are massive**: Selection/filtering is essential architecture feature

7. **Control cards are the UI**: Programs read ASCII commands from stdin, not command-line arguments

---

### Implications for Julia Migration:

**Preserve or Refactor?**

| Feature | Current | Julia Option A (Preserve) | Julia Option B (Refactor) |
|---------|---------|---------------------------|---------------------------|
| ATLAS12 stages | 2 separate runs | Keep 2-step workflow | Single function with select! parameter |
| SYNTHE pipeline | 11 programs | 11 Julia programs + scripts | Unified SYNTHEsuite module |
| Fort units | Symbolic links | File path arguments | Struct-based data passing |
| Control cards | stdin parsing | Keep stdin parsing | Keyword arguments |
| Binary I/O | Fortran UNFORMATTED | Match Fortran binary | Use HDF5/Arrow |

**Recommendation**: Start with Option A (preserve architecture) for validation, refactor to Option B later.

---

## VII. Summary & Next Steps

### What We Learned:

1. **ATLAS12**: Two-stage execution (line selection + iteration), 45 iterations typical, ~1-2 hours compute time

2. **SYNTHE**: 11-program sequential pipeline, fort.X communication, ~30-60 minutes total

3. **ODFs vs OS**: ATLAS9 uses pre-computed opacity tables (fast but approximate), ATLAS12 calculates directly (slow but accurate)

4. **DFSYNTHE**: Generates ODFs for ATLAS9 from same line lists ATLAS12 uses directly

5. **ATLAS7V**: Shared library for atmosphere interpolation, linked into xnfpelsyn and spectrv

6. **Fortran IV legacy**: Arithmetic IF, computed GOTO, implicit typing, Hollerith possible

7. **Data flow**: Everything communicates via fort.X binary files, not internal data structures

---

### Ready for Phase 2A Part 2:

With workflow understanding complete, can now:
1. Update DEPENDENCY_MAP.md with complete pipeline flow
2. Perform version comparison (Castelli vs Kurucz) now that we understand what each program does
3. Map subroutines to workflow stages

---

**Status**: ✅ Phase 2A Part 1 COMPLETE
**Next**: Update DEPENDENCY_MAP.md, begin version comparison analysis

---

*End of Workflow Analysis Report*
