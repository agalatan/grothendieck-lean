"""Odd-sector price from the existing conditional matrix bounds. Agent-ID: codex-a7c4."""
import argparse
from bisect import bisect_right
from fractions import Fraction as Q
from functools import cache
import hashlib
import importlib.util
import json
from math import ceil, isfinite, isqrt
from pathlib import Path

HERE = Path(__file__).resolve().parent
LOW = Q('.825')
ODD_RAY = Q(11, 10)


def require(ok, message):
    if not ok:
        raise ValueError(message)


def conditional_rows(repo):
    folder = repo/'research/conjecture-K/code/odd-cubic-core-2026-11-15'
    filename = 'results/all_bounds.txt'
    payload = (folder/filename).read_bytes()
    manifest = json.loads((folder/'SHA256SUMS.json').read_bytes())
    require(hashlib.sha256(payload).hexdigest() == manifest[filename], 'conditional matrix digest')
    rows = []
    for i, line in enumerate(payload.decode().splitlines()):
        fields = line.split()
        require(len(fields) == 5 and int(fields[0]) == i, 'missing or reordered radius')
        raw = [float(z) for z in fields[1:]]
        require(all(map(isfinite, raw)), 'invalid binary64 interval')
        lo, hi, price, error = map(Q.from_float, raw)
        radius = Q(i, 40)
        require(lo <= radius and Q(i+1, 40) <= hi and 0 <= error < price < Q(32, 25),
                'invalid conditional matrix certificate')
        rows.append((radius**2, price))
    require(len(rows) == 320, 'incomplete radius cover')
    return rows


def price_hull(rows):
    # Constant extension after the highest ordinate enforces monotonicity.
    peak = max(range(len(rows)), key=lambda i: rows[i][1])
    hull = []
    for x, y in rows[:peak+1]:
        while len(hull) >= 2:
            a, b = hull[-2]
            c, d = hull[-1]
            if (d-b)*(x-c) > (y-d)*(c-a):
                break
            hull.pop()
        hull.append((x, y))
    return hull


def checked_envelope(rows, hull):
    xs = [x for x, _ in hull]
    require(xs and xs[0] == 0 and all(a < b for a, b in zip(xs, xs[1:])), 'hull abscissae')
    slopes = [(d-b)/(c-a) for (a,b),(c,d) in zip(hull,hull[1:])]
    require(all(s >= 0 for s in slopes) and all(a >= b for a,b in zip(slopes, slopes[1:])),
            'hull is not nondecreasing and concave')

    def upper(x):
        i = bisect_right(xs, x)-1
        require(i >= 0, 'negative squared radius')
        if i == len(slopes):
            return hull[i][1]
        return hull[i][1] + slopes[i]*(x-xs[i])

    require(all(upper(x) >= y for x,y in rows) and upper(64) >= ODD_RAY,
            'uncovered odd-price radius')
    return upper


@cache
def sqrt_upper(x):
    scale = 10**13
    n = isqrt(x.numerator*scale**2//x.denominator)
    return Q(n if n*n*x.denominator == x.numerator*scale**2 else n+1, scale)


def uniform_price_cap(hull, energy, multiplier):
    """Upper odd price using only the mean energy and one nonnegative dual multiplier."""
    require(energy >= 0 and multiplier >= 0, 'invalid uniform-price arguments')
    last_radius, top_price = hull[-1]
    lower = multiplier * (last_radius - energy)
    for (left, price), (right, next_price) in zip(hull, hull[1:]):
        width = right - left
        slope = (next_price - price) / width
        if multiplier >= 3 * slope:
            conjugate = multiplier - slope
        else:
            conjugate = 2 * multiplier * sqrt_upper(multiplier / (3 * slope)) / 3
        lower -= width * conjugate
    return top_price - Q(4, 51) * max(0, lower)


def check_uniform_prices(hull):
    witnesses = [
        ('.043', '.521787', 1277940349, 1507401),
        ('.06', '.355886', 1278521949, 925802),
        ('.07', '.274510', 1278767934, 679816),
    ]
    last_radius, top_price = hull[-1]
    for energy, multiplier, ceiling, discount in witnesses:
        cap = uniform_price_cap(hull, Q(energy), Q(multiplier))
        require(cap <= Q(ceiling, 10**9), 'uniform odd price at energy ' + energy)
        require(top_price - cap > Q(discount, 10**9), 'uniform plateau discount')
    require(uniform_price_cap(hull, last_radius, Q('.5')) == top_price, 'mean reaches the plateau')
    require(uniform_price_cap(hull, Q('.06'), Q(0)) == top_price, 'zero dual multiplier')


def checked_price(repo):
    rows = conditional_rows(repo)
    hull = price_hull(rows)
    upper = checked_envelope(rows, hull)
    check_uniform_prices(hull)
    vertices = [i for i, row in enumerate(rows) if row in hull]
    require(vertices == [0, 11, 12, 13, 14, 15, 16, 17], 'reported hull vertices')
    # The last vertex attains the certified maximum. Removing it makes the
    # putative constant tail miss the corresponding finite-radius interval.
    try:
        checked_envelope(rows, hull[:-1])
    except ValueError as error:
        require(str(error) == 'uncovered odd-price radius', 'wrong deletion failure')
    else:
        raise ValueError('accepted the missing maximum-price radius')

    def price(u, chi):
        require(u >= 0 and chi >= 0, 'negative odd-price argument')
        return upper(u*(1+sqrt_upper(8*chi)))

    require(price(Q('.043'),Q('.43')) <= Q(1274054601,10**9), 'low-excess odd price')
    require(price(Q('.043'),Q('.1')) <= Q(1260062371,10**9), 'second low-excess odd price')
    u, chi = Q('.043'), Q('.43')
    require(upper(u*(1+3*sqrt_upper(chi/2))) <= Q(1268498855,10**9), 'holomorphic odd price')
    require(upper(u) <= Q(1242234447,10**9), 'deterministic odd price')
    return price


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('repo', nargs='?', type=Path, default=HERE.parents[3])
    ap.add_argument('--price-only', action='store_true')
    args = ap.parse_args()
    repo = args.repo.resolve()
    price = checked_price(repo)
    print('Verified the odd-price envelope over 320 conditional intervals and the ray.')
    if args.price_only:
        return
    spec = importlib.util.spec_from_file_location('weighted_shoulder', HERE/'weighted_shoulder.py')
    weighted = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(weighted)
    polys, nodes = weighted.base.read_inputs(repo)
    nodes = weighted.shoulder.add_stein_rows(repo, nodes)
    count, margin = weighted.prove(polys, nodes, weighted.checked_rows(),
                                   lower=LOW, high=weighted.LOW, odd_price=price)
    require(margin > Q(101721,10**12), 'physical shoulder clearance')
    print(f'{count} closed cells for all shapes [0,42] and amplitudes [.825,.8255].')
    print(f'Physical clearance > {ceil(margin*10**12)-1}/10^12.')


if __name__ == '__main__':
    main()
