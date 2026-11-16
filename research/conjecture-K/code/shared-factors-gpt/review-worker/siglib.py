# Reviewer's numerical library for the signed-pairing package (claude-b9ee review worker, 16 Nov 2026).  N.
#
# Everything is reduced to one-dimensional kernels on the radius r = |q| of a normalised cubic (E|q|^2 = 1 for the
# Hermitian-factor class; beta = 1 for the heavy-coordinate limit model):
#     p(r)    density of |q|
#     w1(r)   content kernel:   E[conj(X) ph(q) g(|q|)]         = int g(r) w1(r) dr
#     zp(r)   Z kernel:         E[conj(Z) ph(q) g(|q|)]         = int g(r) zp(r) dr      (Z of Lemma 2 / C_0 of Lemma 10)
#     np(r)   N kernel (Hermitian-factor class): the same for the tangent divergence N of Lemma 3; must vanish.
# so that  E[Z | q] = ph(q) zp(|q|)/p(|q|)  and  ||E[Z|q]||^2 = int zp^2/p dr.
#
# Hermitian-factor class, q = X B, B = sum_j lam_j (T_j - 1) with sum lam_j^2 = 1, C = sum_j lam_j^2 T_j:
#     conditional on B = b, r = sqrt(S)|b| has density kappa(r, b) = (2r/b^2) exp(-r^2/b^2) and S = r^2/b^2, so
#     E[phi(S, B); |q| in dr] = E_B[kappa(r, B) phi(r^2/B^2, B)] dr.
# Limit model, Q = rho p(X) + W, p(X) = X(T - 2), T = |X|^2: conditional on X, |Q| is Rice with centre a = rho sqrt(T)|T-2|:
#     density 2s exp(-s^2 - a^2) I_0(2as), and E[ph(Q) conj(ph p(X)) | X, |Q| = s] = I_1(2as)/I_0(2as).
import math
import numpy as np
from numpy.polynomial.legendre import leggauss
from scipy.special import gammaln, ive
from scipy.interpolate import CubicSpline


def panels(edges, nq=8):
    x, w = leggauss(nq)
    e = np.asarray(edges, float)
    mid = (e[1:] + e[:-1]) / 2; half = (e[1:] - e[:-1]) / 2
    return (mid[:, None] + half[:, None] * x[None, :]).ravel(), (half[:, None] * w[None, :]).ravel()


def geom_edges(lo, hi, ratio=0.75):
    e = [hi]
    while e[-1] * ratio > lo: e.append(e[-1] * ratio)
    e.append(lo)
    return e[::-1]


def r_grid(rmax=80.0):
    """radius grid: geometric panels near 0 (p has r log r terms there), then uniform panels."""
    edges = [0.0] + geom_edges(1e-7, 0.05) + list(np.arange(0.1, 4.0001, 0.05)) + list(np.arange(4.25, rmax + 1e-9, 0.25))
    return panels(edges, 6)


def refined_nodes(lo, hi, specials, fine=0.05, far=12.0, coarse=0.2):
    """Gauss-Legendre panels on [lo, hi]: uniform (fine inside [-far, far], coarse outside), with geometric refinement
    toward every special point from both sides; the special points are panel edges."""
    pts = [lo, hi]
    a, b = max(lo, -far), min(hi, far)
    pts += list(np.linspace(a, b, int(math.ceil((b - a) / fine)) + 1))
    if lo < -far: pts += list(np.linspace(lo, -far, int(math.ceil((-far - lo) / coarse)) + 1))
    if hi > far: pts += list(np.linspace(far, hi, int(math.ceil((hi - far) / coarse)) + 1))
    g = geom_edges(1e-9, 0.2)
    for c in specials:
        pts.append(c)
        pts += [c + x for x in g if lo < c + x < hi] + [c - x for x in g if lo < c - x < hi]
    pts = np.unique(np.array(pts))
    keep = np.concatenate([[True], np.diff(pts) > 1e-13])
    return panels(pts[keep], 8)


class EqualLaw:
    """B = (R - m)/sqrt(m), R ~ Gamma(m, 1);  C = R/m = 1 + B/sqrt(m)."""
    def __init__(self, m):
        self.m = m; self.name = 'equal m=%d' % m
        self.kappa = 1.0 / m; self.s3 = 1.0 / math.sqrt(m); self.zeta = 1.0 / m
        sm = math.sqrt(m)
        self.b, w = refined_nodes(-sm, 70.0 / sm + 25.0, [0.0])
        R = m + sm * self.b
        f = sm * np.exp((m - 1) * np.log(R) - R - gammaln(m))
        self.wf = w * f; self.Cbar = 1 + self.b / sm


