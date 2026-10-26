#!/usr/bin/env python3
"""Bounded pricing of grade-(1,5)/(1,7) quadratic-phase response columns.

FLOATING DISCOVERY ONLY. All 129 odd coefficients through degree 257 are used.
New infinite tails and coefficient enclosures are unpaid. Positive dual prices
or optimistic finite-pool objective gains are not rounding scores or endpoints.
"""
import argparse
import hashlib
import json
from pathlib import Path
import sys
import time

if sys.flags.optimize:
    raise SystemExit("Discovery validation refuses Python -O/-OO.")
sys.dont_write_bytecode=True
import numpy as np
from scipy.optimize import minimize

HERE=Path(__file__).resolve().parent
sys.path.insert(0,str(HERE))
from fresh_upper_quadratic_kernel import Candidate,row,cauchy_coefficients
from fresh_pool_asymmetric import solve


def fingerprint(path):
    return {"path":str(path),"sha256":hashlib.sha256(path.read_bytes()).hexdigest()}


def make_candidate(grade,x,name):
    a,b,h,k=map(float,x)
    J=np.array([[0,-1j],[1j,0]],complex)
    return Candidate(name,row(1,a),row(1,-b),h*J,k*J,grades=(1,grade))


def run(args):
    base=args.repo/'handoff/research-third-decimal/fresh-eyes-20261023'
    frozen_path=base/'pool/asymmetric-pool-result.json'
    old_path=base/'pool/inherited-chirp-pool128.json'
    nineteen_path=base/'pool/asymmetric-pool-result.npz'
    incumbent_path=base/'pool/priced-asymmetric.json'
    incumbent_pool_path=base/'pool/priced-pool-result.json'
    frozen=json.loads(frozen_path.read_text())
    incumbent=json.loads(incumbent_path.read_text())
    incumbent_pool=json.loads(incumbent_pool_path.read_text())
    lam=np.asarray(frozen['baseline']['lambda'],float)
    baseline=float(frozen['baseline']['score'])
    if lam.shape!=(129,) or not np.all(np.isfinite(lam)):
        raise ValueError('Frozen dual must contain 129 finite odd-degree prices')
    incumbent_price=float(np.asarray(incumbent['head'])@lam)
    seeds=[[.3,.3,-.004,.004],[.1,.1,0.,0.]]
    bounds=[(.001,.6),(.001,.6),(-.25,.25),(-.25,.25)]
    proposals=[]
    total_evaluations=0
    for grade in (5,7):
        for seed_index,seed in enumerate(seeds):
            started=time.time()
            calls=0
            errors=0
            first_price=None
            best_price=-np.inf
            best_x=None
            def objective(x):
                nonlocal calls,errors,best_price,best_x,first_price
                calls+=1
                try:
                    candidate=make_candidate(grade,x,f'grade-{grade}-seed-{seed_index}')
                    coeff,_=cauchy_coefficients(candidate,257,.98,2048)
                    price=float(coeff[1::2].real@lam)
                    if not np.isfinite(price):
                        raise ValueError('nonfinite dual price')
                except (ValueError,np.linalg.LinAlgError,FloatingPointError):
                    errors+=1
                    return 10.
                if first_price is None:
                    first_price=price
                if price>best_price:
                    best_price=price
                    best_x=list(map(float,x))
                return -price
            fit=minimize(objective,seed,method='Powell',bounds=bounds,
                options={'maxfev':args.max_evaluations,'xtol':1e-7,'ftol':1e-11})
            total_evaluations+=calls
            if calls>args.max_evaluations:
                raise RuntimeError('Per-seed evaluation budget exceeded')
            if best_x is None:
                raise RuntimeError('No admissible candidate in a pricing run')
            candidate=make_candidate(grade,best_x,f'grade-{grade}-seed-{seed_index}-best')
            lo,blo=cauchy_coefficients(candidate,257,.96,8192)
            hi,bhi=cauchy_coefficients(candidate,257,.98,16384)
            head=hi[1::2].real
            price=float(head@lam)
            proposal={
                'candidate':candidate.to_json(),'seed':seed,'best_parameters':best_x,
                'seed_price_2048':first_price,'best_price_2048':best_price,
                'final_price_16384':price,'optimistic_reduced_cost':price-baseline,
                'price_minus_current_incumbent_column':price-incumbent_price,
                'price_minus_current_incumbent_pool_objective':price-incumbent_pool['expanded']['score'],
                'head':head.tolist(),
                'cross_radius_coefficient_drift':float(np.max(abs(lo-hi))),
                'cross_radius_price_drift':float(abs((lo[1::2].real-head)@lam)),
                'max_odd_imaginary_coefficient':float(np.max(abs(hi[1::2].imag))),
                'branch_checks':[blo,bhi],
                'evaluations':calls,'inadmissible_evaluations':errors,
                'optimizer_final_parameters':fit.x.tolist(),
                'optimizer_final_price_2048':float(-fit.fun),
                'optimizer_success':bool(fit.success),'optimizer_message':str(fit.message),
                'elapsed_seconds':time.time()-started,
                'new_tail_charge':None,
            }
            proposals.append(proposal)
            print(json.dumps({k:proposal[k] for k in ['best_parameters','final_price_16384',
                'optimistic_reduced_cost','cross_radius_coefficient_drift',
                'cross_radius_price_drift','evaluations']}),flush=True)
    result={'status':'FLOATING_HIGHER_GRADE_COLUMN_PRICING_NEW_TAILS_UNPAID',
        'scope':__doc__,
        'response_grading':'Independent proper Gaussian-limit drivers retain original chaos grades 5 or 7; they are not reclassified as first-chaos coordinates.',
        'family':'F=phase(z+a*w) exp(i X* hJ X), G=phase(z-b*w) exp(i Y* kJ Y), with separately normalized linear rows',
        'fixed_dual':lam.tolist(),'baseline_557_pool_objective':baseline,
        'current_incumbent_column_price_under_same_dual':incumbent_price,
        'current_incumbent_577_pool_objective':incumbent_pool['expanded']['score'],
        'optimization':{'method':'Powell','grades':[[1,5],[1,7]],'seeds_per_grade':seeds,
            'bounds':bounds,'max_evaluations_per_seed':args.max_evaluations,
            'degree':257,'odd_coefficients':129,'radius':.98,'FFT_points':2048,
            'total_evaluations':total_evaluations},
        'proposals':proposals,
        'input_fingerprints':[fingerprint(p) for p in [frozen_path,old_path,nineteen_path,
            incumbent_path,incumbent_pool_path,HERE/'fresh_upper_quadratic_kernel.py',
            HERE/'fresh_pool_asymmetric.py']],
        'global_endpoint_changed':False,
        'interpretation':'Prices use a frozen finite-pool dual. New columns have no paid infinite tail or interval error. A nonpositive result does not prove global optimality of the nonlinear family.'}
    if any(p['optimistic_reduced_cost']>0 for p in proposals):
        old=json.loads(old_path.read_text())
        old_heads=np.asarray(old['heads'],float)
        charges=np.asarray(old['tail_charges'],float)
        with np.load(nineteen_path) as archive:
            nineteen=np.array(archive['new_heads'],copy=True)
        incumbent_head=np.asarray(incumbent['head'],float)
        if old_heads.shape!=(557,129) or nineteen.shape!=(19,129) or incumbent_head.shape!=(129,):
            raise ValueError('Unexpected inherited/root pool dimensions')
        incumbent_heads=np.vstack([old_heads,nineteen,incumbent_head])
        incumbent_charges=np.r_[charges,np.zeros(20)]
        incumbent_check=solve(incumbent_heads,incumbent_charges)
        fresh=np.asarray([p['head'] for p in proposals])
        expanded=solve(np.vstack([incumbent_heads,fresh]),np.r_[incumbent_charges,np.zeros(len(fresh))])
        result['expanded_pool']={
            'status':'OPTIMISTIC_FINITE_POOL_ONLY_NEW_TAILS_UNPAID',
            'old_columns':557,'root_new_columns':20,'higher_grade_columns':len(fresh),
            'incumbent_recomputed':incumbent_check,'expanded':expanded,
            'optimistic_gain_over_577_incumbent':expanded['score']-incumbent_check['score'],
            'optimistic_gain_over_557_baseline':expanded['score']-baseline,
            'total_higher_grade_weight':float(sum(expanded['weights'][577:])),
            'higher_grade_weights':expanded['weights'][577:],
        }
    else:
        result['expanded_pool']={'status':'NOT_RUN_NO_POSITIVE_NEW_PRICE'}
    args.out.parent.mkdir(parents=True,exist_ok=True)
    args.out.write_text(json.dumps(result,indent=2)+'\n')
    np.savez(args.out.with_suffix('.npz'),new_heads=np.asarray([p['head'] for p in proposals]),
             frozen_dual=lam)
    return result


def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--repo',type=Path,default=HERE.parent)
    ap.add_argument('--out',required=True,type=Path)
    ap.add_argument('--max-evaluations',type=int,default=300)
    args=ap.parse_args()
    if not 1<=args.max_evaluations<=300:
        ap.error('--max-evaluations must lie between 1 and 300')
    result=run(args)
    print(json.dumps({'status':result['status'],
        'best_new_reduced_cost':max(p['optimistic_reduced_cost'] for p in result['proposals']),
        'expanded_pool_status':result['expanded_pool']['status']},indent=2))


if __name__=='__main__':
    main()
