#!/usr/bin/env python3
"""Exact arithmetic for a refinement of arXiv:2609.25462v1.

Python standard library only. All tests use integers/Fraction; Decimal is
used solely for readable output. Run normally, without Python's -O flag.

This checks the two NEW tail estimates and final rational arithmetic. It
does not establish validity of the source rounding kernels, or rederive
their quadrature/energy inputs. See research-note.md and verify_intervals.py
for those dependencies and the complementary interval verification.
"""

from decimal import Decimal, localcontext
from fractions import Fraction as Q
from math import isqrt

DEN = 10**12
# rho_5(t) = t P(t^2)/DEN; source equation (5.4).
P = {
    0: 94626045381, 1: -856254413568, 10: 1274576105,
    13: 8312996734, 14: 1885453067, 15: 1662844635,
    16: 9295485863, 17: 9399425108, 18: 8540450681,
    19: 847985940, 20: 3771690693, 21: 873880329,
    27: -419180236, 29: -311954497, 30: -455650279,
    31: -996284704, 35: -865568525, 37: 206113648,
}

WEIGHTS = tuple(map(Q, (
    '0.983543458398378100', '0.012416654023174663',
    '0.003031585753026536', '0.000593628184609741',
    '0.000016934659448514', '0.000397738981362458',
)))


def show(x):
    with localcontext() as ctx:
        ctx.prec = 55
        return str(Decimal(x.numerator) / Decimal(x.denominator))


def fifth_tail_certificate():
    assert sum(abs(c) for c in P.values()) == DEN - 7
    poly = [1]
    norms = {}
    for exponent in range(1, 136):
        product = [0] * (len(poly) + max(P))
        for degree, coefficient in P.items():
            for k, value in enumerate(poly):
                product[k + degree] += coefficient * value
        poly = product
        if exponent in (20, 135):
            norms[exponent] = Q(sum(abs(c) for c in poly), DEN**exponent)
    assert norms[20] < Q(1, 2)
    assert norms[135] < Q(1, 300)
    reserve = Q(10 * 2, 300 * 4 * 67 * 68)
    assert reserve == Q(1, 273360)
    for exponent, norm in norms.items():
        print(f'||rho_5^{exponent}||_A = {show(norm)}')
    print('PASS: exact polynomial norms and omitted fifth tail < 1/273360')
    return reserve


def add(a, b):
    c = [Q(0)] * max(len(a), len(b))
    for k, v in enumerate(a):
        c[k] += v
    for k, v in enumerate(b):
        c[k] += v
    return c


def mul(a, b):
    c = [Q(0)] * (len(a) + len(b) - 1)
    for i, u in enumerate(a):
        for j, v in enumerate(b):
            c[i + j] += u * v
    return c


def scale(a, s):
    return [s * v for v in a]


def power(a, n):
    out = [Q(1)]
    for _ in range(n):
        out = mul(out, a)
    return out


def upper_sqrt(x):
    d = 10**18
    k = isqrt(x.numerator * d**2 // x.denominator) + 1
    result = Q(k, d)
    assert result**2 > x
    return result


def sixth_tail_certificate():
    # Exact identity establishing monotonicity of the corrected Wallis ratio.
    numerator = mul([5, 4], power([1, 2], 2))
    denominator = mul([1, 4], power([2, 2], 2))
    assert add(numerator, scale(denominator, -1)) == [1, 0, 0, 0]

    # Positive-polynomial proof of the telescoping majorant at r=1/16.
    p = [Q(1, 16), Q(1)]
    q = [Q(17, 16), Q(1)]
    delta = add(add(scale(power(p, 2), 3), scale(p, 3)), [Q(1)])
    denominator = scale(mul(mul([Q(1, 4), Q(1)], [Q(1), Q(1)]),
                            power([Q(1), Q(2)], 2)), 4)
    difference = add(mul(delta, denominator),
                     scale(mul(power(p, 3), power(q, 3)), -48))
    assert difference == [
        Q(1242733, 1048576), Q(440847, 32768), Q(222067, 4096),
        Q(1197, 16), Q(263, 8), Q(0), Q(0),
    ]
    assert all(c >= 0 for c in difference) and difference[0] > 0

    n, a, b = 120, Q('1.174'), Q('1.176')
    W = 1 / (48 * (Q(n) + Q(1, 16))**3)
    upper = tuple(upper_sqrt(x) for x in (
        a * W, b * W, a * b / Q(2 * n + 1)**4))
    assert upper == tuple(Q(k, 10**18) for k in (
        118878237195126, 118979453251942, 20230360607910))
    result = sum(upper)
    assert result == Q(258088051054978, 10**18)
    print('PASS: Wallis identity and positive-polynomial telescoping estimate')
    print('PASS: unweighted sixth tail <', show(result))
    return result


def final_arithmetic(fifth_reserve, sixth_tail):
    # Source estimates, independently checked by the upstream interval suite.
    old_w5 = Q('0.0000169358532612748746')
    finite5 = Q('2.699176355797438e-12')
    old_mass = Q('1.0000000000000000975976')
    old_q0 = Q('0.71179640805640433452')
    old_prefix = Q('1.074829404498064e-6')
    old_low_tail = Q('1.017179644647e-11')
    old_w6 = Q('0.000397752354801503847')
    old_tail = old_low_tail + finite5 + old_w5*fifth_reserve + old_w6*sixth_tail
    fixed = old_mass / (old_q0 - old_prefix - old_tail)
    assert fixed < Q('1.404898427462')
    print('PASS: unchanged-weight bound < 1.404898427462')
    print('Unchanged-weight rational endpoint =', show(fixed))

    # The reweighted q0/prefix bounds below require verify_intervals.py.
    # They are deliberately rounded outwards, with ample numerical margin.
    assert all(w > 0 for w in WEIGHTS)
    mass = sum(WEIGHTS)
    assert mass == Q('1.000000000000000012')
    radii = tuple(map(Q, ('1.2', '1.11', '1.11', '1.11')))
    low = sum(WEIGHTS[i] * 10 * r**(-241) / (1-r**(-2))
              for i, r in enumerate(radii))
    tail = low + WEIGHTS[4] * (finite5/old_w5 + fifth_reserve) + WEIGHTS[5]*sixth_tail
    assert tail < Q('1.027264992e-7')
    q0 = Q('0.7117964083067696')
    prefix = Q('1.0747148914e-6')
    assert q0 - prefix - tail > 0
    result = mass / (q0 - prefix - tail)
    assert result < Q('1.404898426735')
    print('Reweighted total tail <', show(tail))
    print('Reweighted rational endpoint =', show(result))
    print('PASS: K_G^C < 1.404898426735, using stated source/interval inputs')


def main():
    if not __debug__:
        raise SystemExit('Do not use -O: this certificate requires assertions.')
    fifth = fifth_tail_certificate()
    sixth = sixth_tail_certificate()
    final_arithmetic(fifth, sixth)
    print('ALL EXACT CHECKS PASSED')


if __name__ == '__main__':
    main()
