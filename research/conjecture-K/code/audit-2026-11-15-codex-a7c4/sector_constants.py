#!/usr/bin/env python3
"""Exact-rational scalar enclosures for the local A/B form.
Agent-ID: codex-a7c4. Run: python3 -I sector_constants.py.
No floating-point number enters an acceptance comparison. Machin's pi formula,
alternating erf series and a geometric exp tail provide rational bounds.
This certifies constants only; SECTORS.md supplies the analytic implication.
"""
from fractions import Fraction as Q
from math import isqrt
import json

class I:
    def __init__(self,a,b=None):
        self.lo=Q(a); self.hi=Q(a if b is None else b)
        assert self.lo<=self.hi
    def __add__(self,b):
        b=interval(b); return I(self.lo+b.lo,self.hi+b.hi)
    __radd__=__add__
    def __neg__(self): return I(-self.hi,-self.lo)
    def __sub__(self,b): return self+-interval(b)
    def __rsub__(self,b): return interval(b)+-self
    def __mul__(self,b):
        b=interval(b); x=[a*c for a in (self.lo,self.hi) for c in (b.lo,b.hi)]; return I(min(x),max(x))
    __rmul__=__mul__
    def __truediv__(self,b):
        b=interval(b); assert not b.lo<=0<=b.hi; return self*I(1/b.hi,1/b.lo)
    def __rtruediv__(self,b): return interval(b)/self
    def square(self):
        if self.lo>=0:return I(self.lo*self.lo,self.hi*self.hi)
        if self.hi<=0:return (-self).square()
        return I(0,max(self.lo*self.lo,self.hi*self.hi))
    def sqrt(self):
        assert self.lo>=0
        scale=10**80
        low=isqrt(self.lo.numerator*scale*scale//self.lo.denominator)
        high=isqrt(self.hi.numerator*scale*scale//self.hi.denominator)+1
        return I(Q(low,scale),Q(high,scale))

def interval(v): return v if isinstance(v,I) else I(v)

def atan(q,n=100):
    x=Q(q); s=sum((-1)**k*x**(2*k+1)/(2*k+1) for k in range(n))
    nxt=(-1)**n*x**(2*n+1)/(2*n+1)
    return I(min(s,s+nxt),max(s,s+nxt))

def exp(q,n=160):
    x=Q(q); assert x>=0 and x<n+2
    t=Q(1); s=t
    for k in range(1,n+1): t=t*x/k; s+=t
    nxt=t*x/(n+1)
    return I(s,s+nxt/(1-x/(n+2)))

def erf_sqrt(q,pi,n=100):
    x=Q(q); assert x>0 and x<n
    t=Q(1); s=t
    # (-x)^k / (k! (2k+1)); terms decrease after k > x.
    for k in range(1,n): t=t*(-x)/k; s+=t/(2*k+1)
    nxt=t*(-x)/n/(2*n+1)
    bracket=I(min(s,s+nxt),max(s,s+nxt))
    return 2*(I(x)/pi).sqrt()*bracket

def decimal_box(v,digits=14):
    s=10**digits
    l=v.lo.numerator*s//v.lo.denominator
    h=-((-v.hi.numerator*s)//v.hi.denominator)
    assert Q(l,s)<=v.lo<=v.hi<=Q(h,s)
    def dec(k): return ('-' if k<0 else '')+str(abs(k)//s)+'.'+str(abs(k)%s).zfill(digits)
    return [dec(l),dec(h)]

def main():
    pi=16*atan(Q(1,5))-4*atan(Q(1,239))
    a,b,p=Q(699,1250),Q(179,1250),Q(2500,1891)
    x=a/b
    # I_k = E[T^k/|L|], so j0=I_0/2.
    z0=pi/I(a*b).sqrt()*exp(x)*(1-erf_sqrt(x,pi))
    z1=(pi.sqrt()-a*z0)/b
    z2=(pi.sqrt()/2-a*z1)/b
    j=z0/2; g=(z1-z0)/2; d=-z1/(2*I(2).sqrt())
    ka=p-(z2-2*z1+z0)/2
    kb=p-z2/4; m=(z2-z1)/(2*I(2).sqrt())
    aa=ka+g.square()/(1+j); bb=kb+d.square()/(1+j); ab=m+g*d/(1+j)
    eig=(aa+bb-((aa-bb).square()+4*ab.square()).sqrt())/2
    optimal=-g/(1+j)
    negroot=(-g-(g.square()+(1+j)*ka).sqrt())/(1+j)
    posroot=(-g+(g.square()+(1+j)*ka).sqrt())/(1+j)
    k07=ka-2*g*Q(7,10)-(1+j)*Q(49,100)
    assert aa.lo>Q(6068,10000) and aa.hi<Q(6069,10000)
    assert bb.lo>Q(10134,10000) and bb.hi<Q(10135,10000)
    assert ab.lo>Q(2629,10000) and ab.hi<Q(2630,10000)
    assert eig.lo>Q(477,1000)
    assert k07.lo>Q(2975,10000)
    vals={'j0':j,'g0':g,'d0':d,'k_A':ka,'k_B':kb,'mixed_cost':m,'retained_A':aa,'retained_B':bb,'retained_mixed':ab,'smallest_eigenvalue':eig,'optimal_A_tilt':optimal,'negative_cost_root':negroot,'positive_cost_root':posroot,'k_at_0.7':k07}
    tilt=Q(7,10); radius=Q(3,10)
    abs_weight=-tilt+2/exp(1-tilt)
    def tail(w): return 4*abs_weight*(radius+w/(2*radius))/exp(radius*radius/w)
    small_tail=tail(Q(9,2500)); response_tail=tail(Q(113,10000))
    assert small_tail.hi<Q(14,10**12)
    vals['tail_w_0.0036_R_0.3_s_0.7']=small_tail
    vals['tail_w_0.0113_R_0.3_s_0.7']=response_tail
    print(json.dumps({'agent_id':'codex-a7c4','status':'C (scalar enclosures only)','arithmetic':'Python Fraction; rational series tails and integer-square-root enclosures','checks':'PASS','bounds':{k:decimal_box(v) for k,v in vals.items()}},indent=2))
if __name__=='__main__':main()
