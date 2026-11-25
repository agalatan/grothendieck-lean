#!/usr/bin/env python3
"""The row bound of a degree-5 game (1, -eps, eta) with zero sector cost, in the Gaussian ideal and in the law layer  [N, float].
Row (ledger 4.1; engine ../../degree5-design/d5eng.py):  V <= t^2 - 2 l t + 2 beta^2/eps + sup over (sigma, nu, law of U = |q|^2/sigma^2) of
    E_U Psi(sigma sqrt U; nu) - kappa sigma^2 - nu^2/eta,   kappa = 1/eps - (bA^2 + bB^2)/eta,
    Psi(s; nu) = E_z |L + nu e32 + s D| + |L + nu e32 - s D|   (the sector inequality K5 with zero allowance is ASSUMED: this is the
    value the certificate must beat if every sector cost vanished).
  gauss: U ~ Exp(1) (the diffuse remote cubic): the Gaussian ideal of the row.
  law  : the plain law class of ledger 4.42: E U = 1, E U^2 = m in [2, 44], E U^3 <= 9m - 12 + C6 (m - 2)^(3/2), E sqrt U <= rho0
         (no Stein family); a linear program on a grid of U for each (sigma, nu, m) of a grid, refined once around the best point:
         a LOWER estimate of the law-layer supremum (grids), i.e. the certified constant of such a row can only be larger.
  Psi is tabulated on a grid of s (step 0.0025 near 0) and splined (cubic) in s; nu is on a grid (final step 0.001).
Rows: t = 0 uses the zero row (optimal at t = 0 by the symmetry z -> -z and convexity); for t > 0 the row (l, beta, bA, bB) is
optimised in the Gaussian ideal by Nelder-Mead from the start given (a local search: a better row can only lower both values).
usage: law_rows.py OUT.json EPS ETA RHO0 "t[:l,beta,bA,bB] ..."      e.g.  law_rows.py o.json 0.78 0.0779 0.9148 "0 0.85:0.8486,0.1379,-0.0495,-0.0277"
       a row given as t=l,beta,bA,bB (with '=') is evaluated as it is, without optimisation."""
import sys, os, json, time, math, numpy as np
HERE = os.path.dirname(os.path.abspath(__file__)); sys.path.insert(0, os.environ.get('D5_DIR', os.path.join(HERE, '..', '..', 'degree5-design')))
import d5eng as D
from scipy.optimize import minimize, linprog
from scipy.interpolate import CubicSpline
from numpy.polynomial.laguerre import laggauss
out, eps, eta, rho0 = sys.argv[1], float(sys.argv[2]), float(sys.argv[3]), float(sys.argv[4]); C6 = 40.45313
NU = np.linspace(-0.04, 0.16, 21) if eta > 0.15 else np.linspace(-0.03, 0.12, 16)
SG = np.concatenate([np.linspace(0, 0.6, 241), np.linspace(0.6, 9, 169)[1:], np.linspace(9, 40, 63)[1:]])   # s-grid of Psi (step 0.0025 near 0)
PS = lambda P, j: CubicSpline(SG, P[:, j])        # Psi is convex in s: linear interpolation would overestimate it
UL, WL = laggauss(70); gc = D.zgrid(npan=40, nq=8, nth=256, half=True); gf = D.zgrid(half=True)
def psi(row, nus=None):
    return row.psi_grid(SG, NU if nus is None else nus)
def kappa(row): return 1 / eps - (row.bA ** 2 + row.bB ** 2) / eta
def gauss_grid(row, P, nus, sig):
    """max over the grids nus x sig of E_{U~Exp(1)} Psi - kappa sigma^2 - nu^2/eta."""
    kap = kappa(row); best = (-9, 0, 0)
    for j, nu in enumerate(nus):
        sp = CubicSpline(SG, P[:, j]); f = np.array([(WL * sp(np.minimum(s * np.sqrt(UL), 40.0))).sum() for s in sig]) - kap * sig ** 2 - nu * nu / eta
        i = int(f.argmax())
        if f[i] > best[0]: best = (float(f[i]), float(sig[i]), float(nu))
    return best
def gauss_value(row, P=None, fine=True):
    """two stages: the grid NU x (step 0.01 in sigma), then nu-step 0.001 and sigma-step 0.001 around the best point (Psi recomputed there)."""
    b = gauss_grid(row, psi(row) if P is None else P, NU, np.linspace(0, 1.3, 131))
    if not fine: return b
    nus = b[2] + np.linspace(-0.01, 0.01, 21); sig = np.clip(b[1] + np.linspace(-0.02, 0.02, 41), 0, None)
    b2 = gauss_grid(row, psi(row, nus), nus, sig); return b2 if b2[0] > b[0] else b
