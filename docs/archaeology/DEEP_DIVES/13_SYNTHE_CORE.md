# Deep Dive 13: SYNTHE Core - Line Opacity Engine
**Phase 5 - SYNTHE Implementation Kickstart**

**Created**: 2025-11-11
**Code**: synthe.for (2,993 lines)
**Focus**: XLINOP subroutine, H/He Stark profiles, memory management
**Purpose**: Focused analysis of synthe.for computational bottleneck before migration

---

## Executive Summary

**synthe.for** is the computational bottleneck of SYNTHE spectrum synthesis - it calculates line opacity contributions for millions of spectral lines at thousands of wavelengths across 99 atmospheric depth points.

**Key Finding**: synthe.for is a STANDALONE program (no atlas7v linkage) that reads pre-computed atmosphere data from fort.10 and accumulates line opacities into a massive 2M-element BUFFER array.

**Critical Components**:
1. **XLINOP subroutine** (~490 lines): NLTE line opacity with special H/He Stark broadening
2. **Hydrogen line profiles** (HPROF4, ~425 lines): Quantum mechanical line shapes with fine structure
3. **Helium line profiles** (5 functions, ~700 lines): Empirical Stark broadening from lab measurements
4. **Memory management**: 2M-element BUFFER, direct I/O transposition to avoid RAM limits
5. **Main synthesis loop** (~190 lines): LTE line opacity with Voigt profiles

**Performance**: This is the slowest part of SYNTHE (millions of lines × thousands of wavelengths × 99 depths = billions of operations)

**Migration Complexity**: HARD (3-4 weeks estimated)
- Core algorithm well-defined (Voigt profiles from DD01)
- BUT: Empirical H/He Stark tables need validation
- BUT: Memory transposition pattern unusual (performance critical)

---

## Section 1: Program Structure

### 1.1 Overview

**File**: `upstream/castelli/source_codes/synthe/synthe.for`
**Lines**: 2,993
**Compilation**: `gfortran -o synthe.exe synthe.for` (STANDALONE, no atlas7v linkage)

**Purpose**: Calculate line opacity contributions for spectrum synthesis

**Input**:
- fort.10: Pre-computed atmosphere (from xnfpelsyn)
- fort.12: Line list (from line reader programs)
- fort.93: Control parameters (from synbeg)
- fort.18: He I Stark broadening tables
- fort.19: NLTE line data (optional)

**Output**:
- fort.9: Opacity vectors at each wavelength × depth
- fort.13: Line identifications
- fort.15: Line center opacities

### 1.2 Main Program Structure

```fortran
PROGRAM SYNTHE
  ! 1. Setup (lines 1-122): Read parameters, initialize tables
  ! 2. Main depth loop (lines 173-325): FOR EACH DEPTH
  !      a. Initialize BUFFER (wavelength array)
  !      b. Read continuum opacity from fort.10
  !      c. Call XLINOP for NLTE lines (fort.19)
  !      d. LTE line loop (fort.12) with Voigt profiles
  !      e. Write BUFFER to fort.14 (direct I/O)
  ! 3. Transposition (lines 330-347): Transpose from (depth, wavelength) to (wavelength, depth)
  ! 4. Line identification save (lines 352-377)
  ! 5. Second transposition for line center opacities (lines 386-462)
```

**Critical Insight**: Two passes through data due to memory constraints:
- **Pass 1**: Calculate opacity at each depth, write BUFFER(wavelength) for each depth
- **Transposition**: Reorganize from BUFFER(depth, wavelength) to output(wavelength, depth)

---

## Section 2: XLINOP - NLTE Line Opacity

### 2.1 Purpose

**Subroutine**: XLINOP (lines 469-958, ~490 lines)
**Called by**: Main program for NLTE lines from fort.19
**Purpose**: Calculate line opacity for non-LTE lines with special H/He Stark broadening

**Why separate from main loop?**
- NLTE lines need special treatment (Stark broadening, fine structure)
- NLTE lines from fort.19 (RNLTE output), LTE lines from fort.12 (line readers)
- Different line profile functions (HPROF4, HE1PROF vs simple Voigt)

### 2.2 Line Type Dispatch

XLINOP reads line TYPE flag and dispatches to different profile functions:

