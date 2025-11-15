"""
Unit tests for H⁻ opacity functions

Tests bound-free and free-free opacity calculations against:
1. Lookup table values (Wishart 1979, Bell & Berrington 1987)
2. Known physical behavior
3. Published reference values

Author: Claude (Local), Paula Coelho
Date: 2025-11-15
"""

using Test

# Add src/Synthe to load path
push!(LOAD_PATH, joinpath(@__DIR__, "../../src/Synthe/src"))

using Synthe

@testset "H⁻ Opacity Lookup Tables" begin
    @testset "Bound-Free Tables" begin
        # Verify table dimensions
        @test length(HMINUS_BF_WAVELENGTHS) == 85
        @test length(HMINUS_BF_CROSS_SECTIONS) == 85

        # Verify wavelength range
        @test HMINUS_BF_WAVELENGTHS[1] ≈ 18.0  # nm
        @test HMINUS_BF_WAVELENGTHS[end] ≈ 1643.91  # nm

        # TODO: Verify specific values against Wishart (1979) Table 1
        # Example: λ=50nm should have σ≈29.23×10⁻¹⁸ cm²
        # Need to extract exact published values
    end

    @testset "Free-Free Tables" begin
        # Verify table dimensions
        @test length(HMINUS_FF_WAVELENGTHS_INVERSE_K) == 22
        @test length(HMINUS_FF_THETA_VALUES) == 11
        @test size(HMINUS_FF_TABLE) == (11, 22)

        # Verify grid ranges
        @test HMINUS_FF_WAVELENGTHS_INVERSE_K[1] ≈ 0.50
        @test HMINUS_FF_WAVELENGTHS_INVERSE_K[end] ≈ 0.006
        @test HMINUS_FF_THETA_VALUES[1] ≈ 0.5
        @test HMINUS_FF_THETA_VALUES[end] ≈ 3.6

        # TODO: Verify specific values against Bell & Berrington (1987)
    end
end

@testset "H⁻ Bound-Free Opacity" begin
    @testset "Interpolation behavior" begin
        T = 5777.0  # K (solar)
        P_e = 1.0e14  # cm⁻³ (typical photosphere)

        # Test at table grid points
        λ_1 = 500.0  # Å → 50 nm
        σ_1 = hminus_bf(λ_1, T, P_e)
        @test σ_1 > 0.0
        @test isfinite(σ_1)

        # Test interpolation between points
        λ_2 = 550.0  # Å (between grid points)
        σ_2 = hminus_bf(λ_2, T, P_e)
        @test σ_2 > 0.0
        @test isfinite(σ_2)

        # TODO: Test edge cases (λ < 18nm, λ > 1644nm)
        # Should extrapolate or return 0
    end

    @testset "Physical behavior" begin
        T_cold = 4000.0
        T_hot = 7000.0
        P_e = 1.0e14
        λ = 500.0  # Å

        σ_cold = hminus_bf(λ, T_cold, P_e)
        σ_hot = hminus_bf(λ, T_hot, P_e)

        # Higher temperature → more ionization → different opacity
        # (actual behavior depends on Boltzmann factors)
        @test isfinite(σ_cold)
        @test isfinite(σ_hot)

        # TODO: Establish expected temperature dependence from physics
    end
end

@testset "H⁻ Free-Free Opacity" begin
    @testset "Bilinear interpolation" begin
        T = 5777.0
        P_e = 1.0e14
        λ = 5000.0  # Å → 500 nm

        σ = hminus_ff(λ, T, P_e)

        @test σ >= 0.0  # Opacity cannot be negative
        @test isfinite(σ)
    end

    @testset "Wavelength dependence" begin
        T = 5777.0
        P_e = 1.0e14

        # Free-free opacity increases toward IR
        σ_blue = hminus_ff(4000.0, T, P_e)  # Blue
        σ_red = hminus_ff(7000.0, T, P_e)   # Red

        @test σ_red > σ_blue  # IR > UV for free-free

        # TODO: Quantify expected λ dependence (∝ λ³ approximately)
    end
end

@testset "Combined H⁻ Opacity" begin
    @testset "Total opacity sanity checks" begin
        T = 5777.0
        P_e = 1.0e14

        for λ in [4000.0, 5000.0, 6000.0, 7000.0]  # Optical range
            σ_bf = hminus_bf(λ, T, P_e)
            σ_ff = hminus_ff(λ, T, P_e)
            σ_total = σ_bf + σ_ff

            @test σ_total > 0.0
            @test isfinite(σ_total)

            # Typically bound-free dominates in blue
            # Free-free dominates in red
            # (exact crossover depends on conditions)
        end
    end
end

println("✅ H⁻ opacity tests defined")
println("⚠️  TODO: Add reference values from published papers")
println("⚠️  TODO: Add Fortran comparison tests")
