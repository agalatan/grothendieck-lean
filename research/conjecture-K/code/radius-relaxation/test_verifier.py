"""Sanity tests of verify_cert.py (the checker must not be vacuous).

1. Sturm positivity against sympy's exact real-root counting on random rational polynomials.
2. Mutations of a passing row must fail: lam0 lowered; a test value changed; a multiplier of the
   parameter certificate removed (the bound must go up); the cone violated at a knot.
3. Float cross-check of (C2) on a dense grid by an independent evaluation (numpy, the spline
   matrices of outer.py), for every row.
"""
import os, sys, json, copy, random
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from fractions import Fraction as Fr
import verify_cert as VC

path = sys.argv[1]
cert = json.load(open(path))
rows = cert['rows']
random.seed(7)

# ---- 1. Sturm against sympy
import sympy as sp
x = sp.symbols('x')
bad = 0
ntest = 300
for it in range(ntest):
    deg = random.randint(2, 9)
    co = [Fr(random.randint(-9, 9), random.randint(1, 5)) for _ in range(deg + 1)]
    if co[-1] == 0:
        co[-1] = Fr(1)
    if it % 3 == 0:   # plant a root structure: multiply by (x - a)^2 + small or (x - a)
        a = Fr(random.randint(0, 20), 10)
        co = VC.pmul(co, [-a, Fr(1)]) if it % 2 else VC.pmul(co, VC.padd(VC.pmul([-a, Fr(1)], [-a, Fr(1)]), [Fr(1, 1000)]))
    a_, b_ = Fr(random.randint(0, 10), 10), Fr(random.randint(11, 30), 10)
    P = sp.Poly(sum(sp.Rational(c.numerator, c.denominator) * x ** i for i, c in enumerate(co)), x, domain='QQ')
    qa, qb = sp.Rational(a_.numerator, a_.denominator), sp.Rational(b_.numerator, b_.denominator)
    truth = (P.eval(qa) > 0) and (P.count_roots(qa, qb) == 0)
    mine = VC.positive_on(co, a_, b_)
    truth_inf = (P.eval(qa) > 0) and (P.count_roots(qa, None) == 0)
    mine_inf = VC.positive_on(co, a_, None)
    if truth != mine or truth_inf != mine_inf:
        bad += 1
print('1. Sturm vs sympy: %d polynomials, %d disagreements' % (ntest, bad))

