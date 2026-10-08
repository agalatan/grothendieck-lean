#!/usr/bin/env python3
"""Full local reproduction of the improved complex lower-bound certificate.

Requires standard Python, a C++17 compiler named g++, and the SHA-256 pinned
upstream check_complex_lower.py. No optimizer or numerical Python package
is needed for verification. Read research-note.md for the analytic inputs.
"""

if not __debug__:
    raise RuntimeError('Assertions are proof gates; do not use Python -O or -OO.')

import argparse, subprocess, sys
from pathlib import Path
from replay_physical import verify

def main():
    assert __debug__, 'Never run this verifier with python -O'
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--source',type=Path,required=True)
    parser.add_argument('--workdir',type=Path,required=True)
    args=parser.parse_args()
    source=args.source.resolve()
    here=Path(__file__).resolve().parent
    verify(source,args.workdir.resolve())
    for name in ('certify_cubic_constants.py','certify_quadrature_rho.py'):
        subprocess.run([sys.executable,str(here/name)],check=True)
    subprocess.run([sys.executable,str(here/'verify_refinement.py'),
        '--source',str(source)],check=True)
    print('FULL REFINEMENT VERIFICATION PASSED: K_G^C > 1.40020018',flush=True)

if __name__ == '__main__':
    main()
