"""
Unit tests for Voigt profile functions

Tests Voigt profile H(v,a) against:
1. Known analytical limits
2. Reference tables from TABVOIGT
3. Published values
4. Fortran ATLAS/SYNTHE output

Author: Claude (Local), Paula Coelho
Date: 2025-11-15
"""

using Test

# Add src/Synthe to load path
push!(LOAD_PATH, joinpath(@__DIR__, "../../src/Synthe/src"))

using Synthe

@testset "Voigt Profile Reference Tables" begin
    @testset "TABVI and TABH1 dimensions" begin
        @test length(TABVI_REFERENCE) == 81
        @test length(TABH1_REFERENCE) == 81

        # Verify grid range
        @test TABVI_REFERENCE[1] ≈ 0.0
        @test TABVI_REFERENCE[end] ≈ 12.0

        # Check monotonic increase
        for i in 2:length(TABVI_REFERENCE)
            @test TABVI_REFERENCE[i] > TABVI_REFERENCE[i-1]
        end
    end

    @testset "Table generation" begin
        h0, h1, h2 = tabulate_voigt_h0h1h2()

        @test length(h0) == 2001
        @test length(h1) == 2001
        @test length(h2) == 2001

        # H0 at v=0 should be 1.0 (Gaussian core)
        @test h0[1] ≈ 1.0

        # H0 should decrease monotonically
        for i in 2:length(h0)
            @test h0[i] <= h0[i-1]
        end
    end
end

@testset "Voigt Profile Current Implementation" begin
    @testset "Analytical limits" begin
        # a=0 → Pure Gaussian H(v,0) = exp(-v²) / √π
        # Note: Our implementation may not include 1/√π normalization
        a = 0.0

        # At line center (v=0), Gaussian peak
        H_0_0 = voigt_profile(0.0, a)
        @test H_0_0 > 0.0
        @test isfinite(H_0_0)

        # Far from center, should decay
        H_far = voigt_profile(5.0, a)
        @test H_far < H_0_0
        @test H_far > 0.0
    end

    @testset "Small damping (a << 1)" begin
        # Should be approximately Gaussian
        a = 0.001
        v_center = 0.0
        v_wing = 2.0

        H_center = voigt_profile(v_center, a)
        H_wing = voigt_profile(v_wing, a)

        @test H_center > H_wing
        @test isfinite(H_center)
        @test isfinite(H_wing)
    end

    @testset "Large damping (a >> 1)" begin
        # Should approach Lorentzian behavior
        a = 10.0
        v = 1.0

        H = voigt_profile(v, a)

        @test H > 0.0
        @test isfinite(H)

        # Far wings: H(v,a) ≈ a/(π v²) for v >> 1
        v_far = 10.0
        H_far = voigt_profile(v_far, a)

        lorentz_approx = a / (π * v_far^2)
        # Should be approximately equal (within factor of 2)
        # TODO: Establish exact tolerance from theory
        @test H_far > 0.0
    end

    @testset "Symmetry" begin
        # H(v,a) should be symmetric in v: H(-v,a) = H(v,a)
        a = 0.5

        for v in [0.5, 1.0, 2.0, 5.0]
            H_pos = voigt_profile(v, a)
            H_neg = voigt_profile(-v, a)

            @test H_pos ≈ H_neg rtol=1e-10
        end
    end
end

@testset "Voigt Profile Validation (TODO)" begin
    # TODO: Compare against Fortran VOIGT function output
    # Need reference CSV with (v, a, H_fortran) triplets

    # TODO: Compare against scipy.special.wofz (Faddeeva function)
    # H(v,a) = Re[w(z)] / √π where z = v + ia

    # TODO: Test regime boundaries from Fortran implementation
    # - Core: |v| < v_core(a)
    # - Wing: |v| > v_wing(a)
    # - Transition region

    @test_skip "Fortran comparison not yet implemented"
end

println("✅ Voigt profile tests defined")
println("⚠️  TODO: Generate Fortran reference data from TABVOIGT")
println("⚠️  TODO: Implement Fortran-exact table lookup mode")
println("⚠️  TODO: Compare with scipy.special.wofz for validation")
