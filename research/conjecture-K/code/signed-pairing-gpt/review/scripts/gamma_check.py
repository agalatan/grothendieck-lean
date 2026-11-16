#!/usr/bin/env python3
# Reviewer's check of PROOFS.md sections 4-5 (equal-eigenvalue family).  Own code, mpmath only.
#  (1) interval re-check (mpmath.iv, 200 bits, independent of Arb) of the 23 finite inequalities H(m) < cap,
#      with A_m from the closed forms of Theorem 8 and, separately, from the Gamma-function formula of Lemma 6;
#  (2) the rational tails I(m) <= cap for m >= M, in exact fractions, and that M is the first such m;
#  (3) N: the exact reflection asymmetry J_m by quadrature, against 2(1 - A_m) (Lemma 6), 2/(m-2) (Lemma 7), 2/(3m);
#      the resulting constants (17 m J_m + 40)/(6(m+3)), H(m), I(m), 77/(9(m+3)); first m below each target.
import sys
from fractions import Fraction as F
from math import factorial
import mpmath as mp
from mpmath import iv

iv.prec = 200
mp.mp.prec = 200

def aff_iv(m):
    e = iv.exp(iv.mpf(-m)); mm = iv.mpf(m) ** m
    if m % 2 == 0:
        k = m // 2
        return iv.mpf(m) * iv.pi * e * mm / (iv.mpf(2) ** m * iv.mpf(factorial(k)) ** 2)
    k = (m - 1) // 2
    return e * mm * iv.mpf(4) ** (k + 1) * iv.mpf(factorial(k)) * iv.mpf(factorial(k + 1)) / (iv.mpf(factorial(2 * k)) * iv.mpf(factorial(2 * k + 2)))

def aff_mp(m):   # Lemma 6, Gamma-function form
    m = mp.mpf(m)
    return mp.exp(-m) * m ** m * mp.sqrt(mp.pi) * mp.gamma((m + 1) / 2) / (mp.gamma(m) * mp.gamma((m + 2) / 2))

def aff_quad(m):  # direct: integral of sqrt(f(x) f(-x)) for the standardised Gamma(m) density
    m_ = mp.mpf(m); s = mp.sqrt(m_)
    lf = lambda x: mp.log(s) + (m_ - 1) * mp.log(m_ + s * x) - (m_ + s * x) - mp.loggamma(m_)
    return mp.quad(lambda x: mp.exp((lf(x) + lf(-x)) / 2), mp.linspace(-s, s, 9))

print('(1) interval re-check of the 23 finite cases (mpmath.iv, %d bits)' % iv.prec)
jobs = [('7/20', F(7, 20), range(22, 34)), ('3/5', F(3, 5), range(12, 19)), ('13/10', F(13, 10), range(4, 8))]
n = 0
for name, cap, ms in jobs:
    worst = None
    for m in ms:
        a = aff_iv(m)
        th = (34 * m * (1 - a) + 40) / (6 * (m + 3))
        capi = iv.mpf(cap.numerator) / cap.denominator
        ok = (a.a > 0) and (a.b < 1) and (th.b < capi.a)
        assert ok, ('FAIL', m, th, cap)
        am = aff_mp(m)
        assert a.a <= am <= a.b, ('closed form and Gamma form of A_m disagree', m)
        n += 1
        if worst is None or th.b > worst[1]: worst = (m, th.b)
    print('   target %-5s m = %d..%d : all below; largest upper end %.9f at m = %d' % (name, ms[0], ms[-1], float(worst[1]), worst[0]))
print('   %d interval checks pass; closed forms agree with the Gamma-function formula' % n)
mp.mp.prec = 80
for m in (1, 2, 3, 5, 8):
    d = abs(aff_quad(m) - aff_mp(m))
    assert d < mp.mpf(10) ** (-12), (m, d)
print('   A_m = int sqrt(f_m(x) f_m(-x)) dx by direct quadrature agrees with the formula at m = 1, 2, 3, 5, 8 (1e-12)')
mp.mp.prec = 200

print('(2) rational tails I(m) = (37m - 40)/(3(m-2)(m+3))')
I = lambda m: F(37 * m - 40, 3 * (m - 2) * (m + 3))
for M, cap in ((34, F(7, 20)), (19, F(3, 5)), (8, F(13, 10))):
    a, b = cap.numerator, cap.denominator
    c2, c1, c0 = 3 * a, 3 * a - 37 * b, 40 * b - 18 * a
    sh = (c2 * M * M + c1 * M + c0, 2 * c2 * M + c1, c2)
    assert all(x >= 0 for x in sh)
    assert I(M) <= cap < I(M - 1)
    # the polynomial is the cleared inequality: b*3(m-2)(m+3)*(cap - I(m)) for m > 2
    for m in range(M, M + 50):
        assert b * 3 * (m - 2) * (m + 3) * (cap - I(m)) == c2 * m * m + c1 * m + c0
    print('   I(m) <= %s for all m >= %d (shifted coefficients %s >= 0); I(%d) = %.6f > cap, so %d is the first' % (cap, M, sh, M - 1, float(I(M - 1)), M))

