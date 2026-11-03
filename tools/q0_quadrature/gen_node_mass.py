#!/usr/bin/env python3
"""Generate a conservative rational Gauss-node mass candidate.

Agent-ID: codex-aa04. This is arithmetic data, not a proof that the inputs
are the actual Gauss nodes and weights; those enclosures need Lean proofs.
"""
from fractions import Fraction as Q
from pathlib import Path
import hashlib
import json
import sys

ROOT = Path(__file__).resolve().parents[2]
DATA = ROOT / 'data/q0_quadrature/gauss_mass'
PANEL = DATA / 'panels_N601_Q64_cap1e20.json'
RULE = DATA / 'gauss_rules_certified.json'
OUT = DATA / 'rounded_node_mass.json'
EXPECTED = {
    PANEL: '59a4f5fda639d83959a55a3a85e355c4f233312ea65d349e502761ae38a34e1d',
    RULE: '1c3d217d0fe21f998a513d4272b57320d5b7caa60a76aa4b1dc7861179e219a1',
}
NODE_D, WEIGHT_D, TERM_D, POWER = 10**9, 10**12, 10**18, 16

def ceil(q):
    return -(-q.numerator // q.denominator)

def generate():
    for path, expected in EXPECTED.items():
        assert hashlib.sha256(path.read_bytes()).hexdigest() == expected, path
    panels = json.loads(PANEL.read_bytes())['panels']
    rules = json.loads(RULE.read_bytes())['rules']
    records = []
    for pi, panel in enumerate(panels):
        lo, hi = Q(panel['lo']), Q(panel['hi'])
        assert 0 <= lo < hi
        half = (hi-lo)/2
        for ri, rule in enumerate(rules[str(panel['order'])]):
            node_lo = lo + half*(1 + Q(rule['node_lower']))
            weight_hi = half*Q(rule['weight_upper'])
            n = (node_lo*NODE_D).__floor__()
            w = ceil(weight_hi*WEIGHT_D)
            assert n >= 0 and weight_hi > 0
            ratio = Q(POWER*NODE_D, POWER*NODE_D+n)**POWER
            term = ceil(Q(w, WEIGHT_D)*ratio*TERM_D)
            records.append([pi, ri, n, w, term])
    total = sum(r[4] for r in records)
    assert len(panels) == 1289 and len(records) == 21577
    assert total*100 < 107*TERM_D
    payload = {'agent': 'codex-aa04', 'note': 'Arithmetic candidate, not a Lean proof of actual nodes or weights.',
        'input_sha256': {p.name: h for p, h in EXPECTED.items()},
        'node_denominator': NODE_D, 'weight_denominator': WEIGHT_D,
        'term_denominator': TERM_D, 'power': POWER,
        'fields': ['panel_index', 'rule_index', 'node_lower', 'weight_upper', 'term_upper'],
        'term_sum_upper': total, 'records': records}
    return (json.dumps(payload, separators=(',', ':'), sort_keys=True)+'\n').encode()

if __name__ == '__main__':
    result = generate()
    if sys.argv[1:] == ['--check']:
        assert OUT.read_bytes() == result
    elif not sys.argv[1:]:
        OUT.write_bytes(result)
    else:
        raise SystemExit('usage: gen_node_mass.py [--check]')
    print(f'{OUT}: {len(result)} bytes, sha256 {hashlib.sha256(result).hexdigest()}')
