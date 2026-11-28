"""A sector-product estimate for the spiked P7 sixth moment. Agent-ID: codex-a7c4."""

from fractions import Fraction as Q
from functools import lru_cache
from math import factorial, isqrt

import symmetric_product


FREQUENCIES = (0, 2, 1, -1, 1)  # visible modes for 11,20,10,01,21
# Coefficients of |R_i|², in ascending powers of T, on the five derivative terms.
RADIAL_SQUARES = ((0, 0, 4), (0, 0, 2), (0, 1), (0, 1), (0, 2, -6, Q(9, 2)))
REMOTE_FOURTH = (2, 2, 9, 6, 1)
SCALE = 10**12


def sqrt_down(x):
    x = Q(x)
    return Q(isqrt(x.numerator * SCALE**2 // x.denominator), SCALE)


def radial_product(i, j):
    """E[|R_i|² |R_j|²] for T of standard exponential law."""
    return sum(
        a * b * factorial(k + l)
        for k, a in enumerate(RADIAL_SQUARES[i])
        for l, b in enumerate(RADIAL_SQUARES[j])
    )


@lru_cache(maxsize=1)
def product_factors():
    """Outward ratios of the sector-product moments to the individual L4 bounds."""
    table = []
    for i in range(5):
        row = []
        for j in range(5):
            remote_bound = Q(1)
            remote_den = sqrt_down(REMOTE_FOURTH[i] * REMOTE_FOURTH[j])
            if i == 4 or j == 4:
                remote_bound = 1 / remote_den
            elif (i in (0, 1)) != (j in (0, 1)):
                remote_bound = min(Q(1), 3 / remote_den)
            radial_den = sqrt_down(radial_product(i, i) * radial_product(j, j))
            row.append(min(Q(1), remote_bound * radial_product(i, j) / radial_den))
        table.append(tuple(row))
    return tuple(table)


def reduction(verifier, model, beta, endpoint, symmetric=False):
    """Guaranteed reduction of a checked C3 endpoint intercept."""
    if model["v3_mode"] != "holder":
        return Q(0)
    if endpoint not in ("lo", "hi") or not 0 < beta < 1:
        raise ValueError("invalid P7 endpoint or ray")
    lo, hi = Q(model["s_lo"]), Q(model["s_hi"])
    mid = (lo + hi) / 2
    shape = lo if endpoint == "lo" else hi
    scale = (
        30
        * sum(map(Q, model["l3"]))
        * (1 - beta**2)
        * beta**3
        * (8 + mid + 3 * shape)
        / (4 * verifier.root4_lo(2 + mid))
    )
    prices = tuple(map(Q, model["sec_dual"][endpoint]["a_hol"]))
    if (
        len(prices) != 5
        or min(prices) <= 0
        or tuple(verifier.HOLDER_K4) != (768, 192, 18, 12, 9260)
    ):
        raise ValueError("five positive prices and the same derivative sectors")
    terms = [
        (scale * cap) ** 2 / (4 * price)
        for cap, price in zip(verifier.KAPPA_HI, prices)
    ]
    by_frequency = [Q(0)] * 7
    pair = product_factors()
    for i, m in enumerate(FREQUENCIES):
        for j, n in enumerate(FREQUENCIES):
            by_frequency[m + n + 2] += pair[i][j] * terms[i] * terms[j]
    revised = sqrt_down(max(by_frequency)) + Q(1, SCALE)
    if symmetric:
        revised = min(revised, symmetric_product.intercept(terms, pair, FREQUENCIES))
    return max(Q(0), sum(terms) - revised)
