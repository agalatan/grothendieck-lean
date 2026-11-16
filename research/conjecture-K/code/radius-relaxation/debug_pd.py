"""Debug: primal (kernel form) and dual (cut form) of the old radial family on identical data."""
import os, sys
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np, cvxpy as cp
from grid import r_edges, atoms, C6
from outer import test_matrices, grids, rot

s = 5.0
for drk, gk, sub, scale_pow in [(0.2, 1.08, 6, 3), (0.2, 1.08, 6, 0), (0.1, 1.08, 6, 3)]:
    ek, e = grids(drk, gk, sub, 60.0)
    r, v = atoms(e)
    uk = ek ** 2
    F, G, Y = test_matrices(uk, v)
    N, K = len(v), len(uk)
    M3 = 6 + 9 * s + C6 * s ** 1.5
    # ---------- dual (cut form) ----------
    c = cp.Variable(K); lam = cp.Variable(4); gam = cp.Variable(nonneg=True); tau = cp.Variable(N, nonneg=True)
    phi = F.T @ c; Gc = G.T @ c; Yc = Y.T @ c
    sc = 1.0 / (1.0 + v ** 3)
    poly = lam[0] + lam[1] * v + lam[2] * v ** 2 + lam[3] * v ** 3
    cons = [cp.multiply(sc, poly + Gc - phi - tau - r) >= 0, lam[3] >= 0,
            cp.SOC(gam + tau, cp.vstack([np.sqrt(2) * phi, 2 * Yc, gam - tau]), axis=0)]
    dprob = cp.Problem(cp.Minimize(lam[0] + lam[1] + lam[2] * (2 + s) + lam[3] * M3 + gam * s / 6), cons)
    dprob.solve(solver=cp.CLARABEL)
    # ---------- primal (kernel form) ----------
    w = 1.0 / (1.0 + v ** scale_pow) if scale_pow else np.ones(N)
    pi_ = cp.Variable(N, nonneg=True); z1 = cp.Variable(N); z2 = cp.Variable(N)
    t1 = cp.Variable(N, nonneg=True); t2 = cp.Variable(N, nonneg=True)
    Fw, Gw, Yw = F * w, G * w, Y * w
    pc = [(Gw - Fw) @ pi_ - Fw @ z1 - Yw @ z2 == 0,          # E[G - phi] = E[zeta1 phi + zeta2 Y]
          w @ pi_ == 1, (w * v) @ pi_ == 1, (w * v ** 2) @ pi_ == 2 + s, (w * v ** 3) @ pi_ <= M3,
          rot(z1, pi_, t1), rot(z2, pi_, t2), w @ t1 + 0.5 * (w @ t2) <= s / 3]
    pprob = cp.Problem(cp.Maximize((w * r) @ pi_), pc)
    pprob.solve(solver=cp.CLARABEL)
    print(dict(drk=drk, K=K, N=N, scale_pow=scale_pow, dual=dprob.value, dstat=dprob.status, primal=pprob.value, pstat=pprob.status))
    p = w * pi_.value
    print('   primal law: sum', p.sum(), 'EV', p @ v, 'EV2', p @ v ** 2, 'EV3', p @ v ** 3, 'M3', M3,
          ' budget', (w @ t1.value + 0.5 * (w @ t2.value)), s / 3, ' id resid', np.abs((Gw - Fw) @ pi_.value - Fw @ z1.value - Yw @ z2.value).max())
