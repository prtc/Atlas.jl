#!/usr/bin/env python3
"""
molecular_partfuncs_to_hdf5.py - Convert Kurucz molecules.dat to HDF5

Converts molecular equilibrium constants and partition functions from Kurucz
molecules.dat format to HDF5 for efficient access.

Format specification from xnfpelsyn.for (fort.2 input):
- Molecule code (e.g., 100.00 = H2, 606.00 = C2, 608.00 = CO)
- D0: Dissociation energy (eV)
- a0, a1, a2, a3, a4: Polynomial coefficients for log(K(T)) or log(Q(T))

Formula: K(T) = exp(D0/(k*T) + a0 + a1*T + a2*T^2 + a3*T^3 + a4*T^4)

Where:
  K(T) = Equilibrium constant or partition function
  T = Temperature (K)
  k = Boltzmann constant = 8.617333e-5 eV/K

Usage:
  python3 molecular_partfuncs_to_hdf5.py molecules.dat molecules.h5 [--compress] [--verbose]

Author: Claude (Anthropic) for Paula's ATLAS.jl code archaeology project
Date: 2025-11-11
"""

import sys
import argparse
from datetime import datetime
from typing import Dict, List, Tuple
import numpy as np

try:
    import h5py
except ImportError:
    print("Error: h5py not installed. Install with: pip install h5py", file=sys.stderr)
    sys.exit(1)

# Molecule code to name mapping (from rmolecasc.for and molecular_linelist_to_hdf5.py)
MOLECULE_NAMES = {
    # Diatomic molecules
    101: 'H2',      102: 'HD',      106: 'CH',      107: 'NH',
    108: 'OH',      109: 'HF',      111: 'MgH',     112: 'CN',
    113: 'AlH',     114: 'SiH',     116: 'SH',      117: 'HCl',
    120: 'CaH',     124: 'TiH',     126: 'FeH',

    # Homonuclear diatomics
    600: 'C',       606: 'C2',      707: 'N2',      708: 'NO',
    800: 'O',       808: 'O2',      900: 'F2',

    # Carbon compounds
    607: 'CN',      608: 'CO',      613: 'CS',      614: 'SiC',
    616: 'SO',

    # Nitrogen compounds
    712: 'NMg',     713: 'AlN',     714: 'SiN',     716: 'NS',

    # Other compounds
    812: 'MgO',     813: 'AlO',     814: 'SiO',     816: 'SO',
    820: 'CaO',     822: 'TiO',     823: 'VO',      826: 'FeO',

    # Metals
    1300: 'Al',     1600: 'S',      1700: 'Cl',     2600: 'Fe',

    # Triatomic molecules
    10100: 'H2+',   10106: 'CH2',   10107: 'NH2',   10108: 'H2O',
    10116: 'H2S',   10606: 'C2H',   10607: 'HCN',   10608: 'HCO',
    10708: 'HNO',   10800: 'H2O',   10808: 'O2H',   10811: 'MgOH',
    10812: 'MgO',   10820: 'CaOH',

    # Polyatomic molecules
    60600: 'C3',    60606: 'C3H',   60608: 'C2OH',  60614: 'SiC2',
    60700: 'C2N',   60808: 'CO2',   60816: 'SO2',   61414: 'Si2C',
    61616: 'S3',    70700: 'N3',    70708: 'N2O',   70808: 'NO2',
    80800: 'O3',    80814: 'SiO2',  80816: 'SO3',

    # Complex molecules
    1010106: 'CH3',     1010107: 'NH3',     1010606: 'C2H2',
    6060707: 'C2N2',    101010106: 'CH4',   101010114: 'SiH4',
}

