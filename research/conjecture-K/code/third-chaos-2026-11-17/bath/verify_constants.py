#!/usr/bin/env python3
"""Exact checks of every number used in the hand-proved (P) steps of PROOF_BATH.md.

claude-b9ee, 17 Nov 2026.  Rational arithmetic (fractions.Fraction) and exact symbolic algebra (sympy) only:
no floating point enters any check.  Each line of the log names the step of PROOF_BATH.md it certifies.
usage: python3 -I verify_constants.py > verify_constants.log      (needs sympy; a few seconds)
Exit status 0 iff every check passes.
"""
from fractions import Fraction as Fr
import sys
import sympy as sp

OK = True


def check(label, cond):
    global OK
    print(('PASS  ' if cond else 'FAIL  ') + label)
    OK = OK and bool(cond)


x, u, w, t, y = sp.symbols('x u w t y', real=True)
H2 = (x**3 - 3*x)**2 / 6                     # H(x)^2, H = He_3/sqrt(6)


def gmom(k):                                 # E X^k for X ~ N(0,1)
    if k % 2:
        return 0
    r = 1
    for j in range(1, k, 2):
        r *= j
    return r


def gexp(poly):                              # E poly(X), exact
    P = sp.Poly(sp.expand(poly), x)
    return sum(c * gmom(m[0]) for m, c in zip(P.monoms(), P.coeffs()))


def gamma_int(poly):                         # int_0^oo poly(w) e^{-w} dw, exact
    P = sp.Poly(sp.expand(poly), w)
    return sum(c * sp.factorial(m[0]) for m, c in zip(P.monoms(), P.coeffs()))


print('== Section 1: reduction ==')
check('E He3(X)^2 = 6, so E F^2 = 6a^2 + b^2 + c^2', gexp((x**3 - 3*x)**2) == 6)
check('E H^2 = 1, E H^4 = 93 (used only in remarks)', gexp(H2) == 1 and gexp(H2**2) == 93)

print('== Section 2 (Lemma 2.1 and further constants) ==')
check('pi > 25/8: (1-x^2)(1+x^2/2)^2 = 1 - 3x^4/4 - x^6/4',
      sp.expand((1 - x**2) * (1 + x**2 / 2)**2 - (1 - sp.Rational(3, 4) * x**4 - sp.Rational(1, 4) * x**6)) == 0)
check('pi > 25/8: 6*int_0^{1/2} (1 + x^2/2) dx = 25/8',
      6 * sp.integrate(1 + x**2 / 2, (x, 0, sp.Rational(1, 2))) == sp.Rational(25, 8))
check('pi < 22/7: int_0^1 x^4(1-x)^4/(1+x^2) dx = 22/7 - pi',
      sp.simplify(sp.integrate(x**4 * (1 - x)**4 / (1 + x**2), (x, 0, 1)) - (sp.Rational(22, 7) - sp.pi)) == 0)
fact = [1, 1, 2, 6, 24, 120, 720]
e_lo = sum(Fr(1, fact[k]) for k in range(6))
check('e > 163/60 = sum_{k<=5} 1/k!', e_lo == Fr(163, 60))
check('tail sum_{k>=6} 1/k! <= (1/720) sum_j 6^-j = 1/600', Fr(1, 720) * Fr(6, 5) == Fr(1, 600))
e_hi = e_lo + Fr(1, 600)
check('e < 1631/600 < 68/25', e_hi == Fr(1631, 600) and e_hi < Fr(68, 25))
check('68/25 < 25/9, so e^(1/2) < 5/3, e^(-1/2) > 3/5', Fr(68, 25) < Fr(25, 9))
check('(68/25)^3 = 314432/15625 < 81/4, so e^(3/2) < 9/2, e^(-3/2) > 2/9', Fr(68, 25)**3 == Fr(314432, 15625) and Fr(68, 25)**3 < Fr(81, 4))
check('e^(9/2) < (9/2)^3 = 729/8 < 92', Fr(9, 2)**3 == Fr(729, 8) and Fr(729, 8) < 92)
check('e^3 < (68/25)^3 < 21', Fr(68, 25)**3 < 21)
check('e^4 = e^3 * e < 21 * 3 = 63', Fr(68, 25)**3 * Fr(68, 25) < 63)
check('e^(7/2) < (25/9)^(7/2) = (5/3)^7 = 78125/2187 < 36', Fr(5, 3)**7 == Fr(78125, 2187) and Fr(5, 3)**7 < 36)
check('e^(49/8) < e^(13/2) = e^(7/2) e^3 < 36*21 = 756', Fr(49, 8) < Fr(13, 2) and 36 * 21 == 756)
check('sqrt(15) > 19/5 (361 < 375)', Fr(19, 5)**2 < 15)
check('sqrt(pi) < 9/5 (22/7 < 81/25)', Fr(22, 7) < Fr(81, 25))
check('sqrt(10/7) < 6/5 (10/7 < 36/25)', Fr(10, 7) < Fr(36, 25))
E9 = Fr(9003, 100)
check('e^(9/2) < 90.03 (from e < 1631/600: (1631/600)^9 < 90.03^2)', Fr(1631, 600)**9 < E9**2)

