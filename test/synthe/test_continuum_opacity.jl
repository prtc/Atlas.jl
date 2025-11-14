"""
Test continuum opacity sources

Tests for H⁻, H I, He, and electron scattering opacities.

This file contains FAILING tests (RED phase of TDD).
CCW should implement functions in src/Synthe/src/continuum_opacity.jl to make tests pass (GREEN phase).

Validation uses literature values from:
- Gray (2005) "Observations and Analysis of Stellar Photospheres"
- Mihalas (1978) "Stellar Atmospheres"

Author: Claude (Local), Paula Coelho
Date: 2025-11-13
"""

using Test

# Add src/Synthe to load path
push!(LOAD_PATH, joinpath(@__DIR__, "../../src/Synthe/src"))

using Synthe

@testset "H⁻ Bound-Free Opacity" begin
    @testset "Beyond photodetachment threshold → zero opacity" begin
        # H⁻ threshold at 1650 nm = 16500 Å
        # Wavelengths longer than this should have zero opacity
        T = 5000.0  # K
        P_e = 1.0e3  # dyne/cm²

        opacity_far_infrared = hminus_bf(20000.0, T, P_e)  # 20000 Å >> 16500 Å

        @test opacity_far_infrared == 0.0
    end

    @testset "At threshold → opacity should be zero (or very small)" begin
        T = 5000.0
        P_e = 1.0e3

        opacity_threshold = hminus_bf(16500.0, T, P_e)

        @test opacity_threshold ≈ 0.0 atol=1.0e-30
    end

    @testset "Optical wavelengths → finite opacity" begin
        T = 5000.0
        P_e = 1.0e3

        opacity_blue = hminus_bf(4000.0, T, P_e)  # Blue
        opacity_green = hminus_bf(5000.0, T, P_e)  # Green
        opacity_red = hminus_bf(7000.0, T, P_e)  # Red

        # All should be positive
        @test opacity_blue > 0.0
        @test opacity_green > 0.0
        @test opacity_red > 0.0

        # All should be finite
        @test isfinite(opacity_blue)
        @test isfinite(opacity_green)
        @test isfinite(opacity_red)
    end

    @testset "Blue stronger than red (wavelength dependence)" begin
        T = 5000.0
        P_e = 1.0e3

        opacity_blue = hminus_bf(4000.0, T, P_e)
        opacity_red = hminus_bf(7000.0, T, P_e)

        # Shorter wavelengths have stronger absorption
        @test opacity_blue > opacity_red
    end

    @testset "Literature validation - Gray (2005) Table 8.1" begin
        # Gray (2005): λ=5000 Å, T=5000 K, θ=1.008
        # H⁻ bound-free opacity ≈ 4.0×10⁻²⁶ cm²/H⁻ ion
        T = 5000.0
        P_e = 1.0e3  # Typical solar photosphere
        λ = 5000.0

        opacity = hminus_bf(λ, T, P_e)

        # Allow ±20% tolerance for formula differences
        @test opacity ≈ 4.0e-26 rtol=0.2
    end

    @testset "Temperature dependence" begin
        λ = 5000.0
        P_e = 1.0e3

        opacity_cool = hminus_bf(λ, 4000.0, P_e)
        opacity_hot = hminus_bf(λ, 6000.0, P_e)

        # Opacity decreases with temperature (fewer H⁻ ions at high T)
        @test opacity_cool > opacity_hot
    end
end

@testset "H⁻ Free-Free Opacity" begin
    @testset "Always positive and finite" begin
        T = 5000.0
        P_e = 1.0e3

        opacity_uv = hminus_ff(3000.0, T, P_e)
        opacity_optical = hminus_ff(5000.0, T, P_e)
        opacity_infrared = hminus_ff(20000.0, T, P_e)

        @test opacity_uv > 0.0
        @test opacity_optical > 0.0
        @test opacity_infrared > 0.0

        @test isfinite(opacity_uv)
        @test isfinite(opacity_optical)
        @test isfinite(opacity_infrared)
    end

    @testset "Opacity ∝ λ³ (infrared dominates)" begin
        T = 5000.0
        P_e = 1.0e3

        opacity_5000 = hminus_ff(5000.0, T, P_e)
        opacity_10000 = hminus_ff(10000.0, T, P_e)

        # Doubling wavelength → opacity × 8 (λ³ dependence)
        ratio = opacity_10000 / opacity_5000

        @test ratio ≈ 8.0 rtol=0.1  # ±10% tolerance
    end

    @testset "Literature validation - Gray (2005)" begin
        # Gray (2005): λ=10000 Å, T=6000 K
        # H⁻ free-free opacity ≈ 1.5×10⁻²⁶ cm²
        T = 6000.0
        P_e = 1.0e3
        λ = 10000.0

        opacity = hminus_ff(λ, T, P_e)

        @test opacity ≈ 1.5e-26 rtol=0.2
    end

    @testset "Temperature dependence" begin
        λ = 10000.0
        P_e = 1.0e3

        opacity_cool = hminus_ff(λ, 4000.0, P_e)
        opacity_hot = hminus_ff(λ, 8000.0, P_e)

        # Free-free decreases with temperature
        @test opacity_cool > opacity_hot
    end
