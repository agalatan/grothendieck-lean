"""Second exact check of the curved energy chord and the six-sector shell price.

Run from the checkout root with python3 -IB path/to/this_script.py, or pass
the checkout root as its only argument. The public verifier supplies the Rice
polynomial and the globally checked Stein duals. The interpolation, shell
maximization, and partition checks below are independent. Agent-ID: codex-a7c4.
"""
from fractions import Fraction as Q
from itertools import combinations
from math import ceil, isqrt
from pathlib import Path
import json
import runpy
import sys

ENERGY = (Q(".0354"), Q(".0456"))
SHAPE = (Q(".0784"), Q(3))
CAP = Q(".080051")


def require(test, reason):
    if not test:
        raise ValueError(reason)


def deficit_endpoint(node, shape, rice):
    energy, (p0, p1, p2, p3) = node
    require(p3 >= 0, "sixth-moment multiplier must be nonnegative")
    scale = 10**12
    root = isqrt(shape.numerator * scale**2 // shape.denominator)
    if root**2 * shape.denominator < shape.numerator * scale**2:
        root += 1
    moment6 = 6 + 9*shape + Q("40.45313")*shape*Q(root, scale)
    baseline = sum(c*energy**degree for degree, c in enumerate(rice))
    return baseline - (p0 + p1 + p2*(2 + shape) + p3*moment6)


def curved_minimum(left, right, tile, rice):
    lo, hi, x, y, deficit = tile
    a, b = left[0], right[0]
    require(a <= lo < hi <= b, "dual energies must bracket the tile")
    # Each endpoint's lower price is concave in shape, so both endpoint
    # evaluations bound the price throughout the common shape interval.
    first = min(deficit_endpoint(left, s, rice) for s in (x, y))
    last = min(deficit_endpoint(right, s, rice) for s in (x, y))
    slope = (last-first)/(b-a)
    curvature = Q("1.673")*(2+y)
    # The chord minus its curvature debit is a convex quadratic. Its exact
    # minimum is attained at the vertex clipped to the tile's energy interval.
    vertex = (a+b)/2 - slope/curvature
    u = max(lo, min(hi, vertex))
    return first + slope*(u-a) - curvature*(u-a)*(b-u)/2 - deficit


def shell_reserve(tile, cell):
    lo, hi, _, y, deficit = tile
    v0, v1, mu, eta = cell
    rho = Q(".5053")
    d = 1 + rho**2
    k = 2*(min(CAP, hi+v1) - Q(".0463"))
    a, b = Q(".31") - k/d + mu, Q(".08") - k/d + mu
    require(min(a, b, eta) > 0, "inadmissible square completion")
    error = Q(".0035")**2 * hi
    limit = min(Q(1, 2500), Q(".0355")*hi**2*y)
    alpha, beta = Q(".000006"), Q(".28")
    gaussian_gap = Q("1.08") * max(Q(".0403448")-hi, lo-Q(".0403449"), 0)**2
    constant = error*((1+1/eta)*rho**2/a + 1/b)/d**2 - gaussian_gap
    constant += max(mu*d*v0, mu*d*v1)

    def payoff(t):
        return constant + (1+eta)*t/a - max(deficit, (t-alpha)/beta)

    # This piecewise affine function can peak at an endpoint or its single kink.
    kink = max(0, min(limit, alpha + beta*deficit))
    return -max(payoff(t) for t in (0, kink, limit))


def verify_cover(cover, nodes, rice):
    rectangles, radial, shells, used = [], [], [], set()
    for bounds, ids, cells in cover:
        tile = tuple(map(Q, bounds))
        lo, hi, x, y, deficit = tile
        require(ENERGY[0] <= lo < hi <= ENERGY[1] and SHAPE[0] <= x < y <= SHAPE[1],
                "tile outside the window")
        require(deficit > 0, "signed shell bound requires positive deficit")
        require(len(ids) == 2 and all(type(i) is int and i in nodes for i in ids),
                "unknown dual pair")
        used.update(ids)
        radial.append(curved_minimum(nodes[ids[0]], nodes[ids[1]], tile, rice))
        rectangles.append((lo, hi, x, y))
        end = Q(0)
        for cell in sorted(tuple(map(Q, c)) for c in cells):
            v0, v1, _, _ = cell
            require(v0 == end and v0 < v1, "shell gap or overlap")
            shells.append(shell_reserve(tile, cell))
            end = v1
        require(end == CAP-lo, "incomplete shell interval")

    # Finitely many closed rectangles cover the window if they are contained,
    # their interiors are disjoint, and their areas sum to the window's area.
    for r, s in combinations(rectangles, 2):
        require(min(r[1], s[1]) <= max(r[0], s[0]) or min(r[3], s[3]) <= max(r[2], s[2]),
                "rectangles overlap")
    area = sum((hi-lo)*(y-x) for lo, hi, x, y in rectangles)
    require(area == (ENERGY[1]-ENERGY[0])*(SHAPE[1]-SHAPE[0]), "missing window area")
    require(used == set(nodes), "unreferenced dual")
    require(min(radial) > Q(1, 10**10), "insufficient radial clearance")
    require(min(shells) > Q(1, 10**8), "insufficient retained clearance")
    return min(radial), min(shells), len(shells)


def main():
    if not __debug__:
        raise RuntimeError("enable assertions for the upstream Rice and Stein checks")
    if len(sys.argv) > 2:
        raise SystemExit("usage: python3 -IB this_script.py [repository-root]")
    repo = Path(sys.argv[1]).resolve() if len(sys.argv) == 2 else Path.cwd()
    source = repo / "research/conjecture-K/code/peak-window-codex-a7c4"
    primary = runpy.run_path(str(source / "verify.py"))
    raw, caps, rice = primary["read_public_inputs"](repo)
    duals = json.loads((source / "duals.json").read_bytes())
    nodes = primary["load_nodes"](duals, raw, caps)
    cover = json.loads((source / "cover.json").read_bytes())
    radial, shell, count = verify_cover(cover, nodes, rice)
    scale = 10**15
    print(f"{len(nodes)} public Stein duals, {len(cover)} tiles, {count} shell cells.")
    print(f"Curved-chord clearance > {ceil(radial*scale)-1}/{scale}.")
    print(f"Retained clearance > {ceil(shell*scale)-1}/{scale}.")


if __name__ == "__main__":
    main()
