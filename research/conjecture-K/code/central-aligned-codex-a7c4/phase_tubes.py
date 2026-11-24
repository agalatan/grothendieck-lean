#!/usr/bin/env python3
"""Exact constants and optional replay of the real-leaf margins for the phase tubes.

Agent-ID: codex-a7c4. Refs #431 and #580.
"""
import argparse
import hashlib
import json
from collections import Counter
from fractions import Fraction as F
from math import comb, factorial
from pathlib import Path
from phase_grid import A, B, C, INV_SQRT2, RADIUS_DEN, integral_cost

if not __debug__:
    raise RuntimeError("Run without -O to check every assertion")

M1, M2 = F(51, 100), F(3, 4)
AREA = F(61, 10)
HOLDER_CUBED = (3 * AREA) ** 3 * (2 * M1) * (M2 / B) ** 2
# From all twenty audited real-region receipts, in the coordinate system of verify.py.
MIN_MARGIN = F(7014462798447740663525007, 2515803550630543360000000000)
# SHA-256 of the concatenated binary SHA-256 digests, in region-index order, of run 43750845217.
ARCHIVE = "cdd924a05cca44ae714ff13e0280ce207fde088f1b519a174156f937849b696d"


def translated(poly, left):
    """Coefficients of poly(left + x), in ascending order."""
    return [sum(comb(i, j) * poly[i] * left ** (i - j) for i in range(j, len(poly)))
            for j in range(len(poly))]


def check_gaussian_envelope(scale, factor):
    """Prove factor * exp(scale*T) >= 3*T^2/2 - 37*T/100 + 63/250 on T >= 0."""
    degree = 10
    poly = [factor * F(scale ** k, factorial(k)) for k in range(degree + 1)]
    poly[0] -= F(63, 250)
    poly[1] += F(37, 100)
    poly[2] -= F(3, 2)
    for left in range(4):
        monomials = translated(poly, left)
        for k in range(degree + 1):
            bernstein = sum(F(comb(k, j), comb(degree, j)) * monomials[j]
                            for j in range(k + 1))
            assert bernstein > 0
    assert min(translated(poly, 4)) > 0


def constants():
    # Squaring removes the only irrational coefficient of the pointwise weight.
    assert F(4, 25) + C ** 2 <= F(63, 250)
    assert 2 * C ** 2 <= (F(4, 5) - F(37, 100)) ** 2
    check_gaussian_envelope(2, M1 ** 2)
    check_gaussian_envelope(1, M2)
    # 8*cuberoot(2) - 4 <= AREA, and 2*sqrt(M2*E[M^2]) < 3.
    assert ((AREA + 4) / 8) ** 3 >= 2
    mean_square = 3 - F(37, 100) + F(63, 250)
    assert 4 * M2 * mean_square < 9
    assert F(4, 25) + C**2 < F(51, 100)**2 and F(3, 2) < F(123, 100)**2
    # Small t: S <= 2 in all four real charts. Large t: use the uniform area bound.
    m = A - F(1, 8) / (2 * B)
    assert m > 0 and 3 * F(1, 96) ** 2 < m * MIN_MARGIN
    assert HOLDER_CUBED * F(1, 512) ** 5 < MIN_MARGIN ** 3 / 4
    assert (2 + F(1, RADIUS_DEN)**2) / 1024**2 < F(1, 512)**2
    assert F(7, 8)**2 > F(3, 4)
    energy = F(2, 49)
    driver_energy = F(1, 16)**2 + F(1, 32)**2 + F(1, 640)**2
    assert F(1, 640)/F(1, 16) == F(1, 40) < F(1, RADIUS_DEN)
    assert energy <= F(463, 10000) and energy + driver_energy <= F(80051, 10**6)
    print(f"minimum real margin {MIN_MARGIN}; uniform radius 1/512; t <= 1/4: 1/96")


def modulus(chart, cell, cover):
    """Uniform lower bound on the smallest symmetric Jacobian eigenvalue on a real leaf."""
    _, _, yl, yh, _, th = cell
    endpoints = [cover.coefficients(chart, y) for y in (yl, yh)]
    u = max(abs(a + k * b) for a, b in endpoints for k in INV_SQRT2)
    v = max(abs(b) for _, b in endpoints)
    return A - th ** 2 * max(u ** 2 / 3, v ** 2 / 2) / B


def dyadic_radius(margin, tlo, m):
    radius = F(1)
    margin_cubed = margin ** 3
    while (18 * radius >= margin and 3 * radius ** 2 >= m * margin and
           HOLDER_CUBED * radius ** 5 >= margin_cubed * tlo):
        radius /= 2
    return radius


