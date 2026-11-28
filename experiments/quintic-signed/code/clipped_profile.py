#!/usr/bin/env python3
"""Check signed clipped profiles and the obstruction from two physical amplitudes. Agent-ID: codex-a7c4."""
import argparse
from fractions import Fraction as Q
from math import ceil
import os
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
import signed_bridge as bridge

ZONES = (
    (Q(0), Q(".828"), Q(-1)),
    (Q(".828"), Q(".885868"), Q(-1, 4)),
    *bridge.ZONES[1:],
)


def obstruction(p, segments, weight):
    """A convex combination of two actual profile points cancels every first-chaos weight."""
    arms = []
    for group in ([s for s in segments if s.cell < 30], [s for s in segments if s.cell >= 30]):
        value, cell, t = p.peak(group, p.physical_scales(weight))
        piece = next(s for s in group if s.cell == cell and s.low <= t <= s.high
                     and s.at(t, p.physical_scales(weight)) == value)
        intercept = piece.at(t, p.physical_scales(Q(0)))
        slope = piece.at(t, p.physical_scales(Q(1))) - intercept
        arms.append((intercept, slope, t))
    (ai, si, ti), (ah, sh, th) = arms
    bridge.require(Q(".828") <= ti < Q(".885868") and Q(".886176") <= th and si < 0 < sh,
                   "two-point dual arms left the certified zones")
    pi, ph = sh/(sh-si), -si/(sh-si)
    bridge.require(min(pi, ph) > 0 and pi+ph == 1 and pi*si+ph*sh == 0, "dual weights")
    floor = pi*ai+ph*ah
    surcharge = pi/4-ph*Q(17, 500)
    bridge.require(surcharge > 0, "a positive signed debit could evade the two-point lower floor")
    return floor, surcharge, si*Q(17, 500)/sh


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--schedule-root", type=Path, default=bridge.REPO)
    root = parser.parse_args().schedule_root.resolve()
    os.chdir(root)
    sys.path.insert(0, str(root/"research/identity-tail/code"))
    import first_chaos_profile as p
    import physical_rice_scale as r

    bridge.require(p.WEIGHT == Q(358503031, 5000000000000) and p.CAP == Q(713254612582, 10**12),
                   "the control is the 55-piece first-chaos schedule of #896")
    make = bridge.builder(p, r)
    grid = lambda x: ceil(x*10**12)
    configurations = (
        (bridge.ONE_CUT, Q(179, 1953125000), 713254609466),
        (bridge.SIX_CUTS, Q(205611, 125000000000), 713254567542),
    )
    for (active, _, prior, pure_w, pure), debit, clipped in configurations:
        segments = make(active)
        estimate, _, _ = bridge.peak(p, segments, p.WEIGHT, debit, ZONES)
        control, _, _ = p.peak(segments, p.physical_scales(p.WEIGHT))
        optimum, _, _ = p.peak(segments, p.physical_scales(pure_w))
        floor, surcharge, required = obstruction(p, segments, pure_w)
        bridge.require(grid(estimate) == clipped < prior < grid(control) == 713254612582, "clipped endpoint")
        bridge.require(grid(floor) == grid(optimum) == pure < clipped, "freely optimized comparison")
        bridge.require(grid(bridge.peak(p, segments, p.WEIGHT, debit)[0]) > clipped,
                       "removing clipping still passes")
        print(f"cells {sorted(active)}; d={debit}; signed cap {clipped}/10^12; matched zero {grid(control)}/10^12")
        print(f"optimized pure {pure}/10^12; all w, d>=0 have an envelope >= floor + {float(surcharge):.9f} d")
        print(f"central fifth-energy floor must exceed {float(required):.10f} to escape these two points")


if __name__ == "__main__":
    main()
