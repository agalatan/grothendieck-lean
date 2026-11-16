"""N: independent dual of the OLD radial Stein family (R) of RADIAL_REDUCTION.md / Lean cutG.

For a bounded test a(u), continuous piecewise linear in u (knots at squares of the r-knots,
constant beyond the last knot), and gamma > 0, every circular cubic satisfies
   E[(U-1)a(U) - U a'(U) - {(a+Ua')^2 + 2U^2 a'^2}/(2 gamma)] <= gamma s/6 .
Dual: minimise lam0 + lam1 + lam2 (2+s) + lam3 M3 + gamma s/6 subject to, for all r >= 0 (u = r^2),
   r <= lam0 + lam1 u + lam2 u^2 + lam3 u^3 + cut(u),   lam3 >= 0.
The constraint is imposed on a grid (several points per knot interval) and then re-checked on
a finer grid.  Written without reference to radial.py.
"""
import os, sys, json, time
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np
import cvxpy as cp
from grid import r_edges, C6


def hat_matrices(uk, u):
    """values and derivatives at points u of the basis: hats at knots uk[0..K-1] in u, the last
    basis function is 1 beyond uk[-1] (constant tail)."""
    K = len(uk)
    A = np.zeros((len(u), K))
    dA = np.zeros((len(u), K))
    j = np.clip(np.searchsorted(uk, u, side='right') - 1, 0, K - 1)
    for i, (ui, ji) in enumerate(zip(u, j)):
        if ji >= K - 1:
            A[i, K - 1] = 1.0
        else:
            hl = uk[ji + 1] - uk[ji]
            lam = (ui - uk[ji]) / hl
            A[i, ji] = 1 - lam
            A[i, ji + 1] = lam
            dA[i, ji] = -1 / hl
            dA[i, ji + 1] = 1 / hl
    return A, dA


def solve_dual(s, dr_knot=0.1, growth=1.08, r_max=60.0, sub=6, verbose=False, sixth=True):
    ek = r_edges(dr_knot, 6.0, r_max, growth)
    uk = ek ** 2
    # evaluation points: sub points strictly inside each knot interval (in r), plus a tail
    pts = []
    for a_, b_ in zip(ek[:-1], ek[1:]):
        pts.extend(list(a_ + (b_ - a_) * (np.arange(sub) + 0.5) / sub))
    pts.extend(list(np.geomspace(ek[-1] * 1.001, 400.0, 60)))
    rr = np.array(pts)
    u = rr ** 2
    A, dA = hat_matrices(uk, u)
    K = len(uk)
    c = cp.Variable(K)
    lam = cp.Variable(4)
    gam = cp.Variable(nonneg=True)
    tau = cp.Variable(len(u), nonneg=True)
    a = A @ c
    uda = cp.multiply(u, dA @ c)
    M3 = 6 + 9 * s + C6 * s ** 1.5
    sc = 1.0 / (1.0 + u ** 3)
    poly = lam[0] + lam[1] * u + lam[2] * u ** 2 + lam[3] * u ** 3
    cut = cp.multiply(u - 1, a) - uda - tau
    cons = [cp.multiply(sc, poly + cut - rr) >= 0,
            cp.SOC(gam + tau, cp.vstack([np.sqrt(2) * (a + uda), 2 * uda, gam - tau]), axis=0)]
    #   (a+uda)^2 + 2 uda^2 <= 2 gam tau   <=>  || (sqrt2 (a+uda), 2 uda, gam - tau) || <= gam + tau
    if sixth:
        cons.append(lam[3] >= 0)
    else:
        cons.append(lam[3] == 0)
    obj = lam[0] + lam[1] + lam[2] * (2 + s) + lam[3] * M3 + gam * s / 6
    prob = cp.Problem(cp.Minimize(obj), cons)
    t0 = time.time()
    prob.solve(solver=cp.CLARABEL, verbose=verbose)
    out = dict(s=s, K=K, npts=len(u), value=prob.value, status=prob.status, secs=round(time.time() - t0, 2),
               lam=[float(x) for x in lam.value], gamma=float(gam.value))
    # finer re-check
    pts2 = []
    for a_, b_ in zip(ek[:-1], ek[1:]):
        pts2.extend(list(a_ + (b_ - a_) * (np.arange(8 * sub) + 0.5) / (8 * sub)))
    pts2.extend(list(np.geomspace(ek[-1] * 1.0001, 4000.0, 600)))
    r2 = np.array(pts2)
    u2 = r2 ** 2
    A2, dA2 = hat_matrices(uk, u2)
    cv = c.value
    a2 = A2 @ cv
    ud2 = u2 * (dA2 @ cv)
    l = lam.value
    gap = l[0] + l[1] * u2 + l[2] * u2 ** 2 + l[3] * u2 ** 3 + (u2 - 1) * a2 - ud2 \
        - ((a2 + ud2) ** 2 + 2 * ud2 ** 2) / (2 * gam.value) - r2
    out['min_gap_fine'] = float(gap.min())
    out['argmin_r'] = float(r2[gap.argmin()])
    return out, (ek, cv, l, gam.value)


if __name__ == "__main__":
    svals = [float(x) for x in sys.argv[1].split(',')] if len(sys.argv) > 1 else [5.0]
    drk = float(sys.argv[2]) if len(sys.argv) > 2 else 0.1
    for s in svals:
        o, _ = solve_dual(s, dr_knot=drk)
        print(json.dumps(o), flush=True)
