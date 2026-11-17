#!/usr/bin/env python3
"""
certify_d2.py -- computer-assisted proof of (C_2) for spectra with M = max|lambda_j| in [1/8, 1].
(Theorem 4.2 of the note covers M <= 1/8 by hand.)  See Theorem 4.7 of HJM_Example3.1_d2_d3.md.

Goal: for every unit lambda with M in [1/8,1],
    I(lambda) = int_0^inf (Re phi(t) - e^{-t^2/2}) / t^2 dt  > 0,
which is equivalent to E|F_lambda| < sqrt(2/pi)  (F_lambda = sum_j lambda_j (X_j^2-1)/sqrt2).

Parameters of a cell: M in [Ma,Mb], S4 = sum_{j>=2} lambda_j^4 in [Sa,Sb]; S2 = 1-M^2;
mbar = min(Mb, sqrt(1-Ma^2), Sb^(1/4)) >= max_{j>=2}|lambda_j|.

Phase 1 (not part of the proof): adaptive partition of {M in [1/8,1], 0<=S4<=min(M^2,S2)S2}
          using a fast Simpson evaluation of the cell envelope (tolerance 1.5e-5).
Phase 2 (the proof): for every leaf cell, a rigorous lower bound ILB_rig > 0 (cells failing are split).
ILB_rig uses only: the envelope inequalities (E1)-(E5) of the note, monotonicity in t,
a Taylor bound on [0,0.3], the exact Gaussian integral, and an explicit tail bound.
Floating point: IEEE double; estimated accumulated rounding < 1e-13, covered by a 1e-9 slack.

Usage:  python3 certify_d2.py            (full run, all cores; ~2 min on 2 cores)
        python3 certify_d2.py --soundness (compare the bound with the true integral at random spectra)
"""
import numpy as np, sys, time, json
from multiprocessing import Pool
from scipy import integrate
np.seterr(over="ignore", invalid="ignore")
try:
    from mpmath import mp, mpf, exp as mexp, erfc as merfc, sqrt as msqrt, pi as mpi
    mp.dps = 30
except ImportError:
    sys.exit("pip install mpmath")

# ---------- elementary envelope ingredients ----------
gat = lambda x: x - np.arctan(x)                         # g(x) = x - arctan x
_xs = np.linspace(0, 400, 400001); _xs[0] = 1e-12
_q = (_xs - np.arctan(_xs)) / _xs**2; _q[0] = 0.0; _qc = np.maximum.accumulate(_q)
def qstar(s):
    """sup_{0<x<=s} g(x)/x^2 : value at next grid node + 1e-7 (> h^2 max|q''|/8 = 4e-8);
       for s>400 the sup is attained below 400 since g(x)/x^2 < 1/x there."""
    k = np.minimum(np.searchsorted(_xs, s, side='left'), len(_xs) - 1)
    return _qc[k] + 1e-7
def cchord(X):
    """c(X) = (X - log(1+X))/X^2 = int_0^1 u/(1+Xu) du, decreasing; lower bound 1/2 - X/3 for tiny X."""
    X = np.asarray(X, float); out = np.empty_like(X); m = X > 1e-6
    out[m] = (X[m] - np.log1p(X[m])) / X[m]**2; out[~m] = 0.5 - X[~m] / 3; return out
def psihat(w):  # concave nondecreasing majorant of w/(3+w)^2
    return np.where(w <= 3, w / (3 + w)**2, 1 / 12)
X0s = np.geomspace(1e-3, 1e4, 24)       # tangent points for -log(1+X) <= al X + be X^2
AL = -2 * np.log1p(X0s) / X0s + 1 / (1 + X0s)
BE = ((1 + X0s) * np.log1p(X0s) - X0s) / (X0s**2 * (1 + X0s))

def theta_up(t, Mb, S2lo, S2hi, Sb, mbar):
    """nondecreasing-in-t upper bound for |Theta(t)| valid on the cell"""
    Th = 0.5 * gat(np.sqrt(2) * Mb * t)
    if S2hi > 1e-14:
        avg = np.minimum(2 * t * t * Sb / max(S2lo, 1e-300), 2 * mbar * mbar * t * t)
        Th = Th + np.minimum.reduce([S2hi * t * t * np.sqrt(psihat(avg)),
                                     S2hi * t * t * qstar(np.sqrt(2) * mbar * t),
                                     np.sqrt(2) / 3 * np.sqrt(Sb * S2hi) * t**3])
    return Th
def R_low(t, Mb, S2hi, Sa, mbar):
    R = (1 + 2 * Mb * Mb * t * t)**-0.25
    if S2hi > 1e-14:
        R = R * np.exp(-S2hi * t * t / 2 + cchord(2 * mbar * mbar * t * t) * Sa * t**4)
    return R
