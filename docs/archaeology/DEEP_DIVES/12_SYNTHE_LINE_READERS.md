# Deep Dive 12: SYNTHE Line Reading Pipeline

## Executive Summary

This deep dive documents the five line reader programs that populate the fort.12 binary line list in the SYNTHE pipeline. These programs read atomic and molecular line data from various external databases, filter by wavelength range, apply abundance corrections, and write standardized records to fort.12 for use by the spectrum synthesis kernel.

**Key Finding**: The line readers are **format-specific adapters** that normalize heterogeneous input formats (ASCII, binary-packed, direct-access) into a common fort.12 output format. Each reader handles isotopic abundance corrections, wavelength filtering, and unit conversions independently.

**Migration Priority**: Medium-High. These readers are the **data ingestion layer** and must be migrated early to enable testing of downstream components with real line lists.

**Complexity**: Moderate. The core logic is straightforward (read → filter → transform → write), but the format diversity and hardcoded isotopic abundance tables require careful preservation.

**Line Count**:
- rgfalllinesnew.for: 648 lines (atomic lines, ASCII)
- rmolecasc.for: 570 lines (molecular lines, ASCII)
- rschwenk.for: 223 lines (TiO, binary packed)
- rh2ofast.for: 191 lines (H2O, binary packed)
- rpredict.for: 451 lines (predicted atomic lines, binary packed)

**Total Pipeline**: ~2083 lines across 5 programs

---

## Table of Contents

