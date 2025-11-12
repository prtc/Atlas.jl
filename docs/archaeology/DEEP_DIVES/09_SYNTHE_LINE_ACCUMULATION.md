# Deep Dive 09: SYNTHE Line Accumulation Pipeline
*Incremental Line Database Construction via Fort.12*

**Code Sections**:
- `upstream/castelli/source_codes/synthe/synbeg.for` (133 lines) - Initializer
- `upstream/castelli/source_codes/synthe/rgfalllinesnew.for` (648 lines) - Atomic line reader
- `upstream/castelli/source_codes/synthe/rmolecasc.for` (569 lines) - Molecular line reader
- `upstream/castelli/source_codes/synthe/rschwenk.for` (222 lines) - TiO line reader
- `upstream/castelli/source_codes/synthe/rh2ofast.for` (190 lines) - H2O line reader
- `upstream/castelli/source_codes/synthe/rpredict.for` (450 lines) - Predicted line reader

**Risk Type**: Architecture, Binary I/O, Data Integrity
**Analysis Date**: 2025-11-09
**Time Invested**: ~75 minutes

---

## Executive Summary

**Key Finding**: SYNTHE does NOT have a standalone "Binary" line-merging program as initially assumed. Instead, it uses an **incremental accumulation** architecture where multiple line-reading programs append to shared binary files (fort.12, fort.14, fort.19, fort.20).

**Architecture Pattern**:
```
synbeg (initialize empty files)
   ↓
rgfalllinesnew (append atomic lines to fort.12)
   ↓
rmolecasc (append CH, OH, NH,... lines to fort.12)
   ↓
rschwenk (append TiO lines to fort.12)
   ↓
rh2ofast (append H2O lines to fort.12)
   ↓
rpredict (append predicted lines to fort.12 - optional)
   ↓
synthe (read accumulated fort.12)
```

**This pattern is elegant but fragile**:
- ✅ **Simple**: No need for explicit merging/sorting program
- ✅ **Flexible**: Easy to add/remove line sources
- ✅ **Modular**: Each reader is independent
- ❌ **Sequential**: Must run readers in series (cannot parallelize)
- ❌ **Fragile**: If any reader fails, fort.12 is incomplete
- ❌ **No validation**: No checksum or line count verification

**Migration Impact**: Julia version can improve on this by:
1. Using proper data structures (DataFrame, Arrow table) instead of binary files
2. Parallel line reading with explicit merge at end
3. Schema validation and checksums
4. Atomic writes (all-or-nothing updates)

---

## Table of Contents

