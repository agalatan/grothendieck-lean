#!/usr/bin/env python3
"""Replay a delivered response-lift bundle; no numerical optimizer needed."""
import argparse
import copy
from fractions import Fraction as Q
import json
from pathlib import Path
import subprocess
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
from response_lift_model import check_completion, verify_banks, energy


def corruption_controls(root):
    base = json.loads((root/'response-lift-completions.json').read_text())['results'][0]
    messages = []
    for label, path in [('fixed projection changed', ('h', 'm', 0)),
                        ('gate target not matched', ('k', 'b', 1)),
                        ('unobserved companion violates energy', ('h', 'm', 2))]:
        row = copy.deepcopy(base)
        a, b, j = path
        row[a][b][j] = str(Q(row[a][b][j])+(100 if j == 2 else Q(1, 1000)))
        try:
            check_completion(row)
        except ValueError as e:
            messages.append('PASS rejected '+label+': '+str(e))
        else:
            raise ArithmeticError('Corruption accepted: '+label)
    v = {'m': [Q(21, 25), -Q(21, 50), Q(0)], 'b': [Q(0)]*5, 'n': [Q(0)]*3}
    if not energy(v) < 1:
        raise ArithmeticError('The matrix control should pass coefficient energy')
    try:
        verify_banks(v, 1)
    except ValueError as e:
        messages.append('PASS rejected Parseval-feasible noncontractive block: '+str(e))
    else:
        raise ArithmeticError('Matrix corruption accepted')
    return '\n'.join(messages)+'\n'


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--root', type=Path, required=True, help='Extracted bundle root')
    p.add_argument('--interval-python', default=sys.executable,
                   help='Python with python-flint 0.9.0 installed')
    args = p.parse_args()
    root = args.root.resolve()
    (root/'logs').mkdir(exist_ok=True)
    jobs = [
        ('finite-exact', sys.executable, 'verify_response_lift.py',
         ['response-lift-completions.json', '--audit', 'inputs/binding-audit.json']),
        ('independent-banks', sys.executable, 'verify_response_lift_banks.py', []),
        ('independent-controls', sys.executable, 'verify_response_completion_controls.py',
         ['tools/response_completion_controls.json']),
        ('support-5661', args.interval_python, 'verify_abstract_response_support.py',
         ['tools/abstract_response_support_5661.json', '--audit', 'inputs/binding-audit.json',
          '--law', 'inputs/radial-complete-5661-exact.json']),
        ('realization-7234', args.interval_python, 'verify_abstract_response_realization.py',
         ['tools/abstract_response_realization_7234.json', '--audit', 'inputs/binding-audit.json',
          '--law', 'inputs/radial-complete-7234-exact.json'])]
    for label, python, script, arguments in jobs:
        result = subprocess.run([python, '-I', str(root/'tools'/script)]+arguments,
                                cwd=root, capture_output=True, text=True)
        (root/'logs'/(label+'.txt')).write_text(result.stdout+result.stderr)
        if result.returncode:
            raise RuntimeError(label+' failed: '+result.stderr)
        print('PASS '+label, flush=True)
    (root/'logs/corruption-controls.txt').write_text(corruption_controls(root))
    print('PASS four corruption controls; no endpoint claimed.')


if __name__ == '__main__':
    main()
