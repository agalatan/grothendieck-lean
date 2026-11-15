# codex-c7e2-research/remote/check_constants.py; Agent-ID: codex-c7e2.
"""Check only rational scalar steps of NEAR_GAUSSIAN_REMOTE.md.

This does not check the external Edgeworth theorem, the inherited cubic
sixth-cumulant theorem, or the analytic proof in the accompanying note.
"""
from fractions import Fraction as Q
from math import factorial

C6 = Q(4045313, 100000)
assert 100 * C6**2 < 54 * 56**2
assert 15 + Q(15, 81) + Q(56, 729) < 16
assert sum(Q(9, 2)**j / factorial(j) for j in range(5)) > 27
assert Q(56, 240) < 1

# kappa=(3/2)chi; radius penalty kappa/48 becomes chi/32.
assert Q(3, 2) / 48 == Q(1, 32)
# B''(u)=-sqrt(pi)/4 E(V+u)^(-3/2).
assert Q(1, 32) / Q(1, 4) == Q(1, 8)

print("PASS: all rational scalar comparisons and conversion factors")
