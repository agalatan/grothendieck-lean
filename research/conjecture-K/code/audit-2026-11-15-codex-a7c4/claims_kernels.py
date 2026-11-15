"""Finite Arb kernel checks; NOT a certificate on all v>=0.

Agent-ID: codex-a7c4; Refs #395. Angular identities were re-derived from the
binomial series and compared with the historical J3 report. The implementation
is standalone and reads no stored numerical input. Run python3 -I this_file.py.
If flint is not installed in isolated Python's path, pass --dependency-dir DIR.
"""
import argparse
from fractions import Fraction as Q
import json
import sys

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--dependency-dir')
args = parser.parse_args()
if args.dependency_dir:
    sys.path.insert(0, args.dependency_dir)
import flint
from flint import arb, acb, ctx
ctx.prec = 120


def ball(q):
    q = Q(q)
    return arb(q.numerator)/q.denominator


def integral(f, lower, upper):
    z = acb.integral(f, lower, upper, abs_tol=arb('1e-14'),
                     rel_tol=arb('1e-14'), eval_limit=100000, depth_limit=45)
    assert z.is_finite() and z.imag.contains(0), z
    return z.real


def zero(a, b):
    # J0=int exp(-r^2)/(a+br^2)dr; exact erfc closed form.
    j0 = arb.pi()*(a/b).exp()*(a/b).sqrt().erfc()/(2*(a*b).sqrt())
    j2 = (arb.pi().sqrt()/2-a*j0)/b
    return j2-j0, -j2/arb(2).sqrt()


def kernels(vq, aq, bq):
    v, a, b = map(ball, (vq, aq, bq))
    x = v.sqrt()
    # Bracket the angular branch point with exact rational arithmetic.
    lo, hi = Q(0), Q(10)
    for _ in range(48):
        mid = (lo+hi)/2
        if mid*mid*(aq+bq*mid*mid)**2 > vq:
            hi = mid
        else:
            lo = mid
    out = []
    for sector in ('A', 'B'):
        def f(r, analytic, outer=False):
            radius = r*(a+b*r*r)
            ratio = (x/radius)**2 if outer else (radius/x)**2
            if analytic and not ratio.real < 1:
                return acb('nan')
            if sector == 'A':
                angular = (x/(2*radius)*ratio.hypgeom_2f1(ball('1/2'),ball('1/2'),2)
                           if outer else ratio.hypgeom_2f1(ball('-1/2'),ball('1/2'),1))
                weight = r*r-1
            else:
                angular = (-x/(2*radius)*ratio.hypgeom_2f1(ball('-1/2'),ball('3/2'),2)
                           if outer else -ratio/8*ratio.hypgeom_2f1(ball('1/2'),ball('3/2'),3))
                weight = r*r/arb(2).sqrt()
            return 2*r*(-r*r).exp()*weight*angular/x
        value = integral(f, 0, ball(lo)) + integral(
            lambda r, analytic: f(r, analytic, True), ball(hi), 10)
        # Angular Fourier coefficients have modulus <=1. For the missing
        # interval bound exp(-r^2)<=1 and |r^2-1|<=r^2+1.
        rmax = ball(hi)
        weight = rmax*rmax+1 if sector == 'A' else rmax*rmax/arb(2).sqrt()
        gap = ball(hi-lo)*2*rmax*weight/x
        # t>=100: integrate exp(-t)(t+1) or exp(-t)t/sqrt(2).
        tail = (arb(102) if sector == 'A' else arb(101)/arb(2).sqrt())*arb(-100).exp()/x
        value += arb(0, (gap+tail).abs_upper())
        assert value.is_finite() and value < 0
        out.append(value)
    return out


rows = {'peak': (Q(699,1250), Q(179,1250)),
        'flank': (Q(14,25), Q(1467,10000)),
        'upper': (Q(573,1000), Q(19,125))}
report = {'agent_id':'codex-a7c4', 'status':'PASS', 'flint_version':flint.__version__,
          'precision_bits':ctx.prec, 'scope':'finite scalar values only; no global .007 certificate',
          'rows':{}}
for name, (aq,bq) in rows.items():
    g0, gb0 = zero(ball(aq),ball(bq))
    rho0 = gb0/g0
    values = {}
    for vq in ([Q(49,100),Q(1,2),Q(51,100)] if name=='peak' else [Q(1,2)]):
        ga, gb = kernels(vq,aq,bq)
        common = ball('0.5053')*ga-gb
        endpoint = rho0*ga-gb
        if name!='peak':
            assert rho0 < ball('0.505') and endpoint > ball('0.007')
        assert 0 < common < ball('0.007')
        values[str(vq)]={'g':str(ga), 'g_B':str(gb),
                         'endpoint_residual':str(endpoint), 'common_residual':str(common)}
    report['rows'][name]={'g0':str(g0), 'g_B0':str(gb0), 'rho0':str(rho0), 'values':values}
print(json.dumps(report, indent=2, sort_keys=True))
