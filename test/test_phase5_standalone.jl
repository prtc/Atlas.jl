#!/usr/bin/env julia
"""
Standalone Phase 5 test runner
Tests all implemented modules without requiring Pkg.instantiate()
"""

# Load all modules
println("Loading Synthe modules...")
include("src/Synthe/src/structs.jl")
include("src/Synthe/src/synbeg.jl")
include("src/Synthe/src/line_readers.jl")
include("src/Synthe/src/line_readers_molecular.jl")

println("✓ All modules loaded\n")

# Test counter
tests_passed = 0
tests_failed = 0

function test(name::String, condition::Bool)
    global tests_passed, tests_failed
    if condition
        println("  ✓ $name")
        tests_passed += 1
    else
        println("  ✗ $name FAILED")
        tests_failed += 1
    end
end

# =============================================================================
# Test 1: synbeg module
# =============================================================================
println("=" ^70)
println("TEST 1: synbeg - Parameter Initialization")
println("=" ^70)

config = SyntheConfig(5000.0, 5100.0, 50000.0, 2.0, true, false, 0.001)
params = synbeg_initialize(config)

test("synbeg_initialize creates Fort93Params", params isa Fort93Params)
test("wave_start correct", params.wave_start ≈ 5000.0)
test("wave_end correct", params.wave_end ≈ 5100.0)
test("resolving_power correct", params.resolving_power ≈ 50000.0)
test("n_points > 0", params.n_points > 0)
println("  → Generated $(params.n_points) wavelength points")

# Test wavelength grid
wavelengths = wavelength_grid(config)
test("wavelength_grid returns array", wavelengths isa Vector{Float64})
test("Grid length matches params", length(wavelengths) == params.n_points)
test("First wavelength in range", wavelengths[1] >= config.wave_start)
# Note: Logarithmic grid naturally extends slightly beyond wave_end
test("Last wavelength close to wave_end", wavelengths[end] <= config.wave_end * 1.001)

# Test logarithmic spacing
ratios = wavelengths[2:end] ./ wavelengths[1:end-1]
expected_ratio = 1.0 + 1.0/config.resolving_power
all_close = all(r -> isapprox(r, expected_ratio, rtol=1e-8), ratios)
test("Logarithmic spacing correct", all_close)

# Test wavelength_to_nbuff
nbuff = wavelength_to_nbuff(5050.0, params)
test("wavelength_to_nbuff returns integer", nbuff isa Int)
test("NBUFF in valid range", 1 <= nbuff <= params.n_points)
println()

# =============================================================================
# Test 2: gfall atomic line reader
# =============================================================================
println("=" ^70)
println("TEST 2: rgfalllinesnew - Atomic Line Reader")
println("=" ^70)

# Test parse_gfall_line
gfall_line = " 5000.1720 -2.570 26.0  18500.123  3.5  57002.456  2.5 'a 5D      ' 'z 5P*     '"
line = parse_gfall_line(gfall_line)

test("parse_gfall_line returns SpectralLine", line !== nothing && line isa SpectralLine)
if line !== nothing
    test("Wavelength parsed correctly", isapprox(line.wavelength, 5000.172, rtol=1e-6))
    test("log(gf) parsed correctly", isapprox(line.loggf, -2.57, rtol=1e-6))
    test("Element code parsed correctly", isapprox(line.element_ion, 26.0, rtol=1e-6))
    test("E_lower parsed correctly", isapprox(line.e_lower, 18500.123, rtol=1e-6))
    test("J_lower parsed correctly", isapprox(line.j_lower, 3.5, rtol=1e-6))
    test("E_upper parsed correctly", isapprox(line.e_upper, 57002.456, rtol=1e-6))
    test("J_upper parsed correctly", isapprox(line.j_upper, 2.5, rtol=1e-6))
    test("Damping parameters set", line.gamma_rad > 0)
end

# Test read_gfalllines with temp file
temp_file = tempname() * ".dat"
sample_data = """
 5000.1720 -2.570 26.0  18500.123  3.5  57002.456  2.5 'a 5D      ' 'z 5P*     '
 5001.8620  0.050 26.0  19350.850  2.5  39373.020  3.5 'a 3F      ' 'z 3G*     '
 5050.3450 -1.360 26.0  18378.185  4.5  38338.662  4.5 'a 5D      ' 'z 5D*     '
 4999.5000 -2.800 26.0  20020.400  1.5  40041.500  2.5 'a 3P      ' 'z 3D*     '
"""