# ---- 2. mutations
row = rows[len(rows) // 2]
base = VC.verify_row(row, quiet=True)
print('2. base row [%s, %s]: ok=%s bound=%.7f' % (row['s_lo'], row['s_hi'], base['ok'], float(base['bound'])))
m = copy.deepcopy(row)
m['lam'][0] = str(Fr(m['lam'][0]) - Fr(1, 10000))
r1 = VC.verify_row(m, quiet=True)
print('   lam0 - 1e-4            -> ok=%s (must be False)' % r1['ok'])
m = copy.deepcopy(row)
k = len(m['phi1']) // 3
m['phi1'][k] = str(Fr(m['phi1'][k]) + Fr(1, 100))
if row.get('kind') == 'G':
    m['phi2'][k] = str(2 * Fr(m['phi1'][k]))
try:
    r2 = VC.verify_row(m, quiet=True)
    print('   phi1 knot value + 1e-2 -> ok=%s (must be False)' % r2['ok'])
except AssertionError as ex:
    print('   phi1 knot value + 1e-2 -> rejected:', ex)
m = copy.deepcopy(row)
end = 'hi'
if m['par'][end]['cuts']:
    cuts = m['par'][end]['cuts']
    # (coordinate cuts n, h, b, y, z >= 0 are redundant in the bound: negative residuals are free)
    cand = [i for i in range(len(cuts)) if cuts[i][0] not in ('n', 'h', 'b', 'y', 'z')] or list(range(len(cuts)))
    big = max(cand, key=lambda i: Fr(cuts[i][2]))
    m['par'][end]['cuts'] = cuts[:big] + cuts[big + 1:]
    r3 = VC.verify_row(m, quiet=True)
    print('   drop the largest LP multiplier (%s) -> bound at s_hi %.7f (must exceed %.7f)' % (
        cuts[big][0], float(r3['bounds'][end]), float(base['bounds'][end])))
m = copy.deepcopy(row)
m['xia'][3] = str(Fr(m['xia'][3]) + 5)
try:
    VC.verify_row(m, quiet=True)
    print('   cone violated at a knot -> NOT rejected (BUG)')
except AssertionError as ex:
    print('   cone violated at a knot -> rejected:', ex)

# ---- 3. dense float cross-check of (C2), independent evaluation
import numpy as np
from outer import test_matrices
worst = 1e9
for row in rows:
    ek = np.array([float(Fr(v)) for v in row['knots']])
    arr = lambda nm: np.array([float(Fr(v)) for v in row[nm]])
    f1, f2, x2, x1, xa, t2, t4 = (arr(nm) for nm in ['phi1', 'phi2', 'xi2', 'xi1', 'xia', 'th2', 'th4'])
    lam = [float(Fr(v)) for v in row['lam']]
    lam3 = sum(float(Fr(v)) for v in row['l3'])
    mu = [float(Fr(v)) for v in row['mu']]
    sig = float(Fr(row['sigma']))
    pts = []
    for a_, b_ in zip(ek[:-1], ek[1:]):
        pts.extend(list(a_ + (b_ - a_) * np.random.default_rng(1).random(25)))
    pts.extend(list(np.geomspace(ek[-1], max(5000.0, 30 * ek[-1]), 500)))
    r = np.array(sorted(pts))
    v = r * r
    Fm, Gm, Ym = test_matrices(ek ** 2, v)
    ev = lambda a: Fm.T @ a
    a1, a2 = (float(Fr(x)) for x in row.get('slope', ['0', '0']))
    ph1, ph2 = ev(f1) + a1 * v, ev(f2) + a2 * v
    th3 = ev(x1) + 0.5 * ph2 - ev(t2) - ev(t4)
    th1 = ev(x2) + ph1 + ev(t2) - th3
    th5 = ev(xa) + Ym.T @ f1 + a1 * v / 2 + 0.5 * (Ym.T @ f2 + a2 * v / 2) - sig * v
    T = th5 ** 2 / (4 * mu[4])
    for j, th in enumerate([th1, ev(t2), th3, ev(t4)]):
        if mu[j] > 0:
            T = T + th ** 2 / (4 * mu[j])
    sl = lam[0] + lam[1] * v + lam[2] * v ** 2 + lam3 * v ** 3 + Gm.T @ f1 + Gm.T @ f2 + (a1 + a2) * v ** 2 / 2 - th1 - ev(t2) - 3 * th3 - 2 * ev(t4) - T - r
    worst = min(worst, float((sl / (1 + 0.02 * v ** 2 + 7e-5 * v ** 3)).min()))
print('3. dense float check of (C2), all rows: smallest scaled slack %.3e (must be > 0)' % worst)

# ---- 4. the parameter bound (C3) against a direct conic maximisation (cvxpy, float), a few rows
import cvxpy as cp
worst_gap, nchk, viol = 0.0, 0, 0
for row in rows[::4]:
    mu = [Fr(v) for v in row['mu']]; sig = Fr(row['sigma']); l3 = [Fr(v) for v in row['l3']]
    for end in ('lo', 'hi'):
        s_e = Fr(row['s_' + end])
        if s_e == 0:
            continue
        sf = float(s_e)
        p = cp.Variable(5, nonneg=True)
        n_, h_, b_, y_, z_ = p[0], p[1], p[2], p[3], p[4]
        dlin = np.array([float(sum(mu[j] * VC.BJ[j][i] for j in range(5)) + sig * VC.EA[i]) for i in range(5)])
        s0 = 8 * n_ + 2 * h_ + 8 * b_ + 8 * z_
        h0 = (8.0 / 3) * n_ + (2.0 / 3) * h_ + (8.0 / 3) * b_ + 24 * y_ - (16.0 / 3) * z_
        g = cp.Variable(nonneg=True)
        m_ = n_ + b_ + 3 * y_ - z_
        cons = [32 * n_ + 8 * h_ + 32 * b_ + 96 * y_ == 1, b_ <= n_, y_ <= z_, h0 >= 0, m_ >= 0,
                cp.SOC(n_ + h_, cp.hstack([2 * z_, n_ - h_])), cp.SOC(h_ + m_, cp.hstack([2 * (3 * y_ - z_), h_ - m_])),
                cp.SOC(s0 + h0, cp.hstack([2 * g, s0 - h0]))]
        obj = dlin @ p + np.sqrt(sf) * (float(l3[1]) * (300 * g + 198 * h0) + float(l3[2]) * (135 * g + (11781.0 / 32) * h0))
        pr = cp.Problem(cp.Maximize(obj), cons)
        pr.solve(solver=cp.CLARABEL)
        res = VC.verify_row(row, quiet=True)
        lam = [Fr(v) for v in row['lam']]
        base = lam[0] + lam[1] + lam[2] * (2 + s_e) + l3[0] * (6 + 9 * s_e + VC.C6 * s_e * Fr(row['par'][end]['sqrt_ub'])) + (l3[1] + l3[2]) * (6 + 9 * s_e)
        L_exact = float((res['bounds'][end] - base) / s_e)
        nchk += 1
        viol += (L_exact < pr.value - 1e-7)
        worst_gap = max(worst_gap, L_exact - pr.value)
print('4. (C3) against the conic maximum: %d endpoints, exact L below the conic value: %d (must be 0), largest excess %.2e' % (nchk, viol, worst_gap))
