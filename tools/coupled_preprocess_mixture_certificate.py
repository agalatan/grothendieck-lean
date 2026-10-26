#!/usr/bin/env python3
"""Exact ceiling for mixtures of separable scalar phase/neutral schemes.

Standard library only. All proof calculations use rational arithmetic.
Run substantial certificate refinements on the research droplet.
"""
import argparse
from fractions import Fraction as Q
import hashlib
import json
from math import comb
from pathlib import Path
import sys


def require(condition,message):
    if not condition:
        raise ArithmeticError(message)


def add(a,b):
    c=dict(a)
    for degree,x in b.items():
        c[degree]=c.get(degree,Q(0))+x
    return {degree:x for degree,x in c.items() if x}


def scale(a,q):
    return {degree:x*q for degree,x in a.items() if x*q}


def mul(a,b):
    c={}
    for (i,j),x in a.items():
        for (k,l),y in b.items():
            degree=(i+k,j+l)
            c[degree]=c.get(degree,Q(0))+x*y
    return {degree:x for degree,x in c.items() if x}


def power(a,n):
    c={(0,0):Q(1)}
    for _ in range(n):
        c=mul(c,a)
    return c


def ordinary_series_mul(a,b,degree=7):
    out={}
    for i,x in a.items():
        for j,y in b.items():
            if i+j<=degree:
                out[i+j]=add(out.get(i+j,{}),mul(x,y))
    return {i:x for i,x in out.items() if x}


def patch_polynomial(sa,sb,sc,branch,lambdas):
    one={(0,0):Q(1)};u={(1,0):Q(1)};v={(0,1):Q(1)}
    a=scale(u,Q(sa))
    b=scale(mul(add(one,scale(u,Q(-1))),v),Q(sb))
    remainder=mul(add(one,scale(u,Q(-1))),add(one,scale(v,Q(-1))))
    c=scale(remainder,Q(sc)) if branch=='c' else {}
    d=scale(remainder,Q(sc)) if branch=='d' else {}
    g3=add(b,scale(power(a,3),Q(1,8)))
    g5=add(add(c,scale(mul(power(a,2),b),Q(3,8))),
           scale(power(a,5),Q(3,64)))
    g7=add(add(add(d,scale(mul(power(a,2),c),Q(3,8))),
                  scale(mul(a,power(b,2)),Q(3,8))),
           add(scale(mul(power(a,4),b),Q(15,64)),
               scale(power(a,7),Q(25,1024))))
    manual=add(add(a,scale(g3,lambdas[0])),
               add(scale(g5,lambdas[1]),scale(g7,lambdas[2])))
    # Independently derive the price by generic formal series composition,
    # checking the closed coefficient formulas symbolically on every patch.
    preprocessor={1:a,3:b,5:c,7:d}
    phase={1:Q(1),3:Q(1,8),5:Q(3,64),7:Q(25,1024)}
    p_power={0:one};composed={}
    for n in range(1,8):
        p_power=ordinary_series_mul(p_power,preprocessor)
        if n in phase:
            for degree,value in p_power.items():
                composed[degree]=add(composed.get(degree,{}),scale(value,phase[n]))
    derived={}
    for degree,weight in zip([1,3,5,7],[Q(1)]+lambdas):
        derived=add(derived,scale(composed.get(degree,{}),weight))
    require(derived==manual,'Closed phase coefficient expansion failed')
    return manual


def to_bernstein(poly,n=7,m=2):
    require(all(i<=n and j<=m for i,j in poly),'Unexpected polynomial degree')
    return [[sum((value*Q(comb(i,k),comb(n,k))*Q(comb(j,l),comb(m,l))
                  for (k,l),value in poly.items() if k<=i and l<=j),Q(0))
             for j in range(m+1)] for i in range(n+1)]


def split_curve(coeff):
    work=list(coeff);left=[work[0]];right=[work[-1]]
    while len(work)>1:
        work=[(work[i]+work[i+1])/2 for i in range(len(work)-1)]
        left.append(work[0]);right.append(work[-1])
    return left,list(reversed(right))


def split_surface(coeff,axis):
    n=len(coeff);m=len(coeff[0])
    if axis==0:
        out=[[[Q(0) for j in range(m)] for i in range(n)] for _ in range(2)]
        for j in range(m):
            left,right=split_curve([coeff[i][j] for i in range(n)])
            for i in range(n):
                out[0][i][j]=left[i];out[1][i][j]=right[i]
        return out
    out=[[],[]]
    for row in coeff:
        left,right=split_curve(row)
        out[0].append(left);out[1].append(right)
    return out


def certify_patch(coeff,ceiling,max_depth):
    todo=[(coeff,0)];leaves=0;branches=0;depth_max=0;smallest_margin=None
    while todo:
        current,depth=todo.pop()
        upper=max(x for row in current for x in row)
        margin=ceiling-upper
        if margin>=0:
            leaves+=1;depth_max=max(depth_max,depth)
            smallest_margin=margin if smallest_margin is None else min(smallest_margin,margin)
            continue
        require(depth<max_depth,'Subdivision depth exhausted; no proof obtained')
        # More subdivision in u (degree 7) than v (degree 2).
        axis=0 if depth%3<2 else 1
        left,right=split_surface(current,axis)
        todo.extend([(left,depth+1),(right,depth+1)])
        branches+=1
    return {'accepted_leaves':leaves,'branch_nodes':branches,
            'maximum_depth':depth_max,'smallest_exact_leaf_margin':str(smallest_margin)}


