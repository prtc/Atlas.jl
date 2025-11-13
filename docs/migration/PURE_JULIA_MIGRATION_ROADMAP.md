# Pure Julia Migration Roadmap
**Target**: Maximize $68 sandbox credit with TDD pure Julia implementations
**Strategy**: No external packages, strict TDD, autonomous safe execution
**Duration**: Estimated 15-20 hours of focused work

---

## Week 1: Foundation & High-Value Functions (Days 1-5)

### Day 1: Physical Constants & Unit Conversions (~2 hours)
**Credit usage**: ~$8-10

**Deliverables:**
- `src/Synthe/src/constants.jl` - All CGS physical constants
- `src/Synthe/src/units.jl` - Wavelength, frequency, energy conversions
- `test/synthe/test_constants.jl` - Validate against known values
- `test/synthe/test_units.jl` - Round-trip conversion tests

**Functions:**
1. Physical constants (h, c, k_B, m_e, σ_T, etc.) - 13 constants
2. Wavelength conversions (Å ↔ nm ↔ cm ↔ Hz ↔ eV)
3. Air ↔ vacuum wavelength (Edlén 1953 formula)
4. Doppler → wavelength shift

**Test strategy:**
- Compare to CODATA 2018 values
- Round-trip conversions (λ → ν → λ should equal λ)
- Known calibration lines (Hα = 6562.8 Å)

**Lines of code**: ~150 (50 constants, 100 conversions)

---

### Day 2: Simple Physical Formulas (~3 hours)
**Credit usage**: ~$12-15

**Deliverables:**
- `src/Synthe/src/physics.jl` - Core physics formulas
- `test/synthe/test_physics.jl` - Analytical test cases

**Functions:**
1. **Planck function** B_ν(T) - blackbody radiation
2. **Doppler width** calculation (thermal + microturbulent)
3. **Damping parameter** for Voigt profile
4. **Boltzmann distribution** n_j/n_i
5. **Ideal gas law** variants
6. **Optical depth** dτ calculations

**Test strategy:**
- Planck: Wien displacement law, Stefan-Boltzmann integration
- Doppler: Solar Fe I lines (known widths)
- Boltzmann: Partition function normalization

**Lines of code**: ~200 functions + 150 tests = 350 total

---

### Day 3-4: Voigt Profile (4-Regime Algorithm) (~6 hours)
**Credit usage**: ~$25-30

**Deliverables:**
- `src/Synthe/src/voigt.jl` - Complete 4-regime implementation
- `test/synthe/test_voigt.jl` - Comprehensive test suite
- `test/synthe/voigt_tables.jl` - H0, H1, H2 tables (if Paula provides)

**Implementation:**
1. **Regime 1** (v≤10, a<0.2): Quadratic polynomial
   - H = H0(v) + a·H1(v) + a²·H2(v)
   - Requires H0TAB, H1TAB, H2TAB (2001 points each)

2. **Regime 2** (v>10, a<0.2): Far-wing approximation
   - H = 0.5642·a/v²

3. **Regime 3** (moderate a): 4th-degree polynomial with correction
   - 13 magic constants from Deep Dive 01

4. **Regime 4** (large a): Asymptotic expansion

**Test strategy:**
- **Pure Gaussian** (a→0): H(v,0) ≈ exp(-v²) / √π
- **Pure Lorentzian** (v→∞): H(v,a) ≈ a / (√π·v²)
- **Normalization**: ∫₋∞^∞ H(v,a) dv = √π
- **Symmetry**: H(-v,a) = H(v,a)
- **Compare to Faddeeva** (if Paula provides benchmark data)

**Contingency if no tables:**
- Use analytical approximations for all regimes
- Lower accuracy (~5%) but still useful
- Document limitations

**Lines of code**: ~500 implementation + 200 tests = 700 total

---

### Day 5: Line Opacity Utilities (~2 hours)
**Credit usage**: ~$8-10

**Deliverables:**
- `src/Synthe/src/line_opacity_utils.jl`
- `test/synthe/test_line_opacity_utils.jl`

**Functions:**
1. **Line center calculation** from quantum numbers
2. **Wavelength to frequency offset** Δv in Doppler widths
3. **Line strength calculation** from loggf, abundances, populations
4. **Opacity coefficient** at given frequency offset
5. **Early-exit threshold** determination

**Test strategy:**
- Known solar lines (wavelength, strength)
- Flux conservation tests
- Precision tests (Float32 vs Float64 accumulation)

**Lines of code**: ~300 total

---

## Week 2: Population & Partition Functions (Days 6-10)

### Day 6-7: Saha Equation (~5 hours)
**Credit usage**: ~$20-25

**Deliverables:**
- `src/Synthe/src/saha.jl` - Ionization balance
- `test/synthe/test_saha.jl` - Validation against known cases

**Implementation:**
1. **Saha constant** CF(T, n_e)
2. **Single-element Saha** for H (analytical test)
3. **Multi-ionization** solver (Newton-Raphson)
4. **Charge conservation** enforcement
5. **Abundance scaling** from solar

