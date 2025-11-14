"""
Test molecular line readers (ASCII format)

Tests for parsing molecular line lists (CH, CN, CO).

This file contains FAILING tests (RED phase of TDD).
CCW should implement functions in src/Synthe/src/line_readers_molecular.jl to make tests pass (GREEN phase).

Author: Claude (Local), Paula Coelho
Date: 2025-11-13
"""

using Test

# Add src/Synthe to load path
push!(LOAD_PATH, joinpath(@__DIR__, "../../src/Synthe/src"))

using Synthe

@testset "ISO code → NELION mapping" begin
    @testset "CH isotopes → NELION 246" begin
        @test iso_to_nelion(101, "CH") ≈ 246.0  # ¹²C¹H (main isotope)
        @test iso_to_nelion(102, "CH") ≈ 246.0  # ¹³C¹H (rare isotope)
    end

    @testset "CN isotopes → NELION 270" begin
        @test iso_to_nelion(201, "CN") ≈ 270.0  # ¹²C¹⁴N (main)
        @test iso_to_nelion(202, "CN") ≈ 270.0  # ¹³C¹⁴N (rare)
    end

    @testset "CO isotopes → NELION 276" begin
        @test iso_to_nelion(301, "CO") ≈ 276.0  # ¹²C¹⁶O (main)
        @test iso_to_nelion(302, "CO") ≈ 276.0  # ¹³C¹⁶O (rare)
        @test iso_to_nelion(303, "CO") ≈ 276.0  # ¹²C¹⁸O (rare)
    end

    @testset "Unknown molecule → error" begin
        @test_throws ErrorException iso_to_nelion(101, "XY")
        @test_throws ErrorException iso_to_nelion(999, "INVALID")
    end
end

@testset "Isotopic abundance factors" begin
    @testset "Main isotopes have abundance factor 1.0" begin
        @test isotopic_abundance_factor(101, "CH") ≈ 1.0  # ¹²C¹H
        @test isotopic_abundance_factor(201, "CN") ≈ 1.0  # ¹²C¹⁴N
        @test isotopic_abundance_factor(301, "CO") ≈ 1.0  # ¹²C¹⁶O
    end

    @testset "¹³C isotopes have reduced abundance" begin
        # ¹²C/¹³C ≈ 89 in solar → ¹³C factor ≈ 1/89 ≈ 0.011
        factor_ch = isotopic_abundance_factor(102, "CH")  # ¹³C¹H
        factor_cn = isotopic_abundance_factor(202, "CN")  # ¹³C¹⁴N
        factor_co = isotopic_abundance_factor(302, "CO")  # ¹³C¹⁶O

        @test factor_ch ≈ 0.011 atol=0.002  # ~1/89, allow ±20% tolerance
        @test factor_cn ≈ 0.011 atol=0.002
        @test factor_co ≈ 0.011 atol=0.002
    end

    @testset "Abundance factor modifies gf value" begin
        # gf_corrected = gf_original * abundance_factor
        gf_main = 1.0e-3
        gf_rare = gf_main * isotopic_abundance_factor(102, "CH")

        @test gf_rare < gf_main  # Rare isotope should have weaker line
        @test gf_rare ≈ gf_main * 0.011 atol=gf_main*0.003
    end
end

@testset "Parse molecular line" begin
    @testset "Parse CH line - main isotope" begin
        # Example CH line: wavelength, log(gf), ISO, E_lower, E_upper, J_lower, J_upper
        line_str = "5165.2340 -2.450 101 15234.67 34567.89 2.5 3.5"
        line = parse_molecular_line(line_str, "CH")

        @test line.wavelength ≈ 5165.2340
        @test line.loggf ≈ -2.450
        @test line.element_ion ≈ 246.0  # CH → NELION 246
        @test line.e_lower ≈ 15234.67
        @test line.e_upper ≈ 34567.89
        @test line.j_lower ≈ 2.5
        @test line.j_upper ≈ 3.5
    end

    @testset "Parse CN line" begin
        line_str = "3875.1234 -1.850 201 8456.23 34567.89 1.5 2.5"
        line = parse_molecular_line(line_str, "CN")

        @test line.wavelength ≈ 3875.1234
        @test line.element_ion ≈ 270.0  # CN → NELION 270
    end

    @testset "Parse CO line" begin
        line_str = "4835.6789 -3.120 301 5678.90 27056.78 3.0 4.0"
        line = parse_molecular_line(line_str, "CO")

        @test line.wavelength ≈ 4835.6789
        @test line.element_ion ≈ 276.0  # CO → NELION 276
    end

    @testset "Parse rare isotope - ¹³C¹H" begin
        # ¹³C¹H line should have NELION 246 but gf corrected by abundance
        line_str = "5165.2340 -2.450 102 15234.67 34567.89 2.5 3.5"
        line = parse_molecular_line(line_str, "CH")

        @test line.element_ion ≈ 246.0  # Still NELION 246

        # gf should be reduced by isotopic abundance factor
        gf_expected = 10^(-2.450) * isotopic_abundance_factor(102, "CH")
        loggf_expected = log10(gf_expected)

        @test line.loggf ≈ loggf_expected atol=0.01
    end

    @testset "Invalid input - empty string" begin
        @test_throws ErrorException parse_molecular_line("", "CH")
    end

    @testset "Invalid input - insufficient fields" begin
        line_str = "5165.2340 -2.450"  # Missing fields
        @test_throws ErrorException parse_molecular_line(line_str, "CH")
    end
end

