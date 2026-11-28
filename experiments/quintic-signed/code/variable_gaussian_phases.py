"""Arbitrary coefficient directions in a conditional Gaussian phase pair. Agent-ID: codex-a7c4."""

from fractions import Fraction as Q
from pathlib import Path
from functools import cache
from math import floor
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
import gaussian_driver_compensation as fixed


PRICES = [
    (Q(".4"), Q(".66916")),
    (Q(".8"), Q(".87632")),
    (Q("1"), Q("1.03123")),
    (Q("1.07793"), Q("1.101439")),
]
TARGET = Q("1.40360")
ALPHA = fixed.E + fixed.NU


def intervals(check):
    work = [(Q(0), Q(1))]
    count = 0
    while work:
        low, high = work.pop()
        if check(low, high):
            count += 1
            continue
        fixed.require(high - low > Q(1, 2**24), f"unresolved [{low}, {high}]")
        middle = (low + high) / 2
        work.extend([(low, middle), (middle, high)])
    return count


@cache
def psi_upper(z):
    if z >= 0:
        return fixed.psi_upper(z)
    lower = Q(0)
    for coefficient in reversed(fixed.COEFF[:32]):
        lower = Q(
            floor(fixed.SCALE * (fixed.A_LO * coefficient + z * z * lower)), fixed.SCALE
        )
    return z * lower


def upper_price(price, left, right):
    a = ALPHA * fixed.A_HI
    top = min(right, max(left, price / (2 * a)))
    p = 1 - left**2
    return (
        a * (1 - top**2)
        + price * top
        + fixed.NU * psi_upper(2 * right**2 - 1)
        + fixed.NU * fixed.A_HI * (3 * right**4 * p + p**3) / 8
    )


def support(power, floor, mean):
    radius = max(mean, floor)
    return power * radius ** (power - 1) * mean - (power - 1) * radius**power


def scalar(l, r, prices, debit=fixed.NU):
    quadratic = (
        (1 - fixed.NU) * r**2
        - ALPHA * support(3, Q(1, 2), l * l) / 8
        - debit * Q(3, 64) * support(5, Q(2, 3), l * l)
    )
    return min(c - s * l for s, c in prices) + max(
        fixed.A_LO * quadratic, fixed.A_HI * quadratic
    )


def main():
    low, high = fixed.atan_bounds(Q(1, 5))
    u, v = fixed.atan_bounds(Q(1, 239))
    fixed.require(
        fixed.PI_LO < 16 * low - 4 * v <= 16 * high - 4 * u < fixed.PI_HI, "pi"
    )
    for k, floor in [(3, Q(1, 2)), (5, Q(2, 3))]:
        fixed.require(
            k * floor ** (k - 1) + (k - 1) * floor**k >= 1,
            "the line must minorize at negative one",
        )
    fixed.require(
        1 - fixed.NU > 3 * ALPHA / 8 + 15 * fixed.NU / 64, "mean of negative slot"
    )
    for s, c in PRICES:
        count = intervals(lambda l, r: upper_price(s, l, r) < c)
        print(f"price {s}, intercept {c}: {count} certified intervals")
    count = intervals(lambda l, r: scalar(l, r, PRICES) < 1 / TARGET)
    residual_debit = Q(1, 50)
    residual_target = Q("1.40340")
    fixed.require(fixed.NU - residual_debit == Q(7, 2000), "positive fifth eigenvalue")
    smaller = intervals(
        lambda l, r: scalar(l, r, PRICES, residual_debit) < 1 / residual_target
    )
    print(
        f"residual fifth eigenvalue 7/2000: reciprocal > {residual_target}, {smaller} intervals"
    )
    point = Q(".9781")
    fixed.require(
        scalar(point, point, PRICES) < 1 / TARGET < scalar(point, point, PRICES[:-1]),
        "deletion of the final supporting line",
    )
    fixed.require(
        1 / (fixed.cap_at_one(0, fixed.A_LO)) < Q("1.4023"),
        "first-chaos-only comparison on the deterministic visible phase",
    )
    print(
        f"all variable coefficient laws: reciprocal > {TARGET}, {count} closed intervals"
    )


if __name__ == "__main__":
    main()