**Test strategy:**
- **Hydrogen** at 10000K: Analytical Saha solution exists
- **Iron** at solar photosphere: Compare to ATLAS12 output (if Paula provides)
- **Charge conservation**: Σ j·n_i,j = n_e (within tolerance)
- **Convergence**: Should converge in <10 iterations

**Precision**: **MUST use Float64**
- exp(-χ/kT) spans 40+ orders of magnitude
- Critical for populations

**Lines of code**: ~400 implementation + 200 tests = 600 total

---

### Day 8-10: Partition Functions (~7 hours)
**Credit usage**: ~$28-35

**Deliverables:**
- `src/Atlas12/src/partition_functions.jl`
- `src/Atlas12/src/partition_data.jl` - NNN array (2190 lines)
- `test/atlas12/test_partition_functions.jl`

**Implementation:**
1. **Parse NNN data** (6×365 integers per element/ion)
2. **Low-lying levels**: U = Σ g_i · exp(-E_i/kT)
3. **High-Rydberg contribution**: Analytical formula
4. **Interpolation**: Log-linear in T
5. **All elements**: H through U (atomic numbers 1-92)

**Data source:**
- Extract from ATLAS12 lines 3168-3690
- Port DATA statements → Julia const arrays
- Or: Paula provides exported tables

**Test strategy:**
- **Hydrogen**: U_HI(5000K) ≈ 2.0, increases with T
- **Helium**: U_HeI(10000K) ≈ 1.0 (ground state only at low T)
- **Iron**: Compare to NIST partition function tables
- **Normalization**: U > 0 always

**Lines of code**: ~2500 (2000 data + 300 code + 200 tests)

---

## Week 3: Continuum Opacity & Broadening (Days 11-15)

### Day 11-12: Continuum Opacity Sources (~5 hours)
**Credit usage**: ~$20-25

**Deliverables:**
- `src/Atlas12/src/continuum_opacity.jl`
- `test/atlas12/test_continuum_opacity.jl`

**Functions:**
1. **H⁻ bound-free** (dominant in solar photosphere)
2. **H⁻ free-free**
3. **H I bound-free** (photoionization)
4. **H₂⁺ free-free**
5. **Thomson scattering** (electron)
6. **Rayleigh scattering** (H, He)

**Formulas:**
- Analytical fits from John (1988), Gray (2005)
- Photoionization cross-sections (Menzel & Pekeris)

**Test strategy:**
- **Solar photosphere**: τ=1, T=6400K, compare to literature
- **Opacity ratios**: H⁻ should dominate at 5000 Å
- **Wavelength dependence**: ν⁻³ for free-free

**Lines of code**: ~600 total

---

### Day 13-14: Broadening Kernels (~4 hours)
**Credit usage**: ~$16-20

**Deliverables:**
- `src/Synthe/src/broadening.jl`
- `test/synthe/test_broadening.jl`

**Functions:**
1. **Gaussian kernel** (instrumental profile)
   - G(v) = exp(-(v/σ)²)
   - FWHM parameter

2. **Sinc kernel** (FTS apodization)
   - S(x) = sin(x)/x × exp(-0.06x²)

3. **Rotational kernel** (discrete limb darkening)
   - Velocity grid calculation
   - Limb darkening weights
   - Disk integration

**Test strategy:**
- **Delta function**: Convolve δ(x) with G → should recover G
- **Gaussian FWHM**: Measure from output
- **Flux conservation**: ∫F(λ)dλ before = after
- **Rotation symmetry**: Symmetric line profile

**Lines of code**: ~500 total

---

### Day 15: Convolution Engine (~3 hours)
**Credit usage**: ~$12-15

**Deliverables:**
- `src/Synthe/src/convolution.jl`
- `test/synthe/test_convolution.jl`

**Implementation:**
- **Discrete convolution** (no FFT, pure Julia)
  - F_out[i] = Σ F_in[j] · K[i-j]
- **Wavelength grid handling** (logarithmic spacing)
- **Edge effects** (mirror padding or taper)

**Test strategy:**
- Delta function convolution
- Gaussian convolution (analytical result)
- Conservation of flux

**Lines of code**: ~300 total

---

## Week 4: Integration & Optimization (Days 16-20)

### Day 16-17: Radiative Transfer Basics (~5 hours)
**Credit usage**: ~$20-25

**Deliverables:**
- `src/Atlas12/src/radiative_transfer.jl` (basic RT equation)
- `test/atlas12/test_radiative_transfer.jl`

**Functions:**
1. **Formal solution** dI/dτ = I - S
2. **Source function** S = (1-ε)J + εB (LTE case)
3. **Emergent intensity** at μ angles
4. **Flux integration** F = ∫I(μ)·μ dμ

**Implementation:**
- Short characteristic method (simple)
- Or: Analytical solution for constant S

