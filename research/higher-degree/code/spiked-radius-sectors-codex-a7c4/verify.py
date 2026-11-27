"""Exact checks for the sector estimates in the symmetrised spiked cubic game.

Run from any directory with Python's standard library. All acceptance decisions
use rational arithmetic, including when Python runs with optimization enabled.
Agent-ID: codex-a7c4.
"""
from fractions import Fraction as Q
from math import comb, factorial, isqrt


def check(condition, label):
    if not condition:
        raise ArithmeticError(label)


def root_interval(z):
    scale = 10**28
    numerator = isqrt(z.numerator * scale**2 // z.denominator)
    return Q(numerator, scale), Q(numerator + 1, scale)


def arctan_interval(j):
    x = Q(1, j)
    low = sum((-1)**k * x**(2*k+1) / (2*k+1) for k in range(32))
    return low, low + x**65 / 65


def pi_interval():
    a, b = arctan_interval(5), arctan_interval(239)
    return 16*a[0] - 4*b[1], 16*a[1] - 4*b[0]


PI_LO, PI_HI = pi_interval()
check(Q(333, 106) < PI_LO < PI_HI < Q(355, 113), "Machin bracket")


def gamma_weight(poly):
    """Integral of e^-T poly(T)/sqrt(T), divided by sqrt(pi)/2."""
    moment = Q(2)
    value = Q(0)
    for j, coefficient in enumerate(poly):
        value += coefficient * moment
        moment *= j + Q(1, 2)
    return value


def laplace_numerator(poly):
    """Numerator after integration against e^(-(1+s)T), denominator (1+s)^n."""
    n = len(poly)
    return [sum(poly[k] * factorial(k) * comb(n-1-k, j)
                for k in range(n-j)) for j in range(n)]


def check_polynomials():
    # Each visible sector contributes poly(T), listed in increasing powers of T.
    sectors = {
        "00": ([1], 2), "10": ([0, 1], 1), "01": ([0, 1], 1),
        "11": ([1, -2, 1], Q(3, 2)), "20": ([0, 0, Q(1, 2)], Q(3, 4)),
        "21": ([0, 2, -2, Q(1, 2)], Q(7, 8)),
    }
    remainders = {}
    for name, (poly, weight) in sectors.items():
        check(gamma_weight(poly) == weight, "visible weight " + name)
        d = weight - 1
        residual = list(poly) + [0] * (4-len(poly))
        residual[0] -= d
        residual[1] -= 1-d
        remainders[name] = residual
        check(gamma_weight(residual) == 0, "vanishing endpoint " + name)
    for name in ("00", "10", "01"):
        check(remainders[name] == [0]*4, "zero residual " + name)
    R, J = remainders["11"], remainders["21"]
    check(remainders["20"] == [x/2 for x in map(Q, R)], "half residual")
    check(R[-1] == 0 and laplace_numerator(R[:3]) == [0, Q(-3,2), Q(1,2)],
          "quadratic Laplace numerator")
    check(laplace_numerator(J) == [0, Q(-15,8), Q(10,8), Q(1,8)],
          "cubic Laplace numerator")


def stieltjes_lower(c, k, n):
    """First inverse diagonal of the compressed positive Laguerre matrix."""
    complement = c + 2*(n-1) + 1 + k
    for j in range(n-1, 0, -1):
        check(complement > 0, "positive Laguerre Schur complement")
        complement = c + 2*(j-1) + 1 + k - Q(j*(j+k))/complement
    check(complement > 0, "positive final complement")
    return 1/complement


def integral_divided_by_shift(poly, c, lo, hi):
    """Enclose the integral of e^-T poly(T)/(T+c) by polynomial division."""
    quotient = list(map(Q, poly))
    correction = Q(0)
    for j in range(len(quotient)-1, 0, -1):
        correction += quotient[j] * factorial(j-1)
        quotient[j-1] -= c * quotient[j]
    return correction + max(quotient[0]*lo, quotient[0]*hi)


def check_weight_family(c, n0, n1, b0, b1):
    lo = stieltjes_lower(c, 0, n0)
    hi = (1-stieltjes_lower(c, 1, n1))/c
    check(0 < lo < hi and b0 < b1, "ordered Stieltjes enclosures")
    polys = ([1], [0,1], [1,-2,1], [0,0,Q(1,2)], [0,2,-2,Q(1,2)])
    upper = [(1+c)*integral_divided_by_shift(p, c, lo, hi) for p in polys]
    check(upper[0] <= b1 and max(upper[1:]) <= b0, "sector bounds")
    if c != 1:
        check(upper[0] < b1 and max(upper[1:]) < b0, "strict refined sector bounds")
    if c == 1:
        check((lo, hi) == (Q(460,773), Q(100,167)), "short Stieltjes bracket")
    return lo, hi


def envelope(d):
    """Rational outer endpoints of the closed-form radial envelope F(d)."""
    x = d/(1-d)
    check(0 < x < 1, "Taylor expansion domain")
    exp_lo = sum(x**k/factorial(k) for k in range(25))
    exp_hi = exp_lo + x**25/factorial(25)/(1-x/26)
    integral_lo = sum((-x)**k/(factorial(k)*(2*k+1)) for k in range(24))
    integral_hi = integral_lo + x**24/(factorial(24)*49)
    d_lo, d_hi = root_interval(d)
    bracket_lo = root_interval((1-d)*PI_LO/4)[0] - d_hi*integral_hi
    bracket_hi = root_interval((1-d)*PI_HI/4)[1] - d_lo*integral_lo
    check(bracket_lo > 0, "positive exponential multiplier")
    return d_lo + exp_lo*bracket_lo, d_hi + exp_hi*bracket_hi


def payoff(y, t):
    eta, e = Q(779,10000), Q(39,50)
    return eta + (1-e)*t*t + (e-eta)*y


def check_cutoff(y, numerator):
    t = Q(numerator,10**8)
    target = Q(500,701)
    check(payoff(y,t) < target < payoff(y,t+Q(1,10**8)), "game cutoff and next point")


def check_rice_sector():
    exp_lo = sum(Q(3,2)**k / factorial(k) for k in range(5))
    check(2*PI_HI < Q(6,5)**2*exp_lo, "reciprocal Rice upper")
    p = Q(3,4)
    check(2*(1-Q(460,773)) == Q(626,773), "Rice spike weight")
    check(2*(4*Q(100,167)-2) == Q(132,167), "Rice cubic weight")
    check(Q(132,167) < 1 and p*Q(626,773) <
          (1-(1-p)*Q(132,167))*PI_LO/4, "Rice lower amplitude range")
    check(Q(9,10) + Q(81,400)/3 < 1, "Rice complementary range")
    check(Q(4,5) > PI_HI/4, "radial envelope exceeds phase in pure 11 example")


def main():
    check_polynomials()
    check_weight_family(Q(1), 5, 4, Q(626,773), Q(200,167))
    check_weight_family(Q(18,25), 64, 64, Q(804293213,10**9), Q(159,125))
    for rho, left in ((Q(2287,2500), 9890436), (Q(4571,5000), 9632546)):
        lo, hi = Q(left,10**8), Q(left+1,10**8)
        check(envelope(lo)[1] < rho < envelope(hi)[0], "radial crossing")
        print("radius", rho, "radial crossing strictly between", lo, "and", hi)
    check_cutoff(Q(2287,2500)**2, 46616437)
    check_cutoff(Q(626,773), 55096542)
    check_cutoff(Q(804293213,10**9), 56677916)
    check_rice_sector()
    print("All sector, Rice, payoff and next-point checks passed.")


if __name__ == "__main__":
    main()
