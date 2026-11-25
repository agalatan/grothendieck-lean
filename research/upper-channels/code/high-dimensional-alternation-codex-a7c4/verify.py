#!/usr/bin/env python3
"""Rational arithmetic for an explicit charge-one channel with W > 0.96. Agent-ID: codex-a7c4."""
from fractions import Fraction as Q
from math import comb


def require(test, message):
    if not test:
        raise ArithmeticError(message)


def finite_bound():
    m = 100000
    cube_root_d = 10**32
    d = cube_root_d**3
    require(d % 2 == 0, "complex pairing of real blocks")
    cutoff = 16
    length = 2 * cutoff + 1
    # 2pi < 8; epsilon*length < 1 and d*epsilon^4 < 16 / d^(1/3).
    require(2 * length < cube_root_d, "log Taylor bound on every block eigenvalue")
    log_error = Q(16 * comb(m, 3) * length**4, cube_root_d)
    require(log_error < Q(4, 10**11), "accumulated determinant error")
    # |exp(z)-1| <= 2|z| for |z| <= 1/2. A collision can change a sign by 2.
    collision_error = Q(2 * comb(length, 2), m)
    # These are the exact Hermite energies of complex phase divided by pi.
    coefficients = [Q(comb(2*k, k)**2, 4 * (k+1) * 16**k) for k in range(cutoff+1)]
    mass_lower = Q(333, 106) * sum(coefficients)
    require(Q(98,100) < mass_lower < 1, "retained phase mass")
    lower = 1 - 2*(1-mass_lower) - collision_error - 2*log_error
    require(lower > Q(24, 25), "finite witness above 0.96")
    require(lower < Q(97, 100), "the stated budget does not prove 0.97")
    dimension = 2*m + (3*d//2)*comb(m, 3)
    print(f"m = {m}, d = {d}, n = {dimension}")
    print(f"W exceeds {lower.numerator * 10**9 // lower.denominator}/1000000000")


def check_cubic_parity():
    for k in range(65):
        require(comb(2*k+1, 3) % 2 == k % 2, "distinct-draw parity")
    # Three draws of the same index and three distinct draws give opposite
    # cubic signs. The collision term cannot be omitted before taking m large.
    require(comb(1, 3) % 2 != comb(3, 3) % 2, "collision control")


if __name__ == "__main__":
    check_cubic_parity()
    finite_bound()
