"""
Test suite for rgfalllinesnew atomic line reader (Task 3)

Tests the gfall format parser
"""

using Test
using Synthe

# Sample gfall format lines for testing (from Deep Dive 12)
const SAMPLE_GFALL_LINES = """
 5000.1720 -2.570 26.0  18500.123  3.5  57002.456  2.5 'a 5D      ' 'z 5P*     '
 5001.8620  0.050 26.0  19350.850  2.5  39373.020  3.5 'a 3F      ' 'z 3G*     '
 5002.7940 -0.010 26.1  0.000  4.5  19962.547  5.5 'a 6D      ' 'z 6F*     '
 5050.3450 -1.360 26.0  18378.185  4.5  38338.662  4.5 'a 5D      ' 'z 5D*     '
 5099.9970 -0.180 26.0  19562.698  3.5  39172.863  4.5 'a 3F      ' 'z 3G*     '
 4999.5000 -2.800 26.0  20020.400  1.5  40041.500  2.5 'a 3P      ' 'z 3D*     '
 5100.5000 -1.950 26.0  19757.080  2.5  39744.625  3.5 'a 3F      ' 'z 3F*     '
"""

@testset "rgfalllinesnew: Atomic Line Reader" begin
    @testset "Parse single gfall line" begin
        line_str = " 5000.1720 -2.570 26.0  18500.123  3.5  57002.456  2.5 'a 5D      ' 'z 5P*     '"

        line = parse_gfall_line(line_str)

        # Validate parsed fields
        @test line.wavelength ≈ 5000.1720 rtol=1e-6
        @test line.loggf ≈ -2.570 rtol=1e-6
        @test line.element_ion ≈ 26.0 rtol=1e-6  # Fe I
        @test line.e_lower ≈ 18500.123 rtol=1e-6
        @test line.j_lower ≈ 3.5 rtol=1e-6
        @test line.e_upper ≈ 57002.456 rtol=1e-6
        @test line.j_upper ≈ 2.5 rtol=1e-6
    end

    @testset "Wavelength filtering" begin
        # Write sample data to temp file
        temp_file = tempname() * ".dat"
        write(temp_file, SAMPLE_GFALL_LINES)

        try
            # Read with wavelength filter
            lines = read_gfalllines(temp_file, 5000.0, 5100.0)

            # Should include lines within range
            @test length(lines) > 0

            # All lines should be within requested range (with margin)
            margin = 10.0  # Å (for line wings)
            @test all(l -> l.wavelength >= 5000.0 - margin, lines)
            @test all(l -> l.wavelength <= 5100.0 + margin, lines)

            # Specific test: 4999.5 should be included (within margin)
            # 5100.5 should be included (within margin)
            wavelengths = [l.wavelength for l in lines]
            @test 4999.5 in wavelengths
            @test 5100.5 in wavelengths
        finally
            rm(temp_file, force=true)
        end
    end

    @testset "Element code parsing" begin
        temp_file = tempname() * ".dat"
        write(temp_file, SAMPLE_GFALL_LINES)

        try
            lines = read_gfalllines(temp_file, 5000.0, 5100.0)

            # Extract unique element codes
            elements = unique([l.element_ion for l in lines])

            # Should have Fe I (26.0) and Fe II (26.1)
            @test 26.0 in elements  # Fe I
            @test 26.1 in elements  # Fe II

            # Atomic number extraction
            for line in lines
                iz = floor(Int, line.element_ion)
                @test iz == 26  # Iron
            end
        finally
            rm(temp_file, force=true)
        end
    end

    @testset "Damping parameter calculations" begin
        temp_file = tempname() * ".dat"
        write(temp_file, SAMPLE_GFALL_LINES)

        try
            lines = read_gfalllines(temp_file, 5000.0, 5100.0)

            for line in lines
                # Damping parameters should be positive
                @test line.gamma_rad > 0
                @test line.gamma_stark >= 0
                @test line.gamma_vdw >= 0

                # van der Waals exponent typically 0.4
                @test 0.3 <= line.alpha <= 0.5
            end
        finally
            rm(temp_file, force=true)
        end
    end

    @testset "NBUFF calculation" begin
        temp_file = tempname() * ".dat"
        write(temp_file, SAMPLE_GFALL_LINES)

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
            lines = read_gfalllines(temp_file, 5000.0, 5100.0, params)

            for line in lines
                # NBUFF should be valid index
                @test line.nbuff >= 1
                @test line.nbuff <= params.n_points

                # NBUFF should correspond to wavelength
                expected_nbuff = wavelength_to_nbuff(line.wavelength, params)
                @test line.nbuff == expected_nbuff
            end
        finally
            rm(temp_file, force=true)
        end
    end

    @testset "Empty file handling" begin
        temp_file = tempname() * ".dat"
        write(temp_file, "")  # Empty file

        try
            lines = read_gfalllines(temp_file, 5000.0, 5100.0)
            @test length(lines) == 0
        finally
            rm(temp_file, force=true)
        end
    end

    @testset "Malformed line handling" begin
        malformed_data = """
 5000.1720 -2.570 26.0  18500.123  3.5  57002.456  2.5 'a 5D      ' 'z 5P*     '
 THIS IS NOT A VALID LINE
 5001.8620  0.050 26.0  19350.850  2.5  39373.020  3.5 'a 3F      ' 'z 3G*     '
        """

        temp_file = tempname() * ".dat"
        write(temp_file, malformed_data)

        try
            # Should skip malformed line gracefully
            lines = read_gfalllines(temp_file, 5000.0, 5100.0)

            # Should have 2 valid lines (skipped the bad one)
            @test length(lines) == 2
        finally
            rm(temp_file, force=true)
        end
    end
end
