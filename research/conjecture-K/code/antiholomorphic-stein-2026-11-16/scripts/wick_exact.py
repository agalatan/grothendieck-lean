"""Exact Wick calculus for complex Gaussian polynomials (standard library only).

Coefficients are Gaussian rationals (pairs of Fractions). A polynomial is a dict
{(alpha, beta): coeff} for the monomial y^alpha * conj(y)^beta, with y_1..y_n independent
standard complex Gaussians (E|y_j|^2 = 1). E[y^alpha conj(y)^beta] = delta_{alpha,beta} alpha!.
Chaos projections: the coefficient of the Wick monomial :y^alpha conj(y)^beta: in F equals
E[d^alpha dbar^beta F] / (alpha! beta!)   (Gaussian integration by parts; d = d/dy, dbar = d/dconj(y)),
so ||P_{p,q} F||^2 = sum_{|alpha|=p,|beta|=q} |E[d^alpha dbar^beta F]|^2 / (alpha! beta!).
"""
from fractions import Fraction as Fr
from math import factorial, prod
from itertools import product
from collections import defaultdict

class G:
    __slots__=("r","i")
    def __init__(s,r=0,i=0): s.r=Fr(r); s.i=Fr(i)
    def __add__(s,o): o=_g(o); return G(s.r+o.r,s.i+o.i)
    __radd__=__add__
    def __sub__(s,o): o=_g(o); return G(s.r-o.r,s.i-o.i)
    def __rsub__(s,o): return _g(o)-s
    def __mul__(s,o): o=_g(o); return G(s.r*o.r-s.i*o.i,s.r*o.i+s.i*o.r)
    __rmul__=__mul__
    def __neg__(s): return G(-s.r,-s.i)
    def conj(s): return G(s.r,-s.i)
    def abs2(s): return s.r*s.r+s.i*s.i
    def __eq__(s,o): o=_g(o); return s.r==o.r and s.i==o.i
    def iszero(s): return s.r==0 and s.i==0
    def __repr__(s): return f"({s.r}+{s.i}i)"
def _g(x): return x if isinstance(x,G) else G(x,0)

def clean(P): return {k:v for k,v in P.items() if not v.iszero()}
def mul(P,Q):
    R=defaultdict(G)
    for (a1,b1),c1 in P.items():
        for (a2,b2),c2 in Q.items():
            k=(tuple(x+y for x,y in zip(a1,a2)),tuple(x+y for x,y in zip(b1,b2)))
            R[k]=R[k]+c1*c2
    return clean(R)
def lin(*pairs):
    R=defaultdict(G)
    for c,P in pairs:
        c=_g(c)
        for k,v in P.items(): R[k]=R[k]+c*v
    return clean(R)
def conj(P): return {(b,a):v.conj() for (a,b),v in P.items()}
def E(P):
    s=G()
    for (a,b),v in P.items():
        if a==b: s=s+v*prod(factorial(x) for x in a)
    return s
def d(P,j):
    R=defaultdict(G)
    for (a,b),v in P.items():
        if a[j]:
            a2=list(a);a2[j]-=1;k=(tuple(a2),b);R[k]=R[k]+v*a[j]
    return clean(R)
def db(P,j):
    R=defaultdict(G)
    for (a,b),v in P.items():
        if b[j]:
            b2=list(b);b2[j]-=1;k=(a,tuple(b2));R[k]=R[k]+v*b[j]
    return clean(R)
def const(n,c): return {((0,)*n,(0,)*n):_g(c)} if not _g(c).iszero() else {}
def multi(n,deg):
    if n==1: yield (deg,); return
    for k in range(deg+1):
        for rest in multi(n-1,deg-k): yield (k,)+rest
def proj_norm2(P,n,p,q):
    """||P_{p,q} P||^2 exactly."""
    tot=Fr(0)
    for al in multi(n,p):
        for be in multi(n,q):
            F=P
            for j in range(n):
                for _ in range(al[j]): F=d(F,j)
                for _ in range(be[j]): F=db(F,j)
            c=E(F)
            tot+=c.abs2()/(prod(factorial(x) for x in al)*prod(factorial(x) for x in be))
    return tot
def wick_cubic(n,f):
    """q = sum_{a,b,c} f[a][b][c] :y_a y_b conj(y_c):, f symmetric in a,b (Gaussian rationals)."""
    q=defaultdict(G); z=(0,)*n
    for a in range(n):
        for b in range(n):
            for c in range(n):
                v=f[a][b][c]
                if v.iszero(): continue
                al=[0]*n;al[a]+=1;al[b]+=1;be=[0]*n;be[c]+=1
                k=(tuple(al),tuple(be)); q[k]=q[k]+v
                if a==c:
                    e=[0]*n;e[b]=1;k=(tuple(e),z);q[k]=q[k]-v
                if b==c:
                    e=[0]*n;e[a]=1;k=(tuple(e),z);q[k]=q[k]-v
    return clean(q)
def random_f(n,rng,den=7,size=5):
    f=[[[G() for _ in range(n)] for _ in range(n)] for _ in range(n)]
    for a in range(n):
        for b in range(a,n):
            for c in range(n):
                v=G(Fr(rng.randint(-size,size),rng.randint(1,den)),Fr(rng.randint(-size,size),rng.randint(1,den)))
                if rng.random()<0.25: v=G()
                f[a][b][c]=v; f[b][a][c]=v
    return f
