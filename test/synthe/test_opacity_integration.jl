"""
Test opacity integration (continuum + line, weighted by populations)

Tests for KAPP equivalent - combining all opacity sources.

This file follows TDD methodology:
- RED: Write failing tests first
- GREEN: Implement minimal code to pass
- REFACTOR: Clean up and optimize

Implements Pure Julia equivalent of atlas7v KAPP subroutine.

Validation uses:
- Gray (2005) "Observations and Analysis of Stellar Photospheres"
- Solar photosphere conditions

Author: Claude (Local), Paula Coelho
Date: 2025-11-14
"""

using Test

# Add src/Synthe to load path
push!(LOAD_PATH, joinpath(@__DIR__, "../../src/Synthe/src"))

using Synthe

@testset "Continuum Opacity Integration" begin
    # Setup: Solar photosphere conditions
    T = 5777.0         # K
    P_gas = 1.0e5      # dyne/cm²
    P_e = 1.0e3        # dyne/cm² (electron pressure)
    λ_optical = 5000.0 # Å (V band)

    # Compute populations
    abundances = zeros(30)
    abundances[1] = 12.0   # H
    abundances[2] = 10.93  # He

    pops = compute_populations(T, P_gas, abundances)

    @testset "Solar photosphere - continuum opacity" begin
        κ_cont = continuum_opacity_total(λ_optical, T, P_e, pops)

        # Should be positive and finite
        @test κ_cont > 0.0
        @test isfinite(κ_cont)

        # Typical solar photosphere: κ ≈ 10^-11 to 10^-10 cm⁻¹
        # (depends on exact density, but should be this order of magnitude)
        @test κ_cont > 1.0e-15  # Not too small
        @test κ_cont < 1.0e-5   # Not too large
    end

    @testset "H⁻ dominates in optical for solar-type stars" begin
        # Individual components
        n_e = pops.n_e
        n_HI = pops.number_densities[(1, 0)]

        # H⁻ contributions
        κ_hminus_bf = n_HI * n_e * hminus_bf(λ_optical, T, P_e)
        κ_hminus_ff = n_HI * n_e * hminus_ff(λ_optical, T, P_e)
        κ_hminus = κ_hminus_bf + κ_hminus_ff

        # H I bound-free
        κ_h1_bf = 0.0
        for n_level in 1:5
            κ_h1_bf += n_HI * hydrogen_bf(λ_optical, T, n_level)
        end

        # Electron scattering
        κ_es = electron_scattering(n_e)

        # Total
        κ_total = continuum_opacity_total(λ_optical, T, P_e, pops)

        # H⁻ should dominate
        @test κ_hminus > κ_h1_bf
        @test κ_hminus > κ_es

        # Sum should match
        @test κ_total ≈ (κ_hminus + κ_h1_bf + κ_es) rtol=0.01
    end

    @testset "Wavelength dependence" begin
        wavelengths = [3000.0, 4000.0, 5000.0, 6000.0, 7000.0, 8000.0]  # Å
        opacities = [continuum_opacity_total(λ, T, P_e, pops) for λ in wavelengths]

        # All should be positive and finite
        @test all(κ -> κ > 0.0, opacities)
        @test all(κ -> isfinite(κ), opacities)

        # General trend: opacity decreases toward red (H⁻ wavelength dependence)
        # UV should have higher opacity than IR
        @test opacities[1] > opacities[end]  # 3000Å > 8000Å
    end

    @testset "Temperature dependence" begin
        temperatures = [4000.0, 5000.0, 6000.0, 7000.0]

        opacities = Float64[]
        for T_test in temperatures
            pops_test = compute_populations(T_test, P_gas, abundances)
            κ = continuum_opacity_total(λ_optical, T_test, P_e, pops_test)
            push!(opacities, κ)
        end

        # All finite
        @test all(κ -> isfinite(κ), opacities)

        # Should show temperature dependence (H⁻ abundance changes)
        # Opacity peaks around 5000-6000K for solar metallicity
    end

    @testset "Hydrogen edges visible in wavelength scan" begin
        # Scan through Balmer edge region (3646 Å)
        λ_before = 3640.0  # Below edge (should have opacity)
        λ_edge = 3646.0    # At edge
        λ_after = 3650.0   # Above edge (no H I n=2 bf)

        κ_before = continuum_opacity_total(λ_before, T, P_e, pops)
        κ_edge = continuum_opacity_total(λ_edge, T, P_e, pops)
        κ_after = continuum_opacity_total(λ_after, T, P_e, pops)

        # All should be positive
        @test κ_before > 0.0
        @test κ_after > 0.0

        # Edge should show jump (before > after due to H I n=2 contribution)
        # Note: Jump may be small if H⁻ dominates
        @test κ_before >= κ_after
    end
end

