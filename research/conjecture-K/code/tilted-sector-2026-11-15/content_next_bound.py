#!/usr/bin/env python3
"""codex-6e2b: certify a Gaussian-probe dual bound for tilted content.

Default: replay the scalar profile certificates, build a certified profile
table, then verify the dual envelope.  --skip-dependency-replay is only for
development or a caller that already replayed that dependency in this chain.
The table is regenerated; saved floating-point data are never trusted.
"""
import argparse
from fractions import Fraction
import heapq
import importlib.util
import itertools
import json
from pathlib import Path
import time

ROOT = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('profile_range', ROOT/'profile_range.py')
pr = importlib.util.module_from_spec(spec)
spec.loader.exec_module(pr)
base = pr.base
arb, pi = base.arb, base.pi
kappa = arb(49)/500
lam = arb(13)/50
umax = arb(463)/10000
Hglobal = arb(31)/200


def field_point(R, tolerance=arb(1)/10000, max_cells=50000):
    """Return an outward ball for h(R²), R a positive exact rational."""
    R = arb(str(R))
    r0 = base.radius_from_t(arb(20))
    stop = R+r0
    tail = (1+R/r0)*arb(-20).exp()*(21+base.d)
    sedges = [arb(x) for x in ('0', '.25', '.5', '1', '2', '4', '8')]+[stop]
    tedges = [pi*j/4 for j in range(5)]
    heap, counter = [], itertools.count()
    total, radius, error = arb(0), arb(0), arb(0)

    def add(sl, sh, tl, th):
        nonlocal total, radius, error
        vals, errs, split_s = base.cell(R, sl, sh, tl, th, evaluator=pr.field_integrands)
        val, err = vals[0], errs[0]
        total += val.mid()
        radius += val.rad()
        error += err
        heapq.heappush(heap, (-float(err.upper()), next(counter), sl, sh, tl, th,
                              val, err, split_s))

    for sl, sh in zip(sedges[:-1], sedges[1:]):
        for tl, th in zip(tedges[:-1], tedges[1:]):
            add(sl, sh, tl, th)
    while True:
        result = (2*total+arb(0, 2*radius.upper()+2*error.upper()+tail.upper()))/R-pr.c0
        if result.rad() < tolerance:
            return result, len(heap)
        if len(heap) >= max_cells:
            raise AssertionError(('point quadrature did not converge', str(R), str(result)))
        _, _, sl, sh, tl, th, val, err, split_s = heapq.heappop(heap)
        total -= val.mid()
        radius -= val.rad()
        error -= err
        if split_s:
            mid = (sl+sh)/2
            add(sl, mid, tl, th)
            add(mid, sh, tl, th)
        else:
            mid = (tl+th)/2
            add(sl, sh, tl, mid)
            add(sl, sh, mid, th)


def build_table(step=Fraction(1, 100)):
    count = int(Fraction(3)/step)
    assert count*step == 3
    table = []
    start = time.time()
    for j in range(count):
        lo, hi = j*step, (j+1)*step
        mid = (lo+hi)/2
        point, cells = field_point(mid)
        variation = arb(str(step))/2/arb(3).sqrt()
        enclosure = point+arb(0, variation.upper())
        H = abs(enclosure-kappa).upper()
        # Also intersect the certified global profile range before using it.
        H = min(H, Hglobal)
        table.append({'lo': str(lo), 'hi': str(hi), 'h_midpoint': str(point),
                      'h_interval': str(enclosure), 'H_upper': str(H), 'cells': cells})
        if (j+1) % 25 == 0 or j+1 == count:
            print(json.dumps({'progress': j+1, 'total': count,
                              'seconds': time.time()-start}), flush=True)
    assert Fraction(table[0]['lo']) == 0 and Fraction(table[-1]['hi']) == 3
    assert all(Fraction(x['hi']) == Fraction(y['lo']) for x, y in zip(table[:-1], table[1:]))
    return table


def cell_max(t, lo, hi, H):
    """Upper bound max_{rho in [lo,hi]} t H rho-lambda rho²."""
    # Derivative signs select endpoint maximizers.  If a sign cannot be
    # certified, the unrestricted maximum is a valid fallback.
    if t*H < 2*lam*lo:
        return (t*H*lo-lam*lo*lo).upper()
    if t*H > 2*lam*hi:
        return (t*H*hi-lam*hi*hi).upper()
    return (t*t*H*H/(4*lam)).upper()


def verify_envelope(table, t_step=Fraction(1, 200)):
    count = int(Fraction(16)/t_step)
    assert count*t_step == 16
    data = [(arb(x['lo']), arb(x['hi']), arb(x['H_upper'])) for x in table]
    expectation = arb(0)
    for j in range(count):
        lo, hi = arb(str(j*t_step)), arb(str((j+1)*t_step))
        t = hi.sqrt()
        envelope = arb(0)
        for rlo, rhi, H in data:
            envelope = max(envelope, cell_max(t, rlo, rhi, H))
        # The envelope is nondecreasing in T; each term has nonnegative
        # sqrt(T) coefficient.  Thus the right endpoint is an upper bound.
        expectation += envelope*((-lo).exp()-(-hi).exp())
    assert 4*Hglobal < 3*lam  # rho>=3 contributes <=0 when T<=16
    tail = Hglobal**2/(4*lam)*17*arb(-16).exp()
    bound = lam*umax+expectation+tail
    return {'lambda': str(lam), 'k': str(kappa), 'u_max': str(umax),
            'compact_expectation': str(expectation), 'tail': str(tail),
            'content_norm_upper': str(bound), 'passes_1_over_50': bool(bound < arb(1)/50)}


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--skip-dependency-replay', action='store_true')
    parser.add_argument('--step', default='1/100')
    args = parser.parse_args()
    start = time.time()
    if not args.skip_dependency_replay:
        print(json.dumps({'dependency': pr.certify_range(emit=False)}), flush=True)
    else:
        print('CONDITIONAL RUN: scalar profile dependencies were not replayed in this process.', flush=True)
    table = build_table(Fraction(args.step))
    (ROOT/'content_next_profile_table.json').write_text(json.dumps(table, indent=2)+'\n')
    result = verify_envelope(table)
    result['seconds'] = time.time()-start
    result['dependency_replayed_here'] = not args.skip_dependency_replay
    print(json.dumps({'claim': 'Gaussian-probe dual certificate', 'result': result}), flush=True)
    assert result['passes_1_over_50'], result


if __name__ == '__main__':
    main()
