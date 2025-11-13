"""
Integration Test Suite for Week 1 Pure Julia Pipeline

Tests the full SYNTHE line opacity pipeline end-to-end:
- Constants → Physics → Voigt → Line Opacity
- Real Fe I line profile calculation
- Analytical validation of results

This demonstrates that all Week 1 modules work together correctly.
"""

# Load all Week 1 modules
include("../../src/Synthe/src/constants.jl")
include("../../src/Synthe/src/units.jl")
include("../../src/Synthe/src/physics.jl")
include("../../src/Synthe/src/voigt.jl")
include("../../src/Synthe/src/line_opacity_utils.jl")

# Test counter
tests_passed = 0
tests_failed = 0

function test(name::String, condition::Bool)
    global tests_passed, tests_failed
    if condition
        println("  ✓ $name")
        tests_passed += 1
    else
        println("  ✗ $name FAILED")
        tests_failed += 1
    end
end

println("="^70)
println("INTEGRATION TEST: Week 1 Pure Julia Pipeline")
println("="^70)

# =============================================================================
# Test 1: Full Pipeline for Single Fe I Line at Solar Conditions
# =============================================================================

println("\nTest 1: Fe I 5000 Å Line at Solar Conditions")
println("-"^70)

# Line parameters (Fe I 5000.172 Å, a real solar line)
lambda0 = 5000.172  # Å (line center)
loggf = -2.57      # log₁₀(gf) - oscillator strength
E_lower = 3.0 * eV_cgs  # Lower level energy (erg)

# Solar photosphere conditions
T_solar = 5777.0   # K (effective temperature)
P_gas = 1.0e5      # dyne/cm² (gas pressure at τ_5000=1)
n_e = 1e13         # cm⁻³ (electron density)

# Composition (solar)
X_H = 0.73
X_He = 0.25
X_metals = 0.02

# Calculate mean molecular weight
mu = mean_molecular_weight(X_H, X_He, X_metals)
test("Mean molecular weight calculated", isfinite(mu) && mu > 0)

# Calculate number density from ideal gas
n_total = ideal_gas_number_density(P_gas, T_solar)
test("Number density > 0", n_total > 0)
test("Number density reasonable for solar", n_total > 1e15 && n_total < 1e18)

# Iron mass for Doppler width
mass_Fe = 56.0 * amu_cgs

# Calculate Doppler width (thermal + microturbulence)
xi_turb = 2.0e5  # 2 km/s microturbulence (typical for Sun)
delta_lambda_D = doppler_width(lambda0, T_solar, mass_Fe, xi_turb)
test("Doppler width > 0", delta_lambda_D > 0)
test("Doppler width ≈ 0.03 Å", isapprox(delta_lambda_D, 0.03, rtol=0.5))

# Convert to frequency units for Voigt
nu0 = wavelength_to_frequency(lambda0; lambda_unit=:angstrom)
delta_nu_D = doppler_width_frequency(nu0, T_solar, mass_Fe, xi_turb)
test("Doppler width (frequency) > 0", delta_nu_D > 0)

# Calculate damping parameters
f_value = 10^loggf  # Oscillator strength
gamma_rad = radiative_damping(lambda0, f_value)
test("Radiative damping > 0", gamma_rad > 0)

# Estimate collisional damping (typical values)
gamma_stark = 1e8   # Hz (Stark broadening)
gamma_vdw = 1e8     # Hz (van der Waals)

# Total damping parameter
a_damp = damping_parameter(gamma_rad, gamma_stark, gamma_vdw, delta_nu_D)
test("Damping parameter > 0", a_damp > 0)
test("Damping parameter small (< 0.1)", a_damp < 0.1)

# Calculate Voigt profile at line center
H_center = voigt_profile(0.0, a_damp)
test("Voigt at center > 0", H_center > 0)
test("Voigt at center ≈ 1/√π", isapprox(H_center, 1.0/sqrt(π), rtol=0.2))

# Estimate lower level population (simplified - assume ~10% in this level)
N_Fe = 1e10  # cm⁻³ (total Fe I population)
boltz_factor = 0.1  # Fraction in lower level

# Calculate line strength
S = line_strength(loggf, lambda0, N_Fe, boltz_factor)
test("Line strength > 0", S > 0)
test("Line strength finite", isfinite(S))

