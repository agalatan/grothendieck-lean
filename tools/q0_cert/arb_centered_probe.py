#!/usr/bin/env python3
"""Directed-Arb local Cauchy bounds, no integral enclosure; python-flint 0.9.
Run uv run --with python-flint python arb_centered_probe.py.
"""

if not __debug__:
    raise SystemExit("optimized Python is unsupported: checks must remain enabled")
from fractions import Fraction as Q
from math import comb, factorial, prod
from pathlib import Path
from time import perf_counter
import contextlib, io, runpy, sys
from flint import arb, ctx
ctx.prec=192
with contextlib.redirect_stdout(io.StringIO()):
    m=runpy.run_path(str(Path(__file__).with_name('compress_first_wick.py')))
P,data=m['P'],m['data']
def A(q):
    q=Q(q); return arb(q.numerator)/q.denominator

# Power coefficients of κ(s), each a directed enclosure.
power=[arb(0) for _ in range(12)]
pi=arb.pi(); factor=(1+A(data['aQ'])**2).sqrt()
for j,x in enumerate(data['profileQ']):
    norm=(pi.sqrt()*arb(comb(2*j,j))/4**j).sqrt()
    for k in range(j+1):
        bh=prod((Q(2*k+1+2*i,2*(i+1)) for i in range(j-k)),start=Q(1))
        power[k] += factor*A(x)*(-1)**k*A(bh)/factorial(k)/norm

def shift1(old, dim, center):
    new={}
    powers=[arb(1)]
    for i in range(max(key[dim] for key in old)): powers.append(powers[-1]*center)
    for key,c in old.items():
        n=key[dim]
        for j in range(n+1):
            dest=list(key);dest[dim]=j;dest=tuple(dest)
            new[dest]=new.get(dest,arb(0))+c*comb(n,j)*powers[n-j]
    return new

def probe(si,ui):
    start=perf_counter(); s=arb(si); u=arb(ui); rs=arb(1)/8; ru=u/8
    sh=[sum((power[k]*comb(k,j)*s**(k-j) for k in range(j,12)),arb(0)) for j in range(12)]
    k0=sh[0]; beta= A('41/20')+k0*k0*u*u
    for iteration in range(60):
        K=sum((abs(sh[n])*rs**n for n in range(12)),arb(0))
        D=sum((n*abs(sh[n])*rs**(n-1) for n in range(1,12)),arb(0))
        dv=K*K*(2*u*ru+ru*ru)+2*K*D*rs*u*u
        B=beta-dv
        if B>beta/2: break
        rs/=2;ru/=2
    else: raise RuntimeError('beta certification failed')
    S=s+rs; U=u+ru
    rb=dv/(B*beta)
    rt=(D*rs*U*U+abs(k0)*(2*u*ru+ru*ru))/B+abs(k0)*u*u*dv/(B*beta)
    t0=k0*u*u/beta
    wk={key:A(v) for key,v in P.items()}
    for dim,center in enumerate((s,1/beta,t0)):
        wk=shift1(wk,dim,center)
    W=sum((abs(c)*rs**i*rb**j*rt**k for (i,j,k),c in wk.items()),arb(0))
    alpha=A('41/20')
    delta=(rs*U*U+s*(2*u*ru+ru*ru))/B+s*u*u*dv/(B*beta)
    expmax=-alpha*s+alpha*rs-alpha*s*u*u/beta+alpha*delta
    M=2*K*S/B*W*expmax.exp()
    area=rs*ru
    for degree in range(1000):
        if 4*area*M/2**degree < A('1/1000000000000000000'): break
    else: raise RuntimeError('degree cap exceeded')
    print(f's={si} u={ui} refinements={iteration} beta_lower={B} radius_s={rs} radius_u={ru} degree={degree} M={M} seconds={perf_counter()-start:.2f}',flush=True)

if __name__=='__main__':
 print('Directed Arb bounds for individual cells only; no global integral.',flush=True)
 for s,u in [(1,1),(10,1),(10,2**20),(40,1),(80,2**20)]: probe(s,u)
