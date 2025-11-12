#!/usr/bin/env python3
"""
molecular_to_hdf5.py - Convert Kurucz molecular line lists to HDF5 format

Purpose:
    Converts ASCII molecular line list format (CH, OH, NH, etc.) to HDF5 for:
    - Fast random access by wavelength range
    - Compact storage with compression
    - Easy integration with Julia, Python, R
    - Documented schema for future SYNTHE migration

Input Format:
    Kurucz molecular line format (fixed-width ASCII, 68 characters per line)
    Format specification from rmolecasc.for (Castelli SYNTHE)

Output Format:
    HDF5 with datasets (similar to gfall_to_hdf5.py but simplified):
    - /lines/wavelength       : Float64 (Angstroms, vacuum wavelength)
    - /lines/log_gf           : Float32 (log10 of oscillator strength)
    - /lines/j_lower          : Float32 (lower level J quantum number)
    - /lines/energy_lower     : Float32 (cm^-1, lower level energy)
    - /lines/j_upper          : Float32 (upper level J quantum number)
    - /lines/energy_upper     : Float32 (cm^-1, upper level energy)
    - /lines/molecule_code    : Int16   (e.g., 106=CH, 606=C2, 607=CN)
    - /lines/label_lower      : String  (8 chars, lower level label)
    - /lines/label_upper      : String  (8 chars, upper level label)
    - /lines/isotope          : Int16   (isotope number, 12=12C, 13=13C, etc.)
    - /lines/log_gamma_rad    : Float32 (log10 radiative damping, from LOGGR/100)
    - /metadata/...           : Conversion metadata, molecule info

Usage:
    python molecular_to_hdf5.py input.asc output.h5 [--compress] [--verbose]

    Options:
        --compress    Use gzip compression (level 4, good balance speed/size)
        --verbose     Print progress every 10000 lines
        --validate    Run validation checks on output

Dependencies:
    - h5py (pip install h5py)
    - numpy (pip install numpy)

Author: Claude (Anthropic) for ATLAS.jl archaeology project
Created: 2025-11-11
License: MIT (same as ATLAS.jl project)

References:
    - Kurucz molecular format: http://kurucz.harvard.edu/molecules.html
    - rmolecasc.for: upstream/castelli/source_codes/synthe/rmolecasc.for:105
    - Deep Dive 09: docs/archaeology/DEEP_DIVES/09_SYNTHE_LINE_ACCUMULATION.md
"""

import sys
import argparse
from datetime import datetime
from pathlib import Path

try:
    import h5py
    import numpy as np
except ImportError as e:
    print(f"Error: Missing required package: {e}", file=sys.stderr)
    print("Install with: pip install h5py numpy", file=sys.stderr)
    sys.exit(1)


# Format specification from rmolecasc.for:105
# FORMAT(F10.4,F7.3,F5.1,F10.3,F5.1,F11.3,I4,A8,A8,I2,I4)

FIELD_SPEC = {
    'wavelength':     (0, 10),      # F10.4 - Vacuum wavelength (Å)
    'log_gf':         (10, 17),     # F7.3  - log10(gf)
    'j_lower':        (17, 22),     # F5.1  - Lower level J
    'energy_lower':   (22, 32),     # F10.3 - Lower level energy (cm^-1)
    'j_upper':        (32, 37),     # F5.1  - Upper level J
    'energy_upper':   (37, 48),     # F11.3 - Upper level energy (cm^-1)
    'molecule_code':  (48, 52),     # I4    - Molecule code
    'label_lower':    (52, 60),     # A8    - Lower level label
    'label_upper':    (60, 68),     # A8    - Upper level label
    'isotope':        (68, 70),     # I2    - Isotope number (12, 13, etc.)
    'log_gamma_rad_int': (70, 74),  # I4    - log10(gamma_rad) × 100 (integer)
}

# Molecule code to name mapping (from rmolecasc.for)
MOLECULE_NAMES = {
    101: 'H2',      102: 'HD',
    106: 'CH',      107: 'NH',      108: 'OH',      112: 'CN',
    606: 'C2',      607: 'CN',      608: 'CO',
    614: 'N2',      707: 'N2+',
    808: 'O2',      814: 'NO',      822: 'MgO',
    2020: 'CaH',    2222: 'TiO',    2401: 'CrH',
    2608: 'SiO',    2614: 'SiN',    2626: 'SiS',
    2814: 'FeO',    2828: 'FeH',
}


