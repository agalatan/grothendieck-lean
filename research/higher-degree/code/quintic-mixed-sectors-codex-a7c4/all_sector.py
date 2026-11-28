"""Payoff cover for the capped degree-five game through t=.388 (codex-a7c4).
Run from the repository root with python3 -IB path/to/all_sector.py --repo .
"""

import argparse
import copy
import importlib.util
import json
import sys
from fractions import Fraction as Q
from functools import cache
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import sector_gram as gram

ELL, BETA, RHO = Q(84, 205), Q(187, 205), Q(2287, 2500)
L = Q(".08")
Y_MAX = Q(13, 2)
MICRO = 10**6
UNIFORM_MARGIN = Q(1, 100000)
# Unnormalized associated Laguerre coefficients in units 1/100000.
TRIALS = {
    (0, 0): (-13984,),
    (1, 0): (-8001,),
    (0, 1): (-8001,),
    (1, 1): (-11518, -27350),
    (2, 0): (-5078,),
    (2, 1): (-8356, -41936),
}
SLOTS = ((1, 1), (2, 0), (1, 0), (0, 1), (2, 1))
CLAIMS = [
    (Q("1.4023"), Q(".388"), 87166),
    (Q("1.4025"), Q(".3875"), 676157),
    (Q("1.403"), Q(".386"), 181907),
]


def need(ok, message):
    if not ok:
        raise ValueError(message)


def load(path):
    spec = importlib.util.spec_from_file_location(path.parent.name, path)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


