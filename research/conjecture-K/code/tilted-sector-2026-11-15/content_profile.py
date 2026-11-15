#!/usr/bin/env python3
"""codex-6e2b: certified tilted-content Hessian bound.

Requires python-flint.  No file is written by this program.  In contrast to
floating-point quadrature, every printed C enclosure includes quadrature and
infinite-tail error.  A compact-range run is only a certificate if all boxes
pass; individual point enclosures do not certify the supremum.  The completed
--certify run proves the global metric bound N_Phi < 1/3.
"""
import argparse
import heapq
import itertools
import json
import math
import time
from fractions import Fraction

from flint import arb, arb_series, ctx

ctx.prec = 160
ctx.cap = 5
a = arb(699) / 1250
b = arb(179) / 1250
d = arb(2) / 5
pi = arb.pi()
C0 = arb(1265) / 699
C1 = arb(1415) / 699
nan = arb('nan')


def interval(lo, hi):
    return arb((lo + hi) / 2, (hi - lo) / 2)


def exact_interval(lo, hi):
    lo, hi = arb(lo), arb(hi)
    return (lo + hi) / 2 + arb(0, (hi - lo) / 2)


def radius_from_t(t):
    return t.sqrt() * (a + b*t)


def root_point(v):
    # The unique nonnegative solution of t(a+bt)^2 = v.
    if v == 0:
        return arb(0)
    x = 2*(a/(3*b)).sqrt() * ((3*v.sqrt()/(2*a)*(3*b/a).sqrt()).asinh()/3).sinh()
    return x*x


def root_ball(v):
    # The expressions passed here are sums of two real squares.  Their true
    # values are nonnegative even if outward ball rounding crosses zero.
    lo = v.lower()
    if lo < 0:
        lo = arb(0)
    hi = v.upper()
    if hi < 0:
        raise ArithmeticError('negative square sum')
    tl = root_point(lo).lower()
    th = root_point(hi).upper()
    return (tl+th)/2 + arb(0, (th-tl)/2)


def root_series(v):
    t0 = root_ball(v[0])
    coeff = [t0]
    denom1, denom3 = a+b*t0, a+3*b*t0
    # Implicit differentiation by coefficient extraction.  At degree k the
    # unknown coefficient has exactly the multiplier denom; all other terms
    # use previously enclosed coefficients.  Constant residual is irrelevant.
    for k in range(1, 5):
        t = arb_series(coeff)
        val = t * (a+b*t)**2
        coeff.append((v[k]-val[k])/denom1/denom3)
    return arb_series(coeff)


def kernel(t):
    inv1, inv3 = 1/(a+b*t), 1/(a+3*b*t)
    ratio = b*inv1 + 3*b*inv3
    return 2*(-t).exp()*inv1**2*inv3**2 * (1-t+d-(t-d)*ratio) / pi


def integrands(R, s, theta, derivative=None):
    if derivative == 's':
        s = arb_series([s, 1])
    elif derivative == 'theta':
        theta = arb_series([theta, 1])
    co, si = theta.cos(), theta.sin()
    xx, yy = R-s*co, s*si
    v = xx*xx+yy*yy
    t = root_series(v) if derivative else root_ball(v)
    k = kernel(t)
    AA, BB = si*si*xx*k, si*si*s*co*k
    if derivative:
        return abs(AA[4]), abs(BB[4])
    return AA, BB


