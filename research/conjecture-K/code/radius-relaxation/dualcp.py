"""Cutting-plane driver for dual.py (N).

solve -> re-check (*) on a dense grid with the tests and multipliers fixed (exact inner minimum
over the kernel cone, as one separable QP) -> add the worst violated point of every knot
interval -> re-solve.  Reports the dual value, the smallest dense slack and
bound_N = value - min(slack, 0) (shifting lam0 restores (*) on the dense grid).
"""
import os, sys, json, time
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np
import cvxpy as cp
from grid import r_edges, C6
from outer import test_matrices
import dual as D


def inner_min(sol, mode, ek, rf, opts=None, want_k=False):
    """min over k in the kernel cone of  beta.k + sum_j mu_j (l_j.k - c_j)^2  at the points rf;
    returns slack(rf) of (*).  Closed form when there is no cone."""
    o = dict(D.MODES[mode])
    if opts:
        o.update(opts)
    uk = ek ** 2
    v = rf ** 2
    F, G, Y = test_matrices(uk, v)
    c1, c2, lam, mu, sg = sol['c1'], sol['c2'], sol['lam'], sol['mu'], sol['sigma']
    phi1, G1, Y1 = F.T @ c1, G.T @ c1, Y.T @ c1
    phi2, G2, Y2 = F.T @ c2, G.T @ c2, Y.T @ c2
    b2, b1, ba = -phi1, -0.5 * phi2, -(Y1 + 0.5 * Y2) + sg * v
    base = lam[0] + lam[1] * v + lam[2] * v ** 2 + lam[3] * v ** 3 + G1 + G2 - rf
    act = [j for j in range(len(D.CJ)) if (j + 1) in o['budgets']]
    if o['cone'] == 'none':
        # (k2,k1) only through k1+k2 (mix) and at: unconstrained quadratic minimum
        # mu3 (K-3)^2 + b2 K (b1 = b2 for the mix identity)  and  mu5 at^2 + ba at
        m3, m5 = mu[2], mu[4]
        val = b2 * 3 - b2 ** 2 / (4 * m3) - ba ** 2 / (4 * m5)
        return base + val
    N = len(v)
    sc = 1.0 / (1.0 + np.abs(base) + np.abs(b2) + np.abs(b1) + np.abs(ba))
    k2 = cp.Variable(N, nonneg=True)
    k1 = cp.Variable(N, nonneg=True)
    ka = cp.Variable(N)
    cons = []
    if o['cone'] == 'cone':
        cons.append(cp.SOC(k1 + k2, cp.vstack([2 * ka, k1 - k2]), axis=0))
    expr = cp.multiply(sc * b2, k2) + cp.multiply(sc * b1, k1) + cp.multiply(sc * ba, ka)
    quad = 0
    ks = (k2, k1, ka)
    for j in act:
        lin = sum(D.LJ[j, i] * ks[i] for i in range(3) if D.LJ[j, i] != 0) - D.CJ[j]
        quad = quad + mu[j] * cp.sum(cp.multiply(sc, cp.square(lin)))
    prob = cp.Problem(cp.Minimize(cp.sum(expr) + quad), cons)
    prob.solve(solver=cp.CLARABEL)
    K2, K1, KA = k2.value, k1.value, ka.value
    val = b2 * K2 + b1 * K1 + ba * KA
    for j in act:
        val = val + mu[j] * (D.LJ[j, 0] * K2 + D.LJ[j, 1] * K1 + D.LJ[j, 2] * KA - D.CJ[j]) ** 2
    if want_k:
        return base + val, (K2, K1, KA)
    return base + val


def dense_points(ek, per=40, tail=200, tail_max=300.0):
    pts = [0.0]
    for a_, b_ in zip(ek[:-1], ek[1:]):
        pts.extend(list(a_ + (b_ - a_) * (np.arange(per) + 0.5) / per))
        pts.append(b_)
    pts.extend(list(np.geomspace(ek[-1] * 1.0005, tail_max, tail)))
    return np.array(pts)


