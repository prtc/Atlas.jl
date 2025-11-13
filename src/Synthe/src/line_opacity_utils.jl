"""
Line opacity utility functions for SYNTHE spectrum synthesis

Functions for calculating line opacity contributions to the absorption coefficient:
- Line center wavelength calculation
- Frequency offset in Doppler widths
- Line strength from oscillator strength and populations
- Opacity accumulation and thresholding
- Line contribution significance testing

These utilities are the building blocks for the main SYNTHE line opacity loop
that accumulates contributions from thousands to millions of spectral lines.

**Usage in SYNTHE Pipeline:**
1. For each spectral line: calculate line center λ₀
2. For each wavelength point λ: calculate offset v = (λ-λ₀)/Δλ_D
3. If |v| < threshold: calculate line strength S and add to opacity
4. Accumulate: α_line += S × H(v,a)

**References:**
- Gray (2005) - "The Observation and Analysis of Stellar Photospheres"
- Kurucz - SYNTHE documentation
- ATLAS12/SYNTHE Fortran source code
"""

# Load required modules
include("constants.jl")
include("physics.jl")
include("voigt.jl")

"""
    line_center_wavelength(E_lower::Float64, E_upper::Float64)

Calculate line center wavelength from energy levels

λ₀ = hc / (E_upper - E_lower)

**Arguments:**
- `E_lower`: Lower level energy (erg)
- `E_upper`: Upper level energy (erg)

**Returns:** Rest wavelength λ₀ (Å)

**Note:** For wavenumber inputs (cm⁻¹), first convert: E = h·c·χ
"""
function line_center_wavelength(E_lower::Float64, E_upper::Float64)
    # Energy difference
    delta_E = E_upper - E_lower

    # Wavelength from Planck relation: E = hc/λ
    lambda_cm = (h_cgs * c_cgs) / delta_E

    # Convert to Angstroms
    return lambda_cm * 1.0e8
end

"""
    line_center_wavelength_wavenumber(chi_lower::Float64, chi_upper::Float64)

Calculate line center wavelength from wavenumber levels

λ₀ = 1 / (χ_upper - χ_lower)  [in cm, then convert to Å]

**Arguments:**
- `chi_lower`: Lower level wavenumber (cm⁻¹)
- `chi_upper`: Upper level wavenumber (cm⁻¹)

**Returns:** Rest wavelength λ₀ (Å)

**Example:**
```julia
# Hydrogen Lyman alpha: χ_lower = 0, χ_upper = 82259 cm⁻¹
lambda_lya = line_center_wavelength_wavenumber(0.0, 82259.0)  # ≈ 1215.67 Å
```
"""
function line_center_wavelength_wavenumber(chi_lower::Float64, chi_upper::Float64)
    # Wavenumber difference
    delta_chi = chi_upper - chi_lower

    # Wavelength: λ = 1/χ (in cm)
    lambda_cm = 1.0 / delta_chi

    # Convert to Angstroms
    return lambda_cm * 1.0e8
end

"""
    frequency_offset_doppler_units(lambda::Float64, lambda0::Float64,
                                   delta_nu_D::Float64)

Calculate frequency offset in Doppler width units

v = (ν - ν₀) / Δν_D = c·(λ⁻¹ - λ₀⁻¹) / Δν_D

This is the dimensionless offset used as input to the Voigt profile H(v,a).

**Arguments:**
- `lambda`: Observed wavelength (Å)
- `lambda0`: Rest wavelength (Å)
- `delta_nu_D`: Doppler width (Hz)

**Returns:** Dimensionless offset v

**Physical meaning:**
- v=0: Line center
- v=±1: One Doppler width from center
- v>5: Far wing (Lorentzian tail)
- |v|>20: Usually negligible (depending on damping)

**Example:**
```julia
lambda = 5000.5  # Å
lambda0 = 5000.0  # Å
delta_nu_D = 3e9  # Hz (typical for Fe I at solar T)
v = frequency_offset_doppler_units(lambda, lambda0, delta_nu_D)  # ≈ 0.3
```
"""
function frequency_offset_doppler_units(lambda::Float64, lambda0::Float64,
                                       delta_nu_D::Float64)
    # Convert wavelengths to cm
    lambda_cm = lambda * 1.0e-8
    lambda0_cm = lambda0 * 1.0e-8

    # Frequency offset: Δν = c·(1/λ - 1/λ₀) = c·(λ₀ - λ)/(λ·λ₀)
    delta_nu = c_cgs * (lambda0_cm - lambda_cm) / (lambda_cm * lambda0_cm)

    # Normalize by Doppler width
    return delta_nu / delta_nu_D
end

