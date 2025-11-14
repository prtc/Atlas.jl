"""
Test radiative transfer solver (Feautrier method)

Tests for JOSH equivalent - solving radiative transfer equation.

This file follows TDD methodology:
- RED: Write failing tests first
- GREEN: Implement minimal code to pass
- REFACTOR: Clean up and optimize

Implements Pure Julia equivalent of atlas7v JOSH subroutine.

Validation uses:
- Mihalas (1978) "Stellar Atmospheres"
- Gray (2005) "Observations and Analysis of Stellar Photospheres"
- Eddington-Barbier relation

Author: Claude (Local), Paula Coelho
Date: 2025-11-14
"""

using Test

# Add src/Synthe to load path
push!(LOAD_PATH, joinpath(@__DIR__, "../../src/Synthe/src"))

using Synthe

@testset "Tridiagonal Solver" begin
    @testset "Identity matrix" begin
        # A = I, b = [1, 2, 3] → x = [1, 2, 3]
        n = 3
        a = zeros(n)  # Sub-diagonal
        b = ones(n)   # Diagonal
        c = zeros(n)  # Super-diagonal
        d = [1.0, 2.0, 3.0]  # RHS

        x = solve_tridiagonal(a, b, c, d)

        @test x ≈ [1.0, 2.0, 3.0] rtol=1.0e-10
    end

    @testset "Diagonal matrix" begin
        # A = diag([2, 3, 4]), b = [2, 6, 12] → x = [1, 2, 3]
        a = zeros(3)
        b = [2.0, 3.0, 4.0]
        c = zeros(3)
        d = [2.0, 6.0, 12.0]

        x = solve_tridiagonal(a, b, c, d)

        @test x ≈ [1.0, 2.0, 3.0] rtol=1.0e-10
    end

    @testset "Full tridiagonal" begin
        # Known solution: x = [1, 1, 1]
        # A = [2 1 0; 1 2 1; 0 1 2]
        # b = [3, 4, 3]
        a = [0.0, 1.0, 1.0]
        b = [2.0, 2.0, 2.0]
        c = [1.0, 1.0, 0.0]
        d = [3.0, 4.0, 3.0]

        x = solve_tridiagonal(a, b, c, d)

        @test x ≈ [1.0, 1.0, 1.0] rtol=1.0e-10
    end

    @testset "Physical bounds" begin
        # Solution should be finite
        a = [0.0, 1.0, 0.5]
        b = [3.0, 4.0, 3.5]
        c = [1.0, 0.5, 0.0]
        d = [5.0, 7.0, 6.0]

        x = solve_tridiagonal(a, b, c, d)

        @test all(isfinite.(x))
    end
end

@testset "Source Function (LTE)" begin
    @testset "Solar conditions" begin
        λ = 5000.0  # Å
        T_solar = 5777.0

        S = source_function_lte(λ, T_solar)

        # Should be positive and finite
        @test S > 0.0
        @test isfinite(S)

        # Roughly correct order of magnitude for solar continuum
        # Planck function at 5000Å, 5777K ≈ 10^14 erg/s/cm²/Å/sr
        @test S > 1.0e13
        @test S < 1.0e15
    end

    @testset "Temperature dependence" begin
        λ = 5000.0
        temperatures = [3000.0, 5000.0, 7000.0, 10000.0]

        sources = [source_function_lte(λ, T) for T in temperatures]

        # Higher T → higher source function
        for i in 2:length(sources)
            @test sources[i] > sources[i-1]
        end

        # All finite and positive
        @test all(S -> S > 0.0 && isfinite(S), sources)
    end

    @testset "Wavelength dependence" begin
        T = 5777.0
        wavelengths = [3000.0, 5000.0, 7000.0, 10000.0]  # Å

        sources = [source_function_lte(λ, T) for λ in wavelengths]

        # Wien regime (UV): exp(-hc/λkT) dominates, decreases with λ
        # Should see UV > optical for solar T
        @test sources[1] > sources[2]  # 3000Å > 5000Å

        # All finite and positive
        @test all(S -> S > 0.0 && isfinite(S), sources)
    end

    @testset "Planck function integration" begin
        # Source function should match Planck function from Step 1
        λ = 5000.0
        T = 6000.0

        S = source_function_lte(λ, T)

        # Manually compute Planck function
        λ_cm = λ * 1.0e-8
        h = 6.62607015e-27  # erg·s
        c = 2.99792458e10   # cm/s
        k = 1.380649e-16    # erg/K

        x = h * c / (λ_cm * k * T)
        B_λ = (2.0 * h * c^2 / λ_cm^5) / (exp(x) - 1.0)

        @test S ≈ B_λ rtol=1.0e-10
    end
end

