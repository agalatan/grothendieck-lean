# claude-b9ee, 17 Nov 2026.  PART A2: harmonic cubics, exact rational checks of the weighted great-circle bound
#   E|F| <= b_n ||F||_2,  b_n = a_n * C_Stief(n),
#   a_n = E[R^3]/sqrt(E[R^6]) = 2^(3/2) Gamma((n+3)/2) / (Gamma(n/2) sqrt(n(n+2)(n+4))),   R ~ chi_n,
#   C_Stief(n) = (3/pi) sqrt(1 - tau_3(n)/9) = sqrt((35n - 38)/(n - 1)) / (2 pi),   tau_3(n) = (n+2)/(4(n-1)).
# b_n^2 = Q_n / pi (n even) or Q_n / pi^3 (n odd) with Q_n rational; only a rigorous LOWER bound on pi is needed.
# Run:  python3 -I harmonic_exact.py      (needs python-flint only for the optional floating column)
from fractions import Fraction as Fr
import math

def arctan_bounds(x, terms):          # alternating series, decreasing terms (0 < x < 1): partial sums bracket arctan x
    s = Fr(0); lo = hi = None
    for k in range(terms):
        s += Fr((-1)**k) * x**(2*k + 1) / (2*k + 1)
        if k % 2 == 0: hi = s          # last term positive -> upper bound
        else: lo = s                   # last term negative -> lower bound
    return lo, hi

lo5, hi5 = arctan_bounds(Fr(1, 5), 40)
lo239, hi239 = arctan_bounds(Fr(1, 239), 20)
PI_LO = 16*lo5 - 4*hi239               # Machin: pi = 16 arctan(1/5) - 4 arctan(1/239)
PI_HI = 16*hi5 - 4*lo239
assert PI_LO < PI_HI and PI_HI - PI_LO < Fr(1, 10**50)
def dec(x, d=40):                      # exact truncated decimal expansion of a positive rational
    q, r = divmod(x.numerator * 10**d, x.denominator); s = str(q); return s[:-d] + '.' + s[-d:]
print('rigorous pi bounds (Machin, exact rationals): %s <= pi <= %s' % (dec(PI_LO), dec(PI_HI)))
assert PI_LO > Fr(314159265358979, 10**14)

def gamma_half(k):                    # Gamma(k/2) = r * sqrt(pi)^e, returns (r, e) with e in {0, 1}
    if k % 2 == 0: return Fr(math.factorial(k//2 - 1)), 0
    x = Fr(1, 2); r = Fr(1)
    while x < Fr(k, 2): r *= x; x += 1
    return r, 1                        # Gamma(1/2) = sqrt(pi); Gamma(k/2) = prod_{x = 1/2, 3/2, ...}^{k/2 - 1} x * sqrt(pi)

def Qn(n):                            # b_n^2 = Q_n * pi^(e - 2),  e = +1 (n even) / -1 (n odd)
    rn, en = gamma_half(n + 3); rd, ed = gamma_half(n)
    r = rn / rd; e = en - ed           # G_n = Gamma((n+3)/2)/Gamma(n/2) = r * sqrt(pi)^e
    G2 = r*r                           # G_n^2 = r^2 pi^e
    Q = 2*G2*(35*n - 38) / (n*(n + 2)*(n + 4)*(n - 1))
    return Q, e

S2P2 = Fr(2)                           # target sqrt(2/pi): b^2 < 2/pi
T2 = Fr(17, 25)                        # target sqrt(17/25)
print()
print(' n  parity  Q_n (b_n^2 = Q_n pi^(e-2))                         b_n (float)     b_n < sqrt(2/pi)   b_n < sqrt(17/25)')
try:
    from flint import arb, fmpq, ctx
    ctx.prec = 128
    def bfloat(Q, e): return (arb(fmpq(Q.numerator, Q.denominator))*arb.pi()**(e - 2)).sqrt()
except ImportError:
    bfloat = None
res = {}
for n in range(2, 17):
    Q, e = Qn(n)
    if e == 1:      # b^2 = Q/pi
        sharp = (Q < 2)                                  # Q/pi < 2/pi  <=>  Q < 2   (pi cancels)
        weak = (PI_LO > Fr(25, 17)*Q)                    # Q/pi < 17/25 <=  pi_lo > 25Q/17
        sharp_fail = (Q > 2); weak_fail = (PI_HI < Fr(25, 17)*Q)
    else:           # b^2 = Q/pi^3
        sharp = (Q < 2*PI_LO**2)                         # Q/pi^3 < 2/pi <=> Q < 2 pi^2
        weak = (PI_LO**3 > Fr(25, 17)*Q)
        sharp_fail = (Q > 2*PI_HI**2); weak_fail = (PI_HI**3 < Fr(25, 17)*Q)
    res[n] = (sharp, weak)
    bf = bfloat(Q, e).str(12, radius=False) if bfloat else ''
    print('%2d  %s  %-55s %s   %-17s %s' % (n, 'even' if e == 1 else 'odd ', Q, bf,
          'PROVED' if sharp else ('fails' if sharp_fail else '?'), 'PROVED' if weak else ('fails' if weak_fail else '?')))

# the exact inequality at n = 12 with pi cancelled, in integers
Q12, e12 = Qn(12)
assert e12 == 1
print()
print('n = 12: b_12^2 = Q_12/pi with Q_12 = %s; sharp bound <=> Q_12 < 2 <=> %d < %d (margin ratio %.3e)'
      % (Q12, Q12.numerator, 2*Q12.denominator, float(1 - Q12/2)))
print('        equivalently 135135^2 * 382 / 231 = %d < 2 * 122880^2 = %d' % (135135**2*382//231, 2*122880**2))
assert 135135**2*382 % 231 == 0 and 135135**2*382//231 < 2*122880**2
assert Fr(135135**2*382, 231*2*122880**2) == Q12/2

# monotonicity within each parity class: a_{n+2}^2/a_n^2 = (n+3)^2/(n(n+6)) > 1 and C_Stief(n) increasing
for n in range(2, 30):
    Qa, ea = Qn(n); Qb, eb = Qn(n + 2)
    ratio = (Qb*Fr(n + 1, 35*(n + 2) - 38)) / (Qa*Fr(n - 1, 35*n - 38))   # = a_{n+2}^2/a_n^2 (same parity: same power of pi)
    assert ratio == Fr((n + 3)**2, n*(n + 6)), (n, ratio)
    assert Fr(35*(n + 2) - 38, n + 1) > Fr(35*n - 38, n - 1)
print('monotonicity checked for 2 <= n < 30: a_{n+2}^2/a_n^2 = (n+3)^2/(n(n+6)) > 1 and (35n-38)/(n-1) = 35 - 3/(n-1) increasing')
print()
assert res[11][0] and res[12][0] and res[14][1] and res[15][1]
print('CERTIFIED: harmonic cubics: E|F| < sqrt(2/pi) ||F||_2 for all n <= 12 (checked n = 11, 12; parity monotonicity),')
print('           E|F| < sqrt(17/25) ||F||_2 for all n <= 15 (checked n = 14, 15; every n <= 16 is listed above).')