def inherited_region(chart, cell, radius, cover):
    """Apply row 7.4.11 or 7.4.12 to the entire complex cylinder above the real box."""
    wl, wh, yl, yh, tl, th = cell
    amax, bmax, smin = cover.direction_bounds(chart, yl, yh)
    physical_smax = th**2 * (amax**2 + bmax**2 + radius**2)
    if any(lo <= wl and wh <= hi and physical_smax <= cap**2 for lo, hi, cap in cover.PROFILE):
        return "origin"
    if tl**2 * smin >= F(3, 4):
        return "amplitude"
    endpoints = [cover.coefficients(chart, y) for y in (yl, yh)]
    real_part = 16 * tl**2 * smin**2 + 3 * smin - 6 * max((2*a+b)**2 for a, b in endpoints)
    # |2e_A+e_B|² <= 5||e||²; the term 16 t² ||e||⁴ only increases the reserve.
    if real_part + min(0, 32 * tl**2 * smin - 27) * radius**2 >= 0:
        return "direction"
    raise AssertionError(f"uncovered inherited region at chart {chart}, {cell}")


def replay(receipts):
    # validate checks the stored corner bounds, source hashes and complete trees.
    # The numerical upper endpoints are the outward source integrals of the pinned run.
    import verify as cover

    assert cover.QA > 0 and cover.QA * cover.QB > cover.QC ** 2
    seen, counts = {}, Counter()
    grids = Counter()
    inherited = Counter()
    target_radius = F(1, RADIUS_DEN)
    minimum = None
    paths = sorted(receipts.rglob("region-*.json"), key=lambda p: p.name)
    assert [p.name for p in paths] == [f"region-{i:02}.json" for i in range(20)], "missing or duplicate region"
    for path in paths:
        raw = path.read_bytes()
        data = json.loads(raw)
        i = cover.validate(data)
        assert path.name == f"region-{i:02}.json" and i not in seen
        seen[i] = hashlib.sha256(raw).digest()
        curvature = cover.curvature_bounds(i, data["curvature"])
        points = {tuple(map(F, row[:4])): cover.hex_fraction(row[4]) - cover.target(*map(F, row[:4]))
                  for row in data["points"]}
        for chart, root, pathcode, kind in data["leaves"]:
            lo, hi = cover.amplitude_roots()[root]
            cell = (F(i, 16), F(i + 1, 16), F(-1), F(1), lo, hi)
            for digit in pathcode:
                axis, side = divmod(int(digit), 2)
                cell = cover.split(cell, axis)[side]
            if kind != "c":
                inherited[inherited_region(chart, cell, target_radius, cover)] += 1
                continue
            margin = -max(points[k] for k in cover.corners(chart, cell))
            margin -= sum(cover.errors(chart, cell, curvature))
            assert margin > 0
            minimum = margin if minimum is None else min(minimum, margin)
            m = modulus(chart, cell, cover)
            radius = dyadic_radius(margin, cell[-2], m)
            counts[radius] += 1
            if radius < target_radius:
                for n in (4, 8, 16):
                    if integral_cost(chart, cell, m, n) < margin:
                        grids[n] += 1
                        break
                else:
                    raise AssertionError(f"uncovered region {i}, chart {chart}, root {root}, path {pathcode}")
    assert hashlib.sha256(b"".join(seen[i] for i in range(20))).hexdigest() == ARCHIVE, "different real cover"
    assert sum(counts.values()) == 31090 and minimum == MIN_MARGIN
    print("radius counts (direct real leaves):")
    for radius, n in sorted(counts.items()):
        print(f"{radius} {n}")
    print("additional leaves certified by source mesh:")
    for n, count in sorted(grids.items()):
        print(f"1/{n} {count}")
    analytic = sum(c for radius, c in counts.items() if radius >= target_radius)
    assert analytic + sum(grids.values()) == 31090
    print(f"radius {target_radius}: {analytic} analytic + {sum(grids.values())} integrated = 31090")
    assert sum(inherited.values()) == 1502
    print("inherited boxes at the same radius:", ", ".join(f"{k} {v}" for k,v in sorted(inherited.items())))
    print(f"all {sum(counts.values()) + sum(inherited.values())} boxes covered at radius {target_radius}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--receipts", type=Path, help="archived directory containing the twenty region JSONs")
    args = parser.parse_args()
    constants()
    if args.receipts:
        replay(args.receipts)
