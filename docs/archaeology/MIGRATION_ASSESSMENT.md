# Section 1: ATLAS12 Subroutine Migration Classification

**Total Subroutines Analyzed**: 80
**Date**: November 9, 2025
**Classification Method**: Lines of code, COMMON block dependencies, Deep Dive ranking, algorithm complexity

---

## Summary Statistics

| Category | Count | Percentage | Est. Lines to Translate |
|----------|-------|-----------|-------------------------|
| **Easy** | 26 | 32.5% | ~1,100 |
| **Medium** | 5 | 6.3% | ~550 |
| **Hard** | 49 | 61.2% | ~10,400 |
| **TOTAL** | **80** | **100%** | **~12,050** |

---

## Easy Subroutines (26 total)

**Characteristic**: Standalone or minimal dependencies, <100 lines (mostly), simple mathematics or data handling

### Pure Utilities (No COMMON blocks)

1. **DERIV** (lines 1221-1240, 20 lines)
   - **Purpose**: Numerical differentiation (finite difference derivative)
   - **Dependencies**: 0 COMMON blocks (pure function)
   - **Complexity**: Simple numerical method
   - **Why Easy**: Self-contained, no global state, basic calculus
   - **Migration Effort**: Trivial - direct translation to Julia function

2. **INTEG** (lines 1241-1258, 18 lines)
   - **Purpose**: Numerical integration using trapezoidal rule
   - **Dependencies**: 0 COMMON blocks
   - **Complexity**: Standard integration algorithm
   - **Why Easy**: Standalone, well-defined algorithm, no external state
   - **Migration Effort**: Trivial

3. **PARCOE** (lines 1259-1303, 45 lines)
   - **Purpose**: Lagrange interpolation polynomial coefficients
   - **Dependencies**: 0 COMMON blocks
   - **Complexity**: Standard polynomial fitting
   - **Why Easy**: Pure mathematics, no side effects
   - **Migration Effort**: Low - straightforward mathematical translation

4. **SOLVIT** (lines 1362-1419, 58 lines)
   - **Purpose**: Solve linear system (Gaussian elimination with partial pivoting)
   - **Dependencies**: 0 COMMON blocks
   - **Complexity**: Classic linear algebra algorithm
   - **Why Easy**: Standalone matrix solver, well-understood algorithm
   - **Migration Effort**: Low - can use Julia's LinearAlgebra if dimensions small, or translate directly

5. **W** (lines 1420-1427, 8 lines)
   - **Purpose**: Weight calculation (purpose from context, likely integration weight)
   - **Dependencies**: 0 COMMON blocks
   - **Complexity**: Trivial (3-line calculation)
   - **Why Easy**: Minimal functionality
   - **Migration Effort**: Trivial

6. **DUMMYR** (lines 2586-2593, 8 lines)
   - **Purpose**: Placeholder routine (possibly legacy, may not be called)
   - **Dependencies**: 0 COMMON blocks
   - **Complexity**: No-op
   - **Why Easy**: Can be skipped or implemented as stub
   - **Migration Effort**: Negligible

7. **LINTER** (lines 5974-5987, 14 lines)
   - **Purpose**: Linear interpolation (1D)
   - **Dependencies**: 0 COMMON blocks
   - **Complexity**: Basic interpolation
   - **Why Easy**: Pure utility function, no global state
   - **Migration Effort**: Trivial

8. **HE2LIN** (lines 15991-15993, 3 lines)
   - **Purpose**: He II line (placeholder, minimal code)
   - **Dependencies**: 0 COMMON blocks
   - **Complexity**: Stub subroutine
   - **Why Easy**: Nearly empty routine
   - **Migration Effort**: Trivial

### Stub/Minimal Molecule Opacity Routines (Mostly No COMMON blocks)

These 12 subroutines are molecule opacity stubs that simply return zero or a placeholder value:

9. **C3OP** (lines 9615-9617, 3 lines)
10. **C4OP** (lines 9618-9620, 3 lines)
11. **N2OP** (lines 9621-9623, 3 lines)
12. **N3OP** (lines 9624-9626, 3 lines)
13. **N4OP** (lines 9627-9629, 3 lines)
14. **N5OP** (lines 9630-9632, 3 lines)
15. **O2OP** (lines 9633-9635, 3 lines)
16. **O3OP** (lines 9636-9638, 3 lines)
17. **O4OP** (lines 9639-9641, 3 lines)
18. **O5OP** (lines 9642-9644, 3 lines)
19. **O6OP** (lines 9645-9647, 3 lines)

   - **Purpose**: Placeholder opacity functions for molecular species (not implemented)
   - **Dependencies**: 0-1 COMMON blocks (if any)
   - **Complexity**: Trivial stubs (1 RETURN statement)
   - **Why Easy**: Nearly empty, clearly not critical
   - **Migration Effort**: Trivial - implement as placeholder stubs or remove

