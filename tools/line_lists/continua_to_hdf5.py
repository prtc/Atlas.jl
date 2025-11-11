#!/usr/bin/env python3
"""
continua_to_hdf5.py - Convert Kurucz continua.dat to HDF5 format

Purpose:
    Converts continua.dat (wavelength edges for continuum opacity sampling)
    to HDF5 format for easier integration with modern tools.

Input Format:
    Free-format numbers with element labels (labels are comments, ignored by parser)
    Format specification from xnfpelsyn.for (see Deep Dive 10)

    Auto-detection based on magnitude:
    - EDGE < 10^6:           Wavelength (Å)
    - 10^6 ≤ EDGE < 10^25:   Frequency (Hz)
    - EDGE ≥ 10^25:          Wavenumber × 10^25 (cm^-1)

    Special markers:
    - "SAME": Repeat previous value
    - 0 or blank: End of group

Output Format:
    HDF5 with datasets:
    - /edges/wavelength_angstrom   : Float64 (Å)
    - /edges/frequency_hz          : Float64 (Hz)
    - /edges/wavenumber_cm         : Float32 (cm^-1)
    - /edges/source_element        : String (H, HE, C, etc.)
    - /edges/source_value          : Float64 (original input value)
    - /metadata/...                : Conversion metadata

Usage:
    python continua_to_hdf5.py continua.dat continua.h5 [--verbose]

Dependencies:
    - h5py (pip install h5py)
    - numpy (pip install numpy)

Author: Claude (Anthropic) for ATLAS.jl archaeology project
Created: 2025-11-11
License: MIT (same as ATLAS.jl project)

References:
    - Format spec: upstream/castelli/source_codes/synthe/xnfpelsyn.for:11-1111
    - Deep Dive 10: docs/archaeology/DEEP_DIVES/10_SYNTHE_XNFPELSYN.md (Section 3)
"""

import sys
import argparse
from datetime import datetime
from pathlib import Path
from typing import List, Dict, Optional

try:
    import h5py
    import numpy as np
except ImportError as e:
    print(f"Error: Missing required package: {e}", file=sys.stderr)
    print("Install with: pip install h5py numpy", file=sys.stderr)
    sys.exit(1)


# Physical constants (from xnfpelsyn.for)
C_LIGHT = 2.99792458e17  # Speed of light (Å/s)


def parse_continua_file(input_path: Path, verbose: bool = False) -> List[Dict]:
    """
    Parse continua.dat file.

    Format (from Deep Dive 10):
    - Free-format numbers separated by spaces or commas
    - Element labels (H, HE, C, etc.) are comments, not parsed
    - "SAME" means repeat previous value
    - Numbers auto-detected by magnitude

    Args:
        input_path: Path to continua.dat file
        verbose: Print progress

    Returns:
        List of edge dictionaries
    """
    edges = []
    current_element = "Unknown"
    last_value = 0.0

    if verbose:
        print(f"Reading {input_path}...", file=sys.stderr)

    with open(input_path, 'r') as f:
        for line_num, line in enumerate(f, 1):
            # Skip empty lines
            if not line.strip():
                continue

            # Extract element label (first non-numeric word)
            words = line.split()
            if not words:
                continue

            # Check if first word is element label (non-numeric)
            if words[0].replace('.', '').replace('D', '').replace('E', '').replace('+', '').replace('-', '').isalpha():
                current_element = words[0]
                words = words[1:]  # Remove label from processing

            # Parse numbers (split by commas first)
            for word in words:
                # Split by comma (handles "val1,val2,val3" format)
                subwords = word.split(',')
                for subword in subwords:
                    subword = subword.strip()
                    if not subword:
                        continue

                    # Handle "SAME"
                    if subword.upper() == 'SAME':
                        value = last_value
                    elif subword == '0' or subword == '0.':
                        # End of group marker
                        continue
                    else:
                        # Parse number (Fortran D notation → E notation)
                        subword = subword.replace('D', 'E').replace('d', 'e')
                        try:
                            value = float(subword)
                        except ValueError:
                            if verbose:
                                print(f"  Warning: Cannot parse '{subword}' at line {line_num}", file=sys.stderr)
                            continue

                        if value == 0.0:
                            continue

                    last_value = value

                    # Auto-detect format and convert
                    edge_dict = convert_edge(value, current_element)
                    edges.append(edge_dict)

                    if verbose and len(edges) % 100 == 0:
                        print(f"  Parsed {len(edges)} edges...", file=sys.stderr)

    if verbose:
        print(f"  Total: {len(edges)} edges parsed\n", file=sys.stderr)

    return edges