def parse_molecular_line(line: str) -> dict:
    """
    Parse a single line from molecular line list format.

    Args:
        line: 74-character string from molecular file

    Returns:
        Dictionary with parsed fields

    Raises:
        ValueError: If line is malformed or required fields can't be parsed
    """
    if len(line.rstrip('\n')) < 68:
        raise ValueError(f"Line too short ({len(line)} chars, need >= 68)")

    result = {}

    # Parse float fields
    float_fields = ['wavelength', 'log_gf', 'j_lower', 'energy_lower',
                    'j_upper', 'energy_upper']

    for field in float_fields:
        start, end = FIELD_SPEC[field]
        value_str = line[start:end].strip()
        try:
            result[field] = float(value_str) if value_str else 0.0
        except ValueError:
            raise ValueError(f"Cannot parse {field}: '{value_str}' at position {start}-{end}")

    # Parse molecule code
    start, end = FIELD_SPEC['molecule_code']
    value_str = line[start:end].strip()
    try:
        result['molecule_code'] = int(value_str) if value_str else 0
    except ValueError:
        raise ValueError(f"Cannot parse molecule_code: '{value_str}'")

    # Parse string fields (labels)
    start, end = FIELD_SPEC['label_lower']
    result['label_lower'] = line[start:end].rstrip()

    start, end = FIELD_SPEC['label_upper']
    result['label_upper'] = line[start:end].rstrip()

    # Parse isotope (may not be present in all files)
    if len(line.rstrip('\n')) >= 70:
        start, end = FIELD_SPEC['isotope']
        value_str = line[start:end].strip()
        result['isotope'] = int(value_str) if value_str else 0
    else:
        result['isotope'] = 0

    # Parse log_gamma_rad (stored as integer × 100)
    # From rmolecasc.for:529: GAMMAR=10.**(LOGGR*.01)
    if len(line.rstrip('\n')) >= 74:
        start, end = FIELD_SPEC['log_gamma_rad_int']
        value_str = line[start:end].strip()
        loggr_int = int(value_str) if value_str else 0
        result['log_gamma_rad'] = loggr_int * 0.01  # Convert to float
    else:
        result['log_gamma_rad'] = 0.0

    # Lookup molecule name (for metadata)
    result['molecule_name'] = MOLECULE_NAMES.get(result['molecule_code'], 'Unknown')

    return result


