#!/usr/bin/env python3
"""FLOAT screen: a genuine finite-dimensional cubic against ALL stored rows.

Q_m has law R_m G/sqrt(m(m+1)), R_m~Gamma(m,1), G~CN(0,1).
Optimize all row weights, retaining the common beta and Schur gate price.
A surviving floor concerns fixed stored TABLES, not exact fibre potentials.
"""
import argparse
from fractions import Fraction as Q
import json
from pathlib import Path
import numpy as np
from scipy.special import roots_genlaguerre, gamma, erfc
import cvxpy as cp

def num(a):return float(Q(a))

def expectation(row,m,tau,power):
    T,ww=roots_genlaguerre(power,m-1);ww/=gamma(m)
    x,y=np.array([(num(a),num(b)) for a,b in row['table']]).T
    slopes=np.r_[np.diff(y)/np.diff(x),num(row['smax'])]
    sig=num(row['delta'])*tau*T/np.sqrt(m*(m+1))
    h=y[0]+np.sqrt(np.pi)*sig/2*(slopes[0]+np.diff(slopes)@erfc(x[1:,None]/sig[None,:]))
    return float(ww@h)

def solve(rows,m,t,tau,power):
    eps=.745;ell=[];beta=[];kk=[];hh=[];CC=[];values=[]
    for row in rows:
        E=list(map(num,row['E']));b=list(map(num,row['b']));delta=num(row['delta'])
        ell.append(num(row['ell']));beta.append(num(row['beta']))
        kk.append(E[0]-eps+2*delta*(1+b[0]))
        hh.append([E[1]+delta*b[1],E[2]+delta*b[2]])
        CC.append([[E[3],E[4]],[E[4],E[5]]]);values.append(expectation(row,m,tau,power))
    ell,beta,kk,hh,CC,values=map(np.array,[ell,beta,kk,hh,CC,values])
    w=cp.Variable(len(rows),nonneg=True)
    h=hh.T@w;C=cp.bmat([[CC[:,i,j]@w for j in range(2)] for i in range(2)])
    objective=t*t+(-2*t*ell+values-tau*tau*kk)@w+2/eps*cp.square(beta@w)+tau*tau*cp.matrix_frac(h,C)+1e-11
    prob=cp.Problem(cp.Minimize(objective),[cp.sum(w)==1]);prob.solve(solver='CLARABEL',tol_gap_abs=1e-10,tol_feas=1e-10,tol_gap_rel=1e-10)
    ws=np.maximum(0,w.value);ws/=ws.sum();beta0=beta@ws;z=np.linalg.solve(np.einsum('i,ijk->jk',ws,CC),hh.T@ws)
    lower=t*t-2*beta0*beta0/eps+np.min(-2*t*ell+values-tau*tau*kk+4*beta0/eps*beta+
        tau*tau*(2*hh@z-np.einsum('i,nij,j->n',z,CC,z)))+1e-11
    return {'scope':__doc__,'m':m,'kurtosis_excess':(8*m+12)/(m*(m+1)),'t':t,'tau':tau,'quadrature':power,
        'score':prob.value,'tangent_floor':float(lower),'weights':ws.tolist(),'beta0':float(beta0),'z':z.tolist(),
        'row_expectations':values.tolist(),'status':prob.status}

def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('rows',type=Path);p.add_argument('--out',type=Path,required=True)
    a=p.parse_args();rows=json.loads(a.rows.read_text());rr=[]
    for m in [14,16,20]:
        for power in [64,128]:
            r=solve(rows,m,.8525,.239818283,power);rr.append(r)
            a.out.write_text(json.dumps(rr,indent=2)+'\n')
            print(m,power,r['score'],r['tangent_floor'],flush=True)

if __name__=='__main__':main()
