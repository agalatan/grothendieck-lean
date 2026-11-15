#!/usr/bin/env python3
"""Exact orthogonality-only shared-A certificate. Agent-ID: codex-a7c4. Refs #406.

Run python3 -I; standard library only, no writes unless --write-result.
Analytic implication and arithmetic audit: ../../sources/.../CONTENT.md.
"""
from fractions import Fraction as Q
from math import comb, isqrt
from pathlib import Path
import argparse
import hashlib
import importlib.util
import json
import sys

if not __debug__:
    raise RuntimeError('Do not disable assertions with -O.')
sys.dont_write_bytecode = True
source = Path(__file__).resolve().parents[1]/'audit-2026-11-15-codex-a7c4'/'odd_cost_check.py'
spec = importlib.util.spec_from_file_location('audited_radial_intervals', source)
old = importlib.util.module_from_spec(spec)
spec.loader.exec_module(old)


def bernstein(poly, l, r):
    n = len(poly)-1
    p = [sum((poly[j]*comb(j,k)*l**(j-k)*(r-l)**k for j in range(k,n+1)), Q(0))
         for k in range(n+1)]
    return [sum((p[k]*Q(comb(i,k),comb(n,k)) for k in range(i+1)),Q(0))
            for i in range(n+1)]


def circular_certificate():
    C=Q(59767,200000)
    coeff=[Q(1)]
    for k in range(1,25):
        coeff.append(coeff[-1]*(Q(3,2)-k)**2/k**2)
    assert 4/old.PI.lo < Q(31831,25000)
    assert 4/old.PI.lo-1 < C
    N=12
    d=Q(31831,25000)-sum(coeff[:N+1])
    assert d>0
    P=[Q(0)]*(2*N+4)
    P[-1]=C;P[-2]=-1;P[-3]=1
    for k in range(1,N+1): P[2*N+2-2*k]-=coeff[k]
    P[0]-=d
    pending=[(Q(1),Q(3))]; accepted=[]
    while pending:
        l,r=pending.pop()
        lower=min(bernstein(P,l,r))
        if lower>0: accepted.append((l,r,lower))
        else:
            assert r-l>Q(1,2**15)
            m=(l+r)/2;pending.extend([(l,m),(m,r)])
    accepted.sort()
    assert accepted[0][0]==1 and accepted[-1][1]==3
    assert all(x[1]==y[0] for x,y in zip(accepted,accepted[1:]))
    shifted=[sum((P[j]*comb(j,k)*3**(j-k) for j in range(k,len(P))),Q(0))
             for k in range(len(P))]
    assert all(x>0 for x in shifted)
    r=Q(581,400)
    ratio=(r*sum((coeff[k]*r**(-2*k) for k in range(25)),Q(0))-1)/r**2
    assert ratio>Q(149417,500000)
    # h(1)>1+C; h''(s)<0 for s>=1, from the numerator in x=1+s.
    assert (1+C)**2 < Q(7,4)
    assert -Q(2)**4+3*Q(2)**2-2+Q(3,4)<0
    return C, {'affine_slope':str(C),'slope_strict_lower':'149417/500000',
               'compact_cells':[[str(l),str(r)] for l,r,_ in accepted],
               'compact_smallest_bernstein':str(min(v for _,_,v in accepted)),
               'infinite_ray_start':'3','infinite_ray_smallest_coefficient':str(min(shifted))}


