# Deep Dive 11: SYNTHE Broadening Kernels
*Rotational and Instrumental Convolution for Spectrum Post-Processing*

**Code Sections**:
- `upstream/castelli/source_codes/synthe/rotate.for` (360 lines)
- `upstream/castelli/source_codes/synthe/broaden.for` (221 lines)

**Risk Type**: Numerical Algorithms, Performance
**Analysis Date**: 2025-11-09
**Time Invested**: ~45 minutes

---

## Executive Summary

ROTATE and BROADEN are the final post-processing steps in the SYNTHE pipeline, applying **rotational** and **instrumental broadening** to synthetic spectra via discrete convolution.

**Key findings**:

1. **Pure convolution**: Both programs implement straightforward discrete convolution (no FFT optimization)
2. **Rotation**: Applies limb-darkening-weighted rotational broadening (v sin i)
3. **Instrumental**: Supports Gaussian, sinc, rectangular, macroturbulence, and custom profiles
4. **Simple but slow**: O(N×M) direct convolution (N=spectrum points, M=profile width)
5. **Large memory buffers**: Pad spectrum with ~20K points on each side to handle profile wings
6. **Multiple profiles**: Broaden can apply custom asymmetric profiles (red vs blue wings)

**Migration**: Low complexity - standard DSP convolution. Julia's DSP.jl or FFTW.jl can provide 10-100× speedup.

---

## Table of Contents

