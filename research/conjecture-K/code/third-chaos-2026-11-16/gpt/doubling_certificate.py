# Intended filepath: doubling_certificate.py
"""Exact rational checks for failure of doubling monotonicity in H_3.

The analytic reduction (see doubling_derivation.txt) proves the claim if

 B < 2(1 + 4 exp(-3/2)),
 B = -1 + 4/sqrt(pi) * (I_minus + 3 exp(-1) + 2 exp(-3) I_plus),
 I_minus = integral_0^1 exp(-t^2) dt,
 I_plus  = integral_0^1 exp(2t^2) dt.

All assertions below use Python's exact Fraction and integer arithmetic.
The only numerical constant used without deriving it here is the classical
Archimedean inequality pi > 223/71.
"""

from fractions import Fraction as Q
from math import factorial

# Alternating-series upper bound for integral exp(-t^2), through t^8.
i_minus_upper = sum(Q((-1) ** k, factorial(k) * (2 * k + 1)) for k in range(5))
assert i_minus_upper == Q(5651, 7560)
assert i_minus_upper < Q(3, 4)

# For a_k = 2^k/[k!(2k+1)], a_(k+1)/a_k < 2/5 for k >= 4.
# Keep k <= 3, then geometrically bound the tail starting at k=4.
i_plus_upper = sum(Q(2 ** k, factorial(k) * (2 * k + 1)) for k in range(4))
i_plus_upper += Q(2 ** 4, factorial(4) * 9) / (1 - Q(2, 5))
assert i_plus_upper == Q(6749, 2835)
assert i_plus_upper < Q(12, 5)

# exp(1) > sum_(k=0)^4 1/k! > 100/37, hence exp(-1) < 37/100.
exp_one_lower = sum(Q(1, factorial(k)) for k in range(5))
assert exp_one_lower == Q(65, 24)
assert exp_one_lower > Q(100, 37)

# exp(3) > its positive Taylor sum through k=8 > 20.
exp_three_lower = sum(Q(3 ** k, factorial(k)) for k in range(9))
assert exp_three_lower == Q(89641, 4480)
assert exp_three_lower > 20

# pi > 223/71 > (177/100)^2, hence 1/sqrt(pi) < 100/177.
assert Q(223, 71) > Q(177, 100) ** 2

b_upper = -1 + Q(400, 177) * (Q(3, 4) + 3 * Q(37, 100) + 2 * Q(1, 20) * Q(12, 5))
assert b_upper == Q(221, 59)
assert b_upper < Q(15, 4)

# k! >= 2*3^(k-2) for k>=2, strictly for k>=4, implies
# exp(1) < 2 + (1/2)/(1-1/3) = 11/4.
# This in turn implies exp(3/2) < 32/7 and exp(-3/2) > 7/32.
assert Q(11, 4) ** 3 < Q(32, 7) ** 2
assert 2 * (1 + 4 * Q(7, 32)) == Q(15, 4)

print("PASS: B < 221/59 < 15/4 < 2(1+4 exp(-3/2)).")
print("Therefore E|(X+X')/sqrt(2)| < E|X| for X=He_3(G)/sqrt(6).")
