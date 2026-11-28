"""Reintegrate the 78 Hermite caps and the tangent consumed by verify.py.

Run with python-flint installed: python -IB replay_caps.py
"""

import json
from fractions import Fraction
from functools import lru_cache
from importlib.util import module_from_spec, spec_from_file_location
from pathlib import Path

from flint import arb


ROOT = Path(__file__).resolve().parents[2]
ORIGINAL = ROOT / "code/audit-2026-11-15-codex-a7c4/remote_stein_original"
EXTENSION = ROOT / "sources/received-2026-11-15-tilted-sector/deficit_dual_profile_caps.json"


def check(condition, message):
    if not condition:
        raise ValueError(message)


def ball(q):
    q = Fraction(q)
    return arb(q.numerator) / q.denominator


def majorizes(stored, exact_balls, label):
    check(len(stored) == len(exact_balls), f"{label}: wrong number of coefficients")
    for k, (proposed, actual) in enumerate(zip(stored, exact_balls)):
        check(ball(proposed) > actual, f"{label}: coefficient {k} is not strictly above the enclosure")


def replay(evaluate, first, extension):
    @lru_cache(None)
    def value(node):
        return evaluate(ball(node))

    left = Fraction(0)
    for table, count, end in ((first, 68, 2), (extension, 10, 64)):
        check(len(table["cells"]) == count, f"expected {count} radial cells")
        for row in table["cells"]:
            lo, hi = map(Fraction, row["interval"])
            a, b = map(Fraction, row["nodes"])
            check(lo == left < hi and 0 < a < b, f"invalid cell or nodes at {lo}")
            f, df = value(a)
            g, dg = value(b)
            h = ball(b - a)
            x = ball(a)
            # First expand at a, then shift the basis to powers of s >= 0.
            quadratic = (3 * (g - f) - h * (2 * df + dg)) / h**2
            cubic = (h * (df + dg) - 2 * (g - f)) / h**3
            majorizes(row["coefficients"],
                      [f - x*df + x**2*quadratic - x**3*cubic,
                       df - 2*x*quadratic + 3*x**2*cubic, quadratic - 3*x*cubic, cubic],
                      f"cell [{lo},{hi}]")
            left = hi
        check(left == end, f"radial table must end at {end}")

    f, df = value(left)
    majorizes(extension["tail"], [f - ball(left)*df, df], "tangent at 64")


def main():
    # The published integrator checks its bisection and quadrature with assertions.
    if not __debug__:
        raise RuntimeError("The archived Arb evaluator requires Python without -O")
    spec = spec_from_file_location("peak_radial_profile", ORIGINAL / "profile.py")
    profile = module_from_spec(spec)
    spec.loader.exec_module(profile)
    first = json.loads((ORIGINAL / "profile-caps.json").read_bytes())
    extension = json.loads(EXTENSION.read_bytes())
    replay(profile.evaluate, first, extension)
    print("Verified 312 cubic coefficients on 78 cells covering [0,64] and both tangent coefficients at 64.")


if __name__ == "__main__":
    main()
