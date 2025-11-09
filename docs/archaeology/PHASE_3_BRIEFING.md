# Phase 3 Briefing: Physics Pipeline Documentation

**STATUS**: ✅ COMPLETE (2025-11-09)
**Deliverable**: `PHYSICS_PIPELINE_ATLAS12.md` (1,548 lines) - comprehensive physics documentation

---

**Target Audience**: Fresh Claude instance starting Phase 3
**Prerequisites**: Phase 1 (Census) and Phase 2 (Architecture) complete
**Time Budget**: Days 6-9 of 14-day mission (approximately 3-4 days)
**Primary Deliverable**: `PHYSICS_PIPELINE_ATLAS12.md` - comprehensive physics-level documentation

---

## I. Mission Context

You are continuing the **ATLAS Suite Code Archaeology Mission** - documenting legacy Fortran stellar atmosphere codes for future Julia migration.

### Project Background
- **Target codes**: ATLAS12 (stellar atmosphere model) and SYNTHE (spectrum synthesis)
- **Source**: Fortran 77 codes from Robert Kurucz (deceased 2025) and Fiorella Castelli
- **Goal**: Create documentation to guide Julia migration, support research credit application, enable A&C publication
- **User**: Paula (astrophysicist, domain expert)
- **Timeline**: 14 days, $250 Claude Code Web credits (expires Nov 18, 2025)

### What Has Been Accomplished

**Phase 1 (Days 1-2)**: ✅ Complete
- Cataloged 231 Fortran files, 487K lines of code
- Created dependency maps and census reports
- Identified ATLAS12 (23K lines) and SYNTHE (20K lines) as primary targets

**Phase 2 (Days 3-6)**: ✅ Complete
- **Phase 2A**: Workflow analysis, version comparison, runtime architecture
- **Phase 2B**: Detailed architecture documentation + 7 computational kernel deep dives
  - 5 major architecture documents (~10K lines)
  - 7 deep dives on highest-risk ATLAS12 kernels (6,459 lines)
  - **Key methodology discovery**: "Here be dragons" 🐉 - breadth over depth, document clarity, flag uncertainty, move forward

**Key Documents Available to You**:
1. `docs/archaeology/CENSUS_REPORT.md` - Complete codebase inventory
2. `docs/archaeology/WORKFLOW_ANALYSIS.md` - How to run the codes
3. `docs/archaeology/ARCHITECTURE_DETAILS.md` - Code structure (subroutines, COMMON blocks, data flow)
4. `docs/archaeology/ARCHITECTURE_INSIGHTS.md` - Migration guidance (2,769 lines, cross-referenced with deep dives)
5. `docs/archaeology/DEEP_DIVES/00_INDEX.md` - Overview of 7 computational kernel analyses
6. `docs/archaeology/METHODOLOGY_NOTES.md` - "Here be dragons" approach

---

## II. Phase 3 Objective: WHAT vs HOW

### The Problem Phase 3 Solves

**Phase 1-2 answered**:
- WHAT files exist? (Census)
- HOW is the code structured? (Architecture)
- HOW does it execute? (Workflow)
- WHAT are the highest-risk sections? (Deep dives)

**Phase 3 must answer**:
- WHAT physics is being computed?
- WHY are these algorithms chosen?
- WHAT are the physical constraints?
- WHAT numerical methods implement the physics?
- WHERE could the physics go wrong?

### Why This Matters for Migration

A future Julia developer needs to know:
- **Not**: "Line 1234 calls subroutine POPS which updates COMMON block /XNF/"
- **But**: "At this point we're computing atomic level populations using the Saha-Boltzmann equation in LTE. This requires Float64 precision because ionization energies create exponentials spanning 40+ orders of magnitude. The physics constraint is number density conservation: Σ n_i = n_total."

### Focus: ATLAS12 Iteration Pipeline

Phase 3 should document **one complete ATLAS12 iteration** from a physics perspective:

```
Initial atmosphere (T, P, abundances)
    ↓
[Population calculations] ← What physics? What equations?
    ↓
[Opacity calculations] ← What physical processes? Which transitions?
    ↓
[Radiative transfer] ← What geometry? What boundary conditions?
    ↓
[Temperature correction] ← What energy balance? What convergence criteria?
    ↓
Updated atmosphere → check convergence → iterate
```

