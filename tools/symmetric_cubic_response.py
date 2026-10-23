#!/usr/bin/env python3
"""FLOAT discovery on an exact five-mode invariant response family.

The five modes are ORIGINAL first/cubic chaoses. G below is a scalar joint-law
coordinate, not a new first-chaos coordinate. In particular A_Y shares |G|²
with q. This is a restricted actual-response engine, not a global norm oracle.
Heavy runs belong on ssh yo in this branch's task directory.
"""
import argparse
import json
from pathlib import Path
import time

import numpy as np
from scipy.optimize import minimize
from scipy.special import gammaincinv, ndtri
from scipy.stats import qmc


def basis(m,power,seed):
    d=m*(m+1)//2
    u=qmc.Sobol(6,scramble=True,seed=seed).random_base2(power)
    normal=ndtri(u[:,:4]);Z=(normal[:,0]+1j*normal[:,1])/np.sqrt(2)
    G=(normal[:,2]+1j*normal[:,3])/np.sqrt(2)
    R=gammaincinv(m,u[:,4]);V=gammaincinv(d-1,u[:,5]) if d>1 else np.zeros(len(u))
    AX=(R-m)/np.sqrt(m)
    AY=(abs(G)**2+V-d)/np.sqrt(d)
    q=R*G/np.sqrt(m*(m+1))
    return np.column_stack([Z,Z*(abs(Z)**2-2)/np.sqrt(2),Z*AX,Z*AY,q])


def coeff(B,c):
    v=B@c;f=v/np.maximum(abs(v),1e-300)
    return B.conj().T@f/len(B)


def decode(x):return np.r_[1.,x[:4]+1j*x[4:]]


def optimize(B,eps,x0):
    weights=np.array([1,-eps,-eps,-eps,eps])
    def fg(x):
        c=decode(x);v=B@c;r=np.maximum(abs(v),1e-300);f=v/r
        k=B.conj().T@f/len(B);image=B@(weights*k)
        score=np.vdot(k,weights*k).real
        tangent=(image-f*(f.conj()*image).real)/r
        grad=2*(B.conj().T@tangent)/len(B)
        return -score,-np.r_[grad[1:].real,grad[1:].imag]
    r=minimize(fg,x0,jac=True,method='L-BFGS-B',bounds=[(-3,3)]*8,
               options={'ftol':2e-13,'gtol':1e-8,'maxiter':120,'maxls':40})
    c=decode(r.x);k=coeff(B,c)
    return c,k,{'status':r.message,'success':bool(r.success),'iterations':r.nit,
                'fit_score':float(-r.fun),'gradient_max':float(np.max(abs(r.jac))),
                'image_fixed_point_residual':float(np.max(abs((weights*k)/(weights*k)[0]-c)))}


def run(m,eps,fit_power,eval_power,seed):
    start=time.monotonic();B=basis(m,fit_power,seed)
    # A seed for phase(linear + visible Wick + independent cubic). Optimization
    # includes BOTH overlapping quadratic fields and complex coefficients.
    x0=np.array([.24,0.,0.,.20,0.,0.,0.,0.])
    c0=decode(x0);c,k,op=optimize(B,eps,x0);w=np.array([1,-eps,-eps,-eps,eps])
    image=w*k;image/=image[0]
    parity=np.array([1,1,1,1,-1]);multipliers=np.array([1,-eps,-eps,-eps,-eps])
    cf,cg=c.copy(),parity*c
    training=[]
    for j in range(40):
        cf=multipliers*coeff(B,cg);cf/=max(np.linalg.norm(cf),1e-300)
        cg=multipliers*coeff(B,cf);cg/=max(np.linalg.norm(cg),1e-300)
        value=float(np.vdot(coeff(B,cf),multipliers*coeff(B,cg)).real)
        if training:assert value>=training[-1]-1e-12,(training[-1],value)
        training.append(value)
        if len(training)>1 and abs(training[-1]-training[-2])<1e-11:break
    matrices=[];kk=[];baseline=[];nextk=[];pairf=[];pairg=[]
    for ds in [1001,2003]:
        A=basis(m,eval_power,seed+ds)
        matrices.append(float(np.max(abs(A.conj().T@A/len(A)-np.eye(5)))))
        kk.append(coeff(A,c));baseline.append(coeff(A,c0));nextk.append(coeff(A,image))
        pairf.append(coeff(A,cf));pairg.append(coeff(A,cg))
    score=float(np.vdot(kk[0],w*kk[1]).real)
    base=float(np.vdot(baseline[0],w*baseline[1]).real)
    br=float((np.vdot(nextk[0],w*kk[1])+np.vdot(nextk[1],w*kk[0])).real/2)
    paired=float((np.vdot(pairf[0],multipliers*pairg[1])+np.vdot(pairf[1],multipliers*pairg[0])).real/2)
    return {'scope':__doc__,'m':m,'original_remote_dimension':m+m*(m+1)//2,
            'epsilon':eps,'fit_power':fit_power,'eval_power':eval_power,'seed':seed,
            'image_coefficients':[[float(z.real),float(z.imag)] for z in c],
            'optimization':op,'holdout_cross_score':score,'holdout_baseline_cross_score':base,
            'holdout_one_sided_update_cross_score':br,
            'holdout_two_branch_cross_score':paired,'alternating_fit_values':training,
            'two_branch_images':[[[float(z.real),float(z.imag)] for z in cc] for cc in [cf,cg]],
            'holdout_plug_in_scores':[float(np.vdot(v,w*v).real) for v in kk],
            'projection_coefficients':[[[float(z.real),float(z.imag)] for z in v] for v in kk],
            'holdout_basis_gram_max_errors':matrices,'seconds':time.monotonic()-start}


def check_gradient():
    B=basis(4,12,17);eps=.7564;c=decode(np.array([.23,.02,-.01,.2,0.,.01,0.,0.]))
    x=np.r_[c[1:].real,c[1:].imag];w=np.array([1,-eps,-eps,-eps,eps])
    v=B@c;r=abs(v);f=v/r;k=coeff(B,c);image=B@(w*k)
    grad=2*B.conj().T@((image-f*(f.conj()*image).real)/r)/len(B)
    analytic=np.r_[grad[1:].real,grad[1:].imag];finite=[]
    for j in range(8):
        h=np.zeros(8);h[j]=1e-6
        a,b=coeff(B,decode(x+h)),coeff(B,decode(x-h))
        finite.append((np.vdot(a,w*a).real-np.vdot(b,w*b).real)/2e-6)
    error=float(np.max(abs(analytic-finite)));assert error<2e-7,error
    print('PASS analytic gradient against finite differences',error,flush=True)


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--out',type=Path,required=True)
    p.add_argument('--fit-power',type=int,default=18);p.add_argument('--eval-power',type=int,default=20)
    p.add_argument('--m',default='4,16,128');p.add_argument('--epsilon',default='.745,.7564')
    a=p.parse_args();check_gradient();rr=[]
    for eps in map(float,a.epsilon.split(',')):
        for m in map(int,a.m.split(',')):
            r=run(m,eps,a.fit_power,a.eval_power,41);rr.append(r)
            a.out.write_text(json.dumps(rr,indent=2)+'\n')
            print(m,eps,{k:r[k] for k in ['holdout_cross_score','holdout_baseline_cross_score','holdout_one_sided_update_cross_score','seconds']},flush=True)


if __name__=='__main__':main()
