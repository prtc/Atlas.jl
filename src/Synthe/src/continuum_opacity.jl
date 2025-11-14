"""
Continuum opacity sources for stellar atmospheres

Implements H⁻, H I, He, and electron scattering opacities.

TODO for CCW (Task 2.3):
- Implement hminus_bf() - H⁻ bound-free opacity
- Implement hminus_ff() - H⁻ free-free opacity
- Implement hydrogen_bf() - H I bound-free opacity (Lyman, Balmer, Paschen series)
- Implement electron_scattering() - Thomson scattering
- Implement gaunt_factor() - Quantum correction for bound-free
- All tests in test/synthe/test_continuum_opacity.jl should pass

References:
- Gray (2005) "Observations and Analysis of Stellar Photospheres"
- Mihalas (1978) "Stellar Atmospheres"

Author: Claude (Local), Paula Coelho
Date: 2025-11-13
"""

"""
    hminus_bf(λ, T, P_e)

H⁻ bound-free opacity (photodetachment).

Dominant opacity source in solar-type star photospheres.

# Arguments
- `λ::Float64`: Wavelength (Å)
- `T::Float64`: Temperature (K)
- `P_e::Float64`: Electron pressure (dyne/cm²)

# Returns
- `Float64`: Opacity (cm²/H⁻ ion)

# Formula (Wishart 1979)
- Threshold at 1650 nm (16500 Å)
- Returns 0 for λ > threshold
- See CCW_TASK_STEP2.md for detailed formula

# TODO
- Implement Wishart 1979 formula
- Check wavelength threshold
- Validate against Gray (2005) Table 8.1: λ=5000Å, T=5000K → σ ≈ 4.0×10⁻²⁶ cm²
"""
function hminus_bf(λ::Float64, T::Float64, P_e::Float64)::Float64
    error("TODO: Implement hminus_bf() - see test/synthe/test_continuum_opacity.jl and CCW_TASK_STEP2.md")
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
- `Float64`: Opacity (cm²/H⁻ ion)

# Formula (Gray 2005 Eq. 8.11)
- Opacity ∝ λ³ (infrared dominates)
- See CCW_TASK_STEP2.md for detailed formula

# TODO
- Implement Gray (2005) formula
- Validate: λ=10000Å, T=6000K → σ ≈ 1.5×10⁻²⁶ cm²
"""
function hminus_ff(λ::Float64, T::Float64, P_e::Float64)::Float64
    error("TODO: Implement hminus_ff() - see test/synthe/test_continuum_opacity.jl and CCW_TASK_STEP2.md")
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
    error("TODO: Implement hydrogen_bf() - see test/synthe/test_continuum_opacity.jl and CCW_TASK_STEP2.md")
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
    error("TODO: Implement electron_scattering() - see test/synthe/test_continuum_opacity.jl and CCW_TASK_STEP2.md")
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
    error("TODO: Implement gaunt_factor() - see test/synthe/test_continuum_opacity.jl and CCW_TASK_STEP2.md")
end
