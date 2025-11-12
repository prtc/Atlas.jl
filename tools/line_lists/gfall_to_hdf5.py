#!/usr/bin/env python3
"""
gfall_to_hdf5.py - Convert Kurucz gfall atomic line lists to HDF5 format

Purpose:
    Converts ASCII gfall format line lists to efficient HDF5 format for:
    - Fast random access by wavelength range
    - Compact storage with compression
    - Easy integration with Julia, Python, R
    - Documented schema for future SYNTHE migration

Input Format:
    Kurucz gfall format (fixed-width ASCII, 160 characters per line)
    Format specification from rgfalllinesnew.for (Castelli SYNTHE)

Output Format:
    HDF5 with datasets:
    - /lines/wavelength       : Float64 (Angstroms, as written in gfall file)
    - /lines/is_air           : Bool (True if wavelength > 200nm, False if vacuum)
    - /lines/log_gf           : Float32 (log10 of oscillator strength)
    - /lines/element_code     : Float32 (e.g., 26.00=Fe I, 26.01=Fe II)
    - /lines/energy_lower     : Float32 (cm^-1, lower level energy)
    - /lines/j_lower          : Float32 (lower level J quantum number)
    - /lines/label_lower      : String (10 chars, lower level label)
    - /lines/energy_upper     : Float32 (cm^-1, upper level energy)
    - /lines/j_upper          : Float32 (upper level J quantum number)
    - /lines/label_upper      : String (10 chars, upper level label)
    - /lines/log_gamma_rad    : Float32 (log10 radiative damping)
    - /lines/log_gamma_stark  : Float32 (log10 Stark damping)
    - /lines/log_gamma_vdw    : Float32 (log10 van der Waals damping)
    - /lines/reference        : String (4 chars, source reference)
    - /lines/iso1_number      : Int16 (first isotope number)
    - /lines/iso1_fraction    : Float32 (log10 fractional abundance)
    - /lines/iso2_number      : Int16 (second isotope number)
    - /lines/iso2_fraction    : Float32 (log10 fractional abundance)
    - /lines/lande_lower      : Float32 (Lande g factor, lower level)
    - /lines/lande_upper      : Float32 (Lande g factor, upper level)
    - /lines/isotope_shift    : Float32 (milliangstroms, 0.001 Å)
    - /metadata/...           : Conversion metadata, git version, timestamps

Usage:
    python gfall_to_hdf5.py input.dat output.h5 [--compress] [--verbose]

    Options:
        --compress    Use gzip compression (level 4, good balance speed/size)
        --verbose     Print progress every 10000 lines
        --validate    Run validation checks on output
        --wl-min      Minimum wavelength in Angstroms (vacuum, optional filter)
        --wl-max      Maximum wavelength in Angstroms (vacuum, optional filter)

Dependencies:
    - h5py (pip install h5py)
    - numpy (pip install numpy)

Author: Claude (Anthropic) for ATLAS.jl archaeology project
Created: 2025-11-11
License: MIT (same as ATLAS.jl project)

References:
    - Kurucz gfall format: http://kurucz.harvard.edu/linelists.html
    - rgfalllinesnew.for: upstream/castelli/source_codes/synthe/rgfalllinesnew.for
    - Deep Dive 09: docs/archaeology/DEEP_DIVES/09_SYNTHE_LINE_ACCUMULATION.md
"""

import sys
import argparse
import struct
from datetime import datetime
from pathlib import Path

try:
    import h5py
    import numpy as np
except ImportError as e:
    print(f"Error: Missing required package: {e}", file=sys.stderr)
    print("Install with: pip install h5py numpy", file=sys.stderr)
    sys.exit(1)


# Format specification from rgfalllinesnew.for:127-128
# FORMAT(F11.4,F7.3,F6.2,F12.3,F5.1,1X,A8,A2,F12.3,F5.1,1X,A8,A2,
#        F6.2,F6.2,F6.2,A4,I2,I2,I3,F6.3,I3,F6.3,A8,A2,A8,A2,2I5,I6,f6.3)

