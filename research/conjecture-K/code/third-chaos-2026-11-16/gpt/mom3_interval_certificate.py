# /workspace/scratch/3efc7fe714fa/mom3_interval_certificate.py
"""Exact integer interval certificate for the cubic large-cumulant estimate.

No external packages and no floating-point arithmetic enter the certificate.
Decimal display is produced only after all exact assertions have passed.

It proves, with a(x)=(x^3-3x)^2/6, b(x)=(x^2-1)^2/2,
D(x)=3a(x)/4+1/4, and w(x)=exp(-x^2/2),

  integral_0^infinity sqrt(D) w dx < 973/1000,
  -29/25 < integral_0^infinity (a-1)/sqrt(D) w dx < -1,
  integral_0^infinity (b-1)/sqrt(D) w dx < 0,
  integral_0^infinity (x^2-1)/sqrt(D) w dx < 0.

Consequently E sqrt(D(G)) < (973/1000) sqrt(2/pi).
The other three corresponding Gaussian expectations are negative.
See accompanying mathematical reduction in mom3_large_cumulant.tex.
"""

from math import isqrt
from decimal import Decimal, getcontext

SCALE = 1 << 96
MESH = 2000
STOP = 8


def ceil_div(a, b):
    return -((-a) // b)


def rat(a, b=1):
    return a * SCALE // b, ceil_div(a * SCALE, b)


def add(x, y):
    return x[0] + y[0], x[1] + y[1]


def neg(x):
    return -x[1], -x[0]


def sub(x, y):
    return add(x, neg(y))


def mul(x, y):
    values = (x[0] * y[0], x[0] * y[1], x[1] * y[0], x[1] * y[1])
    return min(values) // SCALE, ceil_div(max(values), SCALE)


def div_positive(x, y):
    assert y[0] > 0
    candidates = [(a * SCALE, b) for a in x for b in y]
    return min(a // b for a, b in candidates), max(ceil_div(a, b) for a, b in candidates)


def sqrt_interval(x):
    assert x[0] >= 0
    low = isqrt(x[0] * SCALE)
    high = isqrt(x[1] * SCALE)
    if high * high < x[1] * SCALE:
        high += 1
    return low, high


def square_interval(x):
    low = 0 if x[0] <= 0 <= x[1] else min(x[0] * x[0], x[1] * x[1])
    high = max(x[0] * x[0], x[1] * x[1])
    return low // SCALE, ceil_div(high, SCALE)


def exp_negative(t):
    """Enclose exp(-t), 0 <= t <= 32, by alternating Taylor and squaring.

    z=t/64 is in [0,1/2]. The degree-15 Taylor sum is a lower
    bound for exp(-z), and the degree-16 sum an upper bound.
    All arithmetic encloses the exact sums. Six squares give exp(-t).
    """
    assert 0 <= t[0] <= t[1] <= 32 * SCALE
    z = div_positive(t, rat(64))
    term = rat(1)
    total = rat(1)
    lower = None
    for k in range(1, 17):
        term = div_positive(mul(term, z), rat(k))
        total = sub(total, term) if k % 2 else add(total, term)
        if k == 15:
            lower = total[0]
    result = (lower, total[1])
    assert result[0] > 0
    for _ in range(6):
        result = square_interval(result)
    return result


ONE = rat(1)
TWO = rat(2)
SIX = rat(6)
QUARTER = rat(1, 4)
THREE_QUARTERS = rat(3, 4)


def h3_at_grid(i):
    return rat(i**3 - 3 * i * MESH**2, MESH**3)


def density_at_grid(i):
    return exp_negative(rat(i * i, 2 * MESH**2))


def main():
    # Every cell is contained in a monotonicity interval of x^3-3x.
    # In particular x=1 is a grid point.
    bounds = [(0, 0) for _ in range(4)]
    left_density = density_at_grid(0)
    left_h3 = h3_at_grid(0)
    for i in range(STOP * MESH):
        right_density = density_at_grid(i + 1)
        right_h3 = h3_at_grid(i + 1)
        h3 = min(left_h3[0], right_h3[0]), max(left_h3[1], right_h3[1])
        a = div_positive(square_interval(h3), SIX)
        d = add(mul(THREE_QUARTERS, a), QUARTER)
        root_d = sqrt_interval(d)
        x2 = rat(i * i, MESH**2)[0], rat((i + 1)**2, MESH**2)[1]
        x2_minus_one = sub(x2, ONE)
        b = div_positive(square_interval(x2_minus_one), TWO)
        density = right_density[0], left_density[1]
        integrands = (
            root_d,
            div_positive(sub(a, ONE), root_d),
            div_positive(sub(b, ONE), root_d),
            div_positive(x2_minus_one, root_d),
        )
        for k, integrand in enumerate(integrands):
            cell = mul(integrand, density)
            bounds[k] = add(bounds[k], div_positive(cell, rat(MESH)))
        left_density = right_density
        left_h3 = right_h3

    # For x>=8, sqrt(D)<=x^3+1/2, so its tail is at most
    # (8^2+2+1/16)exp(-32)<67/2^32, using e>2.
    # Each of the other three absolute integrands before multiplication
    # by w is <=x^6. Gaussian integration by parts gives
    # integral_8^infinity x^6 w dx
    # <=(8^5+5*8^3+15*8+15/8)exp(-32)<36000/2^32.
    tail_i = rat(67, 1 << 32)
    tail_other = rat(36000, 1 << 32)
    bounds[0] = add(bounds[0], (0, tail_i[1]))
    for k in range(1, 4):
        bounds[k] = add(bounds[k], (-tail_other[1], tail_other[1]))

    assert bounds[0][1] * 1000 < 973 * SCALE
    assert bounds[1][0] * 25 > -29 * SCALE
    assert bounds[1][1] < -SCALE
    assert all(bounds[k][1] < 0 for k in range(2, 4))
    getcontext().prec = 18
    for label, value in zip(('J', 'A', 'B', 'C'), bounds):
        print(label, tuple(str(Decimal(x) / Decimal(SCALE)) for x in value))
    print('Exact rational certificate passed: J<973/1000; -29/25<A<-1; B,C<0.')


if __name__ == '__main__':
    main()
