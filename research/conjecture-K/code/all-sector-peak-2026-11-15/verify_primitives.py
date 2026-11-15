#!/usr/bin/env python3
"""Exact arithmetic checks of proved ingredients, NOT P_Psi.

Agent-ID: codex-91d4. Issue #436. Standard library only.
See SHARED_ODD_MOMENTS.md and ODD_RADIAL_QUADRATURE.md for soundness.
"""
from collections import defaultdict
from fractions import Fraction as F
from math import comb, factorial, isqrt
from pathlib import Path
import hashlib
import json
import sys

if sys.flags.optimize:
    raise RuntimeError('Run without -O or -OO: exact checks are mandatory')
HERE = Path(__file__).resolve().parent


def require(condition, message):
    if not condition:
        raise ValueError(message)


def product_bound(p, q, pp, qq):
    groups = defaultdict(int)
    for r in range(min(p, qq) + 1):
        for s in range(min(q, pp) + 1):
            coefficient = (factorial(r) * factorial(s) * comb(p, r) *
                           comb(qq, r) * comb(q, s) * comb(pp, s))
            groups[(p + pp - r - s, q + qq - r - s)] += coefficient
    denominator = factorial(p) * factorial(q) * factorial(pp) * factorial(qq)
    return sum(F(k*k*factorial(i)*factorial(j), denominator)
               for (i, j), k in groups.items())


# Exact Q(sqrt(2)) polynomial arithmetic. Exponents: x,y,z,S,T.
def fadd(a, b):
    return a[0] + b[0], a[1] + b[1]


def fmul(a, b):
    return a[0]*b[0] + 2*a[1]*b[1], a[0]*b[1] + a[1]*b[0]


def poly_add(*polys):
    out = {}
    for poly in polys:
        for key, value in poly.items():
            out[key] = fadd(out.get(key, (F(0), F(0))), value)
    return {k: v for k, v in out.items() if v != (0, 0)}


def poly_mul(a, b):
    out = {}
    for ka, va in a.items():
        for kb, vb in b.items():
            k = tuple(x+y for x, y in zip(ka, kb))
            out[k] = fadd(out.get(k, (F(0), F(0))), fmul(va, vb))
    return {k: v for k, v in out.items() if v != (0, 0)}


def poly_scale(poly, value):
    pair = value if isinstance(value, tuple) else (F(value), F(0))
    return {k: fmul(v, pair) for k, v in poly.items()}


def variable(index):
    key = tuple(int(i == index) for i in range(5))
    return {key: (F(1), F(0))}


def odd_fourth_coefficients():
    one = {(0, 0, 0, 0, 0): (F(1), F(0))}
    x, y, z, S, T = [variable(i) for i in range(5)]
    Q = poly_mul(x, poly_add(S, poly_scale(one, -1)))
    nu_k = poly_scale(poly_mul(z, poly_add(T, poly_scale(one, -2))),
                      (F(0), F(1, 2)))
    C = poly_add(Q, nu_k)
    C2 = poly_mul(C, C)
    P2 = poly_scale(poly_mul(poly_mul(y, y), poly_mul(S, S)), F(1, 2))
    polynomial = poly_mul(poly_mul(T, T), poly_add(
        poly_mul(C2, C2), poly_mul(P2, P2), poly_scale(poly_mul(C2, P2), 4)))
    result = {}
    for (a, b, c, s, t), value in polynomial.items():
        key = (a, b, c)
        term = fmul(value, (F(factorial(s)*factorial(t)), F(0)))
        result[key] = fadd(result.get(key, (F(0), F(0))), term)
    return {k: v for k, v in result.items() if v != (0, 0)}


