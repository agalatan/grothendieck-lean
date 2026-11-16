# Reviewer's profile code for the shared-factors review (claude-b9ee review worker, 16 Nov 2026).  N.
#
# The tilted row profiles and their first three derivatives, computed FROM THE DEFINITIONS, with no numerical
# differentiation of a table:
#     Gamma_X(r) = Re E_z[ w_X(z) (ph A_+(z; r) - ph A_-(z; r)) ],     A_+-(z; r) = L'(z) +- r D(z),
#     w_A = conj(e11) + 0.4 = T - 0.6,   w_B = conj(e20) + 0.3 = zbar^2/sqrt2 + 0.3,   (w_0 = 1 for Gamma_0)
#     L'(z) = z P(T),  P = p0 + p1 T + p2 T^2,   D(z) = d + bD T + cD z^2      (T = |z|^2, z standard complex Gaussian).
# Facts used (P, elementary):
#   * A_-(z) = -A_+(-z) and the weights are even, so Gamma_X(r) = 2 Re I_X(r), I_X(r) = E[w_X ph A_+(.; r)];
#   * A_+(.; r) has exactly one zero, on the negative real axis, z0(r) = root of x P(x^2) + r (d + (bD + cD) x^2) = 0
#     (the map L'/D is a diffeomorphism, PROOFS.md section 4);
#   * in polar coordinates centred at that zero, z = z0(r) + rho e^{i theta}, the integrand is smooth in (rho, theta)
#     AND in r (the vortex moves with the coordinates), so the r-derivatives may be taken under the integral.
# The r-derivatives are computed by Taylor-mode differentiation (truncated power series in eps, r -> r + eps) of the
# whole integrand, the quadrature being a tensor rule: Gauss-Legendre panels in rho, the trapezoid rule in theta.
import math
import numpy as np
from numpy.polynomial.legendre import leggauss

SQ2, SQ3, SQ12 = math.sqrt(2), math.sqrt(3), math.sqrt(12)


# ---- truncated power series ("jets"): arrays of shape (order + 1, npoints)
def jmul(a, b):
    n = a.shape[0]; out = np.zeros((n,) + np.broadcast(a[0], b[0]).shape, dtype=np.result_type(a, b))
    for k in range(n):
        for j in range(k + 1):
            out[k] += a[j] * b[k - j]
    return out

def jdiv(a, b):
    n = a.shape[0]; out = np.zeros_like(a * b[0])
    for k in range(n):
        s = a[k] + 0 * b[0]
        for j in range(k):
            s = s - out[j] * b[k - j]
        out[k] = s / b[0]
    return out

def jsqrt(a):
    n = a.shape[0]; out = np.zeros_like(a); out[0] = np.sqrt(a[0])
    for k in range(1, n):
        s = a[k].copy()
        for j in range(1, k):
            s = s - out[j] * out[k - j]
        out[k] = s / (2 * out[0])
    return out

def jexp(a):
    n = a.shape[0]; out = np.zeros_like(a); out[0] = np.exp(a[0])
    for k in range(1, n):
        s = 0
        for j in range(1, k + 1):
            s = s + j * a[j] * out[k - j]
        out[k] = s / k
    return out

def jconst(c, n, shape=()):
    out = np.zeros((n,) + shape, dtype=complex); out[0] = c
    return out


