#!/usr/bin/env python3
# Reviewer (N): sharp profile-free constant theta*(m) of the equal family q = X (R - m)/sqrt(m), m = 1..30, against the
# proved bounds: min(G(1/m) [Theorem 4], H(m) [Lemma 6]) and the package's rational table; first m below each threshold.
import sys, json, math
import numpy as np
sys.path.insert(0, sys.argv[1])
import siglib as L
r, wr = L.r_grid(90.0)
def Gk(k): return (33 + 217 * k + 168 * k * k) / (3 * (1 + 3 * k) * (11 + 10 * k))
def aff(m): return math.exp(-m + m * math.log(m) + 0.5 * math.log(math.pi) + math.lgamma((m + 1) / 2) - math.lgamma(m) - math.lgamma((m + 2) / 2))
def H(m): return (34 * m * (1 - aff(m)) + 40) / (6 * (m + 3))
rows = []
for m in range(1, 31):
    law = L.EqualLaw(m); p, w1, zp, npk = L.hermitian_kernels(law, r); pos = p > 1e-300
    EZ2 = float(wr[pos] @ (zp[pos] ** 2 / p[pos])); zq = float(wr @ (r * zp))
    ts = (2 / 3) * (EZ2 + zq * zq) / (4 + 12 / m)
    rows.append(dict(m=m, tstar=ts, G=Gk(1 / m), H=H(m), codex=77 / (9 * (m + 3)), lin=16 / (3 * (m + 3))))
    assert ts <= min(rows[-1]['G'], rows[-1]['H']) * (1 + 1e-6)
print('%3s %9s %9s %9s %9s %9s %9s' % ('m', 'h=v', 'theta*', 'G(1/m)', 'H(m)', '77/9(m+3)', 'H/theta*'))
for x in rows:
    print('%3d %9.5f %9.5f %9.5f %9.5f %9.5f %9.3f' % (x['m'], x['lin'], x['tstar'], x['G'], x['H'], x['codex'], min(x['G'], x['H']) / x['tstar']))
for need in (0.35, 0.37, 0.6, 0.64, 1.3, 1.33, 1.88):
    f = lambda key: next((x['m'] for x in rows if all(y[key] <= need for y in rows if y['m'] >= x['m'])), None)
    fm = next((x['m'] for x in rows if all(min(y['G'], y['H']) <= need for y in rows if y['m'] >= x['m'])), None)
    print('threshold %.2f: sharp theta* allows m >= %s; proved (best of Theorem 4 and Lemma 6): m >= %s; codex formula: m >= %s' % (need, f('tstar'), fm, f('codex')))
json.dump(rows, open(sys.argv[2], 'w'), indent=1)
