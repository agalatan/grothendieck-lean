#!/usr/bin/env python3
"""Independent exact Gaussian-polynomial replay of the quadratic contraction.

Uses rational complex coefficients and E[z^a conj(z)^b]=1_(a=b) prod(a!).
This checks the contraction indices and counterterms without sampling or numpy.
"""
from fractions import Fraction as F
from math import factorial
from itertools import product

Z=(F(0),F(0)); ONE=(F(1),F(0)); N=2


def cadd(a,b): return a[0]+b[0],a[1]+b[1]
def cmul(a,b): return a[0]*b[0]-a[1]*b[1],a[0]*b[1]+a[1]*b[0]
def conj(a): return a[0],-a[1]
def neg(a): return -a[0],-a[1]


def add(P,Q):
    out=dict(P)
    for k,v in Q.items(): out[k]=cadd(out.get(k,Z),v)
    return {k:v for k,v in out.items() if v!=Z}


def scale(c,P): return {k:cmul(c,v) for k,v in P.items() if cmul(c,v)!=Z}


def mul(P,Q):
    out={}
    for a,c in P.items():
        for b,d in Q.items():
            k=tuple(x+y for x,y in zip(a,b))
            out[k]=cadd(out.get(k,Z),cmul(c,d))
    return {k:v for k,v in out.items() if v!=Z}


def var(i,anti=False):
    k=[0]*(2*N); k[i+(N if anti else 0)]=1
    return {tuple(k):ONE}


def constant(c): return {(0,)*(2*N):c} if c!=Z else {}


def expectation(P):
    out=Z
    for e,c in P.items():
        if e[:N]==e[N:]:
            m=1
            for x in e[:N]: m*=factorial(x)
            out=cadd(out,cmul((F(m),F(0)),c))
    return out


def pairing(P,Q):
    conjugate={e[N:]+e[:N]:conj(c) for e,c in P.items()}
    return expectation(mul(conjugate,Q))


def wick(j,l,i):
    W=mul(mul(var(j),var(l)),var(i,True))
    if i==j: W=add(W,scale(neg(ONE),var(l)))
    if i==l: W=add(W,scale(neg(ONE),var(j)))
    return W


def main():
    eps=F(149,200)
    f={}
    for l in range(N): f=add(f,scale((F(l+1,3),F(l-1,5)),var(l)))
    cubic={}
    for j,l,i in product(range(N),repeat=3):
        cubic=add(cubic,scale((F(1+j+2*l,7),F(i-j,11)),wick(j,l,i)))
    f=add(f,cubic)
    pf=[pairing(var(j),f) for j in range(N)]
    qf={(j,l,i):pairing(wick(j,l,i),f) for j,l,i in product(range(N),repeat=3)}
    matrices=[[[ONE,Z],[Z,Z]],[[Z,ONE],[ONE,Z]],
              [[Z,(F(0),F(1))],[(F(0),F(-1)),Z]],
              [[(F(1,2),F(0)),(F(1,4),F(1,5))],
               [(F(1,4),F(-1,5)),(F(-1,3),F(0))]]]
    checks=0
    for M in matrices:
        A={}
        for i,j in product(range(N),repeat=2):
            A=add(A,scale(M[i][j],mul(var(i,True),var(j))))
            if i==j: A=add(A,constant(neg(M[i][i])))
        for l in range(N):
            direct=pairing(var(l),mul(f,A))
            predicted=Z
            for j in range(N): predicted=cadd(predicted,cmul(conj(M[l][j]),pf[j]))
            for i,j in product(range(N),repeat=2):
                predicted=cadd(predicted,cmul(conj(M[i][j]),qf[j,l,i]))
            assert direct==predicted, (M,l,direct,predicted)
            # Decode exactly from the cubic image h=Tf, without high response grades.
            decoded=Z
            for j in range(N): decoded=cadd(decoded,cmul(conj(M[l][j]),pf[j]))
            for i,j in product(range(N),repeat=2):
                image_q=cmul((-eps,F(0)),qf[j,l,i])
                decoded=cadd(decoded,cmul(conj(M[i][j]),cmul((-1/eps,F(0)),image_q)))
            assert decoded==direct
            checks+=1
    for k,expected in [(4,9),(6,265),(8,14833)]:
        moment=sum(F(factorial(k)*(-1)**(k-j),factorial(k-j)) for j in range(k+1))
        assert moment==expected
    print(f'PASS {checks} complex rational contraction/decode identities, including imaginary Hermitian entries')
    print('PASS centered exponential moments 9, 265, 14833')
    print('Scope: exact polynomial checks; the universal Gaussian projection argument is in the TeX proof.')


if __name__=='__main__': main()