class RowProfiles:
    def __init__(self, rec, tilt_A=0.4, tilt_B=0.3):
        l, beta, bA, bB, nu5 = rec['l'], rec['beta'], rec['bA'], rec['bB'], rec['nu5']
        self.p0 = l - 2 * beta + SQ3 * nu5; self.p1 = beta - SQ3 * nu5; self.p2 = nu5 / SQ12
        self.d = 1 + bA; self.bD = -bA; self.cD = -bB / SQ2
        self.tA, self.tB = tilt_A, tilt_B

    def root_jet(self, r, order):
        """Taylor coefficients (in eps) of the zero x(r + eps) < 0 of x P(x^2) + (r + eps)(d + a x^2), a = bD + cD."""
        p0, p1, p2, d, a = self.p0, self.p1, self.p2, self.d, self.bD + self.cD
        F = lambda x: x * (p0 + p1 * x * x + p2 * x ** 4) + r * (d + a * x * x)
        dF = lambda x: p0 + 3 * p1 * x * x + 5 * p2 * x ** 4 + 2 * r * a * x
        x = -r * d / p0
        for _ in range(60):
            x = x - F(x) / dF(x)
        n = order + 1
        xj = np.zeros((n, 1)); xj[0] = x
        rj = np.zeros((n, 1)); rj[0] = r
        if n > 1: rj[1] = 1.0
        d0 = dF(x)
        for _ in range(order + 1):
            x2 = jmul(xj, xj); x4 = jmul(x2, x2)
            Pj = p1 * x2 + p2 * x4; Pj[0] += p0
            Dj = a * x2; Dj[0] += d
            Fj = jmul(xj, Pj) + jmul(rj, Dj)
            xj = xj - Fj / d0
            xj[0] = x
        return xj[:, 0].real

    def rule(self, x0, npan=28, nq=8, nth=384, tail=7.0):
        xg, wg = leggauss(nq)
        # panels in rho: finer near 0, out to |x0| + tail (the Gaussian is centred at 0, at distance |x0| from the pole)
        rmax = abs(x0) + tail
        ed = rmax * np.linspace(0, 1, npan + 1) ** 1.3
        rho = np.concatenate([(ed[i] + ed[i + 1]) / 2 + (ed[i + 1] - ed[i]) / 2 * xg for i in range(npan)])
        wr = np.concatenate([(ed[i + 1] - ed[i]) / 2 * wg for i in range(npan)])
        th = (np.arange(nth) + 0.5) * 2 * np.pi / nth
        R, TH = np.meshgrid(rho, th, indexing='ij')
        W = (wr * rho)[:, None] * np.full(nth, 2 * np.pi / nth)[None, :]
        return (R * np.exp(1j * TH)).ravel(), W.ravel()

    def jets(self, r, order=3, **kw):
        """Taylor coefficients c_k (k = 0..order) of Gamma_A, Gamma_B, Gamma_0 (tilted A, tilted B, plain 0) at r:
        Gamma(r + eps) = sum_k c_k eps^k.  Returns an array (3, order + 1)."""
        n = order + 1
        xj = self.root_jet(r, order)
        off, W = self.rule(xj[0], **kw)
        npts = off.size
        z = np.zeros((n, npts), dtype=complex); zb = np.zeros((n, npts), dtype=complex)
        z[0] = xj[0] + off; zb[0] = xj[0] + np.conj(off)
        for k in range(1, n):
            z[k] = xj[k]; zb[k] = xj[k]
        T = jmul(z, zb)
        P = self.p1 * T + self.p2 * jmul(T, T); P[0] += self.p0
        z2 = jmul(z, z); zb2 = jmul(zb, zb)
        D = self.bD * T + self.cD * z2; D[0] += self.d
        Db = self.bD * T + self.cD * zb2; Db[0] += self.d
        rj = np.zeros((n, 1), dtype=complex); rj[0] = r
        if n > 1: rj[1] = 1.0
        A = jmul(z, P) + jmul(rj, D); Ab = jmul(zb, P) + jmul(rj, Db)
        absA = jsqrt(jmul(A, Ab))
        ph = jdiv(A, absA)
        g = jexp(-T) / np.pi
        base = jmul(g, ph)
        wA = T.copy(); wA[0] -= (1.0 - self.tA)             # conj(e11) + tA = T - 1 + tA
        wB = zb2 / SQ2; wB[0] += self.tB                    # conj(e20) + tB
        out = np.zeros((3, n))
        out[0] = 2 * np.real(jmul(wA, base) @ W)
        out[1] = 2 * np.real(jmul(wB, base) @ W)
        out[2] = 2 * np.real(base @ W)
        return out

    def plain(self, r, **kw):
        """untilted Gamma_A, Gamma_B, Gamma_0 at r (for comparison with the tables)."""
        sA, sB = self.tA, self.tB
        j = self.jets(r, 0, **kw)[:, 0]
        return j[0] - sA * j[2], j[1] - sB * j[2], j[2]


def derived(r, G):
    """from Taylor coefficients G[k] of Gamma at r > 0: h, h', and the entries of D^3 Phi at (r, 0):
       E3 = Gamma''' = 6h' + 24 v h'' + 8 v^2 h''',  E1 = psi'' = 2h' + 4 v h'',  E2 = 3 psi'/r = 6h',   psi = Gamma/r."""
    g0, g1, g2, g3 = G[0], G[1], 2 * G[2], 6 * G[3]
    h = g0 / r; hp = (g1 * r - g0) / (2 * r ** 3)
    E1 = g2 / r - 2 * g1 / r ** 2 + 2 * g0 / r ** 3
    E2 = 3 * (g1 * r - g0) / r ** 3
    E3 = g3
    return h, hp, E1, E2, E3

def derived_taylor(r, odd):
    """the same from the odd Taylor coefficients at 0: Gamma = a1 r + a3 r^3 + a5 r^5 + a7 r^7 (odd = [a1, a3, a5, a7])."""
    a1, a3, a5, a7 = odd
    r2 = r * r
    h = a1 + a3 * r2 + a5 * r2 ** 2 + a7 * r2 ** 3
    hp = a3 + 2 * a5 * r2 + 3 * a7 * r2 ** 2
    E1 = 2 * a3 + 12 * a5 * r2 + 30 * a7 * r2 ** 2
    E2 = 6 * a3 + 12 * a5 * r2 + 18 * a7 * r2 ** 2
    E3 = 6 * a3 + 60 * a5 * r2 + 210 * a7 * r2 ** 2
    return h, hp, E1, E2, E3
