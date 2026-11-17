# claude-b9ee research worker, 17 Nov 2026. EXACT (fractions) and RIGOROUS (arb) checks of the small constants.
from fractions import Fraction as Fr
from math import comb
def dfact(m):   # (m)!! for odd m >= -1
    r = 1
    while m > 1: r *= m; m -= 2
    return r
def EX(p):      # E X^p for X ~ N(0,1)
    return 0 if p % 2 else dfact(p - 1)
def E_He3_power(m):   # E (X^3 - 3X)^m = E X^m (X^2 - 3)^m
    return sum(comb(m, j) * (-3)**(m - j) * EX(m + 2*j) for j in range(m + 1))
for m in (2, 4, 6):
    e = E_He3_power(m); print('E (X^3-3X)^%d = %d, E h^%d = %s' % (m, e, m, Fr(e, 6**(m // 2))))
assert Fr(E_He3_power(2), 6) == 1 and Fr(E_He3_power(4), 36) == 93 and Fr(E_He3_power(6), 216) == 53745
# near-zero bound: g(u) = psi(u) - e^{-u^2/2} >= (93/24 - 1/8) u^4 - (53745/720) u^6
a4 = Fr(93, 24) - Fr(1, 8); a6 = Fr(53745, 720)
print('g(u) >= %s u^4 - %s u^6 ; at u = 1/5 the bracket is %s' % (a4, a6, a4 - a6 * Fr(1, 25)))
assert a4 == Fr(15, 4) and a6 == Fr(3583, 48) and a4 - a6 * Fr(1, 25) == Fr(917, 1200)
# envelope near 0: psi(u) <= 1 - u^2/2 + (31/8) u^4 <= 1 - u^2/5 when (31/8) u^2 <= 3/10; at u = 1/5:
assert Fr(31, 8) * Fr(1, 25) <= Fr(3, 10)
print('(31/8)(1/25) = %s <= 3/10' % (Fr(31, 8) * Fr(1, 25)))
# int_0^{1/5} u^2 du = 1/375
assert Fr(1, 5)**3 / 3 == Fr(1, 375)
# E|h| = (1 + 4 e^{-3/2})/sqrt(3 pi): rigorous enclosure, and the Lipschitz constant L = 632/1024
from flint import arb, acb, ctx
ctx.prec = 96
Eabs = (1 + 4 * arb(-1.5).exp()) / (3 * arb.pi()).sqrt()
L = arb(632) / 1024
print('E|h| =', Eabs.str(15, radius=True), '  L = 632/1024 =', L, '  E|h| < L:', Eabs < L)
assert Eabs < L
# cross-check E|h| by rigorous integration: 2 int_0^8 |x^3 - 3x|/sqrt6 phi dx (split at sqrt 3) + tail
S6 = arb(6).sqrt(); C0 = 1 / (2 * arb.pi()).sqrt(); r3 = arb(3).sqrt()
f1 = lambda z, an: (3*z - z**3) / S6 * (-(z*z)/2).exp() * C0
f2 = lambda z, an: (z**3 - 3*z) / S6 * (-(z*z)/2).exp() * C0
num = 2 * (acb.integral(f1, 0, r3) + acb.integral(f2, r3, 30)).real
print('E|h| by integration (to x = 30):', num.str(15, radius=True), ' overlaps closed form:', num.overlaps(Eabs))
assert num.overlaps(Eabs)
# E h^2 = 1 by integration (sanity)
f3 = lambda z, an: ((z**3 - 3*z) / S6)**2 * (-(z*z)/2).exp() * C0
print('E h^2 by integration (to 30):', (2 * acb.integral(f3, 0, 30).real).str(15, radius=True))