def gram_prices():
    shift, mass = gram.ETA / L, gram.ETA + L
    ends = gram.stieltjes_endpoints(shift)
    avg = gram.average_price(ends, shift=shift, mass=mass, trial=Q(-26045, 100000))
    prices = [
        gram.sector_price(i, j, ends, shift=shift, mass=mass, trials=TRIALS)
        for i, j in ((0, 0),) + SLOTS
    ]
    # Round each price down BEFORE subtracting the remote price.
    floors = [v * MICRO // 1 for v in [avg] + prices]
    need(
        floors == [225834, 138070, 252613, 274894, 204324, 204324, 308214],
        "Gram row at c=0",
    )
    h, p00, *other = [Q(v, MICRO) for v in floors]
    return h, p00, [v - p00 for v in other]


def price_chords(repo, weights):
    folder = repo / "research/higher-degree/code/spiked-cubic-radius-gemini-4c4c"
    verifier = load(folder / "verify.py")
    source = json.loads((folder / "cert_spiked.json").read_text())
    ray = source["rays"][0]
    need(
        ray["kind"] == "stein"
        and ray["abc"] == [84, 187, 205]
        and Q(ray["R"]) == Q(582, 625),
        "upstream ray normalization",
    )
    packed = json.loads((HERE / "sector_chords.json").read_text())
    need(len(packed) == len(ray["rows"]) == 8, "all eight source shape intervals")
    result = []
    cursor = Q(0)
    for model, (lo, hi, data) in zip(ray["rows"], packed):
        start, end = Q(lo), Q(hi)
        need(
            start == cursor < end and lo == model["s_lo"] and hi == model["s_hi"],
            "contiguous source shape intervals",
        )
        need(
            len(data) == 2
            and all(len(d) == 2 and all(type(x) is int for x in d) for d in data),
            "integer endpoint data",
        )
        endpoints = [
            (Q(mult, 10**10), Q(intercept, 10**10)) for mult, intercept in data
        ]
        row = copy.deepcopy(model)
        for name, (mult, _) in zip(("lo", "hi"), endpoints):
            need(mult >= 0, "nonnegative Gram multiplier")
            row["sec_dual"][name]["y_sec"] = [str(mult)]
        # B_sec = mult*rhs + intercept. Using rhs=0 extracts the intercept
        # with the same pointwise Sturm tests, contractions and sector remainders.
        checked = verifier.verify_spiked_row(
            row, ray["abc"], [weights], [Q(0)], source["knot_sets"], quiet=True
        )
        need(
            checked["ok"]
            and all(
                checked["bounds"][name] <= a
                for name, (_, a) in zip(("lo", "hi"), endpoints)
            ),
            f"pointwise proof and two affine sector intercepts on [{lo},{hi}]",
        )
        result.append((start, end, endpoints))
        cursor = end
    need(cursor == 42, "entire fourth-excess range")
    return result


def chord_price(rows, lo, hi, charge):
    # The shape interval can straddle several source slabs. Every slab uses
    # the same feasible charge, yet has two independently priced endpoints.
    bounds = []
    for start, end, ends in rows:
        a, b = max(start, lo), min(hi, end)
        if a > b:
            continue
        left, right = [v + y * charge for y, v in ends]
        for shape in (a, b):
            bounds.append(left + (right - left) * (shape - start) / (end - start))
    need(bounds, "missing shape interval")
    return max(bounds)


def verify_cover(joint, pool, rows, h, p00, k, end, reserve):
    target = 1 / k - UNIFORM_MARGIN
    need(0 < h < 1 and p00 < joint.E, "signs of Gram prices")
    need(
        joint.H + (1 - joint.H) * end**2 + (joint.E - joint.H) * joint.A_MIN < target,
        "small projected energies",
    )
    need(
        all(
            joint.E > joint.H * joint.EH * p / (joint.MC * joint.sqrt_lo(joint.A_MIN))
            for p, *_ in pool
        ),
        "mass majorants increase with cubic energy",
    )
    r = 2 * joint.AXIS**2 - 1
    cross, tail = 2 * joint.sqrt_hi(3 * (1 + r * r)), 2 * (1 + r * r)

    @cache
    def costs(y0, y1):
        return [
            (p, max(a + b * y0**2 + c * y0**3, a + b * y1**2 + c * y1**3))
            for p, a, b, c in pool
        ]

    def upper(t0, t1, y0, y1, use_gram=True):
        d0, d1 = (joint.C * t0) ** 2, (joint.C * t1) ** 2
        # The ordinary radius and the published, unconditional P7 ray.
        energy = min(RHO**2 - d0, ((Q(582, 625) - ELL * t0) / BETA) ** 2)
        lo_chi, hi_chi = min(42, y0 * y0), min(42, y1 * y1)
        # Each iteration only applies implications to a sound upper energy.
        for _ in range(5):
            if energy < joint.A_MIN:
                return Q(0)
            lo, hi = d0 / (energy + d0), d1 / (joint.A_MIN + d1)
            shape = joint.quadratic_max(
                y1**2 - cross * y1 + tail, cross * y1 - 2 * y1**2, y1**2, lo, hi
            )
            energy = min(
                energy, joint.up(Q(355, 452) * (1 + joint.RATE * shape) ** 2 - d0)
            )
            if not use_gram:
                continue
            if energy < joint.A_MIN:
                return Q(0)
            base = joint.H + L + (1 - h) * t1**2 - target
            need(
                base < 0, "outward direction of division by the upper projected energy"
            )
            charge = BETA**2 * (joint.E - p00 + base / energy)
            if charge < 0:
                return Q(0)  # contradicts nonnegative shell weights
            price = chord_price(rows, lo_chi, hi_chi, charge)
            need(price >= ELL * t1, "nonnegative radius before squaring")
            energy = min(energy, joint.up(((price - ELL * t0) / BETA) ** 2))
        if energy < joint.A_MIN:
            return Q(0)
        projected = joint.sqrt_lo(energy)
        mass = (
            max(2 * joint.EH * p * projected - price for p, price in costs(y0, y1))
            / joint.MC
        )
        return joint.H + (1 - joint.H) * t1 * t1 + joint.E * energy - joint.H * mass

    area = worst = Q(0)
    count = 0
    cells = [(Q(0), end, Q(0), Y_MAX, 0)]
    while cells:
        t0, t1, y0, y1, depth = cells.pop()
        value = upper(t0, t1, y0, y1)
        if value < target:
            area += (t1 - t0) * (y1 - y0)
            worst = max(worst, value)
            count += 1
        else:
            need(depth < 50, "unresolved parameter cell")
            if 30 * (t1 - t0) > y1 - y0:
                mid = (t0 + t1) / 2
                cells.extend(
                    [(t0, mid, y0, y1, depth + 1), (mid, t1, y0, y1, depth + 1)]
                )
            else:
                mid = (y0 + y1) / 2
                cells.extend(
                    [(t0, t1, y0, mid, depth + 1), (t0, t1, mid, y1, depth + 1)]
                )
    need(
        area == end * Y_MAX and Y_MAX**2 >= 42, "full closed amplitude and shape cover"
    )
    # The same margin also holds in the small-A branch.
    small = joint.H + (1 - joint.H) * end**2 + (joint.E - joint.H) * joint.A_MIN
    need(
        target - max(worst, small) > Q(reserve, 10**12),
        "strict contradiction clearance",
    )
    print(
        f"k={k}, t <= {end}, payoff < 1/k - 1/100000. "
        f"{count} closed boxes, contradiction clearance in 10^-12 units: {(target-max(worst,small))*10**12//1}."
    )
    if k == Q("1.4023"):
        t, y = Q(".381"), Q("2.55")
        need(
            upper(t, t, y, y, False) > target and upper(t, t, y, y) < target,
            "deleting the violation-dependent charge",
        )
        t, y = Q(".389"), Q("2.21")
        need(
            upper(t, t, y, y) > target + Q(12, 10**5),
            "same five-round relaxation beyond its range",
        )


def verify(repo):
    h, p00, weights = gram_prices()
    chords = price_chords(repo, weights)
    joint = load(
        repo
        / "research/higher-degree/code/joint-spectral-cubic-lift-codex-a7c4/verify.py"
    )
    need((joint.E, joint.H) == (gram.EPS, gram.ETA), "same capped operator")
    pool = joint.witnesses((repo / "Grothe/Lower/MassWitnessData.lean").read_text())
    for k, end, reserve in CLAIMS:
        verify_cover(joint, pool, chords, h, p00, k, end, reserve)
    print(
        "Eight full Sturm/Stein rows, sixteen sector intercepts and both controls passed."
    )


if __name__ == "__main__":
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--repo", type=Path, default=Path.cwd())
    verify(ap.parse_args().repo.resolve())
