"""Upper sums for the paired complex perturbation on one original real leaf.

All integers representing endpoints have denominator SCALE. The Gaussian integration
weights use their own denominator WEIGHT_SCALE. See COMPLEX_PHASES.md, section 4.
"""
from fractions import Fraction as F
from functools import lru_cache
from math import isqrt
from typing import NamedTuple

A, B, C = F(699, 1250), F(179, 1250), F(15159, 50000)
INV_SQRT2 = F(7071, 10000), F(7072, 10000)
assert 2 * INV_SQRT2[0] ** 2 < 1 < 2 * INV_SQRT2[1] ** 2
SCALE = 1 << 28
WEIGHT_SCALE = 1 << 48
RADIUS_DEN = 32
PI_LO = F(157, 50)  # Archimedes: 223/71 < pi < 22/7.
DISK_FACTOR = F(71, 20)
assert PI_LO < F(223, 71) and DISK_FACTOR ** 2 > 4 * F(22, 7)


def ceil_div(a, b):
    return -(-a // b)


def down(value, scale=SCALE):
    return value.numerator * scale // value.denominator


def up(value, scale=SCALE):
    return ceil_div(value.numerator * scale, value.denominator)


def endpoints(low, high):
    return down(low), up(high)


def product(low, high, left, right):
    corners = low * left, low * right, high * left, high * right
    return min(corners), max(corners)


def scaled_product(pair, other):
    low, high = product(*pair, *other)
    return low // SCALE, ceil_div(high, SCALE)


def distance(low, high):
    return max(0, low, -high)


def square(low, high):
    return distance(low, high) ** 2, max(low ** 2, high ** 2)


def upper_sqrt(n):
    return isqrt(n - 1) + 1 if n else 0


@lru_cache(maxsize=None)
def exp_negative_upper(value):
    # Horner evaluation of sum_{k=0}^40 value^k/k!, a lower bound for exp(value).
    assert value >= 0
    term = F(1)
    for k in range(40, 0, -1):
        term = 1 + value * term / k
    return 1 / term


class SourceCell(NamedTuple):
    x: tuple
    y: tuple
    base_re: tuple
    radial: tuple
    alpha_re: tuple
    beta_re: tuple
    norm_sq: int
    weight: int


def source_cell(xl, xh, yl, yh):
    x2, x2_hi = square(xl, xh)
    y2, y2_hi = square(yl, yh)
    tl, th = x2 + y2, x2_hi + y2_hi
    diff = x2 - y2_hi, x2_hi - y2
    zl, zh = product(*diff, *INV_SQRT2)
    alpha = tl - F(2, 5), th - F(2, 5)
    radial = A + B * tl, A + B * th

    # Gram matrix of e -> (T-2/5)e_A + (c-Z^2/sqrt(2))e_B on R^2.
    amax = max(map(abs, alpha))
    g11 = up(amax ** 2)
    g22 = up(C ** 2 - 2 * C * zl + th ** 2 / 2)
    cross = up(amax * max(abs(C - zl), abs(C - zh)))
    eigen = ceil_div(g11 + g22 + upper_sqrt((g11 - g22)**2 + 4 * cross**2), 2)
    coarse = max(F(3, 2) * t*t - F(37, 100)*t + F(63, 250) for t in (tl, th))
    norm_sq = min(up(coarse), eigen)
    weight = up(2 * (xh - xl) * (yh - yl) * exp_negative_upper(tl) / PI_LO, WEIGHT_SCALE)
    return SourceCell(endpoints(xl, xh), endpoints(yl, yh),
                      endpoints(*product(xl, xh, *radial)), endpoints(*radial),
                      endpoints(*alpha), endpoints(C + zl, C + zh), norm_sq, weight)


@lru_cache(maxsize=None)
def source_grid(n):
    return [source_cell(F(x,n), F(x+1,n), F(y,n), F(y+1,n))
            for x in range(-4*n, 4*n) for y in range(4*n)]


def integral_cost(chart, leaf, modulus, n):
    """Exact upper bound for every real parameter in leaf and ||e|| <= 1/32."""
    import verify as cover

    wl, wh, yl, yh, tl, th = leaf
    wlo, whi = endpoints(wl, wh)
    dirs = [cover.coefficients(chart, y) for y in (yl, yh)]
    a_values, b_values = zip(*dirs)
    alpha = endpoints(*product(tl, th, min(a_values), max(a_values)))
    beta_raw = product(tl, th, min(b_values), max(b_values))
    beta = endpoints(*beta_raw)
    sqrt2_beta = endpoints(*product(*beta_raw, *(2*k for k in INV_SQRT2)))
    tlo, mlo = down(tl), down(modulus)
    assert tlo > 0
    total = 0
    for cell in source_grid(n):
        al, ah = scaled_product(alpha, cell.alpha_re)
        bl, bh = scaled_product(beta, cell.beta_re)
        real = distance(wlo + cell.base_re[0] + al + bl, whi + cell.base_re[1] + ah + bh)
        dl, dh = scaled_product(sqrt2_beta, cell.x)
        imag = distance(*scaled_product(cell.y, (cell.radial[0] + dl, cell.radial[1] + dh)))
        dist = isqrt(real*real + imag*imag)
        h = cell.norm_sq
        radical = isqrt(dist*dist + (tlo*tlo*h) // (SCALE * RADIUS_DEN**2))
        assert dist + radical > 0
        paired = ceil_div(2 * h * SCALE, RADIUS_DEN**2 * (dist + radical))
        if mlo > 0:
            # Average over the cell, from the disc integral of 1/|z-z0|.
            disc = ceil_div(DISK_FACTOR.numerator * h * SCALE * n,
                            DISK_FACTOR.denominator * mlo * RADIUS_DEN**2)
            paired = min(paired, disc)
        total += cell.weight * paired
    # The complement of the square lies in T >= 16, whose first moments are explicit.
    tail = 2 * (F(51,100) + 17 * F(123,100)) * exp_negative_upper(F(16)) / (RADIUS_DEN * tl)
    return F(total, WEIGHT_SCALE * SCALE) + tail
