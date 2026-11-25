#!/usr/bin/env python3
"""Directly checkable one-sided ceilings in the STORED SCORE MODEL (exact Fractions on the stored decimals).
For pool rows i with coefficients (c_0, ..., c_K, t)_i and weights w_i > 0, sum w_i = 1, that cancel a set of coefficient columns
(sum w_i c_k = 0 for the free lam_k, and sum w_i t = 0 when a tail is allowed), every game has
    max_i payoff_i >= sum_i w_i payoff_i = sum_i w_i c_0,i + (the columns not cancelled),
so its norm in the model is at least that, whatever its free coefficients (no bounds on them are used).
  degree 5 (eps_profile_K2.json): all of lam_1, lam_2 (and nu) are cancelled: a constant for EVERY degree-5 game.
     Rows 190, 277, 329 without tail; 350, 460, 510, 530 with a tail.
  degree 7 (eps_profile_K3.json): lam_2, lam_3 (and nu) are cancelled; the weighted c_1 is positive, so for lam_1 >= -cap the
     payoff is at least sum w c_0 - cap sum w c_1, cap = 1/(1.403 (2287/2500)^2) (the rho0-relaxed cap at the target 1.403):
     a bound for every degree-7 game with cubic weight eps <= cap.  Rows 140, 279, 366 without tail; 139, 279, 348, 366 with a tail.
All rows were found by codex-a7c4 in the reviews of PR #711 (zero-based rows of the stored pools).  The script solves for the
weights exactly, checks that they are positive, and prints for each constant a checked lower FLOOR (the digits after ">=" are
rounded down, never up) and the outward (rounded up) reciprocal.
What this does not certify: that the stored coefficients are those of unimodular pairs to the digits stored (quadrature, N)."""
import os, json
from fractions import Fraction as F
HERE = os.path.dirname(os.path.abspath(__file__))
def solve(A, b):
    n = len(A); M = [row[:] + [bi] for row, bi in zip(A, b)]
    for c in range(n):
        p = next(r for r in range(c, n) if M[r][c] != 0); M[c], M[p] = M[p], M[c]
        M[c] = [x / M[c][c] for x in M[c]]
        for r in range(n):
            if r != c and M[r][c] != 0: M[r] = [x - M[r][c] * y for x, y in zip(M[r], M[c])]
    return [M[r][n] for r in range(n)]
down = lambda x, d: F((x * 10 ** d).__floor__(), 10 ** d); up = lambda x, d: -down(-x, d)
CAP = 1 / (F(1403, 1000) * F(2287, 2500) ** 2)
CASES = [('degree 5, no tail, every game', 'eps_profile_K2.json', [190, 277, 329], [1, 2], None, '0.7124304398'),
         ('degree 5, identity tail, every game', 'eps_profile_K2.json', [350, 460, 510, 530], [1, 2, 3], None, '0.7123823506'),
         ('degree 7, no tail, every game with eps <= cap', 'eps_profile_K3.json', [140, 279, 366], [2, 3], 1, None),
         ('degree 7, identity tail, every game with eps <= cap', 'eps_profile_K3.json', [139, 279, 348, 366], [2, 3, 4], 1, None)]
pools = {}
for name, fn, idx, cols, capped, floor in CASES:
    pool = pools.setdefault(fn, json.load(open(os.path.join(HERE, fn)))['pool'])
    R = [[F(repr(v)) for v in pool[i][1:]] for i in idx]                    # c_0, c_1, ..., c_K, t  (pool rows are [tag, c_0, ..., c_K, t])
    A = [[R[j][c] for j in range(len(idx))] for c in cols] + [[F(1)] * len(idx)]; w = solve(A, [F(0)] * len(cols) + [F(1)])
    assert all(x > 0 for x in w) and sum(w) == 1 and all(sum(x * r[c] for x, r in zip(w, R)) == 0 for c in cols)
    const = sum(x * r[0] for x, r in zip(w, R))
    if capped is not None:
        c1 = sum(x * r[capped] for x, r in zip(w, R)); assert c1 > 0; const = const - CAP * c1
    if floor: assert const > F(floor)
    fl = lambda x, d: '%d.%0*d' % ((x * 10 ** d).__floor__() // 10 ** d, d, (x * 10 ** d).__floor__() % 10 ** d)       # digits rounded DOWN
    ce = lambda x, d: '%d.%0*d' % ((-(-x * 10 ** d).__floor__()) // 10 ** d, d, (-(-x * 10 ** d).__floor__()) % 10 ** d)   # digits rounded UP
    rec = 1 / const; assert F(fl(const, 10)) <= const and rec <= F(ce(rec, 9)) <= F(ce(rec, 6))
    print('%s: %s rows %s (%s), weights %s' % (name, fn, idx, ', '.join(pool[i][0] for i in idx), ', '.join('%.6f' % float(x) for x in w)))
    print('   model norm >= %s (digits rounded down)%s; no such game certifies more than %s (rounded up; six decimals: %s)' % (
        fl(const, 10), ' with cap = %s...' % fl(CAP, 10) if capped is not None else '', ce(rec, 9), ce(rec, 6)))