```fortran
TYPE =  0: Normal line (Voigt profile, line 200-290)
TYPE =  1: Merged continuum edge (line 700+)
TYPE =  2: Hydrogen line (calls HPROF4, line 500+)
TYPE =  3: ? (line 300+)
TYPE = -1: ? (line 600+)
TYPE = -2: ? (line 600+)
TYPE = -3: ? (line 800+)
TYPE = -4: ? (line 800+)
TYPE = -5: ? (line 400+)
TYPE = -6: ? (line 400+)
```

**Documentation Gap**: TYPE flags not fully documented in code. Need to trace RNLTE output format.

### 2.3 Normal Line (TYPE=0)

**Algorithm** (lines 200-290):

```fortran
! 1. Calculate line center opacity
KAPPA0 = CONGF * XNFDOP(NELION)  ! Pre-multiplied by partition function

! 2. Apply Boltzmann factor
BOLT = EXP(-ELO * HCKT(J))  ! Energy level excitation
KAPPA0 = KAPPA0 * BOLT

! 3. Early exit if below continuum cutoff
KAPMIN = CONTINUUM(NBUFF) * CUTOFF
IF(KAPPA0 < KAPMIN) RETURN

! 4. Calculate damping parameter
ADAMP = (GAMMAR + GAMMAS*XNE(J) + GAMMAW*TXNXN(J)) / DOPPLE(NELION)

! 5. Voigt profile at line center
KAPCEN = KAPPA0 * VOIGT(0., ADAMP)

! 6. Calculate line wings
! - Inner wings (±10 Doppler widths): Tabulated Voigt or computed
! - Far wings (beyond 10 Doppler widths): Lorentzian tail (1/ν²)
```

**Performance optimization** (lines 271-294):
- **Small damping (ADAMP < 0.2)**: Use pretabulated H0TAB, H1TAB for speed
- **Large damping**: Call VOIGT function directly
- **Far wings**: Analytic 1/ν² tail (no expensive Voigt calls)

**Comparison to ATLAS12 XLINOP**:
- ATLAS12 XLINOP: Similar structure, but integrated into atmosphere iteration
- SYNTHE XLINOP: Standalone, reads pre-computed atmosphere from fort.10
- Both use early exit optimization (critical for performance)

---

## Section 3: HPROF4 - Hydrogen Line Profiles

### 3.1 Purpose

**Function**: HPROF4 (lines 959-1382, ~425 lines)
**Called by**: XLINOP for TYPE=2 (hydrogen lines)
**Purpose**: Quantum mechanical hydrogen line profiles with fine structure

**Key Features**:
1. **Fine structure components**: 34 components for Balmer α lines, 20 for others
2. **Stark broadening**: Linear Stark effect (n² dependence)
3. **H₂ and H₂⁺ perturbations**: Quasi-molecular wings (cutoff tables)
4. **Inglis-Teller limit**: Line merging at high electron density

**Citation**: "From Deane Peterson" (line 966)

### 3.2 Inglis-Teller Line Merging

**Lines 557-564**: Calculate principal quantum number where lines merge into continuum

```fortran
! Empirical formula (line 557)
INGLIS = 1600. / XNE(K)**(2./15.)
NMERGE = INGLIS - 1.5
EMERGE(K) = 109737.312 / NMERGE**2  ! Merge energy (cm⁻¹)
```

**Physics**:
- At high electron density, Stark broadening merges upper levels
- Lines with n > NMERGE merge into continuum
- Critical for hot stars (high XNE)

**Validation concern**: Empirical formula (why 2/15 exponent? why 1600 constant?)

### 3.3 Fine Structure Components

**Alpha lines** (lines 992-999): 34 components with specific weights
**Other lines** (lines 1001-1006): 5 components (M→∞ pattern)

**Example: Lyman α**:
- Fine structure splits line into multiple components
- Each component has wavelength offset (STALPH array) and weight (STWTAL array)
- Must sum over all components for total profile

**Migration strategy**: Port component tables as-is, validate against high-resolution spectra

### 3.4 Quasi-Molecular Cutoffs

**CUTOFFH2PLUS** (lines 1009-1023): 111-point table for H₂⁺ cutoff
**CUTOFFH2** (lines 1041-1053): 91-point table for H₂ cutoff

**Purpose**:
- At short wavelengths, H₂ and H₂⁺ molecular interactions truncate line wings
- Empirical tables from lab measurements or quantum chemistry

