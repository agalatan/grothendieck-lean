#!/usr/bin/env python3
"""Exact rational replay of the lifted-radius bound for the capped degree-5 game (issue #628).

Statements checked (NOTE.md, sections 2 and 3; all arithmetic in fractions.Fraction):

 (A) From  (2/pi) t^2 + ||P21 k||^2 <= rho0^2  (Theorem A) and  V <= (1-eta) t^2 + eta + (eps-eta) ||P21 k||^2:
        V <= cA2 t^2 + cA0,   cA2 = 1 - eta - (2/pi)(eps - eta),   cA0 = eta + (eps - eta) rho0^2.
 (B) With, in addition, the Lean mass fact  epsh ||P21 k||^2 - c ||k||^2 <= S
     (epsh = 25/31, c = massC, S = massS of Grothe/Lower/MassNodes.lean):
        V <= cB2 t^2 + cB0,   cB2 = 1 - eta - (2/pi) kB,  cB0 = eta (1 + S/c) + kB rho0^2,  kB = eps - eta epsh/c.

pi is bracketed by 333/106 < pi < 355/113 (checked below by the Machin series).  For each radius the
script proves V < 500/701 for all t in [0, t_max] and shows that the same comparison fails at
t_max + 1/10000 (negative control: there the bound, evaluated with the bracket in the other
direction, exceeds the target).  Run:  python3 -I -O verify_lift_bound.py
"""
from fractions import Fraction as F


def require(cond, what=""):
    if not cond:
        raise SystemExit("CHECK FAILED: %s" % (what,))

EPS, ETA = F(39, 50), F(779, 10000)
TARGET = F(500, 701)
EPSH = F(25, 31)
MASSC = 2 * F(47, 1953) + F(1, 2)
MASSS = F(3798855002922010337121170986221578569, 22939068096000000000000000000000000000)


def atan_inv(n, terms):
    """Partial sums of arctan(1/n): returns (lower, upper) by the alternating series."""
    s, lo, hi = F(0), None, None
    for k in range(terms):
        s += F((-1) ** k, (2 * k + 1) * n ** (2 * k + 1))
        if k % 2 == 0:
            hi = s
        else:
            lo = s
    return lo, hi


a5, a239 = atan_inv(5, 12), atan_inv(239, 6)
PI_LO = 16 * a5[0] - 4 * a239[1]
PI_HI = 16 * a5[1] - 4 * a239[0]
require(F(333, 106) < PI_LO < PI_HI < F(355, 113), 'pi bracket')
TWO_OVER_PI_LO = 2 / F(355, 113)   # 2/pi > 226/355
TWO_OVER_PI_HI = 2 / F(333, 106)   # 2/pi < 212/333


def coeffs(rho0, variant, two_over_pi):
    if variant == "A":
        k = EPS - ETA
        c0 = ETA + k * rho0 ** 2
    else:
        k = EPS - ETA * EPSH / MASSC
        c0 = ETA * (1 + MASSS / MASSC) + k * rho0 ** 2
    require(k > 0, 'k > 0')
    return 1 - ETA - two_over_pi * k, c0


def check(rho0, variant, tmax):
    # upper bound of the bound: the coefficient of t^2 is largest for the smallest 2/pi
    c2, c0 = coeffs(rho0, variant, TWO_OVER_PI_LO)
    require(c2 > 0, 'c2 > 0')
    slack = TARGET - (c2 * tmax ** 2 + c0)
    require(slack > 0, ('slack', variant, rho0, tmax))
    # negative control: lower bound of the bound at tmax + 1/10000
    c2l, c0l = coeffs(rho0, variant, TWO_OVER_PI_HI)
    t1 = tmax + F(1, 10000)
    require(c2l * t1 ** 2 + c0l > TARGET, ('control', variant, rho0, tmax))
    return c2, c0, slack


print("pi bracket: 333/106 < pi < 355/113 (Machin series)")
print("Lean mass fact: epsh = %s, c = %s = %.6f, S = %.12f" % (EPSH, MASSC, float(MASSC), float(MASSS)))
# the mass fact improves on ||k||^2 >= ||P21 k||^2 exactly when ||P21 k||^2 >= S/(epsh - c)
print("the mass fact beats K >= A for A >= S/(epsh - c) = %.6f" % float(MASSS / (EPSH - MASSC)))
rows = [(F(2287, 2500), "A", F(3172, 10000)), (F(4571, 5000), "A", F(3197, 10000)),
        (F(2287, 2500), "B", F(3321, 10000)), (F(4571, 5000), "B", F(3343, 10000))]
