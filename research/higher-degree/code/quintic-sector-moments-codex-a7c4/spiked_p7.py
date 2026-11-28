"""Payoff-conditioned Stein support on a second Pythagorean ray.
Agent-ID: codex-a7c4. Uses the exact P7 C1/C2/C3 verifier.
"""

import json
from fractions import Fraction as Q
from pathlib import Path
from typing import NamedTuple

HERE = Path(__file__).resolve().parent
ABC = (1100, 2379, 2621)
ELL, BETA = Q(ABC[0], ABC[2]), Q(ABC[1], ABC[2])
KNOTS = (Q(2), Q(16, 5), Q(41, 10), Q(53, 10), Q(33, 5), Q(17, 2), Q(12))
WEIGHTS = tuple(Q(n - 138070, 10**6) for n in (252613, 274894, 204324, 204324, 308214))


class Slab(NamedTuple):
    low: Q
    high: Q
    endpoints: tuple


def require(ok, message):
    if not ok:
        raise ValueError(message)


def checked_model(verifier, row, knots):
    result = verifier.verify_spiked_row(
        row,
        ABC,
        [WEIGHTS, [Q(1)] * 5],
        [Q(0), BETA**2],
        {"new": knots},
        quiet=True,
    )
    require(result["ok"], "pointwise spiked Stein certificate")
    endpoints = []
    for name in ("lo", "hi"):
        price = Q(row["sec_dual"][name]["y_sec"][0])
        require(price >= 0, "nonnegative Gram price")
        # Only the first right-hand side was zeroed to expose the
        # intercept. The simplex contribution is already included.
        slope = price * BETA**2
        intercept = result["bounds"][name]
        den = 10**12
        endpoints.append((Q(-(-slope * den // 1), den), Q(-(-intercept * den // 1), den)))
    return Slab(Q(row["s_lo"]), Q(row["s_hi"]), tuple(endpoints))


def read_models(verifier, weights, path=HERE / "p7_stein_rows.json"):
    """Return checked affine functions of the *normalized* Gram charge.

    If the physical projection has energy A and sector energies x_j, the
    supplied charge bounds sum(weights[j]*x_j/A).  The P7 test direction
    has sector energies BETA**2*x_j/A, so the normalized slope includes
    BETA**2.  The second sector row uses sum(E_j) <= BETA**2.
    """
    source = json.loads(path.read_text())
    require(tuple(weights) == WEIGHTS, "same five physical sector prices")
    require(
        tuple(source["abc"]) == ABC and ELL**2 + BETA**2 == 1,
        "normalized second Pythagorean ray",
    )
    models = source["rows"]
    require(len(models) + 1 == len(KNOTS), "six spiked shape slabs")
    checked = []
    for row, low, high in zip(models, KNOTS, KNOTS[1:]):
        require(
            (Q(row["s_lo"]), Q(row["s_hi"])) == (low, high),
            "contiguous fourth-excess intervals",
        )
        checked.append(checked_model(verifier, row, source["knots"]))
    return tuple(checked)


def repriced_model(verifier):
    """Check the original potential with different final Hölder prices at both ends."""
    source = json.loads((HERE / "p7_stein_rows.json").read_text())
    row = next(row for row in source["rows"] if Q(row["s_lo"]) == Q("5.3"))
    require(Q(row["s_hi"]) == Q("6.6"), "repriced interval")
    # Nonnegative Gram multiplier followed by five positive Hölder coefficients.
    prices = {
        "lo": (
            "74523083/625000000",
            "120064247/10000000000",
            "4523397/500000000",
            "42878311/10000000000",
            "99476747/10000000000",
            "148935403/10000000000",
        ),
        "hi": (
            "650388707/5000000000",
            "66240817/5000000000",
            "3290649/312500000",
            "2503039/500000000",
            "106659217/10000000000",
            "41845097/2500000000",
        ),
    }
    for end, (multiplier, *holder) in prices.items():
        row["sec_dual"][end].update(y_sec=[multiplier, "0"], a_hol=holder)
    return checked_model(verifier, row, source["knots"])


def energy_cap(slabs, chi_lo, chi_hi, t_lo, normalized_charge, prior):
    """Tighten A <= prior using a charge valid over the entire shape cell."""
    require(0 <= chi_lo <= chi_hi <= 42, "normalized fourth excess")
    require(t_lo >= 0 and normalized_charge >= 0 and prior >= 0, "nonnegative inputs")
    points = {chi_lo, chi_hi}
    for row in slabs:
        if chi_lo < row.low < chi_hi:
            points.add(row.low)
        if chi_lo < row.high < chi_hi:
            points.add(row.high)
    points = sorted(points)
    intervals = list(zip(points, points[1:])) or [(chi_lo, chi_hi)]
    bounds = []
    for left, right in intervals:
        cap = prior
        for low, high, ends in slabs:
            if low > left or high < right:
                continue
            yl, yr = (base + slope * normalized_charge for slope, base in ends)
            # The physical sector and contraction vectors are common to both
            # shape endpoints. P7 section 5 bounds their objective by a convex
            # function of shape, so their fixed-vector chord is an upper bound.
            radius = max(yl + (yr - yl) * (s - low) / (high - low) for s in (left, right))
            if radius < ELL * t_lo:
                cap = Q(0)
            else:
                cap = min(cap, ((radius - ELL * t_lo) / BETA) ** 2)
        bounds.append(cap)
    # Outside the checked slabs, cap is prior. An interior gap is never skipped.
    return max(bounds)
