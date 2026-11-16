"""Reviewer's independent numerical model (label N).  Nothing here imports the package.

Differences from the package's numerics:
  * circular means by the Landen-transformed formulas with modulus k = min(r,Y)/max(r,Y),
        E_psi|Y + r e^{i psi}|        = (2/pi) max(r,Y) [2E(k) - (1-k^2)K(k)],
        E_psi Re ph(Y + r e^{i psi})  = (2/pi) E(k)                      (Y >= r),
                                      = (2/pi) [E(k) - (1-k^2)K(k)]/k    (Y <  r),
    with K, E from an own AGM iteration (the package: scipy ellipe/ellipk at m = 4rY/(r+Y)^2);
  * the T-integral in t = sqrt(T) by Gauss-Legendre panels graded geometrically towards the kink rho(T) = Y
    (the package: QUADPACK);
  * profiles stored as piecewise Chebyshev interpolants in s = sqrt(v) (the package: cubic splines);
  * expectations over C^2 on a 3-D grid: scipy Gauss-Laguerre in |X|^2, |Y|^2 and the trapezoid rule in the RELATIVE
    phase only (all integrands are invariant under the global rotation); the package uses a 4-D grid;
  * the cubic, its derivatives and the Wick bases from the Appell property d :z^m zb^n: = m :z^(m-1) zb^n:
    and the explicit sum :z^m zb^n: = sum_k (-1)^k k! C(m,k) C(n,k) z^(m-k) zb^(n-k);
  * k = K_u h by Gauss-Laguerre in t, evaluated directly at every grid point (no table).
"""
import math
import numpy as np
from numpy.polynomial import chebyshev as Ch
from scipy.special import roots_laguerre, roots_legendre

A0 = 699 / 1250; B0 = 179 / 1250; EPS = 1891 / 2500; PP = 1 / EPS

# ------------------------------------------------------------------------------------------------ elliptic
def agm_KE(k):
    """K(k), E(k), and EmK = E - (1-k^2)K (no cancellation), modulus 0 <= k < 1."""
    k = np.asarray(k, dtype=float)
    a = np.ones_like(k); b = np.sqrt((1 - k) * (1 + k)); c = k.copy()
    tail = np.zeros_like(k); p = 1.0
    for _ in range(18):
        an = 0.5 * (a + b); b = np.sqrt(a * b); c = c * c / (4 * an); a = an
        tail = tail + p * c * c; p *= 2
    K = np.pi / (2 * a)
    return K, K * (1 - 0.5 * k * k - tail), K * (0.5 * k * k - tail)

def rho(t):  # |L| at T = t^2
    return t * (A0 + B0 * t * t)

def tstar(s):
    """root of t (a + b t^2) = s."""
    t = 2 * math.sqrt(A0 / (3 * B0)) * math.sinh(math.asinh(3 * s * math.sqrt(3 * B0 / A0) / (2 * A0)) / 3)
    for _ in range(3):
        t -= (rho(t) - s) / (A0 + 3 * B0 * t * t)
    return t

_GLx, _GLw = roots_legendre(24)
TMAX = 7.6
def _panels(s):
    ed = set(np.arange(0, TMAX + 1e-12, 0.25).tolist())
    if s > 0:
        ts = tstar(s)
        if ts < TMAX:
            ed.add(ts)
            for i in range(1, 27):
                d = 4.0 ** (-i)
                ed.add(ts * (1 - d)); ed.add(ts + (TMAX - ts) * d)
    ed = np.array(sorted(ed)); lo, hi = ed[:-1], ed[1:]
    keep = hi - lo > 1e-300
    lo, hi = lo[keep], hi[keep]
    t = (0.5 * (lo + hi)[:, None] + 0.5 * (hi - lo)[:, None] * _GLx[None, :]).ravel()
    w = (0.5 * (hi - lo)[:, None] * _GLw[None, :]).ravel()
    return t, w

def profile_point(s):
    """(phi, j, g) at v = s^2:  phi = 2E|L + s|,  j = E Re ph(L+s)/s,  g = E[(T-1) Re ph(L+s)]/s."""
    t, w = _panels(s)
    wt = w * 2 * t * np.exp(-t * t); r = rho(t); T = t * t
    if s == 0:
        e = np.exp(-t * t) * w
        return 2 * np.sum(wt * r), np.sum(e / (A0 + B0 * T)), np.sum(e * (T - 1) / (A0 + B0 * T))
    big = np.maximum(r, s); k = np.minimum(r, s) / big
    K, E, EmK = agm_KE(k)
    M = (2 / np.pi) * big * (E + EmK)
    dMs = np.where(s >= r, (2 / np.pi) * E / s, (2 / np.pi) * EmK / (k * s))      # E_psi Re ph(s + r e^{i psi}) / s
    return 2 * np.sum(wt * M), np.sum(wt * dMs), np.sum(wt * (T - 1) * dMs)