print('== Section 3: pointwise bounds on Psi ==')
f = sp.exp(-y**2 / 2) + y * sp.Integral(sp.exp(-t**2 / 2), (t, 0, y))
check("f'(y) = int_0^y e^{-t^2/2} dt and f''(y) = e^{-y^2/2}",
      sp.simplify(sp.diff(f, y).doit() - sp.Integral(sp.exp(-t**2 / 2), (t, 0, y))) == 0
      and sp.simplify(sp.diff(f, y, 2).doit() - sp.exp(-y**2 / 2)) == 0)
check('(M4): int_0^Y (Y - t) t^2 dt = Y^4/12', sp.simplify(sp.integrate((y - t) * t**2, (t, 0, y)) - y**4 / 12) == 0)
vv, mm = sp.symbols('v mu', positive=True)
check('(M4): sqrt(v) * (mu/sqrt v)^4 / (12 (2 + mu^2/v)) = mu^4 / (12 sqrt(v) (2v + mu^2))',
      sp.simplify(sp.sqrt(vv) * (mm / sp.sqrt(vv))**4 / (12 * (2 + mm**2 / vv)) - mm**4 / (12 * sp.sqrt(vv) * (2 * vv + mm**2))) == 0)
r = 2 / (sp.sqrt(y**2 + 4) + y)
check('(M1) Komatsu: r^2 + y r = 1 and r = (sqrt(y^2+4) - y)/2',
      sp.simplify(r**2 + y * r - 1) == 0 and sp.simplify(r - (sp.sqrt(y**2 + 4) - y) / 2) == 0)
check("(M1) Komatsu: r'(y) = -r/sqrt(y^2+4)", sp.simplify(sp.diff(r, y) + r / sp.sqrt(y**2 + 4)) == 0)
check('(M1) (y^2+2)^2 - y^2(y^2+4) = 4', sp.expand((y**2 + 2)**2 - y**2 * (y**2 + 4)) == 4)

print('== Section 5: outer region 3p + 5q >= 1 (weight sqrt(3/(2pi)) e^{(7/50) x^2}) ==')
s_plus = Fr(32, 25)
c10 = Fr(1, 12) * (15 / s_plus**3 - 18 / s_plus**2 + 9 / s_plus)
check('L(1,0) = (1 + c pi) 5/(4 sqrt(3 pi)) with c = (1/12)(15/s^3 - 18/s^2 + 9/s) = 34925/131072', c10 == Fr(34925, 131072))
check('L(0,1)/L(0,0) = (1 + 1/s)/2 = 57/64', (1 + 1 / s_plus) / 2 == Fr(57, 64))
check('L(0,0)/S = 5/sqrt(24) < 49/48  (25*48^2 = 57600 < 57624 = 24*49^2)', 25 * 48**2 == 57600 and 24 * 49**2 == 57624 and Fr(25, 24) < Fr(49, 48)**2)
check('L(0,1)/S = (57/64)(5/sqrt 24) < 44/48  ((57/64)^2 (25/24) = 27075/32768 < 121/144)',
      Fr(57, 64)**2 * Fr(25, 24) == Fr(27075, 32768) and Fr(27075, 32768) < Fr(44, 48)**2)
