"""
Continuum opacity sources for stellar atmospheres

Implements H⁻, H I, He, and electron scattering opacities.

Uses Fortran-extracted lookup tables from continuum_opacity_data.jl:
- H⁻ bound-free: Wishart (1979) 85-point table via Mathisen (1984)
- H⁻ free-free: Bell & Berrington (1987) 22×11 2D table

References:
- Gray (2005) "Observations and Analysis of Stellar Photospheres"
- Mihalas (1978) "Stellar Atmospheres"
- Wishart (1979), Broad & Reinhardt (1976), Mathisen (1984)
- Bell & Berrington, J.Phys.B vol. 20, 801-806 (1987)

Author: Claude (Local), Paula Coelho
Date: 2025-11-14
"""

include("continuum_opacity_data.jl")

"""
    hminus_bf(λ, T, P_e)

H⁻ bound-free opacity (photodetachment).

Dominant opacity source in solar-type star photospheres.

# Arguments
- `λ::Float64`: Wavelength (Å)
- `T::Float64`: Temperature (K)
- `P_e::Float64`: Electron pressure (dyne/cm²)

# Returns
- `Float64`: Cross-section σ (cm²/H⁻ ion)

# Implementation
Uses Wishart (1979) 85-point lookup table via Mathisen (1984).
Linear interpolation between table points.

# References
- Wishart (1979), Broad & Reinhardt (1976), Mathisen (1984)
- Table extracted from atlas7v.for HMINOP subroutine
"""
function hminus_bf(λ::Float64, T::Float64, P_e::Float64)::Float64
    # Convert wavelength from Å to nm for table lookup
    λ_nm = λ / 10.0

    # H⁻ photodetachment threshold at 1643.91 nm (from table)
    const λ_threshold = HMINUS_BF_WAVELENGTHS[end]

    # Beyond threshold → zero opacity
    if λ_nm >= λ_threshold
        return 0.0
    end

    # Below minimum wavelength in table → extrapolate or use first value
    if λ_nm <= HMINUS_BF_WAVELENGTHS[1]
        return HMINUS_BF_CROSS_SECTIONS[1] * 1.0e-18  # Convert to cm²
    end

    # Find bracketing points for linear interpolation
    # Binary search would be faster, but 85 points is small enough for linear scan
    idx_upper = findfirst(w -> w >= λ_nm, HMINUS_BF_WAVELENGTHS)

    if idx_upper === nothing
        # Should not happen due to threshold check above
        return 0.0
    end

    if idx_upper == 1
        # Exactly at first point
        return HMINUS_BF_CROSS_SECTIONS[1] * 1.0e-18
    end

    idx_lower = idx_upper - 1

    # Linear interpolation
    λ_lower = HMINUS_BF_WAVELENGTHS[idx_lower]
    λ_upper = HMINUS_BF_WAVELENGTHS[idx_upper]
    σ_lower = HMINUS_BF_CROSS_SECTIONS[idx_lower]
    σ_upper = HMINUS_BF_CROSS_SECTIONS[idx_upper]

    # Interpolation weight
    weight = (λ_nm - λ_lower) / (λ_upper - λ_lower)

    # Interpolated cross-section
    σ = σ_lower + weight * (σ_upper - σ_lower)

    # Convert from 10⁻¹⁸ cm² to cm²
    return σ * 1.0e-18
end

