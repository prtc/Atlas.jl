# ATLAS7V Phase 3: Transitive Dependency Analysis

## Executive Summary

Complete dependency chain analysis tracing all subroutines called (directly or indirectly) by SYNTHE's 7 atlas7v dependencies.

**Key Finding**: The transitive closure expands from 7 direct dependencies to **32 unique subroutines** totaling **~10,500 lines** (61% of atlas7v.for).

**Critical Discovery**: PFIRON (6,037 lines of iron partition function tables) is pulled in via POPS → PFSAHA → PFIRON chain, dominating the dependency footprint.

---

## Dependency Chain

### Level 0: Direct SYNTHE Dependencies (7 subroutines, 1,433 lines)

| Subroutine | Lines | Range | Called By |
|------------|-------|-------|-----------|
| READIN | 870 | 1312-2181 | spectrv |
| JOSH | 239 | 7941-8179 | spectrv |
| KAPP | 118 | 4324-4441 | xnfpelsyn |
| POPS | 101 | 2789-2889 | xnfpelsyn (44×) |
| MAP1 | 58 | 1136-1193 | synthe |
| PARCOE | 38 | 1098-1135 | synthe |
| W | 9 | 1303-1311 | spectrv, TTAUP |

### Level 1: Called by Level 0 (24 subroutines, ~2,900 lines)

#### From READIN:
| Subroutine | Lines | Range | Purpose |
|------------|-------|-------|---------|
| INTEG | 18 | 1080-1097 | Integration utility |
| TTAUP | 258 | 2383-2640 | T-tau relation |

#### From POPS:
| Subroutine | Lines | Range | Purpose |
|------------|-------|-------|---------|
| PFSAHA | 950 | 2949-3898 | Partition functions (Saha equation) |

#### From KAPP (20 opacity subroutines):
| Subroutine | Lines | Range | Purpose |
|------------|-------|-------|---------|
| HOP | 122 | 4442-4563 | H I bound-free opacity |
| H2PLOP | 23 | 5051-5073 | H₂⁺ opacity |
| HMINOP | 105 | 5074-5178 | H⁻ opacity |
| HRAYOP | 148 | 5193-5340 | H Rayleigh scattering |
| HE1OP | 206 | 5341-5546 | He I bound-free opacity |
| HE2OP | 89 | 5547-5635 | He II bound-free opacity |
| HEMIOP | 24 | 5636-5659 | He⁻ opacity |
| HERAOP | 15 | 5660-5674 | He Rayleigh scattering |
| COOLOP | 29 | 5675-5703 | Cooling opacity |
| LUKEOP | 54 | 7352-7405 | Luke opacity |
| HOTOP | 128 | 7523-7650 | Hot opacity |
| ELECOP | 12 | 7659-7670 | Electron scattering opacity |
| H2RAOP | 27 | 7671-7697 | H₂ Rayleigh scattering |
| HLINOP | 56 | 7698-7753 | H line opacity |
| LINOP | 67 | 7835-7901 | General line opacity |
| LINSOP | 9 | 7902-7910 | Line scattering opacity |
| XLINOP | 3 | 7911-7913 | Line opacity (X variant) |
| XLISOP | 9 | 7914-7922 | Line scatter opacity (X variant) |
| XCONOP | 9 | 7923-7931 | Continuum opacity (X variant) |
| XSOP | 9 | 7932-7940 | Scatter opacity (X variant) |

**KAPP Subtotal**: 1,144 lines across 20 subroutines

#### From JOSH:
| Subroutine | Lines | Range | Purpose |
|------------|-------|-------|---------|
| DERIV | 20 | 1060-1079 | Derivative calculation |
| INTEG | 18 | 1080-1097 | Integration (already counted above) |

### Level 2: Called by Level 1 (1 subroutine, 6,037 lines)

#### From PFSAHA:
| Subroutine | Lines | Range | Purpose |
|------------|-------|-------|---------|
| **PFIRON** | **6,037** | **9959-15995** | **Iron partition function tables** |

**Critical Note**: PFIRON alone is 35% of atlas7v.for and dominates the dependency footprint!

---

## Complete Dependency Graph

