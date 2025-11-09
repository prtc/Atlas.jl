# SYNTHE User Guide - Jauregi 2005 Supplement

**Source**: Jauregi, U. (2005). "Working notes on ATLAS 9 and SYNTHE"
**Extract Focus**: SYNTHE-specific content only (ATLAS9 sections omitted per project scope)
**Relevance**: Comprehensive SYNTHE user documentation, VMS workflow, line data formats

---

## Document Context

This document provides **user-oriented** SYNTHE documentation from Urtzi Jauregi's 2005 working notes. It complements the architectural documentation in ARCHITECTURE_DETAILS.md by focusing on:

- **Practical usage** (how to run SYNTHE on VMS)
- **File formats** (line data, model headers, COM scripts)
- **Known bugs** (ROTATE flux crash, documented solutions)
- **I/O structure** (Fortran unit assignments)

**Note**: Section 2 (ATLAS9 documentation) has been omitted per project scope - we track ATLAS12, not ATLAS9.

---

## I. SYNTHE Model File Headers

### Required Control Cards

**Critical**: SYNTHE cannot use raw ATLAS model output. You must **insert ASCII header** before the `TEFF...` line with these control cards:

#### For Intensity Spectra (Multiple Angles):
```fortran
SURFACE INTENSI 17 1.,.9,.8,.7,.6,.5,.4,.3,.25,.2,.15,.125,.1,.075,.05,.025,.01
ITERATIONS 1 PRINT 2 PUNCH 2
CORRECTION OFF
PRESSURE OFF
READ MOLECULES
MOLECULES ON
```

#### For Flux Spectra:
```fortran
SURFACE FLUX
ITERATIONS 1 PRINT 2 PUNCH 2
CORRECTION OFF
PRESSURE OFF
READ MOLECULES
MOLECULES ON
```

**Parameters**:
- `SURFACE INTENSI N μ₁, μ₂, ...`: Compute intensity at N angles (μ = cos θ)
- `ITERATIONS 1`: **Must be 1** for SYNTHE (not model calculation)
- `PRINT 2`: Verbosity level (0-4, default 2)
- `CORRECTION OFF`: Skip temperature correction (not needed for spectra)
- `PRESSURE OFF`: Skip pressure recalculation

⚠️ **ROTATE Bug**: See Section IV below - `SURFACE FLUX` crashes when ROTATE is in pipeline!

---

## II. SYNTHE VMS COM File Structure

### Complete Pipeline Example

**Task**: Generate 8500-8750 Å spectrum at R=500000, degrade to R=20000

