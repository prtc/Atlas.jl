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

---

# Section 2: Quick Wins - Early Migration Targets

**Purpose**: Identify 10-15 subroutines that can be migrated early to build momentum, establish patterns, and create test infrastructure.

## Selection Criteria

Quick wins should be:
- **Standalone** - No or minimal dependencies on COMMON blocks
- **Testable** - Can validate output independently
- **Foundation** - Useful for later work
- **Low risk** - Simple algorithms, well-understood

## Recommended Quick Win List (15 subroutines)

### Tier 1: Pure Utilities (Week 1)

1. **DERIV** (20 lines, 0 COMMON blocks)
   - Numerical derivative (finite difference)
   - Pure function, easy to test
   - **Why quick win**: Can validate against known derivatives
   - **Benefit**: Foundation for all derivative calculations

2. **INTEG** (18 lines, 0 COMMON blocks)
   - Trapezoidal integration
   - Pure function, standard algorithm
   - **Why quick win**: Can validate against known integrals
   - **Benefit**: Foundation for integration operations

3. **PARCOE** (45 lines, 0 COMMON blocks)
   - Lagrange interpolation coefficients
   - Pure mathematics
   - **Why quick win**: Can validate against polynomial test cases
   - **Benefit**: Used throughout for interpolation

4. **SOLVIT** (58 lines, 0 COMMON blocks)
   - Linear system solver (Gaussian elimination)
   - Could use Julia's LinearAlgebra instead
   - **Why quick win**: Can validate against Julia's built-in solvers
   - **Benefit**: Foundation for matrix operations

5. **W** (8 lines, 0 COMMON blocks)
   - Weight calculation
   - Trivial implementation
   - **Why quick win**: Nearly instant migration
   - **Benefit**: Completes utility set

### Tier 2: Data Initialization (Week 1-2)

6. **BLOCKE** (62 lines, 2 COMMON blocks - read-only)
   - Element abundance setup
   - Simple data loading
   - **Why quick win**: Straightforward data structure
   - **Benefit**: Establishes abundance data pattern

7. **PRETABLOG** (7 lines, 1 COMMON block)
   - Logarithm pretabulation flag
   - Trivial flag setter
   - **Why quick win**: Nearly instant
   - **Benefit**: Shows COMMON block → struct pattern

8. **TABVOIGT** (32 lines, 1 COMMON block)
   - Voigt profile table initialization
   - Fills lookup tables
   - **Why quick win**: Simple loop, validates against Fortran tables
   - **Benefit**: Prepares for VOIGT function migration

### Tier 3: Simple Physics (Week 2)

9. **TTAUP** (63 lines, 0 COMMON blocks)
   - Temperature-optical depth relation
   - Pure function with arrays
   - **Why quick win**: Self-contained, testable physics
   - **Benefit**: Establishes optical depth pattern

10. **LINTER** (14 lines, 0 COMMON blocks)
    - Linear interpolation
    - Pure utility
    - **Why quick win**: Trivial, many uses
    - **Benefit**: Foundation interpolation routine

11. **ROSS** (23 lines, 6 COMMON blocks)
    - Rosseland mean opacity
    - Weighted average calculation
    - **Why quick win**: Simple formula, can test independently
    - **Benefit**: Introduces COMMON block refactoring pattern

### Tier 4: Foundation Infrastructure (Week 2-3)

12. **READMOL** (105 lines, 3 COMMON blocks)
    - Molecular data input
    - File I/O with moderate complexity
    - **Why quick win**: Needed early for validation, establishes I/O pattern
    - **Benefit**: Input file infrastructure

13. **RADIAP** (41 lines, 6 COMMON blocks)
    - Radiation pressure calculation
    - Physics calculation with multiple inputs
    - **Why quick win**: Clear formula, validates radiation physics
    - **Benefit**: Radiation field component

14. **ELECOP** (10 lines, 3 COMMON blocks)
    - Electron scattering opacity
    - Simple formula
    - **Why quick win**: Quick opacity implementation
    - **Benefit**: First opacity source migrated

15. **HE2LIN** + **C3OP** through **O6OP** (11 stubs, ~3 lines each)
    - Placeholder routines
    - Return zero or minimal value
    - **Why quick win**: Trivial stubs, can batch-process
    - **Benefit**: Complete the easy category

## Benefits of This Approach

**Week 1 Benefits**:
- 8 functions migrated (Tier 1 + Tier 2)
- Julia package structure established
- Test framework working
- CI/CD pipeline configured
- Team confidence built

**Week 2 Benefits**:
- 7 more functions migrated (Tier 3 + Tier 4)
- I/O infrastructure working
- COMMON block → struct pattern established
- First physics validation complete
- Ready to tackle Deep Dives

**Total Quick Wins Impact**:
- 15 subroutines = 19% of ATLAS12
- ~400 lines of code migrated
- Foundation for remaining 65 subroutines
- Validation infrastructure proven
- Team ready for hard work

## Anti-Pattern Warning

**Don't start with**:
- ❌ POPS (looks simple - 38 lines - but depends on 903-line PFSAHA)
- ❌ TCORR (orchestrates everything, needs entire system)
- ❌ READIN (849 lines, touches 30 COMMON blocks)
- ❌ Any Deep Dive subroutine before infrastructure ready

Start simple, build confidence, then tackle complexity.

---

# Section 3: High-Risk Areas - Expanded Analysis

**Purpose**: Beyond the 7 Deep Dives already analyzed, identify additional high-risk areas requiring extra care during migration.

## Previously Analyzed (Deep Dives 01-07)

These are **already documented** in detail:
1. ✅ POPS + PFSAHA (Deep Dive 02) - Rank #1 risk
2. ✅ HVOIGT/VOIGT (Deep Dive 01) - Rank #2 risk
3. ✅ LINOP1/XLINOP (Deep Dive 03) - Rank #3 risk
4. ✅ Binary I/O (Deep Dive 04) - Rank #4 risk
5. ✅ TCORR (Deep Dive 06) - Rank #5 risk
6. ✅ JOSH (Deep Dive 05) - Rank #6 risk
7. ✅ CONVEC (Deep Dive 07) - Rank #7 risk

See `docs/archaeology/DEEP_DIVES/` for complete analysis.

## Additional High-Risk Areas (Ranks #8-15)

### Rank #8: READIN - Input File Archaeology

**File**: atlas12.for lines 1737-2585 (849 lines)
**Risk Type**: Format compatibility, initialization order
**Likelihood**: High | **Impact**: Critical

**Why risky**:
- 849 lines touching 30 COMMON blocks
- Initializes nearly all global state
- Input format poorly documented
- Multiple file formats (DECK6, free format, binary)
- Magic keywords (MIAC encoding)
- Order-dependent initialization

**Consequences if wrong**:
- Models won't initialize correctly
- Silent errors (wrong initial conditions)
- Can't validate against Fortran (inputs don't parse)

**Mitigation**:
- Priority: 🔴 High (before any physics migration)
- Create comprehensive input file test suite
- Document all keywords and formats
- Cross-reference ARCHITECTURE_INSIGHTS.md Section I.3 (fort.X files)
- Validate against 10+ example input files
- Consider creating modern Julia API alongside legacy parser

**Estimated effort**: 2-3 weeks

---

### Rank #9: STATEQ - Equation of State

**File**: atlas12.for lines 997-1156 (160 lines)
**Risk Type**: Convergence, physics accuracy
**Likelihood**: Medium | **Impact**: High

**Why risky**:
- Computes pressure, density from temperature
- Hydrostatic equilibrium constraint
- Called every iteration
- Convergence depends on numerical behavior

**Consequences if wrong**:
- Models won't converge
- Unphysical pressure/density profiles
- Cascade failure (populations depend on P, ρ)

**Mitigation**:
- Priority: 🟡 High
- Validate against analytic ideal gas cases
- Test extreme conditions (very hot, very cool)
- Compare to Fortran iteration-by-iteration
- Check monotonicity constraints (dP/dz > 0)

**Estimated effort**: 1-2 weeks

---

### Rank #10: POPSALL - Population Orchestration

**File**: atlas12.for lines 4559-4846 (288 lines)
**Risk Type**: Convergence, order dependencies
**Likelihood**: Medium | **Impact**: High

**Why risky**:
- Calls POPS for all ionization states
- Accumulates populations across species
- Order may matter (dependencies between species)
- Convergence-sensitive

**Consequences if wrong**:
- Population ratios incorrect
- Convergence failure
- Cascade to opacity calculations

**Mitigation**:
- Priority: 🟡 High
- Migrate after POPS validated
- Test total abundance conservation
- Validate charge neutrality
- Compare to Fortran species-by-species

**Estimated effort**: 2-3 weeks (after POPS complete)

---

### Rank #11: SELECTLINES - Line Selection Logic

