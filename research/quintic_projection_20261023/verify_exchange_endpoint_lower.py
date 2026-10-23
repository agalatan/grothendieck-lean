#!/usr/bin/env python3
"""Arb exponential-quantile lower certificate for original endpoint C(1).

For 0<c<1/sqrt(2), b>0, R=|Z|^2,T=|G|^2 are independent Exp(1).
Set u=R[1+c(R-2)/sqrt(2)]^2/b^2, d=(u-T)/(u+T).
The exact conditional angular mean is C(d)=d/AGM(1,|d|), increasing
with d, hence increasing with R and decreasing with T. The positivity
of 1-sqrt(2)c makes u increasing on R>=0.

On an n by n equal exponential-quantile grid, exclude first R-bin and
last T-bin and bound that union by -1 (mass 2/n-1/n^2). For remaining
cells evaluate lower R and upper T corners. With two AGM steps,
g2<=AGM<=a2. Thus C(d)>=d/a2 for d>0, and C(d)>=d/g2 for d<0.
Ambiguous signs are bounded by -1. All finite sums/logs/sqrts are Arb.
The angular/monotonicity arguments are separate paper facts, not Lean.
"""
import argparse
from fractions import Fraction as Q
import hashlib
import json
from pathlib import Path
import time
from flint import arb, ctx


def ball(q):
    q=Q(q)
    return arb(q.numerator)/q.denominator


def lower(value,denominator=10**12):
    q=Q(str(value.lower().fmpq()))
    return Q((q.numerator*denominator)//q.denominator,denominator)


def upper(value,denominator=10**12):
    q=Q(str(value.upper().fmpq()))
    return Q(-((-q.numerator*denominator)//q.denominator),denominator)


def encode(value):
    return {'ball':str(value),'rational_bounds':list(map(str,[lower(value),upper(value)]))}


def from_bounds(row):
    a,b=map(ball,row['rational_bounds'])
    return a.union(b)


def grid(c,b,n,quantiles):
    c,b=ball(c),ball(b)
    root2=arb(2).sqrt()
    if not c>0 or not c*root2<1 or not b>0:
        raise ValueError('Monotone signal requires 0<c<1/sqrt(2) and b>0')
    total,ambiguous=arb(0),0
    for r in quantiles:
        u=r*(1+c*(r-2)/root2)**2/(b*b)
        row=arb(0)
        for t in quantiles:
            d=(u-t)/(u+t)
            if d>0:
                a,g=arb(1),d
                for _ in range(2):
                    a,g=(a+g)/2,(a*g).sqrt()
                value=d/a
            elif d<0:
                a,g=arb(1),-d
                for _ in range(2):
                    a,g=(a+g)/2,(a*g).sqrt()
                value=d/g
            else:
                value=arb(-1)
                ambiguous+=1
            if not value.is_finite():
                raise ArithmeticError('Nonfinite AGM cell lower bound')
            row+=value
        total+=row
    boundary=Q(2,n)-Q(1,n*n)
    return total/(n*n)-ball(boundary),ambiguous


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--n',type=int,default=1024)
    parser.add_argument('--out',type=Path,required=True)
    args=parser.parse_args()
    started=time.monotonic()
    ctx.prec=128
    root=Path(__file__).parent
    data=json.loads((root/'exchange-active-cancellation-input.json').read_text())
    replay=json.loads((root/'exchange-active-cancellation-replay.json').read_text())
    profiles=[dict(row) for row in data['profiles'][1:]]
    profiles.append({'kind':'old_balanced_common_lower','c':'14953/62500','b':'14953/62500'})
    quantiles=[-ball(Q(args.n-i,args.n)).log() for i in range(1,args.n)]
    rows=[]
    for profile in profiles:
        value,ambiguous=grid(profile['c'],profile['b'],args.n,quantiles)
        row=dict(profile)
        row.update({'endpoint_lower':encode(value),'ambiguous_corner_signs':ambiguous})
        rows.append(row)
        print(json.dumps(row),flush=True)
    endpoint_lowers=[arb(1)]+[ball(row['endpoint_lower']['rational_bounds'][0]) for row in rows[:2]]
    weights=list(map(from_bounds,replay['exact_finite_weight_bounds']))
    mixed_lower=sum(w*v for w,v in zip(weights,endpoint_lowers))
    p_upper=sum(w*from_bounds(row['finite_column_p_s3_s5'][0])
                for w,row in zip(weights,replay['profiles']))
    raw_upper=2*p_upper-mixed_lower
    if not mixed_lower>ball('72/100') or not raw_upper<ball('711947/1000000'):
        raise ArithmeticError('The requested new-mixture raw-score rejection failed')
    result={'status':'PASS','proof_status':__doc__,'n':args.n,'precision_bits':128,
            'interior_cells_per_profile':(args.n-1)**2,
            'boundary_union_mass':str(Q(2,args.n)-Q(1,args.n*args.n)),
            'profiles':rows,'exact_finite_weight_mixed_endpoint_lower':encode(mixed_lower),
            'exact_finite_weight_mixed_p_upper':encode(p_upper),
            'exact_finite_weight_raw_score_upper_2p_minus_C1':encode(raw_upper),
            'incumbent':'711947/1000000',
            'old_common_lower_reason':'For balanced c=b and 0<c<1/sqrt(2), u=R*(1/c+(R-2)/sqrt(2))^2 decreases in c. Thus cmax=14953/62500 supplies a lower C1 bound for both original rational balanced profiles.',
            'seconds':time.monotonic()-started,
            'active_input_sha256':hashlib.sha256((root/'exchange-active-cancellation-input.json').read_bytes()).hexdigest(),
            'active_replay_sha256':hashlib.sha256((root/'exchange-active-cancellation-replay.json').read_bytes()).hexdigest(),
            'verifier_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
    args.out.write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({k:result[k] for k in ['status','exact_finite_weight_mixed_endpoint_lower','exact_finite_weight_mixed_p_upper','exact_finite_weight_raw_score_upper_2p_minus_C1','seconds']},indent=2),flush=True)


if __name__=='__main__':
    main()