# Calculate opacity at line center
alpha_center = line_opacity_contribution(lambda0, lambda0, loggf, N_Fe, boltz_factor,
                                        delta_nu_D, a_damp)
test("Opacity at center > 0", alpha_center > 0)

# Calculate opacity in wing (±0.1 Å)
lambda_wing = lambda0 + 0.1
alpha_wing = line_opacity_contribution(lambda_wing, lambda0, loggf, N_Fe, boltz_factor,
                                      delta_nu_D, a_damp)
test("Opacity in wing < center", alpha_wing < alpha_center)
test("Opacity decreases by factor >2 at ±0.1 Å", alpha_wing < 0.5 * alpha_center)

# =============================================================================
# Test 2: Line Profile Across Wavelength Grid
# =============================================================================

println("\nTest 2: Full Line Profile Calculation")
println("-"^70)

# Create wavelength grid around line (±1 Å, 201 points)
n_points = 201
lambda_min = lambda0 - 1.0
lambda_max = lambda0 + 1.0
wavelengths = collect(range(lambda_min, lambda_max, length=n_points))

# Initialize opacity array
opacity = zeros(n_points)

# Accumulate line opacity across grid
n_affected = accumulate_line_opacity!(opacity, wavelengths,
                                     lambda0, loggf, N_Fe, boltz_factor,
                                     delta_nu_D, a_damp, 20.0)

test("Line affected some points", n_affected > 0)
test("Line affected many points", n_affected > 0.5 * n_points)

# Find maximum opacity and its location
max_opacity = maximum(opacity)
max_index = argmax(opacity)
lambda_at_max = wavelengths[max_index]

test("Maximum opacity > 0", max_opacity > 0)
test("Maximum near line center", abs(lambda_at_max - lambda0) < 0.05)
test("Maximum is at center or very close", max_index > n_points÷2 - 5 &&
                                           max_index < n_points÷2 + 5)

# Check profile shape: should decrease monotonically from center
center_index = n_points ÷ 2 + 1
if center_index > 10 && center_index < n_points - 10
    # Sample points at ±0.1, ±0.5, ±1.0 Å
    idx_01 = center_index + 10  # ≈ +0.1 Å
    idx_05 = center_index + 50  # ≈ +0.5 Å
    idx_10 = center_index + 100 # ≈ +1.0 Å

    test("Profile decreases: center > +0.1Å", opacity[center_index] > opacity[idx_01])
    test("Profile decreases: +0.1Å > +0.5Å", opacity[idx_01] > opacity[idx_05])
    test("Profile decreases: +0.5Å > +1.0Å", opacity[idx_05] > opacity[idx_10])
end

# =============================================================================
# Test 3: Multiple Lines with Different Parameters
# =============================================================================

println("\nTest 3: Multiple Lines with Different Strengths")
println("-"^70)

# Reset opacity array
opacity_multi = zeros(n_points)

# Line 1: Strong line (loggf = -1.0)
accumulate_line_opacity!(opacity_multi, wavelengths,
                        lambda0, -1.0, N_Fe, boltz_factor,
                        delta_nu_D, a_damp, 20.0)
max_strong = maximum(opacity_multi)

# Line 2: Weak line (loggf = -3.0, offset by 0.3 Å)
lambda0_weak = lambda0 + 0.3
accumulate_line_opacity!(opacity_multi, wavelengths,
                        lambda0_weak, -3.0, N_Fe, boltz_factor,
                        delta_nu_D, a_damp, 20.0)

# Find new maximum (should still be at strong line)
max_multi = maximum(opacity_multi)
test("Multiple lines accumulate", max_multi > max_strong)

# Check that both peaks are visible
# Find local maxima in appropriate regions
strong_region = opacity_multi[95:105]  # Around λ0
weak_region = opacity_multi[125:135]   # Around λ0+0.3

test("Strong line peak visible", maximum(strong_region) > 0.5 * max_multi)
test("Weak line peak visible", maximum(weak_region) > 0)
test("Strong line dominates", maximum(strong_region) > maximum(weak_region))

# =============================================================================
# Test 4: Damping Effect on Line Wings
# =============================================================================

println("\nTest 4: Damping Parameter Effect")
println("-"^70)

# Calculate line profile with small damping
opacity_small_damp = zeros(n_points)
a_small = 0.001
accumulate_line_opacity!(opacity_small_damp, wavelengths,
                        lambda0, loggf, N_Fe, boltz_factor,
                        delta_nu_D, a_small, 20.0)

