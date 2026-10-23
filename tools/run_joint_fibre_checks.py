#!/usr/bin/env python3
"""Replay the saved joint-fibre certificates; discovery solvers are not used."""
import argparse
import os
from pathlib import Path
import subprocess
import sys


def main():
    base = Path(__file__).resolve().parent
    tools = base if (base/'verify_joint_fibre_upper.py').exists() else base/'tools'
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--inputs', type=Path, required=True,
                   help='Archived joint-fibre bundle inputs/ directory; see research/response_geometry_inputs/README.md')
    p.add_argument('--logs', type=Path, default=tools.parent/'logs'/'joint-fibre')
    a = p.parse_args()
    a.inputs, a.logs = a.inputs.resolve(), a.logs.resolve()
    audit = ['--audit', str(a.inputs/'binding-audit.json')]
    source = audit+['--law', str(a.inputs/'radial-complete-7234-exact.json'),
                    '--profiles', str(a.inputs/'row-profiles.json')]
    jobs = [
        ('projector', ['verify_projection_gate_ceiling.py']+audit+
         ['--out', str(a.logs/'projector-controls.json')]),
        ('algebra', ['verify_joint_fibre_algebra.py', '--inputs', str(a.inputs),
         '--output', str(a.logs/'algebra-controls.json')]),
        ('moments', ['verify_joint_fibre_moments.py', str(tools/'joint_fibre_moments_1600_256.json')]),
        ('primal', ['verify_joint_fibre_response.py', str(tools/'joint_fibre_response_7234.json')]+source),
        ('baseline', ['verify_joint_fibre_baseline.py', str(tools/'joint_fibre_baseline_7234.json')]+source),
        ('upper', ['verify_joint_fibre_upper.py', str(tools/'joint_fibre_upper_7234.json')]+source),
        ('negative-controls', ['check_joint_certificate_controls.py', '--certificate',
          str(tools/'joint_fibre_response_7234.json')]+source),
    ]
    required = [a.inputs/name for name in ['binding-audit.json', 'row-profiles.json']+
                [f'radial-complete-{i}-exact.json' for i in [7234, 5661, 1247, 8701]]]
    required += [tools/command[0] for _, command in jobs]
    required += [tools/name for name in ['joint_fibre_moments_1600_256.json',
        'joint_fibre_response_7234.json', 'joint_fibre_baseline_7234.json',
        'joint_fibre_upper_7234.json']]
    missing = [str(path) for path in required if not path.is_file()]
    if missing:
        p.error('Missing archived replay inputs or tools:\n  '+ '\n  '.join(missing)+
                '\nUse the saved joint-fibre-20261023 bundle; see research/response_geometry_inputs/README.md.')
    a.logs.mkdir(parents=True, exist_ok=True)
    env = dict(os.environ, OPENBLAS_NUM_THREADS='1', PYTHONDONTWRITEBYTECODE='1')
    for name, command in jobs:
        command[0] = str(tools/command[0])
        logfile = a.logs/(name+'.txt')
        with logfile.open('w') as out:
            result = subprocess.run([sys.executable, '-I']+command, stdout=out,
                                    stderr=subprocess.STDOUT, env=env)
        if result.returncode:
            sys.exit(f'{name}: FAIL (exit {result.returncode}); see {logfile}')
        print(name+': PASS', flush=True)
    print('ALL SAVED COMPUTATIONAL CERTIFICATES PASS. Lean compilation is a separate repository check.')


if __name__ == '__main__':
    main()
