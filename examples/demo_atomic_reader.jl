"""
DEMO: Atomic Line Reader (gfall format)

This demonstrates the Task 2.1 Pure Julia atomic line reader:
- Parse single gfall lines
- Read and filter gfall files by wavelength
- Compute wavelength grid indices

Usage:
    julia examples/demo_atomic_reader.jl
"""

# Load dependencies
include("../src/Synthe/src/structs.jl")
include("../src/Synthe/src/line_readers.jl")

println("="^70)
println("DEMO: Atomic Line Reader (gfall format)")
println("="^70)

# =============================================================================
# Example 1: Parse a single gfall line
# =============================================================================

println("\nExample 1: Parse Single Line")
println("-"^70)

# Real Cu I line from gfall
line_str = "   500.0003 -6.421 29.00   77905.500  2.5 s(3D)5d 4D   57911.090  3.5 5f 2F       7.86 -3.96 -7.13K12  0 0  0 0.000  0 0.000    0    0      0    1242 1143     0 0.000"

spectral_line = parse_gfall_line(line_str)

println("Parsed line:")
println("  Wavelength:  $(spectral_line.wavelength) Å")
println("  loggf:       $(spectral_line.loggf)")
println("  Element:     $(spectral_line.element_ion) (Cu I)")
println("  E_lower:     $(spectral_line.e_lower) cm⁻¹")
println("  E_upper:     $(spectral_line.e_upper) cm⁻¹")
println("  J_lower:     $(spectral_line.j_lower)")
println("  J_upper:     $(spectral_line.j_upper)")
println("  γ_rad:       $(spectral_line.gamma_rad) Hz")
println("  γ_stark:     $(spectral_line.gamma_stark) Hz")
println("  γ_vdW:       $(spectral_line.gamma_vdw) Hz")

# =============================================================================
# Example 2: Compute grid index (nbuff)
# =============================================================================

println("\nExample 2: Wavelength Grid Index")
println("-"^70)

λ_min = 5000.0
λ_max = 5100.0
n_points = 10000

# Compute nbuff for different wavelengths
wavelengths = [5000.0, 5025.0, 5050.0, 5075.0, 5100.0]

println("Logarithmic grid: $λ_min - $λ_max Å ($n_points points)")
println("")
for λ in wavelengths
    nbuff = compute_nbuff(λ, λ_min, λ_max, n_points)
    println("  λ = $λ Å  →  nbuff = $nbuff")
end

# =============================================================================
# Example 3: Read lines from gfall file
# =============================================================================

println("\nExample 3: Read Lines from File")
println("-"^70)

gfall_file = "test/data/atomic/gf0600_sample.dat"

# Read lines in 500.0 - 500.1 Å range
λ_start = 500.0
λ_end = 500.1
margin = 0.0

lines = read_gfall_lines(gfall_file, λ_start, λ_end, margin)

println("Read $λ_start - $λ_end Å from $gfall_file")
println("Found $(length(lines)) lines in range")

if length(lines) > 0
    println("\nFirst 5 lines:")
    for i in 1:min(5, length(lines))
        line = lines[i]
        element_str = line.element_ion == 26.00 ? "Fe I" :
                      line.element_ion == 26.01 ? "Fe II" :
                      "El $(line.element_ion)"
        println("  $(i). λ=$(line.wavelength) Å, loggf=$(line.loggf), $element_str")
    end
end

# =============================================================================
# Example 4: Read Fe I lines around 5000 Å
# =============================================================================

println("\nExample 4: Fe I Lines Around 5000 Å")
println("-"^70)

# Read solar region with margin for line wings
λ_start = 4999.0
λ_end = 5001.0
margin = 10.0  # Include lines with wings extending into range

lines = read_gfall_lines(gfall_file, λ_start, λ_end, margin)

println("Wavelength range: $λ_start - $λ_end Å (± $margin Å margin)")
println("Total lines: $(length(lines))")

# Count by element
element_counts = Dict{Float64, Int}()
for line in lines
    element_counts[line.element_ion] = get(element_counts, line.element_ion, 0) + 1
end

println("\nLines by element:")
sorted_elements = sort(collect(element_counts), by=x->x[2], rev=true)
for (element, count) in sorted_elements[1:min(10, length(sorted_elements))]
    element_int = round(Int, element * 100)
    z = div(element_int, 100)
    ion = mod(element_int, 100)
    println("  Element $(z).$(lpad(ion, 2, '0')): $count lines")
end

# =============================================================================
# Summary
# =============================================================================

println("\n" * "="^70)
println("SUMMARY")
println("="^70)
println("✓ Successfully parsed gfall lines")
println("✓ Computed wavelength grid indices (nbuff)")
println("✓ Read and filtered lines from real gfall file")
println("\nTask 2.1: Atomic Line Reader - COMPLETE! ✓")
println("="^70)