for rho0, variant, tmax in rows:
    c2, c0, slack = check(rho0, variant, tmax)
    print("(%s) rho0 = %s: V <= %.6f t^2 + %.6f < 500/701 for t <= %s (slack %.3e); fails at t = %s"
          % (variant, rho0, float(c2), float(c0), float(tmax), float(slack), float(tmax + F(1, 10000))))
# (B) is valid for every pair; it is the better of the two exactly when the cap on A is >= S/(epsh - c).
# On [0, tmax] of the rows (B) that is the case:
for rho0, variant, tmax in rows[2:]:
    require(rho0 ** 2 - TWO_OVER_PI_HI * tmax ** 2 >= MASSS / (EPSH - MASSC), '(B) better than (A) on its range')
# hypothetical radii (not proved): what the same formulas would give
for name, r2 in (("pi/4 (conjectured sharp radius, upper bracket)", PI_HI / 4),):
    for variant in "AB":
        c2, c0 = coeffs(F(1), variant, TWO_OVER_PI_LO)
        k = (EPS - ETA) if variant == "A" else EPS - ETA * EPSH / MASSC
        c0 = c0 - k + k * r2
        print("(%s) with rho0^2 = %s: reach t^2 <= %.6f, t <= %.4f (not a theorem)"
              % (variant, name, float((TARGET - c0) / c2), float((TARGET - c0) / c2) ** 0.5))
# negative control on the target: at t = 0.30 the bound (A) is above 0.70
c2, c0 = coeffs(F(2287, 2500), "A", TWO_OVER_PI_HI)
require(c2 * F(3, 10) ** 2 + c0 > F(7, 10), 'control 0.70')
# Codex's 130-coordinate pairs (ledger 4.40): ||P21 k||^2 = (27/100)^2/eps^2, t in [1/4, 5/12]
A_codex = F(27, 100) ** 2 / EPS ** 2
require(TWO_OVER_PI_HI * F(5, 12) ** 2 + A_codex < F(2287, 2500) ** 2, 'codex pairs')
print("Codex pairs of 4.40: (2/pi) t^2 + A <= %.4f < rho0^2 = %.4f on [1/4, 5/12]"
      % (float(TWO_OVER_PI_HI * F(5, 12) ** 2 + A_codex), float(F(2287, 2500) ** 2)))
# What the same two formulas would give with other constants (floating point, NOT theorems):
#   c0^2 t^2 + ||P21 k||^2 <= r^2   with (c0^2, r):
import math
print("reach of V <= (1-eta) t^2 + eta + (eps-eta) A [A] and of the mass-fact variant [B], A <= r^2 - c0^2 t^2 (float;")
print("both are valid, the larger reach counts):")
for cname, c02 in (("2/pi (Theorem A)", 2 / math.pi), ("(43/50)^2 (elliptic lift, N)", 0.86 ** 2), ("1 (problem P7)", 1.0)):
    for rname, r2 in (("2287/2500", (2287 / 2500) ** 2), ("4571/5000", (4571 / 5000) ** 2), ("sqrt(pi)/2", math.pi / 4)):
        out = []
        for variant in "AB":
            k = float(EPS - ETA) if variant == "A" else float(EPS - ETA * EPSH / MASSC)
            c0 = float(ETA) + k * r2 if variant == "A" else float(ETA * (1 + MASSS / MASSC)) + k * r2
            c2 = 1 - float(ETA) - c02 * k
            x = (float(TARGET) - c0) / c2
            out.append("%s: t <= %.4f" % (variant, math.sqrt(x)))
        print("  c0^2 = %-30s r = %-10s %s" % (cname, rname, "; ".join(out)))
print("thresholds for problem P7: V < 500/701 at t needs rho_s^2 <= (500/701 - eta - (1-eps) t^2)/(eps - eta):")
print("  " + ", ".join("t = %.4f: rho_s <= %.4f" % (t, math.sqrt((float(TARGET) - float(ETA) - (1 - float(EPS)) * t * t) / float(EPS - ETA)))
                       for t in (0.2528, 0.3, 0.3321, 0.4, 0.45, 0.5, 0.55, 0.6, 0.618)))
print("ALL CHECKS PASSED")
