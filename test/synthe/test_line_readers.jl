"""
Test Suite: Atomic Line Reader (gfall format)

Tests the Pure Julia atomic line reader for SYNTHE gfall format.
Uses Test-Driven Development (TDD) methodology.

Run with: julia test/synthe/test_line_readers.jl
"""

using Test

# Load the SpectralLine struct
include("../../src/Synthe/src/structs.jl")

# Load the line reader module (will create this)
include("../../src/Synthe/src/line_readers.jl")

@testset "Atomic Line Reader (gfall format)" begin

    # =========================================================================
    # Test 1: Parse wavelength from single gfall line
    # =========================================================================

    @testset "parse_gfall_line: wavelength field" begin
        # Real gfall line from test data
        line = "   500.0003 -6.421 29.00   77905.500  2.5 s(3D)5d 4D   57911.090  3.5 5f 2F       7.86 -3.96 -7.13K12  0 0  0 0.000  0 0.000    0    0      0    1242 1143     0 0.000"

        result = parse_gfall_line(line)

        # Should return a SpectralLine struct
        @test result isa SpectralLine

        # Wavelength should be parsed correctly
        @test result.wavelength ≈ 500.0003 atol=1e-4
    end

    # =========================================================================
    # Test 2: Parse all fields from gfall line
    # =========================================================================

    @testset "parse_gfall_line: all fields" begin
        # Cu I line (element 29.00 = copper neutral)
        line = "   500.0003 -6.421 29.00   77905.500  2.5 s(3D)5d 4D   57911.090  3.5 5f 2F       7.86 -3.96 -7.13K12  0 0  0 0.000  0 0.000    0    0      0    1242 1143     0 0.000"

        result = parse_gfall_line(line)

        # All basic fields
        @test result.wavelength ≈ 500.0003 atol=1e-4
        @test result.loggf ≈ -6.421 atol=1e-3
        @test result.element_ion ≈ 29.00 atol=1e-2
        @test result.e_lower ≈ 77905.500 atol=1e-3
        @test result.e_upper ≈ 57911.090 atol=1e-3
        @test result.j_lower ≈ 2.5 atol=1e-1
        @test result.j_upper ≈ 3.5 atol=1e-1

        # Damping parameters (converted from log)
        @test result.gamma_rad ≈ 10^7.86 rtol=1e-2
        @test result.gamma_stark ≈ 10^(-3.96) rtol=1e-2
        @test result.gamma_vdw ≈ 10^(-7.13) rtol=1e-2
        @test result.alpha ≈ 0.4 atol=1e-2
    end

    # =========================================================================
    # Test 3: Parse Fe I line (most common element in solar spectrum)
    # =========================================================================

    @testset "parse_gfall_line: Fe I line" begin
        # Real Fe I line from gfall
        line = "  5000.172 -2.570 26.00   42113.890  3.0 (5D)4d e6G   62104.100  4.0 (5D)4p y5F    8.05 -5.43 -7.30K11  0 0  0 0.000  0 0.000    0    0      0     123  456     0 0.000"

        result = parse_gfall_line(line)

        # Fe I should have element code 26.00
        @test result.element_ion ≈ 26.00 atol=1e-2
        @test result.wavelength ≈ 5000.172 atol=1e-3
        @test result.loggf ≈ -2.570 atol=1e-3
        @test result.e_lower ≈ 42113.890 atol=1e-3
        @test result.e_upper ≈ 62104.100 atol=1e-3
        @test result.j_lower ≈ 3.0 atol=1e-1
        @test result.j_upper ≈ 4.0 atol=1e-1
    end

    # =========================================================================
    # Test 4: Parse Fe II line (ionized iron)
    # =========================================================================

    @testset "parse_gfall_line: Fe II line" begin
        # Fe II line (element code 26.01)
        line = "  5001.234 -3.200 26.01   35000.000  4.5 test label    55000.000  3.5 test label    8.10 -5.00 -7.20K11  0 0  0 0.000  0 0.000    0    0      0     100  200     0 0.000"

        result = parse_gfall_line(line)

        # Fe II should have element code 26.01
        @test result.element_ion ≈ 26.01 atol=1e-2
        @test result.wavelength ≈ 5001.234 atol=1e-3
    end

    # =========================================================================
    # Test 5: Edge cases - short lines without all damping parameters
    # =========================================================================

    @testset "parse_gfall_line: missing damping parameters" begin
        # Shorter line that might not have all damping data
        line = "  5002.000 -1.500 12.00   30000.000  1.0 label here    50000.000  2.0 label here"

        result = parse_gfall_line(line)

        # Should still parse basic fields
        @test result.wavelength ≈ 5002.000 atol=1e-3
        @test result.loggf ≈ -1.500 atol=1e-3
        @test result.element_ion ≈ 12.00 atol=1e-2

        # Default damping values (10^0.0 = 1.0)
        @test result.gamma_rad ≈ 1.0 rtol=1e-2
        @test result.gamma_stark ≈ 1.0 rtol=1e-2
        @test result.gamma_vdw ≈ 1.0 rtol=1e-2
    end

    # =========================================================================
    # Test 6: compute_nbuff - Logarithmic grid indexing
    # =========================================================================

    @testset "compute_nbuff: wavelength grid indexing" begin
        # Logarithmic wavelength grid
        λ_min = 5000.0
        λ_max = 5100.0
        n_points = 10000

        # Test wavelength at start
        nbuff_start = compute_nbuff(5000.0, λ_min, λ_max, n_points)
        @test nbuff_start == 1

        # Test wavelength at end
        nbuff_end = compute_nbuff(5100.0, λ_min, λ_max, n_points)
        @test nbuff_end == n_points

        # Test wavelength in middle (should be logarithmic spacing)
        λ_mid = sqrt(λ_min * λ_max)  # Geometric mean for log grid
        nbuff_mid = compute_nbuff(λ_mid, λ_min, λ_max, n_points)
        @test nbuff_mid ≈ n_points / 2 atol=100

        # Test wavelength outside range (should clamp or error)
        nbuff_low = compute_nbuff(4900.0, λ_min, λ_max, n_points)
        @test nbuff_low >= 1  # Should clamp to valid range
    end

    # =========================================================================
    # Test 7: read_gfall_lines - Read and filter lines from file
    # =========================================================================

    @testset "read_gfall_lines: filter by wavelength range" begin
        # Test data file path
        gfall_file = "../../test/data/atomic/gf0600_sample.dat"

        # Read lines in specific wavelength range
        λ_start = 5000.0
        λ_end = 5001.0
        margin = 10.0  # ±10 Å safety margin

        lines = read_gfall_lines(gfall_file, λ_start, λ_end, margin)

        # Should return array of SpectralLine
        @test lines isa Vector{SpectralLine}
        @test length(lines) > 0

        # All lines should be within the extended range
        for line in lines
            @test line.wavelength >= λ_start - margin
            @test line.wavelength <= λ_end + margin
        end
    end

    @testset "read_gfall_lines: no margin filtering" begin
        gfall_file = "../../test/data/atomic/gf0600_sample.dat"

        # Read with zero margin (exact range)
        λ_start = 5000.0
        λ_end = 5001.0
        margin = 0.0

        lines = read_gfall_lines(gfall_file, λ_start, λ_end, margin)

        # All lines should be within exact range
        for line in lines
            @test line.wavelength >= λ_start
            @test line.wavelength <= λ_end
        end
    end

    @testset "read_gfall_lines: empty range" begin
        gfall_file = "../../test/data/atomic/gf0600_sample.dat"

        # Read range that should have no lines (way outside data range)
        λ_start = 10000.0
        λ_end = 10001.0

        lines = read_gfall_lines(gfall_file, λ_start, λ_end, 0.0)

        # Should return empty array or very few lines
        @test length(lines) >= 0  # Should not error
    end

    # =========================================================================
    # Test 8: Integration test with real gfall data
    # =========================================================================

    @testset "Integration: read and parse real gfall file" begin
        gfall_file = "../../test/data/atomic/gf0600_sample.dat"

        # Read a small wavelength range around 500 nm
        lines = read_gfall_lines(gfall_file, 500.0, 500.1, 0.0)

        @test length(lines) > 0

        # Check first line is properly parsed
        first_line = lines[1]
        @test first_line.wavelength >= 500.0
        @test first_line.wavelength <= 500.1
        @test !isnan(first_line.loggf)
        @test !isnan(first_line.element_ion)
        @test first_line.element_ion > 0.0  # Valid element code

        # Check nbuff is computed
        @test first_line.nbuff > 0
    end

end