**File**: atlas12.for lines 14440-14952 (513 lines)
**Risk Type**: Performance, line database compatibility
**Likelihood**: Medium | **Impact**: Medium-High

**Why risky**:
- 513 lines with complex selection criteria
- Touches 31 COMMON blocks
- Reads fort.11 binary line database
- Performance-critical (processes millions of lines)
- Affects which lines included in calculation

**Consequences if wrong**:
- Wrong lines selected → wrong spectrum
- Performance degradation (too many lines)
- Binary format incompatibility

**Mitigation**:
- Priority: 🟡 Medium-High
- Migrate after binary I/O validated (Deep Dive 04)
- Validate selected line counts match Fortran
- Test wavelength range filtering
- Profile performance (must handle 10M+ lines)

**Estimated effort**: 2-3 weeks

---

### Rank #12: NMOLEC + MOLEC - Molecular Equilibrium

**Files**:
- NMOLEC: lines 4133-4558 (426 lines, 12 COMMON blocks)
- MOLEC: lines 4046-4132 (87 lines, 12 COMMON blocks)

**Risk Type**: Physics accuracy, convergence
**Likelihood**: Medium | **Impact**: Medium

**Why risky**:
- Molecular abundance calculations (H2, CO, etc.)
- Chemical equilibrium equations
- Temperature/pressure dependent
- Affects cool star models significantly

**Consequences if wrong**:
- Molecular opacities wrong (especially TiO, H2O)
- Cool star models inaccurate
- May not converge for T < 4000K

**Mitigation**:
- Priority: 🟢 Medium
- Test against known molecular abundance curves
- Validate for solar-type stars first
- Defer to later if focusing on hot stars initially

**Estimated effort**: 2-3 weeks combined

---

### Rank #13: Element-Specific Opacity Suite (15+ subroutines)

**Subroutines**: C1OP, C2OP, SI1OP, SI2OP, MG1OP, MG2OP, HE1OP, HE2OP, etc.
**Total**: ~30 opacity routines, ~3000 lines combined

**Risk Type**: Physics accuracy, repetitive errors
**Likelihood**: High (sheer volume) | **Impact**: Medium

**Why risky**:
- 15+ similar but different opacity calculations
- Each has element-specific formulas
- Easy to introduce systematic errors (copy-paste bugs)
- Validation requires element-specific test cases

**Consequences if wrong**:
- Opacity errors for specific elements
- Abundance-dependent model errors
- Hard to debug (which element is wrong?)

**Mitigation**:
- Priority: 🟢 Medium
- Develop template-based approach
- Migrate 2-3 as prototypes (e.g., HE1OP, C1OP)
- Create validation test suite per element
- Consider auto-generation from template
- Batch validation against Fortran

**Estimated effort**: 4-6 weeks (but parallelizable)

---

### Rank #14: Large Data Blocks - PFIRON, ISOTOPES, BLOCKJ, BLOCKH

**Files**:
- PFIRON: 6037 lines (iron partition functions)
- ISOTOPES: 1824 lines (isotope data)
- BLOCKJ: 787 lines (data block)
- BLOCKH: 780 lines (data block)

**Total**: 9428 lines of mostly data

**Risk Type**: Tedious errors, data corruption
**Likelihood**: Medium | **Impact**: Low-Medium

**Why risky**:
- Massive data transcription (9000+ lines)
- Easy to introduce typos
- Hard to validate (how do you check 6000 numbers?)
- Conceptually simple but high error surface

**Consequences if wrong**:
- Partition functions incorrect → POPS fails
- Isotope ratios wrong → spectral line errors
- Silent data corruption hard to detect

**Mitigation**:
- Priority: 🟢 Low-Medium (can defer)
- **Option A**: Auto-convert Fortran DATA to Julia arrays (write script)
- **Option B**: Extract to external data files (CSV, HDF5)
- **Option C**: Parse Fortran source at runtime (minimal migration)
- Validate by comparing key values (not all 9000 numbers)
- Consider this low-priority technical debt

**Estimated effort**: 2-4 weeks (Option A/B), or 1 week (Option C)

---

### Rank #15: PUTOUT - Output Format Compatibility

**File**: atlas12.for lines 401-605 (205 lines)
**Risk Type**: Validation compatibility
**Likelihood**: High | **Impact**: Low (functional), High (validation)

**Why risky**:
- 205 lines writing 31 COMMON blocks to file
- Multiple output formats (fort.7 deck, ASCII, etc.)
- Validation depends on bit-for-bit output match
- Format is undocumented

**Consequences if wrong**:
- Can't compare Julia vs Fortran outputs
- Validation impossible
- May break downstream tools (SYNTHE reads fort.7)

**Mitigation**:
- Priority: 🟡 Medium (needed for validation)
- Implement early (after READIN)
- Round-trip test: READIN → PUTOUT → READIN
- Compare against Fortran output byte-by-byte
- Document output format thoroughly
- Consider dual output (legacy format + modern format)

**Estimated effort**: 1-2 weeks

---

## Risk Summary Table

| Rank | Component | Lines | Risk Type | Priority | Effort | Status |
|------|-----------|-------|-----------|----------|--------|--------|
| 1 | POPS+PFSAHA | 941 | Precision overflow | 🔴 Highest | 3-5 weeks | ✅ DD02 |
| 2 | VOIGT | 111 | Algorithm complexity | 🔴 Highest | 1-2 weeks | ✅ DD01 |
| 3 | LINOP1+XLINOP | 568 | Performance critical | 🔴 Highest | 4-6 weeks | ✅ DD03 |
| 4 | Binary I/O | - | Format compatibility | 🔴 Highest | 2-3 weeks | ✅ DD04 |
| 5 | TCORR | 391 | Convergence | 🟡 High | 3-5 weeks | ✅ DD06 |
| 6 | JOSH | 268 | Algorithm precision | 🟡 High | 2-4 weeks | ✅ DD05 |
| 7 | CONVEC | 244 | Physics convergence | 🟡 High | 2-4 weeks | ✅ DD07 |
| 8 | READIN | 849 | Format/init order | 🟡 High | 2-3 weeks | 🔲 New |
| 9 | STATEQ | 160 | Convergence | 🟡 High | 1-2 weeks | 🔲 New |
| 10 | POPSALL | 288 | Order dependencies | 🟡 High | 2-3 weeks | 🔲 New |
| 11 | SELECTLINES | 513 | Performance/format | 🟡 Med-High | 2-3 weeks | 🔲 New |
| 12 | NMOLEC+MOLEC | 513 | Physics accuracy | 🟢 Medium | 2-3 weeks | 🔲 New |
| 13 | Opacity Suite | ~3000 | Systematic errors | 🟢 Medium | 4-6 weeks | 🔲 New |
| 14 | Data Blocks | 9428 | Data corruption | 🟢 Low-Med | 1-4 weeks | 🔲 New |
| 15 | PUTOUT | 205 | Validation compat | 🟡 Medium | 1-2 weeks | 🔲 New |

**Total High-Risk**: 15 components, ~18,000 lines, ~40-70 weeks effort

---

# Section 4: External Dependencies - Julia Package Requirements

**Purpose**: Identify required Julia packages and assess availability/maturity.

## Core Julia Standard Library (Included)

✅ **Already available, no external dependencies**:

1. **LinearAlgebra** - Matrix operations, linear solvers
   - For: SOLVIT, matrix inversions
   - Maturity: ✅ Excellent (stdlib)

2. **SpecialFunctions** (stdlib in Julia 1.0+, external package now)
   - Exponential integrals, error functions
   - For: Voigt profiles, opacity calculations
   - Maturity: ✅ Excellent

3. **Interpolations.jl** (external)
   - Multi-dimensional interpolation
   - For: PARCOE, opacity tables, temperature grids
   - Maturity: ✅ Excellent
   - Alternative: Implement custom (like Fortran does)

4. **QuadGK.jl** - Adaptive Gaussian quadrature
   - For: INTEG replacements (higher accuracy)
   - Maturity: ✅ Excellent
   - Alternative: Use simple trapezoidal (match Fortran)

## Physics/Astronomy Packages

5. **Unitful.jl** (optional but recommended)
   - Physical units and conversions
   - For: Temperature (K), wavelength (Å, nm), opacity (cm²/g)
   - Maturity: ✅ Excellent
   - Benefit: Catch unit errors at compile time
   - Risk: Performance overhead if not careful with @inbounds

6. **PhysicalConstants.jl**
   - CODATA physical constants
   - For: Replace hardcoded constants (Planck, Boltzmann, c, etc.)
   - Maturity: ✅ Good
   - Alternative: Define our own (like Fortran)

## File I/O Packages

7. **HDF5.jl** - HDF5 file format
   - For: Modern line database storage (replace fort.11/fort.12)
   - Maturity: ✅ Excellent
   - Use case: Long-term storage, not initial validation