end

@testset "H I Bound-Free Opacity" begin
    @testset "Lyman series (n=1)" begin
        @testset "Beyond Lyman edge → zero opacity" begin
            # Lyman edge at 912 Å
            T = 5000.0
            n_level = 1

            opacity = hydrogen_bf(1000.0, T, n_level)  # 1000 Å > 912 Å

            @test opacity == 0.0
        end

        @testset "Below Lyman edge → finite opacity" begin
            T = 5000.0
            n_level = 1

            opacity = hydrogen_bf(900.0, T, n_level)  # 900 Å < 912 Å

            @test opacity > 0.0
            @test isfinite(opacity)
        end

        @testset "Literature validation - Lyman edge cross-section" begin
            # Mihalas (1978): σ(912 Å, n=1) ≈ 6.3×10⁻¹⁸ cm²
            T = 5000.0
            n_level = 1
            λ = 911.0  # Just below edge

            opacity = hydrogen_bf(λ, T, n_level)

            @test opacity ≈ 6.3e-18 rtol=0.2
        end
    end

    @testset "Balmer series (n=2)" begin
        @testset "Beyond Balmer edge → zero opacity" begin
            # Balmer edge at 3646 Å
            T = 5000.0
            n_level = 2

            opacity = hydrogen_bf(4000.0, T, n_level)  # 4000 Å > 3646 Å

            @test opacity == 0.0
        end

        @testset "Below Balmer edge → finite opacity" begin
            T = 5000.0
            n_level = 2

            opacity = hydrogen_bf(3600.0, T, n_level)  # 3600 Å < 3646 Å

            @test opacity > 0.0
            @test isfinite(opacity)
        end

        @testset "Literature validation - Balmer edge cross-section" begin
            # Mihalas (1978): σ(3646 Å, n=2) ≈ 1.0×10⁻¹⁷ cm²
            T = 5000.0
            n_level = 2
            λ = 3645.0  # Just below edge

            opacity = hydrogen_bf(λ, T, n_level)

            @test opacity ≈ 1.0e-17 rtol=0.2
        end
    end

    @testset "Paschen series (n=3)" begin
        @testset "Paschen edge at 8204 Å" begin
            T = 5000.0
            n_level = 3

            opacity_above = hydrogen_bf(9000.0, T, n_level)  # Above edge
            opacity_below = hydrogen_bf(8000.0, T, n_level)  # Below edge

            @test opacity_above == 0.0
            @test opacity_below > 0.0
        end
    end

    @testset "Opacity ∝ n^5 (higher levels weaker)" begin
        T = 5000.0
        λ = 900.0  # Below all edges

        opacity_n1 = hydrogen_bf(λ, T, 1)
        opacity_n2 = hydrogen_bf(λ, T, 2)
        opacity_n3 = hydrogen_bf(λ, T, 3)

        # n=1 strongest, n=3 weakest
        @test opacity_n1 > opacity_n2 > opacity_n3
    end
end

@testset "Electron Scattering (Thomson)" begin
    @testset "Correct Thomson cross-section constant" begin
        # CODATA 2018: σ_thomson = 6.6524587×10⁻²⁵ cm²
        n_e = 1.0  # Test with n_e = 1 cm⁻³

        opacity = electron_scattering(n_e)

        @test opacity ≈ 6.65e-25 rtol=0.001  # ±0.1% tolerance
    end

    @testset "Linear with electron density" begin
        n_e_1 = 1.0e14
        n_e_2 = 2.0e14

        opacity_1 = electron_scattering(n_e_1)
        opacity_2 = electron_scattering(n_e_2)

        # Doubling density → doubling opacity
        @test opacity_2 ≈ 2.0 * opacity_1 rtol=1.0e-10
    end

    @testset "Solar photosphere validation" begin
        # Solar photosphere: n_e ≈ 10¹⁴ cm⁻³
        # Expected opacity: 6.65×10⁻²⁵ × 10¹⁴ = 6.65×10⁻¹¹ cm⁻¹
        n_e = 1.0e14

        opacity = electron_scattering(n_e)

        @test opacity ≈ 6.65e-11 rtol=0.01
    end

    @testset "Always positive and finite" begin
        n_e_low = 1.0e10
        n_e_high = 1.0e18

        @test electron_scattering(n_e_low) > 0.0
        @test electron_scattering(n_e_high) > 0.0
        @test isfinite(electron_scattering(n_e_low))
        @test isfinite(electron_scattering(n_e_high))
    end

    @testset "Zero density → zero opacity" begin
        opacity = electron_scattering(0.0)
        @test opacity == 0.0
    end