At each step, document:
1. **Physical input**: What do we know? (T, P, abundances, radiation field)
2. **Physical process**: What's happening? (photoionization, line absorption, energy transport)
3. **Governing equations**: What physics? (Saha equation, Voigt profile, radiative transfer equation)
4. **Numerical method**: How is it solved? (Newton-Raphson, Feautrier, SOR iteration)
5. **Output**: What do we get? (populations, opacities, mean intensities, temperature correction)
6. **Constraints**: What must be conserved? (particle number, energy, momentum)
7. **Failure modes**: What can go wrong? (underflow, non-convergence, unphysical values)

---

## III. Phase 3 Deliverables

### Primary Deliverable: `PHYSICS_PIPELINE.md`

**Target length**: 1,500-2,500 lines

**Structure** (suggested):

```markdown
# ATLAS12 Physics Pipeline

## I. Overview
- One-paragraph summary of what ATLAS12 computes
- Physical regime (stellar photospheres, LTE, plane-parallel)
- Key assumptions (hydrostatic equilibrium, radiative equilibrium, LTE populations)

## II. Input State
- Stellar parameters (Teff, log g, abundances)
- Initial atmosphere structure (T(τ), P(τ), ρ(τ))
- Atomic/molecular data (line lists, partition functions, ionization energies)

## III. Iteration Pipeline

### Step 1: Population Calculations
- **Physics**: Local thermodynamic equilibrium (LTE)
- **Equations**: Saha-Boltzmann statistics
- **Method**: Direct calculation (not iterative)
- **Input**: T, P, electron density, partition functions
- **Output**: Number densities n_i,j (species i, ionization stage j)
- **Constraints**: Σ n_i,j = n_element (number conservation)
- **Precision**: Float64 required (40+ order magnitude range)
- **Fortran**: POPS, POPSALL subroutines
- **Deep Dive**: See 02_POPULATIONS.md

### Step 2: Opacity Calculations
[Similar structure for each major step]

### Step 3: Radiative Transfer
[...]

### Step 4: Temperature Correction
[...]

### Step 5: Convection (if needed)
[...]

### Step 6: Convergence Check
[...]

## IV. Physical Constraints & Conservation Laws
- Energy conservation: ∫ F_ν dν = σ T_eff^4
- Particle number conservation
- Hydrostatic equilibrium: dP/dτ = g/κ
- Radiative equilibrium: ∫ (J_ν - S_ν) κ_ν dν = 0

## V. Numerical Methods Summary
- Which solver for which equation
- Stability requirements
- Convergence criteria
- Typical iteration counts

## VI. Failure Modes & Physics Checks
- Non-convergence scenarios (oscillation, divergence)
- Unphysical outputs (negative densities, inverted temperature)
- Precision failures (underflow, overflow)
- When LTE assumption breaks down

## VII. Comparison: ATLAS12 vs ATLAS9
- What physics changed between versions
- Why ATLAS12 is more accurate

## VIII. Migration Considerations
- Which physics must be preserved exactly
- Where optimizations are safe
- What tests validate physics correctness
```

### Secondary Deliverables

1. **Physics glossary**: Brief definitions of key terms (LTE, Rosseland mean, partition function, etc.)
2. **Equation reference**: Key equations with variable definitions
3. **Units and constants**: What units does Fortran use? CGS? SI? Mixed?
4. **Physical parameters**: Typical ranges (T: 3000-50,000 K, log g: 0-5, etc.)

---

## IV. Methodology: "Here Be Dragons" 🐉 Applied to Physics

### The Proven Approach (from Phase 2B)

**Core principle**: Document what's clear, flag what's uncertain, move forward.

**Applied to physics documentation**:

✅ **Do**:
- Document physical processes you can identify from code + comments
- Link to standard references (Mihalas, Gray, etc.) when algorithms match known methods
- Flag where code behavior doesn't match expected physics
- Note when physical interpretation is uncertain
- Use Deep Dive findings (7 kernels already analyzed)

