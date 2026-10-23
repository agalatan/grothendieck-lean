#!/usr/bin/env python3
"""Float discovery: average the row functionals BEFORE taking their supremum.

The saved finite primal laws are not response laws. Evaluating a new potential
on them does not certify its expectation for all laws, or exclude all joint
completions. Local multistart optima below are lower estimates of suprema.
"""
import argparse
import importlib.util
import json
import time
from fractions import Fraction
from pathlib import Path

import numpy as np


def main():
    p = argparse.ArgumentParser()
    p.add_argument('--data', type=Path, required=True)
    p.add_argument('--evaluator', type=Path, required=True)
    p.add_argument('--out', type=Path, required=True)
    p.add_argument('--nr', type=int, default=128)
    p.add_argument('--nt', type=int, default=128)
    args = p.parse_args()
    spec = importlib.util.spec_from_file_location('fibre_evaluator', args.evaluator)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    profiles = json.loads((args.data / 'row-profiles.json').read_text())
    diag = json.loads((args.data / 'diagnostic-input.json').read_text())
    rows = diag['rows']
    f = lambda s: float(Fraction(s))
    output = {'status': __doc__, 'nr': args.nr, 'nt': args.nt, 'results': []}
    for idx in [7234, 5661, 1247, 8701]:
        start = time.monotonic()
        model = json.loads((args.data / f'radial-complete-{idx}-exact.json').read_text())
        active = []
        for e in model['rows']:
            # Match the entire source row, not an approximate nominal t label.
            row = e['row']
            matches = [j for j, r in enumerate(rows) if r == row]
            if len(matches) != 1:
                raise ValueError(('row identity', idx, matches))
            j = matches[0]
            profile = mod.Psi([f(t) for t in profiles[j]['theta']], 149/200,
                              nr=args.nr, nt=args.nt)
            active.append((f(e['weight']), f(row['delta']), profile))
        # This is averaging the original quadratic response functional, whose
        # matrix is M. Averaging M^{-1} would be the wrong potential.
        combined = mod.Psi([f(t) for t in profiles[0]['theta']], 149/200,
                            nr=args.nr, nt=args.nt)
        combined.M = sum(w * P.M for w, delta, P in active)
        combined.Q = np.linalg.inv(combined.M)
        combined.L = sum(w * P.L for w, delta, P in active)
        combined.a = sum(w * delta * P.a for w, delta, P in active)
        tau = f(model['point']['tau'])
        separate, common, points = 0., 0., []
        for atom in model['support']:
            v, weight = f(atom['v']), f(atom['weight'])
            s = tau * v
            indiv = [P.psi(delta*s, nrand=1) for w, delta, P in active]
            ys = [P.Q @ m for (_, delta, P), (_, m) in zip(active, indiv)]
            vc, mc = combined.psi(s, starts=[combined.M @ y for y in ys], nrand=1)
            kc = combined.Q @ mc
            # Feed the common optimizer back into each separate problem.
            indiv = [P.psi(delta*s, starts=[P.M @ kc, old[1]], nrand=0)
                     for (w, delta, P), old in zip(active, indiv)]
            vi = sum(w * old[0] for (w, delta, P), old in zip(active, indiv))
            separate += weight * vi
            common += weight * vc
            points.append({'v': v, 'weight': weight, 'separate': vi,
                           'common': vc, 'gap': vi-vc})
        ell, beta, price = (f(model['row_parameters'][k]) for k in ['ell','beta','price'])
        t = f(model['point']['t'])
        base = t*t - 2*ell*t + 2*beta*beta/(149/200) - price*tau*tau
        entry = {'index': idx, 'separate_potential_score': base+separate,
                 'common_potential_score': base+common,
                 'consensus_gain': separate-common, 'points': points,
                 'seconds': time.monotonic()-start}
        output['results'].append(entry)
        args.out.write_text(json.dumps(output, indent=2)+'\n')
        print(json.dumps({k:v for k,v in entry.items() if k != 'points'}), flush=True)


if __name__ == '__main__':
    main()
