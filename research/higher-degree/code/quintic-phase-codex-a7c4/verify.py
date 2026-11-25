#!/usr/bin/env python3
"""Exact rational checks for the scalar phase reduction. Author: codex-a7c4.

From the repository root: python3 -IB research/higher-degree/code/quintic-phase-codex-a7c4/verify.py
Elsewhere: python3 -IB research/higher-degree/code/quintic-phase-codex-a7c4/verify.py --root /path/to/grothendieck-lean
"""
import argparse
import json
from dataclasses import dataclass
from fractions import Fraction as Q
from math import isqrt
from pathlib import Path


ETA = Q(779, 10000)
N = 64                       # mesh in T
GRID = 2**60                 # outward rounding of exponential and square-root upper bounds
DATA = Path("research/higher-degree/code/degree5-content")
# Columns: tag, 2R, ceiling for the loss in units of 10^-12.
LIMITS = [
    ("0.70", 23, 107000), ("0.74", 26, 10700), ("0.76", 27, 4900),
    ("0.78", 29, 970), ("0.79", 30, 430), ("0.80", 30, 430),
    ("0.81", 31, 190), ("0.82", 32, 83), ("0.83", 33, 37),
    ("0.84", 33, 37), ("0.845", 34, 16), ("0.85", 34, 16),
    ("0.855", 35, 7), ("0.86", 35, 7), ("0.865", 35, 7),
    ("0.87", 36, 3), ("0.875", 36, 3), ("0.88", 36, 3), ("0.886", 36, 3),
]
# A distinct 0.790 row in #646, head 8de915680f58773b3eb765df0a419a1523997fff,
# degree5-design/design-2026-11-25/tables/fin_table.json. No PR data are fetched.
DESIGN_079 = {"l": Q(150341, 200000), "beta": Q(118641, 1000000),
              "bA": -Q(44931, 1000000), "bB": -Q(24757, 1000000)}


class Rejected(ValueError):
    pass


def require(condition, message):
    if not condition:
        raise Rejected(message)


@dataclass(frozen=True)
class Interval:
    lo: Q
    hi: Q

    def __add__(self, other):
        return Interval(self.lo + other.lo, self.hi + other.hi)

    def __sub__(self, other):
        return Interval(self.lo - other.hi, self.hi - other.lo)

    def __mul__(self, other):
        products = [a * b for a in (self.lo, self.hi) for b in (other.lo, other.hi)]
        return Interval(min(products), max(products))


def point(value):
    return Interval(value, value)


def row_interval(value):
    """Include the input decimal, its nearest multiple of 10^-6, and points between."""
    rounded = Q(round(value * 10**6), 10**6)
    return Interval(min(value, rounded), max(value, rounded))


def polynomial(t, coefficients):
    result = coefficients[-1]
    for coefficient in reversed(coefficients[:-1]):
        result = result * t + coefficient
    return result


