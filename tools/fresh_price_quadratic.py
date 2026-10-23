#!/usr/bin/env python3
"""Bounded asymmetric column pricing against one frozen finite-pool dual.

All optimization and coefficients are floating discovery. The candidate has
actual bounded responses, but no infinite-tail or interval certificate.
"""
import argparse
import json
from pathlib import Path
import sys
import numpy as np
from scipy.optimize import minimize

sys.path.insert(0,str(Path(__file__).resolve().parent))
from fresh_upper_quadratic_kernel import Candidate,row,cauchy_coefficients


def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--pool',type=Path,required=True)
    ap.add_argument('--out',type=Path,required=True)
    ap.add_argument('--max-evaluations',type=int,default=500)
    ap.add_argument('--grades',type=int,nargs=2,default=[1,3])
    args=ap.parse_args();pool=json.loads(args.pool.read_text())
    if any(g<=0 or g%2==0 for g in args.grades):
        ap.error('--grades must contain positive odd integers')
    lam=np.array(pool['baseline']['lambda']);baseline=pool['baseline']['score']
    J=np.array([[0,-1j],[1j,0]],complex)
    evaluations=0;best=[-np.inf,None]
    def candidate(x):
        a,b,h,k=x
        return Candidate('dual-priced-asymmetric',row(1,a),row(1,-b),h*J,k*J,
                         grades=tuple(args.grades))
    def objective(x):
        nonlocal evaluations
        evaluations+=1
        try:
            coeff,_=cauchy_coefficients(candidate(x),257,.98,2048)
        except (ValueError,np.linalg.LinAlgError):return 10.
        head=coeff[1::2].real
        price=float(head@lam)
        if price>best[0]:best[:]=[price,list(map(float,x))]
        return -price
    seeds=[[.3206005539613036,.3206005539613036,0.,0.],
           [.3268647039437935,.3268647039437935,-.01,1/300]]
    if tuple(args.grades)==(1,7):
        seeds[0]=[.309493764,.309448699,-.027588291,.027575813]
    results=[]
    for seed in seeds:
        fit=minimize(objective,seed,method='Powell',bounds=[(.15,.6),(.15,.6),(-.25,.25),(-.25,.25)],
                     options={'maxfev':args.max_evaluations,'xtol':1e-7,'ftol':1e-11})
        results.append({'seed':seed,'parameters':fit.x.tolist(),'price':float(-fit.fun),
                        'success':bool(fit.success),'message':str(fit.message),'evaluations':fit.nfev})
    proposed=candidate(best[1])
    c1,_=cauchy_coefficients(proposed,257,.96,8192)
    c2,branches=cauchy_coefficients(proposed,257,.98,16384)
    head=c2[1::2].real;price=float(head@lam)
    result={'status':'FLOATING_ASYMMETRIC_COLUMN_PRICING_NEW_TAIL_UNPAID','scope':__doc__,
            'parameters':best[1],'grades':args.grades,'candidate':proposed.to_json(),'price':price,
            'baseline_pool_score':baseline,'optimistic_reduced_cost':price-baseline,
            'head_through_degree':257,'head':head.tolist(),
            'cross_radius_coefficient_drift':float(np.max(abs(c1-c2))),
            'cross_radius_price_drift':float(abs((c1[1::2].real-head)@lam)),
            'head_only_D':float(head[0]-np.sum(abs(head[1:]))),
            'branch_checks':branches,'evaluations':evaluations,'runs':results,
            'interpretation':'This prices a column for a frozen finite pool. A positive value is a proposal; a nonpositive value does not prove global optimality of this nonlinear family.',
            'global_endpoint_changed':False}
    args.out.parent.mkdir(parents=True,exist_ok=True)
    args.out.write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({k:result[k]for k in ['status','parameters','price','baseline_pool_score','optimistic_reduced_cost','cross_radius_coefficient_drift','cross_radius_price_drift','head_only_D','evaluations']},indent=2))


if __name__=='__main__':main()
