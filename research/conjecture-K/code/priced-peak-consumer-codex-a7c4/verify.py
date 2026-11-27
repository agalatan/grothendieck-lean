"""Replay the three free-homothety consumer slabs with exact public inputs.

Agent-ID: codex-a7c4. Usage: python3 -IB verify.py [--central-only]
"""
import hashlib
import importlib.util
import json
import sys
from fractions import Fraction as Q
from pathlib import Path


def check(ok, reason):
    if not ok:
        raise ValueError(reason)


central_only = sys.argv[1:] == ['--central-only']
check(central_only or not sys.argv[1:], 'expected no arguments or --central-only')
check(central_only or __debug__, 'full exterior replay requires assertions: run without -O')

here = Path(__file__).resolve().parent
root = here.parents[3]
code = here.parent
for line in (here / 'public.sha256').read_text().splitlines():
    digest, relpath = line.split(maxsplit=1)
    check(hashlib.sha256((root / relpath).read_bytes()).hexdigest() == digest, relpath)


def load_module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


source = code / 'all-sector-transfer-gemini-c1de'
kast = load_module('kast', source / 'verify.py')
cover = json.loads((source / 'all_sector_transfer_cert.json').read_bytes())['covers']['peak_signed']
u_edges = list(map(Q, cover['u_edges']))
v_edges = list(map(Q, cover['v_edges']))
check(u_edges[0] == v_edges[0] == 0, 'origin')
check(u_edges[-1] == kast.E0 and v_edges[-1] == kast.U_TOT0, 'outer caps')
for edges in (u_edges, v_edges):
    check(all(a < b for a, b in zip(edges, edges[1:])), 'grid ordering')
check(len(cover['strips']) + 1 == len(u_edges), 'strip count')

D = kast.D_RHO
ETA, GAMMA = Q(6, 10**6), Q(7, 25)
check(D == 1 + kast.RHO0**2 and Q(9,25)*D < Q('.452'), 'trial price')
cells = []
for ul, uh, strip in zip(u_edges, u_edges[1:], cover['strips']):
    sig = kast.sigma_lo_iv(ul, uh)
    # Positive-root upper approximations for C and the signed-score error.
    content = min(Q(1,50), kast.rat_sqrt_hi(Q('.139')**2 * uh, 10**8),
                  kast.rat_sqrt_hi(42*Q(2,25)*uh**2, 10**8))
    error = kast.rat_sqrt_hi(Q('.0035')**2 * uh, 10**10)
    a, b = kast.RHO0 * error / D, error / D
    v_cells = [(vl, min(vh, kast.U_TOT0 - ul)) for vl, vh in zip(v_edges, v_edges[1:])
               if vl <= kast.U_TOT0 - ul]
    check(len(v_cells) == len(strip['cells']), 'row length')
    for (vl,vh), datum in zip(v_cells,strip['cells']):
        slope = 2*(min(uh+vh, kast.U_TOT0)-kast.E0)/D
        if datum[0] == 1:
            check(len(datum) == 3, 'signed witness')
            candidates = [(Q(datum[1],10), Q(datum[2],10**6))]
        else:
            check(datum[0] == 0 and len(datum) in (2,4), 'split witness')
            candidates = [(Q(0),Q(datum[1],10**6))]
            if len(datum) == 4:
                candidates.append((Q(datum[2],10), Q(datum[3],10**6)))
        bounds = []
        for k,z in candidates:
            if ul < Q(1,200):
                k = Q(0)
            check(0 <= k <= 1, 'content mixing coefficient')
            A, B = Q('.31')-slope+z, Q('.08')-slope+z
            if min(A,B) <= 0:
                continue
            v_extreme = vh if z >= 0 else vl
            # Lambda(q)-S = -sigma(u)-D(q), D(q)>=0. Price kD by content.
            correction = kast.max_quad_on_iv(
                1/A-k/GAMMA, 2*a/A,
                a*a/A + b*b/B + z*D*v_extreme, Q(0), content)
            bounds.append(-sig + k*ETA/GAMMA + correction)
        check(bounds,'no positive completion')
        cells.append((ul,vl,min(bounds)))

