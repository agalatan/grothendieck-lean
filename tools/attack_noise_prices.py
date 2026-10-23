#!/usr/bin/env python3
"""FLOAT adversary search against a finite-pool physical-kernel price.

The price defines an admissible all-level witness; its global norm is unknown.
This searches only reflected five-mode phase pairs. A newly found high-payoff
column must return to the upper-pool screen with its original-noise kernel.
No integral enclosure or endpoint is produced by this discovery tool.
"""
import argparse
import json
from pathlib import Path

import numpy as np
from scipy.optimize import minimize

from symmetric_cubic_response import basis, coeff, decode
from symmetric_cubic_replicas import sample

PARITY=np.array([1,1,1,1,-1])


def phase_gradient(B,c,target):
    v=B@c;r=np.maximum(abs(v),1e-300);f=v/r
    tangent=(target-f*(f.conj()*target).real)/r
    return B.conj().T@tangent/len(B)


def objective(m,power,seed,price):
    A=basis(m,power,seed)
    rhos=np.array([v['rho'] for v in price['kernel_prices']])
    aa=np.array([v['price'] for v in price['kernel_prices']])
    alpha=1+np.dot(aa,rhos);beta=-price['cubic_price']+np.dot(aa,rhos**3)
    w=np.array([alpha,beta,beta,beta,-beta])
    pairs=[]
    for rho,a in zip(rhos,aa):
        if abs(a)>1e-12:
            B,C,_=sample(m,rho,power,seed+7919)
            pairs.append((a,B,C))
    def fg(x):
        c=decode(x);k=coeff(A,c)
        value=float(np.vdot(k,w*k).real)
        grad=2*phase_gradient(A,c,A@(w*k))
        for a,B,C in pairs:
            v=B@c;vp=C@(PARITY*c)
            f=v/np.maximum(abs(v),1e-300);g=vp/np.maximum(abs(vp),1e-300)
            value-=a*np.mean(f.conj()*g).real
            grad-=a*(phase_gradient(B,c,g)+PARITY*phase_gradient(C,PARITY*c,f))
        return -float(value),-np.r_[grad[1:].real,grad[1:].imag]
    return fg


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--price',type=Path,required=True)
    p.add_argument('--responses',type=Path,required=True)
    p.add_argument('--out',type=Path,required=True)
    p.add_argument('--power',type=int,default=17)
    a=p.parse_args();price=json.loads(a.price.read_text())
    inputs=json.loads(a.responses.read_text());out=[]
    # A gradient check on different data precedes any costly optimization.
    test=objective(4,11,501,price)
    x=np.array([.24,.01,-.01,.2,0,.01,0,0]);_,g=test(x);errors=[]
    # Phase derivatives are large near a zero. Check step-size convergence,
    # rather than accepting a coarse finite difference as a derivative oracle.
    for step in [1e-6,1e-7]:
        fd=[]
        for j in range(8):
            h=np.zeros(8);h[j]=step
            fd.append((test(x+h)[0]-test(x-h)[0])/(2*step))
        errors.append(float(np.max(abs(g-fd))))
    assert errors[-1]<2e-7 and errors[-1]<=.1*errors[0]+2e-8,errors
    print('PASS physical-kernel gradient; converging finite differences',errors,flush=True)
    for m in [16,128]:
        fg=objective(m,a.power,6029,price);trials=[]
        for eps in [.745,.8]:
            r=next(r for r in inputs if r['m']==m and r['epsilon']==eps)
            c=np.array([complex(*z) for z in r['image_coefficients']])
            x=np.r_[c[1:].real,c[1:].imag]
            fit=minimize(fg,x,jac=True,method='L-BFGS-B',bounds=[(-3,3)]*8,
                         options={'ftol':2e-12,'gtol':1e-7,'maxiter':100,'maxls':35})
            trials.append(fit)
            print(m,eps,'fit priced payoff',-fit.fun,'iterations',fit.nit,flush=True)
        best=min(trials,key=lambda r:r.fun);c=decode(best.x)
        r={'scope':__doc__,'m':m,'epsilon':'priced-noise',
           'fit_power':a.power,'image_coefficients':[[float(z.real),float(z.imag)] for z in c],
           'two_branch_images':[[[float(z.real),float(z.imag)] for z in cc] for cc in [c,PARITY*c]],
           'fit_priced_payoff':float(-best.fun),'fit_success':bool(best.success),
           'fit_message':str(best.message),'fit_gradient_max':float(np.max(abs(best.jac)))}
        out.append(r);a.out.write_text(json.dumps(out,indent=2)+'\n')


if __name__=='__main__':main()
