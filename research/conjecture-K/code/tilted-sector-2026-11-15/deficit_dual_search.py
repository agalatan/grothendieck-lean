#!/usr/bin/env python3
"""Agent-ID: codex-6e2b. N-only spectral Stein dual candidate search.

Optimizes the archived spectral cut at fixed energy and fourth cumulant.
A sampled SOCP solution is NOT a continuous-domain certificate. New outputs
are confined to this script's handoff folder; archive witnesses are read-only.
"""
import argparse
from fractions import Fraction
import json
from pathlib import Path
import time
import numpy as np
import cvxpy as cp
from scipy.integrate import quad
from scipy.special import erfc, i0e, i1e

ROOT=Path(__file__).resolve().parent
ARCHIVE=ROOT.parents[2]/'research/conjecture-K/code/audit-2026-11-15-codex-a7c4/remote_stein_original'
a,b,p=699/1250,179/1250,2500/1891
C6=40.45313
h0=np.sqrt(np.pi)*(a+1.5*b)
I0=np.pi/np.sqrt(a*b)*np.exp(a/b)*erfc(np.sqrt(a/b))


def Fnum(x):return float(Fraction(x))


def load_inputs(extended=False):
    node=json.loads((ARCHIVE/'stein-nodes.json').read_text())[-1]
    knots=np.array(list(map(Fnum,node['knots'])))
    data=json.loads((ARCHIVE/'profile-caps.json').read_text())
    if extended:
        extra=json.loads((ROOT/'deficit_dual_profile_caps.json').read_text())
        data['cells']+=extra['cells'];data['tail']=extra['tail']
    tail_start=Fnum(data['cells'][-1]['interval'][1])
    starts=np.array([Fnum(d['interval'][0]) for d in data['cells']]+[tail_start])
    coeff=[list(map(Fnum,d['coefficients'])) for d in data['cells']]
    coeff.append(list(map(Fnum,data['tail']))+[0.,0.])
    return knots,starts,np.array(coeff)


def profile_caps(s,starts,coeff):
    s=np.asarray(s)
    index=np.maximum(0,np.searchsorted(starts,s,side='right')-1)
    c=coeff[index]
    return ((c[:,3]*s+c[:,2])*s+c[:,1])*s+c[:,0]


def profile_matrices(U,knots):
    N,J=len(U),len(knots)
    phi=np.zeros((N,J));primitive=np.zeros((N,J))
    prefix=np.zeros((J,J))
    for j in range(J-1):
        prefix[j+1]=prefix[j]
        prefix[j+1,j:j+2]+=(knots[j+1]-knots[j])/2
    for i,x in enumerate(U):
        j=min(np.searchsorted(knots,x,side='right')-1,J-1)
        if j==J-1:
            phi[i,j]=1
            primitive[i]=prefix[j];primitive[i,j]+=x-knots[j]
        else:
            length=knots[j+1]-knots[j];r=x-knots[j];z=r/length
            phi[i,j]=1-z;phi[i,j+1]=z
            primitive[i]=prefix[j]
            primitive[i,j]+=r-r*r/(2*length)
            primitive[i,j+1]+=r*r/(2*length)
    ratio=np.zeros_like(primitive)
    nonzero=U>0
    ratio[nonzero]=primitive[nonzero]/U[nonzero,None]
    d=phi-ratio;d[~nonzero]=0
    return phi,primitive-phi,d


def gaussian_B(u):
    def fun(t):
        x=t*(a+b*t)**2/u
        return np.exp(-t)*((1+x)*i0e(x/2)+x*i1e(x/2))
    return np.sqrt(np.pi*u)*quad(fun,0,40,epsabs=2e-11,epsrel=2e-11,limit=400)[0]


def content(u,chi):
    delta=chi*u*u
    vals=[.08*delta,3*delta**1.5,.0004,.019321*u]
    if u>=.03:vals.append((1077659/27000000)*delta)
    return min(vals)


