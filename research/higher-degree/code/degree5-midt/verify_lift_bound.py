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
direction, exceeds the target).  The same is then done for every other interval that the note, problem
P7 and the ledger rows state (thresholds on t rounded downward, radii rounded downward, each with a
control one step further); the lines marked "NOT proved" are implications from a constant that is not
proved here.  Run:  python3 -I -O verify_lift_bound.py
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
# negative control on the target: at t = 0.30 the bound (A) is above 0.70
c2, c0 = coeffs(F(2287, 2500), "A", TWO_OVER_PI_HI)
require(c2 * F(3, 10) ** 2 + c0 > F(7, 10), 'control 0.70')
# Codex's 130-coordinate pairs (ledger 4.40): ||P21 k||^2 = (27/100)^2/eps^2, t in [1/4, 5/12]
A_codex = F(27, 100) ** 2 / EPS ** 2
require(TWO_OVER_PI_HI * F(5, 12) ** 2 + A_codex < F(2304, 10000) < F(8368, 10000) < F(2287, 2500) ** 2, 'codex pairs')
require(F(5, 12) ** 2 + A_codex < F(2935, 10000) < PI_LO / 4, 'codex pairs, coefficient 1')
print("Codex pairs of 4.40 on [1/4, 5/12]: (2/pi) t^2 + A < 0.2304 < 0.8368 < rho0^2;  t^2 + A < 0.2935 < pi/4")
# ---- every further interval that NOTE.md, P7 and the ledger rows state, with a control just beyond ----
# General form:  c0sq t^2 + A <= r2  and (A) or (B) give  V <= (1 - eta - c0sq k) t^2 + const + k r2.
# Each quantity is an interval (lo, hi); pi enters through the Machin bracket [PI_LO, PI_HI].
STEP = F(1, 10000)
PT = lambda q: (q, q)
TWO_OVER_PI = (2 / PI_HI, 2 / PI_LO)
PI_OVER_4 = (PI_LO / 4, PI_HI / 4)


def bound(c0sq, r2, variant, t):
    """(lower, upper) value at t of the bound with spike coefficient c0sq and squared radius r2."""
    if variant == "A":
        k, const = EPS - ETA, ETA
    else:
        k, const = EPS - ETA * EPSH / MASSC, ETA * (1 + MASSS / MASSC)
    require(k > 0 and 1 - ETA - c0sq[1] * k > 0, 'signs')
    return ((1 - ETA - c0sq[1] * k) * t * t + const + k * r2[0],
            (1 - ETA - c0sq[0] * k) * t * t + const + k * r2[1])


def interval(label, c0sq, r2, variant, tmax, step=STEP):
    """V-bound < 500/701 on [0, tmax] (it increases in t) and > 500/701 at tmax + step."""
    require(bound(c0sq, r2, variant, tmax)[1] < TARGET, ('interval', label, tmax))
    require(bound(c0sq, r2, variant, tmax + step)[0] > TARGET, ('control', label, tmax))
    print("  %-58s t <= %s holds; fails at %s" % (label, float(tmax), float(tmax + step)))


