"""Exact replay of the peak raw A-content staircase, block criteria and two-radius obstruction.

Run this file with python3 -IB. Only the standard library and pinned repository
sources are needed. Agent-ID: codex-a7c4.
"""

import copy
import hashlib
import importlib.util
import json
from fractions import Fraction as Q
from math import factorial, isqrt
from pathlib import Path
from typing import NamedTuple

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
CODE = HERE.parent
KRAW = CODE / "raw-content-2026-11-17-gemini-5331/verify_raw_content.py"
CAPS = CODE / "audit-2026-11-15-codex-a7c4/remote_stein_original/profile-caps.json"
C6 = Q(4045313, 100000)
BETA = Q(6, 25)


def require(condition, message):
    if not condition:
        raise ArithmeticError(message)


class Rectangle(NamedTuple):
    u_lo: Q
    u_hi: Q
    chi_lo: Q
    chi_hi: Q

    def contains(self, other):
        return (
            self.u_lo <= other.u_lo < other.u_hi <= self.u_hi
            and self.chi_lo <= other.chi_lo < other.chi_hi <= self.chi_hi
        )


class Cell(NamedTuple):
    box: Rectangle
    majorant: int
    family: str


# Earlier strong estimates cover every smaller energy and lower shape edge
# used in the proof. The intervals here are the new closed strips.
STAIRCASE = [
    Rectangle(*map(Q, row))
    for row in [
        (".0007", ".002", ".25", "42"),
        (".002", ".004", ".25", "10"),
        (".004", ".006", ".25", "4"),
        (".006", ".008", ".25", "2"),
        (".008", ".012", ".25", "1.15"),
        (".012", ".018", ".0784", ".4"),
        (".018", ".024", ".0784", ".2"),
        (".024", ".03", ".0784", ".12"),
        (".03", ".035", ".0784", ".09"),
    ]
]

# Bounds on s = sum_j delta_j^(3/2) / u^3 for the four independent-block cases.
# Each multiplier is applied to chi^1 or chi^(3/2), as indicated.
BLOCKS = {
    "share41": (Q(".0784"), Q(42, 41), Q(6481, 41000), False),
    "excess28": (Q(".0784"), Q(3, 2), Q(189, 1000), True),
    "moderate": (Q(".65"), Q("1.4"), Q(21, 100), False),
    "one": (Q(1), Q("1.4"), Q(22, 100), False),
}


def read_inputs():
    if not __debug__:
        raise RuntimeError(
            "the public KRAW benchmark requires Python with assertions enabled"
        )
    for line in (HERE / "PUBLIC_INPUTS.sha256").read_text().splitlines():
        digest, filename = line.split(maxsplit=1)
        require(
            hashlib.sha256((ROOT / filename).read_bytes()).hexdigest() == digest,
            f"changed public input: {filename}",
        )

    spec = importlib.util.spec_from_file_location("kraw", KRAW)
    raw = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(raw)
    profile = json.loads(CAPS.read_bytes())
    caps = [
        (
            Q(row["interval"][0]),
            Q(row["interval"][1]),
            list(map(Q, row["coefficients"])),
        )
        for row in profile["cells"]
    ]
    tail = list(map(Q, profile["tail"]))
    require(
        len(caps) == 68
        and caps[0][0] == 0
        and caps[-1][1] == 2
        and all(a < b and len(p) == 4 for a, b, p in caps)
        and all(left[1] == right[0] for left, right in zip(caps, caps[1:]))
        and len(tail) == 2,
        "incomplete upstream profile envelope",
    )
    a, b = Q(699, 1250), Q(179, 1250)
    derivs, rice_lower = raw.compute_deficit_moments_and_rice_poly(
        a,
        b,
        raw.single_pole_integrals(a, b, n=26),
        raw.single_pole_integrals(a, 3 * b, n=26),
    )
    require(
        len(derivs) == len(rice_lower) == 9, "degree-eight Rice lower bound required"
    )
    return raw, caps, tail, derivs, rice_lower


def check_majorants(raw, caps, tail, majorants):
    for p in majorants:
        require(len(p) == 4 and p[3] > 0, "positive cubic coefficient required")
        for lo, hi, upper in caps:
            diff = [a - b for a, b in zip(p, upper)]
            require(raw.positive_on(diff, lo, hi), "uncertified finite radial cap")
        diff = [p[0] - tail[0], p[1] - tail[1], p[2], p[3]]
        require(
            raw.positive_on(diff, Q(2), Q(32)) and raw.tail_positive(diff, Q(32)),
            "uncertified radial ray",
        )


