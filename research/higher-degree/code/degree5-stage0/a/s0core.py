# Stage 0 of the degree-5 plan (issue #751), part (a): engine.  Everything here is N (floating point).
# A research worker of claude-b9ee, 27-28 Nov 2026.
#
# Row of ledger 4.1 at the q-only responses (as code/degree5-gate/pipeline/rows/lawbundle.py):
#   value(p) = t^2 - 2 l t + 2 beta^2/e1 + sup_{sigma, nu, law} [ E Psi5(sigma sqrt U; nu; p) - kappa(p) sigma^2 - nu^2/eta ],
#   p = (l, beta, bA, bB),  kappa(p) = 1/e1 - (bA^2 + bB^2)/eta,
#   Psi5(s; nu; p) = E_z |L + nu e32 + s D| + |L + nu e32 - s D|,  L = z (l + beta(|z|^2 - 2)),  D = 1 - bA e11(z) - bB e20(z),
# where U = |q|^2/||q||^2 for the remote cubic q of the response and sigma = ||q||_2.
# A scenario is a point (sigma, nu, discrete law of s = sigma sqrt U); its value is convex in p.
#   upper side: for a row p, the supremum over a class of laws (an oracle);
#   lower side: for a POOL of scenarios, min_p max_pool is a lower bound of min_p value(p) whatever way the pool was
#               found, as long as its laws are in the class.  master() solves this convex problem and returns a dual
#               bound that is valid on the whole box |p - p_hat|_inf <= RBOX (no trust region).
import math, os
from math import factorial
import numpy as np
from numpy.polynomial.legendre import leggauss
from scipy.special import eval_genlaguerre
from scipy.optimize import minimize, linprog

def e_ab(a, b, z):
    T = np.abs(z) ** 2
    if a >= b: v = (-1) ** b * factorial(b) * z ** (a - b) * eval_genlaguerre(b, a - b, T)
    else: v = (-1) ** a * factorial(a) * np.conj(z) ** (b - a) * eval_genlaguerre(a, b - a, T)
    return v / math.sqrt(factorial(a) * factorial(b))