def convert_edge(value: float, element: str) -> Dict:
    """
    Convert edge value to wavelength, frequency, wavenumber.

    Auto-detection logic from xnfpelsyn.for:174-194:
    - |value| < 1e6:           Wavelength (Å)
    - 1e6 <= |value| < 1e25:   Frequency (Hz)
    - |value| >= 1e25:         Wavenumber × 1e25 (cm^-1)

    Args:
        value: Edge value from file
        element: Element label (for metadata)

    Returns:
        Dictionary with wavelength, frequency, wavenumber
    """
    abs_value = abs(value)

    if abs_value < 1e6:
        # Wavelength in Angstroms
        wavelength = value
        wavenumber = 1e7 / wavelength
        frequency = C_LIGHT / wavelength
        source_type = 'wavelength'

    elif abs_value < 1e25:
        # Frequency in Hz
        frequency = value
        wavelength = C_LIGHT / frequency
        wavenumber = 1e7 / wavelength
        source_type = 'frequency'

    else:
        # Wavenumber × 1e25 (cm^-1)
        wavenumber = value / 1e25
        wavelength = 1e7 / wavenumber
        frequency = C_LIGHT / wavelength
        source_type = 'wavenumber'

    return {
        'wavelength_angstrom': wavelength,
        'frequency_hz': frequency,
        'wavenumber_cm': wavenumber,
        'source_element': element,
        'source_value': value,
        'source_type': source_type
    }


def convert_continua_to_hdf5(input_path: Path, output_path: Path,
                             compress: bool = False, verbose: bool = False) -> Dict:
    """
    Convert continua.dat to HDF5.

    Args:
        input_path: Path to continua.dat
        output_path: Path to output HDF5 file
        compress: Use gzip compression
        verbose: Print progress

    Returns:
        Dictionary with conversion statistics
    """
    # Parse file
    edges = parse_continua_file(input_path, verbose=verbose)

    if len(edges) == 0:
        raise ValueError("No edges parsed!")

    # Extract arrays
    n_edges = len(edges)
    wavelengths = np.array([e['wavelength_angstrom'] for e in edges], dtype=np.float64)
    frequencies = np.array([e['frequency_hz'] for e in edges], dtype=np.float64)
    wavenumbers = np.array([e['wavenumber_cm'] for e in edges], dtype=np.float32)
    elements = np.array([e['source_element'] for e in edges], dtype='S10')
    source_values = np.array([e['source_value'] for e in edges], dtype=np.float64)
    source_types = np.array([e['source_type'] for e in edges], dtype='S12')

    # Statistics
    stats = {
        'edges_total': n_edges,
        'wavelength_min_angstrom': float(wavelengths.min()),
        'wavelength_max_angstrom': float(wavelengths.max()),
        'wavelength_min_nm': float(wavelengths.min() / 10),
        'wavelength_max_nm': float(wavelengths.max() / 10),
        'elements_found': set(e['source_element'] for e in edges),
    }

    # Write HDF5
    if verbose:
        print(f"Writing HDF5 file...", file=sys.stderr)

    compression_opts = {'compression': 'gzip', 'compression_opts': 4} if compress else {}

    with h5py.File(output_path, 'w') as f:
        # Create edges group
        edges_group = f.create_group('edges')

        # Write datasets
        ds_wl = edges_group.create_dataset('wavelength_angstrom', data=wavelengths, **compression_opts)
        ds_wl.attrs['unit'] = 'Angstrom'
        ds_wl.attrs['description'] = 'Wavelength (converted from input)'

        ds_freq = edges_group.create_dataset('frequency_hz', data=frequencies, **compression_opts)
        ds_freq.attrs['unit'] = 'Hz'
        ds_freq.attrs['description'] = 'Frequency'

        ds_wn = edges_group.create_dataset('wavenumber_cm', data=wavenumbers, **compression_opts)
        ds_wn.attrs['unit'] = 'cm^-1'
        ds_wn.attrs['description'] = 'Wavenumber'

        ds_elem = edges_group.create_dataset('source_element', data=elements, **compression_opts)
        ds_elem.attrs['description'] = 'Element label (H, HE, C, etc.)'

        ds_val = edges_group.create_dataset('source_value', data=source_values, **compression_opts)
        ds_val.attrs['description'] = 'Original value from file (before conversion)'

        ds_type = edges_group.create_dataset('source_type', data=source_types, **compression_opts)
        ds_type.attrs['description'] = 'Original format (wavelength, frequency, or wavenumber)'

        # Metadata
        meta_group = f.create_group('metadata')
        meta_group.attrs['format_version'] = '1.0'
        meta_group.attrs['source_format'] = 'Kurucz continua.dat'
        meta_group.attrs['source_file'] = str(input_path.name)
        meta_group.attrs['conversion_time'] = datetime.now().isoformat()
        meta_group.attrs['converter'] = 'continua_to_hdf5.py v1.0'
        meta_group.attrs['edges_total'] = n_edges
        meta_group.attrs['wavelength_min_angstrom'] = stats['wavelength_min_angstrom']
        meta_group.attrs['wavelength_max_angstrom'] = stats['wavelength_max_angstrom']
        meta_group.attrs['wavelength_min_nm'] = stats['wavelength_min_nm']
        meta_group.attrs['wavelength_max_nm'] = stats['wavelength_max_nm']
        meta_group.attrs['compressed'] = compress
        meta_group.attrs['note'] = 'Auto-detection: |val|<1e6=Å, 1e6<=|val|<1e25=Hz, |val|>=1e25=cm^-1×1e25'

        # Store unique elements
        meta_group.create_dataset('elements',
                                 data=sorted(stats['elements_found']))

    return stats


