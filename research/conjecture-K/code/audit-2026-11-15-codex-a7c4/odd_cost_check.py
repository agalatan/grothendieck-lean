#!/usr/bin/env python3
"""Exact rational scalar certificate; run with python3 -I. Agent-ID: codex-a7c4.

No quadrature or floating point enters acceptance. See ODD_COST.md for the
analytic implication and the convexity reduction of the whole profile box.
"""
from fractions import Fraction as F
from math import isqrt, factorial
import json

BITS = 220
SCALE = 1 << BITS


class Interval:
    def __init__(self, lo, hi=None):
        lo, hi = F(lo), F(lo if hi is None else hi)
        assert lo <= hi
        self.lo = F((lo * SCALE).__floor__(), SCALE)
        self.hi = F((hi * SCALE).__ceil__(), SCALE)

    @staticmethod
    def lift(x):
        return x if isinstance(x, Interval) else Interval(x)

    def __add__(self, x):
        x = self.lift(x)
        return Interval(self.lo + x.lo, self.hi + x.hi)

    __radd__ = __add__

    def __neg__(self):
        return Interval(-self.hi, -self.lo)

    def __sub__(self, x):
        return self + -self.lift(x)

    def __rsub__(self, x):
        return self.lift(x) + -self

    def __mul__(self, x):
        x = self.lift(x)
        ends = [self.lo*x.lo, self.lo*x.hi, self.hi*x.lo, self.hi*x.hi]
        return Interval(min(ends), max(ends))

    __rmul__ = __mul__

    def __truediv__(self, x):
        x = self.lift(x)
        assert x.lo > 0 or x.hi < 0
        return self * Interval(1/x.hi, 1/x.lo)

    def sqrt(self):
        assert self.lo >= 0
        low = isqrt(self.lo.numerator*SCALE*SCALE//self.lo.denominator)
        high = isqrt(self.hi.numerator*SCALE*SCALE//self.hi.denominator) + 1
        return Interval(F(low, SCALE), F(high, SCALE))

    def enclosure(self, digits=15):
        unit = 10**digits
        lo = (self.lo*unit).__floor__()
        hi = (self.hi*unit).__ceil__()
        def fmt(n):
            return ('-' if n < 0 else '') + str(abs(n)//unit) + '.' + str(abs(n)%unit).zfill(digits)
        return [fmt(lo), fmt(hi)]


def atan_reciprocal(n):
    # Alternating Taylor series, even number of terms: sum below true value.
    count = 160
    q = F(1, n)
    total = sum((-1)**k*q**(2*k+1)/F(2*k+1) for k in range(count))
    return Interval(total, total + q**(2*count+1)/F(2*count+1))


PI = 16*atan_reciprocal(5) - 4*atan_reciprocal(239)  # Machin's identity.
SQRT_PI = PI.sqrt()


def exp_positive(r):
    assert 0 <= r < 7
    count = 180
    total = sum(r**k/F(factorial(k)) for k in range(count))
    first = r**count/F(factorial(count))
    # Successive omitted terms have ratio <= r/(count+1).
    return Interval(total, total + first/(1-r/F(count+1)))


def radial_integrals(a, b):
    """J_n = integral_0^infinity t^(n-1/2)e^-t/(a+bt) dt, n=0..3."""
    assert a > 0 and b > 0
    r = a/b
    count = 180
    # erf(sqrt(r)) = 2 sqrt(r/pi) times this alternating series.
    total = sum((-r)**k/F(factorial(k)*(2*k+1)) for k in range(count))
    next_term = r**count/F(factorial(count)*(2*count+1))
    assert r < count  # The omitted alternating tail decreases to zero.
    erf_series = Interval(total, total + next_term)
    j0 = exp_positive(r) * (PI/(b*Interval(r).sqrt()) - 2*SQRT_PI*erf_series/b)
    out = [j0]
    gamma = SQRT_PI
    for n in range(3):
        out.append((gamma-a*out[-1])/b)
        gamma = gamma*F(2*n+1, 2)
    return out


def costs(eps, ell, b):
    j0, j1, j2, j3 = radial_integrals(ell-2*b, b)
    return 1/eps-j1, 1/eps-(j3-4*j2+4*j1)/2


def main():
    rows = {
        'peak': (F(1891,2500), F(1057,1250), F(179,1250), F(128,1000), F(330,1000)),
        'flank': (F(149,200), F(4267,5000), F(1467,10000), F(156,1000), F(356,1000)),
        'upper': (F(1891,2500), F(877,1000), F(19,125), F(166,1000), F(361,1000)),
    }
    result = {'agent_id':'codex-a7c4', 'arithmetic':'exact Fraction, outward dyadic intervals', 'bits':BITS, 'rows':{}}
    for name, (eps, ell, b, k1_target, k3_target) in rows.items():
        k1, k3 = costs(eps, ell, b)
        assert k1.lo > k1_target and k3.lo > k3_target
        result['rows'][name] = {'k1':k1.enclosure(), 'k3':k3.enclosure(), 'accepted_lower_bounds':[str(k1_target),str(k3_target)]}
    result['whole_profile_box'] = {}
    for b in (F(3,25), F(4,25)):
        k1, k3 = costs(F(19,25), F(19,25), b)
        assert k3.lo > F(3,20)
        result['whole_profile_box'][str(b)] = {'k3':k3.enclosure(), 'k1_diagnostic':k1.enclosure()}
    # A coarse negative control: this method does not certify positive Q/P cost on the whole box.
    assert costs(F(19,25),F(19,25),F(4,25))[0].hi < 0
    base = F(387,500)*SQRT_PI
    assert base.hi < F(1371880,1000000)
    result['peak_supremum_n1'] = base.enclosure()
    result['uniform_n1_cost'] = '3/20'
    result['status'] = 'PASS'
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == '__main__':
    main()
