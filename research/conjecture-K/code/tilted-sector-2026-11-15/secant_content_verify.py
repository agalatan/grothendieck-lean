#!/usr/bin/env python3
"""codex-6e2b: validate a rational shifted-OU supersolution with Arb.

The JSON values are only candidate rational coefficients: no optimizer output
or cached integral is accepted as a theorem. Every source integral is fresh.
"""
import heapq
import itertools
import json
from pathlib import Path
import sys
import time
from fractions import Fraction as Q

sys.path.insert(0,str(Path(__file__).resolve().parent))
from content_profile import (arb,arb_series,a,b,d,pi,root_ball,root_series,
                             exact_interval,radius_from_t)
from content_next_m3 import exp_moment,integral_envelope

def ar(q):
    q=Q(q)
    return arb(q.numerator)/q.denominator

def m2_integrand(x,y,derivative=False):
    if derivative:y=arb_series([y,1])
    v=x*x+y*y;t=root_series(v) if derivative else root_ball(v)
    p,q=a+b*t,a+3*b*t;R=b/p+3*b/q
    J=1-(t-d)*(1+R)
    value=8*x*(-t).exp()/pi/p/p/q/q*J
    return abs(value[4]) if derivative else value

def m4_integrand(x,y):
    t=root_ball(x*x+y*y);p,q=a+b*t,a+3*b*t
    R=b/p+3*b/q;S=b*b/p/p+9*b*b/q/q
    U=2*b**3/p/p/p+54*b**3/q/q/q
    W=1+3*R+2*R*R+S
    K=(t-d)*W-2-3*R
    Kp=W-(t-d)*((3+4*R)*S+U)+3*S
    H=Kp-(1+3*R)*K
    return 16*x*(-t).exp()/pi/p/p/p/q/q/q*(3*K+2*x*x/p/q*H)

def m4_tail():
    T=arb(20);p,q=a+b*T,a+3*b*T
    R=b/p+3*b/q;S=b*b/p/p+9*b*b/q/q
    U=2*b**3/p/p/p+54*b**3/q/q/q
    W=1+3*R+2*R*R+S
    K1,K0=W,d*W+2+3*R
    J1=(3+4*R)*S+U;J0=W+d*J1+3*S
    H1,H0=J1+(1+3*R)*K1,J0+(1+3*R)*K0
    co=[3*K0,3*K1+2*H0,2*H1]
    assert all(c>0 for c in co)
    # e^-t times each t^j is decreasing for t>=20, j<=2.
    return 16/pi/p/p/p/q/q/q*sum(c*(a*exp_moment(T,j)+3*b*exp_moment(T,j+1))
             /(2*T.sqrt()) for j,c in enumerate(co))

def certify_m4():
    stop=radius_from_t(arb(20));tail=m4_tail()
    yedges=[ar(Q(j,100)) for j in range(201)]
    yedges += [ar(Q(j,20)) for j in range(41,161)]+[stop]
    assert all(l<h for l,h in zip(yedges[:-1],yedges[1:]))
    worst=arb(0)
    for j in range(50):
        x=exact_interval(ar(Q(j,50)),ar(Q(j+1,50)))
        bound=tail
        for yl,yh in zip(yedges[:-1],yedges[1:]):
            bound += (yh-yl)*abs(m4_integrand(x,exact_interval(yl,yh))).upper()
        worst=max(worst,bound.upper())
    assert worst<1000,str(worst)
    return worst

def quad_cell(x,lo,hi):
    length=hi-lo;center=(lo+hi)/2;off=length/(2*arb(3).sqrt())
    val=length/2*(m2_integrand(x,center-off)+m2_integrand(x,center+off))
    err=(length**5*m2_integrand(x,exact_interval(lo,hi),True)/180).upper()
    return val,err

def integrate(x,tail_x=arb(1),tol=arb('0.0000002'),accept=None):
    edges=list(map(arb,['0','.125','.25','.5','1','2','4','8']))+[radius_from_t(arb(20))]
    omitted=tail_x*integral_envelope(arb(20))
    heap=[];count=itertools.count();mid=arb(0);rad=arb(0);err=arb(0)
    def add(l,h):
        nonlocal mid,rad,err
        v,e=quad_cell(x,l,h);mid+=v.mid();rad+=v.rad();err+=e
        heapq.heappush(heap,(-float(e),next(count),l,h,v,e))
    for l,h in zip(edges[:-1],edges[1:]):add(l,h)
    while True:
        result=mid+arb(0,rad.upper()+err.upper()+omitted.upper())
        if (accept is not None and accept(result)) or (accept is None and err<tol):return result
        assert len(heap)<10000
        _,_,l,h,v,e=heapq.heappop(heap);mid-=v.mid();rad-=v.rad();err-=e
        c=(l+h)/2;add(l,c);add(c,h)

