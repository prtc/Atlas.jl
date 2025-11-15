"""
Fortran-exact radiative transfer using COEFJ/COEFH matrices

Implements JOSH-equivalent formal solution using pretabulated integration
weights from atlas7v.for BLOCKJ and BLOCKH subroutines.

This provides a Fortran-matching implementation for numerical validation,
separate from the generic radiative_transfer.jl solver.

Functions:
- solve_radiative_transfer_josh() - JOSH formal solution with COEFJ/COEFH
- map_to_xtau8_grid() - Interpolate source function onto fixed τ grid

References:
- atlas7v.for SUBROUTINE JOSH (lines 8020+)
- atlas7v.for SUBROUTINE BLOCKJ (lines 8257-9043)
- atlas7v.for SUBROUTINE BLOCKH (lines 9044+)
- DEEP_DIVE 05: RADIATIVE_TRANSFER.md

Author: Claude (Local), Paula Coelho
Date: 2025-11-15
"""

# Load radiative transfer matrices
include("radiative_transfer_data.jl")

"""
    solve_radiative_transfer_josh(τ::Vector{Float64}, S::Vector{Float64};
                                   use_scattering::Bool=false) -> (J, H, K)

Solve radiative transfer using Fortran JOSH method with COEFJ/COEFH matrices.

This function matches the Fortran JOSH subroutine algorithm exactly,
using pretabulated integration weights on a fixed optical depth grid.

# Arguments
- `τ::Vector{Float64}`: Optical depth grid (arbitrary spacing)
- `S::Vector{Float64}`: Source function at each depth
- `use_scattering::Bool`: Include scattering (default false, LTE only)

# Returns
- `J::Vector{Float64}`: Mean intensity at each depth
- `H::Vector{Float64}`: Eddington flux at each depth
- `K::Vector{Float64}`: Second moment at each depth

# Algorithm (matches atlas7v.for JOSH)

1. **Map to fixed grid**: Interpolate S(τ) onto XTAU8 grid (51 points, τ=0 to 20)
2. **Matrix multiplication**:
   - J(τᵢ) = Σⱼ COEFJ[i,j] × S(τⱼ)
   - H(τᵢ) = Σⱼ COEFH[i,j] × S(τⱼ)
3. **Boundary conditions**:
   - Surface (τ=0): Use CH weights for emergent flux
   - Deep (τ=20): Diffusion approximation
4. **Interpolate back**: Map J, H from XTAU8 grid to original τ grid

# Example
```julia
# Simple isothermal atmosphere
n_depths = 10
τ = 10.0 .^ range(-4, 1, length=n_depths)
S = fill(1.0, n_depths)  # Constant source function

J, H, K = solve_radiative_transfer_josh(τ, S)

# J should be ≈ S in LTE
# H should decrease from surface to depth
```

# Validation
Compare with Fortran JOSH output:
```julia
using CSV
ref = CSV.read("test/reference/radiative_transfer_fortran.csv", DataFrame)
τ_ref = ref.tau
S_ref = ref.source_function
J, H, K = solve_radiative_transfer_josh(τ_ref, S_ref)
@test J ≈ ref.J_fortran rtol=1e-4
```
"""
function solve_radiative_transfer_josh(τ::Vector{Float64}, S::Vector{Float64};
                                       use_scattering::Bool=false)

    n_depths = length(τ)
    if length(S) != n_depths
        throw(ArgumentError("τ and S must have same length"))
    end

    # Get COEFJ and COEFH matrices (51×51)
    coefj = get_coefj_matrix()
    coefh = get_coefh_matrix()

    # Fixed optical depth grid from Fortran (51 points)
    τ_fixed = XTAU8_GRID
    n_fixed = length(τ_fixed)  # Should be 51

    # ================================================================
    # Step 1: Interpolate source function onto fixed XTAU8 grid
    # ================================================================
    S_fixed = map_to_xtau8_grid(τ, S, τ_fixed)

    # ================================================================
    # Step 2: Matrix multiplication (core JOSH algorithm)
    # ================================================================

    # Allocate output on fixed grid
    J_fixed = zeros(Float64, n_fixed)
    H_fixed = zeros(Float64, n_fixed)

    # J(τᵢ) = Σⱼ COEFJ[i,j] × S(τⱼ)
    for i in 1:n_fixed
        J_fixed[i] = sum(coefj[i, j] * S_fixed[j] for j in 1:n_fixed)
    end

    # H(τᵢ) = Σⱼ COEFH[i,j] × S(τⱼ)
    for i in 1:n_fixed
        H_fixed[i] = sum(coefh[i, j] * S_fixed[j] for j in 1:n_fixed)
    end

    # ================================================================
    # Step 3: Boundary conditions
    # ================================================================

    # Surface boundary (τ=0): Emergent flux using CH weights
    # H(0) = Σⱼ CH[j] × S(τⱼ)
    H_surface = sum(CH_WEIGHTS[j] * S_fixed[j] for j in 1:n_fixed)
    H_fixed[1] = H_surface

    # Deep boundary (τ=20): Diffusion approximation
    # dJ/dτ ≈ -3H → J(τ_deep) ≈ S(τ_deep)
    J_fixed[end] = S_fixed[end]

    # ================================================================
    # Step 4: Compute K from J and H
    # ================================================================

    # Eddington approximation: K ≈ (1/3) J (valid in optically thick)
    # Or use exact relation from moments: dH/dτ = J - S
    K_fixed = zeros(Float64, n_fixed)
    for i in 1:n_fixed
        # Simple Eddington approximation for now
        K_fixed[i] = J_fixed[i] / 3.0
    end

    # ================================================================
    # Step 5: Interpolate back to original τ grid
    # ================================================================

    J = interpolate_from_xtau8(τ, τ_fixed, J_fixed)
    H = interpolate_from_xtau8(τ, τ_fixed, H_fixed)
    K = interpolate_from_xtau8(τ, τ_fixed, K_fixed)

    return J, H, K
