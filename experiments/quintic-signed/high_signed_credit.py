"""Exact high-amplitude signed fifth-energy arithmetic. Agent-ID: codex-a7c4."""
from fractions import Fraction as Q
from math import factorial


def check(t, cutoff, a, r, exp_denominator, claim):
    # Archimedean pi enclosure suffices for both the pure-phase norm and mean.
    mu = Q(886227, 10**6)
    if 4*mu**2 < Q(355, 113) or not (0 < t <= mu and cutoff >= 6 and a > 0 and r > 0):
        raise ValueError("invalid Gaussian mean or clipping parameters")
    # Positive Taylor terms give exp(cutoff) >= exp_denominator.
    exp_floor = sum(Q(cutoff**j, factorial(j)) for j in range(61))
    if exp_floor < exp_denominator:
        raise ArithmeticError("exponential tail enclosure failed")
    gap = mu-t
    laguerre = 3-3*cutoff+Q(cutoff**2,2)
    tail = Q(1,exp_denominator)*((cutoff+a*a)*(cutoff-2)+2*cutoff-3)/(2*a)
    half_difference = 2*gap/r+r*r/6
    delta = 3*Q(333,106)/256 - mu/4*(laguerre*gap+2*tail) - half_difference
    if delta <= claim:
        raise ArithmeticError(f"signed fifth credit {claim} failed")
    print(f"t >= {t}: signed fifth > {claim} (rational lower {delta})")


if __name__ == "__main__":
    check(Q(".885868"), 10, Q(3), Q(".129"), 22000, Q(".026"))
    check(Q(".886176"), 12, Q(7,2), Q(".067"), 162700, Q(".034"))
