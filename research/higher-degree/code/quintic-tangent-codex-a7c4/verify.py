#!/usr/bin/env python3
"""Verify both endpoint rows and the quintic stability constants. Agent-ID: codex-a7c4."""
import json
from fractions import Fraction as Q
from itertools import product
from math import comb, factorial, isqrt
from pathlib import Path


EPS = Q(39, 50)
ETA = Q(779, 10000)
TARGET = Q(500, 701)
QUINTIC = tuple(product(range(4), range(3)))
CUBIC = tuple(product(range(3), range(2)))


def require(condition, message):
    if not condition:
        raise ArithmeticError(message)


def atan_bounds(n):
    x = Q(1, n)
    lower = sum((-1)**k * x**(2*k+1) / (2*k+1) for k in range(16))
    return lower, lower + x**33 / 33


def mu_bounds():
    # Machin's identity and alternating arctangent series.
    a_lo, a_hi = atan_bounds(5)
    b_lo, b_hi = atan_bounds(239)
    pi_lo, pi_hi = 16*a_lo - 4*b_hi, 16*a_hi - 4*b_lo
    scale = 10**18
    lo = Q(isqrt(int(pi_lo * scale**2 / 4)), scale)
    hi = Q(1 + isqrt(int(pi_hi * scale**2 / 4)), scale)
    require(4 * lo**2 < pi_lo < pi_hi < 4 * hi**2, "directed bounds for mu")
    return lo, hi


def wick_moment(a, b, shift=0):
    """E[|e_ab|^2 T^(shift-1/2)] / sqrt(pi) by Wick expansion."""
    coeff = [(-1)**k * comb(a, k) * comb(b, k) * factorial(k)
             for k in range(min(a, b) + 1)]
    moment = Q(0)
    for k, ck in enumerate(coeff):
        for j, cj in enumerate(coeff):
            n = a + b - k - j + shift
            moment += ck * cj * Q(factorial(2*n), 4**n * factorial(n))
    return moment / (factorial(a) * factorial(b))


def check_stability(mu_lo, mu_hi):
    rows_path = Path(__file__).resolve().parents[1] / "degree5-attack" / "rows2b.json"
    rows = json.loads(rows_path.read_text(), parse_float=Q)["rows"]
    floors = {}
    a_lo, a_hi = ETA * mu_lo / 16, ETA * mu_hi / 16
    for row in rows:
        ell, beta, _, _ = map(Q, row["row"].split(","))
        b_lo = beta - 6 * a_hi
        c_lo = ell - 2*beta + 6*a_lo
        floors[Q(row["t"])] = c_lo - min(0, b_lo)**2 / (4*a_lo)
    require(len(rows) == len(floors) == 29 and min(floors.values()) > 0, "29 positive floors")
    for start, count, loss in [(Q(".150"), 28, Q("1.59")), (Q(".740"), 18, Q("9.383"))]:
        selected = [m for t, m in floors.items() if t >= start]
        require(len(selected) == count and 1/ETA-2*mu_hi/min(selected) > loss, "full quintic margin")
        print(f"Row labels >= {start}: quintic stability coefficient > {loss}")
    require(1/ETA - 2*mu_hi*wick_moment(3, 2)/min(floors.values()) > Q("6.9"), "visible margin")
    print("All 29 rows: visible scalar stability coefficient > 6.9")


def payoff(t, ell, beta, mu):
    return t*t - 2*ell*t + 2*beta**2/EPS + 2*mu*(ell-beta/2) + 3*ETA*mu**2/64


def check_cutoff(ell, beta, mu_lo, mu_hi, lo, hi, cutoff):
    require(ell > mu_hi and ell > beta / 2, "payoff decreases in mass and increases in mu")
    require(payoff(hi, ell, beta, mu_hi) < TARGET < payoff(lo, ell, beta, mu_lo),
            "strict bracket on the lower crossing of the parabola")
    require(hi < cutoff < mu_lo and payoff(cutoff, ell, beta, mu_hi) < TARGET,
            "strict endpoint bound")
    require(payoff(cutoff-Q(1, 10**8), ell, beta, mu_lo) > TARGET,
            "the next lower eight-decimal cutoff fails for this row")
    print(f"At t = {cutoff} and above the row is below 500/701; crossing lies in ({lo}, {hi})")


def check_endpoint(mu_lo, mu_hi):
    ell, beta = Q("1.7"), Q(".17")
    m = ell - 2*beta + 3*ETA*mu_lo/8
    require(beta > 3*ETA*mu_hi/8 and 2*mu_hi/m < 1/EPS < 1/ETA, "plain tangent absorption")
    check_cutoff(ell, beta, mu_lo, mu_hi, Q(".885271027903"), Q(".885271027904"), Q(".88527103"))

    ell, beta = Q("1.42852"), Q(".172")
    m, d = ell-2*beta+3*ETA*mu_lo/8, beta-3*ETA*mu_hi/8
    require(m > 0 and d > 0, "positive affine minorant for the split row")
    diagonal = {}
    for a, b in QUINTIC:
        w0, w1, w2 = [wick_moment(a, b, n) for n in range(3)]
        diagonal[a, b] = (2*mu_hi/m) * (w0 - d*w1**2 / (m*w1 + d*w2))
    q5 = max(diagonal.values())
    q3 = max(diagonal[ab] * (Q(3, 4) if ab == (0, 0) else 1) for ab in CUBIC)
    share = 3*EPS / (3*EPS + 4*ETA)
    require(q5 == diagonal[0, 0] and q3 == 3*q5/4, "largest certified coefficients")
    require(q5 < Q("1.508511") and q3 < Q("1.131384"), "published moment bounds")
    require(q5/(1-share) < 1/ETA and q3/share < 1/EPS, "simultaneous absorption")
    require(q5/share > 1/EPS, "the isotropic cubic estimate fails at this split")
    check_cutoff(ell, beta, mu_lo, mu_hi, Q(".884776432209"), Q(".884776432210"), Q(".88477644"))


if __name__ == "__main__":
    table = [[wick_moment(a, b) for b in range(3)] for a in range(4)]
    expected = [["1", "1/2", "3/8"], ["1/2", "3/4", "7/16"],
                ["3/8", "7/16", "41/64"], ["5/16", "11/32", "51/128"]]
    require(table == [[Q(x) for x in row] for row in expected], "Wick moment table")
    mu_lower, mu_upper = mu_bounds()
    check_stability(mu_lower, mu_upper)
    check_endpoint(mu_lower, mu_upper)
