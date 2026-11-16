#!/usr/bin/env python3
"""Independent exact-rational replay of the endpoint objectives (claude-b9ee review of ledger row 3.7).

B(s) = lam0 + lam1 + L2 (2+s) + L3 (6 + 9 s + C6 s^{3/2}) + mu s / 24, L3 >= 0, mu > 0.
For each row and both endpoints of its s-interval, an exact rational UPPER bound of B is
computed using a rational upper bound of sqrt(s) (integer square root at scale 10^30).
Only the standard library is used.  Usage: python3 -I endpoints_exact.py radius_certificates.json
"""
import json, sys
from fractions import Fraction as F
from math import isqrt

def sqrt_upper(x, scale=10**30):
    # x a nonnegative Fraction; returns a Fraction u with u >= sqrt(x)
    n = x.numerator * scale * scale
    d = x.denominator
    # sqrt(n/d) <= (isqrt(n*d)+1)/d
    return F(isqrt(n * d) + 1, d * scale)

def sqrt_lower(x, scale=10**30):
    n = x.numerator * scale * scale
    d = x.denominator
    return F(isqrt(n * d), d * scale)

rows = json.load(open(sys.argv[1]))
assert len(rows) == 13
iv = [(F(r['s_interval'][0]), F(r['s_interval'][1])) for r in rows]
assert iv[0][0] == 0 and iv[-1][1] == 42
for (a, b), (c, d) in zip(iv, iv[1:]):
    assert b == c, 'gap in s-cover'
for a, b in iv:
    assert a < b
C6s = {'40.45313': F(4045313, 100000), '50': F(50)}
targets = {'40.45313': F(95133, 100000), '50': F(48009, 50000)}
best = {k: (F(-10**9), None) for k in C6s}
for i, r in enumerate(rows):
    lam0, lam1, L2, L3, mu = (F(r[k]) for k in ('lam0', 'lam1', 'L2', 'L3', 'mu'))
    assert L3 >= 0 and mu > 0
    out = []
    for s in iv[i]:
        su = sqrt_upper(s); sl = sqrt_lower(s)
        for k, C6 in C6s.items():
            up = lam0 + lam1 + L2 * (2 + s) + L3 * (6 + 9 * s + C6 * s * su) + mu * s / 24
            lo = lam0 + lam1 + L2 * (2 + s) + L3 * (6 + 9 * s + C6 * s * sl) + mu * s / 24
            assert lo <= up and up - lo < F(1, 10**20)
            if up > best[k][0]:
                best[k] = (up, (i, s))
            out.append((k, str(s), float(up)))
    print(i, [f'{k}@s={s}: {v:.15f}' for k, s, v in out])
for k in C6s:
    up, where = best[k]
    print(f'C6={k}: max endpoint upper bound {float(up):.15f} at row,s={where}; target {float(targets[k])};',
          'PASS' if up < targets[k] else 'FAIL', '; margin', float(targets[k] - up))
    assert up < targets[k]
# lambda0 decomposition: report lam0 - 1/1000 (the solver value) as a float
print('lam0 - 1/1000 (dyadic check):', [ (F(r['lam0']) - F(1, 1000)).denominator & ((F(r['lam0']) - F(1, 1000)).denominator - 1) == 0 for r in rows])
