#!/usr/bin/env python3
"""Exact checks for PROOF_HARMONIC.md (claims H1-H4).  claude-b9ee, 17 Nov 2026.

Rational arithmetic (fractions.Fraction) and exact symbolic algebra (sympy) only; no floating-point value decides a
check.  Each line names the step of PROOF_HARMONIC.md it certifies.
usage: python3 -I verify_harmonic.py > verify_harmonic.log    (sympy; about a minute)
Exit status 0 iff every check passes.
"""
import sys
from fractions import Fraction as Fr
from math import comb
from itertools import combinations
import sympy as sp

OK = True


def check(label, cond):
    global OK
    print(('PASS  ' if cond else 'FAIL  ') + label)
    OK = OK and bool(cond)


def is_zero(expr):
    return sp.simplify(sp.expand(expr)) == 0


a, x, y, t, s = sp.symbols('a x y t s', real=True)
PI = sp.pi

# ---------------------------------------------------------------------------------------------------------------
print('== H1: the trigonometric lemma ==')
# the extremal function and its sign
g = sp.sin(a) + sp.sin(3 * a) / 3
check('g = sin a + (1/3) sin 3a = 2 sin a (1 - (2/3) sin^2 a), so sign g = sign sin a',
      is_zero(sp.expand_trig(g - 2 * sp.sin(a) * (1 - sp.Rational(2, 3) * sp.sin(a)**2))))
L1 = 2 * sp.integrate(g, (a, 0, PI)) / (2 * PI)
L2 = sp.integrate(g**2, (a, 0, 2 * PI)) / (2 * PI)
check('(1/2pi) int |g| = 20/(9 pi) and (1/2pi) int g^2 = 5/9', sp.simplify(L1 - sp.Rational(20, 9) / PI) == 0 and L2 == sp.Rational(5, 9))
check('ratio = 4 sqrt5/(3 pi)', sp.simplify(L1 / sp.sqrt(L2) - 4 * sp.sqrt(5) / (3 * PI)) == 0)
# Fourier coefficients of the one-change sign pattern: sigma = sign(sin a) = +1 on (0,pi), -1 on (pi,2pi)
for k in (1, 3):
    ck = (sp.integrate(sp.exp(-sp.I * k * a), (a, 0, PI)) - sp.integrate(sp.exp(-sp.I * k * a), (a, PI, 2 * PI))) / (2 * PI)
    check('sign(sin a): hat sigma_%d = 2/(pi i %d), |hat sigma_%d| = 2/(%d pi)' % (k, k, k, k), sp.simplify(ck - 2 / (PI * sp.I * k)) == 0)
check('m = 1: ||P sigma||^2 = 2(2/pi)^2 (1 + 1/9) = 80/(9 pi^2)', sp.simplify(2 * (2 / PI)**2 * (1 + sp.Rational(1, 9)) - 80 / (9 * PI**2)) == 0)
# three sign changes per half-period at 0, x, x+y (gaps x, y, z = pi - x - y): Fourier coefficients for odd k
tot = 0
for k in (1, 3):
    E = lambda lo, hi: (sp.exp(-sp.I * k * lo) - sp.exp(-sp.I * k * hi)) / (sp.I * k)       # int_lo^hi e^{-ika} da
    ck = (E(0, x) - E(x, x + y) + E(x + y, PI)) / PI                                        # (1/pi) int_0^pi sigma e^{-ika}
    check('m = 3, k = %d: hat sigma_k = (2/(pi i k))(1 - e^{-ikx} + e^{-ik(x+y)})' % k,
          is_zero(ck - 2 / (PI * sp.I * k) * (1 - sp.exp(-sp.I * k * x) + sp.exp(-sp.I * k * (x + y)))))
    tot += 2 * sp.expand(ck * sp.conjugate(ck))