# Field positions (1-indexed to match Fortran, convert to 0-indexed for Python)
FIELD_SPEC = {
    'wavelength':     (0, 11),      # F11.4 - Air wavelength (Å) if > 200nm
    'log_gf':         (11, 18),     # F7.3  - log10(gf)
    'element_code':   (18, 24),     # F6.2  - Element.ion (e.g., 26.00 = Fe I)
    'energy_lower':   (24, 36),     # F12.3 - Lower level energy (cm^-1)
    'j_lower':        (36, 41),     # F5.1  - Lower level J
    'label_lower_1':  (42, 50),     # A8    - Lower level label part 1
    'label_lower_2':  (50, 52),     # A2    - Lower level label part 2
    'energy_upper':   (52, 64),     # F12.3 - Upper level energy (cm^-1)
    'j_upper':        (64, 69),     # F5.1  - Upper level J
    'label_upper_1':  (70, 78),     # A8    - Upper level label part 1
    'label_upper_2':  (78, 80),     # A2    - Upper level label part 2
    'log_gamma_rad':  (80, 86),     # F6.2  - log10(radiative damping)
    'log_gamma_stark':(86, 92),     # F6.2  - log10(Stark damping)
    'log_gamma_vdw':  (92, 98),     # F6.2  - log10(van der Waals damping)
    'reference':      (98, 102),    # A4    - Reference code
    'nlte_lower':     (102, 104),   # I2    - NLTE departure coeff (lower)
    'nlte_upper':     (104, 106),   # I2    - NLTE departure coeff (upper)
    'iso1_number':    (106, 109),   # I3    - Isotope 1 number
    'iso1_fraction':  (109, 115),   # F6.3  - log10(isotope 1 abundance)
    'iso2_number':    (115, 118),   # I3    - Isotope 2 number
    'iso2_fraction':  (118, 124),   # F6.3  - log10(isotope 2 abundance)
    'other1_1':       (124, 132),   # A8    - Hyperfine/Lande g (lower)
    'other1_2':       (132, 134),   # A2    - (continuation)
    'other2_1':       (134, 142),   # A8    - Hyperfine notation
    'other2_2':       (142, 144),   # A2    - (continuation)
    'lande_lower':    (144, 149),   # I5    - Lande g × 1000 (lower)
    'lande_upper':    (149, 154),   # I5    - Lande g × 1000 (upper)
    'isotope_shift':  (154, 160),   # I6    - Isotope shift (milliangstroms)
}

# Optional field (may not be present in all files)
FIELD_SPEC_OPTIONAL = {
    'alpha':          (160, 166),   # F6.3  - Photoionization cross-section
}


