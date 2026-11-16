#!/usr/bin/env python3
"""N: the dual programs of dual.py with the test class of the 0.9359 package (cubic Hermite splines in
r = sqrt(v): g(v) = f(r), f(0) = f'(0) = 0, f quadratic in r beyond the last knot) instead of tests
whose derivative is piecewise linear in v.  In the notation of dual.py: G = r^2 f, phi = f + (r/2) f',
Y = (r/2) f'.  Usage: hermite_tests.py OUT.jsonl s1,s2,... [drk gk]"""
import os, sys, json
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np
import dual as D
import dualcp as DC


def hermite_matrices(uk, v):
    ek, r = np.sqrt(uk), np.sqrt(v)
    K = len(ek) - 1
    Fv = np.zeros((2 * K, len(r)))       # f
    Fd = np.zeros((2 * K, len(r)))       # f'
    j = np.clip(np.searchsorted(ek, r, side='right') - 1, 0, K)
    for i, (ri, k) in enumerate(zip(r, j)):
        if k >= K:                       # tail: f = f_K + f'_K (r^2 - e_K^2)/(2 e_K)
            Fv[2 * (K - 1), i] = 1.0
            Fv[2 * (K - 1) + 1, i] = (ri * ri - ek[K] ** 2) / (2 * ek[K])
            Fd[2 * (K - 1) + 1, i] = ri / ek[K]
            continue
        h = ek[k + 1] - ek[k]
        t = (ri - ek[k]) / h
        H = (2 * t ** 3 - 3 * t ** 2 + 1, t ** 3 - 2 * t ** 2 + t, -2 * t ** 3 + 3 * t ** 2, t ** 3 - t ** 2)
        dH = (6 * t ** 2 - 6 * t, 3 * t ** 2 - 4 * t + 1, -6 * t ** 2 + 6 * t, 3 * t ** 2 - 2 * t)
        if k >= 1:                       # left node k (value, derivative); node 0 has f = f' = 0
            Fv[2 * (k - 1), i] += H[0];      Fd[2 * (k - 1), i] += dH[0] / h
            Fv[2 * (k - 1) + 1, i] += h * H[1]; Fd[2 * (k - 1) + 1, i] += dH[1]
        Fv[2 * k, i] += H[2];          Fd[2 * k, i] += dH[2] / h
        Fv[2 * k + 1, i] += h * H[3];  Fd[2 * k + 1, i] += dH[3]
    Y = 0.5 * r[None, :] * Fd
    return Fv + Y, v[None, :] * Fv, Y


if __name__ == '__main__':
    out = sys.argv[1]
    svals = [float(x) for x in sys.argv[2].split(',')]
    drk = float(sys.argv[3]) if len(sys.argv) > 3 else 0.1
    gk = float(sys.argv[4]) if len(sys.argv) > 4 else 1.06
    D.test_matrices = hermite_matrices
    DC.test_matrices = hermite_matrices
    specs = [('N, scalar sixth (the package\'s constraints are a subset)', 'N', None), ('N + joint', 'N', dict(joint=True)),
             ('G + joint (Lean only)', 'G', dict(joint=True))]
    if len(sys.argv) > 5 and sys.argv[5] == 'combo':
        A19 = [0.25, 0.5, 1, 2, 4, 8, 16, 32]
        ALLB = (1, 2, 3, 4, 5, 6, 7, 8, 9)
        specs = [('N + joint (as before)', 'N', dict(joint=True)),
                 ('N + joint + (19)', 'N', dict(joint=True, r19=A19)),
                 ('N + joint + more Gram directions', 'N', dict(joint=True, budgets=ALLB)),
                 ('N + joint + (19) + more Gram directions', 'N', dict(joint=True, r19=A19, budgets=ALLB)),
                 ('same, scalar sixth only (package 2 + mine without joint)', 'N', dict(r19=A19, budgets=ALLB)),
                 ('G + joint + (19) (Lean + (19))', 'G', dict(joint=True, r19=A19))]
    with open(out, 'a') as fh:
        for s in svals:
            for tag, mode, opts in specs:
                o, sol, h = DC.solve_cp(s, mode, drk=drk, gk=gk, r_max=30.0, opts=opts, rounds=5)
                o['tag'] = tag + ' [Hermite tests in r]'
                fh.write(json.dumps(o) + '\n'); fh.flush()
                print('s=%g  %-62s value %.5f  min_slack %.1e  bound_N %.5f  %s' % (
                    s, tag, o.get('value', float('nan')), o.get('min_slack', float('nan')), o.get('bound_N', float('nan')), o.get('status')), flush=True)
