#!/usr/bin/env python3
"""Reprice a plain Stein row at another physical scale (issue #683).

The control takes the best chord through every pair of original scale knots.
All computations, including witness selection and outward rounding, are exact.
Agent-ID: codex-a7c4.
"""
import json
from fractions import Fraction as Q
from math import ceil
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
TARGET = Q(53, 250)
# Each pair is the excess s=E|q|⁴−2 and its exact square root.
ENDS = ((Q(9, 100), Q(3, 10)), (Q(4, 25), Q(2, 5)))
RADIUS = Q(93, 100)
SIXTH = Q(4045313, 100000)


def price(node, bank, target):
    scale = Q(node["sigma"])
    radius_ratio = target / scale
    k = radius_ratio**2
    # tools/gen_lower_data.py reorders y when producing a plain Lean SNode.
    a0, a2, a4, a6, a1 = map(Q, node["y"])
    assert a1 >= 0 and a6 >= 0
    offset = Q(0)
    for index, numerator in zip(node["cuts"], node["mu"], strict=True):
        weight = Q(numerator, 10**10)
        beta, alpha = (Q(n, 10**7) for n in bank[index][-2:])
        assert weight >= 0
        new_beta = beta + (k - 1) * alpha
        offset += weight * (beta**2 - new_beta**2 + 2 * alpha**2 * (k**2 - 1) / 3)
    if scale == target:
        assert offset == 0
    # Convexity of the cost in s gives its maximum over the closed slab.
    return max(
        a0
        + a1 * RADIUS * radius_ratio
        + a2 * k
        + a4 * (2 + s) * k**2
        + a6 * (6 + 9 * s + SIXTH * s * root) * k**3
        - offset
        for s, root in ENDS
    )


def main():
    row = json.loads((ROOT / "data/tail-rows/plain/row_0.835.json").read_text())
    assert all(s == r**2 for s, r in ENDS)
    stored = {Q(0): Q(row["caps"][0])}
    transported = []
    for cell in row["cells"]:
        for node in cell["nodes"]:
            scale = Q(node["sigma"])
            value = price(node, cell["bank"], scale)
            stored[scale] = min(value, stored.get(scale, value))
            transported.append((price(node, cell["bank"], TARGET), scale))
    # Enumerate the upper chords directly, including an endpoint at TARGET.
    control = min(
        ((v - TARGET) * stored[u] + (TARGET - u) * stored[v]) / (v - u)
        for u in stored
        for v in stored
        if u <= TARGET <= v and u < v
    )
    improved, source = min(transported)
    assert source == Q(11, 50)
    assert ceil(control * 10**9) == 1390416898
    assert ceil(improved * 10**9) == 1390342005
    assert control - improved > Q(7489, 10**8)
    print(f"row 0.835, shape [9/100, 4/25], scale {source} → {TARGET}")
    print(f"stored chords ≤ {ceil(control * 10**9)}/10^9")
    print(f"transported bound ≤ {ceil(improved * 10**9)}/10^9")


if __name__ == "__main__":
    main()
