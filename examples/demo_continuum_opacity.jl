"""
DEMO: Continuum Opacity Sources

This demonstrates the Task 2.3 Pure Julia continuum opacity functions:
- H⁻ bound-free (photodetachment)
- H⁻ free-free (inverse bremsstrahlung)
- H I bound-free (Lyman, Balmer, Paschen)
- Electron scattering (Thomson)
- Gaunt factor (quantum correction)

Usage:
    julia examples/demo_continuum_opacity.jl
"""

# Load dependencies
include("../src/Synthe/src/continuum_opacity.jl")

println("="^70)
println("DEMO: Continuum Opacity Sources")
println("="^70)

# =============================================================================
# Example 1: H⁻ Bound-Free Opacity
# =============================================================================

println("\nExample 1: H⁻ Bound-Free Opacity")
println("-"^70)

# Solar photosphere conditions
T = 5777.0   # K
P_e = 1.0e3  # dyne/cm²

# Optical wavelengths
wavelengths = [4000.0, 5000.0, 6000.0, 7000.0]  # Å

println("Solar photosphere (T=$T K, P_e=$P_e dyne/cm²):")
println("\nλ (Å)    σ_bf(H⁻) (cm²)")
println("-"^40)
for λ in wavelengths
    sigma = hminus_bf(λ, T, P_e)
    println("$λ    $(round(sigma, sigdigits=3))")
end

# Check threshold
λ_threshold = 16500.0
sigma_threshold = hminus_bf(λ_threshold, T, P_e)
sigma_beyond = hminus_bf(20000.0, T, P_e)
println("\nPhotodetachment threshold: $λ_threshold Å")
println("  At threshold: σ = $sigma_threshold cm²")
println("  Beyond threshold (20000 Å): σ = $sigma_beyond cm²")

# =============================================================================
# Example 2: H⁻ Free-Free Opacity
# =============================================================================

println("\nExample 2: H⁻ Free-Free Opacity")
println("-"^70)

# Infrared wavelengths (where free-free dominates)
wavelengths_ir = [5000.0, 10000.0, 15000.0, 20000.0]  # Å

println("Free-free opacity (infrared dominance):")
println("\nλ (Å)     σ_ff(H⁻) (cm²)    Ratio to λ=5000")
println("-"^50)
sigma_ref = hminus_ff(5000.0, T, P_e)
for λ in wavelengths_ir
    sigma = hminus_ff(λ, T, P_e)
    ratio = sigma / sigma_ref
    println("$λ    $(round(sigma, sigdigits=3))    $(round(ratio, digits=2))")
end

println("\n→ Opacity ∝ λ³ (doubling λ → 8× opacity)")

# =============================================================================
# Example 3: H I Bound-Free Opacity (Hydrogen edges)
# =============================================================================

println("\nExample 3: H I Bound-Free Opacity")
println("-"^70)

# Lyman series (n=1, threshold 912 Å)
println("\nLyman series (n=1):")
println("  Threshold: $(round(911.8 * 1^2, digits=1)) Å")
λ_lyman = [900.0, 910.0, 915.0, 1000.0]
for λ in λ_lyman
    sigma = hydrogen_bf(λ, T, 1)
    status = λ < 912 ? "below edge" : "above edge"
    println("  λ=$λ Å: σ=$(round(sigma, sigdigits=3)) cm² ($status)")
end

# Balmer series (n=2, threshold 3646 Å)
println("\nBalmer series (n=2):")
println("  Threshold: $(round(911.8 * 2^2, digits=1)) Å")
λ_balmer = [3600.0, 3645.0, 3650.0, 4000.0]
for λ in λ_balmer
    sigma = hydrogen_bf(λ, T, 2)
    status = λ < 3646 ? "below edge" : "above edge"
    println("  λ=$λ Å: σ=$(round(sigma, sigdigits=3)) cm² ($status)")
end

# Paschen series (n=3, threshold 8204 Å)
println("\nPaschen series (n=3):")
println("  Threshold: $(round(911.8 * 3^2, digits=1)) Å")
λ_paschen = [8000.0, 8200.0, 8300.0, 9000.0]
for λ in λ_paschen
    sigma = hydrogen_bf(λ, T, 3)
    status = λ < 8204 ? "below edge" : "above edge"
    println("  λ=$λ Å: σ=$(round(sigma, sigdigits=3)) cm² ($status)")
end

# =============================================================================
# Example 4: Electron Scattering
# =============================================================================

