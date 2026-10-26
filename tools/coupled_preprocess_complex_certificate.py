#!/usr/bin/env python3
"""Exact analytic extension of the separable certificate to complex p.

Requires the sibling coupled_preprocess_mixture_certificate.py. Uses only
standard-library rational polynomial arithmetic; no numerical optimization.
"""
import argparse
from fractions import Fraction as Q
import hashlib
import json
from pathlib import Path
import sys
from coupled_preprocess_mixture_certificate import certificate as real_certificate


def require(condition,message):
    if not condition:
        raise ArithmeticError(message)


def add(a,b):
    c=dict(a)
    for monomial,x in b.items():
        c[monomial]=c.get(monomial,Q(0))+x
    return {k:v for k,v in c.items() if v}


def scale(a,q):
    return {k:v*q for k,v in a.items() if v*q}


def mul(a,b):
    c={}
    for i,x in a.items():
        for j,y in b.items():
            ij=tuple(v+w for v,w in zip(i,j))
            c[ij]=c.get(ij,Q(0))+x*y
    return {k:v for k,v in c.items() if v}


def power(a,n):
    length=len(next(iter(a)))
    p={(0,)*length:Q(1)}
    for _ in range(n):
        p=mul(p,a)
    return p


def variable(n,j):
    degree=[0]*n;degree[j]=1
    return {tuple(degree):Q(1)}


def cadd(a,b):
    return add(a[0],b[0]),add(a[1],b[1])


def cmul(a,b):
    return add(mul(a[0],b[0]),scale(mul(a[1],b[1]),Q(-1))),add(mul(a[0],b[1]),mul(a[1],b[0]))


def cscale(a,q):
    return scale(a[0],q),scale(a[1],q)


def series_mul(a,b):
    out={}
    for i,x in a.items():
        for j,y in b.items():
            if i+j<=7:
                out[i+j]=cadd(out.get(i+j,({},{})),cmul(x,y))
    return {k:v for k,v in out.items() if v!=({},{})}


def physical_expansion_check(s3,s5,m):
    # Seven real indeterminates: a, Re b, Im b, Re c, Im c, Re d, Im d.
    a,x,y,u,v,w,s=[variable(7,j) for j in range(7)]
    one={(0,)*7:Q(1)}
    p={1:(a,{}),3:(x,y),5:(u,v),7:(w,s)}
    pbar={degree:(value[0],scale(value[1],Q(-1))) for degree,value in p.items()}
    product=series_mul(p,pbar)
    term=p;phase={}
    for k,weight in enumerate([Q(1),Q(1,8),Q(3,64),Q(25,1024)]):
        if k:
            term=series_mul(term,product)
        for degree,value in term.items():
            phase[degree]=cadd(phase.get(degree,({},{})),cscale(value,weight))
    price=({}, {})
    for degree,weight in zip([1,3,5,7],[Q(1),-s3,-s5,-m]):
        price=cadd(price,cscale(phase.get(degree,({},{})),weight))
    A=add(add(add(a,scale(power(a,3),-s3/8)),
              scale(power(a,5),-3*s5/64)),scale(power(a,7),-25*m/1024))
    B=add(add(scale(one,s3),scale(power(a,2),3*s5/8)),scale(power(a,4),15*m/64))
    C=add(add(scale(one,s3),scale(power(a,2),s5/8)),scale(power(a,4),3*m/64))
    q=scale(a,m/8)
    cr=add(scale(one,-s5),scale(power(a,2),-3*m/8))
    ci=add(scale(one,-s5),scale(power(a,2),-m/8))
    expected_real=add(add(add(add(A,scale(mul(B,x),Q(-1))),
                        scale(mul(q,add(scale(power(x,2),Q(3)),power(y,2))),Q(-1))),
                        mul(cr,u)),scale(w,-m))
    expected_imag=add(add(add(scale(mul(C,y),Q(-1)),
                              scale(mul(q,mul(x,y)),Q(-2))),mul(ci,v)),scale(s,-m))
    require(price==(expected_real,expected_imag),
            'Complex physical phase coefficient expansion failed')
    return True


