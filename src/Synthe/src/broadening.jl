"""
Instrumental broadening (broaden equivalent)

**Task 8**: Implement Gaussian broadening

**Purpose**: Apply instrumental profile to synthesized spectrum

**Algorithm** (from broaden.for):
1. Define Gaussian kernel (instrumental resolution)
2. Convolve spectrum with kernel
3. Return broadened spectrum

**Implementation options**:
- Option A: FFT-based convolution (fast, FFTW.jl)
- Option B: Direct sum (simple, slower)

**Status**: NOT IMPLEMENTED (Task 8)
"""

"""
    gaussian_broaden(spectrum::Spectrum, fwhm::Float64)

Apply Gaussian instrumental broadening

**Parameters**:
- `spectrum`: Input spectrum
- `fwhm`: Full width at half maximum (Å)

**Returns**: `Spectrum` (broadened)

**Algorithm**:
1. Create Gaussian kernel: `K(Δλ) = exp(-4 ln(2) × (Δλ/fwhm)²)`
2. Convolve: `flux_broad = flux ⊗ K`
3. Return broadened spectrum

**Status**: NOT IMPLEMENTED (Task 8)
"""
function gaussian_broaden(spectrum::Spectrum, fwhm::Float64)
    error("Task 8 not yet implemented: gaussian_broaden")
end