8. **FortranFiles.jl** - Read Fortran unformatted files
   - For: Read fort.11, fort.12 for validation
   - Maturity: ✅ Good
   - Critical for: Binary I/O compatibility (Deep Dive 04)
   - Usage: Validation phase only, not production

9. **JLD2.jl** - Julia-native binary format
   - For: Fast checkpointing, intermediate results
   - Maturity: ✅ Excellent
   - Use case: Caching, restart files

## Performance/Optimization Packages

10. **StaticArrays.jl**
    - Fixed-size arrays (stack-allocated)
    - For: Small arrays (optical depth grid, angle grid)
    - Maturity: ✅ Excellent
    - Benefit: 2-10× speedup for small arrays

11. **LoopVectorization.jl** (@turbo macro)
    - SIMD vectorization
    - For: Line opacity summation (LINOP1, XLINOP)
    - Maturity: ✅ Very good (actively maintained)
    - Benefit: Potential 2-4× speedup

12. **ThreadsX.jl** or **FLoops.jl**
    - Parallel iteration
    - For: Frequency loop, line opacity accumulation
    - Maturity: ✅ Good
    - Alternative: Use Base.Threads directly

13. **CUDA.jl** (optional, future work)
    - GPU acceleration
    - For: Line opacity summation (millions of lines)
    - Maturity: ✅ Excellent
    - Priority: Low (defer until after CPU version works)

## Testing/Validation Packages

14. **Test.jl** (stdlib)
    - Unit testing framework
    - For: All subroutine tests
    - Maturity: ✅ Excellent

15. **BenchmarkTools.jl**
    - Performance benchmarking
    - For: Profiling LINOP1, VOIGT, JOSH
    - Maturity: ✅ Excellent

16. **Documenter.jl**
    - Documentation generation
    - For: API documentation
    - Maturity: ✅ Excellent

## Data Structure Packages

17. **StructArrays.jl** (optional)
    - Struct-of-arrays layout
    - For: AtmosphereState, LineData (cache-friendly)
    - Maturity: ✅ Good
    - Benefit: Better SIMD, cache performance

18. **Tables.jl** + **DataFrames.jl** (optional)
    - Tabular data handling
    - For: Line lists, abundance tables
    - Maturity: ✅ Excellent
    - Use case: Analysis, not core calculation

## Automatic Differentiation (Optional/Future)

19. **ForwardDiff.jl**
    - Forward-mode AD
    - For: Numerical derivatives in CONVEC (replace 4× POPS calls)
    - Maturity: ✅ Excellent
    - Priority: Medium (Deep Dive 07 suggests this)
    - Benefit: Exact derivatives, potentially faster

20. **Enzyme.jl** (future)
    - Reverse-mode AD (experimental)
    - For: Sensitivity analysis, optimization
    - Maturity: ⚠️ Experimental (but promising)
    - Priority: Low (research phase)

## Custom Packages Needed (Develop Ourselves)

21. **AtlasLineFormats.jl** (custom)
    - Parse Kurucz line list formats
    - Read/write fort.11, fort.12
    - Maturity: ❌ Must develop
    - Effort: 2-3 weeks
    - Critical for: Binary I/O (Deep Dive 04)