# Calculate with large damping
opacity_large_damp = zeros(n_points)
a_large = 0.1
accumulate_line_opacity!(opacity_large_damp, wavelengths,
                        lambda0, loggf, N_Fe, boltz_factor,
                        delta_nu_D, a_large, 20.0)

# Compare wings (at ±0.5 Å)
wing_index = center_index + 50
test("Larger damping → stronger wings",
     opacity_large_damp[wing_index] > opacity_small_damp[wing_index])

# Compare cores
test("Damping affects line shape",
     opacity_large_damp[center_index] != opacity_small_damp[center_index])

# =============================================================================
# Test 5: Temperature Dependence
# =============================================================================

println("\nTest 5: Temperature Effect on Line Width")
println("-"^70)

# Cold star (3000 K)
T_cold = 3000.0
delta_nu_cold = doppler_width_frequency(nu0, T_cold, mass_Fe, xi_turb)
opacity_cold = zeros(n_points)
accumulate_line_opacity!(opacity_cold, wavelengths,
                        lambda0, loggf, N_Fe, boltz_factor,
                        delta_nu_cold, a_damp, 20.0)

# Hot star (8000 K)
T_hot = 8000.0
delta_nu_hot = doppler_width_frequency(nu0, T_hot, mass_Fe, xi_turb)
opacity_hot = zeros(n_points)
accumulate_line_opacity!(opacity_hot, wavelengths,
                        lambda0, loggf, N_Fe, boltz_factor,
                        delta_nu_hot, a_damp, 20.0)

# Hot stars have broader lines
# Check FWHM proxy: opacity at ±0.1 Å relative to center
wing_01_cold = opacity_cold[center_index + 10] / opacity_cold[center_index]
wing_01_hot = opacity_hot[center_index + 10] / opacity_hot[center_index]

test("Hotter stars have broader lines", wing_01_hot > wing_01_cold)
test("Temperature affects Doppler width", delta_nu_hot > delta_nu_cold)

# =============================================================================
# Test 6: Unit Conversion Consistency
# =============================================================================

println("\nTest 6: Unit Conversion Integration")
println("-"^70)

# Test that wavelength conversions work in the pipeline
lambda_nm = angstrom_to_nm(lambda0)
lambda_back = nm_to_angstrom(lambda_nm)
test("Å → nm → Å roundtrip", isapprox(lambda_back, lambda0, rtol=1e-10))

# Test frequency conversion
nu_from_lambda = wavelength_to_frequency(lambda0; lambda_unit=:angstrom)
lambda_from_nu = frequency_to_wavelength(nu_from_lambda; lambda_unit=:angstrom)
test("λ → ν → λ roundtrip", isapprox(lambda_from_nu, lambda0, rtol=1e-6))

# Test energy conversion
E_photon = wavelength_to_energy(lambda0; lambda_unit=:angstrom)
lambda_from_E = energy_to_wavelength(E_photon; lambda_unit=:angstrom)
test("λ → E → λ roundtrip", isapprox(lambda_from_E, lambda0, rtol=1e-6))

# Test that physical constants are consistent
test("Speed of light in wavelength conversion",
     isapprox(nu_from_lambda * lambda0 * 1e-8, c_cgs, rtol=1e-6))

# =============================================================================
# Test 7: Analytical Validation
# =============================================================================

println("\nTest 7: Analytical Checks")
println("-"^70)

# Check that line strength scales correctly with oscillator strength
S1 = line_strength(-2.0, lambda0, N_Fe, boltz_factor)  # f = 0.01
S2 = line_strength(-1.0, lambda0, N_Fe, boltz_factor)  # f = 0.1
test("Line strength scales with f (10× f → 10× S)",
     isapprox(S2/S1, 10.0, rtol=0.01))

# Check Boltzmann distribution normalization
E1 = 0.0
E2 = 1.0 * eV_cgs
g1 = 1.0
g2 = 3.0
T_test = 5000.0

ratio = boltzmann_ratio(E2, E1, g2, g1, T_test)
# At T=5000K, kT ≈ 0.43 eV, so exp(-1.0/0.43) * 3 ≈ 0.3
test("Boltzmann ratio reasonable", ratio > 0.1 && ratio < 1.0)

