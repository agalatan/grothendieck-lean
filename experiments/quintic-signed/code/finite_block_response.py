"""Replay a finite five-block phase response at central amplitudes. Agent-ID: codex-a7c4."""

from fractions import Fraction as Q
from math import factorial

SCALE = 10**14
DY = 100
DS = 300
MAX_Y = 16 * DY
MAX_S = 5 * DS


def need(ok, what):
    if not ok:
        raise ValueError(what)


def floorq(z):
    return z.numerator // z.denominator


def mass_table():
    # Lower bounds for integral e^-y y^b dy on each bin.
    # One-step alternating series at 1/DY, then outward interval powers.
    low = sum((-Q(1, DY)) ** k / factorial(k) for k in range(8))
    high = low + Q(1, DY) ** 8 / factorial(8)
    lo_step, hi_step = floorq(low * SCALE), -floorq(-high * SCALE)
    exp_lo, exp_hi = SCALE, SCALE
    mass = []
    for j in range(MAX_Y):
        next_lo = exp_lo * lo_step // SCALE
        next_hi = (exp_hi * hi_step + SCALE - 1) // SCALE
        # Gamma integer survival e^-y sum_{k≤b} b!/k! y^k
        y, z = Q(j, DY), Q(j + 1, DY)
        pol = lambda x: (Q(1), 1 + x, 2 + 2 * x + x * x)
        mass.append(
            tuple(
                max(0, floorq(a * exp_lo - b * next_hi)) for a, b in zip(pol(y), pol(z))
            )
        )
        exp_lo, exp_hi = next_lo, next_hi
    return mass


def bounds():
    mass = mass_table()
    # Inner conditional moments E[X^j Y^j e^-s²XY]=j! E[Y^j/(1+s²Y)^(j+1)]
    # All integrals below are lower bounded and all four missing tails positive.
    g = m = o = v = 0
    base = DS * DS * DY
    q2, q3 = base**2, base**3
    for i in range(1, MAX_S + 1):
        f0 = f1 = f2 = 0
        den = base
        step = i * i
        for m0, m1, m2 in mass:
            den += step
            f0 += m0 * base // den
            f1 += m1 * q2 // (den * den)
            f2 += 2 * m2 * q3 // (den * den * den)
        f04 = f0**4
        lo = i - 1
        g += f1 * f04
        m += lo**2 * f2 * f04
        o += lo**2 * f1 * f1 * f0**3
        v += lo**3 * f2 * f04
    # Exact 1/sqrt(pi) lower bound.
    inv = Q(5641895835, 10**10)
    need(inv**2 * Q(3141592654, 10**9) < 1, "inverse pi upper check")
    norm = SCALE**5
    return (
        2 * inv * Q(g, DS * norm),
        4 * inv * Q(m, DS**3 * norm),
        4 * inv * Q(o, DS**3 * norm),
        2 * Q(v, DS**4 * norm),
    )


def main():
    g, m, o, v = bounds()
    print(
        "lower numerators for g, m, o, v at denominator 10^8:",
        *(floorq(z * 10**8) for z in (g, m, o, v))
    )
    n = 5
    lo_pi, hi_pi = Q("3.141592653"), Q("3.141592654")
    t0, t1 = Q(".83743"), Q(".837445")
    lx, hx = 4 * t0 * t0 / hi_pi, 4 * t1 * t1 / lo_pi
    lp, hp = 1 - hx, 1 - lx
    e = n * m * m + 2 * n * (n - 1) * o * o
    # E z_i²≤1/n, so (1/n−E z_i²)^2 decreases as E z_i² increases.
    need(0 < v < Q(1, n), "occupancy moment range")
    D = 2 * n * Q(n, n - 1) * (Q(1, n) - v) ** 2
    bound = -(lo_pi * lp / 16 + lo_pi * lp**3 / 32) * e
    bound -= 3 * lo_pi * lx * lx * lp * n * g * g / 32
    bound += hi_pi * hx * hp * hp * D / 16
    bound += 3 * hi_pi * (hx**5 + 6 * hx**3 * hp * hp / n + 3 * hx * hp**4) / 256
    print("Delta5 <", -floorq(-bound * 10**9), "/10^9")
    need(bound < Q("-.00641078"), "strict fifth violation on the closed box")
    need(e / 4 > Q(".07366"), "ambient fifth content of a standard Gaussian copy")
    need(
        bound + lo_pi * lp * e / 16 > -Q(".00564"), "deleting the ambient quintic debit"
    )
    print(
        "normalized Gaussian driver fifth energy > .07366; deleting it loses the sign bound"
    )
    # Bessel: the degree-two and degree-four squared contents of the unit
    # vector U are n*g_true² and E2_true/4, respectively.
    gaplo = lo_pi * lp * e / 16
    gaphi = hi_pi * hp * (1 - n * g * g) / 4
    extra = (Q(191, 250) + Q(47, 2000)) * (gaplo + lo_pi * lx * lp * lp / (16 * n))
    print("g0 bounds", floorq(gaplo * 10**6), -floorq(-gaphi * 10**6), "millionths")
    print("base payoff below ideal by >", floorq(extra * 10**6), "millionths")
    need(
        gaplo > Q(".006194") and gaphi < Q(".011201") and extra > Q(".005194"),
        "actual separation and real-payoff control",
    )


if __name__ == "__main__":
    main()
