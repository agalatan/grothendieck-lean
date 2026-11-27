"""Exact replay for retained six-sector K on the central high-excess peak band.

Agent-ID: codex-a7c4. Usage: python3 -IB verify.py [repository-root].
"""

import copy
import importlib.util
import json
import sys
from fractions import Fraction as Q
from functools import lru_cache
from math import comb, isqrt
from pathlib import Path

HERE = Path(__file__).resolve().parent
RHO = Q(".5053")
DEN = 1 + RHO**2
U_MAX = Q(".080051")
C_MAX_SQ = Q(1, 2500)
SLOPE = Q(7, 25)
ALLOWANCE = Q(6, 10**6)


def require(ok, message):
    if not ok:
        raise ArithmeticError(message)


def partition(rows, lo, hi):
    current = lo
    for row in rows:
        left, right = map(Q, row[:2])
        require(left == current and left < right, "gap or overlap")
        current = right
    require(current == hi, "missing endpoint")


def price(lo, hi, v0, v1, deficit, mu, eta):
    k = 2 * (min(hi + v1, U_MAX) - Q(".0463"))
    a, b = Q(".31") - k / DEN + mu, Q(".08") - k / DEN + mu
    require(min(a, b, eta) > 0, "invalid square completion")
    error_sq = Q(".0035")**2 * hi
    slope = (1 + eta) / a
    offset = error_sq * ((1 + 1 / eta) * (RHO / DEN)**2 / a + 1 / (DEN**2 * b))
    offset += mu * DEN * (v1 if mu >= 0 else v0)
    hinge = min(C_MAX_SQ, SLOPE * deficit + ALLOWANCE)
    payoff = max(hinge * slope - deficit,
                 C_MAX_SQ * slope - max(deficit, (C_MAX_SQ - ALLOWANCE) / SLOPE))
    buffer = Q(27, 25) * max(Q(".0403448") - hi, lo - Q(".0403449"), 0)**2
    return payoff + offset - buffer


def inputs(repo):
    code = repo / "research/conjecture-K/code"
    name = "peak-remote-deficit-codex-a7c4"
    spec = importlib.util.spec_from_file_location("peak", code / name / "verify_peak.py")
    peak = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(peak)
    caps, tail, rice = peak.read_inputs(repo)
    polys = json.loads((code / name / "peak_cover.json").read_bytes())["cubics"]

    @lru_cache(None)
    def majorant(index):
        require(type(index) is int and 0 <= index < len(polys), "unknown majorant")
        p = list(map(Q, polys[index]))
        require(len(p) == 4 and p[3] > 0, "wrong cubic sign")
        for l, h, src in caps:
            require(peak.positive([x-y for x, y in zip(p, src)], l, h), "finite cap")
        diff = [p[i] - (tail[i] if i < len(tail) else 0) for i in range(4)]
        require(peak.positive(diff, caps[-1][1], Q(32)), "transition to ray")
        for j in range(4):
            require(sum(diff[i] * comb(i, j) * 32**(i-j) for i in range(j, 4)) >= 0,
                    "infinite ray")
        return p

    def radial(p, lo, hi, x):
        den = 10**9
        n = isqrt(x.numerator * den**2 // x.denominator)
        if n**2 * x.denominator < x.numerator * den**2:
            n += 1
        upper = [p[0], p[1], p[2] * (2+x),
                 p[3] * (6+9*x+Q(4045313, 100000)*x*Q(n, den))]
        coefficients = [v - w for v, w in zip(rice, upper + [Q(0)] * 5)]
        return min(peak.bernstein(coefficients, lo, hi))

    return majorant, radial


def verify(data, get_poly, radial):
    partition(data, Q(".0354"), Q(".0456"))
    radial_margin, shell_margin = [], []
    for lo, hi, deficit, shell, shape in data:
        lo, hi, deficit = map(Q, (lo, hi, deficit))
        require(deficit > 0, "positive threshold required")
        partition(shell, 0, U_MAX - lo)
        partition(shape, 3, 42)
        for v0, v1, mu, eta in shell:
            gain = price(lo, hi, *map(Q, (v0, v1)), deficit, Q(mu), Q(eta))
            require(gain < 0, "insufficient shell reserve")
            shell_margin.append(-gain)
        for x0, x1, index in shape:
            p = get_poly(index)
            for x in map(Q, (x0, x1)):
                margin = radial(p, lo, hi, x) - deficit
                require(margin > 0, "insufficient deficit price")
                radial_margin.append(margin)
    shell_floor = min(shell_margin)
    radial_floor = min(radial_margin)
    require(shell_floor > Q(146939, 10**12), "claimed shell clearance")
    require(radial_floor > Q(181948, 10**12), "claimed radial clearance")
    return shell_floor, radial_floor


def main():
    if not __debug__:
        raise RuntimeError("the upstream Rice benchmark requires assertions")
    repo = Path(sys.argv[1]).resolve() if len(sys.argv) > 1 else HERE.parents[3]
    data = json.loads((HERE / "cover.json").read_bytes())
    args = inputs(repo)
    shell, radial = verify(data, *args)
    unit = 10**12
    print(f"{len(data)} energy strips, {sum(len(row[3]) for row in data)} shell cells,"
          f" {sum(len(row[4]) for row in data)} shape cells.")
    print(f"Shell clearance > {int(shell*unit)}/10^12,"
          f" radial clearance > {int(radial*unit)}/10^12.")

    def fail(mutate, expected):
        broken = copy.deepcopy(data)
        mutate(broken)
        try:
            verify(broken, *args)
        except ArithmeticError as exc:
            require(str(exc) == expected, f"unexpected rejection: {exc}")
        else:
            raise ArithmeticError("corrupt cover accepted")

    fail(lambda d: d.pop(), "missing endpoint")
    fail(lambda d: d[0][3][0].__setitem__(2, "-1"), "invalid square completion")
    fail(lambda d: d[0][3][0].__setitem__(3, "100"), "insufficient shell reserve")
    fail(lambda d: d[0][4].pop(), "missing endpoint")
    fail(lambda d: d[0].__setitem__(2, "1"), "insufficient deficit price")
    fail(lambda d: d[5][3][1].__setitem__(2, "-1/200000000"), "claimed shell clearance")
    print("Six corruption controls rejected.")


if __name__ == "__main__":
    main()