R1, R2 = PT(F(2287, 2500) ** 2), PT(F(4571, 5000) ** 2)
print("exact intervals (upper bracket below 500/701 at the endpoint, lower bracket above it one step further):")
# the four rows above once more through the general form (Machin bracket of pi)
interval("(A) 2/pi, rho0 = 2287/2500", TWO_OVER_PI, R1, "A", F(3172, 10000))
interval("(A) 2/pi, rho0 = 4571/5000", TWO_OVER_PI, R2, "A", F(3197, 10000))
interval("(B) 2/pi, rho0 = 2287/2500", TWO_OVER_PI, R1, "B", F(3321, 10000))
interval("(B) 2/pi, rho0 = 4571/5000", TWO_OVER_PI, R2, "B", F(3343, 10000))
print("the same with constants that are NOT proved here (each line: IF the constant holds THEN the interval):")
interval("(A) 2/pi, rho0^2 = pi/4 (conjectured radius)", TWO_OVER_PI, PI_OVER_4, "A", F(4203, 10000))
interval("(B) 2/pi, rho0^2 = pi/4 (conjectured radius)", TWO_OVER_PI, PI_OVER_4, "B", F(4230, 10000))
C43 = PT(F(43, 50) ** 2)
interval("(A) c0 = 43/50 (section 3, N), rho0 = 2287/2500", C43, R1, "A", F(3445, 10000))
interval("(B) c0 = 43/50 (section 3, N), rho0 = 2287/2500", C43, R1, "B", F(3576, 10000))
interval("(A) c0 = 43/50 (section 3, N), rho0 = 4571/5000", C43, R2, "A", F(3472, 10000))
interval("(B) c0 = 43/50 (section 3, N), rho0 = 4571/5000", C43, R2, "B", F(3600, 10000))
interval("(B) c0^2 = pi/4 (limit of Gaussian lifts), 2287/2500", PI_OVER_4, R1, "B", F(3710, 10000))
ONE = PT(F(1))
interval("(4.1): rho_s <= 2287/2500 (problem P7)", ONE, R1, "A", F(4661, 10000))
interval("(4.1): rho_s <= 2287/2500, eight decimals", ONE, R1, "A", F(46616437, 10 ** 8), F(1, 10 ** 8))
interval("(4.1): rho_s = sqrt(pi)/2 (conjecture)", ONE, PI_OVER_4, "A", F(6176, 10000))
# the radius that (4.1) needs at a given t, rounded downward to four decimals
print("(4.1) at t holds if rho_s <= r1 and fails for rho_s = r1 + 1/10000:")
for t, r1 in ((F(2528, 10000), F(9407, 10000)), (F(3, 10), F(9363, 10000)), (F(3321, 10000), F(9329, 10000)),
              (F(2, 5), F(9245, 10000)), (F(1, 2), F(9091, 10000)), (F(11, 20), F(9000, 10000)),
              (F(3, 5), F(8900, 10000))):
    require(bound(ONE, PT(r1 ** 2), "A", t)[1] < TARGET, ('P7 radius', t, r1))
    require(bound(ONE, PT((r1 + STEP) ** 2), "A", t)[0] > TARGET, ('P7 radius control', t, r1))
    print("  t = %-7s r1 = %s" % (float(t), float(r1)))
# section 6.2: the unsymmetrised radius is at least sqrt(9 pi/32), and (4.1) with that value ends before 0.2613
U2 = (9 * PI_LO / 32, 9 * PI_HI / 32)
require(F(93998, 100000) ** 2 < U2[0] and U2[1] < F(93999, 100000) ** 2, 'sqrt(9 pi/32)')
interval("(4.1) with r1^2 = 9 pi/32 (unsymmetrised lower bound)", ONE, U2, "A", F(2612, 10000))
print("  0.93998 < sqrt(9 pi/32) < 0.93999")
# section 1: the formula of ledger 4.18(a), without the saving 9/10000, at the conjectured radius
def direct_a(t, pi_lo, pi_hi):
    return ((1 - ETA) * t * t + EPS * pi_lo / 4 + ETA ** 2 / (pi_hi * EPS),
            (1 - ETA) * t * t + EPS * pi_hi / 4 + ETA ** 2 / (pi_lo * EPS))
require(direct_a(F(3263, 10000), PI_LO, PI_HI)[1] < TARGET < direct_a(F(3264, 10000), PI_LO, PI_HI)[0], '4.18(a) at pi/4')
print("  4.18(a) formula with rho0^2 = pi/4: t <= 0.3263 holds; fails at 0.3264")
# section 2.2: the mass fact beats K >= A from A = S/(epsh - c) on
require(F(64108, 100000) < MASSS / (EPSH - MASSC) < F(6411, 10000), '0.6411')
# section 6.3: hat bounds needed with the hat tail eta/(2r), r = 1209/1250, rounded downward
RR = F(1209, 1250)
for t, need in ((F(7, 20), F(6626, 10000)), (F(2, 5), F(6643, 10000)), (F(1, 2), F(6685, 10000)),
                (F(3, 5), F(6737, 10000)), (F(13, 20), F(6766, 10000))):
    exact = (TARGET - ETA - (1 - RR - ETA) * t * t) / RR
    require(need <= exact < need + STEP, ('hat bound', t))
