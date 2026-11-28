"""Angular support and near-pure payoff for the capped degree-five game (codex-a7c4)."""

import argparse
import importlib.util
from fractions import Fraction as Q
from functools import cache
from math import isqrt
from pathlib import Path

ETA, EPS, TARGET = Q(".0779"), Q(".78"), 1 / Q("1.4025")
ROW = tuple(map(Q, ("2.15", ".788", ".99", ".205")))
CLAIMS = (
    (".66", ".895", ".0038"),
    ("2/3", ".875", ".00258"),
    (".67", ".865", ".00194"),
    (".671", ".865", ".00175"),
    (".675", ".85", ".00095"),
    (".678", ".845", ".00033"),
    (".679", ".84", ".00012"),
    (".6795", ".84", ".00002"),
)


def need(condition, message):
    if not condition:
        raise ValueError(message)


def sqrt_upper(x, scale=10**10):
    root = isqrt(int(x * scale**2))
    return Q(root + int(Q(root**2, scale**2) < x), scale)


@cache
def angular_upper(r):
    """Upper bound for the angular mean M(r), using M(r)=r M(1/r)."""
    if r > 1:
        return r * angular_upper(1 / r)
    coefficient = Q(1)
    powers = [coefficient]
    for j in range(1, 9):
        coefficient *= (Q(3, 2) - j) / j
        powers.append(coefficient**2)
    # The positive tail is at most r^18 times its value at 1, M(1)=4/pi.
    return sum(v * r ** (2 * j) for j, v in enumerate(powers)) + (Q(424, 333) - sum(powers)) * r**18


def certify_angular(c):
    need(Q(424, 333) - 1 <= c and 4 * c >= 1, "inner series or outer triangle")
    for j in range(64, 256):
        lo, hi = Q(j, 64), Q(j + 1, 64)
        left, right = angular_upper(lo), angular_upper(hi)
        slope = (right - left) / (hi - lo)
        corner = max(lo, min(hi, slope / (2 * c)))
        need(left + slope * (corner - lo) <= 1 + c * corner**2, "convex angular chord")


def angular_checks():
    c = Q(299, 1000)
    certify_angular(c)
    r = Q(29, 20)
    # A lower bound from positive terms, after reciprocity. Reject c=.298.
    co = Q(1)
    lower = Q(1)
    for j in range(1, 9):
        co *= (Q(3, 2) - j) / j
        lower += co**2 / r ** (2 * j)
    need(r * lower > 1 + Q(".298") * r * r, "angular coefficient negative control")
    print("M(r) <= 1 + .299 r^2 on [0,infinity); .298 fails at r=1.45.")
    return c


def integral(module, c):
    """Lower-bound the integral by two affine functions of the unknown quintic tilt."""
    a, cr, w, g = ROW
    cells = [
        (Q(m, module.PREC), a * r + cr * (r3 - 2 * r), r5 - 6 * r3 + 6 * r, abs(w + g * (r2 - 1)))
        for m, r, r2, r3, r5 in module.radial_moments(256, 6)
        if m
    ]
    numerators = list(range(101)) + [120, 140, 180, 240, 400, 1000]
    directions = [Q(i, 20) for i in numerators]
    caps = [min(1 + c * l * l, sqrt_upper(1 + l * l)) for l in directions]
    scale = 10**6
    hints = [(i, int(v * scale), 400 + i * i) for i, v in zip(numerators, caps)]

    def line(anchor):
        offset = slope = Q(0)
        for mass, xx, tilt, y in cells:
            actual = xx + anchor * tilt
            xhint, yhint = int(abs(actual) * scale), int(y * scale)

            def score(data):
                i, v, norm = data
                return max(0, 20 * xhint + i * yhint - 20 * v) ** 2 // norm

            j = max(range(len(hints)), key=lambda k: score(hints[k]))
            l, cap = directions[j], caps[j]
            raw = (abs(actual) + l * y - cap) / (1 + l * l)
            multiplier = Q(max(0, int(raw * 10**7)), 10**7)
            sign = 1 if actual >= 0 else -1
            offset += mass * (
                2 * multiplier * (sign * xx + l * y - cap) - (1 + l * l) * multiplier**2
            )
            slope += mass * 2 * multiplier * sign * tilt
        return offset, slope

    lines = [line(Q("-.01")), line(Q(".02"))]
    for _ in range(8):
        (a0, s0), (a1, s1) = lines
        need(s0 < 0 < s1, "opposite supporting slopes")
        crossing = (a0 - a1) / (s1 - s0)
        new_line = line(Q(int(crossing * 10**8), 10**8))
        if new_line[1] == 0:
            return new_line[0]
        lines[int(new_line[1] > 0)] = new_line
    (a0, s0), (a1, s1) = lines
    need(s0 < 0 < s1, "opposite final supporting slopes")
    return (s1 * a0 - s0 * a1) / (s1 - s0)


def payoff(t, s, mixed, debit):
    a, c, w, g = ROW
    return (
        ETA
        + (1 - ETA) * t**2
        + (EPS - ETA) * (s * s + mixed)
        + ETA * ((a - t) ** 2 + (w - s) ** 2 + 2 * (1 + ETA / EPS) * c * c + 2 * g * g - debit)
    )


def clearance(end, direction, mixed, debit):
    need(0 < direction <= Q(".9"), "diffuse transfer direction")
    radius = Q("1.193") * sqrt_upper((1 + direction**2) / Q("1.81"))
    values = []
    for t in (Q(".65"), end):
        top = (radius - t) / direction
        need(top >= 0, "trapezoid radius")
        values.extend(payoff(t, s, mixed, debit) for s in (0, top))
    return TARGET - max(values)


def verify(repo, c):
    parent = repo / "research/higher-degree/code/quintic-conditional-debit-codex-a7c4"
    spec = importlib.util.spec_from_file_location("joint_integral", parent / "joint_integral.py")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    result = integral(module, c)
    # Freeze an outward rational price; a more accurate integral is unnecessary.
    debit = Q("4.027225")
    need(result > debit, "uniform two-line distance integral")
    print("Distance integral >", debit, "uniformly for every real quintic tilt.")
    for end, direction, mixed in CLAIMS:
        gap = clearance(Q(end), Q(direction), Q(mixed), debit)
        need(gap > 0, "claimed payoff rectangle")
        print(f"Through {end}, mixed energy <= {mixed}, margin > {int(gap*10**9)}/10^9.")
    need(
        clearance(Q(".68"), Q(".835"), Q(0), debit) < 0,
        "next endpoint must fail this frozen trial at zero mixed energy",
    )


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo", type=Path, default=Path(__file__).resolve().parents[4])
    parser.add_argument("--angular-only", action="store_true")
    args = parser.parse_args()
    constant = angular_checks()
    if not args.angular_only:
        verify(args.repo, constant)
