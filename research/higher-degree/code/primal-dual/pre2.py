# Preprocessed two-variable adversaries [N]: F(zeta1, zeta2), G(zeta1', zeta2') with corr(zeta_i, zeta_i') = rho_i(t)
# (zeta_i = mixtures of independent diffuse grades; negative coefficients = sign flips on one side; sum|rho_i| <= 1).
# Payoff against lam = sum_alpha w_alpha conj(F_alpha) G_alpha with w_alpha = sum_k lam_k [rho1^{n1} rho2^{n2}]_k.
import sys, json, time, numpy as np
sys.path.insert(0, __import__('os').path.dirname(__import__('os').path.abspath(__file__)))
from gm import *

def odd_pow_table(rho, K, nmax):
    """T[n] = t-coefficients (index = degree) of rho(t)^n, truncated at degree 2K+1"""
    D = 2 * K + 2; r = np.zeros(D)
    for j, a in enumerate(rho):
        if 2 * j + 1 < D: r[2 * j + 1] = a
    T = [np.eye(D)[0]]
    for n in range(1, nmax + 1): T.append(np.convolve(T[-1], r)[:D])
    return T

def multipliers(M, lam, rho1, rho2):
    K = len(lam) - 1; nmax = 2 * K + 2
    T1 = odd_pow_table(rho1, K, nmax); T2 = odd_pow_table(rho2, K, nmax)
    w = np.zeros(M.nb)
    for i, (k, combo) in enumerate(M.basis):
        n1 = sum(combo[0]); n2 = sum(combo[1]) if len(combo) > 1 else 0
        if n1 > nmax or n2 > nmax: continue
        s = np.convolve(T1[n1], T2[n2])[:2 * K + 2]
        w[i] = sum(lam[kk] * s[2 * kk + 1] for kk in range(K + 1))
    return w

def alt_w(M, w, c0, iters=250, tol=1e-11):
    c = np.asarray(c0, complex); hist = []; vold = -9; v = None
    for it in range(iters):
        h = M.evaluate(c); f = h / np.maximum(np.abs(h), 1e-300); fh = M.project(f)
        hist.append((c, fh)); hist = hist[-2:]
        if len(hist) == 2:
            v = float(np.real(np.sum(w * np.conj(hist[1][1]) * hist[0][1])))
            if it > 4 and abs(v - vold) < tol: break
            vold = v
        c = w * fh
    return v, hist[1][0], hist[0][0]

def make(K, n1=48, n2=32, two=True):
    vs = [Var('z', (1, 0), n1=n1)] + ([Var('c', (1, 0), n1=n1, n2=n2, name='zeta2')] if two else [])
    return Model(vs, K)

def value(M, lam, rho1, rho2, starts=4, seed=0, warm=None):
    w = multipliers(M, lam, rho1, rho2); rng = np.random.default_rng(seed); best = (-9, None)
    inits = ([warm] if warm is not None else []) + [None] * starts
    for c0 in inits:
        if c0 is None:
            c0 = rng.normal(size=M.nb) + 1j * rng.normal(size=M.nb); c0[0] += 2
        v, cf, cg = alt_w(M, w, c0)
        if v > best[0]: best = (v, cf)
    return best

if __name__ == '__main__':
    K = int(sys.argv[1]); lam = json.loads(sys.argv[2])
    M = make(K, 40, 32)
    print('check W3 (rho1=t, rho2=t^3):', value(M, lam, [1], [0, 1])[0])
    print('check Z2 (rho1=t, rho2=t):', value(M, lam, [1], [1])[0])
    print('check plain (rho1=t, rho2=0):', value(M, lam, [1], [0])[0])
