#!/usr/bin/env python3
"""Add the inherited-tax incumbent to the saved old/new floating pool.

Finite LP discovery only. Old pool heads/charges are inherited floating data;
the incumbent tax is conditional on DirectHyps; all 24 new tails are UNPAID.
"""
import argparse
import hashlib
import json
from pathlib import Path
import numpy as np
from scipy.optimize import linprog
from fresh_pool_asymmetric import solve


def solve_scaled(heads,charges,scale,anchor,row_normalize=False):
    rows,n=heads.shape;d=n-1
    # Equivalent bounded-multiplier dual. The direct scaled mixture/slack
    # formulation was numerically unstable for the near-linear incumbent.
    # delta=scale*(dual_bound-anchor), with all lambda components in [-1,1].
    cost=np.r_[np.zeros(d),1.]
    row_sizes=np.maximum(np.maximum(np.max(abs(heads[:,1:]),axis=1),
                                   abs(heads[:,0]-charges-anchor)),1e-12)
    if row_normalize:
        constraints=np.c_[heads[:,1:]/row_sizes[:,None],-1/(scale*row_sizes)]
        rhs=(anchor-heads[:,0]+charges)/row_sizes
    else:
        constraints=np.c_[scale*heads[:,1:],-np.ones(rows)]
        rhs=scale*(anchor-heads[:,0]+charges)
    result=linprog(cost,A_ub=constraints,b_ub=rhs,
        bounds=[(-1,1)]*d+[(None,None)],method='highs',
        options={'primal_feasibility_tolerance':1e-10,'dual_feasibility_tolerance':1e-10,
                 'ipm_optimality_tolerance':1e-12})
    if not result.success:raise ArithmeticError(result.message)
    w=-result.ineqlin.marginals
    if row_normalize:w=w/(scale*row_sizes)
    if np.min(w)<-1e-9:raise ArithmeticError('Negative recovered mixture weight')
    w=np.maximum(w,0);w=w/w.sum();mixed=w@heads
    score=float(mixed[0]-np.sum(abs(mixed[1:]))-w@charges)
    lam=np.r_[1.,result.x[:-1]]
    prices=heads@lam-charges
    if np.max(abs(lam))>1+1e-8:raise ArithmeticError('Dual left the multiplier cube')
    objective_score=anchor+result.fun/scale
    if abs(score-objective_score)>1e-10:raise ArithmeticError('Scaled LP/primal score mismatch')
    return {'score':score,'D_head':float(mixed[0]-np.sum(abs(mixed[1:]))),
            'known_tail_charges':float(w@charges),'lambda':lam.tolist(),
            'maximum_column_price':float(max(prices)),
            'primal_dual_gap':float(max(prices)-score),'weights':w.tolist(),
            'mixture_head':mixed.tolist(),'constraint_scale':scale,'objective_anchor':anchor,
            'method':'Bounded multiplier dual; mixture weights recovered from inequality marginals',
            'per_price_row_normalization':row_normalize,
            'objective_score':float(objective_score),'objective_primal_difference':float(objective_score-score),
            'active':[{'index':int(i),'weight':float(w[i]),'price':float(prices[i])}
                      for i in np.flatnonzero(w>1e-8)]}


