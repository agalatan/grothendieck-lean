"""Controls for ordered-pair multiplicities, outward roots and extreme sector weights."""

from fractions import Fraction as Q
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))

from symmetric_product import SCALE, intercept, sqrt_scaled_up


def check():
    def need(ok, name):
        if not ok:
            raise ValueError(name)

    for q in (Q(0), Q(1, 13), Q(2, 3), Q(81, 100), Q(5) ** 50):
        r = sqrt_scaled_up(q)
        need(
            (r == 0 or (r - 1) ** 2 < q * SCALE**2) and q * SCALE**2 <= r * r,
            "outward root",
        )

    unit = ((Q(1), Q(1)), (Q(1), Q(1)))
    need(intercept((Q(0), Q(0)), unit, (0, 1)) == 0, "zero prefactor")
    need(intercept((Q(0), Q(1, 7)), unit, (0, 1)) == Q(1, 7), "single mode")
    need(intercept((Q(1), Q(1)), unit, (1, 1)) == 2, "coincident frequencies")
    # At x1=x2 the true normalized quartic equals 3/2. The unsymmetrized
    # matrix has squared price 2. A missing off-diagonal gives a false lower price.
    p = intercept((Q(1), Q(1)), unit, (-1, 2))
    need(Q(3, 2) <= p * p < Q(17, 10), "two distinct unit modes")


if __name__ == "__main__":
    check()
    print("Outward roots and three analytic frequency controls passed.")
