#!/usr/bin/env python3
"""Generate exact root intervals, identified by Lean. Agent-ID: codex-a7c4."""

import argparse
from fractions import Fraction as Q
from pathlib import Path

# Exact transcription of TrigBounds.unitBall; no floating-point arithmetic.
D = 2**128
PI_LO = Q(3141592653589793238462643383279, 10**30)
PI_HI = Q(3141592653589793238462643383280, 10**30)


def floor(q):
    return q.numerator // q.denominator


def ceil(q):
    return -floor(-q)


def down(q):
    return Q(floor(q * D), D)


def up(q):
    return Q(ceil(q * D), D)


def cmul(left, right):
    a, b, c = left
    d, e, f = right
    return a * d - b * e, a * e + b * d, c * (abs(d) + abs(e) + f) + f * (abs(a) + abs(b))


def rnd(ball):
    a, b, c = ball
    return down(a), down(b), up(c + a - down(a) + b - down(b))


def unit(size, index):
    yr = 2 * PI_LO * index / (8 * size)
    y = down(yr)
    delta = yr - y + 2 * (PI_HI - PI_LO) * index / (8 * size)
    a = b = Q(0)
    c, d, fac = Q(1), Q(0), 1
    for n in range(30):
        a, b = a + c, b + d
        c, d = -d * y / (n + 1), c * y / (n + 1)
        fac *= n + 1
    radius = abs(y) ** 30 * Q(31, fac * 30)
    ball = (a, b, up(radius + delta))
    for _ in range(3):
        ball = rnd(cmul(ball, ball))
    a, b, c = ball
    return ((floor((a - c) * D), ceil((a + c) * D)),
            (floor((b - c) * D), ceil((b + c) * D)))


def pair(value):
    return f"⟨{value[0]}, {value[1]}⟩"


def roots(size):
    entries = ("  ⟨" + pair(a) + ", " + pair(b) + "⟩"
               for a, b in (unit(size, index) for index in range(size)))
    return "#[\n" + ",\n".join(entries) + "\n]"


def render():
    text = '''import GrotheKernel.HardyArc

/-! Exact fixed-point root data. Agent-ID: codex-a7c4.
Generated using rational arithmetic by tools/gen_private_upper_roots.py.
The equality with the proved trigonometric enclosures is checked separately. -/

namespace Grothe.UpperReplacement.RootData

open GrotheKernel GrotheKernel.HardyArc

'''
    text += 'def roots64 : Array CI := ' + roots(64) + '\n\n'
    text += 'def roots128 : Array CI := ' + roots(128) + '\n\n'
    text += 'def piI : Ival := ' + pair((floor(PI_LO * D), ceil(PI_HI * D))) + '\n\n'
    text += 'def piInvI : Ival := ' + pair((floor(D / PI_HI), ceil(D / PI_LO))) + '\n\n'
    return text + 'end Grothe.UpperReplacement.RootData\n'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', type=Path, default=Path('Grothe/UpperReplacement/RootData.lean'))
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    text = render()
    if args.check:
        if args.output.read_text() != text:
            raise SystemExit(f'Generated root data differ: {args.output}')
    else:
        args.output.write_text(text)


if __name__ == '__main__':
    main()
