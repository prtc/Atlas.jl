# SYNTHE Suite COMMON Block Dependency Map
**Phase 4 - SYNTHE Edition | Deliverable 1**

**Created**: 2025-11-09
**Purpose**: Map implicit state dependencies in SYNTHE pipeline for Julia migration planning
**Related**: See COMMON_BLOCK_MAP.md for ATLAS12 analysis

---

## Executive Summary

SYNTHE has a **fundamentally different architecture** than ATLAS12:

**ATLAS12**: Monolithic (80 subroutines, 57 COMMON blocks, all tightly coupled within one program)

**SYNTHE**: Modular pipeline (13 programs, ~50 COMMON blocks, loosely coupled via fort.X files)

### Key Architectural Findings

**Three complexity tiers**:
1. **Atlas7v library core** (32 shared COMMON blocks) - Used by xnfpelsyn.for + spectrv.for
2. **Three complex programs** (7-72 COMMON blocks each) - synthe.for, spectrv.for, xnfpelsyn.for
3. **Eight simple utilities** (0-4 COMMON blocks each) - Line readers, standalone tools

**State management mechanisms**:
- **COMMON blocks**: Internal state within programs (especially atlas7v library)
- **Fort.X files**: External state between programs (major data flow mechanism)
- **LINDAT block**: Shared spectral line data format (inter-program interface)

**Migration implications**:
- Atlas7v library blocks should become AtmosphereState module (shared by multiple programs)
- Fort.X file elimination is SYNTHE's equivalent challenge to ATLAS12's COMMON block refactoring
- 8 simple programs are natural "quick wins" (minimal state, standalone)

---

## I. Atlas7v Library COMMON Blocks

**Programs using atlas7v**: xnfpelsyn.for, spectrv.for
**Total library blocks**: 32 core + 6 optional = 38 total
**Priority**: CRITICAL - Forms shared library interface

### Core Atmosphere State (32 blocks)

These blocks define the atmosphere calculation library interface. Both xnfpelsyn.for and spectrv.for link against atlas7v.for and share these blocks.

#### 1.1 Thermodynamic State (5 blocks - CRITICAL)

| Block | Variables | Purpose | Programs |
|-------|-----------|---------|----------|
| **RHOX** | RHOX(kw), NRHOX | Column mass depth grid (τ axis) | atlas7v, xnfpelsyn, spectrv |
| **TEMP** | T(kw), TKEV(kw), TK(kw), HKT(kw), TLOG(kw), HCKT(kw), ITEMP | Temperature arrays at each depth | atlas7v, xnfpelsyn, spectrv |
| **STATE** | P(kw), XNE(kw), XNATOM(kw), RHO(kw), PTOTAL(kw) | Pressure, electron density, total density | atlas7v, xnfpelsyn, spectrv |
| **TEFF** | TEFF, GRAV, GLOG | Stellar parameters (T_eff, log g) | atlas7v, xnfpelsyn, spectrv |
| **HEIGHT** | HEIGHT(kw) | Geometric height scale | atlas7v, xnfpelsyn, spectrv |

**Dimensions**: kw=99 depth points (standard ATLAS grid)

**Read/Write**:
- RHOX: Read-only after initialization (defines grid)
- TEMP, STATE: Read/write (updated during atmosphere iteration in ATLAS, read-only in SYNTHE)
- TEFF: Read-only (input parameters)
- HEIGHT: Read-only after calculation

**Migration**: Core AtmosphereGrid and ThermodynamicState structs

---

#### 1.2 Element Ionization & Partition Functions (13 blocks - HIGH priority)

Atlas7v defines separate blocks for each major element. Pattern: /B{ELEMENT}/

