#!/usr/bin/env python3
"""
line_query.py - Query tool for HDF5 line lists

Purpose:
    Interactive command-line tool to query atomic and molecular line lists
    stored in HDF5 format (created by gfall_to_hdf5.py or molecular_to_hdf5.py).

Features:
    - Query by wavelength range
    - Filter by element/molecule/ion
    - Export results to CSV, JSON, or ASCII table
    - Display statistics and histograms
    - Fast queries using HDF5 slicing

Usage:
    # Show file info
    python line_query.py input.h5 --info

    # Query wavelength range
    python line_query.py input.h5 --wavelength 5000 5100

    # Filter by element (Fe I)
    python line_query.py input.h5 --wavelength 5000 5100 --element 26.00

    # Export to CSV
    python line_query.py input.h5 --wavelength 5000 5100 --output lines.csv

    # Show statistics
    python line_query.py input.h5 --stats

Author: Claude (Anthropic) for ATLAS.jl archaeology project
Created: 2025-11-11
License: MIT (same as ATLAS.jl project)
"""

import sys
import argparse
import json
from pathlib import Path
from typing import Optional, List, Dict, Any

try:
    import h5py
    import numpy as np
except ImportError as e:
    print(f"Error: Missing required package: {e}", file=sys.stderr)
    print("Install with: pip install h5py numpy", file=sys.stderr)
    sys.exit(1)


def detect_file_type(h5file: h5py.File) -> str:
    """
    Detect if HDF5 file is atomic or molecular line list.

    Returns:
        'atomic' or 'molecular'
    """
    if 'element_code' in h5file['lines']:
        return 'atomic'
    elif 'molecule_code' in h5file['lines']:
        return 'molecular'
    else:
        raise ValueError("Unknown HDF5 format (neither atomic nor molecular)")


def show_info(h5_path: Path, verbose: bool = False):
    """
    Display information about HDF5 line list file.
    """
    with h5py.File(h5_path, 'r') as f:
        file_type = detect_file_type(f)

        print(f"\n{'='*60}")
        print(f"HDF5 Line List: {h5_path.name}")
        print(f"{'='*60}")

        # Metadata
        print("\nMetadata:")
        for key, val in sorted(f['metadata'].attrs.items()):
            print(f"  {key:30s} {val}")

        # Datasets
        print("\nDatasets:")
        for name in sorted(f['lines'].keys()):
            ds = f['lines'][name]
            dtype_str = str(ds.dtype)
            print(f"  {name:25s} {dtype_str:15s} shape={ds.shape}")

        # File-specific info
        if file_type == 'atomic':
            elem_codes = f['metadata/element_codes'][:]
            print(f"\nAtomic line list: {len(elem_codes)} unique elements")
            if verbose:
                print(f"  Elements: {', '.join(f'{e:.2f}' for e in elem_codes[:20])}", end='')
                if len(elem_codes) > 20:
                    print(f" ... ({len(elem_codes) - 20} more)")
                else:
                    print()

            # Check vacuum/air status
            if 'is_air' in f['lines']:
                is_air = f['lines/is_air'][:]
                n_air = np.sum(is_air)
                n_vac = len(is_air) - n_air
                print(f"  Air wavelengths (>200nm): {n_air}")
                print(f"  Vacuum wavelengths (<=200nm): {n_vac}")

        elif file_type == 'molecular':
            mol_codes = f['metadata/molecule_codes'][:]
            mol_names = f['metadata/molecule_names'][:]
            print(f"\nMolecular line list: {len(mol_codes)} molecules")
            if verbose:
                for code, name in zip(mol_codes, mol_names):
                    name_str = name.decode('utf-8') if isinstance(name, bytes) else name
                    print(f"  {code:4d}: {name_str}")

            if 'isotopes' in f['metadata']:
                isotopes = f['metadata/isotopes'][:]
                print(f"  Isotopes: {', '.join(str(i) for i in isotopes)}")

        print(f"\n{'='*60}\n")