def check_partition(cells, regions):
    """Check an exact shape tiling on every interval of the induced energy grid."""
    for cell in cells:
        require(
            cell.family in regions
            and any(box.contains(cell.box) for box in regions[cell.family]),
            "cell outside claimed domain",
        )
    for family, target_boxes in regions.items():
        family_boxes = [cell.box for cell in cells if cell.family == family]
        for target in target_boxes:
            edges = {target.u_lo, target.u_hi}
            for box in family_boxes:
                edges.update(
                    u for u in (box.u_lo, box.u_hi) if target.u_lo < u < target.u_hi
                )
            energy = sorted(edges)
            for lo, hi in zip(energy, energy[1:]):
                ranges = sorted(
                    (box.chi_lo, box.chi_hi)
                    for box in family_boxes
                    if box.u_lo <= lo and hi <= box.u_hi
                )
                require(
                    ranges
                    and ranges[0][0] == target.chi_lo
                    and ranges[-1][1] == target.chi_hi
                    and all(
                        left[1] == right[0] for left, right in zip(ranges, ranges[1:])
                    ),
                    "gap or overlap in shape cover",
                )


def chi_to_three_halves(chi):
    """Round the nonnegative square root upwards before multiplying by chi."""
    scale = 10**12
    root = Q(isqrt(chi.numerator * scale**2 // chi.denominator) + 1, scale)
    require(chi >= 0 and root**2 >= chi, "invalid square-root bound")
    return chi * root


def cubic_price(raw, family, p, u_lo, chi):
    """Coefficients in u of the rational upper bound on EV + C²/beta."""
    if family == "arbitrary":
        excess = chi_to_three_halves(chi)
        content = Q(14, 15) * raw.ka_piecewise(u_lo) * excess
    else:
        _, _, multiplier, use_three_halves = BLOCKS[family]
        excess = multiplier * (chi_to_three_halves(chi) if use_three_halves else chi)
        content = Q(399, 50) * excess
    return [
        p[0],
        p[1],
        p[2] * (2 + chi),
        p[3] * (6 + 9 * chi + C6 * excess) + content / BETA,
    ]


def verify_cover(inputs, data, regions, threshold):
    raw, caps, tail, _, rice_lower = inputs
    majorants = [list(map(Q, p)) for p in data["cubics"]]
    check_majorants(raw, caps, tail, majorants)
    cells = []
    for row in data["cells"]:
        if set(regions) == {"arbitrary"}:
            u_lo, u_hi, chi_lo, chi_hi, index = row
            family = "arbitrary"
        else:
            u_lo, u_hi, chi_lo, chi_hi, index, family = row
        require(
            type(index) is int and 0 <= index < len(majorants), "invalid majorant index"
        )
        cells.append(
            Cell(Rectangle(*map(Q, (u_lo, u_hi, chi_lo, chi_hi))), index, family)
        )
    check_partition(cells, regions)

    margins = []
    for box, index, family in cells:
        # The price is convex in chi. The endpoints suffice even for p[2] < 0.
        for chi in (box.chi_lo, box.chi_hi):
            price = cubic_price(raw, family, majorants[index], box.u_lo, chi)
            difference = [rice_lower[j] - price[j] for j in range(4)] + rice_lower[4:]
            margins.extend(raw.bernstein_1d(difference, box.u_lo, box.u_hi))
    floor = min(margins)
    require(floor > threshold, "insufficient signed margin")
    return len(majorants), len(cells), floor


def exp_minus_taylor(x, degree):
    """For x ≥ 0 odd truncations bound exp(-x) below and even ones bound it above."""
    return sum((-x) ** j / factorial(j) for j in range(degree + 1))


def check_obstruction(inputs):
    raw, _, _, derivatives, _ = inputs
    energy, low, high, high_prob = Q("0.0463"), Q(5, 9), Q(11, 2), Q(8, 89)
    low_prob = 1 - high_prob
    z_low, z_high = energy * low, energy * high
    require(
        low_prob * low + high_prob * high == 1
        and low_prob * low**2 + high_prob * high**2 == 3
        and low_prob * low**3 + high_prob * high**3 == Q(136, 9),
        "incorrect radial moments",
    )
    require(Q(136, 9) <= 15 + C6, "sixth-moment budget exceeded")

    def profile_lower(z):
        return max(
            sum(derivatives[j].lo * z**j / factorial(j) for j in range(n + 1))
            for n in (0, 2, 4, 6, 8)
        )

    benchmark_upper = min(
        sum(derivatives[j].hi * energy**j for j in range(n + 1)) for n in (1, 3, 5, 7)
    )
    deficit_upper = (
        benchmark_upper
        - low_prob * profile_lower(z_low)
        - high_prob * profile_lower(z_high)
    )
    require(deficit_upper < Q(1336, 10**6), "relaxed deficit ceiling")

    # Jensen under t dν/M₁ gives g'(x) ≥ M₁ exp(-x M₂/M₁).
    _, _, _, peak = raw.certify_section_ab()
    m1_lower = peak[-1][1].lo
    rate = peak[-1][2].hi / m1_lower
    require(m1_lower > 0 and rate > 0, "positive Laplace moments required")
    response_gap = (
        m1_lower
        / rate
        * (exp_minus_taylor(rate * z_low, 17) - exp_minus_taylor(rate * z_high, 18))
    )
    require(response_gap > Q(".2464"), "insufficient response gap")

    content_squared = Q(7, 20000)
    require(
        content_squared > BETA * deficit_upper, "obstruction does not violate target"
    )
    require(
        content_squared < Q(93, 100) * Q(9, 2) * energy**3
        and Q(93, 100) ** 2 < Q(13, 15)
        and content_squared < Q(58, 125) * energy**2,
        "explicit scalar content caps exceeded",
    )

    def rayleigh_lower(radius):
        return exp_minus_taylor(radius**2, 33)

    def rayleigh_upper(radius):
        return exp_minus_taylor(radius**2, 34)

    # The quoted first-chaos pairing is attainable for an actual Gaussian X.
    require(
        rayleigh_lower(Q("1.55")) > high_prob > rayleigh_upper(Q("1.56")),
        "incorrect Rayleigh quantile bracket",
    )
    high_integral = Q("1.55") * high_prob + sum(
        rayleigh_lower(Q("1.56") + Q(i, 8)) / 8 for i in range(1, 9)
    )
    cuts = list(map(Q, (".25", ".5", "1", "1.5")))
    low_integral = sum(
        l * (rayleigh_lower(l) - rayleigh_upper(r)) for l, r in zip(cuts, cuts[1:])
    )
    require(
        min(high_integral, low_integral) > 0
        and min(z_low * low_integral**2, z_high * high_integral**2) * response_gap**2
        > content_squared,
        "insufficient Gaussian first-chaos pairing",
    )


def expect_rejection(inputs, data, regions, threshold, mutate, expected):
    changed = copy.deepcopy(data)
    mutate(changed)
    try:
        verify_cover(inputs, changed, regions, threshold)
    except ArithmeticError as error:
        require(str(error) == expected, f"unexpected rejection: {error}")
    else:
        raise ArithmeticError(f"corrupt certificate accepted: {expected}")


def main():
    inputs = read_inputs()
    require(
        Q(14, 15) ** 2 > Q(13, 15)
        and Q(6481, 1000) ** 2 > 42
        and 28 * Q(189, 1000) ** 2 > 1,
        "incorrect outward constants",
    )
    general = json.loads((HERE / "cover.json").read_text())
    blocks = json.loads((HERE / "blocks.json").read_text())
    general_regions = {"arbitrary": STAIRCASE}
    block_regions = {
        family: [Rectangle(Q(".008"), Q(".0463"), lo, hi)]
        for family, (lo, hi, _, _) in BLOCKS.items()
    }
    general_threshold = Q(94956704, 10**15)
    block_threshold = Q(461567833, 10**15)
    for name, data, regions, threshold in (
        ("General staircase", general, general_regions, general_threshold),
        ("Independent blocks", blocks, block_regions, block_threshold),
    ):
        n_poly, n_cells, _ = verify_cover(inputs, data, regions, threshold)
        print(
            f"{name}: {n_poly} majorants, {n_cells} rectangles, signed margin > {threshold}"
        )
    check_obstruction(inputs)
    print("Two-radius obstruction: chi=1, E v^3=136/9, D<1336/10^6 and C^2=7/20000.")

    def lower_intercept(data):
        data["cubics"][0][0] = "0"

    def wrong_majorant(data):
        data["cells"][-1][4] = 0

    for mutate, expected in (
        (lower_intercept, "uncertified finite radial cap"),
        (lambda d: d["cells"].pop(0), "gap or overlap in shape cover"),
        (wrong_majorant, "insufficient signed margin"),
    ):
        expect_rejection(
            inputs, general, general_regions, general_threshold, mutate, expected
        )
    expect_rejection(
        inputs,
        blocks,
        block_regions,
        block_threshold,
        lambda d: d["cells"].pop(),
        "gap or overlap in shape cover",
    )
    print("Rejected all four corruption controls.")


if __name__ == "__main__":
    main()
