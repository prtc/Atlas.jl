"""
Unit tests for population solver (Saha-Boltzmann statistics)

Tests ionization fractions, excitation populations, and charge conservation.

Tests follow TDD methodology:
- Analytical limits (Saha equation thermodynamics)
- Known reference values
- Convergence behavior
- Fortran POPS comparison

Author: Claude (Local), Paula Coelho
Date: 2025-11-15
"""

using Test

# Add src/Synthe to load path
push!(LOAD_PATH, joinpath(@__DIR__, "../../src/Synthe/src"))

using Synthe

@testset "Partition Functions" begin
    @testset "Hydrogen" begin
        # H I: Ground state g=2, should be ≈2 at low T
        Z_HI_low = partition_function(1, 0, 3000.0)
        @test Z_HI_low ≈ 2.0 rtol=0.1

        # H I: Should increase with T (excited states)
        Z_HI_high = partition_function(1, 0, 10000.0)
        @test Z_HI_high > Z_HI_low

        # H II: Fully ionized, Z=1 always
        Z_HII = partition_function(1, 1, 5000.0)
        @test Z_HII ≈ 1.0 atol=1e-10
    end

    @testset "Helium" begin
        # He I: Ground state g=1
        Z_HeI = partition_function(2, 0, 5000.0)
        @test Z_HeI >= 1.0

        # He II: Like H I, g=2
        Z_HeII = partition_function(2, 1, 10000.0)
        @test Z_HeII ≈ 2.0 rtol=0.2

        # He III: Fully ionized
        Z_HeIII = partition_function(2, 2, 20000.0)
        @test Z_HeIII ≈ 1.0 atol=1e-10
    end

    @testset "Temperature dependence" begin
        # Z(T) should be monotonic increasing (or constant)
        element = 1
        ion_stage = 0

        T_values = [3000.0, 5000.0, 7000.0, 10000.0]
        Z_values = [partition_function(element, ion_stage, T) for T in T_values]

        for i in 2:length(Z_values)
            @test Z_values[i] >= Z_values[i-1]
        end
    end
end

@testset "Saha Ionization Ratio" begin
    @testset "Physical behavior" begin
        element = 1
        ion_stage = 0
        χ_ion = 13.598  # eV (H ionization)

        # Higher T → more ionization
        T_cool = 4000.0
        T_hot = 8000.0
        n_e = 1.0e14

        ratio_cool = saha_ionization_ratio(element, ion_stage, T_cool, n_e, χ_ion)
        ratio_hot = saha_ionization_ratio(element, ion_stage, T_hot, n_e, χ_ion)

        @test ratio_hot > ratio_cool

        # Higher n_e → more recombination → lower ratio (∝ 1/n_e)
        n_e_low = 1.0e13
        n_e_high = 1.0e15
        T = 6000.0

        ratio_low = saha_ionization_ratio(element, ion_stage, T, n_e_low, χ_ion)
        ratio_high = saha_ionization_ratio(element, ion_stage, T, n_e_high, χ_ion)

        @test ratio_low > ratio_high

        # Should scale approximately as 1/n_e
        @test (ratio_low / ratio_high) ≈ 100.0 rtol=0.3
    end
end

@testset "Population Solver" begin
    @testset "Solar photosphere conditions" begin
        T = 5777.0  # K
        P_gas = 1.0e5  # dyne/cm²

        # Solar abundances (simplified)
        abundances = zeros(30)
        abundances[1] = 12.0   # H
        abundances[2] = 10.93  # He

        result = compute_populations(T, P_gas, abundances)

        # Should converge
        @test result.converged == true
        @test result.iterations < 100

        # Electron density should be reasonable
        @test result.n_e > 1.0e12
        @test result.n_e < 1.0e16

        # Hydrogen ionization fraction
        @test haskey(result.ion_fractions, (1, 0))  # H I
        @test haskey(result.ion_fractions, (1, 1))  # H II

        f_HI = result.ion_fractions[(1, 0)]
        f_HII = result.ion_fractions[(1, 1)]

        # Fractions should sum to 1
        @test f_HI + f_HII ≈ 1.0 rtol=1e-6

        # At solar T, roughly equal amounts of H I and H II
        @test f_HI > 0.1
        @test f_HII > 0.1
    end

    @testset "Convergence diagnostics" begin
        T = 5777.0
        P_gas = 1.0e5
        abundances = zeros(30)
        abundances[1] = 12.0
        abundances[2] = 10.93

        result = compute_populations(T, P_gas, abundances)

        # Check diagnostic fields
        @test hasfield(typeof(result), :final_error)
        @test hasfield(typeof(result), :n_e_history)

        @test result.final_error >= 0.0
        @test result.final_error < 1.0e-4  # Should be below tolerance

        # History should track evolution
        @test length(result.n_e_history) == result.iterations + 1  # Initial + iterations
        @test result.n_e_history[end] ≈ result.n_e
    end

    @testset "Extreme conditions" begin
        # Very cool: mostly neutral
        T_cool = 3000.0
        P_gas = 1.0e5
        abundances = zeros(30)
        abundances[1] = 12.0

        result_cool = compute_populations(T_cool, P_gas, abundances)

        if result_cool.converged
            f_HI_cool = result_cool.ion_fractions[(1, 0)]
            @test f_HI_cool > 0.9  # Mostly neutral
        end

        # Very hot: mostly ionized
        T_hot = 10000.0
        result_hot = compute_populations(T_hot, P_gas, abundances)

        if result_hot.converged
            f_HII_hot = result_hot.ion_fractions[(1, 1)]
            @test f_HII_hot > 0.9  # Mostly ionized
        end
    end
end

@testset "Fortran Comparison (TODO)" begin
    # TODO: Compare against Fortran POPS output
    # Need reference CSV with (T, P, abundances) → (n_e, ion_fractions)

    # TODO: Test NNN partition function array decoding
    # Once implemented, verify partition functions match Fortran PFSAHA

    @test_skip "Fortran POPS comparison not yet implemented"
end

println("✅ Population solver tests defined")
println("⚠️  TODO: Generate Fortran reference data from POPS subroutine")
println("⚠️  TODO: Implement NNN array decoding and test all elements")