| Block | Element | Variables | Ionization States |
|-------|---------|-----------|------------------|
| **BHYD** | Hydrogen | BHYD(kw,8), AHYD(kw), SHYD(kw), AH2P(kw), BMIN(kw), AHMIN(kw), SHMIN(kw), SIGH(kw), SIGH2(kw), AHLINE(kw), SHLINE(kw), XNFPH(kw,2), XNFH(kw) | H I, H II, H⁻, H₂⁺ |
| **BHE** | Helium | BHE1(kw,29), AHE1(kw), SHE1(kw), BHE2(kw,6), AHE2(kw), SHE2(kw), AHEMIN(kw), SIGHE(kw), XNFPHE(kw,3), XNFHE(kw,2) | He I, He II, He III |
| **BC** | Carbon | BC1(kw,14), AC1(kw), SC1(kw), XNFPC(kw,2), BC2(kw,6) | C I, C II |
| **BO** | Oxygen | BO1(kw,13), XNFPO(kw,1), BO2(kw,4) | O I, O II |
| **BNA** | Sodium | BNA1(kw,8), XNFPNA(kw,1) | Na I |
| **BMG** | Magnesium | BMG1(kw,11), AMG1(kw), SMG1(kw), XNFPMG(kw,2), BMG2(kw,6) | Mg I, Mg II |
| **BAL** | Aluminum | BAL1(kw,9), AAL1(kw), SAL1(kw), XNFPAL(kw,2), BAL2(kw,1) | Al I, Al II |
| **BSI** | Silicon | BSI1(kw,11), ASI1(kw), SSI1(kw), XNFPSI(kw,2), BSI2(kw,10) | Si I, Si II |
| **BK** | Potassium | BK1(kw,8), XNFPK(kw,1) | K I |
| **BCA** | Calcium | BCA1(kw,8), BCA2(kw,5), XNFPCA(kw,2) | Ca I, Ca II |
| **BFE** | Iron | BFE1(kw,15), AFE1(kw), SFE1(kw), XNFPFE(kw,1) | Fe I |
| **BB** | Boron | BB1(kw,7), XNFPB(kw,1) | B I |
| **ELEM** | All | ABUND(99), ATMASS(99), ELEM(99), XABUND(99), WTMOLE | Element abundances, atomic masses |

**Naming convention**:
- B{ELEMENT}1: Ionization fractions and excitation levels for first ion
- B{ELEMENT}2: Second ion (if included)
- A{ELEMENT}1: Absorption coefficients
- S{ELEMENT}1: Source functions
- XNFP{ELEMENT}: Partition functions

**Read/Write**: Read-write during atmosphere calculation (ATLAS), read-only during synthesis (SYNTHE)

**Migration**: ElementPopulations module with per-element structs

---

#### 1.3 Opacity & Radiative Transfer (7 blocks - CRITICAL)

| Block | Variables | Purpose | Used by |
|-------|-----------|---------|---------|
| **ABTOT** | ABTOT(kw), ALPHA(kw) | Total absorption, scattering fraction | atlas7v, xnfpelsyn, spectrv |
| **ABROSS** | ABROSS(kw), TAUROS(kw) | Rosseland mean absorption, optical depth | atlas7v, xnfpelsyn, spectrv |
| **OPTOT** | ACONT(kw), SCONT(kw), ALINE(kw), SLINE(kw), SIGMAC(kw), SIGMAL(kw) | Total opacity (continuum + line) | atlas7v, xnfpelsyn, spectrv |
| **OPS** | ACOOL(kw), ALUKE(kw), AHOT(kw), SIGEL(kw), ALINES(kw), SIGLIN(kw), AXLINE(kw), SIGXL(kw), AXCONT(kw), SIGX(kw), SXLINE(kw), SXCONT(kw) | Opacity components by source | atlas7v |
| **TAUSHJ** | TAUNU(kw), SNU(kw), HNU(kw), JNU(kw), JMINS(kw) | Optical depth, source function, mean intensity | atlas7v, spectrv |
| **FREQ** | FREQ, FREQLG, EHVKT(kw), STIM(kw), BNU(kw), WAVENO | Frequency/wavelength parameters | atlas7v, xnfpelsyn, spectrv |
| **MUS** | ANGLE(20), SURFI(20), NMU | Angular quadrature points (μ = cos θ) | atlas7v, spectrv |

**Read/Write**:
- ABTOT, ABROSS, OPTOT: Read-write (calculated in atlas7v)
- OPS: Read-write (detailed opacity breakdown)
- TAUSHJ: Read-write (radiative transfer solution)
- FREQ: Read-write (set per frequency calculation)
- MUS: Read-only after initialization (angle grid)

**Migration**: OpacityState and RadiativeTransfer modules

---

#### 1.4 Convection & Dynamics (3 blocks - MEDIUM priority)

| Block | Variables | Purpose |
|-------|-----------|---------|
| **CONV** | DLTDLP(kw), HEATCP(kw), DLRDLT(kw), VELSND(kw), GRDADB(kw), HSCALE(kw), FLXCNV(kw), VCONV(kw), MIXLTH, IFCONV | Mixing length theory parameters |
| **TURBPR** | VTURB(kw), PTURB(kw), TRBFDG, TRBCON, TRBPOW, TRBSND, IFTURB | Turbulent pressure and velocity |
| **RAD** | ACCRAD(kw), PRAD(kw) | Radiative acceleration and pressure |

**Used by**: atlas7v primarily (ATLAS12 atmosphere calculations)