def R_up(t, Ma, S2lo, Sb, mbar):
    R = (1 + 2 * Ma * Ma * t * t)**-0.25
    if S2lo > 0 and len(np.atleast_1d(t)):
        E = 0.25 * (2 * np.outer(t * t, AL) * S2lo + 4 * np.outer(t**4, BE) * Sb)
        Rr = np.minimum(np.exp(np.min(E, axis=1)), 1.0)
        if mbar > 0:
            Rr = np.minimum(Rr, np.exp(-np.log1p(2 * mbar * mbar * t * t) * S2lo / (4 * mbar * mbar)))
        R = R * Rr
    return R
def cell_consts(Ma, Mb, Sb):
    S2hi = 1 - Ma * Ma; S2lo = max(1 - Mb * Mb, 0.0)
    return S2hi, S2lo, min(Mb, np.sqrt(S2hi), Sb**0.25)

# ---------- Phase 1: fast (non-rigorous quadrature) evaluation, used only to choose the partition ----------
_t1 = np.linspace(1e-7, 40, 40001); _t2 = np.geomspace(40, 2e4, 8001)[1:]
def ILB_fast(Ma, Mb, Sa, Sb):
    S2hi, S2lo, mbar = cell_consts(Ma, Mb, Sb); v = 0.0
    for t in (_t1, _t2):
        c = np.cos(np.minimum(theta_up(t, Mb, S2lo, S2hi, Sb, mbar), np.pi))
        L = np.where(c >= 0, R_low(t, Mb, S2hi, Sa, mbar) * c, R_up(t, Ma, S2lo, Sb, mbar) * c)
        v += integrate.simpson((L - np.exp(-t * t / 2)) / t**2, x=t)
    return v - (1 + 2 * Ma * Ma * _t2[-1]**2)**-0.25 / _t2[-1]

# ---------- Phase 2: rigorous lower bound ----------
T1, TMID, TBIG = 0.3, 12.0, 1e5
GAUSS_T1 = float(mexp(-mpf(T1)**2 / 2) / mpf(T1) - msqrt(mpi / 2) * merfc(mpf(T1) / msqrt(2)))
_grids = {}
def grid(delta):
    if delta not in _grids:
        n1 = int(np.ceil(np.log(TMID / T1) / np.log1p(delta)))
        g1 = T1 * np.exp(np.arange(n1 + 1) * np.log1p(delta))
        d2 = 10 * delta; n2 = int(np.ceil(np.log(TBIG / g1[-1]) / np.log1p(d2)))
        _grids[delta] = np.concatenate([g1, g1[-1] * np.exp(np.arange(1, n2 + 1) * np.log1p(d2))])
    return _grids[delta]
def ILB_rig(Ma, Mb, Sa, Sb, delta=1e-4):
    S2hi, S2lo, mbar = cell_consts(Ma, Mb, Sb)
    # [0,T1]: Re phi >= 1 - t^2/2 + EF^4 t^4/24 - EF^6 t^6/720,  EF^4 = 3+12 L4,
    #         EF^6/720 - 1/48 = (2/3)L6 + L4/4 + L3^2/9 <= (2/3)L6 + (13/36)L4 ;  e^{-x} <= sum_{k<=4} (-x)^k/k!
    L4lo = Ma**4 + Sa; L4hi = Mb**4 + Sb; L6hi = Mb**6 + mbar**2 * Sb
    I0 = L4lo * T1**3 / 6 - (13 / 36 * L4hi + 2 / 3 * L6hi) * T1**5 / 5 - T1**7 / 2688
    # [T1,TBIG]: on [a,b], Re phi(t) >= R_low(b) c_b if c_b>=0 else R_up(a) c_b, c_b = cos(min(Theta_up(b),pi))
    t = grid(delta); a = t[:-1]; b = t[1:]
    c = np.cos(np.minimum(theta_up(b, Mb, S2lo, S2hi, Sb, mbar), np.pi)); pos = c >= 0
    val = np.empty_like(c)
    val[pos] = R_low(b[pos], Mb, S2hi, Sa, mbar) * c[pos]
    val[~pos] = R_up(a[~pos], Ma, S2lo, Sb, mbar) * c[~pos]
    Imid = np.sum(val * (1 / a - 1 / b))
    Itail = -(1 + 2 * Ma * Ma * TBIG**2)**-0.25 / TBIG     # Re phi >= -R_1(t) on [TBIG, inf)
    return I0 + Imid + Itail - GAUSS_T1 - 1e-9

# ---------- driver ----------
TOL = 1.5e-5
def smax(Ma, Mb): return min(Mb * Mb, 1 - Ma * Ma) * (1 - Ma * Ma)
def split(Ma, Mb, Sa, Sb, depth):
    Mc = (Ma + Mb) / 2
    if (Mb - Ma) > 1e-3 and (depth % 2 == 0 or (Sa > 0 and Sb / Sa < 1.05)):
        return [(Ma, Mc, Sa, Sb), (Mc, Mb, Sa, Sb)]
    Sm = Sb / 8 if Sa == 0 else np.sqrt(Sa * Sb)
    return [(Ma, Mb, Sa, Sm), (Ma, Mb, Sm, Sb)]