write(temp_file, sample_data)
try
    lines = read_gfalllines(temp_file, 5000.0, 5100.0)
    test("read_gfalllines returns array", lines isa Vector{SpectralLine})
    test("Lines filtered by wavelength", length(lines) > 0)
    test("All lines in range (with margin)", all(l -> 4990.0 <= l.wavelength <= 5110.0, lines))
    println("  → Read $(length(lines)) lines from test file")
finally
    rm(temp_file, force=true)
end
println()

# =============================================================================
# Test 3: rmolecasc molecular line reader
# =============================================================================
println("=" ^70)
println("TEST 3: rmolecasc - Molecular Line Reader")
println("=" ^70)

# Test ISO code mapping
test("iso_to_nelion(10) = 246 (CH)", iso_to_nelion(10) == 246)
test("iso_to_nelion(17) = 276 (CO)", iso_to_nelion(17) == 276)
test("iso_to_nelion(12) = 270 (CN)", iso_to_nelion(12) == 270)

# Test isotopic abundance
abund = get_isotopic_abundance(10)  # ¹²C¹H
test("Isotopic abundance has X1 field", hasfield(typeof(abund), :X1))
test("CH X1 correction is -0.005", abund.X1 ≈ -0.005)

# Test parse_molecular_line
mol_line_str = "5050.5 -1.5 1234.5 25678.9 0"  # Need 5 fields minimum
mol_line = parse_molecular_line(mol_line_str, 10)  # CH, ISO=10

test("parse_molecular_line returns SpectralLine", mol_line !== nothing && mol_line isa SpectralLine)
if mol_line !== nothing
    test("Molecular wavelength correct", mol_line.wavelength ≈ 5050.5)
    test("Molecular log(gf) corrected", isapprox(mol_line.loggf, -1.505, rtol=1e-6))  # -1.5 + (-0.005)
    test("NELION code correct (246 for CH)", mol_line.element_ion ≈ 246.0)
end

# Test read_molecular_lines
mol_temp_file = tempname() * ".asc"
mol_sample_data = """
5000.5 -1.0 1000.0 26000.0 0
5050.0 -2.0 1500.0 28500.0 0
5075.5 -0.5 2000.0 30000.0 0
"""

write(mol_temp_file, mol_sample_data)
try
    mol_lines = read_molecular_lines(mol_temp_file, "CH", 5000.0, 5100.0)
    test("read_molecular_lines returns array", mol_lines isa Vector{SpectralLine})
    test("Molecular lines filtered", length(mol_lines) > 0)
    test("All molecular lines in range", all(l -> 4990.0 <= l.wavelength <= 5110.0, mol_lines))
    println("  → Read $(length(mol_lines)) molecular lines")
finally
    rm(mol_temp_file, force=true)
end

# Test combine_line_lists
atomic_test = [SpectralLine(0, 5050.0, -1.0, 26.0, 1000.0, 25000.0, 1.0, 2.0, 1e6, 1e-5, 1e-7, 0.4)]
molecular_test = [SpectralLine(0, 5025.0, -2.0, 246.0, 2000.0, 30000.0, 0.0, 0.0, 1e6, 1e-6, 1e-8, 0.4)]
combined = combine_line_lists(atomic_test, molecular_test)

test("combine_line_lists returns array", combined isa Vector{SpectralLine})
test("Combined list has correct length", length(combined) == 2)
test("Lines sorted by wavelength", combined[1].wavelength < combined[2].wavelength)
println()

# =============================================================================
# Summary
# =============================================================================
println("=" ^70)
println("SUMMARY")
println("=" ^70)
println("Tests passed: $tests_passed")
println("Tests failed: $tests_failed")
println("Success rate: $(round(100 * tests_passed / (tests_passed + tests_failed), digits=1))%")

if tests_failed == 0
    println("\n🎉 ALL TESTS PASSED!")
    exit(0)
else
    println("\n⚠️  Some tests failed")
    exit(1)
end
