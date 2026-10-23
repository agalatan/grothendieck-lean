#!/usr/bin/env python3
"""Exact mixed-moment controls for the genuine cubic's JOINT scalar state.

No scipy/numpy. This checks the original five-mode Gram, the two shared
quadratic correlations, and rejection of an independent A_Y surrogate.
It does not prove the invariant-space classification or a norm cap.
"""
from fractions import Fraction as Q
from math import factorial

zero=(0,)*6  # powers Z,barZ,G,barG,R,V

def add(a,b):
    c=a.copy()
    for k,v in b.items():c[k]=c.get(k,Q(0))+v
    return {k:v for k,v in c.items() if v}

def scale(a,c):return {k:v*c for k,v in a.items() if v*c}

def mul(a,b):
    c={}
    for k,v in a.items():
        for l,w in b.items():
            p=tuple(x+y for x,y in zip(k,l));c[p]=c.get(p,Q(0))+v*w
    return {k:v for k,v in c.items() if v}

def star(a):return {(k[1],k[0],k[3],k[2],k[4],k[5]):v for k,v in a.items()}

def var(j):return {tuple(int(j==k) for k in range(6)):Q(1)}

def rising(a,k):
    p=1
    for j in range(k):p*=a+j
    return p

def expectation(a,m):
    d=m*(m+1)//2
    return sum(v*factorial(k[0])*factorial(k[2])*rising(m,k[4])*rising(d-1,k[5])
               for k,v in a.items() if k[0]==k[1] and k[2]==k[3])

def verify(m):
    d=m*(m+1)//2;D=m*(m+1);one={zero:Q(1)}
    Z,Zb,G,Gb,R,V=[var(j) for j in range(6)]
    T=mul(Z,Zb);S=mul(G,Gb)
    AX=add(R,scale(one,-m));AY=add(add(S,V),scale(one,-d))
    modes=[Z,mul(Z,add(T,scale(one,-2))),mul(Z,AX),mul(Z,AY),mul(R,G)]
    norms=[1,2,m,d,D]
    for i,a in enumerate(modes):
        for j,b in enumerate(modes):
            assert expectation(mul(star(a),b),m)==(norms[i] if i==j else 0),(m,i,j)
    U=scale(mul(mul(R,R),S),Q(1,D));Uk=one
    for k in range(1,5):
        Uk=mul(Uk,U);moment=expectation(Uk,m)
        assert moment==Q(factorial(k)*rising(m,2*k),D**k)
        assert expectation(mul(AX,Uk),m)==2*k*moment
        assert expectation(mul(AY,Uk),m)==k*moment
    # Independence would force this covariance to zero; the true value is one
    # before dividing A_Y by sqrt(d). Both surrogates have zero-mean A_Y.
    actual=expectation(mul(AY,U),m)
    independent=Q(0)
    assert actual==1 and independent!=actual
    # The scalar Gaussian in an exact one-point law is not a first-chaos
    # noise coordinate. This wrong coupling must be rejected, even as m grows.
    rho=Q(1,2);original=rho**3;surrogate=(m*rho+rho**3)/(m+1)
    assert surrogate-original==m*rho*(1-rho**2)/(m+1)>0
    if m==128:
        assert surrogate==Q(171,344) and surrogate-original==Q(16,43)
    print('PASS exact joint state:',m,'five-mode Gram; shared quadratic moments; independent and first-grade surrogates rejected')

if __name__=='__main__':
    for m in [2,4,16,128]:verify(m)
