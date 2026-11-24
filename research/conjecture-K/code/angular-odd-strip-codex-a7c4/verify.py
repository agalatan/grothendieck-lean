"""Exact arithmetic in the phase-circle odd-energy bound (task #610, codex-a7c4)."""

from fractions import Fraction as F


def require(condition, message):
    if not condition:
        raise ValueError(message)


def verify():
    a, b, p = F(699, 1250), F(179, 1250), F(2500, 1891)
    # P(v) >= 5/16 on [0,1]. Its square minus 1-v has positive coefficients.
    coeffs = [F(1), -F(1, 2), -F(1, 8), -F(1, 16)]
    squared = [F(0)] * 7
    for i, lhs in enumerate(coeffs):
        for j, rhs in enumerate(coeffs):
            squared[i + j] += lhs * rhs
    squared[0] -= 1
    squared[1] += 1
    require(sum(coeffs) == F(5, 16), "sign of the polynomial majorant")
    require(squared == [0, 0, 0, 0, F(5, 64), F(1, 64), F(1, 256)], "squared majorant")
    integral = sum(c / (i + F(1, 4)) for i, c in enumerate(coeffs))
    require(integral == F(8249, 2340), "beta integral bound")

    # The tangent double-angle and subtraction identities give Machin's formula.
    x, y = F(1, 5), F(1, 239)
    tan2 = 2 * x / (1 - x**2)
    tan4 = 2 * tan2 / (1 - tan2**2)
    require((tan4 - y) / (1 + tan4 * y) == 1, "Machin identity")
    pi_lower = F(157, 50)
    require(16 * (x - x**3 / 3) - 4 * y > pi_lower, "pi lower bound")

    linear, fractional = F(9, 20), F(71, 20)
    require(4 * a * b * (p + linear)**2 > 1, "linear coefficient")
    require(8 * integral**4 < fractional**4 * pi_lower**4 * a * b, "fractional coefficient")
    width = F(1, 3_000_000)
    odd_budget = F(50, 10**6) - F(36, 10**8)
    remote_upper = F("1.373953883")
    benchmark_lower = F("1.3739535256614")
    require(remote_upper - benchmark_lower < F(36, 10**8), "remote cap of rows 3.3 and 3.14")
    residual = odd_budget - linear * width
    require(odd_budget == F(1241, 25_000_000), "remote error allowance")
    require(residual > 0 and fractional**4 * width**3 < residual**4, "uniform strip")
    old_width = F(1_540_081, 2_500_000_000_000_000)
    require(541 * old_width < width < 542 * old_width, "comparison to row 7.5.4")
    return width, odd_budget


if __name__ == "__main__":
    width, budget = verify()
    print(f"W <= {width}: odd charge < {budget}. All comparisons exact.")
