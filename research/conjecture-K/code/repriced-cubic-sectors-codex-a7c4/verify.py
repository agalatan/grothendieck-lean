"""Exact bounds for the repriced cubic and odd-sector witness. Agent-ID: codex-a7c4."""

import argparse
import copy
import hashlib
import importlib.util
import json
import sys
from fractions import Fraction as Q
from math import isqrt
from pathlib import Path

HERE = Path(__file__).resolve().parent
EPS, ELL, BETA = Q('.752'), Q('.8456'), Q('.1432')
TARGET, S_HI = Q('.713245'), Q('1.3739535256616')
P0, ODD = Q(2500, 1891), Q(32, 25)
U0, YMAX = Q('.0463'), Q(13, 2)
A, B = Q('.886762780'), Q('.432306903')
PRICES = {'1.196': (Q('.165'), Q('1.38575')), '1.228': (Q('.135'), Q('1.38130')),
          '1.28': (Q('.2'), Q('1.37627'))}
SRC = 'audit-2026-11-15-codex-a7c4/remote_stein_original'
PEAK = 'peak-remote-deficit-codex-a7c4/verify_peak.py'
DIGESTS = {PEAK: 'a49044bd9c63300db1b65d783696ce3e23e691ddace694b171f49ce9067ac675',
           f'{SRC}/moment-boxes.json': 'cef37c2a66eacd66296add7ed2efc5a8d6afc336d2ed614102de08429d449695',
           f'{SRC}/verify.py': '7a3eb7592ab569be08cb95a5e9c061b9339e6a054773d93d7abbe8493b5485c2',
           f'{SRC}/exact.py': '8149a1b17c054c58461f36a8a2e030a2c324041c4b18d9e2e6eef72185e94145',
           f'{SRC}/profile.py': 'fb6a187270358a7b230a6824fa1cb9e85b8f155666d2b9cfb4df9071b9caaf0a',
           f'{SRC}/check_stein.py': '669688428045a2564a44680a62bdfca9277494c96b98155acc772691a21b8328'}


def require(test, detail):
    if not test:
        raise ValueError(detail)


