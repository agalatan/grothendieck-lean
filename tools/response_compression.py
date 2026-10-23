#!/usr/bin/env python3
"""Exact Laguerre product algebra for bounded-response multiplication cuts.

This is an extraction/certificate prototype, not a Grothendieck endpoint.
Only the Python standard library is used. Run with --self-test --output FILE.
All reported finite identities and separators are checked over Fraction.
The dimension-free analytic extraction is proved in the accompanying note.
"""
from __future__ import annotations

import argparse
from fractions import Fraction as Q
from math import comb, factorial
import json
from pathlib import Path


def add(a, b):
    return [sum((p[i] if i < len(p) else Q(0) for p in (a, b)), Q(0))
            for i in range(max(len(a), len(b)))]


def mul(a, b):
    c = [Q(0)] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            c[i+j] += x*y
    return c


def scale(a, t):
    return [t*x for x in a]


def laguerre(n, alpha=0):
    """(-1)^n L_n^alpha, coefficients in ascending powers of R."""
    return [Q((-1)**(n+k)*comb(n+alpha, n-k), factorial(k))
            for k in range(n+1)]


def exp_moment(p, rate=Q(1)):
    """Integral_0^infinity p(R) exp(-rate R) dR."""
    return sum((x*factorial(k)/rate**(k+1) for k, x in enumerate(p)), Q(0))


def product_coefficients(i, j):
    p = mul(laguerre(i), laguerre(j))
    return [exp_moment(mul(p, laguerre(k))) for k in range(i+j+1)]


def compression(b, order):
    if len(b) < 2*order+1:
        raise ValueError('Compression order n requires b_0,...,b_(2n).')
    return [[sum((c*b[k] for k, c in enumerate(product_coefficients(i, j))), Q(0))
             for j in range(order+1)] for i in range(order+1)]


def psd_exact(a):
    """Exact Schur-complement PSD test; supports singular rational matrices."""
    a = [list(map(Q, row)) for row in a]
    n = len(a)
    if any(len(row) != n for row in a) or any(a[i][j] != a[j][i]
                                                for i in range(n) for j in range(n)):
        raise ValueError('Expected a real symmetric square matrix.')
    for k in range(n):
        pivot = a[k][k]
        if pivot < 0:
            return False
        if pivot == 0:
            if any(a[k][j] for j in range(k+1, n)):
                return False
            continue
        for i in range(k+1, n):
            for j in range(i, n):
                a[j][i] = a[i][j] = a[i][j] - a[i][k]*a[k][j]/pivot
    return True


def contraction(a, squared_scale=Q(1)):
    """Check ||a||_op^2 <= squared_scale, exactly, for rational a."""
    n = len(a[0])
    gram = [[(squared_scale if i == j else Q(0)) -
             sum((row[i]*row[j] for row in a), Q(0)) for j in range(n)] for i in range(n)]
    return psd_exact(gram)


def visible_cut(m):
    return sum(((x + (m[j-1] if j else 0))**2 for j, x in enumerate(m)), Q(0))


def self_test():
    checks = 0
    for i in range(9):
        for j in range(9):
            assert exp_moment(mul(laguerre(i), laguerre(j))) == (1 if i == j else 0)
            checks += 1
    for j in range(9):
        rhs = add(laguerre(j, 1), laguerre(j-1, 1) if j else [])
        assert laguerre(j) == rhs
        checks += 1
    for i in range(6):
        for j in range(6):
            p = mul(laguerre(i), laguerre(j))
            expansion = [Q(0)]
            for k, c in enumerate(product_coefficients(i, j)):
                expansion = add(expansion, scale(laguerre(k), c))
            assert expansion == p
            checks += 1
    assert product_coefficients(1, 1) == [Q(1), Q(2), Q(2)]
    # Actual disk response f(Z)=Z exp(-|Z|^2).
    # The RHS of the Bessel cut is E[R |f|^2]=2/27, not just the coarse 1.
    actual_m = [Q((-1)**k*(k+1), 2**(k+2)) for k in range(30)]
    for n in range(1, 31):
        assert visible_cut(actual_m[:n]) <= Q(2, 27)
        checks += 1
    # Actual charge-one response f(Z,W)=W exp(-|W|^2-|Z|^2),
    # same remote cubic q(W)=W(|W|^2-2)/sqrt(2).
    # b_k=t_k/sqrt(2), t_k=(-1)^(k+1)/2^(k+3).
    for order in range(6):
        t = [Q((-1)**(k+1), 2**(k+3)) for k in range(2*order+1)]
        assert contraction(compression(t, order), Q(2))
        checks += 1
    fake_m = [Q(21, 25), -Q(21, 50), Q(0)]
    parseval = sum((x*x/Q(k+1) for k, x in enumerate(fake_m)), Q(0))
    assert parseval < 1 and visible_cut(fake_m) == Q(1323, 1250) > 1
    fake_b = [Q(4, 5), Q(3, 10), Q(0)]
    matrix = compression(fake_b, 1)
    assert sum(x*x for x in fake_b) == Q(73, 100) < 1
    assert matrix == [[Q(4, 5), Q(3, 10)], [Q(3, 10), Q(7, 5)]]
    assert not contraction(matrix)
    # An omitted companion must remain free. This repair passes the small
    # compression and Parseval; passing still does not realize a response.
    repaired_b = [Q(4, 5), Q(3, 10), -Q(1, 2)]
    assert contraction(compression(repaired_b, 1))
    assert sum(x*x for x in repaired_b) == Q(49, 50)
    checks += 1
    # Independent PSD controls, including zero pivot and singular boundary.
    for a, expected in [([[0, 0], [0, 1]], True), ([[0, 1], [1, 0]], False),
                        ([[1, 1], [1, 1]], True), ([[1, 2], [2, 1]], False)]:
        assert psd_exact(a) == expected
        checks += 1
    return {'status': 'PASS', 'exact_identity_and_control_checks': checks,
            'scope': 'Finite polynomial algebra and necessary response cuts; no global norm cap.',
            'visible_fake': {'m': list(map(str, fake_m)), 'parseval': str(parseval),
                             'compression_cost': str(visible_cut(fake_m)),
                             'compression_excess': str(visible_cut(fake_m)-1)},
            'shared_driver_fake': {'b': list(map(str, fake_b)), 'parseval': '73/100',
                                   'matrix': [[str(x) for x in row] for row in matrix],
                                   'rejected': True},
            'omitted_companion_control': {'b': list(map(str, repaired_b)),
                                         'parseval': '49/50', 'small_compression_passes': True,
                                         'scope': 'A feasible truncated profile, not a realized response.'},
            'product_u1_squared': list(map(str, product_coefficients(1, 1))),
            'analytic_tests': ['f(Z)=Z exp(-|Z|^2), 30 Bessel prefixes',
                               'f(Z,W)=W exp(-|W|^2-|Z|^2), q=H(W), orders 0..5']}


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--self-test', action='store_true')
    p.add_argument('--output', type=Path)
    args = p.parse_args()
    if not args.self_test:
        p.error('Specify --self-test; this prototype does not certify an endpoint.')
    result = self_test()
    if args.output:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(json.dumps(result, indent=2)+'\n')
    print(json.dumps(result, indent=2))


if __name__ == '__main__':
    main()
