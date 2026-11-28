"""Exact uniform bound for a nonnegative five-coordinate quartic using a rational sum of squares."""

from fractions import Fraction as Q
from itertools import combinations_with_replacement
from collections import defaultdict
from math import isqrt

ROOT_SCALE = 10**12


def root(x, upper=True):
    n = isqrt(x.numerator * ROOT_SCALE**2 // x.denominator)
    return Q(
        n + int(upper and n * n * x.denominator < x.numerator * ROOT_SCALE**2),
        ROOT_SCALE,
    )


def riesz_bounds(terms, factors, frequencies, cert, lower_test):
    scale = cert["unit"]
    mu = Q(cert["mu"], scale)
    pairs = list(combinations_with_replacement(range(5), 2))
    n = len(pairs)
    rows = cert["rows"]
    if (
        len(terms) != 5
        or not isinstance(scale, int)
        or scale <= 0
        or len(rows) != n
        or any(len(row) != n or any(type(v) != int for v in row) for row in rows)
    ):
        raise ValueError("positive scale and complete integer Gram factor")
    norm = max(terms)
    if norm <= 0:
        raise ValueError("positive normalization")
    normalized = [b / norm for b in terms]
    # d_ij are rounded upward in the quartic. Compute the true lower test using
    # lower rounding of the same certified product coefficients.
    val = [factors[i][j] * normalized[i] * normalized[j] for i, j in pairs]
    hi = [root(z) * (1 + (i != j)) for z, (i, j) in zip(val, pairs)]
    lo = [root(z, False) * (1 + (i != j)) for z, (i, j) in zip(val, pairs)]
    freq = [frequencies[i] + frequencies[j] for i, j in pairs]
    error = defaultdict(Q)
    for a, (i, j) in enumerate(pairs):
        for b, (k, l) in enumerate(pairs):
            sos = Q(sum(r[a] * r[b] for r in rows), scale**2)
            grad = hi[a] * hi[b] if freq[a] == freq[b] else 0
            error[tuple(sorted((i, j, k, l)))] += (
                grad + sos - (mu if i == j and k == l else 0)
            )
    surplus = sum(max(Q(0), r) for r in error.values())
    low_freq = defaultdict(Q)
    for (i, j), d, f in zip(pairs, lo, freq):
        low_freq[f] += d * lower_test[i] * lower_test[j]
    test = sum(z * z for z in low_freq.values()) / sum(x * x for x in lower_test) ** 2
    return norm * root(test, False), norm * root(mu + surplus), surplus
