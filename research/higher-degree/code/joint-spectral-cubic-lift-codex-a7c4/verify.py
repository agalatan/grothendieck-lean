#!/usr/bin/env python3
"""Join the actual elliptic fourth moment to the checked spectral mass witnesses. Agent-ID: codex-a7c4."""
from fractions import Fraction as F
from functools import lru_cache
from math import isqrt
from pathlib import Path
import re

E, H, LIMIT = F(39, 50), F(779, 10000), F(500, 701)
C, AXIS, RATE = F(431, 500), F(179, 200), F(26449, 5000000)
EH, MC = F(25, 31), F(2141, 3906)
MS = F(3798855002922010337121170986221578569, 22939068096000000000000000000000000000)
C6 = F(4045313, 100000)
A_MIN = F(11, 20)
SCALE = 10**10


def require(test, message):
    if not test:
        raise ArithmeticError(message)


def down(x):
    return F((x * SCALE).__floor__(), SCALE)


def up(x):
    return -down(-x)


def sqrt_lo(x):
    require(x >= 0, "negative radicand")
    return F(isqrt(int(x * SCALE**2)), SCALE)


def sqrt_hi(x):
    return sqrt_lo(x) + F(1, SCALE)


def witnesses(text):
    # Only the scale and five polynomial coefficients are needed from each already checked witness.
    names = re.findall(r"def (massWit\d+) : SWit :=", text)
    pool = re.search(r"def massWitnesses : List SWit := \[(.*?)\]", text, re.S)
    require(
        pool and names == re.findall(r"massWit\d+", pool[1]) and len(names) == 24, "checked witness list"
    )
    blocks = re.findall(r"def massWit\d+ : SWit :=\s*⟨(.*?⟩),", text, re.S)
    out = []
    for block in blocks:
        terms = [
            F(int(n), int(d or 1)) for n, d in re.findall(r"\((-?\d+) : ℚ\)(?:\s*/\s*(\d+))?", block)
        ]
        require(len(terms) == 6, "witness polynomial arity")
        tau, a0, a1, a2, a4, a6 = terms
        require(0 < tau < 1 and a1 == 0 and a6 >= 0, "witness signs and scales")
        out.append((4 * tau / 3, a0 + a2 + 2 * a4 + 6 * a6, a4 + 9 * a6, C6 * a6))
    require(len(out) == len(names), "all witness records parsed")
    return out


def quadratic_max(a, b, c, lo, hi):
    def val(w):
        return (a * w + b) * w + c

    values = [val(lo), val(hi)]
    if a < 0:
        v = -b / (2 * a)
        if lo < v < hi:
            values.append(val(v))
    return max(values)


