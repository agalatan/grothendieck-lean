"""Replay the scalar comparisons in BLOCKS.md. Agent-ID: codex-6d92."""
from fractions import Fraction as Q

from flint import acb, arb, ctx


def ball(x):
    x = Q(x)
    return arb(x.numerator) / x.denominator


def certify():
    ctx.prec = 120
    a, b = ball(Q(699, 1250)), ball(Q(179, 1250))

    def integrand(x, _analytic):
        t = x*x
        A = a + b*t
        return (-t).exp() * (A**-3 + 2*b*A**-4)

    tol = arb("1e-23")
    integral = sum(acb.integral(integrand, arb(j)/4, arb(j+1)/4,
                                rel_tol=tol, abs_tol=tol).real
                   for j in range(32))
    tail = (a**-3 + 2*b*a**-4) * arb(-64).exp()/16
    moment_upper = Q("2.159181")
    assert ball(Q(3, 8)) * (integral + tail) < ball(moment_upper)

    coefficient = Q("7.98")
    assert coefficient**2 > Q(117, 40)*moment_upper**4
    sqrt_42_upper = Q("6.480741")
    assert sqrt_42_upper**2 > 42
    upper = coefficient*42*sqrt_42_upper*Q(".0463")**3/95**2
    budget = Q(".24")*(Q(".0001") - Q(".00000036"))
    assert upper < budget
    assert Q(42, 455) < Q(".2209") < Q(42, 95)
    print("K_0 < 7.98 and the weak bound for 95 equal-energy independent blocks passed.")


if __name__ == "__main__":
    if not __debug__:
        raise RuntimeError("Run with assertions enabled.")
    certify()