def parse_gfall_line(line: str) -> dict:
    """
    Parse a single line from gfall format.

    Args:
        line: 160-character string from gfall file

    Returns:
        Dictionary with parsed fields

    Raises:
        ValueError: If line is malformed or required fields can't be parsed
    """
    if len(line.rstrip('\n')) < 154:
        raise ValueError(f"Line too short ({len(line)} chars, need >= 154)")

    result = {}

    # Parse float fields
    float_fields = [
        'wavelength', 'log_gf', 'element_code', 'energy_lower', 'j_lower',
        'energy_upper', 'j_upper', 'log_gamma_rad', 'log_gamma_stark',
        'log_gamma_vdw', 'iso1_fraction', 'iso2_fraction'
    ]

    # Note: wavelength is as written in file (air if > 200nm, vacuum if <= 200nm)
    # This follows Kurucz convention from rgfalllinesnew.for:16

    for field in float_fields:
        start, end = FIELD_SPEC[field]
        value_str = line[start:end].strip()
        try:
            result[field] = float(value_str) if value_str else 0.0
        except ValueError:
            raise ValueError(f"Cannot parse {field}: '{value_str}' at position {start}-{end}")

    # Parse integer fields
    int_fields = ['iso1_number', 'iso2_number', 'isotope_shift']

    for field in int_fields:
        start, end = FIELD_SPEC[field]
        value_str = line[start:end].strip()
        try:
            result[field] = int(value_str) if value_str else 0
        except ValueError:
            raise ValueError(f"Cannot parse {field}: '{value_str}' at position {start}-{end}")

    # Parse string fields (labels and reference)
    s1, e1 = FIELD_SPEC['label_lower_1']
    s2, e2 = FIELD_SPEC['label_lower_2']
    result['label_lower'] = (line[s1:e1] + line[s2:e2]).rstrip()

    s1, e1 = FIELD_SPEC['label_upper_1']
    s2, e2 = FIELD_SPEC['label_upper_2']
    result['label_upper'] = (line[s1:e1] + line[s2:e2]).rstrip()

    start, end = FIELD_SPEC['reference']
    result['reference'] = line[start:end].strip()

    # Parse Lande g factors (stored as integers × 1000)
    start, end = FIELD_SPEC['lande_lower']
    value_str = line[start:end].strip()
    result['lande_lower'] = int(value_str) / 1000.0 if value_str else 0.0

    start, end = FIELD_SPEC['lande_upper']
    value_str = line[start:end].strip()
    result['lande_upper'] = int(value_str) / 1000.0 if value_str else 0.0

    # Convert isotope shift from milliangstroms to angstroms for convenience
    result['isotope_shift_angstrom'] = result['isotope_shift'] * 0.001

    # Determine if wavelength is air (> 200nm) or vacuum (<= 200nm)
    # From rgfalllinesnew.for:16: "WL IS THE AIR WAVELENGTH IF WL .GT. 200 NM"
    result['is_air'] = abs(result['wavelength']) > 2000.0  # 200 nm = 2000 Å

    # Optional alpha field (photoionization cross-section)
    if len(line.rstrip('\n')) >= 166:
        start, end = FIELD_SPEC_OPTIONAL['alpha']
        value_str = line[start:end].strip()
        result['alpha'] = float(value_str) if value_str else 0.0
    else:
        result['alpha'] = 0.0

    return result