1. [Overview: The Accumulation Pattern](#1-overview-the-accumulation-pattern)
2. [Synbeg: File Initialization](#2-synbeg-file-initialization)
3. [Line Reader Architecture](#3-line-reader-architecture)
4. [Fort.12 Binary Format](#4-fort12-binary-format)
5. [Fort.14 and Fort.19 Formats](#5-fort14-and-fort19-formats)
6. [Rgfalllinesnew: Atomic Line Reader](#6-rgfalllinesnew-atomic-line-reader)
7. [Molecular Line Readers](#7-molecular-line-readers)
8. [Sorting and Ordering](#8-sorting-and-ordering)
9. [Error Handling and Validation](#9-error-handling-and-validation)
10. [Migration Strategy](#10-migration-strategy)
11. [Testing Strategy](#11-testing-strategy)
12. [Open Questions](#12-open-questions)
13. [Key Takeaways](#13-key-takeaways)

---

## 1. Overview: The Accumulation Pattern

### The Architecture

SYNTHE uses a **pipeline of independent programs** that communicate via shared files:

**Files created by synbeg**:
- `fort.12`: Line data for LTE synthesis (main line database)
- `fort.14`: Full line metadata (optional, if LINOUT >= 0)
- `fort.19`: NLTE line data
- `fort.20`: Full NLTE line metadata (optional)
- `fort.93`: Control parameters (passed between all programs)

**Execution sequence** (typical):
```bash
# 1. Initialize
./synbeg < synbeg.input

# 2. Read atomic lines (multiple wavelength ranges)
./rgfalllinesnew < gf0800.100  # 800-1200 nm
./rgfalllinesnew < gf1200.100  # 1200-5000 nm
./rgfalllinesnew < gf5000.100  # 5000-25000 nm

# 3. Read molecular lines
./rmolecasc < CH.asc
./rmolecasc < OH.asc
./rmolecasc < NH.asc
# ... etc for each molecule

# 4. Read TiO (binary format, special handling)
./rschwenk < tioschwenke.bin

# 5. Read H2O (binary format)
./rh2ofast < h2ofastfix.bin

# 6. Optionally read predicted lines
# ./rpredict < predicted.dat  (usually skipped for abundance work)

# 7. Synthesize spectrum
./synthe < synthe.input
```

### Key Insight

This is **NOT** object-oriented or functional - it's **Unix pipeline philosophy**:
- Each program does one thing
- Programs communicate via files
- Add/remove functionality by including/excluding programs
- Order (mostly) doesn't matter

**Quote from synbeg.for comments** (lines 15-16):
> "THE ORDER OF THESE READING PROGRAMS DOES NOT MATTER EXCEPT FOR RNLTE, RLINE, AND RGFIRON WHICH MUST COME FIRST"

---

## 2. Synbeg: File Initialization

### Source Code

**File**: `synbeg.for` (133 lines)
**Purpose**: Read control parameters, initialize empty binary files, pass parameters to subsequent programs

### Key Code Section (lines 121-130)

```fortran
! Create empty binary files
OPEN(UNIT=12,STATUS='NEW',FORM='UNFORMATTED')
CLOSE(UNIT=12)

OPEN(UNIT=14,STATUS='NEW',FORM='UNFORMATTED')
CLOSE(UNIT=14)

OPEN(UNIT=19,STATUS='NEW',FORM='UNFORMATTED')
CLOSE(UNIT=19)

OPEN(UNIT=20,STATUS='NEW',FORM='UNFORMATTED')
CLOSE(UNIT=20)

! Write parameters to fort.93 for subsequent programs
WRITE(93)NLINES,LENGTH,IFVAC,IFNLTE,N19,TURBV,DECKJ,IFPRED,
 1WLBEG,WLEND,RESOLU,RATIO,RATIOLG,CUTOFF,LINOUT
```

**Analysis**:
- `STATUS='NEW'` creates files (will fail if they already exist!)
- Files are opened and immediately closed → creates 0-byte files
- Fort.93 is UNFORMATTED binary containing control parameters
- No error handling (if fort.12 exists, program crashes)

### Input Parameters (from stdin)

```fortran
READ(5,1)AIRVAC,WLBEG,WLEND,RESOLU,TURBV,IFNLTE,LINOUT,CUTOFF,IFPRED,NREAD
  1 FORMAT(A3,7X,4F10.4,I3,I7,F10.5,2I5)
```

**Example input line**:
```
AIR       5000.0     5100.0     500000.   0.     0          10 .001         0   00
```

**Parameter meanings**:
- `AIRVAC`: "AIR" or "VAC" for wavelength system
- `WLBEG`, `WLEND`: Wavelength range (Angstroms)
- `RESOLU`: Resolving power R = λ/Δλ (e.g., 500000)
- `TURBV`: Additional turbulent velocity (km/s, usually 0)
- `IFNLTE`: 0=LTE, 1=NLTE
- `LINOUT`: Print limit AND save-line-data flag (< 0 = don't save)
- `CUTOFF`: Line wing cutoff (fraction of continuum, e.g., 0.001 = 0.1%)
- `IFPRED`: Include predicted lines? (0=no, 1=yes)
- `NREAD`: Number of depth-dependent parameter cards to read

### Wavelength Grid Setup

```fortran
RATIO=1.+1./RESOLU
RATIOLG=DLOG(RATIO)
IXWLBEG=DLOG(WLBEG)/RATIOLG
WBEGIN=DEXP(IXWLBEG*RATIOLG)
IF(WBEGIN.LT.WLBEG)THEN
  IXWLBEG=IXWLBEG+1
  WBEGIN=DEXP(IXWLBEG*RATIOLG)
ENDIF
```

**Purpose**: Snap wavelength grid to logarithmic spacing.

**Grid properties**:
- Logarithmic: `λ[i] = WBEGIN × RATIO^(i-1)`
- Constant Δλ/λ = 1/RESOLU
- `LENGTH` = number of wavelength points in range

**Passed to subsequent programs via fort.93** so all readers use the same grid.

---

## 3. Line Reader Architecture

### Common Pattern

All line readers follow the same structure:

```fortran
PROGRAM R[NAME]
  ! Read parameters from fort.93
  READ(93)NLINES,LENGTH,IFVAC,IFNLTE,N19,TURBV,DECKJ,IFPRED,
   1WLBEG,WLEND,RESOLU,RATIO,RATIOLG,CUTOFF,LINOUT

  ! Open files in APPEND mode
  OPEN(UNIT=12,STATUS='OLD',FORM='UNFORMATTED',ACCESS='APPEND')
  OPEN(UNIT=14,STATUS='OLD',FORM='UNFORMATTED',ACCESS='APPEND')
  OPEN(UNIT=19,STATUS='OLD',FORM='UNFORMATTED',ACCESS='APPEND')
  OPEN(UNIT=20,STATUS='OLD',FORM='UNFORMATTED',ACCESS='APPEND')

  ! Read lines from input (fort.11)
  DO ILINE=1,HUGE_NUMBER
    READ(11,...)line_data
    IF(wavelength out of range) CYCLE  ! Skip line
    IF(line too weak) CYCLE             ! Skip line

    ! Compute line parameters (broadening, etc.)
    [... calculations ...]

    ! Write to appropriate fort unit
    IF(is_NLTE_line) THEN
      WRITE(19)line_data_compact
      IF(LINOUT >= 0) WRITE(20)line_data_full
    ELSE
      WRITE(12)line_data_compact
      IF(LINOUT >= 0) WRITE(14)line_data_full
    ENDIF

    NLINES = NLINES + 1
  ENDDO

  ! Update line count in fort.93
  WRITE(93)NLINES,LENGTH,IFVAC,IFNLTE,N19,TURBV,DECKJ,IFPRED,
   1WLBEG,WLEND,RESOLU,RATIO,RATIOLG,CUTOFF,LINOUT

  CALL EXIT
END
```

### Key Features

**1. APPEND mode** (critical!)
```fortran
OPEN(UNIT=12,STATUS='OLD',FORM='UNFORMATTED',ACCESS='APPEND')
```
- `STATUS='OLD'`: File must already exist (synbeg created it)
- `ACCESS='APPEND'`: Writes go to end of file
- Each reader adds its lines after previous readers

**2. Line count accumulation**:
```fortran
READ(93)NLINES,...     ! Read current count
! ... process lines, increment NLINES ...
WRITE(93)NLINES,...    ! Write updated count
```
- Fort.93 is updated by each reader
- Final NLINES = sum of all lines from all readers

**3. Wavelength filtering**:
```fortran
IF(WLVAC.GT.WLEND+DELLIM(1))GO TO 145  ! Exit loop
IF(WLVAC.LT.WLBEG-DELLIM(1))CYCLE      ! Skip line
```
- Only lines within `[WLBEG, WLEND]` are written
- DELLIM = margin for line wings (wavelength-dependent)

**4. Line strength cutoff**:
```fortran
IF(line_opacity < CUTOFF * continuum_opacity) CYCLE
```
- Weak lines ignored (saves space, speeds up synthe)
- CUTOFF typically 0.001 (0.1% of continuum)

---

## 4. Fort.12 Binary Format

### Record Structure

From `rgfalllinesnew.for:301`:
```fortran
WRITE(12)NBUFF,CGF,NELION,ELO,GAMMAR,GAMMAS,GAMMAW,alpha
```

**Each record contains 8 values**:
- `NBUFF`: INTEGER*4 - Wavelength buffer index
- `CGF`: REAL*4 - Continuum times gf (oscillator strength × continuum opacity)
- `NELION`: INTEGER*4 - Element/ion storage index
- `ELO`: REAL*4 - Lower level energy (cm^-1)
- `GAMMAR`: REAL*4 - Radiative damping constant
- `GAMMAS`: REAL*4 - Stark damping constant
- `GAMMAW`: REAL*4 - Van der Waals damping constant
- `alpha`: REAL*4 - (Uncertain - photoionization cross-section?)

**Record size**:
- 1 × 4 bytes (INTEGER*4) = 4 bytes
- 6 × 4 bytes (REAL*4) = 24 bytes
- 1 × 4 bytes (alpha) = 4 bytes
- **Total = 32 bytes per line**

**Plus Fortran UNFORMATTED overhead**:
- 4-byte record length prefix
- 4-byte record length suffix
- **Total on disk = 40 bytes per line**

### NBUFF: Wavelength Index

**Calculation** (rgfalllinesnew.for:148-149):
```fortran
IXWL=DLOG(WLVAC)/RATIOLG+.5D0
NBUFF=IXWL-IXWLBEG+1
```

**Meaning**: Index into logarithmic wavelength grid.

**Example**:
- WBEGIN = 5000 Å, RESOLU = 500000, RATIOLG = log(1 + 1/500000)
- Line at 5005 Å → IXWL = log(5005)/RATIOLG ≈ 500000
- NBUFF = 500000 - IXWLBEG + 1 = grid index

**Purpose**: synthe.for uses NBUFF to quickly find which wavelength points a line affects.

### CGF: Combined gf × Continuum

🐉 **Dragon Alert**: The name "CGF" is misleading. Looking at the code, it's actually:
```fortran
CGF = G  ! Where G is the oscillator strength from the line list
```

**NOT** "continuum times gf" despite the variable name. This is likely a historical artifact or misnamed variable.

**Actual meaning**: Raw oscillator strength from input file (gf value).

### NELION: Element/Ion Index

**Format**: `NELION = 100 × atomic_number + ionization_stage`

**Examples**:
- Fe I (neutral iron): NELION = 2600 (Z=26, ion=0)
- Fe II (singly ionized): NELION = 2601
- Ca I: NELION = 2000
- Ca II: NELION = 2001

**Purpose**: Index into `XNFP` and `DOPPLE` arrays for number density and Doppler width.

---

## 5. Fort.14 and Fort.19 Formats

### Fort.14: Full Line Metadata (LTE lines)

```fortran
IF(LINOUT.GE.0)WRITE(14)LINDAT8,LINDAT4
```

**LINDAT8** (14 × REAL*8):
- WL, E, EP, LABEL(2), LABELP(2), OTHER1(2), OTHER2(2), WLVAC, CENTER, CONCEN

**LINDAT4** (28 × REAL*4):
- NELION, GAMMAR, GAMMAS, GAMMAW, REF, NBLO, NBUP, ISO1, X1, ISO2, X2, GFLOG, XJ, XJP, CODE, ELO, GF, GS, GR, GW, DWL, DGFLOG, DGAMMAR, DGAMMAS, DGAMMAW, EXTRA1, EXTRA2, EXTRA3

**Total**: 14 × 8 + 28 × 4 = 224 bytes per line (+ 8 bytes overhead = 232 bytes)

**Purpose**: Complete line identification for output (wavelength, quantum numbers, references, etc.)

**Usage**: Written to fort.7 by spectrv.for for line-by-line analysis.

### Fort.19: NLTE Line Data

```fortran
WRITE(19)WLVAC,ELO,GF,NBLO,NBUP,NELION,TYPE,NCON,NELIONX,
```

**Format** (9 values):
- WLVAC: Vacuum wavelength (REAL*8)
- ELO: Lower level energy (REAL*4)
- GF: Oscillator strength (REAL*4)
- NBLO, NBUP: Departure coefficient indices (INTEGER)
- NELION: Element/ion index (INTEGER)
- TYPE: Line type flag (INTEGER)
- NCON: Continuum index (INTEGER)
- NELIONX: Extended element index (INTEGER)

**Usage**: Read by spectrv.for for NLTE radiative transfer (if IFNLTE=1).

---

## 6. Rgfalllinesnew: Atomic Line Reader

### Purpose

Reads Kurucz atomic line lists (gf*.100 files) and selects lines in wavelength range.

**File**: `rgfalllinesnew.for` (648 lines, revised 2014)

### Input Format (Kurucz gf*.100)

**ASCII fixed-format** (format 140, line 126-127):
```
   234.0154 -3.888  3.00       0.000  0.5 2s  2S       42719.141  0.5 12p  2P
  5.21  0.00  0.00LN   0 0  0 0.000  0 0.000                     1234 5678    -7
```

**Line 1 fields**:
- Columns 1-11: Wavelength (F11.4) - air if > 200 nm, vacuum if < 200 nm
- Columns 12-18: log(gf) (F7.3)
- Columns 19-24: Element code (F6.2) - e.g., 26.00 = Fe I, 26.01 = Fe II
- Columns 25-36: Lower level energy E (F12.3) in cm^-1
- Columns 37-41: Lower J (F5.1)
- Columns 42-51: Lower level label (A8,A2)
- Columns 52-63: Upper level energy E' (F12.3)
- Columns 64-68: Upper J' (F5.1)
- Columns 69-78: Upper level label (A8,A2)

**Line 2 fields**:
- Columns 1-6: log(γ_rad) (F6.2)
- Columns 7-12: log(γ_Stark) (F6.2)
- Columns 13-18: log(γ_vdW) (F6.2)
- Columns 19-22: Reference (A4)
- Columns 23-24: NBLO (I2) - lower departure coeff index
- Columns 25-26: NBUP (I2) - upper departure coeff index
- Columns 27-29: ISO1 (I3) - isotope 1 number
- Columns 30-35: X1 (F6.3) - log isotope 1 abundance
- Columns 36-38: ISO2 (I3) - isotope 2 number
- Columns 39-44: X2 (F6.3) - log isotope 2 abundance
- Columns 45-64: (Reserved for labels/quantum numbers)
- Columns 65-69: Landé g (I5) for lower level (× 1000)
- Columns 70-74: Landé g (I5) for upper level (× 1000)
- Columns 75-80: Isotope shift (I6) in milli-Angstroms

**✅ TOOL AVAILABLE** (2025-11-11): See `tools/line_lists/gfall_to_hdf5.py` - Python converter implementing this exact fixed-width parser to convert Kurucz gfall format to HDF5. Includes vacuum/air wavelength tracking (>200nm = air). Tested with gf_tiny.dat (1,197 lines, 0 errors).

### Key Processing Steps

**1. Vacuum wavelength calculation** (lines 145-146):
```fortran
IF(IFVAC.EQ.1.OR.LABELP(1).EQ.8HCONTINUU)WLVAC=
 1 1.D7/DABS(DABS(EP)+ESHIFTP-(DABS(E)+ESHIFT))+DWL+DWLISO
```

**If IFVAC=1**: Use energy levels to compute wavelength (more accurate than lab wavelength for high-precision work)

**Formula**: λ_vac = 10^7 / |E' - E| cm^-1 → Angstroms

**2. Wavelength filtering** (line 147):
```fortran
IF(WLVAC.GT.WLEND+DELLIM(1))GO TO 145  ! Exit if past range
```

**DELLIM** (line 89): Wavelength-dependent margin for line wings
```fortran
DATA DELLIM/100.,30.,10.,3.,1.,.3,.1/
```
- λ < 500 Å: margin = 100 Å
- λ < 1000 Å: margin = 30 Å
- ... etc (smaller margin for longer wavelengths)

**3. Element/ion lookup** (subroutine IONPOTS):
```fortran
CALL IONPOTS(CODE,NELION,IZHI)
```

**CODE**: Element.ion (e.g., 26.01 for Fe II)
**NELION**: Storage index for XNFP arrays
**IZHI**: Highest ionization stage for this element

**Purpose**: Map element code to array indices for population lookup in synthe.

**4. Line strength evaluation**:
```fortran
! Compute line opacity at line center
ALINEC = [...complex calculation involving populations, Doppler width, oscillator strength...]

! Check if line is strong enough
IF(ALINEC < CUTOFF × continuum) CYCLE
```

🐉 **Dragon**: The actual line strength calculation is complex and depends on:
- Number density of lower level (from populations)
- Oscillator strength (gf)
- Doppler width (thermal + turbulent broadening)
- Stimulated emission correction

Details are in the code but not well-commented. Need to cross-reference with synthe.for opacity calculation to ensure consistency.

---

## 7. Molecular Line Readers

### Rmolecasc: Molecular Line Reader

**File**: `rmolecasc.for` (569 lines)
**Purpose**: Read molecular line lists (CH, OH, NH, MgH, SiH, C2, CN, CO, SiO, etc.)

**Input format**: ASCII, molecule-specific
- Each molecule has its own format
- Typically: wavelength, log(gf), E_lower, J_lower, J_upper, vibrational quantum numbers

**Key difference from atomic lines**:
- Molecular number densities computed via equilibrium constants
- Partition functions temperature-dependent
- Isotope fractions handled differently

**✅ TOOL AVAILABLE** (2025-11-11): See `tools/line_lists/molecular_linelist_to_hdf5.py` - Python converter for ASCII molecular line formats (CH, OH, NH, CN, CO, MgH, SiH, etc.) to HDF5. Implements isotope abundance corrections. Tested with chbx.asc (4,270 CH lines, 0 errors). Also see `tools/line_lists/line_query.py` for querying converted files. Note: TiO and H2O use binary formats and need separate tools.

### Rschwenk: TiO Line Reader

**File**: `rschwenk.for` (222 lines)
**Purpose**: Read TiO lines from Schwenke (1998) binary database

**Why special?**:
- TiO has **millions of lines** (too many for ASCII)
- Binary format for efficiency
- Requires separate energy level file (eschwenke.bin)

**Input files**:
- fort.11: tioschwenke.bin (line data)
- fort.48: eschwenke.bin (energy levels)

**Format**: Custom binary (not documented in code - reverse engineering required)

### Rh2ofast: H2O Line Reader

**File**: `rh2ofast.for` (190 lines)
**Purpose**: Read H2O lines from Partridge & Schwenke (1997) binary database

**Why special?**:
- H2O has **tens of millions of lines**
- Critical for cool stars (T < 4000 K)
- Binary format mandatory

**Input**: fort.11 = h2ofastfix.bin

**Format**: "Packed binary" (not fully documented)

---

## 8. Sorting and Ordering

### Are Lines Sorted in Fort.12?

🐉 **Critical Question**: If each reader appends in sequence, fort.12 contains:
1. All atomic lines (sorted by wavelength within)
2. All CH lines (sorted within)
3. All OH lines (sorted within)
4. All TiO lines (sorted within)
5. All H2O lines (sorted within)

**Result**: Lines are **grouped by source**, not globally sorted by wavelength!

**How does synthe handle this?**

Looking at synthe.for, it likely:
- **Option A**: Reads all lines into memory, sorts them
- **Option B**: Uses NBUFF index to bin lines by wavelength (each wavelength point collects relevant lines)
- **Option C**: Doesn't care about sort order (processes all lines at each wavelength anyway)

**Most likely**: Option B or C. The NBUFF index allows synthe to process lines efficiently regardless of file order.

**Validation needed**: Inspect synthe.for line-reading loop to confirm.

### Order Dependencies

From synbeg.for comments (lines 16-18):
> "EXCEPT FOR RNLTE, RLINE, AND RGFIRON WHICH MUST COME FIRST AND IN RELATIVE ORDER IF THEY ARE USED."

**Why?**:
- RNLTE: Handles line deletions from other lists (needs to run first)
- RLINE: Corrections/additions to RGFIRON
- RGFIRON: Main iron line list (must be before RLINE)

**Implication**: Line readers can **modify** what previous readers wrote (via deletion arrays). This is fragile!

---

## 9. Error Handling and Validation

### What Could Go Wrong?

**Problem 1**: Reader crashes mid-execution
- Fort.12 is incomplete
- No way to detect (no line count in file header)
- synthe will process partial line list (wrong results, no error!)

**Problem 2**: Fort.12 already exists when synbeg runs
```fortran
OPEN(UNIT=12,STATUS='NEW',...)
```
- Crashes with "file already exists" error
- User must manually delete fort.12 first

**Problem 3**: Reader opens wrong file
- ACCESS='APPEND' means any write goes to end
- If reader confuses fort.12 with fort.14, data corruption
- No validation (no magic number, no schema)

**Problem 4**: Binary format mismatch
- Different Fortran compilers use different UNFORMATTED formats
- Code compiled with gfortran won't read ifort binaries
- No error - just garbage data!

### Existing Validation

**None!** There is:
- ❌ No checksum
- ❌ No line count in file header
- ❌ No magic number
- ❌ No schema version
- ❌ No byte-order mark (endianness)

**Only validation**: Fort.93 contains `NLINES` (total line count)
- Updated by each reader
- synthe.for can check if NLINES matches number of records read
- But this requires synthe to finish - if it crashes, no validation

---

## 10. Migration Strategy

### Phase 1: Understand Synthe's Reading Pattern

**Before designing replacement**, must answer:
1. Does synthe.for read all lines into memory?
2. Does synthe.for require lines sorted by wavelength?
3. How does synthe.for use NBUFF index?

**Action**: Deep dive into synthe.for (next task - Deep Dive 10 or 11?)

### Phase 2: Design Modern Line Database

**Option A: In-Memory DataFrame**
```julia
struct SpectralLine
    wavelength::Float64       # Vacuum wavelength (Å)
    gf::Float32              # Oscillator strength
    element::Int32           # Atomic number
    ion::Int32               # Ionization stage (0-based)
    e_lower::Float32         # Lower level energy (cm^-1)
    e_upper::Float32         # Upper level energy (cm^-1)
    j_lower::Float32         # Lower J
    j_upper::Float32         # Upper J
    gamma_rad::Float32       # Radiative damping
    gamma_stark::Float32     # Stark damping
    gamma_vdw::Float32       # Van der Waals damping
    # ... more fields as needed
end

# Line database as DataFrame
line_database = DataFrame(
    wavelength = Float64[],
    gf = Float32[],
    # ... etc
)
```

**Advantages**:
- ✅ Schema validation (type checking)
- ✅ Easy to sort by any column
- ✅ Query by wavelength range: `filter(row -> wlbeg ≤ row.wavelength ≤ wlend, df)`
- ✅ Can use Arrow for fast binary I/O

**Disadvantages**:
- ❌ Must fit in RAM (but modern machines have 16+ GB, should be fine)
- ❌ Different API than Fortran files

**Option B: SQLite Database**
```sql
CREATE TABLE spectral_lines (
    line_id INTEGER PRIMARY KEY,
    wavelength REAL NOT NULL,
    gf REAL,
    element INTEGER,
    ion INTEGER,
    e_lower REAL,
    gamma_rad REAL,
    gamma_stark REAL,
    gamma_vdw REAL,
    source TEXT,  -- "atomic", "CH", "TiO", etc.
    INDEX idx_wavelength (wavelength)
);
```

**Advantages**:
- ✅ Handles arbitrarily large datasets (billions of lines)
- ✅ Fast indexed queries
- ✅ ACID transactions (atomic writes)
- ✅ Schema validation
- ✅ Can query from multiple processes

**Disadvantages**:
- ❌ Slower than in-memory (but still fast with indices)
- ❌ Additional dependency

**Recommendation**: Start with **DataFrame + Arrow**, migrate to SQLite if dataset too large.

### Phase 3: Parallel Line Reading

**Current**: Serial pipeline (rgfalllinesnew → rmolecasc → ...)
**Modern**: Parallel reading with merge

```julia
# Read all line sources in parallel
atomic_lines = @spawn read_atomic_lines(gf_files, wlbeg, wlend)
ch_lines = @spawn read_molecular_lines("CH", ch_file, wlbeg, wlend)
oh_lines = @spawn read_molecular_lines("OH", oh_file, wlbeg, wlend)
tio_lines = @spawn read_tio_binary(tio_file, wlbeg, wlend)
h2o_lines = @spawn read_h2o_binary(h2o_file, wlbeg, wlend)

# Wait for all and merge
all_lines = vcat(
    fetch(atomic_lines),
    fetch(ch_lines),
    fetch(oh_lines),
    fetch(tio_lines),
    fetch(h2o_lines)
)

# Sort by wavelength
sort!(all_lines, :wavelength)

# Validate
@assert length(all_lines) > 0 "No lines found in range!"
@assert issorted(all_lines.wavelength) "Lines not sorted!"

# Save to Arrow file (fast binary format)
Arrow.write("line_database.arrow", all_lines)
```

**Speedup**: 5× faster (5 readers in parallel vs serial)

### Phase 4: Validation and Checksums

```julia
# After merging all lines
line_db = LineDatabase(all_lines)

# Compute checksum
checksum = sha256(line_db)

# Write metadata
metadata = (
    nlines = nrow(all_lines),
    wavelength_range = (minimum(all_lines.wavelength), maximum(all_lines.wavelength)),
    sources = unique(all_lines.source),
    checksum = checksum,
    created = now(),
    julia_version = VERSION,
    atlas_version = "1.0.0"
)

# Save with metadata
save_line_database("line_database.arrow", line_db, metadata)
```

**Benefits**:
- Detect corruption
- Track provenance
- Version control

---

## 11. Testing Strategy

### Unit Tests

**Test 1: Wavelength Grid Consistency**
```julia
@testset "Wavelength Grid" begin
    # Synbeg creates grid
    grid1 = create_wavelength_grid(5000.0, 500000.0, ...)

    # Reader reads from fort.93
    grid2 = read_wavelength_grid_from_fort93()

    @test grid1.wbegin == grid2.wbegin
    @test grid1.ratio == grid2.ratio
    @test grid1.length == grid2.length
end
```

**Test 2: Line Filtering**
```julia
@testset "Line Selection" begin
    lines = read_atomic_lines("test_data/gf_small.100", 5000.0, 5100.0)

    # All lines should be in range
    @test all(5000.0 .- 100 .≤ lines.wavelength .≤ 5100.0 .+ 100)

    # No lines outside range
    @test count(lines.wavelength .< 4900.0) == 0
    @test count(lines.wavelength .> 5200.0) == 0
end
```

**Test 3: Binary Format Compatibility**
```julia
@testset "Fort.12 Format" begin
    # Create test line
    line = SpectralLine(
        wavelength = 5000.0,
        gf = 0.1,
        element = 26,  # Fe
        ion = 0,
        # ...
    )

    # Write using Fortran format
    write_fort12_fortran_format("test.dat", [line])

    # Read back
    lines_read = read_fort12("test.dat")

    @test lines_read[1].wavelength ≈ 5000.0
    @test lines_read[1].gf ≈ 0.1 rtol=1e-6
end
```

### Integration Tests

**Test 4: Full Pipeline**
```julia
@testset "End-to-End Line Accumulation" begin
    # Initialize (like synbeg)
    initialize_line_database(wlbeg=5000.0, wlend=5100.0, resolu=500000.0)

    # Add atomic lines (like rgfalllinesnew)
    add_atomic_lines!("test_data/gf_test.100")

    # Add molecular lines (like rmolecasc)
    add_molecular_lines!("CH", "test_data/ch_test.asc")

    # Finalize
    line_db = finalize_line_database()

    # Validate
    @test length(line_db) > 100  # Should have found some lines
    @test issorted(line_db.wavelength)
    @test all(5000.0 .≤ line_db.wavelength .≤ 5100.0)
end
```

**Test 5: Compare with Fortran**
```julia
@testset "Fortran Compatibility" begin
    # Run Fortran pipeline
    run(`./synbeg < synbeg_test.input`)
    run(`./rgfalllinesnew < gf_test.100`)

    # Read Fortran fort.12
    fort12_fortran = read_fort12_binary("fort.12")

    # Run Julia pipeline
    julia_db = create_line_database_julia("gf_test.100", ...)

    # Compare
    @test nrow(julia_db) == length(fort12_fortran)
    for (jline, fline) in zip(julia_db, fort12_fortran)
        @test jline.wavelength ≈ fline.wavelength rtol=1e-6
        @test jline.gf ≈ fline.gf rtol=1e-5
    end
end
```

---

## 12. Open Questions

### For Code Archaeology

1. **Does synthe.for require sorted lines?**
   - Need to inspect synthe.for reading loop
   - Does it read sequentially or random-access by NBUFF?
   - Can we skip sorting if not required?

2. **What is `alpha` in fort.12 record?**
   - 8th field in WRITE(12) statement
   - Not documented in comments
   - Photoionization cross-section? Line asymmetry parameter?
   - Check synthe.for to see if it's used

3. **Deletion arrays** (NDELET, NELDLT):
   - How does RNLTE mark lines for deletion?
   - Does RGFIRON check these arrays?
   - Can we simplify this mechanism?

4. **NBUFF calculation**: Why this specific formula?
   ```fortran
   IXWL=DLOG(WLVAC)/RATIOLG+.5D0
   NBUFF=IXWL-IXWLBEG+1
   ```
   - Why +0.5 (rounding)?
   - Does synthe.for expect 1-indexed NBUFF?

5. **Fort.93 format**: What if fort.93 is corrupted?
   - Does any reader validate parameters?
   - What if RESOLU changes between readers?

### For Domain Expert

6. **Line selection criteria**: Is CUTOFF=0.001 appropriate?
   - Does it depend on spectral type (hot vs cool stars)?
   - Can we compute optimal cutoff automatically?

7. **Wavelength margins** (DELLIM): Why these specific values?
   ```fortran
   DATA DELLIM/100.,30.,10.,3.,1.,.3,.1/
   ```
   - Are these empirically determined?
   - Do they depend on temperature/pressure?

8. **NLTE line treatment**: When is fort.19 used vs fort.12?
   - What makes a line "NLTE"?
   - Is this a user choice or determined by atomic data?

### For Migration Decisions

9. **Memory limits**: How many lines can we realistically handle in RAM?
   - Solar spectrum: ~10^6 lines?
   - M dwarf: ~10^7 lines (TiO, H2O)?
   - Do we need SQLite or is DataFrame sufficient?

10. **Binary compatibility**: Must Julia write Fortran-compatible fort.12?
    - Or can we break compatibility and rewrite synthe.for in Julia too?
    - If breaking compatibility, what's migration path for users?

---

## 13. Key Takeaways

### Architecture Insights

1. **No Binary Program**: SYNTHE uses incremental accumulation via file appending, not a standalone merge program
2. **Unix Philosophy**: Each reader is independent, communicates via files (fort.12, fort.93)
3. **Append-Only**: Line readers open fort.12 in APPEND mode - simple but not parallel-friendly
4. **Fort.93 as IPC**: Control parameters passed between programs via binary file (primitive but effective)

### Data Format

5. **Fort.12 is Compact**: 32 bytes per line (8 fields: NBUFF, CGF, NELION, ELO, γ_rad, γ_Stark, γ_vdW, alpha)
6. **Fort.14 is Complete**: 224 bytes per line (full metadata for line identification)
7. **NBUFF is Key**: Wavelength grid index allows synthe.for to bin lines efficiently
8. **Not Globally Sorted**: Lines grouped by source (atomic, then CH, then OH, etc.)

### Fragility

9. **No Validation**: No checksums, no line counts in file headers, no schema validation
10. **Failure Modes**: If reader crashes, fort.12 incomplete with no detection
11. **Binary Portability**: Fortran UNFORMATTED not portable across compilers
12. **Order Dependencies**: RNLTE/RLINE/RGFIRON must run in specific order (deletion mechanism)

### Migration Opportunities

13. **Modernize Format**: Use Arrow/HDF5 instead of Fortran UNFORMATTED (portable, validated, fast)
14. **Parallelize**: Read all line sources concurrently, merge at end (5× speedup)
15. **Add Validation**: Checksums, schema validation, atomic transactions
16. **In-Memory Database**: DataFrame sufficient for ~10^6-10^7 lines, SQLite for larger

---

*End of Deep Dive 09*

**Next Steps**:
- Deep Dive 10: xnfpelsyn (atmosphere preparation)
- Deep Dive 11: synthe.for (line opacity calculation - **critical** to understand NBUFF usage!)
- Deep Dive 12: rotate/broaden/smooth (post-processing)
