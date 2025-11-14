"""
Test atomic line readers (gfall format)

Tests for parsing Kurucz gfall format atomic line lists.

This file contains FAILING tests (RED phase of TDD).
CCW should implement functions in src/Synthe/src/line_readers.jl to make tests pass (GREEN phase).

Author: Claude (Local), Paula Coelho
Date: 2025-11-13
"""

using Test

# Add src/Synthe to load path
push!(LOAD_PATH, joinpath(@__DIR__, "../../src/Synthe/src"))

using Synthe

@testset "Gfall Line Parsing" begin
    @testset "Parse single gfall line - wavelength and loggf" begin
        # Example gfall line: Fe I at 4045.8138 Å
        line_str = "4045.8138  0.280 26.0  0.000 28520.868 4.0 6.0 -7.640 -6.420 -5.970"
        line = parse_gfall_line(line_str)

        @test line.wavelength ≈ 4045.8138
        @test line.loggf ≈ 0.280
    end

    @testset "Parse element/ion code - Fe I" begin
        line_str = "4045.8138  0.280 26.0  0.000 28520.868 4.0 6.0 -7.640 -6.420 -5.970"
        line = parse_gfall_line(line_str)

        @test line.element_ion ≈ 26.0  # Fe I (neutral iron)
    end

    @testset "Parse element/ion code - Fe II" begin
        line_str = "4233.1720 -1.090 26.01 2.583 31888.374 3.5 4.5 -7.500 -5.800 -6.100"
        line = parse_gfall_line(line_str)

        @test line.element_ion ≈ 26.01  # Fe II (singly ionized iron)
    end

    @testset "Parse energy levels" begin
        line_str = "4045.8138  0.280 26.0  0.000 28520.868 4.0 6.0 -7.640 -6.420 -5.970"
        line = parse_gfall_line(line_str)

        @test line.e_lower ≈ 0.000  # Ground state
        @test line.e_upper ≈ 28520.868  # cm⁻¹
    end

    @testset "Parse J quantum numbers" begin
        line_str = "4045.8138  0.280 26.0  0.000 28520.868 4.0 6.0 -7.640 -6.420 -5.970"
        line = parse_gfall_line(line_str)

        @test line.j_lower ≈ 4.0
        @test line.j_upper ≈ 6.0
    end

    @testset "Parse damping parameters" begin
        line_str = "4045.8138  0.280 26.0  0.000 28520.868 4.0 6.0 -7.640 -6.420 -5.970"
        line = parse_gfall_line(line_str)

        # Damping stored as log(gamma) in gfall, should be converted to gamma
        @test line.gamma_rad ≈ 10^(-7.640)  # 2.29e-8
        @test line.gamma_stark ≈ 10^(-6.420)  # 3.80e-7
        @test line.gamma_vdw ≈ 10^(-5.970)  # 1.07e-6

        # All damping values should be positive and finite
        @test line.gamma_rad > 0.0
        @test line.gamma_stark > 0.0
        @test line.gamma_vdw > 0.0
        @test isfinite(line.gamma_rad)
        @test isfinite(line.gamma_stark)
        @test isfinite(line.gamma_vdw)
    end

    @testset "Parse van der Waals alpha parameter" begin
        line_str = "4045.8138  0.280 26.0  0.000 28520.868 4.0 6.0 -7.640 -6.420 -5.970 0.42"
        line = parse_gfall_line(line_str)

        # Alpha is typically 0.4 for neutral atoms, may vary
        @test line.alpha ≈ 0.42 atol=0.01
    end

    @testset "Invalid input - empty string" begin
        @test_throws ErrorException parse_gfall_line("")
    end

    @testset "Invalid input - insufficient fields" begin
        line_str = "4045.8138  0.280 26.0"  # Missing most fields
        @test_throws ErrorException parse_gfall_line(line_str)
    end

    @testset "Invalid input - non-numeric wavelength" begin
        line_str = "INVALID  0.280 26.0  0.000 28520.868 4.0 6.0 -7.640 -6.420 -5.970"
        @test_throws Exception parse_gfall_line(line_str)
    end
end

