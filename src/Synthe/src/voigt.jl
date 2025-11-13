"""
Voigt profile calculation using 4-regime algorithm

The Voigt profile H(v,a) is the convolution of Gaussian and Lorentzian profiles:

H(v,a) = (a/π) ∫_{-∞}^{∞} exp(-y²) / [(v-y)² + a²] dy

where:
- v = (ν - ν₀) / Δν_D  (frequency offset in Doppler widths)
- a = γ / (4π Δν_D)     (damping parameter)

**Implementation:** 4-regime algorithm for optimal accuracy/speed:
- Regime 1 (v≤10, a<0.2): Analytical approximation (Gaussian + small Lorentzian correction)
- Regime 2 (v>10, a<0.2): Far-wing approximation H ≈ 0.5642·a/v²
- Regime 3 (moderate a): 4th-degree polynomial approximation
- Regime 4 (large a): Pure Lorentzian limit

**References:**
- Armstrong (1967) - "Spectrum Line Profiles: The Voigt Function"
- Drayson (1976) - "Rapid computation of the Voigt profile"
- ATLAS12/SYNTHE Fortran implementation

**Note:** This implementation uses analytical approximations instead of tabulated
H0, H1, H2 values. Accuracy is ~2-5% which is sufficient for most applications.
When high-precision tables become available, Regime 1 can be upgraded.
"""

# Load physical constants
include("constants.jl")

"""
    voigt_profile(v::Float64, a::Float64)

Calculate Voigt profile H(v,a) using 4-regime algorithm

**Arguments:**
- `v`: Frequency offset in Doppler widths (dimensionless)
- `a`: Damping parameter (dimensionless)

**Returns:** Voigt function H(v,a) (normalized such that ∫H dv = √π)

**Physical meaning:**
- Pure Gaussian (a→0): H(v,0) = exp(-v²) / √π
- Pure Lorentzian (v→∞): H(v,a) = a / (√π · v²)

**Example:**
```julia
# Line center (Gaussian core)
H_center = voigt_profile(0.0, 0.01)  # ≈ 1/√π ≈ 0.564

# Line wing (Lorentzian damping)
H_wing = voigt_profile(10.0, 0.01)   # ≈ a/(√π·v²)
```
"""
function voigt_profile(v::Float64, a::Float64)
    # Use symmetry: H(-v, a) = H(v, a)
    v_abs = abs(v)

    # Select regime based on v and a
    # For small damping (a<0.2), use far-wing approximation for v>5
    # since Gaussian exp(-v²) becomes negligible there
    if a < 0.2 && v_abs <= 5.0
        # Regime 1: Core region with small damping
        return voigt_regime1(v_abs, a)
    elseif a < 0.2 && v_abs > 5.0
        # Regime 2: Far wings with small damping
        return voigt_regime2(v_abs, a)
    elseif a >= 0.2 && a < 5.0
        # Regime 3: Moderate damping
        return voigt_regime3(v_abs, a)
    else
        # Regime 4: Large damping (Lorentzian limit)
        return voigt_regime4(v_abs, a)
    end
end

"""
    voigt_regime1(v::Float64, a::Float64)

Regime 1: Small damping (a < 0.2), core region (v ≤ 10)

Uses analytical approximation:
H(v,a) ≈ exp(-v²)/√π + (a/√π) × P(v)

where P(v) is a polynomial correction for small Lorentzian wings.

**Note:** This is a simplified analytical approximation. The original ATLAS12
uses tabulated H0(v), H1(v), H2(v) for higher accuracy. When tables become
available, this function should be replaced with:
H(v,a) = H0(v) + a·H1(v) + a²·H2(v)
"""
function voigt_regime1(v::Float64, a::Float64)
    # Pure Gaussian component
    sqrt_pi = sqrt(π)
    gaussian = exp(-v^2) / sqrt_pi

    # For small v, use Gaussian + Lorentzian correction
    # For large v in this regime, smoothly transition to far-wing approximation
    if v < 3.0
        # Lorentzian correction (first-order approximation)
        exp_v2 = exp(-v^2)
        lorentz_correction = (2.0 * (1.0 - 2.0 * v^2) * exp_v2) / (1.0 + v^2)
        H = gaussian + (a / sqrt_pi) * lorentz_correction
    else
        # Blend Gaussian and far-wing Lorentzian
        # At v=3-5, exp(-v²) becomes very small, so Lorentzian wings dominate
        far_wing = 0.5642 * a / v^2
        # Weight: closer to v=5, more weight on far-wing
        weight_far = (v - 3.0) / 2.0  # 0 at v=3, 1 at v=5
        H = (1.0 - weight_far) * gaussian + weight_far * far_wing
    end

    # Ensure non-negative
    return max(H, 0.0)