"""
    hminus_ff(λ, T, P_e)

H⁻ free-free opacity (inverse bremsstrahlung).

Free electron + neutral H atom.

# Arguments
- `λ::Float64`: Wavelength (Å)
- `T::Float64`: Temperature (K)
- `P_e::Float64`: Electron pressure (dyne/cm²)

# Returns
- `Float64`: Cross-section σ (cm²/H atom)

# Implementation
Uses Bell & Berrington (1987) 22×11 2D lookup table.
Bilinear interpolation on wavelength and temperature (theta).

# References
- Bell and Berrington, J.Phys.B, vol. 20, 801-806, 1987
- Table extracted from atlas7v.for HMINOP subroutine
"""
function hminus_ff(λ::Float64, T::Float64, P_e::Float64)::Float64
    # Convert wavelength from Å to nm
    λ_nm = λ / 10.0

    # Compute theta = 5040/T (dimensionless temperature)
    θ = 5040.0 / T

    # Compute inverse wavenumber k = 91.134 nm / λ_nm
    # (Bell & Berrington use this scale)
    k = 91.134 / λ_nm

    # Check bounds for theta
    if θ < HMINUS_FF_THETA_VALUES[1] || θ > HMINUS_FF_THETA_VALUES[end]
        # Outside table range - could extrapolate or return 0
        # For now, clamp to table bounds
        θ = clamp(θ, HMINUS_FF_THETA_VALUES[1], HMINUS_FF_THETA_VALUES[end])
    end

    # Check bounds for k
    if k < HMINUS_FF_WAVELENGTHS_INVERSE_K[end] || k > HMINUS_FF_WAVELENGTHS_INVERSE_K[1]
        # Outside table range (note: k array is in descending order)
        # Extrapolate to zero or clamp
        if k > HMINUS_FF_WAVELENGTHS_INVERSE_K[1]
            # Very short wavelength - use first value
            k = HMINUS_FF_WAVELENGTHS_INVERSE_K[1]
        else
            # Very long wavelength - extrapolate to zero
            return 0.0
        end
    end

    # Find bracketing indices for theta (ascending order)
    θ_idx_upper = findfirst(t -> t >= θ, HMINUS_FF_THETA_VALUES)
    if θ_idx_upper === nothing
        θ_idx_upper = length(HMINUS_FF_THETA_VALUES)
    end
    θ_idx_lower = max(1, θ_idx_upper - 1)

    # Find bracketing indices for k (descending order - note reversal!)
    k_idx_lower = findfirst(ki -> ki <= k, HMINUS_FF_WAVELENGTHS_INVERSE_K)
    if k_idx_lower === nothing
        k_idx_lower = length(HMINUS_FF_WAVELENGTHS_INVERSE_K)
    end
    k_idx_upper = max(1, k_idx_lower - 1)

    # Get corner values for bilinear interpolation
    # Table is indexed as [theta_index, wavelength_index]
    σ_11 = HMINUS_FF_TABLE[θ_idx_lower][k_idx_lower]
    σ_12 = HMINUS_FF_TABLE[θ_idx_lower][k_idx_upper]
    σ_21 = HMINUS_FF_TABLE[θ_idx_upper][k_idx_lower]
    σ_22 = HMINUS_FF_TABLE[θ_idx_upper][k_idx_upper]

    # Interpolation weights
    if θ_idx_upper == θ_idx_lower
        θ_weight = 0.0
    else
        θ_weight = (θ - HMINUS_FF_THETA_VALUES[θ_idx_lower]) /
                   (HMINUS_FF_THETA_VALUES[θ_idx_upper] - HMINUS_FF_THETA_VALUES[θ_idx_lower])
    end

    if k_idx_upper == k_idx_lower
        k_weight = 0.0
    else
        # Note: k array is descending, so reverse the weight calculation
        k_weight = (HMINUS_FF_WAVELENGTHS_INVERSE_K[k_idx_lower] - k) /
                   (HMINUS_FF_WAVELENGTHS_INVERSE_K[k_idx_lower] - HMINUS_FF_WAVELENGTHS_INVERSE_K[k_idx_upper])
    end

    # Bilinear interpolation
    σ = (1 - θ_weight) * (1 - k_weight) * σ_11 +
        (1 - θ_weight) * k_weight * σ_12 +
        θ_weight * (1 - k_weight) * σ_21 +
        θ_weight * k_weight * σ_22

    # Cross-section is already in cm² (table includes all unit conversions)
    return max(0.0, σ)
end