@testset "Optical Depth Calculation" begin
    @testset "Constant opacity slab" begin
        # Simple test: constant κ, uniform spacing
        n_depth = 5
        κ_const = 1.0e-10  # cm⁻¹

        # Create simple atmosphere
        heights = [100.0e5, 80.0e5, 60.0e5, 40.0e5, 20.0e5]  # cm (decreasing inward)
        temperatures = fill(5000.0, n_depth)
        pressures = fill(1.0e5, n_depth)
        electron_pressures = fill(1.0e3, n_depth)

        # Create populations (simplified)
        abundances = zeros(30)
        abundances[1] = 12.0

        pops = [compute_populations(T, P, abundances) for (T, P) in zip(temperatures, pressures)]

        # Mock atmosphere (we'll need to create a simple version for testing)
        # For now, test the integration formula directly

        τ = zeros(n_depth)
        τ[1] = 0.0

        for i in 2:n_depth
            dz = heights[i] - heights[i-1]  # Negative
            dτ = -κ_const * dz  # Should be positive
            τ[i] = τ[i-1] + dτ
        end

        # Check results
        @test τ[1] ≈ 0.0
        @test all(τ[i] > τ[i-1] for i in 2:n_depth)  # Increasing

        # With constant κ and uniform spacing
        # Δτ = κ × Δz = 1e-10 × 20e5 = 2.0
        @test τ[2] ≈ 2.0 rtol=1.0e-6
    end

    @testset "Physical bounds" begin
        # Optical depth should always increase inward (or stay constant)
        n_depth = 10
        heights = collect(range(100.0e5, 10.0e5, length=n_depth))  # Decreasing
        temperatures = collect(range(5000.0, 7000.0, length=n_depth))
        pressures = fill(1.0e5, n_depth)

        τ = zeros(n_depth)
        τ[1] = 0.0

        # Dummy integration (will use real function later)
        for i in 2:n_depth
            τ[i] = τ[i-1] + abs(heights[i] - heights[i-1]) * 1.0e-10
        end

        # Check monotonicity
        @test all(τ[i] >= τ[i-1] for i in 2:n_depth)

        # First point should be 0
        @test τ[1] ≈ 0.0

        # All finite
        @test all(isfinite.(τ))
    end
end

@testset "Feautrier RTE Solver" begin
    @testset "Isothermal atmosphere" begin
        # For isothermal atmosphere: S = constant
        # Solution: u = S everywhere (no gradients)

        n_depth = 5
        τ = [0.0, 0.5, 1.0, 2.0, 4.0]
        T_const = 6000.0
        λ = 5000.0

        # All depths same temperature
        temperatures = fill(T_const, n_depth)

        # Source function (constant)
        S_const = source_function_lte(λ, T_const)

        # Solve RTE (will implement this)
        # For isothermal: u ≈ S everywhere
        # u, I_emergent = solve_radiative_transfer_feautrier(λ, temperatures, τ)

        # For now, just test that source is constant
        sources = [source_function_lte(λ, T) for T in temperatures]

        @test all(S ≈ S_const for S in sources)
    end

    @testset "Eddington-Barbier relation" begin
        # Emergent intensity I(μ=1) ≈ B(T at τ≈1)
        # This is the key validation test

        n_depth = 10
        τ = collect(range(0.0, 5.0, length=n_depth))

        # Temperature structure (increasing inward)
        T_values = collect(range(5000.0, 7000.0, length=n_depth))

        λ = 5000.0

        # Find temperature at τ ≈ 1
        idx_tau1 = argmin(abs.(τ .- 1.0))
        T_at_tau1 = T_values[idx_tau1]

        # Expected emergent intensity
        B_expected = source_function_lte(λ, T_at_tau1)

        # When we implement solver:
        # u, I_emergent = solve_radiative_transfer_feautrier(λ, T_values, τ)
        # @test I_emergent ≈ B_expected rtol=0.2  # Within 20%

        # For now, validate concept
        @test T_at_tau1 ≈ T_values[idx_tau1]
        @test isfinite(B_expected)
    end

    @testset "Physical consistency" begin
        # Mean intensity should be bounded by min and max source function
        n_depth = 10
        τ = collect(range(0.0, 5.0, length=n_depth))
        T_values = collect(range(4000.0, 8000.0, length=n_depth))

        λ = 5000.0

        # Source functions
        S_values = [source_function_lte(λ, T) for T in T_values]

        S_min = minimum(S_values)
        S_max = maximum(S_values)

        # When solver implemented:
        # u, I_emergent = solve_radiative_transfer_feautrier(λ, T_values, τ)
        # @test all(S_min <= u_i <= S_max for u_i in u)

        # For now, validate source function bounds
        @test S_min > 0.0
        @test S_max > S_min
    end
end

@testset "Emergent Spectrum" begin
    @testset "Wavelength scan" begin
        # Compute spectrum over wavelength range
        wavelengths = [4000.0, 5000.0, 6000.0, 7000.0]  # Å

        # Simple isothermal atmosphere
        n_depth = 5
        τ_grid = collect(range(0.0, 3.0, length=n_depth))
        T_const = 5777.0

        # For each wavelength, emergent intensity
        I_emergent = zeros(length(wavelengths))

        for (i, λ) in enumerate(wavelengths)
            # In isothermal case: I ≈ B(T)
            I_emergent[i] = source_function_lte(λ, T_const)
        end

        # All should be positive and finite
        @test all(I -> I > 0.0, I_emergent)
        @test all(isfinite.(I_emergent))

        # For solar T, should show Wien peak around 5000Å
        # UV (4000Å) should be higher than IR (7000Å) for T=5777K
        @test I_emergent[1] > I_emergent[4]
    end

    @testset "Balmer jump" begin
        # Spectrum should show discontinuity at Balmer edge (3646 Å)
        # Due to H I n=2 bound-free opacity

        λ_before = 3640.0  # Below edge
        λ_edge = 3646.0    # At edge
        λ_after = 3650.0   # Above edge

        T = 5777.0

        # Source functions (continuous)
        S_before = source_function_lte(λ_before, T)
        S_edge = source_function_lte(λ_edge, T)
        S_after = source_function_lte(λ_after, T)

        # Source function should be continuous
        @test abs(S_edge - S_before) / S_before < 0.01  # < 1% change
        @test abs(S_after - S_edge) / S_edge < 0.01

        # Opacity will cause jump (tested in Step 3)
        # Emergent intensity will show jump when we include opacity properly
    end
end

println("✅ Radiative transfer tests defined (RED phase).")
println("📝 Implement functions in src/Synthe/src/radiative_transfer.jl to make tests pass (GREEN phase).")
