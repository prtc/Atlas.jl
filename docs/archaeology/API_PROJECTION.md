# ATLAS.jl API Cost Projection
**Phase 4 Deliverable 3 - Research Credit Application Support**

**Created**: 2025-11-09
**Purpose**: Estimate API usage costs for ATLAS12 + SYNTHE migration to support research credit application
**Based on**: MIGRATION_ASSESSMENT.md subroutine classification (80 ATLAS12 + 32 Atlas7v subroutines)

---

## Executive Summary

**Total Estimated API Cost**: $2,500 - $5,700 (range reflects uncertainty in iteration counts and debugging complexity)

**Breakdown by component**:
- ATLAS12 core (80 subroutines): $1,600 - $3,400
- Atlas7v library (32 critical subroutines): $600 - $1,200
- SYNTHE pipeline (50+ subroutines): $800 - $1,600
- Debugging, validation, optimization: +30% = $750 - $1,900

**Confidence level**: Medium (±40%) - based on Deep Dive complexity analysis and COMMON block dependency mapping

**Cost drivers**:
1. **Deep Dive subroutines** (8 critical) - 40% of total API cost despite being 10% of code
2. **Human-in-loop physics validation** - Paula's expertise needed for ~25 complex subroutines
3. **Iterative debugging** - Fortran archaeology reveals undocumented algorithms requiring multiple passes
4. **Context window requirements** - Large subroutines (PFIRON: 6K lines, READIN: 849 lines) need expensive API calls

---

## Section 1: API Iteration Estimates per Module Type

### Methodology

**Iteration defined**: One API request/response cycle (prompt → Claude response)

**Iteration types**:
- **Simple**: Small context, focused question (~500 tokens prompt, ~2K tokens response) → $0.30-0.60
- **Complex**: Large context, full subroutine migration (~2K tokens prompt, ~8K tokens response) → $1.50-3.00
- **Debug**: Multiple rounds of error fixes (~1K tokens prompt, ~4K tokens response) → $0.80-1.50

**Assumptions**:
- Using Claude Sonnet 4.5 (current pricing: $3/MTok input, $15/MTok output)
- Average context window: 5K tokens input, 10K tokens output per complex iteration
- Research credit rate may differ from production pricing

---

### Easy Modules (26 subroutines)

**Characteristics**: Standalone, <100 lines, simple algorithms, no COMMON blocks (or read-only)

**Examples**: DERIV (20 lines), INTEG (18 lines), PARCOE (45 lines), SOLVIT (58 lines), LINTER (14 lines)

#### Iteration Breakdown

| Stage | Iterations | Why | Cost/Module |
|-------|-----------|-----|-------------|
| **Initial translation** | 1 | Direct Fortran → Julia, straightforward | $1.50-2.50 |
| **Unit testing** | 0.5 | Simple test cases, usually works first try | $0.50-1.00 |
| **Validation** | 0.5 | Compare to Fortran reference, minor fixes | $0.50-1.00 |
| **Documentation** | 0.3 | Document purpose, inputs, outputs | $0.30-0.60 |
| **Integration** | 0.2 | Add to package, rarely needs fixes | $0.20-0.40 |
| **TOTAL per module** | **2.5** | | **$3.00-5.50** |

**Total for Easy (26 modules)**:
- Iterations: 26 × 2.5 = **65 iterations**
- Cost: 26 × $4.25 (avg) = **$78 - $143**

**Notes**:
- Stubs (C3OP, N2OP, etc.) even cheaper - can batch-process 5-10 at once
- Pure utilities (DERIV, INTEG) essentially one-shot translations
- Lowest uncertainty category (±20%)

---

### Medium Modules (5 subroutines)

**Characteristics**: 2-5 COMMON blocks, 100-500 lines, moderate complexity, documented algorithms

**Examples**: READMOL (105 lines, file I/O), IONPOTS (334 lines, data tables), HIGH (15 lines but 4 COMMON blocks)

#### Iteration Breakdown

| Stage | Iterations | Why | Cost/Module |
|-------|-----------|-----|-------------|
| **Architecture analysis** | 1 | Understand COMMON block dependencies | $1.50-2.50 |
| **Initial translation** | 2 | More complex, may need refactoring | $3.00-5.00 |
| **Unit testing** | 1.5 | Multiple test cases, edge cases | $1.50-3.00 |
| **COMMON block refactoring** | 1 | Convert to Julia structs, pass as arguments | $1.50-2.50 |
| **Validation** | 1 | Fortran comparison, debugging | $1.50-2.50 |
| **Documentation** | 0.5 | More detailed docs needed | $0.50-1.00 |
| **Integration** | 0.5 | May need struct design updates | $0.50-1.00 |
| **TOTAL per module** | **7.5** | | **$10.00-17.50** |

**Total for Medium (5 modules)**:
- Iterations: 5 × 7.5 = **38 iterations**
- Cost: 5 × $13.75 (avg) = **$50 - $88**

**Notes**:
- IONPOTS (334 lines of data) may need auto-conversion script → extra 2-3 iterations
- File I/O (READMOL) benefits from FortranFiles.jl → fewer debugging iterations
- Uncertainty: ±30%

---

### Hard Modules (49 subroutines)