U_ = np.concatenate([[0.0], np.linspace(0, 20, 601)[1:], np.linspace(20, 600, 120)[1:]]); AEQ = np.vstack([np.ones_like(U_), U_, U_ ** 2]); AUB = [U_ ** 3, np.sqrt(U_)]
def law_grid(row, P, nus, sigs, ms):
    kap = kappa(row); best = (-9, None)
    for j, nu in enumerate(nus):
        sp = CubicSpline(SG, P[:, j])
        for sig in sigs:
            fu = sp(np.minimum(sig * np.sqrt(U_), 40.0))
            for m in ms:
                r = linprog(-fu, A_ub=AUB, b_ub=[9 * m - 12 + C6 * (m - 2) ** 1.5, rho0], A_eq=AEQ, b_eq=[1, 1, m], bounds=(0, None), method='highs')
                if r.status == 0 and -r.fun - kap * sig * sig - nu * nu / eta > best[0]:
                    x = r.x; best = (float(-r.fun - kap * sig * sig - nu * nu / eta), dict(sigma=round(float(sig), 4), nu=round(float(nu), 4), m=float(m), mass_at_0=float(x[0]), mean_sqrtU=float(np.sqrt(U_) @ x)))
    return best
def law_value(row, P):
    """two stages as gauss_value: coarse (NU, sigma-step 0.025, 12 values of m = E U^2), then nu-step 0.001, sigma-step 0.0025 and
    a finer list of m around the best point."""
    M0 = [2.0, 2.05, 2.2, 2.5, 3.0, 3.5, 4.0, 5.0, 7.0, 10.0, 20.0, 44.0]
    b = law_grid(row, P, NU, np.arange(0.0, 1.3, 0.025), M0); a = b[1]
    nus = a['nu'] + np.linspace(-0.01, 0.01, 21); sigs = np.clip(a['sigma'] + np.linspace(-0.025, 0.025, 21), 0, None)
    k = M0.index(a['m']); ms = np.unique(np.concatenate([np.linspace(M0[max(k - 1, 0)], M0[min(k + 1, len(M0) - 1)], 9), [a['m']]]))
    b2 = law_grid(row, psi(row, nus), nus[::2], sigs[::2], ms); return b2 if b2[0] > b[0] else b
res = []
for item in sys.argv[5].split():
    t0 = time.time(); fixed = '=' in item; ts, _, ps = item.replace('=', ':').partition(':'); t = float(ts)
    p = [float(x) for x in ps.split(',')] if ps else [0.0, 0.0, 0.0, 0.0]; nfev = 0
    if t > 0 and not fixed:
        def f(q):
            rw = D.Row(t, *q, e1=eps, eta=eta, grid=gc); return rw.const() + gauss_value(rw)[0]
        r = minimize(f, p, method='Nelder-Mead', options={'xatol': 3e-5, 'fatol': 3e-9, 'maxiter': 260, 'initial_simplex': [p] + [[p[i] + (0.01 if i == j else 0) for i in range(4)] for j in range(4)]})
        p = [float(x) for x in r.x]; nfev = r.nfev
    rw = D.Row(t, *p, e1=eps, eta=eta, grid=gf); P = psi(rw); g = gauss_value(rw, P); lw = law_value(rw, P); lp_raw = rw.const() + lw[0]
    if lw[0] < g[0]: lw = (g[0], dict(sigma=g[1], nu=g[2], m=2.0, mass_at_0=0.0, mean_sqrtU=float(np.sqrt(np.pi) / 2), note='the Gaussian law (it belongs to the class); the grid of the law program found less'))
    rec = dict(eps=eps, eta=eta, rho0=rho0, t=t, row=p, optimised=bool(t > 0 and not fixed), nfev=nfev, const=rw.const(), gauss=rw.const() + g[0], gauss_at=dict(sigma=g[1], nu=g[2]),
               law=rw.const() + lw[0], law_lp=lp_raw, law_at=lw[1], law_minus_gauss=lw[0] - g[0], secs=round(time.time() - t0))
    res.append(rec); print(json.dumps(rec), flush=True); json.dump(res, open(out, 'w'), indent=1)