print("  hat bounds of section 6.3: 0.6626, 0.6643, 0.6685, 0.6737, 0.6766 at t = 0.35, 0.4, 0.5, 0.6, 0.65 (rounded downward)")
# section 7: margins to 500/701, rounded downward
for label, c0sq, r2, variant, t, m in (
        ("(A) 2287/2500", TWO_OVER_PI, R1, "A", F(1, 4), F(181, 10000)),
        ("(B) 2287/2500", TWO_OVER_PI, R1, "B", F(1, 4), F(238, 10000)),
        ("(4.1) sqrt(pi)/2", ONE, PI_OVER_4, "A", F(1, 4), F(701, 10000)),
        ("(4.1) sqrt(pi)/2", ONE, PI_OVER_4, "A", F(2, 5), F(487, 10000)),
        ("(4.1) sqrt(pi)/2", ONE, PI_OVER_4, "A", F(1, 2), F(289, 10000)),
        ("(4.1) sqrt(pi)/2", ONE, PI_OVER_4, "A", F(3, 5), F(47, 10000)),
        ("(4.1) 2287/2500", ONE, R1, "A", F(1, 4), F(340, 10000)),
        ("(4.1) 2287/2500", ONE, R1, "A", F(2, 5), F(126, 10000))):
    lo, hi = bound(c0sq, r2, variant, t)
    require(m <= TARGET - hi and TARGET - lo < m + STEP, ('margin', label, t))
require(F(7414, 10000) < bound(TWO_OVER_PI, R1, "A", F(2, 5))[0] and bound(TWO_OVER_PI, R1, "A", F(2, 5))[1] < F(7415, 10000), '(A) at 0.4')
require(F(514, 10000) < R1[0] - PI_HI / 4 and R1[0] - PI_LO / 4 < F(515, 10000), 'driver margin')
print("  margins of section 7 (rounded downward): checked")
# What the same two formulas would give with other constants (floating point, NOT theorems):
#   c0^2 t^2 + ||P21 k||^2 <= r^2   with (c0^2, r):
import math
print("reach of V <= (1-eta) t^2 + eta + (eps-eta) A [A] and of the mass-fact variant [B], A <= r^2 - c0^2 t^2")
print("(floating point, truncated to four decimals; a survey, the exact intervals are those above):")
for cname, c02 in (("2/pi (Theorem A)", 2 / math.pi), ("(43/50)^2 (elliptic lift, N)", 0.86 ** 2), ("1 (problem P7)", 1.0)):
    for rname, r2 in (("2287/2500", (2287 / 2500) ** 2), ("4571/5000", (4571 / 5000) ** 2), ("sqrt(pi)/2", math.pi / 4)):
        out = []
        for variant in "AB":
            k = float(EPS - ETA) if variant == "A" else float(EPS - ETA * EPSH / MASSC)
            c0 = float(ETA) + k * r2 if variant == "A" else float(ETA * (1 + MASSS / MASSC)) + k * r2
            c2 = 1 - float(ETA) - c02 * k
            x = (float(TARGET) - c0) / c2
            out.append("%s: t <= %.4f" % (variant, math.floor(math.sqrt(x) * 1e4) / 1e4))
        print("  c0^2 = %-30s r = %-10s %s" % (cname, rname, "; ".join(out)))
print("thresholds for problem P7: V < 500/701 at t needs rho_s^2 <= (500/701 - eta - (1-eps) t^2)/(eps - eta):")
print("  " + ", ".join("t = %.4f: rho_s <= %.4f" % (t, math.floor(1e4 * math.sqrt((float(TARGET) - float(ETA) - (1 - float(EPS)) * t * t) / float(EPS - ETA))) / 1e4)
                       for t in (0.2528, 0.3, 0.3321, 0.4, 0.45, 0.5, 0.55, 0.6)) + "  (float, truncated)")
print("ALL CHECKS PASSED")
