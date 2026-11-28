"""Close t in [0,.65] using the two independently proved Rice bounds.

Run python3 -IB transfer.py; the optional argument selects a copy of the prior checker.
The named folder supplies #837's geometry and the matching joint_integral.py.
Agent-ID: codex-a7c4.
"""

import argparse, json, sys
from fractions import Fraction as F
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import rays


def clearance(prior, k, h, radii):
    s1, s2 = F(".81"), F("1.44")
    r1, r2 = radii[s1], radii[s2]
    slow = lambda t: (r1 - t) / F(".9")
    shigh = lambda t: (r2 - t) / F("1.2")
    t0, t1, t2, t3, t4 = map(F, ("0", ".44", ".55", ".586", ".65"))
    # Below .44, simultaneous testing and the homogeneous radius of
    # an independent diffuse cubic lift give t²+sigma² <= rho_*².
    first = max(prior.discarded(t, rays.RAW**2 - t * t, h) for t in (t0, t1))
    second = max(prior.discarded(t, shigh(t) ** 2, h) for t in (t1, t2))
    third = prior.joint_maximum(t2, t3, shigh, h, prior.INTEGRAL)
    last = prior.joint_maximum(t3, t4, slow, h, prior.INTEGRAL)
    return [1 / k - v for v in (first, second, third, last)]


def reject(f):
    try:
        f()
    except ValueError:
        return
    raise ValueError("should have rejected control")


def extended_interval(prior, radii):
    """Use the same conditional inequality with a second fixed trial.

    A further independent diffuse cubic lift carries the .9 ray down to .87.
    All lengths and the outward upper radius remain rational in the replay.
    """
    a, c, w, g = map(F, ("1.97", ".73", ".93", ".189"))
    debit = F("3.26")
    lower, boxes = prior.certify(a, c, w, g, debit, grid=256)
    rays.need(lower > debit, "second joint distance input")
    slope = F(".87")
    cap = radii[F(".81")] * rays.sqrt_sides((1 + slope**2) / F("1.81"))[1]

    def payoff(t, sigma, mixed):
        cost = (
            (a - t) ** 2
            + (w - sigma) ** 2
            + 2 * (1 + prior.ETA / prior.EPS) * c**2
            + 2 * g**2
        )
        return prior.discarded(t, sigma**2, mixed) + prior.ETA * (cost - debit)

    for end, mixed in (("2/3", ".001"), (".67", ".00028"), (".671", ".00005")):
        values = []
        for t in (F(".65"), F(end)):
            top = (cap - t) / slope
            rays.need(top > 0, "nonempty shoulder trapezoid")
            values.extend(payoff(t, s, F(mixed)) for s in (0, top))
        gap = 1 / F("1.4025") - max(values)
        rays.need(gap > 0, "second joint trial missed " + end)
        print(
            f"Through {end}, H squared <= {mixed}: clearance > {int(gap*10**9)}/10^9."
        )
    t = F(".672")
    rays.need(
        payoff(t, (cap - t) / slope, 0) > 1 / F("1.4025"), "extended-amplitude control"
    )
    print(f"Second joint integral > {debit} ({boxes} tilt intervals).")


def run(prior_dir):
    sys.path.insert(0, str(prior_dir.resolve()))
    import verify as prior

    radii = rays.verify()
    d, boxes = prior.certify(prior.A, prior.C, prior.W, prior.G, prior.INTEGRAL)
    rays.need(
        d > prior.INTEGRAL and prior.INTEGRAL == F("2.575"), "joint distance input"
    )
    for k, h, req in [("1.4023", ".00478", 7679), ("1.4025", ".00464", 4281)]:
        margins = clearance(prior, F(k), F(h), radii)
        rays.need(min(margins) > F(req, 10**9), "mixed payoff and reserve")
        print(
            "K",
            k,
            "H squared <=",
            h,
            "four lower margins in billionths:",
            [int(v * 10**9) for v in margins],
        )
    # Complete cover and signs, including an optimistic false majorant.
    path = Path(__file__).with_name("rice_rows.json")
    for mutation in ("gap", "negative multiplier", "lower support"):
        rows = json.loads(path.read_text())
        cover = rows["81/100"]
        if mutation == "gap":
            cover.pop(0)
        else:
            c = next(item[2] for item in cover if item[2])
            if mutation == "negative multiplier":
                c[6] = -1
            else:
                c[0] -= 10**11
        reject(lambda: rays.verify_rows(rows))
    weakened = dict(radii)
    weakened[F(".81")] = F("1.194")
    rays.need(
        min(clearance(prior, F("1.4023"), F(".00478"), weakened)) < 0,
        "loosened radius control",
    )
    rays.need(
        min(clearance(prior, F("1.4023"), F(".0048"), radii)) < 0,
        "enlarged mixed energy control",
    )
    print("Five negative controls passed.")
    extended_interval(prior, radii)


if __name__ == "__main__":
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument(
        "joint",
        nargs="?",
        type=Path,
        default=Path(__file__).resolve().parents[1]
        / "quintic-conditional-debit-codex-a7c4",
    )
    run(ap.parse_args().joint)