@testset "Read molecular line file" begin
    # These tests assume test data file exists at test/data/molecular/ch_lines.asc
    # Paula will provide this file before CCW starts

    ch_test_file = joinpath(@__DIR__, "../data/molecular/ch_lines.asc")
    cn_test_file = joinpath(@__DIR__, "../data/molecular/cn_lines.asc")
    co_test_file = joinpath(@__DIR__, "../data/molecular/co_lines.asc")

    @testset "Read empty file" begin
        empty_file = tempname()
        touch(empty_file)

        lines = read_molecular_lines(empty_file, "CH", 5000.0, 5100.0)

        @test length(lines) == 0
        @test lines isa Vector{SpectralLine}

        rm(empty_file)
    end

    @testset "Wavelength filtering - no margin" begin
        if !isfile(ch_test_file)
            @test_skip "Test data not yet available: $ch_test_file"
        else
            lines = read_molecular_lines(ch_test_file, "CH", 5000.0, 5010.0, 0.0)

            # All lines should be within range
            for line in lines
                @test 5000.0 <= line.wavelength <= 5010.0
            end
        end
    end

    @testset "Wavelength filtering - with margin" begin
        if !isfile(ch_test_file)
            @test_skip "Test data not yet available: $ch_test_file"
        else
            lines_with_margin = read_molecular_lines(ch_test_file, "CH", 5000.0, 5010.0, 10.0)
            lines_no_margin = read_molecular_lines(ch_test_file, "CH", 5000.0, 5010.0, 0.0)

            # With margin should have ≥ lines
            @test length(lines_with_margin) >= length(lines_no_margin)

            # All lines within extended range
            for line in lines_with_margin
                @test 4990.0 <= line.wavelength <= 5020.0
            end
        end
    end

    @testset "Read CH file" begin
        if !isfile(ch_test_file)
            @test_skip "Test data not yet available: $ch_test_file"
        else
            lines = read_molecular_lines(ch_test_file, "CH", 4000.0, 6000.0)

            @test length(lines) > 0
            @test all(l -> l isa SpectralLine, lines)

            # All CH lines should have NELION 246
            @test all(l -> l.element_ion ≈ 246.0, lines)

            # All wavelengths positive and finite
            @test all(l -> l.wavelength > 0.0, lines)
            @test all(l -> isfinite(l.wavelength), lines)
        end
    end

    @testset "Read CN file" begin
        if !isfile(cn_test_file)
            @test_skip "Test data not yet available: $cn_test_file"
        else
            lines = read_molecular_lines(cn_test_file, "CN", 3000.0, 5000.0)

            @test length(lines) > 0

            # All CN lines should have NELION 270
            @test all(l -> l.element_ion ≈ 270.0, lines)
        end
    end

    @testset "Read CO file" begin
        if !isfile(co_test_file)
            @test_skip "Test data not yet available: $co_test_file"
        else
            lines = read_molecular_lines(co_test_file, "CO", 4000.0, 6000.0)

            @test length(lines) > 0

            # All CO lines should have NELION 276
            @test all(l -> l.element_ion ≈ 276.0, lines)
        end
    end

    @testset "Skip comment and blank lines" begin
        temp_file = tempname()
        write(temp_file, """
        # Comment line
        5165.2340 -2.450 101 15234.67 34567.89 2.5 3.5

        5166.1234 -2.120 101 15240.50 34560.12 3.5 4.5
        # Another comment
        """)

        lines = read_molecular_lines(temp_file, "CH", 5000.0, 5200.0)

        @test length(lines) == 2  # Only two actual lines
        @test lines[1].wavelength ≈ 5165.2340
        @test lines[2].wavelength ≈ 5166.1234

        rm(temp_file)
    end
end

@testset "Molecular vs atomic line integration" begin
    @testset "Molecular lines use same SpectralLine struct" begin
        # Both atomic and molecular should produce same struct type
        atomic_line_str = "4045.8138  0.280 26.0  0.000 28520.868 4.0 6.0 -7.640 -6.420 -5.970"
        molecular_line_str = "5165.2340 -2.450 101 15234.67 34567.89 2.5 3.5"

        atomic_line = parse_gfall_line(atomic_line_str)
        molecular_line = parse_molecular_line(molecular_line_str, "CH")

        @test typeof(atomic_line) == typeof(molecular_line)
        @test atomic_line isa SpectralLine
        @test molecular_line isa SpectralLine
    end

    @testset "Can combine atomic and molecular line lists" begin
        # Create temp atomic and molecular files
        atomic_file = tempname()
        write(atomic_file, "4045.8138  0.280 26.0  0.000 28520.868 4.0 6.0 -7.640 -6.420 -5.970")

        molecular_file = tempname()
        write(molecular_file, "5165.2340 -2.450 101 15234.67 34567.89 2.5 3.5")

        atomic_lines = read_gfall_lines(atomic_file, 4000.0, 5000.0)
        molecular_lines = read_molecular_lines(molecular_file, "CH", 5000.0, 6000.0)

        # Combine into single list
        all_lines = vcat(atomic_lines, molecular_lines)

        @test length(all_lines) == 2
        @test all_lines[1].element_ion ≈ 26.0  # Fe I
        @test all_lines[2].element_ion ≈ 246.0  # CH

        rm(atomic_file)
        rm(molecular_file)
    end
end

println("✅ Molecular line reader tests defined (RED phase).")
println("📝 Implement functions in src/Synthe/src/line_readers_molecular.jl to make tests pass (GREEN phase).")
println("📂 Test data expected at: test/data/molecular/{ch,cn,co}_lines.asc (Paula to provide)")