def query_lines(h5_path: Path,
                wavelength_min: Optional[float] = None,
                wavelength_max: Optional[float] = None,
                element: Optional[float] = None,
                molecule: Optional[int] = None,
                limit: Optional[int] = None) -> Dict[str, np.ndarray]:
    """
    Query lines from HDF5 file with filters.

    Args:
        h5_path: Path to HDF5 file
        wavelength_min: Minimum wavelength (Å)
        wavelength_max: Maximum wavelength (Å)
        element: Element code (e.g., 26.00 for Fe I)
        molecule: Molecule code (e.g., 106 for CH)
        limit: Maximum number of lines to return

    Returns:
        Dictionary of arrays with query results
    """
    with h5py.File(h5_path, 'r') as f:
        file_type = detect_file_type(f)

        # Read wavelengths
        wl = f['lines/wavelength'][:]

        # Build mask
        mask = np.ones(len(wl), dtype=bool)

        # Wavelength filter
        if wavelength_min is not None:
            mask &= (wl >= wavelength_min)
        if wavelength_max is not None:
            mask &= (wl <= wavelength_max)

        # Element/molecule filter
        if file_type == 'atomic' and element is not None:
            elem_codes = f['lines/element_code'][:]
            mask &= (elem_codes == element)
        elif file_type == 'molecular' and molecule is not None:
            mol_codes = f['lines/molecule_code'][:]
            mask &= (mol_codes == molecule)

        # Apply limit
        if limit is not None:
            indices = np.where(mask)[0][:limit]
            mask = np.zeros(len(wl), dtype=bool)
            mask[indices] = True

        # Extract data for matching lines
        results = {}
        for name in f['lines'].keys():
            results[name] = f[f'lines/{name}'][mask]

        results['file_type'] = file_type

        return results


def export_csv(results: Dict[str, np.ndarray], output_path: Path):
    """
    Export query results to CSV file.
    """
    import csv

    # Determine columns
    columns = [k for k in results.keys() if k != 'file_type']
    n_lines = len(results[columns[0]])

    with open(output_path, 'w', newline='') as f:
        writer = csv.writer(f)

        # Header
        writer.writerow(columns)

        # Data rows
        for i in range(n_lines):
            row = []
            for col in columns:
                val = results[col][i]
                # Decode bytes to string
                if isinstance(val, bytes):
                    val = val.decode('utf-8')
                row.append(val)
            writer.writerow(row)

    print(f"Exported {n_lines} lines to {output_path}")


def export_json(results: Dict[str, np.ndarray], output_path: Path):
    """
    Export query results to JSON file.
    """
    # Convert to JSON-serializable format
    data = {
        'file_type': results.get('file_type', 'unknown'),
        'n_lines': len(results[next(k for k in results.keys() if k != 'file_type')]),
        'lines': {}
    }

    for key, arr in results.items():
        if key == 'file_type':
            continue

        # Convert numpy arrays to lists
        if arr.dtype.kind == 'S':  # String type
            data['lines'][key] = [val.decode('utf-8') if isinstance(val, bytes) else val
                                  for val in arr.tolist()]
        elif arr.dtype == bool:
            data['lines'][key] = [bool(val) for val in arr.tolist()]
        else:
            data['lines'][key] = arr.tolist()

    with open(output_path, 'w') as f:
        json.dump(data, f, indent=2)

    print(f"Exported {data['n_lines']} lines to {output_path}")


def print_table(results: Dict[str, np.ndarray], limit: int = 20):
    """
    Print query results as ASCII table.
    """
    file_type = results.get('file_type', 'unknown')

    # Determine which columns to show
    if file_type == 'atomic':
        cols = ['wavelength', 'log_gf', 'element_code', 'energy_lower', 'energy_upper']
        if 'is_air' in results:
            cols.insert(1, 'is_air')
    elif file_type == 'molecular':
        cols = ['wavelength', 'log_gf', 'molecule_code', 'isotope', 'energy_lower', 'energy_upper']
    else:
        # Show first 5 columns
        cols = [k for k in results.keys() if k != 'file_type'][:5]

    n_lines = len(results[cols[0]])

    # Print header
    print(f"\nQuery Results: {n_lines} lines")
    if n_lines > limit:
        print(f"(showing first {limit})")
    print()

    # Column headers
    header = "  ".join(f"{col:15s}" for col in cols)
    print(header)
    print("-" * len(header))

    # Data rows
    for i in range(min(n_lines, limit)):
        row = []
        for col in cols:
            val = results[col][i]

            if isinstance(val, bytes):
                val_str = val.decode('utf-8')
                row.append(f"{val_str:15s}")
            elif isinstance(val, (bool, np.bool_)):
                val_str = 'T' if val else 'F'
                row.append(f"{val_str:15s}")
            elif isinstance(val, (int, np.integer)):
                row.append(f"{val:15d}")
            elif isinstance(val, (float, np.floating)):
                row.append(f"{val:15.4f}")
            else:
                row.append(f"{str(val):15s}")

        print("  ".join(row))

    if n_lines > limit:
        print(f"\n... ({n_lines - limit} more lines)")
    print()


