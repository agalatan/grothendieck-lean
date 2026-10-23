#!/usr/bin/env python3
"""Exact algebraic ceiling for cubic preprocessors of Gaussian phase.

The phase kernel identity and its low coefficients are proved in the companion
TeX. This standard-library replay verifies the polynomial inequalities on the
entire complex coefficient diamond, not sampled phases or dimensions.
"""
import argparse
from fractions import Fraction as Q
import json
from math import comb
from pathlib import Path


class P:
    """Small bivariate rational polynomial, in variables a and r (or b)."""
    def __init__(self, terms):
        if not isinstance(terms, dict):
            terms = {(0, 0): Q(terms)}
        self.d = {k: Q(v) for k, v in terms.items() if v}

    def __add__(self, other):
        other = other if isinstance(other, P) else P(other)
        d = dict(self.d)
        for k, v in other.d.items():
            d[k] = d.get(k, 0) + v
        return P(d)

    __radd__ = __add__

    def __neg__(self):
        return P({k: -v for k, v in self.d.items()})

    def __sub__(self, other):
        return self + -P.coerce(other)

    def __rsub__(self, other):
        return P.coerce(other) + -self

    @staticmethod
    def coerce(x):
        return x if isinstance(x, P) else P(x)

    def __mul__(self, other):
        other = P.coerce(other)
        d = {}
        for (i, j), x in self.d.items():
            for (k, l), y in other.d.items():
                d[i+k, j+l] = d.get((i+k, j+l), 0) + x*y
        return P(d)

    __rmul__ = __mul__

    def __truediv__(self, scalar):
        return self * (1/Q(scalar))

    def __pow__(self, n):
        out = P(1)
        for _ in range(n):
            out = out*self
        return out

    def sub(self, a, r):
        return sum((v*a**i*r**j for (i, j), v in self.d.items()), P(0))

    def bernstein(self):
        n = max(i for i, _ in self.d)
        m = max(j for _, j in self.d)
        b = [[sum((v*Q(comb(i, k), comb(n, k))*Q(comb(j, l), comb(m, l))
                   for (k, l), v in self.d.items() if k <= i and l <= j), Q(0))
              for j in range(m+1)] for i in range(n+1)]
        # Reconstruct in the ordinary basis; this also checks the conversion.
        a, r = P({(1, 0): 1}), P({(0, 1): 1})
        back = sum((b[i][j]*comb(n, i)*comb(m, j)*a**i*(1-a)**(n-i)
                    * r**j*(1-r)**(m-j) for i in range(n+1) for j in range(m+1)), P(0))
        assert back.d == self.d
        return b


def calculate():
    a, r = P({(1, 0): 1}), P({(0, 1): 1})
    e = Q(9, 25)
    t = a*r**2/32
    U = a/4-e*a**3/32-3*a**5/256-25*a**7/4096-2*t
    v = r*(e/4+a**2/16+9*a**4/256)
    w = r*(a**2/32+3*a**4/128)
    C1 = -U*(v+w)+v*t
    C2 = v*w-U*t
    C3 = w*t
    conditions = []
    for sign in [-1, 1]:
        raw = -(C1+sign*4*C2+9*C3)
        assert all(i >= 1 and j >= 1 for i, j in raw.d)
        quotient = P({(i-1, j-1): z for (i, j), z in raw.d.items()})
        # a >= 0, r >= 0, a+r <= 1: put r=(1-a)b, 0<=b<=1.
        bern = quotient.sub(a, (1-a)*r).bernstein()
        conditions.append(bern)
        print('phase condition', sign, 'Bernstein shape', len(bern), len(bern[0]),
              'minimum', min(sum(bern, [])))
        assert min(sum(bern, [])) >= 0

    # At z=-1 the expression is U+v+w-t. It is positive and increases with r.
    real = U+v+w-t
    derivative = P({(i, j-1): j*z for (i, j), z in real.d.items() if j})
    # derivative >= e/4 -3*a*r/16 >= e/4 -3/64 > 0.
    assert (derivative-(e/4+3*a**2/32+15*a**4/256-3*a*r/16)).d == {}
    assert e/4-Q(3, 64) > 0
    # real(a,0) >= a*(1/4-e/32-3/256-25/4096) >=0.
    assert Q(1, 4)-e/32-Q(3, 256)-Q(25, 4096) > 0

    # A single tangent quadratic globally majorizes the remaining degree-seven
    # polynomial, using a five-degree nonnegative Bernstein certificate.
    p = real.sub(a, 1-a)
    center = Q(29, 32)
    p0 = sum(z*center**i for (i, _), z in p.d.items())
    p1 = sum(i*z*center**(i-1) for (i, _), z in p.d.items() if i)
    numerator = (p0+p1*(a-center)-p).d
    # Exact long division by (a-center)^2.
    rem = dict(numerator);quot = {}
    for i in range(max(k[0] for k in rem), 1, -1):
        z = rem.get((i, 0), Q(0))
        quot[i-2, 0] = z
        for j, c in [(i, 1), (i-1, -2*center), (i-2, center**2)]:
            rem[j, 0] = rem.get((j, 0), 0)-z*c
    assert all(z == 0 for z in rem.values())
    q = P(quot)
    bern = q.bernstein()
    print('tangent quotient Bernstein', [str(x[0]) for x in bern])
    floor = min(sum(bern, []))
    assert floor > 0
    cap = p0+p1*p1/(4*floor)
    print('rational polynomial cap', float(cap))
    assert cap < Q(22659, 100000)
    # pi < 355/113, elementary and also available in Lean.
    score_cap = Q(22659, 100000)*Q(355, 113)
    assert score_cap < Q(71186, 100000)
    incumbent = Q(355973576656604491, 500000000000000000)
    assert score_cap < incumbent
    print('PASS full complex cubic-phase architecture score <', float(score_cap),
          '< 0.71186 < incumbent')
    return {'scope': __doc__, 'cubic_price': str(e), 'fifth_price': '1', 'seventh_price': '1',
            'phase_condition_bernstein': [[[str(x) for x in row] for row in b] for b in conditions],
            'tangent_center': str(center), 'tangent_value': str(p0), 'tangent_slope': str(p1),
            'tangent_quotient_bernstein': [str(row[0]) for row in bern],
            'tangent_floor': str(floor), 'polynomial_cap': str(cap),
            'score_cap': str(score_cap), 'incumbent_score': str(incumbent)}


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--out', type=Path)
    a = p.parse_args()
    result = calculate()
    if a.out:
        a.out.write_text(json.dumps(result, indent=2)+'\n')


if __name__ == '__main__':
    main()
