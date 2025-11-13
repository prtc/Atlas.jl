"""
Test suite for physical constants

Validates all constants against CODATA 2018 and known values
"""

# Load the constants module
include("../../src/Synthe/src/constants.jl")

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
println("Testing Physical Constants")
println("="^70)

# =============================================================================
# Test Fundamental Constants
# =============================================================================

println("\nFundamental Constants:")
test("Speed of light (c)", isapprox(c_cgs, 2.99792458e10, rtol=1e-10))
test("Planck constant (h)", isapprox(h_cgs, 6.62607015e-27, rtol=1e-10))
test("Boltzmann constant (k_B)", isapprox(k_B_cgs, 1.380649e-16, rtol=1e-10))
test("Gravitational constant (G)", isapprox(G_cgs, 6.67430e-8, rtol=1e-5))

# =============================================================================
# Test Particle Masses
# =============================================================================

println("\nParticle Masses:")
test("Electron mass (m_e)", isapprox(m_e_cgs, 9.1093837015e-28, rtol=1e-10))
test("Proton mass (m_p)", isapprox(m_p_cgs, 1.67262192369e-24, rtol=1e-10))
test("Hydrogen atom mass (m_H)", isapprox(m_H_cgs, 1.673534e-24, rtol=1e-6))
test("Atomic mass unit (amu)", isapprox(amu_cgs, 1.66053906660e-24, rtol=1e-10))

# Sanity: m_p should be ~1836 times m_e
test("Proton/electron mass ratio ≈ 1836", isapprox(m_p_cgs/m_e_cgs, 1836.15, rtol=1e-4))

# =============================================================================
# Test Electromagnetic Constants
# =============================================================================

println("\nElectromagnetic Constants:")
test("Elementary charge (e, Gaussian)", isapprox(e_cgs, 4.80320425e-10, rtol=1e-8))
test("Electron volt (eV)", isapprox(eV_cgs, 1.602176634e-12, rtol=1e-10))

# =============================================================================
# Test Radiation Constants
# =============================================================================

println("\nRadiation Constants:")
test("Stefan-Boltzmann constant", isapprox(sigma_SB_cgs, 5.670374419e-5, rtol=1e-8))
test("Radiation density constant", isapprox(a_rad_cgs, 7.5657e-15, rtol=1e-4))
test("Thomson cross-section", isapprox(sigma_T_cgs, 6.6524587321e-25, rtol=1e-10))

# Stefan-Boltzmann should equal (a_rad * c) / 4
sigma_from_a = a_rad_cgs * c_cgs / 4.0
test("σ_SB = (a_rad × c)/4", isapprox(sigma_SB_cgs, sigma_from_a, rtol=1e-5))

# =============================================================================
# Test Astronomical Constants
# =============================================================================

println("\nAstronomical Constants:")
test("Solar mass (M_sun)", isapprox(M_sun_cgs, 1.98892e33, rtol=1e-5))
test("Solar radius (R_sun)", isapprox(R_sun_cgs, 6.957e10, rtol=1e-4))
test("Solar luminosity (L_sun)", isapprox(L_sun_cgs, 3.828e33, rtol=1e-3))
test("Astronomical unit (AU)", isapprox(au_cgs, 1.495978707e13, rtol=1e-9))
test("Parsec (pc)", isapprox(pc_cgs, 3.085677581e18, rtol=1e-9))

# =============================================================================
# Test Derived Constants
# =============================================================================

println("\nDerived Constants:")

# Classical electron radius: r_0 = e²/(m_e c²)
r_0 = classical_electron_radius()
r_0_expected = 2.8179403262e-13  # cm
test("Classical electron radius", isapprox(r_0, r_0_expected, rtol=1e-6))

# Bohr radius: a_0 = ℏ²/(m_e e²) where ℏ = h/(2π)
a_0 = bohr_radius()
a_0_expected = 5.29177210903e-9  # cm
test("Bohr radius", isapprox(a_0, a_0_expected, rtol=1e-6))

# Rydberg energy: 13.605693... eV
Ry = rydberg_energy()
Ry_expected = 13.605693122994 * eV_cgs
test("Rydberg energy", isapprox(Ry, Ry_expected, rtol=1e-10))

# Rydberg frequency: ν_∞ = Ry/h
nu_Ry = rydberg_frequency()
nu_Ry_expected = 3.28984196036e15  # Hz
test("Rydberg frequency", isapprox(nu_Ry, nu_Ry_expected, rtol=1e-10))

