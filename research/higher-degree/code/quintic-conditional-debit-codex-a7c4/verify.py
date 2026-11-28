"""Conditional degree-five payoff bounds and unconditional energy rectangles.

Agent-ID: codex-a7c4. Run with python3 -IB verify.py. The optional
--ray-source FILE cross-checks the five buffered constants against the JSON
at PR #832, commit 5d5a1a796950c3b3b1c19e4250da9ffe77593eb7. Those
radius inequalities are hypotheses of the interval result. The rectangles
use only the conditional-moment geometry and the exact integral in this folder.
"""

import argparse
import hashlib
import json
import sys
from dataclasses import dataclass
from fractions import Fraction as F
from pathlib import Path

# The documented isolated-Python invocation excludes the script directory.
sys.path.insert(0, str(Path(__file__).resolve().parent))
from joint_integral import certify, exact, floor


EPS, ETA = F("0.78"), F("0.0779")
MIXED_PRICE = EPS - ETA
A, C, W, G = map(F, ("1.79", ".65", ".93", ".185"))
INTEGRAL = F("2.575")
BILLION = 10**9
RAW_RADIUS = F(2287, 2500)  # unbuffered L¹/L² bound, Conjecture K row 3.7
UNIT_RAY = F("1.254094")
SHA256 = "0e6ded21f92142cf75602411efcef827a8b360b168258e7b189187bbba0b7dd6"


def require(condition, description):
    if not condition:
        raise ValueError(description)


@dataclass(frozen=True)
class Ray:
    left: F
    right: F
    s: F
    radius: F


# The first interval uses the unbuffered radius, so its s is a sentinel.
LOW_RAYS = (
    Ray(0, F(".2"), 0, RAW_RADIUS),
    Ray(F(".2"), F(".32"), F("9/2"), F("2.145169")),
    Ray(F(".32"), F(".405"), F(3), F("1.809626")),
    Ray(F(".405"), F(".49"), F(2), F("1.551540")),
    Ray(F(".49"), F(".55"), F("3/2"), F("1.409699")),
)


def cross_check_source(path):
    data = path.read_bytes()
    require(hashlib.sha256(data).hexdigest() == SHA256, "unknown #832 source file")
    rows = json.loads(data)["midt_nodes"]
    published = {exact(row["s"]): exact(row["r_buf"]) for row in rows}
    for s, radius in [(row.s, row.radius) for row in LOW_RAYS[1:]] + [(1, UNIT_RAY)]:
        require(published.get(s) == radius, f"mismatch at s={s} in #832")


def discarded(t, sigma_squared, mixed):
    """The payoff upper bound obtained after dropping every negative term."""
    return (1 - ETA) * t * t + ETA + MIXED_PRICE * (sigma_squared + mixed)


def joint_upper(t, sigma, mixed, integral):
    """The joint trial F=Z(a+c(T−2)+b(T²−6T+6)), G=w+g(T−1).

    d=√2 c in the unit visible-cubic basis, and the physical quintic
    coefficient is matched without displacement. mixed=||H||².
    """
    charge = (A - t) ** 2 + (W - sigma) ** 2 + 2 * (1 + ETA / EPS) * C * C + 2 * G * G
    return discarded(t, sigma * sigma, mixed) + ETA * (charge - integral)


def low_maximum(rows, mixed):
    cursor = 0
    values = []
    for row in rows:
        require(
            row.left == cursor and row.left < row.right,
            "gap or overlap in low-ray cover",
        )
        if row.s == 0:
            require(
                row.left == 0 and row.radius == RAW_RADIUS, "invalid unbuffered row"
            )
        else:
            require(
                row.s > 0 and row.right <= row.radius,
                "invalid buffered radius or scale",
            )
        for t in (row.left, row.right):
            sigma_squared = (
                row.radius**2 if not row.s else (row.radius - t) ** 2 / row.s
            )
            # In sigma² the bound is increasing; after substitution it is convex in t.
            values.append(discarded(t, sigma_squared, mixed))
        cursor = row.right
    require(cursor == F(".55"), "low-ray cover must end at .55")
    return max(values)


def joint_maximum(left, right, sigma_upper, mixed, integral):
    """On [left,right], sigma_upper(t) must be affine and nonnegative.

    The joint bound is a convex quadratic in (t,sigma) with positive
    diagonal Hessian. Its maximum on the trapezoid is at a vertex.
    """
    require(0 <= left < right and mixed >= 0, "invalid joint domain")
    values = []
    for t in (left, right):
        ceiling = sigma_upper(t)
        require(ceiling >= 0, "negative remote RMS ceiling")
        values.extend(joint_upper(t, sigma, mixed, integral) for sigma in (0, ceiling))
    return max(values)


def conditional_margin(k, mixed, integral, rows=LOW_RAYS):
    low = low_maximum(rows, mixed)
    high = joint_maximum(F(".55"), F(".65"), lambda t: UNIT_RAY - t, mixed, integral)
    return 1 / k - max(low, high)


