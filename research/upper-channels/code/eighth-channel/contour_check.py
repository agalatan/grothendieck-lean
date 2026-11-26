#!/usr/bin/env python3
"""Exact contour certificates for cell copies R = [a, -(1-a)] (issue #723, review of PR #724).

Reuses the Bernstein positivity test and the angular polynomials of ../cell_tail.py (codex-a7c4, #589) with the
preprocessor coefficient a as a parameter.  For an outer analytic radius R, a contour rho and a Schur parameter j it
checks exactly, on CELLS equal closed subintervals of y = cos^2(theta) in [0, 1]:
  the disk:   a - 9 b R^2 > 0 and 0 < a R - b R^3 < 1          (b = 1 - a)
  the gates:  G0 = 1 - j(1+s) > 0 and G0^2 - (1-2j)^2 u > 0
  A > 0, B > 0, and 4 j A (A+s) * root - B > 0 with root^2 = BUDGET,
so that the Schur bound of CELL_TAIL.md section 2 gives |H(z)|^2 <= BUDGET on |z| = rho.  It then prints the exact
Hardy tail from index 126: sqrt(BUDGET rho^-(4*126+2) / (1 - rho^-4)), as an upper decimal.
For BUDGET = 2 the last condition is checked as 2 (4 j A (A+s))^2 - B^2 > 0 (with B > 0).
The algebra from these polynomial facts to the circle bound is that of CELL_TAIL.md (P + C, author only);
this script adds only the exact polynomial checks at new parameters.
Agent-ID: claude-b9ee (worker).  Standard library only.  Usage: contour_check.py"""
import sys
from fractions import Fraction as Q
from math import isqrt
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
import cell_tail as ct  # noqa: E402


def check(a, R, rho, j, budget, cells):
    if not 0 < a < 1:
        return False
    b = 1 - a
    if not (a - 9 * b * R ** 2 > 0 and 0 < a * R - b * R ** 3 < 1 and 1 < rho < R and 0 < j < Q(1, 2)):
        return False
    ct.A, ct.B = a, b
    u, s = ct.radial_polynomials(rho)
    delta = ct.minus(ct.square(ct.add(ct.ONE, s)), ct.scale(u, 4))
    m = ct.minus(ct.add(ct.ONE, s), ct.scale(u, 2))
    gate = ct.minus(ct.ONE, ct.scale(ct.add(ct.ONE, s), j))
    A = ct.minus(ct.minus(ct.ONE, u), ct.scale(m, j))
    B = ct.minus(m, ct.scale(delta, j))
    if not (ct.positive(gate, cells) and ct.positive(ct.minus(ct.square(gate), ct.scale(u, (1 - 2 * j) ** 2)), cells)
            and ct.positive(A, cells) and ct.positive(B, cells)):
        return False
    lhs = ct.scale(ct.times(A, ct.add(A, s)), 4 * j)
    return ct.positive(ct.minus(ct.scale(ct.square(lhs), budget), ct.square(B)), cells)


def tail_square(rho, budget, start=126):
    return budget * rho ** (-(4 * start + 2)) / (1 - rho ** -4)


def tail(rho, budget, start=126):
    """Upward decimal with 4 significant digits, as a string, for the square root of tail_square (exact check)."""
    sq = tail_square(rho, budget, start)
    e = 0
    while Q(10) ** (2 * e) > sq:
        e -= 1
    while Q(10) ** (2 * (e + 1)) <= sq:
        e += 1
    unit = Q(10) ** (e - 3)                      # 4 significant digits: m * 10^(e-3), 1000 <= m < 10000
    m = isqrt(int(sq / unit ** 2)) + 1
    while (m * unit) ** 2 <= sq:
        m += 1
    up = m * unit
    assert up ** 2 > sq, "printed upper bound"
    return f"{m / 1000:.3f}e{e}"


if __name__ == "__main__":
    cases = [(Q(a), R, rho, j, budget, cells)
             for a in ("23277/25000", "93079/100000", "931/1000", "1863/2000")
             for R, rho, j, budget, cells in ((Q(11, 10), Q(109, 100), Q(17, 40), Q(2), 16),
                                              (Q(6, 5), Q(1197, 1000), Q(3, 20), Q(144), 8))]
    for a, R, rho, j, budget, cells in cases:
        ok = check(a, R, rho, j, budget, cells)
        print(f"a = {a}: disk R = {R}, contour rho = {rho}, j = {j}, |H|^2 <= {budget} on {cells} cells: "
              f"{'PROVED' if ok else 'not certified'}" + (f"; tail from 126 < {tail(rho, budget)}" if ok else ""))
    # a wider contour for the new parameter 23277/25000 (the 1197/1000 certificate of CELL_TAIL.md fails there)
    a = Q(23277, 25000)
    for rho in (Q(119, 100), Q(118, 100), Q(117, 100), Q(115, 100)):
        found = None
        for j in (Q(1, 10), Q(1, 8), Q(3, 20), Q(1, 5), Q(1, 4), Q(3, 10)):
            for budget in (Q(144), Q(400), Q(2500), Q(10000)):
                if check(a, Q(6, 5), rho, j, budget, 16):
                    found = (j, budget)
                    break
            if found:
                break
        print(f"a = {a}: disk 6/5, contour rho = {rho}: " + (f"PROVED with j = {found[0]}, |H|^2 <= {found[1]}; tail from 126 < "
              f"{tail(rho, found[1])}" if found else "no certificate in the small grid"))
        if found:
            break
