# Review of codex-a786's content-law package (worker of claude-b9ee, 16 Nov 2026).  N.
# Second route to the sharp profile-free constant theta_*(m) on P1 (cross-check of sharp_table.py, which integrates the
# conditional kernel given V): a Galerkin supremum over k' in the span of Gaussian bumps in log V,
#   sup_f (E[D f(W)])^2 / (E[W f^2] - (1/2)(E[W f])^2),  D = S(2 S P B - P),  W = P^2 S,  B = 1 + P/sqrt m,
# by plain two-dimensional quadrature in (P, S).  It is a lower bound for theta_* (a subspace) and must be close to it.
import math, sys
import numpy as np
from numpy.polynomial.legendre import leggauss
from scipy.special import gammaln
from scipy.linalg import eigh
def gl(ed, nq=10):
    x, w = leggauss(nq); ed = np.asarray(ed, float)
    return (np.concatenate([(ed[i] + ed[i + 1]) / 2 + (ed[i + 1] - ed[i]) / 2 * x for i in range(len(ed) - 1)]),
            np.concatenate([(ed[i + 1] - ed[i]) / 2 * w for i in range(len(ed) - 1)]))
def galerkin(mm, step=0.5, width=0.5):
    rt = math.sqrt(mm); pmax = 14 + 34 / rt
    geo = lambda top: np.concatenate([[0.0], top * 2.0 ** (-np.arange(120, -1, -1) / 4.0)])
    pp, wp = gl(geo(pmax)); pn, wn = gl(geo(rt)); p = np.concatenate([pp, -pn]); w = np.concatenate([wp, wn]); g = mm + rt * p
    wp_ = w * rt * np.exp((mm - 1) * np.log(g) - g - gammaln(mm)); B = 1 + p / rt
    S, wS = gl(np.concatenate([[0.0], 60 * 2.0 ** (-32.0 * np.arange(64, -1, -1) / 64)]), 8); wS = wS * np.exp(-S)
    cen = np.arange(-16.0, 10.01, step); nb = len(cen)
    C = np.zeros(nb); M = np.zeros((nb, nb)); mv = np.zeros(nb); tot = 0.0; ED = 0.0
    for i in range(0, len(p), 150):
        P_ = p[i:i + 150][:, None]; Bc = B[i:i + 150][:, None]; ww = (wp_[i:i + 150][:, None] * wS[None, :]).ravel()
        W = (P_ * P_ * S[None, :]).ravel(); D = (S[None, :] * (2 * S[None, :] * P_ * Bc - P_)).ravel()
        phi = np.exp(-(np.log(W)[None, :] - cen[:, None]) ** 2 / (2 * width * width))
        C += phi @ (ww * D); mv += phi @ (ww * W); M += (phi * (ww * W)[None, :]) @ phi.T; tot += ww.sum(); ED += ww @ D
    Q = M - 0.5 * np.outer(mv, mv)
    sc = 1 / np.sqrt(np.diag(Q)); Qs = Q * sc[:, None] * sc[None, :]; Cs = C * sc
    ev, U = eigh(Qs); keep = ev > 1e-10 * ev[-1]
    sup = float(((U[:, keep].T @ Cs) ** 2 / ev[keep]).sum())
    return 2 * sup / (3 * (4 + 12 / mm)), nb, int(keep.sum()), tot - 1, ED * rt / 4 - 1
REF = {1: 1.54731, 2: 1.30078, 4: 0.98135, 8: 0.65898, 21: 0.32199}          # sharp_table.log
for mm in (1, 2, 4, 8, 21):
    th, nb, nk, e1, e2 = galerkin(mm)
    print('m=%2d: Galerkin supremum (%d Gaussian bumps in log V, %d kept) = %.5f ; conditional-kernel value %.5f ; ratio %.5f | quadrature checks %.0e %.0e'
          % (mm, nb, nk, th, REF[mm], th / REF[mm], e1, e2))
    assert th <= REF[mm] * (1 + 2e-5) and th >= REF[mm] * 0.995
print('SHARP CONSTANT CONFIRMED BY A SECOND ROUTE (within 0.5 %, from below)')