**SYNTHE usage**: VTURB read for microturbulence in line profiles (via TURBPR)

**Migration**: ConvectionState module (lower priority for SYNTHE-only migration)

---

#### 1.5 Control & Iteration (4 blocks - MEDIUM priority)

| Block | Variables | Purpose |
|-------|-----------|---------|
| **ITER** | ITER, IFPRNT(15), IFPNCH(15), NUMITS | Iteration counter and output control |
| **IF** | IFCORR, IFPRES, IFSURF, IFSCAT, IFMOL, NLTEON, IFOP(20) | Control flags for atmosphere calculation |
| **FLUX** | FLUX, FLXERR(kw), FLXDRV(kw), FLXRAD(kw) | Radiative flux calculations |
| **PZERO** | PZERO, PCON, PRADK0, PTURB0, KNU(kw), PRADK(kw), EDENS(kw) | Surface pressure and boundary conditions |

**Read/Write**: Control flags (read-only), flux/iteration (read-write)

**SYNTHE usage**: Mostly unused (ATLAS12 iteration control), some flags read for configuration

**Migration**: ControlFlags and ConvergenceState modules

---

#### 1.6 I/O & Miscellaneous (4 blocks - LOW priority)

| Block | Variables | Purpose |
|-------|-----------|---------|
| **JUNK** | TITLE(74), FREQID(6), WLTE, XSCALE | Model title and identification |
| **PUT** | PUT, IPUT | Output control flags |
| **FRESET** | FRESET(500), RCOSET(500), NULO, NUHI, NUMNU, IFWAVE, WBEGIN, DELTAW | Frequency set for integration |
| **CONT** | ABTOTC(kw), ALPHAC(kw), TAUNUC(kw), SNUC(kw), HNUC(kw), JNUC(kw), JMINSC(kw), RESIDC(kw) | Continuum opacity at specific frequency |

**Read/Write**: Mostly output control (read-only flags, write temporary data)

**Migration**: Configuration and OutputControl modules

---

### Atlas7v Optional Blocks (6 blocks)

These blocks are in atlas7v but NOT used by all client programs.

| Block | Variables | Used by | Purpose |
|-------|-----------|---------|---------|
| **CHOH** | XNFPCH(kw), XNFPOH(kw) | atlas7v, xnfpelsyn | CH and OH molecule densities |
| **XNMOL** | CODEMOL(MAXMOL), XNMOL(kw,MAXMOL), etc. | atlas7v, xnfpelsyn | All molecular number densities |
| **FREE** | WORD(6), NUMCOL, LETCOL, LAST, MORE, IFFAIL, MAXPOW | atlas7v, xnfpelsyn | Free-format input parser state |
| **IFEQUA** | IFEQUA(101), KCOMPS(MAXLOC), LOCJ(MAX1), etc. | atlas7v | Molecular equilibrium equation flags |
| **POTION** | POTION(999) | atlas7v, rgfalllinesnew | Partition function lookup table |
| **CONT** | ABTOTC(kw), ... | atlas7v | Continuum at specific frequency |

**Note**: These are library blocks but not part of the minimal interface. XNFPELSYN uses CHOH, XNMOL, FREE because it calculates molecular populations. SPECTRV does not need these.

---

## II. SYNTHE.FOR Program-Specific Blocks

**Program**: synthe.for (2,993 lines, 72 COMMON blocks total)
**Shared blocks**: Uses subset of atlas7v blocks (BHYD, BHE, ELEM, FREQ, etc.)
**Unique blocks**: 7 blocks specific to spectrum synthesis

### SYNTHE-Specific State (7 blocks - HIGH priority)

| Block | Variables | Size | Purpose |
|-------|-----------|------|---------|
| **BUFFER** | BUFFER(MAXBUFF), PROFILE(MAXPROF) | 2,010,001 elements | Main spectrum buffer and line profile workspace |
| **CONTIN** | CONTINUUM(MAXBUFF) | 2,010,001 elements | Continuum opacity spectrum at all wavelengths |
| **NLINES** | WLBEG, WLEND, RESOLU, RATIO, RATIOLG, WBEGIN, LENGTH, MLINES, IXWLBEG | 9 scalars | Wavelength range and resolution control |
| **LINDAT** | WL, E, EP, LABEL(2), LABELP(2), ..., EXTRA3 | ~40 variables | Current spectral line data (shared with spectrv) |
| **XNFDOP** | XNFPEL(594), DOPPLE(594), XNFDOP(594) | 1,782 elements | Partition functions and Doppler widths by element |
| **TXNXN** | EMERGE(kw), TXNXN(kw), BSTIM(kw), XNFH2(kw) | 396 elements | Emergent intensities and H₂ populations |
| **EXTAB** | EXTAB(1001), EXTABF(1001), E1TAB(2000) | 4,002 elements | Exponential integral lookup tables for RT |
| **H1TAB** | H0TAB(2001), H1TAB(2001), H2TAB(2001) | 6,003 elements | Hydrogen partition function tables |

