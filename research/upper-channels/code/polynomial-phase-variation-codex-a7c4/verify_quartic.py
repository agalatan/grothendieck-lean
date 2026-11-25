"""Exact quartic coefficient of phase(z+ε w (|w|²−2)) at imaginary correlation. Agent-ID: codex-a7c4."""

from collections import defaultdict
from fractions import Fraction as F
from functools import lru_cache
from math import comb, factorial as fac


def require(ok, text):
    if not ok:
        raise ArithmeticError(text)


# Coordinates z,zbar,y,ybar,u,ubar,v,vbar and exponent of i modulo 4.
zero = (0,) * 9


def mon(i, j, ip=0):
    a = list(zero)
    a[i] += 1
    a[j] += 1
    a[-1] = ip
    return tuple(a)


L = {
    mon(i, j, ip): F(1, 2)
    for i, j, ip in [
        (0, 5, 0),
        (1, 4, 0),
        (2, 7, 0),
        (3, 6, 0),
        (0, 7, 1),
        (1, 6, 1),
        (2, 5, 1),
        (3, 4, 1),
    ]
}
M = {mon(i, j, ip): F(1, 2) for i, j, ip in [(4, 5, 0), (6, 7, 0), (4, 7, 1), (5, 6, 1)]}


def add_product(out, p, q, scale):
    for a, u in p.items():
        for b, v in q.items():
            ab = tuple(x + y for x, y in zip(a[:-1], b[:-1])) + ((a[-1] + b[-1]) % 4,)
            out[ab] += scale * u * v


@lru_cache(None)
def moment(a, b, c, d, sgn):
    """Remote Gaussian Wick moment. Return real and imaginary parts separately."""
    value = [0, 0]
    if a + c == b + d:
        for k in range(max(0, b - c), min(a, b) + 1):
            crossed = a + b - 2 * k
            pairs = (
                fac(a)
                * fac(b)
                * fac(c)
                * fac(d)
                // (fac(k) * fac(a - k) * fac(b - k) * fac(c - b + k))
            )
            phase = (-sgn * crossed) % 4
            value[phase % 2] += pairs * (-1) ** (phase // 2)
    return tuple(value)


@lru_cache(None)
def remote(a, b, c, d, cubic):
    if not cubic:
        return tuple(2 ** ((a + b + c + d) // 2) * z for z in moment(a, b, c, d, 1))
    sums = [0, 0]
    for i in range(a + b + 1):
        for j in range(c + d + 1):
            weight = comb(a + b, i) * comb(c + d, j) * (-2) ** (a + b + c + d - i - j)
            for ix, z in enumerate(moment(a + i, b + i, c + j, d + j, -1)):
                sums[ix] += weight * z
    return tuple(sums)


def groups(order):
    previous = {}
    current = {zero: F(1)}
    for n in range(1, order + 1):
        out = defaultdict(F)
        add_product(out, L, current, F(1, n))
        add_product(out, M, previous, F(-2, n))
        previous, current = current, out
    result = defaultdict(F)
    for (a, b, c, d, e, f, g, h, ip), weight in current.items():
        if a + c != b + d:
            continue
        harm = abs(a - b - 1)
        sigpow = 1 + ip - harm
        u, v = remote(e, f, g, h, True), remote(e, f, g, h, False)
        # Factor out the angular phase i*(-i)^harm from the visible Mehler integral.
        for t in range(2):
            power = (sigpow + t) % 4
            key = (*sorted([a + b, c + d]), harm, power % 2)
            result[key] += weight * (u[t] - v[t]) * (-1) ** (power // 2)
    return {k: v for k, v in result.items() if v}


def half_gamma(twice):
    k = (twice - 1) // 2
    require(twice == 2 * k + 1, "half-integral gamma")
    return F(fac(2 * k), 4**k * fac(k))  # gamma(k+1/2)/sqrt(pi)


def vis(l, j, n):
    """Enclose the signed-stripped visible moment divided by pi/sqrt(2)."""
    a = F(l + n + 2, 2)
    b = F(j + n + 2, 2)
    c = n + 1
    require(a.denominator == b.denominator == 2 and (j - n) % 2 == 1, "half-integer transformation")
    pref = F(2) ** ((j - n + 1) // 2) * half_gamma(a.numerator) * half_gamma(b.numerator) / fac(n)
    term = total = F(1)
    steps = 80
    for k in range(steps):
        term *= (a + k) * (c - b + k) / (2 * (c + k) * (1 + k))
        total += term
    # At k>=steps the ratio is at most .6 by a loose factorwise bound.
    require(
        max(abs(a), abs(c - b)) < 6 and F(1, 2) * (1 + F(6, steps)) ** 2 < F(3, 5),
        "hypergeometric tail ratios",
    )
    err = F(3, 2) * abs(term)
    return pref * (total - err), pref * (total + err)


def main():
    require(groups(2) == {}, "cubic and linear carrier second moments match")
    got = groups(4)
    expected = {
        (0, 0, 1): 204,
        (0, 2, 1): -140,
        (0, 4, 1): 5,
        (1, 1, 0): 134,
        (1, 1, 2): -134,
        (1, 3, 0): -42,
        (1, 3, 2): 42,
        (2, 2, 1): F(-61, 2),
        (2, 2, 3): F(13, 2),
    }
    require(got == {(*k, 0): v for k, v in expected.items()}, "Wick and kernel coefficient table")
    lo = hi = F(0)
    for key, v in expected.items():
        a, b = vis(*key)
        lo += min(v * a, v * b)
        hi += max(v * a, v * b)
    require(
        lo > 0
        and lo**2 * F(333, 106) ** 2 > 2 * F(597, 100) ** 2
        and hi**2 * F(355, 113) ** 2 < 2 * F(598, 100) ** 2,
        "quartic coefficient between 5.97 and 5.98",
    )
    # Absolute sixth derivative over 6! after translating the visible Gaussian pair.
    moment_h6 = sum(comb(6, j) * (-2) ** (6 - j) * 2 ** (j + 3) * fac(j + 3) for j in range(7))
    visible = lambda d: 2**d * 2 ** (d // 2) * fac(d // 2)
    remainder = (
        4
        * 64
        * moment_h6
        * sum(F(visible(6 - 2 * j), 2**j * fac(j) * fac(6 - 2 * j)) for j in range(4))
    )
    eps = F(1, 10**6)
    require(eps**2 * remainder < F(97, 100), "sixth-order error at explicit epsilon")
    print(
        "5.97 < fourth coefficient < 5.98; second coefficient vanishes. At epsilon=10^-6, W > gamma_dagger + 5e-24."
    )
    print("Absolute sixth-order envelope coefficient:", remainder)


if __name__ == "__main__":
    main()
