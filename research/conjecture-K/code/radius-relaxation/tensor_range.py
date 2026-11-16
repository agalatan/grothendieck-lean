#!/usr/bin/env python3
"""N: how much of the relaxed parameter set do genuine coefficient tensors reach?

q = sum t_{abc} :Z_a Z_b conj(Z_c):  (t symmetric in a, b; 2 sum |t|^2 = 1).  Contraction scalars
(definitions and proofs in the docstring of check_budgets_exact.py):
  N_{jl} = sum_{bk} t_{jbk} conj(t_{lbk}),   H_{kl} = sum_{ab} conj(t_{abk}) t_{abl},
  n = |N|^2, h = |H|^2, z = Re tr(N H),  b = |B|^2 with B_{ab} = sum_{cd} t_{acd} t_{bdc},
  y = |Sym_{abe} W|^2 with W_{abe;f} = sum_c t_{abc} t_{cef};   s = 32n + 8h + 32b + 96y.
A certificate row bounds the parameter term by s * L, L >= max over the RELAXED set of
  D1(p) = d_lin . p + sqrt(s) [ l3a (300 sqrt(s0 h0) + 198 h0) + l3b (135 sqrt(s0 h0) + 11781/32 h0) ](p),
p = (n,h,b,y,z)/s.  Diluting a cubic by an independent diffuse cubic scales (n,h,b,y,z) and s by
the same factor, so every tensor with s(t) >= s gives an attainable p.  The script maximises D1
over tensors in d = 1..5 complex variables (random restarts, L-BFGS with numerical gradients) and
compares with L.  A search gives lower bounds on the attainable maximum only.
"""
import os, sys, json
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from fractions import Fraction as Fr
import numpy as np
from scipy.optimize import minimize
import verify_cert as VC


def invariants(t):
    t = 0.5 * (t + t.transpose(1, 0, 2))
    t = t / np.sqrt(2 * np.sum(np.abs(t) ** 2))
    N = np.einsum('jbk,lbk->jl', t, t.conj())
    H = np.einsum('abk,abl->kl', t.conj(), t)
    B = np.einsum('acd,bdc->ab', t, t)
    W = np.einsum('abc,cef->abef', t, t)
    Ws = (W + W.transpose(0, 2, 1, 3) + W.transpose(1, 0, 2, 3) + W.transpose(1, 2, 0, 3) + W.transpose(2, 0, 1, 3)
          + W.transpose(2, 1, 0, 3)) / 6
    n = np.sum(np.abs(N) ** 2)
    h = np.sum(np.abs(H) ** 2)
    z = np.real(np.trace(N @ H))
    b = np.sum(np.abs(B) ** 2)
    y = np.sum(np.abs(Ws) ** 2)
    return np.array([n, h, b, y, z])


def kurt(p):
    return 32 * p[0] + 8 * p[1] + 32 * p[2] + 96 * p[3]


if __name__ == '__main__':
    # self-test on the cubics with known scalars
    t = np.zeros((1, 1, 1), complex); t[0, 0, 0] = 1
    print('monomial          ', invariants(t), ' (expect 1/4 each)')
    t = np.zeros((2, 2, 2), complex); t[0, 0, 1] = 1
    print('y1^2 conj(y2)     ', invariants(t), ' (expect .25 .25 0 0 0)')
    t = np.zeros((3, 3, 3), complex); t[0, 1, 2] = 1
    print('y1 y2 conj(y3)    ', invariants(t), ' (expect .125 .25 0 0 0)')
    m = 40
    t = np.zeros((m + 1, m + 1, m + 1), complex)
    for j in range(1, m + 1):
        t[0, j, j] = 1
    p = invariants(t)
    print('X * real H11 (m=%d)' % m, p, ' s =', kurt(p), ' (limit 1/16, 0, 1/16, 0, 0; s = 4)')

    cert = json.load(open(sys.argv[1]))
    s_t = Fr(sys.argv[2]) if len(sys.argv) > 2 else Fr(5)
    row = next(r for r in cert['rows'] if Fr(r['s_lo']) <= s_t <= Fr(r['s_hi']))
    end = 'hi' if Fr(row['s_hi']) == s_t else 'lo'
    s = float(Fr(row['s_' + end]))
    mu = [float(Fr(x)) for x in row['mu']]
    sig = float(Fr(row['sigma']))
    l3 = [float(Fr(x)) for x in row['l3']]
    dlin = np.array([sum(mu[j] * VC.BJ[j][i] for j in range(5)) + sig * VC.EA[i] for i in range(5)])
    S0 = np.array([float(x) for x in VC.S0]); H0 = np.array([float(x) for x in VC.H0])
    L = row['par'][end]['lp_value']
    print('\nrow [%s, %s], endpoint s = %g: relaxed maximum L = %.6f (parameter term s L = %.5f); d_lin = %s' % (
        row['s_lo'], row['s_hi'], s, L, s * L, np.round(dlin, 4)))
    print('relaxed maximiser p =', np.round(row['par'][end]['p'], 5))

    def D1(p1):
        s0, h0 = max(S0 @ p1, 0.0), max(H0 @ p1, 0.0)
        g = np.sqrt(s0 * h0)
        return dlin @ p1 + np.sqrt(s) * (l3[1] * (300 * g + 198 * h0) + l3[2] * (135 * g + 11781.0 / 32 * h0))

    def obj(x, d):
        t = (x[:d ** 3] + 1j * x[d ** 3:]).reshape(d, d, d)
        p = invariants(t)
        st = kurt(p)
        return -D1(p / st) + 10.0 * max(0.0, s - st) ** 2

    rng = np.random.default_rng(3)
    best_all = None
    for d in (1, 2, 3, 4, 5):
        best = None
        nstart = {1: 2, 2: 40, 3: 30, 4: 12, 5: 6}[d]
        for it in range(nstart):
            x0 = rng.standard_normal(2 * d ** 3)
            if it % 3 == 1:        # sparse start
                x0 *= (rng.random(2 * d ** 3) < 0.3)
                if not np.any(x0):
                    x0[0] = 1.0
            res = minimize(obj, x0, args=(d,), method='L-BFGS-B', options=dict(maxiter=400))
            if best is None or res.fun < best[0]:
                best = (res.fun, res.x)
        t = (best[1][:d ** 3] + 1j * best[1][d ** 3:]).reshape(d, d, d)
        p = invariants(t)
        st = kurt(p)
        print('d = %d: best attainable D1 = %.6f  (%.1f%% of L);  s(t) = %.3f,  p/s = %s' % (
            d, D1(p / st), 100 * D1(p / st) / L, st, np.round(p / st, 5)), flush=True)
        if best_all is None or D1(p / st) > best_all[0]:
            best_all = (D1(p / st), d, p, st)
    print('largest value found: %.6f = %.1f%% of the relaxed maximum; a parameter set cut down to the attainable one'
          ' could lower the parameter term by at most %.5f (before re-optimising the certificate)' % (
              best_all[0], 100 * best_all[0] / L, s * (L - best_all[0])))
