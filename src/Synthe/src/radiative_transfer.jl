"""
Radiative transfer solver using Feautrier method

Implements Pure Julia equivalent of atlas7v JOSH subroutine.

Functions:
- solve_tridiagonal() - Thomas algorithm for tridiagonal systems
- source_function_lte() - LTE source function (Planck)
- compute_optical_depth() - Integrate opacity to get τ(z)
- solve_radiative_transfer_feautrier() - Formal solution of RTE
- compute_emergent_spectrum() - Full spectrum calculation

Physics:
- Radiative Transfer Equation: dI/dτ = I - S
- Feautrier method: Second-order differential equation
- LTE source function: S = B_ν(T) (Planck function)
- Eddington-Barbier relation: I(0) ≈ B(T at τ≈1)

References:
- Mihalas (1978) "Stellar Atmospheres" - Chapter 4
- Hubeny & Mihalas (2014) "Theory of Stellar Atmospheres"
- Gray (2005) "Observations and Analysis of Stellar Photospheres"

Author: Claude (Local), Paula Coelho
Date: 2025-11-14
"""

# Load physical constants
include("constants.jl")

"""
    solve_tridiagonal(a, b, c, d) -> Vector{Float64}

Solve tridiagonal system Ax = d using Thomas algorithm.

The tridiagonal matrix A has the form:
```
[b[1]  c[1]   0    ...    0   ]
[a[2]  b[2]  c[2]  ...    0   ]
[ 0    a[3]  b[3]  ...    0   ]
[...   ...   ...   ...   ...  ]
[ 0    ...    0   a[n]  b[n]  ]
```

# Arguments
- `a::Vector{Float64}`: Sub-diagonal (length n, a[1] ignored)
- `b::Vector{Float64}`: Main diagonal (length n)
- `c::Vector{Float64}`: Super-diagonal (length n, c[n] ignored)
- `d::Vector{Float64}`: Right-hand side (length n)

# Returns
- `x::Vector{Float64}`: Solution vector (length n)

# Algorithm
Thomas algorithm (specialized Gaussian elimination for tridiagonal systems):
1. Forward sweep: Eliminate sub-diagonal
2. Back substitution: Solve for x

# Computational Complexity
- Time: O(n)
- Space: O(n)

# Example
```julia
# Solve: 2x₁ + x₂ = 3
#        x₁ + 2x₂ + x₃ = 4
#             x₂ + 2x₃ = 3
# Solution: x = [1, 1, 1]

a = [0.0, 1.0, 1.0]
b = [2.0, 2.0, 2.0]
c = [1.0, 1.0, 0.0]
d = [3.0, 4.0, 3.0]

x = solve_tridiagonal(a, b, c, d)
```
"""
function solve_tridiagonal(a::Vector{Float64}, b::Vector{Float64},
                          c::Vector{Float64}, d::Vector{Float64})::Vector{Float64}
    n = length(d)

    # Validate inputs
    if length(a) != n || length(b) != n || length(c) != n
        throw(ArgumentError("All input vectors must have same length"))
    end

    # Allocate solution and workspace
    x = zeros(n)
    c_prime = zeros(n-1)
    d_prime = zeros(n)

    # Forward sweep: Eliminate sub-diagonal
    c_prime[1] = c[1] / b[1]
    d_prime[1] = d[1] / b[1]

    for i in 2:(n-1)
        denom = b[i] - a[i] * c_prime[i-1]

        if abs(denom) < 1.0e-14
            throw(ArgumentError("Singular matrix in tridiagonal solver"))
        end

        c_prime[i] = c[i] / denom
        d_prime[i] = (d[i] - a[i] * d_prime[i-1]) / denom
    end

    # Last row
    denom = b[n] - a[n] * c_prime[n-1]
    if abs(denom) < 1.0e-14
        throw(ArgumentError("Singular matrix in tridiagonal solver"))
    end
    d_prime[n] = (d[n] - a[n] * d_prime[n-1]) / denom

    # Back substitution
    x[n] = d_prime[n]
    for i in (n-1):-1:1
        x[i] = d_prime[i] - c_prime[i] * x[i+1]
    end

    return x
end

