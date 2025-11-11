"""
Test suite for synbeg initialization (Task 2)

Tests the fort.93 parameter initialization module
"""

using Test
using Synthe

@testset "synbeg: Parameter Initialization" begin
    @testset "Basic initialization" begin
        config = SyntheConfig(
            wave_start = 5000.0,
            wave_end = 5100.0,
            resolving_power = 50000.0,
            turbulent_velocity = 2.0,
            vacuum_wavelengths = true,
            nlte = false,
            cutoff = 0.001
        )

        params = synbeg_initialize(config)

        # Validate basic parameters
        @test params.wave_start ≈ 5000.0
        @test params.wave_end ≈ 5100.0
        @test params.resolving_power ≈ 50000.0
    end

    @testset "Logarithmic wavelength grid" begin
        config = SyntheConfig(
            wave_start = 5000.0,
            wave_end = 5100.0,
            resolving_power = 50000.0,
            turbulent_velocity = 2.0,
            vacuum_wavelengths = true,
            nlte = false,
            cutoff = 0.001
        )

        params = synbeg_initialize(config)

        # Logarithmic spacing: Δλ/λ = 1/R
        expected_ratio_lg = log(1.0 + 1.0/config.resolving_power)
        @test params.ratio_lg ≈ expected_ratio_lg rtol=1e-10

        # Number of points
        n_points_expected = floor(Int, log(config.wave_end / config.wave_start) / expected_ratio_lg) + 1
        @test params.n_points == n_points_expected

        # Grid start index
        @test params.ix_wave_start >= 0
    end

    @testset "Wavelength grid generation" begin
        config = SyntheConfig(
            wave_start = 5000.0,
            wave_end = 5100.0,
            resolving_power = 50000.0,
            turbulent_velocity = 2.0,
            vacuum_wavelengths = true,
            nlte = false,
            cutoff = 0.001
        )

        wavelengths = wavelength_grid(config)

        # Validate grid properties
        @test length(wavelengths) > 0
        @test wavelengths[1] >= config.wave_start
        @test wavelengths[end] <= config.wave_end

        # Check logarithmic spacing
        ratios = wavelengths[2:end] ./ wavelengths[1:end-1]
        expected_ratio = 1.0 + 1.0/config.resolving_power
        @test all(r -> isapprox(r, expected_ratio, rtol=1e-8), ratios)
    end

    @testset "NBUFF index calculation" begin
        config = SyntheConfig(
            wave_start = 5000.0,
            wave_end = 5100.0,
            resolving_power = 50000.0,
            turbulent_velocity = 2.0,
            vacuum_wavelengths = true,
            nlte = false,
            cutoff = 0.001
        )

        params = synbeg_initialize(config)

        # Test wavelength to index conversion
        test_wavelengths = [5000.0, 5050.0, 5100.0]

        for wave in test_wavelengths
            nbuff = wavelength_to_nbuff(wave, params)
            @test nbuff >= 1
            @test nbuff <= params.n_points
        end

        # Test that nearby wavelengths map to nearby indices
        nbuff1 = wavelength_to_nbuff(5000.0, params)
        nbuff2 = wavelength_to_nbuff(5000.1, params)
        @test abs(nbuff2 - nbuff1) <= 2  # Should be close
    end

    @testset "Edge cases" begin
        # Very small wavelength range
        config_small = SyntheConfig(
            wave_start = 5000.0,
            wave_end = 5001.0,
            resolving_power = 50000.0,
            turbulent_velocity = 2.0,
            vacuum_wavelengths = true,
            nlte = false,
            cutoff = 0.001
        )

        params_small = synbeg_initialize(config_small)
        @test params_small.n_points > 0

        # High resolution
        config_hires = SyntheConfig(
            wave_start = 5000.0,
            wave_end = 5100.0,
            resolving_power = 300000.0,  # Very high resolution
            turbulent_velocity = 2.0,
            vacuum_wavelengths = true,
            nlte = false,
            cutoff = 0.001
        )

        params_hires = synbeg_initialize(config_hires)
        @test params_hires.n_points > params_small.n_points
    end
end