def parse_molecule_line(line: str) -> Dict:
    """
    Parse a molecule equilibrium data line from molecules.dat.

    Format (free-form with whitespace separation):
      molecule_code  D0  a0  a1  a2  a3  a4  [comments]

    Example:
      100.00  0.756 3.6829E+01 2.4337E-05 1.1141E-08 2.1938E-12 1.5292E-16

    Returns dict with:
      - molecule_code: float (e.g., 106.00 for CH, 606.00 for C2)
      - molecule_code_int: int (e.g., 106 for CH, 606 for C2)
      - ionization: int (e.g., 0 for neutral, 1 for singly ionized)
      - name: str (molecule name, e.g., "CH", "C2", or "UNKNOWN")
      - D0: float (dissociation energy in eV)
      - a0, a1, a2, a3, a4: floats (polynomial coefficients)
    """
    # Skip blank lines and lines without enough data
    line = line.strip()
    if not line or line.startswith('!'):
        return None

    # Split by whitespace and take first 7 fields (ignoring trailing comments)
    parts = line.split()
    if len(parts) < 7:
        return None

    try:
        molecule_code = float(parts[0])
        D0 = float(parts[1])
        a0 = float(parts[2])
        a1 = float(parts[3])
        a2 = float(parts[4])
        a3 = float(parts[5])
        a4 = float(parts[6])
    except ValueError:
        # Skip lines that can't be parsed as floats (headers, comments)
        return None

    # Extract integer molecule code and ionization
    # Format: XXX.YY where XXX is molecule, YY is ionization
    molecule_code_int = int(molecule_code)
    ionization = int(round((molecule_code - molecule_code_int) * 100))

    # Look up molecule name
    name = MOLECULE_NAMES.get(molecule_code_int, f"UNKNOWN_{molecule_code_int}")

    # Add ionization to name if present
    if ionization > 0:
        name = f"{name}+{ionization}" if ionization == 1 else f"{name}+{ionization}"

    return {
        'molecule_code': molecule_code,
        'molecule_code_int': molecule_code_int,
        'ionization': ionization,
        'name': name,
        'D0_eV': D0,
        'a0': a0,
        'a1': a1,
        'a2': a2,
        'a3': a3,
        'a4': a4,
    }

def read_molecules_dat(filepath: str, verbose: bool = False) -> List[Dict]:
    """
    Read all molecule equilibrium data from molecules.dat.

    Returns list of dicts (one per molecule).
    """
    molecules = []

    with open(filepath, 'r') as f:
        for line_num, line in enumerate(f, start=1):
            result = parse_molecule_line(line)
            if result is not None:
                molecules.append(result)
                if verbose:
                    print(f"Line {line_num:3d}: {result['name']:15s} (code={result['molecule_code']:.2f}, D0={result['D0_eV']:.3f} eV)")

    return molecules

def calculate_partition_function(molecule: Dict, T_kelvin: float) -> float:
    """
    Calculate partition function or equilibrium constant at temperature T.

    Formula: K(T) = exp(D0/(k*T) + a0 + a1*T + a2*T^2 + a3*T^3 + a4*T^4)

    Where:
      k = Boltzmann constant = 8.617333e-5 eV/K
      T = Temperature (K)

    Returns K(T) (dimensionless).
    """
    k_eV_per_K = 8.617333e-5  # Boltzmann constant in eV/K

    D0 = molecule['D0_eV']
    a0 = molecule['a0']
    a1 = molecule['a1']
    a2 = molecule['a2']
    a3 = molecule['a3']
    a4 = molecule['a4']

    # Polynomial: a0 + a1*T + a2*T^2 + a3*T^3 + a4*T^4
    poly = a0 + a1*T_kelvin + a2*T_kelvin**2 + a3*T_kelvin**3 + a4*T_kelvin**4

    # Add D0/(k*T) term
    exponent = D0 / (k_eV_per_K * T_kelvin) + poly

    return np.exp(exponent)