@testset "Total Opacity (Continuum + Line)" begin
    # Setup
    T = 5777.0
    P_gas = 1.0e5
    P_e = 1.0e3
    λ = 5000.0

    abundances = zeros(30)
    abundances[1] = 12.0
    abundances[2] = 10.93

    pops = compute_populations(T, P_gas, abundances)

    @testset "Zero lines → continuum only" begin
        lines = SpectralLine[]  # Empty line list

        κ_total = total_opacity(λ, T, P_e, pops, lines)
        κ_cont = continuum_opacity_total(λ, T, P_e, pops)

        # Should match continuum-only
        @test κ_total ≈ κ_cont rtol=1.0e-10
    end

    @testset "Single strong line → line dominates at center" begin
        # Create a strong Fe I line at 5000 Å
        line = SpectralLine(
            wavelength_air = 5000.0,      # Å
            element_ion = 26.0,           # Fe I
            log_gf = 0.0,                 # Strong line
            e_lower_cm = 0.0,             # Ground state
            j_lower = 1.0,
            e_upper_cm = 20000.0,
            j_upper = 1.0,
            damping_rad = 1.0e8,
            damping_stark = 1.0e-6,
            damping_waals = 1.0e-7
        )

        lines = [line]

        # At line center
        κ_total_center = total_opacity(5000.0, T, P_e, pops, lines)
        κ_cont = continuum_opacity_total(5000.0, T, P_e, pops)

        # Total should be >= continuum (line adds opacity)
        @test κ_total_center >= κ_cont

        # Far from line (continuum only)
        κ_total_far = total_opacity(5100.0, T, P_e, pops, lines)
        κ_cont_far = continuum_opacity_total(5100.0, T, P_e, pops)

        # Should be close to continuum (line wings negligible)
        @test κ_total_far ≈ κ_cont_far rtol=0.1
    end

    @testset "Physical bounds" begin
        lines = SpectralLine[]

        # Various conditions
        test_wavelengths = [3000.0, 5000.0, 10000.0]
        test_temperatures = [4000.0, 6000.0, 8000.0]

        for λ_test in test_wavelengths
            for T_test in test_temperatures
                pops_test = compute_populations(T_test, P_gas, abundances)
                κ = total_opacity(λ_test, T_test, P_e, pops_test, lines)

                # Always positive and finite
                @test κ > 0.0
                @test isfinite(κ)
            end
        end
    end

    @testset "Consistency: total >= continuum always" begin
        # Create some lines
        lines = [
            SpectralLine(
                wavelength_air = 5000.0,
                element_ion = 26.0,
                log_gf = -1.0,
                e_lower_cm = 0.0,
                j_lower = 1.0,
                e_upper_cm = 20000.0,
                j_upper = 1.0,
                damping_rad = 1.0e8,
                damping_stark = 1.0e-6,
                damping_waals = 1.0e-7
            ),
            SpectralLine(
                wavelength_air = 5005.0,
                element_ion = 26.1,  # Fe II
                log_gf = -2.0,
                e_lower_cm = 1000.0,
                j_lower = 1.5,
                e_upper_cm = 21000.0,
                j_upper = 2.5,
                damping_rad = 1.0e8,
                damping_stark = 1.0e-6,
                damping_waals = 1.0e-7
            )
        ]

        # Wavelength scan
        for λ_test in 4990.0:2.0:5010.0
            κ_total = total_opacity(λ_test, T, P_e, pops, lines)
            κ_cont = continuum_opacity_total(λ_test, T, P_e, pops)

            # Total should always be >= continuum (lines add, never subtract)
            @test κ_total >= κ_cont
        end
    end
end

@testset "Integration with Population Solver" begin
    @testset "Pure hydrogen atmosphere" begin
        # Simplified case: only hydrogen
        abundances = zeros(30)
        abundances[1] = 12.0  # H only

        T = 6000.0
        P_gas = 1.0e5
        P_e = 1.0e3

        pops = compute_populations(T, P_gas, abundances)

        # Should have converged
        @test pops.converged

        # Compute opacity
        λ = 5000.0
        κ = continuum_opacity_total(λ, T, P_e, pops)

        # Should be finite and positive
        @test κ > 0.0
        @test isfinite(κ)

        # Check that H I and H II populations are reasonable
        @test haskey(pops.ion_fractions, (1, 0))  # H I
        @test haskey(pops.ion_fractions, (1, 1))  # H II

        frac_HI = pops.ion_fractions[(1, 0)]
        frac_HII = pops.ion_fractions[(1, 1)]

        # Fractions should sum to 1
        @test frac_HI + frac_HII ≈ 1.0 rtol=1.0e-6

        # Both should be non-zero (partial ionization)
        @test frac_HI > 0.0
        @test frac_HII > 0.0
    end

    @testset "Solar composition" begin
        # Full solar abundances
        abundances = zeros(30)
        abundances[1] = 12.0      # H
        abundances[2] = 10.93     # He

        T = 5777.0
        P_gas = 1.0e5
        P_e = 1.0e3

        pops = compute_populations(T, P_gas, abundances)

        # Wavelength scan across optical
        wavelengths = collect(3000.0:100.0:8000.0)
        opacities = [continuum_opacity_total(λ, T, P_e, pops) for λ in wavelengths]

        # All should be positive and finite
        @test all(κ -> κ > 0.0, opacities)
        @test all(κ -> isfinite(κ), opacities)

        # Should show smooth wavelength dependence (no NaNs or jumps)
        for i in 2:length(opacities)
            # Ratio between adjacent wavelengths should be reasonable
            ratio = opacities[i] / opacities[i-1]
            @test 0.5 < ratio < 2.0  # No sudden jumps
        end
    end
end

println("✅ Opacity integration tests defined (RED phase).")
println("📝 Implement functions in src/Synthe/src/opacity_integration.jl to make tests pass (GREEN phase).")