"""
    line_strength(loggf::Float64, lambda0::Float64, N_lower::Float64,
                 boltzmann_factor::Float64)

Calculate line strength (absorption coefficient contribution)

S = (√π e²)/(mₑ c) × λ₀² × f × N_lower × b

where:
- f = 10^loggf (oscillator strength)
- N_lower = lower level population (cm⁻³)
- b = boltzmann_factor = (n_i/N_total) × exp(-E_lower/kT) / U(T)

**Arguments:**
- `loggf`: log₁₀(gf) - oscillator strength (log scale)
- `lambda0`: Rest wavelength (Å)
- `N_lower`: Lower level number density (cm⁻³)
- `boltzmann_factor`: Population fraction in lower level

**Returns:** Line strength S (cm⁻¹ per Doppler width)

**Usage:** Multiply by Voigt profile H(v,a) to get opacity at offset v:
    α(v) = S × H(v,a)
"""
function line_strength(loggf::Float64, lambda0::Float64, N_lower::Float64,
                      boltzmann_factor::Float64)
    # Oscillator strength
    f_value = 10.0^loggf

    # Convert wavelength to cm
    lambda0_cm = lambda0 * 1.0e-8

    # Line strength prefactor: (√π e²) / (mₑ c)
    prefactor = (sqrt(π) * e_cgs^2) / (m_e_cgs * c_cgs)

    # Full line strength
    S = prefactor * lambda0_cm^2 * f_value * N_lower * boltzmann_factor

    return S
end

"""
    line_opacity_contribution(lambda::Float64, lambda0::Float64, loggf::Float64,
                             N_lower::Float64, boltzmann_factor::Float64,
                             delta_nu_D::Float64, a_damp::Float64)

Calculate total line opacity contribution at given wavelength

α(λ) = S × H(v,a)

where:
- S = line strength
- H(v,a) = Voigt profile
- v = frequency offset in Doppler widths
- a = damping parameter

**Arguments:**
- `lambda`: Wavelength to evaluate opacity (Å)
- `lambda0`: Line center wavelength (Å)
- `loggf`: Oscillator strength log₁₀(gf)
- `N_lower`: Lower level population (cm⁻³)
- `boltzmann_factor`: Population fraction
- `delta_nu_D`: Doppler width (Hz)
- `a_damp`: Damping parameter

**Returns:** Opacity coefficient α (cm⁻¹)

**Example:**
```julia
# Fe I line at 5000 Å
lambda = 5000.1  # Å (wavelength point)
lambda0 = 5000.0  # Å (line center)
loggf = -1.0
N_lower = 1e10  # cm⁻³
boltz = 0.5  # population fraction
delta_nu_D = 3e9  # Hz
a = 0.01

alpha = line_opacity_contribution(lambda, lambda0, loggf, N_lower, boltz,
                                 delta_nu_D, a)  # cm⁻¹
```
"""
function line_opacity_contribution(lambda::Float64, lambda0::Float64, loggf::Float64,
                                  N_lower::Float64, boltzmann_factor::Float64,
                                  delta_nu_D::Float64, a_damp::Float64)
    # Calculate frequency offset
    v = frequency_offset_doppler_units(lambda, lambda0, delta_nu_D)

    # Calculate line strength
    S = line_strength(loggf, lambda0, N_lower, boltzmann_factor)

    # Voigt profile at this offset
    H = voigt_profile(v, a_damp)

    # Total opacity contribution
    return S * H
end

"""
    significance_threshold(v_max::Float64=20.0)

Calculate early-exit threshold for line contribution loop

Lines more than v_max Doppler widths from line center contribute negligibly
to the opacity (except for very strong damping).

**Arguments:**
- `v_max`: Maximum offset to consider (default 20 Doppler widths)

**Returns:** Maximum Δλ/λ ratio to check

**Usage in SYNTHE:**
For each wavelength λ:
    threshold = significance_threshold()
    for each line λ₀:
        if |λ - λ₀|/λ₀ > threshold:
            skip this line  # Too far from center
        else:
            calculate and accumulate opacity

**Typical values:**
- v_max = 10: Fast, ~99% of opacity captured
- v_max = 20: Standard, >99.9% of opacity
- v_max = 50: High accuracy, for strong damping wings
"""
function significance_threshold(v_max::Float64=20.0)
    # For small Δλ: v ≈ Δλ/λ × c/Δν_D
    # Approximate: v ≈ (Δλ/λ) × (c/typical_doppler_velocity)
    # For typical thermal velocity ~10 km/s: c/v_th ≈ 30000
    # So: Δλ/λ ≈ v / 30000 ≈ v / 3e4

    # More conservative: allow for larger Doppler widths
    # Use Δλ/λ ≈ v / 10000
    return v_max / 1.0e4
end

"""
    line_in_range(lambda::Float64, lambda0::Float64, v_max::Float64=20.0)

Check if line contributes significantly to opacity at wavelength

Fast early-exit test to avoid expensive Voigt calculations for distant lines.

**Arguments:**
- `lambda`: Wavelength to evaluate (Å)
- `lambda0`: Line center (Å)
- `v_max`: Maximum offset in Doppler widths (default 20)

**Returns:** `true` if line should be included, `false` to skip

**Example:**
```julia
lambda = 5000.0  # Å
lambda0_nearby = 5000.5  # Å (0.5 Å away)
lambda0_far = 5100.0  # Å (100 Å away)

line_in_range(lambda, lambda0_nearby)  # true (within range)
line_in_range(lambda, lambda0_far)     # false (too far)
```
"""
function line_in_range(lambda::Float64, lambda0::Float64, v_max::Float64=20.0)
    # Calculate wavelength offset ratio
    delta_lambda = abs(lambda - lambda0)
    ratio = delta_lambda / lambda0

    # Compare to threshold
    threshold = significance_threshold(v_max)

    return ratio <= threshold