def certify_outer():
    T=arb(4);p,q=a+b*T,a+3*b*T;R=b/p+3*b/q
    co=[arb(0),1+d*(1+R),1+R]
    # x<=sqrt(t)(a+bt), sqrt(t)<=t/2 for t>=4.
    factor=4/pi/p/q/q
    point=factor*(-T).exp()*sum(c*T**j for j,c in enumerate(co))
    tail=factor*sum(c*(a*exp_moment(T,j)+3*b*exp_moment(T,j+1))
                  /(2*T.sqrt()) for j,c in enumerate(co))
    far=radius_from_t(T)*point+tail
    assert far<ar(Q(25,24)) and radius_from_t(T)<3
    # On [0,1] only a lower source bound is needed. On [1,3], both.
    worst_lower=arb(0);worst_upper=arb(0)
    for j in range(60):
        x=exact_interval(ar(Q(j,20)),ar(Q(j+1,20)))
        def accepted(v):
            return bool(v>-ar(Q(25,24))) and (j<20 or bool(v<ar(Q(25,24))))
        value=integrate(x,tail_x=arb(3),accept=accepted)
        worst_lower=min(worst_lower,value.lower())
        if j>=20:worst_upper=max(worst_upper,value.upper())
    return dict(far=str(far),compact_lower=str(worst_lower),outer_upper=str(worst_upper))

def power_bern(c):
    return [c[0],c[0]+c[1]/3,c[0]+2*c[1]/3+c[2]/3,sum(c)]

def certify():
    start=time.time();base=Path(__file__).resolve().parent
    candidate=json.loads((base/'secant_content_witness.json').read_text())
    n=candidate['n'];assert n==500
    assert candidate['u']==['3/100','463/10000']
    Y=list(map(lambda x:Q(str(x)),candidate['values']))
    D=list(map(lambda x:Q(str(x)),candidate['derivatives']))
    assert len(Y)==len(D)==n+1
    Y[0]=Q(0);Y[-1]=Q(5,8)
    m4=certify_m4();print(json.dumps({'M4_upper':str(m4),'M4_certified':1000}),flush=True)
    outer=certify_outer();print(json.dumps({'source_outer':outer}),flush=True)
    source=[integrate(ar(Q(j,n))) for j in range(n+1)]
    h=Q(1,n);cap=Q(313,500);minimum=arb('inf');maxcap=arb(0)
    for i in range(n):
        x=Q(i,n)
        c=[Y[i],h*D[i],-3*Y[i]-2*h*D[i]+3*Y[i+1]-h*D[i+1],
           2*Y[i]+h*D[i]-2*Y[i+1]+h*D[i+1]]
        for z in power_bern(c):
            assert z<=cap,(i,str(z))
            maxcap=max(maxcap,ar(z).upper())
        for u in [Q(3,100),Q(463,10000)]:
            op=[]
            for j in range(4):
                val=(Q(5,3)+j)*c[j]
                if j+1<4:val+=(j+1)*x*c[j+1]/h
                if j+2<4:val-=u*(j+2)*(j+1)*c[j+2]/(2*h*h)
                op.append(ar(val))
            # Linear interpolation source upper with the certified second
            # derivative bound |(m'')''|=|m''''|<=1000 on [0,1].
            source_power=[source[i]+ar(Q(1000)*h*h/8),source[i+1]-source[i],arb(0),arb(0)]
            for value in power_bern([op[j]-source_power[j] for j in range(4)]):
                assert value>0,(i,str(u),str(value))
                minimum=min(minimum,value.lower())
    assert D[-1]>=0
    # Angular norm polynomial: positive Bernstein coefficients of the
    # quartic 8z^4+8z^3-16z^2-12z+15 on [0,1].
    assert [Q(15),Q(12),Q(19,3),Q(0),Q(3)]==[
        sum(Q([15,-12,-16,8,8][j])*Q(__import__('math').comb(k,j),__import__('math').comb(4,j))
            for j in range(k+1)) for k in range(5)]
    coefficient=Q(11,108)*cap*cap
    assert coefficient<Q(1,25)
    print(json.dumps({'claim':'central-energy content squared <= delta/25',
        'u':['3/100','463/10000'],'cells':n,'cap':str(cap),
        'barrier_max':str(maxcap),'residual_margin':str(minimum),
        'coefficient':str(coefficient),'passed':True,'seconds':time.time()-start}),flush=True)

if __name__=='__main__':certify()
