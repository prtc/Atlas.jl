# File Type Analysis
*Task 1.4 - Main Programs vs. Subroutines/Functions*

**Generated**: 2025-11-04
**Files Analyzed**: 231

---

## Summary

The ATLAS Suite codebase is predominantly composed of **standalone executable programs** rather than shared libraries:

| File Type | Count | Percentage | Description |
|-----------|-------|------------|-------------|
| **Main Programs** | 182 | 78.8% | Standalone executables with PROGRAM statement |
| **Main + Subs** | 35 | 15.2% | Programs with embedded subroutines/functions |
| **Subroutines Only** | 13 | 5.6% | Reusable subroutine libraries |
| **Functions Only** | 1 | 0.4% | Single function library |

**Key Insight**: 94% of files (217/231) contain a main PROGRAM entry point, indicating a **tool-oriented architecture** where each file is typically compiled as its own executable rather than linked as a library.

---

## Analysis by Repository

### Castelli
- **Main Programs**: 56 files (82%)
- **Main + Subs**: 9 files (13%)
- **Subroutines**: 3 files (4%)
- **Pattern**: Higher proportion of pure main programs - simpler, more self-contained structure

### Kurucz
- **Main Programs**: 126 files (77%)
- **Main + Subs**: 26 files (16%)
- **Subroutines**: 10 files (6%)
- **Functions**: 1 file (< 1%)
- **Pattern**: More mixed files with embedded subroutines - slightly more modular within-file organization

---

## Subroutine/Function Library Files

These 14 files contain reusable code intended to be called from other programs:

### Castelli Libraries (3 files)

| File | Type | Contents | Lines |
|------|------|----------|-------|
| synthe/plotpackcol.for | subroutines | 4 plotting subroutines | 5,017 |
| synthe/atlas7v.for | subroutines | ATLAS7V atmosphere interpolation | 17,336 |
| syntheg/atlas7v.for | subroutines | ATLAS7V atmosphere interpolation (g-variant) | 17,507 |

### Kurucz Libraries (11 files)

| File | Type | Contents | Lines |
|------|------|----------|-------|
| programs/atlas12/plotpack.for | subroutines | 4 plotting subroutines | 5,011 |
| programs/SYNTHECD/plotpack.for | subroutines | INITPLT + others | 4,858 |
| programs/SYNTHE/atlas7v.for | subroutines | ATLAS7V interpolation | 17,144 |
| programs/atlas9/xlinop9.for | subroutines | PUTOUT + line opacity routines | 564 |
| programs/atlas9/atlas9xlinop.for | subroutines | PUTOUT + explicit opacity | 13,014 |
| programs/SYNTHECD/abort.for | subroutines | ABORT error handler | 4 |
| programs/SYNTHECD/begtime.for | subroutines | BEGTIME timing utility | 9 |
| atoms/PF/pfiron.for | subroutines | PFIRON iron partition functions | 44 |
| sun/kpk/plotkpk.for | subroutines | OBSERV plotting | 166 |
| sun/kpnoprelim/plotkpno.for | subroutines | OBSKPNO plotting | 145 |
| programs/SYNTHE/airtovac.for | functions | AIRTOVAC wavelength conversion | 30 |

---

## Important ATLAS7V Pattern

**ATLAS7V** appears as a subroutine library in multiple locations:
- Castelli: 2 versions (synthe/, syntheg/)
- Kurucz: 2 versions (SYNTHE/, atlas12/)
- Total: 4 copies, ~69K lines

**Purpose**: ATLAS7V provides atmosphere model interpolation for synthesis codes. It reads pre-computed ATLAS atmosphere models and interpolates between them.

**Architecture Note**: This is a **shared dependency** - SYNTHE programs call ATLAS7V subroutines to get atmospheric structure, rather than computing atmospheres themselves. This represents a separation between:
1. **Atmosphere computation** (ATLAS9/ATLAS12)
2. **Spectrum synthesis** (SYNTHE using ATLAS7V)

---

## Main Program Architecture Patterns

### Pattern 1: Simple Standalone Programs (182 files)

**Characteristics**:
- Single PROGRAM statement
- All logic in main program body
- No subroutines or functions
- Self-contained utilities

**Examples**:
- `atlas12.for` (23,247 lines) - Pure main program despite huge size!
- `atlas9.for` (18,725 lines) - Monolithic atmosphere code
- `synthe.for` (2,985 lines) - Main synthesis driver
- Most utilities (< 500 lines each)

**Implication**: These programs likely call EXTERNAL subroutines compiled from other files, but don't define subroutines internally.

### Pattern 2: Main with Embedded Subroutines (35 files)