def solve(u,chi,knots,starts,coeff,U,solver='CLARABEL',psd=False):
    phiM,AM,dM=profile_matrices(U,knots)
    profile=(profile_caps(u*U,starts,coeff)-h0-I0*u*U)/(u*u)
    n=len(U);ones=np.ones(n)
    phi=cp.Variable(len(knots),name='phi')
    beta=cp.Variable(name='beta');t=cp.Variable(name='t')
    lam=cp.Variable(name='lambda');mu=cp.Variable(name='mu');nu=cp.Variable(nonneg=True,name='nu')
    P=cp.Variable(4,name='P')
    z1=cp.Variable(n);z2=cp.Variable(n)
    f=-(phiM@phi+beta)/2+(2*t+lam/3)*U
    g=-(dM@phi)/2+(t+mu/3-nu/2)*U
    extra=0
    if psd:
        sp=cp.Variable(len(knots),nonneg=True,name='psd_plus')
        sm=cp.Variable(len(knots),nonneg=True,name='psd_minus')
        plus,minus=phiM@sp,phiM@sm
        f=f+(plus+minus)/2;g=g+(plus-minus)/2;extra=plus+minus
    weight=1/(1+U*U)
    f=cp.multiply(np.sqrt(weight),f);g=cp.multiply(np.sqrt(weight),g)
    basis=np.column_stack([ones,U,U*U,U**3])*weight[:,None]
    constraint=[phi[0]==0,lam>=1e-9,mu>=1e-9,P[3]>=0,
        cp.SOC(lam*ones+z1,cp.vstack([2*f,lam*ones-z1]),axis=0),
        cp.SOC(mu*ones+z2,cp.vstack([2*g,mu*ones-z2]),axis=0),
        basis@P>=cp.multiply(weight,profile+AM@phi+(nu/3-2*t)*(U*U-2)+extra)+z1+z2]
    moments=np.array([1,1,2+chi,6+9*chi+C6*chi**1.5])
    problem=cp.Problem(cp.Minimize(moments@P),constraint)
    opts=dict(tol_gap_abs=1e-9,tol_gap_rel=1e-9,tol_feas=1e-9,max_iter=250)
    started=time.time()
    problem.solve(solver=solver,**opts)
    result={'status':problem.status,'seconds':time.time()-started,'u':u,'chi':chi,
            'objective_scaled':float(problem.value),'grid_count':n,'psd':psd}
    if P.value is None:return result
    result.update({'knots':knots.tolist(),'phi_scaled':phi.value.tolist(),
                   'beta_scaled':float(beta.value),'t_scaled':float(t.value),
                   'lam_scaled':float(lam.value),'mu_scaled':float(mu.value),
                   'nu_scaled':float(nu.value),'P_scaled':P.value.tolist()})
    if psd:
        result['psd_plus_scaled']=sp.value.tolist()
        result['psd_minus_scaled']=sm.value.tolist()
    result['F_bound_sampled']=h0+I0*u+u*u*float(problem.value)
    result['B_numerical']=gaussian_B(u)
    result['D_lower_sampled']=result['B_numerical']-result['F_bound_sampled']
    result['content_bound']=content(u,chi)
    result['required_D']=max(0.,(result['content_bound']-6e-6)/.3)
    result['N_margin']=result['D_lower_sampled']-result['required_D']
    return result


def candidate_gap(result,U,starts,coeff):
    u=result['u'];knots=np.array(result['knots'])
    phiM,AM,dM=profile_matrices(U,knots)
    phi=np.array(result['phi_scaled'])
    lam,mu,nu=result['lam_scaled'],result['mu_scaled'],result['nu_scaled']
    t,beta=result['t_scaled'],result['beta_scaled']
    f=-(phiM@phi+beta)/2+(2*t+lam/3)*U
    g=-(dM@phi)/2+(t+mu/3-nu/2)*U
    extra=0
    if result.get('psd'):
        plus=phiM@np.array(result['psd_plus_scaled'])
        minus=phiM@np.array(result['psd_minus_scaled'])
        f=f+(plus+minus)/2;g=g+(plus-minus)/2;extra=plus+minus
    cut=f*f/lam+g*g/mu+AM@phi+(nu/3-2*t)*(U*U-2)+extra
    profile=(profile_caps(u*U,starts,coeff)-h0-I0*u*U)/(u*u)
    P=np.array(result['P_scaled'])
    return ((P[3]*U+P[2])*U+P[1])*U+P[0]-profile-cut


def main():
    parser=argparse.ArgumentParser()
    parser.add_argument('--u',type=float,default=.0463)
    parser.add_argument('--chi',type=float,nargs='+',default=[.1,.3,1.,3.,5.,10.])
    parser.add_argument('--rounds',type=int,default=3)
    parser.add_argument('--psd',action='store_true')
    parser.add_argument('--extended-profile',action='store_true')
    parser.add_argument('--output',default='deficit_dual_candidates.json')
    args=parser.parse_args()
    assert 0<args.u<=.0463 and all(0<x<=42 for x in args.chi)
    knots,starts,coeff=load_inputs(args.extended_profile)
    initial=np.unique(np.r_[np.linspace(0,12,481),np.linspace(12,40,113),np.geomspace(40,256,65),knots,starts/args.u])
    validation=np.unique(np.r_[np.linspace(0,12,6001),np.linspace(12,40,2801),np.linspace(40,256,10801),np.geomspace(256,max(2048,64/args.u),2001),knots,starts/args.u])
    results=[]
    for chi in args.chi:
        grid=initial.copy()
        for iteration in range(args.rounds):
            result=solve(args.u,chi,knots,starts,coeff,grid,psd=args.psd)
            if 'P_scaled' not in result:break
            gap=candidate_gap(result,validation,starts,coeff)
            result['extended_profile']=args.extended_profile
            result['validation_min_gap_scaled']=float(gap.min())
            bad=np.flatnonzero(gap < -1e-6)
            result['validation_bad_count']=len(bad)
            result['iteration']=iteration
            print(json.dumps({k:v for k,v in result.items() if not isinstance(v,list)}),flush=True)
            if len(bad)==0:break
            order=bad[np.argsort(gap[bad])[:150]]
            grid=np.unique(np.r_[grid,validation[order]])
        results.append(result)
    out={'Agent-ID':'codex-6e2b','status':'N only: sampled SOCP duals, no global polynomial acceptance',
         'results':results}
    assert args.output.startswith('deficit_dual') and Path(args.output).name==args.output
    (ROOT/args.output).write_text(json.dumps(out,indent=2)+'\n')


if __name__=='__main__':main()
