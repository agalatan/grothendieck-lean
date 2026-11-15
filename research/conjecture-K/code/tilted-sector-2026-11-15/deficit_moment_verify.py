#!/usr/bin/env python3
"""codex-6e2b: rigorous low-energy moment/content-deficit cover.

Arb recomputes Hermite profile caps and Gaussian benchmarks. All cover acceptance
uses exact rational Bernstein coefficients. The Bernstein profile theorem and
genuine-H_(2,1) sixth-moment theorem are explicit analytic dependencies.
"""
from fractions import Fraction as Q
from functools import lru_cache
from math import comb, sqrt
from pathlib import Path
import argparse, hashlib, json, sys, time
from flint import arb,ctx
ROOT=Path(__file__).resolve().parent
ARCHIVE=ROOT.parents[2]/'research/conjecture-K/code/audit-2026-11-15-codex-a7c4/remote_stein_original'
sys.path.insert(0,str(ARCHIVE));sys.path.insert(0,str(ROOT))
from profile import evaluate as profile
from deficit_gaussian import benchmark
ctx.prec=128
C6=Q(4045313,100000);EPS=Q(6,10**6);ALPHA=Q(3,10)

def ar(q):
    q=Q(q);return arb(q.numerator)/q.denominator

def exactpoint(a):
    assert a.is_exact()
    m,e=a.man_exp();return Q(int(m))*Q(2)**int(e)

def lower(a):return exactpoint(a.lower())
def upper(a):return exactpoint(a.upper())

@lru_cache(None)
def blo(u):
    if u==0:return lower(ar(Q(387,500))*arb.pi().sqrt())
    return lower(benchmark(u))

@lru_cache(None)
def fresh_cap(s1,s2):
    assert 0<s1<s2
    f1,d1=profile(ar(s1));f2,d2=profile(ar(s2))
    a,b=ar(s1),ar(s2);gap=b-a
    c2=(f2-f1-d1*gap)/(gap*gap)
    c3=(d2-d1-2*c2*gap)/(gap*gap)
    assert c3>0
    coeff=[f1-d1*a+c2*a*a-c3*a*a*b,
           d1-2*c2*a+c3*(2*a*b+a*a),
           c2-c3*(b+2*a),c3]
    # For s>=0, raising each coefficient preserves a global upper cap.
    return tuple(upper(c) for c in coeff)

def proposed_nodes(u,x):
    chi=float(x*x);m2=2+chi;m3=6+9*chi+float(C6)*chi**1.5
    total=(m3-m2)/(m2-1);product=total-m2
    hi=(total+sqrt(total*total-4*product))/2;lo=product/hi
    # Only node proposals use binary arithmetic. Fresh Arb integration accepts
    # the resulting exact positive rational nodes independently.
    scale=10**9
    s1=Q(max(1,round(float(u)*lo*scale)),scale)
    s2=Q(max(int(s1*scale)+1,round(float(u)*hi*scale)),scale)
    assert 0<s1<s2
    return s1,s2


def blank():return [[Q(0) for j in range(4)] for i in range(4)]
def content(j):
    p=blank()
    if j==0:p[2][2]=Q(2,25)
    elif j==1:p[3][3]=3
    elif j==2:p[0][0]=Q(1,2500)
    elif j==3:p[1][0]=Q(19321,10**6)
    else:raise ValueError(j)
    return p
CONTENTS=[content(j) for j in range(4)]

@lru_cache(None)
def margin(cap,slab,j):
    l,h=slab;bl,bh=blo(l),blo(h);slope=(bh-bl)/(h-l)
    p=blank();p[0][0]=ALPHA*(bl-slope*l)+EPS;p[1][0]=ALPHA*slope
    p[0][0]-=ALPHA*cap[0];p[1][0]-=ALPHA*cap[1]
    p[2][0]-=2*ALPHA*cap[2];p[2][2]-=ALPHA*cap[2]
    p[3][0]-=6*ALPHA*cap[3];p[3][2]-=9*ALPHA*cap[3];p[3][3]-=C6*ALPHA*cap[3]
    for i in range(4):
        for k in range(4):p[i][k]-=CONTENTS[j][i][k]
    return p

def bernstein2(p,box):
    a,b,c,d=box;du=b-a;dx=d-c
    def val(u,x):
        return sum(p[i][j]*u**i*x**j for i in range(4) for j in range(4))
    if min(val(u,x) for u in [a,b] for x in [c,d])<0:return [Q(-1)]
    trans=[[sum(p[i][j]*comb(i,k)*comb(j,l)*a**(i-k)*c**(j-l)*du**k*dx**l
                 for i in range(k,4) for j in range(l,4)) for l in range(4)] for k in range(4)]
    return [sum(trans[k][l]*Q(comb(i,k),comb(3,k))*Q(comb(j,l),comb(3,l))
                for k in range(i+1) for l in range(j+1)) for i in range(4) for j in range(4)]