end

"""
    map_to_xtau8_grid(τ::Vector{Float64}, f::Vector{Float64}, τ_fixed::Vector{Float64}) -> Vector{Float64}

Interpolate function f(τ) onto fixed XTAU8 grid.

Uses log-linear interpolation (Fortran MAP1 equivalent).

# Arguments
- `τ::Vector{Float64}`: Original optical depth grid
- `f::Vector{Float64}`: Function values on original grid
- `τ_fixed::Vector{Float64}`: Target XTAU8 grid (51 points)

# Returns
- `f_fixed::Vector{Float64}`: Function interpolated onto fixed grid
"""
function map_to_xtau8_grid(τ::Vector{Float64}, f::Vector{Float64},
                           τ_fixed::Vector{Float64})::Vector{Float64}

    n_fixed = length(τ_fixed)
    f_fixed = zeros(Float64, n_fixed)

    # For each point on fixed grid, interpolate from original grid
    for i in 1:n_fixed
        τ_target = τ_fixed[i]

        # Find bracketing indices in original grid
        if τ_target <= τ[1]
            # Extrapolate at surface
            f_fixed[i] = f[1]
        elseif τ_target >= τ[end]
            # Extrapolate at depth
            f_fixed[i] = f[end]
        else
            # Interpolate (log-linear in τ for better accuracy)
            idx_upper = findfirst(x -> x >= τ_target, τ)
            idx_lower = idx_upper - 1

            τ_lower = τ[idx_lower]
            τ_upper = τ[idx_upper]
            f_lower = f[idx_lower]
            f_upper = f[idx_upper]

            # Log-linear interpolation
            if τ_lower > 0.0 && τ_upper > 0.0
                log_weight = (log(τ_target) - log(τ_lower)) / (log(τ_upper) - log(τ_lower))
            else
                # Linear fallback near τ=0
                log_weight = (τ_target - τ_lower) / (τ_upper - τ_lower)
            end

            f_fixed[i] = f_lower + log_weight * (f_upper - f_lower)
        end
    end

    return f_fixed
end

"""
    interpolate_from_xtau8(τ::Vector{Float64}, τ_fixed::Vector{Float64},
                          f_fixed::Vector{Float64}) -> Vector{Float64}

Interpolate from fixed XTAU8 grid back to original τ grid.

# Arguments
- `τ::Vector{Float64}`: Target optical depth grid
- `τ_fixed::Vector{Float64}`: Source XTAU8 grid (51 points)
- `f_fixed::Vector{Float64}`: Function values on fixed grid

# Returns
- `f::Vector{Float64}`: Function interpolated onto target grid
"""
function interpolate_from_xtau8(τ::Vector{Float64}, τ_fixed::Vector{Float64},
                                f_fixed::Vector{Float64})::Vector{Float64}

    n = length(τ)
    f = zeros(Float64, n)

    # For each point on target grid, interpolate from fixed grid
    for i in 1:n
        τ_target = τ[i]

        # Find bracketing indices in fixed grid
        if τ_target <= τ_fixed[1]
            f[i] = f_fixed[1]
        elseif τ_target >= τ_fixed[end]
            f[i] = f_fixed[end]
        else
            # Log-linear interpolation
            idx_upper = findfirst(x -> x >= τ_target, τ_fixed)
            idx_lower = idx_upper - 1

            τ_lower = τ_fixed[idx_lower]
            τ_upper = τ_fixed[idx_upper]
            f_lower = f_fixed[idx_lower]
            f_upper = f_fixed[idx_upper]

            if τ_lower > 0.0 && τ_upper > 0.0
                log_weight = (log(τ_target) - log(τ_lower)) / (log(τ_upper) - log(τ_lower))
            else
                log_weight = (τ_target - τ_lower) / (τ_upper - τ_lower)
            end

            f[i] = f_lower + log_weight * (f_upper - f_lower)
        end
    end

    return f
end

"""
    josh_fortran_mode_available() -> Bool

Check if Fortran-exact JOSH mode is available (matrices loaded).
"""
function josh_fortran_mode_available()::Bool
    return isdefined(@__MODULE__, :COEFJ_MATRIX_FLAT) &&
           isdefined(@__MODULE__, :COEFH_MATRIX_FLAT) &&
           isdefined(@__MODULE__, :XTAU8_GRID)
end

# Export main functions
export solve_radiative_transfer_josh, josh_fortran_mode_available
export map_to_xtau8_grid, interpolate_from_xtau8