### Simple Opacity/Data Access (Minimal COMMON blocks)

20. **LINSOP** (lines 9816-9822, 7 lines)
   - **Purpose**: Set line opacity variable
   - **Dependencies**: 1 COMMON block (read/write flag)
   - **Complexity**: Simple state assignment
   - **Why Easy**: Trivial setter function
   - **Migration Effort**: Trivial

21. **XLISOP** (lines 10314-10320, 7 lines)
   - **Purpose**: Similar to LINSOP (state manipulation)
   - **Dependencies**: 1 COMMON block
   - **Why Easy**: Trivial
   - **Migration Effort**: Trivial

22. **XSOP** (lines 10335-10341, 7 lines)
   - **Purpose**: State variable assignment
   - **Dependencies**: 1 COMMON block
   - **Why Easy**: Trivial
   - **Migration Effort**: Trivial

23. **PRETABLOG** (lines 14433-14439, 7 lines)
   - **Purpose**: Pretabulation flag setter
   - **Dependencies**: 1 COMMON block
   - **Why Easy**: Trivial flag assignment
   - **Migration Effort**: Trivial

24. **TABVOIGT** (lines 15007-15038, 32 lines)
   - **Purpose**: Create Voigt function lookup tables (H0TAB, H1TAB, H2TAB for fast Voigt evaluation)
   - **Dependencies**: 1 COMMON block (table storage)
   - **Complexity**: Tabulation routine - fills arrays with Voigt function values
   - **Why Easy**: Initialization routine, simple loop, read-only COMMON block usage (fills table)
   - **Migration Effort**: Low - translate table initialization logic, ensures Voigt tables available

25. **BLOCKE** (lines 1620-1681, 62 lines)
   - **Purpose**: Setup for elemental abundance input (reads element data)
   - **Dependencies**: 2 COMMON blocks (read-only, element reference data)
   - **Complexity**: Simple data setup
   - **Why Easy**: Initialization routine, no complex dependencies, mostly data assignment
   - **Migration Effort**: Low - straightforward data loading

26. **TTAUP** (lines 1557-1619, 63 lines)
   - **Purpose**: Temperature-dependent optical depth calculation using Rosseland mean
   - **Dependencies**: 0 COMMON blocks (pure function passed arrays)
   - **Complexity**: Integration/interpolation based on Rosseland formula
   - **Why Easy**: Pure function receiving all data as parameters, mathematical but straightforward
   - **Migration Effort**: Low - self-contained calculation

---

## Medium Subroutines (5 total)

**Characteristic**: 2-5 COMMON blocks, 100-500 lines, moderate complexity, documented algorithms

1. **READMOL** (lines 2790-2894, 105 lines)
   - **Purpose**: Read molecular data from external file or data (initializes molecular constants)
   - **Dependencies**: 3 COMMON blocks (molecular data, element info, flags)
   - **Complexity**: File I/O and data parsing for molecular species
   - **Why Medium**: Moderate COMMON block usage, file I/O present but straightforward, no complex algorithms
   - **Migration Effort**: Medium - requires understanding file format and data structures, translatable

2. **HIGH** (lines 5091-5105, 15 lines)
   - **Purpose**: High-order correction or auxiliary calculation (unclear from name alone)
   - **Dependencies**: 4 COMMON blocks
   - **Complexity**: Short routine but depends on multiple data sources
   - **Why Medium**: Multiple dependencies despite small size, likely critical to surrounding calculation
   - **Migration Effort**: Medium - must understand context of 4 COMMON blocks

3. **TURB** (lines 5197-5212, 16 lines)
   - **Purpose**: Turbulence velocity/scaling calculation
   - **Dependencies**: 4 COMMON blocks (turbulence parameters, state)
   - **Complexity**: Physical calculation with multiple inputs
   - **Why Medium**: Moderate dependencies, straightforward calculation
   - **Migration Effort**: Medium - requires understanding turbulence model implementation

4. **ELECOP** (lines 9648-9657, 10 lines)
   - **Purpose**: Electron scattering opacity calculation
   - **Dependencies**: 3 COMMON blocks (opacity arrays, frequency, state)
   - **Complexity**: Simple formula but multi-block context
   - **Why Medium**: Despite small size, appears in complex context (opacity calculations)
   - **Migration Effort**: Medium - understand electron scattering formula and context

