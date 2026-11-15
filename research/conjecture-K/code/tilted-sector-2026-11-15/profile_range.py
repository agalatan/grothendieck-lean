#!/usr/bin/env python3
"""codex-6e2b: certify -.025 <= h_(3/5)(v) <= .253 for every v>=0.

The default full certificate first replays the Hessian-profile certificate,
which supplies the radius Lipschitz bound |d h(R²)/dR| <= 1/sqrt(3).
No floating-point quadrature or cached interval result is trusted.
"""
import argparse
from fractions import Fraction
import heapq
import importlib.util
import itertools
import json
from pathlib import Path
import time

spec = importlib.util.spec_from_file_location('content_profile', Path(__file__).with_name('content_profile.py'))
base = importlib.util.module_from_spec(spec)
spec.loader.exec_module(base)
arb, arb_series = base.arb, base.arb_series
a, b, d, pi = base.a, base.b, base.d, base.pi
lower_target, upper_target = -arb(1)/40, arb(253)/1000
I0 = pi/(a*b).sqrt()*(a/b).exp()*(a/b).sqrt().erfc()
c0 = (pi.sqrt()/b-(a/b+d)*I0)/2


def field_integrands(R, s, theta, derivative=None):
    if derivative == 's':
        s = arb_series([s, 1])
    elif derivative == 'theta':
        theta = arb_series([theta, 1])
    co, si = theta.cos(), theta.sin()
    xx, yy = R-s*co, s*si
    v = xx*xx+yy*yy
    t = base.root_series(v) if derivative else base.root_ball(v)
    f = (t-d)*(-t).exp()/(a+b*t)/(a+3*b*t)/pi
    value = s*co*f
    if derivative:
        value = abs(value[4])
    return value, value


def check_end_ranges():
    mass_abs = 1-d+2*(d-1+(-d).exp())
    moment = a*a*(2+d)+2*a*b*(6+2*d)+b*b*(24+6*d)
    assert arb(3)/5-2*moment/9 > 0
    assert -c0 > lower_target
    assert mass_abs/3-c0 < upper_target
    # The small-radius assertion is conditional on the replayed global
    # Hessian certificate; the full wrapper always replays it first.
    small = 1/(25*arb(3).sqrt())
    assert -small > lower_target and small < upper_target
    return {'c0': str(c0), 'moment_upper': str(moment),
            'Fraw_lower_R>=3': str(arb(3)/5-2*moment/9),
            'h_upper_R>=3': str(mass_abs/3-c0),
            'small_radius_abs_bound': str(small)}


def integrate_range_box(lo, hi, max_cells=25000):
    midpoint = (lo+hi)/2
    R = arb(str(midpoint))
    variation = arb(str((hi-lo)/2))/arb(3).sqrt()
    r0 = base.radius_from_t(arb(20))
    stop = R+r0
    tail = (1+R/r0)*arb(-20).exp()*(21+d)
    sedges = [arb(x) for x in ('0', '.25', '.5', '1', '2', '4', '8')]+[stop]
    tedges = [pi*k/4 for k in range(5)]
    heap, counter = [], itertools.count()
    total, radius, error = arb(0), arb(0), arb(0)

    def add(sl, sh, tl, th):
        nonlocal total, radius, error
        vals, errs, split_s = base.cell(R, sl, sh, tl, th, evaluator=field_integrands)
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
        field = 2*total+arb(0, 2*radius.upper()+2*error.upper()+tail.upper())
        hpoint = field/R-c0
        hrange = hpoint+arb(0, variation.upper())
        passed = bool(hrange > lower_target and hrange < upper_target)
        accurate = bool((2*error.upper()+tail.upper())/R < arb(1)/20000)
        if passed or accurate or len(heap) >= max_cells:
            return {'R': [str(lo), str(hi)], 'h_midpoint': str(hpoint),
                    'h_whole_box': str(hrange), 'passed': passed,
                    'accurate': accurate, 'cells': len(heap),
                    'quadrature_error_field': str(2*error), 'tail_field': str(tail)}
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


def certify_range(replay_content=True, emit=True):
    started = time.time()
    if replay_content:
        result = base.certify_global(emit=False)
        if emit:
            print(json.dumps({'dependency': result}), flush=True)
    else:
        # A caller choosing this path must itself have replayed the content
        # certificate in this verification chain.  The CLI never skips it.
        pass
    ends = check_end_ranges()
    if emit:
        print(json.dumps({'claim': 'C endpoint ranges', 'result': ends}), flush=True)
    pending = [(Fraction(k, 25), Fraction(k+1, 25)) for k in range(1, 75)]
    accepted = []
    while pending:
        lo, hi = pending.pop(0)
        result = integrate_range_box(lo, hi)
        if result['passed']:
            accepted.append((lo, hi))
            if emit:
                print(json.dumps({'claim': 'C range box', 'result': result}), flush=True)
        else:
            if hi-lo < Fraction(1, 1000000):
                raise AssertionError(('failed range box', result))
            mid = (lo+hi)/2
            pending[0:0] = [(lo, mid), (mid, hi)]
    assert accepted[0][0] == Fraction(1, 25) and accepted[-1][1] == 3
    assert all(x[1] == y[0] for x, y in zip(accepted[:-1], accepted[1:]))
    # Centering h at (.253-.025)/2=.114 leaves absolute deviation<=.139.
    content_squared = (arb(139)/1000)**2*(arb(463)/10000)
    assert content_squared < (arb(3)/100)**2
    result = {'claim': 'C GLOBAL PROFILE RANGE',
              'statement': '-1/40 < h_(3/5)(v) < 253/1000 for all v>=0',
              'compact_boxes': len(accepted),
              'content_squared_u<=.0463': str(content_squared),
              'content_norm_bound': '3/100', 'seconds': time.time()-started}
    if emit:
        print(json.dumps(result), flush=True)
    return result


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--box', nargs=2)
    parser.add_argument('--certify', action='store_true',
                        help='replay both full certificates (also the default)')
    args = parser.parse_args()
    if args.certify and args.box:
        parser.error('--certify and --box are mutually exclusive')
    if args.box:
        result = integrate_range_box(*map(Fraction, args.box))
        print(json.dumps({'claim': 'conditional diagnostic; requires content certificate',
                          'result': result}), flush=True)
    else:
        certify_range()


if __name__ == '__main__':
    main()