def angular_factorization_check():
    A,B,C,q,r,x=[variable(6,j) for j in range(6)]
    real=add(add(A,scale(mul(B,x),Q(-1))),
             scale(mul(q,add(scale(power(x,2),Q(2)),power(r,2))),Q(-1)))
    imag_squared=mul(add(power(r,2),scale(power(x,2),Q(-1))),
                     power(add(C,scale(mul(q,x),Q(2))),2))
    star=add(add(A,mul(B,r)),scale(mul(q,power(r,2)),Q(-3)))
    gap=add(add(power(star,2),scale(power(real,2),Q(-1))),scale(imag_squared,Q(-1)))
    first=scale(mul(B,add(A,scale(mul(q,power(r,2)),Q(-3)))),Q(2))
    bracket=add(add(add(add(power(B,2),scale(power(C,2),Q(-1))),
                    scale(mul(A,q),Q(-4))),
                    scale(mul(mul(q,add(B,scale(C,Q(-1)))),x),Q(4))),
                    scale(mul(power(q,2),power(r,2)),Q(8)))
    G=add(first,mul(add(r,scale(x,Q(-1))),bracket))
    require(gap==mul(add(r,x),G),'Angular square-gap factorization failed')
    return True


def certificate():
    s3=Q(606121006,10**9);s5=Q(272015495,10**9);m=Q(762296131,10**9)
    cA=1-s3/8-3*s5/64-25*m/1024
    d=s5/4+3*m/16
    c_elimination_slack=m-s5-3*m/8
    positive_radial_slack=cA-3*m/8
    angular_gap=2*s3*positive_radial_slack-m/4-m*d/16
    require(s3>0 and s5>0 and m>0,'Negative dual sign requirement failed')
    require(c_elimination_slack>0,'Eliminating the complex c coefficient failed')
    require(positive_radial_slack>0,'Comparison magnitude might be negative')
    require(angular_gap>0,'Angular comparison failed')
    require(physical_expansion_check(s3,s5,m),'Physical expansion check failed')
    require(angular_factorization_check(),'Angular factorization check failed')
    base=real_certificate()
    return {'status':'EXACT_COMPLEX_CHARGED_PREPROCESSOR_EXTENSION',
        'scope':'Arbitrary finite/countable convex mixtures of Phi_phys(p)*K, p any complex odd scalar Wiener contraction, K any complex even Wiener contraction. Phi_phys(p) means (pi/4)*p*sum_k hypergeometric_coefficient_k*(p*p_sharp)^k, with p_sharp coefficientwise complex conjugate. This is the real-axis expansion of the physical complex Gaussian phase kernel.',
        'same_full_score_strict_decimal_ceiling_rational':base['full_score_strict_decimal_ceiling_rational'],
        'c_coefficient_elimination_positive_slack':str(c_elimination_slack),
        'positive_comparison_magnitude_slack':str(positive_radial_slack),
        'angular_gap_positive_lower_coefficient':str(angular_gap),
        'angular_gap_positive_lower_coefficient_float':float(angular_gap),
        'physical_coefficient_expansion_symbolically_verified':True,
        'angular_square_gap_identity_symbolically_verified':True,
        'proof':'Rotate p by a constant phase to make its leading coefficient a>=0; absolute price is unchanged. Let b=x+iy, r=|b|, a+r<=1. Eliminate complex c,d by triangle because c real-linear map norm<m. The remaining price is bounded by |L0|+m*(1-a-r). The exact squared gap to real b=-r factors as (r+x)*G. Under the simplex constraints, G>=a*angular_gap>0 using ar<=1/4 and a^2*r^2<=1/16. The remaining maximum is a real preprocessor patch already controlled by the sibling Bernstein certificate. The neutral multiplier and convex mixture argument then applies unchanged.',
        'not_claimed':'Arbitrary charged response replacing pure phase; coupled phase-modulus/auxiliary responses; charged-auxiliary cross covariances that destroy the product kernel; or a global Grothendieck endpoint.',
        'base_certificate':base,
        'script_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}


if __name__=='__main__':
    if sys.flags.optimize:
        raise SystemExit('Refusing -O/-OO')
    p=argparse.ArgumentParser();p.add_argument('--output',type=Path,required=True)
    args=p.parse_args()
    report=certificate()
    args.output.parent.mkdir(parents=True,exist_ok=True)
    args.output.write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps({k:report[k] for k in ['status',
        'same_full_score_strict_decimal_ceiling_rational',
        'angular_gap_positive_lower_coefficient',
        'angular_gap_positive_lower_coefficient_float']},indent=2))
