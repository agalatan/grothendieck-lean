# [copy of degree5-cert/cert2/d5eng2.py; only the game constants changed, see E1, ETA]
# Degree-5 multi-grade row engine (Gaussian ideal of the gate-free row), claude-b9ee degree5-cert worker, 16 Nov 2026.
# Everything here is N (floating point).  Conventions as in research/conjecture-K/sources/k5-2026-11-04/RESULTS.md:
#   T5 = P10 - e1 P21 + eta P32,  row:  V <= t^2 - 2 l t + 2 beta^2/e1 + c5^2/eta + (bA^2+bB^2)||q||^2/eta + Lambda5,
#   Lambda5 = E|A+| + E|A-| - ||G3||^2/e1 - ||G5||^2/eta,   A+- = L + G5 +- (G3 - C),
#   L = z(l + beta(|z|^2-2)),  C = c5 e32(z) + bA q e11(z) + bB conj(q) e20(z).
# q-only point: G3 = q (remote, |q| = s after a joint rotation), G5 = nu5 e32(z):
#   A+- = L + nu5 e32 +- s D(z),  D = 1 - bA e11 - bB e20   (c5 = 0).
import numpy as np, math
from math import factorial
from numpy.polynomial.legendre import leggauss
from numpy.polynomial.laguerre import laggauss
from scipy.special import eval_genlaguerre
from scipy.interpolate import RectBivariateSpline, CubicSpline
from scipy.optimize import minimize, minimize_scalar

import os as _os
# claude-b9ee worker d5newcap (16 Nov 2026): the game is read from the environment, no default (stage 2 had 0.78, 0.0779 here)
E1, ETA = float(_os.environ['D5_E1']), float(_os.environ['D5_ETA'])

def e_ab(a, b, z):
    """normalised complex Wick polynomial :z^a zbar^b:/sqrt(a!b!), E|z|^2 = 1."""
    T = np.abs(z) ** 2
    if a >= b:
        v = (-1) ** b * factorial(b) * z ** (a - b) * eval_genlaguerre(b, a - b, T)
    else:
        v = (-1) ** a * factorial(a) * np.conj(z) ** (b - a) * eval_genlaguerre(a, b - a, T)
    return v / math.sqrt(factorial(a) * factorial(b))

