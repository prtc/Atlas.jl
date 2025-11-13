"""
Test suite for unit conversions

Tests all wavelength, frequency, energy, and Doppler conversions
with round-trip validation
"""

# Load the units module
include("../../src/Synthe/src/units.jl")

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
println("Testing Unit Conversions")
println("="^70)

# =============================================================================
# Test Wavelength Unit Conversions
# =============================================================================

println("\nWavelength Unit Conversions:")

# Test Angstrom ↔ nanometer
lambda_angstrom = 5000.0  # Å
lambda_nm = angstrom_to_nm(lambda_angstrom)
test("5000 Å = 500 nm", isapprox(lambda_nm, 500.0, rtol=1e-10))

# Round-trip test
lambda_back = nm_to_angstrom(lambda_nm)
test("Å → nm → Å round-trip", isapprox(lambda_back, lambda_angstrom, rtol=1e-10))

# Test Angstrom ↔ centimeter
lambda_cm = angstrom_to_cm(lambda_angstrom)
test("5000 Å = 5e-5 cm", isapprox(lambda_cm, 5.0e-5, rtol=1e-10))

lambda_back = cm_to_angstrom(lambda_cm)
test("Å → cm → Å round-trip", isapprox(lambda_back, lambda_angstrom, rtol=1e-10))

# Test Angstrom ↔ micron
lambda_micron = angstrom_to_micron(lambda_angstrom)
test("5000 Å = 0.5 μm", isapprox(lambda_micron, 0.5, rtol=1e-10))

lambda_back = micron_to_angstrom(lambda_micron)
test("Å → μm → Å round-trip", isapprox(lambda_back, lambda_angstrom, rtol=1e-10))

# =============================================================================
# Test Wavelength ↔ Frequency Conversions
# =============================================================================

println("\nWavelength ↔ Frequency Conversions:")

# Test wavelength to frequency
lambda = 5000.0  # Å
nu = wavelength_to_frequency(lambda, lambda_unit=:angstrom)
nu_expected = c_cgs / (lambda * 1.0e-8)  # Hz
test("λ → ν conversion", isapprox(nu, nu_expected, rtol=1e-10))

# Frequency should be ~6e14 Hz for 5000 Å
test("5000 Å ≈ 6e14 Hz", isapprox(nu, 6.0e14, rtol=0.1))

# Round-trip test
lambda_back = frequency_to_wavelength(nu, lambda_unit=:angstrom)
test("λ → ν → λ round-trip", isapprox(lambda_back, lambda, rtol=1e-10))

# Test with different units
nu_from_nm = wavelength_to_frequency(500.0, lambda_unit=:nm)
test("500 nm → same frequency as 5000 Å", isapprox(nu_from_nm, nu, rtol=1e-10))

nu_from_micron = wavelength_to_frequency(0.5, lambda_unit=:micron)
test("0.5 μm → same frequency as 5000 Å", isapprox(nu_from_micron, nu, rtol=1e-10))

# =============================================================================
# Test Energy Conversions
# =============================================================================

println("\nEnergy Conversions:")

# Test wavelength to energy
E = wavelength_to_energy(5000.0, lambda_unit=:angstrom)
E_expected = h_cgs * c_cgs / (5000.0 * 1.0e-8)  # erg
test("λ → E conversion", isapprox(E, E_expected, rtol=1e-10))

# Energy should be ~2.48 eV for 5000 Å
E_eV = erg_to_eV(E)
test("5000 Å ≈ 2.48 eV", isapprox(E_eV, 2.48, rtol=0.01))

# Round-trip test
lambda_back = energy_to_wavelength(E, lambda_unit=:angstrom)
test("λ → E → λ round-trip", isapprox(lambda_back, 5000.0, rtol=1e-10))

# Test eV ↔ erg conversions
energy_eV = 13.6  # Rydberg energy
energy_erg = eV_to_erg(energy_eV)
test("eV → erg conversion", isapprox(energy_erg, 13.6 * eV_cgs, rtol=1e-10))

energy_back = erg_to_eV(energy_erg)
test("eV → erg → eV round-trip", isapprox(energy_back, energy_eV, rtol=1e-10))

# =============================================================================
# Test Air ↔ Vacuum Wavelength Conversions (Edlén 1953)
# =============================================================================

println("\nAir ↔ Vacuum Wavelength Conversions:")

# Test air to vacuum conversion
lambda_air = 5000.0  # Å
lambda_vac = air_to_vacuum_wavelength(lambda_air)

# Vacuum wavelength should be slightly longer (n_air ≈ 1.00028)
test("λ_vac > λ_air", lambda_vac > lambda_air)
test("Refractive index ≈ 1.00028", isapprox(lambda_vac/lambda_air, 1.00028, rtol=1e-4))

# Round-trip test
lambda_air_back = vacuum_to_air_wavelength(lambda_vac)
test("Air → vacuum → air round-trip", isapprox(lambda_air_back, lambda_air, rtol=1e-5))

# Test multiple wavelengths
for lambda_test in [3000.0, 5000.0, 7000.0, 10000.0]
    lambda_v = air_to_vacuum_wavelength(lambda_test)
    lambda_a = vacuum_to_air_wavelength(lambda_v)
    test("Round-trip at $lambda_test Å", isapprox(lambda_a, lambda_test, rtol=1e-5))