def main(base,out):
    paths=[base/'pool/inherited-chirp-pool128.json',
           base/'pool/asymmetric-pool-result.npz',base/'pool/priced-asymmetric.json',
           base/'barriers/higher-grade-pricing.npz',base/'upper/incumbent/incumbent-column.json']
    old=json.loads(paths[0].read_text())
    oldheads=np.asarray(old['heads'],float);oldcharges=np.asarray(old['tail_charges'],float)
    with np.load(paths[1]) as a:fresh=a['new_heads'].copy()
    priced=json.loads(paths[2].read_text())
    with np.load(paths[3]) as a:higher=a['new_heads'].copy()
    incumbent=json.loads(paths[4].read_text())
    inc=np.asarray(incumbent['coefficient_midpoints'],float)
    tax=incumbent['conditional_tax_upper_float']
    if oldheads.shape!=(557,129) or fresh.shape!=(19,129) or higher.shape!=(4,129) or inc.shape!=(129,):
        raise ValueError('Unexpected saved pool dimensions')
    new=np.r_[fresh,np.asarray(priced['head'])[None,:],higher]
    names=[f'old-{i}' for i in range(557)]+[f'asymmetric-{i}' for i in range(19)]+['priced-asymmetric']+[f'higher-grade-{i}' for i in range(4)]+['incumbent']
    heads=np.r_[oldheads,new,inc[None,:]]
    charges=np.r_[oldcharges,np.zeros(24),tax]
    baseline=solve(oldheads,oldcharges)
    anchor=float(inc[0]-sum(abs(inc[1:]))-tax)
    incumbent_only=solve_scaled(inc[None,:],np.array([tax]),1e8,anchor)
    incumbent_old=solve_scaled(np.r_[oldheads,inc[None,:]],np.r_[oldcharges,tax],1e8,anchor)
    augmented=solve_scaled(heads,charges,1e8,anchor)
    alternate=solve_scaled(heads,charges,1e6,anchor)
    normalized=solve_scaled(heads,charges,1e6,anchor,row_normalize=True)
    lam=np.asarray(incumbent_old['lambda'])
    column_prices=new@lam
    report={'status':'FLOATING_LP_WITH_CONDITIONAL_INCUMBENT_TAX_NEW_TAILS_UNPAID',
            'scope':__doc__,'old_columns':557,'new_columns':24,'incumbent_columns':1,
            'head_through_degree':257,'old_baseline':baseline,
            'incumbent_only':incumbent_only,'incumbent_plus_old':incumbent_old,
            'augmented':augmented,'augmented_scale_1e6':alternate,
            'augmented_row_normalized':normalized,
            'cross_scale_score_drift':abs(augmented['score']-alternate['score']),
            'row_normalized_score_drift':abs(augmented['score']-normalized['score']),
            'augmented_gain_over_incumbent_only':augmented['score']-incumbent_only['score'],
            'augmented_gain_over_incumbent_plus_old':augmented['score']-incumbent_old['score'],
            'incumbent_weight':augmented['weights'][-1],
            'total_new_weight':sum(augmented['weights'][557:-1]),
            'new_prices_under_incumbent_plus_old_dual':column_prices.tolist(),
            'new_reduced_costs_under_incumbent_plus_old_dual':(column_prices-incumbent_old['score']).tolist(),
            'names':names,
            'active_named':[dict(x,name=names[x['index']]) for x in augmented['active']],
            'source_hashes':{str(p.relative_to(base)):hashlib.sha256(p.read_bytes()).hexdigest() for p in paths},
            'global_endpoint_changed':False}
    out.mkdir(parents=True,exist_ok=True)
    (out/'incumbent-pool-result.json').write_text(json.dumps(report,indent=2)+'\n')
    np.savez(out/'incumbent-pool-heads.npz',heads=heads,charges=charges,
             dual=np.asarray(augmented['lambda']),incumbent_old_dual=lam,names=np.asarray(names))
    print(json.dumps({'status':report['status'],'old_score':baseline['score'],
        'incumbent_only_score':incumbent_only['score'],'incumbent_plus_old_score':incumbent_old['score'],
        'augmented_score':augmented['score'],
        'augmented_gain_over_incumbent_only':report['augmented_gain_over_incumbent_only'],
        'incumbent_weight':report['incumbent_weight'],'new_weight':report['total_new_weight'],
        'cross_scale_score_drift':report['cross_scale_score_drift'],
        'maximum_new_reduced_cost_under_incumbent_old':float(np.max(column_prices-incumbent_old['score'])),
        'active_named':report['active_named'],'LP_primal_dual_gap':augmented['primal_dual_gap']},indent=2))


if __name__=='__main__':
    p=argparse.ArgumentParser()
    p.add_argument('--repo',type=Path,default=Path(__file__).resolve().parents[1])
    p.add_argument('--base',type=Path)
    p.add_argument('--out',type=Path)
    a=p.parse_args()
    base=a.base or a.repo/'handoff/research-third-decimal/fresh-eyes-20261023'
    main(base,a.out or base/'upper/incumbent')