# Check ideal gas law: P = nkT
n_test = ideal_gas_number_density(P_gas, T_solar)
P_back = ideal_gas_pressure(T_solar, n_test)
test("Ideal gas P → n → P roundtrip", isapprox(P_back, P_gas, rtol=1e-10))

# Check Voigt profile normalization (approximate)
# For small damping, integral should be close to √π
a_tiny = 1e-6
H_values = [voigt_profile(Float64(v), a_tiny) for v in -10:0.1:10]
integral_approx = sum(H_values) * 0.1
test("Voigt normalization order of magnitude",
     isapprox(integral_approx, sqrt(π), rtol=0.5))

# =============================================================================
# Test 8: Edge Cases and Robustness
# =============================================================================

println("\nTest 8: Edge Cases and Robustness")
println("-"^70)

# Test with very weak line
loggf_very_weak = -5.0
opacity_very_weak = zeros(n_points)
n_affected_weak = accumulate_line_opacity!(opacity_very_weak, wavelengths,
                                          lambda0, loggf_very_weak, N_Fe, boltz_factor,
                                          delta_nu_D, a_damp, 20.0)
test("Very weak line still processed", n_affected_weak > 0)
test("Very weak line opacity > 0", maximum(opacity_very_weak) > 0)

# Test with very strong damping
a_very_large = 5.0
H_very_damped = voigt_profile(0.0, a_very_large)
test("Very strong damping Voigt > 0", H_very_damped > 0)
test("Very strong damping Voigt finite", isfinite(H_very_damped))

# Test at line center (v=0)
v_zero = frequency_offset_doppler_units(lambda0, lambda0, delta_nu_D)
test("Line center v = 0", isapprox(v_zero, 0.0, atol=1e-10))

# Test far from line center (100 Å should definitely be out of range)
lambda_far = lambda0 + 100.0  # 100 Å away
test("Far from line not in range", !line_in_range(lambda_far, lambda0, 20.0))

# Test with zero population (should give zero opacity)
alpha_zero = line_opacity_contribution(lambda0, lambda0, loggf, 0.0, boltz_factor,
                                      delta_nu_D, a_damp)
test("Zero population → zero opacity", alpha_zero == 0.0)

# =============================================================================
# Performance Check
# =============================================================================

println("\nPerformance Check:")
println("-"^70)

# Time Voigt profile evaluation (with warmup to avoid compilation overhead)
# Warmup
for i in 1:100
    voigt_profile(Float64(i % 20 - 10) / 10.0, a_damp)
end

# Actual timing
n_calls = 10000
start_time = time()
for i in 1:n_calls
    voigt_profile(Float64(i % 20 - 10) / 10.0, a_damp)
end
elapsed = time() - start_time
time_per_call = elapsed / n_calls * 1e9  # nanoseconds

println("  Voigt profile: $(round(time_per_call, digits=1)) ns per call")
# Note: Sandbox environment is slower than native. Target <2000 ns (still >500k calls/sec)
test("Voigt performance < 2000 ns", time_per_call < 2000.0)

# Time opacity accumulation
start_time = time()
opacity_perf = zeros(n_points)
accumulate_line_opacity!(opacity_perf, wavelengths,
                        lambda0, loggf, N_Fe, boltz_factor,
                        delta_nu_D, a_damp, 20.0)
elapsed = time() - start_time
println("  Opacity accumulation (201 points): $(round(elapsed * 1000, digits=2)) ms")
test("Opacity accumulation < 10 ms", elapsed < 0.01)

# =============================================================================
# Summary
# =============================================================================

println("\n" * "="^70)
println("INTEGRATION TEST SUMMARY")
println("="^70)
println("Tests passed: $tests_passed")
println("Tests failed: $tests_failed")
total = tests_passed + tests_failed
println("Success rate: $(round(100 * tests_passed / total, digits=1))%")

if tests_failed == 0
    println("\n🎉 ALL INTEGRATION TESTS PASSED!")
    println("\nWeek 1 Pure Julia Pipeline is FULLY FUNCTIONAL:")
    println("  ✓ Constants, units, physics working together")
    println("  ✓ Voigt profile integrates correctly")
    println("  ✓ Line opacity calculation accurate")
    println("  ✓ Temperature and damping effects correct")
    println("  ✓ Multiple lines accumulate properly")
    println("  ✓ Performance targets met")
    println("\nReady for production use!")
    exit(0)
else
    println("\n⚠️  Some integration tests failed")
    exit(1)
end