print('(3) N: exact J_m against the bounds used (mp.quad, 30 digits)')
mp.mp.dps = 30
def J(m):
    m_ = mp.mpf(m); s = mp.sqrt(m_)
    def f(x):
        r = m_ + s * x
        if r <= 0: return mp.mpf(0)
        return mp.exp(mp.log(s) + (m_ - 1) * mp.log(r) - r - mp.loggamma(m_))
    def g(b):
        p, q = f(b), f(-b)
        return (p - q) ** 2 / (p + q) if p + q > 0 else mp.mpf(0)
    pts = [0, s / 4, s / 2, 3 * s / 4, s, s + 1, s + 3, s + 8, s + 20, s + 60, s + 200]
    return mp.quad(g, pts)
print('   %3s %12s %12s %12s %12s | %10s %10s %10s %10s' % ('m', 'J_m', '2(1-A_m)', '2/(m-2)', '2/(3m)', 'with J_m', 'H(m)', 'I(m)', '77/(9(m+3))'))
rows = {}
for m in list(range(1, 41)) + [50, 100, 200]:
    j = J(m); a = aff_mp(m); hell = 2 * (1 - a)
    thJ = (17 * m * j + 40) / (6 * (m + 3)); H = (34 * m * (1 - a) + 40) / (6 * (m + 3))
    Im = float(I(m)) if m > 2 else float('inf'); cod = 77 / (9 * (m + 3))
    rows[m] = (float(j), float(hell), float(thJ), float(H), Im, cod)
    assert j <= hell * (1 + mp.mpf(10) ** -20), ('Lemma 6 violated', m)
    if m > 2: assert hell <= mp.mpf(2) / (m - 2), ('Lemma 7 violated', m)
    if m in (1, 2, 3, 4, 5, 6, 7, 8, 11, 12, 18, 19, 21, 22, 33, 34, 40, 50, 100, 200):
        print('   %3d %12.8f %12.8f %12s %12.8f | %10.6f %10.6f %10s %10.6f' % (m, j, hell, ('%.8f' % (2 / (m - 2))) if m > 2 else 'inf', 2 / (3 * m), thJ, H, ('%.6f' % Im) if m > 2 else 'inf', cod))
print('   m(1 - A_m): ' + ', '.join('%d: %.6f' % (m, rows[m][1] * m / 2) for m in (1, 2, 4, 12, 22, 40, 100, 200)) + '   (1/3 = 0.333333)')
print('   H(m) <= 77/(9(m+3)) for every m tested: %s;   H(m) decreasing on m = 1..40: %s' % (
    all(rows[m][3] <= rows[m][5] for m in rows), all(rows[m + 1][3] < rows[m][3] for m in range(1, 40))))
for name, cap in (('7/20', 0.35), ('0.37', 0.37), ('3/5', 0.6), ('0.64', 0.64), ('13/10', 1.3), ('1.33', 1.33)):
    first = lambda col: min(m for m in range(1, 41) if all(rows[k][col] <= cap for k in range(m, 41)))
    print('   target %-5s : first m with (15) and the exact J_m: %2d;  with H(m) (Lemma 6): %2d;  with 77/(9(m+3)): %2d' % (name, first(2), first(3), first(5)))

print('(4) interval checks beyond the package (mpmath.iv): the thresholds the application actually needs, and 1 - A_m <= 1/(3m)')
iv.prec = 200
for m, cap in ((21, F(37, 100)), (11, F(16, 25)), (20, F(37, 100)), (10, F(16, 25)), (3, F(133, 100))):
    a = aff_iv(m); th = (34 * m * (1 - a) + 40) / (6 * (m + 3)); capi = iv.mpf(cap.numerator) / cap.denominator
    verdict = 'below' if th.b < capi.a else ('above' if th.a > capi.b else 'undecided')
    print('   H(%d) in [%.9f, %.9f] is %s %s = %.2f' % (m, float(th.a), float(th.b), verdict, cap, float(cap)))
ok = True
for m in range(1, 401):
    a = aff_iv(m); x = m * (1 - a)
    third = iv.mpf(1) / 3
    ok = ok and bool(mp.mpf(x.b) < mp.mpf(third.a))        # upper end of m(1 - A_m) below the lower end of 1/3
print('   m (1 - A_m) < 1/3 for every m = 1..400 (interval): %s   [so H(m) < 77/(9(m+3)) there]' % ok)