```
SYNTHE Programs
├── xnfpelsyn
│   ├── POPS (101 lines)
│   │   └── PFSAHA (950 lines)
│   │       └── PFIRON (6,037 lines) *** MONSTER ***
│   └── KAPP (118 lines)
│       ├── HOP (122 lines)
│       ├── H2PLOP (23 lines)
│       ├── HMINOP (105 lines)
│       ├── HRAYOP (148 lines)
│       ├── HE1OP (206 lines)
│       ├── HE2OP (89 lines)
│       ├── HEMIOP (24 lines)
│       ├── HERAOP (15 lines)
│       ├── COOLOP (29 lines)
│       ├── LUKEOP (54 lines)
│       ├── HOTOP (128 lines)
│       ├── ELECOP (12 lines)
│       ├── H2RAOP (27 lines)
│       ├── HLINOP (56 lines)
│       ├── LINOP (67 lines)
│       ├── LINSOP (9 lines)
│       ├── XLINOP (3 lines)
│       ├── XLISOP (9 lines)
│       ├── XCONOP (9 lines)
│       └── XSOP (9 lines)
│
├── spectrv
│   ├── READIN (870 lines)
│   │   ├── INTEG (18 lines)
│   │   └── TTAUP (258 lines)
│   │       └── W (9 lines)
│   ├── JOSH (239 lines)
│   │   ├── DERIV (20 lines)
│   │   └── INTEG (18 lines, shared with READIN)
│   └── W (9 lines, shared with TTAUP)
│
└── synthe (variant)
    ├── MAP1 (58 lines)
    └── PARCOE (38 lines)
```

---

## Transitive Closure Summary

### Total Unique Subroutines: 32

**Level 0** (Direct): 7 subroutines
**Level 1** (Indirect): 24 subroutines (INTEG, TTAUP, PFSAHA, DERIV, + 20 opacity)
**Level 2** (Deep): 1 subroutine (PFIRON)

### Total Lines: ~10,571

| Category | Lines | % of atlas7v | % of Closure |
|----------|-------|--------------|--------------|
| **PFIRON alone** | 6,037 | 35% | 57% |
| **Opacity subroutines** | 1,144 | 7% | 11% |
| **Level 0 (direct)** | 1,433 | 8% | 14% |
| **PFSAHA** | 950 | 5% | 9% |
| **READIN** | 870 | 5% | 8% |
| **Other Level 1** | 296 | 2% | 3% |
| **TOTAL** | **~10,571** | **61%** | **100%** |

**Atlas7v Total**: 17,336 lines

**Unused by SYNTHE**: ~6,765 lines (39%) including:
- PUTOUT, TCORR, STATEQ, RADIAP, ROSS (atmosphere iteration)
- NMOLEC, READMOL (molecular abundances)
- C1OP, MG1OP, AL1OP, SI1OP, FE1OP, CHOP, OHOP (specific element opacities, likely conditionally excluded)
- CONVEC, HIGH, TURB (convection, not needed for spectrum synthesis)
- BLOCKJ, BLOCKH, BLOCKE, BLOCKR (COMMON setup, may be implicit)
- PFGROUND (alternate partition function method)

---

## Dependency Analysis by Function

### 1. READIN (Atmosphere Parser)

**Direct Calls**:
- INTEG (18 lines): Integration utility
- TTAUP (258 lines): T-tau relation

**Second-Level**:
- W (9 lines): Write utility (from TTAUP)

**Total Closure**: 3 subroutines, 285 lines

**Purpose**: Parse atmosphere model from fort.7, compute depth scale via T-tau integration.

### 2. POPS (Population Solver)

**Direct Calls**:
- PFSAHA (950 lines): Partition function calculator

**Second-Level**:
- PFIRON (6,037 lines): Iron partition function tables

**Total Closure**: 2 subroutines, 6,987 lines

**Purpose**: Solve Saha-Boltzmann equation for atomic/ionic populations. PFSAHA computes partition functions, delegates iron (element 26) to specialized PFIRON due to complex level structure.

**Critical Issue**: PFIRON is 67× larger than POPS itself! This is the main bloat in the dependency chain.

### 3. KAPP (Continuum Opacity Dispatcher)

**Direct Calls**: 20 opacity subroutines (conditionally via IFOP flags)

**Total Closure**: 20 subroutines, 1,144 lines

