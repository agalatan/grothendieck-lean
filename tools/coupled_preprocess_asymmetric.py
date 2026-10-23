#!/usr/bin/env python3
"""Small discovery-only inverse-prefix diagnostic for neutral quadratic chirps.

No Grothendieck endpoint, tail certificate, or global optimality claim.
The separate Arb checker proves the local expansion and symmetric-class
ceiling. This script only records a bounded-cost floating diagnostic.
"""
import argparse
import json
import math
from pathlib import Path
import sys
import numpy as np
from scipy.optimize import minimize


def inverse_prefix(parameters,target=.711947):
    a,d,delta=parameters
    D0=1+a*d+1j*(a-d)
    B=a*d/D0
    phase_coeff=np.array([1,1/8,3/64,25/1024])
    coeff=np.array([sum(phase_coeff[j]*B**(k-j) for j in range(k+1))
                    for k in range(4)])
    coeff=np.real(np.exp(1j*delta)*coeff)/abs(D0)
    if coeff[0]<=0:
        return 1e6
    A,B1,C=coeff[1:]/coeff[0]
    inv=np.array([1,-A,3*A*A-B1,-12*A**3+8*A*B1-C])
    x=4*target/math.pi/coeff[0]
    return float(np.sum(np.abs(inv)*x**np.array([1,3,5,7])))


def run():
    starts=[[0,0,0],[.1,-.1,0],[.1,-.1,.05],[.3,-.2,0],[.3,.2,0]]
    results=[]
    for seed in starts:
        ans=minimize(inverse_prefix,seed,method='Nelder-Mead',
                     options={'maxiter':300,'xatol':1e-9,'fatol':1e-12})
        results.append({'start':seed,'parameters':ans.x.tolist(),
                        'inverse_prefix':float(ans.fun),
                        'evaluations':int(ans.nfev),'converged':bool(ans.success)})
    return {'status':'FLOATING_DISCOVERY_ONLY_NO_GLOBAL_CLAIM',
            'target_score':.711947,
            'family':'Real conjugate-reflected mixture of phase(z)*exp(i*a*|w|^2) and phase(z)*exp(i*d*|w|^2), constant phase delta relative to positive-slope orientation.',
            'baseline_inverse_prefix':inverse_prefix([0,0,0]),
            'inverse_terms_retained':[1,3,5,7],
            'runs':results,
            'scope':'Arbitrary common scalar preprocessing is screened by inverse prefix. This diagnostic does not rule out nonlocal asymmetric kernels, independent preprocessors, or arbitrary mixtures.'}


if __name__=='__main__':
    if sys.flags.optimize:
        raise SystemExit('Refusing -O/-OO')
    p=argparse.ArgumentParser();p.add_argument('--output',type=Path,required=True)
    args=p.parse_args()
    result=run()
    args.output.parent.mkdir(parents=True,exist_ok=True)
    args.output.write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps(result,indent=2))