z = PI - x - y
Phi = 3 - 2 * (sp.cos(x) + sp.cos(y) + sp.cos(z)) + sp.Rational(1, 9) * (3 - 2 * (sp.cos(3 * x) + sp.cos(3 * y) + sp.cos(3 * z)))
check('m = 3: 2|hat sigma_1|^2 + 2|hat sigma_3|^2 = (8/pi^2) Phi(x, y, z)',
      is_zero(sp.expand(sp.simplify((tot - 8 / PI**2 * Phi).rewrite(sp.exp)))))
P1 = sp.sin(x / 2) * sp.sin(y / 2) * sp.sin(z / 2)
P3 = sp.sin(3 * x / 2) * sp.sin(3 * y / 2) * sp.sin(3 * z / 2)
# verify Phi = 10/9 - (8/9)(9 P1 - P3) as a Laurent-polynomial identity in X = e^{ix/2}, Y = e^{iy/2}
X, Y = sp.symbols('X Y', nonzero=True)
Zc = sp.I / (X * Y)                                       # e^{iz/2} with z = pi - x - y
cosk = lambda Q, k: (Q**(2 * k) + Q**(-2 * k)) / 2          # cos(k * angle) with Q = e^{i angle/2}
sinh_ = lambda Q, k: (Q**k - Q**(-k)) / (2 * sp.I)          # sin(k * angle/2)
PhiL = 3 - 2 * (cosk(X, 1) + cosk(Y, 1) + cosk(Zc, 1)) + sp.Rational(1, 9) * (3 - 2 * (cosk(X, 3) + cosk(Y, 3) + cosk(Zc, 3)))
P1L = sinh_(X, 1) * sinh_(Y, 1) * sinh_(Zc, 1)
P3L = sinh_(X, 3) * sinh_(Y, 3) * sinh_(Zc, 3)
check('Phi = 10/9 - (8/9)(9 Pi1 - Pi3), Pi1 = prod sin(x_i/2), Pi3 = prod sin(3x_i/2)  (x+y+z = pi)',
      sp.simplify(sp.expand(PhiL - (sp.Rational(10, 9) - sp.Rational(8, 9) * (9 * P1L - P3L)))) == 0)
check('sin 3s = sin s (1 + 2 cos 2s), hence Pi3 = Pi1 * prod(1 + 2 cos x_i)',
      is_zero(sp.expand_trig(sp.sin(3 * s) - sp.sin(s) * (1 + 2 * sp.cos(2 * s)))))
check('sum cos x_i = 1 + 4 Pi1 for x + y + z = pi',
      sp.simplify(sp.expand(cosk(X, 1) + cosk(Y, 1) + cosk(Zc, 1) - 1 - 4 * P1L)) == 0)
check('AM-GM step: (3 + 2*(3/2))/3 = 2 and 2^3 = 8 < 9', (3 + 2 * Fr(3, 2)) / 3 == 2 and 2**3 == 8 < 9)

# ---------------------------------------------------------------------------------------------------------------
print('== H2: harmonic cubics ==')
n_ = sp.symbols('n', positive=True)
ER = lambda n, k: 2**sp.Rational(k, 2) * sp.gamma(sp.Rational(n + k, 2)) / sp.gamma(sp.Rational(n, 2))
check('E R^6 = n(n+2)(n+4) for R ~ chi_n (n = 1..12)', all(sp.simplify(ER(n, 6) - n * (n + 2) * (n + 4)) == 0 for n in range(1, 13)))
check('pi > 1979/630: int_0^1 x^4(1-x)^4 dx = 1/630 (and 22/7 - pi = int x^4(1-x)^4/(1+x^2) < 1/630)',
      sp.integrate(x**4 * (1 - x)**4, (x, 0, 1)) == sp.Rational(1, 630) and Fr(22, 7) - Fr(1, 630) == Fr(1979, 630))
