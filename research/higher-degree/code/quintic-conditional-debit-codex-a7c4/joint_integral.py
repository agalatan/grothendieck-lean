"""Exact joint visible/remote Gaussian-distance integral for the capped game.

Agent-ID: codex-a7c4. Only Python's standard library is used. Example:
    python3 -IB joint_integral.py 1.79 .65 .93 .185 2.56

For T exponential of mean 1, this lower-bounds the expectation of the maximum
of eight squared-distance minorants, uniformly for a complex coefficient b
with |Re b|<=1. The signed radial coordinates are x=√T[a+c(T−2)+b((T−3)²−3)]
and y=w+g(T−1). Here b multiplies the unnormalised quintic polynomial.
"""

from argparse import ArgumentParser
from dataclasses import dataclass
from fractions import Fraction as F
from functools import lru_cache
from math import isqrt

PREC = 10**10


def floor(q):
    return q.numerator // q.denominator


def ceil(q):
    return -floor(-q)


def exact(value):
    """Accept only integers, rational strings and fractions, preserving their exact values."""
    if type(value) not in (int, str, F):
        raise TypeError("supply a rational as an integer, string or Fraction")
    return F(value)


@lru_cache(maxsize=16, typed=True)
def radial_moments(grid, radius):
    """Certified lower bin masses and exact normalized moments of a lower density.

    Set T=r². On r∈[lo,hi] use e^(−hi²) (1+hi²−r²) 2r dr <= exp(−r²) 2r dr.
    The weight keeps the moments of all polynomials in r rational and avoids
    loss of first-order accuracy in the mesh width. The remaining tail is positive.
    """
    if type(grid) is not int or type(radius) is not int:
        raise TypeError("grid and radius must be integers")
    if not (grid >= 2 * radius and radius >= 1):
        raise ValueError("choose grid >= 2*radius and positive radius")
    density = PREC
    cells = []
    for j in range(grid * radius):
        lo, hi = F(j, grid), F(j + 1, grid)
        delta = hi * hi - lo * lo
        # As delta <= 1, the alternating series through degree 7 bounds e^(-delta) below.
        term = exponential_lower = F(1)
        for k in range(1, 8):
            term *= -delta / k
            exponential_lower += term
        density = density * floor(PREC * exponential_lower) // PREC

        def moment(k):
            return 2 * (
                (1 + hi * hi) * (hi ** (k + 2) - lo ** (k + 2)) / (k + 2)
                - (hi ** (k + 4) - lo ** (k + 4)) / (k + 4)
            )

        norm = moment(0)
        m1, m2, m3, m5 = [moment(k) / norm for k in (1, 2, 3, 5)]
        cells.append((floor(density * norm), m1, m2, m3, m5))
    return cells


@dataclass(frozen=True)
class Row:
    a: F
    c: F
    w: F
    g: F


def create_cells(row, grid, radius):
    """Apply Jensen to the convex squared-distance minorant in each radial bin.

    Namely (|X|₂-1)_+² and (|X₁|+λ|X₂|−1−5λ²/16)_+²/(1+λ²) are convex,
    as is their maximum. Projecting a complex visible coordinate to its real
    component after radial rotation can only decrease each term.
    """
    cells = []
    for mass, m1, m2, m3, m5 in radial_moments(grid, radius):
        base = row.a * m1 + row.c * (m3 - 2 * m1)
        tilt = m5 - 6 * m3 + 6 * m1
        remote = abs(row.w + row.g * (m2 - 1))
        cells.append(
            (
                mass,
                floor(PREC * base),
                ceil(PREC * base),
                floor(PREC * tilt),
                ceil(PREC * tilt),
                floor(PREC * remote),
            )
        )
    return cells


def interval_lower(cells, bl, bh, den):
    """Floor of the lower estimate in units PREC^(-3) on b∈[bl/den,bh/den]."""
    total = 0
    for mass, al, ah, pl, ph, y in cells:
        products = (bl * pl, bl * ph, bh * pl, bh * ph)
        xl = al + min(products) // den
        xh = ah - (-max(products) // den)
        x = max(0, xl, -xh)
        disk = max(0, isqrt(x * x + y * y) - PREC)
        best = disk * disk
        for m in range(1, 8):
            # lambda=m/5. Clear denominators in (x+lambda*y−1−5lambda²/16)_+²/(1+lambda²).
            n = 80 * x + 16 * m * y - (80 + m * m) * PREC
            if n > 0:
                best = max(best, n * n // (256 * (25 + m * m)))
        total += mass * best
    return total


def certify(a, c, w, g, target, grid=64, radius=6, max_depth=20):
    """Return (uniform rational lower bound, number of accepted closed tilt intervals).

    Refine the complete interval [-1,1] dyadically, stopping a branch only after
    its uniform lower estimate exceeds target. A failure to close raises ValueError.
    Named data must be rational strings, ints, or Fractions. Mesh and recursion
    parameters must be integers. A zero recursion depth tests the unsplit interval.
    """
    a, c, w, g, target = map(exact, (a, c, w, g, target))
    if type(max_depth) is not int:
        raise TypeError("max_depth must be an integer")
    if target < 0 or not 0 <= max_depth <= 40:
        raise ValueError("nonnegative target and max_depth in [0,40] required")
    cells = create_cells(Row(a, c, w, g), grid, radius)
    scale = PREC**3
    threshold = floor(target * scale)
    den = 1 << max_depth
    stack = [(-den, den, 0)]
    count = covered_length = 0
    minimum = None
    while stack:
        left, right, depth = stack.pop()
        result = interval_lower(cells, left, right, den)
        if result > threshold:
            minimum = result if minimum is None else min(minimum, result)
            count += 1
            covered_length += right - left
        elif depth == max_depth:
            raise ValueError(
                f"could not prove {target} for b in [{F(left,den)}, {F(right,den)}] with this mesh"
            )
        else:
            middle = (left + right) // 2
            stack.extend([(middle, right, depth + 1), (left, middle, depth + 1)])
    if covered_length != 2 * den:
        raise ValueError("tilt intervals failed to cover [-1,1]")
    return F(minimum, scale), count


if __name__ == "__main__":
    p = ArgumentParser(description=__doc__)
    for k in ("a", "c", "w", "g", "target"):
        p.add_argument(k)
    p.add_argument("--grid", type=int, default=64)
    p.add_argument("--radius", type=int, default=6)
    opts = p.parse_args()
    value, count = certify(**vars(opts))
    print(
        f"Certified joint integral > {opts.target} uniformly on [-1,1]; {count} tilt boxes; floor at 1e-9 = {floor(value*10**9)}."
    )
