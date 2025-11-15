"""
Unit tests for NNN partition function decoding

Tests the Fortran-exact partition function implementation using NNN data.

Author: Claude (Local), Paula Coelho
Date: 2025-11-15
"""

using Test

# Add src/Synthe to load path
push!(LOAD_PATH, joinpath(@__DIR__, "../../src/Synthe/src"))

using Synthe

@testset "NNN Decoding" begin
    @testset "decode_nnn_entry basic" begin
        # Test case 1: H I first entry (200020001)
        k1, k3, kscale = Synthe.decode_nnn_entry(Int32(200020001))
        @test k1 == 20002
        @test k3 == 0
        @test kscale == 1

        # Scale should be 0.01
        scale = Synthe.get_scale_factor(kscale)
        @test scale == 0.01

        # Partition value: 20002 × 0.01 = 200.02
        p = Float64(k1) * scale
        @test p ≈ 200.02

        # Test case 2: Different scale (378953411 from H I)
        k1, k3, kscale = Synthe.decode_nnn_entry(Int32(378953411))
        @test k1 == 37895
        @test k3 == 341
        @test kscale == 1
        scale = Synthe.get_scale_factor(kscale)
        @test scale == 0.01
    end

    @testset "NNN100 and g extraction" begin
        # H I: NNN(6,1) = 1359502 → NNN100=13595, G=2
        nnn100, g = Synthe.extract_nnn100_and_g(Int32(1359502))

        # nnn100 should be 13595/100 = 135.95
        # (This is a characteristic energy code, not IP directly)
        # IP is stored separately in POTION array in Fortran
        @test nnn100 ≈ 135.95
        @test g == 2.0  # H I ground state is 2S+1 = 2

        # Test that we can extract valid values
        @test nnn100 > 0.0
        @test g > 0.0
    end

    @testset "Scale factor table" begin
        @test Synthe.get_scale_factor(0) == 0.001
        @test Synthe.get_scale_factor(1) == 0.01
        @test Synthe.get_scale_factor(2) == 0.1
        @test Synthe.get_scale_factor(3) == 1.0
    end
end

@testset "Partition Function NNN Data Access" begin
    @testset "get_partition_data" begin
        # Test accessing H I data (index 1)
        data = Synthe.get_partition_data(1)
        @test length(data) == 6

        # All values should be finite integers
        for val in data
            @test isfinite(Float64(val))
        end

        # Test accessing He I data (index 3)
        data_he = Synthe.get_partition_data(3)
        @test length(data_he) == 6
    end

    @testset "Data availability check" begin
        @test Synthe.partition_function_fortran_available() == true
    end
end

@testset "Partition Function Fortran Mode" begin
    @testset "Basic functionality" begin
        # H I at 5777 K
        Z_HI = Synthe.partition_function_fortran(1, 0, 5777.0)

        # Should be ≥ ground state degeneracy (2)
        @test Z_HI >= 2.0

        # Should be finite and positive
        @test isfinite(Z_HI)
        @test Z_HI > 0.0

        # At solar T, should be modest (not huge)
        @test Z_HI < 100.0
    end

    @testset "Temperature dependence" begin
        # Z(T) should increase with T for atoms
        T_values = [3000.0, 5000.0, 7000.0, 10000.0]
        Z_values = [Synthe.partition_function_fortran(1, 0, T) for T in T_values]

        # Should be monotonically increasing (or at least non-decreasing)
        for i in 2:length(Z_values)
            @test Z_values[i] >= Z_values[i-1]
        end
    end

    @testset "Multiple elements" begin
        T = 5777.0

        # Test first few elements
        for element in 1:10
            # Neutral atom
            Z = Synthe.partition_function_fortran(element, 0, T)
            @test Z >= 1.0
            @test isfinite(Z)

            # First ion
            if element > 1  # Skip H II (fully ionized)
                Z_ion = Synthe.partition_function_fortran(element, 1, T)
                @test Z_ion >= 1.0
                @test isfinite(Z_ion)
            end
        end
    end

    @testset "Input validation" begin
        # Invalid element
        @test_throws ArgumentError Synthe.partition_function_fortran(0, 0, 5000.0)
        @test_throws ArgumentError Synthe.partition_function_fortran(100, 0, 5000.0)

        # Invalid ion stage
        @test_throws ArgumentError Synthe.partition_function_fortran(1, -1, 5000.0)

        # Invalid temperature
        @test_throws ArgumentError Synthe.partition_function_fortran(1, 0, 0.0)
        @test_throws ArgumentError Synthe.partition_function_fortran(1, 0, -1000.0)
    end
end

@testset "Comparison with analytical partition functions" begin
    # Compare Fortran mode with analytical formulas for H and He

    @testset "Hydrogen partition function" begin
        # At low T, both should give ≈ 2 (ground state only)
        T_low = 3000.0
        Z_analytical = Synthe.partition_function(1, 0, T_low)
        Z_fortran = Synthe.partition_function_fortran(1, 0, T_low)

        # Both should be close to 2
        @test Z_analytical ≈ 2.0 rtol=0.1
        @test Z_fortran ≈ 2.0 rtol=0.5  # Fortran may have different low-T handling

        # At high T, should be higher
        T_high = 10000.0
        Z_high = Synthe.partition_function_fortran(1, 0, T_high)
        @test Z_high > 2.0
    end

    @testset "Helium partition function" begin
        # He I ground state is singlet (g=1)
        T = 5000.0
        Z_fortran = Synthe.partition_function_fortran(2, 0, T)

        # Should be close to 1 at moderate T
        @test Z_fortran >= 1.0
        @test Z_fortran < 10.0  # Not too high at 5000 K
    end
end

println("✅ Partition function NNN decoding tests defined")
println("⚠️  Note: Ionization potentials stored separately in POTION array")
println("⚠️  TODO: Add reference comparison with Fortran PFSAHA output")