**Total memory**: ~4 million Float64 elements (~32 MB)

**Read/Write patterns**:
- BUFFER, CONTIN: Write during synthesis loop, read for output
- NLINES: Read-only after initialization
- LINDAT: Write when reading line data, read during profile calculation
- XNFDOP, TXNXN: Write during setup, read during line opacity calculation
- EXTAB, H1TAB: Read-only lookup tables (initialized once)

**Dependencies**:
- BUFFER size depends on NLINES (MAXBUFF = WLEND/RATIO)
- LINDAT shared with spectrv.for (inter-program interface)
- TXNXN uses BHYD, BHE from atlas7v for populations

**Migration strategy**:
- BUFFER, CONTIN → SpectrumBuffer struct (large arrays)
- NLINES → WavelengthGrid struct
- LINDAT → SpectralLine struct (shared type)
- XNFDOP → PartitionFunctions module
- TXNXN → EmergentIntensity struct
- EXTAB, H1TAB → RadiativeTransferTables module

---

## III. SPECTRV.FOR Program-Specific Blocks

**Program**: spectrv.for (438 lines, 40 COMMON blocks total)
**Shared blocks**: All 32 atlas7v core blocks + LINDAT from synthe
**Unique blocks**: 4 blocks specific to spectral convolution

| Block | Variables | Purpose |
|-------|-----------|---------|
| **TRASH** | WLBEG, WLEND, VT, AIR, N10, IFVAC, NMU2 | Runtime control parameters |
| **CORONO** | RHOXCO(42), TCO(42), XNECO(42), SCO(42), TCOLOG(42), etc. | Extended atmosphere/corona model |
| **BONE** | BONE(kw) | Additional opacity scaling factor |
| **PRD** | PRDDOP, PRDPOW, ITPRD, NITPRD, SIGPRD(kw), NUPRD, LINPRD | Partial redistribution parameters |

**Read/Write**:
- TRASH: Temporary storage (read-write)
- CORONO: Read-only after initialization (optional extended atmosphere)
- BONE: Read-write (opacity modifier)
- PRD: Read-only (partial redistribution configuration)

**Usage**:
- TRASH: Quick-and-dirty temporary storage (could be local variables)
- CORONO: Advanced feature (chromosphere/corona calculations), rarely used
- BONE: Opacity tuning (research feature)
- PRD: Partial frequency redistribution (advanced RT, usually disabled)

**Migration priority**: LOW (all are optional features or temporary storage)

---

## IV. XNFPELSYN.FOR Program-Specific Blocks

**Program**: xnfpelsyn.for (317 lines, 39 COMMON blocks total)
**Shared blocks**: All atlas7v blocks used by xnfpelsyn
**Unique blocks**: NONE (all blocks are from atlas7v library)

**Key observation**: XNFPELSYN is a thin wrapper around atlas7v atmosphere calculations. It uses 3 blocks that spectrv doesn't (CHOH, XNMOL, FREE) but these are all atlas7v library blocks, not xnfpelsyn-specific.

**Migration**: Fold into AtmosphereState module (atlas7v library refactoring)

---

## V. Line Reader Utility Blocks

**Programs**: rgfalllinesnew, rpredict, rmolecasc, rschwenk, rh2ofast, rotate, broaden

### Shared Line Data Format (1 block - HIGH priority)

**LINDAT** - Spectral line data interface

Used by: synthe.for, spectrv.for, all 6 line readers

**Variables** (40 total):
```fortran
WL           ! Wavelength (air or vacuum)
E            ! Lower level energy (eV)
EP           ! Upper level energy (eV)
LABEL(2)     ! Lower level identification
LABELP(2)    ! Upper level identification
OTHER1(2)    ! Additional lower level data
OTHER2(2)    ! Additional upper level data
WLVAC        ! Vacuum wavelength
CENTER       ! Line center (corrected for velocity)
CONCEN       ! Concentration/abundance
NELION       ! Element and ionization code
GAMMAR       ! Radiative damping width
GAMMAS       ! Stark damping width
GAMMAW       ! van der Waals damping width
REF          ! Reference code
NBLO, NBUP   ! Lower/upper level quantum numbers
ISO1, X1     ! Lower level isotope data
ISO2, X2     ! Upper level isotope data
GFLOG        ! log(gf) - oscillator strength
XJ, XJP      ! J quantum numbers
CODE         ! Line identification code
ELO          ! Lower level energy (cm⁻¹)
GF           ! Oscillator strength (linear)
GS, GR, GW   ! Damping widths (alternate storage)
DWL          ! Wavelength correction
DGFLOG       ! Oscillator strength correction
DGAMMAR, DGAMMAS, DGAMMAW  ! Damping width corrections
EXTRA1, EXTRA2, EXTRA3     ! Unused fields for extension
```