pi_lo, pi_hi = Fr(1979, 630), Fr(22, 7)
c3sq = sp.Rational(80, 9) / PI**2                           # c_3^2 = (4 sqrt5/(3 pi))^2
for n in range(2, 13):
    kap2 = sp.nsimplify(sp.simplify(ER(n, 3)**2 / ER(n, 6)))
    r = sp.simplify(kap2 / PI) if n % 2 == 0 else sp.simplify(kap2 * PI)      # kappa^2 = r pi (n even), r/pi (n odd)
    assert r.is_Rational, (n, r)
    r = Fr(int(r.p), int(r.q))
    # bound kappa c_3 < sqrt(2/pi)  <=>  kappa^2 < 9 pi/40
    if n % 2 == 0:
        holds, fails = r < Fr(9, 40), r > Fr(9, 40)
    else:
        holds, fails = r < Fr(9, 40) * pi_lo**2, r > Fr(9, 40) * pi_hi**2
    if n <= 11:
        check('n = %2d: kappa_n^2 = %s %s, so kappa_n c_3 < sqrt(2/pi)' % (n, r, '* pi' if n % 2 == 0 else '/ pi'), holds)
    else:
        check('n = %2d: kappa_n^2 = %s * pi > 9 pi/40, so kappa_n c_3 > sqrt(2/pi): the bound stops at n = 11' % (n, r), fails)
e3_5 = sum(sp.Mul(*c) for c in combinations(sp.symbols('z1:6'), 3))
check('a square-free multilinear cubic is harmonic (e.g. Laplacian of e_3(z1..z5) = 0)',
      sp.expand(sum(sp.diff(e3_5, v, 2) for v in sp.symbols('z1:6'))) == 0)
ids = [(sp.cos(a)**3, (3 * sp.cos(a) + sp.cos(3 * a)) / 4), (sp.cos(a)**2 * sp.sin(a), (sp.sin(a) + sp.sin(3 * a)) / 4),
       (sp.cos(a) * sp.sin(a)**2, (sp.cos(a) - sp.cos(3 * a)) / 4), (sp.sin(a)**3, (3 * sp.sin(a) - sp.sin(3 * a)) / 4)]
check('cubic forms in (cos a, sin a): cos^3, cos^2 sin, cos sin^2, sin^3 lie in span{cos a, sin a, cos 3a, sin 3a}',
      all(is_zero(sp.expand_trig(lhs_ - rhs_)) for lhs_, rhs_ in ids))

# ---------------------------------------------------------------------------------------------------------------
print('== H3: the rank-one criterion ==')
lam = sp.Rational(7, 25)
cw = sp.sqrt(sp.Rational(3, 2) / PI)
phi = sp.exp(-x**2 / 2) / sp.sqrt(2 * PI)
w_ = cw * sp.exp(lam * x**2 / 2)
Hn2 = (x**3 - 3 * x)**2 / 6
Sg = sp.sqrt(2 / PI)
half_Ew = sp.simplify(sp.integrate(w_ * phi, (x, -sp.oo, sp.oo)) / 2)
check('(1/2) E w = 5/(4 sqrt(3 pi)) and divided by sqrt(2/pi) it is 5/(4 sqrt 6)',
      sp.simplify(half_Ew - 5 / (4 * sp.sqrt(3 * PI))) == 0 and sp.simplify(half_Ew / Sg - 5 / (4 * sp.sqrt(6))) == 0)
pref = 5 / (4 * sp.sqrt(6))
for name, fn, val in (('c^2: E[1/w]', 1, sp.Rational(1, 2)), ('b^2: E[X^2/w]', x**2, sp.Rational(25, 64)),
                      ('a^2: E[H^2/w]', Hn2, sp.Rational(34925, 131072))):
    term = sp.simplify(sp.integrate(fn / w_ * phi, (x, -sp.oo, sp.oo)) / 2 / Sg)
    check('%s/(2 sqrt(2/pi)) = (5/(4 sqrt 6)) * pi * %s' % (name, val), sp.simplify(term - pref * PI * val) == 0)
