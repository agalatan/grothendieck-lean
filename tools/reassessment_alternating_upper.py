#!/usr/bin/env python3
"""Exact finite identities for an admissible alternating-ceiling counterexample.

The proof is in reassessment.../upper/UPPER_REASSESSMENT.md. These checks
verify its elementary Laguerre coefficients and rational comparison fixture;
they do not pretend finite samples prove a global monotonicity assertion.
"""
from fractions import Fraction as Q
from math import comb


for k in range(65):
    # int_0^infinity exp(-2s)L_k(s) ds, after exact monomial integration.
    coefficient = sum(Q((-1)**j * comb(k, j), 2**(j+1)) for j in range(k+1))
    assert coefficient == Q(1, 2**(k+1))

# Sum_k (-1)^k b^(2k) / 4^(k+1) = 1/(4+b^2).
W11_over_gamma, W10_over_gamma = Q(1, 5), Q(1, 4)
assert W10_over_gamma-W11_over_gamma == Q(1, 20) > 0
assert Q(1, 3) == Q(1, 4)/(1-Q(1, 4))  # Parseval norm squared.

print("PASS 65 exact Laguerre integral identities")
print("Counterexample f(z,w)=phase(z) exp(-|w|^2):")
print("W(1,1)=gamma_dagger/5 < gamma_dagger/4=W(1,0)")
print("q=0 is admissible; both values are positive. This is no new KG bound.")
