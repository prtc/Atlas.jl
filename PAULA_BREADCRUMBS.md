# Paula's Breadcrumbs: Questions from Claude Code Web

This file maps all questions Claude Code Web left for you throughout the archaeology documentation. Use this as your navigation guide.

**Total questions**: 21 across 5 files

---

## Quick Navigation by Topic

### Stellar Physics Questions (PHYSICS_PIPELINE_SYNTHE.md)
- [Q1: Line list completeness](#1-line-list-completeness-physics_pipeline_synththemd)
- [Q2: NLTE effects](#2-nlte-effects-physics_pipeline_synththemd)
- [Q3: Limb darkening coefficients](#3-limb-darkening-coefficients-physics_pipeline_synththemd)
- [Q4: Molecular databases](#4-molecular-databases-physics_pipeline_synththemd)
- [Q5: Validation strategy](#5-validation-strategy-physics_pipeline_synththemd)
- [Q6: Parameter sensitivity](#6-parameter-sensitivity-physics_pipeline_synththemd)
- [Q7: Cross-code comparison](#7-cross-code-comparison-physics_pipeline_synththemd)
- [Q8: Migration priority](#8-migration-priority-physics_pipeline_synththemd)

### ATLAS12 Physics Questions (PHYSICS_PIPELINE_ATLAS12.md)
- [Q1: Iteration damping](#1-iteration-damping-physics_pipeline_atlas12md)
- [Q2: Continuum sources necessity](#2-continuum-sources-necessity-physics_pipeline_atlas12md)
- [Q3: TABCONT threshold tuning](#3-tabcont-threshold-tuning-physics_pipeline_atlas12md)

### Migration Strategy (WORKFLOW_ANALYSIS.md - Already Responded)
- [Q1: NLTE vs LTE](#1-nlte-vs-lte-workflow_analysismd)
- [Q2: ATLAS9 migration priority](#2-atlas9-migration-priority-workflow_analysismd)
- [Q3: Atmosphere model formats](#3-atmosphere-model-formats-workflow_analysismd)
- [Q4: SYNTHE pipeline simplification](#4-synthe-pipeline-simplification-workflow_analysismd)
- [Q5: Line list updates](#5-line-list-updates-workflow_analysismd)
- [Q6: Molecular line lists](#6-molecular-line-lists-workflow_analysismd)
- [Q7: Plotting codes](#7-plotting-codes-workflow_analysismd)
- [Q8: Convective models](#8-convective-models-workflow_analysismd)

### Implementation Details
- [Q1: COEFJ/COEFH computation (MIGRATION_ASSESSMENT.md)](#q1-coefj-coefh-computation-migration_assessmentmd)
- [Q1: Continuum opacity interdependencies (ARCHITECTURE_INSIGHTS.md)](#q1-continuum-opacity-interdependencies-architecture_insightsmd)

---

## Questions Already Answered by Paula

### 1. NLTE vs LTE (WORKFLOW_ANALYSIS.md)
**File**: `docs/archaeology/WORKFLOW_ANALYSIS.md:909-920`

**Question**: Is NLTE functionality in current ATLAS12 unused/optional? Should Julia migration completely omit NLTE code paths, or just defer their implementation?

**Paula's Response**: "Good point. I will need to revise and get back to you later."

**Status**: ⏳ Pending detailed response

---

### 2. ATLAS9 Migration Priority (WORKFLOW_ANALYSIS.md)
**File**: `docs/archaeology/WORKFLOW_ANALYSIS.md:921-928`

**Question**: Should ATLAS9 + DFSYNTHE be migrated at all? Or is ATLAS12 alone sufficient for your research needs?

**Paula's Response**: "For my own needs ATLAS12 is sufficient, but other users might benefit from ATLAS9. So I would say it is useful to migrate both if possible."

**Status**: ✅ Answered

---

### 3. Atmosphere Model Formats (WORKFLOW_ANALYSIS.md)
**File**: `docs/archaeology/WORKFLOW_ANALYSIS.md:930-940`

**Question**: In Julia migration, should we keep separate formats, create unified format, or auto-convert on-the-fly?

**Paula's Response**: "The format is actually the same, just named differently (I don't know why). No conversion needed."

**Status**: ✅ Answered

---

### 4. SYNTHE Pipeline Simplification (WORKFLOW_ANALYSIS.md)
**File**: `docs/archaeology/WORKFLOW_ANALYSIS.md:942-952`

**Question**: What's your preference for SYNTHE architecture? Maintain modularity or consolidate for simplicity?

**Paula's Response**: "Consolidate for simplicity."

**Status**: ✅ Answered

---

### 5. Line List Updates (WORKFLOW_ANALYSIS.md)
**File**: `docs/archaeology/WORKFLOW_ANALYSIS.md:954-965`

**Question**: Which line list versions should Julia code support? Are formats stable? Should we support multiple formats?

**Paula's Response**: "I remember having problems with different code versions expecting slightly different formats. For our migration we should define our preferred format of the line list and stick to it, offering utilities to convert Kurucz/Castelli line lists. Important: atomic line list and molecular line list have different formats."

**Status**: ✅ Answered

---

### 6. Molecular Line Lists (WORKFLOW_ANALYSIS.md)
**File**: `docs/archaeology/WORKFLOW_ANALYSIS.md:966-973`

**Question**: Which molecules are essential for your research? Can we prioritize subset for initial migration?

**Paula's Response**: "Good question. With the exception of TiO and H₂O, the other molecules share the same format so let's start with those. In practice it will limit the T_eff to larger than about 4250K."

**Status**: ✅ Answered

---

### 7. Plotting Codes (WORKFLOW_ANALYSIS.md)
**File**: `docs/archaeology/WORKFLOW_ANALYSIS.md:975-982`

**Question**: Are plotting codes critical, or can modern plotting libraries replace them?

**Paula's Response**: "They can be replaced with modern plotting libraries."

**Status**: ✅ Answered

---

### 8. Convective Models (WORKFLOW_ANALYSIS.md)
**File**: `docs/archaeology/WORKFLOW_ANALYSIS.md:984-990`

**Question**: Do you use different convection models, or is MLT with α=1.25 standard?

**Paula's Response**: "I usually use MLT with α=1.25 but it is better if we allow flexibility to change it."

**Status**: ✅ Answered

---

## Questions Awaiting Your Response

### PHYSICS_PIPELINE_SYNTHE.md

#### 1. Line list completeness (PHYSICS_PIPELINE_SYNTHE.md)
**File**: `docs/archaeology/PHYSICS_PIPELINE_SYNTHE.md:1561-1562`

**Question**: Are there known gaps in Kurucz line lists for specific wavelength ranges or elements?

**Context**: SYNTHE uses Kurucz line lists as primary data source. Completeness affects synthesis accuracy.

**Status**: ⏳ Awaiting response

---

#### 2. NLTE effects (PHYSICS_PIPELINE_SYNTHE.md)
**File**: `docs/archaeology/PHYSICS_PIPELINE_SYNTHE.md:1563-1564`

**Question**: For which lines/stellar types does LTE assumption fail significantly in SYNTHE?

**Context**: SYNTHE is purely LTE. Understanding when this assumption breaks down helps define scope.

**Status**: ⏳ Awaiting response

---

#### 3. Limb darkening coefficients (PHYSICS_PIPELINE_SYNTHE.md)
**File**: `docs/archaeology/PHYSICS_PIPELINE_SYNTHE.md:1565-1566`

**Question**: Where do wavelength-dependent u₁, u₂ values come from? Original Kurucz source?

**Context**: SYNTHE uses limb darkening coefficients. Need to understand their origin and update frequency.

**Status**: ⏳ Awaiting response

---

#### 4. Fast mode usage (PHYSICS_PIPELINE_SYNTHE.md)
**File**: `docs/archaeology/PHYSICS_PIPELINE_SYNTHE.md:1567-1568`

**Question**: How often is fort.9 (pre-computed opacities) used in practice? Worth prioritizing in Julia migration?

**Context**: fort.9 represents cached opacities. Understanding usage frequency affects migration priority.

**Status**: ⏳ Awaiting response

---

#### 5. Molecular databases (PHYSICS_PIPELINE_SYNTHE.md)
**File**: `docs/archaeology/PHYSICS_PIPELINE_SYNTHE.md:1569-1570`

**Question**: Which molecular species are most critical? TiO, H₂O, CN, CO - any others?

**Context**: SYNTHE handles ~15 molecular species. Need to prioritize for initial implementation.

**Status**: ⏳ Awaiting response (partially addressed in WORKFLOW_ANALYSIS.md)

---

#### 6. Validation strategy (PHYSICS_PIPELINE_SYNTHE.md)
**File**: `docs/archaeology/PHYSICS_PIPELINE_SYNTHE.md:1571-1572`

**Question**: What observed spectra should be the primary validation targets (solar, Arcturus, Vega)?

**Context**: Validation against known spectra is critical. Need guidance on reference targets.

**Status**: ⏳ Awaiting response

---

#### 7. ATLAS7V library (PHYSICS_PIPELINE_SYNTHE.md)
**File**: `docs/archaeology/PHYSICS_PIPELINE_SYNTHE.md:1573-1574`

**Question**: What exactly is shared between ATLAS12 and SYNTHE? Tracing full dependencies would help migration planning.

**Context**: ATLAS7V contains shared utilities. Understanding coupling affects architecture design.

**Status**: ⏳ Awaiting response

---

#### 8. Parameter sensitivity (PHYSICS_PIPELINE_SYNTHE.md)
**File**: `docs/archaeology/PHYSICS_PIPELINE_SYNTHE.md:1575-1576`

**Question**: Which parameters have biggest impact on synthetic spectra? (T_eff, log g, abundances, ξ, v sin i, R)

**Context**: Understanding parameter sensitivity guides testing and optimization priorities.

**Status**: ⏳ Awaiting response

---

#### 9. Cross-code comparison (PHYSICS_PIPELINE_SYNTHE.md)
**File**: `docs/archaeology/PHYSICS_PIPELINE_SYNTHE.md:1577-1578`

**Question**: Have you compared SYNTHE vs SPECTRUM or Turbospectrum systematically? Known systematic differences?

**Context**: Comparison with other synthesis codes provides validation baseline and identifies potential issues.

**Status**: ⏳ Awaiting response

---

#### 10. Migration priority (PHYSICS_PIPELINE_SYNTHE.md)
**File**: `docs/archaeology/PHYSICS_PIPELINE_SYNTHE.md:1579`

**Question**: Is full SYNTHE pipeline needed, or would standalone spectrv (assuming fort.10, fort.12 exist) be sufficient initially?

**Context**: Scope definition - full pipeline vs minimal subset affects implementation timeline.

**Status**: ⏳ Awaiting response

---

### PHYSICS_PIPELINE_ATLAS12.md

#### 1. Iteration damping (PHYSICS_PIPELINE_ATLAS12.md)
**File**: `docs/archaeology/PHYSICS_PIPELINE_ATLAS12.md:181-183`

**Section**: Step 1: Population Calculations

**Questions**:
- Why 0.3 damping specifically? Empirically tuned or theoretically motivated?
- Can we expose damping factor as parameter in Julia?

**Context**: Non-convergence oscillations in n_e iteration are damped with factor 0.3.

**Status**: ⏳ Awaiting response

---

#### 2. Continuum sources necessity (PHYSICS_PIPELINE_ATLAS12.md)
**File**: `docs/archaeology/PHYSICS_PIPELINE_ATLAS12.md:267-269`

**Section**: Step 2: Continuum Opacity Calculations

**Questions**:
- Are all continuum sources in Castelli version scientifically necessary? Or can some be omitted for stars in specific T_eff ranges?
- How often are metal opacities updated with new atomic data?

**Context**: ATLAS12 includes many continuum sources. Understanding which are essential guides implementation scope.

**Status**: ⏳ Awaiting response

---

#### 3. TABCONT threshold tuning (PHYSICS_PIPELINE_ATLAS12.md)
**File**: `docs/archaeology/PHYSICS_PIPELINE_ATLAS12.md:364-366`

**Section**: Step 3: Line Opacity Calculations

**Questions**:
- How is TABCONT threshold tuned? Trade-off between accuracy and performance?
- Can lines be grouped/binned for faster calculation (at cost of some accuracy)?

**Context**: TABCONT controls line opacity table generation. Understanding tuning helps optimization.

**Status**: ⏳ Awaiting response

---

### MIGRATION_ASSESSMENT.md

#### Q1: COEFJ/COEFH computation (MIGRATION_ASSESSMENT.md)
**File**: `docs/archaeology/MIGRATION_ASSESSMENT.md:2526`

**Section**: Risk 6: JOSH Radiative Transfer (Rank #6) → Validation Action #3

**Question for Paula**: How were COEFJ/COEFH originally computed? Can we regenerate?

**Context**: JOSH uses pre-computed radiative transfer coefficients. Need to understand their generation for Julia migration.

**Status**: ⏳ Awaiting response

**Priority**: 🟡 High (timing: during JOSH migration)

---

### ARCHITECTURE_INSIGHTS.md

#### Q1: Continuum opacity interdependencies (ARCHITECTURE_INSIGHTS.md)
**File**: `docs/archaeology/ARCHITECTURE_INSIGHTS.md:489`

**Section**: 2.2 Opacity Calculation Pattern

**Question for Paula**: Are there interdependencies between continuum sources? Or are they truly independent and summable?

**Context**: Understanding source coupling affects opacity calculation architecture in Julia.

**Status**: ⏳ Awaiting response

---

## Notes for Navigation

- **Already Responded**: Questions in WORKFLOW_ANALYSIS.md have your answers recorded
- **Physics Questions**: PHYSICS_PIPELINE_*.md files contain questions about stellar physics and algorithms
- **Implementation Questions**: MIGRATION_ASSESSMENT.md and ARCHITECTURE_INSIGHTS.md contain questions about specific technical implementations
- **High Priority**: The SYNTHE physics questions (particularly Q6, Q8, Q10) directly affect architecture decisions

---

**Last updated**: November 10, 2025
**Total questions awaiting response**: 13 of 21

Good luck! 🧭
