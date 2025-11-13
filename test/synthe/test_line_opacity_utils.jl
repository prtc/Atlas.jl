"""
Test suite for line opacity utility functions

Tests line center calculations, frequency offsets, line strengths,
opacity accumulation, and thresholding logic.
"""

# Load the line opacity utilities module
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
println("Testing Line Opacity Utilities")
println("="^70)

# =============================================================================
# Test Line Center Wavelength Calculations
# =============================================================================

println("\nLine Center Wavelength:")

# Test with known transition: Hydrogen Lyman alpha
# E_lower = 0 (ground state)
# E_upper = 10.2 eV = Rydberg × (1 - 1/4)
E_lower = 0.0
E_upper = 10.2 * eV_cgs  # erg
lambda_lya = line_center_wavelength(E_lower, E_upper)

# Expected: ~1215-1216 Å
test("Lyman alpha wavelength ≈ 1215 Å", isapprox(lambda_lya, 1215.0, rtol=0.01))

# Test with wavenumber (Lyman alpha: χ_upper = 82259 cm⁻¹)
chi_lower = 0.0
chi_upper = 82259.0  # cm⁻¹
lambda_lya_wn = line_center_wavelength_wavenumber(chi_lower, chi_upper)
test("Lyman alpha from wavenumber ≈ 1215 Å",
     isapprox(lambda_lya_wn, 1215.67, rtol=0.001))

# Test energy and wavenumber methods agree
E_upper_wn = h_cgs * c_cgs * chi_upper
lambda_from_E = line_center_wavelength(0.0, E_upper_wn)
test("Energy ↔ wavenumber methods agree",
     isapprox(lambda_from_E, lambda_lya_wn, rtol=1e-6))

# Test solar line: Fe I at 5000 Å
# Approximate energy levels
E_lower_Fe = 3.0 * eV_cgs
E_upper_Fe = 5.48 * eV_cgs  # 3.0 + 2.48 eV = 5000 Å photon
lambda_Fe = line_center_wavelength(E_lower_Fe, E_upper_Fe)
test("Fe I line ≈ 5000 Å", isapprox(lambda_Fe, 5000.0, rtol=0.01))

# =============================================================================
# Test Frequency Offset Calculations
# =============================================================================

println("\nFrequency Offset in Doppler Units:")

# Test at line center
lambda = 5000.0  # Å
lambda0 = 5000.0  # Å
delta_nu_D = 3e9  # Hz (typical Doppler width)
v_center = frequency_offset_doppler_units(lambda, lambda0, delta_nu_D)
test("Line center offset = 0", isapprox(v_center, 0.0, atol=1e-10))

# Test offset by 0.1 Å (typical line wing)
# Note: λ > λ₀ → lower frequency → negative v (red side)
lambda_offset = 5000.1  # Å
v_offset = frequency_offset_doppler_units(lambda_offset, lambda0, delta_nu_D)
test("0.1 Å offset gives negative v (red side)", v_offset < 0.0)
test("0.1 Å offset reasonable magnitude", abs(v_offset) < 10.0)

# Test symmetry: +Δλ and -Δλ give opposite v
# Note: Small asymmetry (<0.1%) due to approximate formula (λ₀-λ)/(λλ₀)
lambda_plus = 5000.1  # Å
lambda_minus = 4999.9  # Å
v_plus = frequency_offset_doppler_units(lambda_plus, lambda0, delta_nu_D)
v_minus = frequency_offset_doppler_units(lambda_minus, lambda0, delta_nu_D)
test("Frequency offset symmetric", isapprox(v_plus, -v_minus, rtol=1e-3))

# Test large offset (far wing)
lambda_far = 5010.0  # 10 Å from center
v_far = frequency_offset_doppler_units(lambda_far, lambda0, delta_nu_D)
test("Large offset v > 10", abs(v_far) > 10.0)

# =============================================================================
# Test Line Strength Calculations
# =============================================================================

println("\nLine Strength:")

# Test with known parameters
loggf = -1.0  # log(gf) = -1 → f = 0.1
lambda0_test = 5000.0  # Å
N_lower = 1e10  # cm⁻³
boltz = 0.5  # population fraction

S = line_strength(loggf, lambda0_test, N_lower, boltz)
test("Line strength > 0", S > 0.0)
test("Line strength finite", isfinite(S))

# Test scaling with f: double loggf should ~10× strength (since f = 10^loggf)
loggf_strong = 0.0  # f = 1.0 (10× stronger)
S_strong = line_strength(loggf_strong, lambda0_test, N_lower, boltz)
test("Stronger line (10× f) → 10× strength", isapprox(S_strong / S, 10.0, rtol=0.01))

# Test scaling with population: double N_lower → double strength
N_double = 2e10  # cm⁻³
S_double = line_strength(loggf, lambda0_test, N_double, boltz)
test("Double population → double strength", isapprox(S_double / S, 2.0, rtol=1e-10))

