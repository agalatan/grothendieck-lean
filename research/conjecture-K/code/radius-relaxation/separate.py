#!/usr/bin/env python3
"""N: does the constraint set exclude a given radial law?  (Coordinator's question on codex-6d92's law.)

Law tested (complex analogue of Y = (2400/2419) Unif{+-9/10} + (19/2419) N(0, 25)):
    |q| = 9/10 with probability 2400/2419,  q ~ complex Gaussian with E|q|^2 = 25 with probability 19/2419,
uniform phase; so V = |q|^2 is an atom at 81/100 plus (19/2419) Exp(mean 25).

A law of V with kurtosis s is excluded as soon as some valid inequality fails:
    E[cut(V)] + l3 E V^3  <=  R := max_par [ sum_j mu_j B_j + sigma (32b+48y) + l3 (6 + 9s + sqrt(s) J(par)) ],
    cut(v) = G1 + G2 - sum_j theta_j c_j - sum_j theta_j^2/(4 mu_j)   (theta, xi as in dual.py, per point).
The program maximises  E_law[cut] + l3 E V^3 - R  under the normalisation sum(mu) + 1e3 * sum(l3) <= 1.
A positive optimum = excluded (label N).  Kinds: 'G' Lean inputs only, 'N' all constraints.
"""
import os, sys, json
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from fractions import Fraction as Fr
import numpy as np
import cvxpy as cp
from outer import test_matrices
import make_cert as MC


def law_Y(nq=1600):
    w0, w1 = 2400.0 / 2419.0, 19.0 / 2419.0
    # exponential part: cells geometric in v, exact cell masses, cell means as nodes
    edges = np.concatenate([[0.0], np.geomspace(1e-3, 25.0 * 60, nq)])
    cdf = 1.0 - np.exp(-edges / 25.0)
    mass = np.diff(cdf)
    # exact conditional mean of each cell: int v e^{-v/25}/25 dv = -(v+25) e^{-v/25}
    prim = -(edges + 25.0) * np.exp(-edges / 25.0)
    mean = np.diff(prim) / np.maximum(mass, 1e-300)
    keep = mass > 1e-16
    v = np.concatenate([[0.81], mean[keep]])
    p = np.concatenate([[w0], w1 * mass[keep]])
    return v, p


def separate(kind, v, p, ek, joint=True, use_l3=True, linear=True, cone=True, opts=None):
    s = float(p @ v ** 2 - 2)
    uk = ek ** 2
    N = len(v)
    Fm, Gm, Ym = test_matrices(uk, v)
    n = len(uk)
    f1, f2 = cp.Variable(n), cp.Variable(n)
    sl_ = cp.Variable(2)
    l3 = cp.Variable(3, nonneg=True)
    mu = cp.Variable(5, nonneg=True)
    sig = cp.Variable()
    cons = [cp.sum(mu) + 1e3 * cp.sum(l3) <= 1]
    if not use_l3:
        cons.append(l3 == 0)
    if not joint:
        cons += [l3[1] == 0, l3[2] == 0]
    if not linear:
        cons.append(sl_ == 0)
    phi1, G1, Y1 = Fm.T @ f1 + sl_[0] * v, Gm.T @ f1 + sl_[0] * (v ** 2 / 2), Ym.T @ f1 + sl_[0] * (v / 2)
    phi2, G2, Y2 = Fm.T @ f2 + sl_[1] * v, Gm.T @ f2 + sl_[1] * (v ** 2 / 2), Ym.T @ f2 + sl_[1] * (v / 2)
    th2, th4 = cp.Variable(N), cp.Variable(N)
    xi2, xi1, xia = cp.Variable(N, nonneg=True), cp.Variable(N, nonneg=True), cp.Variable(N)
    if kind == 'G':
        cons += [f2 == 2 * f1, sl_[1] == 2 * sl_[0], mu[0] == 0, mu[1] == 0, mu[3] == 0, th2 == 0, th4 == 0,
                 xi2 == 0, xi1 == 0, xia == 0]
    else:
        if cone:
            cons.append(cp.SOC(xi2 + xi1, cp.vstack([xia, xi2 - xi1]), axis=0))
        else:
            cons += [xi2 == 0, xi1 == 0, xia == 0]
    th3 = xi1 + 0.5 * phi2 - th2 - th4
    th1 = xi2 + phi1 + th2 - th3
    th5 = xia + Y1 + 0.5 * Y2 - sig * v
    ths = [th1, th2, th3, th4, th5]
    tau = cp.Variable((5, N), nonneg=True)
    for j in range(5):
        cons.append(cp.SOC(mu[j] + tau[j], cp.vstack([ths[j], mu[j] - tau[j]]), axis=0))
    cut = G1 + G2 - th1 - th2 - 3 * th3 - 2 * th4 - cp.sum(tau, axis=0)
    EV3 = float(p @ v ** 3)
    pd, pc = MC.param_dual(s, mu, sig, l3, joint)
    cons += pc
    R = pd + l3[0] * (6 + 9 * s + MC.C6f * s ** 1.5) + (l3[1] + l3[2]) * (6 + 9 * s)
    obj = p @ cut + cp.sum(l3) * EV3 - R
    prob = cp.Problem(cp.Maximize(obj), cons)
    prob.solve(solver=cp.CLARABEL)
    out = dict(kind=kind, s=s, EV3=EV3, E_sqrtV=float(p @ np.sqrt(v)), violation=float(prob.value), status=prob.status,
               mu=[float(x) for x in mu.value], sigma=float(sig.value), l3=[float(x) for x in l3.value],
               slope=[float(x) for x in sl_.value],
               cone_used=float(np.abs(np.concatenate([xi2.value, xi1.value, xia.value])).max()) if kind != 'G' else 0.0,
               E_cut=float(p @ cut.value), R=float(R.value),
               atom_cut=float(cut.value[0]), tail_part=float(p[1:] @ cut.value[1:]))
    return out


if __name__ == '__main__':
    v, p = law_Y()
    print('law: mass %.12f  E V %.9f  s %.6f  E V^3 %.3f  E|q| %.6f  (scalar sixth bound %.2f)' % (
        p.sum(), p @ v, p @ v ** 2 - 2, p @ v ** 3, p @ np.sqrt(v), 6 + 9 * (p @ v ** 2 - 2) + MC.C6f * (p @ v ** 2 - 2) ** 1.5))
    # knots: bulk scheme refined around the atom r = 0.9, and a far continuation
    base = MC.knots_scheme('bulk')
    extra = [Fr(x, 1000) for x in (880, 885, 890, 895, 898, 900, 902, 905, 910, 915, 920)]
    far = [Fr(x) for x in (31, 32, 33, 34, 35, 36, 38, 40, 44, 50, 60, 80, 120, 200)]
    for nm, kn in [('bulk', base), ('bulk + fine at the atom', sorted(set(base) | set(extra))),
                   ('bulk + fine at the atom + far', sorted(set(base) | set(extra) | set(far)))]:
        ek = np.array([float(x) for x in kn])
        for kind, kw in [('G', dict(use_l3=False)), ('G', dict()), ('N', dict(use_l3=False, cone=False)), ('N', dict(use_l3=False)), ('N', dict())]:
            o = separate(kind, v, p, ek, **kw)
            o.update(knots=nm, opts=kw)
            print(json.dumps(o), flush=True)
