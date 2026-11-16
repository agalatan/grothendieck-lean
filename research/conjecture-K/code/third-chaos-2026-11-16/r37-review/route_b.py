#!/usr/bin/env python3
"""Float feasibility experiment for a Lean port through the EXISTING radial Stein cuts
(claude-b9ee review of ledger row 3.7).  Not a proof.

RADIAL_REDUCTION.md: with a(u) = E_t[sin^2 t w(sqrt u cos t)], b(u) = E_t w(sqrt u cos t),
the scalar cut is dominated pointwise by the radial cut with test phi = b/2, Phi = u a,
Y = phi - Phi/u = b/2 - a, gamma = mu/4:
  Psi_w(sqrt u) <= G_R(u) = (Phi - phi) - (phi^2 + 2 Y^2)/(2 gamma).
The Lean cut family (Grothe/Lower/Law.lean, cutG) is exactly this radial cut for tests phi that
are piecewise linear in u on a v-mesh (t_k = v_k^2) and constant (= beta') beyond the last knot.
Here: (1) min of Q_R(v) = P(v^2) + G_R(v^2) - v with the exact phi; (2) the same with phi replaced
by its piecewise-linear interpolant on a uniform v-mesh of N cells on [0, T], constant w_K/2 beyond.
Usage: python3 -I route_b.py radius_certificates.json ROW [N T ...]
"""
import json, sys
import numpy as np
from fractions import Fraction as F

rows = json.load(open(sys.argv[1]))
gl_x, gl_w = np.polynomial.legendre.leggauss(16)

def setup(c):
    xi = np.array([float(F(x)) for x in c['xi']]); v = np.array([float(F(x)) for x in c['v']])
    mu = float(F(c['mu'])); l0, l1, l2, l3 = (float(F(c[k])) for k in ('lam0', 'lam1', 'L2', 'L3'))
    G = np.concatenate([[0.0], np.cumsum(np.diff(xi) * (v[1:] + v[:-1]) / 2)])
    def w(x): return np.interp(np.abs(x), xi, v)
    def V(x):
        s = np.sign(x); a = np.abs(x)
        k = np.clip(np.searchsorted(xi, a, side='right') - 1, 0, len(xi) - 1)
        return s * (G[k] + (a - xi[k]) * (v[k] + w(a)) / 2)
    def h(x):
        ww = w(x); return x * V(x) - ww / 2 - ww * ww / (2 * mu)
    def avg(f, r):
        """(2/pi) int_0^{pi/2} f(r cos t, t) dt with breakpoints at the knots."""
        th = [0.0]
        for x in xi[::-1]:
            if 0 < r and x < r:
                t = np.arccos(x / r)
                if t > th[-1] + 1e-15: th.append(t)
        if th[-1] < np.pi / 2: th.append(np.pi / 2)   # r = 0: the single interval [0, pi/2]
        tot = 0.0
        for a_, b_ in zip(th, th[1:]):
            tt = (a_ + b_) / 2 + (b_ - a_) / 2 * gl_x
            tot += (b_ - a_) / 2 * np.dot(gl_w, f(r * np.cos(tt), tt))
        return 2 / np.pi * tot
    P = lambda r: l0 + l1 * r ** 2 + l2 * r ** 4 + l3 * r ** 6
    return dict(w=w, h=h, avg=avg, P=P, mu=mu, wK=v[-1])

def main():
    i = int(sys.argv[2]); c = rows[i]; S = setup(c)
    w, h, avg, P, mu, wK = S['w'], S['h'], S['avg'], S['P'], S['mu'], S['wK']
    gam = mu / 4
    vs = np.concatenate([np.linspace(0, 10, 2001), np.linspace(10, 20, 401)[1:]])
    a = np.array([avg(lambda x, t: np.sin(t) ** 2 * w(x), r) for r in vs])
    b = np.array([avg(lambda x, t: w(x), r) for r in vs])
    Ew2 = np.array([avg(lambda x, t: w(x) ** 2, r) for r in vs])
    psi = np.array([avg(lambda x, t: h(x), r) for r in vs])
    u = vs ** 2
    # identity checks: Psi = u a - b/2 - E w^2/(2 mu)
    ident = np.max(np.abs(psi - (u * a - b / 2 - Ew2 / (2 * mu))))
    phi = b / 2; Y = b / 2 - a; Phi = u * a
    GR = (Phi - phi) - (phi ** 2 + 2 * Y ** 2) / (2 * gam)
    Q = P(vs) + psi - vs; QR = P(vs) + GR - vs
    print(f'row {i}: identity err {ident:.2e}; min Q (scalar) {Q.min():.4e} at v={vs[Q.argmin()]:.3f};'
          f' min Q_R (exact radial test) {QR.min():.4e} at v={vs[QR.argmin()]:.3f};'
          f' min (G_R - Psi) on v<=20 {np.min(QR - Q):.3e} (>= 0 by the projection inequality)', flush=True)
    # piecewise-linear-in-u interpolant on a uniform v-mesh, constant wK/2 beyond T
    args = sys.argv[3:] or ['100', '24', '200', '24', '400', '30', '800', '30']
    for N, T in zip(args[::2], args[1::2]):
        N = int(N); T = float(T)
        kv = np.linspace(0, T, N + 1); kt = kv ** 2
        kphi = np.array([avg(lambda x, t: w(x), r) for r in kv]) / 2
        kphi = np.append(kphi, wK / 2)            # value at the extra knot
        kt2 = np.append(kt, kt[-1] + 1.0)         # linear ramp to the constant over one unit of u
        # Phi(u) = int_0^u phi, exact for piecewise linear
        kPhi = np.concatenate([[0.0], np.cumsum(np.diff(kt2) * (kphi[1:] + kphi[:-1]) / 2)])
        def phit(uu): return np.interp(uu, kt2, kphi)
        def Phit(uu):
            j = np.clip(np.searchsorted(kt2, uu, side='right') - 1, 0, len(kt2) - 1)
            base = kPhi[j] + (uu - kt2[j]) * (kphi[j] + phit(uu)) / 2
            return np.where(uu > kt2[-1], kPhi[-1] + (uu - kt2[-1]) * kphi[-1], base)
        vv = np.concatenate([np.linspace(0, 10, 20001), np.linspace(10, 200, 20001)[1:]])
        uu = vv ** 2
        ph = phit(uu); Ph = Phit(uu)
        with np.errstate(divide='ignore', invalid='ignore'):
            Yt = np.where(uu > 0, ph - Ph / np.where(uu > 0, uu, 1), 0.0)
        Gt = (Ph - ph) - (ph ** 2 + 2 * Yt ** 2) / (2 * gam)
        Qt = P(vv) + Gt - vv
        j = int(np.argmin(Qt))
        print(f'   mesh N={N} cells on v in [0,{T}]: min Q~ = {Qt[j]:.4e} at v = {vv[j]:.4f}', flush=True)

if __name__ == '__main__':
    main()
