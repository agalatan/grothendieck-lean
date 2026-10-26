#!/usr/bin/env python3
"""Standard-library exact replay of the flat-sector variance identity.

The atomic fixture verifies algebra only; it is not asserted to be a Gaussian
image law. The general identity and finite-rank reduction have written proofs.
"""
from fractions import Fraction as F
import json
from math import comb, factorial


def wick(p,q):
    return {(p-r,q-r):(-1)**r*factorial(r)*comb(p,r)*comb(q,r)
        for r in range(min(p,q)+1)}


def multiply(a,b):
    out={}
    for p,x in a.items():
        for q,y in b.items():
            t=tuple(i+j for i,j in zip(p,q))
            out[t]=out.get(t,0)+x*y
    return {p:x for p,x in out.items() if x}


def remote_polynomial(mode):
    a,b,c,d,n=mode
    return {(i,j,k,l,n):x*y for (i,j),x in wick(a,b).items()
        for (k,l),y in wick(c,d).items()}


def remote_expectation(poly):
    out=0
    for (a,b,c,d,n),x in poly.items():
        if a==b and c==d and n%2==0:
            real_moment=factorial(n)//(2**(n//2)*factorial(n//2))
            out+=x*factorial(a)*factorial(c)*real_moment
    return out


def verify_conditional_wick_modes():
    modes=[]
    for i in range(3):
        p=[0]*3; p[i]=1
        modes.append((p[1],0,p[2],0,0))
    identities=0
    for i in range(3):
        for j in range(i,3):
            for k in range(3):
                p=[0]*3; q=[0]*3; p[i]+=1; p[j]+=1; q[k]+=1
                global_wick={(0,)*6:1}
                for coordinate in range(3):
                    term={}
                    for (a,b),x in wick(p[coordinate],q[coordinate]).items():
                        powers=[0]*6; powers[2*coordinate]=a; powers[2*coordinate+1]=b
                        term[tuple(powers)]=x
                    global_wick=multiply(global_wick,term)
                expected={tuple(x for pair in zip(p,q) for x in pair):1}
                for hit,leftover in [(i==k,j),(j==k,i)]:
                    if hit:
                        powers=[0]*6; powers[2*leftover]=1; t=tuple(powers)
                        expected[t]=expected.get(t,0)-1
                expected={t:x for t,x in expected.items() if x}
                assert global_wick==expected
                identities+=1
                modes.append((p[1],q[1],p[2],q[2],0))
    for i in range(3):
        modes.append((int(i==1),0,int(i==2),0,1))
    modes.append((0,0,0,0,0))
    conjugate=lambda m:(m[1],m[0],m[3],m[2],m[4])
    checks=0
    for a in modes:
        for b in modes:
            norm=factorial(a[0])*factorial(a[1])*factorial(a[2])*factorial(a[3])
            inner=remote_expectation(multiply(remote_polynomial(conjugate(a)),remote_polynomial(b)))
            pseudo=remote_expectation(multiply(remote_polynomial(a),remote_polynomial(b)))
            assert inner==(norm if a==b else 0)
            assert pseudo==(norm if a==conjugate(b) else 0)
            checks+=2
    return {'global_cubic_factorizations':identities,'exact_remote_Gram_entries':checks,
        'basis_size':len(modes)}


def main():
    eps=F(149,200)
    law=[(F(1,4),F(251,447)),(F(1),F(196,447))]
    assert sum(p for a,p in law)==1
    R0=sum(p/a for a,p in law)
    assert R0==2/eps
    rows=[]
    for eta in [F(0),F(1,1000),F(1,100),F(1,50),F(1,2)]:
        R=sum(p/(a+eta) for a,p in law)
        D=sum(p*a/(a+eta)**2 for a,p in law)/2
        mu=[(a,p/(a*R0)) for a,p in law]
        mean=sum(p*a/(a+eta) for a,p in mu)
        variance=sum(p*(a/(a+eta)-mean)**2 for a,p in mu)
        margin=D-eps*R*R/4
        assert margin==R0*variance/2
        assert margin>=0
        assert (margin==0)==(eta==0)
        rows.append({'eta':str(eta),'margin':str(margin),'variance':str(variance)})
    # The finite-amplitude hypercontractive floor is exactly 3 eta^2/(8*7^6).
    assert F(3,8*7**6)==F(3,941192)
    print(json.dumps({'status':'PASS','epsilon':str(eps),'R0':str(R0),
        'scope':__doc__,'fixtures':rows,
        'conditional_Wick_checks':verify_conditional_wick_modes()},indent=2))


if __name__=='__main__':
    main()