end

# Test known calibration line: Hα
# Vacuum: 6562.79 Å, Air: 6562.80 Å (literature values)
H_alpha_air = 6562.80
H_alpha_vac = air_to_vacuum_wavelength(H_alpha_air)
test("Hα air → vacuum ≈ 6564.6 Å", isapprox(H_alpha_vac, 6564.6, rtol=1e-3))

# =============================================================================
# Test Doppler Shift Conversions
# =============================================================================

println("\nDoppler Shift Conversions:")

# Test Doppler shift for known velocity
lambda0 = 5000.0  # Å rest wavelength
v_radial = 3.0e6  # 30 km/s in cm/s (1 km/s = 1e5 cm/s)

lambda_obs = doppler_shift_wavelength(lambda0, v_radial)

# Expected shift: Δλ/λ = v/c
delta_lambda_expected = lambda0 * (v_radial / c_cgs)
test("Doppler shift magnitude", isapprox(lambda_obs - lambda0, delta_lambda_expected, rtol=1e-10))

# For v = 30 km/s, shift should be ~0.5 Å
test("30 km/s → ~0.5 Å shift", isapprox(lambda_obs - lambda0, 0.5, rtol=0.1))

# Round-trip test
v_back = doppler_velocity_from_wavelength(lambda0, lambda_obs)
test("λ₀, λ_obs → v round-trip", isapprox(v_back, v_radial, rtol=1e-10))

# Test velocity unit conversions
v_kms = velocity_to_kms(v_radial)
test("3e6 cm/s = 30 km/s", isapprox(v_kms, 30.0, rtol=1e-10))

v_back_cgs = kms_to_velocity(v_kms)
test("km/s → cm/s → km/s round-trip", isapprox(v_back_cgs, v_radial, rtol=1e-10))

# Test zero velocity (no shift)
lambda_zero = doppler_shift_wavelength(lambda0, 0.0)
test("Zero velocity → no shift", isapprox(lambda_zero, lambda0, rtol=1e-10))

# Test negative velocity (approaching)
v_approach = -3.0e6  # -30 km/s (blueshift)
lambda_blue = doppler_shift_wavelength(lambda0, v_approach)
test("Approaching → blueshift", lambda_blue < lambda0)
test("Symmetric red/blueshift", isapprox(lambda0 - lambda_blue, lambda_obs - lambda0, rtol=1e-10))

# =============================================================================
# Test Multiple Conversion Chains
# =============================================================================

println("\nMultiple Conversion Chains:")

# Test Å → nm → cm → Å
lambda_start = 5000.0
chain1 = lambda_start |> angstrom_to_nm |> x -> angstrom_to_cm(nm_to_angstrom(x)) |> cm_to_angstrom
test("Å → nm → cm → Å chain", isapprox(chain1, lambda_start, rtol=1e-10))

# Test Å → frequency → energy → wavelength
lambda_start = 5000.0
nu = wavelength_to_frequency(lambda_start, lambda_unit=:angstrom)
E = h_cgs * nu
lambda_end = energy_to_wavelength(E, lambda_unit=:angstrom)
test("Å → ν → E → Å chain", isapprox(lambda_end, lambda_start, rtol=1e-10))

# Test air → vacuum → frequency → wavelength → air
lambda_air_start = 5000.0
chain2 = lambda_air_start |>
         air_to_vacuum_wavelength |>
         x -> wavelength_to_frequency(x, lambda_unit=:angstrom) |>
         x -> frequency_to_wavelength(x, lambda_unit=:angstrom) |>
         vacuum_to_air_wavelength
test("Air → vac → ν → λ → air chain", isapprox(chain2, lambda_air_start, rtol=1e-5))

# =============================================================================
# Test Edge Cases
# =============================================================================

println("\nEdge Cases:")

# Very short wavelength (UV)
lambda_uv = 1000.0  # Å
nu_uv = wavelength_to_frequency(lambda_uv, lambda_unit=:angstrom)
lambda_uv_back = frequency_to_wavelength(nu_uv, lambda_unit=:angstrom)
test("UV wavelength round-trip", isapprox(lambda_uv_back, lambda_uv, rtol=1e-10))

# Very long wavelength (IR)
lambda_ir = 50000.0  # 5 μm
nu_ir = wavelength_to_frequency(lambda_ir, lambda_unit=:angstrom)
lambda_ir_back = frequency_to_wavelength(nu_ir, lambda_unit=:angstrom)
test("IR wavelength round-trip", isapprox(lambda_ir_back, lambda_ir, rtol=1e-10))

# High velocity Doppler shift (still non-relativistic)
v_high = 3.0e8  # 3000 km/s
lambda_high_v = doppler_shift_wavelength(5000.0, v_high)
test("High velocity shift reasonable", lambda_high_v > 5000.0 && lambda_high_v < 5100.0)

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
    println("\n🎉 ALL UNIT CONVERSION TESTS PASSED!")
    exit(0)
else
    println("\n⚠️  Some tests failed")
    exit(1)
end