def convert_gfall_to_hdf5(input_path: Path, output_path: Path,
                          compress: bool = False, verbose: bool = False,
                          chunk_size: int = 10000,
                          wl_min: float = None, wl_max: float = None) -> dict:
    """
    Convert gfall format file to HDF5.

    Args:
        input_path: Path to input gfall file
        output_path: Path to output HDF5 file
        compress: Use gzip compression (level 4)
        verbose: Print progress
        chunk_size: Number of lines to read before writing (memory vs speed)
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
        'elements_found': set(),
    }

    # Read all lines first (more efficient for HDF5 writing)
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
                parsed = parse_gfall_line(line)

                # Apply wavelength filter if specified
                wl = parsed['wavelength']
                if wl_min is not None and abs(wl) < wl_min:
                    stats['lines_filtered'] += 1
                    continue
                if wl_max is not None and abs(wl) > wl_max:
                    stats['lines_filtered'] += 1
                    continue

                parsed_lines.append(parsed)

                # Update statistics
                stats['wavelength_min'] = min(stats['wavelength_min'], abs(wl))
                stats['wavelength_max'] = max(stats['wavelength_max'], abs(wl))
                stats['elements_found'].add(parsed['element_code'])

                if verbose and line_num % 10000 == 0:
                    print(f"  Read {line_num} lines...", file=sys.stderr)

            except ValueError as e:
                stats['parse_errors'] += 1
                errors.append((line_num, str(e)))
                if len(errors) <= 10:  # Only keep first 10 errors
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
        'wavelength':        np.array([p['wavelength'] for p in parsed_lines], dtype=np.float64),
        'is_air':            np.array([p['is_air'] for p in parsed_lines], dtype=bool),
        'log_gf':            np.array([p['log_gf'] for p in parsed_lines], dtype=np.float32),
        'element_code':      np.array([p['element_code'] for p in parsed_lines], dtype=np.float32),
        'energy_lower':      np.array([p['energy_lower'] for p in parsed_lines], dtype=np.float32),
        'j_lower':           np.array([p['j_lower'] for p in parsed_lines], dtype=np.float32),
        'energy_upper':      np.array([p['energy_upper'] for p in parsed_lines], dtype=np.float32),
        'j_upper':           np.array([p['j_upper'] for p in parsed_lines], dtype=np.float32),
        'log_gamma_rad':     np.array([p['log_gamma_rad'] for p in parsed_lines], dtype=np.float32),
        'log_gamma_stark':   np.array([p['log_gamma_stark'] for p in parsed_lines], dtype=np.float32),
        'log_gamma_vdw':     np.array([p['log_gamma_vdw'] for p in parsed_lines], dtype=np.float32),
        'iso1_number':       np.array([p['iso1_number'] for p in parsed_lines], dtype=np.int16),
        'iso1_fraction':     np.array([p['iso1_fraction'] for p in parsed_lines], dtype=np.float32),
        'iso2_number':       np.array([p['iso2_number'] for p in parsed_lines], dtype=np.int16),
        'iso2_fraction':     np.array([p['iso2_fraction'] for p in parsed_lines], dtype=np.float32),
        'lande_lower':       np.array([p['lande_lower'] for p in parsed_lines], dtype=np.float32),
        'lande_upper':       np.array([p['lande_upper'] for p in parsed_lines], dtype=np.float32),
        'isotope_shift':     np.array([p['isotope_shift_angstrom'] for p in parsed_lines], dtype=np.float32),
        'alpha':             np.array([p['alpha'] for p in parsed_lines], dtype=np.float32),
    }

    # String arrays (fixed-length)
    data['label_lower'] = np.array([p['label_lower'] for p in parsed_lines], dtype='S10')
    data['label_upper'] = np.array([p['label_upper'] for p in parsed_lines], dtype='S10')
    data['reference'] = np.array([p['reference'] for p in parsed_lines], dtype='S4')

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
                ds.attrs['description'] = 'Wavelength as written in gfall file'
                ds.attrs['note'] = 'Air wavelength if > 200nm, vacuum if <= 200nm (Kurucz convention)'
                ds.attrs['threshold'] = 200.0  # nm
            elif field_name == 'is_air':
                ds.attrs['description'] = 'True if wavelength is air (> 200nm), False if vacuum'
                ds.attrs['threshold'] = 200.0  # nm
                ds.attrs['note'] = 'Kurucz convention: air wavelengths above 200nm'
            elif field_name.startswith('energy_'):
                ds.attrs['unit'] = 'cm^-1'
                ds.attrs['description'] = 'Energy level in wavenumbers'
            elif field_name.startswith('log_gamma_'):
                ds.attrs['unit'] = 'dimensionless'
                ds.attrs['description'] = 'log10 of damping constant'
            elif field_name == 'element_code':
                ds.attrs['description'] = 'Element.ion (e.g., 26.00=Fe I, 26.01=Fe II)'
            elif field_name == 'isotope_shift':
                ds.attrs['unit'] = 'Angstrom'
                ds.attrs['description'] = 'Isotope wavelength shift'

        # Add metadata
        meta_group = f.create_group('metadata')
        meta_group.attrs['format_version'] = '1.0'
        meta_group.attrs['source_format'] = 'Kurucz gfall'
        meta_group.attrs['source_file'] = str(input_path.name)
        meta_group.attrs['conversion_time'] = datetime.now().isoformat()
        meta_group.attrs['converter'] = 'gfall_to_hdf5.py v1.1'
        meta_group.attrs['lines_total'] = n_lines
        meta_group.attrs['wavelength_min'] = float(stats['wavelength_min'])
        meta_group.attrs['wavelength_max'] = float(stats['wavelength_max'])
        meta_group.attrs['elements_count'] = len(stats['elements_found'])
        meta_group.attrs['compressed'] = compress
        meta_group.attrs['wavelength_convention'] = 'Kurucz: air if > 200nm, vacuum if <= 200nm'
        meta_group.attrs['air_vacuum_threshold_nm'] = 200.0

        # Wavelength filtering metadata
        meta_group.attrs['wavelength_filtered'] = (wl_min is not None or wl_max is not None)
        if wl_min is not None:
            meta_group.attrs['wavelength_filter_min_angstrom'] = float(wl_min)
        if wl_max is not None:
            meta_group.attrs['wavelength_filter_max_angstrom'] = float(wl_max)
        if stats['lines_filtered'] > 0:
            meta_group.attrs['lines_filtered_out'] = stats['lines_filtered']

        # Store element codes found
        meta_group.create_dataset('element_codes',
                                 data=sorted(stats['elements_found']))

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
        'wavelength', 'is_air', 'log_gf', 'element_code', 'energy_lower', 'j_lower',
        'label_lower', 'energy_upper', 'j_upper', 'label_upper',
        'log_gamma_rad', 'log_gamma_stark', 'log_gamma_vdw', 'reference'
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

        # Check wavelength ordering (should be approximately sorted)
        wl = f['lines/wavelength'][:]
        is_air = f['lines/is_air'][:]

        # Verify is_air flag consistency
        air_count = np.sum(is_air)
        vac_count = len(is_air) - air_count
        air_threshold_check = np.abs(wl) > 2000.0
        if not np.array_equal(is_air, air_threshold_check):
            print(f"  WARNING: is_air flag inconsistent with 200nm threshold", file=sys.stderr)
        if len(wl) > 1:
            # Allow some disorder (gfall files may have hyperfine multiplets)
            inversions = np.sum(np.diff(wl) < 0)
            disorder_fraction = inversions / len(wl)
            if disorder_fraction > 0.1:  # More than 10% out of order
                print(f"  WARNING: Wavelengths significantly disordered ({disorder_fraction:.1%})",
                      file=sys.stderr)

        if verbose:
            print(f"  ✓ Structure valid", file=sys.stderr)
            print(f"  ✓ {n_lines} lines ({air_count} air, {vac_count} vacuum)", file=sys.stderr)
            print(f"  ✓ Wavelength range: {wl.min():.2f} - {wl.max():.2f} Å", file=sys.stderr)
            print(f"  ✓ All required datasets present", file=sys.stderr)

    return True


def main():
    parser = argparse.ArgumentParser(
        description='Convert Kurucz gfall atomic line lists to HDF5',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
    # Basic conversion
    python gfall_to_hdf5.py gf_tiny.dat gf_tiny.h5

    # With compression and verbose output
    python gfall_to_hdf5.py gf1200.100 gf1200.h5 --compress --verbose

    # With validation
    python gfall_to_hdf5.py gfall.dat gfall.h5 --validate

    # Convert optical range only (3000-10000 Angstroms)
    python gfall_to_hdf5.py gfall.dat gfall_optical.h5 --wl-min 3000 --wl-max 10000

    # Convert UV range only
    python gfall_to_hdf5.py gfall.dat gfall_uv.h5 --wl-min 1000 --wl-max 3000

Output HDF5 structure:
    /lines/wavelength       - Float64, wavelength (Å, air if >200nm, vac if <=200nm)
    /lines/is_air           - Bool, True if air wavelength (>200nm threshold)
    /lines/log_gf           - Float32, log10(oscillator strength)
    /lines/element_code     - Float32, element.ion code
    /lines/energy_lower     - Float32, lower level energy (cm^-1)
    /lines/j_lower          - Float32, lower level J
    /lines/label_lower      - String, lower level label
    ... (see full list in source code)
    /metadata/...           - Conversion metadata, vacuum/air threshold
        """
    )

    parser.add_argument('input', type=Path, help='Input gfall file')
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
        stats = convert_gfall_to_hdf5(
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
        print(f"  Elements: {len(stats['elements_found'])}", file=sys.stderr)

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
