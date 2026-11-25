#!/usr/bin/env python3
"""Exact rational comparisons for the grid-free one-coordinate Schur bound.
Agent-ID: codex-a7c4.
"""
from fractions import Fraction as Q
from math import factorial, isqrt


def check(statement, label):
    if not statement:
        raise ArithmeticError(label)


def exp_sum(x, n):
    return sum(x**k / factorial(k) for k in range(n + 1))


# Weighted AM-GM on five intervals. The elementary majorant is unimodal,
# so each pair of exact endpoint comparisons proves its whole interval.
breaks = (Q(3,5), Q(4,5), Q(11,10), Q(11,8), Q(5,3), Q(9,4))
for j, lo, hi in zip((1,3,5,7,8), breaks, breaks[1:]):
    for r in (lo, hi):
        weighted = (8*r**3/j)**j
        if j < 8:
            weighted *= (32*r/(8-j))**(8-j)
        taylor = exp_sum(-Q(11-j,8)*r**2, 9)
        check(taylor > 0 and weighted*taylor**8 > Q(108,100)*Q(8,5)**8,
              "AM-GM endpoint lower bound")


# The first omitted Taylor term makes exp(-x) >= sum_0^9(-x)^j/j!.
cut = Q(9,4)
m4 = sum((-1)**k*cut**(5+2*k) / (2**k*factorial(k)*(5+2*k)) for k in range(10))
max_tail = 2*(cut**3 + cut) / exp_sum(cut**2/2, 12)
check(m4 > Q(221,100) > Q(218,100) > max_tail, "large-radius lower bound for b")

# q=8/5-4r+5r^3 + r^5/2 is positive on r>=0 (use its cubic minimum).
check((Q(8,5))**2 > Q(8,3)**2 * Q(4,15), "positive excess majorant")
h = Q(3,5)
excess = Q(8,15)*h**3 - h**4 + Q(5,6)*h**6 + h**8/16
check(excess < Q(26,1000), "weighted mass of excess")
# pi>25/8 (e.g. 333/106<pi) gives sqrt(8/pi)<8/5.
check(Q(333,106)>Q(25,8), "Jensen constant")

def sqrt_lower(n):
    return Q(isqrt(n*10**12),10**6)

# Gaussian radial terms integrated exactly, with downward roots for upper bound.
base = 32/(25*sqrt_lower(5)) + 96/(21*sqrt_lower(21)) + 8*(11/sqrt_lower(117)-1)
total = base + excess*(8+Q(8,9))/2 + excess**2/4
check(base < Q(170561,100000), "Weber expression")
check(total < Q(182,100), "Hilbert-Schmidt norm squared")
print(f"Weighted excess <= {excess}; squared Hilbert-Schmidt norm < 1.82.")
