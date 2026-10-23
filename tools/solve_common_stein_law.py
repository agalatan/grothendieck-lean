#!/usr/bin/env python3
"""FLOAT finite-grid JOINT law/kernel conic relaxation, not an endpoint.

Variables are mass w_i and the SAME weighted conditional X and r at every
test. Perspective cones price their common second moments before eliminating
the kernel. Existing 671 cuts are retained. No discretization is a certificate.
"""
import argparse
from fractions import Fraction as Q
import json
from pathlib import Path
import time

import cvxpy as cp
import numpy as np
from reconstruct_binding_laws import G
from separate_common_stein import exact_profile


def num(s): return float(Q(s))


def solve(law,refined=False,gram=False,budgets=False):
    start=time.monotonic();point=law['point'];pars=law['row_parameters']
    tau,x,t=[num(point[k]) for k in ['tau','x','t']]; chi=x*x
    bank=[a['data'] for a in law['cuts']]
    grids=[np.linspace(0,3,1601),np.linspace(3,12,801),np.linspace(12,24,401)]
    grids += [np.array(list(map(num,a['rv']))) for a in bank]
    for item in law['rows']:
        row=item['row'];grids.append(np.array([num(a)/(num(row['delta'])*tau) for a,b in row['table']]))
    v=np.unique(np.concatenate(grids));v=v[(v>=0)&(v<=24)];u=v*v;n=len(v)
    obj=np.zeros(n)
    for item in law['rows']:
        row=item['row'];sx,sy=np.array([(num(a),num(b)) for a,b in row['table']]).T
        arg=num(row['delta'])*tau*v;tab=np.interp(arg,sx,sy)
        tab=np.where(arg>sx[-1],sy[-1]+num(row['smax'])*(arg-sx[-1]),tab)
        obj+=num(item['weight'])*tab
    raw=np.array([G(c,u) for c in bank]);scale=np.maximum(1e-8,np.max(abs(raw[:,u<=8]),axis=1))
    rv=list(map(Q,['0','1/8','1/4','3/8','1/2','3/4','1','5/4','3/2','2','3','4','6','8','12','16']))
    if refined:rv=sorted(set(rv+[(a+b)/2 for a,b in zip(rv,rv[1:])]))
    # Compute rational profile basis at rationalized grid points only in the
    # separator verifier. This discovery matrix is an exact polynomial formula
    # evaluated in floating point, vectorized for a large grid.
    mesh=np.array([float(a*a) for a in rv]);m=len(rv)-1
    phi=np.zeros((m,n));Phi=phi.copy();d=phi.copy()
    for j in range(m):
        ph=np.array([float(j==k) for k in range(m)]+[0.])
        integ=np.r_[0.,np.cumsum((ph[:-1]+ph[1:])*np.diff(mesh)/2)]
        ii=np.minimum(np.searchsorted(mesh,u,side='right')-1,m)
        slope=np.zeros(n);inner=ii<m
        slope[inner]=(ph[ii[inner]+1]-ph[ii[inner]])/(mesh[ii[inner]+1]-mesh[ii[inner]])
        du=u-mesh[ii];phi[j]=ph[ii]+slope*du
        Phi[j]=integ[ii]+ph[ii]*du+slope*du*du/2
        d[j]=phi[j]-np.divide(Phi[j],u,out=np.copy(phi[j]),where=u>0)
    w=cp.Variable(n,nonneg=True)
    m4=2+chi;m6=6+9*chi+40.45313*x**3
    constraints=[cp.sum(w)==1,u@w==1,(u*u/m4)@w==1,v@w<=.973612157,
        (u**3/m6)@w<=1,(raw/scale[:,None])@w>=0]
    if gram:
        P,C=cp.Variable(),cp.Variable();sx,sr=cp.Variable(),cp.Variable();xi=cp.Variable(m)
        VX=np.vstack([np.ones(n),u,phi]);VR=np.vstack([u,d])
        def matrix(V,vector,sigma):
            k=len(V)
            _,singular,rotation=np.linalg.svd(V.T/np.sqrt(n),full_matrices=False)
            assert singular[-1]>1e-12
            R=rotation/singular[:,None]
            V=R@V;vector=R@vector
            rows=(V[:,None,:]*V[None,:,:]).reshape(k*k,n)
            H=cp.reshape(rows@w,(k,k),order='C')
            # Explicit discovery enlargement, NOT silently treated as exact PSD.
            H=H+1e-8*np.eye(k)
            return cp.bmat([[H,cp.reshape(vector,(k,1),order='C')],
                            [cp.reshape(vector,(1,k),order='C'),cp.reshape(sigma,(1,1),order='C')]])
        HX=matrix(VX,cp.hstack([0,P,xi]),sx)
        HR=matrix(VR,cp.hstack([C,(Phi-phi)@w-xi]),sr)
        constraints += [HX>>0,HR>>0,2*P+C==chi,C<=chi/3,sx<=2*P/3,sr<=2*C/3]
        if budgets:
            for c in bank:
                if 'tensor_budget' not in c: continue
                la,mu=num(c['lam']),num(c['mu'])
                A,B=num(c['tensor_budget']['A']),num(c['tensor_budget']['B'])
                zz=num(c.get('sixth_joint',{}).get('weight','0'))
                fac=max(la,mu,abs(A),abs(B),zz)
                constraints.append((la/fac)*sx+(mu/fac)*sr+(zz/fac)*(u**3@w-6-9*chi)
                                   <=(A/fac)*P+(B/fac)*C)
    else:
        a,b=cp.Variable(n),cp.Variable(n)
        tx,tr=cp.Variable(n,nonneg=True),cp.Variable(n,nonneg=True)
        constraints += [cp.sum(a)==0,2*(u@a)+u@b==chi,u@b<=chi/3,
            cp.SOC(tx+w,cp.vstack([2*a,tx-w]),axis=0),
            cp.SOC(tr+w,cp.vstack([2*b,tr-w]),axis=0),
            cp.sum(tx)<=2*(u@a)/3,cp.sum(tr)<=2*(u@b)/3,
            (Phi-phi)@w==phi@a+d@b,a>=-w,b<=w+a,b>=-w-a]
    prob=cp.Problem(cp.Maximize(obj@w),constraints)
    tol=2e-8 if gram else 2e-9
    prob.solve(solver='CLARABEL',tol_gap_abs=tol,tol_feas=tol,tol_gap_rel=tol,max_iter=150)
    const=t*t-2*num(pars['ell'])*t+2*num(pars['beta'])**2/.745-num(pars['price'])*tau*tau+1e-11
    assert w.value is not None,prob.status
    ww=w.value
    residual={'mass':float(abs(ww.sum()-1)), 'EU':float(abs(u@ww-1)),
        'EU2':float(abs((u*u)@ww-m4)),
        'old_cut_scaled_violation':float(max(0,-np.min((raw/scale[:,None])@ww)))}
    if gram:
        residual.update({'Gram_X_min_eigenvalue':float(np.linalg.eigvalsh(HX.value)[0]),
            'Gram_r_min_eigenvalue':float(np.linalg.eigvalsh(HR.value)[0]),
            'covariance_identity':float(abs(2*P.value+C.value-chi))})
        primal={'v':v.tolist(),'mass':ww.tolist(),'P':float(P.value),'Q':float(C.value),
                'variance_X':float(sx.value),'variance_r':float(sr.value),'xi':xi.value.tolist(),
                'Gram_X':HX.value.tolist(),'Gram_r':HR.value.tolist()}
    else:
        aa,bb=a.value,b.value
        residual.update({'stein_max':float(np.max(abs((Phi-phi)@ww-phi@aa-d@bb))),
        'centering':float(abs(aa.sum())), 'covariance_identity':float(abs(2*u@aa+u@bb-chi)),
        'variance_X_slack':float(2*u@aa/3-np.sum(tx.value)),
        'variance_r_slack':float(2*u@bb/3-np.sum(tr.value))})
        primal={'v':v.tolist(),'mass':ww.tolist(),'weighted_X':aa.tolist(),'weighted_r':bb.tolist()}
    return {'scope':__doc__,'index':law['index'],'status':prob.status,'score':float(const+prob.value),
        'grid_size':n,'gram_compression':gram,'raw_tensor_budgets':budgets,
        'whitened_gram_discovery_ridge':1e-8 if gram else 0,
        'profile_knots':list(map(str,rv)),'residual':residual,'seconds':time.monotonic()-start,
        'duals':[None if c.dual_value is None else ([a.tolist() for a in c.dual_value] if isinstance(c.dual_value,list) else np.asarray(c.dual_value).tolist()) for c in constraints],
        'primal':primal}


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('input',type=Path);p.add_argument('--out',type=Path,required=True)
    p.add_argument('--refined',action='store_true');p.add_argument('--gram',action='store_true')
    p.add_argument('--budgets',action='store_true');a=p.parse_args()
    r=solve(json.loads(a.input.read_text()),a.refined,a.gram,a.budgets)
    a.out.write_text(json.dumps(r,indent=2)+'\n')
    print(json.dumps({k:v for k,v in r.items() if k not in ['primal','duals']}),flush=True)


if __name__=='__main__':main()
