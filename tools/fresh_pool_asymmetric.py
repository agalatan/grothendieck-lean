#!/usr/bin/env python3
"""Price nineteen asymmetric actual-response columns against an inherited pool.

Discovery only: saved old heads/tail charges are inherited floating data, and
new infinite tails are UNPAID. The expanded score is therefore optimistic.
It is never an endpoint or a certified lower bound for the rounding score.
"""
import argparse
import hashlib
import json
from pathlib import Path
import sys
import numpy as np
from scipy.optimize import linprog

sys.path.insert(0,str(Path(__file__).resolve().parent))
from fresh_upper_quadratic_kernel import Candidate,cauchy_coefficients


def solve(heads,charges):
    rows,n=heads.shape;d=n-1
    cost=np.r_[charges-heads[:,0],np.ones(d)]
    aa=np.c_[heads[:,1:].T,-np.eye(d)]
    ab=np.c_[-heads[:,1:].T,-np.eye(d)]
    result=linprog(cost,A_ub=np.r_[aa,ab],b_ub=np.zeros(2*d),
                   A_eq=np.array([np.r_[np.ones(rows),np.zeros(d)]]),b_eq=[1.],
                   bounds=[(0,None)]*(rows+d),method='highs',
                   options={'primal_feasibility_tolerance':1e-10,
                            'dual_feasibility_tolerance':1e-10,
                            'ipm_optimality_tolerance':1e-12})
    if not result.success:raise ValueError(result.message)
    w=result.x[:rows];mixed=w@heads
    score=mixed[0]-np.sum(abs(mixed[1:]))-w@charges
    lam=np.r_[1.,result.ineqlin.marginals[:d]-result.ineqlin.marginals[d:]]
    prices=heads@lam-charges
    assert np.max(abs(lam))<=1+1e-8
    assert abs(score+result.fun)<1e-8
    return {'score':float(score),'D_head':float(mixed[0]-np.sum(abs(mixed[1:]))),
            'known_tail_charges':float(w@charges),'lambda':lam.tolist(),
            'maximum_column_price':float(max(prices)),
            'primal_dual_gap':float(max(prices)-score),
            'weights':w.tolist(),'mixture_head':mixed.tolist(),
            'active':[{'index':int(i),'weight':float(w[i]),'price':float(prices[i])}
                       for i in np.flatnonzero(w>1e-8)]}


def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--repo',type=Path,default=Path(__file__).resolve().parents[1])
    ap.add_argument('--out',type=Path,required=True)
    args=ap.parse_args()
    base=args.repo/'handoff/research-third-decimal/fresh-eyes-20261023'
    oldpath=base/'pool/inherited-chirp-pool128.json'
    old=json.loads(oldpath.read_text());oldheads=np.array(old['heads'],float)
    charges=np.array(old['tail_charges'],float)
    assert oldheads.shape==(557,129) and charges.shape==(557,)
    baseline=solve(oldheads,charges)
    assert abs(baseline['score']-old['D_after_known_tail_budget'])<3e-8
    first=json.loads((base/'upper/quadratic/diagnostics.json').read_text())
    second=json.loads((base/'upper/quadratic/asymmetric-direction.json').read_text())
    candidates=[Candidate.from_json(row['candidate']) for row in first['diagnostics']]
    candidates.extend(Candidate.from_json(row['candidate']) for row in second['rows'])
    rows=[];details=[]
    lam=np.array(baseline['lambda'])
    for candidate in candidates:
        lo,_=cauchy_coefficients(candidate,257,.96,4096)
        hi,branch=cauchy_coefficients(candidate,257,.98,8192)
        drift=float(np.max(abs(lo-hi)))
        assert drift<3e-9
        orient=np.exp(-1j*np.angle(hi[1]));head=(hi[1::2]*orient).real
        assert len(head)==129
        rows.append(head)
        details.append({'candidate':candidate.to_json(),'orientation':float(np.angle(orient)),
                        'cross_radius_drift':drift,
                        'head_only_single_column_D':float(head[0]-np.sum(abs(head[1:]))),
                        'price_under_old_pool_dual':float(head@lam),
                        'optimistic_reduced_cost':float(head@lam-baseline['score']),
                        'new_tail_charge':None,'analytic_branch_diagnostics':branch})
    fresh=np.array(rows)
    expanded=solve(np.r_[oldheads,fresh],np.r_[charges,np.zeros(len(rows))])
    fresh_weight=sum(expanded['weights'][len(oldheads):])
    result={'status':'FLOATING_FINITE_POOL_EXPERIMENT_NEW_TAILS_UNPAID',
            'scope':__doc__,'inherited_pool':str(oldpath.relative_to(args.repo)),
            'inherited_pool_sha256':hashlib.sha256(oldpath.read_bytes()).hexdigest(),
            'old_columns':len(oldheads),'new_columns':len(rows),'head_through_odd_degree':257,
            'baseline':baseline,'expanded_optimistic':expanded,
            'optimistic_score_gain':expanded['score']-baseline['score'],
            'total_new_column_weight':fresh_weight,'new_column_diagnostics':details,
            'interpretation':'A nonpositive old-dual reduced cost rejects a column for this finite pool even before paying its tail. A positive price/gain is only a proposal until new tails and all coefficient errors are paid.',
            'global_endpoint_changed':False}
    args.out.parent.mkdir(parents=True,exist_ok=True)
    args.out.write_text(json.dumps(result,indent=2)+'\n')
    np.savez(args.out.with_suffix('.npz'),new_heads=fresh,old_dual=lam)
    print(json.dumps({'status':result['status'],'baseline_score':baseline['score'],
                      'expanded_optimistic_score':expanded['score'],
                      'optimistic_gain':result['optimistic_score_gain'],
                      'total_new_column_weight':fresh_weight,
                      'best_new_column_price':max(r['price_under_old_pool_dual']for r in details),
                      'new_positive_prices':sum(r['optimistic_reduced_cost']>1e-8 for r in details)},indent=2))


if __name__=='__main__':main()