```dcl
!─────────────────────────────────────────────────────────────────
! SYNTHE Pipeline for Teff=6000K, log g=4.5, solar metallicity
!─────────────────────────────────────────────────────────────────

$ SET DEF [zwitter.CALC]

!━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
! STAGE 1: Setup I/O Units
!━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

$ ASSIGN output.dat for006                        ! Auxiliary log
$ ASSIGN MODELS:ap00t6000g45k2nover.mod for005    ! Input model
$ ASSIGN SYNTHE:molecules.dat for002              ! Molecular data
$ ASSIGN SYNTHE:pfiron.dat for004                 ! Iron group partition functions
$ ASSIGN SYNTHE:continua.dat FOR017               ! Continuum opacity edges

!━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
! STAGE 2: XNFPELSYN - Precompute Number Densities
!━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

$ ASSIGN XNFp00t6000g45k2nover.dat for010
$ RUN SYNTHE:XNFPELSYN

!━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
! STAGE 3: SYNBEG - Initialize Wavelength Grid
!━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

$ ASSIGN SYS$INPUT FOR005
$ RUN SYNTHE:SYNBEG
AIR 850.0 875.0 500000. 0.0 0 300 .001 00
AIRorVAC WLBEG WLEND RESOLU TURBV IFNLTE LINOUT CUTOFF NREAD

!━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
! STAGE 4: Line List Readers - Atomic Lines
!━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

$ ASSIGN LINES:GF0300.100 FOR011   ! 200-300 nm
$ RUN SYNTHE:Rgfalltest
$ ASSIGN LINES:GF0400.100 FOR011   ! 300-400 nm
$ RUN SYNTHE:Rgfalltest
$ ASSIGN LINES:GF0500.100 FOR011   ! 400-500 nm
$ RUN SYNTHE:Rgfalltest
$ ASSIGN LINES:GF0600.100 FOR011   ! 500-600 nm
$ RUN SYNTHE:Rgfalltest
$ ASSIGN LINES:GF0800.100 FOR011   ! 600-800 nm
$ RUN SYNTHE:Rgfalltest
$ ASSIGN LINES:GF1200.100 FOR011   ! ⚠️ 800-1200 nm (exception!)
$ RUN SYNTHE:Rgfalltest

!━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
! STAGE 5: Line List Readers - Molecular Lines
!━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

$ assign MOLECULES:c2ax.bin FOR011   ! C2 A-X transition
$ run SYNTHE:Rmolec
$ assign MOLECULES:c2ba.bin FOR011   ! C2 B-A transition
$ run SYNTHE:Rmolec
$ assign MOLECULES:coax.bin FOR011   ! CO A-X transition
$ run SYNTHE:Rmolec
$ assign MOLECULES:h2bx.bin FOR011   ! H2 B-X transition
$ run SYNTHE:Rmolec
! ... (repeat for all needed molecules)

!━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
! STAGE 6: TiO Lines (CD-ROM, for cool stars Teff < 4500K)
!━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

$ mount/media=cdrom/undefined=(fixed:none:16) $5$dka400 cdrom24 cdrom24
$ ASSIGN CD24:schwenke.bin for011
$ run SYNTHE:Rmolec

!━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
! STAGE 7: SYNTHE - Compute Line Opacity
!━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

$ ASSIGN XNFp00t6000g45k2nover.dat for010
$ RUN SYNTHE:SYNTHE

!━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
! STAGE 8: SPECTRV - Solve Radiative Transfer
!━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

$ ASSIGN MODELS:ap00t6000g45k2nover.mod for005
$ ASSIGN i4600-9000.dat FOR007          ! Output: intensity at 17 angles
$ ASSIGN SYS$INPUT FOR025
$ assign synthe:molecules.dat for002
$ RUN synthe:SPECTRV
0.0     0.      1.      0.      0.      0.      0.      0.
0.
RHOXJ   R1      R101    PH1     PC1     PSI1    PRDDOP  PRDPOW

!━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
! STAGE 9: ROTATE - Rotational Broadening + Disk Integration
!━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

$ ASSIGN i4600-9000.dat FOR001
$ assign sys$input for005
$ ASSIGN f85008750v0.dat rot1           ! v sin i = 0 km/s
$ ASSIGN f85008750v20.dat rot2          ! v sin i = 20 km/s
$ ASSIGN f85008750v100.dat rot3         ! v sin i = 100 km/s
$ run synthe:rotate
3                                       ! Number of velocities
0.      20.     100.                    ! v sin i values

!━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
! STAGE 10: BROADEN - Instrumental/Macroturbulent Broadening
!━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

$ assign sys$input for005
$ assign f85008750v0.dat for021
$ assign f85008750v0-r20000p00t6000g45k2nover.dat for022
$ run synthe:BROADEN
GAUSSIAN 20000. RESOLUTION

!━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
! STAGE 11: CONVERFSYNNMTOA - Binary to ASCII
!━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

$ assign f85008750v0-r20000p00t6000g45k2nover.dat for001
$ assign f85008750v0-r20000p00t6000g45k2nover.asc for002
$ run synthe:CONVERFSYNNMTOA
$ delete/noconf f85008750v0-r20000p00t6000g45k2nover.dat.*

!━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
! Cleanup
!━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

$ copy f85008750v0-r20000p00t6000g45k2nover.asc [zwitter.calc]
$ DEL/NOCONF *.*.*
```

