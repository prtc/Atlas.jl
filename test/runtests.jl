"""
Atlas.jl Test Suite

Comprehensive testing for Pure Julia stellar spectrum synthesis implementation.

Test structure:
- unit/: Unit tests for individual components
- integration/: Integration tests comparing against Fortran
- reference/: Reference data from Fortran ATLAS/SYNTHE

Author: Claude (Local), Paula Coelho
Date: 2025-11-15
"""

using Test

# Run all test suites
@testset "Atlas.jl" begin
    @testset "Unit Tests" begin
        include("unit/test_hminus_opacity.jl")
        include("unit/test_voigt.jl")
        include("unit/test_populations.jl")
        include("unit/test_radiative_transfer.jl")
    end

    @testset "Integration Tests" begin
        include("integration/test_fortran_comparison.jl")
    end
end

println("\n✅ All tests passed!")