def cell(R, sl, sh, tl, th, evaluator=integrands):
    hs, ht = sh-sl, th-tl
    sb, tb = (sh+sl)/2, (th+tl)/2
    invsqrt3 = 1/arb(3).sqrt()
    vals = [arb(0), arb(0)]
    for es in (-1, 1):
        for et in (-1, 1):
            out = evaluator(R, sb+es*hs*invsqrt3/2,
                            tb+et*ht*invsqrt3/2)
            for j in range(2):
                vals[j] += out[j]*hs*ht/4
    sball, tball = exact_interval(sl, sh), exact_interval(tl, th)
    ds = evaluator(R, sball, tball, 's')
    dt = evaluator(R, sball, tball, 'theta')
    # Two-point Gauss-Legendre: |error| <= length^5 sup|f''''|/4320.
    # The series coefficient is f''''/24, hence denominator 180.
    err_s = [ht*hs**5*x/180 for x in ds]
    err_t = [hs*ht**5*x/180 for x in dt]
    err = [(err_s[j]+err_t[j]).upper() for j in range(2)]
    score_s = max(float(x.upper()) for x in err_s)
    score_t = max(float(x.upper()) for x in err_t)
    return vals, err, score_s >= score_t


def tail_compact(R_hi):
    # The s integration is truncated at R_hi + ell(20).  For s beyond it,
    # |x-sn| >= s-R_hi >= ell(20), and the displayed positive majorant of
    # |k| decreases.  Integrating r k(r) using t proves the following bound
    # for EACH of A and B, including the full angle 2pi.
    T = arb(20)
    r0 = radius_from_t(T)
    tail = 2/a**2*(1+2*R_hi/r0)*(-T).exp()*(C0+C1*(T+1))
    return R_hi+r0, tail


def metric_upper(A, B):
    first = (3*A*A-2*A*B+3*B*B)/8
    second = B*B
    return max(first.upper(), second.upper())


def integrate_box(R_lo, R_hi, tol='0.002', max_cells=25000):
    R = exact_interval(R_lo, R_hi)
    stop, tail = tail_compact(arb(R_hi))
    sedges = [arb(x) for x in ('0', '.25', '.5', '1', '2', '4', '8')]+[stop]
    tedges = [pi*k/4 for k in range(5)]
    heap, counter = [], itertools.count()
    total = [arb(0), arb(0)]
    radii = [arb(0), arb(0)]
    errors = [arb(0), arb(0)]

    def add(sl, sh, tl, th):
        val, err, split_s = cell(R, sl, sh, tl, th)
        for j in range(2):
            total[j] += val[j].mid()
            radii[j] += val[j].rad()
            errors[j] += err[j]
        priority = max(float(x.upper()) for x in err)
        heapq.heappush(heap, (-priority, next(counter), sl, sh, tl, th,
                              val, err, split_s))

    for sl, sh in zip(sedges[:-1], sedges[1:]):
        for tl, th in zip(tedges[:-1], tedges[1:]):
            add(sl, sh, tl, th)
    threshold = arb(tol)
    while True:
        enclosed = [2*total[j]+arb(0, 2*radii[j].upper()+2*errors[j].upper()+tail.upper()) for j in range(2)]
        metric = metric_upper(*enclosed)
        passed = bool(metric < arb(1)/3)
        accurate = all(bool(2*e.upper() < threshold) for e in errors)
        if passed or accurate or len(heap) >= max_cells:
            return dict(R=[str(R_lo), str(R_hi)], A=str(enclosed[0]), B=str(enclosed[1]),
                        N_upper=str(metric), passed=passed, accurate=accurate,
                        cells=len(heap), errors=[str(2*e) for e in errors],
                        tail=str(tail))
        _, _, sl, sh, tl, th, val, err, split_s = heapq.heappop(heap)
        for j in range(2):
            total[j] -= val[j].mid()
            radii[j] -= val[j].rad()
            errors[j] -= err[j]
        if split_s:
            mid = (sl+sh)/2
            add(sl, mid, tl, th)
            add(mid, sh, tl, th)
        else:
            mid = (tl+th)/2
            add(sl, sh, tl, mid)
            add(sl, sh, mid, th)


