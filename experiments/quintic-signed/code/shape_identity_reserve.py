"""A same-response payoff cutoff on every common fourth-excess cell."""

from fractions import Fraction as Q
from math import ceil
from functools import cache
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
from occupied_identity_debit import ALPHA, BETA, NU, C, L, V, EPS, POLY, RATE
from gaussian_quadrature_rice import MU_UP, polynomial, majorant, low_sqrt, require as checked


def sqrt_up(x):
    return low_sqrt(x, 10**12) + Q(1, 10**12)


LIMIT = Q(".713245")
A = 4 * NU * Q("1.883") + BETA * 2 * abs(V) * Q("1.540")


@cache
def shape_data(lo, hi):
    u = sqrt_up(MU_UP**2 * (1 + L * L))
    if hi <= 2:
        pol = polynomial(L, (lo + hi) / 2)
        u = min(u, MU_UP * max(majorant(pol, lo), majorant(pol, hi)))
    ep = max(
        POLY[0] + POLY[1] + POLY[2] * (2 + s) + POLY[3] * (6 + 9 * s + Q("40.45313") * s * sqrt_up(s))
        for s in (lo, hi)
    )
    return u, ep


def feasible_score(t, r, lo, hi):
    u, ep = shape_data(lo, hi)
    D = u - t - L * r
    if D < 0:
        return None
    return ALPHA * t * t + NU + BETA * r * r + ep - RATE * (t + L * r - C) + A * sqrt_up(D)


@cache
def cut(t, lo, hi, rad):
    checked(
        2 * ALPHA < RATE and 2 * BETA < RATE * L and BETA * (1 + 1 / EPS) * Q("5.657") < RATE,
        "payoff decreases with physical amplitudes",
    )
    checked(6 * L**2 <= 1 and POLY[3] > 0 and 0 <= lo <= hi <= 42, "shape and support range")
    den = 10**8
    a, b = 0, ceil(rad * den)

    def sufficient(i):
        value = feasible_score(t, Q(i, den), lo, hi)
        return value is None or value < LIMIT

    if not sufficient(b):
        return rad
    while a + 1 < b:
        m = (a + b) // 2
        if sufficient(m):
            b = m
        else:
            a = m
    return min(rad, Q(b, den))