def zgrid(npan=56, nq=8, nth=384, R=6.6, half=False):
    x, w = leggauss(nq); ed = np.linspace(0, R, npan + 1)
    r = np.concatenate([(ed[i] + ed[i + 1]) / 2 + (ed[i + 1] - ed[i]) / 2 * x for i in range(npan)])
    wr = np.concatenate([(ed[i + 1] - ed[i]) / 2 * w for i in range(npan)]) * 2 * r * np.exp(-r * r)
    if half:   # theta in (0, pi), conjugation symmetry (real parameters, real s)
        th = (np.arange(nth // 2) + 0.5) * np.pi / (nth // 2)
    else:
        th = (np.arange(nth) + 0.5) * 2 * np.pi / nth
    Rm, TH = np.meshgrid(r, th, indexing='ij')
    W = (wr[:, None] * np.ones(th.size)[None, :]).ravel(); W = W / W.sum()
    return (Rm * np.exp(1j * TH)).ravel(), W

class Row:
    def __init__(self, t, l, beta, bA, bB, e1=E1, eta=ETA, grid=None):
        self.t, self.l, self.beta, self.bA, self.bB, self.e1, self.eta = t, l, beta, bA, bB, e1, eta
        self.z, self.wz = grid if grid is not None else zgrid(half=True)
        z = self.z; T = np.abs(z) ** 2
        self.L = z * (l + beta * (T - 2)); self.E32 = e_ab(3, 2, z)
        self.D = 1 - bA * e_ab(1, 1, z) - bB * e_ab(2, 0, z)
    def const(self):
        return self.t ** 2 - 2 * self.l * self.t + 2 * self.beta ** 2 / self.e1
    def psi_grid(self, S, NU):
        """Psi(s; nu5) = E_z |L + nu5 e32 + s D| + |L + nu5 e32 - s D| on the tensor grid S x NU (real s, real nu5)."""
        out = np.empty((len(S), len(NU)))
        for j, nu in enumerate(NU):
            base = self.L + nu * self.E32
            for i0 in range(0, len(S), 16):
                Sb = np.asarray(S[i0:i0 + 16])[:, None]
                out[i0:i0 + 16, j] = (np.abs(base[None, :] + Sb * self.D[None, :]) + np.abs(base[None, :] - Sb * self.D[None, :])) @ self.wz
        return out

UL, WL = laggauss(70)

class Inner:
    """Gaussian ideal inner sup over (sigma, nu5) of E_U Psi(sigma sqrt U; nu5) - cost."""
    def __init__(self, row, smax=9.0, ns=181, nus=None):
        self.row = row
        self.S = np.linspace(0, smax, ns)
        self.NU = np.linspace(-0.02, 0.10, 13) if nus is None else nus
        self.P = row.psi_grid(self.S, self.NU)
        self.sp = RectBivariateSpline(self.S, self.NU, self.P, kx=3, ky=3)
        self.smax = smax
    def lam(self, sig, nu):
        r = self.row; s = np.minimum(sig * np.sqrt(UL), self.smax)
        e = (WL * self.sp(s, np.full_like(s, nu), grid=False)).sum()
        return e - sig ** 2 / r.e1 - nu ** 2 / r.eta + (r.bA ** 2 + r.bB ** 2) * sig ** 2 / r.eta
    def sup(self):
        """max of the plain branch (sigma = 0) and the driver branch (sigma >= 0.05), each optimised separately."""
        (vp, _, nup), (vd, sd, nud) = self.branches(lo=0.05)
        return (vp, 0.0, nup) if vp >= vd else (vd, sd, nud)
    def sup_old(self):
        best = None
        for sig0 in np.linspace(0.0, 0.6, 25):
            for nu0 in (0.02, 0.04, 0.055):
                v = self.lam(sig0, nu0)
                if best is None or v > best[0]: best = (v, sig0, nu0)
        res = minimize(lambda x: -self.lam(abs(x[0]), x[1]), [best[1], best[2]], method='Nelder-Mead',
                       options={'xatol': 1e-7, 'fatol': 1e-12, 'maxiter': 400})
        v = -res.fun; sig, nu = abs(res.x[0]), res.x[1]
        # also the plain branch sigma = 0 (exact)
        r0 = minimize_scalar(lambda nu: -self.lam(0.0, nu), bounds=(-0.02, 0.1), method='bounded', options={'xatol': 1e-8})
        if -r0.fun > v: v, sig, nu = -r0.fun, 0.0, r0.x
        return v, sig, nu
    def branches(self, lo=0.1):
        """best value on the plain branch (sigma=0) and on the driver branch (sigma >= lo)."""
        r0 = minimize_scalar(lambda nu: -self.lam(0.0, nu), bounds=(-0.02, 0.1), method='bounded', options={'xatol': 1e-8})
        best = None
        for sig0 in np.linspace(max(lo, 0.1), 0.6, 21):
            for nu0 in (0.02, 0.035, 0.05):
                v = self.lam(sig0, nu0)
                if best is None or v > best[0]: best = (v, sig0, nu0)
        res = minimize(lambda x: -self.lam(max(abs(x[0]), lo), x[1]), [best[1], best[2]], method='Nelder-Mead',
                       options={'xatol': 1e-7, 'fatol': 1e-12, 'maxiter': 400, 'initial_simplex': [[best[1], best[2]], [best[1] + 0.02, best[2]], [best[1], best[2] + 0.005]]})
        return (-r0.fun, 0.0, r0.x), (-res.fun, max(abs(res.x[0]), lo), res.x[1])

def row_value(t, p, grid=None, ret=False):
    l, beta, bA, bB = p
    rw = Row(t, l, beta, bA, bB, grid=grid); inn = Inner(rw)
    v, sig, nu = inn.sup()
    val = rw.const() + v
    return (val, sig, nu, inn) if ret else val
