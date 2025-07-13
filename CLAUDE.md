# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Atlas.jl is a Julia refactor of the ATLAS Suite of Fortran codes from Robert Kurucz. This is a legacy code modernization project focused on translating astronomical stellar atmosphere modeling software from Fortran to Julia.

## Repository Structure

The project is currently in the initial phase and contains only legacy source materials:

- `upstream/castelli/` - Castelli stellar atmosphere codes and documentation
  - `source_codes/` - Original Fortran (.for) files organized by functionality
  - `documentation/` - HTML documentation and examples
  - `examples/` - Compiled executables and example input files
- `upstream/kurucz/` - Kurucz stellar atmosphere codes and documentation  
  - `source_codes/` - Original Fortran (.for) files (empty directory structure)
  - `documentation/` - Extensive HTML documentation, atomic data, stellar spectra
  - `examples/` - Example files and compiled executables
- `upstream/papers/` - Reference papers and manuals (PDF format)

## Key Legacy Components

### ATLAS Suite Components
The Fortran codebase consists of several interconnected modules:

- **ATLAS9/ATLAS12** - Main stellar atmosphere computation engines
- **SYNTHE** - Synthetic spectrum synthesis
- **ODF** - Opacity Distribution Functions
- **DFSYNTHE** - Detailed opacity synthesis  
- **KAPPA9** - Opacity calculations
- **WIDTH** - Line width calculations
- **Hbeta** - Hydrogen beta line computations

### Critical Documentation
- `upstream/kurucz/documentation/README.md` contains essential guidance on input file archaeology and validation strategies
- HTML documentation in both `castelli/documentation/` and `kurucz/documentation/` provides detailed usage examples
- Reference papers in `upstream/papers/` contain the theoretical background

## Development Strategy

Since this is a legacy modernization project:

1. **No Julia code exists yet** - this will be a ground-up translation
2. **Fortran source analysis** is required to understand algorithms and data structures
3. **Input/output format preservation** is critical for validation against known results
4. **Example files** in upstream directories will be essential for testing

## Validation Requirements

When implementing Julia translations:
- Use example input files from `upstream/*/examples/` to create test cases
- Preserve exact numerical output compatibility with original Fortran codes
- Pay special attention to input file parsing - formats are often underdocumented
- Cross-reference with documentation HTML files for parameter meanings

## Common Development Tasks

Since no Julia infrastructure exists yet, initial development will involve:
- Setting up Julia package structure (Project.toml, src/, test/)
- Analyzing Fortran source code to understand algorithms
- Creating input/output parsers compatible with legacy formats
- Building comprehensive test suites using upstream example data