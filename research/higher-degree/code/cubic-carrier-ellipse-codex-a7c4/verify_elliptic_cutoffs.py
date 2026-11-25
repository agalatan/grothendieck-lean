"""Exact eight-decimal consequences of the elliptic comparison. Agent-ID: codex-a7c4."""
from fractions import Fraction as Q
from math import isqrt


def require(condition, message):
    if not condition:
        raise ArithmeticError(message)


def largest_strict_cutoff(radius, weight, offset):
    eta, carrier, target = Q(779, 10000), Q(431, 500), Q(500, 701)
    intercept = offset + weight * radius**2
    slope = 1 - eta - weight * carrier**2
    require(weight > 0 and slope > 0 and target > intercept, "signs of the payoff majorant")
    scale = 10**8
    squared = (target - intercept) * scale**2 / slope
    # For integer n, n^2 < p/q iff n^2 <= (p-1)//q.
    n = isqrt((squared.numerator - 1) // squared.denominator)
    endpoint, next_point = Q(n, scale), Q(n + 1, scale)
    require(intercept + slope * endpoint**2 < target < intercept + slope * next_point**2,
            "strictly bracket the crossing")
    return n


def main():
    e, eta = Q(39, 50), Q(779, 10000)
    mass_e = Q(25, 31)
    mass_c = Q(1, 2) + 2 * Q(47, 1953)
    mass_s = Q(3798855002922010337121170986221578569, 22939068096000000000000000000000000000)
    # Even the family ceiling cannot certify t=.36 by the displayed mass-row majorant.
    weight = e - eta * mass_e / mass_c
    ceiling, radius, t = Q(4313, 5000), Q(2287, 2500), Q(36, 100)
    value = eta*(1+mass_s/mass_c) + weight*radius**2 + (1-eta-weight*ceiling**2)*t**2
    require(value > Q(500, 701), "Gaussian-axis tuning and the same mass row cannot certify .36")
    rows = [(Q(2287, 2500), 34554022, 35859076), (Q(4571, 5000), 34831349, 36096350)]
    for radius, expected_p, expected_m in rows:
        p = largest_strict_cutoff(radius, e - eta, eta)
        m = largest_strict_cutoff(radius, e - eta * mass_e / mass_c, eta * (1 + mass_s / mass_c))
        require((p, m) == (expected_p, expected_m), "match both reported endpoints")
        print(f"{radius}: Parseval 0.{p:08d}, mass inequality 0.{m:08d}")


if __name__ == "__main__":
    main()
