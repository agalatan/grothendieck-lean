#!/usr/bin/env python3
"""Standalone exact rational certificate; python3 -I check_direct_origin.py.
All interval endpoints and matrix computations use fractions.Fraction.
No NumPy/SciPy, sibling imports, or external files.
"""
from fractions import Fraction as F
from math import isqrt
import json
from pathlib import Path

DEN = 10**48

def down(q): return F(q.numerator*DEN//q.denominator,DEN)
def up(q): return -down(-q)
class I:
    def __init__(self,lo,hi=None):
        self.lo=F(lo); self.hi=F(lo if hi is None else hi)
        assert self.lo<=self.hi
    def __add__(self,y):
        y=iv(y);return I(down(self.lo+y.lo),up(self.hi+y.hi))
    __radd__=__add__
    def __neg__(self):return I(-self.hi,-self.lo)
    def __sub__(self,y):return self+-iv(y)
    def __rsub__(self,y):return iv(y)+-self
    def __mul__(self,y):
        y=iv(y);q=[a*b for a in [self.lo,self.hi] for b in [y.lo,y.hi]]
        return I(down(min(q)),up(max(q)))
    __rmul__=__mul__
    def __truediv__(self,y):
        y=iv(y);assert not y.lo<=0<=y.hi
        return self*I(1/y.hi,1/y.lo)
    def __rtruediv__(self,y):return iv(y)/self
    def sqrt(self):
        assert self.lo>=0
        lo=isqrt(self.lo.numerator*DEN*DEN//self.lo.denominator)
        hi=isqrt(self.hi.numerator*DEN*DEN//self.hi.denominator)+1
        assert F(lo,DEN)**2<=self.lo and F(hi,DEN)**2>=self.hi
        return I(F(lo,DEN),F(hi,DEN))
    def out(self):return [str(self.lo),str(self.hi)]
    def show(self):return [float(self.lo),float(self.hi)]
def iv(x):return x if isinstance(x,I) else I(x)

def atan_small(q,N=50):
    q=F(q);p=q;s=F(0)
    for n in range(N+1):
        s+=(-1)**n*p/(2*n+1);p*=q*q
    t=s+(-1)**(N+1)*p/(2*N+3)
    return I(min(s,t),max(s,t))
PI=16*atan_small(F(1,5))-4*atan_small(F(1,239))
SQRTPI=PI.sqrt();SQRT2=I(2).sqrt()

def exp_pos(a,N=120):
    a=F(a);p=F(1);s=p
    for k in range(1,N+1):p*=a/k;s+=p
    first=p*a/(N+1);ratio=a/(N+2);assert 0<=ratio<1
    return I(s,s+first/(1-ratio))

def scalar_integrals(c,b):
    assert c>0 and b>0
    a=c/b;sa=I(a).sqrt();p=F(1);s=F(0);N=80
    for n in range(N+1):
        s+=(-1)**n*p/(2*n+1);p*=a/(n+1)
    t=s+(-1)**(N+1)*p/(2*N+3)
    assert a/(N+2)<1 # omitted erf terms are decreasing
    S=I(min(s,t),max(s,t))
    erfc=1-2*sa/SQRTPI*S;assert erfc.lo>0
    Is=[PI*exp_pos(a)*erfc/(b*sa)]
    gamma=SQRTPI
    for k in range(3):
        Is.append((gamma-c*Is[-1])/b);gamma=gamma*F(2*k+1,2)
    assert all(x.lo>0 and x.hi-x.lo<F(1,10**38) for x in Is)
    return Is

def matmul(A,B):return [[sum(a*b for a,b in zip(row,col)) for col in zip(*B)] for row in A]
def transpose(A):return list(map(list,zip(*A)))
def madd(A,B,sign=1):return [[a+sign*b for a,b in zip(r,s)] for r,s in zip(A,B)]
def mscale(a,A):return [[a*x for x in row] for row in A]
def eye(n):return [[F(i==j) for j in range(n)]for i in range(n)]
def inv(A):
    n=len(A);T=[list(row)+e for row,e in zip(A,eye(n))]
    for k in range(n):
        assert T[k][k]!=0
        p=T[k][k];T[k]=[x/p for x in T[k]]
        for i in range(n):
            if i!=k:
                p=T[i][k];T[i]=[a-p*b for a,b in zip(T[i],T[k])]
    return [row[n:] for row in T]
def ldl(A):
    n=len(A);T=[list(row) for row in A];piv=[]
    assert A==transpose(A)
    for k in range(n):
        p=T[k][k];assert p>0,('nonpositive pivot',k,float(p));piv.append(p)
        for i in range(k+1,n):
            for j in range(k+1,n):T[i][j]-=T[i][k]*T[k][j]/p
    return piv

def upper(A):
    # If |Atrue-Acenter| entrywise <= radii, operator norm <= max row sum.
    center=[[(v.lo+v.hi)/2 for v in row]for row in A]
    rad=max(sum((v.hi-v.lo)/2 for v in row)for row in A)
    for i in range(len(A)):center[i][i]+=rad
    return center

def diag(vals):return [[v if i==j else F(0) for j in range(len(vals))]for i,v in enumerate(vals)]