def write_hdf5(molecules: List[Dict], output_path: str, input_path: str, compress: bool = False):
    """
    Write molecular equilibrium data to HDF5 file.

    Structure:
      /molecules/
        molecule_code       Float64  Molecule identifier (106.00 = CH, 606.00 = C2)
        molecule_code_int   Int32    Integer part of code (106 = CH, 606 = C2)
        ionization          Int16    Ionization state (0=neutral, 1=singly ionized)
        name                String   Molecule name ("CH", "C2", "CH+", etc.)
        D0_eV               Float32  Dissociation energy (eV)
        a0                  Float32  Coefficient a0
        a1                  Float32  Coefficient a1
        a2                  Float32  Coefficient a2
        a3                  Float32  Coefficient a3
        a4                  Float32  Coefficient a4

      /metadata/
        format_version        "1.0"
        source_format         "Kurucz molecules.dat"
        source_file           Original filename
        conversion_time       ISO8601 timestamp
        molecules_total       Number of molecules
        formula               Equilibrium constant formula
        note                  Usage instructions
    """
    n = len(molecules)

    # Prepare arrays
    molecule_codes = np.array([m['molecule_code'] for m in molecules], dtype=np.float64)
    molecule_codes_int = np.array([m['molecule_code_int'] for m in molecules], dtype=np.int32)
    ionizations = np.array([m['ionization'] for m in molecules], dtype=np.int16)
    names = np.array([m['name'] for m in molecules], dtype=h5py.string_dtype(encoding='utf-8'))
    D0_eV = np.array([m['D0_eV'] for m in molecules], dtype=np.float32)
    a0 = np.array([m['a0'] for m in molecules], dtype=np.float32)
    a1 = np.array([m['a1'] for m in molecules], dtype=np.float32)
    a2 = np.array([m['a2'] for m in molecules], dtype=np.float32)
    a3 = np.array([m['a3'] for m in molecules], dtype=np.float32)
    a4 = np.array([m['a4'] for m in molecules], dtype=np.float32)

    # Create HDF5 file
    with h5py.File(output_path, 'w') as f:
        # Create molecules group
        mol_group = f.create_group('molecules')

        # Compression settings
        kwargs = {'compression': 'gzip', 'compression_opts': 4} if compress else {}

        # Write datasets
        mol_group.create_dataset('molecule_code', data=molecule_codes, **kwargs)
        mol_group.create_dataset('molecule_code_int', data=molecule_codes_int, **kwargs)
        mol_group.create_dataset('ionization', data=ionizations, **kwargs)
        mol_group.create_dataset('name', data=names, **kwargs)
        mol_group.create_dataset('D0_eV', data=D0_eV, **kwargs)
        mol_group.create_dataset('a0', data=a0, **kwargs)
        mol_group.create_dataset('a1', data=a1, **kwargs)
        mol_group.create_dataset('a2', data=a2, **kwargs)
        mol_group.create_dataset('a3', data=a3, **kwargs)
        mol_group.create_dataset('a4', data=a4, **kwargs)

        # Add field descriptions
        mol_group['molecule_code'].attrs['description'] = 'Molecule identifier (e.g., 106.00 = CH, 606.00 = C2)'
        mol_group['molecule_code'].attrs['units'] = 'dimensionless'

        mol_group['molecule_code_int'].attrs['description'] = 'Integer part of molecule code'
        mol_group['molecule_code_int'].attrs['units'] = 'dimensionless'

        mol_group['ionization'].attrs['description'] = 'Ionization state (0=neutral, 1=+1, etc.)'
        mol_group['ionization'].attrs['units'] = 'dimensionless'

        mol_group['name'].attrs['description'] = 'Molecule name (e.g., "CH", "C2", "CH+")'

        mol_group['D0_eV'].attrs['description'] = 'Dissociation energy'
        mol_group['D0_eV'].attrs['units'] = 'eV'

        mol_group['a0'].attrs['description'] = 'Polynomial coefficient a0'
        mol_group['a0'].attrs['units'] = 'dimensionless'

        mol_group['a1'].attrs['description'] = 'Polynomial coefficient a1'
        mol_group['a1'].attrs['units'] = 'K^-1'

        mol_group['a2'].attrs['description'] = 'Polynomial coefficient a2'
        mol_group['a2'].attrs['units'] = 'K^-2'

        mol_group['a3'].attrs['description'] = 'Polynomial coefficient a3'
        mol_group['a3'].attrs['units'] = 'K^-3'

        mol_group['a4'].attrs['description'] = 'Polynomial coefficient a4'
        mol_group['a4'].attrs['units'] = 'K^-4'

        # Create metadata group
        meta_group = f.create_group('metadata')
        meta_group.attrs['format_version'] = '1.0'
        meta_group.attrs['source_format'] = 'Kurucz molecules.dat'
        meta_group.attrs['source_file'] = input_path
        meta_group.attrs['conversion_time'] = datetime.utcnow().isoformat() + 'Z'
        meta_group.attrs['molecules_total'] = n
        meta_group.attrs['compressed'] = compress

        # Formula documentation
        meta_group.attrs['formula'] = 'K(T) = exp(D0/(k*T) + a0 + a1*T + a2*T^2 + a3*T^3 + a4*T^4)'
        meta_group.attrs['k_Boltzmann_eV_per_K'] = 8.617333e-5
        meta_group.attrs['T_units'] = 'Kelvin'
        meta_group.attrs['K_description'] = 'Equilibrium constant or partition function (dimensionless)'

        meta_group.attrs['note'] = ('K(T) can be equilibrium constant for molecular formation '
                                     '(e.g., 2H ⇌ H2) or partition function depending on molecule. '
                                     'See xnfpelsyn.for for usage context.')

        # Add example temperatures for reference
        T_examples = np.array([1000, 2000, 3000, 4000, 5000, 6000, 8000, 10000, 15000, 20000], dtype=np.float32)
        meta_group.create_dataset('T_examples_K', data=T_examples, **kwargs)
        meta_group['T_examples_K'].attrs['description'] = 'Example temperatures for testing K(T) calculation'
        meta_group['T_examples_K'].attrs['units'] = 'K'