def arctan_interval(inverse,n):
    require(inverse>1 and n>=2 and n%2==0,'Need an even positive truncation')
    x=Q(1,inverse)
    lower=sum(((-1)**k*x**(2*k+1)/Q(2*k+1) for k in range(n)),Q(0))
    upper=lower+x**(2*n+1)/Q(2*n+1)
    return lower,upper


def pi_interval():
    # Machin identity: (5+i)^4(239-i)=114244(1+i), and the relevant
    # arguments lie in (0,pi/2). Alternating arctan series then enclose pi.
    require(476*239+480==480*239-476==114244,'Machin identity arithmetic failed')
    a,b=arctan_interval(5,20);c,d=arctan_interval(239,6)
    return 16*a-4*d,16*b-4*c


def certificate(max_depth=24):
    if type(max_depth) is not int or not 1<=max_depth<=60:
        raise ValueError('max-depth must be an integer between 1 and 60')
    lambdas=[Q(-606121006,10**9),Q(-272015495,10**9),Q(-762296131,10**9)]
    ceiling=Q(90644,100000)
    require(all(abs(x)<=1 for x in lambdas),'Invalid dual multipliers')
    neutral_tail_cap=Q(75,64)*max(abs(x) for x in lambdas)
    require(neutral_tail_cap<ceiling,'Neutral multiplier extension failed')
    patches=[]
    for sa in [-1,1]:
      for sb in [-1,1]:
       for branch in ['c','d']:
        for sc in [-1,1]:
            poly=patch_polynomial(sa,sb,sc,branch,lambdas)
            coeff=to_bernstein(poly)
            result=certify_patch(coeff,ceiling,max_depth)
            result.update({'sign_a':sa,'sign_b':sb,'sign_remainder':sc,
                           'remainder_coordinate':branch})
            patches.append(result)
    pi_lower,pi_upper=pi_interval()
    score_upper=pi_upper*ceiling/4
    decimal_ceiling=Q(711916311229984,10**15)
    incumbent_lower=Q(711947,10**6)
    require(score_upper<decimal_ceiling,'Printed decimal ceiling failed')
    require(score_upper<incumbent_lower,'Certified ceiling does not beat comparison target')
    return {'status':'EXACT_SEPARABLE_PHASE_NEUTRAL_MIXTURE_CEILING',
            'scope':'Arbitrary finite/countable convex mixtures of C=phi(p)*K, where p is a real odd scalar Wiener contraction and K is any complex even Wiener series with norm <=1. This includes independent bounded two-map neutral Gaussian responses and separate scalar channel contractions through Hermite coefficient Cauchy-Schwarz. Full residual scores, not just exact inverses, are covered.',
            'ordinary_degrees_retained':[1,3,5,7],
            'closed_phase_expansion_independently_checked_by_formal_composition':True,
            'lambda3_lambda5_lambda7':[str(x) for x in lambdas],
            'normalized_polynomial_ceiling':str(ceiling),
            'normalized_neutral_tail_cap':str(neutral_tail_cap),
            'normalized_neutral_tail_strict_margin':str(ceiling-neutral_tail_cap),
            'neutral_extension_proof':'Split K=k0+E, E even with minimum degree two and |k0|+||E||W<=1. The exact phase-only certificate also bounds the absolute dual price by p->-p symmetry. A nonconstant neutral factor can see only the first three phase powers through degree seven: ||head5 phi(p)||W/(pi/4)<=1+1/8+3/64=75/64. Thus the absolute dual price of phi(p)*E is <=(pi/4)*(75/64)*lambda_max*||E||W, strictly less than the phase-only ceiling times ||E||W. Triangle inequality and convexity finish.',
            'pi_lower_rational':str(pi_lower),'pi_upper_rational':str(pi_upper),
            'full_score_upper_rational':str(score_upper),
            'full_score_strict_decimal_ceiling_rational':str(decimal_ceiling),
            'full_score_upper_float':float(score_upper),
            'incumbent_comparison_lower_rational':str(incumbent_lower),
            'separation_margin_lower_rational':str(incumbent_lower-score_upper),
            'patches':patches,'total_accepted_leaves':sum(x['accepted_leaves'] for x in patches),
            'maximum_depth':max(x['maximum_depth'] for x in patches),
            'proof':'Every l1-ball preprocessor coefficient quadruple is priced after exact linear elimination of coefficients c,d. Sixteen sign/remainder patches parameterize a=±u,b=±(1-u)v and remaining l1 mass in signed c or d. Exact bivariate Bernstein subdivision proves a+lambda3*g3+lambda5*g5+lambda7*g7<=z on all patches. Each dual multiplier lies in [-1,1], so the same affine upper bound controls the full residual score of every convex mixture. Higher coefficients only decrease the full residual score; no tail estimate is assumed.',
            'not_claimed':'Complex-coefficient charged preprocessors; response factors depending jointly on the phase coordinate modulus and neutral coordinates; a first charged response other than pure phase; arbitrary multichannel or coupled responses; or a global Grothendieck endpoint.',
            'script_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}


if __name__=='__main__':
    if sys.flags.optimize:
        raise SystemExit('Refusing -O/-OO')
    p=argparse.ArgumentParser();p.add_argument('--output',type=Path,required=True)
    p.add_argument('--max-depth',type=int,default=24)
    args=p.parse_args()
    report=certificate(args.max_depth)
    args.output.parent.mkdir(parents=True,exist_ok=True)
    args.output.write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps({k:report[k] for k in ['status','full_score_upper_float',
        'total_accepted_leaves','maximum_depth','lambda3_lambda5_lambda7']},indent=2))