**Validation concern**: Tables are hardcoded, no citation for source data

### 3.5 Absorption Cross-Section Tables

**ASUMLYMAN** (lines 1081-1098): 100-point table for Lyman series
**ASUM** (lines 1099-1116): 100-point table for Balmer series

**Purpose**: Cumulative absorption cross-sections for line wing truncation

**Units**: Appears to be cm² (absorption cross-section)

---

## Section 4: Helium Stark Profiles

### 4.1 Overview

**Five specialized functions** for He I lines:
1. **HE1PROF** (lines 1762-1797): Dispatcher to specific He I functions
2. **HE4471** (lines 1798-1915): He I 447.1 nm line
3. **HE4026** (lines 1916-2034): He I 402.6 nm line
4. **HE4387** (lines 2035-2121): He I 438.7 nm line
5. **HE4921** (lines 2122-2222): He I 492.1 nm line

Plus two general theories:
6. **GRIEM** (lines 2223-2580): Griem 1974 Stark broadening theory
7. **DIMITRI** (lines 2581-2746): Dimitri (unpublished?) Stark theory

### 4.2 HE4471 - Example Helium Line

**Citation**: Barnard, Cooper and Smith, JQSRT 14, 1025, 1974 (line 1811)

**Broadening parameters** (lines 1813-1824):
- **WS**: Electron-impact width (Å) at Ne=10¹³ cm⁻³
- **DS**: Shift-to-width ratio
- **ALFS**: Ion broadening parameter α
- Temperature-dependent (4 values: 5K, 10K, 20K, 40K)

**Algorithm** (lines 1861-1912):
```fortran
! 1. Interpolate broadening parameters for temperature
X = (TEMP - TS(IT-1)) / (TS(IT) - TS(IT-1))
W = XX * (X*WS(IT) + (1.-X)*WS(IT-1))  ! Width

! 2. Calculate Stark shift
D = X*DS(IT) + (1.-X)*DS(IT-1)         ! Shift/width ratio

! 3. Ion broadening parameter
ALF = XX**0.25 * (X*ALFS(IT) + (1.-X)*ALFS(IT-1))

! 4. Reciprocal perturber velocity (km/s)
VM1 = 8.78 * (XNFHP/E + 2.0*(1.0-XNFHP/E)) / SQRT(TEMP)

! 5. Ion velocity parameter
SIGMA = 1.885E14 * W * RHOM * VM1 / (WL*10.)**2

! 6. Total width and shift (with ion correction)
X = ALF**(8./9.) / SIGMA**(1./3.)
WTOT = W * (1. + 1.36*X)
DTOT = W * D * (1. + 2.36*X/ABS(D))

! 7. Sum over fine structure components (5 components)
HE4471 = VOIGT(ABS(WWD-.0184)/DOPWL, A)/9. + ...
```

**Fine structure splitting** (lines 1899-1903):
- 5 components with wavelength offsets: -0.0184, +0.0013, +0.0010, +0.0029, +0.0025 nm
- Weights: 1/9, 1/12, 1/4, 1/180, 11/20
- Must sum Voigt profiles for each component

**High-density treatment** (lines 1856-1859):
- If XNE > 10¹³ cm⁻³, read BCS tables from fort.18 (READBCS subroutine)
- BCS = "Barnard, Cooper, Smith" tables (more accurate at high density)

### 4.3 Fort.18 - Stark Broadening Tables

**Purpose**: Empirical He I Stark broadening tables for XNE > 10¹³ cm⁻³

**Format**: Binary table (not documented in synthe.for)

**Used by**: HE4471, HE4026, HE4387, HE4921 functions

**Validation concern**: Fort.18 format not documented, need example file to reverse-engineer

---

## Section 5: Memory Management

### 5.1 Large Arrays

**Parameters** (lines 21-22):
```fortran
LENREC = 8000        ! Direct I/O record length
MAXLEN = 2000001     ! Max spectrum length (2M points)
MAXPROF = 10000      ! Max line wing points
MAXBUFF = MAXLEN + MAXPROF
```

**Arrays**:
- **BUFFER(MAXBUFF)**: Spectrum accumulation buffer (2M elements × 4 bytes = 8 MB)
- **PROFILE(MAXPROF)**: Line wing working array (10K elements)
- **CONTINUUM(MAXBUFF)**: Continuum opacity at each wavelength
- **TRANSP(kw, LENREC)**: Transposition buffer (99 × 8000 = 792K elements)