def main():
    parser = argparse.ArgumentParser(
        description='Convert Kurucz continua.dat to HDF5',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
    # Basic conversion
    python continua_to_hdf5.py continua.dat continua.h5

    # With compression and verbose output
    python continua_to_hdf5.py continua.dat continua.h5 --compress --verbose

Format detection (automatic):
    - Value < 1,000,000:                  Wavelength (Å)
    - 1,000,000 ≤ Value < 10^25:          Frequency (Hz)
    - Value ≥ 10^25:                      Wavenumber × 10^25 (cm^-1)

Special markers:
    - "SAME": Repeat previous value
    - 0 or blank: End of group

Output HDF5 structure:
    /edges/wavelength_angstrom  - Float64, wavelength (Å)
    /edges/frequency_hz         - Float64, frequency (Hz)
    /edges/wavenumber_cm        - Float32, wavenumber (cm^-1)
    /edges/source_element       - String, element label
    /edges/source_value         - Float64, original value
    /edges/source_type          - String, original format
    /metadata/...               - Conversion metadata
        """
    )

    parser.add_argument('input', type=Path, help='Input continua.dat file')
    parser.add_argument('output', type=Path, help='Output HDF5 file')
    parser.add_argument('--compress', action='store_true',
                       help='Use gzip compression (level 4)')
    parser.add_argument('--verbose', '-v', action='store_true',
                       help='Print progress information')

    args = parser.parse_args()

    # Check input exists
    if not args.input.exists():
        print(f"Error: Input file not found: {args.input}", file=sys.stderr)
        sys.exit(1)

    # Check output doesn't exist
    if args.output.exists():
        print(f"Error: Output file already exists: {args.output}", file=sys.stderr)
        print(f"Remove it first or choose a different name", file=sys.stderr)
        sys.exit(1)

    try:
        # Convert
        stats = convert_continua_to_hdf5(
            args.input,
            args.output,
            compress=args.compress,
            verbose=args.verbose
        )

        # Report
        print(f"\n✓ Conversion complete:", file=sys.stderr)
        print(f"  Input:  {args.input}", file=sys.stderr)
        print(f"  Output: {args.output}", file=sys.stderr)
        print(f"  Edges:  {stats['edges_total']}", file=sys.stderr)
        print(f"  Range:  {stats['wavelength_min_angstrom']:.2f} - {stats['wavelength_max_angstrom']:.2f} Å", file=sys.stderr)
        print(f"          ({stats['wavelength_min_nm']:.2f} - {stats['wavelength_max_nm']:.2f} nm)", file=sys.stderr)
        print(f"  Elements: {len(stats['elements_found'])}", file=sys.stderr)

        # File size
        size_kb = args.output.stat().st_size / 1024
        print(f"  Size:   {size_kb:.2f} KB", file=sys.stderr)
        print()

    except Exception as e:
        print(f"\nError: {e}", file=sys.stderr)
        import traceback
        if args.verbose:
            traceback.print_exc()
        sys.exit(1)


if __name__ == '__main__':
    main()