**Purpose**: Dispatch to appropriate opacity calculators based on configuration. Opacity sources include:
- Bound-free (photoionization): H, He, metals
- Free-free (thermal bremsstrahlung): H₂⁺
- Rayleigh scattering: H, He, H₂
- Line opacity: H lines, general lines
- Electron scattering

**Note**: Not all 20 are always used - depends on IFOP runtime flags.

### 4. JOSH (Radiative Transfer Solver)

**Direct Calls**:
- DERIV (20 lines): Derivative calculation
- INTEG (18 lines): Integration

**Total Closure**: 2 subroutines, 38 lines

**Purpose**: Solve radiative transfer equation via Feautrier method. Uses DERIV for computing gradients, INTEG for optical depth integration.

### 5. Utilities (MAP1, PARCOE, W)

**No dependencies** (self-contained)

**Total**: 105 lines

---

## Migration Implications

### Critical Path: PFIRON Problem

**Issue**: PFIRON (6,037 lines, 35% of atlas7v) is pulled in via POPS, but may not be essential for all use cases.

**Investigation Needed**:
1. Can PFIRON be replaced with a smaller table or formula?
2. Is iron always needed, or only for Fe-rich stars?
3. Can we use an external partition function library (e.g., from NIST)?

**Options**:
- **Option A**: Migrate PFIRON as-is (painful, but complete)
- **Option B**: Replace with approximate formula (faster, less accurate)
- **Option C**: Use runtime table lookup from external file (Julia-friendly)
- **Option D**: Defer PFIRON, use placeholder returning constant (for prototyping)

**Recommendation**: Option D for MVP (defer PFIRON), Option C for production (external table).

### Opacity Subroutine Subset

**Issue**: KAPP calls 20 opacity subroutines, but not all are always used.

**Investigation Needed**:
1. Which opacities are essential for solar-type stars?
2. Which can be deferred for cool stars? hot stars?

**Typical Priority** (for solar spectrum):
- **Critical**: HOP (H I), HMINOP (H⁻), HE1OP (He I), HRAYOP (H Rayleigh)
- **High**: HE2OP (He II), ELECOP (electron scattering)
- **Medium**: H2PLOP (H₂⁺, cool stars), COOLOP
- **Low**: Exotic opacities (LUKEOP, HOTOP), X-variants (XLINOP, XLISOP)

**Recommendation**: Migrate critical opacities first, stub others with warnings.

### Transitive Closure Size

**Total**: 32 subroutines, ~10,500 lines

**Breakdown**:
- Tables/Data: 6,037 lines (PFIRON)
- Physics: 3,400 lines (opacities, PFSAHA, READIN, JOSH, POPS, KAPP)
- Utilities: 285 lines (INTEG, DERIV, TTAUP, MAP1, PARCOE, W)
- Dependencies: 1,433 lines (Level 0)

**Timeline Estimate**:
- With PFIRON: 16-20 weeks (migrate entire closure)
- Without PFIRON: 10-12 weeks (defer tables)

---

## Recommended Migration Order

### Phase A: Utilities (Week 1)

**Low-risk, no dependencies**:
- INTEG (18 lines): Integration via trapezoidal rule
- DERIV (20 lines): Numerical derivative
- MAP1 (58 lines): Table interpolation
- PARCOE (38 lines): Parabolic coefficients
- W (9 lines): Write wrapper

**Total**: 143 lines, ~1 week

**Validation**: Unit tests with known integrals/derivatives

### Phase B: Atmosphere Parsing (Weeks 2-3)

**Depends on Phase A**:
- READIN (870 lines): Requires INTEG, TTAUP
- TTAUP (258 lines): Requires W

**Total**: 1,128 lines, ~2 weeks

**Validation**: Parse reference atmosphere models (Kurucz solar, MARCS), compare with Fortran

### Phase C: Opacity Infrastructure (Weeks 4-7)

**Core opacities** (essential for all stars):
- HOP (122 lines): H I bound-free
- HMINOP (105 lines): H⁻ opacity
- HE1OP (206 lines): He I bound-free
- HRAYOP (148 lines): H Rayleigh
- HE2OP (89 lines): He II bound-free
- ELECOP (12 lines): Electron scattering

**Total**: 682 lines, ~4 weeks

**Validation**: Compare opacity vs wavelength/temperature against published tables (OPAL, OP)