A_, B_, C_ = Fr(34925, 131072), Fr(25, 64), Fr(1, 2)
check('C - A = 30611/131072 and C - B = 7/64', C_ - A_ == Fr(30611, 131072) and C_ - B_ == Fr(7, 64))
qq, a2, b2 = sp.symbols('Q a2 b2', positive=True)
check('(5/(4 sqrt6))(1 + pi Q) < 1  <=>  Q < (4 sqrt6 - 5)/(5 pi)  (algebra)',
      sp.simplify(sp.solve(sp.Eq(pref * (1 + PI * qq), 1), qq)[0] - (4 * sp.sqrt(6) - 5) / (5 * PI)) == 0)
r6 = Fr(2449, 1000)
check('sqrt 6 > 2449/1000 (2449^2 = 5997601 < 6 000 000) and sqrt 6 < 24495/10000', r6**2 < 6 and Fr(24495, 10000)**2 > 6)
rhs_rat = Fr(1, 2) - (4 * r6 - 5) / (5 * pi_hi)
check('rational sufficient criterion: 1/2 - (4 sqrt6 - 5)/(5 pi) < 1/2 - (4*2449/1000 - 5)/(5*22/7) = %s' % rhs_rat, rhs_rat == Fr(5357, 27500))

# ---------------------------------------------------------------------------------------------------------------
print('== H4: complete cubics e_3 ==')


def gauss_expect(poly, vars_):
    """E poly(Z) for independent standard Gaussians Z, exact."""
    P = sp.Poly(sp.expand(poly), *vars_)
    tot = 0
    for mon, cf in P.terms():
        m = 1
        for e in mon:
            if e % 2:
                m = 0
                break
            for j in range(1, e, 2):
                m *= j
        tot += cf * m
    return sp.nsimplify(sp.simplify(tot))


for N in range(3, 9):
    Zs = sp.symbols('z1:%d' % (N + 1))
    e3 = sum(sp.Mul(*cmb) for cmb in combinations(Zs, 3))
    p1 = sum(Zs)
    sN = sp.sqrt(N)
    W1 = p1 / sN
    Snorm = sum(v**2 for v in Zs) - W1**2 - (N - 1)          # |Z'|^2 - (N-1), second chaos of Z'
    alpha = sp.Rational(comb(N, 3)) / sN**3
    beta = sp.Rational(N - 2, 2) / sN
    R = sp.expand(e3 - alpha * (W1**3 - 3 * W1) + beta * W1 * Snorm)
    shifted = sp.expand(R.subs({v: v + t for v in Zs}, simultaneous=True))
    invariant = sp.expand(shifted - R) == 0                  # R depends only on Z' = Z - <Z,u>u
    C3 = comb(N, 3)
    aN2 = sp.nsimplify(gauss_expect(e3 * (W1**3 - 3 * W1), Zs)**2 / (6 * C3))
    bN2 = sp.nsimplify(beta**2 * 2 * (N - 1) / C3)
    cN2 = sp.nsimplify(gauss_expect(R**2, Zs) / C3)
    Lterm = gauss_expect(e3 * (W1**2 - 1) * (Zs[0] - Zs[1]), Zs)
    check('N = %d: e3 = C(N,3) N^{-3/2} He3(W1) - ((N-2)/(2 sqrt N)) W1 (|Z\'|^2 - (N-1)) + R3(Z\'), R3 shift-invariant: %s; '
          'a^2 = %s, b^2 = %s, c^2 = %s (formulas (N-1)(N-2)/N^2, 3(N-2)/N^2, 4/N^2: %s); h2(W1)L term = %s'
          % (N, invariant, aN2, bN2, cN2,
             aN2 == sp.Rational((N - 1) * (N - 2), N**2) and bN2 == sp.Rational(3 * (N - 2), N**2) and cN2 == sp.Rational(4, N**2), Lterm),
          invariant and aN2 == sp.Rational((N - 1) * (N - 2), N**2) and bN2 == sp.Rational(3 * (N - 2), N**2)
          and cN2 == sp.Rational(4, N**2) and Lterm == 0 and sp.simplify(aN2 + bN2 + cN2 - 1) == 0)
Ap, Bp = Fr(30611, 131072), Fr(7, 64)


def lhs(N):
    return Ap * Fr((N - 1) * (N - 2), N * N) + Bp * Fr(3 * (N - 2), N * N)


