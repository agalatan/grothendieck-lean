#!/usr/bin/env python3
"""Certify free tangent rows for the no-tail (39/50,779/10000) game. Agent-ID: codex-a7c4."""
import argparse
from fractions import Fraction as Q
from pathlib import Path
import sys

PARAMETERS = (
    ".762 .110 3.7 -.090 -.015",
    ".776 .126 3.7 -.093 -.015",
    ".798 .150 3.5 -.098 -.014",
    ".815 .165 3.3 -.100 -.014",
    "1.096 .172 6.1 -.0663 -.0112",
)
# The unrestricted row uses the physical remote-energy cap in place of a constant.
COVERS = {
    14023: (
        (".001", ((0, ".686", ".78"), (3, ".78", ".886227"))),
        (".004", ((0, ".707", ".78"), (3, ".78", ".861"))),
        (".006", ((0, ".726", ".77"), (2, ".77", ".840"))),
        (".008", ((1, ".756", ".796"),)),
        (None, ((4, ".884257", ".886227"),)),
    ),
    14025: (
        (".001", ((0, ".6863", ".78"), (3, ".78", ".886227"))),
        (".004", ((0, ".707", ".78"), (3, ".78", ".8605"))),
        (".006", ((0, ".728", ".77"), (2, ".77", ".8395"))),
        (".008", ((1, ".758", ".794"),)),
        (None, ((4, ".884397", ".886227"),)),
    ),
}


def require(test, reason):
    if not test:
        raise ValueError(reason)


def upper6(value):
    return Q((value * 10**6).__ceil__(), 10**6)


def tangent(row, radial, grid):
    ell, beta, A, ba, bb = map(Q, row.split())
    require(A >= 1 and ell > 2 * beta, "tangent domain")
    require(0 < 1 + ba <= 1 and bb <= 0, "remote tilt signs")
    h0 = (1 - A / (2 * A - 1)) / 2
    lo, hi = radial.radial_moments(ell, beta, *grid)
    g_floor = ell - 2 * beta + 3 * radial.ETA * radial.MU_LO / 8
    require(beta >= 3 * radial.ETA * radial.MU_HI / 8, "nonnegative linear coefficient")
    # For (0,0), the quintic diagonal is J0. Every other normalized Wick moment
    # against T^(-1/2) is at most (3/4) sqrt(pi) by the existing twelve-entry table.
    require(
        A * max(hi[0], Q(3, 4) * 2 * radial.MU_HI / g_floor) < 1 / radial.ETA,
        "quintic absorption",
    )
    qprice = 1 / radial.EPS
    shift_lo, shift_hi = (1 + lo[1]) / (1 + hi[0]), (1 + hi[1]) / (1 + lo[0])
    diff, _ = radial.abs_bounds(lo[1] - hi[0], hi[1] - lo[0])
    dt, _ = radial.abs_bounds(lo[2] - 2 * hi[1], hi[2] - 2 * lo[1])
    base11 = hi[2] - 2 * lo[1] + hi[0] - diff**2 / (1 + hi[0]) - qprice
    integral_lo = lo[2] - 2 * shift_hi * hi[1] + shift_lo**2 * lo[0]
    x = base11 - h0 * integral_lo
    y = (1 - h0) * hi[2] / 2 - qprice
    z = h0 * max(abs(lo[2] - shift_hi * hi[1]), abs(hi[2] - shift_lo * lo[1]))
    require(x < 0 and y < 0 and 2 * x * y > z**2, "remote degree-one Schur block")
    require(hi[1] < qprice, "remote degree-two shells")
    require(
        (hi[3] - 4 * lo[2] + 4 * hi[1] - dt**2 / (1 + hi[1])) / 2 < qprice,
        "visible cubic",
    )
    c0, c1 = 1 + ba, -ba - Q(7, 10) * bb
    require(
        c0 > 0 and c1 >= 0 and Q(7, 10) ** 2 < Q(1, 2), "tilted real-part lower bound"
    )
    isotropic = c0**2 * hi[0] - 2 * ba * c0 * hi[1] + (ba**2 + bb**2 / 2) * hi[2]
    real_loss = h0 * (c0**2 * lo[0] + 2 * c0 * c1 * lo[1] + c1**2 * lo[2])
    C = upper6(isotropic + (ba**2 + bb**2) / radial.ETA - qprice - real_loss)
    B = upper6(radial.intercept(radial.MU_HI, ell, beta))
    return ell, B, C


def margin(rows, target, energy, pieces, radial):
    rooms = []
    last = None
    for index, left, right in pieces:
        ell, B, C = rows[index]
        a, b = Q(left), Q(right)
        require(a <= b and (last is None or a == last), "disconnected amplitude cover")
        if energy is None:
            k = max(0, C) * radial.EPS**2
            require(
                a * a >= 6 * radial.MU_HI**2 / 7 and k <= 1,
                "sharp physical domain and convexity",
            )
            debit = k * radial.MU_HI**2
        else:
            k, debit = 0, max(0, C) * Q(energy)
        rooms.append(
            target - B - debit - max((1 - k) * t * t - 2 * ell * t for t in (a, b))
        )
        last = b
    return min(rooms)


def main(root):
    path = root / "research/higher-degree/code/quintic-tangent-codex-a7c4"
    require(
        (path / "verify_schur.py").is_file(),
        "use --root to select a repository checkout",
    )
    sys.path.insert(0, str(path))
    import verify_schur as radial

    require(
        4 * radial.MU_LO**2 < Q(333, 106) and Q(355, 113) < 4 * radial.MU_HI**2,
        "pi bracket",
    )
    grid = radial.exp_grid()
    rows = [tangent(row, radial, grid) for row in PARAMETERS]
    for ell, B, C in rows:
        print(f"ell={ell} intercept<={B} remote<={C}")
    for denominator, covers in COVERS.items():
        target = Q(10000, denominator)
        for energy, pieces in covers:
            gap = margin(rows, target, energy, pieces, radial)
            require(gap > 0, "insufficient tangent margin")
            print(
                f'{target}, u<={energy or "any"}, t=[{pieces[0][1]},{pieces[-1][2]}], margin > {int(gap*10**12)}/10^12'
            )
    # Increasing the remote energy to .01 loses the strongest-energy one-row certificate.
    require(
        margin(rows, Q(10000, 14023), ".01", ((1, ".776", ".776"),), radial) < 0,
        "energy corruption accepted",
    )
    require(
        margin(rows, Q(10000, 14023), None, ((4, ".88425", ".88425"),), radial) < 0,
        "lower shoulder corruption accepted",
    )
    print("PASS including enlarged-energy and reduced-amplitude rejections")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, default=Path.cwd())
    main(parser.parse_args().root)
