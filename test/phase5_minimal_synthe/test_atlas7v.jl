"""
Test atlas7v Fortran library ccall interface

Tests the Julia wrapper functions for calling atlas7v Fortran subroutines:
- POPS: Population solver (LTE/NLTE ionization fractions)
- KAPP: Opacity dispatcher (continuum opacities)
- JOSH: Radiative transfer solver (Feautrier method)

NOTE: These tests require:
1. atlas7v.so compiled by Paula (see test/phase5_minimal_synthe/README.md)
2. Solar atmosphere model loaded
3. COMMON blocks properly initialized

Author: Claude (Task 1: Atlas7v ccall interface)
Date: 2025-11-11
"""

using Test

# Add src/Synthe to load path
push!(LOAD_PATH, joinpath(@__DIR__, "../../src/Synthe/src"))

using Synthe

@testset "Atlas7v Library Loading" begin
    # Test that library path is defined
    @test isdefined(Synthe, :ATLAS7V_LIBRARY)

    # Test that library exists (will fail until Paula compiles it)
    lib_path = Synthe.ATLAS7V_LIBRARY
    @test_skip isfile(lib_path)  # Skip until library available

    # Test that library can be loaded (skip until available)
    @test_skip isfile(lib_path) && Synthe.atlas7v_library_available()
end

@testset "POPS Population Solver" begin
    # Skip these tests until atlas7v.so is available
    @test_skip begin
        # Load solar atmosphere
        atm = load_solar_atmosphere()

        # Test Fe I populations (element code 26.00)
        populations = call_pops(26.00, 2, atm)

        # Validate dimensions: 99 depths × 10 ionization stages
        @test size(populations) == (99, 10)

        # Validate all populations are finite
        @test all(isfinite.(populations))

        # Validate all populations are non-negative
        @test all(populations .>= 0.0)

        # Validate that neutral (stage 1) dominates for Fe I
        @test populations[:, 1] .> populations[:, 2]  # Fe I > Fe II at all depths

        true
    end
end

@testset "POPS Element Codes" begin
    @test_skip begin
        atm = load_solar_atmosphere()

        # Test H I (1.00)
        h_pops = call_pops(1.00, 2, atm)
        @test size(h_pops) == (99, 10)
        @test all(isfinite.(h_pops))

        # Test He I (2.00)
        he_pops = call_pops(2.00, 2, atm)
        @test size(he_pops) == (99, 10)
        @test all(isfinite.(he_pops))

        # Test C I (6.00)
        c_pops = call_pops(6.00, 2, atm)
        @test size(c_pops) == (99, 10)
        @test all(isfinite.(c_pops))

        # Test O I (8.00)
        o_pops = call_pops(8.00, 2, atm)
        @test size(o_pops) == (99, 10)
        @test all(isfinite.(o_pops))

        true
    end
end

@testset "POPS Modes" begin
    @test_skip begin
        atm = load_solar_atmosphere()

        # Mode 1: Fraction (sum to 1)
        frac_pops = call_pops(26.00, 1, atm)
        for depth in 1:99
            total = sum(frac_pops[depth, :])
            @test total ≈ 1.0 rtol=1e-10
        end

        # Mode 2: Number density (cm⁻³)
        num_pops = call_pops(26.00, 2, atm)
        @test all(num_pops .> 0.0)  # Should be large numbers (densities)
        @test all(num_pops .< 1e20)  # But not unreasonably large

        true
    end
end

@testset "KAPP Opacity Dispatcher" begin
    @test_skip begin
        atm = load_solar_atmosphere()

        # Initialize populations first (KAPP needs this)
        initialize_atmosphere_for_kapp!(atm)

        # Test N=0: Initialize + compute continuum opacities
        call_kapp(0, 0, 0.0, atm)

        # Read continuum opacity from COMMON /OPTOT/
        acont = get_continuum_absorption()
        scont = get_continuum_scattering()

        @test length(acont) == 99
        @test length(scont) == 99
        @test all(acont .>= 0.0)
        @test all(scont .>= 0.0)
        @test all(isfinite.(acont))
        @test all(isfinite.(scont))

        true
    end
end

@testset "KAPP Wavelength Dependence" begin
    @test_skip begin
        atm = load_solar_atmosphere()
        initialize_atmosphere_for_kapp!(atm)

        # Set wavelength to 5000 Å and compute opacity
        set_wavelength!(5000.0)
        call_kapp(0, 0, 0.0, atm)
        opacity_5000 = get_continuum_absorption()

        # Set wavelength to 10000 Å and compute opacity
        set_wavelength!(10000.0)
        call_kapp(0, 0, 0.0, atm)
        opacity_10000 = get_continuum_absorption()

        # Opacity should be different at different wavelengths
        @test opacity_5000 != opacity_10000

        # Opacity typically decreases with wavelength (rough check)
        @test mean(opacity_5000) > mean(opacity_10000)

        true
    end