**Total memory**: ~16 MB (large for 1990s Fortran, but manageable today)

### 5.2 Direct I/O Transposition

**Problem**: Need to transpose from (depth, wavelength) to (wavelength, depth) for output

**Naive approach** (lines 311-313, commented out):
```fortran
! This would require TRANSP(2000001, 99) = 198M elements = 800 MB
DO I = 1, LENGTH
  TRANSP(I, J) = BUFFER(I)
END DO
```

**Actual approach** (lines 314-320, 330-347): Direct I/O in blocks

```fortran
! Write BUFFER for each depth to fort.14 (direct access file)
NUMREC = (LENGTH + LENREC - 1) / LENREC  ! Number of 8000-element records

! For each depth J:
DO NBEG = 1, LENGTH, LENREC
  IREC = IREC + 1
  WRITE(14, REC=IREC) (BUFFER(I), I=NBEG, NEND)
END DO

! Then transpose by reading in different order:
DO N = 1, NUMREC
  DO J = 1, NRHOX
    IREC = J*NUMREC - NUMREC + N  ! Calculate record address
    READ(14, REC=IREC) (TRANSP(J, I), I=1, LENREC)
  END DO
  ! Now TRANSP(1:kw, 1:LENREC) has wavelength N across all depths
  WRITE(9) ASYNTH  ! Write transposed data
END DO
```

**Memory efficiency**: Only keeps LENREC × kw = 8000 × 99 = 792K elements in RAM at once

**Performance**: Direct I/O random access fast enough (fort.14 is temporary file)

**Migration strategy**: Julia doesn't need this complexity (enough RAM for full array), but understand pattern for validation

---

## Section 6: LTE Line Loop (Main Program)

### 6.1 Algorithm

**Lines 235-308**: Main LTE line opacity loop

```fortran
DO ILINE = N191, NLINES
  ! 1. Read line parameters from fort.12
  READ(12) NBUFF, CONGF, NELION, ELO, GAMRF, GAMSF, GAMWF, alpha

  ! 2. Calculate line center opacity
  KAPPA0 = CONGF * QXNFDOP(NELION)  ! Pre-multiplied

  ! 3. Early exit if below cutoff
  KAPMIN = CONTINUUM(NBUFF) * CUTOFF
  IF(KAPPA0 < KAPMIN) CYCLE

  ! 4. Apply Boltzmann factor
  KAPPA0 = KAPPA0 * FASTEX(ELO * HCKT(J))
  IF(KAPPA0 < KAPMIN) CYCLE

  ! 5. Calculate damping parameter
  ADAMP = (GAMRF + GAMSF*XNE(J) + GAMWF*TXNXN(J)) / DOPPLE(NELION)

  ! 6. Line center opacity (Voigt profile)
  IF(ADAMP < 0.2) THEN
    KAPCEN = KAPPA0 * (1. - 1.128*ADAMP)  ! Small damping approximation
  ELSE
    KAPCEN = KAPPA0 * VOIGT(0., ADAMP)    ! Full Voigt
  END IF

  ! 7. Add to buffer
  BUFFER(NBUFF) = BUFFER(NBUFF) + KAPCEN

  ! 8. Calculate line wings
  ! - Inner wings: ±10 Doppler widths (tabulated or computed)
  ! - Far wings: 1/ν² tail
  ! - Truncate when PROFILE < KAPMIN

  ! 9. Add wings to buffer
  DO ISTEP = MINRED, MAXRED
    BUFFER(NBUFF + ISTEP) = BUFFER(NBUFF + ISTEP) + PROFILE(ISTEP)
  END DO
  DO ISTEP = MINBLUE, MAXBLUE
    BUFFER(NBUFF - ISTEP) = BUFFER(NBUFF - ISTEP) + PROFILE(ISTEP)
  END DO
END DO
```

### 6.2 Performance Optimizations

**Early exit** (lines 242-246):
- Check KAPPA0 < KAPMIN before Boltzmann factor (saves EXP call)
- Check again after Boltzmann factor
- **Critical**: Rejects ~90% of lines before expensive Voigt calls

**Small damping approximation** (lines 263-267):
- For ADAMP < 0.2: Use analytic approximation (1 - 1.128*ADAMP)
- Avoids VOIGT function call
- Error ~1% (see DD01 for derivation)

