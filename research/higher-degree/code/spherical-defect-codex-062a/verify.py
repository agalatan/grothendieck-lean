"""Exact arithmetic for the spherical fourth-moment defect estimate (#507)."""

from fractions import Fraction as F
from math import comb


def require(condition, message):
    if not condition:
        raise ValueError(message)


def rho(n):
    exponent = 0
    while n % 2 == 0:
        n //= 2
        exponent += 1
    d, b = divmod(exponent, 4)
    return 8 * d + 2**b


def kernel_moments(m):
    # The quadratic evaluation kernel at e_1 is K_m = m((m+2)x_1^2 - 1)/2.
    a, b = F(m * (m + 2), 2), F(-m, 2)
    t2, t4 = F(1, m), F(3, m * (m + 2))
    first = a * t2 + b
    second = a*a*t4 + 2*a*b*t2 + b*b
    dimension = comb(m + 1, 2)
    require(a + b == dimension and second == dimension, "quadratic evaluation norm")
    require(first == 1 and a*t4 + b*t2 == 1, "kernel on 1 and x_1^2")
    require(a*F(1, m * (m + 2)) + b*t2 == 0, "kernel on x_2^2")
    return first, second


def lower_bound(c):
    if c < 2:
        raise ValueError("expected complex dimension at least two")
    n = 2 * c
    r = rho(n) + 1
    baseline = F(2*c, c + 1)
    if r > n:
        return baseline
    mean_r, norm_r = kernel_moments(r)
    mean_n, norm_n = kernel_moments(n)
    # Center the product of the two kernels. Its square integrates to D-1.
    centered_norm = norm_r * norm_n - 2 * mean_r * mean_n + 1
    dimension = comb(r + 1, 2) * comb(n + 1, 2)
    require(centered_norm == dimension - 1, "centered evaluation norm")
    return baseline * (1 + 1 / centered_norm)


def check_real_part(c):
    # R = (conj(x_1)y_1 + x_1 conj(y_1)) w_1. The conditional x-map may have rank one.
    n = 2 * c
    y2, y4 = F(2, n), F(8, n * (n + 2))  # |y_1|
    w2, w4 = F(1, n), F(3, n * (n + 2))  # Re w_1
    phi2 = 4 * y2 * w2
    phi4 = 16 * y4 * w4
    via_map = F(2*n, n + 2) * phi4 / phi2**2
    # Gaussian E|R|^2 = 2 and E|R|^4 = 48, then divide out the three radii.
    via_gaussian = F(c, c + 1)**3 * F(48, 4)
    require(via_map == via_gaussian, "mixed-form phase and radial normalization")


def main():
    expected = {
        2: F(4, 3), 3: F(189, 125), 4: F(8, 5), 5: F(550, 329),
        6: F(14040, 8183), 7: F(2205, 1258), 8: F(119680, 67311),
    }
    for c, want in expected.items():
        actual = lower_bound(c)
        require(actual == want, f"lower bound at c={c}: {actual} != {want}")
        check_real_part(c)
        print(f"c={c}: lower bound {actual}, gap {actual - F(2*c, c+1)}")
    # Include higher 2-adic valuations and odd multiples of powers of two.
    for n, expected_rho in [(12, 4), (16, 9), (32, 10), (64, 12), (128, 16), (256, 17), (768, 17)]:
        require(rho(n) == expected_rho, f"incorrect Radon-Hurwitz number at {n}")
    for c in range(3, 128, 2):
        require(lower_bound(c) > F(2*c, c+1) + F(1, 1014 * (c+1)**3),
                f"failed odd-dimensional comparison at {c}")


if __name__ == "__main__":
    main()