end

@testset "JOSH Radiative Transfer" begin
    @test_skip begin
        atm = load_solar_atmosphere()

        # Initialize atmosphere and opacities
        initialize_atmosphere_for_josh!(atm)

        # Set total opacity (continuum + line)
        total_opacity = ones(99) * 1e-5  # Typical continuum opacity
        set_total_opacity!(total_opacity, atm)

        # Test IFSCAT=0, IFSURF=1 (no scattering, surface flux only)
        flux = call_josh(0, 1, atm)

        @test isfinite(flux)
        @test flux > 0.0  # Surface flux must be positive

        true
    end
end

@testset "JOSH Source Function Iteration" begin
    @test_skip begin
        atm = load_solar_atmosphere()
        initialize_atmosphere_for_josh!(atm)

        total_opacity = ones(99) * 1e-5
        set_total_opacity!(total_opacity, atm)

        # Test IFSCAT=1, IFSURF=0 (solve source function, compute J and H)
        call_josh(1, 0, atm)

        # Read mean intensity J and flux H from COMMON blocks
        J = get_mean_intensity()
        H = get_eddington_flux()

        @test length(J) == 99
        @test length(H) == 99
        @test all(isfinite.(J))
        @test all(isfinite.(H))
        @test all(J .> 0.0)

        true
    end
end

@testset "COMMON Block Round-Trip" begin
    @test_skip begin
        # Test that we can write to COMMON blocks and read back
        atm = load_solar_atmosphere()

        # Set RHOX block
        set_rhox!(atm)
        rhox_read = get_rhox()
        @test rhox_read ≈ atm.rhox rtol=1e-12

        # Set TEMP block
        set_temp!(atm)
        temp_read = get_temp()
        @test temp_read ≈ atm.temperature rtol=1e-12

        # Set STATE block (number densities)
        set_state!(atm)
        xnatom_read = get_xnatom()
        @test all(isfinite.(xnatom_read))
        @test all(xnatom_read .> 0.0)

        true
    end
end

@testset "Full Atmosphere Initialization" begin
    @test_skip begin
        # Test complete atmosphere setup for atlas7v
        atm = load_solar_atmosphere()

        # Initialize all COMMON blocks
        initialize_atlas7v!(atm)

        # Verify depths
        @test atm.n_depths == 99

        # Verify temperature structure
        @test all(atm.temperature .> 0.0)
        @test all(isfinite.(atm.temperature))

        # Verify pressure structure
        @test all(atm.p_gas .> 0.0)
        @test all(atm.p_electron .> 0.0)
        @test all(isfinite.(atm.p_gas))
        @test all(isfinite.(atm.p_electron))

        # Verify density structure
        @test all(atm.density .> 0.0)
        @test all(isfinite.(atm.density))

        true
    end
end

# Helper function to load solar atmosphere for testing
function load_solar_atmosphere()
    # This will be implemented in Task 5 (xnfpelsyn)
    # For now, create a minimal test atmosphere

    n_depths = 99

    # Logarithmic optical depth scale (typical solar)
    tau_ross = 10.0 .^ range(-5, 2, length=n_depths)

    # Temperature structure (typical photosphere)
    # ATLAS models use RHOX (column mass density) as depth scale
    rhox = tau_ross * 100.0  # Approximate conversion

    # Typical solar temperature structure
    temperature = 4000.0 .+ 2000.0 .* log10.(tau_ross .+ 0.01)
    temperature = clamp.(temperature, 3500.0, 10000.0)

    # Typical solar pressures (rough approximation)
    p_gas = 1e5 .* tau_ross.^0.6
    p_electron = p_gas .* 0.01  # ~1% ionization

    # Density from ideal gas law
    density = p_gas ./ (8.314e7 .* temperature ./ 2.3)  # Mean molecular weight ≈ 2.3

    return AtmosphereModel(
        n_depths = n_depths,
        rhox = rhox,
        temperature = temperature,
        p_gas = p_gas,
        p_electron = p_electron,
        density = density
    )
end

println("Atlas7v ccall interface tests defined.")
println("NOTE: Tests are @test_skip until atlas7v.so is compiled by Paula.")
println("See test/phase5_minimal_synthe/README.md for compilation instructions.")
