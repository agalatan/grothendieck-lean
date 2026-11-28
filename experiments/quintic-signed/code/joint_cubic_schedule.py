"""Joint physical projection budget, radial prices and the 57-piece signed endpoint. Agent-ID: codex-a7c4."""

from fractions import Fraction as Q
from math import ceil
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
from bernstein_tilted_prices import BETA, price
from joint_cubic_rice import constants
from tilted_signed_schedule import envelope, high, physical_segments, first, checked


def replay():
    odd, even = constants()
    tilt = Q(".273")
    gamma = Q(".3655")
    remaining = BETA - gamma
    residual = remaining - tilt
    bounds = price(
        128,
        tilt,
        Q(1),
        Q(".0001"),
        gamma,
        odd_cubic=BETA - odd * remaining,
        even_cubic=BETA - even * remaining,
    )
    checked(
        bounds
        == tuple(
            Q(n, 10**8) for n in [80019364, 68781680, 99842245, 98061174, 99948787]
        )
        and max(bounds) < 1
        and residual == Q(".149"),
        "joint cubic trace registration",
    )
    mu = Q(".886227")
    cut = Q(".88575")
    floor = Q(".023")
    loss = (
        mu / 4 * (Q(61, 2) * (mu - cut) + Q(199, 177000))
        + Q(100, 7) * (mu - cut)
        + Q(49, 15000)
    )
    checked(3 * Q("3.141592") / 256 - loss > floor, "physical radial floor")
    w = Q(".0000733823")
    d = Q(1, 10**8)
    cap = Q(7132537799728, 10**13)
    pieces = physical_segments()
    opts = dict(residual=residual, radial_start=cut, radial_floor=floor)
    v = envelope(pieces, w, d, Q(".885773796365757"), **opts)
    checked(
        Q(ceil(v * 10**13), 10**13) == cap and 1 / cap > Q("1.40202551753"),
        "signed endpoint",
    )
    contact = Q(".885773796896554")
    rows = [
        p.at(contact, first.physical_scales(w))
        for p in pieces
        if p.low <= contact <= p.high
    ]
    checked(
        rows and min([*rows, high(w, 0, contact, residual=residual)]) > cap,
        "signed improvement over the matched zero-debit envelope",
    )
    zero = envelope(pieces, Q(".0000733496"), 0, contact, **opts)
    checked(
        Q(ceil(zero * 10**13), 10**13) == Q(7132537778673, 10**13)
        and 1 / zero > Q("1.40202552167"),
        "retuned pure endpoint",
    )
    # A physical central illustration, using the same pair's projected cubic.
    tau = Q(".285")
    t = Q(".83835")
    fresh = (2 * mu * (mu - t) - tau**2) / even
    checked(
        fresh < Q(".0166") and fresh + tau**2 < Q(".0979"),
        "central remaining cubic energy",
    )
    print(
        f"Joint cubic weights {odd} and {even}; global signed cap {cap}, reciprocal >1.40202551753."
    )
    print(f"Both zero-debit prices at matched weight exceed the cap at {contact}.")
    print("The retuned zero-debit witness gives >1.40202552167 on all 57 pieces.")


if __name__ == "__main__":
    replay()
