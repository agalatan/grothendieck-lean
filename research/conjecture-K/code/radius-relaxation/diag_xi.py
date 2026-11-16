"""Diagnostic (N): cost of restricting the cone multiplier xi to piecewise-linear functions.
xi = piecewise linear on the knots + a free per-point cone element on a mask of check points."""
import os, sys
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np, cvxpy as cp
import make_cert as MC
from outer import test_matrices


def variant(s, ek, rr, free_mask, mu_floor=2e-6, ret=False):
    uk = ek**2; v = rr**2; N = len(v)
    Fm, Gm, Ym = test_matrices(uk, v); n = len(uk)
    f1, f2 = cp.Variable(n), cp.Variable(n)
    lam = cp.Variable(3); l3 = cp.Variable(3, nonneg=True); mu = cp.Variable(5, nonneg=True); sig = cp.Variable()
    cons = [mu >= mu_floor]
    phi1, G1, Y1 = Fm.T @ f1, Gm.T @ f1, Ym.T @ f1
    phi2, G2, Y2 = Fm.T @ f2, Gm.T @ f2, Ym.T @ f2
    x2, x1, xa = cp.Variable(n, nonneg=True), cp.Variable(n, nonneg=True), cp.Variable(n)
    cons.append(cp.SOC(x2 + x1, cp.vstack([xa, x2 - x1]), axis=0))
    e2 = cp.Variable(N, nonneg=True); e1 = cp.Variable(N, nonneg=True); ea = cp.Variable(N)
    cons.append(cp.SOC(e2 + e1, cp.vstack([ea, e2 - e1]), axis=0))
    off = np.where(~free_mask)[0]
    if len(off):
        cons += [e2[off] == 0, e1[off] == 0, ea[off] == 0]
    xi1, xi2, xia = Fm.T @ x1 + e1, Fm.T @ x2 + e2, Fm.T @ xa + ea
    t2, t4 = cp.Variable(n), cp.Variable(n)
    th2, th4 = Fm.T @ t2, Fm.T @ t4
    th3 = xi1 + 0.5 * phi2 - th2 - th4
    th1 = xi2 + phi1 + th2 - th3
    th5 = xia + Y1 + 0.5 * Y2 - sig * v
    ths = [th1, th2, th3, th4, th5]
    tau = cp.Variable((5, N), nonneg=True)
    for j in range(5):
        cons.append(cp.SOC(mu[j] + tau[j], cp.vstack([ths[j], mu[j] - tau[j]]), axis=0))
    slack = (lam[0] + lam[1] * v + lam[2] * v ** 2 + cp.sum(l3) * v ** 3 + G1 + G2 - th1 - th2 - 3 * th3 - 2 * th4 - cp.sum(tau, axis=0) - rr)
    sc = 1.0 / (1.0 + 0.02 * v ** 2 + 7e-5 * v ** 3)
    scon = cp.multiply(sc, slack) >= 0
    cons.append(scon)
    base = lam[0] + lam[1] + lam[2] * (2 + s) + l3[0] * (6 + 9 * s + MC.C6f * s ** 1.5) + (l3[1] + l3[2]) * (6 + 9 * s)
    pd, pc = MC.param_dual(s, mu, sig, l3, True)
    prob = cp.Problem(cp.Minimize(base + pd), cons + pc)
    prob.solve(solver=cp.CLARABEL)
    if ret:
        return prob.value, dict(p=np.maximum(scon.dual_value, 0) * sc, sig=sig.value, mu=mu.value, lam=lam.value, l3=l3.value,
                                f1=f1.value, f2=f2.value, e=(e2.value, e1.value, ea.value), x=(x2.value, x1.value, xa.value))
    return prob.value


if __name__ == '__main__':
    s = float(sys.argv[1]) if len(sys.argv) > 1 else 5.0
    scheme = sys.argv[2] if len(sys.argv) > 2 else 'far'
    ek = np.array([float(x) for x in MC.knots_scheme(scheme)])
    rr = MC.check_points(ek, 8)
    print('knots', scheme, len(ek), 'last', ek[-1], 'points', len(rr), 'max r', rr.max())
    for name, lo, hi in [('none', 1, 0), ('r<2', 0, 2), ('2-8', 2, 8), ('8-14', 8, 14), ('14-20', 14, 20), ('20-30', 20, 30), ('30-40', 30, 40),
                         ('>40', 40, 1e9), ('all', 0, 1e9)]:
        mask = (rr >= lo) & (rr < hi)
        val, d = variant(s, ek, rr, mask, ret=True)
        p = d['p']
        print('free xi on %-6s: %.6f   sigma %.2e  mass beyond r=14: %.2e  beyond 30: %.2e  l3 %s' % (
            name, val, float(d['sig']), p[rr > 14].sum(), p[rr > 30].sum(), np.array2string(d['l3'], precision=3)), flush=True)