**Characteristics**:
- PROGRAM statement + SUBROUTINE/FUNCTION definitions
- Helper routines local to the program
- Mixed procedural + modular design

**Examples**:
- `Castelli:synthe/atlas7v.for` - ATLAS7 + many subroutines
- `Kurucz:programs/SYNTHE/atlas7v.for` - Same pattern
- `Castelli:synthe/rh2ofast.for` - Main + 1 subroutine
- Typical pattern: Main program + 1-4 helper subroutines

### Pattern 3: Pure Subroutine Libraries (13 files)

**Characteristics**:
- No PROGRAM statement
- One or more SUBROUTINE definitions
- Intended to be compiled and linked into other programs

**Examples**:
- `plotpack.for` (multiple versions) - 4 plotting subroutines each
- `atlas7v.for` (as subroutine library) - Atmosphere interpolation
- `xlinop9.for` - Explicit line opacity calculations

---

## Fortran Compilation Model Implications

### For Julia Migration:

1. **No modules**: None of the 231 files use Fortran 90+ MODULE syntax
   - Everything is Fortran 77 style: PROGRAM, SUBROUTINE, FUNCTION, COMMON blocks
   - Julia translation can use modern module system

2. **Linking model**: Programs were compiled separately and linked:
   ```
   # Typical Fortran 77 build process:
   f77 -c atlas7v.for     # Compile to atlas7v.o
   f77 -c synthe.for      # Compile to synthe.o
   f77 -o synthe synthe.o atlas7v.o   # Link together
   ```
   - Julia can use a more modern import/using model

3. **Shared code via copies**: ATLAS7V appears in 4 places
   - Suggests no shared library distribution model
   - Each program bundled with its own copy of dependencies
   - Julia migration can consolidate to single shared module

4. **Monolithic programs**: Even 23K-line programs don't use subroutines!
   - Likely heavy use of GOTO for flow control
   - Julia migration should consider breaking into functions

---

## Migration Complexity by File Type

### Main Programs (182 files) - **Medium to High Complexity**
- **Challenges**:
  - May contain complex flow control (GOTO statements)
  - Large programs will need refactoring
  - External dependencies need mapping
- **Opportunities**:
  - Clear entry points
  - Can be translated as standalone scripts/programs initially
  - Natural test boundaries

### Main + Subs (35 files) - **Medium Complexity**
- **Challenges**:
  - Mixed program + library structure
  - Helper subs may share data via COMMON blocks
- **Opportunities**:
  - Some internal modularization already present
  - Helper functions show natural Julia function boundaries

### Subroutine Libraries (13 files) - **Low to Medium Complexity**
- **Challenges**:
  - Need to identify all calling programs
  - May use COMMON blocks for shared data
- **Opportunities**:
  - Natural Julia module candidates
  - Can be tested independently with mock inputs
  - Consolidation opportunities (e.g., multiple ATLAS7V copies)

---

## Critical Programs by Type

### Atmosphere Computation (Main Programs)
- **ATLAS9**: 6 variants, all main programs (18-20K lines each)
- **ATLAS12**: 3 variants, all main programs (22-23K lines each)
- **KAPPA9**: 1 version, main program (19K lines)
- **WIDTH9**: 2 variants, both main programs (21K lines each)

### Synthesis (Main Programs + Libraries)
- **SYNTHE**: Main programs (1-3K lines) + ATLAS7V library (17K lines)
- **DFSYNTHE**: Main program (3.7K lines)

### Utilities (Mostly Main Programs)
- 150+ small utilities (< 500 lines), nearly all main programs
- Simple standalone tools for data conversion, file I/O, etc.

---

## Questions for Phase 2

1. **Subroutine call mapping**: Which main programs call which external subroutines?
   - Need to trace CALL statements and EXTERNAL declarations
   - Build call graph for major programs

2. **COMMON block usage**: How do programs share data?
   - COMMON blocks are Fortran's global variable mechanism
   - Need to document all COMMON blocks for Julia struct design

3. **GOTO usage**: How much procedural flow control?
   - Heavy GOTO usage will complicate translation
   - May need control flow graph analysis

4. **External dependencies**: What gets linked together?
   - Which .for files are compiled together?
   - Need to find Makefiles or compilation notes

---

## Task 1.4 Status: ✅ COMPLETE

**Key Findings**:
- 79% standalone main programs (tool-oriented architecture)
- Only 14 subroutine/function libraries (6% of files)
- No Fortran 90+ modules (pure F77 style)
- ATLAS7V appears 4 times as shared dependency
- Monolithic design: even 23K-line programs don't use internal subroutines

**Next**: Task 1.5 - Create initial dependency map (call graphs for major programs)