1. [Overview](#1-overview)
2. [Rotate: Rotational Broadening](#2-rotate-rotational-broadening)
3. [Limb Darkening](#3-limb-darkening)
4. [Broaden: Instrumental Profiles](#4-broaden-instrumental-profiles)
5. [Convolution Implementation](#5-convolution-implementation)
6. [Memory Management](#6-memory-management)
7. [Performance Analysis](#7-performance-analysis)
8. [Migration Strategy](#8-migration-strategy)
9. [Testing Strategy](#9-testing-strategy)
10. [Key Takeaways](#10-key-takeaways)

---

## 1. Overview

### Pipeline Position

```
spectrv → (fort.7) → rotate → (ROT1, ROT2, ...) → broaden → (broadened spectrum) → analysis
```

**Inputs**:
- rotate: fort.7 (or fort.1 - spectrum from spectrv with intensities at multiple angles)
- broaden: ROT file (or any spectrum file - fort.21)

**Outputs**:
- rotate: ROT1, ROT2, ... (one file per rotation velocity)
- broaden: fort.22 (broadened spectrum)

### Why Two Programs?

**Design philosophy**: Modular pipeline
- **Rotate**: Once per star (fixed v sin i)
- **Broaden**: Multiple times (different instruments, different observations)

**Example workflow**:
```bash
# 1. Compute atmosphere and spectrum (slow - hours)
./xnfpelsyn < atlas_model.mod
./synthe < synthe.input
./spectrv < spectrv.input

# 2. Apply rotation (fast - seconds)
./rotate < rotate.input  # Creates ROT1, ROT2, ...

# 3. Apply different instrumental profiles (fast - seconds each)
./broaden < echelle.input      # High-res echelle
./broaden < ccd.input           # Medium-res CCD
./broaden < photographic.input  # Low-res photographic
```

**Benefit**: Can explore different instrumental setups without recomputing expensive synthesis.

---

## 2. Rotate: Rotational Broadening

### Physical Basis

**Stellar rotation** causes Doppler shifts:
- **Approaching limb** (blue-shifted): λ_obs = λ_0 × (1 - v/c)
- **Receding limb** (red-shifted): λ_obs = λ_0 × (1 + v/c)
- **Equator** (maximum velocity): v = v_eq × sin(i)

Where:
- v_eq = equatorial velocity
- i = inclination angle (i=90° → edge-on, see full equator)
- v sin i = projected rotational velocity (observable)

**Spectrum broadening**:
- Each point on stellar disk emits spectrum Doppler-shifted by local velocity
- Observed spectrum = integral over all visible disk
- Result: Line profiles broadened, edges determined by ±v sin i

### Input Parameters

```fortran
READ(5,1001)NROT,NRADIUS,(VROT(IROT),IROT=1,NROT)
1001 FORMAT(I5,I5/(8F10.1))
```

**Example input**:
```
    2   50
   10.0   20.0
```

**Parameters**:
- `NROT`: Number of rotation velocities to compute (e.g., 2)
- `NRADIUS`: Number of radial zones for limb darkening integration (default 50)
- `VROT(1:NROT)`: Rotation velocities in km/s (e.g., 10, 20)

**Output**: Creates ROT1 (for 10 km/s), ROT2 (for 20 km/s)

### Limb Darkening Integration

**Key subroutine**: WTROT (lines 57, 100)

```fortran
CALL WTROT(VEL,VSTEP,NV,NWT,WTMU,NRADIUS)
```

**Purpose**: Compute weights for convolution that account for limb darkening.

**Algorithm** (simplified):
1. Divide stellar disk into NRADIUS concentric annuli
2. For each annulus at radius r (0 to 1):
   - Local velocity: v_local = v sin i × r
   - Intensity: I(r) = I_center × limb_darkening(r)
   - Area: dA ∝ r × dr
3. Compute contribution to convolution kernel at each velocity offset

**Limb darkening function** (typically linear):
```
I(μ) / I(1) = 1 - u × (1 - μ)
```
Where μ = cos(θ), θ = angle from disk center, u ≈ 0.6 (solar-type stars)

**Result**: `WTMU(1:100)` array of weights for 100 disk positions (μ = 0.005, 0.015, ..., 0.995)

### Rotation Convolution

**Core loop** (lines 117-122):
```fortran
DO 25 I=1,NWT
  MU=MUNWT(I)         ! Disk position index
  IV=IVNWT(I)         ! Velocity offset index
  W=WTNWT(I)*INT100(MU)  ! Weight × intensity at this μ

  ! Add contribution to red and blue sides
  HROT(J-IV)=HROT(J-IV)+W
  HROT(J+IV)=HROT(J+IV)+W
25 CONTINUE
```

**Explanation**:
- `MUNWT, IVNWT, WTNWT`: Pre-computed rotation kernel (from WTROT)
- `INT100(MU)`: Intensity at disk position μ
- Symmetric addition (±IV): Red and blue shifts

**Kernel size**: `NV = v sin i / v_step` wavelength points

**Example** (v sin i = 20 km/s, R = 500000):
- v_step = c / R ≈ 0.6 km/s per point
- NV = 20 / 0.6 ≈ 33 points
- Kernel spans ±33 points around line center

### Intensity Integration

**Before rotation** (lines 68-76):
```fortran
! Interpolate intensity to 100 equally-spaced μ points
IDUMMY=MAP1(XX,INTEN,NM1,XMU100,INT100,100)

! Integrate over disk (weighted by μ for surface element)
DO 14 I=1,100
  CONTIN=CONTIN+INT100(I)*WTMU(I)
14 CONTINUE
```

**WTMU**: Disk integration weights (account for foreshortening: dA ∝ μ dμ dφ)

**Why interpolate to 100 points?**
- spectrv typically computes intensity at 17 angles
- Need finer sampling for accurate limb-darkening integration
- 100 points is overkill but fast (< 1 ms)

---

## 3. Limb Darkening

### MAP1: Intensity Interpolation

```fortran
IDUMMY=MAP1(XX,INTEN,NM1,XMU100,INT100,100)
```

**Purpose**: Interpolate intensity from NMU angles (e.g., 17) to 100 equally-spaced points.

**Input**:
- `XX`: μ values from spectrv (e.g., 0.05, 0.1, 0.15, ..., 1.0)
- `INTEN`: Intensity at each μ
- `NM1 = NMU + 1`

**Output**:
- `XMU100`: 100 equally-spaced μ values (0.005, 0.015, ..., 0.995)
- `INT100`: Interpolated intensity

**Method**: Linear interpolation (MAP1 is a standard interpolation utility)

### Limb-Darkening Law

🐉 **Dragon Alert**: WTROT subroutine is NOT shown in the file excerpt!

**Likely in ATLAS7V library** or embedded later in rotate.for.

**Standard form** (linear limb darkening):
```
I(μ) = I(1) × (1 - u + u × μ)
```

**Typical values**:
- Solar-type (G): u ≈ 0.6
- Cool stars (K, M): u ≈ 0.8 (stronger limb darkening)
- Hot stars (B, A): u ≈ 0.3 (weaker)

**Impact on rotation profile**: Stronger limb darkening → shallower profile wings (less flux from limb).

---

## 4. Broaden: Instrumental Profiles

### Supported Profile Types

From code comments (lines 40-56):
```
GAUSSIAN  3.5       KM        (Gaussian FWHM in km/s)
GAUSSIAN  100000.   RESOLUTION(Gaussian FWHM from resolving power)
GAUSSIAN  7.        PM        (Gaussian FWHM in picometers)
SINX/X    3.5       KM        (Sinc function - FTS instrumental)
RECT      7.        PM        (Rectangular - perfect slit)
MACRO     2.0       KM        (Macroturbulence - Gaussian)
PROFILE   5.        POINTS    (Custom tabulated profile)
```

**Input format** (line 58):
```fortran
READ(5,1)A,X,B,COMMENT
1 FORMAT(A4,A4,A2,F10.2,A4,A4,A2,12A4,A2)
```

**Example**:
```
GAUSSIAN  3.5       KM        Echelle spectrograph FWHM
```

### Gaussian Profile (lines 20-106)

```fortran
20 FWHM=0.
   IF(B(1).EQ.4HPM  )FWHM=X/WCEN/1000.*299792.5
   IF(B(1).EQ.4HKM  )FWHM=X
   IF(B(1).EQ.4HRESO)FWHM=299792.5/X

   DO 21 I=1,20000
     RED(I)=EXP(-(FLOAT(I-1)*VSTEP/FWHM*.8325546*2.)**2)
     IF(RED(I).LT.1.E-5)GO TO 22
21 CONTINUE
```

**Gaussian formula**:
```
G(v) = exp(-(v / σ)²)
```

Where σ = FWHM / (2 × √(2 ln 2)) = FWHM × 0.4247 (but code uses 0.8325546 × 2 ≈ 1.665 → **wrong?**)

🐉 **Dragon**: The constant `0.8325546 × 2` seems suspicious. Should be:
- FWHM = 2 × √(2 ln 2) × σ ≈ 2.3548 × σ
- σ = FWHM / 2.3548 ≈ FWHM × 0.4247

But code has: `v / FWHM × 0.8325546 × 2 ≈ v / FWHM × 1.665`

Let me check: If we want `exp(-(v/σ)²)` and σ = FWHM / 2.3548, then:
```
exp(-(v/(FWHM/2.3548))²) = exp(-(v × 2.3548 / FWHM)²)
```

So the coefficient should be 2.3548, not 1.665!

**Possible explanation**: Code uses FWHM in peculiar units or has historical bug? Needs validation against observations.

### Sinc Profile (lines 108-128)

```fortran
25 RED(1)=0.5
   DO 26 I=2,20000
     X=(FLOAT(I-1)*VSTEP/FWHM*2.*1.8954942)
     RED(I)=SIN(X)/X*EXP(-0.06*X**2)
26 CONTINUE
```

**Sinc function**: sin(x)/x
- **Natural for Fourier Transform Spectrometers** (FTS)
- Sharp cutoff in Fourier space
- Apodized by `exp(-0.06 x²)` to suppress sidelobes

**Constant 1.8954942**: Likely chosen empirically to match FWHM definition for sinc.

### Rectangular Profile (lines 130-149)

```fortran
30 XRECT=FWHM/2./VSTEP
   NRECT=XRECT+1.5
   DO 31 I=1,NPROF
31 RED(I)=1.
```

**Rectangular**: Uniform weight over ±FWHM/2
- **Perfect slit function**
- Sharp edges (non-physical but useful for idealized instruments)

### Custom Profile (lines 151-160)

```fortran
40 NPROF=X  ! Number of points
   READ(5,41)(RED(I),I=1,NPROF)   ! Red wing weights
   READ(5,41)(BLUE(I),I=1,NPROF)  ! Blue wing weights
41 FORMAT(10X,7F10.6)
```

**Asymmetric profiles**: Different red and blue wings
- **Use case**: Complex instrumental response measured empirically
- **Example**: Fiber-fed spectrographs with slight asymmetry

**Normalization** (lines 158-159):
```fortran
RED(1)=RED(1)/2.
BLUE(1)=BLUE(1)/2.
```

**Why halve center?** Profile is specified as [center, +1, +2, ...] and [center, -1, -2, ...].
Center point appears twice, so halve to avoid double-counting.

---

## 5. Convolution Implementation

### Direct Convolution (Broaden)

**Main loop** (lines 183-192 for NMU=1):
```fortran
DO 157 IWL=1,NWL
  READ(21)QMU(1)  ! Read input spectrum point
  Q=QMU(1)

  ! Convolve with blue wing
  IWL1001=IWL+20001
  DO 153 I=1,NPROF
    H(IWL1001-I)=H(IWL1001-I)+BLUE(I)*Q
153 CONTINUE

  ! Convolve with red wing
  IWL999=IWL+19999
  DO 154 I=1,NPROF
    H(IWL999+I)=H(IWL999+I)+RED(I)*Q
154 CONTINUE
157 CONTINUE
```

**Algorithm**: Scatter each input point across output buffer
- Input point at IWL contributes to output points IWL-NPROF to IWL+NPROF
- Weighted by profile function (BLUE/RED)

**Offset by 20000**: Buffer padding to handle profile wings (see Section 6)

**Computational cost**: O(NWL × NPROF)
- NWL ≈ 10^5 (spectrum points)
- NPROF ≈ 10-1000 (profile width)
- Total: ~10^6 to 10^8 operations (seconds on modern CPU)

### Chunked Convolution (Rotate)

**Rotate uses chunked processing** (lines 111-172):
```fortran
DO 40 IWL=npiece+1,NWL+npiece,npiece  ! Process in chunks of 2000
  MAX=MIN0(npiece2,NWL+npiece2-IWL+1)

  ! Read chunk and convolve
  DO 30 J=npiece+1,MAX
    [... convolution ...]
30 CONTINUE

  ! Write output chunk
  DO 33 J=1,npiece
    QH=-(H(J+NAV100)+H(J+NAVNAV))*ENDWT
    DO 330 K=NAV100,NAVNAV
330   QH=QH+H(J+K)
    WRITE(9)QH/FLOAT(NAVWT)
33 CONTINUE

  ! Shift buffer (keep overlap region)
  DO 35 J=1,npiece2
35 HROT(J)=HROT(J+npiece)
40 CONTINUE
```

**Why chunked?**
- **Memory**: Full spectrum + padding might not fit in RAM (especially 1980s)
- **Parameter**: `npiece=2000` points per chunk
- **Overlap**: Keep `npiece` points from previous chunk for convolution overlap

**Modern equivalent**: Overlap-add FFT convolution

---

## 6. Memory Management

### Buffer Padding (Broaden)

```fortran
NH=(NWL+19999+19999)*NMU
```

**Total buffer**: NWL + 39998 points
- Original spectrum: NWL points
- Blue padding: 19999 points
- Red padding: 19999 points

**Why 20000?** Maximum NPROF for broaden (arbitrary limit, could be larger)

**Memory** (NWL=100000, NMU=1):
- NH = 100000 + 40000 = 140000 points
- × 4 bytes (REAL*4) = 560 KB
- **Tiny by modern standards!**

But declared as:
```fortran
DIMENSION H(4100000)
```

**4.1 million points** × 4 bytes = **16 MB** (to handle multiple angles NMU=17 and large spectra)

### Buffer Management (Rotate)

```fortran
parameter (npiece=2000,npiece2=npiece*2,npiece3=npiece*3)
COMMON /HROT/H(500),HROT(npiece3)
```

**HROT**: 6000 points (3 × 2000)
- Current chunk: 2000 points
- Overlap from previous: 2000 points
- Padding: 2000 points

**H**: 500 points for averaging window (limb darkening integration)

**Total**: ~30 KB (negligible)

---

## 7. Performance Analysis

### Computational Complexity

**Broaden**:
- Algorithm: Direct convolution O(NWL × NPROF)
- Typical: 100000 points × 100 profile width = 10^7 operations
- Runtime: ~1 second (modern CPU)

**Rotate**:
- Algorithm: Similar, but with limb-darkening integration
- WTROT preprocessing: O(NRADIUS × NV) ≈ 50 × 100 = 5000 operations (negligible)
- Convolution: O(NWL × NWT) where NWT ≈ NV × 100 ≈ 10000
- Runtime: ~10 seconds (modern CPU)

### FFT Optimization

**Fast convolution**: Use FFT (O(N log N) instead of O(N × M))

**Example** (NWL=100000, NPROF=100):
- Direct: 100000 × 100 = 10^7 operations
- FFT: 3 × 100000 × log₂(100000) ≈ 5 × 10^6 operations
- **Speedup**: ~2× (not dramatic for small NPROF)

**BUT**: For wide profiles (NPROF > 1000), FFT is **10-100× faster**!

**Modern approaches**: Use overlap-add or overlap-save FFT convolution.

---

## 8. Migration Strategy

### Julia Implementation

```julia
using DSP

"""
Apply rotational broadening to spectrum
"""
function rotational_broadening(
    spectrum::Vector{Float64},
    wavelengths::Vector{Float64},
    vsini::Float64;            # km/s
    limb_darkening::Float64=0.6,
    nradius::Int=50
)
    # Compute rotation kernel
    kernel = rotation_kernel(wavelengths, vsini, limb_darkening, nradius)

    # Convolve using FFT (much faster than direct)
    return conv(spectrum, kernel)[length(kernel)÷2 : end-length(kernel)÷2]
end

"""
Compute rotation kernel with limb darkening
"""
function rotation_kernel(
    wavelengths::Vector{Float64},
    vsini::Float64,
    u::Float64,
    nradius::Int
)
    dλ = wavelengths[2] - wavelengths[1]  # Assumes uniform spacing
    λ_center = (wavelengths[1] + wavelengths[end]) / 2

    # Velocity per wavelength bin
    v_step = c * dλ / λ_center  # km/s

    # Kernel half-width in bins
    nv = ceil(Int, vsini / v_step)

    kernel = zeros(2*nv + 1)

    # Integrate over stellar disk
    for irad in 1:nradius
        r = irad / nradius  # Radial position (0 to 1)

        # Local velocity (equatorial: v = vsini at r=1)
        v_local = vsini * r

        # Limb darkening: I(μ) = 1 - u*(1-μ), where μ = √(1-r²)
        μ = sqrt(1 - r^2)
        intensity = 1 - u * (1 - μ)

        # Area element: 2πr dr (factor of 2π cancels in normalization)
        weight = intensity * r / nradius

        # Add contribution at ±v_local
        iv = round(Int, v_local / v_step)
        if iv <= nv
            kernel[nv+1-iv] += weight  # Blue side
            kernel[nv+1+iv] += weight  # Red side
        end
    end

    # Normalize
    kernel ./= sum(kernel)

    return kernel
end
```

**Advantages**:
- ✅ Clean, readable code
- ✅ Uses FFT for speed (via DSP.jl)
- ✅ Easy to extend (different limb-darkening laws)

### Instrumental Broadening

```julia
"""
Apply instrumental broadening
"""
function instrumental_broadening(
    spectrum::Vector{Float64},
    wavelengths::Vector{Float64},
    profile::Symbol,              # :gaussian, :sinc, :rectangular, :custom
    fwhm::Float64;                # km/s or resolution
    custom_kernel::Union{Vector{Float64}, Nothing}=nothing
)
    λ_center = (wavelengths[1] + wavelengths[end]) / 2
    dλ = wavelengths[2] - wavelengths[1]
    v_step = c * dλ / λ_center  # km/s per bin

    # Generate kernel
    if profile == :gaussian
        σ = fwhm / 2.3548  # Convert FWHM to σ
        nσ = 5  # Truncate at 5σ
        nprof = ceil(Int, nσ * σ / v_step)
        kernel = [exp(-(i*v_step / σ)^2) for i in -nprof:nprof]

    elseif profile == :sinc
        nprof = ceil(Int, 10 * fwhm / v_step)  # Extend to first few zeros
        kernel = [sinc_apodized(i*v_step / fwhm) for i in -nprof:nprof]

    elseif profile == :rectangular
        half_width = fwhm / 2
        nprof = ceil(Int, half_width / v_step)
        kernel = ones(2*nprof + 1)

    elseif profile == :custom
        kernel = custom_kernel
    end

    # Normalize
    kernel ./= sum(kernel)

    # Convolve using FFT
    return conv(spectrum, kernel)[length(kernel)÷2 : end-length(kernel)÷2+length(spectrum)]
end

function sinc_apodized(x::Float64)
    if x == 0
        return 1.0
    else
        sx = sin(π*x) / (π*x)
        return sx * exp(-0.06 * x^2)  # Apodization
    end
end
```

**Testing**: Compare against Fortran for standard profiles (Gaussian, sinc).

---

## 9. Testing Strategy

### Unit Tests

**Test 1: Gaussian Profile**
```julia
@testset "Gaussian Broadening" begin
    # Delta function input
    λ = 5000.0:0.01:5010.0
    spectrum = zeros(length(λ))
    spectrum[501] = 1.0  # Delta at λ=5005

    # Broaden with FWHM = 0.1 Å (20 km/s at 5000 Å)
    broadened = instrumental_broadening(spectrum, collect(λ), :gaussian, 20.0)

    # Should be Gaussian centered at 501
    @test argmax(broadened) == 501
    @test sum(broadened) ≈ 1.0 rtol=0.01  # Conserves flux

    # FWHM check
    half_max = maximum(broadened) / 2
    indices = findall(broadened .> half_max)
    fwhm_bins = length(indices)
    fwhm_measured = fwhm_bins * 0.01  # Å
    @test fwhm_measured ≈ 0.1 rtol=0.1  # 10% tolerance
end
```

**Test 2: Rotation Kernel**
```julia
@testset "Rotation Kernel" begin
    λ = 5000.0:0.01:5010.0
    vsini = 50.0  # km/s
    u = 0.6  # Solar limb darkening

    kernel = rotation_kernel(collect(λ), vsini, u, 50)

    # Should be symmetric
    @test kernel ≈ reverse(kernel) rtol=1e-6

    # Should be normalized
    @test sum(kernel) ≈ 1.0 rtol=1e-9

    # Width should match vsini
    # (Hard to test precisely - depends on definition of "width")
end
```

### Integration Tests

**Test 3: Compare with Fortran**
```julia
@testset "Fortran Compatibility" begin
    # Run Fortran broaden
    run(`./broaden < gaussian_test.input`)

    # Read Fortran output
    spec_fortran = read_spectrum_binary("fort.22")

    # Run Julia broaden
    spec_input = read_spectrum_binary("fort.21")
    spec_julia = instrumental_broadening(spec_input.flux, spec_input.wavelength,
                                         :gaussian, 3.5)  # 3.5 km/s FWHM

    # Compare
    @test spec_julia ≈ spec_fortran rtol=0.001  # 0.1% tolerance
end
```

**Test 4: Flux Conservation**
```julia
@testset "Flux Conservation" begin
    # Random spectrum
    λ = 5000.0:0.01:5100.0
    spectrum = rand(length(λ)) .+ 1.0  # Positive flux

    # Broaden with various profiles
    for profile in [:gaussian, :sinc, :rectangular]
        broadened = instrumental_broadening(spectrum, collect(λ), profile, 10.0)

        # Total flux should be conserved
        @test sum(broadened) ≈ sum(spectrum) rtol=0.01
    end
end
```

---

## 10. Key Takeaways

### Architecture

1. **Post-processing only**: Rotate and broaden are final steps, no physics
2. **Modular pipeline**: Can skip, repeat, or chain different broadenings
3. **Binary I/O**: Read/write same format as spectrv (fort.X UNFORMATTED)

### Algorithms

4. **Direct convolution**: O(N×M) implementation (simple but slow)
5. **Limb darkening**: Integrated over disk for rotation (50-100 radial zones)
6. **Multiple profiles**: Gaussian, sinc, rectangular, macroturbulence, custom
7. **Asymmetric profiles**: Can have different red/blue wings (rare but useful)

### Performance

8. **Fast enough**: ~1-10 seconds for typical spectra (100K points)
9. **FFT would help**: 10-100× speedup for wide profiles (macroturbulence, slow rotation)
10. **Memory-efficient**: Chunked processing in rotate (legacy, not needed now)

### Migration

11. **Easy to port**: Standard DSP convolution, well-understood algorithms
12. **Julia advantage**: DSP.jl provides optimized conv() using FFT
13. **Testing critical**: Gaussian formula has suspicious constant (needs validation)
14. **Format compatibility**: Must match Fortran binary I/O for validation

---

*End of Deep Dive 11*

**Next**: Deep Dive 12 will consolidate documentation on line reader formats (rgfalllinesnew, rmolecasc, etc.) and create the final summary document.