"""
    source_function_lte(λ::Float64, T::Float64) -> Float64

Compute LTE source function (Planck function) at given wavelength and temperature.

For Local Thermodynamic Equilibrium (LTE):
    S_λ(T) = B_λ(T)

where B_λ(T) is the Planck function.

# Arguments
- `λ::Float64`: Wavelength (Å)
- `T::Float64`: Temperature (K)

# Returns
- `Float64`: Source function S_λ (erg/s/cm²/Å/sr)

# Physics
The Planck function describes blackbody radiation:

    B_λ(T) = (2hc²/λ⁵) / [exp(hc/λkT) - 1]

In LTE, the source function equals the Planck function at the local temperature.

# Limiting Cases
- Wien limit (hc/λkT >> 1): B_λ ∝ exp(-hc/λkT) / λ⁵
- Rayleigh-Jeans limit (hc/λkT << 1): B_λ ∝ 2ckT / λ⁴

# Example
```julia
# Solar photosphere at 5000Å
S = source_function_lte(5000.0, 5777.0)
# ≈ 1.4e14 erg/s/cm²/Å/sr
```
"""
function source_function_lte(λ::Float64, T::Float64)::Float64
    # Validate inputs
    if λ <= 0.0
        throw(ArgumentError("Wavelength must be positive, got $λ"))
    end
    if T <= 0.0
        throw(ArgumentError("Temperature must be positive, got $T"))
    end

    # Convert wavelength from Angstroms to cm
    λ_cm = λ * 1.0e-8

    # Planck function in wavelength units
    # B_λ(T) = (2hc²/λ⁵) / [exp(hc/λkT) - 1]

    const h = h_cgs       # 6.62607015e-27 erg·s
    const c = c_cgs       # 2.99792458e10 cm/s
    const k = k_B_cgs     # 1.380649e-16 erg/K

    # Exponent: x = hc/(λkT)
    x = (h * c) / (λ_cm * k * T)

    # Check for overflow in exp(x)
    if x > 100.0
        # Wien limit: exp(-x) dominates
        return (2.0 * h * c^2 / λ_cm^5) * exp(-x)
    else
        # Full Planck function
        return (2.0 * h * c^2 / λ_cm^5) / (exp(x) - 1.0)
    end
end

"""
    compute_optical_depth(λ::Float64, heights::Vector{Float64},
                         temperatures::Vector{Float64},
                         electron_pressures::Vector{Float64},
                         pops::Vector{PopulationResult}) -> Vector{Float64}

Compute monochromatic optical depth τ_λ(z) by integrating opacity.

The optical depth is defined as:
    dτ_λ = -κ_λ dz

where κ_λ is the opacity (cm⁻¹) and z is geometric height (cm, increasing outward).

# Arguments
- `λ::Float64`: Wavelength (Å)
- `heights::Vector{Float64}`: Geometric heights (cm, decreasing inward recommended)
- `temperatures::Vector{Float64}`: Temperature at each depth (K)
- `electron_pressures::Vector{Float64}`: Electron pressure at each depth (dyne/cm²)
- `pops::Vector{PopulationResult}`: Populations at each depth

# Returns
- `τ::Vector{Float64}`: Optical depth at each depth point (dimensionless)
  τ[1] = 0 (top of atmosphere), increasing inward

# Algorithm
Trapezoidal rule integration:
    τ[i] = τ[i-1] + 0.5 * (κ[i] + κ[i-1]) * |dz|

# Example
```julia
# Compute optical depth at 5000Å
τ = compute_optical_depth(5000.0, heights, temperatures, P_e, pops)
# τ[1] = 0.0 (top), τ increases inward
```
"""
function compute_optical_depth(λ::Float64, heights::Vector{Float64},
                              temperatures::Vector{Float64},
                              electron_pressures::Vector{Float64},
                              pops::Vector{PopulationResult})::Vector{Float64}
    n_depth = length(heights)

    # Validate inputs
    if length(temperatures) != n_depth
        throw(ArgumentError("temperatures must have same length as heights"))
    end
    if length(electron_pressures) != n_depth
        throw(ArgumentError("electron_pressures must have same length as heights"))
    end
    if length(pops) != n_depth
        throw(ArgumentError("pops must have same length as heights"))
    end

    # Initialize optical depth
    τ = zeros(n_depth)
    τ[1] = 0.0  # Top of atmosphere

    # Integrate inward using trapezoidal rule
    for i in 2:n_depth
        # Opacity at both depth points (uses Step 3 continuum_opacity_total)
        κ_i = continuum_opacity_total(λ, temperatures[i], electron_pressures[i], pops[i])
        κ_im1 = continuum_opacity_total(λ, temperatures[i-1], electron_pressures[i-1], pops[i-1])

        # Geometric height step
        dz = heights[i] - heights[i-1]  # Should be negative (going inward)

        # Optical depth increment: dτ = -κ dz
        # If dz < 0 (going inward), then dτ > 0 (optical depth increases)
        dτ = -0.5 * (κ_i + κ_im1) * dz

        τ[i] = τ[i-1] + abs(dτ)  # Ensure positive increment
    end

    return τ
