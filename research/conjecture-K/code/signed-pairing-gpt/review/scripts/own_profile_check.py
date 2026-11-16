#!/usr/bin/env python3
# Reviewer (N).  (a) The low-energy values of REVIEW.md section 3.5 recomputed with the reviewer's OWN profiles: G_A, G_B, G_0
#     evaluated directly from the row constants of the package's rows.json (z-quadrature graded toward z = 0), no table
#     of the content5 study; cubic X(|Y|^2 - 1) and the equal family m = 4; rows 0.80, 0.82, 0.84.
# (b) theta* over two-eigenvalue spectra A = diag(1, t), t in (-1, 1): is rank one the worst case?
#   argv: <scripts dir> <package rows.json> <content5 dir>
import sys, json, math
import numpy as np
from numpy.polynomial.legendre import leggauss
from scipy.interpolate import CubicSpline
sys.path.insert(0, sys.argv[1])
import siglib as L
rows = json.load(open(sys.argv[2])); C5 = sys.argv[3]

def zgrid(nth=960):
    e = [0.0] + L.geom_edges(1e-5, 0.3, 0.8) + list(np.linspace(0.3, 7.4, 96)[1:])
    r, w = L.panels(e, 8); w = w * 2 * r * np.exp(-r * r)
    th = (np.arange(nth) + 0.5) * 2 * np.pi / nth
    z = (r[:, None] * np.exp(1j * th)[None, :]).ravel(); wz = (w[:, None] * np.ones(nth)[None, :] / nth).ravel()
    return z, wz / wz.sum()
Z, WZ = zgrid()
def own_profiles(rec, svals):
    T = np.abs(Z) ** 2
    e11 = T - 1; e20 = Z * Z / math.sqrt(2); e32 = Z * (T * T - 6 * T + 6) / math.sqrt(12)
    Lp = Z * (rec['l'] + rec['beta'] * (T - 2)) + rec['nu5'] * e32; Dz = 1 - rec['bA'] * e11 - rec['bB'] * e20
    out = []
    for s in svals:
        Ap, Am = Lp + s * Dz, Lp - s * Dz
        d = Ap / np.maximum(np.abs(Ap), 1e-300) - Am / np.maximum(np.abs(Am), 1e-300)
        out.append((float(np.real((np.conj(e11) * d) @ WZ)), float(np.real((np.conj(e20) * d) @ WZ)), float(np.real(d @ WZ))))
    return np.array(out)
r, wr = L.r_grid(90.0)
K = {1: L.hermitian_kernels(L.EqualLaw(1), r), 4: L.hermitian_kernels(L.EqualLaw(4), r)}
S = np.concatenate([np.linspace(0, 0.1, 41), np.linspace(0.1, 1.0, 91)[1:], np.linspace(1.0, 6.0, 51)[1:]])
print('(a) ratio ||c||^2/(delta Omega_hat), larger of the two tilted profiles; "own" = reviewer\'s profiles, "table" = prof_k.npz')
for k, t in ((5, '0.80'), (7, '0.82'), (9, '0.84')):
    pk = [x for x in rows if x['t'] == t][0]; rec = {a: float(pk[a]) for a in ('l', 'beta', 'bA', 'bB', 'nu5')}; us = float(pk['sigma']) ** 2
    own = own_profiles(rec, S[1:]); own = np.vstack([[0, 0, 0], own])
    spl = [CubicSpline(S, own[:, i]) for i in range(3)]
    f = lambda i: (lambda s: spl[i](np.minimum(np.asarray(s, float), 6.0)))
    GAo, GBo, G0o = f(0), f(1), f(2)
    rec_t, GAt, GBt, G0t = L.load_row('%s/out/prof_%d.npz' % (C5, k))
    dmax = max(np.abs(own[:, 0] - GAt(S)).max(), np.abs(own[:, 1] - GBt(S)).max(), np.abs(own[:, 2] - G0t(S)).max())
    print('  row %s: largest difference between own profiles and the tables on %d radii in [0, 6]: %.1e' % (t, len(S), dmax))
    for m in (1, 4):
        p, w1, zp, _ = K[m]
        line = []
        for fr in (0.05, 0.1, 0.25, 0.5, 1.0):
            u = fr * us; sp = math.sqrt(u) * r; res = []
            for GA, GB, G0 in ((GAo, GBo, G0o), (GAt, GBt, G0t)):
                best = 0
                for G in (lambda x: GA(x) + 0.4 * G0(x), lambda x: GB(x) + 0.3 * G0(x)):
                    pr = L.Profile(G, u); f1 = pr.f1(sp)
                    c = float(wr @ (G(sp) * w1)); Om = 1.5 * float(wr @ (p * f1 * f1)) - 0.75 * float(wr @ (p * sp * f1)) ** 2 / u
                    best = max(best, c * c / (u * u * (4 + 12 / m) * Om))
                res.append(best)
            line.append('u = %g u*: own %.4f, table %.4f' % (fr, res[0], res[1]))
        print('    %-12s ' % ('X(|Y|^2-1)' if m == 1 else 'equal m=4') + ';  '.join(line), flush=True)
print('(b) theta* for A = diag(1, t) (normalised):')
vals = []
for tt in (-0.999, -0.9, -0.75, -0.5, -0.25, -0.1, -0.03, 0.03, 0.1, 0.25, 0.5, 0.75, 0.9, 0.97):
    law = L.TwoEigLaw(1.0, tt); p, w1, zp, _ = L.hermitian_kernels(law, r); pos = p > 1e-300
    ts = (2 / 3) * (float(wr[pos] @ (zp[pos] ** 2 / p[pos])) + float(wr @ (r * zp)) ** 2) / (4 + 12 * law.kappa)
    Th = (17 + 24 * law.kappa - (22 + 16 * law.kappa) ** 2 / (44 + 40 * law.kappa) + 16 * law.zeta) / (6 + 18 * law.kappa)
    vals.append((tt, law.kappa, ts, Th)); assert ts <= Th * (1 + 1e-6)
print('   ' + '  '.join('t=%g: %.4f (Theta %.4f)' % (a, c, d) for a, b, c, d in vals))
print('   largest: %.4f at t = %g; rank one (t = 0) has 1.5473' % max((c, a) for a, b, c, d in vals))