**Purpose**: Standard interface for spectral line data across all SYNTHE programs. Every program that handles lines (readers, synthe, spectrv) uses this format.

**Read/Write**:
- Line readers: Write (populate from line list files)
- synthe.for: Read (calculate line opacity)
- spectrv.for: Read (identify spectral features)

**Migration**: This should become **SpectralLine struct** in Julia - the fundamental data type for line data in SYNTHE. Critical for inter-program compatibility.

---

### Utility-Specific Blocks (4 blocks - LOW priority)

| Block | Program | Variables | Purpose |
|-------|---------|-----------|---------|
| **POTION** | rgfalllinesnew | POTION(999) | Partition function lookup (also in atlas7v) |
| **IIIIIII** | rpredict, rschwenk | IWL, IELION, IELO, IGFLOG, IGR, IGS, IGW | Line data field indices |
| **HROT** | rotate | H(500), HROT(npiece3) | Rotational broadening kernel |
| **WT** | rotate | MUNWT(10000), IVNWT(10000), WTNWT(10000) | Rotational convolution storage |

**Migration priority**: LOW (simple utilities, minimal state)

---

### Programs with NO COMMON Blocks (2 programs - Quick wins!)

- **synbeg.for** (0 COMMON blocks) - Wavelength range setup utility
- **broaden.for** (0 COMMON blocks) - Instrumental broadening utility

These programs have NO shared state. Pure input → output transformation. Ideal first migration targets.

---

## VI. Fort.X File Communication (External State)

**Critical observation**: SYNTHE's major state management challenge is NOT COMMON blocks (well-isolated in atlas7v), but **fort.X file-based inter-process communication**.

### Fort.X Data Flow

```
Program 1: xnfpelsyn
├─ Reads: stdin (atmosphere model), fort.2 (molecules.dat), fort.17 (continua.dat)
└─ Writes: fort.10 (binary atmosphere data: T, P, ρ, populations, opacities)

Program 2: synbeg
├─ Reads: stdin (wavelength range, resolution)
└─ Writes: fort.12 (binary line list header), fort.14 (control parameters)

Programs 3-7: Line readers (rgfalllinesnew, rpredict, rmolecasc, rschwenk, rh2ofast)
├─ Reads: fort.11 (line list file), fort.12 (existing lines), fort.14 (control)
└─ Writes: fort.12 (updated line list with new lines appended)

Program 8: synthe
├─ Reads: fort.10 (atmosphere), fort.12 (complete line list), fort.14 (control)
└─ Writes: fort.16 (line opacities at each depth and wavelength)

Program 9: spectrv
├─ Reads: stdin (atmosphere model), fort.2 (molecules.dat), fort.16 (line opacities)
└─ Writes: fort.7 (emergent spectrum: I(λ,μ) or F(λ))

Programs 10-11: rotate, broaden (optional post-processing)
├─ Reads: fort.7 (spectrum)
└─ Writes: fort.7 (broadened spectrum)
```

### Fort.X File Formats

**Binary files**:
- fort.10: Atmosphere structure (UNFORMATTED, platform-dependent)
- fort.12: Line list (UNFORMATTED, iteratively appended by 5+ programs)
- fort.16: Line opacity grid (UNFORMATTED, huge file ~GB)

**Text files**:
- fort.14: Control parameters (ASCII, wavelength range, etc.)
- fort.7: Spectrum output (ASCII or binary depending on version)

**Problems** (same as ATLAS12 fort.X communication):
- Massive I/O overhead (GB of data between programs)
- Brittle (if one program crashes, corrupted files break pipeline)
- Platform-dependent (binary formats not portable)
- Cannot parallelize (sequential dependencies)

### Migration Strategy: Fort.X Elimination

**Option 1: Unified program** (per Decision 5.3):
```julia
spectrum = synthe_pipeline(
    atmosphere_model,
    line_databases,
    wavelength_range;
    vsini=10.0,
    instrumental_resolution=50000
)
```
All data stays in memory. Fort.X files become internal data structures.

