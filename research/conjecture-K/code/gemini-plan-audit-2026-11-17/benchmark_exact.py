#!/usr/bin/env python3
"""Arb Gaussian benchmark and failed-cubic-budget certificate. Refs #509.

Agent-ID: codex-a7c4. Uses the direct Rice integration method of the earlier
reaudit's remote_benchmark_crosscheck.py; no saved values are accepted as input.
Run with python-flint installed: python3 -I benchmark_exact.py
"""
import importlib.util
import json
from fractions import Fraction as Q
from math import factorial
from pathlib import Path
import sys
sys.dont_write_bytecode=True
if not __debug__:
    raise SystemExit('Assertions must be enabled.')
from flint import arb, acb, ctx
ctx.prec=128
ROOT=Path(__file__).resolve().parent
spec=importlib.util.spec_from_file_location('constants',ROOT/'constants_exact.py')
c=importlib.util.module_from_spec(spec);spec.loader.exec_module(c)
def ball(q):
    q=Q(q);return arb(q.numerator)/q.denominator
def enclose(x):
    lo,hi=ball(x.lo),ball(x.hi)
    return (lo+hi)/2+arb(0,((hi-lo)/2).upper())
a,b,p=ball(c.a),ball(c.b),1/ball(c.eps)
T=64
def value(uq,derivative=0):
    u=ball(uq)
    def integrand(t,analytic):
        z=t*(a+b*t)**2/(2*u)
        i0=z.bessel_i(0,scaled=True)
        if derivative==1:
            y=i0
        elif derivative==2:
            y=(z-arb(1)/2)*i0-z*z.bessel_i(1,scaled=True)
        else:
            y=(1+2*z)*i0+2*z*z.bessel_i(1,scaled=True)
        return (-t).exp()*y
    s=acb(0)
    for j in range(256):
        s+=acb.integral(integrand,arb(j)/4,arb(j+1)/4,
                        rel_tol=arb('1e-21'),abs_tol=arb('1e-21'),eval_limit=100000)
    assert s.is_finite() and s.imag.contains(0)
    if derivative==1:
        factor=arb.pi().sqrt()/(2*u.sqrt())
        tail=factor*arb(-T).exp()
        return factor*s.real-p+arb(tail/2,tail/2)
    if derivative==2:
        factor=arb.pi().sqrt()/(2*u*u.sqrt())
        moments=[arb(-T).exp()*factorial(k)*sum((arb(T)**j/factorial(j) for j in range(k+1)),arb(0)) for k in range(4)]
        tail=factor*((a*a*moments[1]+2*a*b*moments[2]+b*b*moments[3])/u+moments[0]/2)
        return factor*s.real+arb(0,tail.upper())
    factor=(arb.pi()*u).sqrt()
    # 2 E|ell(t)+sqrt(u)W| <= 2 ell(t)+sqrt(pi*u), sqrt(t)<=t for t>=64.
    tail=arb(-T).exp()*(2*a*(T+1)+2*b*(T*T+2*T+2)+factor)
    return factor*s.real-p*u+arb(tail/2,tail/2)

left,right=Q(403448,10**7),Q(403449,10**7)
dl,dr=value(left,1),value(right,1)
assert dl>0 and dr<0
fm=value(left)
Slo=fm.lower();Shi=(fm+dl*ball(right-left)).upper()
S=(Slo+Shi)/2+arb(0,(Shi-Slo)/2)
assert S>arb('1.3739535256614') and S<arb('1.3739535256616')
assert (S-fm).upper()<arb('2.2e-15')
curvature=value(Q(463,10000),2)
assert -curvature/2 > arb(27)/25
print('root bracket and curvature PASS',flush=True)
rows=[]
P=list(map(enclose,c.phi))
def rational_expectation(u):
    lam=arb(107)/50
    def integrand(t,analytic):
        r=u*t
        return (-t).exp()*r*r/(1+lam*r)
    v=acb(0)
    for j in range(16):
        v+=acb.integral(integrand,4*j,4*(j+1),rel_tol=arb('1e-22'),abs_tol=arb('1e-22'))
    tail=u/lam*(T+1)*arb(-T).exp()
    assert v.is_finite() and v.imag.contains(0)
    moment=v.real+arb(tail/2,tail/2)
    return P[0]+P[1]*u+P[2]*moment/2

for u in map(Q,['.00551','.01','.02','.03','.0403448','.0463']):
    lu=fm if u==left else value(u)
    uu=ball(u)
    cubic=P[0]+P[1]*uu+P[2]*uu**2+P[3]*uu**3-p*uu
    loss=cubic-S
    if u in (left,Q(463,10000)):
        assert loss>arb(1)/10000
    rational_loss=rational_expectation(uu)-p*uu-S
    if u in (left,Q(463,10000)):
        assert rational_loss>arb(1)/10000
    rows.append({'u':str(u),'Lambda_Gauss':str(lu),'Gaussian_buffer':str(S-lu),
                 'cubic_Lambda_upper_minus_S':str(loss),'cubic_budget_failure':bool(loss>arb(1)/10000),
                 'safe_rational_Lambda_upper_minus_S':str(rational_loss),
                 'safe_rational_budget_failure':bool(rational_loss>arb(1)/10000)})
    print('row',str(u),'PASS',flush=True)
out={'agent_id':'codex-a7c4','status':'PASS: Arb interval arithmetic, author only',
     'python_flint':__import__('flint').__version__,'precision_bits':ctx.prec,
     'u_star_bracket':[str(left),str(right)],'S':str(S),'left_derivative':str(dl),'right_derivative':str(dr),
     'Lambda_second_at_band_top':str(curvature),'band_buffer_coefficient':'27/25',
     'buffer_domain':['551/100000','463/10000'],
     'rows':rows,'meaning':'The specific Taylor-coefficient cubic majorant cannot close the weak target by itself; this does not refute the target.'}
print(json.dumps(out,indent=2))