❌ **Don't**:
- Try to derive physics from first principles
- Speculate about why Kurucz chose specific methods
- Get stuck on unclear sections (mark as "unclear, requires domain expert")
- Attempt to validate numerical results (that's Phase 5)

### Where to Get Physics Information

**Primary sources** (in priority order):

1. **Code comments**: Fortran codes have some physics comments
   ```fortran
   C SAHA-BOLTZMANN EQUATION FOR ATOMIC POPULATIONS
   C ASSUMING LTE
   ```

2. **Deep Dive documents**: Already analyzed computational kernels
   - Deep Dive 02: Population calculations (Saha-Boltzmann)
   - Deep Dive 05: Radiative transfer (Feautrier-like method)
   - Deep Dive 07: Convection (mixing length theory)

3. **ARCHITECTURE_INSIGHTS.md**: Section III (Data Flow Analysis) shows physics pipeline

4. **Variable names**: Fortran variables often indicate physics
   - `XNE` = electron number density
   - `T` = temperature
   - `TAUROS` = Rosseland optical depth
   - `JNU`, `HNU` = radiation field moments

5. **Paula's expertise**: Flag questions requiring astrophysics knowledge
   - When in doubt, mark: "**Question for Paula**: Is this implementing [physical process]?"

6. **Standard textbooks**: If code matches standard algorithms
   - Mihalas (1978): Stellar Atmospheres
   - Gray (2005): The Observation and Analysis of Stellar Photospheres
   - Hubeny & Mihalas (2014): Theory of Stellar Atmospheres

### Depth vs Breadth Balance

**Target**: Physics overview, not textbook derivations

**Example - Good level of detail**:
```markdown
### Voigt Profile
**Physics**: Natural line profile convolved with thermal Doppler broadening
**Equation**: V(a,u) = (a/π) ∫ exp(-y²) / [(u-y)² + a²] dy
**Parameters**:
- a = γ / (4π Δν_D) = damping parameter
- u = (ν - ν_0) / Δν_D = frequency in Doppler widths
**Method**: 4-regime piecewise approximation (see Deep Dive 01)
**Precision**: Float32 adequate (~2% target accuracy)
**Why it matters**: Line profile shape determines opacity, affects energy transport
```

**Example - Too much detail** (avoid):
```markdown
### Voigt Profile Derivation
Starting from the quantum mechanical radiative damping formula:
γ = (e² f λ²) / (4π ε₀ m_e c)
where e is elementary charge, f is oscillator strength...
[5 pages of derivation]
```

**Example - Too little detail** (insufficient):
```markdown
### Voigt Profile
Code computes line profiles. See VKOH16 subroutine.
```

---

## V. Detailed Task Breakdown

### Task 3.1: Trace Computational Flow

**Goal**: Follow one ATLAS12 iteration step-by-step

**Method**:
1. Start with ATLAS12 main program iteration loop (atlas12.for, lines ~400-600)
2. Identify major subroutine calls in order
3. For each subroutine: what's the INPUT, PROCESS, OUTPUT?
4. Build a flow diagram (text/markdown is fine)

**Output**: Section III of PHYSICS_PIPELINE.md

**Time estimate**: 2-3 hours

**Files to read**:
- `upstream/castelli/source_codes/atlas12/atlas12.for` (main iteration loop)
- `docs/archaeology/ARCHITECTURE_DETAILS.md` Section I (ATLAS12 structure)
- `docs/archaeology/DEEP_DIVES/00_INDEX.md` (quick reference to which subroutines analyzed)

---

### Task 3.2: Document Physics at Each Step

**Goal**: For each major step in the iteration, explain the physics

**Method**:
1. Use Deep Dive documents to understand what computational kernels do
2. Connect code to physics textbook concepts
3. Identify governing equations (Saha, Voigt, RT equation, etc.)
4. Note physical assumptions (LTE, plane-parallel, etc.)

**Output**: Section III subsections in PHYSICS_PIPELINE.md

**Time estimate**: 3-4 hours

**Key physics processes to document**:
- **Populations** (POPS, POPSALL): LTE, Saha-Boltzmann equation
  - See Deep Dive 02 for details
  - Equation: n_i,j+1 / n_i,j = (2 Z_i,j+1 / Z_i,j) × (2π m_e k T / h²)^(3/2) × exp(-χ_i,j / kT) / n_e

- **Continuum opacity** (KAPCONT): Bound-free, free-free, scattering
  - H⁻ opacity typically dominates in solar-type stars
  - Thomson scattering for hot stars

- **Line opacity** (XLINOP): Voigt profile, partition function correction
  - See Deep Dive 03 for line opacity accumulation
  - See Deep Dive 01 for Voigt profile physics

- **Radiative transfer** (JOSH): Solve for radiation field
  - See Deep Dive 05 for RT method
  - Equation: μ dI/dτ = I - S (source function)

- **Temperature correction** (TCORR): Enforce radiative equilibrium
  - See Deep Dive 06 for damping mechanisms
  - Constraint: absorbed energy = emitted energy at each depth

- **Convection** (CONVEC): Mixing length theory
  - See Deep Dive 07 for MLT implementation
  - Occurs when radiative gradient exceeds adiabatic gradient

---

### Task 3.3: Identify Numerical Methods

**Goal**: What mathematical algorithms solve the physics equations?

**Method**:
1. For each governing equation, identify solution method
2. Note discretization (grid points, frequency sampling)
3. Document iteration/convergence methods

**Output**: Section V of PHYSICS_PIPELINE.md

**Time estimate**: 1-2 hours

**Examples to document**:
- **Saha-Boltzmann**: Direct calculation (analytical, no iteration)
- **Voigt profile**: 4-regime piecewise approximation (Deep Dive 01)
- **Radiative transfer**: Feautrier-like method with pretabulated weights (Deep Dive 05)
- **Temperature correction**: Damped Newton-Raphson with 6 damping mechanisms (Deep Dive 06)
- **Convective opacity**: 30-iteration SOR with ω=0.7 (Deep Dive 07)

---

### Task 3.4: Flag Unusual or Legacy-Specific Algorithms

**Goal**: Identify non-standard methods that need special attention

**Method**:
1. Compare code algorithms to standard textbook methods
2. Note where Kurucz/Castelli diverge from published algorithms
3. Flag magic numbers and undocumented choices

**Output**: Section VI of PHYSICS_PIPELINE.md (Failure Modes) + inline notes

**Time estimate**: 1-2 hours

**Known unusual elements** (from Deep Dives):
- Voigt profile: 13 magic constants, doesn't match Humlicek (1982) despite citation
- JOSH RT: Pretabulated COEFJ/COEFH weights (51×51 matrices, origin unclear)
- CONVEC: Possible bug (0.5D-5 overshooting factor, should be 0.5?)
- TCORR: No early-exit convergence (always runs NUMITS iterations)

---

### Task 3.5: Document Precision Requirements

**Goal**: Where does Float32 vs Float64 matter physically?

**Method**:
1. Use Deep Dive findings on precision analysis
2. Connect to physics (exponentials, ratios, conservation laws)
3. Flag where precision loss causes physical errors

**Output**: Inline notes in Section III + summary in Section VIII

**Time estimate**: 1 hour

**Precision findings from Deep Dives**:
- **Populations**: Float64 REQUIRED - exp(-χ/kT) spans 10^(-50) to 10^(0)
- **Voigt profiles**: Float32 acceptable - target accuracy ~2%
- **Line opacity**: Float32 adequate, Float64 recommended
- **RT integration**: Mixed (weights Float32, source functions Float64)

---

### Task 3.6: Note Convergence Criteria and Stability

**Goal**: When does the iteration succeed? When does it fail?

**Method**:
1. Identify convergence tests in code
2. Document typical iteration counts
3. Note stability mechanisms (damping, smoothing)

**Output**: Section VI of PHYSICS_PIPELINE.md

**Time estimate**: 1-2 hours

**Convergence mechanisms from Deep Dives**:
- **TCORR**: 6 damping mechanisms (±T_eff/25 limit, ±τ/4 limit, adaptive 0.5×/1.25×, smoothing, monotonicity, grid adjustment)
- **Electron density**: 0.3 damping factor (prevents oscillation)
- **Convection**: 30-iteration opacity convergence, SOR relaxation ω=0.7
- **Overall**: Typically 10-50 iterations for full atmosphere convergence

---

### Task 3.7: Write PHYSICS_PIPELINE.md

**Goal**: Synthesize all findings into coherent physics documentation

**Method**:
1. Use template structure (Section III above)
2. Write in single pass (no iterative refinement)
3. Cross-reference Deep Dives and architecture docs
4. Flag uncertainties for Paula

**Output**: `docs/archaeology/PHYSICS_PIPELINE.md` (1,500-2,500 lines)

**Time estimate**: 3-4 hours writing + 1 hour cross-referencing

**Quality criteria**:
- ✅ Physics reader (astrophysicist) can understand what ATLAS12 computes
- ✅ Julia developer knows what physics must be preserved
- ✅ Uncertainties clearly flagged (not hidden or speculated)
- ✅ Cross-referenced to existing documentation
- ❌ Not a textbook (don't derive equations from first principles)
- ❌ Not code-focused (don't describe Fortran implementation details)

---

## VI. Recommended Workflow

### Day 1 (3-4 hours)
1. **Setup** (30 min):
   - Read this briefing document
   - Skim ARCHITECTURE_INSIGHTS.md Section III (Data Flow)
   - Skim Deep Dive Index (00_INDEX.md)

2. **Task 3.1 - Trace flow** (2-3 hours):
   - Read ATLAS12 main iteration loop
   - Build step-by-step flow diagram
   - Identify which Deep Dives cover which steps

3. **Start PHYSICS_PIPELINE.md** (30 min):
   - Create file with template structure
   - Write Section I (Overview)
   - Write Section II (Input State)

### Day 2 (4-5 hours)
1. **Task 3.2 - Document physics** (3-4 hours):
   - For each step: physics process, equations, constraints
   - Use Deep Dive findings + code comments
   - Flag unclear physics with "Question for Paula"

2. **Task 3.3 - Numerical methods** (1 hour):
   - Summarize solution methods
   - Document discretization

### Day 3 (3-4 hours)
1. **Tasks 3.4, 3.5, 3.6** (2-3 hours):
   - Flag unusual algorithms
   - Document precision requirements
   - Note convergence criteria

2. **Task 3.7 - Polish and cross-reference** (1 hour):
   - Fill in Section IV (Conservation laws)
   - Fill in Section VI (Failure modes)
   - Fill in Section VIII (Migration considerations)
   - Add cross-references to Deep Dives
   - Add glossary if needed

3. **Commit and wrap up** (30 min):
   - Git commit with descriptive message
   - Update MISSION.md Phase 3 status
   - Brief summary for Paula

---

## VII. Success Criteria

**Phase 3 is successful if**:

✅ **PHYSICS_PIPELINE.md exists** and is 1,500-2,500 lines

✅ **A physicist reading it understands**:
- What physical processes ATLAS12 computes
- What equations govern each step
- What assumptions are made (LTE, hydrostatic equilibrium, etc.)
- What physical constraints must be satisfied

✅ **A Julia developer reading it understands**:
- What physics must be preserved exactly in migration
- Where numerical precision matters physically
- What physical tests validate correctness
- Where optimizations are safe vs dangerous

✅ **Uncertainties are explicit**:
- Open physics questions flagged for Paula
- Non-standard algorithms noted
- Unclear sections marked (not speculated)

✅ **Cross-referenced with existing docs**:
- Links to Deep Dives for computational details
- Links to ARCHITECTURE_INSIGHTS.md for migration context
- Complements rather than duplicates existing documentation

---

## VIII. Key Files Reference

### Primary Reading
- `docs/archaeology/ARCHITECTURE_INSIGHTS.md` - Section III (Data Flow Analysis)
- `docs/archaeology/DEEP_DIVES/00_INDEX.md` - Quick reference to 7 kernel analyses
- `upstream/castelli/source_codes/atlas12/atlas12.for` - Main program

### Deep Dives (for physics details)
- `docs/archaeology/DEEP_DIVES/02_POPULATIONS.md` - Saha-Boltzmann, LTE populations
- `docs/archaeology/DEEP_DIVES/01_VOIGT_PROFILE.md` - Line profile physics
- `docs/archaeology/DEEP_DIVES/03_LINE_OPACITY_SUMMATION.md` - Opacity accumulation
- `docs/archaeology/DEEP_DIVES/05_RADIATIVE_TRANSFER.md` - RT solver, radiation field
- `docs/archaeology/DEEP_DIVES/06_ITERATION_DAMPING.md` - Temperature correction, convergence
- `docs/archaeology/DEEP_DIVES/07_CONVECTIVE_TRANSPORT.md` - Mixing length theory

### Supporting Documentation
- `docs/archaeology/WORKFLOW_ANALYSIS.md` - How to run ATLAS12
- `docs/archaeology/VERSION_COMPARISON.md` - Castelli vs Kurucz physics differences
- `docs/archaeology/METHODOLOGY_NOTES.md` - "Here be dragons" approach

---

## IX. Common Pitfalls to Avoid

### ❌ Pitfall 1: Trying to Understand Everything
**Problem**: Getting stuck trying to derive physics from first principles
**Solution**: Document what's clear from code, flag what's unclear, move forward

**Example**:
```markdown
❌ Bad:
"The partition function is computed by summing over all energy levels weighted
by their statistical weights and Boltzmann factors. To derive this, we start
with the canonical ensemble partition function Z = Σ_i g_i exp(-E_i/kT)..."
[5 pages of statistical mechanics]

✅ Good:
"Partition functions Z(T) are pretabulated (2190-line arrays in atlas12.for).
For migration: Use interpolation to match Fortran values exactly during
validation phase. Question for Paula: Can we recompute from atomic data or
must we preserve tabulated values?"
```

### ❌ Pitfall 2: Code-Level Documentation
**Problem**: Describing Fortran implementation instead of physics
**Solution**: Focus on WHAT is computed (physics), not HOW (code)

**Example**:
```markdown
❌ Bad:
"Subroutine POPS reads COMMON blocks /TEMP/, /STATE/, /ABUND/ and writes to
/XNF/, /XNFP/. It loops from J=1,NTAU and computes populations."

✅ Good:
"Population calculation computes number densities n_i,j for each species i in
ionization stage j using the Saha-Boltzmann equation assuming LTE. Input:
T(τ), P(τ), abundances. Output: n_i,j(τ). Constraint: Σ_j n_i,j = n_i,total
(element conservation). See Deep Dive 02 for computational details."
```

### ❌ Pitfall 3: Speculation About Physics
**Problem**: Guessing at physical interpretation when uncertain
**Solution**: Explicitly flag uncertainty for domain expert (Paula)

**Example**:
```markdown
❌ Bad:
"This loop probably implements the Voigt-Hjerting function using the Humlicek
approximation."

✅ Good:
"This loop implements a 4-regime Voigt profile approximation. Deep Dive 01
found the algorithm does NOT match the cited Humlicek (1982) paper despite
code comments. Question for Paula: What is the provenance of this algorithm?
Should we trust it or replace with standard Voigt?"
```

### ❌ Pitfall 4: Ignoring Existing Documentation
**Problem**: Re-analyzing what Deep Dives already covered
**Solution**: Reference Deep Dives, add physics interpretation

**Example**:
```markdown
❌ Bad:
[Re-analyzing VKOH16 subroutine that Deep Dive 01 already documented]

✅ Good:
"Line profile calculation uses Voigt function V(a,u) representing natural
broadening convolved with thermal Doppler broadening. Physics: damping
parameter a ∝ γ/Δν_D balances radiative lifetime vs thermal velocity.
Computational implementation: See Deep Dive 01 for 4-regime approximation
details and precision analysis."
```

---

## X. Questions to Answer (Guidance)

As you work through Phase 3, aim to answer these questions:

### Physics Questions
1. **What is ATLAS12 computing?**
   - One-sentence answer: Self-consistent stellar atmosphere model in radiative+hydrostatic equilibrium

2. **What are the key physics assumptions?**
   - LTE populations, plane-parallel geometry, hydrostatic equilibrium, radiative equilibrium (or radiative+convective)

3. **What equations govern each step?**
   - Saha-Boltzmann (populations), Voigt (line profiles), RT equation (radiation field), energy balance (temperature)

4. **What physical quantities must be conserved?**
   - Particle number, energy flux, momentum (hydrostatic equilibrium)

5. **What physical parameters span the widest ranges?**
   - Populations: 40+ orders of magnitude (→ Float64 required)
   - Optical depth: τ = 10^(-6) to 10^(+2)
   - Temperature: ~3000-50,000 K

### Migration Questions
1. **Which physics must be exact?**
   - Population calculations, energy conservation, line wavelengths

2. **Where can we optimize?**
   - Voigt profile evaluation (Float32 OK, see Deep Dive 01)
   - Pretabulated data (can recompute if needed)

3. **What tests validate physics correctness?**
   - Flux conservation: ∫ F_ν dν = σ T_eff^4
   - Hydrostatic equilibrium: dP/dτ = g/κ
   - Population ratios match Saha equation

4. **Where could the physics fail?**
   - Extreme temperatures (LTE breaks down)
   - Extreme metallicities (line lists incomplete)
   - Non-convergence (oscillation, divergence)

---

## XI. Example Physics Entry (Template)

Use this template for each major pipeline step:

```markdown
### Step N: [Physics Process Name]

**Physical process**: [What's happening physically?]

**Governing equation(s)**:
[Key equation with variable definitions]

**Input state**:
- [Physical quantities needed]

**Output state**:
- [Physical quantities produced]

**Physical constraints**:
- [What must be conserved or satisfied?]

**Method**: [Numerical algorithm - one sentence]
- See Deep Dive XX for computational details

**Precision requirements**: [Float32 or Float64, why?]

**Typical values**:
- [Parameter ranges for solar-type star]

**Failure modes**:
- [What can go wrong physically?]
- [How does code handle it?]

**Questions for Paula**:
- [Anything unclear about physics?]

**Migration notes**:
- [What must be preserved exactly?]
- [Where can we optimize?]
```

---

## XII. Final Notes

### Communication with Paula
- She values **honesty about uncertainty** over confident speculation
- Flag physics questions explicitly: "**Question for Paula**: Is this implementing [process]?"
- She has decision fatigue - provide options, let her choose
- She notices and appreciates efficiency

### "Here Be Dragons" 🐉 Reminder
This mission's breakthrough methodology:
- Document what's clear
- Flag what's uncertain
- Move forward

**Applied to Phase 3**:
- Document physics you can identify ✅
- Flag unclear physics for Paula ✅
- Don't get stuck trying to understand everything ✅
- Deliver comprehensive overview, not perfect textbook ✅

### Time Management
- **Total budget**: 3-4 days
- **Don't exceed**: Phase 4 and 5 still need time
- **Single-pass writing**: No iterative refinement
- **Good enough > perfect**: 1,500-2,500 lines is sufficient

### Success Metric
If a future Julia developer reads PHYSICS_PIPELINE.md and says:
> "I understand what physics ATLAS12 computes and what I need to preserve in migration"

Then Phase 3 succeeded. 🎯

---

## XIII. Getting Started

**First steps** (immediately after reading this briefing):

1. **Read** (1 hour):
   - `docs/archaeology/ARCHITECTURE_INSIGHTS.md` Section III
   - `docs/archaeology/DEEP_DIVES/00_INDEX.md`

2. **Create skeleton** (30 min):
   ```bash
   touch docs/archaeology/PHYSICS_PIPELINE.md
   # Add template structure (Sections I-VIII)
   # Write Section I (Overview) - 1 paragraph
   ```

3. **Trace iteration** (2-3 hours):
   - Read atlas12.for main iteration loop
   - List major subroutine calls in order
   - Map to Deep Dives (which kernels already analyzed)
   - Write Section III skeleton (one subsection per step)

4. **Fill in physics** (Day 2):
   - For each step: physics, equations, constraints
   - Use Deep Dive findings
   - Flag uncertainties

5. **Polish and commit** (Day 3):
   - Complete remaining sections
   - Cross-reference
   - Git commit
   - Update MISSION.md

**You've got this.** The Phase 2 work provides excellent foundation. Phase 3 adds the physics layer. 🐉✨

---

**End of Phase 3 Briefing**

*Prepared by: Claude (Sonnet 4.5), 2025-11-09*
*For: Future Claude instance tackling Phase 3*
*Based on: Phase 2B methodology and "here be dragons" approach*
*Status: Ready for autonomous Phase 3 execution*