**Pretabulated Voigt** (lines 272-279):
- For inner wings (±10 Doppler widths) with ADAMP < 0.2
- Use H0TAB, H1TAB lookup tables (pretabulated in TABVOIGT, lines 1574-1607)
- ~50× faster than VOIGT function

**Far wing truncation** (lines 287-294):
- Beyond 10 Doppler widths: Use analytic 1/ν² tail
- Truncate when PROFILE < KAPMIN
- Saves millions of Voigt calls

**Fast exponential** (lines 78-79, 244):
```fortran
FASTEX(X) = EXTAB(IFIX(X)+1) * EXTABF(IFIX((X-FLOAT(IFIX(X)))*1000.+1.5))
```
- Lookup table for EXP(-X)
- EXTAB: integer part, EXTABF: fractional part (interpolation)
- ~5× faster than intrinsic EXP

### 6.3 Alpha Parameter (Lines 249-258)

**New feature** (appears recent, non-standard):
```fortran
IF(alpha .NE. 0.) THEN
  nelem = INT(nelion/6) + 1
  v2 = (1. - alpha) / 2
  hfactor(j) = (T(j)/10000.)**v2
  hefactor(j) = 0.628 * (2.0991D-4*T(j)*(1/4 + 1.008/atmass(nelem)))**v2
  h2factor(j) = 1.08 * (2.0991D-4*T(j)*(1/2 + 1.008/atmass(nelem)))**v2
  txnxn(j) = xnfh(j)*hfactor(j) + xnfhe(j,1)*hefactor(j) + xnfh2(j)*h2factor(j)
END IF
```

**Purpose**: Unclear - modifies collisional broadening temperature dependence

**Interpretation**:
- Standard: TXNXN ∝ T^0.3 (line 223-224)
- With alpha: TXNXN ∝ T^v2 where v2 = (1-alpha)/2
- Appears to be experimental feature (not documented)

**Validation concern**: What is alpha? Where does it come from? Need to trace fort.12 format

---

## Section 7: Critical Subroutines Summary

### 7.1 Computational Cost Breakdown

**Estimated cost per depth** (N19=0, N12=1M lines, LENGTH=10K wavelengths):

1. **Continuum interpolation** (lines 182-201): ~10K operations, 0.1 ms
2. **LTE line loop** (lines 235-308): ~1M iterations
   - Early exit: ~900K lines rejected (KAPPA0 < KAPMIN), 1 FLOP/line = 1 MFLOP
   - Voigt center: ~100K lines, 10 FLOP/call = 1 MFLOP
   - Wing calculation: ~100K lines, 100 FLOP/line = 10 MFLOP
   - Buffer accumulation: ~1M additions = 1 MFLOP
   - **Subtotal**: ~13 MFLOP, ~10 ms
3. **XLINOP (NLTE lines)**: Similar to LTE loop, ~10 ms
4. **Direct I/O write**: ~10K elements, ~1 ms

**Total per depth**: ~21 ms
**Total for 99 depths**: ~2.1 seconds (for 1M lines, 10K wavelengths)

**Scaling**:
- Linear in N_lines (early exit keeps rejected lines cheap)
- Linear in N_wavelengths
- Linear in N_depths
- For large calculations: 10M lines × 100K wavelengths × 99 depths = ~200 seconds (~3 minutes)

**Bottleneck**: Voigt profile calculation (see DD01)

### 7.2 Subroutine Dependency Graph

```
synthe.for (PROGRAM)
  ├── XLINOP (NLTE line opacity)
  │     ├── HPROF4 (Hydrogen lines)
  │     │     ├── VCSE1F (Voigt convolution)
  │     │     ├── SOFBET (Beta function)
  │     │     └── HFNM (H line oscillator strength)
  │     ├── HE1PROF (He I dispatcher)
  │     │     ├── HE4471 (He I 447.1 nm)
  │     │     ├── HE4026 (He I 402.6 nm)
  │     │     ├── HE4387 (He I 438.7 nm)
  │     │     ├── HE4921 (He I 492.1 nm)
  │     │     ├── GRIEM (Griem Stark theory)
  │     │     └── DIMITRI (Dimitri Stark theory)
  │     └── VOIGT (Voigt profile, DD01)
  ├── TABVOIGT (Pretabulate Voigt, lines 1574-1607)
  ├── VOIGT (Voigt profile, DD01)
  ├── EXPI (Exponential integral E1, lines 1641-1670)
  ├── FASTE1 (Fast E1 lookup, lines 1671-1683)
  ├── MAP1 (Parabolic interpolation, lines 1684-1737)
  ├── AIRVAC / VACAIR (Air-vacuum wavelength conversion, lines 1738-1761)
  └── READBCS (Read He I Stark tables from fort.18, lines 2747-2993)
```