def convert_molecular_to_hdf5(input_path: Path, output_path: Path,
                              compress: bool = False, verbose: bool = False,
                              wl_min: float = None, wl_max: float = None) -> dict:
    """
    Convert molecular line list file to HDF5.

    Args:
        input_path: Path to input molecular line file
        output_path: Path to output HDF5 file
        compress: Use gzip compression (level 4)
        verbose: Print progress
        wl_min: Minimum wavelength in Angstroms (vacuum, optional filter)
        wl_max: Maximum wavelength in Angstroms (vacuum, optional filter)

    Returns:
        Dictionary with conversion statistics
    """
    stats = {
        'lines_read': 0,
        'lines_written': 0,
        'lines_filtered': 0,
        'parse_errors': 0,
        'wavelength_min': float('inf'),
        'wavelength_max': float('-inf'),
        'molecules_found': set(),
        'isotopes_found': set(),
    }

    # Read all lines first
    if verbose:
        print(f"Reading {input_path}...", file=sys.stderr)
        if wl_min is not None or wl_max is not None:
            wl_range = f"{wl_min or 'none'}-{wl_max or 'none'} Å"
            print(f"  Wavelength filter: {wl_range}", file=sys.stderr)

    parsed_lines = []
    errors = []

    with open(input_path, 'r') as f:
        for line_num, line in enumerate(f, 1):
            stats['lines_read'] += 1

            try:
                parsed = parse_molecular_line(line)

                # Apply wavelength filter if specified
                wl = abs(parsed['wavelength'])  # May be negative in some formats
                if wl_min is not None and wl < wl_min:
                    stats['lines_filtered'] += 1
                    continue
                if wl_max is not None and wl > wl_max:
                    stats['lines_filtered'] += 1
                    continue

                parsed_lines.append(parsed)

                # Update statistics
                stats['wavelength_min'] = min(stats['wavelength_min'], wl)
                stats['wavelength_max'] = max(stats['wavelength_max'], wl)
                stats['molecules_found'].add(parsed['molecule_code'])
                if parsed['isotope'] > 0:
                    stats['isotopes_found'].add(parsed['isotope'])

                if verbose and line_num % 10000 == 0:
                    print(f"  Read {line_num} lines...", file=sys.stderr)

            except ValueError as e:
                stats['parse_errors'] += 1
                errors.append((line_num, str(e)))
                if len(errors) <= 10:
                    if verbose:
                        print(f"  Warning: Line {line_num}: {e}", file=sys.stderr)

    if stats['parse_errors'] > 0:
        print(f"\nWarning: Skipped {stats['parse_errors']} malformed lines", file=sys.stderr)
        if len(errors) > 10:
            print(f"  (showing first 10 errors only)", file=sys.stderr)

    if len(parsed_lines) == 0:
        raise ValueError("No valid lines parsed!")

    # Convert to numpy arrays for HDF5
    if verbose:
        print(f"\nConverting {len(parsed_lines)} lines to HDF5...", file=sys.stderr)

    n_lines = len(parsed_lines)

    # Create arrays for each field
    data = {
        'wavelength':      np.array([abs(p['wavelength']) for p in parsed_lines], dtype=np.float64),
        'log_gf':          np.array([p['log_gf'] for p in parsed_lines], dtype=np.float32),
        'j_lower':         np.array([p['j_lower'] for p in parsed_lines], dtype=np.float32),
        'energy_lower':    np.array([p['energy_lower'] for p in parsed_lines], dtype=np.float32),
        'j_upper':         np.array([p['j_upper'] for p in parsed_lines], dtype=np.float32),
        'energy_upper':    np.array([p['energy_upper'] for p in parsed_lines], dtype=np.float32),
        'molecule_code':   np.array([p['molecule_code'] for p in parsed_lines], dtype=np.int16),
        'isotope':         np.array([p['isotope'] for p in parsed_lines], dtype=np.int16),
        'log_gamma_rad':   np.array([p['log_gamma_rad'] for p in parsed_lines], dtype=np.float32),
    }

    # String arrays (fixed-length)
    data['label_lower'] = np.array([p['label_lower'] for p in parsed_lines], dtype='S8')
    data['label_upper'] = np.array([p['label_upper'] for p in parsed_lines], dtype='S8')

    # Determine predominant molecule (for metadata)
    molecule_counts = {}
    for p in parsed_lines:
        code = p['molecule_code']
        molecule_counts[code] = molecule_counts.get(code, 0) + 1
    predominant_molecule = max(molecule_counts, key=molecule_counts.get)
    predominant_name = MOLECULE_NAMES.get(predominant_molecule, 'Unknown')

    # Write HDF5 file
    compression_opts = {'compression': 'gzip', 'compression_opts': 4} if compress else {}

    with h5py.File(output_path, 'w') as f:
        # Create main dataset group
        lines_group = f.create_group('lines')

        # Write all datasets
        for field_name, field_data in data.items():
            if verbose:
                print(f"  Writing {field_name}...", file=sys.stderr)

            ds = lines_group.create_dataset(
                field_name,
                data=field_data,
                **compression_opts
            )

            # Add field-specific attributes
            if field_name == 'wavelength':
                ds.attrs['unit'] = 'Angstrom'
                ds.attrs['description'] = 'Vacuum wavelength'
                ds.attrs['note'] = 'Absolute value (negative wavelengths indicate specific isotopes in some formats)'
            elif field_name.startswith('energy_'):
                ds.attrs['unit'] = 'cm^-1'
                ds.attrs['description'] = 'Energy level in wavenumbers'
            elif field_name == 'molecule_code':
                ds.attrs['description'] = 'Molecule identifier (e.g., 106=CH, 608=CO)'
                ds.attrs['note'] = 'See MOLECULE_NAMES dict in source code for full mapping'
            elif field_name == 'isotope':
                ds.attrs['description'] = 'Isotope number (12=12C, 13=13C, 14=14N, etc.)'
            elif field_name == 'log_gamma_rad':
                ds.attrs['unit'] = 'dimensionless'
                ds.attrs['description'] = 'log10(radiative damping constant)'
                ds.attrs['note'] = 'Computed from LOGGR integer field: log_gamma_rad = LOGGR * 0.01'

        # Add metadata
        meta_group = f.create_group('metadata')
        meta_group.attrs['format_version'] = '1.0'
        meta_group.attrs['source_format'] = 'Kurucz molecular'
        meta_group.attrs['source_file'] = str(input_path.name)
        meta_group.attrs['conversion_time'] = datetime.now().isoformat()
        meta_group.attrs['converter'] = 'molecular_linelist_to_hdf5.py v1.1'
        meta_group.attrs['lines_total'] = n_lines
        meta_group.attrs['wavelength_min'] = float(stats['wavelength_min'])
        meta_group.attrs['wavelength_max'] = float(stats['wavelength_max'])
        meta_group.attrs['molecules_count'] = len(stats['molecules_found'])
        meta_group.attrs['predominant_molecule'] = predominant_name
        meta_group.attrs['predominant_code'] = int(predominant_molecule)
        meta_group.attrs['compressed'] = compress

        # Wavelength filtering metadata
        meta_group.attrs['wavelength_filtered'] = (wl_min is not None or wl_max is not None)
        if wl_min is not None:
            meta_group.attrs['wavelength_filter_min_angstrom'] = float(wl_min)
        if wl_max is not None:
            meta_group.attrs['wavelength_filter_max_angstrom'] = float(wl_max)
        if stats['lines_filtered'] > 0:
            meta_group.attrs['lines_filtered_out'] = stats['lines_filtered']

        # Store molecule codes and names found
        mol_codes = sorted(stats['molecules_found'])
        mol_names = [MOLECULE_NAMES.get(code, 'Unknown') for code in mol_codes]
        meta_group.create_dataset('molecule_codes', data=mol_codes)
        meta_group.create_dataset('molecule_names',
                                 data=np.array(mol_names, dtype='S20'))

        # Store isotopes found
        if stats['isotopes_found']:
            meta_group.create_dataset('isotopes',
                                     data=sorted(stats['isotopes_found']))

    stats['lines_written'] = n_lines

    return stats


