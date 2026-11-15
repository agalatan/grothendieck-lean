#!/usr/bin/env python3
"""Check written when research/conjecture-K was assembled (15 November 2026); see STATUS.md, section 11 (a) and 11.13.

Question: is the local A/B cost matrix of the report of 15 November (STATUS.md 11.4) the matrix that the October
manuscript has for the tied multiplier k = alpha/3 + beta/6
(sources/manuscript/legacy/ch25-parts/20-stability-and-smoothing.tex, "Why the local pinned matrix is not a global
majorant"), with the optimal multiplier in place of the rational one?

Peak row: a = 699/1250, b = 179/1250, p = 2500/1891, L = Z(a + b|Z|^2), T = |Z|^2 ~ Exp(1).
With the first-chaos element k = sA*alpha + sB*beta the chapter's local matrix (curvature, including the cost |k|^2) is

    M(sA, sB) = E[v v^T / (2|L|)] + d d^T,   v = (T - 1 + sA, sB - T/sqrt2),   d = (sA, sB),

and the cost in the sense of STATUS.md 11.4 is p*I - M.  Closed forms: E[T^k/|L|] = 2*I_k with
I_0 = pi*exp(a/b)*erfc(sqrt(a/b))/(2*sqrt(a*b)),  I_1 = (sqrt(pi)/2 - a*I_0)/b,  I_2 = (sqrt(pi)/4 - a*I_1)/b.
Floating point (double precision); no interval arithmetic.  Run: python3 -I tied_matrix_check.py

Output on 15 November 2026:

    E[T^k/|L|] = ['2.863947582583', '1.193675717355', '1.527398493771']
    j0 = 1.431973791291  g0 = -0.835135932614  d0 = -0.422028097140
    tied multiplier 1/3, 1/6 (ch25-parts/20): sA = 0.33333333 sB = 0.16666667
       M        = 0.7154593426 -0.2627445185 0.3087284186
       p I - M  = 0.6065924819 0.2627445185 1.0133234058
    optimal multiplier: sA = 0.34339841 sB = 0.17353316
       M        = 0.7152129696 -0.2629125966 0.3086137541
       p I - M  = 0.6068388548 0.2629125966 1.0134380703
    no multiplier: sA = 0.00000000 sB = 0.00000000
       M        = 1.0019973208 -0.1179888191 0.3818496234
       p I - M  = 0.3200545036 0.1179888191 0.9402022010
    k(0.0000) = 0.320055
    k(0.3333) = 0.606592
    k(0.3434) = 0.606839
    k(0.6000) = 0.446707
    k(0.7000) = 0.297578
    k(0.7500) = 0.204773
    k(s) = 0 at s = 0.8429

Reading: the first M is the matrix printed in the chapter (.7154593425565982, -.2627445185308260, .3087284185988625);
the second p*I - M is the "corrected" matrix of the report (0.60683885483874..., 0.26291259657063..., 1.01343807031137...
in its results.txt) and the third is its "original" matrix.  k(s) = k_A - 2*g0*s - (1 + j0)*s^2 is the local cost of
the tilted A-sector (STATUS.md 11.13); the values agree with code/kprime-2026-11-15/tilt_profiles.log.
"""
import math

a, b = 699 / 1250, 179 / 1250
p = 2500 / 1891
x = a / b
I0h = math.pi * math.exp(x) * math.erfc(math.sqrt(x)) / (2 * math.sqrt(a * b))   # int_0^inf e^{-r^2}/(a + b r^2) dr
I1h = (math.sqrt(math.pi) / 2 - a * I0h) / b
I2h = (math.sqrt(math.pi) / 4 - a * I1h) / b
I = [2 * I0h, 2 * I1h, 2 * I2h]                    # E[T^k/|L|], k = 0, 1, 2
print('E[T^k/|L|] =', ['%.12f' % v for v in I])
j0 = I[0] / 2
g0 = (I[1] - I[0]) / 2
d0 = -I[1] / (2 * math.sqrt(2))
print('j0 = %.12f  g0 = %.12f  d0 = %.12f' % (j0, g0, d0))


def M(sA, sB):
    """E[v v^T/(2|L|)] + d d^T,  v = (T - 1 + sA, sB - T/sqrt2),  d = (sA, sB)."""
    c = sA - 1
    r2 = math.sqrt(2)
    AA = (I[2] + 2 * c * I[1] + c * c * I[0]) / 2 + sA * sA
    AB = (-I[2] / r2 + (sB - c / r2) * I[1] + c * sB * I[0]) / 2 + sA * sB
    BB = (I[2] / 2 - 2 * sB * I[1] / r2 + sB * sB * I[0]) / 2 + sB * sB
    return AA, AB, BB


for name, (sA, sB) in (('tied multiplier 1/3, 1/6 (ch25-parts/20)', (1 / 3, 1 / 6)),
                       ('optimal multiplier', (-g0 / (1 + j0), -d0 / (1 + j0))),
                       ('no multiplier', (0.0, 0.0))):
    AA, AB, BB = M(sA, sB)
    print('%s: sA = %.8f sB = %.8f' % (name, sA, sB))
    print('   M        = %.10f %.10f %.10f' % (AA, AB, BB))
    print('   p I - M  = %.10f %.10f %.10f' % (p - AA, -AB, p - BB))
kA = p - (I[2] - 2 * I[1] + I[0]) / 2
for s in (0.0, 1 / 3, -g0 / (1 + j0), 0.6, 0.7, 0.75):
    print('k(%.4f) = %.6f' % (s, kA - 2 * g0 * s - (1 + j0) * s * s))
disc = math.sqrt(g0 * g0 + (1 + j0) * kA)
print('k(s) = 0 at s = %.4f' % ((-g0 + disc) / (1 + j0)))
