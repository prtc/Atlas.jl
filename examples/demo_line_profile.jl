"""
DEMO: Fe I Line Profile Calculation

This demonstrates the complete Week 1 Pure Julia pipeline:
- Calculate a real Fe I 5000.172 Å line profile
- Show effects of temperature, damping, and turbulence
- Generate data suitable for plotting

Usage:
    julia examples/demo_line_profile.jl
"""

# Load all Week 1 modules
include("../src/Synthe/src/constants.jl")
include("../src/Synthe/src/units.jl")
include("../src/Synthe/src/physics.jl")
include("../src/Synthe/src/voigt.jl")
include("../src/Synthe/src/line_opacity_utils.jl")

println("="^70)
println("DEMO: Fe I 5000.172 Å Line Profile Calculation")
println("="^70)

# =============================================================================
# Example 1: Basic Line Profile at Solar Conditions
# =============================================================================

println("\nExample 1: Solar Fe I Line")
println("-"^70)

# Line parameters (real solar line)
lambda0 = 5000.172  # Å
loggf = -2.57      # Oscillator strength
E_lower = 3.0 * eV_cgs

# Solar conditions
T_sun = 5777.0     # K
xi = 2.0e5         # 2 km/s microturbulence
mass_Fe = 56.0 * amu_cgs

# Calculate Doppler width
delta_lambda = doppler_width(lambda0, T_sun, mass_Fe, xi)
println("  Doppler width: $(round(delta_lambda, digits=4)) Å")

# Convert to frequency for Voigt
nu0 = wavelength_to_frequency(lambda0; lambda_unit=:angstrom)
delta_nu_D = doppler_width_frequency(nu0, T_sun, mass_Fe, xi)

# Calculate damping
f_value = 10^loggf
gamma_rad = radiative_damping(lambda0, f_value)
gamma_stark = 1e8   # Hz (typical)
gamma_vdw = 1e8     # Hz
a_damp = damping_parameter(gamma_rad, gamma_stark, gamma_vdw, delta_nu_D)
println("  Damping parameter: $(round(a_damp, digits=6))")

# Line strength (simplified - assume some population)
N_Fe = 1e10  # cm⁻³
boltz = 0.1  # 10% in lower level

# Create wavelength grid (±2 Å, 401 points)
lambda_grid = collect(range(lambda0 - 2.0, lambda0 + 2.0, length=401))

# Calculate line profile
opacity_sun = zeros(length(lambda_grid))
accumulate_line_opacity!(opacity_sun, lambda_grid,
                        lambda0, loggf, N_Fe, boltz,
                        delta_nu_D, a_damp, 20.0)

max_opacity = maximum(opacity_sun)
println("  Maximum opacity: $(round(max_opacity, sigdigits=3)) cm⁻¹")
println("  FWHM: ≈ $(round(2.0 * delta_lambda, digits=3)) Å")

# =============================================================================
# Example 2: Temperature Effects
# =============================================================================

println("\nExample 2: Temperature Effects")
println("-"^70)

# Cold star (K dwarf, 3500 K)
T_cold = 3500.0
delta_nu_cold = doppler_width_frequency(nu0, T_cold, mass_Fe, xi)
opacity_cold = zeros(length(lambda_grid))
accumulate_line_opacity!(opacity_cold, lambda_grid,
                        lambda0, loggf, N_Fe, boltz,
                        delta_nu_cold, a_damp, 20.0)

# Hot star (F star, 7000 K)
T_hot = 7000.0
delta_nu_hot = doppler_width_frequency(nu0, T_hot, mass_Fe, xi)
opacity_hot = zeros(length(lambda_grid))
accumulate_line_opacity!(opacity_hot, lambda_grid,
                        lambda0, loggf, N_Fe, boltz,
                        delta_nu_hot, a_damp, 20.0)

println("  Cold star (3500 K): max opacity = $(round(maximum(opacity_cold), sigdigits=3)) cm⁻¹")
println("  Sun (5777 K):       max opacity = $(round(maximum(opacity_sun), sigdigits=3)) cm⁻¹")
println("  Hot star (7000 K):  max opacity = $(round(maximum(opacity_hot), sigdigits=3)) cm⁻¹")
println("  → Hotter stars have broader, shallower lines")

# =============================================================================
# Example 3: Damping Effects
# =============================================================================

println("\nExample 3: Damping Effects")
println("-"^70)

# Weak damping (pure Gaussian core)
a_weak = 0.001
opacity_weak = zeros(length(lambda_grid))
accumulate_line_opacity!(opacity_weak, lambda_grid,
                        lambda0, loggf, N_Fe, boltz,
                        delta_nu_D, a_weak, 20.0)

# Strong damping (pressure broadening)
a_strong = 0.1
opacity_strong = zeros(length(lambda_grid))
accumulate_line_opacity!(opacity_strong, lambda_grid,
                        lambda0, loggf, N_Fe, boltz,
                        delta_nu_D, a_strong, 20.0)

# Compare wings at ±1 Å
center_idx = 201
wing_idx = center_idx + 100  # +1 Å

ratio_weak = opacity_weak[wing_idx] / opacity_weak[center_idx]
ratio_strong = opacity_strong[wing_idx] / opacity_strong[center_idx]

println("  Weak damping (a=0.001):   wing/center = $(round(ratio_weak, sigdigits=3))")
println("  Strong damping (a=0.1):   wing/center = $(round(ratio_strong, sigdigits=3))")
println("  → Strong damping enhances line wings (Lorentzian tails)")