**Test strategy:**
- **Isothermal slab**: Analytical solution exists
- **Pure absorption**: I = S(1 - exp(-τ))
- **Eddington approximation**: J = (I_+ + I_-)/2

**Lines of code**: ~400 total

---

### Day 18-19: Performance Optimization (~4 hours)
**Credit usage**: ~$16-20

**Deliverables:**
- Profiled and optimized critical functions
- Performance benchmarks
- Documentation of optimization choices

**Focus areas:**
1. **Voigt profile**: Most called function
   - @inbounds for array access
   - Type stability verification
2. **Line opacity accumulation**: Inner loop optimization
3. **Partition functions**: Precomputation where possible

**Benchmarks:**
- Voigt: Target <100 ns per call
- Line opacity: Process 1M lines in <1 second
- Partition: <1 μs per evaluation

**Lines of code**: ~200 (optimization annotations + benchmarks)

---

### Day 20: Integration Testing & Documentation (~3 hours)
**Credit usage**: ~$12-15

**Deliverables:**
- End-to-end integration tests
- Updated documentation
- Performance report
- Coverage report

**Tests:**
1. **Full opacity calculation** at one depth point
2. **Mini-spectrum synthesis** (if atlas7v.so available)
3. **Consistency checks** across modules

**Documentation:**
- API reference for all public functions
- Physics equations documented
- Test coverage >90%

**Lines of code**: ~300 (tests + docs)

---

## Summary Statistics

### Total Deliverables

| Module | Functions | Lines Code | Lines Tests | Total |
|--------|-----------|------------|-------------|-------|
| Constants & Units | 15 | 150 | 100 | 250 |
| Physics Formulas | 10 | 200 | 150 | 350 |
| Voigt Profile | 4 | 500 | 200 | 700 |
| Line Opacity Utils | 8 | 200 | 100 | 300 |
| Saha Equation | 6 | 400 | 200 | 600 |
| Partition Functions | 12 | 2300 | 200 | 2500 |
| Continuum Opacity | 15 | 400 | 200 | 600 |
| Broadening | 8 | 400 | 100 | 500 |
| Convolution | 4 | 200 | 100 | 300 |
| Radiative Transfer | 6 | 300 | 100 | 400 |
| Optimization | - | 100 | 100 | 200 |
| Integration | - | 100 | 200 | 300 |
| **TOTAL** | **88** | **5,250** | **1,750** | **7,000** |

### Credit Usage Estimate

- **Week 1**: $63-75 (Foundation + Voigt)
- **Week 2**: $48-60 (Saha + Partitions)
- **Week 3**: $48-60 (Opacity + Broadening)
- **Week 4**: $48-60 (RT + Optimization)

**Total**: $207-255 estimated

**But with $68 budget**: Focus on Week 1 + selective Week 2 items

---

## Recommended $68 Credit Strategy

### Priority 1: Foundation (Days 1-5) - ~$60
Complete Week 1 entirely:
- ✅ Constants & units
- ✅ Physics formulas
- ✅ Voigt profile ⭐ (highest value)
- ✅ Line opacity utilities

**Outcome**: Core SYNTHE line opacity pipeline functional

### Priority 2: If Credit Remains (~$8)
Start Week 2:
- ⏸️ Saha equation (partial - H only for now)

### Priority 3: Document Handoff
Create detailed handoff for continuing locally:
- What's complete and tested
- What's started but needs finishing
- What test data would accelerate next phase

---

## Success Metrics

### Code Quality
- ✅ All functions have docstrings
- ✅ All functions have unit tests
- ✅ Test coverage >90%
- ✅ Type-stable (no type inference warnings)
- ✅ Zero allocations in hot loops (where possible)

### Physics Accuracy
- ✅ Voigt profile: <2% error vs Faddeeva
- ✅ Saha equation: Charge conservation <10⁻⁶
- ✅ Partition functions: <5% error vs NIST
- ✅ Continuum opacity: <10% error vs literature

### Performance
- ✅ Voigt: <100 ns per call
- ✅ Line opacity: >10⁶ lines/second
- ✅ Partition: <1 μs per element

---

## Risk Mitigation

### If No Test Data from Paula
**Fallback**: Use analytical test cases:
- Pure limits (Gaussian, Lorentzian)
- Symmetry tests
- Conservation laws
- Published benchmark values from papers

### If Voigt Tables Not Available
**Fallback**: Implement slower but accurate alternative:
- Humlíček (1982) complex probability function
- Pure Julia (no external packages)
- ~10× slower but still usable

### If Time Runs Short
**Priority order**:
1. Voigt profile (most critical)
2. Constants & conversions
3. Physics formulas
4. Everything else

---

## Handoff Protocol

**After each day:**
1. Commit all code + tests
2. Push to branch
3. Update HANDOFF_TO_PAULA.md with status
4. Document any blockers

**Final handoff:**
1. Complete test coverage report
2. Performance benchmarks
3. "What's next" roadmap for local continuation
4. Credit usage breakdown

---

**Let's start with Day 1 when you're ready!** 🚀
