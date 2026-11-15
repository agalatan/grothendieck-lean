#!/usr/bin/env python3
"""codex-6e2b: numerical primal Stein feasibility diagnostic, NOT proof."""
import argparse
import json
import time
from pathlib import Path
from fractions import Fraction
import numpy as np
import cvxpy as cp
from scipy.special import ellipe,i0e,i1e
from scipy.integrate import quad
from scipy.optimize import linprog

a,b=699/1250,179/1250
C6=40.45313
gamma=1077659/27000000
h0=np.sqrt(np.pi)*(a+1.5*b)
j0=1.4319737912915

def profile(s):
    if s==0:return h0
    rho=np.sqrt(s)
    root=(2*np.sqrt(a/(3*b))*np.sinh(np.arcsinh(3*rho/(2*a)*np.sqrt(3*b/a))/3))**2
    def fun(t):
        r=np.sqrt(t)*(a+b*t);summ=r+rho
        return 4/np.pi*np.exp(-t)*summ*ellipe(min(4*r*rho/summ**2,1))
    return quad(fun,0,60,epsabs=1e-11,points=[min(root,59.9)],limit=150)[0]

def gaussian(u):
    def fun(t):
        r=np.sqrt(t)*(a+b*t);z=r*r/(2*u)
        return np.sqrt(np.pi*u)*np.exp(-t)*((1+2*z)*i0e(z)+2*z*i1e(z))
    return quad(fun,0,60,epsabs=1e-12)[0]

def test_matrices(U,knots):
    N=len(U);K=len(knots)
    phi=np.zeros((K,N));Phi=np.zeros((K,N))
    for j,x in enumerate(U):
        for k,(l,h) in enumerate(zip(knots[:-1],knots[1:])):
            end=min(x,h)
            if end>l:
                r=(end-l)/(h-l)
                Phi[k,j]+=(end-l)*(1-r/2);Phi[k+1,j]+=(end-l)*r/2
            if l<=x<h:
                r=(x-l)/(h-l);phi[k,j]=1-r;phi[k+1,j]=r
        if x>=knots[-1]:phi[-1,j]=1;Phi[-1,j]+=x-knots[-1]
    d=phi.copy();d[:,1:]-=Phi[:,1:]/U[None,1:];d[:,0]=0
    return phi,Phi-phi,d

def main(energies,chis,archive_knots=True,max_u=1000,psd=False):
    start=time.time()
    U=np.unique(np.r_[np.linspace(0,5,201),np.linspace(5.1,20,150),
        np.linspace(20.5,60,80),np.arange(62,202,2),np.arange(205,505,5),[750,1000]])
    U=U[U<=max_u]
    if archive_knots:
        path=Path('/Users/alingalatan/workspaces/grothe/research/conjecture-K/code/audit-2026-11-15-codex-a7c4/remote_stein_original/stein-nodes.json')
        knots=np.array([float(Fraction(x)) for x in json.loads(path.read_text())[0]['knots']])
    else:knots=np.r_[np.arange(0,10.0001,.25),[12,16,24,40,80,160,320,640,1000]]
    phi,A,d=test_matrices(U,knots);N=len(U)
    # The last test is redundant with the other basis tests, EU=1, EX=0.
    # Dropping its linearly growing tail improves numerical conditioning.
    phi,A,d=phi[:-1],A[:-1],d[:-1]
    p=cp.Variable(N,nonneg=True);m=cp.Variable(N);n=cp.Variable(N)
    zx=cp.Variable(N,nonneg=True);zr=cp.Variable(N,nonneg=True)
    chi=cp.Parameter(nonneg=True);m3=cp.Parameter(nonneg=True);obj=cp.Parameter(N)
    P=U@m;R=U@n
    cons=[cp.sum(p)==1,U@p==1,(U**2/100)@p==(2+chi)/100,
        (U**3/10000)@p<=m3/10000,cp.sum(m)==0,2*P+R==chi,R<=chi/3,
        cp.sum(zx)<=2*P/3,cp.sum(zr)<=2*R/3,A@p==phi@m+d@n,
        cp.SOC(p+zx,cp.vstack([2*m,p-zx]),axis=0),
        cp.SOC(p+zr,cp.vstack([2*n,p-zr]),axis=0)]
    if psd:cons += [p+m>=n,p+m>=-n]
    prob=cp.Problem(cp.Maximize(obj@p),cons)
    print(json.dumps({'N_only':True,'nodes':N,'tests':len(knots)-1,'knots':knots.tolist(),'psd':psd}),flush=True)
    for u in energies:
        H=np.array([profile(u*x) for x in U]);B=gaussian(u)
        residual=H-h0-j0*u*U;obj.value=residual*10000
        for ch in chis:
            chi.value=ch;m3.value=6+9*ch+C6*ch**1.5
            tick=time.time()
            val=prob.solve(solver='CLARABEL',tol_gap_abs=1e-9,tol_gap_rel=1e-9,
                           tol_feas=1e-9,max_iter=300)
            F=h0+j0*u+val/10000
            lp=linprog(-residual,A_ub=[U**3/10000],b_ub=[m3.value/10000],
                A_eq=np.array([np.ones(N),U,U**2/100]),b_eq=[1,1,(2+ch)/100],
                bounds=(0,None),method='highs')
            Fmom=h0+j0*u-lp.fun if lp.success else float('nan')
            delta=u*u*ch
            bounds=[.08*delta,3*delta**1.5,.0004,.019321*u]
            if .009<=u<=.0463:bounds.append(11/192*delta)
            if .02<=u<=.0463:bounds.append(539/10800*delta)
            if .03<=u<=.0463:bounds.append(gamma*delta)
            if .04<=u<=.0463:bounds.append(11/300*delta)
            content=min(bounds);needed=max((content-6e-6)/.3,0)
            row={'N_only':True,'u':u,'chi':ch,'delta':delta,'status':prob.status,
                'stein_D':B-F,'moment_D':B-Fmom,'content_bound':content,
                'D_needed':needed,'B_margin':.3*max(B-F,0)+6e-6-content,
                'maximum_constraint_violation':max(float(np.max(c.violation())) for c in cons),
                'seconds':time.time()-tick}
            print(json.dumps(row),flush=True)
    print(json.dumps({'N_only':True,'total_seconds':time.time()-start}),flush=True)

if __name__=='__main__':
    parser=argparse.ArgumentParser()
    parser.add_argument('--energies',default='.01,.02,.03,.04,.0463')
    parser.add_argument('--chis',default='.1,.3,1,2,4,6,10,20,42')
    parser.add_argument('--max-u',type=float,default=1000)
    parser.add_argument('--psd',action='store_true')
    args=parser.parse_args()
    main(list(map(float,args.energies.split(','))),list(map(float,args.chis.split(','))),max_u=args.max_u,psd=args.psd)
