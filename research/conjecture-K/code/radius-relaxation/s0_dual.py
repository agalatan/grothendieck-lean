#!/usr/bin/env python3
"""Task 1 (N): the relaxation of ledger row 3.7 itself (scalar Stein family for X = Re q), dual form.

For an even, continuous, piecewise linear w (knots xi_k in x, constant beyond the last knot) and mu > 0,
every cubic has  E h_w(X) <= mu s / 24,  h_w(x) = x V_w(x) - w(x)/2 - w(x)^2/(2 mu),  V_w = int_0^x w.
With Psi_w(r) = E_theta h_w(r cos theta):

    minimise  lam0 + lam1 + lam2 (2+s) + lam3 (6 + 9s + C6 s^{3/2}) + mu s/24
    s.t.      r <= lam0 + lam1 r^2 + lam2 r^4 + lam3 r^6 + Psi_w(r)   (r >= 0),   lam3 >= 0.

Psi_w(r) = L(r).c - c^T Q(r) c / (2 mu) in the hat basis; L and Q are computed with exact
arcsine primitives per knot interval (moments I_m = E[|X|^m 1(|X| in interval)], m = 0..3).
The law of V is read off the multipliers of the pointwise constraints.
"""
import os, sys, json, time
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np
import cvxpy as cp
from grid import r_edges, C6


def S(m, z):
    z = np.clip(z, 0.0, 1.0)
    c = np.sqrt(np.maximum(1 - z * z, 0.0))
    if m == 0:
        return np.arcsin(z)
    if m == 1:
        return -c
    if m == 2:
        return 0.5 * (np.arcsin(z) - z * c)
    return -c + c ** 3 / 3


def interval_moments(xk, r):
    """I[m][j] = E[|X|^m ; xk[j] <= |X| < xk[j+1]] for X = r cos(theta); last interval is [xk[-1], inf)."""
    hi = np.append(xk[1:], np.inf)
    out = []
    for m in range(4):
        if r == 0:
            v = np.zeros(len(xk))
            if m == 0:
                v[0] = 1.0
            out.append(v)
            continue
        out.append((2 / np.pi) * r ** m * (S(m, hi / r) - S(m, xk / r)))
    return out


def LQ(xk, r):
    """L (K,), Q (K,K) for the hat basis on knots xk (basis K-1 is 1 beyond the last knot)."""
    K = len(xk)
    I0, I1, I2, I3 = interval_moments(xk, r)
    L = np.zeros(K)
    Q = np.zeros((K, K))
    # on interval j (j < K-1): hat_j = (b - x)/d, hat_{j+1} = (x - a)/d, a = xk[j], b = xk[j+1], d = b - a
    # primitives P_k(x) = int_0^x hat_k:  beyond its support P_k is constant
    # full primitive values at the knots
    area = np.zeros((K, K))            # area[k, j] = P_k(xk[j])
    for k in range(K):
        acc = 0.0
        for j in range(K):
            area[k, j] = acc
            if j < K - 1:
                d = xk[j + 1] - xk[j]
                if k == j or k == j + 1:
                    acc += d / 2
    for j in range(K):
        a = xk[j]
        if j < K - 1:
            b = xk[j + 1]
            d = b - a
            loc = {j: (b / d, -1 / d), j + 1: (-a / d, 1 / d)}       # hat = c0 + c1 x on the interval
        else:
            loc = {K - 1: (1.0, 0.0)}
        for k in range(K):
            c0, c1 = loc.get(k, (0.0, 0.0))
            # P_k(x) = area[k, j] + c0 (x - a) + c1 (x^2 - a^2)/2 on the interval
            p0 = area[k, j] - c0 * a - c1 * a * a / 2
            # E[x P_k(x) - hat_k(x)/2 ; interval] = p0 I1 + c0 I2 + (c1/2) I3 - (c0 I0 + c1 I1)/2
            L[k] += p0 * I1[j] + c0 * I2[j] + 0.5 * c1 * I3[j] - 0.5 * (c0 * I0[j] + c1 * I1[j])
        ks = list(loc.keys())
        for k in ks:
            for l in ks:
                (c0, c1), (e0, e1) = loc[k], loc[l]
                Q[k, l] += c0 * e0 * I0[j] + (c0 * e1 + c1 * e0) * I1[j] + c1 * e1 * I2[j]
    return L, Q