5. **IONPOTS** (lines 12181-12514, 334 lines)
   - **Purpose**: Generate ionization potential table for elements
   - **Dependencies**: 1 COMMON block (element/abundance data, read-only)
   - **Complexity**: Large lookup table with multiple element-specific entries
   - **Why Medium**: Substantial size (334 lines) but relatively simple - mostly data initialization
   - **Migration Effort**: Medium - tedious to translate 334 lines of data assignments, but low conceptual complexity

---

## Hard Subroutines (49 total)

**Characteristic**: 5+ COMMON blocks OR >500 lines OR ranked in Deep Dives #1-7, complex algorithms, precision-sensitive

### DEEP DIVE HIGH-RISK SUBROUTINES (8 subroutines - Ranks #1-7)

These subroutines are critical computational kernels already analyzed in depth:

1. **POPS** (lines 2895-2932, 38 lines) ⭐ **DEEP DIVE 02 - Rank #1**
   - **Purpose**: Saha-Boltzmann LTE ionization/excitation populations (wrapper calling PFSAHA)
   - **Dependencies**: 7 COMMON blocks (populations, abundances, isotopes, state, etc.)
   - **Complexity**: **CRITICAL** - Precision-required calculation (Float64 MANDATORY)
   - **Why Hard**: 
     - Rank #1 migration risk (precision overflow - ratios span 1e-42 to 1e+2)
     - Calls PFSAHA (903-line complex function)
     - Requires careful handling of extreme range values
     - Must preserve 0.3 damping factor for electron density iteration
   - **Migration Effort**: **VERY HIGH**
     - Must use Float64 throughout (no compromise)
     - Requires understanding Saha equation implementation
     - Extensive validation against Fortran outputs
     - See Deep Dive 02 for detailed analysis

2. **TCORR** (lines 606-996, 391 lines) ⭐ **DEEP DIVE 06 - Rank #5**
   - **Purpose**: Iteration damping and convergence control (main iteration loop driver)
   - **Dependencies**: 21 COMMON blocks (essentially all critical blocks)
   - **Complexity**: Complex convergence algorithm with damping, multiple sub-steps
   - **Why Hard**:
     - Rank #5 migration risk (convergence behavior may change)
     - Central to iteration loop - calls STATEQ, POPS, JOSH, CONVEC
     - Damping logic is undocumented but critical for convergence
     - Depends on 21 COMMON blocks (orchestrates entire iteration)
   - **Migration Effort**: **VERY HIGH**
     - Requires complete understanding of iteration logic
     - Must validate convergence behavior against Fortran
     - Careful refactoring needed to expose dependencies as parameters
     - See Deep Dive 06 for detailed analysis

3. **LINOP1** (lines 9916-10132, 217 lines) ⭐ **DEEP DIVE 03 - Rank #3**
   - **Purpose**: Line opacity summation (main spectrum line contribution calculation)
   - **Dependencies**: 18 COMMON blocks (frequency, lines, state, opacity, etc.)
   - **Complexity**: Performance-critical inner loop over 100K-500M spectral lines
   - **Why Hard**:
     - Rank #3 migration risk (precision accumulation, performance-critical)
     - Calls VOIGT for Voigt profile evaluation (~1M times per iteration)
     - Early exit optimization critical (600 GFLOP routine)
     - Binary input data (fort.12) format critical
   - **Migration Effort**: **VERY HIGH**
     - Performance profiling mandatory
     - Parallelization opportunities exist (line-by-line is independent)
     - Must preserve numerical behavior of accumulation
     - See Deep Dive 03 for detailed analysis

4. **LINOP** (lines 10133-10313, 181 lines) ⭐ **DEEP DIVE 03 - Rank #3**
   - **Purpose**: Line opacity computation (supporting LINOP1)
   - **Dependencies**: 17 COMMON blocks
   - **Complexity**: Related to LINOP1, performs detailed line opacity calculations
   - **Why Hard**: Same as LINOP1 - part of unified opacity computation pipeline
   - **Migration Effort**: **VERY HIGH** - See Deep Dive 03

5. **XLINOP** (lines 15039-15389, 351 lines) ⭐ **DEEP DIVE 03 - Rank #3**
   - **Purpose**: Extended line opacity (experimental or high-resolution line treatment)
   - **Dependencies**: 16 COMMON blocks
   - **Complexity**: Alternative/extended line opacity method
   - **Why Hard**: Rank #3 risk, substantial size, performance-critical
   - **Migration Effort**: **VERY HIGH** - See Deep Dive 03

