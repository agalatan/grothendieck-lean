# High-degree kernel coefficients of W3-model pairs [N]: c_k = Re<P_k f, P_k g> for k <= KH (degree 2KH+1),
# with stable Laguerre-form complex Hermite functions and an FFT in arg W.  The pair is f = ph(h_cf), g = ph(h_cg),
# h given by low-degree basis coefficients of a gm2.Model2 W3 model.  Also returns the energies ||P_k f||^2.
import numpy as np, math
from scipy.special import eval_genlaguerre, gammaln
from numpy.polynomial.legendre import leggauss

def panels(L, npan, q=8):
    x, w = leggauss(q); ed = np.linspace(0, L, npan + 1)
    r = np.concatenate([(a + b) / 2 + (b - a) / 2 * x for a, b in zip(ed[:-1], ed[1:])])
    wr = np.concatenate([(b - a) / 2 * w for a, b in zip(ed[:-1], ed[1:])])
    return r, wr * 2 * r * np.exp(-r * r)

def radial(p, q, r):
    """|normalised complex Hermite H_{p,q}| radial part: sqrt(min!/max!) r^{|p-q|} L_min^{(|p-q|)}(r^2) (sign irrelevant)"""
    mn, mx = min(p, q), max(p, q); d = mx - mn
    with np.errstate(divide='ignore'):
        lg = 0.5 * (gammaln(mn + 1) - gammaln(mx + 1)) + d * np.log(np.maximum(r, 1e-300))
    return np.exp(lg) * eval_genlaguerre(mn, d, r * r)

class HiSpec:
    def __init__(self, KH, nr=176, ns=144, nth=96, Rr=11.0, Rs=9.0):
        self.KH = KH
        self.r, self.wr = panels(Rr, nr // 8); self.s, self.ws = panels(Rs, ns // 8)
        self.wr /= self.wr.sum(); self.ws /= self.ws.sum(); self.nth = nth
        self.th = (np.arange(nth) + 0.5) * 2 * np.pi / nth
        # basis of chaos k: (a,b) for z, (c,d) for W with a+2c+d = k+1, b+c+2d = k
        self.blocks = {}
        for k in range(KH + 1):
            for c in range(0, k + 2):
                for d in range(0, k + 1):
                    a = k + 1 - 2 * c - d; b = k - c - 2 * d
                    if a >= 0 and b >= 0: self.blocks.setdefault(k, []).append((a, b, c, d))
        self.zt = {}; self.wt = {}
        for k, L in self.blocks.items():
            for a, b, c, d in L:
                if (a, b) not in self.zt: self.zt[(a, b)] = radial(a, b, self.r)
                if (c, d) not in self.wt: self.wt[(c, d)] = radial(c, d, self.s)
    def gram_check(self):
        e = 0.0
        for (a, b), v in list(self.zt.items())[:40]: e = max(e, abs(np.sum(self.wr * v * v) - 1))
        for (c, d), v in list(self.wt.items())[:40]: e = max(e, abs(np.sum(self.ws * v * v) - 1))
        return e
    def spectra(self, F):
        """F: values on (r, s, theta) grid -> dict k -> complex coefficient vector (ordered as blocks[k])"""
        Fm = np.fft.fft(F, axis=2) / self.nth          # Fm[..., m] = mean_theta F e^{-i m theta'} with theta' = theta - offset
        # FFT phase offset: theta_j = (j+1/2) 2pi/n -> factor e^{-i m pi/n}
        out = {}
        for k, L in self.blocks.items():
            v = np.zeros(len(L), complex)
            for i, (a, b, c, d) in enumerate(L):
                m = c - d; Fmm = Fm[:, :, m % self.nth] * np.exp(-1j * m * np.pi / self.nth)
                v[i] = np.einsum('r,rs,s->', self.wr * self.zt[(a, b)], Fmm, self.ws * self.wt[(c, d)])
            out[k] = v
        return out

def pair_spectrum(H, f_vals, g_vals):
    sf = H.spectra(f_vals); sg = H.spectra(g_vals)
    c = np.array([float(np.real(np.vdot(sf[k], sg[k]))) for k in range(H.KH + 1)])
    ef = np.array([float(np.sum(np.abs(sf[k]) ** 2)) for k in range(H.KH + 1)])
    eg = np.array([float(np.sum(np.abs(sg[k]) ** 2)) for k in range(H.KH + 1)])
    return c, ef, eg