def solve(s, dxk=0.1, gk=1.08, x_max=30.0, sub=6, verbose=False):
    xk = r_edges(dxk, 6.0, x_max, gk)
    K = len(xk)
    pts = [0.0]
    for a_, b_ in zip(xk[:-1], xk[1:]):
        pts.extend(list(a_ + (b_ - a_) * (np.arange(sub) + 0.5) / sub))
        pts.append(b_)
    pts.extend(list(np.geomspace(xk[-1] * 1.01, 300.0, 40)))
    rr = np.array(pts)
    c = cp.Variable(K)
    lam = cp.Variable(4)
    mu = cp.Variable(nonneg=True)
    tau = cp.Variable(len(rr), nonneg=True)
    cons = [lam[3] >= 0]
    rows = []
    for i, r in enumerate(rr):
        L, Q = LQ(xk, r)
        act = np.where(np.diag(Q) > 1e-300)[0]
        if len(act):
            Qa = Q[np.ix_(act, act)]
            R = np.linalg.cholesky(Qa + 1e-13 * np.eye(len(act)) * max(1.0, Qa.max())).T
            # c^T Q c <= 2 mu tau   <=>   ||(sqrt2 R c, mu - tau)|| <= mu + tau
            cons.append(cp.SOC(mu + tau[i], cp.hstack([np.sqrt(2) * (R @ c[act]), mu - tau[i]])))
        else:
            cons.append(tau[i] == 0)
        rows.append(L)
    Lm = np.array(rows)
    v = rr ** 2
    sc = 1.0 / (1.0 + 0.02 * v ** 2 + 7e-5 * v ** 3)
    slack = lam[0] + lam[1] * v + lam[2] * v ** 2 + lam[3] * v ** 3 + Lm @ c - tau - rr
    scon = cp.multiply(sc, slack) >= 0
    cons.append(scon)
    M3 = 6 + 9 * s + C6 * s ** 1.5
    prob = cp.Problem(cp.Minimize(lam[0] + lam[1] + lam[2] * (2 + s) + lam[3] * M3 + mu * s / 24), cons)
    t0 = time.time()
    prob.solve(solver=cp.CLARABEL, verbose=verbose)
    p = np.maximum(scon.dual_value, 0) * sc
    # dense re-check
    rf = np.unique(np.concatenate([np.linspace(0, xk[-1], 3000), np.geomspace(xk[-1], 300.0, 200)]))
    cv, lv, mv = c.value, lam.value, float(mu.value)
    sl = []
    for r in rf:
        L, Q = LQ(xk, r)
        sl.append(lv[0] + lv[1] * r ** 2 + lv[2] * r ** 4 + lv[3] * r ** 6 + L @ cv - cv @ Q @ cv / (2 * mv) - r)
    sl = np.array(sl)
    out = dict(s=s, K=K, N=len(rr), value=float(prob.value), status=prob.status, secs=round(time.time() - t0, 1),
               min_slack=float(sl.min()), at_r=float(rf[sl.argmin()]), bound_N=float(prob.value - min(sl.min(), 0)),
               lam=[float(x) for x in lv], mu=mv)
    return out, rr, p


if __name__ == '__main__':
    svals = [float(x) for x in sys.argv[1].split(',')] if len(sys.argv) > 1 else [5.0]
    dxk = float(sys.argv[2]) if len(sys.argv) > 2 else 0.1
    for s in svals:
        out, rr, p = solve(s, dxk=dxk)
        print(json.dumps(out), flush=True)
        print('   law: mass %.6f  E V %.6f  E V^2 %.4f  E V^3 %.2f  E r %.6f' % (p.sum(), p @ rr ** 2, p @ rr ** 4, p @ rr ** 6, p @ rr))
        edges = [0, 0.5, 0.8, 0.85, 0.9, 0.95, 1.0, 1.1, 1.3, 2, 3, 5, 8, 14, 30, 300]
        print('   mass by r-bin: ' + '  '.join('[%g,%g): %.2e' % (a_, b_, p[(rr >= a_) & (rr < b_)].sum()) for a_, b_ in zip(edges[:-1], edges[1:])))
