#!/usr/bin/env python3
"""Agent-ID: codex-a7c4. Refs #467. Exact constants, not an analytic proof.

All acceptance uses fractions and rational Bernstein coefficients. The
projection constants follow the Gaussian product formula; the two polynomial
certificates cover a whole interval, not a sampled grid.
"""
from fractions import Fraction as Q
from math import comb, factorial
import json


def add(a, b):
    return [(a[i] if i < len(a) else Q(0)) +
            (b[i] if i < len(b) else Q(0))
            for i in range(max(len(a), len(b)))]


def mul(a, b):
    out = [Q(0)] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i+j] += x*y
    return out


def power(a, n):
    out = [Q(1)]
    for _ in range(n):
        out = mul(out, a)
    return out


def bernstein(poly, lo, hi):
    """Exact coefficients on [lo,hi], including zero leading coefficients."""
    n = len(poly)-1
    shifted = [sum(poly[j]*comb(j, k)*lo**(j-k)*(hi-lo)**k
                   for j in range(k, n+1)) for k in range(n+1)]
    return [sum(shifted[k]*Q(comb(i, k), comb(n, k))
                for k in range(i+1)) for i in range(n+1)]


def certify_positive(poly, lo=Q(0), hi=Q(7, 8), depth=0):
    coefficients = bernstein(poly, lo, hi)
    if min(coefficients) > 0:
        return [(str(lo), str(hi), str(min(coefficients)))]
    if depth >= 20:
        raise RuntimeError('Positive Bernstein enclosure not obtained')
    mid = (lo+hi)/2
    return (certify_positive(poly, lo, mid, depth+1) +
            certify_positive(poly, mid, hi, depth+1))


def check(condition, message):
    if not condition:
        raise AssertionError(message)


