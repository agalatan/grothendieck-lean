#!/usr/bin/env python3
"""codex-6e2b: Arb certificate |m_{3/5}'''| < 13 on the real line.

Requires python-flint. No files are written. This is a fresh one-dimensional
quadrature certificate, independent of the earlier Hessian/range certificates.
Only inverse-root and interval helper routines are imported from content_profile.
"""
import heapq
import itertools
import json
from pathlib import Path
import sys
import time
from fractions import Fraction as Q

sys.path.insert(0, str(Path(__file__).resolve().parent))
from content_profile import (arb, arb_series, a, b, d, pi, root_ball,
                             root_series, exact_interval, radius_from_t)


def rational(q):
    q = Q(q)
    return arb(q.numerator)/q.denominator


def integrand(x, y, derivative=False):
    if derivative:
        y = arb_series([y, 1])
    v = x*x+y*y
    t = root_series(v) if derivative else root_ball(v)
    p, q = a+b*t, a+3*b*t
    R = b/p+3*b/q
    S = b*b/p/p+9*b*b/q/q
    J = 1-(t-d)*(1+R)
    K = (t-d)*(1+3*R+2*R*R+S)-2-3*R
    value = 8*(-t).exp()/pi/p/p/q/q*(J+2*x*x/p/q*K)
    return abs(value[4]) if derivative else value


def envelope(T):
    """For t>=T, |integrand| <= 8 e^-t P(t)/(pi D(T)^2)."""
    p, q = a+b*T, a+3*b*T
    D = p*q
    R, S = b/p+3*b/q, b*b/(p*p)+9*b*b/(q*q)
    K1 = 1+3*R+2*R*R+S
    K0 = d*K1+2+3*R
    coefficients = [1+d*(1+R), 1+R+2*K0, 2*K1]
    return 8/(pi*D*D), coefficients


def exp_moment(T, n):
    # Integral_T^infinity t^n e^-t dt by the exact recurrence.
    value = arb(1)
    for k in range(1, n+1):
        value = T**k+k*value
    return (-T).exp()*value


def integral_envelope(T):
    factor, coefficients = envelope(T)
    c0, c1, c2 = coefficients
    # This monotonicity is also required when replacing t(x²+y²) by
    # t(y²) in the omitted integration ray.
    assert c2 > 0
    assert c1-c0+(2*c2-c1)*T-c2*T*T < 0
    assert 2*c2-c1-2*c2*T < 0
    # ell'(t)=(a+3bt)/(2 sqrt(t)) <= (a+3bt)/(2 sqrt(T)).
    integral = sum(c*(a*exp_moment(T,i)+3*b*exp_moment(T,i+1))
                   for i,c in enumerate(coefficients))/(2*T.sqrt())
    return factor*integral


def analytic_tail():
    T = arb(4)
    factor, coefficients = envelope(T)
    c0, c1, c2 = coefficients
    # The derivative of e^-t P(t) is e^-t (P'-P). Its value
    # and derivative are negative at4, and its second derivative is -2c2<0.
    derivative_at_T = c1-c0+(2*c2-c1)*T-c2*T*T
    second_at_T = 2*c2-c1-2*c2*T
    assert c2 > 0 and derivative_at_T < 0 and second_at_T < 0
    ell = radius_from_t(T)
    assert ell < 3
    point = factor*(-T).exp()*sum(c*T**i for i,c in enumerate(coefficients))
    # x>=ell(4): t(x²+y²)>=max(4,t(y²)); use monotonicity
    # on [0,ell(4)] and then integrate the radial envelope.
    bound = ell*point+integral_envelope(T)
    assert bound < 13
    return {"domain":"[ell(4),infinity)","ell4":str(ell),
            "bound":str(bound),"passed":True}


def cell(x, lo, hi):
    length = hi-lo
    center = (hi+lo)/2
    off = length/(2*arb(3).sqrt())
    value = length/2*(integrand(x,center-off)+integrand(x,center+off))
    # Fourth Taylor coefficient = f''''/24; Gauss2 error is
    # length^5 sup|f''''|/4320 = length^5 sup|coefficient4|/180.
    error = (length**5*integrand(x,exact_interval(lo,hi),True)/180).upper()
    return value, error


def integrate_box(lo, hi, max_cells=10000):
    x = exact_interval(rational(lo),rational(hi))
    stop = radius_from_t(arb(20))
    omitted = integral_envelope(arb(20))
    edges = list(map(arb, ['0','.125','.25','.5','1','2','4','8']))+[stop]
    assert all(l<h for l,h in zip(edges[:-1],edges[1:]))
    heap, counter = [], itertools.count()
    midpoint, radii, errors = arb(0),arb(0),arb(0)
    def add(l,h):
        nonlocal midpoint,radii,errors
        value,error = cell(x,l,h)
        midpoint += value.mid(); radii += value.rad(); errors += error
        heapq.heappush(heap,(-float(error),next(counter),l,h,value,error))
    for l,h in zip(edges[:-1],edges[1:]): add(l,h)
    while True:
        result = midpoint+arb(0,radii.upper()+errors.upper()+omitted.upper())
        passed = bool(abs(result)<13)
        if passed or bool(errors<arb('0.005')) or len(heap)>=max_cells:
            return {"x":[str(lo),str(hi)],"enclosure":str(result),
                    "absolute_upper":str(abs(result).upper()),"passed":passed,
                    "cells":len(heap),"quadrature_error":str(errors),
                    "tail":str(omitted)}
        _,_,l,h,value,error = heapq.heappop(heap)
        midpoint -= value.mid(); radii -= value.rad(); errors -= error
        mid=(l+h)/2
        add(l,mid);add(mid,h)


def certify():
    start=time.time()
    far=analytic_tail()
    print(json.dumps({"analytic_tail":far}),flush=True)
    pending=[(Q(j,40),Q(j+1,40)) for j in range(120)]
    accepted=[]
    while pending:
        lo,hi=pending.pop(0)
        row=integrate_box(lo,hi)
        if row['passed']:
            accepted.append(row)
        else:
            assert hi-lo>Q(1,100000),row
            mid=(lo+hi)/2
            pending[:0]=[(lo,mid),(mid,hi)]
    accepted.sort(key=lambda row:Q(row['x'][0]))
    assert accepted and Q(accepted[0]['x'][0])==0
    assert Q(accepted[-1]['x'][1])==3
    assert all(Q(l['x'][1])==Q(r['x'][0]) for l,r in zip(accepted[:-1],accepted[1:]))
    assert all(row['passed'] and Q(row['x'][0])<Q(row['x'][1]) for row in accepted)
    coefficient=pi*pi/128*(arb(3)/8)**arb('1.5')*169
    assert coefficient<3
    for row in accepted: print(json.dumps(row),flush=True)
    print(json.dumps({"claim":"global |m_s'''| < 13",
        "compact_coverage":"[0,3]","evenness":True,"boxes":len(accepted),
        "compact_max":str(max(arb(row['absolute_upper']).upper() for row in accepted)),
        "content_coefficient_upper":str(coefficient),
        "conclusion":"C(q)^2 <= 3 delta^(3/2)",
        "passed":True,"seconds":time.time()-start}),flush=True)


if __name__=='__main__':
    certify()
