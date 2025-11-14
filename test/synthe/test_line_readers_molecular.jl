"""
Test Suite: Molecular Line Reader (ASCII format)

Tests the Pure Julia molecular line reader for CH, CN, CO, MgH, etc.
Uses Test-Driven Development (TDD) methodology.

Run with: julia test/synthe/test_line_readers_molecular.jl
"""

using Test

# Load the SpectralLine struct
include("../../src/Synthe/src/structs.jl")

# Load the molecular line reader module (will create this)
include("../../src/Synthe/src/line_readers_molecular.jl")

@testset "Molecular Line Reader (ASCII format)" begin

    # =========================================================================
    # Test 1: Parse molecular line basic fields
    # =========================================================================

    @testset "parse_molecular_line: basic fields" begin
        # Real MgH line from test data
        line = "  500.0010 -1.505  9.5  4666.690  8.5  24661.070 112X03F2   B03F2   24"

        result = parse_molecular_line(line, "MgH")

        # Should return a SpectralLine struct
        @test result isa SpectralLine

        # Basic fields
        @test result.wavelength ≈ 500.0010 atol=1e-4
        @test result.loggf ≈ -1.505 atol=1e-3
        @test result.j_lower ≈ 9.5 atol=1e-1
        @test result.e_lower ≈ 4666.690 atol=1e-3
        @test result.j_upper ≈ 8.5 atol=1e-1
        @test result.e_upper ≈ 24661.070 atol=1e-3
    end

    # =========================================================================
    # Test 2: ISO code to NELION mapping
    # =========================================================================

    @testset "iso_to_nelion: CH molecule" begin
        # CH isotopes map to NELION 246, 346
        @test iso_to_nelion(101, "CH") == 246  # ¹²C¹H
        @test iso_to_nelion(102, "CH") == 346  # ¹³C¹H
        @test iso_to_nelion(104, "CH") == 446  # ¹²C²H (deuterium)
    end

    @testset "iso_to_nelion: CN molecule" begin
        # CN isotopes map to NELION 270, 370
        @test iso_to_nelion(201, "CN") == 270  # ¹²C¹⁴N
        @test iso_to_nelion(202, "CN") == 370  # ¹³C¹⁴N
        @test iso_to_nelion(301, "CN") == 470  # ¹²C¹⁵N
    end

    @testset "iso_to_nelion: CO molecule" begin
        # CO isotopes map to NELION 276, 376
        @test iso_to_nelion(101, "CO") == 276  # ¹²C¹⁶O
        @test iso_to_nelion(102, "CO") == 376  # ¹³C¹⁶O
        @test iso_to_nelion(201, "CO") == 476  # ¹²C¹⁷O
        @test iso_to_nelion(301, "CO") == 576  # ¹²C¹⁸O
    end

    @testset "iso_to_nelion: MgH molecule" begin
        # MgH isotopes (24Mg, 25Mg, 26Mg)
        @test iso_to_nelion(24, "MgH") == 124  # ²⁴Mg¹H
        @test iso_to_nelion(25, "MgH") == 125  # ²⁵Mg¹H
        @test iso_to_nelion(26, "MgH") == 126  # ²⁶Mg¹H
    end

    # =========================================================================
    # Test 3: Isotopic abundance factors
    # =========================================================================

    @testset "isotopic_abundance_factor: CH molecule" begin
        # ¹²C¹H is dominant (~98.9% C, ~99.98% H)
        @test isotopic_abundance_factor(101, "CH") ≈ 1.0 rtol=0.05
        
        # ¹³C¹H is rare (~1.1% C)
        @test isotopic_abundance_factor(102, "CH") < 0.05
    end

    @testset "isotopic_abundance_factor: MgH molecule" begin
        # ²⁴Mg is dominant (~79%)
        @test isotopic_abundance_factor(24, "MgH") ≈ 0.79 rtol=0.1
        
        # ²⁵Mg is ~10%
        @test isotopic_abundance_factor(25, "MgH") ≈ 0.10 rtol=0.1
        
        # ²⁶Mg is ~11%
        @test isotopic_abundance_factor(26, "MgH") ≈ 0.11 rtol=0.1
    end

    # =========================================================================
    # Test 4: Parse molecular line with ISO code and NELION
    # =========================================================================

    @testset "parse_molecular_line: NELION mapping" begin
        # MgH line with ISO code 24
        line = "  500.0010 -1.505  9.5  4666.690  8.5  24661.070 112X03F2   B03F2   24"

        result = parse_molecular_line(line, "MgH")

        # Should have correct NELION code
        @test result.element_ion ≈ 124.0 atol=1e-2  # ISO 24 → NELION 124
    end

    # =========================================================================
    # Test 5: Read molecular lines from file
    # =========================================================================

    @testset "read_molecular_lines: filter by wavelength" begin
        molecular_file = "../../test/data/molecular/mgh_sample.asc"

        # Read lines in specific range
        λ_start = 500.0
        λ_end = 500.1
        margin = 0.0

        lines = read_molecular_lines(molecular_file, "MgH", λ_start, λ_end, margin)

        # Should return array of SpectralLine
        @test lines isa Vector{SpectralLine}
        @test length(lines) > 0

        # All lines should be within range
        for line in lines
            @test line.wavelength >= λ_start
            @test line.wavelength <= λ_end
        end
    end

    @testset "read_molecular_lines: with margin" begin
        molecular_file = "../../test/data/molecular/mgh_sample.asc"

        # Read with margin
        λ_start = 500.0
        λ_end = 500.05
        margin = 0.1

        lines = read_molecular_lines(molecular_file, "MgH", λ_start, λ_end, margin)

        # All lines should be within extended range
        for line in lines
            @test line.wavelength >= λ_start - margin
            @test line.wavelength <= λ_end + margin
        end
    end

    # =========================================================================
    # Test 6: Integration test with real molecular data
    # =========================================================================

    @testset "Integration: read and parse real MgH file" begin
        molecular_file = "../../test/data/molecular/mgh_sample.asc"

        # Read small wavelength range
        lines = read_molecular_lines(molecular_file, "MgH", 500.0, 500.05, 0.0)

        @test length(lines) > 0

        # Check first line
        first_line = lines[1]
        @test first_line.wavelength >= 500.0
        @test first_line.wavelength <= 500.05
        @test !isnan(first_line.loggf)
        @test first_line.element_ion > 0.0  # Valid NELION code

        # Check nbuff is computed
        @test first_line.nbuff > 0
    end

    # =========================================================================
    # Test 7: Edge cases - different isotopes
    # =========================================================================

    @testset "parse_molecular_line: multiple isotopes" begin
        # Test all three Mg isotopes
        line_24 = "  500.0010 -1.505  9.5  4666.690  8.5  24661.070 112X03F2   B03F2   24"
        line_25 = "  500.0039 -2.344 16.5 -9671.612 15.5 -29665.880 112X07F2   A07F1   25"
        line_26 = "  500.0161 -0.207 13.5 -7316.358 14.5 -27310.137 112X05E1   A05E1   26"

        result_24 = parse_molecular_line(line_24, "MgH")
        result_25 = parse_molecular_line(line_25, "MgH")
        result_26 = parse_molecular_line(line_26, "MgH")

        # Each should have different NELION codes
        @test result_24.element_ion ≈ 124.0 atol=1e-2
        @test result_25.element_ion ≈ 125.0 atol=1e-2
        @test result_26.element_ion ≈ 126.0 atol=1e-2
    end

end