k10 = Fr(1, 2) * (1 + c10 * Fr(22, 7)) * 5
check('L(1,0)/S < (1/2)(1 + (34925/131072)(22/7)) 5/sqrt 24 = 4214635/(917504 sqrt 24)', k10 == Fr(4214635, 917504))
check('  and (4214635/917504)^2 / 24 < (46/48)^2', k10**2 / 24 < Fr(46, 48)**2)
pp, qq = sp.symbols('p q')
check('(49/48)(1-p-q) + (46/48)p + (44/48)q = (49 - 3p - 5q)/48',
      sp.expand(sp.Rational(49, 48) * (1 - pp - qq) + sp.Rational(46, 48) * pp + sp.Rational(44, 48) * qq - (49 - 3 * pp - 5 * qq) / 48) == 0)

print('== Section 6: the corner, common bounds ==')
check('on K: q < (1-3p)/5 and m = 1-p give q/m <= 1/5 < 3/10 (since (1-3p)/(5(1-p)) <= 1/5)',
      sp.simplify((1 - 3 * pp) / (5 * (1 - pp)) - sp.Rational(1, 5) + 2 * pp / (5 * (1 - pp))) == 0)
P3 = 1 + u / 2 - u**2 / 8 + u**3 / 16
check('(6.1) (1 + u/2 - u^2/8 + u^3/16)^2 - (1+u) = u^4 (16 + (2-u)^2)/256', sp.expand(P3**2 - (1 + u) - u**4 * (16 + (2 - u)**2) / 256) == 0)
check("(6.1) P(-1) = 5/16 > 0 and P'(u) = 1/2 - u/4 + 3u^2/16 has discriminant 1/16 - 3/8 < 0",
      P3.subs(u, -1) == sp.Rational(5, 16) and sp.expand(sp.diff(P3, u) - (sp.Rational(1, 2) - u / 4 + 3 * u**2 / 16)) == 0
      and Fr(1, 16) - 4 * Fr(3, 16) * Fr(1, 2) < 0)
check('(6.1) E(X^2-1) = 0, E(X^2-1)^2 = 2, E(X^2-1)^3 = 8', [gexp((x**2 - 1)**k) for k in (1, 2, 3)] == [0, 2, 8])
check('(6.1) sqrt(m) E sqrt(1+u) <= sqrt(m)(1 - (q/m)^2/4 + (q/m)^3/2) and 1/4 - (3/10)/2 = 1/10', Fr(1, 4) - Fr(3, 20) == Fr(1, 10))
check('(6.2) on [-3/10, 0]: chord of (1+u)^(-1/2) has slope (sqrt(10/7)-1)/(3/10) < (6/5-1)/(3/10) = 2/3', (Fr(6, 5) - 1) / Fr(3, 10) == Fr(2, 3))
check('(6.2) (1+u)(1-u/7)^2 - 1 = (u/49)(35 - 13u + u^2)', sp.expand((1 + u) * (1 - u / 7)**2 - 1 - u * (35 - 13 * u + u**2) / 49) == 0)
check('(6.2) 35 - 13u + u^2 is decreasing on [0, 13/2] and equals 7/4 > 0 at u = 7/2',
      (35 - 13 * u + u**2).subs(u, sp.Rational(7, 2)) == sp.Rational(7, 4))
check('(6.2) on |x| <= 7/2: u <= (3/10)(49/4 - 1) = 27/8 < 7/2', Fr(3, 10) * (Fr(49, 4) - 1) == Fr(27, 8) and Fr(27, 8) < Fr(7, 2))
check('(6.2) int_0^1 (1/6) x^2 (1-x^2)(3-x^2)^2 dx = 4/27, so E[H^2(1-X^2); |X|<=1] <= 8/(27 sqrt(2 pi))',
      sp.integrate(x**2 * (1 - x**2) * (3 - x**2)**2 / 6, (x, 0, 1)) == sp.Rational(4, 27))
g1 = sp.expand((x**2 - 1) * H2)
v52, v114, v3 = g1.subs(x, sp.Rational(5, 2)), g1.subs(x, sp.Rational(11, 4)), g1.subs(x, 3)
check('(6.2) (x^2-1)H^2 at 5/2 = 29575/512 > 57, at 11/4 = 22568315/131072 > 172, at 3 = 432',
      v52 == sp.Rational(29575, 512) and v52 > 57 and v114 == sp.Rational(22568315, 131072) and v114 > 172 and v3 == 432)