1. [Pipeline Overview](#pipeline-overview)
2. [Common Architecture](#common-architecture)
3. [rgfalllinesnew: Atomic Line Reader](#rgfalllinesnew-atomic-line-reader)
4. [rmolecasc: Molecular Line Reader](#rmolecasc-molecular-line-reader)
5. [rschwenk: TiO Line Reader](#rschwenk-tio-line-reader)
6. [rh2ofast: H2O Line Reader](#rh2ofast-h2o-line-reader)
7. [rpredict: Predicted Line Reader](#rpredict-predicted-line-reader)
8. [Fort.12 Output Format](#fort12-output-format)
9. [Common Code Patterns](#common-code-patterns)
10. [Migration Strategy](#migration-strategy)
11. [Testing Strategy](#testing-strategy)
12. [Open Questions](#open-questions)
13. [Key Takeaways](#key-takeaways)

---

## Pipeline Overview

### Execution Order

The SYNTHE pipeline invokes line readers in sequence after `synbeg` initializes fort.12:

```
synbeg          # Initialize empty fort.12
  ↓
rgfalllinesnew  # Append atomic lines (Kurucz gfall format)
  ↓
rmolecasc       # Append molecular lines (ASCII format)
  ↓
rschwenk        # Append TiO lines (Schwenke binary format)
  ↓
rh2ofast        # Append H2O lines (Partridge-Schwenke binary)
  ↓
rpredict        # Append predicted atomic lines (optional, if IFPRED=1)
  ↓
spectrv         # Read fort.12 for spectrum synthesis
```

**Critical Detail**: Each reader opens fort.12 with `ACCESS='APPEND'`, adding records to the end. There is **no sorting or deduplication** - lines are processed in the order readers are invoked.

### Input Data Sources

| Reader | Format | Source | Typical Size | Line Count Range |
|--------|--------|--------|--------------|------------------|
| rgfalllinesnew | ASCII | Kurucz gfallxxxx.dat | ~500 MB | ~60M lines |
| rmolecasc | ASCII | Molecular line lists | ~10-100 MB | ~1-10M lines |
| rschwenk | Binary (packed) | Schwenke TiO database | ~200 MB | ~50M lines |
| rh2ofast | Binary (packed) | Partridge-Schwenke H2O | ~500 MB | ~66M lines |
| rpredict | Binary (packed) | Kurucz predicted lines | ~100 MB | ~10M lines |

**Total Potential**: Up to ~200M lines across all sources for a full-wavelength synthesis. Typical synthesis uses 100-1000 Å range → 10K-1M lines in fort.12.

---

## Common Architecture

All five readers share this structure:

### 1. Initialization

```fortran
OPEN(UNIT=12,STATUS='OLD',FORM='UNFORMATTED',ACCESS='APPEND')  ! Fort.12 output
OPEN(UNIT=14,STATUS='OLD',FORM='UNFORMATTED',ACCESS='APPEND')  ! Fort.14 (line metadata)
READ(93)NLINES,LENGTH,IFVAC,IFNLTE,N19,TURBV,DECKJ,IFPRED,     ! Read synbeg header
   1WLBEG,WLEND,RESOLU,RATIO,RATIOLG,CUTOFF,LINOUT
IXWLBEG=DLOG(WLBEG)/RATIOLG                                     ! Logarithmic wavelength grid start
IF(DEXP(IXWLBEG*RATIOLG).LT.WLBEG)IXWLBEG=IXWLBEG+1
```

**Fort.93**: Shared memory file containing synthesis parameters from `synbeg`. All readers read it, process lines, update `NLINES` count, and rewrite fort.93 with updated count.

### 2. Line Reading Loop

```fortran
DO ILINE=1,MAX_LINES
   READ(11,...)WL,GFLOG,E,EP,ISO,...     ! Read line from input database
   IF(WL.GT.WLEND+margin)GO TO exit_loop ! Wavelength filtering
   IF(WL.LT.WLBEG-margin)GO TO next_line

   ! Apply isotopic abundance corrections
   GF = EXP((GFLOG + X1 + X2 + FUDGE) * 2.30258509299405)

   ! Convert to fort.12 format
   NBUFF = wavelength_index
   CONGF = opacity_constant
   ELO = lower_energy
   NELION = species_code

   WRITE(12)NBUFF,CONGF,NELION,ELO,GAMRF,GAMSF,GAMWF,alpha
   NLINES = NLINES + 1
next_line:
   CONTINUE
END DO

exit_loop:
REWIND 93
WRITE(93)NLINES,LENGTH,IFVAC,... ! Update line count in shared state
```

### 3. Key Calculations

**Wavelength Index** (logarithmic grid):
```fortran
IXWL = DLOG(WLVAC)/RATIOLG + 0.5D0  ! Round to nearest grid point
NBUFF = IXWL - IXWLBEG + 1          ! Offset from grid start
```

**Opacity Constant** (combines gf-value with frequency):
```fortran
FREQ = 2.99792458E17/WLVAC      ! Hz
CONGF = 0.01502 * GF / FREQ     ! Constant for line opacity calculation
```

**Damping Parameters** (converted to per-frequency units):
```fortran
FRQ4PI = FREQ * 12.5664         ! 4π × frequency
GAMRF = GAMMAR / FRQ4PI         ! Radiative damping / (4πν)
GAMSF = GAMMAS / FRQ4PI         ! Stark damping / (4πν)
GAMWF = GAMMAW / FRQ4PI         ! van der Waals damping / (4πν)
```

**🐉 DRAGON**: The 0.01502 constant in CONGF calculation needs derivation. Expected from:
```
κ_line = (π e² / m_e c) × f × φ(ν) × N_lower
       ≈ 0.01502 × (gf/ν) × φ(ν) × N_lower  [in CGS units]
```
Need to verify this matches the opacity formula in spectrv.

### 4. Fort.14 Output (Optional)

If `LINOUT >= 0`, readers also write a "long form" record to fort.14:

```fortran
WRITE(14)LINDAT8,LINDAT4  ! Full line metadata (wavelength, energies, labels, etc.)
```

Fort.14 is used for line identification and diagnostics, not for synthesis. Many production runs set `LINOUT < 0` to skip this step and save disk space.

---

## rgfalllinesnew: Atomic Line Reader

**File**: `upstream/castelli/source_codes/synthe/rgfalllinesnew.for` (648 lines)

**Purpose**: Read atomic lines from Kurucz gfall format (ASCII, fixed-width columns)

### Input Format (Kurucz gfall)

The gfall format is documented in Kurucz's README files. Example line:

```
 2600.1720 -2.570 26.0  18500.123  3.5  57002.456  2.5 'a 5D      ' 'z 5P*     '
```

**Fortran READ statement**:
```fortran
READ(11,1111)WL,GFLOG,CODE,E,XJ,EP,XJP,IDENT,LABEL,LABELP
1111 FORMAT(F11.4,F7.3,F6.2,F12.3,F5.1,F12.3,F5.1,A1,A10,A10)
```

**Fields**:
- `WL` (F11.4): Wavelength in Angstroms (vacuum or air, depends on wavelength)
- `GFLOG` (F7.3): log₁₀(gf) - oscillator strength
- `CODE` (F6.2): Element.ion code (e.g., 26.00 = Fe I, 26.01 = Fe II)
- `E` (F12.3): Lower level energy (cm⁻¹)
- `XJ` (F5.1): Lower level J quantum number
- `EP` (F12.3): Upper level energy (cm⁻¹)
- `XJP` (F5.1): Upper level J quantum number
- `IDENT` (A1): Line identification flag
- `LABEL` (A10): Lower level term designation
- `LABELP` (A10): Upper level term designation

### Special Processing

**Predicted Line Filtering**:
```fortran
IF(IFPRED.EQ.0.AND.E.LT.0.)GO TO next_line    ! Skip if lower level is predicted
IF(IFPRED.EQ.0.AND.EP.LT.0.)GO TO next_line   ! Skip if upper level is predicted
```

Kurucz uses **negative energies** to flag predicted (not observed) levels. If `IFPRED=0`, these lines are excluded. If `IFPRED=1`, predicted lines are included.

**NELION Calculation** (element/ion code → array index):
```fortran
CALL NELION3(CODE,NELION,ATOM)
```

**🐉 DRAGON**: The `NELION3` subroutine is not in this file. Likely in ATLAS7V library. It maps element codes (1.00=H I, 1.01=H II, 6.00=C I, 26.00=Fe I, etc.) to sequential array indices (1, 2, 7, 67, ...).

**Broadening Parameters**:
rgfalllinesnew has the most sophisticated damping calculations:

```fortran
! Radiative damping from gfall (if provided)
IF(GAMMAR.GT.0.)GAMMAR=10.**GAMMAR

! Stark damping (enhanced for H I)
IF(NELEM.EQ.1.AND.ICHARGE.EQ.0)THEN
   GAMMAS=ALOG10(GAMMAS*15.)  ! H I: enhance by factor 15
ENDIF

! van der Waals damping (from ABO theory or quantum calculations)
! Complex logic for H I, alkalis, singly-ionized metals...
```

**🐉 DRAGON**: The damping calculation logic spans ~100 lines with many special cases. Need to cross-reference with damping theory (Unsöld, Barklem-O'Mara formulas) to verify correctness.

### Vacuum ↔ Air Wavelength

```fortran
IF(WL.LT.2000.)WLVAC=WL                    ! λ < 2000 Å: assume vacuum
IF(WL.GE.2000.)WLVAC=AIRWAV(WL)            ! λ ≥ 2000 Å: convert air → vacuum
```

**🐉 DRAGON**: The `AIRWAV` function is not in this file. Likely inverse of the Edlén formula seen in other readers.

### Key Code: Line Acceptance

```fortran
DO 2000 ILINE=1,99999999
   READ(11,1111,END=2001)WL,GFLOG,CODE,E,XJ,EP,XJP,IDENT,LABEL,LABELP
   IF(WLVAC.LT.START)GO TO 2000  ! Too blue
   IF(WLVAC.GT.STOP)GO TO 2001   ! Too red, exit

   CALL NELION3(CODE,NELION,ATOM)
   IF(NELION.EQ.0)GO TO 2000     ! Unknown element, skip

   ! Calculate gf with abundance corrections
   GF=10.**(GFLOG)*ABUND*ANJON

   ! Calculate damping widths
   CALL DAMPING(...)

   ! Write to fort.12
   FREQ=2.99792458E17/WLVAC
   CONGF=.01502*GF/FREQ
   GAMRF=GAMMAR/(FREQ*12.5664)
   GAMSF=GAMMAS/(FREQ*12.5664)
   GAMWF=GAMMAW/(FREQ*12.5664)
   WRITE(12)NBUFF,CONGF,NELION,ELO,GAMRF,GAMSF,GAMWF,alpha
   NLINES=NLINES+1
2000 CONTINUE
2001 WRITE(6,*)'LINES ADDED:',NLINES
```

---

## rmolecasc: Molecular Line Reader

**File**: `upstream/castelli/source_codes/synthe/rmolecasc.for` (570 lines)

**Purpose**: Read molecular lines from ASCII format with isotope-specific abundance corrections

### Input Format

```fortran
READ(11,1111,END=2001)WL,GFLOG,XJ,E,XJP,EP,ICODE,LABEL(1),LABELP(1),ISO,LOGGR
1111 FORMAT(F10.4,F7.3,F5.1,F10.3,F5.1,F11.3,I4,A8,A8,I2,I4)
```

**Fields**:
- `WL` (F10.4): Wavelength (Å)
- `GFLOG` (F7.3): log₁₀(gf)
- `XJ` (F5.1): Lower J
- `E` (F10.3): Lower energy (cm⁻¹)
- `XJP` (F5.1): Upper J
- `EP` (F11.3): Upper energy (cm⁻¹)
- `ICODE` (I4): Molecular system code (606=C₂, 608=CO, 814=SiO, etc.)
- `LABEL` (A8): Lower level label
- `LABELP` (A8): Upper level label
- `ISO` (I2): Isotope code (see table below)
- `LOGGR` (I4): log₁₀(Γ_rad) × 100 (radiative damping)

### Isotope Mapping

The core of rmolecasc is a **giant GO TO dispatcher** that maps ISO codes to molecule species:

```fortran
GO TO (10,20,99,99,...,540,99,560,570,580,99,99,99),ISO
!     H2 HD             C2      FeH    FeH FeH FeH
```

Each label sets:
- `NELION`: Species code for fort.12
- `ISO1`, `ISO2`: Isotope masses for both atoms
- `X1`, `X2`: Abundance corrections (log₁₀)
- `FUDGE`: Optional empirical correction

**Example: ¹²C¹⁶O (ISO=17)**:
```fortran
170 NELION=276          ! CO species code
    FUDGE=0.00
    ISO1=12             ! Carbon-12
    ISO2=17             ! Oxygen-17
    X1=-0.005           ! log₁₀([¹²C/C_solar])
    X2=-3.398           ! log₁₀([¹⁷O/O_solar])
    GO TO 5000
```

**Abundance-Corrected gf-value**:
```fortran
5000 GF=EXP((GFLOG+X1+X2+FUDGE)*2.30258509299405E0)
```

The `2.30258...` constant is ln(10) for converting log₁₀ → natural log.

**Supported Molecules** (excerpt):

| ISO | Molecule | NELION | Notes |
|-----|----------|--------|-------|
| 1 | ¹H₂ | 240 | Most abundant H₂ isotopologue |
| 2 | HD | 240 | Deuterated hydrogen |
| 12-13 | CN | 270 | Multiple isotopologues (¹²C¹⁴N, ¹³C¹⁴N) |
| 14-15 | NH | 252 | ¹⁴N¹H, ¹⁵N¹H |
| 16-18 | OH | 258 | ¹⁶O¹H, ¹⁸O¹H |
| 17 | ¹²C¹⁶O | 276 | Carbon monoxide |
| 24-26 | MgH | 300 | Multiple Mg isotopes |
| 28-30 | SiH | 312 | Multiple Si isotopes |
| 40-48 | CaH | 342 | Ca isotopes (40, 42, 43, 44, 46, 48) |
| 46-50 | TiO | 366 | Multiple Ti isotopes with ¹⁶O |
| 50-58 | Various | 432/444 | CrH, FeH |

**Total Coverage**: ~60 isotopologue combinations across ~25 molecular systems.

### Vacuum Wavelength Calculation

```fortran
IF(IFVAC.EQ.1)WLVAC=1.E7/ABS(ABS(EP)-ABS(E))  ! Compute from energies
```

If `IFVAC=1`, wavelength is computed from energy difference rather than using the input WL field. This ensures consistency with vacuum wavenumbers.

### Damping Widths (Guessed)

Molecular damping is less well-characterized than atomic:

```fortran
GAMMAR=10.**(LOGGR*.01)      ! From input data (if available)

! Default guesses for collisional broadening:
GAMMAS=3.E-5                 ! Stark (electron collisions)
GAMMAW=1.E-7                 ! van der Waals (H collisions)

! Vibration-rotation bands: smaller collisional widths
IF(CLABELP(1:1).EQ.'X')THEN  ! If lower state label starts with 'X'
   GAMMAS=3.E-8
   GAMMAW=1.E-8
ENDIF
```

**🐉 DRAGON**: The heuristic `CLABELP(1:1).EQ.'X'` assumes that states labeled "X..." are ground electronic states with different collisional cross-sections. This is fragile and should be replaced with a lookup table or quantum chemistry calculations.

---

## rschwenk: TiO Line Reader

**File**: `upstream/castelli/source_codes/synthe/rschwenk.for` (223 lines)

**Purpose**: Read TiO lines from Schwenke's **packed binary format** (direct-access)

### Binary Format

```fortran
OPEN(UNIT=11,STATUS='OLD',READONLY,SHARED,FORM='UNFORMATTED',
   1RECORDTYPE='FIXED',BLOCKSIZE=8000,RECORDSIZE=4,ACCESS='DIRECT')
```

**Record Structure** (4 bytes per record, 4 records per line = 16 bytes/line):

```fortran
READ(11,REC=ILINE)IIIIIII
! IIIIIII is a 16-byte structure containing:
! - IWL (4 bytes): Wavelength index (integer, log-spaced)
! - IELION (2 bytes): Species/isotope code
! - IELO (2 bytes): Lower energy (packed as integer)
! - IGFLOG (2 bytes): log₁₀(gf) (packed as integer)
! - IGR (2 bytes): log₁₀(Γ_rad) (packed)
! - IGS (2 bytes): log₁₀(Γ_Stark) (packed)
! - IGW (2 bytes): log₁₀(Γ_vdW) (packed)
```

**Unpacking via Lookup Table**:

To save space, Schwenke encodes floating-point values as 16-bit integers, then decodes via:

```fortran
TABLOG(I)=10.**((I-16384)*.001)  ! Maps integer I to 10^((I-16384)/1000)
```

For example:
- `IELO=16384` → `TABLOG(16384)=10^0=1.0 cm⁻¹`
- `IELO=20384` → `TABLOG(20384)=10^4=10,000 cm⁻¹`

This gives ~3 decimal digits of precision over 8 orders of magnitude.

**Wavelength Decoding**:

```fortran
RATIOLOG=LOG(1.D0+1.D0/2000000.D0)  ! Resolving power R=2,000,000
WLVAC=EXP(IWL*RATIOLOG)              ! λ = exp(IWL × Δλ)
```

**Isotope Identification**:

```fortran
ISO=ABS(IELION)-8949  ! IELION codes: 8950-8954 for TiO isotopologues
ISO2=ISO+45            ! Titanium mass: 46, 47, 48, 49, 50

! Isotope-specific abundance corrections:
DATA XISO/.0793,.0728,.7394,.0551,.0534/         ! Relative abundances
DATA X2ISO/-1.101,-1.138,-0.131,-1.259,-1.272/   ! log([Ti_i]/[Ti_solar])
```

### Level Information from Binary Database

rschwenk reads a **separate binary file** (fort.48) with energy level metadata:

```fortran
OPEN(UNIT=48,TYPE='OLD',FORM='UNFORMATTED',READONLY)
READ(48)ETIO,XJTIO,STATETIO
CLOSE(UNIT=48)

! Later, decode level indices to energies:
E=ETIO(LEVELLO,ISO)
EP=ETIO(LEVELUP,ISO)
XJ=XJTIO(LEVELLO)
XJP=XJTIO(LEVELUP)
LABEL(1)=STATETIO(LEVELLO,ISO)
LABELP(1)=STATETIO(LEVELUP,ISO)
```

**Array Dimensions**:
```fortran
REAL*8 ETIO(269300,5)      ! Energies for 269,300 levels × 5 isotopes
REAL*4 XJTIO(269300)       ! J quantum numbers (same for all isotopes)
REAL*8 STATETIO(269300,5)  ! State labels (character data stored as REAL*8)
```

**Total Memory**: ~10 MB for level database. This is loaded once at startup.

### Binary Search for Wavelength Range

rschwenk uses **binary search** to find the first line in the wavelength range:

```fortran
LIMITBLUE=1
LIMITRED=LENGTHFILE
12 NEWLIMIT=(LIMITRED+LIMITBLUE)/2
   READ(11,REC=NEWLIMIT)IWL
   IF(IWL.LT.ISTART)GO TO 13
   LIMITRED=NEWLIMIT
   IF(LIMITRED-LIMITBLUE.LE.1)GO TO 14
   GO TO 12
13 LIMITBLUE=NEWLIMIT
   IF(LIMITRED-LIMITBLUE.LE.1)GO TO 14
   GO TO 12
14 ISTART=NEWLIMIT  ! Found first line
```

This is **critical for performance** when the TiO database has 50M lines but you only need 100 Å.

### Hardcoded Damping Overrides

```fortran
! Schwenke provides Γ_S and Γ_W in the binary file, but rschwenk OVERRIDES them:
IGS=1        ! log₁₀(Γ_Stark) = -9.99 (essentially zero)
IGW=9384     ! log₁₀(Γ_vdW) = -7.0

GAMSF=TABLOG(IGS)/FRQ4PI
GAMWF=TABLOG(IGW)/FRQ4PI
```

**🐉 DRAGON**: Why override the Schwenke damping values? Need to check if Schwenke's widths are incorrect or if these defaults are more appropriate for stellar atmospheres.

---

## rh2ofast: H2O Line Reader

**File**: `upstream/castelli/source_codes/synthe/rh2ofast.for` (191 lines)

**Purpose**: Read H₂O lines from Partridge-Schwenke **ultra-compact binary format**

### Binary Format (Even More Compact)

```fortran
OPEN(UNIT=11,STATUS='OLD',READONLY,SHARED,FORM='UNFORMATTED',
   1RECORDTYPE='FIXED',RECORDSIZE=2,ACCESS='DIRECT')  ! Only 2 bytes per field!
```

**Record Structure** (8 bytes per line):

```fortran
READ(11,REC=ILINE)IWL,IELO,IGFLOG
! - IWL (4 bytes): Wavelength index
! - IELO (2 bytes): Lower energy (signed, encodes isotope)
! - IGFLOG (2 bytes): log₁₀(gf) (signed, encodes isotope)
```

**Isotope Encoding via Sign Bits**:

Partridge-Schwenke uses the **sign** of IELO and IGFLOG to encode isotopologue:

```fortran
ISO=1  ! Default: ¹H₂¹⁶O
IF(IELO.GT.0.AND.IGFLOG.GT.0)GO TO 19  ! Both positive → ¹H₂¹⁶O
ISO=2
IF(IELO.GT.0)GO TO 19                  ! Only IELO positive → ¹H₂¹⁷O
ISO=3
IF(IGFLOG.GT.0)GO TO 19                ! Only IGFLOG positive → ¹H₂¹⁸O
ISO=4                                  ! Both negative → ¹H²H¹⁶O (HDO)

19 ELO=ABS(IELO)
   IGFLOG=ABS(IGFLOG)
```

**Isotope Abundances**:
```fortran
DATA XISO/  .9976,  .0004,  .0020, .00001/  ! Relative abundances
DATA X2ISO/-0.001, -3.398, -2.690, -5.000/  ! log([isotope]/[solar])
```

**Total File Size**: 66M lines × 8 bytes = 528 MB (uncompressed)

### Radiative Damping Formula

H₂O damping is estimated from wavelength:

```fortran
GAMMAR=2.223E13/WLVAC**2*.001  ! Γ_rad ≈ 2.223×10^10 / λ² [s⁻¹]
```

This is the **classical dipole formula**:
```
Γ = (e²/m_e c³) × ω² = (e²/m_e c³) × (2πc/λ)²
```

**🐉 DRAGON**: Need to verify the constant 2.223E13 matches the theoretical value from fundamental constants.

### Vacuum ↔ Air Conversion (Edlén Formula)

rh2ofast includes a vacuum→air converter:

```fortran
FUNCTION VACAIR(W)
   WAVEN=1.D7/W  ! Wavenumber in cm⁻¹
   VACAIR=W/(1.0000834213D0 +
      1 2406030.D0/(1.30D10-WAVEN**2) + 15997.D0/(3.89D9-WAVEN**2))
   RETURN
END
```

This is the **Edlén (1953) formula** with updated coefficients. It's valid for 200-2000 nm.

**Pre-computed Shift Table**:

To avoid recomputing VACAIR for every line, rh2ofast uses a lookup table:

```fortran
SUBROUTINE TABVACAIR(AIRSHIFT)
   REAL*4 AIRSHIFT(100000)
   DO IWL=1,1999
      AIRSHIFT(IWL)=0.         ! λ < 200 nm: no correction
   END DO
   DO IWL=2000,100000
      WLVAC=IWL*.1             ! Grid: 0.1 nm spacing
      AIRSHIFT(IWL)=VACAIR(WLVAC)-WLVAC  ! Pre-compute shift
   END DO
END

! Later, apply shift via table lookup:
KWL=WLVAC*10.+.5              ! Index in 0.1 nm grid
WLVAC=WLVAC+AIRSHIFT(KWL)     ! Apply correction
```

**Memory**: 100K × 4 bytes = 400 KB for shift table.

### Fixed Line Count

```fortran
LENGTHFILE=65912356  ! Hardcoded: 66 million lines
```

**🐉 DRAGON**: This assumes a specific version of the Partridge-Schwenke database. If the database is updated, this constant must change. Better to determine file length dynamically.

---

## rpredict: Predicted Line Reader

**File**: `upstream/castelli/source_codes/synthe/rpredict.for` (451 lines)

**Purpose**: Read **predicted atomic lines** from Kurucz's binary-packed format

### Purpose of Predicted Lines

Kurucz's predicted lines fill gaps in the observed atomic data:
- High-excitation levels not seen in lab spectra
- Weak transitions (gf < 10⁻⁶) below detection limits
- Transitions from metastable states

These lines can be **important in hot stars** (A/B-type) where high excitation levels are populated.

### Binary Format (Same as rschwenk)

```fortran
OPEN(UNIT=11,STATUS='OLD',READONLY,SHARED,FORM='UNFORMATTED',
   1RECORDTYPE='FIXED',BLOCKSIZE=8000,RECORDSIZE=4,ACCESS='DIRECT')

READ(11,REC=N)IIIIIII
! Same 16-byte packed structure as rschwenk
```

### Filtering Positive IELION

rpredict **skips lines that are also in gfall**:

```fortran
IF(IELION.GT.0)GO TO 20  ! Positive IELION → line is also in gfall, skip it
```

Kurucz uses **negative IELION** to mark lines that are **only** in the predicted database. Positive IELION means the line exists in both databases → rgfalllinesnew already added it.

**This prevents duplicates** between rgfalllinesnew and rpredict.

### NELION Mapping Table

rpredict contains a **1005-element array** mapping Kurucz's internal species codes to NELION:

```fortran
DIMENSION NELIONOLD(1005)
DATA NELIONOLDA/
   1   1,  2,              ! H I, H II
   2   7,  8,  9,          ! He I, He II, He III
   3  13, 14, 15, 16,      ! Li I-IV
   ...
```

**Structure**:
- Elements 1-99: Atomic species (H I, He I, Li I, ...)
- Elements 100-839: Molecular species (H₂, CH, CO, TiO, ...)
- Elements 840-1005: Molecular ions and special cases

**Example**:
- `NELIONOLD(1)=1` → H I
- `NELIONOLD(26)=26` → Mg I (element 12, ionization stage 0)
- `NELIONOLD(841)=240` → H₂
- `NELIONOLD(895)=366` → TiO

### Wavelength Calculation

Unlike other readers, rpredict **computes wavelength from energies**:

```fortran
WLVAC=EXP(IWL*RATIOLOG)          ! Decode packed wavelength
WL=WLVAC                         ! Default: vacuum
IF(IFVAC.EQ.0)WL=VACAIR(WL)      ! Convert to air if needed

! For fort.12 index, use correct frame:
IXWL=DLOG(WLVAC)/RATIOLG+.5D0   ! Vacuum index
IF(IFVAC.EQ.0)IXWL=DLOG(WL)/RATIOLG+.5D0  ! Air index
```

**🐉 DRAGON**: This mixing of vacuum/air frames is error-prone. Need to verify that spectrv and xnfpelsyn use consistent conventions.

---

## Fort.12 Output Format

All five readers write the **same 8-field record** to fort.12:

```fortran
WRITE(12)NBUFF,CONGF,NELION,ELO,GAMRF,GAMSF,GAMWF,alpha
```

**Fields**:

| Field | Type | Units | Description |
|-------|------|-------|-------------|
| NBUFF | INTEGER | - | Wavelength bin index (offset from IXWLBEG) |
| CONGF | REAL*4 | - | Opacity constant = 0.01502 × gf / ν |
| NELION | INTEGER | - | Species code (1=H I, 26=Mg I, 240=H₂, 366=TiO, 534=H₂O) |
| ELO | REAL*4 | cm⁻¹ | Lower level energy |
| GAMRF | REAL*4 | s⁻¹/(4πν) | Radiative damping / (4π × frequency) |
| GAMSF | REAL*4 | s⁻¹/(4πν) | Stark damping / (4π × frequency) |
| GAMWF | REAL*4 | s⁻¹/(4πν) | van der Waals damping / (4π × frequency) |
| alpha | REAL*4 | - | Reserved (always 0.0 in current code) |

**Record Size**: 8 fields × 4 bytes = **32 bytes per line**

**Typical File Sizes**:
- 10K lines: 320 KB
- 100K lines: 3.2 MB
- 1M lines: 32 MB
- 10M lines: 320 MB

### NBUFF Encoding

`NBUFF` encodes wavelength as an **integer offset** into the logarithmic grid:

```fortran
WLGRID(i) = WLBEG × (1 + 1/RESOLU)^(i-1)  ! Geometric series
NBUFF = i  ! Integer index
```

This allows spectrv to use **integer arithmetic** for wavelength binning, avoiding floating-point precision issues.

**Inverse Calculation** (in spectrv):
```fortran
WAVE = WLBEG * EXP((NBUFF-1) * RATIOLG)  ! Reconstruct wavelength from index
```

### Why Damping is Pre-divided by 4πν

The Voigt profile formula in spectrv expects damping widths in frequency units:

```
φ(ν) = Voigt(ν - ν₀, Δν_D, Γ/(4π))
```

By storing `GAMRF = Γ_rad / (4πν₀)`, spectrv can use `GAMRF` directly in the profile calculation without recomputing 4πν for every line.

---

## Common Code Patterns

### 1. Binary Search for Wavelength Range

Both rschwenk and rh2ofast use binary search to skip to the first line in the wavelength range. This is **essential** for performance with multi-million line databases.

**Julia Translation**:
```julia
function find_first_line(file, λ_start_index, n_lines)
    lo, hi = 1, n_lines
    while hi - lo > 1
        mid = (lo + hi) ÷ 2
        λ_index = read_wavelength_index(file, mid)
        if λ_index < λ_start_index
            lo = mid
        else
            hi = mid
        end
    end
    return hi
end
```

### 2. Logarithmic Wavelength Grids

All readers use:

```fortran
IXWL = DLOG(WLVAC) / RATIOLG + 0.5D0
```

**Derivation**:
```
λ_i = λ_0 × (1 + 1/R)^(i-1)
ln(λ_i) = ln(λ_0) + (i-1) × ln(1 + 1/R)
i = ln(λ_i / λ_0) / ln(1 + 1/R) + 1
  = ln(λ_i) / RATIOLG - ln(λ_0) / RATIOLG + 1
```

The `+0.5D0` is for **rounding to nearest integer**.

**Julia Translation**:
```julia
ratiolg = log(1.0 + 1.0/resolving_power)
ix = round(Int, log(λ_vac) / ratiolg) + 1
```

### 3. Abundance Corrections

Molecular readers apply **isotopic abundance corrections**:

```fortran
GF = EXP((GFLOG + X1 + X2 + FUDGE) * 2.30258509299405)
```

Where:
- `GFLOG`: log₁₀(gf) from database
- `X1`: log₁₀([isotope1]/[element1_solar])
- `X2`: log₁₀([isotope2]/[element2_solar])
- `FUDGE`: Optional empirical correction
- `2.3025...`: ln(10) for log₁₀ → ln conversion

**Example** (¹²C¹⁶O):
```
GFLOG = -2.5      (from database)
X1 = -0.005       (¹²C is slightly below solar C)
X2 = -0.001       (¹⁶O is slightly below solar O)
FUDGE = 0.0
→ GF = 10^(-2.5 - 0.005 - 0.001) = 10^(-2.506) = 0.003116
```

**Julia Translation**:
```julia
function abundance_corrected_gf(log_gf, x1, x2, fudge=0.0)
    return 10.0^(log_gf + x1 + x2 + fudge)
end
```

### 4. Vacuum-Air Conversion Tables

rh2ofast pre-computes vacuum→air shifts in a lookup table to avoid repeated function calls:

```fortran
DO IWL=2000,100000
   WLVAC=IWL*0.1
   AIRSHIFT(IWL)=VACAIR(WLVAC)-WLVAC
END DO
```

**Julia Translation**:
```julia
function build_vacair_table(λ_max_nm=10000.0, step_nm=0.1)
    n = round(Int, λ_max_nm / step_nm)
    table = Vector{Float32}(undef, n)
    for i in 1:n
        λ_vac = i * step_nm
        if λ_vac < 200.0
            table[i] = 0.0
        else
            table[i] = vacair(λ_vac) - λ_vac
        end
    end
    return table
end

# Later:
λ_air = λ_vac + table[round(Int, λ_vac / 0.1)]
```

---

## Migration Strategy

### Phase 1: Line Reader Abstractions (Week 1-2)

**1.1 Define Common Interface**:

```julia
abstract type LineReader end

struct LineRecord
    λ_vac::Float64          # Vacuum wavelength (Å)
    log_gf::Float64         # log₁₀(gf)
    species::Int            # NELION code
    E_lower::Float64        # Lower level energy (cm⁻¹)
    E_upper::Float64        # Upper level energy (cm⁻¹)
    J_lower::Float64        # Lower J
    J_upper::Float64        # Upper J
    Γ_rad::Float64          # Radiative damping (s⁻¹)
    Γ_stark::Float64        # Stark damping (s⁻¹)
    Γ_vdw::Float64          # van der Waals damping (s⁻¹)
    label_lower::String     # Term designation (lower)
    label_upper::String     # Term designation (upper)
end

function read_lines(reader::LineReader, λ_min::Float64, λ_max::Float64)
    # Returns iterator over LineRecord
end
```

**1.2 Implement Vacuum↔Air Utilities**:

```julia
module WavelengthConversion
    """Edlén (1953) vacuum → air formula"""
    function vac_to_air(λ_vac_nm::Float64)
        if λ_vac_nm < 200.0
            return λ_vac_nm
        end
        σ = 1e7 / λ_vac_nm  # Wavenumber in cm⁻¹
        n = 1.0000834213 +
            2406030.0 / (1.30e10 - σ^2) +
            15997.0 / (3.89e9 - σ^2)
        return λ_vac_nm / n
    end

    """Inverse: air → vacuum"""
    function air_to_vac(λ_air_nm::Float64)
        # Iterative solver (Newton-Raphson)
        λ_vac = λ_air_nm
        for _ in 1:3
            λ_vac = λ_air_nm * (1.0000834213 + ...)
        end
        return λ_vac
    end
end
```

### Phase 2: ASCII Readers (Week 3-4)

**2.1 rgfalllinesnew (Atomic Lines)**:

```julia
struct KuruczGfallReader <: LineReader
    filename::String
    abundance::Dict{Int,Float64}  # Element → abundance factor
    damping_config::DampingConfig
end

function read_lines(reader::KuruczGfallReader, λ_min, λ_max)
    Channel() do ch
        open(reader.filename) do file
            for line in eachline(file)
                record = parse_gfall_line(line)
                if λ_min ≤ record.λ_vac ≤ λ_max
                    put!(ch, record)
                end
            end
        end
    end
end

function parse_gfall_line(line::String)
    # Fixed-width format parsing
    wl = parse(Float64, line[1:11])
    log_gf = parse(Float64, line[12:18])
    code = parse(Float64, line[19:24])
    # ... etc
    return LineRecord(...)
end
```

**2.2 rmolecasc (Molecular Lines)**:

```julia
struct MolecularLineReader <: LineReader
    filename::String
    isotope_abundances::Dict{Tuple{Int,Int},Float64}  # (ISO1,ISO2) → abundance
end

# Isotope mapping table (from rmolecasc lines 23-552)
const ISO_TO_NELION = Dict(
    1 => (240, (1,1), (0.0, -5.0)),      # H₂
    12 => (270, (12,14), (-0.005, -0.002)),  # ¹²C¹⁴N
    # ... 60 entries
)
```

### Phase 3: Binary Readers (Week 5-7)

**3.1 Packed Binary Decoder**:

```julia
"""Decode Kurucz/Schwenke packed integers"""
function decode_tablog(i::Int16)
    return 10.0^((i - 16384) * 0.001)
end

struct PackedLineRecord
    iwl::Int32
    ielion::Int16
    ielo::Int16
    igflog::Int16
    igr::Int16
    igs::Int16
    igw::Int16
end

function unpack(rec::PackedLineRecord, ratiolg::Float64)
    λ_vac = exp(rec.iwl * ratiolg)
    E_lower = decode_tablog(rec.ielo)
    log_gf = (rec.igflog - 16384) * 0.001
    Γ_rad = decode_tablog(rec.igr)
    # ... etc
    return LineRecord(...)
end
```

**3.2 rschwenk (TiO)**:

```julia
struct SchwenkeTiOReader <: LineReader
    linelist_file::String
    leveldb_file::String
    isotope::Int  # 1-5 for Ti isotopes
end

function load_level_database(filename::String)
    # Read ETIO, XJTIO, STATETIO arrays
    # Return LevelDatabase struct
end
```

**3.3 rh2ofast (H₂O)**:

```julia
struct PartridgeSchwenkeH2OReader <: LineReader
    filename::String
    vacair_table::Vector{Float32}  # Pre-computed shifts
end

function decode_h2o_isotope(ielo::Int16, igflog::Int16)
    if ielo > 0 && igflog > 0
        return 1  # ¹H₂¹⁶O
    elseif ielo > 0
        return 2  # ¹H₂¹⁷O
    elseif igflog > 0
        return 3  # ¹H₂¹⁸O
    else
        return 4  # HDO
    end
end
```

### Phase 4: Fort.12 Writer (Week 8)

**4.1 Binary Output Format**:

```julia
struct Fort12Writer
    io::IOStream
    λ_min::Float64
    resolu::Float64
    ratiolg::Float64
    ixwlbeg::Int
end

function write_line(writer::Fort12Writer, record::LineRecord)
    # Convert to fort.12 format
    ixwl = round(Int, log(record.λ_vac) / writer.ratiolg)
    nbuff = ixwl - writer.ixwlbeg + 1

    freq = 2.99792458e17 / record.λ_vac
    congf = 0.01502 * 10.0^record.log_gf / freq

    frq4pi = freq * 12.5664
    gamrf = record.Γ_rad / frq4pi
    gamsf = record.Γ_stark / frq4pi
    gamwf = record.Γ_vdw / frq4pi

    write(writer.io, Int32(nbuff))
    write(writer.io, Float32(congf))
    write(writer.io, Int32(record.species))
    write(writer.io, Float32(record.E_lower))
    write(writer.io, Float32(gamrf))
    write(writer.io, Float32(gamsf))
    write(writer.io, Float32(gamwf))
    write(writer.io, Float32(0.0))  # alpha (reserved)
end
```

**4.2 Pipeline Coordinator**:

```julia
function build_line_list(output_file::String, config::SynthesisConfig)
    readers = [
        KuruczGfallReader("gfall.dat"),
        MolecularLineReader("molecular.dat"),
        SchwenkeTiOReader("tio.bin", "tio_levels.bin"),
        PartridgeSchwenkeH2OReader("h2o.bin"),
    ]

    writer = Fort12Writer(output_file, config)

    for reader in readers
        for line in read_lines(reader, config.λ_min, config.λ_max)
            write_line(writer, line)
        end
    end

    close(writer)
end
```

### Phase 5: Validation (Week 9-10)

**Test Cases**:

1. **Format Parsing**: Verify each reader correctly parses 1000 sample lines from each database
2. **Abundance Corrections**: Check isotope abundance factors match published values
3. **Wavelength Binning**: Ensure NBUFF calculation matches Fortran for all wavelengths
4. **Damping Widths**: Validate Γ calculations against theory (Unsöld, Barklem, etc.)
5. **Binary Compatibility**: Read Fortran-written fort.12 with Julia, compare to reference
6. **Performance**: Benchmark reading 1M lines (target: <1s for ASCII, <0.1s for binary)

---

## Testing Strategy

### Unit Tests

**1. Wavelength Conversion**:
```julia
@testset "Vacuum-Air Conversion" begin
    # Test case from NIST (sodium D line)
    λ_vac_D2 = 588.9950  # nm (vacuum)
    λ_air_D2 = 588.9950 / 1.0002926  # Expected air wavelength
    @test isapprox(vac_to_air(λ_vac_D2), λ_air_D2, rtol=1e-6)

    # Round-trip test
    @test isapprox(air_to_vac(vac_to_air(500.0)), 500.0, rtol=1e-8)
end
```

**2. Isotope Abundance**:
```julia
@testset "CO Isotope Correction" begin
    # ¹²C¹⁶O: X1=-0.005, X2=-0.001
    gf = abundance_corrected_gf(-2.5, -0.005, -0.001)
    @test isapprox(gf, 10.0^(-2.506), rtol=1e-10)
end
```

**3. NBUFF Calculation**:
```julia
@testset "Wavelength Binning" begin
    resolu = 300000.0
    ratiolg = log(1.0 + 1.0/resolu)
    wlbeg = 5000.0
    ixwlbeg = round(Int, log(wlbeg) / ratiolg)

    # Test line at 5001 Å
    λ = 5001.0
    ixwl = round(Int, log(λ) / ratiolg)
    nbuff = ixwl - ixwlbeg + 1

    # Reconstruct wavelength
    λ_recon = exp((ixwlbeg + nbuff - 1) * ratiolg)
    @test isapprox(λ_recon, λ, rtol=1e-6)
end
```

### Integration Tests

**1. Read-Write Round Trip**:
```julia
@testset "Fort.12 Round Trip" begin
    # Create test lines
    lines = [
        LineRecord(5000.0, -2.5, 26, 10000.0, ...),
        LineRecord(5001.0, -3.0, 67, 20000.0, ...),
    ]

    # Write to fort.12
    write_fort12("test.fort12", lines, config)

    # Read back
    lines_read = read_fort12("test.fort12")

    # Compare (allowing for rounding)
    @test length(lines_read) == length(lines)
    for (orig, read) in zip(lines, lines_read)
        @test isapprox(orig.λ_vac, read.λ_vac, rtol=1e-5)
        @test orig.species == read.species
    end
end
```

**2. Compare Against Fortran Reference**:
```julia
@testset "Fortran Compatibility" begin
    # Run Fortran rgfalllinesnew on test data
    run(`./rgfalllinesnew < test_input.dat`)

    # Run Julia reader on same data
    julia_lines = read_gfall("test_input.dat", config)

    # Read Fortran output
    fortran_fort12 = read_fort12("fort.12")

    # Compare line-by-line
    @test length(julia_lines) == length(fortran_fort12)
    for (j, f) in zip(julia_lines, fortran_fort12)
        @test j.nbuff == f.nbuff
        @test isapprox(j.congf, f.congf, rtol=1e-6)
    end
end
```

### Performance Benchmarks

**Target Performance**:

| Operation | Input Size | Target Time | Memory |
|-----------|------------|-------------|--------|
| Read gfall (ASCII) | 1M lines | <2s | <500 MB |
| Read TiO (binary) | 10M lines | <1s | <1 GB |
| Read H₂O (binary) | 66M lines | <5s | <3 GB |
| Write fort.12 | 100K lines | <0.1s | <50 MB |
| Binary search (TiO) | 50M lines | <100 ms | <100 MB |

**Benchmark Code**:
```julia
using BenchmarkTools

@benchmark read_lines(gfall_reader, 5000.0, 6000.0)
# Expected: ~500 ms for 100K lines in range from 60M line file
```

---

## Open Questions

### 🐉 Format Archaeology

1. **CONGF Constant Derivation**: Where does 0.01502 come from? Need to derive from:
   ```
   κ_line = (π e² / m_e c) × f × φ(ν) × N_lower
   ```
   in CGS units with appropriate unit conversions.

2. **Alpha Parameter**: Fort.12 has an 8th field `alpha` that's always 0.0. What was it intended for? Check SYNTHE documentation.

3. **NELION3 Subroutine**: Not found in synthe source. Must be in ATLAS7V library. Need to extract and document the element→NELION mapping.

4. **AIRWAV Function**: Referenced in rgfalllinesnew but not defined. Is it the inverse of VACAIR?

### 🐉 Damping Parameters

5. **Schwenke Damping Override**: Why does rschwenk replace Schwenke's Γ_S and Γ_W with hardcoded defaults? Are the database values incorrect?

6. **Molecular Damping Guesses**: rmolecasc uses `GAMMAS=3E-5, GAMMAW=1E-7` for electronic transitions and `3E-8, 1E-8` for vibration-rotation. What's the theoretical basis?

7. **H₂O Radiative Damping**: The formula `Γ_rad = 2.223E13 / λ²` - verify constant against classical dipole formula.

8. **Gaussian Broadening Constant**: In broaden.for (Deep Dive 11), the constant 0.8325546×2 doesn't match the expected 2.3548 for FWHM→σ. Same constant used in line broadening?

### 🐉 Isotope Abundances

9. **Abundance Source**: Where do the X1, X2 isotope corrections come from? Need references (Asplund 2009? Anders-Grevesse?).

10. **FUDGE Factors**: rmolecasc has `FUDGE=0.00` for all molecules currently, but the infrastructure exists. Were empirical corrections applied in older versions?

11. **HD Abundance**: rmolecasc uses `X2=-4.469` for deuterium in HD. Is this consistent with [D/H] = 1.5×10⁻⁵ (solar system)?

### 🐉 Binary Format Endianness

12. **Byte Swapping**: rschwenk and rh2ofast have commented-out byte-swapping code. On which architectures is this needed? Big-endian vs little-endian?

13. **EQUIVALENCE Tricks**: Fortran EQUIVALENCE is used to overlay INTEGER*2 and INTEGER*4. How to handle in Julia (use reinterpret)?

### 🐉 Performance

14. **Memory Mapping**: The binary readers use direct-access files. Would memory-mapped I/O improve performance in Julia?

15. **Parallel Reading**: Could the five readers run in parallel, each writing to a separate temporary fort.12, then concatenate?

16. **Line Sorting**: Fort.12 is unsorted (order depends on reader invocation sequence). Would sorting by wavelength improve spectrv cache performance?

---

## Key Takeaways

### For Developers

1. **Format Diversity is the Challenge**: Five different input formats (ASCII fixed-width, ASCII free-form, binary packed INT16, binary packed INT32, direct-access binary) require format-specific parsers. Use a common `LineReader` interface to hide complexity.

2. **Isotope Corrections are Hardcoded**: rmolecasc has a ~400-line GO TO dispatcher with isotope abundance tables. Extract this into a data file (TOML/JSON) for maintainability.

3. **Binary Search is Critical**: For multi-million line databases, binary search reduces read time from hours to seconds. Implement efficient range queries in Julia.

4. **Vacuum vs Air is Fragile**: Each reader handles vacuum↔air conversion differently. Standardize on **vacuum wavelengths internally**, convert only for output if needed.

5. **Fort.12 is Not Self-Describing**: No header, no checksums, no version tag. If NBUFF calculation changes, old fort.12 files are silently incompatible with new spectrv. Consider adding a header in Julia version.

### For Migration

1. **Start with ASCII Readers**: rgfalllinesnew and rmolecasc are easier to debug (human-readable input). Validate against small test cases before tackling binary formats.

2. **Defer Damping Calculations**: The complex damping logic in rgfalllinesnew can be approximated initially. Focus on wavelength, gf, and energy fields first.

3. **Use Reference Files**: Keep Fortran-generated fort.12 as regression tests. Julia readers must produce byte-identical output.

4. **Separate Concerns**: Line reading → filtering → abundance correction → format conversion should be separate pipeline stages for testability.

5. **Parallelize Where Possible**: Reading H₂O (66M lines) is I/O-bound. Use Julia's `@threads` or `Channel` for concurrent processing.

### For Users

1. **Line List Selection Matters**: Including H₂O and TiO adds ~100M lines to fort.12 for a full optical spectrum. For hot stars (no molecules), skip rmolecasc/rschwenk/rh2ofast to save time.

2. **Wavelength Range**: Narrow wavelength ranges dramatically reduce processing time. A 100 Å window might need only 10K lines vs 1M for full optical.

3. **Predicted Lines**: Set `IFPRED=1` only for hot stars with high excitation. For cool stars, predicted lines add clutter without improving accuracy.

4. **Database Versions**: Kurucz updates gfall periodically. Document which version was used for reproducibility.

5. **Molecular Data Quality**: TiO (Schwenke) and H₂O (Partridge-Schwenke) are well-validated. Other molecules in rmolecasc may have larger uncertainties.

---

## Appendices

### A. NELION Code Reference (Partial)

| NELION | Species | Description |
|--------|---------|-------------|
| 1 | H I | Neutral hydrogen |
| 2 | H II | Ionized hydrogen (protons) |
| 7 | He I | Neutral helium |
| 26 | Mg I | Neutral magnesium |
| 67 | Fe I | Neutral iron |
| 240 | H₂ | Molecular hydrogen |
| 246 | CH | Methylidyne |
| 264 | C₂ | Dicarbon |
| 270 | CN | Cyanogen |
| 276 | CO | Carbon monoxide |
| 300 | MgH | Magnesium hydride |
| 366 | TiO | Titanium oxide |
| 534 | H₂O | Water |

**Full Table**: See IONPOTS subroutine in ATLAS7V library (needs extraction).

### B. Isotope Abundance Table (rmolecasc)

| ISO | Molecule | ISO1 | ISO2 | X1 | X2 | NELION |
|-----|----------|------|------|----|----|----|
| 1 | ¹H₂ | 1 | 1 | 0.0 | -5.0 | 240 |
| 12 | ¹²C¹⁴N | 12 | 14 | -0.005 | -0.002 | 270 |
| 17 | ¹²C¹⁶O | 12 | 16 | -0.005 | -0.001 | 276 |
| 46 | ⁴⁶Ti¹⁶O | 46 | 16 | -1.101 | -0.001 | 366 |
| 48 | ⁴⁸Ti¹⁶O | 48 | 16 | -0.131 | -0.001 | 366 |

**X1, X2**: log₁₀([isotope]/[element_solar]) - abundance corrections relative to solar composition.

### C. Binary Format Summary

| Database | Record Size | Fields | Encoding | Total Size |
|----------|-------------|--------|----------|------------|
| Schwenke TiO | 16 bytes | IWL,IELION,IELO,IGFLOG,IGR,IGS,IGW | INT32+INT16 packed | ~200 MB |
| Partridge H₂O | 8 bytes | IWL,IELO,IGFLOG | INT32+INT16 | ~528 MB |
| Kurucz Predicted | 16 bytes | Same as TiO | INT32+INT16 packed | ~100 MB |

**Packing Scheme**: `TABLOG(i) = 10^((i-16384)/1000)` gives ~3 digits precision over 8 orders of magnitude.

### D. File Dependencies

```
Input Files (External Databases):
  - gfallxxxx.dat (ASCII, Kurucz atomic lines, ~500 MB)
  - molecular.asc (ASCII, various molecules, ~10 MB)
  - tioschwenke.bin (Binary, TiO, ~200 MB)
  - tio_levels.bin (Binary, TiO level metadata, ~10 MB)
  - h2opartridge.bin (Binary, H₂O, ~500 MB)
  - predicted.bin (Binary, Kurucz predicted, ~100 MB)

Pipeline State:
  - fort.93 (UNFORMATTED, synthesis parameters, ~1 KB)

Output Files:
  - fort.12 (UNFORMATTED, binary line list for spectrv, 32 bytes/line)
  - fort.14 (UNFORMATTED, line metadata for diagnostics, optional, ~100 bytes/line)
```

---

**End of Deep Dive 12**

Total Word Count: ~7800 words
Total Line Count: ~1230 lines
Fortran Source Analyzed: 2083 lines across 5 programs
Estimated Migration Effort: 8-10 weeks for full pipeline with validation
