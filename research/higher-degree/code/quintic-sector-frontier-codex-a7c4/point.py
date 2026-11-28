"""Check a scalar obstruction to the six-profile degree-five relaxation.
Agent-ID: codex-a7c4. Run with python3 -IB point.py --repo REPO.
"""

import argparse
from fractions import Fraction as Q
from math import isqrt
from pathlib import Path
import sys

T, Y, A = Q(21, 50), Q(11, 5), Q(1703, 2500)
K, D = Q(36766051, 50000000), Q(9, 625)
PAYOFF = Q(10000, 14023) + Q(1, 500000)


def need(ok, reason):
    if not ok:
        raise ValueError(reason)


def root(x):
    scale = 10**12
    lower = Q(isqrt(x.numerator * scale**2 // x.denominator), scale)
    return lower, lower + Q(1, scale)


def support(rows, ell, beta, weight, root_hi):
    gaps = []
    for low, high, ends in rows:
        if low <= Y**2 <= high:
            left, right = (b + price * weight for price, b in ends)
            r = left + (right - left) * (Y**2 - low) / (high - low)
            gaps.append(r - ell * T - beta * root_hi)
    need(gaps, "missing support slab at the test shape")
    return gaps


def check(m, mass, charge):
    j, old = m.joint, m.old
    _, rt = root(A)
    d = (j.C * T) ** 2
    v = d / (A + d)
    r = 2 * j.AXIS**2 - 1
    cross = 2 * root(3 * (1 + r * r))[0] * Y

    def elliptic_slack(cross_term):
        shape = (1 - v) ** 2 * Y**2 + cross_term * v * (1 - v) + 2 * (1 + r * r) * v * v
        return Q(355, 452) * (1 + j.RATE * shape) ** 2 - d - A

    need(
        0 < v < 1 and 0 < Y**2 < 42 and 0 <= charge <= Q(170144, 10**6),
        "normalized shape, interpolation and sector ranges",
    )
    need(j.A_MIN <= A <= mass <= 1 - T**2, "cubic and spectral mass ranges")
    spectral = [mass - (2 * j.EH * p * rt - cost) / j.MC for p, cost in m.costs(Y, Y)]
    gram = [
        row.constant
        + (1 - row.visible_price) * T**2
        + (j.E - row.remote_price) * A
        - row.mass_price * mass
        - row.sector_scale * A * charge
        - PAYOFF
        for row in m.mass_rows
    ]
    old_support = support(m.chords, old.ELL, old.BETA, old.BETA**2 * charge, rt)
    new_support = support(m.spiked, Q(1100, 2621), Q(2379, 2621), charge, rt)
    need(
        (len(spectral), len(gram), len(m.chords), len(m.spiked)) == (24, 12, 8, 13),
        "complete six-profile production model",
    )
    need(
        (len(old_support), len(new_support)) == (1, 3),
        "active rays at fourth excess 121/25",
    )
    return {
        "spectral mass": min(spectral),
        "Gram bank": min(gram),
        "original Gram": j.H
        + old.L
        + (1 - m.h) * T**2
        + (j.E - m.p00) * A
        - charge * A
        - PAYOFF,
        "raw payoff": j.H + (1 - j.H) * T**2 + j.E * A - j.H * mass - PAYOFF,
        "unpriced ball": old.RHO**2 - d - A,
        "unpriced ray": Q(582, 625) - old.ELL * T - old.BETA * rt,
        "unpaid ellipse": elliptic_slack(cross),
        "paid ellipse": elliptic_slack(min(cross, 99 * charge)),
        "84 ray": min(old_support),
        "1100 ray": min(new_support),
    }


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--repo", type=Path, default=Path.cwd())
    repo = ap.parse_args().repo.resolve()
    code = repo / "research/higher-degree/code/quintic-product-support-codex-a7c4"
    sys.path.insert(0, str(code))
    from product_cover import build

    *_, model = build(repo)
    gaps = check(model, K, D)
    for name, x in gaps.items():
        need(x > 0, name)
        print(f"{name}: > {int(x*10**12)} trillionths")
    for name, mass, charge in (
        ("spectral mass", Q(".734"), D),
        ("1100 ray", K, Q(".005")),
        ("Gram bank", K, Q(".02")),
    ):
        rejected = check(model, mass, charge)[name]
        need(rejected < 0, "failed to reject control for " + name)
        print(f"Rejected {name} mutation, gap < {-int(-rejected*10**12)} trillionths.")


if __name__ == "__main__":
    main()
