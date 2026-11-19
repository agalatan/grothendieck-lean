"""N: continuum check of the scalar relaxation value.

From a discrete primal optimum p* (atoms), build the test weights omega_J = D_J/P_J (piecewise
constant even test w = mu*omega on the x-cells) and solve the 5-variable LP for
(lam0..lam3, mu) with the majorant imposed on a much finer r-grid that is unrelated to the
atoms.  The LP value is an upper bound of the continuum outer relaxation up to the fine-grid
resolution (label N).
"""
import os, sys, json, time
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))  # needed under python -I
import numpy as np
from scipy.optimize import linprog
from grid import r_edges, atoms, scalar_kernels, C6
from s0_scalar import solve_s0


def dual_check(s, dr, growth, xmerge, rfine_pts=40000, rcheck_max=300.0):
    out, r, v, p, e = solve_s0(s, dr=dr, growth=growth, xmerge=xmerge, ret=True)
    xe = e[::xmerge]
    if xe[-1] < e[-1]:
        xe = np.append(xe, e[-1])
    P, Mb = scalar_kernels(r, xe)
    PJ = P @ p
    DJ = (Mb - 0.5 * P) @ p
    om = np.where(PJ > 1e-14, DJ / np.maximum(PJ, 1e-300), 0.0)
    # fine check grid in r (not aligned with atoms): dense near 0, geometric beyond
    rc = np.unique(np.concatenate([np.linspace(0, 8, rfine_pts), np.geomspace(8, rcheck_max, 8000)]))
    Pc, Mc = scalar_kernels(rc, xe)
    Phi = (2 * om[:, None] * (Mc - 0.5 * Pc) - (om ** 2)[:, None] * Pc).sum(axis=0)
    M3 = 6 + 9 * s + C6 * s ** 1.5
    # variables lam0, lam1, lam2, lam3>=0, mu>=0 ; constraints -(...) <= -r
    A = -np.column_stack([np.ones_like(rc), rc ** 2, rc ** 4, rc ** 6, Phi])
    c = np.array([1.0, 1.0, 2 + s, M3, s / 24])
    # column scaling for conditioning
    sc = np.array([1.0, 1.0, 1e-2, 1e-6, 1.0])
    res = linprog(c * sc, A_ub=A * sc[None, :], b_ub=-rc,
                  bounds=[(None, None), (None, None), (None, None), (0, None), (0, None)], method="highs")
    lam = res.x * sc
    out.update(dual_lp=res.fun, lam=list(lam), dr=dr, xmerge=xmerge,
               budget_used=float(np.sum(2 * DJ ** 2 / np.maximum(PJ, 1e-300))), budget=s / 12)
    return out, (r, v, p, e, xe, om, lam)


if __name__ == "__main__":
    s = float(sys.argv[1]) if len(sys.argv) > 1 else 5.0
    for dr, gr, xm in [(0.05, 1.05, 4), (0.02, 1.03, 4), (0.02, 1.03, 8), (0.01, 1.02, 16)]:
        o, _ = dual_check(s, dr, gr, xm)
        print(json.dumps(o), flush=True)