class Profiles:
    """Piecewise Chebyshev interpolants of phi, j, g in s = sqrt(v)."""
    def __init__(self):
        br = list(np.arange(0, 4.0001, 0.5)) + list(np.arange(5, 12.0001, 1.0)) + [16, 24, 40, 80]
        self.br = np.array(br); self.coef = []
        for lo, hi in zip(self.br[:-1], self.br[1:]):
            n = 40 if hi - lo <= 0.5 else (48 if hi - lo <= 1 else 64)
            xk = np.cos(np.pi * (np.arange(n) + 0.5) / n)
            sv = 0.5 * (lo + hi) + 0.5 * (hi - lo) * xk
            vals = np.array([profile_point(float(si)) for si in sv])           # (n, 3)
            kk = np.arange(n)
            Tm = np.cos(np.outer(kk, np.pi * (np.arange(n) + 0.5) / n))        # T_k(x_i)
            c = (2.0 / n) * Tm @ vals; c[0] *= 0.5
            self.coef.append(c)
        # moments for the far asymptotics (s > 80; weights there are < 1e-40)
        t, w = _panels(0.0); wt = w * 2 * t * np.exp(-t * t)
        self.m2 = np.sum(wt * rho(t) ** 2); self.m2T = np.sum(wt * (t * t - 1) * rho(t) ** 2)
        self.zero = profile_point(0.0)
    def _eval(self, s, col):
        s = np.asarray(s, dtype=float); out = np.empty_like(s)
        idx = np.clip(np.searchsorted(self.br, s, side="right") - 1, 0, len(self.coef) - 1)
        far = s > self.br[-1]
        for i, c in enumerate(self.coef):
            msk = (idx == i) & ~far
            if msk.any():
                lo, hi = self.br[i], self.br[i + 1]
                out[msk] = Ch.chebval((2 * s[msk] - lo - hi) / (hi - lo), c[:, col])
        if far.any():
            sf = s[far]
            out[far] = [2 * sf + self.m2 / (2 * sf), (1 - self.m2 / (4 * sf * sf)) / sf, -self.m2T / (4 * sf ** 3)][col]
        return out
    def phi(self, v): return self._eval(np.sqrt(v), 0)
    def j(self, v): return self._eval(np.sqrt(v), 1)
    def g(self, v): return self._eval(np.sqrt(v), 2)
    @property
    def j0(self): return self.zero[1]
    @property
    def g0(self): return self.zero[2]
    @property
    def B0(self): return self.zero[0]
    def h(self, mode):
        if mode == "raw": return self.g
        if mode == "tilt": return lambda v: (self.g(v) - self.g0) - 0.6 * (self.j0 - self.j(v))
        raise ValueError(mode)
    def B(self, u, n=160):
        x, w = roots_laguerre(n)
        return float(np.sum(w * self.phi(u * x)))

# ------------------------------------------------------------------------------------------------ Wick calculus on C^2
def wick1(m, n, z):
    zb = np.conj(z); out = 0
    for k in range(min(m, n) + 1):
        out = out + (-1) ** k * math.factorial(k) * math.comb(m, k) * math.comb(n, k) * z ** (m - k) * zb ** (n - k)
    return out

# q = sum coef * :X^a1 Xb^b1: :Y^a2 Yb^b2:   in the package's ordering of the six coefficients
S2 = math.sqrt(2.0)
BASIS6 = [((2, 1, 0, 0), 1 / S2), ((1, 0, 1, 1), 1.0), ((0, 1, 2, 0), 1 / S2), ((1, 1, 1, 0), 1.0), ((0, 0, 2, 1), 1 / S2), ((2, 0, 0, 1), 1 / S2)]

class Grid3:
    def __init__(self, nL=64, nT=64):
        x, w = roots_laguerre(nL); th = 2 * np.pi * np.arange(nT) / nT
        R1, R2, TH = np.meshgrid(x, x, th, indexing="ij")
        self.W = (w[:, None, None] * w[None, :, None] * np.ones(nT)[None, None, :] / nT).ravel()
        self.X = np.sqrt(R1).ravel() + 0j; self.Y = (np.sqrt(R2) * np.exp(1j * TH)).ravel()
        self._w = {}
    def E(self, F): return np.sum(self.W * F)
    def wk(self, a1, b1, a2, b2):
        key = (a1, b1, a2, b2)
        if key not in self._w: self._w[key] = wick1(a1, b1, self.X) * wick1(a2, b2, self.Y)
        return self._w[key]
    def poly(self, terms):
        out = 0
        for (a1, b1, a2, b2), c in terms:
            if c != 0 and min(a1, b1, a2, b2) >= 0: out = out + c * self.wk(a1, b1, a2, b2)
        return out
    def basis(self, p, q):
        L = []
        for a1 in range(p + 1):
            for b1 in range(q + 1):
                a2, b2 = p - a1, q - b1
                L.append(self.wk(a1, b1, a2, b2) / math.sqrt(math.factorial(a1) * math.factorial(b1) * math.factorial(a2) * math.factorial(b2)))
        return L
    def projnorm2(self, F, p, q):
        return float(sum(abs(self.E(np.conj(e) * F)) ** 2 for e in self.basis(p, q)))
    def projvec(self, F, p, q):
        return np.array([self.E(np.conj(e) * F) for e in self.basis(p, q)])

