#!/usr/bin/env python3
"""Arb feasible baseline for the UNCONSTRAINED common fibre potential.

These actual disk responses need not have the prescribed global t,tau.
Consequently this bounds B+E Psi_common from BELOW, and is not a feasible
value for the fixed-contact problem. No optimization is trusted here.
"""
import argparse
from fractions import Fraction as Q
import json
from pathlib import Path
import sys
import time

from flint import arb, ctx

sys.path.insert(0, str(Path(__file__).resolve().parent))
from verify_abstract_response_support import ball, read_sources
from verify_joint_fibre_response import integrated_grid, branch_moments, joint_source, quadratic


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('certificate', type=Path)
    p.add_argument('--audit', type=Path, required=True)
    p.add_argument('--law', type=Path, required=True)
    p.add_argument('--profiles', type=Path, required=True)
    args = p.parse_args()
    start = time.monotonic()
    data, target = read_sources(args)
    ctx.prec = data['precision_bits']
    law = json.loads(args.law.read_text())
    m, ell, beta, forcing = joint_source(data, target, law, args.profiles)
    row = next(r for r in json.loads(args.audit.read_text())['selected'] if r['index'] == data['index'])
    if data['source_row_weights'] != row['rows']:
        raise ValueError('Audit row weights mismatch')
    if len(data['atoms']) != len(data['support']):
        raise ValueError('Incomplete radial support')
    scale = ball(data['scale'])
    if not scale > 1:
        raise ValueError('An interior response radius is required')
    grid = integrated_grid(data)
    t, tau, eps = [ball(target[a]) for a in ['t', 'tau', 'epsilon']]
    fibre = arb(0)
    for atom, source in zip(data['atoms'], data['support']):
        if atom['v'] != source['v'] or len(atom['branches']) != 1:
            raise ValueError('One actual branch per matching atom is required')
        branch = atom['branches'][0]
        if Q(branch['probability']) != 1:
            raise ValueError('A baseline branch has probability one')
        k, m0, m1 = branch_moments(branch, grid, scale)
        v, w = ball(source['v']), ball(source['weight'])
        fibre += w*(quadratic(m, k)+2*ball(ell)*m0+2*ball(beta)*m1+
                    2*tau*v*sum((ball(a)*b for a, b in zip(forcing, k[:3])), arb(0)))
    base = t*t-2*ball(ell)*t+2*ball(beta)**2/eps-ball(law['row_parameters']['price'])*tau*tau
    score = base+fibre
    if not ball(data['score_lower_rational']) < score < ball(data['score_upper_rational']):
        raise ValueError('Baseline enclosure failed')
    print(json.dumps({'status': 'PASS', 'index': data['index'],
        'response_norm_upper_enclosure': str(1/scale),
        'unconstrained_baseline_enclosure': str(score),
        'score_lower_rational': data['score_lower_rational'],
        'score_upper_rational': data['score_upper_rational'],
        'seconds': time.monotonic()-start,
        'scope': 'Actual disk responses give a LOWER bound on B+E Psi_common. Global t,tau equalities and selected penalties are not imposed. No fixed-contact feasible-value or Grothendieck endpoint claim.'}, indent=2))


if __name__ == '__main__':
    main()