def ceil_fraction(x):
    return -((-x.numerator)//x.denominator)


def up(x, digits=32):
    scale = 10**digits
    return F(ceil_fraction(x*scale), scale)


def sqrt_up(x, digits=32):
    require(x >= 0, 'negative radicand')
    scale = 10**digits
    k = isqrt((x.numerator*scale*scale)//x.denominator)
    if k*k*x.denominator < x.numerator*scale*scale:
        k += 1
    answer = F(k, scale)
    require(answer*answer >= x, 'square root upper bound')
    return answer


def atan_bounds(reciprocal, pairs=24):
    x = F(1, reciprocal)
    # An even number of terms ends with a negative term: a lower bound.
    lower = sum((-1)**k*x**(2*k+1)/F(2*k+1) for k in range(2*pairs))
    upper = lower + x**(4*pairs+1)/F(4*pairs+1)
    return lower, upper


def pi_bounds():
    a, b = atan_bounds(5)
    c, d = atan_bounds(239)
    # Machin identity pi=16 atan(1/5)-4 atan(1/239).
    return 16*a - 4*d, 16*b - 4*c


def quadrature_error(radial_intervals=8192, angular_nodes=8192):
    R = F(6)
    h = R/radial_intervals
    a, b, rho, s = F(699, 1250), F(179, 1250), F(5053, 10000), F(3, 5)
    cap = F(80051, 10**6)
    pi_lo, pi_hi = pi_bounds()
    require(pi_lo > F(3141592653589793238, 10**18), 'pi lower control')
    require(pi_hi < F(3141592653589793239, 10**18), 'pi upper control')
    rtpi, rt2, energy = sqrt_up(pi_hi), sqrt_up(F(2)), sqrt_up(cap)
    mu = rtpi/2
    radial_constant = 12*b*(mu+h) + energy*sqrt_up(24+72*(mu+h)**2)
    angular_constant = rtpi*(a+F(3, 2)*b) + energy*sqrt_up(32+F(65, 8)*pi_hi)
    radial = up(h*h*radial_constant/8)
    angular = up(pi_hi*pi_hi*angular_constant/(3*angular_nodes**2))
    # Positive Taylor partial sum is a rigorous lower bound for exp(36).
    exp_upper = up(1/sum((R*R)**j/F(factorial(j)) for j in range(161)))
    f0 = exp_upper
    f1 = (R + 1/(2*R))*exp_upper
    f2 = (R*R + 1)*exp_upper
    f3 = (R**3 + F(3, 2)*R + 3/(4*R))*exp_upper
    coefficients = [f0, F(2, 5)*f0+f2, s*rho*f0+rt2*f2/2,
                    f1, f1, rt2*f1+rt2*f3/2]
    tail = up(2*(a*f1+b*f3+energy*sqrt_up(sum(x*x for x in coefficients))))
    return {'radial': radial, 'angular': angular, 'tail': tail,
            'total': radial+angular+tail,
            'radial_intervals': radial_intervals, 'radial_endpoint_nodes': radial_intervals+1,
            'angular_nodes': angular_nodes}


def expect_rejection(action, label):
    try:
        action()
    except ValueError:
        return label
    raise ValueError('Rejection control was accepted: ' + label)


def main():
    cases = {'qQ': ((2, 1, 1, 1), 17), 'qP': ((2, 1, 2, 0), 12),
             'rQ': ((1, 0, 1, 1), 3), 'rP': ((1, 0, 2, 0), 3),
             'QP': ((1, 1, 2, 0), 7), 'Q2': ((1, 1, 1, 1), 9),
             'P2': ((2, 0, 2, 0), 6), 'q2': ((2, 1, 2, 1), 44)}
    products = {}
    for name, (degree, expected) in cases.items():
        products[name] = product_bound(*degree)
        require(products[name] == expected, 'product table mismatch: ' + name)
    expected = {(4, 0, 0): (18, 0), (0, 4, 0): (12, 0), (0, 0, 4): (44, 0),
                (2, 2, 0): (56, 0), (2, 0, 2): (24, 0), (0, 2, 2): (16, 0),
                (3, 0, 1): (0, 8), (1, 2, 1): (0, 16)}
    fourth = odd_fourth_coefficients()
    require(fourth == expected, 'odd fourth-moment expansion mismatch')
    error = quadrature_error()
    ceiling = F(448, 10**9)
    require(error['total'] < ceiling, 'quadrature primitive budget failed')
    rejected = [expect_rejection(lambda: require(products['qQ'] <= 16, 'qQ too small'), 'qQ=16'),
                expect_rejection(lambda: require(products['qP'] <= 11, 'qP too small'), 'qP=11'),
                expect_rejection(lambda: require(fourth[(2, 2, 0)][0] <= 55, 'mixed term too small'), 'QP coefficient=55'),
                expect_rejection(lambda: require(fourth[(3, 0, 1)] == (0, 0), 'lost nu channel'), 'delete cubic Q/nu term'),
                expect_rejection(lambda: require(quadrature_error(4096, 4096)['total'] < ceiling, 'coarse grid'), 'halve both grid sizes'),
                expect_rejection(lambda: require(error['total'] < F(4, 10**7), 'insufficient error allowance'), 'error allowance=4e-7')]
    report = {'Agent-ID': 'codex-91d4', 'issue': 436,
              'status': 'C for arithmetic ingredients only; P_Psi and global all-sector cap remain OPEN',
              'product_bounds': {k: str(v) for k, v in products.items()},
              'odd_fourth_coefficients_Qsqrt2': {str(k): list(map(str, v)) for k, v in fourth.items()},
              'quadrature': {k: str(v) for k, v in error.items()},
              'quadrature_ceiling': str(ceiling), 'rejection_controls': rejected,
              'scope': 'Uniform quadrature error for c=0 positive two-norm trial, NOT its grid expectation; no lower baseline or Psi integral certified',
              'source_sha256': hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
    print(json.dumps(report, indent=2))


if __name__ == '__main__':
    main()
