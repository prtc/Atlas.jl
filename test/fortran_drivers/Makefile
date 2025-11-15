# Makefile for Fortran Reference Data Generators
# Author: Claude (AI Assistant)
# Date: 2025-11-15

# Fortran compiler
FC = gfortran
FFLAGS = -std=legacy -O2

# Paths to Kurucz source code
ATLAS12 = ../../upstream/kurucz/source_codes/programs/atlas12/atlas12.for
ATLAS7V = ../../upstream/kurucz/source_codes/programs/SYNTHE/atlas7v.for

# Output directory for CSV files
REF_DIR = ../reference

# Executables
EXES = test_voigt test_hminus test_pops

# CSV output files
CSVS = voigt_fortran.csv hminus_fortran.csv populations_fortran.csv

.PHONY: all clean run reference help

# Default target
all: $(EXES)

# Compile Voigt driver
test_voigt: test_voigt.f
	@echo "Compiling test_voigt..."
	$(FC) $(FFLAGS) -o test_voigt test_voigt.f $(ATLAS12)
	@echo "Done: test_voigt"

# Compile H⁻ opacity driver
test_hminus: test_hminus.f
	@echo "Compiling test_hminus..."
	$(FC) $(FFLAGS) -o test_hminus test_hminus.f $(ATLAS7V)
	@echo "Done: test_hminus"

# Compile populations driver
test_pops: test_pops.f
	@echo "Compiling test_pops..."
	$(FC) $(FFLAGS) -o test_pops test_pops.f $(ATLAS7V)
	@echo "Done: test_pops"

# Run all drivers
run: $(EXES)
	@echo "Running test_voigt..."
	./test_voigt
	@echo ""
	@echo "Running test_hminus..."
	./test_hminus
	@echo ""
	@echo "Running test_pops..."
	./test_pops
	@echo ""
	@echo "All reference data generated!"
	@ls -lh $(CSVS)

# Move CSV files to reference directory
reference: run
	@echo "Moving CSV files to $(REF_DIR)/"
	@mkdir -p $(REF_DIR)
	@mv $(CSVS) $(REF_DIR)/
	@echo "Reference data ready in $(REF_DIR)/"
	@ls -lh $(REF_DIR)/*.csv

# Clean executables and CSV files
clean:
	@echo "Cleaning up..."
	@rm -f $(EXES) $(CSVS)
	@echo "Clean complete"

# Help target
help:
	@echo "Atlas.jl Fortran Reference Data Generator"
	@echo ""
	@echo "Targets:"
	@echo "  make all        - Compile all drivers"
	@echo "  make run        - Run all drivers and generate CSV files"
	@echo "  make reference  - Compile, run, and move CSVs to ../reference/"
	@echo "  make clean      - Remove executables and CSV files"
	@echo "  make help       - Show this help message"
	@echo ""
	@echo "Individual targets:"
	@echo "  make test_voigt    - Compile Voigt driver only"
	@echo "  make test_hminus   - Compile H⁻ opacity driver only"
	@echo "  make test_pops     - Compile populations driver only"
	@echo ""
	@echo "Requirements:"
	@echo "  - gfortran compiler"
	@echo "  - Kurucz source code in ../../upstream/kurucz/source_codes/"
	@echo ""
	@echo "Usage example:"
	@echo "  make reference    # Full workflow"
