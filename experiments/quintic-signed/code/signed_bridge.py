#!/usr/bin/env python3
"""Signed fifth perturbations and matched pure controls. Agent-ID: codex-a7c4."""
import argparse
from fractions import Fraction as Q
from functools import cache
from math import ceil, floor
import os
from pathlib import Path
import sys


REPO = Path(__file__).resolve().parents[3]
ZONES = (
    (Q(0), Q(".885868"), Q(-1)),
    (Q(".885868"), Q(".886176"), Q(".026")),
    (Q(".886176"), Q(".9"), Q(".034")),
)
ONE_CUT = (
    {23},
    Q(6293, 250000000000),
    713254611726,
    Q(285559229, 4000000000000),
    713254590186,
)
SIX_CUTS = (
    set(range(21, 27)),
    Q(110621, 250000000000),
    713254598804,
    Q(6615481557, 10**14),
    713254212953,
)


def require(test, message):
    if not test:
        raise ValueError(message)


def builder(p, r):
    src, law, knots, original, curve = p.load_schedule()
    require(len(law.pieces) == 945 and len(original) == 15, "source table")
    curvature = p.curved.curvature(8, 9)

    @cache
    def price(cut, w):
        subset = law if cut is None else r.clipped_model(law, cut)
        return Q(floor(subset.discount(w) * 10**13), 10**13)

    def make(active):
        seen = set()

        def endpoints(idx, l, h, w, z):
            cut = None
            if idx in active:
                seen.add(idx)
                cut = r.CUTS[idx]
                require(
                    0 <= 2 * r.MU_UP * (r.MU_UP - l) * law.delta**2 <= cut**2
                    and r.SMALL <= cut,
                    "uncertified radius",
                )
            dl, dh = price(cut, w), price(cut, z)
            gain = min(
                4 * (price(r.SMALL, w) - dl),
                4 * (price(r.SMALL, z) - dh),
                curvature * (w - z) ** 2 * (r.SMALL / law.delta) ** 2,
            )
            require(gain >= 0, "negative curvature gain")
            return dl, dh, gain

        segs = [
            p.Segment(n, l, h, coeffs)
            for n, _, _, l, h, coeffs in p.curved.weighted_segments(
                src, original, curve, cuts=knots, central_endpoints=endpoints
            )
        ]
        p.check_partition(segs, src.cells)
        require(len(segs) == 55 and seen == active, "missing child/cut")
        return segs

    return make


def peak(p, segs, w, d, zones=ZONES):
    records = []
    for seg in segs:
        poly = seg.transformed(p.physical_scales(w))
        for left, right, fifth in zones:
            lo, hi = max(left, seg.low), min(right, seg.high)
            if lo <= hi:
                width = seg.high - seg.low
                height, x = p.quadratic_maximum(
                    poly, (lo - seg.low) / width, (hi - seg.low) / width, True
                )
                records.append((height - d * fifth, seg.cell, seg.low + x * width))
    return max(records)


def pure_grid_floor(p, segs, weight):
    witnesses = []
    for group in ([s for s in segs if s.cell <= 29], [s for s in segs if s.cell > 29]):
        top, index, t = p.peak(group, p.physical_scales(weight))
        segment = next(
            s
            for s in group
            if s.cell == index
            and s.low <= t <= s.high
            and s.at(t, p.physical_scales(weight)) == top
        )
        zero = segment.at(t, p.physical_scales(Q(0)))
        one = segment.at(t, p.physical_scales(Q(1)))
        witnesses.append((zero, one - zero))
    (left, dec), (right, inc) = witnesses
    crossing = (right - left) / (dec - inc)
    require(
        dec < 0 < inc
        and 0 < crossing < 1
        and left + crossing * dec == right + crossing * inc,
        "uniform pure-weight lower bound",
    )
    return left + crossing * dec


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--schedule-root",
        type=Path,
        default=REPO,
        help="checkout containing #896 and #887",
    )
    root = parser.parse_args().schedule_root.resolve()
    os.chdir(root)
    sys.path.insert(0, str(root / "research/identity-tail/code"))
    import first_chaos_profile as p
    import physical_rice_scale as r

    require(
        p.WEIGHT == Q(358503031, 5000000000000) and p.CAP == Q(713254612582, 10**12),
        "reference #896",
    )
    make = builder(p, r)
    empty = make(set())
    for active, d, signed, pure_weight, pure in [ONE_CUT, SIX_CUTS]:
        segs = make(active)
        height, _, _ = peak(p, segs, p.WEIGHT, d)
        base, _, _ = p.peak(segs, p.physical_scales(p.WEIGHT))
        optimized, _, _ = p.peak(segs, p.physical_scales(pure_weight))
        lower = pure_grid_floor(p, segs, pure_weight)
        grid = lambda v: ceil(v * 10**12)
        require(
            grid(height) == signed < grid(base) == 713254612582,
            "matched degree-five deletion",
        )
        require(
            grid(lower) == grid(optimized) == pure < signed, "optimized pure comparator"
        )
        require(
            peak(p, empty, p.WEIGHT, d)[0] > p.CAP,
            "cut removal fails even at the reference cap",
        )
        require(
            peak(p, segs, p.WEIGHT, d, ((Q(0), Q(".9"), Q(-1)),))[0] > p.CAP,
            "deleting high signed credits should fail",
        )
        print(
            f"{len(active)} Rice cut(s), w={p.WEIGHT}, d={d}. Signed {signed}, matched pure {grid(base)}, "
            f"optimized pure {pure} (all numerators over 10^12)."
        )
    print(
        "Every closed segment, both high thresholds, three deletion controls and two pure grid floors passed."
    )


if __name__ == "__main__":
    main()
