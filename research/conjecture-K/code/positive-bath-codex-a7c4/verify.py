"""Exact positive-bath bounds at the peak, rows 6.3.46 and 7.4.19.

Run with python3 -IB. All inputs live in the repository. Agent-ID: codex-a7c4.
"""
import hashlib
import importlib.util
import json
from fractions import Fraction as Q
from math import factorial
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
CODE = HERE.parent
BETA = Q(6, 25)
C, H, SQRT_CHI, M2 = map(Q, (".3", "2.2", "1.225", "4.67"))
FULL = (16000, 27000)
LOCAL = {
    "share41": (3700, 6000), "excess28": (12000, 27000),
    "moderate": (1150, 2200), "one": (900, 1800),
}
SCHUR_FEE = Q(3241, 1186575200)


def require(condition, message):
    if not condition:
        raise ArithmeticError(message)


def load_verifier(package):
    spec = importlib.util.spec_from_file_location(package, CODE / package / "verify.py")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def mixed_prices(k, k1, k0, chi):
    """Coefficients of u² and u³ in the increase of C²/beta − D."""
    max_chi = Q(3, 2)
    quadratic = k * chi * (
        Q("3.346") * (1 + max_chi * k0)
        + (2 * C * H * SQRT_CHI + H**2 * max_chi * k0) / BETA
    )
    cubic = k1 * chi * M2 * (6 + 5 * chi) * (1 + H * SQRT_CHI * k0 / C) / BETA
    return quadratic, cubic


def check_cover(strong, inputs, majorants, rows, full_band, critical, divisors=None):
    raw, _, _, _, rice = inputs
    floor_u = Q(".00798") if full_band else Q(".008")
    cap_u = Q(".0463")
    if critical:
        floor_u = Q(".03874") if full_band else Q(".03868")
        cap_u = Q(".04194")
        min_divisor = FULL[0] if full_band else min(n0 for n0, _ in LOCAL.values())
        require(floor_u * (1 + Q(3, 2 * min_divisor)) < Q(".03875"),
                "critical lower edge")

    def lower_chi(chi):
        return Q(".077") if full_band and chi == Q(".0784") else chi

    targets = {
        family: [strong.Rectangle(floor_u, cap_u, lower_chi(lo), hi)]
        for family, (lo, hi, _, _) in strong.BLOCKS.items()
    }
    cells, margins = [], []
    for u_lo, u_hi, chi_lo, chi_hi, index, family in rows:
        require(family in targets and type(index) is int and 0 <= index < len(majorants),
                "invalid cell assignment")
        u_lo, u_hi, chi_lo, chi_hi = map(Q, (u_lo, u_hi, chi_lo, chi_hi))
        chi_lo = lower_chi(chi_lo)
        if full_band and u_lo == Q(".008"):
            u_lo = Q(".00798")
        if critical:
            u_lo, u_hi = max(u_lo, floor_u), min(u_hi, cap_u)
            if u_hi <= u_lo:
                continue
        box = strong.Rectangle(u_lo, u_hi, chi_lo, chi_hi)
        cells.append(strong.Cell(box, index, family))
        n0, n1 = divisors or (FULL if full_band else LOCAL[family])
        require(0 < n0 <= n1, "invalid perturbation triangle")
        k0 = Q(1, n0)
        # The origin is dominated since all perturbation prices are nonnegative.
        for k, k1 in ((k0, 0), (Q(1, n1), Q(1, n1))):
            for chi in (chi_lo, chi_hi):
                price = strong.cubic_price(raw, family, majorants[index], u_lo, chi)
                quadratic, cubic = mixed_prices(k, k1, k0, chi)
                price[2] += quadratic
                price[3] += cubic
                gap = [rice[j] - price[j] for j in range(4)] + rice[4:]
                margins.extend(raw.bernstein_1d(gap, u_lo, u_hi))

    strong.check_partition(cells, targets)
    floor = min(margins)
    require(floor > (SCHUR_FEE if critical else 0), "insufficient mixed margin")
    return len(cells), floor


def main():
    for row in (HERE / "PUBLIC_INPUTS.sha256").read_text().splitlines():
        digest, path = row.split(maxsplit=1)
        require(hashlib.sha256((ROOT / path).read_bytes()).hexdigest() == digest,
                "public input changed: " + path)
    strong = load_verifier("strong-content-blocks-codex-a7c4")
    shared = load_verifier("shared-bath-perturbation-codex-a7c4")
    inputs = strong.read_inputs()
    # Row 6.3.45 rechecks the occupancy weights, curvature, shape bounds and low edges.
    shared.check_constants(strong, inputs[3])
    require(shared.COMMON_DIVISOR == FULL[0] and
            shared.LOCAL_DIVISORS == {key: value[0] for key, value in LOCAL.items()},
            "inherited perturbation divisors")
    require((4 * Q(5353, 625))**2 < 54 * M2**2, "peak g'(0) square")
    require(factorial(4) - 5 * factorial(3) + 8 * factorial(2) - 4 * factorial(1) == 6,
            "nonzero first variation in a Wick block")

    data = json.loads((CODE / "strong-content-blocks-codex-a7c4/blocks.json").read_bytes())
    majorants = [list(map(Q, row)) for row in data["cubics"]]
    raw, caps, tail, _, _ = inputs
    strong.check_majorants(raw, caps, tail, majorants)
    rows = data["cells"]
    for label, full_band, critical, target in (
        ("Local content", False, False, 3111),
        ("Full content", True, False, 55373),
        ("Local joint", False, True, 8589410),
        ("Full joint", True, True, 8475839),
    ):
        count, margin = check_cover(strong, inputs, majorants, rows, full_band, critical)
        require(margin > Q(target, 10**12), "published lower margin")
        print(f"{label}: {count} rectangles; margin > {target}/10^12")

    def altered(cells, divisors=None):
        return check_cover(strong, inputs, majorants, cells, True, False, divisors)

    shared.reject(lambda: altered(rows[:-1]), "gap or overlap")
    shared.reject(lambda: altered(rows, (500, 500)), "insufficient mixed margin")
    shared.reject(lambda: altered(rows, (27000, 16000)), "invalid perturbation triangle")
    # Retaining the old divisor even for pure degree one fails the signed-margin test on the full cover.
    shared.reject(lambda: altered(rows, (16000, 16000)), "insufficient mixed margin")
    print("Four corruption controls and both low-edge transfers passed.")


if __name__ == "__main__":
    main()