22. **AtlasInputParser.jl** (custom)
    - Parse ATLAS input file formats (DECK6, MIAC, etc.)
    - Maturity: ❌ Must develop
    - Effort: 1-2 weeks
    - Critical for: READIN (Rank #8 risk)

## Package Maturity Assessment

| Category | Package | Maturity | Priority | Risk |
|----------|---------|----------|----------|------|
| **Core** | LinearAlgebra | ✅ Excellent | Critical | None |
| **Core** | SpecialFunctions | ✅ Excellent | Critical | None |
| **I/O** | FortranFiles.jl | ✅ Good | Critical | Low |
| **I/O** | HDF5.jl | ✅ Excellent | Medium | None |
| **Performance** | LoopVectorization | ✅ Very Good | High | Low |
| **Performance** | StaticArrays | ✅ Excellent | Medium | None |
| **Physics** | Unitful | ✅ Excellent | Optional | Low |
| **AD** | ForwardDiff | ✅ Excellent | Medium | None |
| **Custom** | AtlasLineFormats | ❌ Must build | Critical | Medium |
| **Custom** | AtlasInputParser | ❌ Must build | Critical | Medium |

**Conclusion**: Julia ecosystem has excellent support for scientific computing. Only 2 custom packages need development (line formats, input parser), estimated 3-5 weeks effort.

---

# Section 5: Migration Roadmap Options

**Purpose**: Present 3 alternative migration strategies for Paula + Marcos to choose from. **NOT CHOOSING** - presenting options with pros/cons per mission brief.

## Option A: Foundation-First (Bottom-Up)

**Strategy**: Build complete foundation infrastructure before attempting any physics.

### Phase Sequence

**Phase 1: Base Infrastructure** (Weeks 1-4)
- AtlasBase.jl module structure
- Physical constants, atomic data
- Data structures (AtmosphereState, Populations, etc.)
- All easy subroutines (26 quick wins)
- Binary I/O (FortranFiles.jl integration)
- Input parser (READIN)
- Output writer (PUTOUT)

**Phase 2: Core Physics Modules** (Weeks 5-12)
- Populations (POPS, PFSAHA, NELECT)
- Equation of state (STATEQ)
- All opacity sources (30+ element-specific)
- Voigt profiles (TABVOIGT, VOIGT)

**Phase 3: Integration** (Weeks 13-18)
- Radiative transfer (JOSH)
- Line opacity (LINOP1, XLINOP)
- Convection (CONVEC)
- Iteration loop (TCORR)

**Phase 4: ATLAS12 Working** (Weeks 19-24)
- Complete atmosphere iteration
- Convergence testing
- Validation against Fortran
- Performance optimization

**Phase 5: SYNTHE** (Weeks 25-36)
- Spectrum synthesis pipeline
- SYNTHE-specific modules
- Validation

### Pros

✅ **Solid foundation** - Everything built on tested infrastructure
✅ **Early validation** - I/O working from Week 4
✅ **Architecture validation** - Proves struct design works
✅ **Parallelizable** - Multiple developers can work on opacity sources
✅ **Lower risk** - Catch design flaws early
✅ **Test coverage** - Comprehensive tests from start

### Cons

❌ **No working demo until Week 19** - Long wait for results
❌ **Motivation risk** - Team may lose momentum without visible progress
❌ **Unknown unknowns** - May discover integration problems late
❌ **Over-engineering risk** - May build infrastructure that gets refactored later
❌ **Harder to prioritize** - Don't know which opacity sources are critical

### Best For

- Multi-person team (parallelizable)
- Long timeline (6+ months acceptable)
- Research grant funding (needs comprehensive approach)
- Publication target (thorough, defensible)

---

## Option B: Vertical Slice (End-to-End Prototype)

**Strategy**: Build minimal working ATLAS12 first, expand incrementally.

### Phase Sequence

**Phase 1: Minimal ATLAS12** (Weeks 1-8)
- Simplified physics (H-only, no molecules, no convection)
- Essential subroutines only:
  - READIN (simplified input)
  - POPS (H, He, minimal metals)
  - STATEQ
  - JOSH (RT)
  - KAPP (minimal opacities: H, He)
  - TCORR (iteration)
  - PUTOUT
- **Goal**: Solar-type model converges (even if inaccurate)

**Phase 2: Expand Physics** (Weeks 9-16)
- Add all elements (C, N, O, Si, Mg, Fe, etc.)
- Add molecular opacities (H2, CO, TiO)
- Add convection (CONVEC)
- Add line opacity (simplified LINOP1)

**Phase 3: Full Accuracy** (Weeks 17-24)
- Complete line opacity (LINOP1, XLINOP with millions of lines)
- All element-specific opacities
- Full binary I/O
- Performance optimization

**Phase 4: SYNTHE** (Weeks 25-36)
- Spectrum synthesis pipeline
- Validation

### Pros

✅ **Working demo early** - Something converges by Week 8
✅ **Motivating** - Visible progress, team morale high
✅ **Iterative refinement** - Learn from minimal version
✅ **Prioritization clarity** - Know which features matter most
✅ **Fail fast** - Discover integration problems early
✅ **Incremental validation** - Test each expansion against Fortran

### Cons

❌ **Refactoring likely** - Minimal version may need redesign
❌ **Technical debt** - Simplified physics may create bad patterns
❌ **Validation complexity** - Hard to compare simplified vs full Fortran
❌ **Scope creep risk** - "Just one more feature" syndrome
❌ **May not converge** - Simplified physics may not be stable

### Best For

- Solo developer or small team
- Short timeline pressure (3-6 months)
- Proof-of-concept goal
- Agile/iterative development culture

---

## Option C: Quick Wins + Foundation (Hybrid)

**Strategy**: Build confidence with easy wins, then foundation, then integration.

### Phase Sequence

**Phase 1: Quick Wins** (Weeks 1-2)
- 15 easy subroutines (Section 2 list)
- Test framework established
- Julia package structure working
- CI/CD pipeline configured
- **Goal**: Team confident in Julia, patterns established

**Phase 2: I/O Infrastructure** (Weeks 3-5)
- Binary I/O (FortranFiles.jl, fort.11/fort.12)
- READIN input parser
- PUTOUT output writer
- Line selection (SELECTLINES)
- **Goal**: Can read Fortran inputs, write Fortran outputs

**Phase 3: Critical Path Deep Dives** (Weeks 6-14)
- POPS + PFSAHA + NELECT (3-5 weeks)
- STATEQ (1-2 weeks)
- JOSH (2-4 weeks)
- VOIGT + TABVOIGT (1-2 weeks)
- **Goal**: Core physics working, validated independently

**Phase 4: Opacity System** (Weeks 15-20)
- KAPP orchestrator
- Element-specific opacities (template-based, parallel)
- LINOP1 + XLINOP (line opacity)
- **Goal**: Complete opacity calculation

**Phase 5: Integration** (Weeks 21-28)
- TCORR iteration loop
- CONVEC (if needed for test cases)
- POPSALL orchestration
- **Goal**: Full ATLAS12 converges

**Phase 6: Validation & Optimization** (Weeks 29-36)
- Cross-validation (Castelli vs Kurucz vs Julia)
- Performance profiling and optimization
- Edge case testing
- **Goal**: Production-ready ATLAS12

**Phase 7: SYNTHE** (Weeks 37-48+)
- Spectrum synthesis pipeline
- (Can overlap with Phase 6)

### Pros

✅ **Momentum early** - Quick wins build confidence (Week 2)
✅ **Solid foundation** - I/O and Deep Dives done right
✅ **Pragmatic** - Balance between thoroughness and progress
✅ **Risk-managed** - Critical path (Deep Dives) gets most attention
✅ **Flexible** - Can adjust after Phase 3 based on learnings
✅ **Validation-ready** - I/O working early enables continuous validation

### Cons

❌ **Longer timeline** - 48+ weeks for full ATLAS12 + SYNTHE
❌ **Complex planning** - More phases to manage
❌ **Integration risk** - Quick wins may not integrate smoothly
❌ **Resource intensive** - Needs consistent effort over 9-12 months

### Best For

- Medium team (2-3 developers) or solo developer with time
- Balanced timeline (9-12 months acceptable)
- Research/publication goal
- Paula's stated workflow (grid-based parallelization)

---

## Decision Matrix

| Factor | Option A: Foundation | Option B: Vertical Slice | Option C: Hybrid |
|--------|---------------------|--------------------------|------------------|
| **Time to first working model** | 19 weeks | 8 weeks | 21 weeks |
| **Total time (ATLAS12)** | 24 weeks | 24 weeks | 28 weeks |
| **Total time (+ SYNTHE)** | 36 weeks | 36 weeks | 48 weeks |
| **Risk of design flaws** | Low | Medium-High | Low-Medium |
| **Team motivation** | Medium | High | High |
| **Parallelizable** | High | Low | Medium-High |
| **Validation ease** | High | Low | High |
| **Refactoring risk** | Low | High | Medium |
| **Suitable for solo** | Medium | High | High |
| **Suitable for team** | High | Medium | High |
| **Research publication** | Excellent | Poor | Good |
| **Grant application** | Excellent | Poor | Good |

## Recommendation (Analysis Only - Not Choosing)

**For Paula's context** (astrophysicist, grid-based work, publication target):
- ❌ Option B (Vertical Slice) - Poor fit for research rigor
- ✅ Option A or C viable - depends on team size and timeline flexibility

**If solo or small team**: Option C (Hybrid) - balanced approach
**If 3+ team**: Option A (Foundation) - maximizes parallelization
**If 3-month deadline**: Option B (Vertical Slice) - only way to meet it

**DECISION DEFERRED** to Paula + Marcos per mission brief.

---

# Section 6: Timeline Estimates per Option

**Purpose**: Provide detailed effort estimates for each migration roadmap option.

## Estimation Methodology

**Based on**:
- Section 1 difficulty classification
- Deep Dive complexity rankings
- COMMON block dependency analysis (Deliverable 1)
- Assumption: Solo developer, 40 hours/week, experienced Julia programmer

**Uncertainty bands**:
- Easy subroutines: ±20% (well-understood)
- Medium subroutines: ±40% (moderate unknowns)
- Hard subroutines: ±60% (many unknowns)
- Deep Dives: ±50% (analyzed but complex)

---

## Option A: Foundation-First Timeline

### Phase 1: Base Infrastructure (4 weeks, range: 3-6)

| Task | Effort | Dependencies |
|------|--------|--------------|
| Julia package setup | 0.5 weeks | None |
| AtlasBase.jl module | 0.5 weeks | None |
| Physical constants | 0.5 weeks | None |
| Data structures design | 1 week | COMMON_BLOCK_MAP |
| Easy subroutines (26) | 2-3 weeks | None |
| Binary I/O infrastructure | 2 weeks | FortranFiles.jl |
| READIN parser | 2-3 weeks | Input file archaeology |
| PUTOUT writer | 1-2 weeks | Output format docs |
| **Total (parallelizable)** | **4 weeks** | Solo: 9-13 weeks |

**Critical path**: READIN (3 weeks) if sequential

### Phase 2: Core Physics (8 weeks, range: 6-12)

| Task | Effort | Dependencies |
|------|--------|--------------|
| POPS + PFSAHA + NELECT | 3-5 weeks | Phase 1 complete |
| STATEQ | 1-2 weeks | AtmosphereState struct |
| POPSALL | 2-3 weeks | POPS validated |
| VOIGT + TABVOIGT | 1-2 weeks | None |
| Element opacities (30+) | 4-6 weeks | Template-based (parallel) |
| KAPP orchestrator | 1 week | Opacity sources |
| **Total** | **12-19 weeks** | Solo: 12-19 |

**Critical path**: POPS → POPSALL → Validation (8 weeks)

### Phase 3: Integration (6 weeks, range: 5-9)

| Task | Effort | Dependencies |
|------|--------|--------------|
| JOSH (RT) | 2-4 weeks | Phase 2 complete |
| LINOP1 + XLINOP | 4-6 weeks | VOIGT, Binary I/O |
| CONVEC | 2-4 weeks | POPS, derivatives |
| TCORR | 3-5 weeks | All above |
| **Total** | **11-19 weeks** | Critical path: 6 weeks (overlap possible) |

**Critical path**: TCORR depends on all others (must be last)

### Phase 4: ATLAS12 Working (5 weeks, range: 4-8)

| Task | Effort | Dependencies |
|------|--------|--------------|
| Iteration loop integration | 1-2 weeks | Phase 3 complete |
| Convergence testing | 2-3 weeks | Test suite |
| Fortran validation | 2-3 weeks | Multiple test cases |
| Performance profiling | 1-2 weeks | Benchmarks |
| Bug fixes | 1-3 weeks | Issues discovered |
| **Total** | **7-13 weeks** | |

### Phase 5: SYNTHE (12 weeks, range: 10-16)

| Task | Effort | Dependencies |
|------|--------|--------------|
| xnfpelsyn (atmosphere prep) | 2-3 weeks | ATLAS12 output |
| spectrv (synthesis core) | 3-5 weeks | Line opacity |
| Line readers (5 programs) | 3-4 weeks | Binary I/O |
| rotate + broaden | 1-2 weeks | Convolution |
| Validation | 3-4 weeks | Test spectra |
| **Total** | **12-18 weeks** | |

**Option A Total**: 24-40 weeks for ATLAS12, 36-58 weeks with SYNTHE

---

## Option B: Vertical Slice Timeline

### Phase 1: Minimal ATLAS12 (8 weeks, range: 6-12)

| Task | Effort | Dependencies |
|------|--------|--------------|
| Simplified READIN | 1-2 weeks | Solar case only |
| AtmosphereState struct | 0.5 weeks | Minimal fields |
| POPS (H, He only) | 2-3 weeks | Simplified |
| STATEQ | 1-2 weeks | |
| JOSH | 2-4 weeks | Full implementation needed |
| KAPP (minimal) | 1 week | H, He opacity only |
| TCORR (simplified) | 2-3 weeks | Basic damping |
| PUTOUT (simplified) | 1 week | |
| **Total** | **10-18 weeks** | |

**Risk**: Simplified physics may not converge

### Phase 2: Expand Physics (8 weeks, range: 6-12)

| Task | Effort | Dependencies |
|------|--------|--------------|
| Full POPS (all elements) | 2-3 weeks | Refactor from Phase 1 |
| Element opacities | 3-4 weeks | Subset first |
| Molecular opacities | 2-3 weeks | H2, CO, TiO |
| CONVEC | 2-4 weeks | |
| Simplified line opacity | 2-3 weeks | 1000 lines, not 1M |
| **Total** | **11-17 weeks** | |

**Risk**: Refactoring Phase 1 code

### Phase 3: Full Accuracy (8 weeks, range: 6-12)

| Task | Effort | Dependencies |
|------|--------|--------------|
| Full LINOP1 + XLINOP | 4-6 weeks | Binary I/O, millions of lines |
| All opacity sources | 2-3 weeks | Remaining elements |
| Full binary I/O | 2-3 weeks | fort.11/fort.12 |
| Performance optimization | 2-4 weeks | Profiling |
| Validation | 2-3 weeks | |
| **Total** | **12-19 weeks** | |

### Phase 4: SYNTHE (12 weeks, range: 10-16)

Same as Option A Phase 5.

**Option B Total**: 24-38 weeks for ATLAS12, 36-54 weeks with SYNTHE

---

## Option C: Hybrid Timeline

### Phase 1: Quick Wins (2 weeks, range: 1-3)

| Task | Effort | Dependencies |
|------|--------|--------------|
| Package setup + CI/CD | 0.5 weeks | None |
| 15 easy subroutines | 1.5 weeks | None (parallel) |
| Test framework | 0.5 weeks | |
| **Total** | **2.5 weeks** | |

### Phase 2: I/O Infrastructure (3 weeks, range: 2-5)

| Task | Effort | Dependencies |
|------|--------|--------------|
| FortranFiles.jl integration | 1 week | |
| Binary I/O (fort.11/fort.12) | 2 weeks | Deep Dive 04 |
| READIN | 2-3 weeks | Input archaeology |
| PUTOUT | 1-2 weeks | |
| SELECTLINES | 2-3 weeks | Binary I/O |
| **Total (parallelizable)** | **8-11 weeks** | Solo: 8-11 |

**Critical path**: READIN (3 weeks)

### Phase 3: Critical Path Deep Dives (9 weeks, range: 7-14)

| Task | Effort | Dependencies |
|------|--------|--------------|
| POPS + PFSAHA + NELECT | 3-5 weeks | Deep Dive 02 |
| STATEQ | 1-2 weeks | |
| JOSH | 2-4 weeks | Deep Dive 05 |
| VOIGT + TABVOIGT | 1-2 weeks | Deep Dive 01 |
| **Total** | **7-13 weeks** | |

### Phase 4: Opacity System (6 weeks, range: 5-9)

| Task | Effort | Dependencies |
|------|--------|--------------|
| KAPP orchestrator | 1 week | |
| Element opacities (template) | 3-4 weeks | Parallel |
| LINOP1 + XLINOP | 4-6 weeks | Deep Dive 03 |
| **Total (parallelizable)** | **8-11 weeks** | Critical: 6 |

### Phase 5: Integration (7 weeks, range: 6-11)

| Task | Effort | Dependencies |
|------|--------|--------------|
| TCORR | 3-5 weeks | All Deep Dives |
| CONVEC | 2-4 weeks | Deep Dive 07 |
| POPSALL | 2-3 weeks | POPS |
| **Total** | **7-12 weeks** | |

### Phase 6: Validation & Optimization (8 weeks, range: 6-12)

| Task | Effort | Dependencies |
|------|--------|--------------|
| Convergence testing | 2-3 weeks | |
| Fortran cross-validation | 3-4 weeks | Multiple versions |
| Performance profiling | 2-3 weeks | |
| Optimization (LINOP1) | 2-4 weeks | |
| Bug fixes | 2-3 weeks | |
| **Total** | **11-17 weeks** | |

### Phase 7: SYNTHE (12 weeks, range: 10-16)

Same as Option A Phase 5.

**Option C Total**: 37-58 weeks for ATLAS12, 49-74 weeks with SYNTHE

---

## Timeline Comparison Summary

| Milestone | Option A | Option B | Option C |
|-----------|----------|----------|----------|
| **Quick wins complete** | Week 4 | - | Week 2 |
| **I/O working** | Week 4 | Week 3 | Week 5 |
| **First convergence** | Week 19 | Week 8 | Week 23 |
| **ATLAS12 validated** | Week 24-40 | Week 24-38 | Week 37-58 |
| **SYNTHE complete** | Week 36-58 | Week 36-54 | Week 49-74 |
| **Best case (all perfect)** | 36 weeks | 36 weeks | 49 weeks |
| **Likely case (typical)** | 45 weeks | 42 weeks | 58 weeks |
| **Worst case (issues)** | 58 weeks | 54 weeks | 74 weeks |

## Resource Estimates

### Solo Developer (40 hrs/week)

| Option | Best | Likely | Worst |
|--------|------|--------|-------|
| A | 9 months | 11 months | 14 months |
| B | 9 months | 10 months | 13 months |
| C | 12 months | 14 months | 18 months |

### 2-Person Team (80 hrs/week)

| Option | Best | Likely | Worst |
|--------|------|--------|-------|
| A | 5 months | 6 months | 8 months |
| B | 7 months* | 8 months* | 10 months* |
| C | 7 months | 8 months | 10 months |

*Option B harder to parallelize (sequential vertical slice)

### 3-Person Team (120 hrs/week)

| Option | Best | Likely | Worst |
|--------|------|--------|-------|
| A | 3 months | 4 months | 5 months |
| B | 6 months* | 7 months* | 9 months* |
| C | 5 months | 6 months | 7 months |

*Option B still sequential bottleneck

## Recommendations by Context

**If timeline is critical** (<6 months):
- 3-person team + Option A (Foundation)
- OR accept Option B risks (Vertical Slice)

**If quality/publication is critical**:
- Option A (Foundation) or C (Hybrid)
- Solo: 11-14 months
- Team: 4-6 months

**If solo developer**:
- Option C (Hybrid) for balance
- 12-18 months realistic

**DECISION DEFERRED** to Paula + Marcos.

---

# Section 7: Validation Strategy

**Purpose**: Define how to prove the Julia implementation is correct.

## Validation Philosophy

**Tier-based approach**: Start simple, progressively increase rigor.

**Complementary methods**: No single test proves correctness. Use multiple independent validation approaches.

**Continuous validation**: Test at every stage (unit → integration → system).

---

## Tier 1: Smoke Tests (Week-by-week during development)

**Goal**: Prove basic functionality, catch catastrophic errors.

### Subroutine-Level Smoke Tests

For each migrated subroutine:

1. **Type stability check**
   ```julia
   @inferred pops(atmosphere, abundances)
   ```
   Ensures no type instabilities (performance killer)

2. **Bounds check**
   - No NaN outputs
   - No Inf outputs (unless physically meaningful)
   - Arrays in expected ranges

3. **Conservation laws**
   - Populations sum to 1.0
   - Charge neutrality preserved
   - Flux conservation (∫F_ν dν = σT_eff⁴)

### Example: POPS Smoke Test

```julia
@testset "POPS smoke tests" begin
    # Setup solar atmosphere
    atm = load_solar_atmosphere()
    abund = solar_abundances()

    # Run POPS
    pops!(atm, abund)

    # Smoke tests
    @test all(isfinite.(atm.populations))  # No NaN/Inf
    @test all(atm.populations .≥ 0)        # Physical
    @test all(sum(atm.populations, dims=2) .≈ atm.number_density)  # Conservation
end
```

**Frequency**: Every commit (CI/CD)
**Threshold**: 100% pass required

---

## Tier 2: Fortran Comparison (Cross-validation)

**Goal**: Match Fortran numerical output within tolerance.

### Unit Test Level (Per Subroutine)

1. **Extract test cases from Fortran**
   - Run Fortran code with instrumentation
   - Dump inputs/outputs for each subroutine call
   - Save as reference data (HDF5 or JLD2)

2. **Julia unit test against reference**
   ```julia
   @testset "POPS vs Fortran" begin
       # Load Fortran reference
       ref = load_fortran_reference("pops_solar_5777K.h5")

       # Run Julia
       julia_output = pops(ref.input_atmosphere, ref.input_abundances)

       # Compare
       @test julia_output ≈ ref.output_populations rtol=1e-6
   end
   ```

3. **Tolerance selection**
   - Easy subroutines (pure math): rtol=1e-12 (machine precision)
   - Medium (physics): rtol=1e-6 (0.0001%)
   - Hard (iterative): rtol=1e-4 to 1e-3 (0.01-0.1%)
   - Float32 arrays: rtol=1e-5 (Float32 limit)

### Integration Test Level (Iteration-by-Iteration)

**Goal**: Prove iteration convergence matches Fortran exactly.

1. **Capture Fortran iteration history**
   - Modify Fortran TCORR to dump T(τ), P(τ), flux_error every iteration
   - Save all 45 iterations to file

2. **Julia iteration-by-iteration comparison**
   ```julia
   @testset "ATLAS12 iteration convergence" begin
       fortran_history = load("fortran_solar_iterations.h5")

       # Run Julia ATLAS12
       julia_result, julia_history = atlas12(config, save_iterations=true)

       # Compare iteration-by-iteration
       for iter in 1:45
           @test julia_history[iter].temperature ≈ fortran_history[iter].T rtol=1e-4
           @test julia_history[iter].flux_error ≈ fortran_history[iter].flux_error rtol=1e-3
       end
   end
   ```

3. **Convergence behavior check**
   - Number of iterations to converge: ±2 iterations acceptable
   - Final flux error: within 10% of Fortran
   - Final temperature profile: within 0.1% at all depths

**Critical**: Must match Fortran convergence path, not just final answer. Different convergence → different damping → risk of failure on other models.

---

## Tier 3: Physics Validation (Independent of Fortran)

**Goal**: Prove physics is correct, regardless of Fortran.

### Test 1: Flux Conservation

**Physics requirement**: ∫ F_ν dν = σ T_eff⁴

```julia
@testset "Flux conservation" begin
    model = atlas12(config, T_eff=5777, log_g=4.44)

    # Integrate flux
    integrated_flux = trapz(model.frequency, model.flux)

    # Stefan-Boltzmann
    expected_flux = σ_SB * 5777^4

    # Must conserve to <1%
    @test integrated_flux ≈ expected_flux rtol=0.01
end
```

**Threshold**: <1% error (indicates fundamental physics error if fails)

### Test 2: Hydrostatic Equilibrium

**Physics requirement**: dP/dr = -ρ g

```julia
@testset "Hydrostatic equilibrium" begin
    model = atlas12(config, solar_params)

    # Numerical derivative
    dP_dr = diff(model.pressure) ./ diff(model.radius)
    rho_g = model.density .* model.gravity

    # Check at each depth
    @test dP_dr ≈ -rho_g[2:end] rtol=0.05  # 5% tolerance (numerical derivative error)
end
```

### Test 3: Saha Equation

**Physics requirement**: Populations match Saha-Boltzmann equation

```julia
@testset "Saha equation" begin
    model = atlas12(config, solar_params)

    # Extract H I and H II populations
    n_HI = model.populations[:, hydrogen_neutral_index]
    n_HII = model.populations[:, hydrogen_ion_index]

    # Saha equation (analytic)
    saha_ratio = saha_equation(model.temperature, model.electron_density,
                                ionization_potential_H)

    # Compare
    computed_ratio = n_HII ./ n_HI
    @test computed_ratio ≈ saha_ratio rtol=0.01
end
```

### Test 4: Optical Depth Monotonicity

**Physics requirement**: τ increases monotonically inward

```julia
@testset "Optical depth monotonic" begin
    model = atlas12(config, solar_params)

    # Check all frequencies
    for ν in 1:length(model.frequency)
        @test issorted(model.optical_depth[ν, :])  # Must increase with depth
    end
end
```

**If physics tests fail**: Bug in Julia code, not just numerical difference from Fortran.

---

## Tier 4: Edge Cases (Stress Testing)

**Goal**: Prove code handles extreme conditions.

### Test 1: Hot Stars (T_eff = 50,000 K)

**Challenge**: No H⁻ opacity, no molecules, extreme ionization

```julia
@testset "Hot star convergence" begin
    model = atlas12(config, T_eff=50000, log_g=4.0, metallicity=0.0)

    @test model.converged
    @test model.flux_error < 0.01
    # Compare to Fortran hot star model
end
```

### Test 2: Cool Stars (T_eff = 3500 K)

**Challenge**: Molecular opacity dominant, convection critical

```julia
@testset "Cool star convergence" begin
    model = atlas12(config, T_eff=3500, log_g=5.0, metallicity=0.0)

    @test model.converged
    @test model.has_convection  # Must detect convection zone
    # TiO opacity should be significant
end
```

### Test 3: Metal-Poor ([Fe/H] = -3.0)

**Challenge**: Minimal metal opacity

```julia
@testset "Metal-poor convergence" begin
    model = atlas12(config, T_eff=5000, log_g=3.0, metallicity=-3.0)

    @test model.converged
    # H, He opacity should dominate
end
```

### Test 4: Metal-Rich ([Fe/H] = +1.0)

**Challenge**: Enhanced metal line opacity

```julia
@testset "Metal-rich convergence" begin
    model = atlas12(config, T_eff=6000, log_g=4.5, metallicity=+1.0)

    @test model.converged
    @test model.metallicity_abundances ≈ 10.0 * solar_abundances rtol=0.1
end
```

### Test 5: Giant (log g = 1.0)

**Challenge**: Extended atmosphere, low density

```julia
@testset "Giant star convergence" begin
    model = atlas12(config, T_eff=4500, log_g=1.0, metallicity=0.0)

    @test model.converged
    # Extended atmosphere tests
end
```

**Threshold**: All edge cases must converge. If not, identify physical range limits.

---

## Tier 5: Long-Run Stability

**Goal**: Prove numerical stability over many iterations.

### Test 1: 1000-Iteration Test

```julia
@testset "Long-run stability" begin
    config.max_iterations = 1000  # Force long run

    model = atlas12(config, solar_params)

    # Should converge in ~45 iterations (normal)
    @test model.iterations_used < 100

    # If forced to continue, should remain stable
    @test all(isfinite.(model.temperature))
    @test model.flux_error remains_stable  # Not oscillating
end
```

**Detects**: Oscillations, slow divergence, numerical instability

---

## Tier 6: Cross-Validation (Castelli vs Kurucz vs Julia)

**Goal**: Validate against both Fortran lineages.

### Dual Fortran Comparison

1. **Run same test case through**:
   - Castelli ATLAS12 (2009 version)
   - Kurucz ATLAS12 (latest version)
   - Julia ATLAS12

2. **Compare outputs**:
   ```julia
   @testset "Cross-validation: Castelli vs Kurucz vs Julia" begin
       castelli = load_fortran_model("castelli_solar.dat")
       kurucz = load_fortran_model("kurucz_solar.dat")
       julia_model = atlas12(config, solar_params)

       # Julia should match BOTH Fortran versions within tolerance
       @test julia_model.temperature ≈ castelli.T rtol=0.01
       @test julia_model.temperature ≈ kurucz.T rtol=0.01

       # If Castelli ≠ Kurucz, investigate
       if !isapprox(castelli.T, kurucz.T, rtol=0.01)
           @warn "Castelli and Kurucz differ - investigate version differences"
       end
   end
   ```

3. **Divergence analysis**:
   - If Julia matches Castelli but not Kurucz: Check for version-specific features
   - If Julia matches neither: Bug in Julia
   - If Castelli ≠ Kurucz: Document version difference

**Benefit**: Proves Julia implementation is correct independent of Fortran version.

---

## Validation Checklist (Per Release)

**Before declaring a subroutine "done"**:

- [ ] Tier 1: Smoke tests pass (no NaN, conserve, bounds check)
- [ ] Tier 2: Matches Fortran reference data (unit test level)
- [ ] Unit tests in CI/CD
- [ ] Documentation written

**Before declaring ATLAS12 "alpha"** (first convergence):

- [ ] Tier 2: Iteration-by-iteration Fortran match (solar case)
- [ ] Tier 3: Physics validation (4 tests) pass
- [ ] At least 1 edge case converges

**Before declaring ATLAS12 "beta"** (validation phase):

- [ ] Tier 4: All 5 edge cases converge
- [ ] Tier 5: Long-run stability test passes
- [ ] Tier 6: Cross-validation (Castelli vs Kurucz vs Julia)
- [ ] Performance within 2× of Fortran

**Before declaring ATLAS12 "production"**:

- [ ] 10+ diverse test cases validated
- [ ] Performance within 1.5× of Fortran (or roadmap to optimize)
- [ ] Documentation complete
- [ ] Publication-quality validation report

---

## Test Case Suite (Minimum Required)

**Solar-type** (validation reference):
1. T_eff=5777 K, log g=4.44, [Fe/H]=0.0 (Sun)

**Hot stars**:
2. T_eff=30000 K, log g=4.0, [Fe/H]=0.0 (B star)
3. T_eff=50000 K, log g=4.5, [Fe/H]=0.0 (O star)

**Cool stars**:
4. T_eff=4000 K, log g=4.5, [Fe/H]=0.0 (K dwarf)
5. T_eff=3500 K, log g=5.0, [Fe/H]=0.0 (M dwarf)

**Giants**:
6. T_eff=4500 K, log g=2.0, [Fe/H]=0.0 (K giant)
7. T_eff=5000 K, log g=1.0, [Fe/H]=0.0 (red giant)

**Metallicity**:
8. T_eff=5000 K, log g=3.0, [Fe/H]=-3.0 (metal-poor)
9. T_eff=6000 K, log g=4.5, [Fe/H]=-1.0 (subdwarf)
10. T_eff=6000 K, log g=4.5, [Fe/H]=+0.5 (metal-rich)

**Total**: 10 test cases minimum for production release.

---

# Section 8: Risk Mitigation Actions

**Purpose**: For each identified risk, define concrete mitigation actions, timing, and responsibility.

## Format

For each risk:
- **Risk description**
- **Mitigation action** (what to do)
- **Timing** (when: pre-migration, during, post)
- **Owner** (Paula, code/Claude, or both)
- **Priority** (High/Medium/Low)

---

## Critical Risks (Ranks #1-7, Deep Dives)

### Risk 1: POPS Precision Overflow (Rank #1)

**Risk**: Float32 underflows to 0.0 for population ratios spanning 10⁻⁴² to 10⁺²

**Mitigation Actions**:

1. **Use Float64 throughout** (no compromise)
   - Timing: During migration (Week 6-10)
   - Owner: Code
   - Priority: 🔴 Critical
   - Validation: Test exp(-50) ≠ 0.0

2. **Test extreme temperature ranges**
   - Timing: During POPS validation
   - Owner: Code + Paula
   - Priority: 🔴 Critical
   - Test cases: T=3000K (cool, large ratios) and T=50000K (hot, ionization)

3. **Monitor for NaN propagation**
   - Timing: Every iteration (runtime check)
   - Owner: Code
   - Priority: 🟡 High
   - Action: Add `@assert all(isfinite.(populations))` in POPS

4. **Cross-reference Deep Dive 02**
   - Timing: Pre-migration (before writing code)
   - Owner: Code
   - Priority: 🔴 Critical
   - Action: Re-read DD02 Sections 3-4 before starting POPS migration

---

### Risk 2: VOIGT Magic Constants (Rank #2)

**Risk**: 13 undocumented constants in HVOIGT - changing them breaks Voigt profiles

**Mitigation Actions**:

1. **Preserve exact constants**
   - Timing: During migration
   - Owner: Code
   - Priority: 🔴 Critical
   - Action: Copy constants bit-for-bit from Fortran (use Fortran source literals)

2. **Flag constants as EMPIRICAL**
   - Timing: During migration
   - Owner: Code
   - Priority: 🟡 High
   - Action: Comment each constant with `# ⚠️ EMPIRICAL - origin unknown, DO NOT CHANGE`

3. **Create Voigt profile test suite**
   - Timing: During migration
   - Owner: Code
   - Priority: 🔴 Critical
   - Test cases: 100+ (ν, a) pairs from Fortran, validate <1.5% error (per DD01)

4. **Document regime boundaries**
   - Timing: During migration
   - Owner: Code
   - Priority: 🟡 High
   - Action: Add comments explaining 4 regimes (ν=0, 3, 8, 15 boundaries)

5. **Consider Voigt.jl alternative** (future work)
   - Timing: Post-migration (after validation complete)
   - Owner: Paula + Code
   - Priority: 🟢 Low
   - Action: Benchmark Voigt.jl vs ported HVOIGT, decide if worth replacing

---

### Risk 3: LINOP1 Performance (Rank #3)

**Risk**: 600 GFLOP Fortran routine - Julia must be within 2× or unusable

**Mitigation Actions**:

1. **Profile early and often**
   - Timing: During migration (Week 10-12)
   - Owner: Code
   - Priority: 🔴 Critical
   - Tools: BenchmarkTools.jl, ProfileView.jl
   - Target: Identify hot loops (likely Voigt calls)

2. **Implement early-exit optimization**
   - Timing: During migration
   - Owner: Code
   - Priority: 🔴 Critical
   - Action: Replicate Fortran's early exit (Deep Dive 03: if line_opacity < threshold, skip)
   - Benefit: 500× speedup per DD03

3. **Vectorize with @turbo or @simd**
   - Timing: During optimization (after correctness validated)
   - Owner: Code
   - Priority: 🟡 High
   - Tools: LoopVectorization.jl
   - Benefit: Potential 2-4× speedup

4. **Parallelize outer loops**
   - Timing: Post-validation (Week 20+)
   - Owner: Code
   - Priority: 🟡 High
   - Action: `@threads` over depth points or frequency points
   - Benefit: N× speedup (N = cores)

5. **Consider GPU acceleration** (deferred)
   - Timing: Phase 2 (after CPU version production-ready)
   - Owner: Code (research phase)
   - Priority: 🟢 Low (defer)
   - Benefit: Potential 10-100× speedup, but high development cost

6. **Acceptance criteria**
   - Timing: Before declaring "production"
   - Owner: Paula + Code
   - Priority: 🔴 Critical
   - Threshold: Julia LINOP1 must be within 2× of Fortran speed
   - Fallback: If >2× slower, parallelize or GPU required

---

### Risk 4: Binary I/O Incompatibility (Rank #4)

**Risk**: Fort.11/fort.12 format is compiler/platform-specific - Julia won't read Fortran files

**Mitigation Actions**:

1. **Use FortranFiles.jl**
   - Timing: Week 3-5 (I/O infrastructure phase)
   - Owner: Code
   - Priority: 🔴 Critical
   - Action: Test FortranFiles.jl against Castelli + Kurucz binary files

2. **Create round-trip test**
   - Timing: Week 5
   - Owner: Code
   - Priority: 🔴 Critical
   - Test: Fortran writes fort.12 → Julia reads → Julia writes → Fortran reads
   - Success: Bit-for-bit identical

3. **Cross-platform testing**
   - Timing: Week 5 (during I/O development)
   - Owner: Code
   - Priority: 🟡 High
   - Platforms: Linux (primary), macOS (if available), test endianness
   - Action: Validate fort.12 from gfortran (Little Endian) readable by Julia

4. **Document format thoroughly**
   - Timing: During I/O migration
   - Owner: Code
   - Priority: 🟡 High
   - Deliverable: Binary format specification document (expand Deep Dive 04 Section 3)

5. **Fallback: Manual binary parsing**
   - Timing: If FortranFiles.jl fails
   - Owner: Code
   - Priority: 🟡 Medium
   - Action: Implement custom read() calls with sizeof() calculations
   - Reference: Deep Dive 04 Section 6 (manual parsing examples)

6. **Long-term: Replace with HDF5**
   - Timing: Post-validation (Phase 2)
   - Owner: Paula + Code
   - Priority: 🟢 Medium
   - Action: Once Julia validated, convert line databases to HDF5 for portability
   - Benefit: Platform-independent, faster I/O, inspectable

---

### Risk 5: TCORR Convergence Behavior (Rank #5)

**Risk**: Different numerical behavior → different damping → convergence failure

**Mitigation Actions**:

1. **Iteration-by-iteration validation**
   - Timing: Week 21-28 (integration phase)
   - Owner: Code
   - Priority: 🔴 Critical
   - Method: Dump T(τ), P(τ), flux_error every iteration from Fortran
   - Test: Julia must match Fortran iteration path (not just final result)

2. **Preserve damping factors exactly**
   - Timing: During TCORR migration
   - Owner: Code
   - Priority: 🔴 Critical
   - Action: 0.3 electron density damping (NELECT), τ/4 optical depth damping, etc.
   - Reference: Deep Dive 06 Section 3 (6 damping mechanisms)

3. **Expose damping as parameters** (optional)
   - Timing: Post-validation
   - Owner: Code
   - Priority: 🟢 Low
   - Action: Allow config.damping_factor = 0.3 (default), enable experimentation
   - Benefit: Research flexibility, but DEFAULT must match Fortran

4. **Test oscillation detection**
   - Timing: During TCORR validation
   - Owner: Code
   - Priority: 🟡 High
   - Test case: Model that oscillates in Fortran (if exists)
   - Validate: Julia detects oscillation and increases damping (adaptive mode)

5. **Convergence failure diagnostics**
   - Timing: During development
   - Owner: Code
   - Priority: 🟡 High
   - Action: If convergence fails, dump full state (T, P, flux_error, populations)
   - Benefit: Debug which quantity is not converging

6. **Ask Paula about known convergence issues**
   - Timing: Pre-migration (before TCORR)
   - Owner: Paula
   - Priority: 🟡 Medium
   - Question: "Are there stellar parameters where ATLAS12 struggles to converge?"
   - Use as edge case tests

---

### Risk 6: JOSH RT Algorithm (Rank #6)

**Risk**: Radiative transfer integration subtle errors → wrong emergent flux

**Mitigation Actions**:

1. **Validate against analytic cases**
   - Timing: During JOSH migration (Week 13-16)
   - Owner: Code + Paula
   - Priority: 🔴 Critical
   - Test cases:
     - Isothermal atmosphere (known analytic solution)
     - Optically thin (I ≈ S)
     - Optically thick (I → B_ν(T))

2. **Cross-reference Deep Dive 05**
   - Timing: Pre-migration
   - Owner: Code
   - Priority: 🔴 Critical
   - Focus: Section 4 (algorithm description), Section 5 (COEFJ/COEFH matrices)

3. **Validate COEFJ/COEFH matrices**
   - Timing: During JOSH migration
   - Owner: Code
   - Priority: 🟡 High
   - Action: Compare pretabulated matrices to Fortran (bit-for-bit)
   - Question for Paula: How were COEFJ/COEFH originally computed? Can we regenerate?

4. **Test iteration convergence**
   - Timing: During validation
   - Owner: Code
   - Priority: 🟡 High
   - Test: JOSH Gauss-Seidel iteration (max 51 iterations)
   - Validate: Converges in similar iterations as Fortran

5. **Precision analysis** (Float32 vs Float64)
   - Timing: During migration
   - Owner: Code
   - Priority: 🟡 High
   - Reference: Deep Dive 05 Section 4 (mixed precision: weights Float32, source Float64)
   - Validate: Match Fortran's mixed precision exactly

---

### Risk 7: CONVEC Thermodynamic Derivatives (Rank #7)

**Risk**: Numerical derivatives ∂E/∂T, ∂ρ/∂T inaccurate → convection wrong → cool star models fail

**Mitigation Actions**:

1. **Start with finite differences** (match Fortran)
   - Timing: During CONVEC migration (Week 12-14)
   - Owner: Code
   - Priority: 🔴 Critical
   - Method: Replicate Fortran's ±0.1% perturbation (Deep Dive 07 Section 3)
   - Benefit: Exact numerical match to Fortran

2. **Validate thermodynamic derivatives**
   - Timing: During CONVEC validation
   - Owner: Code + Paula
   - Priority: 🔴 Critical
   - Test: Compare ∂E/∂T to analytic ideal gas (∂E/∂T = 3/2 N k_B for monoatomic)
   - Validate: Derivatives physically reasonable

3. **Migrate to ForwardDiff.jl** (post-validation)
   - Timing: After Fortran match validated (Week 30+)
   - Owner: Code
   - Priority: 🟢 Medium
   - Benefit: Exact derivatives (no ±0.1% error), potentially faster
   - Risk: Different numerical behavior → must revalidate convergence

4. **Test convection detection**
   - Timing: During validation
   - Owner: Code
   - Priority: 🟡 High
   - Test case: Cool star (T_eff=4000K) - must detect convection zone
   - Test case: Hot star (T_eff=30000K) - must NOT activate convection
   - Validate: Convection zone depth matches Fortran

5. **Check overshooting factor**
   - Timing: During migration
   - Owner: Paula
   - Priority: 🟡 Medium
   - Question: Deep Dive 07 found `0.5D-5` (should be 0.5?) - is this a typo?
   - Action: Validate against literature, test sensitivity

6. **30-iteration opacity loop**
   - Timing: During CONVEC migration
   - Owner: Code
   - Priority: 🟡 High
   - Action: Replicate Fortran's 30-iteration self-consistent opacity loop
   - Validate: Converges in similar iterations

---

## Medium Risks (Ranks #8-15)

### Risk 8: READIN Input Format Archaeology

**Mitigation**:
1. **Document format before coding** (Week 2-3, Code + Paula, 🔴 Critical)
   - Action: Analyze 10+ example input files, create format specification
2. **Test with diverse inputs** (Week 3, Code, 🟡 High)
   - Solar, hot star, cool star, metal-poor, metal-rich
3. **Error messages for invalid input** (During migration, Code, 🟡 Medium)
   - Don't silently fail like Fortran - report parse errors

### Risk 9: STATEQ Convergence

**Mitigation**:
1. **Validate hydrostatic equilibrium** (Week 8, Code, 🔴 Critical)
   - Test: dP/dr = -ρg at each depth
2. **Test extreme log g** (Validation phase, Code, 🟡 High)
   - log g = 1.0 (giant), log g = 5.0 (dwarf)

### Risk 10: POPSALL Order Dependencies

**Mitigation**:
1. **Migrate after POPS validated** (Week 11-13, Code, 🔴 Critical)
2. **Test abundance conservation** (Week 13, Code, 🟡 High)
   - Sum of all element abundances = total abundance

### Risk 11: SELECTLINES Performance

**Mitigation**:
1. **Profile with 10M lines** (Week 16, Code, 🟡 High)
2. **Migrate after Binary I/O validated** (Week 16, Code, 🔴 Critical)

### Risk 12: NMOLEC+MOLEC Physics

**Mitigation**:
1. **Defer if focusing on hot stars initially** (Flexible, Paula, 🟢 Low)
2. **Validate molecular abundances** (When migrated, Code + Paula, 🟡 Medium)
   - Test H2 dissociation curve (known from literature)

### Risk 13: Element Opacity Suite Systematic Errors

**Mitigation**:
1. **Prototype approach** (Week 15-17, Code, 🟡 High)
   - Migrate HE1OP, C1OP first, establish pattern
2. **Template-based translation** (Week 17-20, Code, 🟡 Medium)
   - Write script to generate Julia from Fortran pattern
3. **Batch validation** (Week 20, Code, 🟡 High)
   - Run all 30+ opacity routines against Fortran test cases

### Risk 14: Data Blocks (PFIRON, ISOTOPES, etc.)

**Mitigation**:
1. **Auto-convert option** (Week 22-24, Code, 🟢 Medium)
   - Write Fortran parser to extract DATA statements → Julia arrays
2. **External data files option** (Week 22-24, Code, 🟢 Medium)
   - Convert to CSV/HDF5, load at runtime
3. **Spot-check validation** (Week 24, Code + Paula, 🟡 Medium)
   - Don't validate all 9000 numbers - check key values (Fe I, Fe II, etc.)

### Risk 15: PUTOUT Validation Compatibility

**Mitigation**:
1. **Migrate early** (Week 4-5, Code, 🔴 Critical)
   - Needed for all subsequent validation
2. **Round-trip test** (Week 5, Code, 🔴 Critical)
   - READIN → PUTOUT → READIN (identical)
3. **Byte-by-byte comparison** (Week 5, Code, 🟡 High)
   - Compare Julia fort.7 to Fortran fort.7 (should be identical)

---

## General Mitigation Strategies

### Strategy 1: Continuous Validation

- **Action**: Run validation tests every commit (CI/CD)
- **Timing**: Week 1 onwards
- **Owner**: Code
- **Priority**: 🔴 Critical
- **Benefit**: Catch regressions immediately

### Strategy 2: Documentation-Driven Development

- **Action**: Write documentation BEFORE code for each subroutine
- **Timing**: During migration
- **Owner**: Code
- **Priority**: 🟡 High
- **Method**: Document purpose, inputs, outputs, algorithm, physics
- **Benefit**: Forces understanding before coding

### Strategy 3: Pair Review (Paula + Code)

- **Action**: Paula reviews completed subroutines for physics correctness
- **Timing**: After each Deep Dive migration
- **Owner**: Paula + Code
- **Priority**: 🟡 High
- **Focus**: Deep Dives #1-7 (physics-critical)
- **Benefit**: Catch physics errors code can't detect

### Strategy 4: Progressive Complexity

- **Action**: Always migrate easier dependencies before harder dependents
- **Timing**: Throughout migration
- **Owner**: Code
- **Priority**: 🔴 Critical
- **Example**: VOIGT before LINOP1, POPS before POPSALL, READIN before TCORR
- **Benefit**: Build on validated foundation

### Strategy 5: Flag Uncertainties

- **Action**: Mark all "unknown" constants, algorithms, or behaviors with ⚠️
- **Timing**: During migration
- **Owner**: Code
- **Priority**: 🟡 High
- **Example**: `const VOIGT_CONSTANT_3 = 1.4142135623730950488 # ⚠️ EMPIRICAL - origin unknown`
- **Benefit**: Clear what needs Paula's review or literature research

---

## Risk Mitigation Checklist (Before Declaring Production)

**Before declaring any component "production-ready"**:

- [ ] All Tier 1-3 validation tests pass
- [ ] Fortran cross-validation complete (iteration-by-iteration if applicable)
- [ ] Physics tests pass (conservation, equilibrium, etc.)
- [ ] Edge cases tested (hot, cool, metal-poor, giants)
- [ ] Performance within acceptable range (<2× Fortran for critical paths)
- [ ] Documentation complete (purpose, algorithm, physics, validation)
- [ ] Paula reviewed physics-critical code
- [ ] Uncertainties flagged (⚠️ EMPIRICAL tags)
- [ ] No outstanding bugs (all issues resolved or documented)

**This completes the MIGRATION_ASSESSMENT.md document.**

---

**Document Status**: ✅ COMPLETE
**Total Sections**: 8 of 8
**Total Length**: ~5,700 lines (Section 1: 755 lines, Sections 2-8: ~4,950 lines)
**Created**: 2025-11-09
**Purpose**: Phase 4 Deliverable 2 - Comprehensive migration planning for ATLAS.jl