### Fortran I/O Unit Assignments

| Unit | Direction | File/Purpose | Format | Program(s) |
|------|-----------|--------------|--------|------------|
| for001 | Input | Broadening input spectrum | Binary | BROADEN, ROTATE |
| for002 | Input/Output | molecules.dat / ASCII output | Text | XNFPELSYN, SPECTRV, CONVERFSYNNMTOA |
| for004 | Input | pfiron.dat (iron group partition functions) | Text | XNFPELSYN |
| for005 | Input | Model file / stdin parameters | Text | SYNBEG, SPECTRV |
| for006 | Output | Auxiliary log (debugging output) | Text | All programs |
| for007 | Output | High-resolution spectrum | Binary | SPECTRV |
| for009 | Input | SYNTHE opacity output | Binary | SPECTRV |
| for010 | Input/Output | Number densities (XNFPELSYN output) | Binary | XNFPELSYN → SYNTHE |
| for011 | Input | Line list files (GF*.*, *.bin) | Binary/Text | RGFALLTEST, RMOLEC |
| for012 | Input/Output | Accumulated line opacity | Binary | SYNBEG, line readers, SYNTHE |
| for014 | Output | Line identification data | Text | Line readers |
| for017 | Input | continua.dat (photoionization edges) | Text | XNFPELSYN |
| for021 | Input | Spectrum for broadening | Binary | BROADEN |
| for022 | Output | Broadened spectrum | Binary | BROADEN |
| for025 | Input | SPECTRV control parameters | Text | SPECTRV |
| for093 | Internal | Control parameters (SYNBEG → SYNTHE) | Binary | SYNBEG, SYNTHE |
| rot1-rot5 | Output | Rotational broadening outputs (up to 5) | Binary | ROTATE |

**Binary File Lifespan**:
- `fort.12` (line opacity): Written by SYNBEG, appended by line readers, consumed by SYNTHE
- `fort.10` (densities): Written by XNFPELSYN, read by SYNTHE
- `fort.9` (SYNTHE output): Written by SYNTHE, read by SPECTRV

---

## III. Line Data Formats

### Atomic Line Format (GFxxxx.yyy files)

**File naming**: `GFxxxx.yyy` where xxxx = upper wavelength (nm), yyy = range (nm)
**Exception**: `GF1200.100` actually covers **800-1200 nm** (range = 400 nm)

**Format**: Fixed-width text, 30 fields per line

| Field | Variable | Format | Units | Description |
|-------|----------|--------|-------|-------------|
| 1 | WL | F10.4 | nm | Wavelength |
| 2 | GFLOG | F7.3 | - | log gf (oscillator strength) |
| 3 | CODE | F6.2 | - | Element.ion (e.g., 20.01 = Ca II) |
| 4 | E | F12.3 | cm⁻¹ | Lower level energy |
| 5 | XJ | F5.1 | - | Lower level J quantum number |
| 6 | LABEL | A10 | - | Lower level term (spectroscopic notation) |
| 7 | EP | F12.3 | cm⁻¹ | Upper level energy |
| 8 | XJP | F5.1 | - | Upper level J quantum number |
| 9 | LABELP | A10 | - | Upper level term |
| 10 | GAMMAR | F6.2 | - | log γ_rad (radiative damping) |
| 11 | GAMMAS | F6.2 | - | log γ_Stark (Stark damping) |
| 12 | GAMMAW | F6.2 | - | log γ_vdW (van der Waals damping @ 10000K) |
| 13 | REF | A4 | - | Reference code (see gfall.ref) |
| 14 | NBLO | I2 | - | NLTE departure coefficient (lower level) |
| 15 | NBUP | I2 | - | NLTE departure coefficient (upper level) |
| 16 | ISO1 | I3 | - | Isotope number (first component) |
| 17 | X1 | F7.3 | - | Hyperfine component log strength |
| 18 | ISO2 | I3 | - | Isotope number (second component) |
| 19 | X2 | F7.3 | - | Log isotopic abundance fraction |
| 20-30 | ... | ... | ... | Hyperfine structure data, Landé factors, isotope shifts |

