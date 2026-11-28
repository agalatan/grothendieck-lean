"""Constant energy, unrestricted neutral remote orientation. Agent-ID: codex-a7c4."""

from fractions import Fraction as Q
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
import gaussian_driver_compensation as f

alpha = f.E + f.NU


def main():
    f.main()
    # Realizable sign U=+1 with probability 3/4 and -1 otherwise.
    # Check the two signs independently of the indexed tensor expansion.
    x, p = Q(3, 4), Q(1, 4)
    m = Q(1, 4)
    for j, expanded in [
        (3, x**3 - 3 * x**2 * p * m + 3 * x * p**2 - p**3 * m),
        (
            5,
            x**5
            - 5 * x**4 * p * m
            + 10 * x**3 * p**2
            - 10 * x**2 * p**3 * m
            + 5 * x * p**4
            - p**5 * m,
        ),
    ]:
        moment = Q(5, 8) * (x - p) ** j + Q(3, 8) * (x + p) ** j
        reflected = Q(5, 8) * (p - x) ** j + Q(3, 8) * (-p - x) ** j
        f.require(
            moment == expanded and reflected == -expanded,
            "unbalanced signs at both orientations",
        )
        f.require(
            moment != ((x - p) ** j + (x + p) ** j) / 2,
            "incorrect antipodal substitution",
        )

    # odd single-M constant means are proportional to the actual first-chaos M
    f.require(
        1 - f.NU - 3 * alpha / 8 - 5 * Q(3, 64) * f.NU > Q(".66"),
        "signed single-slot allowance",
    )
    # same bound after flipping g, now with deterministic M.
    f.require(
        1 - f.NU - 3 * alpha / 8 - 16 * Q(3, 64) * f.NU > Q(".66"),
        "reflected deterministic negative slot",
    )
    # For x≥1/2, 2x-p≥1/2, and the fifth residual polynomial ≤11.
    f.require(alpha / 2 > 11 * Q(3, 8) * f.NU, "quadratic tensor absorption")
    # For x≤1/2, simply pay all three- and five-M means after the single first terms.
    for d in [Q(0), f.NU]:
        limits = []
        for j in range(64):
            lo, hi = Q(j, 128), Q(j + 1, 128)
            p = 1 - lo
            b = (
                f.poly_upper(lo, hi, d)
                + f.NU * f.psi_upper(2 * hi - 1)
                + f.A_HI
                * (alpha * p**3 / 8 + d * Q(3, 64) * (10 * hi**2 * p**3 + p**5))
            )
            limits.append(b)
        delta = f.cap_at_one(d, f.A_LO) - max(limits)
        print(
            "low-half clearance at d=", d, "exceeds", int(delta * 10**6), "millionths"
        )
        f.require(delta > Q(".015"), "64 scalar cells across the low half")


if __name__ == "__main__":
    main()
