#!/usr/bin/env python3
"""N: my relaxation combined with the constraints of the 0.93462 package.
  (19)  8z <= 24(1+alpha) y + (5 + 3/alpha)(1 - 4h)  for the package's eight alphas (new);
  general quadratic forms in (c1+c2-3, c2-1): approximated by directions (3d + beta c)^2 (same second
  moments as before, more directions of the Gram matrix);  caps n, h <= 1/4 (as in dual.py).
Usage: combo_scan.py OUT.jsonl CLASS(hermite|pwl) s1,s2,... [extra]   (extra = more directions)"""
import os, sys, json
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np
import dual as D
import dualcp as DC
from hermite_tests import hermite_matrices


def add_directions(betas):
    for beta in betas:
        D.LJ = np.vstack([D.LJ, [1 + beta, 1, 0]])
        D.CJ = np.append(D.CJ, 3 + beta)
        D.BJ = np.vstack([D.BJ, D.BJ[2] + 2 * beta * np.array([32, 4, 0, 24, 8], float) + beta ** 2 * D.BJ[0]])
    D.NB = len(D.CJ)


if __name__ == '__main__':
    out, cls = sys.argv[1], sys.argv[2]
    svals = [float(x) for x in sys.argv[3].split(',')]
    extra = len(sys.argv) > 4 and sys.argv[4] == 'extra'
    if cls == 'hermite':
        D.test_matrices = hermite_matrices
        DC.test_matrices = hermite_matrices
    if extra:
        add_directions([-0.125, -0.375, -0.75, -1.5, 0.5, 2.0, -3.0, 6.0])
    A19 = [0.25, 0.5, 1, 2, 4, 8, 16, 32]
    allb = tuple(range(1, D.NB + 1))
    specs = [('N + joint', dict(joint=True)),
             ('N + joint + (19) + %d Gram directions' % D.NB, dict(joint=True, r19=A19, budgets=allb))]
    with open(out, 'a') as fh:
        for s in svals:
            for tag, opts in specs:
                o, sol, h = DC.solve_cp(s, 'N', drk=0.1, gk=1.06, r_max=30.0, opts=opts, rounds=5)
                o['tag'] = '%s [%s]' % (tag, cls)
                o['opts'] = {k: (list(v) if isinstance(v, tuple) else v) for k, v in opts.items()}
                if sol is not None and 'par' in sol:
                    o['par'] = [float(x) for x in sol['par']]
                fh.write(json.dumps(o) + '\n'); fh.flush()
                print('s=%-4g %-46s value %.5f  min_slack %.1e  bound_N %.5f  %s  mu=%s' % (
                    s, o['tag'], o.get('value', float('nan')), o.get('min_slack', float('nan')), o.get('bound_N', float('nan')),
                    o.get('status'), np.array2string(np.array(o.get('mu', [])), precision=4, max_line_width=200)), flush=True)