dg1 = sp.Poly(sp.expand(sp.diff(g1, x).subs(x, sp.sqrt(3) + t)), t)
check('(6.2) (x^2-1)H(x)^2 is nondecreasing on [sqrt 3, oo): d/dx at x = sqrt3 + t has coefficients >= 0 in t',
      all(bool(sp.simplify(c) >= 0) for c in dg1.all_coeffs()))
check('(6.2) 121/32 < 4 (so e^{-x^2/2} >= e^{-4} > 1/63 on [5/2, 11/4])', Fr(121, 32) < 4)
pieces = Fr(1, 2) * Fr(57, 63) + Fr(1, 2) * Fr(172, 100) + Fr(432, 756)
check('(6.2) pieces 19/42 + 43/50 + 4/7 = 989/525', pieces == Fr(19, 42) + Fr(43, 50) + Fr(4, 7) == Fr(989, 525))
check('(6.2) (1/7)(989/525) = 989/3675 > 16/81 = (2/3)(8/27)', pieces / 7 == Fr(989, 3675) and Fr(989, 3675) > Fr(2, 3) * Fr(8, 27) == Fr(16, 81))
check('(6.3) sqrt(1-p) + p/(2 sqrt(1-p)) - 1 = p^2/(2 sqrt(1-p)(2 - p + 2 sqrt(1-p)))',
      sp.simplify(sp.sqrt(1 - pp) + pp / (2 * sp.sqrt(1 - pp)) - 1 - pp**2 / (2 * sp.sqrt(1 - pp) * (2 - pp + 2 * sp.sqrt(1 - pp)))) == 0)

print('== Section 7: Case A, 0 < p <= 1/9 ==')
check('alpha(p) < 1/7: sqrt(8/9) > 16/17 (8*289 > 9*256) and (32/17)(17/9 + 32/17) = 18464/2601 > 7',
      Fr(16, 17)**2 < Fr(8, 9) and Fr(32, 17) * (Fr(17, 9) + Fr(32, 17)) == Fr(18464, 2601) and Fr(18464, 2601) > 7)
check('(i) (6/5)^2/10 = 36/250 > 1/7', Fr(36, 250) > Fr(1, 7))
check('(ii) q < 6p/5 <= 6/45 = 2/15', Fr(6, 5) * Fr(1, 9) == Fr(2, 15))
H2w = sp.expand(H2.subs(x, sp.sqrt(2 * w + 3)))
check('(ii) with x^2 = 2w + 3: H^2 = (2/3) w^2 (2w+3), H^4 = (4/9) w^4 (2w+3)^2',
      sp.expand(H2w - sp.Rational(2, 3) * w**2 * (2 * w + 3)) == 0 and sp.expand(H2w**2 - sp.Rational(4, 9) * w**4 * (2 * w + 3)**2) == 0)
check('(ii) v = 1 - p + q(2w+2) <= 1 + (2/15)(2w+2) = (4w+19)/15', sp.expand(1 + sp.Rational(2, 15) * (2 * w + 2) - (4 * w + 19) / 15) == 0)
check('(ii) ((4w+19)/15)(2w+3) = (4w+19)(4w+6)/30 and AM-GM ((4w+19)+(4w+6))/2 = 4w + 25/2',
      sp.expand((4 * w + 19) * (2 * w + 3) / 15 - (4 * w + 19) * (4 * w + 6) / 30) == 0 and sp.expand(((4 * w + 19) + (4 * w + 6)) / 2 - (4 * w + sp.Rational(25, 2))) == 0)