def cubic_terms(c, u):
    c = np.asarray(c, dtype=complex); c = c * math.sqrt(u / float(np.sum(abs(c) ** 2)))
    q = [(idx, ci * nrm) for (idx, nrm), ci in zip(BASIS6, c)]
    def low(terms, pos):
        return [(tuple(v - (1 if i == pos else 0) for i, v in enumerate(idx)), cf * idx[pos]) for idx, cf in terms if idx[pos] > 0]
    return q, low(q, 0), low(q, 1), low(q, 2), low(q, 3)       # q, d_X q, dbar_X q, d_Y q, dbar_Y q

def kprime(hfun, u, V, nK=80):
    """k'(V) = (k(V) - h(V))/u,  k(v) = int_0^inf e^-t h(v + u t) dt  (Gauss-Laguerre in t)."""
    x, w = roots_laguerre(nK)
    k = np.zeros_like(V)
    for xi, wi in zip(x, w):
        if wi < 1e-30: break
        k += wi * hfun(V + u * xi)
    return (k - hfun(V)) / u

def analyse(pr, gr, c, u, mode, nK=80, full=True):
    h = pr.h(mode)
    qt, dXt, dXbt, dYt, dYbt = cubic_terms(c, u)
    q = gr.poly(qt); dX = gr.poly(dXt); dXb = gr.poly(dXbt); dY = gr.poly(dYt); dYb = gr.poly(dYbt)
    X, Y = gr.X, gr.Y
    V = abs(q) ** 2
    out = {}
    out["u_num"] = gr.E(V).real
    dl = gr.E(V * V).real - 2 * u * u; out["delta"] = dl; out["chi"] = dl / u ** 2
    hv = h(V)
    cv = np.array([gr.E(np.conj(X) * q * hv), gr.E(np.conj(Y) * q * hv)]); C = float(np.linalg.norm(cv)); out["C2"] = C * C
    e = cv / C; ye = e[0] * X + e[1] * Y
    Bu = pr.B(u); D = Bu - gr.E(pr.phi(V)).real; out["D"] = D; out["B"] = Bu
    kp = kprime(h, u, V, nK)
    G = ye * q * kp; Gp = ye * np.conj(q) * kp
    n20 = gr.projnorm2(G, 2, 0); n31 = gr.projnorm2(G, 3, 1); n11 = gr.projnorm2(Gp, 1, 1); n22 = gr.projnorm2(Gp, 2, 2)
    out["Omega"] = n20 + 0.25 * n31 + 0.5 * n11 + 0.5 * n22
    out["Omega_parts"] = (n20, n31, n11, n22)
    out["unproj"] = 1.5 * gr.E(abs(ye) ** 2 * V * kp ** 2).real
    if full:
        a = dX * dXb + dY * dYb; x = abs(dXb) ** 2 + abs(dYb) ** 2 - u
        t3 = gr.E(np.conj(ye) * kp * (np.conj(q) * a + q * x)); out["thm3_relerr"] = abs(t3 - C) / C
        Q = q * q
        q20 = gr.projnorm2(Q, 2, 0); q31 = gr.projnorm2(Q, 3, 1); nx = gr.E(x * x).real
        out["T2d_relerr"] = abs(dl - (q20 + q31 + 2 * nx)) / dl
        out["budget_parts"] = (q20, q31, nx)
        # the four pairings and their cosines
        pa20 = gr.projvec(a, 2, 0); pa31 = gr.projvec(a, 3, 1); px11 = gr.projvec(x, 1, 1); px22 = gr.projvec(x, 2, 2)
        pG20 = gr.projvec(G, 2, 0); pG31 = gr.projvec(G, 3, 1); pG11 = gr.projvec(Gp, 1, 1); pG22 = gr.projvec(Gp, 2, 2)
        ips = [np.vdot(pG20, pa20), np.vdot(pG31, pa31), np.vdot(pG11, px11), np.vdot(pG22, px22)]
        out["sum_ips_relerr"] = abs(sum(ips) - C) / C
        out["cosines"] = [abs(i) / (np.linalg.norm(p1) * np.linalg.norm(p2)) for i, p1, p2 in
                          zip(ips, (pG20, pG31, pG11, pG22), (pa20, pa31, px11, px22))]
    return out
