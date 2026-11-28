"""Exact interval check for one-coordinate phase pairs. Agent-ID: codex-a7c4."""
from fractions import Fraction as Q
from math import factorial, isqrt


def point(x):
    return Q(x), Q(x)


def add(x, y):
    return x[0]+y[0], x[1]+y[1]


def sub(x, y):
    return x[0]-y[1], x[1]-y[0]


def mul(x, y):
    products = [a*b for a in x for b in y]
    return min(products), max(products)


def reciprocal(x):
    if x[0] <= 0:
        raise ValueError("reciprocal needs a positive interval")
    return 1/x[1], 1/x[0]


def sqrt(x):
    scale = 2**100

    def lower_root(value):
        scaled = value*scale**2
        return isqrt(scaled.numerator // scaled.denominator)

    return Q(lower_root(x[0]), scale), Q(lower_root(x[1])+1, scale)


def square(x):
    if x[0] >= 0 or x[1] <= 0:
        return mul(x, x)
    return Q(0), max(t*t for t in x)


def incomplete_moment(j, x):
    """Enclose the integral of u^(j+1/2) exp(-u) from zero to x."""
    def taylor(n):
        return sum((-x)**k / (factorial(k)*(Q(3, 2)+j+k)) for k in range(n+1))

    # Taylor's remainder for exp(-u) has the sign of the first omitted term.
    # Substitute u=x*v before integrating each monomial for 0 <= v <= 1.
    return mul((taylor(65), taylor(64)), mul(point(x**(j+1)), sqrt(point(x))))


def signed_moment(j, mu):
    """E[X^(j+1/2) s(X)] where X~Exp(1) and s=-1 on [5/4,19/4]."""
    gamma = mu
    for k in range(j):
        gamma = mul(gamma, point(k+Q(3, 2)))
    middle = sub(incomplete_moment(j, Q(19, 4)), incomplete_moment(j, Q(5, 4)))
    return sub(gamma, mul(point(2), middle))


def main():
    pi = Q(333, 106), Q(355, 113)
    mu = mul(point(Q(1, 2)), sqrt(pi))
    j0, j1, j2 = [signed_moment(j, mu) for j in range(3)]
    radial_coeffs = [
        j0,
        mul(sub(mul(point(2), j0), j1), reciprocal(sqrt(point(2)))),
        mul(add(mul(point(3), sub(j0, j1)), mul(point(Q(1, 2)), j2)),
            reciprocal(sqrt(point(3)))),
    ]
    for t, upper in ((Q(".83743659"), Q("-.0060")), (Q(".838992436300"), Q("-.0047"))):
        # h=a ph(Z), k=i*b ph(Z)*s(|Z|²), with a=t/mu, a²+b²=1.
        # Squared coefficients of the phase are mu², mu²/8, 3mu²/64.
        t2 = point(t*t)
        a2 = mul(t2, reciprocal(square(mu)))
        b2 = sub(point(1), a2)
        if not (0 < b2[0] <= b2[1] < 1):
            raise ValueError("amplitude does not give a physical phase pair")

        h1, h3, h5 = t2, mul(t2, point(Q(1, 8))), mul(t2, point(Q(3, 64)))
        k1, k3, k5 = [mul(b2, square(c)) for c in radial_coeffs]
        delta = sub(h5, k5)
        first, cubic = sub(h1, k1), sub(h3, k3)
        tail = sub(sub(sub(a2, b2), first), cubic)
        payoff = add(sub(first, mul(point(Q(191, 250)), cubic)), mul(point(Q(47, 2000)), tail))
        if delta[1] >= upper or payoff[1] >= Q(".66"):
            raise ArithmeticError("signed fifth or identity-tail comparison failed")
        print(f"t={t}: signed fifth < {upper}, original real payoff < 33/50")


if __name__ == "__main__":
    main()
