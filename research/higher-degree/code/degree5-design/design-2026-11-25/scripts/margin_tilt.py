#!/usr/bin/env python3
"""How the A/B secant margins of a row depend on the tilt (sA, sB) (N; searches give upper bounds of the infima).
For each tilt of a grid: mu0 = min_s lam_min(C - M(s)) (s in [0, 3], step 0.05) and mu_glob = the smallest m/|rho|^2 found by a coarse
scan (s in {0, 0.3, 0.5, ..., 1.2}, |rho| in {0.1, 0.2, 0.3, 0.45, 0.65}, Nelder-Mead over the direction from three starts) followed by a
free polish.  Definitions as in margin_scan.py.   usage: margin_tilt.py ROWS.lines t OUT.json E1 sA-list sB-list"""
import sys, os, json, math, time
import numpy as np
from numpy.polynomial.legendre import leggauss
from scipy.optimize import minimize
def zgrid(npan=60, nq=8, nth=224, R=6.6):
    x, w = leggauss(nq); ed = np.linspace(0, R, npan + 1)
    r = np.concatenate([(ed[i] + ed[i + 1]) / 2 + (ed[i + 1] - ed[i]) / 2 * x for i in range(npan)])
    wr = np.concatenate([(ed[i + 1] - ed[i]) / 2 * w for i in range(npan)]) * 2 * r * np.exp(-r * r)
    th = (np.arange(nth) + 0.5) * 2 * np.pi / nth
    Rm, TH = np.meshgrid(r, th, indexing='ij'); W = (wr[:, None] * np.ones(nth)[None, :] / nth).ravel()
    return (Rm * np.exp(1j * TH)).ravel(), W / W.sum()
rowsf, t, outf, E1 = sys.argv[1], float(sys.argv[2]), sys.argv[3], float(sys.argv[4])
SA = [float(x) for x in sys.argv[5].split(',')]; SB = [float(x) for x in sys.argv[6].split(',')]
rec = [r for r in (json.loads(l) for l in open(rowsf) if l.strip()) if abs(r['t'] - t) < 1e-9][0]
p1 = 1 / E1; z, w = zgrid(); T = np.abs(z) ** 2
e11 = T - 1; e20 = z * z / math.sqrt(2); e32 = z * (T * T - 6 * T + 6) / math.sqrt(12)
B = z * (rec['l'] + rec['beta'] * (T - 2)) + rec['nu5'] * e32; Dz = 1 - rec['bA'] * e11 - rec['bB'] * e20
S2 = np.arange(0, 3.0001, 0.05); bases = {}
def base(s):
    Y = B + s * Dz; aY = np.abs(Y); return Y, aY, np.conj(Y / aY)
out = []
for sa in SA:
    for tb in SB:
        t0 = time.time()
        C = np.diag([p1 - sa ** 2] * 2 + [p1 - tb ** 2] * 2); C[0, 2] = C[2, 0] = C[1, 3] = C[3, 1] = -sa * tb
        Bm = np.array([e11 + sa, 1j * (e11 + sa), e20 + tb, -1j * e20 + 1j * tb])
        def Rem(bs, x):
            Y, aY, cph = bs; d = (e11 + sa) * (x[0] + 1j * x[1]) + e20 * (x[2] - 1j * x[3]) + tb * (x[2] + 1j * x[3])
            return 2 * ((np.abs(Y + d) - aY - np.real(d * cph)) @ w)
        def M(s):
            Mm = np.zeros((4, 4))
            for A, sg in ((B + s * Dz, 1.0), (B - s * Dz, -1.0)):
                a = np.abs(A); Im_ = np.imag(sg * Bm * np.conj(A / a)[None, :]); Mm += (Im_ * (w / (2 * a))[None, :]) @ Im_.T
            return (Mm + Mm.T) / 2
        ev2 = [float(np.linalg.eigvalsh(C - M(s))[0]) for s in S2]; mu0 = min(ev2); best = (9, None)
        for s in (0.0, 0.3, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0, 1.2):
            bs = base(s); evs, V = np.linalg.eigh(C - M(s))
            for tau in (0.1, 0.2, 0.3, 0.45, 0.65):
                f = lambda v: (lambda x: (x @ C @ x - Rem(bs, x)) / (tau * tau))(v / np.linalg.norm(v) * tau)
                for x0 in (V[:, 0], np.array([0.74, 0.02, 0.67, 0.02]), np.array([0.74, 0.02, -0.67, 0.02])):
                    r = minimize(f, x0, method='Nelder-Mead', options={'xatol': 3e-3, 'fatol': 3e-5, 'maxiter': 60})
                    if r.fun < best[0]: best = (float(r.fun), np.concatenate([[s], r.x / np.linalg.norm(r.x) * tau]))
        neg = lambda v: (lambda s, x: ((x @ C @ x - Rem(base(s), x)) / (x @ x)) if x @ x >= 0.0064 else 9.0)(abs(v[0]), v[1:])      # |rho| >= 0.08: below, the quadrature does not resolve the zero of Y at small s
        rp = minimize(neg, best[1], method='Nelder-Mead', options={'xatol': 1e-4, 'fatol': 1e-7, 'maxiter': 400})
        mug = min(best[0], float(rp.fun), mu0); o = dict(sA=sa, sB=tb, mu0=mu0, mu_s0=ev2[0], mu_glob=mug, scan_min=best[0], at=[float(v) for v in rp.x], lam_min_cost=float(np.linalg.eigvalsh(C)[0]))
        out.append(o); json.dump(dict(t=t, row={k: rec[k] for k in ('l', 'beta', 'bA', 'bB', 'nu5')}, e1=E1, pts=out), open(outf, 'w'), indent=1)
        print('row %.3f tilt (%.2f, %.2f): mu0 %.4f (s=0: %.4f) mu_glob <= %.4f at s=%.3f rho=(%.3f%+.3fi, %.3f%+.3fi) [%.0fs]' % (t, sa, tb, mu0, ev2[0], mug, abs(rp.x[0]), rp.x[1], rp.x[2], rp.x[3], rp.x[4], time.time() - t0), flush=True)