# Test scaling with wavelength: S ∝ λ²
lambda0_double = 10000.0  # 2× wavelength
S_wavelength = line_strength(loggf, lambda0_double, N_lower, boltz)
test("Double wavelength → 4× strength (λ² dependence)",
     isapprox(S_wavelength / S, 4.0, rtol=0.01))

# =============================================================================
# Test Line Opacity Contribution
# =============================================================================

println("\nLine Opacity Contribution:")

# Test at line center (maximum opacity)
lambda_test = 5000.0  # Å
lambda0_test = 5000.0  # Å
loggf_test = -1.0
N_test = 1e10  # cm⁻³
boltz_test = 0.5
delta_nu_test = 3e9  # Hz
a_test = 0.01

alpha_center = line_opacity_contribution(lambda_test, lambda0_test, loggf_test,
                                        N_test, boltz_test, delta_nu_test, a_test)
test("Opacity at center > 0", alpha_center > 0.0)

# Test in wing (should be smaller)
lambda_wing = 5001.0  # 1 Å from center
alpha_wing = line_opacity_contribution(lambda_wing, lambda0_test, loggf_test,
                                      N_test, boltz_test, delta_nu_test, a_test)
test("Opacity in wing < center", alpha_wing < alpha_center)

# Test far wing (should be much smaller)
lambda_far_wing = 5010.0  # 10 Å from center
alpha_far = line_opacity_contribution(lambda_far_wing, lambda0_test, loggf_test,
                                     N_test, boltz_test, delta_nu_test, a_test)
test("Opacity far wing << center", alpha_far < 0.01 * alpha_center)

# Test symmetry: +Δλ and -Δλ give same opacity
# Note: Small asymmetry (<0.1%) due to wavelength-dependent formula
lambda_plus_test = 5000.5  # Å
lambda_minus_test = 4999.5  # Å
alpha_plus = line_opacity_contribution(lambda_plus_test, lambda0_test, loggf_test,
                                      N_test, boltz_test, delta_nu_test, a_test)
alpha_minus = line_opacity_contribution(lambda_minus_test, lambda0_test, loggf_test,
                                       N_test, boltz_test, delta_nu_test, a_test)
test("Opacity symmetric around center", isapprox(alpha_plus, alpha_minus, rtol=1e-3))

# =============================================================================
# Test Significance Threshold
# =============================================================================

println("\nSignificance Threshold:")

# Test default threshold (v_max = 20)
threshold_default = significance_threshold()
test("Default threshold > 0", threshold_default > 0.0)
test("Default threshold reasonable", threshold_default > 1e-5 && threshold_default < 1e-2)

# Test custom threshold
threshold_large = significance_threshold(50.0)
test("Larger v_max → larger threshold", threshold_large > threshold_default)

# Test threshold scales linearly with v_max
threshold_double = significance_threshold(40.0)
test("Threshold scales with v_max", isapprox(threshold_double / threshold_default, 2.0, rtol=0.01))

# =============================================================================
# Test Line in Range
# =============================================================================

println("\nLine in Range Check:")

# Test nearby line (should be in range)
lambda_check = 5000.0  # Å
lambda0_nearby = 5000.5  # 0.5 Å away
test("Nearby line in range", line_in_range(lambda_check, lambda0_nearby))

# Test line at center (always in range)
test("Center always in range", line_in_range(lambda_check, lambda_check))

# Test far line (should be out of range)
lambda0_far_test = 5100.0  # 100 Å away
test("Far line out of range", !line_in_range(lambda_check, lambda0_far_test))

# Test boundary case
v_max_test = 20.0
threshold_test = significance_threshold(v_max_test)
lambda0_boundary = lambda_check * (1.0 + threshold_test * 0.9)  # Just inside
test("Boundary line in range", line_in_range(lambda_check, lambda0_boundary, v_max_test))

lambda0_just_outside = lambda_check * (1.0 + threshold_test * 1.1)  # Just outside
test("Just outside boundary out of range",
     !line_in_range(lambda_check, lambda0_just_outside, v_max_test))

# =============================================================================
# Test Opacity Accumulation
# =============================================================================

println("\nOpacity Accumulation:")

# Create test wavelength grid
n_points = 100
wavelengths = collect(range(4990.0, 5010.0, length=n_points))
opacity_init = zeros(n_points)

# Add single line at 5000 Å
lambda0_line = 5000.0
n_affected = accumulate_line_opacity!(opacity_init, wavelengths,
                                     lambda0_line, -1.0, 1e10, 0.5,
                                     3e9, 0.01, 20.0)

test("Accumulation affected some points", n_affected > 0)
test("Accumulation affected < all points", n_affected < n_points)

# Find maximum opacity (should be near line center)
max_opacity = maximum(opacity_init)
max_index = argmax(opacity_init)
test("Maximum opacity > 0", max_opacity > 0.0)

# Wavelength at maximum should be near line center
lambda_at_max = wavelengths[max_index]
test("Maximum near line center", abs(lambda_at_max - lambda0_line) < 1.0)

# Test opacity decreases away from center
if max_index > 1 && max_index < n_points
    opacity_before = opacity_init[max_index - 1]
    opacity_after = opacity_init[max_index + 1]
    test("Opacity decreases from center", opacity_before < max_opacity &&
                                          opacity_after < max_opacity)