**Example** (Ca II triplet line at 8542.091 Å):
```
854.2091 -0.362 20.01 13710.880 2.5 3d 2D 25414.400 1.5 4p 2P
8.20 -5.55 -7.80BWL 2 3 0 0.000 0 0.000 0 0 5 1200 1334
```

**Element codes**:
- `01.00` = H I (neutral hydrogen)
- `08.02` = O III (doubly ionized oxygen)
- `26.01` = Fe II (singly ionized iron)

### Molecular Line Format (xxyy.bin files)

**File naming**: `xxyy.bin` where xx = molecule code, yy = transition
**Molecule codes**: 608 = CO, 101.01 = H₂⁺, 100 = H⁻, etc.

**Format**: Binary, 10 fields per record

| Field | Variable | Format | Units | Description |
|-------|----------|--------|-------|-------------|
| 1 | WL | F10.4 | nm | Wavelength |
| 2 | GFLOG | F7.3 | - | log gf |
| 3 | XJ | F5.1 | - | Lower level J |
| 4 | E | F12.3 | cm⁻¹ | Lower level energy |
| 5 | XJP | F5.1 | - | Upper level J |
| 6 | EP | F12.3 | cm⁻¹ | Upper level energy |
| 7 | CODE | F9.2 | - | Molecule + transition code |
| 8 | LABEL | A8 | - | Lower level label |
| 9 | LABELP | A8 | - | Upper level label |
| 10 | ISO | I2 | - | Isotope number |

**Example** (SiO line at 350.0288 nm):
```
350.0288 -0.121 69.0-32654.280 70.0 -61215.190 814X28 E10 29
```

**Molecular codes**:
- `608` = CO (C + O atomic numbers)
- `814` = SiO (Si + O)
- `101` = CN (C + N)

---

## IV. Known Bugs and Quirks

### ROTATE SURFACE FLUX Crash

**Bug**: Using `SURFACE FLUX` in model header **crashes** when ROTATE is in pipeline

**Diagnosis**: Bug in ROTATE program (Castelli private communication 2005)

**Behavior Matrix**:
| Model Header | Pipeline | Result |
|--------------|----------|--------|
| `SURFACE FLUX` | Without ROTATE | ✅ Flux spectrum (non-rotating) |
| `SURFACE FLUX` | With ROTATE | ❌ **CRASH** |
| `SURFACE INTENSITY` | Without ROTATE | ✅ Intensity spectra at angles |
| `SURFACE INTENSITY` | With ROTATE | ✅ Flux spectrum (rotating star) |

**Workaround**:
```fortran
! WRONG (crashes):
! SURFACE FLUX
! ... ROTATE in pipeline ...

! CORRECT (always use INTENSITY):
SURFACE INTENSI 17 1.,.9,.8,.7,.6,.5,.4,.3,.25,.2,.15,.125,.1,.075,.05,.025,.01

! Then in ROTATE:
3                    ! Number of v sin i values
0.  20.  100.       ! Use 0 km/s for non-rotating flux
```

**Migration note**: When porting to Julia, fix this bug rather than preserving it.

---

## V. BROADEN Profile Types

### Control Card Format
```
<PROFILE_TYPE> <FWHM> <UNITS>
```

### Profile Types (4-letter codes)

