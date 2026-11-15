# handoff/codex-4d8a-compensated-joint/matrix/exact_helpers.py — Agent-ID: codex-4d8a; helpers inherited from codex-c7e2
"""Agent-ID: codex-c7e2. Exact scalar certificate for the anisotropic regional theorem.

The polynomial integral enclosures are reproduced from the mathematical
construction of code/all-sector-peak-2026-11-15/verify_region.py at 6bb44599.
All acceptance decisions below use Fraction/integer arithmetic. No dependency.
"""
from fractions import Fraction as F
from math import isqrt
import json

def require(ok,message):
    if not ok:raise ArithmeticError(message)

def add(a,b):
    c=[F(0)]*max(len(a),len(b))
    for j,x in enumerate(a):c[j]+=x
    for j,x in enumerate(b):c[j]+=x
    while len(c)>1 and c[-1]==0:c.pop()
    return c
def scale(a,c):return [x*c for x in a]
def mul(a,b):
    c=[F(0)]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b):c[i+j]+=x*y
    return c
def evaluate(a,t):
    r=F(0)
    for x in reversed(a):r=r*t+x
    return r
def divide(a,c):
    r=a[:];q=[F(0)]*(len(a)-1)
    for j in range(len(a)-1,0,-1):
        q[j-1]=r[j];r[j-1]-=c*q[j-1];r[j]=0
    require(r[0]==0,'exact polynomial division')
    require(add(mul(q,[c,F(1)]),scale(a,-1))==[0],'polynomial identity')
    return q
def laguerre(n,alpha):
    old,new=[F(0)],[F(1)]
    for j in range(n):
        old,new=new,add(mul(new,[-(2*j+alpha),F(1)]),scale(old,-j*(j+alpha-1)))
    return new
def gamma_mean(a,alpha):
    moment=F(1);total=F(0)
    for j,x in enumerate(a):
        if j:moment*=alpha+j-1
        total+=x*moment
    return total
def stieltjes(alpha,c,n=12):
    P=laguerre(n,alpha);d=evaluate(P,-c)**2
    require(d>0,'positive lower denominator')
    low=divide(add([F(1)],scale(mul(P,P),-1/d)),c)
    Q=laguerre(n-1,alpha+1);d=c*evaluate(Q,-c)**2
    require(d>0,'positive upper denominator')
    high=divide(add([F(1)],[F(0)]+scale(mul(Q,Q),1/d)),c)
    lo,hi=gamma_mean(low,alpha),gamma_mean(high,alpha)
    require(0<lo<hi,'Stieltjes interval')
    return Interval(lo,hi)

class Interval:
    def __init__(self,lo,hi=None):self.lo=F(lo);self.hi=F(hi if hi is not None else lo)
    def __add__(self,x):
        if not isinstance(x,Interval):x=Interval(x)
        return Interval(self.lo+x.lo,self.hi+x.hi)
    __radd__=__add__
    def __neg__(self):return Interval(-self.hi,-self.lo)
    def __sub__(self,x):return self+-asint(x)
    def __rsub__(self,x):return asint(x)+-self
    def __mul__(self,x):
        x=asint(x);p=[a*b for a in [self.lo,self.hi] for b in [x.lo,x.hi]]
        return Interval(min(p),max(p))
    __rmul__=__mul__
    def __truediv__(self,x):
        x=asint(x);require(x.lo*x.hi>0,'division through zero')
        return self*Interval(1/x.hi,1/x.lo)
    def json(self):return [str(self.lo),str(self.hi)]
def asint(x):return x if isinstance(x,Interval) else Interval(x)

def atan_inv(q,n=40):
    terms=[F((-1)**j,(2*j+1)*q**(2*j+1)) for j in range(n)]
    a=sum(terms,F(0));nxt=F((-1)**n,(2*n+1)*q**(2*n+1))
    return Interval(min(a,a+nxt),max(a,a+nxt))
def sqrt_interval(x):
    x=asint(x);N=10**40
    lo=F(isqrt(x.lo.numerator*N*N//x.lo.denominator),N)
    hi=F(isqrt(x.hi.numerator*N*N//x.hi.denominator)+1,N)
    require(lo*lo<=x.lo and hi*hi>=x.hi,'sqrt interval')
    return Interval(lo,hi)

def atan_inv(q,n=40):
    terms=[F((-1)**j,(2*j+1)*q**(2*j+1)) for j in range(n)]
    a=sum(terms,F(0));nxt=F((-1)**n,(2*n+1)*q**(2*n+1))
    return Interval(min(a,a+nxt),max(a,a+nxt))
def sqrt_interval(x):
    x=asint(x);N=10**40
    lo=F(isqrt(x.lo.numerator*N*N//x.lo.denominator),N)
    hi=F(isqrt(x.hi.numerator*N*N//x.hi.denominator)+1,N)
    require(lo*lo<=x.lo and hi*hi>=x.hi,'sqrt interval')
    return Interval(lo,hi)

def matrix_check(A,B,C,target):
    require(target>A.hi and target>B.hi,'matrix diagonals')
    ca=max(abs(C.lo),abs(C.hi))
    det=(target-A.hi)*(target-B.hi)-ca*ca
    require(det>0,'matrix determinant')
    return str(det)

