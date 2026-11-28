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


def quadratic_dimension(m):
    return comb(m + 1, 2)


def slice_dimension(pair):
    p, q = pair
    return quadratic_dimension(p) * quadratic_dimension(q)


def projective_pair(n):
    k = n & -n  # Largest power of two dividing n.
    if k == n:
        return None
    return k + 1, n - k + 1


def lower_bound(c):
    if c < 2:
        raise ValueError("expected complex dimension at least two")
    n = 2 * c
    r = rho(n) + 1
    baseline = F(2*c, c + 1)
    if r > n:
        return baseline
    pair = (r, n)
    rectangle = projective_pair(n)
    if rectangle is not None:
        pair = min(pair, rectangle, key=slice_dimension)
    mean_p, norm_p = kernel_moments(pair[0])
    mean_q, norm_q = kernel_moments(pair[1])
    centered_norm = norm_p * norm_q - 2 * mean_p * mean_q + 1
    require(centered_norm == slice_dimension(pair) - 1, "centered evaluation norm")
    return baseline * (1 + 1 / centered_norm)


def check_slice_choice(n):
    # Independent exhaustive check via integer binomial coefficients.
    candidates = [(j + 1, n - j + 1) for j in range(1, n) if comb(n, j) % 2]
    rectangle = projective_pair(n)
    if not candidates:
        require(rectangle is None, f"spurious parity obstruction at n={n}")
        return
    require(rectangle in candidates, f"missing odd coefficient at n={n}")
    require(slice_dimension(rectangle) == min(map(slice_dimension, candidates)),
            f"nonoptimal projective pair at n={n}")
    one_input = slice_dimension((rho(n) + 1, n))
    if n % 16:
        require(slice_dimension(rectangle) < one_input, f"expected a strict gain at n={n}")
    else:
        require(slice_dimension(rectangle) > one_input, f"expected the vector-field bound at n={n}")


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
        2: F(4, 3), 3: F(135, 89), 4: F(8, 5), 5: F(450, 269),
        6: F(4050, 2359), 7: F(1911, 1090), 8: F(119680, 67311),
        12: F(41310, 22373), 24: F(620928, 323395),
    }
    for c, want in expected.items():
        actual = lower_bound(c)
        require(actual == want, f"lower bound at c={c}: {actual} != {want}")
        check_real_part(c)
        print(f"c={c}: lower bound {actual}, gap {actual - F(2*c, c+1)}")
    for n in range(4, 257, 2):
        check_slice_choice(n)
    # Include higher 2-adic valuations and odd multiples of powers of two.
    for n, expected_rho in [(12, 4), (16, 9), (32, 10), (64, 12), (128, 16), (256, 17), (768, 17)]:
        require(rho(n) == expected_rho, f"incorrect Radon-Hurwitz number at {n}")
    for c in range(3, 128, 2):
        require(lower_bound(c) > F(2*c, c+1) + F(1, 1014 * (c+1)**3),
                f"failed odd-dimensional comparison at {c}")


if __name__ == "__main__":
    main()
