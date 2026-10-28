#!/usr/bin/env python3
"""Replay the genuine obstruction and auxiliary uniform-row certificates."""
import argparse
import os
from pathlib import Path
import subprocess
import sys


def main():
    base = Path(__file__).resolve().parent
    tools = base if (base/'verify_finite_cubic_obstruction.py').exists() else base/'tools'
    root = tools.parent
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--inputs', type=Path, required=True,
                   help='Archived genuine-cubic bundle inputs/ directory')
    p.add_argument('--data', type=Path, required=True,
                   help='Archived genuine-cubic bundle data/ directory; see research/response_geometry_inputs/README.md')
    p.add_argument('--logs', type=Path, default=root/'logs'/'genuine-cubic')
    a = p.parse_args()
    inputs, data, logs = a.inputs.resolve(), a.data.resolve(), a.logs.resolve()
    source = ['--audit', str(inputs/'binding-audit.json'), '--law',
        str(inputs/'radial-complete-7234-exact.json'), '--profiles', str(inputs/'row-profiles.json')]
    jobs = [
        ('finite-obstruction', ['verify_finite_cubic_obstruction.py']),
        ('row-compiler', ['compile_joint_priced_row.py', str(tools/'joint_fibre_upper_7234.json')]+source+
            ['--out', str(logs/'compiled-row.json')]),
        ('replacement-law', ['verify_radial_countermodel.py', str(data/'replacement-joint.law.json')]),
        ('replacement-response', ['verify_joint_fibre_response.py', str(data/'replacement-joint.response.json'),
            '--audit', str(inputs/'binding-audit.json'), '--law', str(data/'replacement-joint.law.json'),
            '--profiles', str(inputs/'row-profiles.json')]),
        ('uniform-polynomials', ['extract_uniform_fibre_polynomials.py', str(tools/'joint_fibre_upper_7234.json')]+source+
            ['--moments', str(tools/'joint_fibre_moments_1600_256.json'), '--node-certificate',
             str(tools/'joint_uniform_nodes_7234.json'), '--out', str(logs/'uniform-polynomials.json')]),
    ]
    required = [inputs/name for name in ['binding-audit.json',
        'radial-complete-7234-exact.json', 'row-profiles.json']]
    required += [data/name for name in ['replacement-joint.law.json',
                                      'replacement-joint.response.json']]
    required += [tools/command[0] for _, command in jobs]
    required += [tools/name for name in ['verify_diffuse_cubic_limit.py',
        'joint_fibre_upper_7234.json', 'joint_fibre_moments_1600_256.json',
        'joint_uniform_nodes_7234.json']]
    missing = [str(path) for path in required if not path.is_file()]
    if missing:
        p.error('Missing archived replay inputs or tools:\n  '+ '\n  '.join(missing)+
                '\nUse the saved genuine-cubic-obstruction-20261023 bundle; see research/response_geometry_inputs/README.md.')
    logs.mkdir(parents=True, exist_ok=True)
    env = dict(os.environ, OPENBLAS_NUM_THREADS='1', PYTHONDONTWRITEBYTECODE='1')
    for name, command in jobs:
        command[0] = str(tools/command[0])
        logfile = logs/(name+'.txt')
        with logfile.open('w') as out:
            result = subprocess.run([sys.executable, '-I']+command, stdout=out,
                stderr=subprocess.STDOUT, env=env)
        if result.returncode:
            sys.exit(f'{name}: FAIL (exit {result.returncode}); see {logfile}')
        print(name+': PASS', flush=True)
    print('ALL COMPUTATIONAL CHECKS PASS. Analytic closure/finite-bridge proof and Lean audits have separate stated scopes.')


if __name__ == '__main__':
    main()