def main():
    parser = argparse.ArgumentParser(
        description='Convert Kurucz molecules.dat to HDF5 format',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Basic conversion
  python3 molecular_partfuncs_to_hdf5.py molecules.dat molecules.h5

  # With compression and verbose output
  python3 molecular_partfuncs_to_hdf5.py molecules.dat molecules.h5 --compress --verbose

  # Show what would be converted
  python3 molecular_partfuncs_to_hdf5.py molecules.dat /dev/null --verbose

Input format (molecules.dat):
  molecule_code  D0_eV  a0  a1  a2  a3  a4  [comments]

  Where K(T) = exp(D0/(k*T) + a0 + a1*T + a2*T^2 + a3*T^3 + a4*T^4)

Output format (HDF5):
  /molecules/ - Datasets for molecule_code, name, D0_eV, a0-a4
  /metadata/  - Conversion info, formula documentation
        """
    )

    parser.add_argument('input', help='Input molecules.dat file')
    parser.add_argument('output', help='Output HDF5 file')
    parser.add_argument('--compress', action='store_true', help='Enable gzip compression (level 4)')
    parser.add_argument('--verbose', '-v', action='store_true', help='Print detailed progress')

    args = parser.parse_args()

    # Read molecules.dat
    if args.verbose:
        print(f"Reading {args.input}...")

    molecules = read_molecules_dat(args.input, verbose=args.verbose)

    if len(molecules) == 0:
        print(f"Error: No molecular data found in {args.input}", file=sys.stderr)
        sys.exit(1)

    # Write HDF5
    if args.verbose:
        print(f"\nWriting {args.output}...")
        print(f"  Molecules: {len(molecules)}")
        print(f"  Compression: {'enabled (gzip level 4)' if args.compress else 'disabled'}")

    write_hdf5(molecules, args.output, args.input, compress=args.compress)

    # Summary statistics
    import os
    file_size = os.path.getsize(args.output)

    # Find molecule name range
    names = [m['name'] for m in molecules]
    unique_molecules = len(set([m['molecule_code_int'] for m in molecules]))

    print(f"\n✓ Conversion complete:")
    print(f"  Input:  {args.input}")
    print(f"  Output: {args.output}")
    print(f"  Molecules: {len(molecules)} (codes: {unique_molecules} unique base molecules)")
    print(f"  Examples: {', '.join(sorted(set(names))[:10])}, ...")
    print(f"  Size:   {file_size / 1024:.2f} KB")

    # Show formula
    print(f"\n  Formula: K(T) = exp(D0/(k*T) + a0 + a1*T + a2*T^2 + a3*T^3 + a4*T^4)")
    print(f"  Where:   k = 8.617333×10⁻⁵ eV/K, T in Kelvin")

if __name__ == '__main__':
    main()
