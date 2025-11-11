"""
Test suite for rmolecasc molecular line reader (Task 4)

Tests the molecular line format parser
"""

using Test
using Synthe

# Sample molecular line data (approximate format)
const SAMPLE_MOLECULAR_CH = """
5000.123  -2.5  24500.1  43999.8  10  1.0  0.5
5050.456  -1.8  19234.5  39234.2  10  1.2  0.6
5099.789  -3.1  31245.9  51245.1  10  0.9  0.4
"""

const SAMPLE_MOLECULAR_CN = """
5001.234  -2.1  12345.6  32345.7  12  1.1  0.5
5051.567  -1.5  23456.7  43456.8  12  1.3  0.6
"""

const SAMPLE_MOLECULAR_CO = """
5002.345  -1.9  8765.43  28765.4  17  1.0  0.5
5052.678  -2.3  17654.3  37654.2  17  1.1  0.6
"""

@testset "rmolecasc: Molecular Line Reader" begin
    @testset "ISO code to NELION mapping" begin
        # Test molecule identification
        @test iso_to_nelion(1) == 240    # H₂
        @test iso_to_nelion(10) == 246   # ¹²C¹H (CH)
        @test iso_to_nelion(12) == 270   # ¹²C¹⁴N (CN)
        @test iso_to_nelion(17) == 276   # ¹²C¹⁶O (CO)
        @test iso_to_nelion(24) == 300   # ²⁴Mg¹H (MgH)
        @test iso_to_nelion(28) == 312   # ²⁸Si¹H (SiH)

        # Test unknown ISO codes
        @test_throws KeyError iso_to_nelion(9999)
    end

    @testset "Isotopic abundance corrections" begin
        # Test abundance correction lookup
        abund = get_isotopic_abundance(17)  # ¹²C¹⁶O

        @test haskey(abund, :X1)
        @test haskey(abund, :X2)
        @test haskey(abund, :FUDGE)

        # Most abundant isotopologue should have small corrections
        @test abs(abund[:X1]) < 0.01   # ¹²C is dominant
        @test abs(abund[:X2]) < 0.01   # ¹⁶O is dominant
        @test abund[:FUDGE] == 0.0     # No empirical correction
    end

    @testset "Parse molecular line" begin
        line_str = "5000.123  -2.5  24500.1  43999.8  10  1.0  0.5"

        line = parse_molecular_line(line_str, 10)  # ISO=10 (CH)

        @test line.wavelength ≈ 5000.123 rtol=1e-6
        @test line.loggf ≈ -2.5 rtol=1e-6
        @test line.e_lower ≈ 24500.1 rtol=1e-6
        @test line.e_upper ≈ 43999.8 rtol=1e-6
        @test line.element_ion == 246.0  # CH species code
    end

    @testset "Read CH molecular lines" begin
        temp_file = tempname() * ".asc"
        write(temp_file, SAMPLE_MOLECULAR_CH)

        try
            lines = read_molecular_lines(temp_file, "CH", 5000.0, 5100.0)

            # Should have lines
            @test length(lines) > 0

            # All lines should be CH (NELION=246)
            @test all(l -> l.element_ion == 246.0, lines)

            # Wavelength filtering
            @test all(l -> l.wavelength >= 5000.0 - 10.0, lines)
            @test all(l -> l.wavelength <= 5100.0 + 10.0, lines)
        finally
            rm(temp_file, force=true)
        end
    end

    @testset "Read CN molecular lines" begin
        temp_file = tempname() * ".asc"
        write(temp_file, SAMPLE_MOLECULAR_CN)

        try
            lines = read_molecular_lines(temp_file, "CN", 5000.0, 5100.0)

            # All lines should be CN (NELION=270)
            @test all(l -> l.element_ion == 270.0, lines)
        finally
            rm(temp_file, force=true)
        end
    end

    @testset "Read CO molecular lines" begin
        temp_file = tempname() * ".asc"
        write(temp_file, SAMPLE_MOLECULAR_CO)

        try
            lines = read_molecular_lines(temp_file, "CO", 5000.0, 5100.0)

            # All lines should be CO (NELION=276)
            @test all(l -> l.element_ion == 276.0, lines)
        finally
            rm(temp_file, force=true)
        end
    end

    @testset "Damping widths for molecules" begin
        temp_file = tempname() * ".asc"
        write(temp_file, SAMPLE_MOLECULAR_CH)

        try
            lines = read_molecular_lines(temp_file, "CH", 5000.0, 5100.0)

            for line in lines
                # Molecular damping should be positive but typically smaller than atomic
                @test line.gamma_rad > 0
                @test line.gamma_stark >= 0
                @test line.gamma_vdw >= 0

                # Molecular damping typically smaller than atomic
                @test line.gamma_stark <= 1.0e-4
                @test line.gamma_vdw <= 1.0e-6
            end
        finally
            rm(temp_file, force=true)
        end
    end

    @testset "NBUFF calculation for molecules" begin
        temp_file = tempname() * ".asc"
        write(temp_file, SAMPLE_MOLECULAR_CH)

        config = SyntheConfig(
            wave_start = 5000.0,
            wave_end = 5100.0,
            resolving_power = 50000.0,
            turbulent_velocity = 2.0,
            vacuum_wavelengths = true,
            nlte = false,
            cutoff = 0.001
        )

        params = synbeg_initialize(config)

        try
            lines = read_molecular_lines(temp_file, "CH", 5000.0, 5100.0, params)

            for line in lines
                # NBUFF should be valid
                @test line.nbuff >= 1
                @test line.nbuff <= params.n_points

                # NBUFF should match wavelength
                expected_nbuff = wavelength_to_nbuff(line.wavelength, params)
                @test line.nbuff == expected_nbuff
            end
        finally
            rm(temp_file, force=true)
        end
    end

    @testset "Combine atomic and molecular lines" begin
        # Create atomic and molecular line vectors
        atomic_line = SpectralLine(
            1, 5000.0, -2.0, 26.0,
            10000.0, 30000.0, 2.5, 3.5,
            1e7, 1e-5, 1e-7, 0.4
        )

        molecular_line = SpectralLine(
            2, 5050.0, -1.5, 246.0,
            20000.0, 40000.0, 1.0, 2.0,
            1e6, 1e-6, 1e-8, 0.4
        )

        atomic_lines = [atomic_line]
        molecular_lines = [molecular_line]

        combined = combine_line_lists(atomic_lines, molecular_lines)

        # Should have both lines
        @test length(combined) == 2

        # Should be sorted by wavelength
        @test issorted([l.wavelength for l in combined])

        # Should contain both atomic and molecular
        elements = [l.element_ion for l in combined]
        @test 26.0 in elements   # Fe I (atomic)
        @test 246.0 in elements  # CH (molecular)
    end

    @testset "Empty molecular file" begin
        temp_file = tempname() * ".asc"
        write(temp_file, "")

        try
            lines = read_molecular_lines(temp_file, "CH", 5000.0, 5100.0)
            @test length(lines) == 0
        finally
            rm(temp_file, force=true)
        end
    end

    @testset "Malformed molecular line" begin
        malformed_data = """
5000.123  -2.5  24500.1  43999.8  10  1.0  0.5
THIS IS NOT VALID
5050.456  -1.8  19234.5  39234.2  10  1.2  0.6
        """

        temp_file = tempname() * ".asc"
        write(temp_file, malformed_data)

        try
            lines = read_molecular_lines(temp_file, "CH", 5000.0, 5100.0)

            # Should skip malformed line gracefully
            @test length(lines) == 2
        finally
            rm(temp_file, force=true)
        end
    end
end
