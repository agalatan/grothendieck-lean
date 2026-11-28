"""Small full fourth excess in the deformed-ray comparison. Agent-ID: codex-a7c4."""

from argparse import ArgumentParser
from fractions import Fraction as Q
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
import angular
import deformed_ray as ray
import shape

LIMIT = shape.TARGET
# The existing small-shape row covers through .65 at excess .00058.
ROWS = (
    (".66", ".000345"),
    ("2/3", ".000265"),
    (".67", ".00023"),
    (".675", ".000177"),
    (".68", ".000120"),
    (".685", ".000066"),
    (".69", ".000021"),
    (".692", ".000009"),
    (".694", ".0000015"),
)
SLOPES = tuple(
    map(
        Q,
        (
            ".79",
            ".81",
            ".83",
            ".85",
            ".87",
            ".9",
            ".95",
            "1",
            "1.08",
            "1.15",
            "1.25",
            "1.45",
            "1.7",
            "2",
        ),
    )
)
TRIALS = shape.TRIALS


def parameters(rice, chi):
    b, chi_remote = shape.shape_budget(rice, chi)
    lines = [(slope, shape.support_radius(rice, slope**2, chi_remote)) for slope in SLOPES]
    rice_cap = min(Q("1.193"), shape.support_radius(rice, Q(".81"), chi_remote))
    price = ray.INTERCEPT + ray.SQUARE + ray.RICE * rice_cap
    return (angular.EPS - angular.ETA) / (1 - b), lines, price


def strip(t0, t1, w, lines, price):
    eta, eps = angular.ETA, angular.EPS
    top = min((cap - t0) / l for l, cap in lines)
    angular.need(
        top >= 0 and all(t0 > eta * a for a, *rest in TRIALS), "radius and amplitude monotonicity"
    )

    def old_values(s):
        base = eta + (1 - eta) * t1 * t1 + w * s * s
        return [base] + [
            base
            + eta * ((a - t1) ** 2 + (u - s) ** 2 + 2 * (1 + eta / eps) * c * c + 2 * g * g - debit)
            for a, c, u, g, debit in TRIALS
        ]

    at_zero = old_values(0)

    def old_covers(s):
        return any(max(lo, hi) < LIMIT for lo, hi in zip(at_zero, old_values(s)))

    lo, hi = Q(0), top
    if old_covers(top):
        return True
    angular.need(old_covers(0), "zero remote energy")
    for _ in range(24):
        mid = (lo + hi) / 2
        if old_covers(mid):
            lo = mid
        else:
            hi = mid

    norm = 2 * ray.D**2 / (eps + eta) + ray.B**2 / (2 * eta)
    angular.need(ray.LAM**2 > w * norm, "concavity on the active arm")
    critical = ray.LAM * (price - t0) / (ray.LAM**2 - w * norm)

    def upper(s):
        return eta + (1 - eta) * t1 * t1 + w * s * s - max(0, t0 + ray.LAM * s - price) ** 2 / norm

    return max(upper(s) for s in (lo, top, max(lo, min(top, critical)))) < LIMIT


def verify(repo):
    rice = shape.load_rice(repo)
    start = Q(".65")
    old_excess = Q(dict(shape.CLAIMS)[".65"])
    for endpoint, excess in ROWS:
        end, chi = Q(endpoint), Q(excess)
        angular.need(start < end and 0 < chi <= old_excess, "nested rows")
        pars = parameters(rice, chi)
        cells = [(start, end, 0)]
        count = width = 0
        while cells:
            lo, hi, depth = cells.pop()
            if strip(lo, hi, *pars):
                count += 1
                width += hi - lo
                continue
            angular.need(depth < 18, "open shape/amplitude strip")
            mid = (lo + hi) / 2
            cells.extend(((lo, mid, depth + 1), (mid, hi, depth + 1)))
        angular.need(width == end - start, "closed amplitude cover")
        print(f"Through {endpoint}, full fourth excess <= {excess}; {count} deformed-ray strips.")
        start, old_excess = end, chi
    angular.need(
        angular.ETA + (1 - angular.ETA) * start**2 < LIMIT, "zero cubic at the final endpoint"
    )
    angular.need(
        not strip(Q(".68"), Q(".68"), *parameters(rice, Q(".00016"))),
        "enlarged excess control at .68",
    )


if __name__ == "__main__":
    ap = ArgumentParser(description=__doc__)
    ap.add_argument("--repo", type=Path, default=Path(__file__).resolve().parents[4])
    verify(ap.parse_args().repo)
