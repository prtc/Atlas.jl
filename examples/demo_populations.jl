"""
Demo: Population solver (Saha-Boltzmann statistics)

Demonstrates Pure Julia population calculation for stellar atmospheres.

Task 3.1: POPS equivalent - Computing ionization fractions and electron density.

Author: Claude (Local), Paula Coelho
Date: 2025-11-14
"""

# Add module to load path
push!(LOAD_PATH, joinpath(@__DIR__, "../src/Synthe/src"))

using Synthe

println("=" ^ 70)
println("Population Solver Demo - Pure Julia Implementation")
println("=" ^ 70)
println()

# === Example 1: Partition Functions ===
println("Example 1: Partition Functions")
println("-" ^ 70)

T_cool = 3000.0   # K
T_solar = 5777.0  # K
T_hot = 10000.0   # K

println("Hydrogen partition functions:")
println("  T = $T_cool K:")
println("    Z(H I)  = ", partition_function(1, 0, T_cool))
println("    Z(H II) = ", partition_function(1, 1, T_cool))
println()
println("  T = $T_solar K (solar):")
println("    Z(H I)  = ", partition_function(1, 0, T_solar))
println("    Z(H II) = ", partition_function(1, 1, T_solar))
println()
println("  T = $T_hot K:")
println("    Z(H I)  = ", partition_function(1, 0, T_hot))
println("    Z(H II) = ", partition_function(1, 1, T_hot))
println()

println("Helium partition functions:")
println("  T = $T_solar K:")
println("    Z(He I)   = ", partition_function(2, 0, T_solar))
println("    Z(He II)  = ", partition_function(2, 1, T_solar))
println("    Z(He III) = ", partition_function(2, 2, T_solar))
println()

# === Example 2: Saha Ionization Ratio ===
println("Example 2: Saha Ionization Ratio")
println("-" ^ 70)

# Hydrogen at solar conditions
T = 5777.0         # K
n_e = 1.0e14       # cm⁻³ (typical solar photosphere)
χ_H = 13.598       # eV (H I → H II ionization potential)

ratio_H = saha_ionization_ratio(1, 0, T, n_e, χ_H)
fraction_HI = 1.0 / (1.0 + ratio_H)
fraction_HII = ratio_H / (1.0 + ratio_H)

println("Hydrogen ionization at solar conditions:")
println("  T   = $T K")
println("  n_e = $(n_e) cm⁻³")
println("  χ   = $χ_H eV")
println()
println("  Ratio n(H II)/n(H I) = $ratio_H")
println("  → H I  fraction: $(round(fraction_HI * 100, digits=1))%")
println("  → H II fraction: $(round(fraction_HII * 100, digits=1))%")
println()

# Temperature dependence
println("Temperature dependence of H ionization:")
for T_test in [4000.0, 5000.0, 6000.0, 7000.0, 8000.0]
    ratio = saha_ionization_ratio(1, 0, T_test, n_e, χ_H)
    frac_HII = ratio / (1.0 + ratio)
    println("  T = $T_test K: H II fraction = $(round(frac_HII * 100, digits=1))%")
end
println()

# === Example 3: Full Population Solver ===
println("Example 3: Full Population Solver (Solar Photosphere)")
println("-" ^ 70)

# Solar abundances (log scale, H=12.0)
abundances = zeros(30)
abundances[1] = 12.0      # H
abundances[2] = 10.93     # He
abundances[6] = 8.43      # C
abundances[7] = 7.83      # N
abundances[8] = 8.69      # O

# Solar photosphere conditions
T_solar = 5777.0      # K
P_gas = 1.0e5         # dyne/cm² (typical photosphere)

println("Input conditions:")
println("  T     = $T_solar K")
println("  P_gas = $(P_gas) dyne/cm²")
println("  Abundances: H=12.0, He=10.93, C=8.43, N=7.83, O=8.69")
println()

# Compute populations
result = compute_populations(T_solar, P_gas, abundances)

println("Results:")
println("  Converged: $(result.converged)")
println("  Iterations: $(result.iterations)")
println("  Electron density: n_e = $(result.n_e) cm⁻³")
println()

println("Ionization fractions:")
for element in 1:2
    for ion_stage in 0:element
        key = (element, ion_stage)
        if haskey(result.ion_fractions, key)
            fraction = result.ion_fractions[key]
            element_name = element == 1 ? "H" : "He"
            ion_name = ion_stage == 0 ? "I" : (ion_stage == 1 ? "II" : "III")
            println("  $(element_name) $(ion_name): $(round(fraction * 100, digits=2))%")
        end
    end
end
println()

println("Number densities:")
for element in 1:2
    for ion_stage in 0:element
        key = (element, ion_stage)
        if haskey(result.number_densities, key)
            density = result.number_densities[key]
            element_name = element == 1 ? "H" : "He"
            ion_name = ion_stage == 0 ? "I" : (ion_stage == 1 ? "II" : "III")
            println("  n($(element_name) $(ion_name)) = $(density) cm⁻³")
        end
    end
end
println()

# === Example 4: Charge Conservation Check ===
println("Example 4: Charge Conservation Verification")
println("-" ^ 70)

# Sum electrons from all ions
n_e_check = 0.0
for ((elem, ion_stage), density) in result.number_densities
    n_e_check += ion_stage * density
end

println("Electron density from charge conservation:")
println("  n_e (from ions) = $(n_e_check) cm⁻³")
println("  n_e (solver)    = $(result.n_e) cm⁻³")
println("  Relative diff   = $(abs(n_e_check - result.n_e) / result.n_e * 100)%")
println()

println("=" ^ 70)
println("✅ Population solver demo complete!")
println("=" ^ 70)
println()
println("Next steps:")
println("  1. Run tests: julia test/synthe/test_populations.jl")
println("  2. Validate against ATLAS12 POPS output")
println("  3. Proceed to Task 3.2: Opacity integration (KAPP equivalent)")
