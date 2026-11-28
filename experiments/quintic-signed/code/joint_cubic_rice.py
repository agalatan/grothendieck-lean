"""Check the scalar inequality in the joint physical projection estimate. Agent-ID: codex-a7c4."""

from fractions import Fraction as Q
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
from bernstein_tilted_prices import bracket
from one_coordinate_multiplier import pi_interval, require


def constants():
    # C bounds u*(1-exp(-u)+2*u*exp(-u))^2 / (u-1+exp(-u)).
    c = Q(6)
    a, b, mesh = Q(1, 8), Q(8), 256
    # Near zero use k<=3u and e^{-u}-1+u>=u^2/2-u^3/6.
    require(9 * a <= c * (Q(1, 2) - a / 6), "small positive arguments")
    # For u>=8, u exp(-u) decreases and the denominator exceeds 7u/8.
    require((1 + 2 * b * bracket(b)[1]) ** 2 <= c * (1 - 1 / b), "large arguments")
    exps = {j: bracket(Q(j, mesh)) for j in range(int(a * mesh), int(b * mesh) + 1)}
    for j in range(int(a * mesh), int(b * mesh)):
        lo, hi = Q(j, mesh), Q(j + 1, mesh)
        low, high = exps[j]
        k = 1 - exps[j + 1][0] + 2 * hi * high
        require(
            lo - 1 + low > 0 and hi * k * k <= c * (lo - 1 + low),
            "mixed derivative / Rice gap",
        )
    # μ/2 and μ/(2+9 μ/4) exceed the published odd and even weights.
    lower = Q(".886226925452757")
    require(
        4 * lower**2 < pi_interval()[0]
        and lower / 2 > Q(".44")
        and lower / (2 + 9 * lower / 4) > Q(".22"),
        "joint projection coefficients",
    )
    return Q(".44"), Q(".22")


if __name__ == "__main__":
    print("Uniform Rice derivative and the odd/even projection weights:", *constants())
