# ATLAS12 Migration Assessment - Executive Summary

**Analysis Date**: November 9, 2025  
**Total Subroutines Analyzed**: 80  
**Document Location**: `/home/user/Atlas.jl/docs/archaeology/MIGRATION_ASSESSMENT.md`

---

## Key Findings

### Overall Classification

| Difficulty | Count | % | Est. Lines | Effort per Unit | Total Effort |
|------------|-------|---|-----------|-----------------|--------------|
| **Easy** | 26 | 32.5% | ~1,100 | 1-2 days | 2-3 weeks |
| **Medium** | 5 | 6.3% | ~550 | 2-3 days | 1-2 weeks |
| **Hard** | 49 | 61.2% | ~10,400 | 3-21 weeks | 49-80 weeks |
| **TOTAL** | **80** | **100%** | **~12,050** | - | **12-20 months solo** |

### Effort Distribution

- **61% of subroutines are Hard** (49 of 80)
- **Easy + Medium represent only 38% of code** but ~31% of effort
- **Hard subroutines consume 80-85% of total migration effort**
- **Critical bottleneck**: Deep Dive subroutines (#1-7) require 24-40 person-weeks alone

---

## Classification Breakdown

### Easy (26 subroutines) - Lowest Risk, Quickest Migration

**Pure Utilities** (8):
- DERIV, INTEG, PARCOE, SOLVIT, W, DUMMYR, LINTER, HE2LIN
- **Characteristic**: No COMMON blocks, <100 lines, standard algorithms
- **Migration**: Trivial - direct translation, minimal validation needed
- **Risk Level**: Minimal

**Molecule Opacity Stubs** (11):
- C3OP, C4OP, N2OP, N3OP, N4OP, N5OP, O2OP, O3OP, O4OP, O5OP, O6OP
- **Characteristic**: 3-line placeholder routines
- **Migration**: Trivial - implement as stubs or remove entirely
- **Risk Level**: None (non-functional code)

**Simple Data Access** (5):
- BLOCKE, LINSOP, XLISOP, XSOP, PRETABLOG, TTAUP, TABVOIGT (7 with TABVOIGT)
- **Characteristic**: Simple initialization, minimal dependencies
- **Migration**: Low - straightforward data loading and table setup
- **Risk Level**: Minimal

**Recommendation**: 
- Translate all Easy subroutines immediately as confidence-building exercises
- Use to establish Julia infrastructure and test framework
- **Timeline**: Weeks 1-2 of migration

---

### Medium (5 subroutines) - Moderate Risk, Foundation Modules

1. **READMOL** (105 lines, 3 COMMON blocks)
   - Molecular data input parsing
   - **Risk**: File format understanding required
   - **Timeline**: Needed early for validation infrastructure

2. **IONPOTS** (334 lines, 1 COMMON block)
   - Element ionization potential tables
   - **Risk**: Tedious but conceptually simple
   - **Timeline**: Can be auto-converted or data-filed

3. **HIGH** (15 lines, 4 COMMON blocks)
   - Unknown purpose, context-dependent
   - **Risk**: Must understand surrounding physics

4. **TURB** (16 lines, 4 COMMON blocks)
   - Turbulence velocity calculation
   - **Risk**: Moderate - understand turbulence model

5. **ELECOP** (10 lines, 3 COMMON blocks)
   - Electron scattering opacity
   - **Risk**: Context-dependent, part of larger opacity system

**Recommendation**:
- Implement as secondary priority after Easy subroutines
- READMOL needed early (Week 2-3) for input infrastructure
- Others can follow (Week 3-4)
- **Timeline**: Weeks 2-4

---

### Hard (49 subroutines) - High Risk, Core Physics

#### CRITICAL: Deep Dive Subroutines (8 total) ⭐⭐⭐

**Rank #1 - POPS** (38 lines, Rank #1 risk)
- Saha-Boltzmann population calculation
- **Risk**: EXTREME - Float64 MANDATORY, ratios span 1e-42 to 1e+2
- **Dependency**: Calls PFSAHA (903 lines of partition function code)
- **Complexity**: Precision overflow, extreme ranges
- **Effort**: 3-5 weeks (including PFSAHA)
- **Status**: Already analyzed (Deep Dive 02)

**Rank #2 - VOIGT** (Not in atlas12.for directly - handled by TABVOIGT + VOIGT function)
- Voigt profile calculation
- **Risk**: HIGH - Performance critical (~1M calls/iteration)
- **Complexity**: 4-regime piecewise algorithm, 13 magic constants
- **Effort**: 1-2 weeks
- **Status**: Already analyzed (Deep Dive 01)

**Rank #3 - LINOP1, LINOP, XLINOP** (217, 181, 351 lines)
- Line opacity summation (most performance-critical)
- **Risk**: EXTREME - Precision accumulation, 100K-500M lines processed
- **Complexity**: Performance-critical inner loop, parallelization opportunities
- **Effort**: 4-6 weeks (all three combined)
- **Status**: Already analyzed (Deep Dive 03)

**Rank #5 - TCORR** (391 lines, 21 COMMON blocks)
- Main iteration loop damping/convergence
- **Risk**: HIGH - Convergence behavior critical, undocumented damping logic
- **Complexity**: Central orchestration of iteration, depends on 21 COMMON blocks
- **Effort**: 3-5 weeks
- **Status**: Already analyzed (Deep Dive 06)

**Rank #6 - JOSH** (268 lines, 11 COMMON blocks)
- Radiative transfer integration
- **Risk**: HIGH - Algorithm implementation critical, precision-sensitive
- **Complexity**: Complex integration algorithm, core physics
- **Effort**: 2-4 weeks
- **Status**: Already analyzed (Deep Dive 05)

**Rank #7 - CONVEC** (244 lines, 18 COMMON blocks)
- Convective energy transport
- **Risk**: HIGH - Physics convergence behavior, calls POPS 4× for derivatives
- **Complexity**: MLT model implementation, precision-sensitive
- **Effort**: 2-4 weeks
- **Status**: Already analyzed (Deep Dive 07)

**Supporting PFSAHA** (903 lines, 4 COMMON blocks)
- Partition function + Saha equation
- **Risk**: EXTREME - Handles extreme ranges, critical to POPS
- **Complexity**: 2190-line partition function table, precision-sensitive
- **Effort**: 3-4 weeks (included in POPS timeline)
- **Status**: Part of Deep Dive 02 analysis

**Sub-Total Deep Dives**: 8 subroutines, **24-40 person-weeks**

#### Very Large Data Blocks (4)

1. **PFIRON** (6037 lines) - Iron partition function
   - **Effort**: MEDIUM (1-2 weeks) - mostly data, can migrate to external files
   - **Risk**: LOW - conceptually trivial despite large size

2. **ISOTOPES** (1824 lines) - Element isotope data
   - **Effort**: MEDIUM (1-2 weeks) - tedious but straightforward
   - **Risk**: LOW - mostly data initialization

3. **BLOCKJ** (787 lines) - Data block
   - **Effort**: HIGH (1-1.5 weeks) - tedious
   - **Risk**: LOW - data only

4. **BLOCKH** (780 lines) - Data block
   - **Effort**: HIGH (1-1.5 weeks) - tedious
   - **Risk**: LOW - data only

**Sub-Total Data Blocks**: 4 subroutines, **4-8 person-weeks**

#### High-Complexity Opacity Calculations (15+ element-specific ops)

- **C1OP** (319 lines) - Carbon I
- **SI1OP** (430 lines) - Silicon I
- **SI2OP** (433 lines) - Silicon II
- **H2COLLOP** (256 lines) - H2 collisional
- **C2OP** (274 lines) - Carbon II
- **HE1OP** (121 lines) - Helium I
- **HOTOP** (154 lines) - High ionization
- **HLINOP** (58 lines) - Hydrogen lines
- **HMINOP** (102 lines) - H minus
- Plus 6 others at 17-50 lines each

**Pattern**: All follow similar structure (element-specific opacity calculation)
**Opportunity**: Can develop pattern-based translation tool
**Effort**: 2-3 days each = 4-6 weeks total
**Risk**: MEDIUM - repetitive but many details differ

**Sub-Total Opacity**: 15+ subroutines, **4-6 person-weeks**

#### Supporting Physics Calculations (7)

- **STATEQ** (160 lines) - State equation (P, ρ from T)
- **POPSALL** (288 lines) - Orchestrates all populations
- **ENERGYDENSITY** (112 lines) - Radiation field
- **NELECT** (98 lines) - Electron density (supports POPS)
- **VTURBSTANDARD** (91 lines) - Microturbulence
- **PRELINOP** (93 lines) - Line opacity preprocessing
- **KAPCONT** (94 lines) - Continuous opacity

**Risk**: MEDIUM - depends on Deep Dives, precision-sensitive
**Effort**: 2-3 weeks total
**Timeline**: Must follow Deep Dives (coordinated migration)

#### Input/Output & Initialization (6)

- **READIN** (849 lines) - Master input reader
- **PUTOUT** (205 lines) - Master output writer
- **SELECTLINES** (513 lines) - Line selection filtering
- **BLOCKR** (55 lines) - Radiation field init
- **RADIAP** (41 lines) - Radiation pressure
- **ROSS** (23 lines) - Rosseland mean

**Risk**: MEDIUM - file format understanding critical
**Effort**: 3-4 weeks
**Timeline**: READIN needed early (Week 2-3), others later

---

## Timeline Estimate (Solo Developer)

### Optimal Sequence

**Weeks 1-2: Foundation**
- Easy subroutines (26): ~2 weeks
- Set up Julia test infrastructure
- Validate simple translations work correctly

**Weeks 2-3: Input/Output Infrastructure**
- READIN (849 lines): Document input formats, translate
- PUTOUT (205 lines): Output formatting
- File I/O validation against Fortran

**Weeks 4-8: Critical Deep Dives (40% of effort)**
- POPS + PFSAHA (903 lines total): 3-4 weeks
  - NELECT (98 lines): 2-3 days (prerequisite)
  - PFSAHA (903 lines): 2-3 weeks (partition functions, Saha)
  - POPS (38 lines): 1 week (wrapper, validates PFSAHA)
- JOSH (268 lines): 2-3 weeks (RT integration)
- Start VOIGT/LINOP framework: 1-2 weeks

**Weeks 8-12: Line Opacity Deep Dive (30% of effort)**
- LINOP1 (217 lines): 2-3 weeks (performance profiling essential)
- LINOP (181 lines): 1-2 weeks
- XLINOP (351 lines): 2-3 weeks
- VOIGT function optimization: 1-2 weeks

**Weeks 12-14: Iteration Loop & Convection**
- TCORR (391 lines): 2-3 weeks (convergence validation critical)
- CONVEC (244 lines): 2 weeks
- STATEQ (160 lines): 1-2 weeks
- Full model convergence testing: 1-2 weeks

**Weeks 14-16: Opacity System**
- KAPP orchestration: 1 week
- Element opacity template: 1 week
- Port 15+ element-specific ops using pattern: 2-3 weeks

**Weeks 16-20: Supporting Infrastructure**
- POPSALL, ENERGYDENSITY, VELOCITURB, etc.: 2-3 weeks
- Continuous opacity (ROSS, RADIAP, KAPCONT): 1-2 weeks
- Line selection (SELECTLINES): 1 week
- Testing & integration: 2 weeks

**Weeks 20-24: Data & Utility**
- Large data blocks (ISOTOPES, BLOCKJ, BLOCKH, PFIRON): 3-4 weeks
  - Can be partially automated or migrated to data files
- IONPOTS, READMOL, other utility: 1-2 weeks
- Comprehensive validation & benchmarking: 1-2 weeks

**Total: 24-week baseline → 12-20 weeks with optimizations**

---

## Risk Assessment

### Critical Success Factors

1. **Precision Management**
   - POPS/PFSAHA must use Float64 throughout
   - Validate extreme values (1e-42 to 1e+2)
   - Test against known Fortran outputs

2. **Performance Validation**
   - LINOP1 is 600 GFLOP routine - must achieve <2× Fortran speed
   - Profile early and often
   - Consider SIMD/parallelization for line loops

3. **Convergence Behavior**
   - TCORR damping logic (0.3 factor) must be preserved exactly
   - Validate iteration count and convergence on test models
   - May need to adjust for Julia's numerical behavior

4. **File Format Compatibility**
   - Binary I/O (fort.11, fort.12, etc.) must match exactly
   - Endianness and padding critical
   - Use FortranFiles.jl for validation, then optimize

5. **Undocumented Constants**
   - VOIGT has 13 magic constants (origin unknown)
   - CONVEC has undocumented thresholds
   - Must replicate exactly without understanding

### Red Flags

❌ If Julia populations differ from Fortran by >1% → POPS precision issue  
❌ If convergence takes >2× iterations → TCORR damping/behavior issue  
❌ If line opacity calculation <1% slower → acceptable  
❌ If line opacity calculation >5× slower → major optimization needed  
❌ If any model fails to converge → critical algorithm misunderstanding  

---

## Resource Implications

### Minimum Required

1. **Analysis**: 4-6 weeks (Deep Dives already done ✓)
2. **Implementation**: 12-20 weeks (solo developer)
3. **Validation**: 2-4 weeks (ongoing + final comprehensive tests)
4. **Total Minimum**: 18-30 weeks

### Optimization Opportunities

1. **Template-Based Opacity Translation** (-2-3 weeks)
   - Develop pattern for element-specific opacities
   - Auto-generate Julia from Fortran template
   - Reduces 15+ similar routines from 3-5 days each

2. **Data File Migration** (-1-2 weeks)
   - PFIRON (6037 lines), ISOTOPES (1824 lines), BLOCKJ, BLOCKH
   - Move from embedded code to external data files
   - Can be loaded from file instead of translated

3. **External Tool Assistance**
   - Fortran→Julia translator (helps with large data blocks)
   - Automated testing framework (continuous validation)
   - Performance profiling tools

4. **Parallelization Planning** (-1 week early)
   - Line opacity has natural parallelism
   - Can reduce LINOP1/XLINOP to 2-3 weeks if parallelized early

### With Optimizations: 9-16 weeks realistic

---

## Validation Strategy

### Phase 1: Component-Level (By Category)
- Easy subroutines: Simple numerical tests
- Medium subroutines: Test against Fortran on single test case
- Deep Dive routines: Extensive reference testing

### Phase 2: Integration-Level
- POPS + PFSAHA: Validate populations against Fortran
- LINOP1 + JOSH + CONVEC: Validate opacity and RT on test models
- Full iteration loop: Single model convergence vs Fortran

### Phase 3: Model-Level
- Solar model (T=5777K): Match Fortran to <1% RMSE
- Hot model (T=30,000K): Convergence behavior validation
- Cool model (T=3,000K): Molecular opacity importance
- Extreme models: Test numerical stability

### Phase 4: Physics Validation
- Flux conservation: <1% error
- Hydrostatic equilibrium: Automatic if STATEQ correct
- Population ratios: Match Saha equation predictions
- Opacity behavior: Physical sensibility

---

## Summary: Classification Quick Reference

### Easy (Safe to Start Immediately)
✓ 26 subroutines, ~1,100 lines  
✓ Pure utilities + stubs  
✓ < 1-2 weeks translation  
✓ Minimal risk  

### Medium (Foundation Modules)
→ 5 subroutines, ~550 lines  
→ File I/O, data initialization  
→ 1-2 weeks, READMOL needed early  
→ Moderate risk  

### Hard - Deep Dives (Priority 1)
⭐⭐⭐ 8 subroutines, ~3,300 lines  
⭐⭐⭐ 24-40 person-weeks (60% of effort)  
⭐⭐⭐ POPS, TCORR, LINOP/XLINOP, JOSH, CONVEC, VOIGT, PFSAHA  
⭐⭐⭐ MUST validate extensively  

### Hard - Data Blocks (Priority 2)
⚠️ 4 subroutines, ~10,400 lines combined  
⚠️ 4-8 weeks tedious translation  
⚠️ Can partially automate or migrate to external files  
⚠️ Low complexity, high volume  

### Hard - Opacities (Priority 3)
⚠️ 15+ subroutines, ~3,500 lines  
⚠️ 4-6 weeks (can use template pattern)  
⚠️ Repetitive structure, many element-specific details  
⚠️ Medium risk (many variants)  

### Hard - Supporting (Priority 4)
⚠️ 7 subroutines, ~1,200 lines  
⚠️ 2-3 weeks  
⚠️ Depends on Deep Dives  
⚠️ Medium risk  

---

## Document Structure

The full classification is organized as:

1. **Summary Statistics** - Overall effort, categorization
2. **Easy Subroutines** - Detailed breakdown of 26 subroutines
3. **Medium Subroutines** - Detailed breakdown of 5 subroutines
4. **Hard Subroutines** - Detailed breakdown of 49 subroutines
   - Deep Dive high-risk (8)
   - Very large data blocks (4)
   - High complexity with many blocks (3)
   - Physics calculations by size
   - Element-specific opacity routines (15+)
   - Supporting calculations (7)
   - Input/output & initialization (6)
5. **Summary by Difficulty** - Quick reference
6. **Migration Strategy** - Phase-by-phase approach
7. **Known Challenges** - Category-specific risks
8. **Estimated Effort Table** - Timeline by category
9. **Cross-References** - Links to Deep Dives

---

## Next Steps

1. **Review Classification**: Verify accuracy of categorization
2. **Prioritize**: Confirm migration order (Easy → Medium → Hard)
3. **Plan Resources**: Allocate 3-6 months for complete migration
4. **Setup Infrastructure**: 
   - Julia package structure
   - Test framework
   - Fortran validation harness
5. **Begin Easy Subroutines**: Establish patterns and processes
6. **Deep Dive Prep**: Ensure Deep Dive analyses are complete (✓ Already done)