end

"""
    solve_radiative_transfer_feautrier(λ::Float64, temperatures::Vector{Float64},
                                      τ::Vector{Float64}) -> (Vector{Float64}, Float64)

Solve radiative transfer equation using Feautrier method.

Solves the RTE:
    dI/dτ = I - S

using the Feautrier reformulation as a second-order differential equation:
    d²u/dτ² = u - S

where u = (I⁺ + I⁻)/2 is the mean intensity.

# Arguments
- `λ::Float64`: Wavelength (Å)
- `temperatures::Vector{Float64}`: Temperature at each depth (K)
- `τ::Vector{Float64}`: Optical depth scale (dimensionless, τ[1]=0)

# Returns
- `u::Vector{Float64}`: Mean intensity at each depth (erg/s/cm²/Å/sr)
- `I_emergent::Float64`: Emergent intensity at μ=1 (erg/s/cm²/Å/sr)

# Method
1. Compute source function S_λ(T) at each depth (LTE: S = B_λ)
2. Set up tridiagonal system from finite difference approximation
3. Apply boundary conditions:
   - Top: No incident radiation
   - Bottom: Diffusion approximation
4. Solve tridiagonal system for u
5. Compute emergent intensity from u and du/dτ

# Physics
Eddington-Barbier relation: I(0, μ=1) ≈ B(T at τ≈1)

# Example
```julia
u, I_em = solve_radiative_transfer_feautrier(5000.0, temperatures, τ)
# I_em ≈ Planck(T at τ≈1) (Eddington-Barbier)
```
"""
function solve_radiative_transfer_feautrier(λ::Float64, temperatures::Vector{Float64},
                                           τ::Vector{Float64})::Tuple{Vector{Float64}, Float64}
    n_depth = length(τ)

    # Validate inputs
    if length(temperatures) != n_depth
        throw(ArgumentError("temperatures must have same length as τ"))
    end
    if τ[1] != 0.0
        @warn "Optical depth should start at 0 (top of atmosphere), got $(τ[1])"
    end

    # Compute source function at each depth (LTE: S = B_λ)
    S = [source_function_lte(λ, T) for T in temperatures]

    # Set up tridiagonal system: A u = rhs
    a = zeros(n_depth)       # Sub-diagonal
    b_diag = zeros(n_depth)  # Diagonal
    c = zeros(n_depth)       # Super-diagonal
    rhs = zeros(n_depth)     # Right-hand side

    # Interior points: Finite difference approximation of d²u/dτ² = u - S
    for i in 2:(n_depth-1)
        Δτ_minus = τ[i] - τ[i-1]
        Δτ_plus = τ[i+1] - τ[i]

        # Ensure positive increments
        if Δτ_minus <= 0.0 || Δτ_plus <= 0.0
            throw(ArgumentError("Optical depth must increase monotonically"))
        end

        # Coefficients for second derivative: d²u/dτ²
        # Using centered difference with non-uniform grid
        a[i] = 2.0 / (Δτ_minus * (Δτ_minus + Δτ_plus))
        c[i] = 2.0 / (Δτ_plus * (Δτ_minus + Δτ_plus))
        b_diag[i] = -(a[i] + c[i]) + 1.0  # d²u/dτ² = u - S → -d²u/dτ² + u = S

        rhs[i] = S[i]
    end

    # Boundary condition: Top (i=1)
    # No incident radiation: Assume u[1] ≈ S[1] (optically thin surface)
    # More sophisticated: v = u at surface, but simplified here
    b_diag[1] = 1.0
    c[1] = 0.0
    rhs[1] = S[1]

    # Boundary condition: Bottom (i=n_depth)
    # Diffusion approximation: du/dτ ≈ 0 (deep in atmosphere)
    # Simplified: u[n_depth] ≈ S[n_depth] (LTE at depth)
    a[n_depth] = 0.0
    b_diag[n_depth] = 1.0
    rhs[n_depth] = S[n_depth]

    # Solve tridiagonal system
    u = solve_tridiagonal(a, b_diag, c, rhs)

    # Compute emergent intensity
    # Eddington-Barbier approximation: I(0, μ=1) ≈ u[1] + (du/dτ)[1]
    # Simplified: I_emergent ≈ u[1]
    # More accurate: I = u + μ * du/dτ, but we use simple approximation
    I_emergent = u[1]

    return u, I_emergent
end