**Option 2: Clean I/O with portable formats**:
```julia
# Stage 1: Atmosphere preparation
atm_data = prepare_atmosphere(atmosphere_model)
save("atmosphere.h5", atm_data)  # HDF5, not fort.10

# Stage 2: Line selection
lines = select_lines(line_databases, wavelength_range)
save("lines.arrow", lines)  # Apache Arrow, not fort.12

# Stage 3: Synthesis
spectrum = synthesize_spectrum(atm_data, lines, wavelength_range)
save("spectrum.h5", spectrum)  # HDF5, not fort.7
```

**Recommendation**: Start with Option 1 (unified), provide Option 2 for debugging/validation.

---

## VII. COMMON Block Summary Statistics

| Category | Count | Programs | Migration Priority |
|----------|-------|----------|-------------------|
| Atlas7v core library blocks | 32 | atlas7v, xnfpelsyn, spectrv | **CRITICAL** |
| Atlas7v optional blocks | 6 | atlas7v (+some clients) | HIGH |
| SYNTHE-specific blocks | 7 | synthe.for only | HIGH |
| SPECTRV-specific blocks | 4 | spectrv.for only | LOW |
| XNFPELSYN-specific blocks | 0 | (uses atlas7v blocks) | N/A |
| Line reader utility blocks | 5 | Various utilities | LOW |
| **TOTAL UNIQUE BLOCKS** | **~50** | **13 programs** | — |

**Programs by COMMON block complexity**:
- **High** (30+ blocks): synthe.for (72), spectrv.for (40), xnfpelsyn.for (39), atlas7v.for (38)
- **Low** (1-4 blocks): rgfalllinesnew (4), rotate (3), rpredict (2), rschwenk (2), rh2ofast (1), rmolecasc (1)
- **None** (0 blocks): synbeg.for, broaden.for

**Comparison to ATLAS12**:
- ATLAS12: 57 blocks, all in one 23K-line program, 80 subroutines tightly coupled
- SYNTHE: 50 blocks, distributed across 13 programs, only 3 programs are complex

---

## VIII. Migration Priority Classification

### Tier 1: Critical Shared State (32 blocks)

**Atlas7v core library blocks** - Must be refactored first, forms shared library interface

**Subtiers**:
1a. **Thermodynamic state** (5 blocks): RHOX, TEMP, STATE, TEFF, HEIGHT
1b. **Element populations** (13 blocks): BHYD, BHE, BC, BO, BNA, BMG, BAL, BSI, BK, BCA, BFE, BB, ELEM
1c. **Opacity & RT** (7 blocks): ABTOT, ABROSS, OPTOT, OPS, TAUSHJ, FREQ, MUS
1d. **Convection** (3 blocks): CONV, TURBPR, RAD
1e. **Control & I/O** (4 blocks): ITER, IF, FLUX, PZERO

**Estimated effort**: 4-6 weeks to refactor as AtmosphereState module

---

### Tier 2: Program-Specific State (11 blocks)

**SYNTHE spectrum synthesis state** (7 blocks)

Priority order:
1. LINDAT (shared with spectrv, critical interface)
2. NLINES (wavelength grid, moderate complexity)
3. BUFFER, CONTIN (large arrays, straightforward)
4. XNFDOP, TXNXN (partition functions, moderate)
5. EXTAB, H1TAB (lookup tables, low complexity)

**Estimated effort**: 2-3 weeks

**SPECTRV optional features** (4 blocks): TRASH, CORONO, BONE, PRD

**Estimated effort**: 1 week (or skip if features not needed)

---

### Tier 3: Utility State (5 blocks)

**Line reader blocks**: LINDAT (already in Tier 2), POTION, IIIIIII, HROT, WT

**Estimated effort**: 0.5-1 week (simple utilities)

---

### Tier 4: Fort.X File Elimination (Not COMMON blocks, but critical!)

**Problem**: 13 programs communicate via binary fort.X files

**Solution**: Unified pipeline architecture (per Decision 5.3)

**Estimated effort**: 3-5 weeks (architecture redesign, not just state refactoring)

---

## IX. Cross-Program Dependencies

### Atlas7v Library Interface

**Client programs**: xnfpelsyn.for, spectrv.for

**Shared blocks**: All 32 core atlas7v blocks

**Dependency type**: Library linkage (both programs call atlas7v subroutines)

**Julia migration**: Create AtmosphereLibrary module, export structs/functions

---

### SYNTHE → SPECTRV Pipeline

**Shared blocks**: LINDAT only

**Data flow**: synthe.for calculates line opacities → writes fort.16 → spectrv.for reads fort.16

