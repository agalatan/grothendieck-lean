"""Small standard-library rational polynomial checker (ascending powers)."""
from fractions import Fraction as Q
from math import comb

def add(*ps):
    z=[Q(0)]*max(map(len,ps))
    for p in ps:
        for i,c in enumerate(p):z[i]+=c
    return z
def mul(p,q):
    z=[Q(0)]*(len(p)+len(q)-1)
    for i,a in enumerate(p):
        for j,b in enumerate(q):z[i+j]+=a*b
    return z
def scale(p,c):return [x*c for x in p]
def shift(p,k):return [Q(0)]*k+list(p)
def affine(p,a,d):
    return [sum(p[j]*comb(j,i)*a**(j-i)*d**i for j in range(i,len(p))) for i in range(len(p))]
def bernstein(p,a,b):
    p=affine(p,a,b-a);n=len(p)-1
    return [sum(p[j]*Q(comb(k,j),comb(n,j)) for j in range(k+1)) for k in range(n+1)]
def positive(p,a,b,depth=18):
    cs=bernstein(p,a,b)
    if min(cs)>=0:return True
    if cs[0]<0 or cs[-1]<0 or depth==0:return False
    mid=(a+b)/2
    return positive(p,a,mid,depth-1) and positive(p,mid,b,depth-1)
def tail_positive(p,a):return min(affine(p,a,Q(1)))>=0
def evaluate(p,x):
    y=Q(0)
    for c in reversed(p):y=y*x+c
    return y

def cut_numerator(A,B,e,beta,t,lam,mu,nu):
    f=[-(A+beta)/2,-B/2+2*t+lam/3]
    ug=[e/2,Q(0),-B/4+t+mu/3-nu/2]
    aa=[e-A,A-B,B/2]
    return add(scale(shift(mul(f,f),2),1/lam),scale(mul(ug,ug),1/mu),shift(aa,2),[0,0,-2*(nu/3-2*t),0,nu/3-2*t])

def test_pieces(knots,values):
    integral=Q(0);out=[]
    for a,b,fa,fb in zip(knots,knots[1:],values,values[1:]):
        B=(fb-fa)/(b-a);A=fa-B*a;e=integral-A*a-B*a*a/2
        out.append((a,b,A,B,e))
        integral+=(b-a)*(fa+fb)/2
    a=knots[-1];A=values[-1]
    out.append((a,None,A,Q(0),integral-A*a))
    return out
