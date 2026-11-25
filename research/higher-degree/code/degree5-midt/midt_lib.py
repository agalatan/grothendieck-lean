"""Floating-point library for the mid-t study of the degree-5 game (issue #628).  Label: N.

Diffuse one-spike model.  z1 = sqrt(T) e^{i theta} is the visible coordinate, T ~ Exp(1).  A cubic
G in H_{2,1} is taken of the form

    G = alpha e21(z1) + z1 (aC N_C + aR e^{i phiR} N_R) + conj(z1) b N_B
        + c e11(z1) w2 + d e^{i phicd} e20(z1) conj(w2) + sigma W,

with N_C, N_B, w2, W independent standard complex Gaussians and N_R a standard real Gaussian: the
diffuse limits of remote elements of H11 (complex and Hermitian), H20, H10, H01 and H21.  Every
summand has norm 1 for a unit coefficient.  After removing the phase of z1, given T,

    e^{-i theta}(l z1 + s G) = sqrt(T) (l + s alpha (T-2)/sqrt2) + s X,

X a centred complex Gaussian with variance v(T) and pseudo-variance p(T) (below).
"""
import numpy as np
from numpy.polynomial.laguerre import laggauss
from numpy.polynomial.hermite_e import hermegauss

EPS = 39 / 50
ETA = 779 / 10000
MU = np.sqrt(np.pi) / 2
TARGET = 500 / 701

NT, NH = 48, 24
_T, _WT = laggauss(NT)
_x, _wx = hermegauss(NH)
_wx = _wx / np.sqrt(2 * np.pi)
_X1, _X2 = np.meshgrid(_x, _x, indexing="ij")
_WX = np.outer(_wx, _wx)

NAMES = ["alpha_re", "alpha_im", "aC", "aR", "phiR", "b", "c", "d", "phicd", "sigma"]


def norm2(g):
    ar, ai, aC, aR, phiR, b, c, d, phicd, sig = g
    return ar * ar + ai * ai + aC * aC + aR * aR + b * b + c * c + d * d + sig * sig


def fields(l, beta, g):
    """Return (mplus, mminus, X, weights): a = mplus + X, b = mminus - X on the product grid.
    mplus = sqrt(T)(l + beta (T-2) + alpha (T-2)/sqrt2), mminus the same with -alpha."""
    ar, ai, aC, aR, phiR, b, c, d, phicd, sig = g
    T = _T[:, None, None]
    al = ar + 1j * ai
    base = np.sqrt(T) * (l + beta * (T - 2))
    da = np.sqrt(T) * al * (T - 2) / np.sqrt(2)
    v = T * (aC * aC + aR * aR + b * b) + (T - 1) ** 2 * c * c + T * T / 2 * d * d + sig * sig
    p = T * aR * aR * np.exp(2j * phiR) + np.sqrt(2) * T * (T - 1) * c * d * np.exp(1j * phicd)
    ap = np.abs(p)
    s1 = np.sqrt(np.maximum(v + ap, 0) / 2)
    s2 = np.sqrt(np.maximum(v - ap, 0) / 2)
    rot = np.exp(0.5j * np.angle(p))
    X = rot * (s1 * _X1[None] + 1j * s2 * _X2[None])
    W = _WT[:, None, None] * _WX[None]
    return base + da, base - da, X, W


N1 = 96
_y, _wy = hermegauss(N1)
_wy = _wy / np.sqrt(2 * np.pi)


def rho(x):
    """E|sqrt(x) + W| for a standard complex Gaussian W."""
    from scipy.special import ive
    return MU * ((1 + x) * ive(0, x / 2) + x * ive(1, x / 2))


def mean_abs(m, v, p):
    """E|m + X| for a centred complex Gaussian X with variance v and pseudo-variance p: X is a real
    Gaussian of variance |p| along the direction e^{i arg(p)/2} plus a circular Gaussian of
    variance v - |p|; the circular part is integrated in closed form, the real one by
    Gauss-Hermite with N1 nodes."""
    ap = np.abs(p)
    tau2 = np.maximum(v - ap, 0.0)
    rot = np.exp(0.5j * np.angle(p))
    c = m[..., None] + (rot * np.sqrt(ap))[..., None] * _y
    tau2 = tau2[..., None] + 0 * _y
    safe = np.maximum(tau2, 1e-30)
    val = np.where(tau2 > 1e-14, np.sqrt(safe) * rho(np.abs(c) ** 2 / safe), np.abs(c))
    return np.sum(val * _wy, axis=-1)


def phi_sym(l, g):
    """(1/2)(E|l z1 + G| + E|l z1 - G|) in the model."""
    ar, ai, aC, aR, phiR, b, c, d, phicd, sig = g
    T = _T
    al = ar + 1j * ai
    base = np.sqrt(T) * l
    da = np.sqrt(T) * al * (T - 2) / np.sqrt(2)
    v = T * (aC * aC + aR * aR + b * b) + (T - 1) ** 2 * c * c + T * T / 2 * d * d + sig * sig
    p = T * aR * aR * np.exp(2j * phiR) + np.sqrt(2) * T * (T - 1) * c * d * np.exp(1j * phicd)
    return 0.5 * float(np.sum(_WT * (mean_abs(base + da, v, p) + mean_abs(base - da, v, p))))


def Phi_eta(a, b, eta=ETA, iters=25):
    """sup over unimodular f, g of Re(conj(a) f) + Re(conj(b) g) + eta |f+g|^2/4 (coordinate ascent
    from three starting points; a lower bound of the supremum, exact when the ascent finds the
    global maximum)."""
    best = None
    sa = np.where(np.abs(a) > 0, a / np.maximum(np.abs(a), 1e-300), 1.0)
    sb = np.where(np.abs(b) > 0, b / np.maximum(np.abs(b), 1e-300), 1.0)
    ss = a + b
    ss = np.where(np.abs(ss) > 0, ss / np.maximum(np.abs(ss), 1e-300), 1.0)
    for f0, g0 in ((sa, sb), (ss, ss), (sa, sa)):
        f, g = f0, g0
        for _ in range(iters):
            u = a + 0.5 * eta * g
            f = np.where(np.abs(u) > 1e-300, u / np.maximum(np.abs(u), 1e-300), f)
            u = b + 0.5 * eta * f
            g = np.where(np.abs(u) > 1e-300, u / np.maximum(np.abs(u), 1e-300), g)
        val = (np.conj(a) * f).real + (np.conj(b) * g).real + 0.25 * eta * np.abs(f + g) ** 2
        best = val if best is None else np.maximum(best, val)
    return best


def M_tail(l, beta, g, eta=ETA, eps=EPS):
    """E Phi_eta(L + G, L - G) - ||G||^2/eps, L = l z1 + beta sqrt2 e21(z1)."""
    mp, mm, X, W = fields(l, beta, g)
    return float(np.sum(W * Phi_eta(mp + X, mm - X, eta))) - norm2(g) / eps


def M_plain(l, beta, g, eps=EPS):
    """E|L + G| + E|L - G| - ||G||^2/eps."""
    mp, mm, X, W = fields(l, beta, g)
    return float(np.sum(W * (np.abs(mp + X) + np.abs(mm - X)))) - norm2(g) / eps