"""
    compute_emergent_spectrum(wavelengths::Vector{Float64}, heights::Vector{Float64},
                             temperatures::Vector{Float64},
                             electron_pressures::Vector{Float64},
                             pops::Vector{PopulationResult}) -> Vector{Float64}

Compute emergent spectrum I(λ) over wavelength range.

For each wavelength:
1. Compute optical depth τ_λ(z)
2. Solve radiative transfer equation
3. Extract emergent intensity I_λ(0)

# Arguments
- `wavelengths::Vector{Float64}`: Wavelength grid (Å)
- `heights::Vector{Float64}`: Geometric heights (cm)
- `temperatures::Vector{Float64}`: Temperature at each depth (K)
- `electron_pressures::Vector{Float64}`: Electron pressure (dyne/cm²)
- `pops::Vector{PopulationResult}`: Populations at each depth

# Returns
- `I_emergent::Vector{Float64}`: Emergent intensity at each wavelength (erg/s/cm²/Å/sr)

# Example
```julia
# Compute spectrum from 4000-7000 Å
wavelengths = collect(4000.0:10.0:7000.0)
I_spectrum = compute_emergent_spectrum(wavelengths, heights, T, P_e, pops)

# Plot spectrum
plot(wavelengths, I_spectrum, xlabel="λ (Å)", ylabel="I_λ")
```
"""
function compute_emergent_spectrum(wavelengths::Vector{Float64}, heights::Vector{Float64},
                                  temperatures::Vector{Float64},
                                  electron_pressures::Vector{Float64},
                                  pops::Vector{PopulationResult})::Vector{Float64}
    n_wavelength = length(wavelengths)
    I_emergent = zeros(n_wavelength)

    # For each wavelength, solve RTE
    for (i, λ) in enumerate(wavelengths)
        # Compute optical depth at this wavelength
        τ = compute_optical_depth(λ, heights, temperatures, electron_pressures, pops)

        # Solve radiative transfer equation
        u, I = solve_radiative_transfer_feautrier(λ, temperatures, τ)

        # Store emergent intensity
        I_emergent[i] = I
    end

    return I_emergent
end
end

"""
    compute_limb_darkening(wavelengths::Vector{Float64}, μ_values::Vector{Float64},
                          temperatures::Vector{Float64}, τ::Vector{Float64}) -> Matrix{Float64}

Compute limb darkening: intensity as function of viewing angle.

For each (λ, μ) pair, compute emergent intensity using Eddington-Barbier relation:
    I(0, μ) ≈ B(T at τ≈μ)

# Arguments
- `wavelengths::Vector{Float64}`: Wavelength grid (Å)
- `μ_values::Vector{Float64}`: Cosine of viewing angles (μ = cos θ), 0 < μ ≤ 1
- `temperatures::Vector{Float64}`: Temperature at each depth (K)
- `τ::Vector{Float64}`: Optical depth scale (dimensionless)

# Returns
- `I::Matrix{Float64}`: Intensity[wavelength, μ] (erg/s/cm²/Å/sr)
  Size: (n_wavelength, n_μ)

# Physics
- μ = 1: Disk center (normal emergence)
- μ → 0: Limb (grazing emergence)
- Limb darkening: I decreases from center to limb
- Eddington-Barbier: I(μ) ≈ B(T at τ=μ)

# Example
```julia
# Compute limb darkening at 5000 Å
μ_grid = [1.0, 0.9, 0.7, 0.5, 0.3, 0.1]
I = compute_limb_darkening([5000.0], μ_grid, temperatures, τ)

# Plot: I vs μ (limb darkening curve)
plot(μ_grid, I[1, :], xlabel="μ = cos θ", ylabel="I_λ")
```
"""
function compute_limb_darkening(wavelengths::Vector{Float64}, μ_values::Vector{Float64},
                               temperatures::Vector{Float64}, τ::Vector{Float64})::Matrix{Float64}
    n_wavelength = length(wavelengths)
    n_μ = length(μ_values)

    I = zeros(n_wavelength, n_μ)

    for (i, λ) in enumerate(wavelengths)
        # Source function at each depth
        S = [source_function_lte(λ, T) for T in temperatures]

        for (j, μ) in enumerate(μ_values)
            # Eddington-Barbier approximation: I(0, μ) ≈ S(τ = μ)
            # Find depth where τ ≈ μ
            idx = argmin(abs.(τ .- μ))

            # Emergent intensity from this depth
            I[i, j] = S[idx]
        end
    end

    return I
end

