"""Exact rational bounds used in the angular-only transfer obstruction. Agent-ID: codex-a7c4."""

from fractions import Fraction as F


def check(ok):
    if not ok:
        raise ArithmeticError("Angular-only rounding comparison failed")


lo = F(711958633, 10**9)
hi = F(711958683, 10**9)
check(lo**2 > F(1, 2) and 3 * F(355, 113) / 32 < F(1, 2))
ratio = (F(71, 100) - hi**3) / (hi - hi**3)
check(ratio == F(349118704569460703519002013, 351077387569460703519002013))
check(F(99442093, 10**8) < ratio < F(99442094, 10**8))
print("Required coordinate-character mass exceeds 0.99442093.")
amin = F(99442093, 10**8)
rootmin = F(9972065, 10**7)
check(amin > rootmin**2)
check(16 * 8 * (1 - rootmin) ** 2 < F(3, 16) ** 2)
for x in [F(1, 2), F(9885, 10000)]:
    check(x * x * (1 - x) ** 2 > 16 * (1 - rootmin) ** 2 * (2 - x) ** 3)
check(amin * F(9885, 10000) > F(99145, 10**5) ** 2)
check(2 * (1 - F(99145, 10**5)) < F(131, 1000) ** 2)
print("Single-channel L2 distance to a coordinate phase is below .131.")
