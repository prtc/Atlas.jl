"""
DEMO: Molecular Line Reader (ASCII format)

This demonstrates the Task 2.2 Pure Julia molecular line reader:
- Parse molecular lines (CH, CN, CO, MgH)
- ISO code to NELION mapping
- Isotopic abundance factors
- Read and filter molecular line files

Usage:
    julia examples/demo_molecular_reader.jl
"""

# Load dependencies
include("../src/Synthe/src/structs.jl")
include("../src/Synthe/src/line_readers_molecular.jl")

println("="^70)
println("DEMO: Molecular Line Reader (ASCII format)")
println("="^70)

# =============================================================================
# Example 1: Parse a single MgH line
# =============================================================================

println("\nExample 1: Parse Single MgH Line")
println("-"^70)

# Real MgH line from data file
line_str = "  500.0010 -1.505  9.5  4666.690  8.5  24661.070 112X03F2   B03F2   24"

spectral_line = parse_molecular_line(line_str, "MgH")

println("Parsed MgH line:")
println("  Wavelength:  $(spectral_line.wavelength) Å")
println("  loggf:       $(spectral_line.loggf)")
println("  Element:     $(spectral_line.element_ion) (NELION code)")
println("  E_lower:     $(spectral_line.e_lower) cm⁻¹")
println("  E_upper:     $(spectral_line.e_upper) cm⁻¹")
println("  J_lower:     $(spectral_line.j_lower)")
println("  J_upper:     $(spectral_line.j_upper)")

# =============================================================================
# Example 2: ISO code to NELION mapping
# =============================================================================

println("\nExample 2: ISO → NELION Mapping")
println("-"^70)

println("\nCH (carbon monoxide hydride):")
for iso in [101, 102, 104]
    nelion = iso_to_nelion(iso, "CH")
    println("  ISO $iso → NELION $nelion")
end

println("\nCN (cyanogen):")
for iso in [201, 202, 301]
    nelion = iso_to_nelion(iso, "CN")
    println("  ISO $iso → NELION $nelion")
end

println("\nCO (carbon monoxide):")
for iso in [101, 102, 201, 301]
    nelion = iso_to_nelion(iso, "CO")
    println("  ISO $iso → NELION $nelion")
end

println("\nMgH (magnesium hydride):")
for iso in [24, 25, 26]
    nelion = iso_to_nelion(iso, "MgH")
    println("  ISO $iso (²⁴⁺Mg) → NELION $nelion")
end

# =============================================================================
# Example 3: Isotopic abundance factors
# =============================================================================

println("\nExample 3: Isotopic Abundance Factors")
println("-"^70)

println("\nCH abundances:")
for iso in [101, 102, 104]
    abundance = isotopic_abundance_factor(iso, "CH")
    pct = abundance * 100
    println("  ISO $iso: $(round(pct, digits=2))%")
end

println("\nMgH abundances:")
for iso in [24, 25, 26]
    abundance = isotopic_abundance_factor(iso, "MgH")
    pct = abundance * 100
    println("  ²$(iso)Mg¹H: $(round(pct, digits=2))%")
end

# =============================================================================
# Example 4: Read MgH lines from file
# =============================================================================

println("\nExample 4: Read MgH Lines from File")
println("-"^70)

mgh_file = "test/data/molecular/mgh_sample.asc"

# Read lines in 500.0 - 500.1 Å range
λ_start = 500.0
λ_end = 500.1
margin = 0.0

lines = read_molecular_lines(mgh_file, "MgH", λ_start, λ_end, margin)

println("Read $λ_start - $λ_end Å from $mgh_file")
println("Found $(length(lines)) MgH lines in range")

if length(lines) > 0
    println("\nFirst 5 lines:")
    for i in 1:min(5, length(lines))
        line = lines[i]
        iso = round(Int, line.element_ion - 100)
        println("  $(i). λ=$(line.wavelength) Å, loggf=$(line.loggf), ²$(iso)Mg¹H")
    end
end

# =============================================================================
# Example 5: Isotope distribution in data
# =============================================================================

println("\nExample 5: Isotope Distribution in Data")
println("-"^70)

# Read wider range
lines = read_molecular_lines(mgh_file, "MgH", 500.0, 500.5, 0.0)

# Count by isotope
isotope_counts = Dict{Int, Int}()
for line in lines
    nelion = round(Int, line.element_ion)
    iso = nelion - 100  # NELION 124 → ISO 24
    isotope_counts[iso] = get(isotope_counts, iso, 0) + 1
end

println("MgH lines by isotope (500.0 - 500.5 Å):")
for iso in sort(collect(keys(isotope_counts)))
    count = isotope_counts[iso]
    println("  ²$(iso)Mg¹H: $count lines")
end

# =============================================================================
# Example 6: Compare CH, CN, CO
# =============================================================================

println("\nExample 6: Molecular Abundance Comparison")
println("-"^70)

println("\nDominant isotope abundances:")
molecules = ["CH", "CN", "CO", "MgH"]
dominant_isos = [101, 201, 101, 24]  # Main isotopes

for (molecule, iso) in zip(molecules, dominant_isos)
    abundance = isotopic_abundance_factor(iso, molecule)
    pct = abundance * 100
    println("  $molecule: $(round(pct, digits=2))%")
end

# =============================================================================
# Summary
# =============================================================================

println("\n" * "="^70)
println("SUMMARY")
println("="^70)
println("✓ Parsed molecular lines (space-delimited ASCII)")
println("✓ Mapped ISO codes to NELION element codes")
println("✓ Computed isotopic abundance factors")
println("✓ Read and filtered MgH lines from real data file")
println("\nTask 2.2: Molecular Line Reader - COMPLETE! ✓")
println("="^70)
