#!/usr/bin/env python3
"""The Lean rows of the cubic identity-tail witness used as black boxes for the degree-5 game (NOTE.md 6.3).

For every unimodular pair, with x = t^2, A = ||P21 k||^2, K = ||k||^2, r = eps/epsh = 1209/1250:

  (i)   V5 <= r Vhat + (1-r) x + eta (1 - K - x) + 2 r nuh K,       Vhat <= x - 2 l t + C  (a Lean row),
  (ii)  V5 <= (1-eta) x + eta + eps A - eta K,   A <= min(K, rho0^2 - (2/pi) x, (S + c K)/epsh).

The script maximises over K in [0, 1 - x] the smaller of (i) (best Lean row) and (ii), on a grid of t.
Exact rational constants evaluated in floating point (label N for the table; the inequalities are P).
Row constants: research/identity-tail/sources/stage0d-2026-11-17/ROW_CONSTANTS.txt (rounded to 15 digits).
"""
import math

EPS, ETA, TARGET = 39 / 50, 779 / 10000, 500 / 701
EPSH, NUH = 25 / 31, 47 / 1953
R = EPS / EPSH
MASSC = 2 * NUH + 0.5
MASSS = 3798855002922010337121170986221578569 / 22939068096000000000000000000000000000
RHO0 = 2287 / 2500
ROWS = {"mass": None, "0.4": (0.392675571152245, 0.843921214659141), "0.6": (0.550619106549122, 0.994714310877014),
        "0.7": (0.647543270886421, 1.117229083406640)}


def vhat(t):
    out = {}
    for name, c in ROWS.items():
        out[name] = 0.5 * t * t + 0.5 + MASSS if c is None else t * t - 2 * c[0] * t + c[1]
    return out


print("t     best Lean row (hat bound)   (ii) alone   max_K min((i),(ii))   minus 500/701   at K")
for i in range(25, 66, 2):
    t = i / 100
    x = t * t
    name, vh = min(vhat(t).items(), key=lambda kv: kv[1])
    best, kbest = -1, None
    only2 = -1
    for j in range(0, 10001):
        K = (1 - x) * j / 10000
        A = min(K, RHO0 ** 2 - 2 / math.pi * x, (MASSS + MASSC * K) / EPSH)
        v2 = (1 - ETA) * x + ETA + EPS * A - ETA * K
        v1 = R * vh + (1 - R) * x + ETA * (1 - K - x) + 2 * R * NUH * K
        only2 = max(only2, v2)
        if min(v1, v2) > best:
            best, kbest = min(v1, v2), K
    print("%.2f  %-5s %.5f   %.5f   %.5f   %+.5f   %.3f" % (t, name, vh, only2, best, best - TARGET, kbest))
