"""Sharp signed payoff for random-amplitude Gaussian phases. Agent-ID: codex-a7c4."""

from fractions import Fraction as Q
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
import gaussian_driver_compensation as fixed


def main():
    # Recheck both scalar endpoint covers, terminal derivative and absolute cap.
    fixed.main()
    nu, alpha = fixed.NU, fixed.E + fixed.NU
    variance_rate = 1 - nu - 9 * alpha / 8 - 75 * nu / 64
    fixed.require(variance_rate > Q(".063"), "sign of the random-amplitude variance")
    fixed.require(
        1 - nu - 10 * alpha / 8 - 75 * nu / 64 < 0,
        "deleting the stated Lipschitz tariff",
    )
    fixed.require(alpha - nu == fixed.E > 0, "positive remote energy debit")
    negative = 2 * nu + alpha * Q(17, 16) * fixed.A_HI
    fixed.require(
        negative < Q(".705") < fixed.cap_at_one(nu, fixed.A_LO),
        "absolute payoff at both signs",
    )

    # Two equally probable remote radii. Both vectors have positive energy on
    # both events. A random sign in the remote vector makes the law antipodal.
    radius = [Q(3, 5), Q(4, 5)]
    average = lambda powers: sum(r**powers for r in radius) / 2
    gap = average(2) - average(1) ** 2
    fixed.require(gap == Q(1, 100), "averaging before squaring the linear projection")
    for j in (3, 5):
        fixed.require(
            0 < average(2 * j) - average(j) ** 2 < j * j * gap,
            "nonconstant tensor means",
        )
    print(f"Random-amplitude variance reserve ≥ {variance_rate} times pi/4 at w=0.")
    print("Absolute payoff from the opposite sign < .705.")
    print("The same 1.40397477–1.40397478 optimal restricted reciprocal applies.")


if __name__ == "__main__":
    main()
