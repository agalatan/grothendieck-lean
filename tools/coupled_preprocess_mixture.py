#!/usr/bin/env python3
"""Discovery-only degree-seven convex phase-preprocessor game.

Run parameter searches on the droplet. This is an optimistic finite prefix
game: omitted coefficients are unpaid. It does not give a Grothendieck bound.
"""
import argparse
import json
import math
from pathlib import Path
import numpy as np
from scipy.optimize import linprog, minimize_scalar


def coefficients(h):
    a,b,c,d=h
    return np.array([a,b+a**3/8,
        c+3*a*a*b/8+3*a**5/64,
        d+(3*a*a*c+3*a*b*b)/8+15*a**4*b/64+25*a**7/1024])


def pricing(lambda_,grid=257):
    """Eliminate c,d linearly and b quadratically; price remaining a in 1D.

    Numerical maximization only. The exact polynomial formula makes later
    interval/Bernstein certification possible if the game is promising.
    """
    l3,l5,l7=lambda_
    candidates=[]
    for sa in [-1,1]:
      for sb in [-1,1]:
       for branch in ['c','d']:
        for sc in [-1,1]:
         def point(u):
            a=sa*u
            available=1-u
            v=sc*(l5+3*a*a*l7/8) if branch=='c' else sc*l7
            const=a+l3*a**3/8+l5*3*a**5/64+l7*25*a**7/1024+available*v
            linear=sb*(l3+3*a*a*l5/8+15*a**4*l7/64)-v
            quadratic=3*a*l7/8
            # b=sb*s, s in [0,available].
            ss=[0.,available]
            if quadratic<0:
                vertex=-linear/(2*quadratic)
                if 0<vertex<available:
                    ss.append(vertex)
            best=max(ss,key=lambda s:const+linear*s+quadratic*s*s)
            b=sb*best
            residue=available-best
            h=[a,b,sc*residue if branch=='c' else 0.,
                   sc*residue if branch=='d' else 0.]
            return float(np.dot(coefficients(h),np.r_[1.,lambda_])),h
         xs=np.linspace(0,1,grid)
         vals=np.array([point(float(u))[0] for u in xs])
         ids=[0,grid-1]+[i for i in range(1,grid-1)
                         if vals[i]>=vals[i-1] and vals[i]>=vals[i+1]]
         for i in ids:
            if i in [0,grid-1]:
                value,h=point(float(xs[i]))
            else:
                opt=minimize_scalar(lambda u:-point(float(u))[0],
                    bounds=(float(xs[i-1]),float(xs[i+1])),method='bounded',
                    options={'xatol':1e-14})
                value,h=point(float(opt.x))
            candidates.append((value,h))
    return max(candidates,key=lambda q:q[0]),candidates


def run(rounds=30,grid=257):
    columns=[]
    for a in np.linspace(-1,1,21):
      for b in np.linspace(-1+abs(a),1-abs(a),21):
        rest=max(0.,1-abs(a)-abs(b))
        for j in [2,3]:
          for sg in [-1,1]:
            h=[float(a),float(b),0.,0.]
            h[j]=sg*rest
            columns.append(h)
    history=[]
    for step in range(rounds):
        values=np.array([coefficients(h) for h in columns])
        lp=linprog([0,0,0,1],A_ub=np.c_[values[:,1:],-np.ones(len(values))],
                   b_ub=-values[:,0],bounds=[(-1,1)]*3+[(0,None)],method='highs')
        if not lp.success:
            raise ArithmeticError(lp.message)
        l=lp.x[:3];z=float(lp.x[3])
        (upper,h),all_prices=pricing(l,grid)
        history.append({'round':step,'lambda':l.tolist(),'grid_lower':z,
                        'numerical_pricing_upper':upper,'gap':upper-z})
        if upper-z<2e-11:
            break
        columns.extend(q[1] for q in all_prices if q[0]>z+1e-11)
    weights=-np.asarray(lp.ineqlin.marginals)
    keep=np.flatnonzero(weights>1e-9)
    return {'status':'FLOATING_OPTIMISTIC_PREFIX_GAME_NO_TAIL_OR_ENDPOINT',
            'ordinary_degrees_retained':[1,3,5,7],
            'normalization':'Coefficients are divided by pi/4.',
            'head_score_lower':math.pi*z/4,
            'numerical_dual_upper':math.pi*upper/4,
            'incumbent_comparison_lower':.711947,
            'lambda':l.tolist(),'history':history,
            'support':[{'weight':float(weights[i]),'h_coefficients':columns[i],
                        'normalized_kernel_coefficients':values[i].tolist()}
                       for i in keep],
            'mixed_normalized_coefficients':(weights@values).tolist(),
            'mixture_weight_sum':float(weights.sum()),
            'omitted_coefficients':'Every coefficient beyond degree seven is unpaid. The lower value is only a feasible value of this relaxed prefix game.',
            'proof_status':'Pricing is floating numerical. No certified global upper bound is claimed.'}


if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--output',type=Path,required=True)
    p.add_argument('--rounds',type=int,default=30);p.add_argument('--grid',type=int,default=257)
    args=p.parse_args()
    result=run(args.rounds,args.grid)
    args.output.parent.mkdir(parents=True,exist_ok=True)
    args.output.write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({k:result[k] for k in ['status','head_score_lower',
        'numerical_dual_upper','lambda','support','mixed_normalized_coefficients']},indent=2))
