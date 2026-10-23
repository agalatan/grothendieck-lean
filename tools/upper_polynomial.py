"""Finite bivariate upper-kernel composition and its polynomial Jacobians.

Numerical proposal utilities. The final arithmetic is independently replayed
with Arb and the Lean fixed-point checker; no optimizer is trusted.
"""
from fractions import Fraction as F
import numpy as np

def table_head(data,P,Q,K=251,jacobian=False):
    entries=data['energies'];nmax=max(n for n,m,e in entries);mmax=max(m for n,m,e in entries)
    pp=[np.r_[1.,np.zeros(K-1)]];qq=[pp[0].copy()]
    for _ in range(nmax):pp.append(np.convolve(pp[-1],P)[:K])
    for _ in range(mmax):qq.append(np.convolve(qq[-1],Q)[:K])
    rows=[np.zeros(K) for _ in range(mmax+1)]
    rp=[np.zeros(K) for _ in rows];rq=[np.zeros(K) for _ in rows]
    for n,m,e in entries:
        val=float(F(e));s=n//2
        rows[m][s:]+=val*pp[n][:K-s]
        if jacobian and n:rp[m][s:]+=n*val*pp[n-1][:K-s]
        if jacobian and m:rq[m][s:]+=m*val*pp[n][:K-s]
    value=np.zeros(K);jp=value.copy();jq=value.copy()
    for m in range(mmax+1):
        s=m//2
        value[s:]+=np.convolve(rows[m],qq[m])[:K-s]
        if jacobian:
            jp[s:]+=np.convolve(rp[m],qq[m])[:K-s]
            if m:jq[s:]+=np.convolve(rq[m],qq[m-1])[:K-s]
    return (value,jp,jq) if jacobian else value

def shifted_columns(poly,indices,length,K=251):
    out=np.zeros((length,len(indices)))
    for j,k in enumerate(indices):out[k:K,j]=poly[:K-k]
    return out

def feasible_rationals(values,nonpositive=False):
    q=[F(str(float(x))) for x in values]
    if nonpositive:q=[min(F(0),x) for x in q]
    scale=max(F(1),sum(map(abs,q)))
    q=[x/scale for x in q]
    assert sum(map(abs,q))<=1
    return list(map(str,q))