check('criterion LHS(N) = A\'(1 - 3t + 2t^2) + B\'(3t - 6t^2), t = 1/N: coefficients 3(B\'-A\') < 0 and 2A\' - 6B\' < 0, so LHS increases with N',
      3 * (Bp - Ap) < 0 and 2 * Ap - 6 * Bp < 0)
check('N = 11: LHS = %s > 5357/27500 (rational sufficient criterion)' % lhs(11), lhs(11) > Fr(5357, 27500))
check('N = 10: LHS = %s < 1/2 - (4 sqrt6 - 5)/(5 pi) (the right side is > 1/2 - (4*2.4495 - 5)/(5*1979/630) = 0.194518, since sqrt6 < 2.4495 and pi > 1979/630): the criterion fails at N = 10'
      % lhs(10), lhs(10) < Fr(1, 2) - (4 * Fr(24495, 10000) - 5) / (5 * pi_lo))
print('      (H3) bound for e3 along u: N = 11: %.5f, N = 12: %.5f, N -> oo: %.5f  (times sqrt(2/pi); float display only)'
      % tuple(float(5 / (4 * 6**0.5) * (1 + 3.141592653589793 * (A_ * aa + B_ * bb + C_ * cc))) for aa, bb, cc in
              [(Fr(90, 121), Fr(27, 121), Fr(4, 121)), (Fr(110, 144), Fr(30, 144), Fr(4, 144)), (Fr(1), Fr(0), Fr(0))]))

# ---------------------------------------------------------------------------------------------------------------
print('== Comparison with the ledger: kappa_4 of P_N (exact) ==')
from itertools import product as iproduct
ck = {}
for k in range(3, 7):
    subs = list(combinations(range(k), 3))
    tot_k = 0
    for tup in iproduct(subs, repeat=4):
        mult = [0] * k
        for A3 in tup:
            for i in A3:
                mult[i] += 1
        if all(m_ in (2, 4) for m_ in mult):
            tot_k += 3 ** sum(1 for m_ in mult if m_ == 4)
    ck[k] = tot_k
E4 = lambda N: sum(comb(N, k) * ck[k] for k in ck)
print('      E e3^4 = 27 C(N,3) + 324 C(N,4) + 1350 C(N,5) + 1860 C(N,6): counts', ck)
direct = []
for N in range(3, 7):
    Zs = sp.symbols('z1:%d' % (N + 1))
    e3 = sum(sp.Mul(*cmb) for cmb in combinations(Zs, 3))
    direct.append(gauss_expect(e3**4, Zs) == E4(N))
check('the count formula agrees with exact Gaussian moments of e3^4 for N = 3..6', all(direct) and ck == {3: 27, 4: 324, 5: 1350, 6: 1860})
Nn = sp.symbols('N')
binom = lambda k: sp.Mul(*[(Nn - j) for j in range(k)]) / sp.factorial(k)
fpoly = sp.expand(27 * binom(3) + 324 * binom(4) + 1350 * binom(5) + 1860 * binom(6) - 77 * binom(3)**2)   # E e3^4 - 77 C(N,3)^2
shifted = sp.Poly(sp.expand(fpoly.subs(Nn, Nn + 26)), Nn)
check('kappa_4(P_N) >= 74 for every N >= 26: E e3^4 - 77 C(N,3)^2 at N = 26 + s has only nonnegative coefficients in s',
      all(c_ >= 0 for c_ in shifted.all_coeffs()))
check('kappa_4(P_25) < 74 and kappa_4(P_26) >= 74 (exact: %s, %s)' % (Fr(E4(25), comb(25, 3)**2) - 3, Fr(E4(26), comb(26, 3)**2) - 3),
      Fr(E4(25), comb(25, 3)**2) - 3 < 74 <= Fr(E4(26), comb(26, 3)**2) - 3)

print()
print('ALL CHECKS PASSED' if OK else 'SOME CHECK FAILED')
sys.exit(0 if OK else 1)
