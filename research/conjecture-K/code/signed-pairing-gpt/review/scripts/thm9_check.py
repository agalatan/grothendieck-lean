#!/usr/bin/env python3
# Reviewer (N): Theorem 9 of PROOFS.md (Gaussian smoothing intertwines the radial transforms and contracts Omega_hat),
# on the core p = alpha X(|X|^2 - 2), Q = p + sqrt(s) W, a = E|p|^2 = 2 alpha^2, u = a + s, for two smooth bounded
# profiles.  Checks, by direct quadrature:
#   (20a) E_W[(z + sqrt(s)W) k'(|z + sqrt(s)W|^2)] = z K_s'(|z|^2)            (K_s' by finite differences of K_s)
#   (19)  E_W[(z + sqrt(s)W) h(|z + sqrt(s)W|^2)]  = z (K_s - a K_s')(|z|^2)
#   (19c) K_s = K_a-transform of h_s := K_s - a K_s'
#   (20b) Omega_hat_a[h_s; p] <= Omega_hat_u[h; Q],   and E[conj(p) F] = E[|p|^2 K_s'(|p|^2)]  (F = Q k'(|Q|^2))
import math
import numpy as np
from numpy.polynomial.laguerre import laggauss
TAU, WTAU = laggauss(90)
TW, WW = laggauss(70); NTH = 96
TH = (np.arange(NTH) + 0.5) * 2 * np.pi / NTH
Wn = (np.sqrt(TW)[:, None] * np.exp(1j * TH)[None, :]).ravel(); Ww = (WW[:, None] * np.ones(NTH)[None, :] / NTH).ravel()
def run(name, h, alpha, s):
    a = 2 * alpha * alpha; u = a + s; rs = math.sqrt(s)
    k = lambda v: (h(np.asarray(v, float)[..., None] + u * TAU) @ WTAU)
    kp = lambda v: (k(v) - h(np.asarray(v, float))) / u
    def Ks(v):                      # E k(|sqrt(v) + sqrt(s) W|^2)
        v = np.atleast_1d(np.asarray(v, float))
        z = np.sqrt(v)[:, None] + rs * Wn[None, :]
        return k(np.abs(z) ** 2) @ Ww
    def D(v):                       # E[(z + sqrt(s)W) k'(|.|^2)] / z  at z = sqrt(v)   (claimed: K_s'(v))
        v = np.atleast_1d(np.asarray(v, float))
        z = np.sqrt(v)[:, None] + rs * Wn[None, :]
        return np.real((z * kp(np.abs(z) ** 2)) @ Ww) / np.sqrt(v)
    def Hs_direct(v):               # E[(z + sqrt(s)W) h(|.|^2)] / z
        v = np.atleast_1d(np.asarray(v, float))
        z = np.sqrt(v)[:, None] + rs * Wn[None, :]
        return np.real((z * h(np.abs(z) ** 2)) @ Ww) / np.sqrt(v)
    vs = np.array([0.05, 0.3, 1.0, 2.7, 6.0])
    e = 1e-4
    fd = (Ks(vs + e) - Ks(vs - e)) / (2 * e)
    e20a = np.abs(fd - D(vs)).max()
    hs = lambda v: Ks(v) - a * D(v)
    e19 = np.abs(Hs_direct(vs) - hs(vs)).max()
    # K_a transform of h_s at a few v
    e19c = 0.0
    for v in (0.2, 1.3):
        pts = v + a * TAU
        good = WTAU > 1e-25
        val = float(hs(pts[good]) @ WTAU[good])
        e19c = max(e19c, abs(val - float(Ks(v)[0])))
    # law functionals
    T, WT = laggauss(110)
    P2 = a / 2 * T * (T - 2) ** 2                                    # |alpha p|^2
    Kp = D(np.maximum(P2, 1e-14))
    Om_core = 1.5 * float(WT @ (P2 * Kp ** 2)) - 0.75 * float(WT @ (P2 * Kp)) ** 2 / a
    # Q = alpha p + sqrt(s) W: by rotation invariance take p = alpha sqrt(T)(T-2) real
    pc = alpha * np.sqrt(T) * (T - 2)
    Qm = pc[:, None] + rs * Wn[None, :]; V = np.abs(Qm) ** 2; KPV = kp(V)
    EVk2 = float(WT @ ((V * KPV ** 2) @ Ww)); EVk = float(WT @ ((V * KPV) @ Ww))
    Om_Q = 1.5 * EVk2 - 0.75 * EVk ** 2 / u
    pF = float(WT @ (pc * np.real((Qm * KPV) @ Ww)))                 # E[conj(p) F]
    pK = float(WT @ (P2 * Kp))                                       # E[|p|^2 K_s'(|p|^2)]
    print('%-34s alpha = %.2f, s = %.2f (a = %.2f, u = %.2f): (20a) %.1e  (19) %.1e  (19c) %.1e | E[conj(p)F] = %.8f, E[|p|^2 K_s\'] = %.8f | Omega_hat core %.6f <= Omega_hat Q %.6f : %s' % (
        name, alpha, s, a, u, e20a, e19, e19c, pF, pK, Om_core, Om_Q, Om_core <= Om_Q))
    assert e20a < 1e-6 and e19 < 1e-7 and e19c < 1e-6 and abs(pF - pK) < 1e-7 and Om_core <= Om_Q
h1 = lambda v: 1 / (1 + v) + 0.3 * np.cos(v)
h2 = lambda v: np.tanh(v) - 0.5 * np.exp(-v / 3)
for name, h in (('h = 1/(1+v) + 0.3 cos v', h1), ('h = tanh v - exp(-v/3)/2', h2)):
    for alpha, s in ((0.5, 0.7), (0.3, 1.5), (0.8, 0.2)):
        run(name, h, alpha, s)
print('Theorem 9: all checks pass')
