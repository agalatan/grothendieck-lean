#!/usr/bin/env python3
"""Independent exact audit of the complex charged-preprocessor price reduction.

This verifies a symbolic squared-gap identity and rational positivity constants.
The global real-preprocessor Bernstein certificate remains a separate dependency.
"""
from fractions import Fraction as F
from pathlib import Path
import argparse
import json
import sys

if sys.flags.optimize:
    raise SystemExit('Refusing -O/-OO')

N=6

def add(a,b):
    ans=dict(a)
    for k,v in b.items():
        ans[k]=ans.get(k,F(0))+v
    return {k:v for k,v in ans.items() if v}


def scale(a,s):
    return {k:v*s for k,v in a.items() if v*s}


def sub(a,b):
    return add(a,scale(b,F(-1)))


def mul(a,b):
    ans={}
    for ka,va in a.items():
        for kb,vb in b.items():
            k=tuple(x+y for x,y in zip(ka,kb))
            ans[k]=ans.get(k,F(0))+va*vb
    return {k:v for k,v in ans.items() if v}


def sq(a):
    return mul(a,a)


def var(i):
    k=[0]*N;k[i]=1
    return {tuple(k):F(1)}


def require(ok,msg):
    if not ok:
        raise ArithmeticError(msg)


def certificate():
    A,B,C,q,r,x=[var(i) for i in range(N)]
    target=sub(add(A,mul(B,r)),scale(mul(q,sq(r)),F(3)))
    realpart=sub(sub(A,mul(B,x)),mul(q,add(scale(sq(x),F(2)),sq(r))))
    imag2=mul(sub(sq(r),sq(x)),sq(add(C,scale(mul(q,x),F(2)))))
    difference=sub(sub(sq(target),sq(realpart)),imag2)
    bracket=add(sub(sub(sq(B),sq(C)),scale(mul(A,q),F(4))),
                add(scale(mul(mul(q,sub(B,C)),x),F(4)),
                    scale(mul(sq(q),sq(r)),F(8))))
    G=add(scale(mul(B,sub(A,scale(mul(q,sq(r)),F(3)))),F(2)),
          mul(sub(r,x),bracket))
    factored=mul(add(r,x),G)
    require(difference==factored,'Squared-gap polynomial identity failed')
    s3,s5,m=F(606121006,10**9),F(272015495,10**9),F(762296131,10**9)
    cA=1-s3/8-3*s5/64-25*m/1024
    d=s5/4+3*m/16
    lower=2*s3*(cA-3*m/8)-m/4-m*d/16
    require(lower==F(34254220103996142329,64000000000000000000),
            'Independent rational lower constant mismatch')
    require(cA-3*m/8>0 and lower>0,'Positive factor certificate failed')
    require(m-s5-3*m/8>0,'Fifth-coefficient elimination failed')
    require(F(75,64)*m<F(90644,100000),'Neutral multiplier comparison failed')
    return {'status':'PASS_INDEPENDENT_EXACT_COMPLEX_PRICE_REDUCTION',
            'scope':'Squared-gap identity and positivity constants. Combine with real degree-seven Bernstein certificate and written inequalities; no endpoint claim.',
            'symbolic_variables':['A','B','C','q','r','x'],
            'expanded_squared_gap_terms':len(difference),
            'factorization':'target^2-|L0|^2=(r+x)*G after y^2=r^2-x^2',
            'cA':str(cA),'d':str(d),
            'target_positivity_factor':str(cA-3*m/8),
            'G_lower_factor':str(lower),
            'fifth_coefficient_elimination_margin':str(m-s5-3*m/8),
            'neutral_extension_margin':str(F(90644,100000)-F(75,64)*m)}


def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--out',type=Path)
    args=ap.parse_args()
    data=certificate()
    out=json.dumps(data,indent=2)+'\n'
    if args.out:
        args.out.parent.mkdir(parents=True,exist_ok=True)
        args.out.write_text(out)
    print(out,end='')

if __name__=='__main__':
    main()
