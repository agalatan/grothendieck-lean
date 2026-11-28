"""Certified Bernstein majorants for the tilted signed fifth trace. Agent-ID: codex-a7c4."""

from fractions import Fraction as Q
from math import comb, ceil
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
from one_coordinate_multiplier import (
    NU,
    ALPHA,
    BETA,
    add,
    multiply,
    evaluate,
    require,
    tail,
    pi_interval,
)


def bernstein(p, a, b):
    n = len(p) - 1
    shift = [
        (b - a) ** k * sum(p[j] * comb(j, k) * a ** (j - k) for j in range(k, n + 1))
        for k in range(n + 1)
    ]
    return [
        sum(shift[k] * Q(comb(i, k), comb(n, k)) for k in range(i + 1))
        for i in range(n + 1)
    ]


def bracket(x):
    precision = 2**100
    down = lambda z: Q((z * precision).__floor__(), precision)
    up = lambda z: -down(-z)
    b = x / 2**32
    require(0 <= b <= 1, "exponential bracket domain")
    lo, hi = down(1 - b), up(1 / (1 + b))
    for _ in range(32):
        lo, hi = down(lo * lo), up(hi * hi)
    return lo, hi


def antiderivative(p):
    # F' - F = -p, so ∫ e^{-t} p = F(a)e^{-a} - F(b)e^{-b}.
    result = [Q()] * len(p)
    for k in reversed(range(len(p))):
        result[k] = p[k] + ((k + 1) * result[k + 1] if k + 1 < len(p) else 0)
    return result


def pieces(n, s, u, d, mul):
    mean = Q("0.886226925452757")
    require(mean * mean * 4 < pi_interval()[0], "Gaussian mean")
    polys = [
        [ALPHA - s - BETA * u / 2 - 3 * x / 8, BETA * u / 4 + 3 * x / 8, -x / 16]
        for x in [Q(), d]
    ]
    require(
        all(min(evaluate(p, 0), evaluate(p, 140)) > 0 and p[-1] <= 0 for p in polys),
        "radial sign before tail",
    )
    require(
        max(sum(map(abs, p)) for p in polys) < 1 and 4 * tail(3, 140) < Q(1, 10**52),
        "radial sign tail",
    )
    denoms = [
        [2 * NU, mul * mean * p[0], 0, mul * mean * p[1], 0, mul * mean * p[2]]
        for p in polys
    ]
    radii = [6 * Q(i, n) ** 2 for i in range(n + 1)]
    endpoints = [
        (r, r * r, 1 / min(evaluate(p, r) for p in denoms), bracket(r * r))
        for r in radii
    ]
    answer = []
    for (a, l, vl, el), (b, h, vh, eh) in zip(endpoints, endpoints[1:]):
        slope = (vh - vl) / (h - l)
        base = vl - slope * l
        require(min(vh, vl) > 0, "nonpositive chord")
        for p in denoms:
            coeffs = bernstein(add(multiply([base, 0, slope], p), [-1]), a, b)
            require(
                min(coeffs) >= 0,
                f"Bernstein coefficient below zero on [{a},{b}] at multiplier {mul}: {min(coeffs)}",
            )
        answer.append((l, h, [base, slope], el, eh))
    return answer


def price(n, s, u, d, gamma):
    require(n > 0 and 0 <= d <= NU and gamma >= 0, "trace domain")
    cells = {m: pieces(n, s, u, d, m) for m in [1, 2]}

    def integrate(p, m):
        total = Q()
        for l, h, line, lo, hi in cells[m]:
            prim = antiderivative(multiply(p, line))
            fl = evaluate(prim, l)
            fh = evaluate(prim, h)
            total += Q(
                ceil(
                    10**14 * (max(fl * lo[0], fl * lo[1]) - min(fh * hi[0], fh * hi[1]))
                ),
                10**14,
            )
        return total

    sq = lambda p: multiply(p, p)

    def term(x, k, p):
        return [0] * k + [x * y for y in sq(p)]

    shift = -Q(3, 8)
    rows = [
        add(term(BETA / 2, 1, [-2, 1]), term(d / 12, 1, [6, -6, 1])),
        add(term(BETA / 2, 2, [1]), term(d / 6, 2, [-3, 1])),
        add(term(BETA, 0, [-1 - shift, 1]), term(d / 4, 0, [2, -4, 1])),
        add(term(BETA, 1, [1]), term(d / 2, 1, [-2, 1])),
    ]
    # At t ≥ 36, t−2, t−3, t−1−shift and the quadratic Hermites
    # have magnitude at most their corresponding leading monomial.
    require(
        -1 <= shift <= 0
        and BETA / 2 + d / 12 < 1
        and BETA / 2 + d / 6 < 1
        and BETA + d / 4 < 1
        and BETA + d / 2 < 1
        and gamma + 3 * d / 2 < 1,
        "numerator outside the fifth-moment tail",
    )
    r = [integrate(p, 1) for p in rows]
    r[2] += BETA * shift**2 / ALPHA
    p = add([gamma], add(term(d, 0, [-1, 1]), term(d / 2, 2, [1])))
    r.append((integrate(p, 1) + integrate(p, 2)) / 2)
    t = tail(5, 36) / (2 * NU)
    return tuple(Q(ceil((z + t) * 10**8), 10**8) for z in r)


def registered_prices():
    choices = [
        (32, Q(".10"), Q(".4825"), (81239281, 63074271, 94132793, 99830595, 99927366)),
        (64, Q(".106"), Q(".483"), (81334041, 63117874, 94053611, 99977110, 99986230)),
        (
            128,
            Q(".10735"),
            Q(".4832"),
            (81342285, 63117921, 94020111, 99994384, 99995814),
        ),
    ]
    for n, s, gamma, expected in choices:
        result = price(n, s, Q(1), Q(".0001"), gamma)
        require(
            result == tuple(Q(x, 10**8) for x in expected) and max(result) < 1,
            f"registered {n}-chord trace",
        )
    return BETA - choices[-1][1] - choices[-1][2]


if __name__ == "__main__":
    residual = registered_prices()
    require(residual == Q(3939, 20000), "strongest registered residual")
    print(f"Three certified chord counts; residual {residual}.")