def validate_hdf5(path: Path, verbose: bool = False) -> bool:
    """
    Validate HDF5 file structure and data integrity.

    Args:
        path: Path to HDF5 file
        verbose: Print validation details

    Returns:
        True if validation passes
    """
    if verbose:
        print(f"\nValidating {path}...", file=sys.stderr)

    required_datasets = [
        'wavelength', 'log_gf', 'j_lower', 'energy_lower',
        'j_upper', 'energy_upper', 'molecule_code', 'label_lower',
        'label_upper', 'isotope', 'log_gamma_rad'
    ]

    with h5py.File(path, 'r') as f:
        # Check structure
        if 'lines' not in f:
            print("  ERROR: Missing /lines group", file=sys.stderr)
            return False

        if 'metadata' not in f:
            print("  ERROR: Missing /metadata group", file=sys.stderr)
            return False

        # Check required datasets
        for ds_name in required_datasets:
            if ds_name not in f['lines']:
                print(f"  ERROR: Missing dataset /lines/{ds_name}", file=sys.stderr)
                return False

        # Check data consistency
        n_lines = len(f['lines/wavelength'])
        for ds_name in required_datasets:
            if len(f[f'lines/{ds_name}']) != n_lines:
                print(f"  ERROR: Dataset {ds_name} has wrong length", file=sys.stderr)
                return False

        # Check wavelength ordering
        wl = f['lines/wavelength'][:]
        if len(wl) > 1:
            inversions = np.sum(np.diff(wl) < 0)
            disorder_fraction = inversions / len(wl)
            if disorder_fraction > 0.1:
                print(f"  WARNING: Wavelengths significantly disordered ({disorder_fraction:.1%})",
                      file=sys.stderr)

        if verbose:
            mol_code = f['lines/molecule_code'][:]
            unique_mols = np.unique(mol_code)

            print(f"  ✓ Structure valid", file=sys.stderr)
            print(f"  ✓ {n_lines} lines", file=sys.stderr)
            print(f"  ✓ Wavelength range: {wl.min():.2f} - {wl.max():.2f} Å", file=sys.stderr)
            print(f"  ✓ Molecules: {len(unique_mols)} ({', '.join(str(m) for m in unique_mols)})", file=sys.stderr)
            print(f"  ✓ All required datasets present", file=sys.stderr)

    return True


