# /workspace/scratch/f307e93b3610/codex-c7e2-research/boundary/verify_anisotropic.py
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

def matrix_check(A,B,C,target):
    require(target>A.hi and target>B.hi,'matrix diagonals')
    ca=max(abs(C.lo),abs(C.hi))
    det=(target-A.hi)*(target-B.hi)-ca*ca
    require(det>0,'matrix determinant')
    return str(det)

def main():
    a,b,p=F(699,1250),F(179,1250),F(2500,1891)
    pi=16*atan_inv(5)-4*atan_inv(239)
    rtpi=sqrt_interval(pi);rt2=sqrt_interval(2)
    ints=[];gam=F(1)
    for k in range(4):
        if k:gam*=F(2*k-1,2)
        ints.append(rtpi*gam/b*stieltjes(F(2*k+1,2),a/b))
    I0,I1,I2,I3=ints
    r=F(3,4)*I0-p
    Q=I1-p;P=F(3,4)*I1-p;nu=(I3-4*I2+4*I1)/2-p
    require(r.hi<F(413,500),'remote coefficient')
    require(Q.hi<-F(16,125),'Q coefficient')
    require(P.hi<-F(213,500),'P coefficient')
    require(nu.hi<-F(33,100),'nu coefficient')
    # Retained trial xi=-(2/5)r_A-(7/100)r_B.
    s,t=F(2,5),F(7,100)
    A=s*s+F(3,4)*(I2+2*(s-1)*I1+(s-1)**2*I0)-p
    B=t*t+F(3,4)*(t*t*I0+I2/2)-rt2/4*t*I1-p
    C=s*t+F(3,4)*t*(I1+(s-1)*I0)-rt2/8*(I2+(s-1)*I1)
    det=matrix_check(A,B,C,-F(11,40))
    # Add the orthogonal visible first-chaos trial alpha Z, alpha=-(2/7)nu.
    # On frequency zero, the anisotropic form is <= the isotropic square.
    lam=F(-2,7)
    retained_nu=(1+I1)*(lam*lam)-rt2*(I2-2*I1)*lam+(I3-4*I2+4*I1)/2-p
    require(retained_nu.hi<-F(249,500),'retained visible cubic coefficient')
    # Raw K has the same scalar coefficients and s=t=0.
    RA=F(3,4)*(I2-2*I1+I0)-p
    RB=F(3,8)*I2-p
    RC=-rt2/8*(I2-I1)
    rawdet=matrix_check(RA,RB,RC,F(37,200))
    B0=F(387,500)*rtpi
    Slo=F(13739535256614,10**13) # Existing reviewed peak benchmark certificate.
    exact_budget=F(1037,500000) # Guarantees <= S (no allowance).
    approximate_budget=F(1087,500000) # Guarantees < S+1e-4.
    reserve=Slo-B0.hi-exact_budget
    require(reserve>F(245,10**9),'strict benchmark reserve')
    require(Slo+F(1,10000)-B0.hi-approximate_budget==reserve,'shared reserve')
    print(json.dumps(dict(agent='codex-c7e2',status='PASS: exact arithmetic for a regional theorem, not full K',
        integral_enclosures=[x.json() for x in ints],
        retained_matrix=[A.json(),B.json(),C.json()],retained_determinant_lower=det,
        raw_matrix=[RA.json(),RB.json(),RC.json()],raw_determinant_lower=rawdet,
        retained_nu=retained_nu.json(),
        coefficients=dict(remote='413/500',retained_AB='-11/40',raw_AB='37/200',Q='-16/125',P='-213/500',retained_nu='-249/500',raw_nu='-33/100'),
        exact_K_region_budget=str(exact_budget),approximate_region_budget=str(approximate_budget),
        inherited_S_lower=str(Slo),strict_reserve=str(reserve)),indent=2))

if __name__=='__main__':main()
