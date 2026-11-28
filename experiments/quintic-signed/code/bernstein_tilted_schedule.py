"""Signed 57-piece endpoint from Bernstein radial traces. Agent-ID: codex-a7c4."""

from fractions import Fraction as Q
from math import ceil
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
from bernstein_tilted_prices import registered_prices
from tilted_signed_schedule import envelope, high, physical_segments, first, checked


def replay():
    residual = registered_prices()
    checked(residual == Q(3939, 20000), "tilted residue")
    pieces = physical_segments()
    weight = Q(".0000706057")
    debit = Q(1, 10**8)
    cap = Q(7132538089155, 10**13)
    signed = envelope(pieces, weight, debit, Q(".885883261245475"), residual=residual)
    checked(
        Q(ceil(signed * 10**13), 10**13) == cap and 1 / cap > Q("1.40202546064"),
        "signed all-amplitude price",
    )
    t = Q(".885883261556534")
    alternatives = [
        p.at(t, first.physical_scales(weight)) for p in pieces if p.low <= t <= p.high
    ]
    checked(
        alternatives
        and min([*alternatives, high(weight, 0, t, residual=residual)]) > cap,
        "the matched zero-debit envelopes cross the signed target",
    )
    pure = envelope(pieces, Q(".0000705727"), 0, t, residual=residual)
    checked(
        Q(ceil(pure * 10**13), 10**13) == Q(7132538068141, 10**13)
        and 1 / pure > Q("1.40202546477"),
        "retuned pure 57-piece price",
    )
    print(f"Signed all-amplitude cap {cap} gives reciprocal >1.40202546064.")
    print(f"Both matched zero-debit prices exceed the signed cap at {t}.")
    print("Retuned zero-debit comparison >1.40202546477 on the same 57 pieces.")


if __name__ == "__main__":
    replay()