def check_barrier():
    # Machin: pi=16atan(1/5)-4atan(1/239). Four terms are below the
    # first arctangent, one term above the second, by alternation.
    x = F(1, 5)
    pi_low = 16 * (x - x**3 / 3 + x**5 / 5 - x**7 / 7) - F(4, 239)
    require(4 / pi_low - 1 < F(8, 27) < F(5, 16), "angular support constants")
    t = F(".618")
    witness = F(".4034")
    require(t*t + witness < pi_low / 4, "strict disk interior witness")
    require(discarded(t, witness, 0) == F(".7132992604") > F(500, 701), "interior scalar barrier")
    gaussian = discarded(t, pi_low / 4 - t * t, 0)
    require(gaussian > F(500, 701) + F(83, 10**6), "old scalar Gaussian barrier lost")
    return gaussian - F(500, 701)


def rejected(fn, cause):
    try:
        fn()
    except cause:
        return
    raise ValueError(f"negative control was accepted, expected {cause.__name__}")


def controls():
    # The exact proposed reserves fail below these tests. Their failure
    # concerns this majorant, not the actual payoff.
    t = F(".65")
    sigma = UNIT_RAY - t
    k = F("1.4023")
    require(joint_upper(t, sigma, 0, F("2.53")) > 1 / k, "weakened pure-remote control")
    require(
        joint_upper(t, sigma, F(".0039"), F("2.56")) > 1 / k, "weakened mixed control"
    )
    require(
        conditional_margin(k, F(".004"), INTEGRAL) < 0, "larger mixed allowance control"
    )
    # Both sigma endpoints matter for possible uses of the helper.
    require(
        joint_maximum(F(".6"), t, lambda _: F(".1"), 0, INTEGRAL)
        == joint_upper(t, 0, 0, INTEGRAL),
        "zero-RMS endpoint control",
    )
    rejected(lambda: low_maximum(LOW_RAYS[:2] + LOW_RAYS[3:], 0), ValueError)
    rejected(lambda: joint_maximum(F(".55"), t, lambda _: -1, 0, INTEGRAL), ValueError)
    rejected(lambda: certify(A, C, W, G, 2.575), TypeError)
    rejected(lambda: certify(A, C, W, G, INTEGRAL, grid=64.0), TypeError)
    rejected(lambda: certify(A, C, W, G, INTEGRAL, radius=6.0), TypeError)
    rejected(lambda: certify(A, C, W, G, INTEGRAL, max_depth=True), TypeError)
    rejected(lambda: certify(A, C, W, G, INTEGRAL, grid=8, radius=6), ValueError)
    rejected(lambda: certify(A, C, W, G, INTEGRAL, max_depth=0), ValueError)
    rejected(lambda: certify(0, 0, 0, 0, 1, max_depth=0), ValueError)


def verify():
    bound, boxes = certify(A, C, W, G, INTEGRAL)
    require(bound > INTEGRAL, "joint distance integral missed the declared lower bound")
    print(f"Integral > {INTEGRAL} uniformly on [-1,1] ({boxes} tilt intervals).")
    pure_high = joint_maximum(F(".55"), F(".65"), lambda t: UNIT_RAY-t, 0, INTEGRAL)
    require(pure_high == F(26638373521853, 37500000000000), "upper trapezoid payoff")
    require(max(pure_high, low_maximum(LOW_RAYS, 0)) < F(".71035662725"), "uniform affine cap")
    # Keep the declared floor even when the radial integrator returns stronger data.
    for k, mixed, reserve in [("1.4023", ".0039", 19352), ("1.4025", ".00375", 22975)]:
        margin = conditional_margin(F(k), F(mixed), INTEGRAL)
        require(margin > F(reserve, BILLION), "conditional margin at " + k)
        print(
            f"With the five buffered radii: t in [0,.65], ||H||² <= {mixed}, "
            f"1/{k} minus payoff > {reserve}/{BILLION}."
        )

    # Explicit energy rectangles are independent of every buffered radius.
    k = F("1.4025")
    for end, rms, mixed, reserve in [
        (".65", ".58", ".030", 354831),
        (".70", ".53", ".005", 396731),
        (".80", ".28", ".005", 11431),
    ]:
        tmax, smax, hmax = map(F, (end, rms, mixed))
        maximum = joint_maximum(0, tmax, lambda _: smax, hmax, INTEGRAL)
        require(1 / k - maximum > F(reserve, BILLION), "explicit rectangle " + end)
        require(
            discarded(tmax, smax**2, hmax) > 1 / k, "discarded-energy corner control"
        )
        print(
            f"Without radius assumptions: t <= {end}, σ <= {rms}, ||H||² <= {mixed}, "
            f"1/1.4025 minus payoff > {reserve}/{BILLION}."
        )
    gaussian_excess = check_barrier()
    controls()
    print(
        f"At t=.618 the old Gaussian scalar benchmark exceeds 500/701 "
        f"by > {floor(BILLION*gaussian_excess)}/{BILLION}. Negative controls passed."
    )


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--ray-source", type=Path, help="optional pinned #832 JSON")
    args = parser.parse_args()
    if args.ray_source is not None:
        cross_check_source(args.ray_source)
    verify()