def show_stats(h5_path: Path):
    """
    Display statistics about line list.
    """
    with h5py.File(h5_path, 'r') as f:
        file_type = detect_file_type(f)

        print(f"\n{'='*60}")
        print(f"Statistics: {h5_path.name}")
        print(f"{'='*60}\n")

        # Wavelength statistics
        wl = f['lines/wavelength'][:]
        print("Wavelength:")
        print(f"  Count:  {len(wl)}")
        print(f"  Min:    {wl.min():.2f} Å ({wl.min()/10:.2f} nm)")
        print(f"  Max:    {wl.max():.2f} Å ({wl.max()/10:.2f} nm)")
        print(f"  Mean:   {wl.mean():.2f} Å")
        print(f"  Median: {np.median(wl):.2f} Å")

        # log(gf) statistics
        loggf = f['lines/log_gf'][:]
        print("\nlog(gf):")
        print(f"  Min:    {loggf.min():.3f}")
        print(f"  Max:    {loggf.max():.3f}")
        print(f"  Mean:   {loggf.mean():.3f}")
        print(f"  Median: {np.median(loggf):.3f}")

        # Element/molecule statistics
        if file_type == 'atomic':
            elem = f['lines/element_code'][:]
            unique_elem, counts = np.unique(elem, return_counts=True)
            print(f"\nElements: {len(unique_elem)} unique")
            print("  Top 10 by line count:")
            sorted_idx = np.argsort(counts)[::-1][:10]
            for idx in sorted_idx:
                print(f"    {unique_elem[idx]:6.2f}: {counts[idx]:6d} lines")

        elif file_type == 'molecular':
            mol = f['lines/molecule_code'][:]
            unique_mol, counts = np.unique(mol, return_counts=True)
            print(f"\nMolecules: {len(unique_mol)} unique")
            for m, c in zip(unique_mol, counts):
                print(f"  Code {m:4d}: {c:6d} lines")

        print(f"\n{'='*60}\n")


def main():
    parser = argparse.ArgumentParser(
        description='Query HDF5 line lists created by gfall_to_hdf5.py or molecular_to_hdf5.py',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
    # Show file information
    python line_query.py gf_tiny.h5 --info

    # Query wavelength range
    python line_query.py gf_tiny.h5 --wavelength 402 403

    # Query with element filter (Fe I = 26.00)
    python line_query.py gfall.h5 --wavelength 5000 5100 --element 26.00

    # Export to CSV
    python line_query.py gfall.h5 --wavelength 5000 5100 --output subset.csv

    # Show statistics
    python line_query.py gf_tiny.h5 --stats

    # Limit results
    python line_query.py gfall.h5 --wavelength 5000 6000 --limit 100
        """
    )

    parser.add_argument('input', type=Path, help='Input HDF5 file')
    parser.add_argument('--info', action='store_true',
                       help='Show file information and exit')
    parser.add_argument('--stats', action='store_true',
                       help='Show statistics and exit')
    parser.add_argument('--wavelength', type=float, nargs=2, metavar=('MIN', 'MAX'),
                       help='Wavelength range in Angstroms')
    parser.add_argument('--element', type=float,
                       help='Element code (e.g., 26.00 for Fe I, 26.01 for Fe II)')
    parser.add_argument('--molecule', type=int,
                       help='Molecule code (e.g., 106 for CH, 608 for CO)')
    parser.add_argument('--limit', type=int,
                       help='Maximum number of lines to return')
    parser.add_argument('--output', '-o', type=Path,
                       help='Output file (.csv or .json)')
    parser.add_argument('--verbose', '-v', action='store_true',
                       help='Verbose output')

    args = parser.parse_args()

    # Check input exists
    if not args.input.exists():
        print(f"Error: Input file not found: {args.input}", file=sys.stderr)
        sys.exit(1)

    try:
        # Info mode
        if args.info:
            show_info(args.input, verbose=args.verbose)
            return

        # Stats mode
        if args.stats:
            show_stats(args.input)
            return

        # Query mode
        if args.wavelength or args.element or args.molecule or args.limit:
            wl_min, wl_max = args.wavelength if args.wavelength else (None, None)

            results = query_lines(
                args.input,
                wavelength_min=wl_min,
                wavelength_max=wl_max,
                element=args.element,
                molecule=args.molecule,
                limit=args.limit
            )

            # Export or print
            if args.output:
                if args.output.suffix == '.csv':
                    export_csv(results, args.output)
                elif args.output.suffix == '.json':
                    export_json(results, args.output)
                else:
                    print(f"Error: Unknown output format: {args.output.suffix}", file=sys.stderr)
                    print("Supported: .csv, .json", file=sys.stderr)
                    sys.exit(1)
            else:
                print_table(results, limit=args.limit or 20)
        else:
            # No operation specified, show info by default
            show_info(args.input, verbose=args.verbose)

    except Exception as e:
        print(f"\nError: {e}", file=sys.stderr)
        import traceback
        if args.verbose:
            traceback.print_exc()
        sys.exit(1)


if __name__ == '__main__':
    main()
