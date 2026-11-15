#!/usr/bin/env python3
"""codex-6e2b: floating supersolution search; NOT a certificate."""
import argparse
import json
from pathlib import Path
import numpy as np
from scipy.integrate import quad
from scipy.optimize import linprog
from scipy.sparse import lil_matrix

a,b,d=699/1250,179/1250,.4

def m2(x):
    def f(y):
        v=x*x+y*y
        t=(2*np.sqrt(a/(3*b))*np.sinh(np.arcsinh(3*np.sqrt(v)/(2*a)*np.sqrt(3*b/a))/3))**2
        p,q=a+b*t,a+3*b*t
        R=b/p+3*b/q
        J=1-(t-d)*(1+R)
        return 8*x*np.exp(-t)*J/(np.pi*p*p*q*q)
    return quad(f,0,40,epsabs=1e-11)[0]

def solve(n=500,ulo=.03,uhi=.0463,slack=.00052):
    xs=np.linspace(0,1,n+1);h=1/n
    f=np.array([m2(x) for x in xs])
    # Unknowns are values and physical derivatives at all knots.
    nv=2*(n+1)
    mat=lil_matrix((8*n+4*n,nv));rhs=np.zeros(12*n)
    power_to_bern=np.array([[1,0,0,0],[1,1/3,0,0],
                            [1,2/3,1/3,0],[1,1,1,1]])
    H=np.array([[1,0,0,0],[0,h,0,0],[-3,-2*h,3,-h],[2,h,-2,h]])
    row=0
    for i in range(n):
        columns=[i,n+1+i,i+1,n+2+i]
        for u in (ulo,uhi):
            Op=np.zeros((4,4))
            for j in range(4):
                Op[j,j]=5/3+j
                if j+1<4:Op[j,j+1]=(j+1)*xs[i]/h
                if j+2<4:Op[j,j+2]=-u*(j+2)*(j+1)/(2*h*h)
            L=power_to_bern@Op@H
            source=power_to_bern@np.array([f[i]+slack,f[i+1]-f[i],0,0])
            for j in range(4):
                mat[row,columns]=-L[j];rhs[row]=-source[j];row+=1
        # The two inner Bernstein coefficients lie in [0,5/8].
        for co in ([1,h/3,0,0],[0,0,1,-h/3]):
            mat[row,columns]=co;rhs[row]=.625;row+=1
            mat[row,columns]=-np.array(co);rhs[row]=0;row+=1
    bounds=[(0,.625)]*(n+1)+[(None,None)]*(n+1)
    bounds[0]=(0,0);bounds[n]=(.625,.625)
    objective=np.r_[np.ones(n+1),np.zeros(n+1)]
    res=linprog(objective,A_ub=mat.tocsr(),b_ub=rhs,bounds=bounds,method='highs',
                options={'dual_feasibility_tolerance':1e-9,'primal_feasibility_tolerance':1e-9})
    print(json.dumps({'N_only':True,'n':n,'u':[ulo,uhi], 'slack':slack,
                      'success':res.success,'message':res.message}),flush=True)
    if res.success:
        print('min_margin',float(np.min(rhs-mat@res.x)),flush=True)
        data={'N_only':True,'n':n,'u':[ulo,uhi],'slack':slack,
              'values':res.x[:n+1].tolist(),'derivatives':res.x[n+1:].tolist()}
        Path('secant_content_candidate.json').write_text(json.dumps(data))

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--n',type=int,default=500)
    p.add_argument('--ulo',type=float,default=.03);p.add_argument('--uhi',type=float,default=.0463)
    p.add_argument('--slack',type=float,default=.00052);q=p.parse_args()
    solve(q.n,q.ulo,q.uhi,q.slack)