class TwoEigLaw:
    """B = l1 (T1 - 1) + l2 (T2 - 1), l1 > 0, l1 != l2, l1^2 + l2^2 = 1;  C = l1^2 T1 + l2^2 T2.
    With x = B + l1 + l2 = l1 T1 + l2 T2:  C = l1 x + l2 (l2 - l1) T2, and the joint density of (x, T2) is
    exp(-x/l1 - a T2)/l1, a = 1 - l2/l1, on T2 >= 0, x - l2 T2 >= 0."""
    def __init__(self, l1, l2):
        n = math.hypot(l1, l2); l1, l2 = l1 / n, l2 / n
        assert l1 > 0 and l1 != l2 and (l2 < 0 or l1 > l2)
        self.l = (l1, l2); self.name = 'A = diag(%.4f, %.4f)' % (l1, l2)
        self.kappa = l1 ** 4 + l2 ** 4; self.s3 = l1 ** 3 + l2 ** 3; self.zeta = self.s3 ** 2
        b0 = -(l1 + l2)                                   # kink (l2 < 0) or support end (l2 > 0) of the density of B
        if l2 > 0: lo, hi, sp = b0, b0 + 90.0 * l1, [0.0]
        else: lo, hi, sp = b0 - 90.0 * abs(l2), b0 + 90.0 * l1, [0.0, b0]
        b, w = refined_nodes(lo, hi, sp)
        x = b - b0
        a = 1 - l2 / l1
        if l2 > 0:
            Lx = np.maximum(x, 0) / l2
            f = np.exp(-x / l1) / l1 * (-np.expm1(-a * Lx)) / a
            M = np.exp(-x / l1) / l1 * (1 - np.exp(-a * Lx) * (1 + a * Lx)) / a ** 2
        else:
            t0 = np.maximum(0.0, x / l2)
            e = np.exp(-x / l1 - a * t0) / l1
            f = e / a; M = e * (1 + a * t0) / a ** 2
        self.b = b; self.wf = w * f
        Cf = l1 * x * f + l2 * (l2 - l1) * M
        self.Cbar = np.where(f > 0, Cf / np.where(f > 0, f, 1.0), 0.0)


def hermitian_kernels(law, r, chunk=256):
    """p, w1, zp, np on the radius grid r for the normalised Hermitian-factor cubic q = X B."""
    b, wf, Cb = law.b, law.wf, law.Cbar
    ib2 = 1.0 / (b * b); sg = np.sign(b); iab = 1.0 / np.abs(b)
    out = np.zeros((4, len(r)))
    for i in range(0, len(r), chunk):
        rr = r[i:i + chunk][:, None]
        S = rr * rr * ib2[None, :]
        K = 2 * rr * ib2[None, :] * np.exp(-S) * wf[None, :]
        rootS = rr * iab[None, :]
        out[0, i:i + chunk] = K.sum(1)
        out[1, i:i + chunk] = (K * rootS * sg[None, :]).sum(1)
        out[2, i:i + chunk] = (K * rootS * sg[None, :] * (2 * S * Cb[None, :] - 1)).sum(1)
        out[3, i:i + chunk] = (K * rootS * sg[None, :] * (2 * (b * b)[None, :] + 4 * Cb[None, :] - 4 * S * Cb[None, :])).sum(1)
    return out


def t_grid(tmax=40.0, fine=0.1):
    e = list(np.linspace(0, 2, 41)) + list(np.linspace(2, tmax, int(round((tmax - 2) / fine)) + 1)[1:])
    t, w = panels(e, 8)
    return t, w * np.exp(-t)


def limit_kernels(rho, s, T=None, chunk=128):
    """p, w1, zp on the grid s for Q = rho p(X) + W (beta = 1);  zp is the kernel of C_0 = X(3T^2 - 2T - 2)."""
    t, wt = T if T is not None else t_grid()
    a = rho * np.sqrt(t) * np.abs(t - 2); sg = np.sign(t - 2); rt = np.sqrt(t)
    c0 = rt * (3 * t * t - 2 * t - 2)
    out = np.zeros((3, len(s)))
    for i in range(0, len(s), chunk):
        ss = s[i:i + chunk][:, None]
        x = 2 * ss * a[None, :]
        base = 2 * ss * np.exp(-(ss - a[None, :]) ** 2) * wt[None, :]
        k0 = base * ive(0, x); k1 = base * ive(1, x)
        out[0, i:i + chunk] = k0.sum(1)
        out[1, i:i + chunk] = (k1 * (rt * sg)[None, :]).sum(1)
        out[2, i:i + chunk] = (k1 * (c0 * sg)[None, :]).sum(1)
    return out