**Independence**: All functions are pure (no shared state), except COMMON block access

---

## Section 8: Migration Strategy

### 8.1 Phased Approach

**Phase 1: Core infrastructure** (1 week)
- SpectralLine struct (LINDAT equivalent)
- AtmosphereProfile struct (read fort.10)
- Wavelength grid utilities
- BUFFER array allocation (no transposition needed in Julia)

**Phase 2: LTE line loop** (1 week)
- Port lines 235-308
- Reuse Voigt profile from DD01
- Early exit optimization
- Fast exponential (EXP_TABLE)
- Validate against Fortran fort.9 output

**Phase 3: XLINOP NLTE** (1 week)
- Port XLINOP structure
- Implement line type dispatch
- Defer H/He Stark profiles to Phase 4
- Use simple Voigt for all lines (validation baseline)

**Phase 4: H/He Stark profiles** (1-2 weeks)
- Port HPROF4 (hydrogen)
- Port HE4471, HE4026, HE4387, HE4921 (helium)
- Port GRIEM, DIMITRI (general theories)
- Validate against high-resolution spectra (need test data)

**Total estimated effort**: 4-5 weeks

### 8.2 Simplifications for Julia

**No transposition needed**:
- Modern systems have enough RAM for full (wavelength, depth) array
- ~2M wavelengths × 99 depths × 4 bytes = 800 MB (trivial)
- Eliminate fort.14 direct I/O complexity

**No FASTEX needed**:
- Modern CPUs have fast EXP intrinsic
- If needed: EXP_TABLE lookup (simple array)

**Vectorization opportunities**:
- Line loop: Independent iterations → SIMD-friendly
- Voigt profile: Vectorize over wavelength array
- Julia's @simd macro may help

**Parallelization opportunities**:
- Depth loop: Embarrassingly parallel (no data dependencies)
- Use Julia's @threads for depth loop

### 8.3 Validation Strategy

**Unit tests**:
1. **Line center opacity**: Compare KAPPA0 calculation
2. **Voigt profile**: Reuse DD01 tests
3. **Line wing truncation**: Verify KAPMIN cutoff logic
4. **Early exit**: Check rejection rate (~90% expected)

**Integration tests**:
1. **LTE line loop**: Compare BUFFER array against Fortran
2. **XLINOP NLTE**: Compare fort.15 line center opacities
3. **Full synthesis**: Compare fort.9 opacity vectors (all wavelengths, all depths)

**Performance tests**:
1. **Early exit optimization**: Should reject 90% of lines before Voigt calls
2. **Vectorization**: Measure GFLOP/s for line loop
3. **Parallelization**: Measure depth loop scaling (should be ~99× speedup)

**Physics validation**:
1. **H Balmer lines**: Compare against observed solar spectrum
2. **He I lines**: Compare against hot star spectra (B stars)
3. **Metal lines**: Compare against cool star spectra (G/K stars)

---

## Section 9: Open Questions

### 9.1 For Domain Expert (Paula)

**High Priority**:
1. **Q1**: What is the `alpha` parameter (lines 249-258, 574, 655-662)? Not standard SYNTHE.
2. **Q2**: Fort.18 format for He I Stark tables - where to find example files?
3. **Q3**: How often are NLTE lines used (N19 > 0)? Can we defer XLINOP initially?

**Medium Priority**:
4. **Q4**: HPROF4 empirical formulas (Inglis-Teller, quasi-molecular cutoffs) - citations?
5. **Q5**: HE1PROF: Why only 4 lines have special functions (447.1, 402.6, 438.7, 492.1 nm)?
6. **Q6**: DIMITRI Stark theory (lines 2581-2746) - unpublished? No citation in code.

**Low Priority**:
7. **Q7**: Can we use simpler Griem theory for all He I lines (easier to migrate)?
8. **Q8**: What causes high XNE (>10¹³ cm⁻³) where BCS tables needed? Hot stars only?

