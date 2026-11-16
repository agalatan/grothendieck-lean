"""Task 1 (N): the relaxation behind ledger row 3.7, rebuilt as an SOCP over laws of V.

maximise E sqrt(V) over laws of V >= 0 with
  E V = 1, E V^2 = 2 + s, E V^3 <= 6 + 9 s + C6 s^{3/2},
  scalar Stein family for X = sqrt(V) cos(Theta):  E (tau_X(X) - 1/2)^2 <= s/12,
  imposed for piecewise-constant even tests w on x-cells (an outer relaxation of the family):
      sum_J 2 (Mb_J - P_J/2)^2 / P_J <= s/12.
"""
import os, sys, json, time
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))  # needed under python -I
import numpy as np
import cvxpy as cp
from grid import r_edges, atoms, scalar_kernels, C6


def solve_s0(s, dr=0.02, r_fine=6.0, r_max=60.0, growth=1.03, xmerge=1, stein=True, sixth=True,
             verbose=False, ret=False):
    e = r_edges(dr, r_fine, r_max, growth)
    r, v = atoms(e)
    N = len(r)
    w = 1.0 / (1.0 + v ** 3)
    pi_ = cp.Variable(N, nonneg=True)
    p = cp.multiply(w, pi_)
    cons = [cp.sum(p) == 1, (w * v) @ pi_ == 1, (w * v ** 2) @ pi_ == 2 + s]
    if sixth:
        cons.append((w * v ** 3) @ pi_ <= 6 + 9 * s + C6 * s ** 1.5)
    if stein:
        xe = e[::xmerge]
        if xe[-1] < e[-1]:
            xe = np.append(xe, e[-1])
        P, Mb = scalar_kernels(r, xe)
        Pw, Mw = P * w[None, :], Mb * w[None, :]
        # row scaling: divide each x-cell row by its largest entry of Pw (scale-free cones)
        sc = 1.0 / np.maximum(Pw.max(axis=1), 1e-300)
        PJ = (Pw * sc[:, None]) @ pi_
        DJ = ((Mw - 0.5 * Pw) * sc[:, None]) @ pi_
        tau = cp.Variable(len(sc), nonneg=True)
        # DJ^2 <= PJ * tau  ; budget sum 2 tau / sc <= s/12
        cons.append(cp.SOC(PJ + tau, cp.vstack([2 * DJ, PJ - tau]), axis=0))
        cons.append(2 * (1.0 / sc) @ tau <= s / 12)
    prob = cp.Problem(cp.Maximize((w * r) @ pi_), cons)
    t0 = time.time()
    prob.solve(solver=cp.CLARABEL, verbose=verbose)
    out = dict(s=s, N=N, value=prob.value, status=prob.status, secs=time.time() - t0)
    if ret:
        return out, r, v, w * pi_.value, e
    return out


if __name__ == "__main__":
    svals = [float(a) for a in sys.argv[1:]] or [5.0]
    for s in svals:
        print(json.dumps(solve_s0(s)), flush=True)