S=1<<60
class I:
    """Outward fixed-point intervals with integer endpoints / 2^60."""
    def __init__(self, lo, hi=None, *, raw=False):
        if raw: self.lo,self.hi=lo,hi
        else:
            lo=Q(lo);hi=lo if hi is None else Q(hi)
            self.lo=(lo*S).__floor__();self.hi=(hi*S).__ceil__()
        assert self.lo<=self.hi
    @staticmethod
    def lift(x): return x if isinstance(x,I) else I(x)
    def __add__(self,x):
        x=I.lift(x);return I(self.lo+x.lo,self.hi+x.hi,raw=True)
    __radd__=__add__
    def __neg__(self): return I(-self.hi,-self.lo,raw=True)
    def __sub__(self,x): return self+-I.lift(x)
    def __rsub__(self,x): return I.lift(x)+-self
    def __mul__(self,x):
        x=I.lift(x);v=[self.lo*x.lo,self.lo*x.hi,self.hi*x.lo,self.hi*x.hi]
        return I(min(v)//S,-(-max(v)//S),raw=True)
    __rmul__=__mul__
    def __truediv__(self,x):
        x=I.lift(x);assert x.lo>0
        return self*I(S*S//x.hi,-(-S*S//x.lo),raw=True)
    def sqrt(self):
        assert self.lo>=0
        return I(isqrt(self.lo*S),isqrt(self.hi*S)+1,raw=True)


def exp_minus_small(x):
    assert 0<=x.lo<=x.hi<S
    term=I(1);even=I(1)
    for j in range(1,9):
        term=term*(-x)/j;even=even+term
    odd=even+term*(-x)/9
    return I(odd.lo,even.hi,raw=True)


def strip(w,C,K,J,cells):
    a,b,u,r,p=Q(699,1250),Q(179,1250),Q(463,10000),Q(47,200),Q(2500,1891)
    d=r*r
    smin=w*(1-d)**2/(d*(a+b*d)**2)
    assert smin>1  # Our h branch dominates the concave splice throughout the cutoff.
    fmin=1-1/(2*(1+smin)**2)
    # W_u>0 on the complete u interval; h(s)^2 <= 1+s.
    derivative=(I(fmin*d)*exp_minus_small(I(d)) /
                I(d*(a+b*d)**2+u+w).sqrt()
                +2*C*(I(old.SQRT_PI.lo,old.SQRT_PI.hi)/(a+b/2)-2*r/a)-p)
    assert derivative.lo>0
    total=I(0)
    step=r/cells
    for k in range(cells):
        x=I(k*step,(k+1)*step)
        x2=x*x;h=a+b*x2;y=u+w*(1-x2)*(1-x2)
        ell=x*h;A=ell*ell+y
        root=(A-ell*ell*y/(2*A)).sqrt()
        total=total+exp_minus_small(x2)*(4*x*(root-ell)-4*C*y/h)
    correction=total*step
    base=(2*C*K-p)*u+(2*C*J-p)*w
    upper=base.hi+Q(correction.hi,S)
    # Simple saved ceilings avoid serializing multi-kilobyte exact fractions.
    unit=10**9
    cap=Q((upper*unit).__ceil__(),unit)
    return {'w':str(w),'u_max':str(u),'cutoff_radius':str(r),'cells':cells,
            'W_minus_B0_upper':str(cap),
            'positive_u_derivative_lower':str(Q(derivative.lo,S))}


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write-result',action='store_true')
    parser.add_argument('--cells',type=int,default=16384)
    args=parser.parse_args();assert args.cells>=1024
    C,angular=circular_certificate()
    K,I1,I2,_=old.radial_integrals(Q(699,1250),Q(179,1250))
    J=I2-2*I1+K;p=Q(2500,1891)
    cu=2*C*K-p;cw=2*C*J-p
    assert cu.hi<Q(389644,10**6) and cw.hi<-Q(124324,10**6)
    gap=Q(2074245,10**9)
    # Existing independently replayed peak benchmark; its integral acceptance
    # is inherited, while the subtraction of B0 is checked here.
    benchmark_lower=Q(13739535256614,10**13)
    B0=Q(387,500)*old.SQRT_PI
    assert benchmark_lower-B0.hi>gap
    assert Q(389644,10**6)*Q(558,10**5)<gap+Q(1,10000)
    assert Q(389644,10**6)*Q(31907,10**5)-Q(124324,10**6)<0
    assert Q(38968,100000)*Q(551,100000) < Q(20476,10**7)+Q(1,10000)
    assert Q(38968,100000)*Q(319,1000)-Q(12432,100000)<0
    strips=[]
    for w,delta in [(Q(103,5000),Q(1,10000)),(Q(13,625),Q(0)),(Q(421,20000),-Q(1,10000))]:
        item=strip(w,C,K,J,args.cells)
        assert Q(item['W_minus_B0_upper'])<gap+delta,item
        item['conclusion_relative_to_S']=str(delta)
        strips.append(item)
    out={'agent_id':'codex-a7c4','status':'PASS; exact rational and outward integer arithmetic',
         'scope':'Peak; arbitrary orthogonal remote L2 q,r; all w above each boundary; u<=.0463.',
         'angular':angular,'K':K.enclosure(),'J':J.enclosure(),
         'u_coefficient':cu.enclosure(),'w_coefficient':cw.enclosure(),
         'strips':strips,'inherited_benchmark_S_strict_lower':str(benchmark_lower),
         'benchmark_gap_strict_lower':str(gap),
         'weak_affine_cone':{'intercept':'279/50000','slope':'31907/100000'},
         'radial_library_sha256':hashlib.sha256(source.read_bytes()).hexdigest()}
    data=json.dumps(out,indent=2,sort_keys=True)+'\n'
    if args.write_result: Path(__file__).with_name('shared_a_second_moment_result.json').write_text(data)
    print(data,end='')
if __name__=='__main__': main()
