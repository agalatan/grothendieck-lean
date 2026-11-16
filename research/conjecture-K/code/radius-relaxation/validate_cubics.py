"""Task 3 (N, Monte Carlo): every constraint of the relaxation on genuine cubics.

Cubics (u = 1):  mono  y(|y|^2-2)/sqrt2;  b: y1^2 conj(y2)/sqrt2;  c: y1 y2 conj(y3);
                 sumN: N^{-1/2} sum of N independent copies of mono (N = 2, 4).
Checks: identities (I), (II) for hinge tests G = (v - t)_+ and for G = v^2, v^3/(1+v);
budgets against the contraction scalars (n,h,b,y,z); the pointwise cone |a|^2 <= c1 c2.
"""
import os, sys, json
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np

rng = np.random.default_rng(20261116)
M = 4_000_000


def cg(shape):
    return (rng.standard_normal(shape) + 1j * rng.standard_normal(shape)) / np.sqrt(2)


def mono(y):
    t = np.abs(y) ** 2
    q = y * (t - 2) / np.sqrt(2)
    dq = (2 * t - 2) / np.sqrt(2)             # d/dy  [y (y ybar - 2)] = 2 y ybar - 2
    dbq = y ** 2 / np.sqrt(2)                 # d/dybar
    return q, dq, dbq


def cubic(name):
    """returns q, list of d_j q, list of dbar_j q, and the scalars (n,h,b,y,z)."""
    if name == 'mono':
        y = cg(M)
        q, dq, dbq = mono(y)
        return q, [dq], [dbq], (0.25, 0.25, 0.25, 0.25, 0.25)
    if name == 'b':
        y1, y2 = cg(M), cg(M)
        q = y1 ** 2 * np.conj(y2) / np.sqrt(2)
        return q, [2 * y1 * np.conj(y2) / np.sqrt(2), 0 * y1], [0 * y1, y1 ** 2 / np.sqrt(2)], (0.25, 0.25, 0, 0, 0)
    if name == 'c':
        y1, y2, y3 = cg(M), cg(M), cg(M)
        q = y1 * y2 * np.conj(y3)
        return q, [y2 * np.conj(y3), y1 * np.conj(y3), 0 * y1], [0 * y1, 0 * y1, y1 * y2], (0.125, 0.25, 0, 0, 0)
    if name.startswith('sum'):
        n = int(name[3:])
        qs, d, db = 0, [], []
        for _ in range(n):
            q1, dq1, dbq1 = mono(cg(M))
            qs = qs + q1 / np.sqrt(n)
            d.append(dq1 / np.sqrt(n)); db.append(dbq1 / np.sqrt(n))
        return qs, d, db, tuple(0.25 / n for _ in range(5))
    raise ValueError(name)


def se(x):
    return x.std() / np.sqrt(len(x))


for name in ['mono', 'b', 'c', 'sum2', 'sum4']:
    q, d, db, par = cubic(name)
    n_, h_, b_, y_, z_ = par
    V = np.abs(q) ** 2
    c1 = sum(np.abs(x) ** 2 for x in d)
    c2 = sum(np.abs(x) ** 2 for x in db)
    a = sum(x * w for x, w in zip(d, db))
    rho_num = np.real(np.conj(q) ** 2 * a)        # Re(conj(q)^2 a) = V * rho
    s = 32 * n_ + 8 * h_ + 32 * b_ + 96 * y_
    rep = dict(cubic=name, s_formula=s, EV=float(V.mean()), s_mc=float((V ** 2).mean() - 2), E_sqrtV=float(np.sqrt(V).mean()))
    rep['budgets (mc, formula)'] = {
        'c2': (float(((c2 - 1) ** 2).mean()), 16 * n_ + 4 * h_),
        'c1-c2': (float(((c1 - c2 - 1) ** 2).mean()), 16 * n_ + 20 * h_ + 16 * b_),
        'c1+c2': (float(((c1 + c2 - 3) ** 2).mean()), 80 * n_ + 20 * h_ + 16 * b_ + 96 * y_ + 32 * z_),
        'c1': (float(((c1 - 2) ** 2).mean()), 32 * n_ + 16 * h_ + 16 * b_ + 48 * y_ + 16 * z_),
        '|a|^2': (float((np.abs(a) ** 2).mean()), 32 * b_ + 24 * y_),
        'E conj(q)^2 a': (float(rho_num.mean()), 32 * b_ + 48 * y_),
        'E V^3 (mc, 6+9s+C6 s^1.5)': (float((V ** 3).mean()), 6 + 9 * s + 40.45313 * s ** 1.5),
    }
    rep['cone max(|a|^2 - c1 c2)'] = float((np.abs(a) ** 2 - c1 * c2).max())
    ids = {}
    for tk in [0.0, 0.2, 1.0, 3.0, 10.0]:
        m = V > tk
        G = np.where(m, V - tk, 0.0)
        phi = m.astype(float)
        gp = np.where(m, tk / np.maximum(V, 1e-300) ** 2, 0.0)          # g'(v) = (G' - G/v)/v
        rI = G - c2 * phi - rho_num * gp
        rII = G - 0.5 * c1 * phi - 0.5 * rho_num * gp
        ids['hinge t=%g' % tk] = (float(rI.mean()), float(se(rI)), float(rII.mean()), float(se(rII)))
    for nm, G, phi in [('G=v^2', V ** 2, 2 * V), ('G=v^2/(1+v)', V ** 2 / (1 + V), (2 * V + V ** 2) / (1 + V) ** 2)]:
        gp = (phi - G / np.maximum(V, 1e-300)) / np.maximum(V, 1e-300)
        rI = G - c2 * phi - rho_num * gp
        rII = G - 0.5 * c1 * phi - 0.5 * rho_num * gp
        ids[nm] = (float(rI.mean()), float(se(rI)), float(rII.mean()), float(se(rII)))
    rep['identity residuals (I mean, I s.e., II mean, II s.e.)'] = ids
    print(json.dumps(rep, indent=1), flush=True)
