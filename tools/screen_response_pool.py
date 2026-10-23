#!/usr/bin/env python3
"""FLOAT necessary bound for mixtures, from original-noise kernel values.

This solves a relaxation ABOVE the best complete score in a finite response
pool. It can reject a poor pool after rigorous integral enclosure; it NEVER
proves that its optimum is an achievable score. Here the inputs are floating
discovery integrals, so no rejection or endpoint is certified.
"""
import argparse
import hashlib
import json
from fractions import Fraction as Q
from pathlib import Path

import numpy as np
from scipy.optimize import linprog
from scipy.special import hyp2f1


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('inputs',type=Path,nargs='+')
    p.add_argument('--out',type=Path,required=True)
    p.add_argument('--phase-baseline',action='store_true')
    p.add_argument('--graded-variances',default='')
    a = p.parse_args()
    rows = sum((json.loads(f.read_text()) for f in a.inputs),[])
    rho = np.array([k['rho'] for k in rows[0]['kernels']])
    if a.phase_baseline:
        rows.append({'m':1,'epsilon_used_to_find_response':None,
                     'c0_cross_estimate':np.pi/4,'c1_cross_estimate':np.pi/32,
                     'kernels':[{'rho':float(r), 'mean':float(np.pi*r/4*
                         hyp2f1(.5,.5,2,r*r)) if r<1 else 1.} for r in rho]})
    for text in filter(None,a.graded_variances.split(',')):
        v=float(Q(text));assert v>=0
        t=(rho-v*rho**3)/(1+v)
        rows.append({'m':'graded-Gaussian limit','epsilon_used_to_find_response':'variance='+text,
                     'c0_cross_estimate':float(np.pi/(4*(1+v))),
                     'c1_cross_estimate':float(np.pi*(-v/(4*(1+v))+1/(32*(1+v)**3))),
                     'kernels':[{'rho':float(r),'mean':float(np.pi*x/4*hyp2f1(.5,.5,2,x*x))}
                                for r,x in zip(rho,t)]})
    assert all([k['rho'] for k in r['kernels']]==list(rho) for r in rows)
    c0 = np.array([r['c0_cross_estimate'] for r in rows])
    c1 = np.array([r['c1_cross_estimate'] for r in rows])
    kernels = np.array([[k['mean'] for k in r['kernels']] for r in rows]).T
    rem = kernels-rho[:,None]*c0-rho[:,None]**3*c1
    n = len(rows)
    obj = np.r_[-c0,1,1]
    A = [np.r_[c1,-1,0], np.r_[-c1,-1,0]]
    for rr,rrho in zip(rem,rho):
        A.extend([np.r_[rr,0,-rrho**5],np.r_[-rr,0,-rrho**5]])
    fit = linprog(obj,A_ub=np.array(A),b_ub=np.zeros(len(A)),
                  A_eq=[np.r_[np.ones(n),0,0]],b_eq=[1],bounds=(0,None),method='highs')
    assert fit.success,fit.message
    multipliers = -fit.ineqlin.marginals
    s = float(multipliers[0]-multipliers[1])
    prices = multipliers[2::2]-multipliers[3::2]
    budget = float(np.sum(abs(prices)*rho**5))
    assert abs(s)<=1+1e-8 and budget<=1+1e-8
    priced = c0-s*c1-prices@rem
    dual = float(np.max(priced))
    assert abs(dual+fit.fun)<1e-8,(dual,-fit.fun)
    # If every c0,c1,K is enclosed within delta, this bounds the added
    # error for the same prices. No value of delta is assumed certified.
    amplification = float(1+abs(s)+np.sum(abs(prices)*(1+rho+rho**3)))
    certificate_path=Path(__file__).resolve().parents[1]/'data/upper-preprocess/certificate.json'
    certificate=json.loads(certificate_path.read_text())
    qi=Q(certificate['incumbent_score'])
    incumbent=float(qi)
    # Freeze a genuinely admissible rational all-level price. This proves
    # algebra on the stored midpoint data, NOT the Gaussian integral values.
    qr=[Q(str(float(r))) for r in rho]
    qa=[Q(str(float(p))).limit_denominator(10**6) for p in prices]
    qb=sum(abs(p)*r**5 for p,r in zip(qa,qr))
    qa=[p/max(Q(1),qb) for p in qa]
    qs=max(Q(-1),min(Q(1),Q(str(s)).limit_denominator(10**6)))
    frozen=[];qbounds=[]
    for row in rows:
        q0=Q(str(row['c0_cross_estimate']));q1=Q(str(row['c1_cross_estimate']))
        qk=[Q(str(k['mean'])) for k in row['kernels']]
        qv=q0-qs*q1-sum(p*(k-q0*r-q1*r**3) for p,k,r in zip(qa,qk,qr))
        qbounds.append(qv)
        frozen.append({'c0':str(q0),'c1':str(q1),'kernels':list(map(str,qk))})
    qbound=max(qbounds)
    qamp=1+abs(qs)+sum(abs(p)*(1+r+r**3) for p,r in zip(qa,qr))
    incumbent_slope=Q(certificate['slopeQ'])
    incumbent_residual=Q(certificate['delta'])
    assert incumbent_slope-incumbent_residual==qi
    rational={'scope':'Exact algebra on frozen floating midpoints; no integral enclosure.',
              'cubic_price':str(qs),'tests':[{'rho':str(r),'price':str(p)} for r,p in zip(qr,qa)],
              'midpoint_columns':frozen,'midpoint_bound':str(qbound),
              'uniform_error_amplification':str(qamp),'target_score':str(qi),
              'sufficient_uniform_enclosure':str(max(Q(0),(qi-qbound)/qamp))}
    out = {'scope':__doc__,'pool_columns':n,'incumbent_full_score':incumbent,
           'full_score_upper_screen':dual,'cubic_price':s,
           'kernel_prices':[{'rho':float(r),'price':float(p)} for r,p in zip(rho,prices)],
           'price_budget':budget,'uniform_integral_error_amplification':amplification,
           'sufficient_uniform_enclosure_to_exclude_pool':max(0,(incumbent-dual)/amplification),
           'rational_midpoint_screen':rational,
           'incumbent_ledger':{
               'source':'data/upper-preprocess/certificate.json; under DirectHyps',
               'certificate_sha256':hashlib.sha256(certificate_path.read_bytes()).hexdigest(),
               'slope':str(incumbent_slope),'l1_residual':str(incumbent_residual),
               'any_admissible_price_payoff_upper':str(incumbent_slope+incumbent_residual),
               'note':'The incumbent is retained via its certified residual enclosure, not treated as an exact linear kernel column.'},
           'columns':[{'m':r['m'],'discovery_epsilon':r['epsilon_used_to_find_response'],
                       'mixture_weight':float(w),'priced_score_upper_screen':float(v)}
                      for r,w,v in zip(rows,fit.x[:n],priced)],
           'warning':'The displayed relaxation optimum is NOT an achievable rounding score.'}
    a.out.write_text(json.dumps(out,indent=2)+'\n')
    print(json.dumps(out,indent=2))


if __name__=='__main__':
    main()
