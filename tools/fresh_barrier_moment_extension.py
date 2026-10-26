#!/usr/bin/env python3
"""Exact rational examples for the AMMP/Stieltjes moment-extension lemma.

This checks finite prefixes of the written induction; it is not a Gaussian
cubic realizability certificate or a proof of infinite moment growth bounds.
"""
import argparse
from fractions import Fraction as Q
import importlib.util
import json
from math import comb
from pathlib import Path
import sys

if sys.flags.optimize:
    raise SystemExit("Exact moment-extension replay refuses Python -O/-OO: assertions are proof checks.")
sys.dont_write_bytecode=True

spec=importlib.util.spec_from_file_location("fresh_spectral",
    Path(__file__).with_name("fresh_barrier_radial_spectral.py"))
S=importlib.util.module_from_spec(spec)
spec.loader.exec_module(S)


def angular(r):
    return Q(comb(2*r,r),2**r)


def real_moment(m,n):
    return Q(0) if n%2 else angular(n//2)*m[n//2]


def full_matrix(m,k):
    return [[(Q(k)-(Q(i*j,i+j-1) if i+j!=1 else Q(0)))
             *real_moment(m,i+j) for j in range(k+1)] for i in range(k+1)]


def hankel(m,r,shift=0):
    return [[m[i+j+shift] for j in range(r+1)] for i in range(r+1)]


def positive_definite(A):
    ok,_,rank=S.psd_or_witness(A)
    return ok and rank==len(A)


def quadratic_inverse(A,b):
    if not positive_definite(A):
        raise ValueError("Schur complement requires a positive-definite leading block")
    n=len(b)
    C=[list(row)+[z] for row,z in zip(A,b)]
    for i in range(n):
        pivot=C[i][i]
        assert pivot>0
        for j in range(i+1,n):
            t=C[j][i]/pivot
            C[j]=[a-t*c for a,c in zip(C[j],C[i])]
    x=[Q(0)]*n
    for i in reversed(range(n)):
        x[i]=(C[i][-1]-sum(C[i][j]*x[j] for j in range(i+1,n)))/C[i][i]
    return sum(a*c for a,c in zip(b,x))


def validate_base(m):
    if len(m)!=4 or m[0]!=1 or m[1]<=0:
        raise ValueError("base must have four moments, m0=1 and m1>0")
    if m[2]<2*m[1]**2 or m[3]<Q(3,2)*m[2]**2/m[1]:
        raise ValueError("base must satisfy M2 and M3: m2>=2*m1^2 and m3>=3*m2^2/(2*m1)")
    assert positive_definite(hankel(m,1,0))
    assert positive_definite(hankel(m,1,1))
    assert S.psd_or_witness(full_matrix(m,2))[0]
    assert S.psd_or_witness(full_matrix(m,3))[0]


def extend(m,max_degree):
    validate_base(m)
    records=[]
    for k in range(4,max_degree+1):
        previous=full_matrix(m,k-1)
        H=[[real_moment(m,i+j) for j in range(k)] for i in range(k)]
        assert positive_definite(H)
        A=[[previous[i][j]+H[i][j] for j in range(k)] for i in range(k)]
        b=[(Q(k)-(Q(i*k,i+k-1) if i+k!=1 else Q(0)))
           *real_moment(m,i+k) for i in range(k)]
        c=Q(k*(k-1),2*k-1)*angular(k)
        assert c>0
        spectral_threshold=quadratic_inverse(A,b)/c
        r=k//2
        shift=k%2
        B=hankel(m,r-1,shift)
        v=[m[r+i+shift] for i in range(r)]
        stieltjes_threshold=quadratic_inverse(B,v)
        threshold=max(spectral_threshold,stieltjes_threshold)
        chosen=Q(threshold.numerator//threshold.denominator+1)
        assert chosen>spectral_threshold and chosen>stieltjes_threshold
        m.append(chosen)
        M=full_matrix(m,k)
        assert [[M[i][j] for j in range(k)] for i in range(k)]==A
        assert positive_definite(M)
        assert positive_definite(hankel(m,r,shift))
        records.append({"degree":k,"spectral_threshold":str(spectral_threshold),
            "Stieltjes_threshold":str(stieltjes_threshold),"chosen_moment":str(chosen),
            "Mk_positive_definite_exact":True,"new_Stieltjes_block_positive_definite_exact":True})
    return records


def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--base",default="1,1,2,6")
    ap.add_argument("--max-degree",type=int,default=10)
    ap.add_argument("--out",required=True,type=Path)
    args=ap.parse_args()
    if args.max_degree<4:
        ap.error("--max-degree must be at least 4")
    try:
        m=list(map(Q,args.base.split(',')))
        validate_base(m)
    except (ValueError,ZeroDivisionError) as exc:
        ap.error(str(exc))
    original=list(m)
    records=extend(m,args.max_degree)
    # Exact counterexample to omitting the base M2 assumption.
    wrong=[Q(1),Q(1),Q(3,2),Q(4)]
    assert positive_definite(hankel(wrong,1,0))
    assert positive_definite(hankel(wrong,1,1))
    assert positive_definite(full_matrix(wrong,3))
    wrongM2=S.psd_or_witness(full_matrix(wrong,2))
    assert not wrongM2[0]
    result={"format":"fresh-barrier-moment-extension/v1",
        "scope":__doc__,"base":list(map(str,original)),"moments":list(map(str,m)),
        "steps":records,
        "missing_M2_counterexample":{"base":list(map(str,wrong)),
            "strict_initial_Stieltjes":True,"M3_positive_definite":True,
            "M2_not_positive_semidefinite":True},
        "moment_growth_bounds_claimed":False,"objective_preservation_claimed":False}
    args.out.parent.mkdir(parents=True,exist_ok=True)
    args.out.write_text(json.dumps(result,indent=2)+"\n")
    print("PASS exact extension through",args.max_degree,"moments",list(map(str,m)))


if __name__=="__main__":
    main()
