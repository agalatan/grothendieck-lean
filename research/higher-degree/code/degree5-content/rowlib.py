# Shared helpers for the capped-row A/B content study (claude-b9ee worker, 16 Nov 2026).  N.
import json, math
import numpy as np
from numpy.polynomial.legendre import leggauss
from scipy.interpolate import CubicSpline
from scipy.special import ive
from scipy.optimize import minimize_scalar

E1, ETA = 0.78, 0.0779
P1 = 1 / E1

def gl_panels(a, b, npan, nq=8):
    x, w = leggauss(nq); ed = np.linspace(a, b, npan + 1)
    t = np.concatenate([(ed[i] + ed[i + 1]) / 2 + (ed[i + 1] - ed[i]) / 2 * x for i in range(npan)])
    wt = np.concatenate([(ed[i + 1] - ed[i]) / 2 * w for i in range(npan)])
    return t, wt

# exponential law of T = |y|^2: nodes on [0, 2] and [2, 60] (kink of |H| at T = 2)
_t1, _w1 = gl_panels(0.0, 2.0, 40); _t2, _w2 = gl_panels(2.0, 60.0, 160)
TN = np.concatenate([_t1, _t2]); TW = np.concatenate([_w1, _w2]) * np.exp(-np.concatenate([_t1, _t2]))
SGN = np.sign(TN - 2.0)
HABS = np.abs(TN - 2.0) * np.sqrt(TN / 2.0)          # |H21(y)| as a function of T = |y|^2

class Row:
    def __init__(self, path):
        d = np.load(path); self.rec = json.loads(str(d['rec'])); self.t = self.rec['t']
        self.S = d['S']; self.smax = self.S[-1]
        self.psi = CubicSpline(self.S, d['psi']); self.GA = CubicSpline(self.S, d['GA']); self.GB = CubicSpline(self.S, d['GB'])
        self.G0 = CubicSpline(self.S, d['G0']) if 'G0' in d else None
        self.M = d['M']
        ev = np.array([np.linalg.eigvalsh(m)[-1] for m in self.M]); self.rho = ev / P1      # pointwise worst A/B ratio
        self.rho0 = self.rho[0]; self.mu_chain = (1 - self.rho0) * P1
        r = self.rec; self.kq = P1 - (r['bA'] ** 2 + r['bB'] ** 2) / ETA; self.c0 = r['nu5'] ** 2 / ETA
        self.S5, self.ustar = self._S5()
    def ps(self, s):
        s = np.asarray(s, float); sm = np.minimum(s, self.smax)
        return self.psi(sm) + np.maximum(s - self.smax, 0.0) * self.psi(self.smax, 1)
    def ga(self, s): return self.GA(np.minimum(s, self.smax))
    def gb(self, s): return self.GB(np.minimum(s, self.smax))
    def g0(self, s): return self.G0(np.minimum(s, self.smax))
    def B5(self, u):
        return float(TW @ self.ps(np.sqrt(u * TN)))
    def cost(self, u): return self.kq * u + self.c0
    def _S5(self):
        us = np.linspace(0, 0.2, 401); vals = [self.B5(u) - self.cost(u) for u in us]; i = int(np.argmax(vals))
        if i == 0: return vals[0], 0.0
        r = minimize_scalar(lambda u: -(self.B5(u) - self.cost(u)), bounds=(us[max(i - 1, 0)], us[min(i + 1, 400)]), method='bounded', options={'xatol': 1e-10})
        return -r.fun, r.x
    def Vsl(self, u): return self.S5 - self.B5(u) + self.cost(u)
    # ---- the one-coordinate junta q = sig H21(y)
    def junta(self, sig):
        s = sig * HABS
        cA = TW @ (np.sqrt(TN) * SGN * self.ga(s)); cB = TW @ (np.sqrt(TN) * SGN * self.gb(s))
        c0 = TW @ (np.sqrt(TN) * SGN * self.g0(s)) if self.G0 is not None else 0.0
        F = TW @ self.ps(s); u = sig * sig
        return dict(u=u, delta=42 * u * u, cA=cA * cA, cB=cB * cB, D=self.B5(u) - F, Vsl=self.Vsl(u), F=F, sA=cA, sB=cB, s0=c0)
    # ---- Gaussian smoothing of the radial profiles (bulk W of complex variance b2): radial and charge-1 parts
    def smoothed(self, b2, rgrid, nth=64):
        # E_W f(|a + b W|) and E_W[G(|a+bW|) ph(a+bW)] (real part, a = r >= 0), W standard complex Gaussian, b^2 = b2
        t1, w1 = gl_panels(0.0, 2.0, 8); t2, w2 = gl_panels(2.0, 42.0, 14)
        Tw = np.concatenate([t1, t2]); ww = np.concatenate([w1, w2]) * np.exp(-Tw)
        th = (np.arange(nth) + 0.5) * 2 * np.pi / nth
        W = (np.sqrt(Tw)[:, None] * np.exp(1j * th)[None, :]).ravel(); w = (ww[:, None] * np.ones(nth)[None, :] / nth).ravel()
        b = np.sqrt(b2); out0 = np.zeros(len(rgrid)); outA = np.zeros(len(rgrid)); outB = np.zeros(len(rgrid))
        for i in range(0, len(rgrid), 64):
            a = rgrid[i:i + 64][:, None] + b * W[None, :]; s = np.abs(a); ph = np.real(a / np.maximum(s, 1e-300))
            out0[i:i + 64] = self.ps(s) @ w; outA[i:i + 64] = (self.ga(s) * ph) @ w; outB[i:i + 64] = (self.gb(s) * ph) @ w
        return out0, outA, outB
    # ---- spike family q = sig (c H(y) + sqrt(1-c^2) W)
    def spike(self, sig, c):
        if c >= 1: return self.junta(sig)
        b2 = sig * sig * (1 - c * c); rg = np.linspace(0, self.smax, 1201)
        ps_s, ga_s, gb_s = self.smoothed(b2, rg)
        a = np.minimum(sig * c * HABS, self.smax)
        P = CubicSpline(rg, ps_s); GA_ = CubicSpline(rg, ga_s); GB_ = CubicSpline(rg, gb_s)
        cA = TW @ (np.sqrt(TN) * SGN * GA_(a)); cB = TW @ (np.sqrt(TN) * SGN * GB_(a))
        F = TW @ P(a); u = sig * sig
        return dict(u=u, delta=42 * c ** 4 * u * u, cA=cA * cA, cB=cB * cB, D=self.B5(u) - F, Vsl=self.Vsl(u), F=F)
