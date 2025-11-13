"""
Test suite for physics formulas

Tests all thermal, damping, Boltzmann, ideal gas, and optical depth calculations
with analytical validation
"""

# Load the physics module
include("../../src/Synthe/src/physics.jl")

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
println("Testing Physics Formulas")
println("="^70)

# =============================================================================
# Test Thermal Velocity and Doppler Width
# =============================================================================

println("\nThermal Velocity and Doppler Width:")

# Test thermal velocity for hydrogen at 5000K
T_test = 5000.0  # K
v_th = thermal_velocity(T_test, m_H_cgs)

# Expected: v_th = √(2kT/m) ≈ 8.7 km/s for H at 5000K
v_th_expected = sqrt(2.0 * k_B_cgs * T_test / m_H_cgs)
test("Thermal velocity formula correct", isapprox(v_th, v_th_expected, rtol=1e-10))
test("H thermal velocity at 5000K ≈ 8.7 km/s", isapprox(v_th / 1e5, 8.7, rtol=0.1))

# Test Doppler width for Fe I line at 5000 Å
lambda0 = 5000.0  # Å
mass_Fe = 56.0 * amu_cgs  # Iron mass
T_solar = 5777.0  # K

delta_lambda = doppler_width(lambda0, T_solar, mass_Fe)

# Expected Doppler width: Δλ ≈ (λ/c) × √(2kT/m)
# For Fe at solar temperature: ~0.03 Å
test("Doppler width > 0", delta_lambda > 0.0)
test("Fe I Doppler width ≈ 0.03 Å", isapprox(delta_lambda, 0.03, rtol=0.3))

# Test with microturbulence
xi_turb = 2.0e5  # 2 km/s microturbulence
delta_lambda_turb = doppler_width(lambda0, T_solar, mass_Fe, xi_turb)

# Should be larger with turbulence
test("Turbulence increases Doppler width", delta_lambda_turb > delta_lambda)

# Round-trip test: wavelength and frequency Doppler widths should be consistent
nu0 = c_cgs / (lambda0 * 1e-8)  # Convert to Hz
delta_nu = doppler_width_frequency(nu0, T_solar, mass_Fe)
delta_lambda_from_nu = (lambda0 / nu0) * delta_nu
test("Wavelength ↔ frequency Doppler width consistent",
     isapprox(delta_lambda_from_nu, delta_lambda, rtol=1e-6))

# =============================================================================
# Test Damping Parameters
# =============================================================================

println("\nDamping Parameters:")

# Test radiative damping for strong line (f ≈ 0.1)
f_value = 0.1  # Oscillator strength
gamma_rad = radiative_damping(lambda0, f_value)

# Expected: γ_rad = (8π²e²)/(m_e c λ²) × f
# For λ=5000 Å, f=0.1: γ_rad ≈ 10⁷ - 10⁸ Hz
lambda_cm = lambda0 * 1.0e-8
gamma_rad_expected = (8.0 * π^2 * e_cgs^2) / (m_e_cgs * c_cgs * lambda_cm^2) * f_value
test("Radiative damping formula correct", isapprox(gamma_rad, gamma_rad_expected, rtol=1e-10))
test("Radiative damping order of magnitude correct", gamma_rad > 1e6 && gamma_rad < 1e10)

# Test damping parameter calculation
gamma_stark = 1e8  # Hz (typical)
gamma_vdw = 1e8    # Hz (typical)
delta_nu_D = delta_nu  # From above

a_damp = damping_parameter(gamma_rad, gamma_stark, gamma_vdw, delta_nu_D)

# Damping parameter should be dimensionless
# For typical solar lines: a ~ 10⁻⁴ to 10⁻² (small, Gaussian core dominates)
# Can be larger for strong damping wings
test("Damping parameter > 0", a_damp > 0.0)
test("Damping parameter dimensionless", a_damp > 1e-6 && a_damp < 1e6)
test("Damping parameter finite", isfinite(a_damp))

# Test zero damping
a_zero = damping_parameter(0.0, 0.0, 0.0, delta_nu_D)
test("Zero damping → zero parameter", a_zero == 0.0)

# =============================================================================
# Test Boltzmann Distribution
# =============================================================================

println("\nBoltzmann Distribution:")

# Test Boltzmann ratio for hydrogen n=2 → n=1
# E₂ = -13.6/4 = -3.4 eV, E₁ = -13.6 eV
# ΔE = 10.2 eV
E_upper = -3.4 * eV_cgs
E_lower = -13.6 * eV_cgs
g_upper = 8.0  # n=2 (4 levels × 2 spins)
g_lower = 2.0  # n=1 (1 level × 2 spins)

T_test = 10000.0  # K
ratio = boltzmann_ratio(E_upper, E_lower, g_upper, g_lower, T_test)