def do_strip(args):
    Ma0, Mb0 = args; leaves, fails, out = [], [], {'fast': 0, 'rig': 0, 'rig_fine': 0, 'worst': np.inf}
    def fast(Ma, Mb, Sa, Sb, depth):
        if Sa > smax(Ma, Mb): return
        Sb = min(Sb, smax(Ma, Mb)); out['fast'] += 1
        if ILB_fast(Ma, Mb, Sa, Sb) > TOL: leaves.append((Ma, Mb, Sa, Sb, depth)); return
        Mc = (Ma + Mb) / 2; Sc = np.sqrt(Sa * Sb) if Sa > 0 else Sb / 2
        if depth > 44 or ILB_fast(Mc, Mc, Sc, Sc) <= TOL: fails.append((Ma, Mb, Sa, Sb)); return
        for ch in split(Ma, Mb, Sa, Sb, depth): fast(*ch, depth + 1)
    final = []
    def rig(Ma, Mb, Sa, Sb, depth):
        if Sa > smax(Ma, Mb): return
        Sb = min(Sb, smax(Ma, Mb)); out['rig'] += 1
        r = ILB_rig(Ma, Mb, Sa, Sb, 1e-4)
        if r <= 0: out['rig_fine'] += 1; r = ILB_rig(Ma, Mb, Sa, Sb, 1e-5)
        if r > 0: out['worst'] = min(out['worst'], r); final.append((Ma, Mb, Sa, Sb, r)); return
        if depth > 50: fails.append((Ma, Mb, Sa, Sb)); return
        for ch in split(Ma, Mb, Sa, Sb, depth): rig(*ch, depth + 1)
    fast(Ma0, Mb0, 0.0, smax(Ma0, Mb0), 0)
    for lf in leaves: rig(*lf)
    return (Ma0, Mb0), out, fails, len(final)
def strips():
    S = [];  e = np.r_[np.linspace(0.125, 0.19, 14), np.linspace(0.20, 1.0, 81)]
    e = np.unique(np.r_[e, 0.19]);  return list(zip(e[:-1], e[1:]))   # exact abutment by construction
def soundness(ntests=40):
    rng = np.random.default_rng(1); worst = np.inf; bad = 0
    for k in range(ntests):
        n = rng.integers(1, 40); lam = rng.standard_normal(n) * rng.exponential(1, n)**rng.uniform(0, 3)
        if k % 4 == 0: lam = np.r_[rng.uniform(0.125, 1), rng.uniform(-0.3, 0.3, n)]
        lam /= np.linalg.norm(lam); M = np.max(np.abs(lam))
        if M < 0.125: continue
        S4 = np.sum(lam**4) - M**4
        t = np.concatenate([np.linspace(1e-6, 60, 600001), np.geomspace(60, 1e6, 200001)[1:]])
        R = np.prod([(1 + 2 * l * l * t * t)**-0.25 for l in lam], axis=0)
        Th = 0.5 * np.sum([np.arctan(np.sqrt(2) * l * t) - np.sqrt(2) * l * t for l in lam], axis=0)
        tr = integrate.trapezoid((R * np.cos(Th) - np.exp(-t * t / 2)) / t**2, t)
        lb = ILB_rig(M, M, S4, S4, 1e-5); worst = min(worst, tr - lb); bad += tr < lb
        print(f"n={n:2d} M={M:.3f} S4={S4:.2e} bound={lb:.5f} true={tr:.5f}")
    print("violations:", bad, " min(true - bound) =", worst)
if __name__ == "__main__":
    if "--soundness" in sys.argv: soundness(); sys.exit()
    t0 = time.time(); S = strips(); tot = {'fast': 0, 'rig': 0, 'rig_fine': 0, 'cells': 0}; worst = np.inf; allfails = []
    with Pool() as P:
        for (ab, out, fails, ncell) in P.imap_unordered(do_strip, S):
            for k in ('fast', 'rig', 'rig_fine'): tot[k] += out[k]
            tot['cells'] += ncell; worst = min(worst, out['worst']); allfails += fails
            print(f"strip [{ab[0]:.4f},{ab[1]:.4f}] cells={ncell} worst={out['worst']:.3e} fails={len(fails)}  t={time.time()-t0:.0f}s", flush=True)
    print(json.dumps({'M_range': [0.125, 1.0], 'certified_cells': tot['cells'], 'phase1_evals': tot['fast'],
                      'rigorous_evals': tot['rig'], 'fine_grid_evals': tot['rig_fine'],
                      'min_certified_lower_bound': worst, 'failures': len(allfails), 'seconds': round(time.time() - t0)}))
    print("CERTIFIED: I(lambda) > 0 for all unit lambda with max|lambda_j| in [1/8,1]" if not allfails else "NOT CERTIFIED")