G = (8 * w + 38) / 15 + sp.Rational(2, 27) * w**2 * (2 * w + 3)
num = gamma_int(w**3 * (2 * w + 3))
den = gamma_int(w**2 * (4 * w + sp.Rational(25, 2)) * G)
check('(ii) int_0^oo w^3 (2w+3) e^{-w} dw = 66', num == 66)
check('(ii) D = int_0^oo w^2 (4w + 25/2) G(w) e^{-w} dw = 9338/9', den == sp.Rational(9338, 9))
ratio = Fr(int(num)**2) / Fr(9338, 9)
check('(ii) 66^2 / (9338/9) = 39204/9338', ratio == Fr(39204, 9338))
pref = Fr(8) * Fr(19, 5) * Fr(2, 9) * Fr(5, 9) / 9
check('(ii) 8 sqrt(15) e^{-3/2} / (9 sqrt(pi)) > 8 (19/5)(2/9)(5/9)/9 = 304/729', pref == Fr(304, 729))
check('(ii) (304/729)(39204/9338) = 73568/42021 > 12/7', pref * ratio == Fr(73568, 42021) and Fr(73568, 42021) > Fr(12, 7))

print('== Section 9: Case C, 1/5 < p < 1/3 (corrected arithmetic) ==')
check('q < (1 - 3/5)/5 = 2/25 and 1 - p < 4/5', (1 - Fr(3, 5)) / 5 == Fr(2, 25))
check('v < 4/5 + (2/25)(x^2-1) = (18 + 2x^2)/25 <= 4x^2/25 iff x^2 >= 9',
      sp.expand(sp.Rational(4, 5) + sp.Rational(2, 25) * (x**2 - 1) - (18 + 2 * x**2) / 25) == 0 and sp.expand(4 * x**2 / 25 - (18 + 2 * x**2) / 25 - 2 * (x**2 - 9) / 25) == 0)
check('int_{9/2}^oo (2s-3)^2 e^{-s} ds = 68 e^{-9/2}', sp.simplify(sp.integrate((2 * t - 3)**2 * sp.exp(-t), (t, sp.Rational(9, 2), sp.oo)) - 68 * sp.exp(-sp.Rational(9, 2))) == 0)
check('E[H^2/|X|; |X|>=3] = (2/(6 sqrt(2 pi))) * 68 e^{-9/2}, and (5/4)*(68/3) = 85/3',
      sp.simplify(2 * sp.integrate(H2 / x * sp.exp(-x**2 / 2), (x, 3, sp.oo)) - 68 * sp.exp(-sp.Rational(9, 2)) / 3) == 0 and Fr(5, 4) * Fr(68, 3) == Fr(85, 3))
check('int_3^oo (x^3 - 3x) e^{-x^2/2} dx = 8 e^{-9/2}', sp.simplify(sp.integrate((x**3 - 3 * x) * sp.exp(-x**2 / 2), (x, 3, sp.oo)) - 8 * sp.exp(-sp.Rational(9, 2))) == 0)
check('sqrt(pi/2) * 2 * 8 e^{-9/2} / (sqrt 6 sqrt(2 pi)) = (4 sqrt 6/3) e^{-9/2}',
      sp.simplify(sp.sqrt(sp.pi / 2) * 2 * 8 / (sp.sqrt(6) * sp.sqrt(2 * sp.pi)) - 4 * sp.sqrt(6) / 3) == 0)
check('monotonicity: 2A/(3B) = 85/(12 sqrt(3 pi)) > sqrt 5 iff 7225 > 2160 pi; true as 2160*22/7 < 7225',
      sp.simplify(2 * (85 / (3 * sp.sqrt(2 * sp.pi))) / (3 * (4 * sp.sqrt(6) / 3)) - 85 / (12 * sp.sqrt(3 * sp.pi))) == 0 and Fr(2160) * Fr(22, 7) < 7225)
check('g(sqrt 3) = e^{-9/2} (3A - 3 sqrt3 B) = e^{-9/2} (85/sqrt(2 pi) - 12 sqrt 2)',
      sp.simplify(3 * 85 / (3 * sp.sqrt(2 * sp.pi)) - 3 * sp.sqrt(3) * 4 * sp.sqrt(6) / 3 - (85 / sp.sqrt(2 * sp.pi) - 12 * sp.sqrt(2))) == 0)
