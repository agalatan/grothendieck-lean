#!/usr/bin/env python3
"""Exact checks of the spherical normalization used in the analytic note.

This is an algebraic check of formulas, not a proof of the universal theorem.
No external dependencies. Run with ordinary Python, retaining assertions.
"""
from fractions import Fraction as F
from math import comb, factorial


def jacobi_radial(n, k):
    """Coefficients of P_k^(n-2,1)(2s-1)/P_k^(n-2,1)(1)."""
    ans = [F(0) for _ in range(k + 1)]
    denominator = comb(k + n - 2, k)
    for j in range(k + 1):
        prefactor = F(comb(k + n - 2, j) * comb(k + 1, k - j), denominator)
        for v in range(k - j + 1):
            ans[j + v] += prefactor * comb(k - j, v) * (-1) ** (k - j - v)
    assert sum(ans) == 1
    return ans


def gamma(n, ell, j):
    beta = F(factorial(ell + 1) * factorial(n + j - 2), factorial(ell + n + j))
    return (n + 2 * j) * comb(n + j - 1, j + 1) * comb(ell, j) * beta


def main():
    checks = 0
    for n in (2, 3, 4, 10, 50, 200):
        for ell in range(13):
            gs = [gamma(n, ell, j) for j in range(ell + 1)]
            assert all(v > 0 for v in gs)
            assert sum(gs) == 1
            reconstructed = [F(0)] * (ell + 1)
            for j, value in enumerate(gs):
                for degree, coefficient in enumerate(jacobi_radial(n, j)):
                    reconstructed[degree] += value * coefficient
            assert reconstructed == [F(0)] * ell + [F(1)]
            leading = F(1)
            for r in range(ell):
                leading *= F(n - 1 + r, n + ell + r)
            assert gs[-1] == leading
            assert 1 - leading <= min(F(1), F(ell * (ell + 1), n + ell))
            checks += 1
        # rho(z)=z-z|z|^2. The harmonic coefficient absolute sum is exact.
        a0, a1 = 1 - gamma(n, 1, 0), -gamma(n, 1, 1)
        assert abs(a0) + abs(a1) == F(2 * (n - 1), n + 1)
    print(f"PASS: {checks} exact monomial reconstructions and all counterexample normalizations")


if __name__ == "__main__":
    main()