# Fine structure constant: α = e²/(ℏc) ≈ 1/137
alpha = fine_structure_constant()
alpha_expected = 7.2973525693e-3  # ≈ 1/137.036
test("Fine structure constant", isapprox(alpha, alpha_expected, rtol=1e-6))
test("α ≈ 1/137", isapprox(1.0/alpha, 137.036, rtol=1e-5))

# =============================================================================
# Test Saha Constant
# =============================================================================

println("\nSaha Constant:")

# Test Saha constant at solar photosphere conditions
T_solar = 5772.0          # K (solar effective temperature)
n_e_solar = 1.0e14        # cm⁻³ (approximate solar photosphere)

CF = saha_constant(T_solar, n_e_solar)

# Saha constant should be positive and order 10^7 cm³ at solar conditions
test("Saha constant positive", CF > 0.0)
test("Saha constant order of magnitude", 1e6 < CF < 1e9)

# Test that CF scales correctly with temperature
CF_10000 = saha_constant(10000.0, n_e_solar)
# CF ∝ T^(3/2), so ratio should be (10000/5772)^1.5 ≈ 2.38
ratio = CF_10000 / CF
expected_ratio = (10000.0 / 5772.0)^1.5
test("Saha constant T^(3/2) scaling", isapprox(ratio, expected_ratio, rtol=1e-10))

# Test that CF scales inversely with n_e
CF_high_ne = saha_constant(T_solar, 1.0e15)
ratio_ne = CF / CF_high_ne
test("Saha constant n_e^(-1) scaling", isapprox(ratio_ne, 10.0, rtol=1e-10))

# =============================================================================
# Test Planck Function
# =============================================================================

println("\nPlanck Function:")

# Test Planck function at solar temperature
T_test = 5772.0
lambda_test = 5000.0e-8  # 5000 Å in cm
nu_test = c_cgs / lambda_test

B_nu = planck_function(nu_test, T_test)

# Planck function should be positive
test("Planck function positive", B_nu > 0.0)

# Wien displacement law: λ_max × T = constant
lambda_max = wien_displacement_wavelength(T_test)
wien_constant = lambda_max * T_test
wien_expected = 0.2897771955  # cm·K
test("Wien displacement (wavelength)", isapprox(wien_constant, wien_expected, rtol=1e-8))

# Peak should be near 5000 Å for solar temperature
test("Wien peak near 5000 Å at T_sun", isapprox(lambda_max, 5000.0e-8, rtol=0.1))

# Test Planck function in wavelength units
B_lambda = planck_function_wavelength(lambda_test, T_test)
test("Planck (wavelength) positive", B_lambda > 0.0)

# Relation: B_ν = (λ²/c) × B_λ
B_lambda_from_nu = (lambda_test^2 / c_cgs) * B_lambda
test("B_ν = (λ²/c) × B_λ", isapprox(B_nu, B_lambda_from_nu, rtol=1e-6))

# Test Wien limit (high frequency / low temperature)
# At high x = hν/kT, B_ν ≈ (2hν³/c²) exp(-hν/kT)
T_low = 1000.0
nu_high = c_cgs / (1000.0e-8)  # UV, 1000 Å
x = h_cgs * nu_high / (k_B_cgs * T_low)
if x > 10.0  # Wien regime
    B_wien = planck_function(nu_high, T_low)
    B_wien_approx = (2.0 * h_cgs * nu_high^3 / c_cgs^2) * exp(-x)
    test("Planck function Wien limit", isapprox(B_wien, B_wien_approx, rtol=1e-3))
end

# Test Rayleigh-Jeans limit (low frequency / high temperature)
# At low x, B_ν ≈ (2ν²kT/c²)
T_high = 10000.0
nu_low = c_cgs / (10000.0e-8)  # IR, 1 μm
x_low = h_cgs * nu_low / (k_B_cgs * T_high)
if x_low < 0.1  # Rayleigh-Jeans regime
    B_rj = planck_function(nu_low, T_high)
    B_rj_approx = 2.0 * nu_low^2 * k_B_cgs * T_high / c_cgs^2
    test("Planck function Rayleigh-Jeans limit", isapprox(B_rj, B_rj_approx, rtol=0.1))
end

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
    println("\n🎉 ALL CONSTANTS TESTS PASSED!")
    exit(0)
else
    println("\n⚠️  Some tests failed")
    exit(1)
end