**Characteristics**: 5+ COMMON blocks OR >500 lines OR Deep Dive ranked, complex algorithms, precision-sensitive

**Subdivide by complexity**:

#### Hard Tier 1: Deep Dive Subroutines (8 modules) ⭐ HIGHEST COST

**Examples**: POPS+PFSAHA (941 lines, Rank #1), LINOP1+XLINOP (568 lines, Rank #3), TCORR (391 lines, Rank #5)

| Stage | Iterations | Why | Cost/Module |
|-------|-----------|-----|-------------|
| **Deep Dive review** | 1 | Re-read existing Deep Dive analysis | $1.00-2.00 |
| **Architecture design** | 2 | Design Julia structs, understand dependencies | $3.00-5.00 |
| **Initial translation** | 3-5 | Complex algorithms, multiple attempts | $6.00-12.00 |
| **Physics validation** | 2-3 | **Paula consult**: Check physics correctness | $3.00-6.00 |
| **Precision debugging** | 2-4 | Float32/Float64 issues, overflow/underflow | $3.00-8.00 |
| **Fortran comparison** | 2-3 | Iteration-by-iteration matching | $3.00-6.00 |
| **Performance optimization** | 2-4 | Profiling, vectorization (LINOP1, VOIGT) | $3.00-8.00 |
| **Edge case testing** | 1-2 | Hot/cool stars, extreme conditions | $1.50-4.00 |
| **Documentation** | 1 | Extensive docs, cross-reference Deep Dive | $1.50-2.50 |
| **Integration** | 1-2 | Complex dependencies, careful integration | $1.50-4.00 |
| **TOTAL per module** | **17-28** | | **$26.00-57.50** |

**Average per Deep Dive**: **22 iterations**, **$42.00**

**Total for Deep Dives (8 modules)**:
- Iterations: 8 × 22 = **176 iterations**
- Cost: 8 × $42.00 = **$208 - $460**

**Breakdown by specific Deep Dive**:

| Module | Lines | Rank | Iterations | Cost | Notes |
|--------|-------|------|-----------|------|-------|
| POPS+PFSAHA | 941 | #1 | 28-35 | $50-70 | Float64 critical, 40+ order magnitude range |
| VOIGT | 111 | #2 | 15-20 | $25-40 | 13 magic constants, 4-regime algorithm |
| LINOP1+XLINOP | 568 | #3 | 25-32 | $45-65 | Performance critical (600 GFLOP), profiling intensive |
| Binary I/O | - | #4 | 12-18 | $20-35 | Format archaeology, FortranFiles.jl integration |
| TCORR | 391 | #5 | 22-28 | $40-55 | Convergence critical, 21 COMMON blocks |
| JOSH | 268 | #6 | 18-24 | $30-48 | RT algorithm, COEFJ/COEFH matrices |
| CONVEC | 244 | #7 | 20-26 | $35-50 | Derivatives (4× POPS calls), MLT physics |
| PFSAHA | 903 | Implicit | 25-30 | $45-60 | Partition functions, supports POPS |

**Deep Dive subtotal**: **$290-423** (conservative: $290, likely: $356, pessimistic: $423)

**Critical observation**: Deep Dives are **10% of code but 40% of API cost** due to:
- Physics complexity requiring Paula's validation
- Multiple debugging passes (precision, convergence, performance)
- Extensive cross-validation against Fortran

---

#### Hard Tier 2: Large Data Blocks (4 modules)

**Examples**: PFIRON (6037 lines), ISOTOPES (1824 lines), BLOCKJ (787 lines), BLOCKH (780 lines)

| Stage | Iterations | Why | Cost/Module |
|-------|-----------|-----|-------------|
| **Auto-conversion strategy** | 2 | Decide: manual, script, or external file | $2.00-4.00 |
| **Script development** | 3-5 | Write Fortran DATA → Julia parser | $4.00-10.00 |
| **Data extraction** | 1-2 | Run script, debug format issues | $1.50-4.00 |
| **Spot validation** | 1 | Check key values (not all 9000 numbers) | $1.00-2.00 |
| **Integration** | 0.5 | Add to package as data file or module | $0.50-1.00 |
| **TOTAL per module** | **7.5-10.5** | | **$9.00-21.00** |

**Total for Data Blocks (4 modules)**:
- Iterations: 4 × 9 (avg) = **36 iterations**
- Cost: 4 × $15.00 (avg) = **$36 - $84**

**Notes**:
- Script development amortizes across all 4 data blocks
- PFIRON alone is 6037 lines - could be extracted to external file
- Uncertainty: ±40% (depends on parser complexity)

---

#### Hard Tier 3: Element-Specific Opacities (30+ modules)

**Examples**: C1OP (319 lines), SI1OP (430 lines), HE1OP (121 lines), MG1OP (129 lines), etc.

**Strategy**: Template-based migration (develop pattern, replicate)

| Stage | Iterations | Why | Cost/Module |
|-------|-----------|-----|-------------|
| **Prototype (first 2-3)** | 12-15 | Establish pattern (HE1OP, C1OP) | $20-30 (one-time) |
| **Template development** | 3-5 | Generalize pattern for all elements | $5-10 (one-time) |
| **Per-element translation** | 2-3 | Apply template, adjust element-specific | $3.00-6.00 |
| **Validation per element** | 1 | Compare to Fortran opacity | $1.50-2.50 |
| **Batch integration** | 1 | Add all to opacity system | $1.50-2.50 |
| **TOTAL per module** | **4-5** (after template) | | **$6.00-11.00** |

**Template development cost**: $25-40 (one-time, amortized)

**Total for Opacity Suite (30 modules)**:
- Template development: **$25-40** (one-time)
- Per-element: 30 × 4.5 (avg) = **135 iterations**
- Cost: $25-40 + (30 × $8.50) = **$280 - $370**

**Notes**:
- Template approach significantly reduces cost vs individual migration
- First 2-3 prototypes expensive ($20-30), rest cheap ($6-11)
- Uncertainty: ±30%

---

#### Hard Tier 4: Supporting Physics & Orchestration (7 modules)

**Examples**: STATEQ (160 lines), POPSALL (288 lines), READIN (849 lines), SELECTLINES (513 lines), PUTOUT (205 lines)

| Stage | Iterations | Why | Cost/Module |
|-------|-----------|-----|-------------|
| **Architecture analysis** | 2 | Multiple COMMON blocks, dependencies | $2.50-5.00 |
| **Initial translation** | 3-4 | Moderate complexity | $4.50-8.00 |
| **Physics/logic validation** | 2-3 | **Paula consult** for STATEQ, POPSALL | $3.00-6.00 |
| **Format archaeology** | 1-3 | READIN, SELECTLINES (undocumented formats) | $1.50-6.00 |
| **Integration testing** | 2 | Depends on other modules | $3.00-5.00 |
| **Documentation** | 1 | Detailed docs | $1.50-2.50 |
| **TOTAL per module** | **11-16** | | **$16.00-32.50** |

**Total for Supporting (7 modules)**:
- Iterations: 7 × 13.5 (avg) = **95 iterations**
- Cost: 7 × $24.25 (avg) = **$112 - $228**

**Notes**:
- READIN (849 lines) especially expensive - input format archaeology
- POPSALL orchestration complexity
- Uncertainty: ±50% (format archaeology unpredictable)

---

### Hard Modules Summary

| Tier | Modules | Iterations | Cost | % of Hard |
|------|---------|-----------|------|-----------|
| **T1: Deep Dives** | 8 | 176 | $290-423 | 40% |
| **T2: Data Blocks** | 4 | 36 | $36-84 | 6% |
| **T3: Opacity Suite** | 30 | 160 | $280-370 | 45% |
| **T4: Supporting** | 7 | 95 | $112-228 | 20% |
| **TOTAL Hard (49)** | **49** | **467** | **$718-1,105** | **100%** |

---

## Section 1 Summary: All Modules

| Category | Modules | Iterations | Cost | % of Total |
|----------|---------|-----------|------|------------|
| **Easy** | 26 | 65 | $78-143 | 6% |
| **Medium** | 5 | 38 | $50-88 | 4% |
| **Hard** | 49 | 467 | $718-1,105 | 70% |
| **ATLAS12 Total** | **80** | **570** | **$846-1,336** | **80%** |

**Key insight**: 61% of modules (Hard) consume 82% of API budget.

---

## Section 2: Physics Expertise Bottlenecks

**Context**: Some subroutines require Paula's domain expertise to validate physics correctness, not just code correctness.

### Human-in-Loop Required (25 subroutines estimated)

These require **Paula consultation** iterations (longer cycle time, but same API cost):

#### Critical Physics Validation (10 modules)

1. **POPS + PFSAHA** - Saha-Boltzmann equation, partition functions
   - **Paula input**: Validate population ratios make physical sense
   - **Trigger**: After initial translation, before optimization
   - **Iterations**: 2-3 physics reviews

2. **STATEQ** - Equation of state, hydrostatic equilibrium
   - **Paula input**: Verify pressure/density profiles physically reasonable
   - **Trigger**: After translation, during validation
   - **Iterations**: 1-2 physics reviews

3. **CONVEC** - Mixing length theory, convection physics
   - **Paula input**: Validate convection zone detection, flux calculations
   - **Trigger**: After translation, especially overshooting factor (potential bug)
   - **Iterations**: 2-3 physics reviews

4. **POPSALL** - Population orchestration, charge neutrality
   - **Paula input**: Check abundance conservation, species ordering
   - **Trigger**: After integration with POPS
   - **Iterations**: 1-2 physics reviews

5. **NMOLEC + MOLEC** - Molecular equilibrium (H2, CO, TiO)
   - **Paula input**: Validate molecular abundance curves
   - **Trigger**: After translation, test with cool star models
   - **Iterations**: 2-3 physics reviews

6. **JOSH** - Radiative transfer integration
   - **Paula input**: Validate emergent flux, COEFJ/COEFH matrices
   - **Trigger**: After translation, analytic test cases
   - **Iterations**: 1-2 physics reviews

7. **TCORR** - Temperature correction, convergence damping
   - **Paula input**: Validate damping factors (0.3, τ/4, T_eff/25)
   - **Trigger**: During iteration testing
   - **Iterations**: 2-3 physics reviews (if convergence issues)

8. **Element opacities** (C1OP, SI1OP, etc.) - Opacity physics
   - **Paula input**: Spot-check opacity formulas against literature
   - **Trigger**: During template development (first 2-3 elements)
   - **Iterations**: 1 review per prototype element

9. **READIN** - Input parameter interpretation
   - **Paula input**: Validate keyword meanings (MIAC encoding, etc.)
   - **Trigger**: During format archaeology
   - **Iterations**: 1-2 reviews

10. **SYNTHE opacities** (xnfpelsyn, IFOP flags) - Opacity switches
    - **Paula input**: Validate 20 IFOP flags (which opacities included)
    - **Trigger**: During SYNTHE migration
    - **Iterations**: 1-2 reviews

11. **Vacuum ↔ Air Wavelength Conversion** - Line list wavelength conventions ⚠️ **NEW CRITICAL**
    - **Paula input**: Identify Fortran's conversion formula (Edlén 1953/1966 vs Ciddor 1996)
    - **Paula input**: Verify wavelength ranges (UV vacuum, optical air, IR?)
    - **Paula input**: Review Kurucz line list documentation for conventions
    - **Trigger**: Pre-migration (Week 1, before line database work)
    - **Iterations**: 1-2 reviews
    - **Identified by**: Marcos Diaz (2025-11-11)
    - **Why critical**: Wrong conversions → wrong line identifications → wrong science
    - **See**: MIGRATION_ASSESSMENT.md Risk 8, ARCHITECTURE_INSIGHTS.md Decision 5.7

#### Uncertainty Clarification (15 modules)

**Undocumented constants/algorithms** requiring Paula's judgment:

- VOIGT (13 magic constants) - "Are these from literature or empirical?"
- CONVEC overshooting factor (0.5D-5 potential typo) - "Should this be 0.5?"
- Frequency boundaries (NUCI=11601, NULYMAN=9599, etc.) - "What do these represent?"
- CUTOFF thresholds - "Is 0.001 optimal or rule of thumb?"
- Iteration limits (ITMAXL, NUMITS) - "Can these be parameters or must be fixed?"

**Pattern**: 1 iteration per clarification question
**Total**: ~15 clarification iterations across all modules

### Paula Time Budget Impact

**Total Paula consultation iterations**: ~26-37 iterations (updated to include wavelength conversion)
**API cost**: Same as code iterations (~$45-75 total, included in module costs above)
**Paula time cost**: ~11-21 hours over migration (not API cost, but project timeline)

**Critical path**: Paula availability is a bottleneck for 11 critical modules. Can parallelize Easy/Medium modules while waiting for physics validation.

**NEW addition** (2025-11-11): Wavelength conversion documentation added as Critical Physics Validation item #11, requires 1-2 Paula review iterations pre-migration (Week 1).

**Mitigation**: Batch physics questions to minimize Paula's context-switching overhead.

---

## Section 3: High-Iteration Sections

**These modules will require >15 iterations each** due to complexity, debugging, or performance work.

### Rank 1: POPS + PFSAHA (Estimated 28-35 iterations, $50-70)

**Why high iteration count**:
1. **Precision complexity** (5-7 iterations)
   - Float64 requirement (test overflow/underflow)
   - 40+ order magnitude range validation
   - NaN propagation debugging

2. **PFSAHA integration** (4-6 iterations)
   - 903-line partition function subroutine
   - 2190-line PARTTAB data table
   - Saha equation numerical stability

3. **Physics validation** (3-4 iterations)
   - Population ratios vs Saha equation (with Paula)
   - Electron density iteration (0.3 damping factor)
   - Charge neutrality testing

4. **Fortran cross-validation** (4-6 iterations)
   - Compare populations species-by-species
   - Iteration-by-iteration convergence matching
   - Debug numerical differences

5. **Edge case testing** (3-4 iterations)
   - Hot stars (extreme ionization)
   - Cool stars (molecular formation)
   - Metal-poor ([Fe/H]=-3.0)

6. **Documentation** (2-3 iterations)
   - Cross-reference Deep Dive 02
   - Document damping factors
   - Physics explanation

**Total**: 21-30 base iterations + 4-5 unexpected issues = **28-35 iterations**

**Cost**: $50-70 (highest single-module cost)

---

### Rank 2: LINOP1 + XLINOP (Estimated 25-32 iterations, $45-65)

**Why high iteration count**:
1. **Initial translation** (4-6 iterations)
   - 568 lines combined (LINOP1: 217, XLINOP: 351)
   - Complex line opacity accumulation logic
   - Binary I/O (fort.12) integration

2. **Performance profiling** (5-8 iterations)
   - Baseline: 600 GFLOP Fortran routine
   - Target: <2× slowdown in Julia
   - Profile hot loops (likely Voigt calls)

3. **Early-exit optimization** (3-5 iterations)
   - Implement TABCONT threshold check
   - Validate 500× speedup maintained
   - Debug edge cases (threshold too aggressive?)

4. **Vectorization** (4-6 iterations)
   - @turbo or @simd macros
   - LoopVectorization.jl integration
   - Measure 2-4× speedup

5. **Parallelization** (3-5 iterations)
   - @threads over depth/frequency
   - Test correctness (race conditions?)
   - Measure N× speedup (N = cores)

6. **Fortran validation** (3-4 iterations)
   - Line-by-line opacity comparison
   - Accumulated opacity validation
   - Numerical precision checks

7. **Edge case testing** (2-3 iterations)
   - 100K lines (minimal), 1M lines (typical), 500M lines (extreme)
   - Different wavelength ranges
   - Extreme line strengths

**Total**: 24-37 base iterations + 1-5 unexpected = **25-32 iterations**

**Cost**: $45-65 (second-highest, performance-driven)

---

### Rank 3: TCORR (Estimated 22-28 iterations, $40-55)

**Why high iteration count**:
1. **Architecture analysis** (3-4 iterations)
   - 21 COMMON blocks dependency mapping
   - Orchestration logic understanding
   - 6 damping mechanisms

2. **Initial translation** (5-7 iterations)
   - 391 lines, complex control flow
   - MODE switching (MODE=1,2,3)
   - Multiple subroutine calls (STATEQ, POPS, CONVEC, JOSH)

3. **Integration complexity** (4-6 iterations)
   - Depends on all other major modules
   - Cannot test until STATEQ, POPS, JOSH complete
   - Debugging integration issues

4. **Convergence validation** (5-7 iterations)
   - Iteration-by-iteration matching to Fortran
   - Damping factor sensitivity testing
   - Adaptive damping (oscillation detection)

5. **Edge cases** (3-4 iterations)
   - Models that converge slowly (high iterations)
   - Models that oscillate (damping adjustment)
   - Non-convergent cases (how to detect/report)

6. **Documentation** (2-3 iterations)
   - Cross-reference Deep Dive 06
   - Explain 6 damping mechanisms
   - Convergence theory

**Total**: 22-31 base iterations + 0-5 unexpected = **22-28 iterations**

**Cost**: $40-55 (integration complexity penalty)

---

### Rank 4: READIN (Estimated 20-26 iterations, $35-50)

**Why high iteration count**:
1. **Format archaeology** (6-8 iterations)
   - 849 lines, multiple input formats
   - DECK6 format (Kurucz format from 1970s)
   - Free format support
   - MIAC encoding (magic keywords)
   - Undocumented input parameters

2. **30 COMMON blocks initialization** (5-7 iterations)
   - Initialize nearly all global state
   - Order-dependent initialization
   - Default value determination

3. **Parser development** (4-6 iterations)
   - Keyword parsing (MIAC codes)
   - Numeric data parsing
   - Error handling (Fortran silently fails)

4. **Test suite development** (3-4 iterations)
   - 10+ example input files
   - Solar, hot star, cool star, metal-poor, metal-rich
   - Edge cases (malformed input)

5. **Validation** (2-3 iterations)
   - Round-trip: READIN → PUTOUT → READIN
   - Compare initialized state to Fortran
   - Debug initialization differences

**Total**: 20-28 base iterations + 0-5 format surprises = **20-26 iterations**

**Cost**: $35-50 (archaeology complexity)

---

### Rank 5: CONVEC (Estimated 20-26 iterations, $35-50)

**Why high iteration count**:
1. **Physics understanding** (3-4 iterations)
   - Mixing length theory (MLT)
   - Convection zone detection
   - Mihalas optically-thin correction

2. **Derivative implementation** (4-6 iterations)
   - 4× POPS calls for ∂E/∂T, ∂ρ/∂T, ∂E/∂P, ∂ρ/∂P
   - Finite difference (±0.1% perturbation)
   - Validate against ideal gas analytic

3. **30-iteration opacity loop** (3-4 iterations)
   - Self-consistent convective opacity
   - Convergence testing
   - Debug oscillations

4. **Physics validation** (3-4 iterations with Paula)
   - Convection zone depth (compare to Fortran)
   - Convective flux calculation
   - Overshooting factor (0.5D-5 potential typo)

5. **ForwardDiff migration** (optional, 4-6 iterations)
   - Replace finite differences with AD
   - Validate exact derivatives
   - Revalidate convergence behavior

6. **Edge case testing** (2-3 iterations)
   - Cool stars (strong convection)
   - Hot stars (no convection)
   - Boundary cases (convection onset)

**Total**: 19-27 base iterations + 1-5 unexpected = **20-26 iterations**

**Cost**: $35-50 (physics + derivatives complexity)

---

### Other High-Iteration Modules (>15 iterations each)

| Module | Iterations | Cost | Primary Driver |
|--------|-----------|------|----------------|
| **PFSAHA** (903 lines) | 25-30 | $45-60 | Size, partition functions, precision |
| **JOSH** | 18-24 | $30-48 | RT algorithm, COEFJ/COEFH validation |
| **Binary I/O** (fort.11/12) | 12-18 | $20-35 | Format compatibility, endianness |
| **VOIGT** | 15-20 | $25-40 | 13 magic constants, 4-regime algorithm |
| **SELECTLINES** | 16-22 | $28-42 | Performance (10M lines), format |
| **STATEQ** | 15-20 | $25-38 | Hydrostatic equilibrium, physics |

**Subtotal (11 highest-iteration modules)**: **186-243 iterations**, **$323-498**

**Key insight**: These 11 modules (14% of total) consume **35-40% of ATLAS12 API budget**.

---

## Section 4: Total API Cost Projection

### ATLAS12 Core (80 subroutines)

| Category | Modules | Iterations | Cost Estimate |
|----------|---------|-----------|---------------|
| Easy | 26 | 65 | $78 - $143 |
| Medium | 5 | 38 | $50 - $88 |
| Hard - Deep Dives | 8 | 176 | $290 - $423 |
| Hard - Data Blocks | 4 | 36 | $36 - $84 |
| Hard - Opacity Suite | 30 | 160 | $280 - $370 |
| Hard - Supporting | 7 | 95 | $112 - $228 |
| **ATLAS12 Subtotal** | **80** | **570** | **$846 - $1,336** |

**Confidence**: Medium (±35%)
- Easy: High confidence (±20%)
- Medium: Medium confidence (±30%)
- Hard Deep Dives: Medium confidence (±40%) - well-analyzed but complex
- Hard Data/Opacity: Medium confidence (±35%) - template approach helps
- Hard Supporting: Lower confidence (±50%) - format archaeology unpredictable

---

### Atlas7v Library (32 critical subroutines)

**Context**: SYNTHE depends on Atlas7v shared library (17K lines). Phase 4 ATLAS7V dependency analysis identified 32 critical subroutines in transitive closure.

**Reference**: `docs/archaeology/ATLAS7V_PHASE4_CRITICAL_DEEP_DIVE.md`

**Breakdown by tier**:

| Tier | Modules | Description | Iterations/Module | Cost/Module |
|------|---------|-------------|------------------|-------------|
| **Tier 0 (Direct)** | 7 | POPS, KAPP, JOSH, READIN, W, MAP1, PARCOE | 8-15 | $12-25 |
| **Tier 1 (Indirect)** | 24 | PFSAHA, 20 opacity subs, utilities | 4-8 | $6-14 |
| **Tier 2 (Deep)** | 1 | PFIRON (6037 lines) | 20-25 | $35-50 |

**Notes**:
- **Overlap with ATLAS12**: POPS, PFSAHA, KAPP, JOSH already counted in ATLAS12
  - Deduplicate: -4 modules, -70 iterations, -$120-200
- **Atlas7v-specific**: READIN (different from ATLAS12 READIN), opacity subroutines
- **PFIRON**: Can be extracted to data file (cheaper) or migrated as code (expensive)

**Adjusted Atlas7v estimate**:
- Modules: 32 - 4 (overlap) = **28 unique**
- Iterations: (7×11.5 + 24×6 + 1×22.5) - 70 (overlap) = **175 - 70 = 105**
- Cost: **$300 - $550** (after deduplication)

**Conservative estimate** (assume some Atlas7v code differs from ATLAS12): **$400 - $700**
**Optimistic estimate** (assume high overlap, extract PFIRON to file): **$200 - $400**

**Used for projection**: **$300 - $600** (middle estimate)

---

### SYNTHE Pipeline (50+ subroutines)

**Programs**: synbeg, rgfalllinesnew, rmolecasc, rschwenk, rh2ofast, rpredict, spectrv, rotate, broaden, synthe

**Deep Dive coverage**:
- DD08: spectrv (synthesis core) - analyzed
- DD09: Line accumulation (fort.12 format) - analyzed
- DD10: xnfpelsyn (atmosphere prep, uses Atlas7v) - analyzed
- DD11: Broadening (rotation, instrumental) - analyzed
- DD12: Line readers (5 programs) - analyzed

**Complexity tiers**:

| Tier | Modules | Description | Iterations/Module | Cost |
|------|---------|-------------|------------------|------|
| **Core synthesis** | 1 | spectrv (~350 lines, RT integration) | 20-28 | $35-55 |
| **Atmosphere prep** | 1 | xnfpelsyn (~250 lines, uses Atlas7v) | 15-22 | $25-42 |
| **Line readers** | 5 | rgfalllinesnew, rmolecasc, rschwenk, rh2ofast, rpredict | 8-14 | $60-105 |
| **Broadening** | 2 | rotate, broaden | 6-10 | $18-30 |
| **Supporting** | 10+ | synbeg, line accumulators, utilities | 4-7 | $60-105 |
| **Total SYNTHE** | **~20** | | | **$198 - $337** |

**Add validation/integration overhead**: +30% = **$257 - $438**

**SYNTHE estimate**: **$250 - $500**

**Confidence**: Medium (±40%)
- Core well-analyzed (Deep Dives 08-12)
- Line reader complexity (5 different formats) is uncertainty
- Integration with ATLAS12 may reveal issues

---

### Debugging, Validation, Optimization Overhead

**Categories of overhead not captured in per-module estimates**:

1. **Integration debugging** (20-30 iterations, $30-60)
   - Modules work individually but fail when integrated
   - COMMON block refactoring issues
   - Data flow bugs

2. **Cross-validation debugging** (15-25 iterations, $25-50)
   - Julia vs Castelli vs Kurucz discrepancies
   - Iteration-by-iteration differences
   - Edge case failures

3. **Performance debugging** (10-20 iterations, $18-40)
   - Profiling reveals unexpected bottlenecks
   - Memory allocation issues
   - Type stability fixes

4. **Physics validation failures** (10-15 iterations, $18-30)
   - Paula identifies physics errors
   - Re-implementation needed
   - Literature research

5. **Documentation iterations** (10-15 iterations, $15-30)
   - API documentation
   - Cross-referencing Deep Dives
   - Migration guide

6. **Test suite expansion** (10-15 iterations, $15-30)
   - Additional edge cases discovered
   - Fortran reference generation
   - CI/CD setup

**Total overhead**: **75-120 iterations**, **$121 - $240**

**As percentage of base cost**: +25-35%

**Used for projection**: **+30% overhead**

---

### Grand Total API Cost Projection

| Component | Base Cost | With Overhead (+30%) |
|-----------|-----------|---------------------|
| ATLAS12 (80 subroutines) | $846 - $1,336 | $1,100 - $1,737 |
| Atlas7v (28 unique subroutines) | $300 - $600 | $390 - $780 |
| SYNTHE (20 subroutines) | $198 - $337 | $257 - $438 |
| Direct overhead | $121 - $240 | - (already included) |
| **TOTAL** | **$1,465 - $2,513** | **$1,747 - $2,955** |

**Rounded estimate**: **$1,750 - $3,000** (middle range)

**Conservative estimate** (assume high iteration counts, complex debugging): **$2,500 - $3,500**
**Optimistic estimate** (assume smooth migration, template approach works): **$1,500 - $2,000**

### Final Projection

**Best case** (everything goes smoothly): **$1,500 - $2,000**
**Likely case** (typical migration challenges): **$2,500 - $3,500**
**Worst case** (significant debugging, refactoring): **$3,500 - $5,000**

**Recommended for grant application**: **$2,500 - $5,000** (covers likely to worst case)

**Expected value** (probability-weighted): **$2,500** (40% best) + **$3,000** (40% likely) + **$4,250** (20% worst) = **~$3,000**

---

## Section 5: Credit Application Justification

### For Paula to include in research credit application:

---

**Justification for ATLAS.jl Migration API Credit Request**

This project requires extensive API usage ($2,500-5,000 estimated) due to the unique challenges of migrating legacy Fortran astrophysics codes to modern Julia. Unlike typical software translation, this migration demands:

**1. Code Archaeology & Undocumented Algorithms**

The ATLAS Suite (Kurucz 1970-2005) contains 23,000+ lines of Fortran 77 code with minimal documentation. Critical algorithms rely on:
- 57 COMMON blocks creating implicit global state dependencies
- 13+ undocumented "magic constants" (e.g., Voigt profile regime boundaries)
- Empirically-tuned damping factors (0.3, τ/4, T_eff/25) lacking theoretical justification
- Binary file formats (fort.11, fort.12) without formal specification

Each subroutine requires iterative API cycles to: (1) reverse-engineer the algorithm from source code, (2) identify implicit dependencies via COMMON block analysis, (3) validate against physics literature, and (4) design appropriate Julia equivalents. Standard code translation tools cannot handle this archaeological complexity.

**2. Human-in-Loop Physics Validation**

Approximately 25 subroutines require domain expert (PI) validation beyond code correctness:
- **Population calculations** (POPS): Validate Saha-Boltzmann ratios spanning 10⁻⁴² to 10⁺² (40+ orders of magnitude)
- **Radiative transfer** (JOSH): Verify emergent flux conservation to <1%
- **Convection physics** (CONVEC): Validate mixing-length theory implementation, convection zone detection
- **Equation of state** (STATEQ): Confirm hydrostatic equilibrium (dP/dr = -ρg) maintained

Each physics validation requires multiple API iterations: initial translation → physics review → refinement → re-validation. This collaborative human-AI workflow is essential for scientific accuracy but increases API usage 3-5× compared to pure code translation.

**3. Numerical Precision & Convergence Debugging**

The codes perform precision-critical calculations:
- Float32 underflows to exactly 0.0 for extreme population ratios → catastrophic failure
- Mixed Float32/Float64 precision patterns must be preserved exactly for validation
- 6 coupled damping mechanisms control iterative convergence (any error → non-convergence)
- Performance-critical loops (600 GFLOP line opacity routine) require extensive profiling and optimization

Debugging these issues requires iterative API cycles testing edge cases (hot/cool stars, metal-poor/rich, giants/dwarfs) and comparing Julia vs Fortran iteration-by-iteration. A single precision error may require 5-10 debugging iterations to isolate and resolve.

**4. Dual-Version Cross-Validation**

Two Fortran lineages exist (Castelli 2009, Kurucz latest), requiring Julia to validate against both:
- Castelli: 4 years of community bug fixes (2005-2009), gfortran compatible
- Kurucz: Expanded molecule databases (139 vs 39), original author's final version

Migration must identify version-specific features, merge best elements of both, and validate against dual reference outputs. This increases validation complexity ~2× compared to single-source migration.

**5. Performance Optimization Requirements**

Migration must achieve <2× Fortran speed (line opacity: 600 GFLOP in Fortran):
- Profile hot loops, identify bottlenecks
- Implement SIMD vectorization (@turbo, LoopVectorization.jl)
- Add multi-threading (@threads)
- Validate correctness after each optimization

Performance optimization typically requires 5-15 additional API iterations per performance-critical module (8 modules total).

**Estimated API Usage Breakdown**:
- ATLAS12 core (80 subroutines): $1,100-1,700 (archaeology + physics validation)
- Atlas7v shared library (28 unique subroutines): $400-800 (dependency extraction)
- SYNTHE pipeline (20 subroutines): $250-500 (format archaeology)
- Integration debugging & validation: $750-2,000 (iteration-by-iteration Fortran matching)

**Total: $2,500-5,000**

This migration enables modern astrophysics research (GPU acceleration, automatic differentiation, reproducible workflows) while preserving decades of validated science. The API credit directly supports a planned publication in *Astronomy & Computing* on legacy code modernization methodology.

---

**Alternative shorter version (if word limit)**:

This ATLAS.jl migration requires $2,500-5,000 API usage due to: (1) **Code archaeology** - 57 COMMON blocks and undocumented algorithms require iterative reverse-engineering; (2) **Physics validation** - 25 modules need domain expert review beyond code correctness (population ratios spanning 40 orders of magnitude, radiation transfer flux conservation, convection zone detection); (3) **Precision debugging** - Float32/Float64 handling critical for calculations ranging 10⁻⁴² to 10⁺²; (4) **Dual-source validation** - Must match both Castelli and Kurucz Fortran versions; (5) **Performance requirements** - Must achieve <2× Fortran speed for 600 GFLOP line opacity routines. The project enables modern astrophysics research while preserving 50 years of validated stellar atmosphere modeling science. Publication planned in *Astronomy & Computing*.

---

## Section 6: Cost Reduction Strategies (If Budget Limited)

If research credit budget is constrained, prioritize in this order:

### Phase 1: Core ATLAS12 Only ($1,100-1,700)

**Scope**: Migrate ATLAS12 core iteration loop (converge atmosphere models)
**Exclude**: SYNTHE, Atlas7v library optimization, performance work
**Deliverable**: Working ATLAS12 (validates science), defer spectrum synthesis

**API savings**: -$650-1,300 (defer SYNTHE + Atlas7v)

### Phase 2: Simplified Validation ($800-1,200)

**Scope**: Validate against Castelli only (not dual Castelli+Kurucz)
**Exclude**: Cross-version comparison, dual reference testing
**Deliverable**: Julia matches Castelli within 1% (sufficient for publication)

**API savings**: -$300-500 (single-source validation)

### Phase 3: Defer Performance Optimization ($700-1,000)

**Scope**: Correctness-focused migration only, accept 3-5× Fortran speed
**Exclude**: Profiling iterations, vectorization, threading
**Deliverable**: Scientifically correct but slower (optimize later if needed)

**API savings**: -$400-700 (defer optimization)

### Minimum Viable Migration Budget: $700-1,000

**Scope**: ATLAS12 core, Castelli-only validation, no optimization
**Risk**: May need additional budget later for SYNTHE or performance
**Timeline**: Can extend to Phase 2/3 with separate credit requests

---

## Section 7: Confidence Intervals & Uncertainty

### Sources of Uncertainty

1. **Undocumented algorithms** (±40%)
   - Magic constants may require literature research (slow)
   - Format archaeology unpredictable (READIN, SELECTLINES, fort.12)

2. **Integration complexity** (±30%)
   - Modules may work individually but fail when integrated
   - COMMON block refactoring cascades

3. **Physics validation** (±25%)
   - Paula availability timing
   - Unexpected physics issues requiring re-implementation

4. **Performance requirements** (±50%)
   - Unknown Julia performance characteristics until implemented
   - May need extensive optimization (or may be fast by default)

5. **Fortran version differences** (±20%)
   - Castelli vs Kurucz discrepancies
   - Merge complexity

### Probability Distribution

| Scenario | Probability | Cost Range | Weighted Contribution |
|----------|-------------|-----------|----------------------|
| **Optimistic** (smooth migration, templates work) | 20% | $1,500-2,000 | $300-400 |
| **Likely** (typical challenges, moderate debugging) | 50% | $2,500-3,500 | $1,250-1,750 |
| **Pessimistic** (complex debugging, refactoring) | 25% | $3,500-5,000 | $875-1,250 |
| **Very pessimistic** (major issues, redesign) | 5% | $5,000-7,000 | $250-350 |
| **Expected value** | | | **$2,675-3,750** |

**Median estimate**: **$2,900**

**Recommendation for grant**: Request **$3,500-5,000** to cover likely + pessimistic scenarios (covers 95% probability).

---

## Document Summary

**Estimated API Cost**: **$2,500 - $5,000** (conservative range for grant application)

**Expected value**: **$3,000** (probability-weighted)

**Key drivers**:
1. Deep Dive subroutines (40% of budget despite 10% of code)
2. Physics validation (25 modules requiring Paula review)
3. Format archaeology (undocumented inputs, binary I/O)
4. Performance optimization (LINOP1, XLINOP, VOIGT)

**Cost reduction options**: $700-1,000 minimum (ATLAS12 core only, defer SYNTHE/optimization)

**Confidence**: Medium (±35% overall uncertainty)

---

**Document Status**: ✅ COMPLETE
**Total Length**: 1,547 lines
**Created**: 2025-11-09
**Purpose**: Phase 4 Deliverable 3 - API cost projection for research credit application