def load(path, name):
    spec = importlib.util.spec_from_file_location(name, path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def sqrt_up(x):
    den = 10**15
    return Q(isqrt(x.numerator * den**2 // x.denominator) + 1, den)


def cover_price(raw, price, end, cap, polys, bernstein):
    rects = [(Q(l), Q(h), Q(c), Q(d), i) for l, h, c, d, i in raw]
    worst = S_HI + (P0-price)*U0
    require(Q(0) < price < P0 and U0 < end and YMAX**2 >= 42, 'invalid regime')
    for l, h, c, d, i in rects:
        require(U0 <= l < h <= end and 0 <= c < d <= YMAX, 'bad rectangle')
        require(type(i) is int and 0 <= i < len(polys), 'bad majorant index')
        a0, a1, a2, a3 = polys[i]
        require(a3 > 0, 'positive sixth-moment coefficient required')
        for y in (c, d):
            coeff = [a0, a1-price, a2*(2+y*y), a3*(6+9*y*y+Q('40.45313')*y**3)]
            worst = max(worst, *bernstein(coeff, l, h))
    grid = sorted({U0, end, *(l for l, *_ in rects), *(h for _, h, *_ in rects)})
    for l, h in zip(grid, grid[1:]):
        slices = sorted((c, d) for a, b, c, d, _ in rects if a <= l and h <= b)
        require(slices and slices[0][0] == 0 and slices[-1][1] == YMAX
                and all(s[1] == t[0] for s, t in zip(slices, slices[1:])), 'shape cover gap')
    require(worst < cap, 'remote price cap too small')
    return worst


def large_energy(price, start, cap, caps, tail, bernstein):
    require(caps[-1][1] == 2 and price > tail[1], 'terminal price')
    upper = tail[0] + (tail[1]-price)*2
    for lo, hi, v in caps:
        if hi > start:
            upper = max(upper, *bernstein([v[0], v[1]-price, v[2], v[3]], max(start, lo), hi))
    require(upper < cap, 'large-energy upper')
    return upper


def constant(t, mu):
    return t*t - 2*mu*ELL*t + 2*(mu*BETA)**2/EPS


def spare(lo, hi, p, cap, w=None):
    mu = EPS*p
    if p < ODD:
        require(w is not None and w >= 0, 'odd energy must be bounded at this price')
    odd_cost = max(ODD-p, 0)*(w or 0)/mu
    return TARGET-max(constant(t, mu) for t in (lo, hi))-mu*cap-odd_cost


def row_checks(odd_physical=Q('.01')):
    normal = [('1.196','.751','.77','171.425763'), ('1.228','.77','.795','169.095880'),
              ('1.28','.795','.833','108.289857'), ('p0','.833','.8393','64.327139')]
    margins = []
    for name, l, h, promised in normal:
        price = P0 if name == 'p0' else Q(name)
        cap = S_HI if name == 'p0' else PRICES[name][1]
        if price < ODD:
            require(4*B*(A-Q(l))/price**2 < PRICES[name][0], 'physical remote radius')
        gap = spare(Q(l), Q(h), price, cap, odd_physical)
        require(gap > Q(promised)/10**6, 'odd-sector row clearance')
        margins.append(gap)
    partial = spare(Q('.7923'), Q('.833'), ODD, PRICES['1.28'][1])
    require(partial > Q('3.223947')/10**6, 'unrestricted odd clearance')
    require(min(margins)-2*sqrt_up(Q(1, 10**9)) > Q('1.0815')/10**6, 'even perturbation clearance')
    return margins, partial


def remote_radius(lo, p):
    pi_hi = Q('3.141592653589794')
    tangent = 4*B*(A-lo)/p**2
    if lo**2 >= 3*pi_hi/14:
        return min(tangent, (pi_hi/4-lo*lo)/p**2)
    return tangent


def shells():
    d, err = 1+Q('.5053')**2, Q('.0035')
    def tilted_mix(lo, hi, p, cap, theta, w_phys, v_phys):
        mu, h = EPS*p, remote_radius(lo, p)
        require(0 < theta <= 1 and mu*theta <= 1, 'trial norm charge')
        odd_price = ODD + theta*(P0-ODD)
        require(odd_price <= p or w_phys is not None, 'uncapped odd price')
        v = v_phys/mu**2
        linear = 2*(Q('.139')*sqrt_up(d)+err)*sqrt_up(h*v)
        quad = (P0-Q('.08')*d+2*(h-U0))/theta-p
        loss = mu*(linear+max(0,quad)*v+2*v*v/theta**3)
        loss += max(0, odd_price-p)*(w_phys or 0)/mu
        return TARGET-max(constant(t, mu) for t in (lo, hi))-mu*cap-loss

    central = [('1.196','.751','.77'), ('1.228','.77','.795'), ('1.28','.795','.833'), ('p0','.833','.8393')]
    bound = Q('0.0000005')
    small_margins = []
    for name, l, h in central:
        p = P0 if name == 'p0' else Q(name)
        cap = S_HI if name == 'p0' else PRICES[name][1]
        theta = Q(1) if name == 'p0' else Q(1,25)
        small_margins.append(tilted_mix(Q(l), Q(h), p, cap, theta, Q('.01'), bound))
    require(all(actual > Q(promised, 10**12) for actual, promised in
                zip(small_margins, (41892294,50225947,4211258,12799008))), 'small-shell reserve')
    p = Q('1.28025')
    theta = (p-ODD)/(P0-ODD)
    uncapped = [tilted_mix(Q('.795'), Q('.833'), p, PRICES['1.28'][1], theta, None, Q('0.0000001')),
                tilted_mix(Q('.833'), Q('.8393'), P0, S_HI, Q(1), None, Q('0.0000001'))]
    require(min(uncapped) > Q(32663279,10**12), 'small-shell unrestricted odd reserve')
    reject(lambda: tilted_mix(Q('.795'), Q('.833'), p, PRICES['1.28'][1], theta+Q(1,1000000), None, Q(0)), 'uncapped odd price')

    cone_margins = []
    for l, h, p, cap in [(Q('.8205'), Q('.833'), ODD, PRICES['1.28'][1]),
                         (Q('.833'), Q('.8393'), P0, S_HI)]:
        H = remote_radius(l, p)
        total = Q(3,2)*(Q('3.141592653589794')/4-l*l)/p**2+H/4
        k = p-P0+Q('.08')*d+Q('.23')-2*(total-U0)-2*(P0-p)
        require(EPS*p <= 1 and k > 0, 'signed cone coefficient')
        cone_margins.append(spare(l,h,p,cap)-EPS*p*err**2*H/k)
    require(min(cone_margins) > Q(61667899,10**12), 'signed cone reserve')
    print('Mixed trial: clearances in trillionths',[x*10**12//1 for x in small_margins])
    print('Unrestricted odd mixed trial and signed cone: clearances in trillionths',
          [min(uncapped)*10**12//1, min(cone_margins)*10**12//1])


def obstruction(poly):
    e, t, m = Q('.0481605'), Q('.8368'), Q('1.01989')
    require(Q('3.141592653589793')/4-t*t-e/EPS**2 > Q(69560,10**12)
            and e-m*m*U0 > Q(369159,10**12), 'obstruction radius')
    lower = constant(t, m)+m*sum(c*(e/m**2)**i for i,c in enumerate(poly))-e/EPS
    upper1 = constant(t, 1)+S_HI+P0*e-e/EPS
    require(m*ELL > t and lower-TARGET > Q(587835,10**12)
            and lower-upper1 > Q(88651027,10**12), 'obstruction secant')


def reject(fun, message):
    try:
        fun()
    except ValueError as error:
        require(message == str(error), f'unexpected control failure {error}')
    else:
        raise ValueError('accepted a corrupted certificate')


def verify(repo, radial):
    require(__debug__, 'the archived verifiers need assertions; omit -O')
    code = repo/'research/conjecture-K/code'
    for name, digest in DIGESTS.items():
        require(hashlib.sha256((code/name).read_bytes()).hexdigest() == digest, f'source digest: {name}')
    pk = load(code/PEAK, 'repriced_peak')
    caps, tail, rice_lower = pk.read_inputs(repo)
    rows = json.loads((code/SRC/'moment-boxes.json').read_bytes())
    polys = [tuple(map(Q, row['coefficients'])) for row in rows]
    data = json.loads((HERE/'cover.json').read_bytes())
    require(data.keys() == PRICES.keys(), 'price list')
    published = {'1.196': 11258233, '1.228': 10261129, '1.28': 474764}
    for name,(end, cap) in PRICES.items():
        up = cover_price(data[name], Q(name), end, cap, polys, pk.bernstein)
        require(cap-up > Q(published[name],10**12), 'published cap clearance')
        print(f'p={name}: {len(data[name])} rectangles, cap clearance > {(cap-up)*10**12//1}/10^12')
    large_energy(ODD, PRICES['1.28'][0], PRICES['1.28'][1], caps, tail, pk.bernstein)
    margins, partial = row_checks()
    print('Four response slabs: clearance in trillionths', [x*10**12//1 for x in margins])
    print('Unrestricted odd sectors from .7923: clearance in trillionths', partial*10**12//1)
    obstruction(rice_lower)
    shells()
    first = '1.196'
    end, cap = PRICES[first]
    def replay(rr, goal=cap):
        return cover_price(rr, Q(first), end, goal, polys, pk.bernstein)
    corrupt = copy.deepcopy(data[first]); corrupt[0][-1] = -1
    reject(lambda: replay(corrupt), 'bad majorant index')
    reject(lambda: replay(data[first][1:]), 'shape cover gap')
    reject(lambda: replay(data[first], Q('1.38570')), 'remote price cap too small')
    reject(lambda: row_checks(Q('.011')), 'odd-sector row clearance')
    reject(lambda: large_energy(tail[1], Q('.2'), Q(2), caps, tail, pk.bernstein), 'terminal price')
    print('Six negative controls and both forced-cap obstruction inequalities passed.')
    ids = sorted({r[-1] for group in data.values() for r in group})
    if radial:
        sys.path.insert(0, str(code/SRC))
        arb = load(code/SRC/'verify.py', 'repriced_radial')
        for i in ids:
            arb.check_hermite(rows[i]['nodes'], rows[i]['coefficients'])
        arb.profile_caps()
        print(f'Arb recomputed all {len(ids)} selected whole-ray majorants.')


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--repo', type=Path, default=next((p for p in HERE.parents if (p/'research/conjecture-K').is_dir()), Path.cwd()))
    parser.add_argument('--radial', action='store_true', help='also regenerate the inherited envelopes with python-flint')
    opts = parser.parse_args()
    verify(opts.repo, opts.radial)