# =============================================================================
# Example 4: Multiple Lines
# =============================================================================

println("\nExample 4: Multiple Lines (Blended)")
println("-"^70)

# Start with first Fe I line
opacity_blend = copy(opacity_sun)

# Add second line (0.5 Å away, weaker)
lambda0_2 = lambda0 + 0.5
loggf_2 = -3.0  # Weaker
accumulate_line_opacity!(opacity_blend, lambda_grid,
                        lambda0_2, loggf_2, N_Fe, boltz,
                        delta_nu_D, a_damp, 20.0)

# Add third line (0.8 Å away, even weaker)
lambda0_3 = lambda0 - 0.8
loggf_3 = -3.5
accumulate_line_opacity!(opacity_blend, lambda_grid,
                        lambda0_3, loggf_3, N_Fe, boltz,
                        delta_nu_D, a_damp, 20.0)

println("  Single line: max = $(round(maximum(opacity_sun), sigdigits=3)) cm⁻¹")
println("  Blended (3 lines): max = $(round(maximum(opacity_blend), sigdigits=3)) cm⁻¹")
println("  → Lines accumulate additively")

# =============================================================================
# Example 5: Voigt Profile Shapes
# =============================================================================

println("\nExample 5: Voigt Profile Shapes")
println("-"^70)

# Show pure Gaussian, pure Lorentzian, and intermediate
v_grid = collect(range(-10.0, 10.0, length=201))

# Pure Gaussian (a → 0)
H_gaussian = [voigt_profile(v, 1e-6) for v in v_grid]

# Intermediate (a = 0.1)
H_intermediate = [voigt_profile(v, 0.1) for v in v_grid]

# Strong Lorentzian (a = 1.0)
H_lorentzian = [voigt_profile(v, 1.0) for v in v_grid]

println("  Gaussian (a≈0):    H(0) = $(round(H_gaussian[101], digits=3)), H(±5) = $(round(H_gaussian[151], sigdigits=3))")
println("  Intermediate (0.1): H(0) = $(round(H_intermediate[101], digits=3)), H(±5) = $(round(H_intermediate[151], sigdigits=3))")
println("  Lorentzian (1.0):   H(0) = $(round(H_lorentzian[101], digits=3)), H(±5) = $(round(H_lorentzian[151], sigdigits=3))")
println("  → Lorentzian wings extend much farther")

# =============================================================================
# Example 6: Save Data for Plotting
# =============================================================================

println("\nExample 6: Output Data for Plotting")
println("-"^70)

# Create output directory if it doesn't exist
output_dir = "output"
if !isdir(output_dir)
    mkdir(output_dir)
end

# Save line profiles to CSV
open("$output_dir/line_profile_temperature.csv", "w") do f
    println(f, "# Fe I 5000.172 Å line profiles at different temperatures")
    println(f, "# Wavelength(Å), Opacity_3500K(cm⁻¹), Opacity_5777K(cm⁻¹), Opacity_7000K(cm⁻¹)")
    for i in eachindex(lambda_grid)
        println(f, "$(lambda_grid[i]), $(opacity_cold[i]), $(opacity_sun[i]), $(opacity_hot[i])")
    end
end
println("  ✓ Saved: output/line_profile_temperature.csv")

# Save damping comparison
open("$output_dir/line_profile_damping.csv", "w") do f
    println(f, "# Fe I 5000.172 Å line profiles with different damping")
    println(f, "# Wavelength(Å), Opacity_weak(cm⁻¹), Opacity_normal(cm⁻¹), Opacity_strong(cm⁻¹)")
    for i in eachindex(lambda_grid)
        println(f, "$(lambda_grid[i]), $(opacity_weak[i]), $(opacity_sun[i]), $(opacity_strong[i])")
    end
end
println("  ✓ Saved: output/line_profile_damping.csv")

# Save Voigt profiles
open("$output_dir/voigt_profiles.csv", "w") do f
    println(f, "# Voigt profiles H(v,a) for different damping parameters")
    println(f, "# v(Doppler_widths), H_gaussian(a=0), H_intermediate(a=0.1), H_lorentzian(a=1.0)")
    for i in eachindex(v_grid)
        println(f, "$(v_grid[i]), $(H_gaussian[i]), $(H_intermediate[i]), $(H_lorentzian[i])")
    end
end
println("  ✓ Saved: output/voigt_profiles.csv")

# Save blended lines
open("$output_dir/line_profile_blended.csv", "w") do f
    println(f, "# Multiple Fe I lines (blended)")
    println(f, "# Wavelength(Å), Opacity_single(cm⁻¹), Opacity_blended(cm⁻¹)")
    for i in eachindex(lambda_grid)
        println(f, "$(lambda_grid[i]), $(opacity_sun[i]), $(opacity_blend[i])")
    end
end
println("  ✓ Saved: output/line_profile_blended.csv")

# =============================================================================
# Summary Statistics
# =============================================================================

println("\n" * "="^70)
println("SUMMARY")
println("="^70)
println("Calculated $(length(lambda_grid)) wavelength points")
println("Temperature range: 3500 K to 7000 K")
println("Damping range: a = 0.001 to 1.0")
println("All data files saved to: output/")
println("\nYou can plot these with your favorite tool (Python, gnuplot, etc.)")
println("\nWeek 1 Pure Julia Pipeline: WORKING! ✓")
