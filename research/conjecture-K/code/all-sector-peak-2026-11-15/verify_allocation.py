#!/usr/bin/env python3
"""Future Phase-B replay of the conditional scalar allocation, codex-91d4.

This proves only the scalar implication conditional on (P), its content
inputs, and the NEW averaged odd premise. It proves none of those inputs.
It has not been run during the Phase-A preparation.
"""
import sys
if not __debug__ or sys.flags.optimize:
    raise SystemExit('Assertions required; reject -O/-OO')
sys.dont_write_bytecode = True
from pathlib import Path
from fractions import Fraction as Q
import argparse
import hashlib
import importlib.util
import json

HERE = Path(__file__).resolve().parent
CHECKER = HERE / 'inputs' / 'coupled_budget_check.py'
CANDIDATES = HERE / 'inputs' / 'coupled_budget_multipliers.json'
EXPECTED = {
    CHECKER: 'f1855fd5aa8aea9e9e3b82ee6b63d8fed1e295fef012d641700b01592dcf0490',
    CANDIDATES: '54715d0969614267b7c866fbf8d255c53edda4133fe8eca24f3a15ebffe0d4f8',
}


def verify():
    for path, digest in EXPECTED.items():
        assert hashlib.sha256(path.read_bytes()).hexdigest() == digest, path.name
    spec = importlib.util.spec_from_file_location('frozen_coupled_budget', CHECKER)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    inherited = module.verify(CANDIDATES)
    row = inherited['cases'][0]
    assert tuple(Q(row[k]) for k in ('x', 'y', 'odd_eta', 'scalar_strict_cap')) == (
        Q(0), Q(1, 100), Q(1, 20000), Q(49, 1000000))
    assert Q(row['worst_upper_exact']) < Q(row['scalar_strict_cap'])
    # The new premise supplies sigma-D_minus explicitly. In the exact
    # assembly, -D-D_minus=-D_plus, so no remote-error surcharge is used.
    total = Q(row['scalar_strict_cap']) + Q(row['odd_eta'])
    assert total == Q(99, 1000000) < Q(1, 10000)
    return {
        'Agent-ID': 'codex-91d4',
        'issue': 436,
        'status': 'PASS EXACT CONDITIONAL ALLOCATION SCALAR IMPLICATION',
        'AB_pointwise_premise_proved': False,
        'averaged_odd_premise_proved': False,
        'new_content_theorem_proved': False,
        'main_ceded_U_squared': '1/100',
        'odd_eta': '1/20000',
        'scalar_strict_cap': row['scalar_strict_cap'],
        'scalar_worst_upper_exact': row['worst_upper_exact'],
        'new_total_strict_cap': str(total),
        'reserve_below_1e_4': str(Q(1, 10000)-total),
        'remote_error_surcharge': '0',
        'reason': 'New odd premise includes sigma-D_minus; -D-D_minus=-D_plus.',
        'source_sha256': {str(p.relative_to(HERE)): h for p, h in EXPECTED.items()},
    }


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', type=Path)
    args = parser.parse_args()
    body = json.dumps(verify(), indent=2) + '\n'
    if args.output:
        args.output.write_text(body)
    print(body, end='')