end

@testset "Gaunt Factor" begin
    @testset "At threshold (x=1) → g ≈ 1.0" begin
        g = gaunt_factor(1, 1.0)
        @test g ≈ 1.0 atol=0.1
    end

    @testset "Above threshold (x>1) → g slightly > 1" begin
        g = gaunt_factor(1, 1.5)
        @test g > 1.0
        @test g < 1.2  # Should be within physical bounds
    end

    @testset "Higher n → weaker n-dependence" begin
        x = 2.0

        g_n1 = gaunt_factor(1, x)
        g_n2 = gaunt_factor(2, x)
        g_n3 = gaunt_factor(5, x)

        # All should be close to 1.0, with n=1 deviating most
        deviation_n1 = abs(g_n1 - 1.0)
        deviation_n2 = abs(g_n2 - 1.0)
        deviation_n3 = abs(g_n3 - 1.0)

        @test deviation_n1 >= deviation_n2 >= deviation_n3
    end

    @testset "Physical bounds: 0.8 <= g <= 1.2" begin
        # Test various n and x combinations
        for n in 1:5
            for x in [1.0, 1.5, 2.0, 3.0, 5.0]
                g = gaunt_factor(n, x)
                @test 0.8 <= g <= 1.2
            end
        end
    end

    @testset "Always finite" begin
        g = gaunt_factor(1, 1.0)
        @test isfinite(g)

        g = gaunt_factor(10, 100.0)
        @test isfinite(g)
    end
end

@testset "Total Continuum Opacity Integration" begin
    @testset "Combine all sources at solar conditions" begin
        # Solar photosphere: T ≈ 5780 K, P_e ≈ 10³ dyne/cm², n_e ≈ 10¹⁴ cm⁻³
        T = 5780.0
        P_e = 1.0e3
        n_e = 1.0e14
        λ = 5000.0  # Optical (V band)

        # Individual sources
        κ_hminus_bf = hminus_bf(λ, T, P_e)
        κ_hminus_ff = hminus_ff(λ, T, P_e)
        κ_h1_bf = hydrogen_bf(λ, T, 2)  # Balmer continuum (n=2)
        κ_es = electron_scattering(n_e)

        # Total continuum opacity
        κ_total = κ_hminus_bf + κ_hminus_ff + κ_h1_bf + κ_es

        @test κ_total > 0.0
        @test isfinite(κ_total)

        # H⁻ should dominate in optical for solar-type stars
        @test κ_hminus_bf > κ_h1_bf  # H⁻ bf > H I bf
    end

    @testset "Wavelength scan across optical spectrum" begin
        T = 5780.0
        P_e = 1.0e3
        n_e = 1.0e14

        wavelengths = [3000.0, 4000.0, 5000.0, 6000.0, 7000.0, 8000.0]  # Å
        opacities = Float64[]

        for λ in wavelengths
            κ_total = hminus_bf(λ, T, P_e) + hminus_ff(λ, T, P_e) +
                      hydrogen_bf(λ, T, 2) + electron_scattering(n_e)
            push!(opacities, κ_total)
        end

        # All should be positive and finite
        @test all(κ -> κ > 0.0, opacities)
        @test all(κ -> isfinite(κ), opacities)

        # General trend: opacity decreases toward red (except near edges)
        # Not strict monotonic due to H I edges, but UV > IR generally
        @test opacities[1] > opacities[end]  # 3000 Å > 8000 Å
    end
end

println("✅ Continuum opacity tests defined (RED phase).")
println("📝 Implement functions in src/Synthe/src/continuum_opacity.jl to make tests pass (GREEN phase).")
println("📚 Validation sources: Gray (2005), Mihalas (1978)")