6. **JOSH** (lines 10342-10609, 268 lines) ⭐ **DEEP DIVE 05 - Rank #6**
   - **Purpose**: Radiative transfer integration (Shortcharacteristics method or similar)
   - **Dependencies**: 11 COMMON blocks (frequency, opacity, radiation field, state)
   - **Complexity**: Complex integration algorithm, precision-sensitive
   - **Why Hard**:
     - Rank #6 migration risk (algorithm implementation critical)
     - Implements radiative transfer integration (core physics)
     - Convergence and stability depends on numerical implementation details
     - Precision-sensitive calculation
   - **Migration Effort**: **VERY HIGH**
     - Requires understanding RT integration method
     - Careful preservation of numerical behavior
     - Extensive physics validation required
     - See Deep Dive 05 for detailed analysis

7. **CONVEC** (lines 4847-5090, 244 lines) ⭐ **DEEP DIVE 07 - Rank #7**
   - **Purpose**: Convective energy transport calculation
   - **Dependencies**: 18 COMMON blocks (convection parameters, state, temperature)
   - **Complexity**: Implements convection model (MLT or similar)
   - **Why Hard**:
     - Rank #7 migration risk (physics convergence behavior)
     - Calls POPS 4× for numerical derivatives
     - Precision and convergence-sensitive
     - Undocumented constants and thresholds
   - **Migration Effort**: **VERY HIGH**
     - Requires understanding convection physics
     - Derivative calculations need careful handling
     - Numerical precision critical
     - See Deep Dive 07 for detailed analysis