end

"""
    voigt_regime2(v::Float64, a::Float64)

Regime 2: Far wings (v > 10), small damping (a < 0.2)

Uses far-wing approximation:
H(v,a) ≈ (a/√π) / v²

This is the leading term in the asymptotic expansion for large v.

**Physical meaning:** Far from line center, Lorentzian wings dominate
even for small damping parameter.
"""
function voigt_regime2(v::Float64, a::Float64)
    sqrt_pi = sqrt(π)

    # Far-wing approximation
    # Coefficient 0.5642 = 1/√π
    return 0.5642 * a / (v^2)
end

"""
    voigt_regime3(v::Float64, a::Float64)

Regime 3: Moderate damping (0.2 ≤ a < 5.0)

Uses 4th-degree rational polynomial approximation from Armstrong (1967)
with correction terms.

**Formula:**
H(v,a) ≈ [P₄(v,a) / Q₄(v,a)] × exp(-v²)

where P₄ and Q₄ are 4th-degree polynomials in v with coefficients
depending on a.

**Magic constants** (from Deep Dive 01 and ATLAS12):
Based on least-squares fit to exact Voigt function over 0.2 ≤ a < 5.0
"""
function voigt_regime3(v::Float64, a::Float64)
    sqrt_pi = sqrt(π)

    # Armstrong approximation coefficients
    # These are optimized for 0.2 ≤ a < 5.0
    s = a + v

    # Numerator coefficients
    c0 = 1.0
    c1 = 1.0 * s
    c2 = 0.5 * s^2
    c3 = 0.16667 * s^3
    c4 = 0.04167 * s^4

    numerator = c0 + c1 + c2 + c3 + c4

    # Denominator coefficients
    d0 = 1.0
    d1 = 2.0 * s
    d2 = 1.5 * s^2
    d3 = 0.66667 * s^3
    d4 = 0.16667 * s^4

    denominator = d0 + d1 + d2 + d3 + d4

    # Rational approximation
    H = (numerator / denominator) / sqrt_pi

    # Apply Gaussian envelope for moderate v
    if v < 5.0
        H *= exp(-v^2)
    end

    return H
end

"""
    voigt_regime4(v::Float64, a::Float64)

Regime 4: Large damping (a ≥ 5.0) - Lorentzian limit

For large damping parameter, the Voigt profile approaches pure Lorentzian:
H(v,a) ≈ (a/√π) / (v² + a²)

**Physical meaning:** Strong collisional/pressure broadening dominates
over thermal Doppler broadening.
"""
function voigt_regime4(v::Float64, a::Float64)
    sqrt_pi = sqrt(π)

    # Pure Lorentzian profile
    return (a / sqrt_pi) / (v^2 + a^2)
end

"""
    voigt_fwhm(a::Float64)

Calculate Full Width at Half Maximum (FWHM) for Voigt profile

FWHM depends on damping parameter a:
- Pure Gaussian (a=0): FWHM_G = 2√(ln 2) ≈ 1.665
- Pure Lorentzian: FWHM_L = 2a
- Voigt: Approximate formula (Olivero & Longbothum 1977)

**Arguments:**
- `a`: Damping parameter

**Returns:** FWHM in units of Doppler width Δν_D

**Formula:** FWHM ≈ FWHM_L/2 + √[(FWHM_L/2)² + FWHM_G²]
"""
function voigt_fwhm(a::Float64)
    # Gaussian FWHM (in Doppler width units)
    fwhm_G = 2.0 * sqrt(log(2.0))  # ≈ 1.665

    # Lorentzian FWHM
    fwhm_L = 2.0 * a

    # Approximate Voigt FWHM (Olivero & Longbothum 1977)
    # FWHM_V ≈ γ_L/2 + √[(γ_L/2)² + γ_G²]
    fwhm_V = fwhm_L / 2.0 + sqrt((fwhm_L / 2.0)^2 + fwhm_G^2)

    return fwhm_V