end

"""
    accumulate_line_opacity!(opacity::Vector{Float64},
                            wavelength_grid::Vector{Float64},
                            lambda0::Float64, loggf::Float64,
                            N_lower::Float64, boltzmann_factor::Float64,
                            delta_nu_D::Float64, a_damp::Float64,
                            v_max::Float64=20.0)

Accumulate line contribution to opacity array (in-place)

For a single spectral line, add its opacity contribution to all wavelength
points within v_max Doppler widths from line center.

**Arguments:**
- `opacity`: Opacity array to accumulate into (cm⁻¹) [modified in-place]
- `wavelength_grid`: Wavelength points (Å)
- `lambda0`: Line center wavelength (Å)
- `loggf`: Oscillator strength log₁₀(gf)
- `N_lower`: Lower level population (cm⁻³)
- `boltzmann_factor`: Population fraction
- `delta_nu_D`: Doppler width (Hz)
- `a_damp`: Damping parameter
- `v_max`: Maximum offset to consider (default 20)

**Returns:** Number of wavelength points affected

**Example:**
- Initialize opacity array and accumulate line contributions
- Returns number of wavelength points affected by the line
"""
function accumulate_line_opacity!(opacity::Vector{Float64},
                                 wavelength_grid::Vector{Float64},
                                 lambda0::Float64, loggf::Float64,
                                 N_lower::Float64, boltzmann_factor::Float64,
                                 delta_nu_D::Float64, a_damp::Float64,
                                 v_max::Float64=20.0)
    n_affected = 0

    # Calculate line strength once (independent of wavelength)
    S = line_strength(loggf, lambda0, N_lower, boltzmann_factor)

    # Loop over wavelength grid
    for i in eachindex(wavelength_grid)
        lambda = wavelength_grid[i]

        # Early exit: skip if too far from line center
        if !line_in_range(lambda, lambda0, v_max)
            continue
        end

        # Calculate frequency offset
        v = frequency_offset_doppler_units(lambda, lambda0, delta_nu_D)

        # Skip if beyond threshold (redundant check, but faster than Voigt calc)
        if abs(v) > v_max
            continue
        end

        # Voigt profile at this offset
        H = voigt_profile(v, a_damp)

        # Accumulate opacity
        opacity[i] += S * H
        n_affected += 1
    end

    return n_affected
end

"""
    opacity_ratio(alpha_line::Float64, alpha_continuum::Float64)

Calculate line-to-continuum opacity ratio

Useful for identifying line strength and contribution significance.

**Arguments:**
- `alpha_line`: Line opacity (cm⁻¹)
- `alpha_continuum`: Continuum opacity (cm⁻¹)

**Returns:** Ratio α_line / α_continuum (dimensionless)

**Typical values:**
- Ratio < 0.01: Weak line, minimal effect on flux
- Ratio ~ 0.1-1: Moderate line, noticeable feature
- Ratio > 1: Strong line, dominates opacity
- Ratio >> 10: Very strong line, optically thick core
"""
function opacity_ratio(alpha_line::Float64, alpha_continuum::Float64)
    if alpha_continuum <= 0.0
        return Inf  # Undefined ratio
    end

    return alpha_line / alpha_continuum
end

"""
    equivalent_width_optically_thin(S::Float64, delta_nu_D::Float64, a::Float64)

Calculate equivalent width for optically thin line

W_λ ≈ (λ₀/c) × S × √π × H(0,a) / (ρ × Δν_D)

This is a simplified formula valid for weak lines where τ₀ << 1.

**Arguments:**
- `S`: Line strength (cm⁻¹ per Doppler width)
- `delta_nu_D`: Doppler width (Hz)
- `a`: Damping parameter

**Returns:** Equivalent width (Å)

**Note:** For strong lines, use full radiative transfer (curve of growth)
"""
function equivalent_width_optically_thin(S::Float64, delta_nu_D::Float64, a::Float64)
    # Line center Voigt profile
    H_center = voigt_profile(0.0, a)

    # Simplified EW formula (order of magnitude)
    # W ≈ S × H(0) × √π / Δν_D × (λ/c)
    # Approximation: λ/c ≈ 1e-18 s for optical wavelengths
    W = S * H_center * sqrt(π) / delta_nu_D * 1e-18

    # Convert to Angstroms (rough scaling)
    return W * 1e8
end

# Export all functions
export line_center_wavelength, line_center_wavelength_wavenumber
export frequency_offset_doppler_units
export line_strength, line_opacity_contribution
export significance_threshold, line_in_range
export accumulate_line_opacity!
export opacity_ratio, equivalent_width_optically_thin