def prove(pool, rho, t_initial, t_end, y_max):
    # The ordinary elliptic mass-row bound handles all t up to t_initial.
    k = E - H * EH / MC
    require(k > 0 and 1 - H - k * C * C > 0, "positive base coefficients")
    require(
        H * (1 + MS / MC) + k * rho * rho + (1 - H - k * C * C) * t_initial**2 < LIMIT,
        "initial interval",
    )
    require(H + (1 - H) * t_end**2 + (E - H) * A_MIN < LIMIT, "small cubic energies")
    require(
        all(E > H * EH * p / (MC * sqrt_lo(A_MIN)) for p, *_ in pool), "monotone payoff in cubic energy"
    )
    r = 2 * AXIS**2 - 1
    cross = 2 * sqrt_hi(3 * (1 + r * r))
    tail = 2 * (1 + r * r)
    mu2 = F(355, 452)  # pi < 355/113
    stats = [0, 0]
    used = set()

    @lru_cache(maxsize=None)
    def spectral(lo, hi):
        return [(p, max(a + b * lo**2 + d * lo**3, a + b * hi**2 + d * hi**3)) for p, a, b, d in pool]

    def handle(t0, t1, y0, y1, depth):
        d0, d1 = C * C * t0 * t0, C * C * t1 * t1
        au = up(rho * rho - d0)
        # Bounding w = d^2/(A+d^2) for all admissible A>=A_MIN and t>=t0.
        # Each update is an upper bound on A, and may tighten the next w-interval.
        for _ in range(2):
            if au < A_MIN:
                break
            lo = d0 / (au + d0)
            hi = d1 / (A_MIN + d1)
            sy = y1 * y1
            B = cross * y1 - 2 * sy
            sm = quadratic_max(sy - cross * y1 + tail, B, sy, lo, hi)
            au = min(au, up(mu2 * (1 + RATE * sm) ** 2 - d0))
        if au < A_MIN:
            stats[0] += 1
            return
        candidates = spectral(y0, y1)
        values = [(2 * EH * p * sqrt_lo(au) - cost) / MC for p, cost in candidates]
        best = max(range(len(values)), key=values.__getitem__)
        bound = H + (1 - H) * t1 * t1 + E * au - H * values[best]
        if bound < LIMIT:
            stats[0] += 1
            used.add(best)
            stats[1] = max(stats[1], depth)
            return
        require(depth < 36, ("unresolved t and excess box", str(t0), str(t1), str(y0), str(y1)))
        if 30 * (t1 - t0) > y1 - y0:
            mid = (t0 + t1) / 2
            handle(t0, mid, y0, y1, depth + 1)
            handle(mid, t1, y0, y1, depth + 1)
        else:
            mid = (y0 + y1) / 2
            handle(t0, t1, y0, mid, depth + 1)
            handle(t0, t1, mid, y1, depth + 1)

    handle(t_initial, t_end, F(0), y_max, 0)
    return stats, sorted(used)


def controls(pool):
    t = F(".36")
    energy = F(".7405")
    rho = F(".9148")
    d2 = (C * t) ** 2
    require(energy + d2 < rho**2, "both test points pass the global ellipse")
    for y, mass in [(F("1.27"), F(".790")), (F(3), F(".788"))]:
        require(energy < mass < 1 - t * t and EH * energy - MC * mass < MS, "global mass and Parseval")
        require(
            H + (1 - H) * t * t + E * energy - H * mass > LIMIT, "uncontrolled payoff exceeds target"
        )
        if y < 2:
            require(
                all(
                    2 * EH * p * sqrt_hi(energy) - MC * mass < a + b * y * y + d * y**3
                    for p, a, b, d in pool
                ),
                "all spectral cuts pass without lifted excess",
            )
        else:
            w = d2 / (energy + d2)
            r = 2 * AXIS**2 - 1
            mix = (
                (1 - w) ** 2 * y * y
                + 2 * sqrt_lo(3 * (1 + r * r)) * y * w * (1 - w)
                + 2 * (1 + r * r) * w * w
            )
            require(
                energy + d2 < F(333, 424) * (1 + RATE * mix) ** 2,
                "lifted excess cut passes without spectral cuts",
            )
    print("Both negative controls passed.")


def main():
    root = Path(__file__).resolve().parents[4]
    pool = witnesses((root / "Grothe/Lower/MassWitnessData.lean").read_text())

    # Machin's formula: the even partial sum is the lower arctangent endpoint.
    def atan(n):
        p = sum(F((-1) ** j, (2 * j + 1) * n ** (2 * j + 1)) for j in range(12))
        return p, p + F(1, 25 * n**25)

    a, A = atan(5)
    b, B = atan(239)
    require(F(333, 106) < 16 * a - 4 * B < 16 * A - 4 * b < F(355, 113), "pi bounds")
    rows = [
        ("0.9148", ".358", ".36495", "6.5"),
        ("0.9142", ".360", ".36733", "6.5"),
        ("0.9148", ".358", ".40", "2"),
        ("0.9148", ".358", ".42", "1.5"),
        ("0.9148", ".358", ".44", "1"),
        ("0.9148", ".358", ".45", ".5"),
    ]
    for rho, start, end, y in rows:
        stats, ids = prove(pool, F(rho), F(start), F(end), F(y))
        print(
            f"rho={rho}, t<={end}, sqrt(excess)<={y}: {stats[0]} boxes, depth {stats[1]}, witnesses {ids}"
        )
    controls(pool)
    print("PASS")


if __name__ == "__main__":
    main()
