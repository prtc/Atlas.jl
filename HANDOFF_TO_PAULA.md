# Handoff Items for Paula
**Date**: 2025-11-12
**Session**: claude/confirm-apt-access-011CV4AJoJXhz4eEzf6nviJx
**Purpose**: Test data and reference files needed for Pure Julia TDD implementation

---

## Test Data Files Needed

### High Priority (Needed for Week 1 work)

#### 1. Voigt Profile Validation Data
**Purpose**: Test 4-regime Voigt function implementation

**Files needed:**
- [ ] **H0TAB, H1TAB, H2TAB tables** from ATLAS12 source
  - Location: `ATLAS12 lines 15994-16026` (DATA statements)
  - Format: 2001 points each, v=0 to 10 in steps of 0.005
  - Alternative: If you can export these to CSV/text from running Fortran

**Test cases needed:**
- [ ] Known (v, a) pairs with expected H(v,a) values
  - Pure Gaussian limit (a→0): v=0,1,2,3 with H≈exp(-v²)
  - Pure Lorentzian limit (v→∞): v=10,20,50 with H≈a/(√π·v²)
  - Mixed regime: (v=2, a=0.1), (v=5, a=0.5), etc.

**Format**: CSV with columns: `v, a, H_expected, regime_number`

---

#### 2. Solar Atmosphere Model (Reference)
**Purpose**: Test Saha equation, partition functions, opacity calculations

**Files needed:**
- [ ] **Solar ATLAS model** (any format: fort.8, KURUCZ format, or text)
  - At least: T(τ), P(τ), ρ(τ), n_e(τ) at ~50 depth points
  - Rosseland optical depth τ_Ross values
  - Element abundances (can use standard solar if not in model)

**Preferred source:**
- Castelli-Kurucz solar model (if available)
- Or your preferred reference solar model

**Format**: Any readable format (I can parse)

---

#### 3. Partition Function Validation Data
**Purpose**: Test partition function calculations

**Files needed:**
- [ ] **NIST partition function tables** for verification
  - Elements: H, He, C, N, O, Fe (at minimum)
  - Temperatures: 5000K, 6000K, 8000K, 10000K
  - Or: output from running PFSAHA for known T values

**Alternative**:
- [ ] If you can run PFSAHA in Fortran, provide output for:
  - Element codes: 1.0 (H I), 1.1 (H II), 26.0 (Fe I), 26.1 (Fe II)
  - Temperature: 5000K, 6000K, 8000K
  - Format: element_code, T, U(T)

---

#### 4. Saha Equation Test Cases
**Purpose**: Validate ionization fraction calculations

**Files needed:**
- [ ] **Reference ionization fractions** from ATLAS12 run
  - One solar model depth point is sufficient
  - All element ionization states (n_i for i=0,1,2,...)
  - Corresponding T, n_e, abundances

**Format**: CSV with columns: `element, ion_stage, fraction, T, n_e`

---

### Medium Priority (Needed for Week 2-3)

#### 5. Line List Samples
**Purpose**: Test line opacity accumulation

**Files needed:**
- [ ] **Small gfall line list** (~1000-10000 lines)
  - Wavelength range: 5000-5100 Å (to match Phase 5)
  - Format: Standard Kurucz gfall (already have parser!)
  - Location: `upstream/kurucz/linelists/` or Kurucz website

- [ ] **Molecular line list sample** (CH, CN, or CO)
  - ~1000 lines
  - Wavelength range: 5000-5100 Å
  - Format: Standard Kurucz molecular format

**Already have**: Parsers for both formats (Tasks 3-4 complete!)

---

#### 6. Reference Spectrum for Validation
**Purpose**: End-to-end test of line opacity + radiative transfer

**Files needed:**
- [ ] **Fortran SYNTHE output** for solar spectrum 5000-5100 Å
  - Input: Solar model + line lists above
  - Output: wavelength, flux (or intensity)
  - Resolution: R=50000 (matches Phase 5 config)

**Format**: Simple two-column ASCII (wavelength, flux)

---

#### 7. Continuum Opacity Test Cases
**Purpose**: Validate H⁻, H I, H₂⁺, scattering, etc.

**Files needed:**
- [ ] **KAPP output** from atlas7v for one depth point
  - T, P, ρ, n_e (conditions)
  - Continuum opacity sources: H⁻ bf, H⁻ ff, H I bf, scattering, etc.
  - Wavelengths: 5000, 5500, 6000, 6500 Å (sample points)

**Alternative**: Known literature values for solar photosphere

---

### Low Priority (Nice to have)

#### 8. Broadening Test Cases
**Purpose**: Validate rotational/instrumental broadening

**Files needed:**
- [ ] **Delta-function test**: Single line before/after broadening
  - Input: Delta function at 5000 Å
  - Output: After Gaussian broadening (FWHM=10 km/s)
  - Output: After rotation (v sin i = 10 km/s)

- [ ] **Solar line profile**: Real spectral line
  - High-S/N observation of solar Fe I line
  - For comparison with broadened synthetic

---

#### 9. Physical Constants Verification
**Purpose**: Ensure CGS constants match Fortran exactly

**Files needed:**
- [ ] **Constants used in ATLAS12/SYNTHE** (grep source for):
  - Speed of light (C0)
  - Boltzmann constant (BK, BOLK)
  - Planck constant (H, HH)
  - Electron mass (EM, EME)
  - Thomson cross-section (SIGE)
  - Radiation constant (SIGMA, SIGM)

**Format**: List with name, value, units

---

## Reference Documentation Needed

### Already Have (From Archaeology Phase)
- ✅ Deep Dives 01-12 (Voigt, populations, line opacity, etc.)
- ✅ PHYSICS_PIPELINE_ATLAS12.md
- ✅ PHYSICS_PIPELINE_SYNTHE.md
- ✅ MIGRATION_ASSESSMENT.md with formulas

### Would Be Helpful
- [ ] **Kurucz papers** with opacity formulas (if you have PDFs):
  - Gray (2005) for continuum opacities
  - Unsöld approximation references
  - H⁻ opacity formula references

---

## How to Provide Files

**Preferred delivery:**
1. **Push to branch** `test-data` in Atlas.jl repo
   - Create directory: `test/reference_data/`
   - Add files there with descriptive names
   - I can pull and use directly

2. **Alternative**: Describe file locations
   - If files are in `upstream/` already, just tell me paths
   - I can search and extract what I need

**File formats:**
- CSV, ASCII text, or space-delimited (easiest for me)
- Can handle Fortran binary if necessary (already have parser)
- Can extract from Fortran DATA statements

---

## Timeline Expectation

**No rush!** Work at your pace. I will:
- Start with functions that need NO test data (physical constants, unit conversions)
- Implement and test with analytical cases where possible
- Add your test data when available to validate against Fortran

**Priority order** (affects what I start with):
1. Voigt profile data → Enables line opacity work
2. Solar atmosphere model → Enables population/opacity tests
3. Partition function data → Validates complex tables
4. Everything else → Nice validation extras

---

## Questions / Clarifications

If any of these requests are unclear or you have better alternatives, just let me know! I'm flexible on:
- File formats
- Quantity of test data (1 case vs 100 cases)
- Whether to use published data vs your Fortran runs
- Timescale for delivery

The key is: **any test data is better than no test data** for TDD!

---

## Status Tracking

I'll update this file as you provide items:
- [ ] = Not yet received
- [x] = Received and incorporated into tests
- [~] = Partial / alternative found

Last updated: 2025-11-12
