"""
Atlas7v Fortran library interface (ccall wrappers)

**Task 1**: Implement ccall wrappers for POPS, KAPP, JOSH

**Atlas7v subroutines** (from Deep Dive - ATLAS7V_PHASE4_CRITICAL_DEEP_DIVE.md):

1. **POPS(CODE, MODE, NUMBER)**
   - Saha-Boltzmann population calculator
   - CODE: Element.ion code (e.g., 26.00 = Fe I)
   - MODE: 1=ionization fraction, 2=number density
   - NUMBER: Output array (n_depths × 10 ionization stages)

2. **KAPP(N, NSTEPS, STEPWT)**
   - Continuum opacity dispatcher
   - N: 0=initialize+continuum, >0=lines only
   - Calls HOP, HMINOP, HE1OP, HE2OP, ELECOP, etc.

3. **JOSH(IFSCAT, IFSURF)**
   - Feautrier radiative transfer solver
   - IFSCAT: 0=no scattering, 1=solve for source function
   - IFSURF: 0=compute J and H, 1=surface flux only

**COMMON blocks** (must be set before calling):
- /RHOX/: Depth scale
- /TEMP/: Temperature structure
- /STATE/: Pressure, electron density
- /ELEM/: Element abundances
- /FREQ/: Current frequency
- /OPTOT/: Opacity arrays (output)

**Compilation**:
```bash
gfortran -shared -fPIC -O2 -o libaslave7v.so atlas7v.for
```

**Usage**:
```julia
# Load library
const atlas7v = "path/to/libaslave7v.so"

# Set COMMON blocks via pointers
set_atmosphere!(atm)
set_abundances!(abundances)

# Call POPS
populations = call_pops(26.00, 2)  # Fe I number densities

# Call KAPP
call_kapp(0, 0, 0.0)  # Initialize continuum opacities

# Call JOSH
flux = call_josh(1, 1)  # Solve with scattering, return surface flux
```

**Status**: NOT IMPLEMENTED (Task 1)
- Waiting for Paula to compile atlas7v.so
- Can proceed with Tasks 2-4 (line readers) without this
"""

# Placeholder - will be implemented in Task 1
# const ATLAS7V_LIBRARY = "fortran_reference/atlas7v_library/libaslave7v.so"

"""
    call_pops(code::Float64, mode::Int, atm::AtmosphereModel)

Call Fortran POPS subroutine for Saha-Boltzmann populations

**Not implemented yet** - Task 1
"""
function call_pops(code::Float64, mode::Int, atm::AtmosphereModel)
    error("Task 1 not yet implemented: atlas7v ccall interface")
end

"""
    call_kapp(n::Int, nsteps::Int, stepwt::Float64, atm::AtmosphereModel)

Call Fortran KAPP subroutine for continuum opacities

**Not implemented yet** - Task 1
"""
function call_kapp(n::Int, nsteps::Int, stepwt::Float64, atm::AtmosphereModel)
    error("Task 1 not yet implemented: atlas7v ccall interface")
end

"""
    call_josh(ifscat::Int, ifsurf::Int, atm::AtmosphereModel)

Call Fortran JOSH subroutine for radiative transfer

**Not implemented yet** - Task 1
"""
function call_josh(ifscat::Int, ifsurf::Int, atm::AtmosphereModel)
    error("Task 1 not yet implemented: atlas7v ccall interface")
end