def exempt(box):
    _,u,_,x=box;d=u*u*x*x
    vals=[Q(2,25)*d,3*u**3*x**3,Q(1,2500),Q(19321,10**6)*u]
    return min(vals)<=EPS


def main():
    parser=argparse.ArgumentParser();parser.add_argument('--certify',action='store_true');parser.add_argument('--umax',default='9/1000');parser.add_argument('--step',default='1/2000');parser.add_argument('--limit',type=int,default=5000)
    args=parser.parse_args();umax,step=Q(args.umax),Q(args.step)
    assert 0<umax<=Q(9,1000) and 0<step<=Q(1,2000)
    slabs=[];u=Q(0)
    while u<umax:
        v=min(umax,u+step);slabs.append((u,v));u=v
    accepted=[];caps=[];capnodes=[];visited=0;exempts=0;start=time.time();maxdepth=0
    for si,slab in enumerate(slabs):
        queue=[(slab+(Q(0),Q(13,2)),0)]
        while queue:
            box,depth=queue.pop();visited+=1;maxdepth=max(maxdepth,depth)
            assert visited<=args.limit,(visited,box)
            if exempt(box):
                accepted.append({'box':list(map(str,box)),'exempt':True});exempts+=1;continue
            found=None
            # Reuse the latest caps first; their global validity is independent
            # of the parameters at which their interpolation nodes were chosen.
            for ci in reversed(range(len(caps))):
                for j in [1,0,3,2]:
                    if min(bernstein2(margin(caps[ci],slab,j),box))>=0:found=(ci,j);break
                if found is not None:break
            if found is None:
                nodes=proposed_nodes((box[0]+box[1])/2,(box[2]+box[3])/2)
                if nodes not in capnodes:
                    cap=fresh_cap(*nodes);caps.append(cap);capnodes.append(nodes)
                    print('CAP',len(caps),list(map(str,nodes)),flush=True)
                    for j in [1,0,3,2]:
                        if min(bernstein2(margin(cap,slab,j),box))>=0:found=(len(caps)-1,j);break
            if found is not None:
                accepted.append({'box':list(map(str,box)),'slab':list(map(str,slab)),'cap':found[0],'content':found[1]});continue
            assert depth<24,('subdivision exhausted',box)
            # Exact bisection only. Both children are always retained.
            ul,uh,xl,xh=box
            if (uh-ul)/max(uh,Q(1,1000000))>(xh-xl)/max(xh,Q(1,1000000)):
                mid=(ul+uh)/2;children=[(ul,mid,xl,xh),(mid,uh,xl,xh)]
            else:
                mid=(xl+xh)/2;children=[(ul,uh,xl,mid),(ul,uh,mid,xh)]
            queue.extend((child,depth+1) for child in children)
        print('SLAB',si+1,'/',len(slabs),'accepted',len(accepted),'caps',len(caps),'seconds',time.time()-start,flush=True)
    # Independently check the final finite partition, not merely the search log.
    rects=[tuple(map(Q,row['box'])) for row in accepted]
    assert all(0<=a<b<=umax and 0<=c<d<=Q(13,2) for a,b,c,d in rects)
    cuts=sorted({z for r in rects for z in r[:2]})
    assert cuts[0]==0 and cuts[-1]==umax
    for a,b in zip(cuts,cuts[1:]):
        intervals=sorted((c,d) for l,h,c,d in rects if l<=a and b<=h)
        assert intervals and intervals[0][0]==0 and intervals[-1][1]==Q(13,2)
        assert all(x[1]==y[0] for x,y in zip(intervals,intervals[1:]))
    print('EXACT PARTITION CHECK PASS',len(cuts)-1,'energy strips',flush=True)
    dependencies={str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in
                  [Path(__file__).resolve(),ROOT/'deficit_gaussian.py',ARCHIVE/'profile.py']}
    witness={'dependencies_sha256':dependencies,'Agent-ID':'codex-6e2b','claim':'C^2 <= .3 D_+ + 6e-6 for all 0<=u<=umax, 0<=chi<=42','umax':str(umax),'xmax':'13/2','slabs':[list(map(str,s)) for s in slabs],
             'caps':[{'nodes':list(map(str,n)),'coefficients':list(map(str,c))} for n,c in zip(capnodes,caps)],
             'benchmark_lower':{str(u):str(blo(u)) for s in slabs for u in s},'accepted':accepted,
             'visited':visited,'exempts':exempts,'maxdepth':maxdepth,'seconds':time.time()-start}
    (ROOT/'deficit_moment_verify_witness.json').write_text(json.dumps(witness,indent=2)+'\n')
    print('PASS FULL LOW-ENERGY MOMENT COVER', {k:witness[k] for k in ['umax','visited','exempts','maxdepth','seconds']},'accepted',len(accepted),'caps',len(caps),flush=True)

if __name__=='__main__':main()