# Expected: (8/2) × exp(-10.2 eV / kT)
# At 10000K: kT ≈ 0.86 eV, so exp(-10.2/0.86) ≈ exp(-11.9) ≈ 7e-6
delta_E = E_upper - E_lower
ratio_expected = (g_upper / g_lower) * exp(-delta_E / (k_B_cgs * T_test))
test("Boltzmann ratio formula correct", isapprox(ratio, ratio_expected, rtol=1e-10))
test("H n=2/n=1 ratio at 10000K ≈ 3e-5", isapprox(ratio, 3e-5, rtol=0.5))

# Test ground state dominance at low T
T_cold = 3000.0  # K
ratio_cold = boltzmann_ratio(E_upper, E_lower, g_upper, g_lower, T_cold)
test("Low temperature → ground state dominance", ratio_cold < 1e-10)

# Test high temperature (more excitation)
T_hot = 20000.0  # K
ratio_hot = boltzmann_ratio(E_upper, E_lower, g_upper, g_lower, T_hot)
test("High temperature → more excitation", ratio_hot > ratio)

# Test wavenumber conversion
chi_upper = 82259.0  # cm⁻¹ for H n=2 (Lyman alpha upper level)
chi_lower = 0.0      # cm⁻¹ ground state
ratio_wn = boltzmann_ratio_wavenumber(chi_upper, chi_lower, g_upper, g_lower, T_test)

# Should match energy-based calculation
E_upper_wn = h_cgs * c_cgs * chi_upper
E_lower_wn = h_cgs * c_cgs * chi_lower
ratio_wn_expected = boltzmann_ratio(E_upper_wn, E_lower_wn, g_upper, g_lower, T_test)
test("Wavenumber ↔ energy Boltzmann consistent",
     isapprox(ratio_wn, ratio_wn_expected, rtol=1e-10))

# Test partition function cutoff
E_max = 10.0 * eV_cgs  # 10 eV cutoff
cutoff = partition_function_cutoff(E_max, T_test)
test("Partition cutoff > 0", cutoff > 0.0)
test("Partition cutoff < 1", cutoff < 1.0)

# Very high energy should give zero
E_very_high = 100.0 * eV_cgs
cutoff_zero = partition_function_cutoff(E_very_high, T_test)
test("Very high energy → zero cutoff", cutoff_zero == 0.0)

# =============================================================================
# Test Ideal Gas Law
# =============================================================================

println("\nIdeal Gas Law:")

# Test pressure calculation
T_atm = 6400.0  # K (solar photosphere τ=1)
n_total = 1e17  # cm⁻³ (typical solar photosphere)
P = ideal_gas_pressure(T_atm, n_total)

# Expected: P = nkT ≈ 1e17 × 1.38e-16 × 6400 ≈ 9e4 dyne/cm²
P_expected = n_total * k_B_cgs * T_atm
test("Ideal gas pressure formula correct", isapprox(P, P_expected, rtol=1e-10))
test("Solar photosphere pressure ≈ 1e5 dyne/cm²", isapprox(P, 1e5, rtol=0.5))

# Test density calculation
mu = 0.6 * m_H_cgs  # Mean molecular weight (solar)
rho = ideal_gas_density(P, T_atm, mu)

# Expected: ρ = P·μ/(kT) ≈ 9e4 × 1e-24 / (1.38e-16 × 6400) ≈ 1e-7 g/cm³
rho_expected = (P * mu) / (k_B_cgs * T_atm)
test("Ideal gas density formula correct", isapprox(rho, rho_expected, rtol=1e-10))
test("Solar photosphere density ≈ 1e-7 g/cm³", isapprox(rho, 1e-7, rtol=0.5))

# Test number density roundtrip
n_back = ideal_gas_number_density(P, T_atm)
test("P → n → P roundtrip", isapprox(n_back, n_total, rtol=1e-10))

# Test mean molecular weight
X_H = 0.73   # Hydrogen mass fraction
X_He = 0.25  # Helium mass fraction
X_metals = 0.02  # Metals mass fraction

mu_calc = mean_molecular_weight(X_H, X_He, X_metals)

# Expected: μ ≈ 0.6 m_H for solar composition
test("Mean molecular weight reasonable", mu_calc > 0.5 * m_H_cgs && mu_calc < 0.7 * m_H_cgs)
test("Solar mean molecular weight ≈ 0.6 m_H", isapprox(mu_calc / m_H_cgs, 0.6, rtol=0.1))

# =============================================================================
# Test Optical Depth and Scale Height
# =============================================================================

println("\nOptical Depth and Scale Height:")

# Test optical depth increment
kappa = 0.5  # cm²/g (typical continuum opacity)
rho_test = 1e-7  # g/cm³
dz = 1e7  # 100 km geometric depth

dtau = optical_depth_increment(kappa, rho_test, dz)

# Expected: dτ = κ·ρ·dz = 0.5 × 1e-7 × 1e7 = 0.5
dtau_expected = kappa * rho_test * dz
test("Optical depth increment formula correct", isapprox(dtau, dtau_expected, rtol=1e-10))
test("dτ ≈ 0.5 for typical values", isapprox(dtau, 0.5, rtol=1e-10))

