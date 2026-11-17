#!/usr/bin/env python3
"""Directed certificate for the second-order Stein influence bound.

Agent-ID: codex-6d92.
"""

from fractions import Fraction as Q
from functools import lru_cache

from flint import arb, ctx, fmpq


def ball(value):
    value = Q(value)
    return arb(fmpq(value.numerator, value.denominator))


def certify_kernels(pi):
    sqrt2 = arb(2).sqrt()
    normalizer = (pi/2).sqrt()
    offset, slope = ball("0.579"), ball("0.2778")
    constant, linear, quadratic = map(ball, ("1.57085", "2.591", "1.0687"))
    tilt = ball("0.2")

    @lru_cache(maxsize=None)
    def kernel(t):
        x = ball(t)
        mills = normalizer * (x*x/2).exp() * (x/sqrt2).erfc()
        return (1+x*x)*mills-x

    leaves = 0
    todo = [(Q(0), Q(8), 0)]
    while todo:
        lower, upper, depth = todo.pop()
        x = ball(lower).union(ball(upper))
        # b(x) is decreasing by its positive Laplace integral.
        b = kernel(lower).union(kernel(upper))
        gap1 = b - offset + slope*x
        gap2 = constant - linear*x + quadratic*x**2 - (b-tilt*x)**2
        if gap1 > 0 and gap2 > 0:
            leaves += 1
        else:
            assert depth < 24, (lower, upper, gap1, gap2)
            mid = (lower+upper)/2
            todo.extend(((lower, mid, depth+1), (mid, upper, depth+1)))

    # x >= 8: 0 <= b(x) <= 2/x^3 <= tilt*x.
    boundary = arb(8)
    assert 2/boundary**3 < tilt*boundary
    assert offset-slope*boundary < 0
    remaining_quadratic = quadratic-tilt**2
    assert remaining_quadratic > 0
    assert 2*remaining_quadratic*boundary-linear > 0
    assert constant-linear*boundary+remaining_quadratic*boundary**2 > 0
    print(f"PASS Stein kernel inequalities on [0, infinity): {leaves} compact intervals")


def certify_influence(pi):
    target = ball(Q(17, 25)).sqrt()
    gaussian = (2/pi).sqrt()
    alpha = ball("0.579")*target-ball("0.2778")
    beta_sq = ball("1.57085")-ball("2.591")*target+ball("1.0687")
    assert alpha > 0 and beta_sq > 0
    beta = beta_sq.sqrt()
    k = ball(Q(109, 24))
    # The first branch of the contraction bound is concave. Its left
    # derivative at s=36 is positive, so it cannot exceed its endpoint there.
    assert beta*(k-2)/(2*(36*k-36).sqrt()) > alpha/6
    # The second branch is a semicircle with center s=60 and squared
    # radius 287/2 in the variable (s-60)/6.
    budget = ball(Q(287, 2)).sqrt()*(alpha**2+beta_sq).sqrt()-10*alpha
    influence = Q("0.0049067")
    assert budget > 0
    assert gaussian*(1+budget*ball(influence)) < target
    print(f"PASS lambda <= {influence}: second-order Stein bound < sqrt(17/25)")


if __name__ == "__main__":
    if not __debug__:
        raise RuntimeError("Run the certificate with assertions enabled.")
    ctx.prec = 128
    certify_kernels(arb.pi())
    certify_influence(arb.pi())