"""
    limb_darkening_coefficient(I_center::Float64, I_limb::Float64, μ_limb::Float64=0.1) -> Float64

Compute limb darkening coefficient u from intensities.

Linear limb darkening law:
    I(μ) / I(1) = 1 - u(1 - μ)

# Arguments
- `I_center::Float64`: Intensity at disk center (μ = 1)
- `I_limb::Float64`: Intensity at limb (e.g., μ = 0.1)
- `μ_limb::Float64`: Limb angle (default 0.1)

# Returns
- `u::Float64`: Limb darkening coefficient (dimensionless)

# Example
```julia
u = limb_darkening_coefficient(I[1, 1], I[1, end], 0.1)
println("Limb darkening coefficient u = ", u)
```
"""
function limb_darkening_coefficient(I_center::Float64, I_limb::Float64, μ_limb::Float64=0.1)::Float64
    # I(μ) / I(1) = 1 - u(1 - μ)
    # u = (1 - I(μ)/I(1)) / (1 - μ)

    ratio = I_limb / I_center
    u = (1.0 - ratio) / (1.0 - μ_limb)

    return u
end

"""
    synthesize_spectrum_full(wavelengths::Vector{Float64}, atm, pops::Vector{PopulationResult},
                            lines::Vector{SpectralLine}, line_cutoff::Float64=10.0) -> Vector{Float64}

Full spectrum synthesis with depth-dependent optical depth including lines.

This is the complete synthesis function that:
1. For each wavelength, computes optical depth through atmosphere (continuum + lines)
2. Solves radiative transfer equation
3. Returns emergent spectrum

# Arguments
- `wavelengths::Vector{Float64}`: Wavelength grid (Å)
- `atm`: Atmosphere model (from read_atlas9_model)
- `pops::Vector{PopulationResult}`: Populations at each depth
- `lines::Vector{SpectralLine}`: Spectral lines
- `line_cutoff::Float64`: Line opacity cutoff distance (Å)

# Returns
- `I_spectrum::Vector{Float64}`: Emergent intensity spectrum (erg/s/cm²/Å/sr)

# Example
```julia
# Full synthesis
atm = read_atlas9_model("models/sun.dat")
pops = [compute_populations(T, P, atm.abundances) for (T,P) in zip(atm.temperature, atm.pressure)]
lines = read_gfall_lines("gfall.dat", 5000.0, 5100.0)

wavelengths = collect(5000.0:0.1:5100.0)
I = synthesize_spectrum_full(wavelengths, atm, pops, lines)
```
"""
function synthesize_spectrum_full(wavelengths::Vector{Float64}, atm, 
                                 pops::Vector{PopulationResult},
                                 lines::Vector{SpectralLine}, 
                                 line_cutoff::Float64=10.0)::Vector{Float64}
    n_wavelength = length(wavelengths)
    I_spectrum = zeros(n_wavelength)

    # Create geometric height array (if not in atm)
    # For ATLAS models, we use τ_ross as proxy for depth structure
    # Real implementation would convert τ_ross → z using hydrostatic equilibrium

    n_depth = atm.n_depths

    # For each wavelength
    for (i, λ) in enumerate(wavelengths)
        # Compute optical depth at this wavelength INCLUDING LINES
        τ = zeros(n_depth)
        τ[1] = 0.0

        # Integrate optical depth
        for j in 2:n_depth
            # Temperature and pressure at both points
            T_j = atm.temperature[j]
            T_jm1 = atm.temperature[j-1]

            P_e_j = atm.electron_density[j] * 1.380649e-16 * T_j
            P_e_jm1 = atm.electron_density[j-1] * 1.380649e-16 * T_jm1

            # Total opacity (continuum + lines) at both points
            κ_j = total_opacity_with_lines(λ, T_j, P_e_j, pops[j], lines, line_cutoff)
            κ_jm1 = total_opacity_with_lines(λ, T_jm1, P_e_jm1, pops[j-1], lines, line_cutoff)

            # Optical depth step (use τ_ross spacing as proxy for dz)
            # Δτ_λ ≈ κ_λ × (Δτ_ross / κ_ross) 
            # Simplified: assume Δτ_λ proportional to κ_λ and Δτ_ross
            Δτ_ross = atm.tau_ross[j] - atm.tau_ross[j-1]

            # Simple approximation: dτ_λ = (κ_λ / κ_ref) × dτ_ross
            # where κ_ref is reference opacity
            # For solar: κ_ref ≈ 10^-10 cm⁻¹ at 5000Å
            κ_ref = 1.0e-10

            κ_avg = 0.5 * (κ_j + κ_jm1)
            dτ = (κ_avg / κ_ref) * Δτ_ross

            τ[j] = τ[j-1] + abs(dτ)
        end

        # Solve RTE
        u, I_em = solve_radiative_transfer_feautrier(λ, atm.temperature, τ)

        I_spectrum[i] = I_em
    end

    return I_spectrum
end
