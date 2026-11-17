#!/usr/bin/env python3
"""Directed certificate for the orthogonal-complement slice.

Agent-ID: codex-6d92. No approximate polynomial roots are needed.
"""

from fractions import Fraction as Q
from functools import lru_cache

from flint import arb, ctx, fmpq


def ball(x):
    x = Q(x)
    return arb(fmpq(x.numerator, x.denominator))


class GaussianSlice:
    def __init__(self):
        self.inv_sqrt6 = 1/arb(6).sqrt()
        self.sqrt2 = arb(2).sqrt()
        self.phi0 = 1/(2*arb.pi()).sqrt()

    @lru_cache(maxsize=None)
    def gaussian(self, t):
        x = ball(t)
        density = self.phi0 * (-x*x/2).exp()
        cdf = (-x/self.sqrt2).erfc()/2
        return density, cdf

    @lru_cache(maxsize=None)
    def upper(self, q, r):
        linear = ball(q) - 3*self.inv_sqrt6
        constant = ball(r)

        def p(x):
            return x*(x*x*self.inv_sqrt6 + linear) + constant

        def deriv(x):
            return 3*x*x*self.inv_sqrt6 + linear

        def primitive(t):
            density, cdf = self.gaussian(t)
            return ((1-ball(t*t))*self.inv_sqrt6-ball(q))*density + constant*cdf

        outer = Q(8)
        assert deriv(ball(outer)) > 0
        assert p(ball(-outer)) < 0 and p(ball(outer)) > 0
        result = constant - primitive(outer) - primitive(-outer)
        todo = [(-outer, outer, 0)]
        while todo:
            lo, hi, depth = todo.pop()
            x = ball(lo).union(ball(hi))
            value = p(x)
            pos, neg = value >= 0, value <= 0
            if not (pos or neg):
                slope = deriv(x)
                if slope > 0 or slope < 0:
                    left, right = p(ball(lo)), p(ball(hi))
                    pos = left >= 0 and right >= 0
                    neg = left <= 0 and right <= 0
            if pos or neg:
                integral = primitive(hi)-primitive(lo)
                result += integral if pos else -integral
            elif depth >= 22:
                # Only narrow uncertain intervals remain. This bound is
                # valid without knowing how many roots lie on them.
                result += abs(value).upper() * self.phi0 * ball(hi-lo)
            else:
                mid = (lo+hi)/2
                todo.extend(((lo, mid, depth+1), (mid, hi, depth+1)))
        return result.upper()


def certify(a0, linear, mu, cap, promised, target, slice_):
    a0, linear, mu, cap, promised = map(Q, (a0, linear, mu, cap, promised))
    mass = a0*mu
    boundary = Q(13, 4)
    g = (2/arb.pi()).sqrt()
    h = (1 + 4*ball(Q(-3, 2)).exp())/(3*arb.pi()).sqrt()
    slope = g + ball(abs(linear))
    # Separate the two tails using the global maximum of the other quadratic.
    assert 2*ball(mass*boundary) > slope and 2*mass*boundary > 1
    assert h + slope*ball(boundary) - ball(mass*boundary**2) + ball(1/(4*mass)) < ball(cap)
    assert h + slope**2/ball(4*mass) + ball(boundary-mass*boundary**2) < ball(cap)

    def excess(q, r):
        return (slice_.upper(q, r) - ball(linear*q+mass*(q*q+r*r))).upper()

    todo = [(-boundary, boundary, Q(0), boundary, 0)]
    leaves = 0
    while todo:
        q0, q1, r0, r1, depth = todo.pop()
        penalty = mass*((q1-q0)**2+(r1-r0)**2)/4
        upper = max(excess(q, r) for q in (q0, q1) for r in (r0, r1)) + ball(penalty)
        if upper < ball(cap):
            leaves += 1
            continue
        assert depth < 34, (q0, q1, r0, r1, upper, cap)
        if q1-q0 >= r1-r0:
            mid = (q0+q1)/2
            todo.extend(((q0, mid, r0, r1, depth+1), (mid, q1, r0, r1, depth+1)))
        else:
            mid = (r0+r1)/2
            todo.extend(((q0, q1, r0, mid, depth+1), (q0, q1, mid, r1, depth+1)))
    # The majorant a*cap + mass*(1-a^2)/a is convex in a on [a0,1].
    endpoint = max(cap, a0*cap+mu*(1-a0*a0))
    assert endpoint < promised and ball(promised) < target
    print(f"PASS a(F) >= {a0}: slice cap {cap}, {leaves} rectangles, "
          f"ratio < {promised}", flush=True)


def certify_contraction_and_phase():
    p, q = Q(8, 9), Q(1, 9)
    first, second, scale = 2366, 101574, 40095
    xx = first+second*p*p-2*scale
    bb = second*(q*q+4*p*q)
    ss = first+second*(p*p+4*p*q)-3*scale
    dd = second*q*q+scale
    mixed = second*p*q
    assert (xx, bb, ss, dd, mixed) == (2432, 41382, 2465, 41349, 10032)
    assert xx > 0 and ss > 0 and xx*bb-mixed**2 == 0
    assert ss*dd-mixed**2 == 1284261 > 0
    coefficient = Q(first+second, scale)
    assert coefficient == Q(20788, 8019) and coefficient > 2
    for a, threshold in ((Q("0.711"), Q("58.1377")), (Q("0.662"), Q("53.0920"))):
        limit = (1+coefficient*a*a)/3
        assert Q(1, 2) < limit < 1
        assert 90*(limit**2+(1-limit)**2) < threshold
        print(f"PASS kappa >= {threshold}: a >= {a} by the rational tensor comparison")

    pi = arb.pi()
    assert pi*ball(Q(17, 200)).sqrt() < ball("0.916")
    assert pi*ball("0.8247")/(2*arb(2).sqrt()) > ball("0.916")
    print("PASS exact comparisons for the complex phase average")


if __name__ == "__main__":
    if not __debug__:
        raise RuntimeError("Run the certificate with assertions enabled.")
    ctx.prec = 128
    proof = GaussianSlice()
    e_h3 = (1 + 4*ball(Q(-3, 2)).exp())/(3*arb.pi()).sqrt()
    assert proof.upper(Q(0), Q(0)) > e_h3
    assert proof.upper(Q(0), Q(0)) - e_h3 < ball(Q(1, 10**9))
    certify("0.711", "-0.140", "0.595", "0.70836", "0.79786",
            (2/arb.pi()).sqrt(), proof)
    certify("0.662", "-0.093", "0.5754", "0.75688", "0.82430",
            ball(Q(17, 25)).sqrt(), proof)
    certify_contraction_and_phase()