| Code | Full Name | Use Case | Convolution Kernel |
|------|-----------|----------|-------------------|
| `MACR` | Macroturbulent | Stellar atmosphere broadening | Radial-tangential profile |
| `GAUS` | Gaussian | Instrumental (spectrograph) | exp(-x²/2σ²) |
| `SINX` | Sinc function | Fourier-limited resolution | sin(πx)/(πx) |
| `RECT` | Rectangular box | Simple boxcar smoothing | Constant over FWHM |
| `PROF` | Custom profile | User-defined kernel | Read from stdin after card |

### FWHM Units

| Code | Full Name | Formula | Example |
|------|-----------|---------|---------|
| `KM` | Kilometers/sec | FWHM in km/s | `GAUSSIAN 15.0 KM` |
| `RESO` | Resolving power | R = λ/Δλ → FWHM = c/R | `GAUSSIAN 20000. RESOLUTION` |
| `PM` | Picometers | FWHM = c/(1000·λ_c·PM) | `GAUSSIAN 10.5 PM` |

**Most common**: `GAUSSIAN 20000. RESOLUTION` (R = 20,000 Gaussian instrumental profile)

**Example**: Degrade to R=20,000 with Gaussian profile:
```dcl
$ run synthe:BROADEN
GAUSSIAN 20000. RESOLUTION
```

---

## VI. File Naming Conventions

### GF Atomic Line Files

```
GF<XXXX>.<YYY>
  ↑      ↑
  │      └── Wavelength range (nm)
  └────────── Upper wavelength limit (nm)
```

**Examples**:
- `GF0300.100` = 200-300 nm (range = 100 nm)
- `GF0600.100` = 500-600 nm
- `GF1200.100` = **800-1200 nm** ⚠️ Exception: range = 400 nm

**Selection strategy**: For spectrum 850.0-875.0 nm, load `GF0800.100` + `GF1200.100`

### Molecular Line Files

```
<XX><YY>.bin
 ↑   ↑
 │   └── Transition identifier
 └────── Molecule code (atomic numbers)
```

**Common molecules**:
- `c2ax.bin`, `c2ba.bin`, `c2da.bin` = C₂ (A-X, B-A, D-A transitions)
- `coax.bin`, `coxx.bin` = CO (A-X, X-X)
- `chax.bin`, `chbx.bin`, `chcx.bin` = CH (A-X, B-X, C-X)
- `cnax.bin`, `cnbx.bin` = CN (A-X, B-X)
- `h2bx.bin`, `h2cx.bin` = H₂ (B-X, C-X)
- `nhax.bin`, `nhca.bin` = NH
- `ohax.bin`, `ohxx.bin` = OH
- `sihax.bin` = SiH
- `sioax.bin`, `sioex.bin`, `sioxx.bin` = SiO (A-X, E-X, X-X)

**TiO special case**: `schwenke.bin` (Kurucz CD-ROM 24, for Teff < 4500 K)

---

## VII. Migration Implications for Julia

### 1. File Format Translation

**VMS COM scripts** → Julia pipeline orchestration:
- Replace `ASSIGN fort.XXX` with explicit I/O stream management
- Replace `RUN program.exe` with Julia function calls
- Replace DCL control flow with Julia control structures

**Binary format challenges**:
- Fortran "unformatted" I/O is **compiler-specific** (not portable)
- Recommend: Define JSON/HDF5 intermediate formats for pipeline state
- Keep ASCII line lists as-is (already portable)

### 2. Model Header Preprocessing

**Fortran**: Manual text insertion before TEFF line
**Julia**: Implement `prepare_model_for_synthe(model, intensity_or_flux)` function

```julia
function prepare_model_for_synthe(model_file::String, mode::Symbol)
    header = if mode == :intensity
        """
        SURFACE INTENSI 17 1.,.9,.8,.7,.6,.5,.4,.3,.25,.2,.15,.125,.1,.075,.05,.025,.01
        ITERATIONS 1 PRINT 2 PUNCH 2
        CORRECTION OFF
        PRESSURE OFF
        READ MOLECULES
        MOLECULES ON
        """
    elseif mode == :flux
        # Work around ROTATE bug by using INTENSITY mode
        """
        SURFACE INTENSI 1 1.0
        ITERATIONS 1 PRINT 2 PUNCH 2
        CORRECTION OFF
        PRESSURE OFF
        READ MOLECULES
        MOLECULES ON
        """
    end

    original_model = read(model_file, String)
    return header * original_model
end
```

