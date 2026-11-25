#!/usr/bin/env python3
"""A directly checkable one-sided ceiling for degree 5 in the STORED SCORE MODEL (exact Fractions on the stored decimals).
For pool rows i with coefficients (c_0, c_1, c_2, t)_i and weights w_i > 0, sum w_i = 1, with sum w_i c_1 = sum w_i c_2 = 0
(and sum w_i t = 0 when a tail is allowed), every game (1, lam_1, lam_2[, nu]) has
    max_i payoff_i >= sum_i w_i payoff_i = sum_i w_i c_0,i,
so its norm in the model is at least that constant, whatever its coefficients (no bounds on them are used).  The rows were found
by codex-a7c4 in the review of PR #711: 190, 277, 329 without tail and 350, 460, 510, 530 with a tail (zero-based rows of
ceiling/eps_profile_K2.json).  The script solves for the weights exactly, checks that they are positive and prints the constants.
What this does not certify: that the stored coefficients are those of unimodular pairs to the digits stored (quadrature, N)."""
import os, json
from fractions import Fraction as F
HERE = os.path.dirname(os.path.abspath(__file__)); pool = json.load(open(os.path.join(HERE, 'eps_profile_K2.json')))['pool']
def solve(A, b):
    n = len(A); M = [row[:] + [bi] for row, bi in zip(A, b)]
    for c in range(n):
        p = next(r for r in range(c, n) if M[r][c] != 0); M[c], M[p] = M[p], M[c]
        M[c] = [x / M[c][c] for x in M[c]]
        for r in range(n):
            if r != c and M[r][c] != 0: M[r] = [x - M[r][c] * y for x, y in zip(M[r], M[c])]
    return [M[r][n] for r in range(n)]
for name, idx, cols, floor in (('no tail', [190, 277, 329], [2, 3], F('0.7124304398')), ('with an identity tail', [350, 460, 510, 530], [2, 3, 4], F('0.7123823506'))):
    R = [[F(repr(v)) for v in pool[i][1:]] for i in idx]                    # c_0, c_1, c_2, t  (pool rows are [tag, c_0, c_1, c_2, t])
    A = [[R[j][c - 1] for j in range(len(idx))] for c in cols] + [[F(1)] * len(idx)]; w = solve(A, [F(0)] * len(cols) + [F(1)])
    assert all(x > 0 for x in w) and sum(w) == 1 and all(sum(x * r[c - 1] for x, r in zip(w, R)) == 0 for c in cols)
    const = sum(x * r[0] for x, r in zip(w, R)); assert const > floor
    print('%s: rows %s (%s), weights %s' % (name, idx, ', '.join(pool[i][0] for i in idx), ', '.join('%.6f' % float(x) for x in w)))
    print('   every game has model norm >= %.10f...  (> %.10f), so no game certifies more than 1/%.10f = %.8f; outward six-decimal ceiling %.6f' % (
        float(const), float(floor), float(const), float(1 / const), ((1 / const * 10 ** 6).__floor__() + 1) / 10 ** 6))