def solve_cp(s, mode, drk=0.2, gk=1.08, sub=8, r_max=30.0, opts=None, rounds=6, tol=2e-6, per=40, log=None,
             r_fine=6.0, ek=None):
    if ek is None:
        ek = r_edges(drk, r_fine, r_max, gk)
    rr = D.check_points(ek, sub, tail=40, tail_max=300.0)
    rf = dense_points(ek, per=per)
    hist = []
    t0 = time.time()
    sol = None
    out = None
    for it in range(rounds):
        prob, info = D.build(s, mode, ek, rr, opts)
        try:
            prob.solve(solver=cp.CLARABEL)
        except Exception as ex:  # noqa
            hist.append(dict(it=it, error=str(ex)[:80]))
            break
        if info['lam'].value is None:
            hist.append(dict(it=it, status=prob.status))
            break
        sg = info['sigma']
        c2 = info['c2'].value
        sol = dict(c1=info['c1'].value, c2=c2, lam=info['lam'].value, mu=np.maximum(info['mu'].value, 0.0),
                   sigma=float(sg.value) if hasattr(sg, 'value') else 0.0, ek=ek)
        if 'l3' in info:
            sol['l3'] = np.maximum(info['l3'].value, 0.0)
        if 'stat' in info:
            try:
                sol['par'] = np.array([float(c.dual_value) for c in info['stat']])
            except Exception:
                pass
        try:
            sl = inner_min(sol, mode, ek, rf, opts)
        except Exception as ex:  # noqa
            hist.append(dict(it=it, value=prob.value, status=prob.status, fine='error %s' % type(ex).__name__))
            break
        scl = sl / (1.0 + rf ** 6 * max(sol['lam'][3], 1e-9))      # relative size in the far tail
        hist.append(dict(it=it, n=len(rr), value=float(prob.value), status=prob.status, min_slack=float(sl.min()),
                         at_r=float(rf[sl.argmin()])))
        out = dict(s=s, mode=mode, K=len(ek), N=len(rr), value=float(prob.value), status=prob.status,
                   min_slack=float(sl.min()), at_r=float(rf[sl.argmin()]), bound_N=float(prob.value - min(sl.min(), 0.0)),
                   lam=[float(x) for x in sol['lam']], mu=[float(x) for x in sol['mu']], sigma=sol['sigma'])
        if log:
            print(json.dumps(hist[-1]), file=log, flush=True)
        if sl.min() > -tol:
            break
        # add the worst point of every knot interval where the slack is below -tol/4
        edges = np.concatenate([ek, [np.inf]])
        idx = np.searchsorted(edges, rf, side='right') - 1
        new = []
        for k in np.unique(idx):
            m = np.where(idx == k)[0]
            j = m[np.argmin(sl[m])]
            if sl[j] < -tol / 4:
                new.append(rf[j])
                # neighbours help against oscillation
                if j > 0: new.append(rf[j - 1])
                if j + 1 < len(rf): new.append(rf[j + 1])
        rr = np.unique(np.concatenate([rr, np.array(new)]))
    if out is None:
        out = dict(s=s, mode=mode, K=len(ek), error=True)
    out.update(secs=round(time.time() - t0, 1), rounds=len(hist), drk=drk, gk=gk, r_max=r_max)
    if opts:
        out['opts'] = opts
    return out, sol, hist


if __name__ == "__main__":
    svals = [float(x) for x in sys.argv[1].split(',')] if len(sys.argv) > 1 else [5.0]
    modes = sys.argv[2].split(',') if len(sys.argv) > 2 else ['R0', 'L', 'G', 'N']
    drk = float(sys.argv[3]) if len(sys.argv) > 3 else 0.2
    gk = float(sys.argv[4]) if len(sys.argv) > 4 else 1.08
    r_max = float(sys.argv[5]) if len(sys.argv) > 5 else 30.0
    for s in svals:
        for m in modes:
            o, sol, hist = solve_cp(s, m, drk=drk, gk=gk, r_max=r_max, log=sys.stderr)
            print(json.dumps(o), flush=True)