end

# Test accumulation is additive (add second line)
opacity_two_lines = copy(opacity_init)
lambda0_second = 5005.0  # 5 Å away
n_affected2 = accumulate_line_opacity!(opacity_two_lines, wavelengths,
                                      lambda0_second, -1.5, 5e9, 0.5,
                                      3e9, 0.01, 20.0)

test("Second line adds opacity", maximum(opacity_two_lines) > max_opacity)

# =============================================================================
# Test Opacity Ratio
# =============================================================================

println("\nOpacity Ratio:")

# Test normal case
alpha_line_test = 1.0  # cm⁻¹
alpha_cont_test = 0.5  # cm⁻¹
ratio = opacity_ratio(alpha_line_test, alpha_cont_test)
test("Opacity ratio = 2.0", isapprox(ratio, 2.0, rtol=1e-10))

# Test weak line
alpha_weak = 0.01
ratio_weak = opacity_ratio(alpha_weak, alpha_cont_test)
test("Weak line → small ratio", ratio_weak < 0.1)

# Test strong line
alpha_strong = 10.0
ratio_strong = opacity_ratio(alpha_strong, alpha_cont_test)
test("Strong line → large ratio", ratio_strong > 10.0)

# Test zero continuum (undefined)
ratio_inf = opacity_ratio(alpha_line_test, 0.0)
test("Zero continuum → infinite ratio", isinf(ratio_inf))

# =============================================================================
# Test Equivalent Width (Optically Thin)
# =============================================================================

println("\nEquivalent Width (Optically Thin):")

# Test with typical parameters
S_test = 1e-10  # cm⁻¹ per Doppler width
delta_nu_ew = 3e9  # Hz
a_ew = 0.01

W = equivalent_width_optically_thin(S_test, delta_nu_ew, a_ew)
test("Equivalent width > 0", W > 0.0)
# Note: This is a simplified formula, so order of magnitude is approximate
test("Equivalent width finite and positive", W > 0.0 && isfinite(W))

# Test scaling with line strength: double S → double W
S_double_test = 2.0 * S_test
W_double = equivalent_width_optically_thin(S_double_test, delta_nu_ew, a_ew)
test("Double strength → double EW", isapprox(W_double / W, 2.0, rtol=0.01))

# Test dependence on damping
a_larger = 0.1
W_damped = equivalent_width_optically_thin(S_test, delta_nu_ew, a_larger)
# Larger damping → broader line → different EW (not simple scaling)
test("Damping affects EW", W_damped != W)

# =============================================================================
# Test Consistency Across Functions
# =============================================================================

println("\nConsistency Tests:")

# Test: line_opacity_contribution should match line_strength × voigt_profile
lambda_cons = 5000.5
lambda0_cons = 5000.0
loggf_cons = -1.0
N_cons = 1e10
boltz_cons = 0.5
delta_nu_cons = 3e9
a_cons = 0.01

# Calculate via line_opacity_contribution
alpha_direct = line_opacity_contribution(lambda_cons, lambda0_cons, loggf_cons,
                                        N_cons, boltz_cons, delta_nu_cons, a_cons)

# Calculate manually
S_manual = line_strength(loggf_cons, lambda0_cons, N_cons, boltz_cons)
v_manual = frequency_offset_doppler_units(lambda_cons, lambda0_cons, delta_nu_cons)
H_manual = voigt_profile(v_manual, a_cons)
alpha_manual = S_manual * H_manual

test("Direct vs manual opacity calculation consistent",
     isapprox(alpha_direct, alpha_manual, rtol=1e-10))

# Test: accumulate_line_opacity! should give same result as direct calculation
wavelengths_single = [lambda_cons]
opacity_accum = zeros(1)
accumulate_line_opacity!(opacity_accum, wavelengths_single,
                        lambda0_cons, loggf_cons, N_cons, boltz_cons,
                        delta_nu_cons, a_cons, 20.0)

test("Accumulated vs direct opacity consistent",
     isapprox(opacity_accum[1], alpha_direct, rtol=1e-10))

# Test: frequency_offset should be approximately symmetric
# Note: Small asymmetry due to approximate formula
v_forward = frequency_offset_doppler_units(5001.0, 5000.0, delta_nu_cons)
v_backward = frequency_offset_doppler_units(4999.0, 5000.0, delta_nu_cons)
test("Frequency offset symmetry", isapprox(v_forward, -v_backward, rtol=1e-3))

# =============================================================================
# Summary
# =============================================================================

println("\n" * "="^70)
println("SUMMARY")
println("="^70)
println("Tests passed: $tests_passed")
println("Tests failed: $tests_failed")
println("Success rate: $(round(100 * tests_passed / (tests_passed + tests_failed), digits=1))%")

if tests_failed == 0
    println("\n🎉 ALL LINE OPACITY UTILITY TESTS PASSED!")
    exit(0)
else
    println("\n⚠️  Some tests failed")
    exit(1)
end
