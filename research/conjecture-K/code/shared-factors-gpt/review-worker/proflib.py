# Reviewer's helper: the accurate row profiles (data/prof_jets_<t>.npz, built by build_profiles.py from prof_jets.py)
# as functions of the radius, and the transform k' = E h'(. + u tau).  Same code as in chi_cutoffs.py.
import math
import numpy as np
from scipy.interpolate import CubicSpline
import prof_jets as PJ, siglib as L

class Prof:
    R0 = 0.03
    def __init__(self, npz, X):
        self.R = npz['R']; G = npz['J'][:, X, :]; self.odd = npz['J0'][X, 1::2]
        cols = np.array([PJ.derived(r, g) for r, g in zip(self.R, G)])       # h, hp, E1, E2, E3
        v = self.R ** 2
        hpp = (cols[:, 2] - 2 * cols[:, 1]) / (4 * v)
        self.sp = [CubicSpline(self.R, c) for c in list(cols.T) + [hpp, G[:, 0]]]
        a1, a3, a5, a7 = self.odd
        t0 = np.array(PJ.derived_taylor(self.R[0], self.odd)); self.seam = float(np.abs(t0 - cols[0]).max() / np.abs(cols[0]).max())
        self.Ginf = float(G[-1, 0]); self.Rmax = float(self.R[-1])
    def ev(self, r):
        """h, h', E1, E2, E3, h'' at radii r (array)."""
        r = np.asarray(r, float); out = np.zeros((6,) + r.shape)
        lo = r < self.R0; hi = r > self.Rmax; mid = ~(lo | hi)
        if lo.any():
            t = PJ.derived_taylor(r[lo], self.odd)
            for i in range(5): out[i][lo] = t[i]
            out[5][lo] = 2 * self.odd[2] + 6 * self.odd[3] * r[lo] ** 2
        if mid.any():
            for i in range(6): out[i][mid] = self.sp[i](r[mid])
        if hi.any():                       # Gamma frozen beyond the grid (negligible weights there)
            g, rr = self.Ginf, r[hi]
            out[0][hi] = g / rr; out[1][hi] = -g / (2 * rr ** 3); out[2][hi] = 2 * g / rr ** 3; out[3][hi] = -3 * g / rr ** 3; out[4][hi] = 0.0
            out[5][hi] = 3 * g / (4 * rr ** 5)
        return out
    def G(self, r):
        r = np.asarray(r, float)
        a1, a3, a5, a7 = self.odd
        return np.where(r < self.R0, a1 * r + a3 * r ** 3 + a5 * r ** 5 + a7 * r ** 7, np.where(r > self.Rmax, self.Ginf, self.sp[6](np.clip(r, self.R0, self.Rmax))))

TQ, WQ = L.panels(list(np.linspace(0, 6, 25)) + list(np.linspace(6, 46, 21)[1:]), 8); WQ = WQ * np.exp(-TQ)      # tau ~ Exp(1)

def transforms(pr, u, v):
    """k'(v) = E h'(v + u tau), k''(v) = E h''(v + u tau)."""
    x = np.sqrt(v[:, None] + u * TQ[None, :]); e = pr.ev(x.ravel())
    return e[1].reshape(x.shape) @ WQ, e[5].reshape(x.shape) @ WQ

