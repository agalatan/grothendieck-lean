#!/usr/bin/env python3
"""Prove the one-variable contour bounds for the replacement cell channel in row 4.7.

Agent-ID: codex-a7c4. Refs #586, #589. Python standard library, exact rational arithmetic.
"""
from fractions import Fraction as Q
from math import comb

if not __debug__:
    raise RuntimeError("Assertions must be enabled")

A, B = Q(93079, 100000), Q(6921, 100000)
RHO, OUTER, J = Q(1197, 1000), Q(6, 5), Q(3, 20)
ONE = (Q(1),)
CUTOFF = 126


def add(p, q):
    return tuple((p[i] if i < len(p) else 0) + (q[i] if i < len(q) else 0)
                 for i in range(max(len(p), len(q))))


def times(p, q):
    result = [Q(0)] * (len(p) + len(q) - 1)
    for i, a in enumerate(p):
        for j, b in enumerate(q):
            result[i + j] += a * b
    return tuple(result)


def scale(p, s):
    return tuple(c * s for c in p)


def minus(p, q):
    return add(p, scale(q, -1))


def square(p):
    return times(p, p)


def positive(p, cells):
    """Positive Bernstein coefficients on each of the equal closed subintervals of [0,1]."""
    degree = len(p) - 1
    for cell in range(cells):
        left, width = Q(cell, cells), Q(1, cells)
        power = [width**j * sum(p[k] * comb(k, j) * left**(k-j) for k in range(j, degree+1))
                 for j in range(degree+1)]
        for h in range(degree+1):
            bernstein = sum(power[j] * Q(comb(h, j), comb(degree, j)) for j in range(h+1))
            if bernstein <= 0:
                return False
    return True


def radial_polynomials(radius):
    # On |z|=radius, set y=cos(theta)^2. u=(Re r(z))², s=|r(z)|².
    u = times((0, 1), square((A*radius + 3*B*radius**3, -4*B*radius**3)))
    s = ((A*radius + B*radius**3)**2, -4*A*B*radius**4)
    return u, s


def certify():
    # The real part on the outer circle is (aR+3bR³)x-4bR³x³, monotone on [-1,1].
    assert A + B == 1 and 1 < RHO < OUTER
    assert A - 9*B*OUTER**2 > 0 and 0 < A*OUTER - B*OUTER**3 < 1
    u, s = radial_polynomials(RHO)
    delta = minus(square(add(ONE, s)), scale(u, 4))
    m = minus(add(ONE, s), scale(u, 2))
    gate = minus(ONE, scale(add(ONE, s), J))
    a = minus(minus(ONE, u), scale(m, J))
    b = minus(m, scale(delta, J))
    budget_root = 12
    assert 0 < J < Q(1, 2)
    assert positive(gate, 8)
    assert positive(minus(square(gate), scale(u, (1-2*J)**2)), 8)
    assert positive(a, 8) and positive(b, 8)
    assert positive(minus(scale(times(a, add(a, s)), 4*J*budget_root), b), 8)

    # Weighted Hardy allowance for the entire tail, including indices 126 through 250.
    tau = Q(3, 10**19)
    assert budget_root**2 * RHO**(-4*CUTOFF-2) < tau**2 * (1 - RHO**-4)
    print(f"analytic disk {OUTER}; contour {RHO}; j {J}; pointwise squared bound {budget_root**2}")
    print(f"tail from k={CUTOFF} < {tau}")

    # Independent check from the absolute Gaussian density and coefficientwise Cauchy.
    # On the circle of radius 6/5 another slightly larger disk is still required.
    outer = Q(1201,1000)
    assert A - 9*B*outer**2 > 0 and 0 < A*outer - B*outer**3 < 1
    u, s = radial_polynomials(OUTER)
    delta = minus(square(add(ONE, s)), scale(u, 4))
    assert positive(minus(scale(square(minus(ONE, u)), 1600), delta), 16)
    coarse_tau = Q(5, 10**17)
    assert 1600 * OUTER**(-2*CUTOFF-1) < coarse_tau * (1 - OUTER**-2)
    print(f"absolute-density bound {1600}; independent tail < {coarse_tau}")

    # Conditional arithmetic only: the input head and five old allowances are those of row 4.7.
    weights = (877507626078, 66539989456, 155757577, 268810736, 55247337947, 280478206)
    tails = [Q(x, 10**12) for x in (50024, 49816, 1785796, 110835)] + [tau, Q(57619, 10**12)]
    assert sum(weights) == 10**12 and min(weights) > 0
    slope = Q(711979426435 - 5295239, 10**12) - sum(Q(w, 10**12)*t for w,t in zip(weights,tails))
    assert Q(1404545506, 10**9) < 1/slope < Q(140454551, 10**8)
    print(f"conditional six-slot reciprocal {1/slope}; rounded upper target 1.40454551")


if __name__ == "__main__":
    certify()
