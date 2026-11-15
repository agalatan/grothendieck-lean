#!/usr/bin/env python3
"""Exact zero-core P-axis and retained d-axis costs.

Agent-ID: codex-a7c4. Refs #400.
Run python3 -I sector_axis_costs.py; optional --write-result saves JSON.
Reuses the audited rational interval library, not its stored output.
"""
from fractions import Fraction as F
from pathlib import Path
import argparse
import hashlib
import importlib.util
import json
import sys

if not __debug__:
    raise RuntimeError('Do not disable assertions with -O.')
sys.dont_write_bytecode = True
source = Path(__file__).resolve().parents[1] / 'audit-2026-11-15-codex-a7c4' / 'odd_cost_check.py'
spec = importlib.util.spec_from_file_location('audited_odd_intervals', source)
old = importlib.util.module_from_spec(spec)
spec.loader.exec_module(old)


def axis_costs(eps, ell, b):
    _, j1, j2, j3 = old.radial_integrals(ell - 2*b, b)
    p = 1/eps
    i = j3-4*j2+4*j1
    k = j2-2*j1
    p_cost = p-F(13, 20)*j1
    d_cost = p-i/2+k*k/(2*(1+j1))
    return p_cost, d_cost, k/(1+j1)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write-result', action='store_true')
    args = parser.parse_args()
    # Circular average majorant: the residual quadratic after squaring
    # sqrt(1+x-x/[2(1+x)]) <= 1+alpha*x has coefficients below.
    # Positive leading coefficient and negative discriminant certify it.
    alpha = F(13,40)
    qa, qb, qc = alpha**2, alpha**2+2*alpha-1, 2*alpha-F(1,2)
    assert qa > 0 and qb**2-4*qa*qc < 0
    rows = {
        'peak': (F(1891,2500),F(1057,1250),F(179,1250)),
        'flank': (F(149,200),F(4267,5000),F(1467,10000)),
        'upper': (F(1891,2500),F(877,1000),F(19,125)),
        'box_endpoint_b_3_25': (F(19,25),F(19,25),F(3,25)),
        'box_endpoint_b_4_25': (F(19,25),F(19,25),F(4,25)),
    }
    intervals = {name: axis_costs(*profile) for name, profile in rows.items()}
    left_p,left_d,_ = intervals['box_endpoint_b_3_25']
    right_p,right_d,_ = intervals['box_endpoint_b_4_25']
    assert right_p.hi < left_p.lo
    assert right_d.hi < left_d.lo
    assert right_p.lo > F(41,100)
    assert right_d.lo > F(39242,100000)
    # The old explicit raw-Q gain survives optimizing the retained multiplier.
    tau, a = F(1,100), F(11,25)
    corner_k1, _ = old.costs(F(19,25),F(19,25),F(4,25))
    assert corner_k1.hi < -F(381,5000)
    raw_gain = tau**2*F(381,5000)-F(9,4)*tau**4/a**3
    residual_loss = F(9,4)*tau**6/a**6
    retained_gain = raw_gain-residual_loss
    assert residual_loss < F(32,10**11)
    assert retained_gain > F(7,10**6)
    result = {
        'agent_id': 'codex-a7c4',
        'status': 'PASS; exact rational arithmetic',
        'scope': 'Zero-core P-axis and retained odd-sector bounds; no nonzero-even-core assembly.',
        'interval_library_sha256': hashlib.sha256(source.read_bytes()).hexdigest(),
        'rows': {name: {'epsilon':str(rows[name][0]),'ell':str(rows[name][1]),'beta':str(rows[name][2]),
                        'P_axis_certified_cost': data[0].enclosure(),
                        'retained_d_axis_sharp_cost': data[1].enclosure(),
                        'optimal_linear_majorant_tilt': data[2].enclosure()}
                 for name,data in intervals.items()},
        'uniform_P_axis_safe_cost': '41/100',
        'uniform_retained_d_axis_sharp_cost': right_d.enclosure(),
        'corner_retained_Q_gain_strict_lower': str(retained_gain),
        'corner_retained_multiplier_loss_upper': str(residual_loss),
    }
    output = json.dumps(result,indent=2,sort_keys=True)+'\n'
    if args.write_result:
        Path(__file__).with_name('sector_axis_costs_result.json').write_text(output)
    print(output,end='')


if __name__ == '__main__':
    main()