# Test column density
N_col = column_density(rho_test, dz)
N_col_expected = rho_test * dz
test("Column density formula correct", isapprox(N_col, N_col_expected, rtol=1e-10))
test("Column density ≈ 1 g/cm²", isapprox(N_col, 1.0, rtol=1e-10))

# Test scale height
g_sun = 2.74e4  # cm/s² (solar surface gravity)
H = scale_height(T_atm, g_sun, mu)

# Expected: H = kT/(μg) ≈ 1.38e-16 × 6400 / (0.6×1.67e-24 × 2.74e4) ≈ 320 km
# Note: Solar photosphere pressure scale height is ~300-350 km
# (The density scale height is smaller ~100-150 km due to T gradient)
H_expected = (k_B_cgs * T_atm) / (mu * g_sun)
test("Scale height formula correct", isapprox(H, H_expected, rtol=1e-10))
test("Solar scale height ≈ 320 km", isapprox(H / 1e5, 320.0, rtol=0.2))

# Test scale height increases with temperature
T_hot_atm = 10000.0  # K
H_hot = scale_height(T_hot_atm, g_sun, mu)
test("Higher temperature → larger scale height", H_hot > H)

# =============================================================================
# Test Sound Speed
# =============================================================================

println("\nSound Speed:")

# Test sound speed for solar atmosphere
c_s = sound_speed(T_atm, mu)

# Expected: c_s = √(γkT/μ) ≈ √(5/3 × 1.38e-16 × 6400 / 1e-24) ≈ 10 km/s
c_s_expected = sqrt((5.0/3.0) * k_B_cgs * T_atm / mu)
test("Sound speed formula correct", isapprox(c_s, c_s_expected, rtol=1e-10))
test("Solar sound speed ≈ 10 km/s", isapprox(c_s / 1e5, 10.0, rtol=0.3))

# Test with different adiabatic index
gamma_diatomic = 7.0 / 5.0  # Diatomic gas
c_s_diatomic = sound_speed(T_atm, mu, gamma_diatomic)
test("Sound speed depends on γ", c_s_diatomic != c_s)

# Test sound speed increases with temperature
c_s_hot = sound_speed(T_hot_atm, mu)
test("Higher temperature → faster sound speed", c_s_hot > c_s)

# =============================================================================
# Test Edge Cases and Physical Limits
# =============================================================================

println("\nEdge Cases:")

# Zero temperature should give zero thermal velocity
v_zero = thermal_velocity(0.0, m_H_cgs)
test("Zero temperature → zero thermal velocity", v_zero == 0.0)

# Very high temperature Boltzmann ratio should approach g_upper/g_lower
T_very_high = 1e8  # K (unrealistically high)
ratio_limit = boltzmann_ratio(E_upper, E_lower, g_upper, g_lower, T_very_high)
test("Very high T → Boltzmann ratio approaches g ratio",
     isapprox(ratio_limit, g_upper / g_lower, rtol=0.1))

# Zero opacity should give zero optical depth
dtau_zero = optical_depth_increment(0.0, rho_test, dz)
test("Zero opacity → zero optical depth", dtau_zero == 0.0)

# Very low density should give very low pressure
P_vacuum = ideal_gas_pressure(T_atm, 1.0)  # Only 1 particle/cm³
test("Low density → low pressure", P_vacuum < 1e-10)

# Doppler width scales linearly with wavelength
lambda_double = 10000.0  # 2× wavelength
delta_lambda_double = doppler_width(lambda_double, T_solar, mass_Fe)
test("Doppler width scales with wavelength",
     isapprox(delta_lambda_double / delta_lambda, 2.0, rtol=1e-6))

# =============================================================================
# Test Consistency Across Functions
# =============================================================================

println("\nConsistency Tests:")

# Test P-ρ-n consistency
P_test = 1e5  # dyne/cm²
T_test = 6000.0  # K
mu_test = 0.6 * m_H_cgs

n_from_P = ideal_gas_number_density(P_test, T_test)
rho_from_P = ideal_gas_density(P_test, T_test, mu_test)

# Check: ρ = n × μ
rho_from_n = n_from_P * mu_test
test("ρ = n·μ consistency", isapprox(rho_from_n, rho_from_P, rtol=1e-10))

# Test thermal velocity vs Doppler width relationship
v_th_test = thermal_velocity(T_test, mass_Fe)
delta_lambda_test = doppler_width(lambda0, T_test, mass_Fe)

# Relationship: Δλ = λ × v_th / c
delta_lambda_expected_from_v = lambda0 * v_th_test / c_cgs
test("Doppler width vs thermal velocity consistent",
     isapprox(delta_lambda_test, delta_lambda_expected_from_v, rtol=1e-10))

# Test scale height vs sound speed relationship
# H ≈ c_s²/(γg) for isothermal atmosphere
H_from_cs = (c_s^2) / ((5.0/3.0) * g_sun)
test("Scale height vs sound speed consistent",
     isapprox(H_from_cs, H, rtol=0.1))

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
    println("\n🎉 ALL PHYSICS FORMULA TESTS PASSED!")
    exit(0)
else
    println("\n⚠️  Some tests failed")
    exit(1)
end
