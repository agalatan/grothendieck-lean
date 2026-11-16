#!/usr/bin/env python3
"""Exact sanity checks of the analytic constants of the real-Stein radius proof
(claude-b9ee review of ledger row 3.7).

For random genuine complex Wick cubics q in H_{2,1}(C^n) (n = 2, 3), with integer complex
coefficients, everything is computed EXACTLY (sympy polynomials, Gaussian monomial moments):
  * circularity: E X^2 = E Y^2, E XY = 0 for X = Re q, Y = Im q;
  * kappa_4(X) = (3/8) (E|q|^4 - 2 (E|q|^2)^2)            [i.e. 3s/8 after normalisation];
  * Gamma = |grad X|^2 / 3 (real coordinates): E Gamma = E X^2, E X^4 = 3 E[X^2 Gamma];
  * Var Gamma <= (2/9) kappa_4(X), and the exact ratio;
  * the sixth-moment inequality E U^3 <= 9m - 12 + C6 (m-2)^{3/2} (normalised U = |q|^2).
Coordinates: Z_j = (x_j + i y_j)/sqrt 2 with x, y standard real Gaussians; we use
2 sqrt2 :Z_j Z_k conj(Z_l): = (x_j+iy_j)(x_k+iy_k)(x_l-iy_l) - 2 d_jl (x_k+iy_k) - 2 d_kl (x_j+iy_j)
(all checks are scale invariant).
"""
import sys, random, itertools
import sympy as sp
from fractions import Fraction as F

def dfact(a):
    r = 1
    while a > 1:
        r *= a; a -= 2
    return r

def gexp(P, gens):
    """E over independent standard Gaussians of a sympy Poly."""
    tot = sp.Rational(0)
    for mon, c in P.terms():
        if any(e % 2 for e in mon):
            continue
        val = 1
        for e in mon:
            val *= dfact(e - 1)
        tot += c * val
    return tot

def run_real(n, seed):
    rnd = random.Random(seed)
    xs = sp.symbols(f'x0:{n}', real=True); ys = sp.symbols(f'y0:{n}', real=True)
    gens = list(xs) + list(ys)
    I = sp.I
    z = [xs[j] + I * ys[j] for j in range(n)]
    zb = [xs[j] - I * ys[j] for j in range(n)]
    q = 0
    for j in range(n):
        for k in range(j, n):
            for l in range(n):
                a = rnd.randint(-3, 3) + I * rnd.randint(-3, 3)
                if a == 0:
                    continue
                term = z[j] * z[k] * zb[l] - 2 * (1 if j == l else 0) * z[k] - 2 * (1 if k == l else 0) * z[j]
                q += a * term
    q = sp.expand(q)
    re_q, im_q = q.as_real_imag()
    X = sp.Poly(sp.expand(re_q), *gens); Y = sp.Poly(sp.expand(im_q), *gens)
    return X, Y, gens

C6 = sp.Rational(4045313, 100000)
for n, seed, do6 in [(1, 1, True), (2, 11, True), (2, 12, True), (2, 13, True), (3, 21, False), (3, 22, False)]:
    X, Y, gens = run_real(n, seed)
    EX2 = gexp(X * X, gens); EY2 = gexp(Y * Y, gens); EXY = gexp(X * Y, gens)
    U = X * X + Y * Y
    m1 = gexp(U, gens); m2 = gexp(U * U, gens)
    EX4 = gexp(X ** 4, gens)
    k4 = EX4 - 3 * EX2 ** 2
    grad2 = sum((X.diff(g)) ** 2 for g in gens)
    Gam = grad2 * sp.Rational(1, 3)
    EG = gexp(Gam, gens); EX2G = gexp(X * X * Gam, gens); EG2 = gexp(Gam * Gam, gens)
    varG = EG2 - EG ** 2
    s = m2 / m1 ** 2 - 2
    line = dict(n=n, seed=seed,
                circ=(EX2 == EY2 and EXY == 0),
                EX2_half_m1=(EX2 == m1 / 2),
                k4_is_3s8=(k4 / EX2 ** 2 == sp.Rational(3, 8) * s * (m1 / EX2) ** 2),
                EGamma_eq_EX2=(EG == EX2),
                EX4_eq_3EX2Gamma=(EX4 == 3 * EX2G),
                varG_over_k4=float(varG / k4) if k4 != 0 else None,
                varG_le_2_9_k4=(varG <= sp.Rational(2, 9) * k4),
                s=float(s))
    if do6:
        m3 = gexp(U ** 3, gens)
        M3 = m3 / m1 ** 3; M2 = m2 / m1 ** 2
        rhs = 9 * M2 - 12 + C6 * (M2 - 2) ** sp.Rational(3, 2)
        line['sixth_ok'] = bool(M3 <= rhs)
        line['sixth_ratio'] = float((M3 - 9 * M2 + 12) / (M2 - 2) ** sp.Rational(3, 2)) if M2 > 2 else None
    print(line, flush=True)
    assert line['circ'] and line['EX2_half_m1'] and line['k4_is_3s8'] and line['EGamma_eq_EX2']
    assert line['EX4_eq_3EX2Gamma'] and line['varG_le_2_9_k4']
print('ANALYTIC CONSTANT CHECKS PASS')
