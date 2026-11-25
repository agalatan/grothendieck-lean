"""Exact rational checks for the circular cubic Gaussian comparison."""
from fractions import Fraction as F
from itertools import product
from math import isqrt
import json


def check(condition, message):
    if not condition:
        raise ArithmeticError(message)


# Coordinate order (n,h,b,y,z). The last two variance formulas carry denominator 9.
shape = (32, 8, 32, 96, 0)
trace9 = (80, 20, 16, 96, 32)
traceless9 = (0, 0, 128, 96, 0)
positive_forms = (
    (1, 1, 0, 0, -2),   # Gram matrix 0 on (1,-1)
    (1, 1, 1, 9, -3),   # rescaled Gram matrix 1 on (1,1)
    (1, 0, -1, 0, 0),   # n-b
    (0, 0, 0, 1, 0),    # y
)


def check_face(lam, mu):
    c = F(37*lam + 32*mu, 162)
    factors = (F(128, 3)*(mu-lam), F(352*lam-256*mu, 9),
               F(128*mu-32*lam, 3), F(992*mu-752*lam, 3))
    check(all(x >= 0 for x in factors), 'dual has a negative multiplier')
    for i, s in enumerate(shape):
        check(9*c*s-lam*trace9[i]-mu*traceless9[i]
              == sum(a*q[i] for a, q in zip(factors, positive_forms)),
              f'dual mismatch at coordinate {i}')
    return c


def run():
    faces = [check_face(1, 1), check_face(8, 11)]
    ray = (1, 1, 1, 0, 1)
    dot = lambda v: sum(a*b for a,b in zip(v,ray))
    check(all(dot(v) == 0 for v in positive_forms), 'equality ray')
    s = dot(shape)
    x, c = F(dot(trace9), 9*s), F(dot(traceless9), 9*s)
    check((x,c) == (F(37,162), F(16,81)), 'normalized extremal variances')
    # For fixed p the eigenvalues are affine on the cube, and for each cube
    # vertex they are affine in p. Convexity of their nuclear norm suffices.
    maximum = F(0)
    for p in (F(0), F(1,2)):
        for n,m,u in product((0,1), repeat=3):
            tangent = p*(n-m)
            radial = u-m-tangent
            maximum = max(maximum, abs(tangent)+abs(radial))
    check(maximum == 1, 'Hessian bound')
    unit = 10**13
    root = isqrt(74*unit**2)
    lo, hi = (F(root+8*unit+i, 18*unit) for i in (0,1))
    rational_square = check_face(F(193,100), F(193,93))
    check(hi**2 < rational_square < 2*faces[0] < F(43,50), 'outward comparison')
    return dict(gram_faces=list(map(str, faces)), normalized_ray=list(map(str,(x,c))),
                hessian_nuclear_max=str(maximum), stein_coefficient_interval=list(map(str,(lo,hi))),
                rational_squared_upper=str(rational_square), hilbert_schmidt_squared=str(2*faces[0]))


if __name__ == '__main__':
    print(json.dumps(run(), indent=2))