def s_grid(smax):
    edges = [0.0] + geom_edges(1e-6, 0.05) + list(np.arange(0.1, 6.0001, 0.05)) + list(np.arange(6.2, smax + 1e-9, 0.2))
    return panels(edges, 6)


# ------------------------------------------------------------------ radial profiles and the transform k
_Y, _WY = panels(list(np.linspace(0, 2.5, 26)) + list(np.linspace(2.5, 7.0, 19)[1:]), 8)
_WY = _WY * 2 * _Y * np.exp(-_Y * _Y)          # tau = y^2 ~ Exp(1)

class Profile:
    """Phi(x) = ph(x) G(|x|),  h(v) = G(sqrt v)/sqrt v,  k(v) = E h(v + u tau),  f1(s) = s k'(s^2), so F = q k'(|q|^2) = ph(q) f1(|q|)."""
    def __init__(self, G, u):
        self.G, self.u = G, u
    def h_of_s(self, s):
        s = np.maximum(np.asarray(s, float), 1e-12)
        return self.G(s) / s
    def kprime_of_s(self, s):
        s = np.asarray(s, float); u = self.u
        x = np.sqrt(s[:, None] ** 2 + u * (_Y ** 2)[None, :])          # sqrt(v + u tau)
        k = self.h_of_s(x.ravel()).reshape(x.shape) @ _WY
        return (k - self.h_of_s(s)) / u
    def f1(self, s):
        s = np.asarray(s, float)
        return s * self.kprime_of_s(s)


def omega_hat(prof, s, ws_p):
    """law functional: (3/2) E[V k'^2] - (3/4)(E[V k'])^2/u, with E over the radius nodes s and weights ws_p (= w * density)."""
    f1 = prof.f1(s)
    EVk2 = float(ws_p @ (f1 * f1)); EVk = float(ws_p @ (s * f1))
    return 1.5 * EVk2 - 0.75 * EVk * EVk / prof.u, f1, EVk2, EVk


def load_row(path):
    d = np.load(path)
    import json
    rec = json.loads(str(d['rec'])); S = d['S']; smax = float(S[-1])
    sp = {k: CubicSpline(S, d[k]) for k in ('GA', 'GB', 'G0')}
    f = lambda k: (lambda s: sp[k](np.minimum(np.asarray(s, float), smax)))
    return rec, f('GA'), f('GB'), f('G0')


def row_profile_direct(rec, svals, npan=80, nq=8, nth=720, R=7.2):
    """independent recomputation of G_A, G_B, G_0 at the radii svals from the row parameters (own quadrature)."""
    x, w = leggauss(nq); ed = np.linspace(0, R, npan + 1)
    rr = np.concatenate([(ed[i] + ed[i + 1]) / 2 + (ed[i + 1] - ed[i]) / 2 * x for i in range(npan)])
    wr = np.concatenate([(ed[i + 1] - ed[i]) / 2 * w for i in range(npan)]) * 2 * rr * np.exp(-rr * rr)
    th = (np.arange(nth) + 0.5) * 2 * np.pi / nth
    z = (rr[:, None] * np.exp(1j * th)[None, :]).ravel(); wz = (wr[:, None] * np.ones(nth)[None, :] / nth).ravel(); wz = wz / wz.sum()
    T = np.abs(z) ** 2
    e11 = T - 1; e20 = z * z / math.sqrt(2); e32 = z * (T * T - 6 * T + 6) / math.sqrt(12)
    Lp = z * (rec['l'] + rec['beta'] * (T - 2)) + rec['nu5'] * e32
    Dz = 1 - rec['bA'] * e11 - rec['bB'] * e20
    out = []
    for s in svals:
        Ap, Am = Lp + s * Dz, Lp - s * Dz
        d = Ap / np.abs(Ap) - Am / np.abs(Am)
        out.append((float(np.real((np.conj(e11) * d) @ wz)), float(np.real((np.conj(e20) * d) @ wz)), float(np.real(d @ wz))))
    return np.array(out)