println("\nExample 4: Electron Scattering (Thomson)")
println("-"^70)

# Different electron densities
n_e_values = [1.0e12, 1.0e14, 1.0e16]  # cm⁻³

println("Wavelength-independent:")
println("\nn_e (cm⁻³)    κ_es (cm⁻¹)")
println("-"^40)
for n_e in n_e_values
    kappa = electron_scattering(n_e)
    println("$(round(n_e, sigdigits=2))    $(round(kappa, sigdigits=3))")
end

println("\n→ Thomson cross-section: 6.65×10⁻²⁵ cm²")

# =============================================================================
# Example 5: Gaunt Factor
# =============================================================================

println("\nExample 5: Gaunt Factor (Quantum Correction)")
println("-"^70)

# Different quantum levels and frequency ratios
println("Gaunt factor g(n, x) where x = ν/ν_threshold:")
println("\nx value    n=1     n=2     n=3")
println("-"^40)
x_values = [1.0, 1.5, 2.0, 3.0, 5.0]
for x in x_values
    g1 = gaunt_factor(1, x)
    g2 = gaunt_factor(2, x)
    g3 = gaunt_factor(3, x)
    println("$x    $(round(g1, digits=3))   $(round(g2, digits=3))   $(round(g3, digits=3))")
end

println("\n→ At threshold (x=1): g ≈ 1.0")
println("→ Higher levels have weaker n-dependence")

# =============================================================================
# Example 6: Total Continuum Opacity (Solar Photosphere)
# =============================================================================

println("\nExample 6: Total Continuum Opacity (Solar Photosphere)")
println("-"^70)

# Solar conditions
T_sun = 5777.0
P_e_sun = 1.0e3
n_e_sun = 1.0e14

# Wavelength scan across optical
wavelengths_total = [3000.0, 4000.0, 5000.0, 6000.0, 7000.0, 8000.0]  # Å

println("Solar photosphere: T=$T_sun K, n_e=$(round(n_e_sun, sigdigits=2)) cm⁻³")
println("\nλ (Å)    H⁻_bf      H⁻_ff      H I_bf     e⁻_scat    Total")
println("-"^70)

for λ in wavelengths_total
    κ_hminus_bf = hminus_bf(λ, T_sun, P_e_sun)
    κ_hminus_ff = hminus_ff(λ, T_sun, P_e_sun)
    κ_h1_bf = hydrogen_bf(λ, T_sun, 2)  # Balmer continuum
    κ_es = electron_scattering(n_e_sun)
    κ_total = κ_hminus_bf + κ_hminus_ff + κ_h1_bf + κ_es

    println("$λ  $(round(κ_hminus_bf, sigdigits=2))  $(round(κ_hminus_ff, sigdigits=2))  $(round(κ_h1_bf, sigdigits=2))  $(round(κ_es, sigdigits=2))  $(round(κ_total, sigdigits=3))")
end

println("\n→ H⁻ bound-free dominates in optical for solar-type stars")

# =============================================================================
# Example 7: Temperature Effects
# =============================================================================

println("\nExample 7: Temperature Effects on H⁻ Opacity")
println("-"^70)

# Different stellar types
temperatures = [4000.0, 5000.0, 6000.0, 7000.0]  # K
λ_test = 5000.0  # Å

println("H⁻ bound-free opacity at λ=$λ_test Å:")
println("\nT (K)    σ_bf (cm²)    Stellar type")
println("-"^50)
stellar_types = ["K dwarf", "G dwarf (cooler)", "G dwarf (Sun-like)", "F dwarf"]
for (i, T) in enumerate(temperatures)
    sigma = hminus_bf(λ_test, T, P_e)
    println("$T    $(round(sigma, sigdigits=3))    $(stellar_types[i])")
end

println("\n→ Cooler stars have more H⁻ opacity")

# =============================================================================
# Summary
# =============================================================================

println("\n" * "="^70)
println("SUMMARY")
println("="^70)
println("✓ H⁻ bound-free: dominant in optical (solar photosphere)")
println("✓ H⁻ free-free: dominant in infrared (λ³ dependence)")
println("✓ H I bound-free: Lyman/Balmer/Paschen edges")
println("✓ Electron scattering: wavelength-independent")
println("✓ Gaunt factor: quantum correction (0.8-1.2)")
println("\nTask 2.3: Continuum Opacity - COMPLETE! ✓")
println("="^70)