**Dependency type**: File-based (loose coupling)

**Julia migration**: Replace fort.16 with in-memory LineOpacityGrid struct

---

### Line Readers → SYNTHE

**Shared blocks**: LINDAT only

**Data flow**: Line readers populate LINDAT → write to fort.12 → synthe.for reads fort.12

**Dependency type**: File-based (loose coupling)

**Julia migration**: Replace fort.12 with Vector{SpectralLine}

---

### No Unexpected Cross-Dependencies

**Key finding**: SYNTHE pipeline has clean separation. Programs share minimal state (only LINDAT). Major coupling is through fort.X files, not COMMON blocks.

**Contrast with ATLAS12**: ATLAS12's 57 COMMON blocks are ALL shared by 80 subroutines in one program. SYNTHE's 50 blocks are cleanly partitioned.

---

## X. Migration Recommendations

### Recommended Migration Sequence

**Phase 1: Line data infrastructure** (2-3 weeks)
1. Create SpectralLine struct (from LINDAT)
2. Migrate synbeg.for (0 COMMON blocks, pure utility)
3. Migrate line readers (1-4 blocks each, LINDAT + minimal state)
4. Validate: Read line lists, populate SpectralLine Vector

**Phase 2: Atlas7v library core** (4-6 weeks)
1. Create AtmosphereState module (32 core blocks)
2. Refactor as Julia structs (thermodynamic, populations, opacity)
3. Migrate xnfpelsyn.for as thin wrapper
4. Validate: Compare atmosphere interpolation against Fortran

**Phase 3: SYNTHE synthesis core** (3-4 weeks)
1. Create SynthesisState module (7 SYNTHE-specific blocks)
2. Migrate synthe.for main loop
3. Eliminate fort.12, fort.16 (use in-memory structs)
4. Validate: Compare line opacities against Fortran

**Phase 4: SPECTRV radiative transfer** (2-3 weeks)
1. Migrate spectrv.for (40 blocks, but most from atlas7v)
2. Create unified pipeline interface
3. Eliminate fort.7 output (return Spectrum struct)
4. Validate: Compare emergent spectra against Fortran

**Phase 5: Unified pipeline** (2-3 weeks)
1. Create synthe_pipeline() high-level API
2. Eliminate all fort.X files
3. Add rotational and instrumental broadening
4. Validate: End-to-end test cases

**Phase 6: Optional utilities** (1-2 weeks)
1. Migrate rotate.for, broaden.for (0-3 blocks)
2. Migrate optional spectrv features (CORONO, PRD)

**Total estimated effort**: 14-21 weeks (3.5-5 months)

**Critical path**: Atlas7v library (Phase 2) blocks all subsequent work

---

## XI. Julia Struct Design Examples

### SpectralLine (from LINDAT)

```julia
struct SpectralLine
    wavelength::Float64           # WL (Angstroms)
    energy_lower::Float64         # E (eV)
    energy_upper::Float64         # EP (eV)
    label_lower::NTuple{2,Int}    # LABEL(2)
    label_upper::NTuple{2,Int}    # LABELP(2)
    log_gf::Float64               # GFLOG
    element_ion::Int              # NELION
    damping_radiative::Float64    # GAMMAR
    damping_stark::Float64        # GAMMAS
    damping_vdw::Float64          # GAMMAW
    # ... (40 fields total)
end
```

### AtmosphereGrid (from RHOX, TEMP, STATE)

```julia
struct AtmosphereGrid
    rhox::Vector{Float64}         # Column mass depth (99 points)
    temperature::Vector{Float64}  # T(kw)
    pressure::Vector{Float64}     # P(kw)
    electron_density::Vector{Float64}  # XNE(kw)
    density::Vector{Float64}      # RHO(kw)
    height::Vector{Float64}       # HEIGHT(kw)
    npoints::Int                  # NRHOX
end

struct StellarParameters
    teff::Float64                 # Effective temperature (K)
    logg::Float64                 # Surface gravity (log cm/s²)
    metallicity::Float64          # [M/H]
end
```

### SpectrumBuffer (from BUFFER, CONTIN)

```julia
struct SpectrumBuffer
    wavelength::Vector{Float64}   # Wavelength grid
    intensity::Vector{Float64}    # BUFFER (emergent intensity)
    continuum::Vector{Float64}    # CONTINUUM
    profile::Vector{Float64}      # PROFILE (temporary)
    length::Int                   # LENGTH
end
```

### ElementPopulations (from BHYD, BHE, BC, etc.)