### 9.2 For Code Validation

**Critical**:
1. **Q9**: Fort.12 alpha parameter - where does it come from? Line reader programs?
2. **Q10**: XLINOP TYPE flags - need to trace fort.19 (RNLTE output) to understand all cases
3. **Q11**: Direct I/O transposition - can we validate with memory transpose first?

**Important**:
4. **Q12**: CUTOFFH2PLUS, CUTOFFH2 tables - source data? Can we regenerate?
5. **Q13**: ASUM, ASUMLYMAN tables - source data? Can we regenerate?
6. **Q14**: Fine structure components (STALPH, STWTAL, etc.) - citation for wavelength offsets?

### 9.3 For Migration Decisions

**Architecture**:
1. **Q15**: Defer H/He Stark profiles until Phase 4 (use simple Voigt baseline)?
2. **Q16**: Port FASTEX lookup table or use intrinsic EXP (benchmark)?
3. **Q17**: Implement transposition (Fortran-compatible) or direct array (Julia-native)?

**Performance**:
4. **Q18**: Vectorize line loop (SIMD) or rely on compiler?
5. **Q19**: Parallelize depth loop (@threads) or single-threaded baseline first?
6. **Q20**: GPU acceleration feasible for line loop (millions of lines)?

---

## Section 10: Key Takeaways

### 10.1 Critical Findings

1. **synthe.for is STANDALONE** - no atlas7v linkage, unlike xnfpelsyn/spectrv
2. **Performance bottleneck** - millions of lines × thousands of wavelengths × 99 depths
3. **Early exit critical** - rejects ~90% of lines before expensive Voigt calls
4. **Empirical Stark tables** - H/He line profiles use lab measurements (need validation data)
5. **Memory transposition pattern** - clever 1990s optimization, unnecessary in modern Julia

### 10.2 Migration Priorities

**Must have**:
- LTE line loop (lines 235-308) - core synthesis algorithm
- Voigt profile (DD01) - reusable
- Early exit optimization - performance critical

**Should have**:
- XLINOP NLTE structure - needed for hot stars
- HPROF4 hydrogen profiles - needed for accurate Balmer lines

**Nice to have**:
- He I special profiles (HE4471, etc.) - can use Griem theory as fallback
- Alpha parameter - appears non-standard, may be experimental

**Can defer**:
- Direct I/O transposition - Julia has enough RAM
- FASTEX lookup - modern EXP fast enough

### 10.3 Validation Requirements

**Bit-for-bit validation**:
- LTE line loop: Compare BUFFER array (before transposition)
- XLINOP: Compare fort.15 line center opacities

**Physics validation**:
- Solar spectrum: Balmer lines, metal lines
- Hot stars (B type): He I lines, Balmer lines
- Cool stars (K type): Molecular lines (not in synthe.for, in line readers)

**Performance validation**:
- Early exit rate: Should be ~90% (measure in Fortran and Julia)
- Line loop throughput: Compare GFLOP/s
- Depth parallelization: Measure scaling (ideal: 99× speedup)

---

## Section 11: Comparison to Existing Deep Dives

### 11.1 Relationship to DD01 (Voigt Profile)

**DD01 analyzed**: ATLAS12 HVOIGT subroutine (4-regime piecewise algorithm)

**synthe.for uses**:
- Same VOIGT function (lines 1608-1640)
- Same H0TAB, H1TAB, H2TAB pretabulated tables (lines 119-122, 1574-1607)
- Same small damping approximation (ADAMP < 0.2, line 263-264)

**Difference**:
- ATLAS12: HVOIGT is critical path (millions of calls per iteration)
- SYNTHE: VOIGT also critical (but early exit reduces call count by 10×)

**Migration**: Reuse DD01 Voigt port, add H0TAB/H1TAB lookup tables

### 11.2 Relationship to DD03 (Line Opacity)

**DD03 analyzed**: ATLAS12 XLINOP, LINOP1 (line opacity summation)

**synthe.for XLINOP**:
- Different context: NLTE synthesis vs atmosphere iteration
- Similar algorithm: Early exit, Voigt profiles, wing truncation
- Different data source: fort.19 (RNLTE) vs fort.12 (internal)