### 3. Fix ROTATE Bug

**Don't preserve the bug** - implement flux calculation correctly:

```julia
function rotate_and_integrate(intensity_spectrum, vsini_values)
    # Properly handle both intensity and flux cases
    # If intensity_angles == [1.0], compute flux without rotation
    # Otherwise, integrate disk with rotational kernel
end
```

### 4. Simplify I/O Unit System

**Fortran approach**:
- Unit numbers hard-coded in programs
- Pipeline state passed via numbered files (fort.12, fort.93, etc.)

**Julia approach**:
```julia
struct SynthePipelineState
    wavelength_grid::Vector{Float64}
    line_opacity::Matrix{Float64}
    continuum_opacity::Vector{Float64}
    control_params::Dict{Symbol, Any}
end

pipeline_state = synbeg(wl_start, wl_end, resolution)
pipeline_state = rgfalltest(pipeline_state, "GF0800.100")
pipeline_state = synthe(pipeline_state, model)
spectrum = spectrv(pipeline_state)
```

### 5. Line Data Parsing

**Recommendation**: Create Julia structs for each format

```julia
struct AtomicLine
    wavelength::Float64           # nm
    loggf::Float64               # log(gf)
    element_code::Float64        # Z.ion
    E_lower::Float64             # cm⁻¹
    J_lower::Float64
    term_lower::String
    E_upper::Float64
    J_upper::Float64
    term_upper::String
    damping_rad::Float64         # log γ
    damping_stark::Float64
    damping_vdw::Float64
    reference::String
    # ... (30 fields total)
end

function parse_gfline(line::String)::AtomicLine
    # Parse fixed-width format per table in Section III
end
```

---

## VIII. References and Cross-Links

**This document complements**:
- `ARCHITECTURE_DETAILS.md` Section II (SYNTHE Pipeline Architecture) - subroutine-level details
- `WORKFLOW_ANALYSIS.md` - data flow and pipeline sequencing
- `kurucz05.pdf` analysis - DFSYNTHE optimization strategies (distribution functions vs. point-by-point)

**Original source**:
- Jauregi (2005) Sections 3-3.5 (SYNTHE user guide)
- Appendix B (complete VMS COM file)

**Related documentation**:
- Kurucz & Furenlid (1979) - SYNTHE internal physics
- Kurucz & Avrett (1981) - Spectrum synthesis algorithms
- Castelli (1988) - ATLAS8 manual (ATLAS control cards still valid for model headers)

---

## IX. Key Takeaways for Implementation

1. **Model headers are mandatory** - raw ATLAS output won't work
2. **ROTATE flux bug** - always use `SURFACE INTENSITY`, never `SURFACE FLUX`
3. **GF1200.100 exception** - covers 800-1200 nm (400 nm range, not 100 nm)
4. **TiO only for cool stars** - skip `schwenke.bin` for Teff > 4500 K to save time
5. **Binary formats are non-portable** - plan for format translation in Julia
6. **Line readers are repetitive** - unified Julia implementation possible
7. **Pipeline is stateful** - maintain intermediate results in structured objects

**Migration priority order**:
1. ✅ Line data parsers (pure I/O, no physics)
2. ✅ SYNBEG (simple initialization logic)
3. ⚠️ XNFPELSYN (requires ATLAS7V library)
4. ⚠️ SYNTHE (complex line opacity calculation)
5. ⚠️ SPECTRV (requires ATLAS7V for radiative transfer)
6. ✅ ROTATE/BROADEN (self-contained convolution operations)
7. ✅ CONVERFSYNNMTOA (trivial format conversion)
