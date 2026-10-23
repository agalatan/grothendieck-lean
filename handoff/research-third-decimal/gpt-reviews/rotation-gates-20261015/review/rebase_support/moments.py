"""Exact polar Gaussian cell integrals, including the unbounded tail.

generate(nr,nq) uses radial degree 12 and cosine harmonics 0..4.
The angular measure is 2/pi on [0,pi/2]. All enclosure endpoints are rational; angle endpoints are rational multiples of pi.
"""
from pathlib import Path
import sys
sys.path.insert(0,str(Path(__file__).resolve().parent))
from exact_base import F,I,PI,SQRTPI
from check_incumbents import exp_neg,convolution,trig
from math import factorial,comb
from functools import lru_cache

def radial_moments(n,R=F(8),order=10,max_degree=12):
    assert isinstance(n,int) and n>0 and 0<R<=8
    h=R/(2*n);out=[]
    for j in range(n):
        c=(2*j+1)*h;hi=c+h;Y=2*c*h+h*h;assert Y<1
        expc=exp_neg(c*c);power=[F(1)];pol=[F(0)]*(2*order+1)
        for k in range(order+1):
            for i,v in enumerate(power):pol[i]+=v/F(factorial(k))
            if k<order:power=convolution(power,[F(0),-2*c,-F(1)])
        rem=Y**(order+1)/F(factorial(order+1))/(1-Y)
        row=[]
        for k in range(max_degree+1):
            rp=[F(comb(k+1,i))*c**(k+1-i)for i in range(k+2)]
            p=convolution(pol,rp)
            integral=sum(p[i]*2*h**(i+1)/F(i+1)for i in range(0,len(p),2))
            error=2*h*hi**(k+1)*rem
            val=2*expc*I(integral-error,integral+error)
            row.append(I(max(F(0),val.lo),val.hi))
        out.append(row)
    return out

@lru_cache(None)
def sinpi(q):
    q=F(q)%2
    if q>1:return -sinpi(q-1)
    if q>F(1,2):return sinpi(1-q)
    if q==0:return I(0)
    if q==F(1,2):return I(1)
    return trig(PI*q)

def angular_moments(n):
    assert isinstance(n,int) and n>0
    return [[I(F(1,n))]+[
        (sinpi(F(k*(j+1),2*n))-sinpi(F(k*j,2*n)))*2/(PI*k)
        for k in range(1,5)]for j in range(n)]

def tail_moments(R=F(8),max_degree=12):
    assert R>0
    er=exp_neg(R*R)
    # int_R^inf exp(-r^2)dr <= exp(-R^2)/(2R), by r/R >= 1.
    gaussian_tail=I(0,er.hi/(2*R))
    out=[er]
    if max_degree:out.append(R*er+gaussian_tail)
    for k in range(2,max_degree+1):out.append(R**k*er+F(k,2)*out[k-2])
    return out

def generate(nr=1600,nq=64):
    R=F(8);rad=radial_moments(nr,R);ang=angular_moments(nq);tails=tail_moments(R)
    # Independent normalization checks: every full radial moment is Gamma(1+k/2).
    for k in range(13):
        val=sum((row[k] for row in rad),tails[k])
        if k%2==0:target=I(factorial(k//2))
        else:
            coeff=F(1,2)
            for j in range(3,k+1,2):coeff*=F(j,2)
            target=coeff*SQRTPI
        assert val.lo<=target.hi and target.lo<=val.hi,('radial normalization',k)
    for k in range(5):
        val=sum((row[k] for row in ang),I(0))
        target=I(1) if k==0 else 2*sinpi(F(k,2))/(PI*k)
        assert val.lo<=target.hi and target.lo<=val.hi,('angular normalization',k)
    return dict(radial=rad,angular=ang,tails=tails,radial_nodes=[R*j/nr for j in range(nr+1)])

if __name__=='__main__':
    import time
    t=time.monotonic();d=generate()
    print('PASS polar Gaussian moments: 1600 radial cells, 64 angular cells, degree12, harmonics4; seconds',time.monotonic()-t)