```julia
struct HydrogenPopulations
    level_populations::Matrix{Float64}  # BHYD(kw,8)
    partition_function::Vector{Float64} # XNFPH(kw,2)
    ionization_fraction::Vector{Float64} # XNFH(kw)
    h_minus_fraction::Vector{Float64}   # BMIN(kw)
    # ...
end

struct ElementPopulations
    hydrogen::HydrogenPopulations
    helium::HeliumPopulations
    carbon::CarbonPopulations
    # ... (13 elements)
    abundances::Vector{Float64}   # ABUND(99)
end
```

---

## XII. Validation Requirements

### Per-Block Validation

For each COMMON block refactored:
1. **Unit test**: Initialize block in Fortran, save to file, load in Julia, compare values
2. **Integration test**: Run atlas7v subroutine in Fortran vs Julia, compare all block values
3. **Regression test**: Full SYNTHE pipeline, compare final spectrum

### Cross-Program Validation

1. **LINDAT interface**: Line readers (Fortran) → synthe (Julia) → verify line opacity matches
2. **Atlas7v library**: xnfpelsyn (Fortran) → spectrv (Julia) → verify spectrum matches
3. **Fort.X elimination**: Fortran pipeline (with fort.X files) vs Julia pipeline (in-memory) → verify identical output

### Test Cases

**Minimum 5 test cases** (per ATLAS12 precedent):
1. Solar composition (T_eff=5777K, log g=4.44)
2. Cool star (T_eff=4000K, log g=2.0) - tests molecular lines
3. Hot star (T_eff=10000K, log g=4.0) - tests H/He ionization
4. High metallicity ([M/H]=+0.5)
5. Low metallicity ([M/H]=-2.0) - tests weak line handling

---

## XIII. Open Questions for Paula

1. **Fort.X file elimination priority**: Should we prioritize unified pipeline (eliminate fort.X files) or preserve Fortran-compatible workflow?

2. **SPECTRV optional features**: Are CORONO (extended atmosphere), PRD (partial redistribution) features used? Can we defer or skip?

3. **Atlas7v library scope**: Should AtmosphereState module support full ATLAS12 atmosphere iteration, or only atmosphere interpolation (SYNTHE use case)?

4. **Line list format**: Preserve fort.12 binary format for compatibility, or convert to modern format (HDF5, Arrow)?

5. **Validation test cases**: Do you have reference SYNTHE outputs (fort.7 spectra) we can use for validation?

---

## XIV. Document Cross-References

**Related archaeology documents**:
- Deep Dive 08: SPECTRV synthesis kernel
- Deep Dive 09: Line accumulation (fort.12 format)
- Deep Dive 10: XNFPELSYN atmosphere preparation
- Deep Dive 11: Rotational and instrumental broadening
- Deep Dive 12: Line readers (5 heterogeneous formats)
- PHYSICS_PIPELINE_SYNTHE.md: Physics of spectrum synthesis
- SYNTHE_DEEP_DIVE_SUMMARY.md: Initial migration roadmap
- Atlas7v Phase 1-4: Library dependency analysis

**ATLAS12 comparison**:
- COMMON_BLOCK_MAP.md: ATLAS12's 57 blocks (monolithic architecture)
- MIGRATION_ASSESSMENT.md: ATLAS12 migration roadmap

**Architecture decisions**:
- ARCHITECTURE_INSIGHTS.md Decision 5.3: SYNTHE unification strategy (unified + stages)

---

## XV. Conclusion

SYNTHE's COMMON block architecture is **fundamentally simpler** than ATLAS12's:

**ATLAS12 challenge**: 57 COMMON blocks tightly coupling 80 subroutines in one 23K-line program

**SYNTHE challenge**: Fort.X file-based inter-process communication (11 sequential programs)

**SYNTHE's 50 COMMON blocks are well-isolated**:
- 32 blocks in atlas7v library (shared core, must refactor as module)
- 7 blocks in synthe.for (program-specific, straightforward)
- 4 blocks in spectrv.for (optional features, low priority)
- 5 blocks in utilities (simple, minimal state)
- 2 programs have ZERO blocks (quick wins)

**Migration focus should be**:
1. Atlas7v library refactoring (32 blocks → AtmosphereState module)
2. LINDAT → SpectralLine struct (critical inter-program interface)
3. Fort.X file elimination (unified pipeline architecture)

**Estimated timeline**: 14-21 weeks (3.5-5 months) for complete SYNTHE migration, compared to 36-58 weeks for ATLAS12.

SYNTHE is **significantly more tractable** than ATLAS12 due to modular architecture.

---

**Next deliverable**: SYNTHE_MIGRATION_ASSESSMENT.md (complete module classification and roadmap options)