eps = Q(94,125)
target = Q(713245,10**6)
slabs = [
    (Q('.8393'),Q('.8529'),Q('1.0006'),Q('2.64665396')/10**6),
    (Q('.8529'),Q('.8592'),Q('1.0106'),Q('2.36063394')/10**6),
    (Q('.8592'),Q('.8635'),Q('1.0158'),Q('10.28036737')/10**6),
]


def certify(items):
    check(items[0][0] == Q('.8393') and items[-1][1] == Q('.8635'), 'endpoint')
    previous = items[0][0]
    results = []
    for lo,hi,mu,floor in items:
        check(previous == lo < hi and mu > 0, 'handoff or scale')
        previous = hi
        check(lo**2 >= 3*kast.PI_HI/14 and hi**2 < Q('3.14')/4, '3.5a range')
        H = (eps/mu)**2 * (kast.PI_HI/4-lo**2)
        check(0 < H <= kast.E0 and 7*H/4 <= kast.U_TOT0, 'KAST hypotheses')
        dp = mu/eps - kast.P0
        dv = dp - max(0,mu-1)*Q('.452')
        check(min(dp,dv) >= 0, 'shell-price signs')
        feasible = [bound-dp*ul-dv*vl for ul,vl,bound in cells
                    if ul <= H and ul+vl <= 7*H/4 and vl+3*ul/4 <= 3*H/2]
        check(feasible, 'no feasible cell')
        row = (max(t*t-2*mu*kast.ELL0*t for t in (lo,hi)) + 2*(mu*kast.BETA0)**2/eps
               + mu*(kast.S0_HI+max(feasible)))
        check(target-row > floor, 'inadequate clearance')
        results.append((lo,hi,mu,10**6*(target-row)))
    return results


for lo,hi,mu,margin in certify(slabs):
    print(f'[{lo},{hi}]  mu={mu}  clearance in millionths > {margin.numerator * 10**8 // margin.denominator}/10^8')
for i, replacement in ((0,(Q('.8393'), Q('.8529'), Q('.99'), Q(0))),
                       (1,(Q('.8530'), Q('.8592'), Q('1.0106'), Q(0))),
                       (1,(Q('.8529'), Q('.8592'), Q('1.0106'), Q('2.36063395')/10**6))):
    bad = list(slabs)
    bad[i] = replacement
    try:
        certify(bad)
    except ValueError:
        continue
    raise ValueError('accepted corrupted witness')
print('PASS: full interval; three negative controls')

if central_only:
    sys.exit(0)

# The historical row manifest and the 8.12 verifier retain their existing checks.
exterior_source = code / 'exterior-94-125-gemini-9a4e'
exterior = load_module('exterior', exterior_source / 'verify_exterior.py')
pi_lo, pi_hi = exterior.machin_pi_bounds()
check(Q('3.14') < pi_lo < pi_hi < kast.PI_HI, 'outward pi constants')
inherited = exterior.load_lean_rows(root)
exterior.verify_mix_identity(inherited)
gap = (Q('.751'), slabs[-1][1])
uncovered, cap, counts = exterior.certify_exterior(inherited, eps, exterior.RHO_37, target, gap)
accepted = sum(counts[key] for key in ('mass', 'crude', 'single', 'mixed'))
check(uncovered == 225 and accepted == 1548 and accepted + uncovered == 1773,
      'exterior coverage')
check(cap < Q('.713244320') < target, 'exterior cap')
print('8.12 exterior: 1548/1773 cells, cap < .713244320; gap [.751,.8635]')
print('After the three slabs: residual [.751,.8393]')

bank = json.loads((exterior_source / 'central_94_125_certificate.json').read_bytes())
rows = bank['eps_94_125']['rows']
remaining = [(3, gap[0], Q('.8205'), Q('144.035')/10**6),
             (7, Q('.8205'), slabs[0][0], Q('156.451')/10**6)]
for idx, lo, hi, floor in remaining:
    row = rows[idx-1]
    ell, beta, benchmark = map(Q, [row['ell'], row['beta'], row['S_upper_accepted']])
    slack = target - max(t*t - 2*ell*t + 2*beta*beta/eps + benchmark for t in [lo, hi])
    check(slack > floor, 'remaining off-peak allowance')
    print(f'Profile {idx}: [{lo},{hi}] admissible additive error {floor}')
print(f'Conditional reciprocal: {1/target}')