8. **PFSAHA** (lines 3143-4045, 903 lines) ⭐ **IMPLICITLY HARD (supports POPS)**
   - **Purpose**: Partition function + Saha equation evaluation (called by POPS for each ionization state)
   - **Dependencies**: 4 COMMON blocks (element data, state, populations)
   - **Complexity**: Very large routine with partition function tables (2190 lines worth of PARTTAB data)
   - **Why Hard**:
     - Over 500 lines (criteria for Hard)
     - Critical to POPS (Rank #1) - must mirror its behavior
     - Complex partition function data structures
     - Precision-sensitive (handles extreme ranges)
   - **Migration Effort**: **VERY HIGH**
     - Must understand partition function tables
     - Saha equation implementation critical
     - Precision handling crucial
     - 903 lines requires significant translation effort

### VERY LARGE DATA/ALGORITHM BLOCKS (3 subroutines >750 lines)

9. **READIN** (lines 1737-2585, 849 lines)
   - **Purpose**: Master input reader for stellar model (reads initial atmosphere parameters)
   - **Dependencies**: 30 COMMON blocks (initializes nearly all global state)
   - **Complexity**: Complex input format parsing, multiple file formats, initialization orchestration
   - **Why Hard**:
     - Over 500 lines (849 lines)
     - Initializes 30 COMMON blocks (touches all global state)
     - Input file format discovery/parsing required
     - Critical for correct model initialization
   - **Migration Effort**: **VERY HIGH**
     - Must document input file format thoroughly
     - Parsing logic must be translated carefully
     - Validation against multiple input examples required
     - Potential to refactor into cleaner Julia API

10. **BLOCKJ** (lines 10610-11396, 787 lines)
    - **Purpose**: Large data block (partition function or similar tabulated data)
    - **Dependencies**: 2 COMMON blocks (mostly data storage)
    - **Complexity**: Primarily data initialization (large lookup table)
    - **Why Hard**:
      - Over 500 lines (787 lines of data assignments)
      - Conceptually simple but tedious translation
      - Must preserve exact table values
    - **Migration Effort**: **HIGH**
      - Tedious but straightforward (data copying)
      - No algorithm complexity
      - Can be automated partially

11. **BLOCKH** (lines 11397-12176, 780 lines)
    - **Purpose**: Another large data block (similar to BLOCKJ)
    - **Dependencies**: 2 COMMON blocks
    - **Complexity**: Data initialization
    - **Why Hard**:
      - Over 500 lines of data assignments
      - Similar to BLOCKJ
    - **Migration Effort**: **HIGH**
      - Same as BLOCKJ - tedious but straightforward

12. **ISOTOPES** (lines 12515-14338, 1824 lines)
    - **Purpose**: Isotopic composition data and initialization (largest data block)
    - **Dependencies**: 1 COMMON block
    - **Complexity**: Primarily data
    - **Why Hard**:
      - Over 500 lines (1824 lines!)
      - Largest single routine in ATLAS12
      - Extensive element/isotope data
    - **Migration Effort**: **MEDIUM-HIGH**
      - Mostly straightforward data loading
      - Can potentially be refactored to external data files
      - Tedious but not conceptually complex

13. **SELECTLINES** (lines 14440-14952, 513 lines)
    - **Purpose**: Spectral line selection and filtering for calculation
    - **Dependencies**: 31 COMMON blocks (reads/writes across many blocks)
    - **Complexity**: Complex line selection logic, multiple criteria
    - **Why Hard**:
      - Over 500 lines (513 lines)
      - 31 COMMON blocks (touches most of system)
      - Complex selection criteria and logic
    - **Migration Effort**: **HIGH**
      - Must understand line selection algorithm
      - Complex interaction with multiple data blocks
      - Performance may be important

14. **PFIRON** (lines 16086-22122, 6037 lines)
    - **Purpose**: Iron partition function calculation (enormous partition function evaluation)
    - **Dependencies**: 0 COMMON blocks (pure function, receives all data as parameters)
    - **Complexity**: Massive iron partition function table (6000+ lines)
    - **Why Hard**:
      - Over 500 lines (6037 lines - by far the largest!)
      - Appears to be mostly data (Fe partition function table)
      - Despite no COMMON blocks, sheer size makes it Hard
    - **Migration Effort**: **MEDIUM**
      - Conceptually simple (data table)
      - No algorithm complexity
      - Can be migrated as data file instead of code
      - Tedious but straightforward

### HIGH COMPLEXITY - MANY COMMON BLOCKS (>400 lines)

15. **NMOLEC** (lines 4133-4558, 426 lines)
    - **Purpose**: Molecular abundance calculation
    - **Dependencies**: 12 COMMON blocks
    - **Complexity**: Molecular species equilibrium calculations
    - **Why Hard**: 426 lines + 12 COMMON blocks
    - **Migration Effort**: **HIGH**

16. **SI1OP** (lines 6912-7341, 430 lines)
    - **Purpose**: Silicon I (neutral) opacity calculation
    - **Dependencies**: 6 COMMON blocks
    - **Complexity**: Element-specific opacity with multiple terms
    - **Why Hard**: 430 lines of element-specific opacity
    - **Migration Effort**: **HIGH**

17. **SI2OP** (lines 8694-9126, 433 lines)
    - **Purpose**: Silicon II (singly ionized) opacity
    - **Dependencies**: 6 COMMON blocks
    - **Why Hard**: 433 lines of opacity calculation
    - **Migration Effort**: **HIGH**

### PHYSICS CALCULATIONS - MODERATE SIZE (200-300 lines)

18. **H2COLLOP** (lines 7969-8224, 256 lines)
    - **Purpose**: H2 molecular collisional opacity
    - **Dependencies**: 6 COMMON blocks
    - **Complexity**: Molecular opacity with collision treatment
    - **Why Hard**: 256 lines, molecular physics
    - **Migration Effort**: **MEDIUM-HIGH**

19. **C1OP** (lines 6440-6758, 319 lines)
    - **Purpose**: Carbon I (neutral) opacity
    - **Dependencies**: 6 COMMON blocks
    - **Complexity**: Complex element opacity with multiple ionization states
    - **Why Hard**: 319 lines, complex element opacity
    - **Migration Effort**: **MEDIUM-HIGH**

20. **C2OP** (lines 8246-8519, 274 lines)
    - **Purpose**: Carbon II (singly ionized) opacity
    - **Dependencies**: 6 COMMON blocks
    - **Why Hard**: 274 lines of opacity calculation
    - **Migration Effort**: **MEDIUM-HIGH**

21. **JOSH** (lines 10342-10609, 268 lines) - *Also listed under Deep Dives*
    - *See entry #6 above*

### PHYSICS CALCULATIONS - SMALLER (100-200 lines)

22. **POPSALL** (lines 4559-4846, 288 lines)
    - **Purpose**: Compute all population levels (calls POPS for all species)
    - **Dependencies**: 11 COMMON blocks
    - **Complexity**: Orchestrates multiple POPS calls, accumulates populations
    - **Why Hard**: 288 lines, orchestration of critical calculation
    - **Migration Effort**: **MEDIUM-HIGH**

23. **HOTOP** (lines 9461-9614, 154 lines)
    - **Purpose**: High-order (very ionized) species opacity (for very hot atmospheres)
    - **Dependencies**: 8 COMMON blocks
    - **Why Hard**: 154 lines, complex opacity for extreme conditions
    - **Migration Effort**: **MEDIUM-HIGH**

24. **HE1OP** (lines 6006-6126, 121 lines)
    - **Purpose**: Helium I (neutral) opacity
    - **Dependencies**: 8 COMMON blocks
    - **Why Hard**: 121 lines, element opacity
    - **Migration Effort**: **MEDIUM-HIGH**

25. **MG1OP** (lines 6767-6895, 129 lines)
    - **Purpose**: Magnesium I opacity
    - **Dependencies**: 6 COMMON blocks
    - **Why Hard**: 129 lines, element opacity
    - **Migration Effort**: **MEDIUM-HIGH**

26. **MG2OP** (lines 8563-8692, 130 lines)
    - **Purpose**: Magnesium II opacity
    - **Dependencies**: 6 COMMON blocks
    - **Why Hard**: 130 lines, element opacity
    - **Migration Effort**: **MEDIUM-HIGH**

27. **STATEQ** (lines 997-1156, 160 lines)
    - **Purpose**: State equation - compute pressure, density from temperature
    - **Dependencies**: 10 COMMON blocks
    - **Complexity**: Hydrostatic equilibrium + equation of state
    - **Why Hard**: 160 lines, fundamental physics calculation
    - **Migration Effort**: **MEDIUM-HIGH**

28. **ENERGYDENSITY** (lines 2933-3044, 112 lines)
    - **Purpose**: Energy density calculation (radiation field integration)
    - **Dependencies**: 10 COMMON blocks
    - **Complexity**: Radiation field physics
    - **Why Hard**: 112 lines, depends on 10 COMMON blocks
    - **Migration Effort**: **MEDIUM**

29. **NELECT** (lines 3045-3142, 98 lines)
    - **Purpose**: Electron density calculation (charge neutrality constraint)
    - **Dependencies**: 10 COMMON blocks
    - **Complexity**: Charge balance iteration
    - **Why Hard**: 98 lines, 10 COMMON blocks, called by POPS
    - **Migration Effort**: **MEDIUM**

30. **VTURBSTANDARD** (lines 5106-5196, 91 lines)
    - **Purpose**: Microturbulence velocity (standard model calculation)
    - **Dependencies**: 9 COMMON blocks
    - **Why Hard**: 91 lines, 9 COMMON blocks, physics parameter
    - **Migration Effort**: **MEDIUM**

31. **HMINOP** (lines 5872-5973, 102 lines)
    - **Purpose**: H⁻ (H minus) opacity (negative hydrogen ion)
    - **Dependencies**: 9 COMMON blocks
    - **Why Hard**: 102 lines, important opacity source for cool stars
    - **Migration Effort**: **MEDIUM-HIGH**

32. **PRELINOP** (lines 9823-9915, 93 lines)
    - **Purpose**: Pre-processing for line opacity (prepares line opacity calculation)
    - **Dependencies**: 16 COMMON blocks
    - **Complexity**: Data preparation for LINOP1
    - **Why Hard**: 93 lines, 16 COMMON blocks, preprocessing step
    - **Migration Effort**: **MEDIUM**

33. **KAPCONT** (lines 14339-14432, 94 lines)
    - **Purpose**: Continuous opacity (bf, ff, Rayleigh scattering)
    - **Dependencies**: 7 COMMON blocks
    - **Complexity**: Multiple continuous opacity sources
    - **Why Hard**: 94 lines, orchestrates multiple opacity calculations
    - **Migration Effort**: **MEDIUM**

### ELEMENT-SPECIFIC OPACITY (50-130 lines)

34. **HE2OP** (lines 6330-6374, 45 lines)
    - **Purpose**: Helium II (singly ionized) opacity
    - **Dependencies**: 8 COMMON blocks
    - **Why Hard**: Small but 8 dependencies
    - **Migration Effort**: **MEDIUM**

35. **HLINOP** (lines 9694-9751, 58 lines)
    - **Purpose**: Hydrogen line opacity (H alpha, beta, etc.)
    - **Dependencies**: 9 COMMON blocks
    - **Why Hard**: 58 lines, core opacity for any star
    - **Migration Effort**: **MEDIUM**

36. **HRAYOP** (lines 5988-6005, 18 lines)
    - **Purpose**: Hydrogen Rayleigh scattering opacity
    - **Dependencies**: 8 COMMON blocks
    - **Why Hard**: 18 lines but 8 dependencies
    - **Migration Effort**: **MEDIUM**

37. **H2RAOP** (lines 9658-9693, 36 lines)
    - **Purpose**: H2 Rayleigh scattering
    - **Dependencies**: 9 COMMON blocks
    - **Why Hard**: 36 lines, 9 dependencies
    - **Migration Effort**: **MEDIUM**

38. **MOLEC** (lines 4046-4132, 87 lines)
    - **Purpose**: Molecular abundance calculation (wrapper, similar to POPS for molecules)
    - **Dependencies**: 12 COMMON blocks
    - **Why Hard**: 87 lines, 12 COMMON blocks
    - **Migration Effort**: **MEDIUM**

39. **HEMIOP** (lines 6375-6392, 18 lines)
    - **Purpose**: He minus ion (He⁻) opacity
    - **Dependencies**: 8 COMMON blocks
    - **Why Hard**: 18 lines but complex context
    - **Migration Effort**: **MEDIUM**

40. **HERAOP** (lines 6393-6409, 17 lines)
    - **Purpose**: Helium Rayleigh scattering
    - **Dependencies**: 7 COMMON blocks
    - **Why Hard**: 17 lines, 7 dependencies
    - **Migration Effort**: **MEDIUM**

41. **LUKEOP** (lines 8225-8245, 21 lines)
    - **Purpose**: Luke scattering or similar (unclear)
    - **Dependencies**: 8 COMMON blocks
    - **Why Hard**: 21 lines, 8 COMMON blocks
    - **Migration Effort**: **MEDIUM**

42. **COOLOP** (lines 6410-6439, 30 lines)
    - **Purpose**: Cooling opacity or collisional opacity
    - **Dependencies**: 8 COMMON blocks
    - **Why Hard**: 30 lines, 8 COMMON blocks
    - **Migration Effort**: **MEDIUM**

43. **HOP** (lines 5267-5312, 46 lines)
    - **Purpose**: Hydrogen ionization opacity
    - **Dependencies**: 9 COMMON blocks
    - **Why Hard**: 46 lines, 9 COMMON blocks
    - **Migration Effort**: **MEDIUM**

44. **H2PLOP** (lines 5850-5871, 22 lines)
    - **Purpose**: H2+ (H2 plus) opacity
    - **Dependencies**: 9 COMMON blocks
    - **Why Hard**: 22 lines, 9 COMMON blocks
    - **Migration Effort**: **MEDIUM**

45. **KAPP** (lines 5213-5266, 54 lines)
    - **Purpose**: Opacity calculation orchestrator (calls various opacity routines)
    - **Dependencies**: 6 COMMON blocks
    - **Complexity**: Orchestration of opacity calculations
    - **Why Hard**: 54 lines, core opacity driver
    - **Migration Effort**: **MEDIUM**

### RADIATIVE TRANSFER / STATE CALCULATIONS

46. **PUTOUT** (lines 401-605, 205 lines)
    - **Purpose**: Output results (writes atmosphere model to file)
    - **Dependencies**: 31 COMMON blocks (reads entire model state)
    - **Complexity**: Output formatting, multiple file formats
    - **Why Hard**: 205 lines, 31 COMMON blocks (reads nearly all)
    - **Migration Effort**: **MEDIUM-HIGH**
      - Must understand output file formats
      - Must validate against Fortran output
      - Opportunity to improve formatting in Julia

47. **BLOCKR** (lines 1682-1736, 55 lines)
    - **Purpose**: Radiation field initial setup
    - **Dependencies**: 16 COMMON blocks
    - **Complexity**: Initialization of radiation field arrays
    - **Why Hard**: 55 lines, 16 COMMON blocks
    - **Migration Effort**: **MEDIUM**

48. **RADIAP** (lines 1157-1197, 41 lines)
    - **Purpose**: Radiation pressure calculation
    - **Dependencies**: 6 COMMON blocks
    - **Why Hard**: 41 lines, 6 COMMON blocks
    - **Migration Effort**: **MEDIUM**

49. **ROSS** (lines 1198-1220, 23 lines)
    - **Purpose**: Rosseland mean opacity calculation (mean opacity across frequencies)
    - **Dependencies**: 6 COMMON blocks
    - **Complexity**: Weighted average of opacities
    - **Why Hard**: 23 lines, 6 COMMON blocks, called frequently
    - **Migration Effort**: **MEDIUM**

50. **XCONOP** (lines 10321-10334, 14 lines)
    - **Purpose**: Extinction coefficient computation or continuous opacity variant
    - **Dependencies**: 5 COMMON blocks
    - **Why Hard**: 14 lines, 5 COMMON blocks
    - **Migration Effort**: **MEDIUM**

---

## Summary by Difficulty

### Easy (26): Quick Wins for Early Migration
- Pure utility functions (DERIV, INTEG, PARCOE, SOLVIT, LINTER)
- Stub/placeholder routines (molecule opacity stubs, HE2LIN, DUMMYR)
- Simple initialization (BLOCKE, TTAUP, TABVOIGT)
- Focus: Establish Julia infrastructure, validate simple translations

### Medium (5): Foundation Modules
- READMOL: Input file parsing (needed early for validation)
- HIGH, TURB: Turbulence calculations (secondary)
- ELECOP: Simple opacity (secondary)
- IONPOTS: Data initialization (tedious but straightforward)

### Hard (49): Core Physics Engine
- **Critical Deep Dives (8)**: POPS, TCORR, LINOP1, LINOP, XLINOP, JOSH, CONVEC, PFSAHA
  - These are the computational heart of ATLAS12
  - Require Deep Dive analysis, extensive validation
  - Estimated 60% of migration effort focused here
  
- **Large Data Blocks (4)**: BLOCKJ, BLOCKH, ISOTOPES, PFIRON
  - Can be partially automated or migrated to external data files
  
- **Opacity Calculations (30+)**: Element-specific and collisional opacities
  - Repetitive pattern (similar to each other)
  - Can develop template/pattern-based translation
  - Moderate complexity, high volume
  
- **Supporting Calculations (7)**: STATEQ, ENERGYDENSITY, NELECT, VTURBSTANDARD, PRELINOP, KAPCONT, PUTOUT
  - Support the critical physics calculations
  - Must be coordinated with Deep Dives

---

## Migration Strategy by Category

### Phase 1: Easy Subroutines (Week 1-2)
1. Translate pure utilities (DERIV, INTEG, PARCOE, SOLVIT)
2. Create stub implementations for molecule ops
3. Set up Julia test framework with these simple functions
4. **Validation**: Bit-for-bit match on simple numerical tests

### Phase 2: Input/Output (Week 2-3)
1. READIN + file I/O infrastructure
2. READMOL for molecular data
3. PUTOUT for output formatting
4. **Validation**: Input/output round-trip with Fortran

### Phase 3: Deep Dive Critical Subroutines (Week 4-8)
1. Start with NELECT (supports POPS) - simpler, 98 lines
2. Then PFSAHA (supports POPS) - complex, 903 lines, guides POPS design
3. Then POPS wrapper (38 lines, but orchestrates population calculation)
4. Validate against Fortran populations with test cases
5. Proceed through Deep Dives #5-7 (JOSH, TCORR, CONVEC)

### Phase 4: Opacity System (Week 8-10)
1. Develop general opacity framework (KAPP)
2. Translate element-specific opacities (HE1OP, HE2OP, C1OP, C2OP, etc.)
3. Can use pattern-based/template approach - many are similar
4. Continuous opacity (ROSS, RADIAP, KAPCONT)

### Phase 5: Line Opacity Deep Dive (Week 10-12)
1. TABVOIGT + VOIGT function framework
2. LINOP1, LINOP, XLINOP (most performance-critical)
3. Extensive profiling and optimization
4. Parallel line processing exploration

### Phase 6: Main Iteration Loop (Week 12-14)
1. TCORR integration (most complex, orchestrates everything)
2. STATEQ (state equation)
3. CONVEC (convection)
4. Full model convergence testing

### Phase 7: Data Blocks & Utility (Week 14-16)
1. ISOTOPES, BLOCKJ, BLOCKH, IONPOTS (can be auto-converted)
2. SELECTLINES (line selection)
3. Remaining utility routines

---

## Known Challenges by Category

### Precision & Overflow (POPS, PFSAHA, LINOP1, XLINOP)
- POPS requires Float64 (Float32 inadequate for 1e-42 range)
- PFSAHA partition functions must handle extreme ranges
- Line opacity accumulation must track precision loss

### Performance (LINOP1, XLINOP, CONVEC)
- LINOP1 is called with 100K-500M lines per iteration
- Fortran: ~600 GFLOP routine
- Julia must achieve similar or risk being unusable
- Early profiling critical

### Undocumented Constants (VOIGT, CONVEC, HVOIGT)
- VOIGT has 13 magic constants (origins unclear)
- CONVEC has undocumented thresholds
- Must replicate exactly without understanding

### Convergence Behavior (TCORR, STATEQ, POPS)
- TCORR's damping factor (0.3) affects convergence
- Iteration order matters (POPS → STATEQ → TCORR)
- Different numerical behavior could break convergence

### Input/Output Format (READIN, PUTOUT, file I/O)
- Multiple undocumented binary formats (fort.11, fort.12, etc.)
- Endianness sensitivity
- Must maintain format compatibility for validation

---

## Estimated Translation Effort (Person-Weeks)

| Category | Subroutines | Effort/Each | Total | Notes |
|----------|-------------|-------------|-------|-------|
| Easy | 26 | 0.5-1 day | 2-3 weeks | Mostly trivial |
| Medium | 5 | 2-3 days | 1-2 weeks | Straightforward |
| Hard - Deep Dives | 8 | 3-5 weeks | 24-40 weeks | Most effort here |
| Hard - Large Data | 4 | 1-2 weeks | 4-8 weeks | Tedious but simple |
| Hard - Opacity | 30 | 3-5 days | 4-6 weeks | Repetitive pattern |
| Hard - Other | 7 | 2-3 weeks | 14-21 weeks | Supporting physics |
| **TOTAL** | **80** | - | **49-80 weeks** | **12-20 months solo** |

**Reality**: 
- With proper parallelization and tool assistance: 6-9 months
- With pattern-based code generation: 3-6 months
- Bottleneck: Deep Dives (#1, #2, #3, #5-7) require careful work and extensive validation