"""
    hydrogen_bf(λ, T, n_level)

H I bound-free opacity (photoionization from level n).

# Arguments
- `λ::Float64`: Wavelength (Å)
- `T::Float64`: Temperature (K)
- `n_level::Int`: Principal quantum number (1=Lyman, 2=Balmer, 3=Paschen, ...)

# Returns
- `Float64`: Opacity (cm²/H atom)

# Thresholds
- n=1 (Lyman): 912 Å
- n=2 (Balmer): 3646 Å
- n=3 (Paschen): 8204 Å
- General: λ_threshold = 911.8 * n² Å

# Formula (Kramers + Gaunt factor)
- Returns 0 for λ > threshold
- Opacity ∝ n⁵ (higher levels weaker)
- Apply gaunt_factor() correction
- See CCW_TASK_STEP2.md for detailed formula

# TODO
- Implement hydrogenic cross-section (Kramers formula)
- Apply Gaunt factor correction
- Validate: Lyman edge σ ≈ 6.3×10⁻¹⁸ cm², Balmer edge σ ≈ 1.0×10⁻¹⁷ cm²
"""
function hydrogen_bf(λ::Float64, T::Float64, n_level::Int)::Float64
    # Wavelength threshold for level n (Å)
    λ_threshold = 911.8 * n_level^2

    # Beyond threshold → zero opacity
    if λ >= λ_threshold
        return 0.0
    end

    # Hydrogenic cross-section at threshold (Kramers formula)
    # σ_0(n) = 7.9×10⁻¹⁸ * n⁵ / (Z²) cm² for Z=1 (hydrogen)
    const sigma_base = 7.9e-18  # cm² (for n=1, at threshold)
    sigma_0 = sigma_base * n_level^5

    # Wavelength dependence: σ(λ) = σ_0 * (λ/λ_0)³
    sigma = sigma_0 * (λ / λ_threshold)^3

    # Gaunt factor correction
    # x = ν/ν_threshold = λ_threshold/λ
    x = λ_threshold / λ
    g = gaunt_factor(n_level, x)

    # Apply Gaunt correction
    return sigma * g
end

"""
    electron_scattering(n_e)

Electron scattering opacity (Thomson scattering).

Wavelength-independent.

# Arguments
- `n_e::Float64`: Electron density (cm⁻³)

# Returns
- `Float64`: Opacity (cm⁻¹)

# Formula
κ_es = n_e * σ_thomson

where σ_thomson = 6.6524587×10⁻²⁵ cm² (CODATA 2018)

# TODO
- Implement linear formula
- Use correct Thomson cross-section constant
- Validate: n_e = 10¹⁴ cm⁻³ → κ = 6.65×10⁻¹¹ cm⁻¹
"""
function electron_scattering(n_e::Float64)::Float64
    # Thomson scattering cross-section (CODATA 2018)
    const sigma_thomson = 6.6524587321e-25  # cm²

    # Opacity = density × cross-section
    return n_e * sigma_thomson
end

"""
    gaunt_factor(n, x)

Gaunt factor (quantum correction to Kramers formula).

# Arguments
- `n::Int`: Principal quantum number
- `x::Float64`: Frequency ratio ν/ν_threshold

# Returns
- `Float64`: Gaunt factor (typically 0.8-1.2)

# Approximation (Menzel & Pekeris 1935)
g = 1.0 + 0.1728 * (x - 1) / n² - 0.0496 * (x - 1)² / n⁴

Clamped to physical bounds [0.8, 1.2]

# TODO
- Implement approximation formula
- Clamp to [0.8, 1.2]
- At threshold (x=1) → g ≈ 1.0
"""
function gaunt_factor(n::Int, x::Float64)::Float64
    # Menzel & Pekeris 1935 approximation
    n2 = Float64(n * n)
    n4 = n2 * n2

    g = 1.0 + 0.1728 * (x - 1.0) / n2 - 0.0496 * (x - 1.0)^2 / n4

    # Clamp to physical bounds
    return clamp(g, 0.8, 1.2)
end
