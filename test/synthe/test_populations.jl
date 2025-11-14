"""
Test population solver (Saha-Boltzmann statistics)

Tests for ionization fractions, excitation populations, and charge conservation.

This file follows TDD methodology:
- RED: Write failing tests first
- GREEN: Implement minimal code to pass
- REFACTOR: Clean up and optimize

Implements Pure Julia equivalent of atlas7v POPS subroutine.

Validation uses:
- Gray (2005) "Observations and Analysis of Stellar Photospheres"
- Mihalas (1978) "Stellar Atmospheres"
- ATLAS12 reference values

Author: Claude (Local), Paula Coelho
Date: 2025-11-14
"""

using Test

# Add src/Synthe to load path
push!(LOAD_PATH, joinpath(@__DIR__, "../../src/Synthe/src"))

using Synthe

@testset "Partition Functions" begin
    @testset "Hydrogen partition functions" begin
        @testset "H I (neutral hydrogen)" begin
            # Ground state degeneracy g = 2 (spin states)
            # At low T: Z ≈ 2
            # At high T: Z > 2 (excited states contribute)

            T_low = 3000.0  # K
            T_high = 10000.0  # K

            Z_low = partition_function(1, 0, T_low)
            Z_high = partition_function(1, 0, T_high)

            # Ground state degeneracy
            @test Z_low ≈ 2.0 rtol=0.1

            # Should increase with temperature (more excited states)
            @test Z_high >= Z_low

            # Finite and positive
            @test isfinite(Z_low)
            @test Z_low > 0.0
        end

        @testset "H II (ionized hydrogen - proton)" begin
            # No electrons → Z = 1 (only nuclear spin, but we ignore it)
            T = 5000.0

            Z = partition_function(1, 1, T)

            # Should be exactly 1 (no internal structure)
            @test Z ≈ 1.0 atol=1.0e-10

            # Temperature independent for fully ionized
            Z_hot = partition_function(1, 1, 20000.0)
            @test Z_hot ≈ 1.0 atol=1.0e-10
        end
    end

    @testset "Helium partition functions" begin
        @testset "He I (neutral helium)" begin
            # Ground state: 1s² (g=1)
            # First excited: 2s (E ≈ 19.8 eV)
            T_low = 3000.0
            T_solar = 5777.0
            T_high = 15000.0

            Z_low = partition_function(2, 0, T_low)
            Z_solar = partition_function(2, 0, T_solar)
            Z_high = partition_function(2, 0, T_high)

            # At low T: Z ≈ 1 (only ground state)
            @test Z_low ≈ 1.0 rtol=0.2

            # Increases with T
            @test Z_high > Z_solar > Z_low

            # All finite and positive
            @test isfinite(Z_low) && Z_low > 0.0
            @test isfinite(Z_high) && Z_high > 0.0
        end

        @testset "He II (singly ionized - hydrogenic)" begin
            # Like H I but Z=2: g = 2
            T = 10000.0

            Z = partition_function(2, 1, T)

            # Should be ≈ 2 (ground state degeneracy)
            @test Z ≈ 2.0 rtol=0.2
        end

        @testset "He III (fully ionized)" begin
            # No electrons → Z = 1
            T = 20000.0

            Z = partition_function(2, 2, T)

            @test Z ≈ 1.0 atol=1.0e-10
        end
    end

    @testset "Temperature dependence" begin
        # General property: Z(T) should increase or stay constant with T
        element = 1
        ion_stage = 0

        T_values = [3000.0, 5000.0, 7000.0, 10000.0]
        Z_values = [partition_function(element, ion_stage, T) for T in T_values]

        # Should be monotonically increasing (or constant)
        for i in 2:length(Z_values)
            @test Z_values[i] >= Z_values[i-1]
        end
    end

    @testset "Physical bounds" begin
        # Z should always be >= ground state degeneracy (minimum)
        # For most atoms, g_0 ≈ 1-2

        for element in [1, 2]
            for ion_stage in 0:element
                Z = partition_function(element, ion_stage, 5000.0)

                # Should be at least 1 (ground state)
                @test Z >= 1.0

                # Should be finite
                @test isfinite(Z)
            end
        end
    end
end

@testset "Saha Ionization Ratio" begin
    @testset "Hydrogen at solar conditions" begin
        # Solar photosphere: T ≈ 5777 K, n_e ≈ 10^14 cm⁻³
        # H ionization potential: χ = 13.6 eV
        # Expected: ~50% H I, ~50% H II

        element = 1
        ion_stage = 0  # H I → H II
        T = 5777.0
        n_e = 1.0e14
        χ_ion = 13.598  # eV

        ratio = saha_ionization_ratio(element, ion_stage, T, n_e, χ_ion)

        # ratio = n(H II) / n(H I)
        # If ratio ≈ 1, then ~50% ionized
        @test ratio ≈ 1.0 rtol=0.5  # Within factor of 2

        # Should be positive and finite
        @test ratio > 0.0
        @test isfinite(ratio)
    end

    @testset "Temperature dependence" begin
        # Higher T → more ionization → higher ratio
        element = 1
        ion_stage = 0
        n_e = 1.0e14
        χ_ion = 13.598

        T_cool = 4000.0
        T_hot = 8000.0

        ratio_cool = saha_ionization_ratio(element, ion_stage, T_cool, n_e, χ_ion)
        ratio_hot = saha_ionization_ratio(element, ion_stage, T_hot, n_e, χ_ion)

        @test ratio_hot > ratio_cool
    end

    @testset "Electron density dependence" begin
        # Higher n_e → more recombination → lower ratio
        element = 1
        ion_stage = 0
        T = 6000.0
        χ_ion = 13.598

        n_e_low = 1.0e13
        n_e_high = 1.0e15

        ratio_low = saha_ionization_ratio(element, ion_stage, T, n_e_low, χ_ion)
        ratio_high = saha_ionization_ratio(element, ion_stage, T, n_e_high, χ_ion)

        @test ratio_low > ratio_high

        # Should scale approximately as 1/n_e
        # ratio ∝ 1/n_e, so ratio_low / ratio_high ≈ n_e_high / n_e_low = 100
        @test (ratio_low / ratio_high) ≈ 100.0 rtol=0.3
    end

    @testset "Ionization potential dependence" begin
        # Higher χ → harder to ionize → lower ratio
        element = 2  # He (for variety)
        ion_stage = 0
        T = 10000.0
        n_e = 1.0e14

        χ_easy = 10.0  # eV (hypothetical)
        χ_hard = 20.0  # eV

        ratio_easy = saha_ionization_ratio(element, ion_stage, T, n_e, χ_easy)
        ratio_hard = saha_ionization_ratio(element, ion_stage, T, n_e, χ_hard)

        @test ratio_easy > ratio_hard
    end

    @testset "Physical bounds" begin
        # Ratio should always be positive and finite
        element = 1
        ion_stage = 0

        # Extreme conditions
        ratios = [
            saha_ionization_ratio(element, ion_stage, 3000.0, 1.0e12, 13.598),
            saha_ionization_ratio(element, ion_stage, 20000.0, 1.0e16, 13.598)
        ]

        for ratio in ratios
            @test ratio > 0.0
            @test isfinite(ratio)
        end
    end
end

println("✅ Population tests defined (RED phase).")
println("📝 Implement functions in src/Synthe/src/populations.jl to make tests pass (GREEN phase).")
