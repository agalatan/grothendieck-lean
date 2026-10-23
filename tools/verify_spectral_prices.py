#!/usr/bin/env python3
"""Exact common-tail prices and conditional interval algebra.

The two analytic baseline columns are enclosed by positive rational series.
Every other column remains an uncertified floating integral: its stated error
is an ASSUMPTION. Passing this replay certifies no pool exclusion or endpoint.
"""
import argparse
import copy
from fractions import Fraction as Q
import json
from pathlib import Path


def pi_box():
    def atan(x,n):
        s=sum((-1)**j*x**(2*j+1)/Q(2*j+1) for j in range(n))
        t=(-1)**n*x**(2*n+1)/Q(2*n+1)
        return min(s,s+t),max(s,s+t)
    a,b=atan(Q(1,5),32);c,d=atan(Q(1,239),8)
    return 16*a-4*d,16*b-4*c


def phase_box(t):
    assert 0<=t<=1
    if t==1:return Q(1),Q(1)
    lo,hi=pi_box();power=t;ratio=t*t;b=Q(1,4);s=Q(0)
    for k in range(400):
        s+=b*power
        b*=Q((2*k+1)**2,4*(k+1)*(k+2));power*=ratio
    return lo*s,hi*(s+b*power/(1-ratio))


def baseline_boxes(r):
    lo,hi=pi_box()
    return [([(lo/4,hi/4),(lo/32,hi/32)],[phase_box(x) for x in r]),
            ([(3*lo/16,3*hi/16),(-101*hi/2048,-101*lo/2048)],
             [phase_box((3*x-x**3)/4) for x in r])]


def check(c,boxes):
    s=Q(c['cubic_price']);assert abs(s)<=1
    r=[Q(x['rho']) for x in c['tests']];p=[Q(x['price']) for x in c['tests']]
    assert all(0<=x<=1 for x in r)
    M=c['cutoff'];assert isinstance(M,int) and M>=2
    for k in range(2,M+1):
        assert abs(sum(a*x**(2*k+1) for a,x in zip(p,r)))<=1,'spectral front'
    assert sum(abs(a)*x**(2*M+3) for a,x in zip(p,r))<=1,'geometric far tail'
    w0=1+sum(a*x for a,x in zip(p,r));w1=-s+sum(a*x**3 for a,x in zip(p,r))
    e0,eK=Q(c['head_error_assumption']),Q(c['kernel_error_assumption'])
    assert e0>=0 and eK>=0 and c['analytic_last_columns']==2
    eb=Q(c['analytic_baseline_error']);assert eb>=0
    vals=[];cols=c['midpoint_columns'];q=len(cols)
    for j,col in enumerate(cols):
        c0,c1=Q(col['c0']),Q(col['c1']);K=list(map(Q,col['kernels']))
        assert len(K)==len(r)
        if j>=q-2:
            heads,kernels=boxes[j-q+2]
            for mid,(lo,hi) in zip([c0,c1]+K,heads+kernels):
                assert mid-eb<=lo<=hi<=mid+eb,'analytic baseline outside enclosure'
        eh,ek=(e0,eK) if j<q-2 else (eb,eb)
        value=w0*c0+w1*c1-sum(a*k for a,k in zip(p,K))
        value+=eh*(abs(w0)+abs(w1))+ek*sum(map(abs,p))
        vals.append(value)
    assert max(vals)==Q(c['bound']),'understated or inconsistent bound'
    return float(max(vals))


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('input',type=Path)
    a=p.parse_args();rows=json.loads(a.input.read_text())
    r=[Q(x['rho']) for x in rows[0]['rational_certificate']['tests']]
    boxes=baseline_boxes(r)
    for row in rows:
        c=row['rational_certificate'];b=check(c,boxes)
        print('PASS all-index price and conditional algebra',row['price_l1_cap'],
              c['head_error_assumption'],c['kernel_error_assumption'],b)
    c=rows[0]['rational_certificate']
    for corruption in ['price','bound','baseline']:
        bad=copy.deepcopy(c)
        if corruption=='price':bad['tests'][0]['price']='1000'
        elif corruption=='bound':bad['bound']=str(Q(bad['bound'])-Q(1,10**10))
        else:bad['midpoint_columns'][-1]['c0']='0'
        try:check(bad,boxes)
        except AssertionError:pass
        else:raise AssertionError('accepted corruption: '+corruption)
    print('PASS invalid price, understated bound, and false analytic baseline rejected')
    print('Numerical response integrals are NOT enclosed. No endpoint or pool exclusion follows.')


if __name__=='__main__':main()
