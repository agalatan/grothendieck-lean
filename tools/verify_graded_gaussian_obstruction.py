#!/usr/bin/env python3
"""Exact series replay: the frozen noise-price witness has norm > 0.7169.

Paper inputs: the original-noise Gaussian limit of q_m, the Gaussian phase
kernel (already formalized elsewhere in this repo), and Machin's pi identity.
No numerical integration or stochastic error enters this replay. This rejects
the particular price-induced witness as an endpoint improvement; it does not
bound the norm of the incumbent cubic witness or change a Grothendieck bound.
"""
import argparse
from fractions import Fraction as Q
import json
from pathlib import Path


def atan_interval(x,n):
    assert 0<x<1
    s=sum((-1)**j*x**(2*j+1)/Q(2*j+1) for j in range(n))
    t=(-1)**n*x**(2*n+1)/Q(2*n+1)
    return min(s,s+t),max(s,s+t)


def pi_interval():
    # tan(4 atan(1/5)-atan(1/239))=1; the angle lies in (0,pi/2).
    # Thus Machin's identity and alternating-series remainders give this box.
    a,b=atan_interval(Q(1,5),32);c,d=atan_interval(Q(1,239),8)
    return 16*a-4*d,16*b-4*c


def scale(c,I):return (c*I[0],c*I[1]) if c>=0 else (c*I[1],c*I[0])
def add(I,J):return I[0]+J[0],I[1]+J[1]


def phase_kernel(t,pi):
    assert 0<=t<=Q(1,2)
    # H(t)=pi sum b_k t^(2k+1), b_0=1/4,
    # b_(k+1)/b_k=(2k+1)^2/[4(k+1)(k+2)] < 1.
    b=Q(1,4);s=Q(0)
    for k in range(48):
        s+=b*t**(2*k+1)
        b*=Q((2*k+1)**2,4*(k+1)*(k+2))
    tail=b*t**97/(1-t*t)
    return pi[0]*s,pi[1]*(s+tail)


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('price_file',type=Path);p.add_argument('--out',type=Path,required=True)
    a=p.parse_args();data=json.loads(a.price_file.read_text())['rational_midpoint_screen']
    s=Q(data['cubic_price']);rr=[Q(x['rho']) for x in data['tests']]
    aa=[Q(x['price']) for x in data['tests']]
    assert abs(s)<=1 and all(0<r<=1 for r in rr)
    assert sum(abs(v)*r**5 for v,r in zip(aa,rr))<=1
    pi=pi_interval();v=Q(1,3)
    first=Q(1,4)/(1+v)
    cubic=-v/(4*(1+v))+Q(1,32)/(1+v)**3
    assert first==Q(3,16) and cubic==-Q(101,2048)
    w0=1+sum(q*r for q,r in zip(aa,rr))
    w1=-s+sum(q*r**3 for q,r in zip(aa,rr))
    value=scale(w0*first+w1*cubic,pi)
    for q,r in zip(aa,rr):
        t=(r-v*r**3)/(1+v)
        value=add(value,scale(-q,phase_kernel(t,pi)))
    assert value[0]>Q(7169,10000)
    assert value[1]-value[0]<Q(1,10**25)
    out={'scope':__doc__,'variance_parameter':'1/3',
         'kernel_argument':'(3*rho-rho^3)/4','first_coefficient':'3*pi/16',
         'cubic_coefficient':'-101*pi/2048','payoff_lower':str(value[0]),
         'payoff_upper':str(value[1]),'strict_lower_target':'7169/10000',
         'warning':'A norm obstruction to this noise-price witness, not an improved endpoint.'}
    a.out.write_text(json.dumps(out,indent=2)+'\n')
    print('PASS exact graded-Gaussian payoff enclosure:',float(value[0]),float(value[1]))
    print('PASS strict payoff > 7169/10000 = 0.7169; admissible witness price budget')
    print('The finite-q_m realization follows by the paper replica-limit argument.')


if __name__=='__main__':main()