def sqrt_upper(x):
    q = x * GRID**2
    return Q(1 + isqrt(q.numerator // q.denominator), GRID)


def exp_upper_grid():
    """exp(-j/N) <= upper[j] by a quadratic lower bound on exp(1/N)."""
    factor = 1 + Q(1, N) + Q(1, 2 * N**2)
    upper = [Q(1)]
    for _ in range(max(pair[1] for pair in LIMITS) * N // 2):
        q = upper[-1] * GRID / factor
        upper.append(Q(-(-q.numerator // q.denominator), GRID))
    return upper


INV_SQRT12 = Interval(Q(288675, 10**6), Q(288676, 10**6))
INV_SQRT2 = Interval(Q(707106, 10**6), Q(707107, 10**6))


def tail_upper(r, exp_upper):
    require(r >= 5 and (r * N).denominator == 1, "tail cutoff")
    return INV_SQRT12.hi * sqrt_upper(r) * r * (r - 3) * exp_upper[int(r * N)]


def optimizer_lower_bound(exp_upper):
    """Upper sum for E[sqrt(T) p(T)_-] plus analytic bound above T=8."""
    negative = Q(0)
    for j in range(5 * N):
        lo, hi = Q(j, N), Q(j + 1, N)
        distance_to_three = max(lo - 3, 3 - hi, 0)
        max_negative = max(3 - distance_to_three**2, 0) * INV_SQRT12.hi
        negative += sqrt_upper(hi) * max_negative * exp_upper[j] / N
    tail = tail_upper(Q(8), exp_upper)
    require(negative < Q(20945, 100000) and tail < Q(1096, 100000), "optimizer integrals")
    lower = -ETA * (negative + tail)
    require(lower > -Q(172, 10000), "real part of optimizer")
    return lower


def coefficients(ell, beta, j0, k1, amplitude):
    """g(T) and H(T) = (g+2Tg')k - 2Tgk' for a fixed real amplitude."""
    v = point(amplitude) * INV_SQRT12
    g0 = ell - point(2) * beta + point(6) * v
    g1 = beta - point(6) * v
    return [g0, g1, v], [
        j0 * g0, point(3) * j0 * g1 - k1 * g0,
        point(5) * j0 * v + k1 * g1, point(3) * k1 * v,
    ]


def certify(row, r, exp_upper, lower, curvature=4):
    ell, beta = [row_interval(row[key]) for key in ("l", "beta")]
    c = point(-1) * row_interval(row["bA"])
    d = point(-1) * row_interval(row["bB"]) * INV_SQRT2
    j0, k1, j1 = point(1) - c, c + d, c - d
    require(j0.lo > 0 and j1.lo > 0 and d.lo >= 0, "ellipse axes")
    initial = [coefficients(ell, beta, j0, k1, a)[0] for a in (-ETA, ETA)]
    refined = [coefficients(ell, beta, j0, k1, a) for a in (lower, ETA)]
    require(r >= 8 and (r * N).denominator == 1, "finite check cutoff")
    for n in range(int(r * N)):
        t = Interval(Q(n, N), Q(n + 1, N))
        if n < 8 * N:
            require(all(polynomial(t, g).lo > 0 for g in initial), "initial g positivity")
        # Both g and H are affine in the real amplitude; lower bounds at the endpoints suffice.
        g_min = min(polynomial(t, g).lo for g, _ in refined)
        h_min = min(polynomial(t, h).lo for _, h in refined)
        require(g_min > 0 and h_min > 0, f"monotone radial coordinate at T={t.lo}")
        k_max = (j0 + k1 * t).hi
        j_min = (j0 + j1 * t).lo
        p = polynomial(t, [point(6), point(-6), point(1)])
        p_abs = max(abs(p.lo), abs(p.hi))
        # p_abs is for sqrt(12)*p. M bounds pi times the pushed density.
        m = exp_upper[n] * t.hi * p_abs**2 * k_max**3 / (12 * j_min * g_min * h_min)
        require(4 * m <= curvature**2 * j0.lo, f"curvature certificate at T={t.lo}")
    return tail_upper(r, exp_upper)**2 / (1 / ETA - curvature)


def expect_rejection(function, reason):
    try:
        function()
    except Rejected as error:
        require(reason in str(error), f"unexpected negative control: {error}")
        return
    raise Rejected(f"negative control should fail: {reason}")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, default=Path.cwd())
    root = parser.parse_args().root
    for d, interval in ((12, INV_SQRT12), (2, INV_SQRT2)):
        require(d * interval.lo**2 < 1 < d * interval.hi**2, "square-root enclosure")
    data = root / DATA
    rows = [json.loads(line, parse_float=Q) for line in (data / "rows5.lines").read_text().splitlines() if line.strip()]
    rows.append(json.loads((data / "profiles_low/band_row_0.70.json").read_text(), parse_float=Q)["row"])
    by_tag = {row["t"]: row for row in rows}
    require(len(rows) == len(by_tag) == len(LIMITS), "duplicate or missing rows")
    require(set(by_tag) == {Q(tag) for tag, _, _ in LIMITS}, "wrong tag set")
    exp_upper = exp_upper_grid()
    lower = optimizer_lower_bound(exp_upper)
    print("row       R   upper allowance in units of 10^-12")
    for tag, twice_r, upper_units in LIMITS + [("D*.790", 30, 430)]:
        row = DESIGN_079 if tag == "D*.790" else by_tag[Q(tag)]
        r = Q(twice_r, 2)
        cost = certify(row, r, exp_upper, lower)
        require(cost < Q(upper_units, 10**12), f"tail allowance on {tag}")
        print(f"{tag:7s} {str(r):>4s}   {upper_units}")
    first = by_tag[Q("0.70")]
    expect_rejection(lambda: certify(first, Q(23, 2), exp_upper, lower, curvature=1),
                     "curvature certificate")
    # Taking an arbitrarily large cutoff across the radial fold breaks the proof's change of variable.
    expect_rejection(lambda: certify(first, Q(14), exp_upper, lower, curvature=10**9),
                     "monotone radial coordinate")
    require(certify(first, Q(23, 2), exp_upper, lower) > Q(1, 10**7), "negative control: claimed 10^-7 allowance")
    print("All rational bounds and three negative controls passed.")


if __name__ == "__main__":
    main()