def check_far_tail():
    # For R >= 4 split the density at radius c=ell(4), integrate by parts
    # inside this disk, and use a Riesz-potential bound on the exterior.
    T = arb(4)
    c = radius_from_t(T)
    den1, den3 = a+b*T, a+3*b*T
    f_c = (T-d)*(-T).exp()/(pi*den1*den3)
    ratio = b/den1+3*b/den3
    E1, E0 = 1+ratio, 1+d*(1+ratio)
    # For t>=4 the density decreases; sqrt(t)(E1*t-E0)e^-t also
    # decreases. Denominators increase.  These assertions reduce to the
    # explicitly checked signs below.
    assert 1-T+d-(T-d)*ratio < 0
    assert E1*(arb('1.5')*T-T*T)+E0*(T-arb('.5')) < 0
    assert arb('1.5')*E1-2*E1*T+E0 < 0
    A_tail = 2*T.sqrt()*(-T).exp()*(E1*T-E0)/(pi*den1*den3**2)
    # sqrt(t)<=t/2 for t>=4; the integrals of t and t² over [4,infinity]
    # are 5 e^-4 and 26 e^-4.
    B_tail = (-T).exp()*(26*E1-5*E0)/den3
    # E|T-d|=1-d+2(d-1+exp(-d)) <3/4.
    mass_abs = 1-d+2*(d-1+(-d).exp())
    assert mass_abs < arb(3)/4
    H = arb(3).sqrt()*mass_abs/(4-c)**2 + 2*pi*c*f_c/(4-c) + 2*(pi*A_tail*B_tail).sqrt()
    # The metric operator norm is bounded by ((1+1/sqrt3)/4) times
    # the squared Frobenius norm of the radial Hessian tensor.
    N = (1+1/arb(3).sqrt())/4*H**2
    assert N < arb(1)/3
    return dict(R='[4,infinity)', H_bound=str(H), N_bound=str(N),
                A_tail=str(A_tail), B_tail=str(B_tail), passed=True)


def certify_global(tol='.002', max_cells=25000, emit=True):
    started = time.time()
    check_far_tail()
    pending = [(Fraction(k, 20), Fraction(k+1, 20)) for k in range(80)]
    accepted = []
    largest = arb(0)
    while pending:
        lo, hi = pending.pop(0)
        result = integrate_box(str(lo), str(hi), tol=tol, max_cells=max_cells)
        if result['passed']:
            accepted.append((lo, hi))
            largest = max(largest, arb(result['N_upper']).upper())
            if emit:
                print(json.dumps({'claim': 'C compact box', 'result': result}), flush=True)
        else:
            if hi-lo < Fraction(1, 1000000):
                raise AssertionError(('failed radius box', result))
            mid = (lo+hi)/2
            pending[0:0] = [(lo, mid), (mid, hi)]
    assert accepted[0][0] == 0 and accepted[-1][1] == 4
    assert all(x[1] == y[0] for x, y in zip(accepted[:-1], accepted[1:]))
    result = {'claim': 'C GLOBAL PROFILE CERTIFICATE',
              'statement': 'sup_R>=0 N_Phi(R) < 1/3',
              'compact_boxes': len(accepted),
              'largest_compact_upper': str(largest),
              'seconds': time.time()-started}
    if emit:
        print(json.dumps(result), flush=True)
    return result


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--box', nargs=2)
    parser.add_argument('--tol', default='.002')
    parser.add_argument('--max-cells', type=int, default=25000)
    parser.add_argument('--tail-only', action='store_true')
    parser.add_argument('--certify', action='store_true')
    args = parser.parse_args()
    started = time.time()
    print(json.dumps({'agent': 'codex-6e2b', 'claim': 'C far tail', 'result': check_far_tail()}), flush=True)
    if args.certify:
        certify_global(args.tol, args.max_cells)
    elif args.box:
        result = integrate_box(*args.box, tol=args.tol, max_cells=args.max_cells)
        print(json.dumps({'agent': 'codex-6e2b', 'claim': 'C single box', 'result': result,
                          'seconds': time.time()-started}), flush=True)
    elif not args.tail_only:
        parser.error('choose --box LO HI, --certify or --tail-only')


if __name__ == '__main__':
    main()
