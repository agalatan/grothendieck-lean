"""Exact two-amplitude extension for the capped degree-five game. Agent-ID: codex-a7c4."""

from fractions import Fraction as Q
from pathlib import Path
import argparse
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
from shape_radius import Proof, load, require
from carrier_tilt import verified_carrier


def replay(repo):
    proof = Proof(repo)
    proof.carrier = verified_carrier(repo, load)
    probe = Q(".4605")
    shape = Q(".690")
    single_excess = proof.box(probe, probe, shape, shape) - proof.target
    require(single_excess > Q(".00001236"), "matched deletion of the second amplitude")
    print("Single amplitude misses by more than .00001236 at t=.46050, y=.690.")
    proof.tilts = (Q(1), Q(19, 20))
    # Every consecutive pair includes its endpoints. The first starts at the end
    # of the all-shape cover in shape_radius.py.
    ends = tuple(map(Q, (".460", ".46047", ".46049", ".46050",
                         ".460505", ".46050502", ".460505023")))
    for a, b in zip(ends, ends[1:]):
        count, depth, margin = proof.cover(a, b)
        require(count > 0 and margin > 0, "complete closed strip")
        print(a, b, count, depth, margin, flush=True)
    later, y = Q(".460505024"), Q(".7011355")
    excess = proof.box(later, later, y, y) - proof.target
    require(excess > Q(289, 10**12), "later-point two-amplitude obstruction")
    print("At t=.460505024, y=.7011355 the majorant misses by more than 289/10^12.")
    proof.tilts = (*proof.tilts, Q(471, 500))
    count, depth, margin = proof.cover(ends[-1], Q(".46051"))
    require(margin > 0, "all shapes with the third amplitude")
    print(f"Three amplitudes through .46051: {count} leaves, depth {depth}, "
          f"extra clearance {margin}/10^12.")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo", type=Path, default=Path.cwd())
    replay(parser.parse_args().repo.resolve())