**Defer** (low priority):
- COOLOP, LUKEOP, HOTOP, H2PLOP, HEMIOP, HERAOP (187 lines)
- Line opacities (HLINOP, LINOP, LINSOP, XLINOP, XLISOP, XCONOP, XSOP) (165 lines)
- H2RAOP (27 lines)

### Phase D: KAPP Dispatcher (Week 8)

**Depends on Phase C**:
- KAPP (118 lines): Dispatcher calling Phase C opacities

**Validation**: Verify continuum opacity for solar T, P at test wavelengths

### Phase E: Population Solver (Weeks 9-12)

**Critical, depends on PFSAHA/PFIRON**:
- POPS (101 lines)
- PFSAHA (950 lines)
- **PFIRON (6,037 lines)** - defer or replace

**Recommendations**:
1. **MVP**: Replace PFIRON with simple formula or constant partition function
2. **Production**: Extract PFIRON tables to HDF5/Arrow file, load at runtime

**Validation**: Compare H I, He I, C I, O I, Mg I, Fe I populations against Saha equation at test conditions

### Phase F: Radiative Transfer (Weeks 13-14)

**Depends on Phases A, D, E**:
- JOSH (239 lines): Requires DERIV, INTEG

**Validation**: Compare emergent intensity for gray atmosphere, isothermal atmosphere (analytic solutions exist)

---

## Open Questions

### 🐉 PFIRON: Data vs Code?

**Question**: Is PFIRON mostly data tables or complex calculations?

**Investigation**: Read lines 9959-15995 to determine structure. If mostly DATA statements, can extract to external file.

**Impact**: Could reduce migration from 6K lines to ~500 lines if tables are externalized.

### 🐉 IFOP Flags: Which Opacities Are Used?

**Question**: Which of the 20 KAPP opacity subroutines are actually invoked for solar synthesis?

**Investigation**: Trace IFOP flag settings in SYNTHE pipeline. Likely set in fort.93 or hardcoded in xnfpelsyn.

**Impact**: May only need 6-8 opacity subroutines for MVP, not all 20.

### 🐉 COMMON Blocks: Implicit Dependencies?

**Question**: Do BLOCKJ, BLOCKH, BLOCKE, BLOCKR need to be called explicitly, or are they initialized elsewhere?

**Investigation**: Grep for BLOCKJ/BLOCKH/BLOCKE/BLOCKR in SYNTHE programs and atlas7v.

**Impact**: May need to include ~1,700 lines of COMMON setup not captured in CALL analysis.

### 🐉 PFSAHA vs PFGROUND: Which is Used?

**Question**: PFSAHA (950 lines) is called by POPS, but PFGROUND (1,024 lines) also exists. What's the difference?

**Investigation**: Check if PFGROUND is dead code or an alternative method.

**Impact**: If PFGROUND is unused, we save 1K lines. If both are needed, add 1K lines to closure.

---

## Next Steps (Phase 4)

### Deep Dive on Critical Subroutines

Create detailed analysis for:

1. **READIN** (870 lines): Atmosphere file format, COMMON block population
2. **POPS** (101 lines): Saha-Boltzmann algorithm, element iteration
3. **PFSAHA** (950 lines): Partition function calculation, temperature interpolation
4. **KAPP** (118 lines): Opacity dispatcher logic, IFOP flags
5. **JOSH** (239 lines): Feautrier radiative transfer method
6. **Opacity Subroutines** (682 lines critical subset): H, He opacity formulas

### PFIRON Investigation

- Read source to determine data vs code ratio
- Assess feasibility of:
  - Externalizing tables
  - Using approximate formulas
  - Using external library (e.g., NIST partition functions)

### COMMON Block Mapping

- Grep for all COMMON declarations in atlas7v
- Map which variables are shared between subroutines
- Identify initialization dependencies (BLOCKE, BLOCKR, BLOCKJ, BLOCKH)

---

## Document Status

**Phase 3**: COMPLETE ✓
**Total Dependency Footprint**: 32 subroutines, ~10,500 lines (61% of atlas7v)
**Critical Blocker**: PFIRON (6K lines) - needs investigation/strategy
**Next**: Phase 4 - Deep dive on critical subroutines
**Commit**: Ready for git commit/push