def main():
    upper = {
        (2, 2): [Q(1), Q(283, 100), Q(245, 100), Q(0), Q(0)],
        (2, 4): [Q(0), Q(245, 100), Q(566, 100), Q(388, 100), Q(0)],
        (4, 4): [Q(1), Q(566, 100), Q(147, 10), Q(179, 10), Q(837, 100)],
    }
    squares = {}
    for (j, k), bounds in upper.items():
        values = []
        for ell in range(0, 9, 2):
            r = (j+k-ell)//2
            value = (Q(factorial(r)**2 * comb(j, r)**2 * comb(k, r)**2 *
                       factorial(ell), factorial(j)*factorial(k))
                     if 0 <= r <= min(j, k) else Q(0))
            check(bounds[ell//2]**2 >= value, 'projection upper bound')
            values.append(value)
        squares[f'{j},{k}'] = [str(x) for x in values]
    check(sum(map(Q, squares['2,2'])) == 15, 'quadratic fourth moment')
    check(sum(map(Q, squares['4,4'])) == 639, 'quartic fourth moment')
    check(Q(197, 100)**4 > 15 and Q(503, 100)**4 > 639, 'fourth roots')
    check(Q(3, 4) < Q(7, 8)**2, 'ratio enclosure')

    # Sum first over spectral orders, retaining the j,k dependence.
    p = [Q(0)]*3
    for j in (2, 4):
        for k in (2, 4):
            p[(j+k-4)//2] += sum(
                upper[tuple(sorted((j, k)))][ell//2] /
                ((3-Q(ell, 3))*(5-Q(k, 3)))
                for ell in range(0, 9, 2))
    check(p == [Q(3167, 4550), Q(74934, 17875), Q(114637, 7700)],
          'spectral sum')
    certificates = {}
    for label, beta, bound, final_constant in [
        ('chi_le_1_100', Q(33, 25), Q(81, 20), 2700),
        ('all_shapes', Q(3), Q(17, 2), 5700),
    ]:
        numerator = mul([beta*Q(197, 100)+1, beta*Q(503, 100), Q(1, 2)], p)
        positive = add([x*(27*bound)**2 for x in power([Q(1, 2), 0, 1], 3)],
                       [-x for x in mul(numerator, numerator)])
        cells = certify_positive(positive)
        # 128/7 * 224 * (3/2)^(3/2) / 2^(7/2) = 384 sqrt(3).
        check((384*bound)**2*3 < final_constant**2, 'remainder rounding')
        certificates[label] = {'K': str(bound), 'constant': final_constant,
                               'positive_polynomial': [str(x) for x in positive],
                               'cells': cells}

    # Fourth moment of the circular real projection, with the stated chi cap.
    check(3+Q(3, 2)*Q(1, 100) < Q(33, 25)**4, 'small-chi beta')
    check(3+Q(3, 2)*42 < 3**4, 'all-shape beta')
    a, b, u0 = Q(699, 1250), Q(179, 1250), Q(463, 10000)
    m1 = a**-2
    m2 = a**-4+4*b*a**-5
    m3 = a**-6+12*b*a**-7+42*b*b*a**-8
    check(m2 < 21 and m3 < 224, 'inverse moments')
    check(m1*m1/(m1+u0*21) > Q(49, 20), 'inverse-mean lower bound')
    # Machin's identity and alternating arctangent sums give fresh pi bounds.
    def atan_bounds(x):
        lower = sum((-1)**j*x**(2*j+1)/(2*j+1) for j in range(20))
        return lower, lower+x**41/41
    lo5, hi5 = atan_bounds(Q(1, 5))
    lo239, hi239 = atan_bounds(Q(1, 239))
    pi_lower, pi_upper = 16*lo5-4*hi239, 16*hi5-4*lo239
    check(pi_lower > Q(25, 8) and pi_upper < Q(9, 5)**2, 'Machin pi bounds')
    # pi>25/8 implies sqrt(pi)>44/25; sqrt(49/20)>25/16.
    check(Q(44, 25)**2 < Q(25, 8), 'pi lower-bound implication')
    check(Q(25, 16)**2 < Q(49, 20), 'square-root lower bound')
    check(Q(44, 25)*Q(49, 20)*Q(25, 16)/16 > Q(21, 50), 'leading deficit')
    check(21*224 < 69**2 and Q(27, 40)*69 < 47, 'third benchmark derivative')
    check(Q(4045313, 100000)*47/36 < 53, 'sixth correction')
    check(u0 < Q(27, 125)**2, 'energy square root')

    loss = (2700*Q(27, 125)+53)*u0
    check(Q(1, 12000) < Q(913, 100000)**2, 'chi square root')
    check(Q(21, 50)-loss*Q(913, 100000) > Q(7, 50), 'signed central theorem')
    check(Q(21, 50)-loss/Q(100) > Q(1, 8), 'signed chi 1e-4 theorem')
    check(Q(1, 5000) < Q(283, 20000)**2, 'larger chi square root')
    check(Q(21, 50)-loss*Q(283, 20000) > Q(1, 1000), 'positive larger-chi theorem')
    check(Q(1, 4000) < Q(1, 63)**2 and 42 < Q(13, 2)**2, 'all-shape square roots')
    check(Q(21, 50)-(Q(5700, 63)+53)*Q(1, 4000)*Q(13, 2) > Q(9, 50),
          'all-shape energy theorem')
    check(Q(3, 80) <= Q(3, 10)*Q(1, 8), 'content ratio')
    retained = Q(1, 8)-Q(3, 80)/Q(59009, 189100)
    check(retained > Q(1, 250), 'retained A reserve')
    check(Q(7, 50)-Q(3, 80)/Q(59009, 189100) > Q(19, 1000),
          'stronger retained A reserve')

    result = {'agent_id': 'codex-a7c4', 'status': 'PASS exact arithmetic; analytic proof author only',
              'projection_squares': squares, 'P': [str(x) for x in p],
              'certificates': certificates,
              'inverse_moments': [str(m1), str(m2), str(m3)],
              'leading_deficit_coefficient': '21/50',
              'signed_regions': [
                  {'u_max': str(u0), 'chi_max': '1/12000', 'D_over_delta_min': '7/50'},
                  {'u_max': str(u0), 'chi_max': '1/10000', 'D_over_delta_min': '1/8'},
                  {'u_max': str(u0), 'chi_max': '1/5000', 'D_over_delta_min': '1/1000'},
                  {'u_max': '1/4000', 'chi_max': '42 (all shapes)', 'D_over_delta_min': '9/50'}],
              'retained_A_reserve_at_chi_1e_4': str(retained)}
    print(json.dumps(result, indent=2))


if __name__ == '__main__':
    main()