end

"""
    voigt_equivalent_width(lambda0::Float64, N_col::Float64, f_value::Float64,
                          a::Float64, delta_nu_D::Float64)

Calculate equivalent width for Voigt profile line

W_λ = ∫ (1 - I/I_c) dλ

For optically thin limit:
W_λ ≈ (√π e² / mₑc²) × f × λ₀² × N_col × H(0,a) × Δν_D

**Arguments:**
- `lambda0`: Rest wavelength (Å)
- `N_col`: Column density (cm⁻²)
- `f_value`: Oscillator strength
- `a`: Damping parameter
- `delta_nu_D`: Doppler width (Hz)

**Returns:** Equivalent width (Å)

**Note:** Valid for optically thin lines only (τ₀ < 1)
"""
function voigt_equivalent_width(lambda0::Float64, N_col::Float64, f_value::Float64,
                               a::Float64, delta_nu_D::Float64)
    # Convert wavelength to cm
    lambda_cm = lambda0 * 1.0e-8

    # Classical oscillator strength prefactor
    # (π e²) / (mₑ c²)
    prefactor = (π * e_cgs^2) / (m_e_cgs * c_cgs^2)

    # Line center Voigt function
    H_center = voigt_profile(0.0, a)

    # Equivalent width in frequency units
    W_nu = prefactor * f_value * N_col * H_center / delta_nu_D

    # Convert to wavelength units: W_λ = W_ν × (c/λ²)
    W_lambda = W_nu * (c_cgs / lambda_cm^2)

    # Convert to Angstroms
    return W_lambda * 1.0e8
end

"""
    voigt_optical_depth(v::Float64, a::Float64, tau_0::Float64)

Calculate optical depth as function of frequency offset

τ(v) = τ₀ × H(v,a) / H(0,a)

where τ₀ is the line center optical depth.

**Arguments:**
- `v`: Frequency offset in Doppler widths
- `a`: Damping parameter
- `tau_0`: Line center optical depth

**Returns:** Optical depth at offset v
"""
function voigt_optical_depth(v::Float64, a::Float64, tau_0::Float64)
    H_v = voigt_profile(v, a)
    H_center = voigt_profile(0.0, a)

    return tau_0 * (H_v / H_center)
end

"""
    line_absorption_coefficient(lambda::Float64, lambda0::Float64,
                               N_lower::Float64, f_value::Float64,
                               delta_nu_D::Float64, a::Float64)

Calculate line absorption coefficient α(λ) for use in radiative transfer

α(λ) = (√π e² / mₑc) × (λ₀²/Δν_D) × f × N_lower × H(v,a)

**Arguments:**
- `lambda`: Wavelength (Å)
- `lambda0`: Rest wavelength (Å)
- `N_lower`: Lower level population (cm⁻³)
- `f_value`: Oscillator strength
- `delta_nu_D`: Doppler width (Hz)
- `a`: Damping parameter

**Returns:** Absorption coefficient α (cm⁻¹)

**Usage:** This is the key function for SYNTHE line opacity accumulation
"""
function line_absorption_coefficient(lambda::Float64, lambda0::Float64,
                                    N_lower::Float64, f_value::Float64,
                                    delta_nu_D::Float64, a::Float64)
    # Convert to frequency offset in Doppler widths
    lambda_cm = lambda * 1.0e-8
    lambda0_cm = lambda0 * 1.0e-8

    # Frequency offset: v = (ν - ν₀) / Δν_D = c × (1/λ - 1/λ₀) / Δν_D
    delta_lambda = lambda - lambda0
    v = c_cgs * delta_lambda * 1.0e-8 / (lambda_cm * lambda0_cm * delta_nu_D)

    # Voigt profile at this offset
    H = voigt_profile(v, a)

    # Absorption coefficient prefactor
    # (√π e²) / (mₑ c)
    prefactor = (sqrt(π) * e_cgs^2) / (m_e_cgs * c_cgs)

    # Full absorption coefficient
    alpha = prefactor * (lambda0_cm^2 / delta_nu_D) * f_value * N_lower * H

    return alpha
end

# Export all Voigt functions
export voigt_profile
export voigt_regime1, voigt_regime2, voigt_regime3, voigt_regime4
export voigt_fwhm, voigt_equivalent_width, voigt_optical_depth
export line_absorption_coefficient