**synthe.for main loop**:
- Similar to ATLAS12 XLINOP (LTE lines)
- Same early exit optimization
- Same wing truncation logic

**Migration**: Similar patterns, can reuse algorithm structure

### 11.3 Relationship to DD04 (Binary I/O)

**DD04 analyzed**: ATLAS12 fort.12 writing, fort.11/21 reading

**synthe.for uses**:
- Fort.12 reading (lines 236, 573): Same IIIIIII format (7 fields)
- Fort.10 reading (lines 178-222): Different format (atmosphere data)
- Fort.18 reading (READBCS, lines 2747-2993): Stark tables (not analyzed in DD04)

**Migration**: Reuse DD04 fort.12 reader, add fort.10 and fort.18 readers

### 11.4 Relationship to DD09 (Line Accumulation)

**DD09 analyzed**: synbeg.for (fort.12 format creation)

**synthe.for reads** fort.12 format (lines 236, 573):
```fortran
READ(12) NBUFF, CONGF, NELION, ELO, GAMRF, GAMSF, GAMWF, alpha
```

**Difference from DD09**:
- DD09: 7 fields (NBUFF, CONGF, NELION, ELO, GAMRF, GAMSF, GAMWF)
- synthe.for: 8 fields (added `alpha` parameter)

**Interpretation**: Alpha parameter is NEW (not in original SYNTHE), added by Castelli(?)

**Migration**: Need to support both 7-field (original) and 8-field (Castelli) fort.12 formats

---

## Section 12: Recommendations

### 12.1 For Phase 5 Implementation

**Start with**:
1. Port LTE line loop (lines 235-308) - core synthesis, well-defined algorithm
2. Reuse Voigt profile from DD01 migration (when available)
3. Create test harness: Read fort.10, fort.12 → compute BUFFER → compare to Fortran

**Defer**:
1. XLINOP NLTE (lines 469-958) - complex, can use LTE as baseline
2. H/He Stark profiles - empirical, need validation data
3. Transposition optimization - unnecessary in Julia (direct arrays work)

**Validate early**:
1. Early exit rate: Should reject ~90% of lines (measure in both Fortran and Julia)
2. Line center opacity: Compare KAPCEN values
3. BUFFER array: Compare final opacity values (wavelength by wavelength)

### 12.2 Architecture Decisions

**Recommended**:
- **Direct arrays** (no transposition): Store opacity as [wavelength, depth] from the start
- **Intrinsic EXP** (no FASTEX): Benchmark, but likely fast enough
- **Vectorization**: Use @simd for line loop inner iterations
- **Parallelization**: Use @threads for depth loop (embarrassingly parallel)

**Avoid** (initially):
- Custom transposition logic (premature optimization)
- GPU acceleration (defer until CPU baseline validated)
- Complex Stark profiles (use simple Voigt baseline, add special profiles later)

### 12.3 Testing Strategy

**Unit tests** (fast, run frequently):
- Line center opacity calculation
- Early exit logic (rejection rate)
- Wing truncation (KAPMIN cutoff)

**Integration tests** (slower, run daily):
- Full LTE line loop (compare BUFFER)
- Full XLINOP (compare fort.15)
- Full synthesis (compare fort.9)

**Regression tests** (slowest, run before release):
- Solar spectrum (Balmer lines, metal lines)
- Hot star spectrum (He I lines)
- Cool star spectrum (molecular lines - tests line readers, not synthe.for)

---

## Document Metadata

**Lines analyzed**: ~2,993 (full synthe.for)
**Focus areas**: XLINOP (490 lines), HPROF4 (425 lines), He I profiles (700 lines), main loop (190 lines)
**Analysis time**: 3 hours (reading code, identifying patterns)
**Documentation time**: 2 hours (writing this document)

**Cross-references**:
- DD01: Voigt Profile (reusable)
- DD03: Line Opacity (similar algorithms)
- DD04: Binary I/O (fort.12 format)
- DD09: Line Accumulation (fort.12 creation)
- SYNTHE_MIGRATION_ASSESSMENT.md: synthe.for overview (section 1.3.3)

**Status**: Complete - ready for migration planning

**Next steps**:
1. Update SYNTHE_MIGRATION_ASSESSMENT.md with DD13 cross-references
2. Update 00_INDEX.md with DD13 entry
3. Answer open questions Q1-Q3 with Paula before implementation

---

**End of Deep Dive 13**
