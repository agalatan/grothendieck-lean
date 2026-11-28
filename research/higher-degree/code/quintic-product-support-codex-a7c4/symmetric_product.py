"""Rational upper bound for the symmetric flattening of a five-sector fourth power.
Agent-ID: codex-a7c4.
"""

from fractions import Fraction as Q
from math import isqrt

SCALE = 10**8


def sqrt_scaled_up(value):
    """Smallest integer at least SCALE times sqrt(value)."""
    n, d = value.numerator * SCALE**2, value.denominator
    r = isqrt(n // d)
    return r if r * r * d == n else r + 1


def intercept(terms, factors, frequencies):
    """Return an upper bound on the Young intercept, in the original units."""
    bmax = max(terms)
    if bmax == 0:
        return Q(0)
    b = [u / bmax for u in terms]
    pairs = [(i, j) for i in range(len(b)) for j in range(i, len(b))]
    d = [
        [sqrt_scaled_up(c * b[i] * b[j]) for j, c in enumerate(row)]
        for i, row in enumerate(factors)
    ]

    def entry(i, j, k, l):
        if frequencies[i] + frequencies[j] != frequencies[k] + frequencies[l]:
            return 0
        return d[i][j] * d[k][l]

    # A vector invariant under exchanging the two indices has only 15 coordinates.
    # The factor of two restores each ordered off-diagonal column of the full matrix.
    rows = [
        [
            (1 if k == l else 2)
            * (entry(i, j, k, l) + entry(i, k, j, l) + entry(i, l, j, k))
            for k, l in pairs
        ]
        for i, j in pairs
    ]
    v = [1] * len(rows)
    for _ in range(32):
        y = [sum(a * t for a, t in zip(row, v)) for row in rows]
        top = max(y)
        if top == 0:
            return Q(0)
        # Only the final coordinate inequalities are used in the proof.
        v = [1 + (SCALE * z) // top for z in y]
    y = [sum(a * t for a, t in zip(row, v)) for row in rows]
    eigenvalue = max(Q(z, t) for z, t in zip(y, v)) / (3 * SCALE**2)
    return bmax * Q(sqrt_scaled_up(eigenvalue), SCALE)