def zgrid(npan=40, nq=8, nth=256, R=6.6):
    """Gauss-Legendre panels in |z|, midpoints in arg z on (0, pi) (conjugation symmetry: real parameters, real s)."""
    x, w = leggauss(nq); ed = np.linspace(0, R, npan + 1)
    r = np.concatenate([(ed[i] + ed[i + 1]) / 2 + (ed[i + 1] - ed[i]) / 2 * x for i in range(npan)])
    wr = np.concatenate([(ed[i + 1] - ed[i]) / 2 * w for i in range(npan)]) * 2 * r * np.exp(-r * r)
    th = (np.arange(nth // 2) + 0.5) * np.pi / (nth // 2)
    Rm, TH = np.meshgrid(r, th, indexing='ij')
    W = (wr[:, None] * np.ones(th.size)[None, :]).ravel(); W = W / W.sum()
    return (Rm * np.exp(1j * TH)).ravel(), W

class Engine:
    def __init__(self, e1, eta, npan=40, nth=256):
        self.e1, self.eta = e1, eta
        self.Z, self.WZ = zgrid(npan=npan, nth=nth); self.TT = np.abs(self.Z) ** 2
        self.E11 = e_ab(1, 1, self.Z); self.E20 = e_ab(2, 0, self.Z); self.E32 = e_ab(3, 2, self.Z)
    def kappa(self, p): return 1 / self.e1 - (p[2] ** 2 + p[3] ** 2) / self.eta
    def cconst(self, t, p): return t * t - 2 * p[0] * t + 2 * p[1] ** 2 / self.e1
    def psi(self, p, s_arr, nu, grad=False):
        """Psi5(s; nu; p) for an array of s, and its p-gradient (direct quadrature)."""
        l, beta, bA, bB = p
        base = self.Z * (l + beta * (self.TT - 2)) + nu * self.E32; Dz = 1 - bA * self.E11 - bB * self.E20
        s_arr = np.asarray(s_arr, float); vals = np.empty(len(s_arr)); G = np.zeros((len(s_arr), 4)) if grad else None
        for i0 in range(0, len(s_arr), 32):
            sb = s_arr[i0:i0 + 32][:, None]
            Ap = base[None, :] + sb * Dz[None, :]; Am = base[None, :] - sb * Dz[None, :]; ap = np.abs(Ap); am = np.abs(Am)
            vals[i0:i0 + 32] = (ap + am) @ self.WZ
            if grad:
                pp = np.conj(Ap / np.maximum(ap, 1e-300)); pm = np.conj(Am / np.maximum(am, 1e-300)); sm = pp + pm; df = pp - pm
                G[i0:i0 + 32, 0] = np.real(sm * self.Z[None, :]) @ self.WZ
                G[i0:i0 + 32, 1] = np.real(sm * (self.Z * (self.TT - 2))[None, :]) @ self.WZ
                G[i0:i0 + 32, 2] = np.real(df * (-sb * self.E11[None, :])) @ self.WZ
                G[i0:i0 + 32, 3] = np.real(df * (-sb * self.E20[None, :])) @ self.WZ
        return (vals, G) if grad else vals
    def scen(self, t, p, sc, grad=True):
        """value (and p-gradient) of a scenario sc = (sigma, nu, s-atoms, weights)."""
        sig, nu, sat, w = sc
        if grad:
            v, G = self.psi(p, sat, nu, True)
            val = self.cconst(t, p) + w @ v - self.kappa(p) * sig ** 2 - nu ** 2 / self.eta
            g = w @ G + np.array([-2 * t, 4 * p[1] / self.e1, 2 * p[2] * sig ** 2 / self.eta, 2 * p[3] * sig ** 2 / self.eta])
            return val, g
        return self.cconst(t, p) + w @ self.psi(p, sat, nu) - self.kappa(p) * sig ** 2 - nu ** 2 / self.eta

# table of Psi on a grid of s (for oracles): fine up to 8, coarser to SMAX (Psi is smooth and nearly linear there)
SGRID = np.concatenate([np.linspace(0, 2, 201), np.linspace(2, 8, 241)[1:], np.linspace(8, 40, 129)[1:]])
class PsiTable:
    def __init__(self, eng, p, nus):
        from scipy.interpolate import CubicSpline
        self.nus = np.asarray(nus, float); self.P = np.stack([eng.psi(p, SGRID, nu) for nu in self.nus], axis=1)
        self.sp = [CubicSpline(SGRID, self.P[:, j]) for j in range(len(self.nus))]
        self.lip = 2 * math.sqrt(1 + p[2] ** 2 + p[3] ** 2)          # |dPsi/ds| <= 2 E|D| <= 2 ||D||_2
    def __call__(self, j, s):
        s = np.asarray(s, float); sm = SGRID[-1]
        return np.where(s <= sm, self.sp[j](np.minimum(s, sm)), self.P[-1, j] + self.lip * (s - sm))   # beyond SMAX: an upper bound

RBOX = 3.0
def master(eng, t, pool, p0):
    """min over p (no trust region) of max over the pool of the scenario values: a convex problem.
    Returns (p_hat, value at p_hat, dual lower bound valid for all p with |p - p_hat|_inf <= RBOX, weights)."""
    cache = {}
    def both(xv):
        k = tuple(np.round(xv[:4], 14))
        if k not in cache:
            cache.clear(); vg = [eng.scen(t, xv[:4], sc) for sc in pool]
            cache[k] = (np.array([v for v, _ in vg]), np.array([g for _, g in vg]))
        return cache[k]
    def cons_f(xv): return xv[4] - both(xv)[0]
    def cons_j(xv): return np.hstack([-both(xv)[1], np.ones((len(pool), 1))])
    tau0 = float(both(np.concatenate([p0, [0.0]]))[0].max())
    best = minimize(lambda xv: xv[4], np.concatenate([p0, [tau0]]), jac=lambda xv: np.array([0, 0, 0, 0, 1.0]), method='SLSQP',
                    constraints=[dict(type='ineq', fun=cons_f, jac=cons_j)], options=dict(ftol=1e-12, maxiter=300))
    ph = np.array(best.x[:4])
    vals = []; grads = []
    for sc in pool:
        v, g = eng.scen(t, ph, sc); vals.append(v); grads.append(g)
    vals = np.array(vals); grads = np.array(grads); top = vals.max()
    # dual bound: for weights lam on the pool (a probability vector), every p in the box has
    #   max_i f_i(p) >= sum lam_i f_i(p) >= sum lam_i f_i(ph) + (sum lam_i g_i).(p - ph) >= sum lam_i f_i(ph) - RBOX |sum lam_i g_i|_1
    # (convexity of each f_i).  Maximise the right side over lam: an LP.
    n = len(pool)
    c = np.concatenate([-vals, RBOX * np.ones(4)])                      # variables lam (n), y (4) >= |sum lam g|
    A_ub = np.vstack([np.hstack([grads.T, -np.eye(4)]), np.hstack([-grads.T, -np.eye(4)])]); b_ub = np.zeros(8)
    A_eq = np.concatenate([np.ones(n), np.zeros(4)])[None, :]
    r = linprog(c, A_ub=A_ub, b_ub=b_ub, A_eq=A_eq, b_eq=[1], bounds=[(0, None)] * (n + 4), method='highs')
    lb = -r.fun if r.status == 0 else -np.inf
    return ph, float(top), float(lb), (r.x[:n] if r.status == 0 else None)

def bundle(eng, t, oracle, p0, rounds=30, tol=2e-6, log=None, pool=None):
    """oracle(p) -> (sup value without the row constant, argument, list of scenarios).  Returns a dict with the best row,
    its oracle value (upper side), the pool bound (lower side) and the pool."""
    p = np.array(p0, float); pool = list(pool or []); best = None; lb = -np.inf; hist = []
    for it in range(rounds):
        G, arg, scs = oracle(p)
        ub = eng.cconst(t, p) + G
        if best is None or ub < best[0]: best = (ub, p.copy(), arg)
        pool += scs
        ph, top, lbk, lam = master(eng, t, pool, best[1])
        lb = max(lb, lbk)
        hist.append((it, ub, best[0], top, lbk))
        if log: log('  it %d: value %.7f (best %.7f) pool max at master %.7f dual bound %.7f gap %.1e p=%s arg=%s pool %d' % (
            it, ub, best[0], top, lbk, best[0] - lb, np.round(p, 5).tolist(), arg, len(pool)))
        if best[0] - lb < tol: break
        # damped step when the master point did not improve last time (plain Kelley can oscillate)
        p = ph if (it < 2 or hist[-1][1] <= hist[-2][1] + 1e-9) else 0.5 * (ph + best[1])
    return dict(value=best[0], p=best[1].tolist(), arg=best[2], lower=lb, gap=best[0] - lb, pool=pool, hist=hist)