@testset "Read gfall file" begin
    # These tests assume test data file exists at test/data/atomic/gf5000.asc
    # Paula will provide this file before CCW starts

    test_file = joinpath(@__DIR__, "../data/atomic/gf5000.asc")

    @testset "Read empty file" begin
        # Create temporary empty file for this test
        empty_file = tempname()
        touch(empty_file)

        lines = read_gfall_lines(empty_file, 5000.0, 5100.0)

        @test length(lines) == 0
        @test lines isa Vector{SpectralLine}

        rm(empty_file)
    end

    @testset "Wavelength filtering - no margin" begin
        # Skip if test data not available yet
        if !isfile(test_file)
            @test_skip "Test data not yet available: $test_file"
        else
            # Read lines in 5000-5010 Å range
            lines = read_gfall_lines(test_file, 5000.0, 5010.0, 0.0)

            # All lines should be within range
            for line in lines
                @test 5000.0 <= line.wavelength <= 5010.0
            end
        end
    end

    @testset "Wavelength filtering - with 10 Å margin" begin
        if !isfile(test_file)
            @test_skip "Test data not yet available: $test_file"
        else
            # Request 5000-5010 Å with 10 Å margin → should get 4990-5020 Å
            lines_with_margin = read_gfall_lines(test_file, 5000.0, 5010.0, 10.0)
            lines_no_margin = read_gfall_lines(test_file, 5000.0, 5010.0, 0.0)

            # With margin should have more lines (or equal if no lines in margin region)
            @test length(lines_with_margin) >= length(lines_no_margin)

            # All lines should be within extended range
            for line in lines_with_margin
                @test 4990.0 <= line.wavelength <= 5020.0
            end
        end
    end

    @testset "Skip comment lines" begin
        # Create temporary file with comments
        temp_file = tempname()
        write(temp_file, """
        # This is a comment
        4045.8138  0.280 26.0  0.000 28520.868 4.0 6.0 -7.640 -6.420 -5.970
        # Another comment
        4046.1234 -0.520 26.0  1.485 25899.374 2.5 3.5 -7.800 -6.300 -6.000
        """)

        lines = read_gfall_lines(temp_file, 4000.0, 5000.0)

        @test length(lines) == 2  # Only two actual lines, comments skipped
        @test lines[1].wavelength ≈ 4045.8138
        @test lines[2].wavelength ≈ 4046.1234

        rm(temp_file)
    end

    @testset "Skip blank lines" begin
        # Create temporary file with blank lines
        temp_file = tempname()
        write(temp_file, """
        4045.8138  0.280 26.0  0.000 28520.868 4.0 6.0 -7.640 -6.420 -5.970

        4046.1234 -0.520 26.0  1.485 25899.374 2.5 3.5 -7.800 -6.300 -6.000

        """)

        lines = read_gfall_lines(temp_file, 4000.0, 5000.0)

        @test length(lines) == 2  # Blank lines ignored

        rm(temp_file)
    end

    @testset "Count lines in test data file" begin
        if !isfile(test_file)
            @test_skip "Test data not yet available: $test_file"
        else
            # Read all lines in file (wide range)
            lines = read_gfall_lines(test_file, 4000.0, 6000.0)

            # Should have at least some lines
            @test length(lines) > 0

            # All lines should be SpectralLine structs
            @test all(l -> l isa SpectralLine, lines)

            # All wavelengths should be positive and finite
            @test all(l -> l.wavelength > 0.0, lines)
            @test all(l -> isfinite(l.wavelength), lines)
        end
    end
end

@testset "NBUFF index calculation" begin
    @testset "Minimum wavelength → index 1" begin
        # Grid: 5000-5100 Å, 1000 points
        idx = compute_nbuff(5000.0, 5000.0, 5100.0, 1000)
        @test idx == 1
    end

    @testset "Maximum wavelength → index n_points" begin
        idx = compute_nbuff(5100.0, 5000.0, 5100.0, 1000)
        @test idx == 1000
    end

    @testset "Middle wavelength → mid-range index" begin
        # Geometric mean of 5000 and 5100 ≈ 5049.75 Å
        λ_mid = sqrt(5000.0 * 5100.0)
        idx = compute_nbuff(λ_mid, 5000.0, 5100.0, 1000)

        # Should be near middle (±10% tolerance for logarithmic spacing)
        @test 450 <= idx <= 550
    end

    @testset "Logarithmic spacing validation" begin
        # In log space, wavelengths should map linearly to indices
        λ_1 = 5000.0
        λ_2 = 5010.0
        λ_3 = 5020.0

        idx_1 = compute_nbuff(λ_1, 5000.0, 5100.0, 1000)
        idx_2 = compute_nbuff(λ_2, 5000.0, 5100.0, 1000)
        idx_3 = compute_nbuff(λ_3, 5000.0, 5100.0, 1000)

        # Indices should increase monotonically
        @test idx_1 < idx_2 < idx_3
    end

    @testset "Below minimum wavelength" begin
        # λ < λ_min → should return index 0 or throw error
        idx = compute_nbuff(4900.0, 5000.0, 5100.0, 1000)
        @test idx <= 0  # Out of bounds indicator
    end

    @testset "Above maximum wavelength" begin
        # λ > λ_max → should return index > n_points or throw error
        idx = compute_nbuff(5200.0, 5000.0, 5100.0, 1000)
        @test idx > 1000  # Out of bounds indicator
    end
end

println("✅ Atomic line reader tests defined (RED phase).")
println("📝 Implement functions in src/Synthe/src/line_readers.jl to make tests pass (GREEN phase).")
println("📂 Test data expected at: test/data/atomic/gf5000.asc (Paula to provide)")
