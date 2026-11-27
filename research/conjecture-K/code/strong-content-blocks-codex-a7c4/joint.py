"""Exact joint raw A+B bounds at the peak (ledger 7.4.18).

Run with python3 -IB. Uses the standard library and the input checks of row 6.3.44.
Agent-ID: codex-a7c4.
"""

import importlib.util
import json
from fractions import Fraction as Q
from pathlib import Path

HERE = Path(__file__).resolve().parent


# Left endpoints, positive square-root interpolation nodes, KRAW's A cap, new B cap.
SLABS = (
    (Q(0),       (Q(41, 40), Q(9, 8)), Q(5353, 625),  Q("1.958")),
    (Q(".01"),   (Q(41, 40), Q(9, 8)), Q(3577, 500),  Q("1.647")),
    (Q(".02"),   (Q(21, 20), Q(5, 4)), Q(6117, 1000), Q("1.416")),
    (Q(".03"),   (Q(15, 14), Q(4, 3)), Q(5323, 1000), Q("1.238")),
    (Q(".035"),  (Q(13, 12), Q(7, 5)), Q(5),          Q("1.164")),
    (Q(".04"),   (Q(11, 10), Q(3, 2)), Q(471, 100),   Q("1.099")),
    (Q(".044"),  (Q(11, 10), Q(3, 2)), Q(9, 2),       Q("1.050")),
)


def require(ok, message):
    if not ok:
        raise ArithmeticError(message)


def verify_b_smoothing(raw):
    a, b = Q(699, 1250), Q(179, 1250)
    ia = raw.single_pole_integrals(a, b, n=26)
    ib = raw.single_pole_integrals(a, 3 * b, n=26)
    # L_j = integral lambda^(j-1/2) d(mu_B)/sqrt(2).
    # Equation (13) of CONTENT_KERNELS.md and the substitution H(t)=t(a+bt)^2.
    terms = {(3, 1): Q(1)}
    moments = []
    for _ in range(5):
        integral = raw.weighted_integral(terms, a, ia, ib)
        moments.append(2 * integral / (raw.SQRT_PI * raw.SQRT_2))
        terms = raw.expand_recurrence(terms, b)
    require(all(v.lo > 0 for v in moments), "B mixing measure moments must be positive")

    # Integral_0^1 z^(1/3) (1-z^2)^j dz.
    z_moments = [Q(3, 4)]
    for j in range(1, len(moments)):
        z_moments.append(z_moments[-1] * Q(3 * j, 3 * j + 2))
    # The zero-energy value has the separate endpoint formula (3 sqrt(6)/4) g'_B(0)^2.
    derivative = Q(3, 8) * raw.weighted_integral({(3, 1): Q(1)}, a, ia, ib) / raw.SQRT_2
    at_zero = (Q(3, 4) * raw.SQRT_6) * derivative * derivative
    require(at_zero.lo > Q("1.957") and at_zero.hi < Q("1.958"), "B endpoint normalization")

    for u, ratios, a_cap, b_cap in SLABS:
        require(a_cap == raw.ka_piecewise(u), "slabs must match the paid A cap")
        poly = raw.certify_radau_q4(*ratios)
        psi = (2 / raw.SQRT_PI) * sum(
            poly[j] * z_moments[j] * moments[j] * u**j for j in range(5)
        )
        require(psi.lo > 0, "upper functional must be positive before squaring")
        enclosure = (Q(3, 256) * raw.SQRT_6) * raw.PI * raw.PI * psi * psi
        require(enclosure.hi < b_cap, "B Radau functional exceeds the stated cap")
        if u == 0:
            require(enclosure.lo <= at_zero.hi and at_zero.lo <= enclosure.hi,
                    "B endpoint and OU normalization disagree")
        # Negative controls. The .04 Radau upper functional is above 1.098.
        # This statement concerns this certifier, not a lower bound for the true K_B.
        if u == Q(".04"):
            require(enclosure.lo > Q("1.098"), "tight-budget control")
            require((6 * (a_cap + b_cap))**2 > (7 * a_cap)**2, "directional factor control")
        require(Q(13, 15)*(6 * (a_cap + b_cap))**2 < (7 * a_cap * Q(197, 200))**2,
                "Target D consumes over 197/200 of the signed deficit allowance")
    print("Seven positive-measure B Radau caps pass; joint diagonal gain costs < 197/200 of the paid allowance.")


def main():
    # The companion script works under isolated Python, even outside this directory.
    spec = importlib.util.spec_from_file_location("strong_content", HERE / "verify.py")
    strong = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(strong)
    inputs = strong.read_inputs()
    verify_b_smoothing(inputs[0])

    left, right = Q(".03875"), Q(".04194")
    schur = Q(31250, 6697)
    slope, error = Q(333, 10000), Q(7, 2000)
    curvature = Q(25, 6) - 4 - schur * slope**2
    require(curvature > 0, "signed square completion")
    fee = (schur * error**2 + (schur * slope * error)**2 / curvature) * Q(".0463")
    require(fee == Q(3241, 1186575200), "signed Schur fee")
    for distance in (Q(".0403448") - left, right - Q(".0403449")):
        require(distance > 0 and Q(27, 25) * distance**2 > fee, "exterior Gaussian buffer")
    require(Q(".00551") < left and all(r.u_hi < left for r in strong.STAIRCASE),
            "general staircase outside the critical interval")

    data = json.loads((HERE / "blocks.json").read_text())
    cells = []
    for u0, u1, c0, c1, index, family in data["cells"]:
        u0, u1 = max(Q(u0), left), min(Q(u1), right)
        if u0 < u1:
            cells.append([u0, u1, c0, c1, index, family])
    # For blocks (unlike general cubics) the cubic price is independent of the
    # energy slab's left endpoint. Clipping its interval preserves the majorant.
    critical_data = {"cells": cells, "cubics": data["cubics"]}
    regions = {name: [strong.Rectangle(left, right, low, high)]
               for name, (low, high, _, _) in strong.BLOCKS.items()}
    threshold = Q(8965588, 10**12)
    require(threshold > fee, "critical-band floor must pay the Schur fee")
    _, count, _ = strong.verify_cover(inputs, critical_data, regions, threshold)
    print(f"All four block families cover the critical interval in {count} clipped rectangles.")
    print(f"Central signed margin > {threshold}, exceeding the signed Schur fee {fee}.")


if __name__ == "__main__":
    main()
