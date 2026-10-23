"""Hypothetical envelope max (mkenv logic, no files written) with row bounds shifted: envsim.py rows.json t=newbound ..."""
import sys, json, numpy as np
from fractions import Fraction as Fr
rows = {k: {a: Fr(b) for a, b in v.items()} for k, v in json.load(open(sys.argv[1])).items()}; eps = Fr(149, 200)
old = {'0.84': Fr('0.713414585'), '0.845': Fr('0.713440226'), '0.85': Fr('0.713436674'), '0.855': Fr('0.713421491')}
for a in sys.argv[2:]:
    t, v = a.split('='); rows[t]['C'] += Fr(v) - old[t]
names = list(rows); cands = [(i, i, Fr(0)) for i in names]
for a in range(len(names)):
    for b in range(a + 1, len(names)):
        for k in range(1, 20): cands.append((names[a], names[b], Fr(k, 20)))
def coef(c):
    i, j, th = c; ri, rj = rows[i], rows[j]; return ((1 - th) * ri['ell'] + th * rj['ell'], (1 - th) * ri['C'] + th * rj['C'] - 2 / eps * th * (1 - th) * (ri['beta'] - rj['beta']) ** 2)
CO = [coef(c) for c in cands]; Lf = np.array([float(a) for a, b in CO]); Cf = np.array([float(b) for a, b in CO]); B = -1
for k in range(1800):
    u, v = k / 2000, (k + 1) / 2000; val = np.maximum(u * u - 2 * Lf * u + Cf, v * v - 2 * Lf * v + Cf); c = int(np.argmin(val))
    if val[c] > B: B = val[c]; arg = (u, cands[c])
print(f"envelope max {B:.10f} at t {arg[0]} {arg[1][:2]} th {arg[1][2]}  -> K >= {1/B:.10f}")
