"""Exact rational bounds for the peak odd increment in task #630."""

from fractions import Fraction as F
from functools import lru_cache
from math import isqrt


SCALE = 10**9
SMALL_H = F(1, 20)
DISCOUNT = F(13, 100)


def require(condition, message):
    if not condition:
        raise ArithmeticError(message)


@lru_cache(maxsize=32768)
def root_lower(x):
    return F(isqrt(x.numerator * SCALE**2 // x.denominator), SCALE)


def root_upper(x):
    return root_lower(x) + F(1, SCALE)


def round_down(x):
    return F(x.numerator * SCALE // x.denominator, SCALE)


def phase_upper(low, high):
    """Upper bound on phi(z) over a nonnegative interval, high=None for an infinite ray."""
    if high is not None and high < 1:
        return root_upper((1 + high) / 2)
    if low > 1:
        return root_upper(F(2)) / (root_lower(low + 1) + root_lower(low - 1))
    return F(1)


def phase_discount():
    # For h <= 1/20 only use 1/32 <= y <= 12. Every omitted contribution is nonnegative.
    bins = []
    for i in range(1, 12 * 32):
        left, right = F(i, 32), F(i + 1, 32)
        weight = (right - left) * root_lower(left) * (1 - right / root_lower(1 + right**2))
        bins.append((left, right, round_down(weight), root_lower(1 - SMALL_H * right)))

    # The negative ray has phi(z) <= phi(0). The positive ray begins at delta = 12.
    shifts = [(F(0), F(0))]
    shifts.extend((F(i, 16), F(i + 1, 16)) for i in range(12 * 16))
    shifts.append((F(12), None))
    minimum = F(10)
    for lower, upper in shifts:
        total = F(0)
        for left, right, weight, denominator in bins:
            profile = phase_upper(lower / right, None if upper is None else upper / left)
            total += round_down(weight * max(0, 1 - profile / denominator))
        minimum = min(minimum, total)
    require(minimum > DISCOUNT, "small amplitudes, every tangency shift")

    # For h >= 1/20 integrate the deficit on y >= 20. The tail constant r bounds sqrt(1+1/400).
    r = F(501, 500)
    require(r*r >= 1 + SMALL_H**2, "large-y square root")
    large = root_lower(SMALL_H) * (2 - F(22, 7*4)) / (r * (r + 1))
    require(large > DISCOUNT, "large amplitudes, every tangency shift")
    return minimum, large


def radial_moments(a, b):
    """Grid upper bounds on E[g], E[g d²], E[f], E[f d²], and a lower bound on E[g]."""
    subdivisions = 1024
    h = F(1, subdivisions)
    decay_upper = 1 / (1 + h + h*h / 2)
    decay_lower = 1 - h
    survival_scale = 10**14
    surv_hi = surv_lo = survival_scale
    g_lo_sum = g_hi_sum = gd_hi_sum = f_hi_sum = fd_hi_sum = 0
    previous_g = 0
    square_scale = 2 * subdivisions**2
    for i in range(16 * subdivisions):
        left, right = F(i, subdivisions), F(i + 1, subdivisions)
        next_lo = surv_lo * decay_lower.numerator // decay_lower.denominator
        next_hi = -(-surv_hi * decay_upper.numerator // decay_upper.denominator)
        g_value = root_lower(right / (a + b*right)) * SCALE
        # g_value is an integer lower height. One grid unit covers its upward rounding.
        g_floor = int(g_value)
        f_bound = root_upper(right) * SCALE / (a + b*left)
        f_ceil = -(-f_bound.numerator // f_bound.denominator)
        d_num = max((i-2*subdivisions)**2, (i+1-2*subdivisions)**2)
        g_lo_sum += next_lo * previous_g
        g_hi_sum += surv_hi * (g_floor + 1)
        gd_hi_sum += surv_hi * (g_floor + 1) * d_num
        f_hi_sum += surv_hi * f_ceil
        fd_hi_sum += surv_hi * f_ceil * d_num
        previous_g, surv_lo, surv_hi = g_floor, next_lo, next_hi

    # For T >= 16, g < 3 and f < 2. E[d(T)^2 | T >= 16] = 113 by the exponential law.
    require(9*b > 1 and 16*a*b > 1, "radial tail heights")
    tail = F(surv_hi, survival_scale)
    scale = subdivisions * SCALE * survival_scale
    g_lo = F(g_lo_sum, scale)
    g_hi = F(g_hi_sum, scale) + 3*tail
    gd_hi = F(gd_hi_sum, scale*square_scale) + 3*113*tail
    f_hi = F(f_hi_sum, scale) + 2*tail
    fd_hi = F(fd_hi_sum, scale*square_scale) + 2*113*tail
    require(g_lo > 0 and g_hi < F(41, 40), "radial mean")
    require(gd_hi < F(17, 20) * g_lo, "weighted radial fraction")
    require(max(f_hi, fd_hi) < F(6, 5), "large-value even-core term")
    return g_lo, g_hi, gd_hi, f_hi, fd_hi


def main():
    # Alternating arctangent bounds in Machin's formula.
    small = F(1, 239)
    pi_lo = 16*(F(1, 5) - F(1, 3*5**3)) - 4*small
    pi_hi = 16*(F(1, 5) - F(1, 3*5**3) + F(1, 5*5**5)) - 4*(small - small**3/3)
    require(pi_lo > F(157, 50) and pi_hi < F(22, 7), "pi enclosure")
    minimum, large = phase_discount()
    print("Lower bounds on the layer-cake discount for h <= 1/20 and h >= 1/20:", minimum, large)
    moment_bounds = radial_moments(F(699, 1250), F(179, 1250))
    print("Radial rational enclosures (g lower, g upper, gd² upper, f upper, fd² upper):", moment_bounds)

    coeff = F(1, 2)
    beta = F(4)
    for j in range(1, 17):
        beta -= 4 * coeff / (4*j + 1)
        coeff *= F(2*j - 1, 2*j + 2)
    integral_upper = F(619, 500)
    require(beta**2 < 8*integral_upper**2, "upper bound for the unsplit layer-cake integral")
    power = F(487, 200)
    factor = 4*(integral_upper - DISCOUNT)*F(41, 40)/F(157, 50)
    require(8*factor**4 < power**4, "two-harmonic power coefficient")
    require(F(6, 5) - F(2500, 1891) < -F(3, 25), "linear coefficient")
    budget = F(1241, 25_000_000)
    # B_o/W maxima for arbitrary splitting, a 10% smaller harmonic, a single harmonic, pure nu.
    for ratio, denominator in [(F(2), 1_800_000), (F(8, 5), 1_440_000),
                               (F(1), 900_000), (F(17, 20), 765_000)]:
        require(power**4 * (ratio / (2*denominator))**3 < budget**4, "peak strip endpoint")
        print("B_o/W <=", ratio, "gives the odd premise throughout W <=", F(1, denominator))


if __name__ == "__main__":
    main()