check('alpha(1/3) = 3/(8 + 10 sqrt(2/3))', sp.simplify(1 / (2 * sp.sqrt(sp.Rational(2, 3)) * (sp.Rational(5, 3) + 2 * sp.sqrt(sp.Rational(2, 3)))) - 3 / (8 + 10 * sp.sqrt(sp.Rational(2, 3)))) == 0)
r1, r2, r3 = Fr(398862, 10**6), Fr(1414214, 10**6), Fr(816496, 10**6)
check('rational enclosures: r1 = 0.398862 <= sqrt(7/44), r2 = 1.414214 >= sqrt 2, r3 = 0.816496 <= sqrt(2/3)',
      r1**2 <= Fr(7, 44) and r2**2 >= 2 and r3**2 <= Fr(2, 3))
lhs = (85 * r1 - 12 * r2) / E9           # 85/sqrt(2 pi) >= 85 sqrt(7/44) >= 85 r1 since pi < 22/7; e^{9/2} < E9
rhs = Fr(3) / (8 + 10 * r3)              # >= alpha(1/3)
check('e^{-9/2}(85/sqrt(2 pi) - 12 sqrt 2) > (85 r1 - 12 r2)/90.03 = %.6f > 3/(8 + 10 r3) = %.6f >= alpha(1/3)' % (lhs, rhs), lhs > rhs)
lhs_g = (85 * r1 - 12 * r2) * Fr(8, 729)
print('      (with only Lemma 2.1, e^{9/2} < 729/8, the same bound is %.6f: still > %.6f, margin %.2e)' % (lhs_g, rhs, lhs_g - rhs))
check('  same inequality with e^{9/2} < 729/8 only', lhs_g > rhs)
gem = (Fr(100, 3) - 17) / 92
print('      (Gemini line 2921 claims 3(1/92)(100/3 - 17) = 49/92; the correct value of its own bound is (1/92)(100/3 - 17) = %s = %.5f < alpha(1/3))' % (gem, gem))
check('  the uncorrected Gemini constant 49/276 is indeed below alpha(1/3) > 0.18558', gem < Fr(18558, 100000))

print('== Section 11 (what was wrong): the Gemini Case-B arithmetic (line 2917) ==')
D_B = gamma_int(w**2 * (12 * w + 35) * (sp.Rational(8, 45) * (3 * w + 13) + sp.Rational(2, 15) * w**2 * (2 * w + 3)))
check('Case B denominator: int w^2 (12w+35)((8/45)(3w+13) + (2/15) w^2 (2w+3)) e^{-w} dw = 44368/9', D_B == sp.Rational(44368, 9))
valB = Fr(24) * Fr(19, 5) * Fr(2, 9) * Fr(5, 9) / 9 * Fr(66**2) / Fr(44368, 9)
print('      correct value of the Case-B Cauchy-Schwarz bound with Lemma 2.1 constants: %s = %.5f; Gemini states 18392/8319 = %.5f (factor %.4f)'
      % (valB, valB, Fr(18392, 8319), Fr(18392, 8319) / valB))
check('  Gemini Case B value is exactly twice the correct one', Fr(18392, 8319) == 2 * valB)
r45 = Fr(8945, 10000)                       # r45^2 >= 4/5, so alpha(1/5) = 1/(2 sqrt(4/5)(9/5 + 2 sqrt(4/5))) > 1/(2 r45 (9/5 + 2 r45))
check('  12 alpha(1/5) > 12/(2 r (9/5 + 2r)) > 1.8684 with r = 0.8945 >= sqrt(4/5)', r45**2 >= Fr(4, 5) and 12 / (2 * r45 * (Fr(9, 5) + 2 * r45)) > Fr(18684, 10000))
check('  the correct Case-B value 9196/8319 is below 1.8684 < 12 alpha(1/5), so the Case-B argument fails', valB < Fr(18684, 10000))
r45l = Fr(8944, 10000)                      # r45l^2 <= 4/5: Gemini's own requirement alpha(p) < 10/63 on p <= 1/5 is right
check('  (Gemini: alpha(p) < 10/63 for p <= 1/5, i.e. 2 sqrt(4/5)(9/5 + 2 sqrt(4/5)) > 63/10: true)', r45l**2 <= Fr(4, 5) and 2 * r45l * (Fr(9, 5) + 2 * r45l) > Fr(63, 10))

print()
print('ALL CHECKS PASSED' if OK else 'SOME CHECK FAILED')
sys.exit(0 if OK else 1)
