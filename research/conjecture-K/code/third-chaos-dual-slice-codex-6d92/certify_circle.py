#!/usr/bin/env python3
"""Exact restricted-circle bound. Agent-ID: codex-6d92, worker audit_pdfs."""

from fractions import Fraction
from math import comb


N = 151


def score(signs):
    full = signs + [-s for s in signs]
    return sum(signs[r]*(11*full[r+29]-10*full[r+30]-full[r+66]) for r in range(N))


def atan_interval(x, terms=24):
    assert 0 < x < 1
    first_sum = sum(((-1)**k*x**(2*k+1)/(2*k+1) for k in range(terms)), Fraction(0))
    next_sum = first_sum+(-1)**terms*x**(2*terms+1)/(2*terms+1)
    return min(first_sum, next_sum), max(first_sum, next_sum)


def cos_interval(x, terms=24):
    assert 0 < x*x < 2
    term = first_sum = Fraction(1)
    for k in range(1, terms):
        term *= -x*x/((2*k)*(2*k-1))
        first_sum += term
    next_sum = first_sum+term*(-x*x/((2*terms)*(2*terms-1)))
    return min(first_sum, next_sum), max(first_sum, next_sum)


def certify():
    largest = score([1]*N)
    count = 1
    for a in range(1, N):
        for b in range(a+1, N):
            signs = [1]*a + [-1]*(b-a) + [1]*(N-b)
            largest = max(largest, score(signs))
            count += 1
    assert count == 1+comb(N-1, 2) == 11176
    assert largest == 94

    u, v = atan_interval(Fraction(1, 5)), atan_interval(Fraction(1, 239))
    pi_lower, pi_upper = 16*u[0]-4*v[1], 16*u[1]-4*v[0]
    assert 3 < pi_lower < pi_upper < Fraction(22, 7)

    def cos_bounds(j):
        assert 0 < j*pi_lower/N < j*pi_upper/N < pi_lower/2
        return cos_interval(j*pi_upper/N)[0], cos_interval(j*pi_lower/N)[1]

    a, b, c = map(cos_bounds, (29, 30, 66))
    assert 0 < c[0] < c[1] < b[0] < b[1] < a[0] < a[1] < 1
    denominator = 11*a[0]**3-10*b[1]**3-c[1]**3
    assert denominator > 0
    assert Fraction(94, N)/denominator < Fraction(17743, 20000)**2
    print(f"PASS {count} sign patterns, maximum {largest}, universal ratio < 17743/20000")


if __name__ == "__main__":
    if not __debug__:
        raise RuntimeError("Run the certificate with assertions enabled.")
    certify()