def main():
    parser = argparse.ArgumentParser(
        description='Convert Kurucz molecular line lists to HDF5',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
    # Basic conversion
    python molecular_linelist_to_hdf5.py chbx.asc chbx.h5

    # With compression and verbose output
    python molecular_linelist_to_hdf5.py chbx.asc chbx.h5 --compress --verbose

    # With validation
    python molecular_linelist_to_hdf5.py chbx.asc chbx.h5 --validate

    # Convert optical range only (3000-10000 Angstroms)
    python molecular_linelist_to_hdf5.py chbx.asc chbx_optical.h5 --wl-min 3000 --wl-max 10000

Supported molecules (by code):
    106: CH     607: CN     608: CO
    606: C2     107: NH     108: OH
    101: H2     102: HD     814: NO
    2222: TiO   2608: SiO   2828: FeH
    ... and more (see MOLECULE_NAMES in source)

Output HDF5 structure:
    /lines/wavelength       - Float64, vacuum wavelength (Å)
    /lines/log_gf           - Float32, log10(oscillator strength)
    /lines/molecule_code    - Int16, molecule identifier
    /lines/isotope          - Int16, isotope number
    ... (see full list in source code)
    /metadata/...           - Conversion metadata, molecule info
        """
    )

    parser.add_argument('input', type=Path, help='Input molecular line file (.asc)')
    parser.add_argument('output', type=Path, help='Output HDF5 file')
    parser.add_argument('--compress', action='store_true',
                       help='Use gzip compression (level 4)')
    parser.add_argument('--verbose', '-v', action='store_true',
                       help='Print progress information')
    parser.add_argument('--validate', action='store_true',
                       help='Validate HDF5 file after creation')
    parser.add_argument('--wl-min', type=float, default=None,
                       help='Minimum wavelength in Angstroms (vacuum, optional filter)')
    parser.add_argument('--wl-max', type=float, default=None,
                       help='Maximum wavelength in Angstroms (vacuum, optional filter)')

    args = parser.parse_args()

    # Check input file exists
    if not args.input.exists():
        print(f"Error: Input file not found: {args.input}", file=sys.stderr)
        sys.exit(1)

    # Check output doesn't exist (safety)
    if args.output.exists():
        print(f"Error: Output file already exists: {args.output}", file=sys.stderr)
        print(f"Remove it first or choose a different name", file=sys.stderr)
        sys.exit(1)

    try:
        # Convert
        stats = convert_molecular_to_hdf5(
            args.input,
            args.output,
            compress=args.compress,
            verbose=args.verbose,
            wl_min=args.wl_min,
            wl_max=args.wl_max
        )

        # Report
        print(f"\n✓ Conversion complete:", file=sys.stderr)
        print(f"  Input:  {args.input}", file=sys.stderr)
        print(f"  Output: {args.output}", file=sys.stderr)
        print(f"  Lines:  {stats['lines_written']} written, {stats['parse_errors']} errors", file=sys.stderr)
        if stats['lines_filtered'] > 0:
            print(f"  Filtered: {stats['lines_filtered']} lines outside wavelength range", file=sys.stderr)
        print(f"  Range:  {stats['wavelength_min']:.2f} - {stats['wavelength_max']:.2f} Å", file=sys.stderr)
        print(f"  Molecules: {len(stats['molecules_found'])}", file=sys.stderr)

        # File size
        size_mb = args.output.stat().st_size / (1024 * 1024)
        print(f"  Size:   {size_mb:.2f} MB", file=sys.stderr)

        # Validate if requested
        if args.validate:
            if validate_hdf5(args.output, verbose=args.verbose):
                print("\n✓ Validation passed", file=sys.stderr)
            else:
                print("\n✗ Validation failed", file=sys.stderr)
                sys.exit(1)

    except Exception as e:
        print(f"\nError: {e}", file=sys.stderr)
        import traceback
        if args.verbose:
            traceback.print_exc()
        sys.exit(1)


if __name__ == '__main__':
    main()
