#!/usr/bin/env python3
"""codex-6e2b: optimize new scalar caps numerically; no proof claims."""
import json
import math
from pathlib import Path
import sys
import numpy as np
from scipy.optimize import linprog
from scipy.sparse import lil_matrix

sys.path.insert(0,str(Path(__file__).resolve().parent))
from deficit_structure_content_search import m2

def solve(ulo,source,n=500):
    h=1/n;xs=np.linspace(0,1,n+1);nv=2*(n+1)+1;ci=nv-1
    mat=lil_matrix((12*n+n+1,nv));rhs=np.zeros(12*n+n+1)
    PB=np.array([[1,0,0,0],[1,1/3,0,0],[1,2/3,1/3,0],[1,1,1,1]])
    H=np.array([[1,0,0,0],[0,h,0,0],[-3,-2*h,3,-h],[2,h,-2,h]])
    row=0
    for i in range(n):
        columns=[i,n+1+i,i+1,n+2+i]
        for u in (ulo,.0463):
            Op=np.zeros((4,4))
            for j in range(4):
                Op[j,j]=5/3+j
                if j+1<4:Op[j,j+1]=(j+1)*xs[i]/h
                if j+2<4:Op[j,j+2]=-u*(j+2)*(j+1)/(2*h*h)
            L=PB@Op@H
            src=PB@np.array([source[i]+.00052,source[i+1]-source[i],0,0])
            for j in range(4):
                mat[row,columns]=-L[j];rhs[row]=-src[j];row+=1
        for co in ([1,h/3,0,0],[0,0,1,-h/3]):
            mat[row,columns]=co;mat[row,ci]=-1;row+=1
            mat[row,columns]=-np.array(co);row+=1
    for i in range(n+1):mat[row,i]=1;mat[row,ci]=-1;row+=1
    assert row==mat.shape[0]
    eq=lil_matrix((1,nv));eq[0,n]=1;eq[0,ci]=-1
    bounds=[(0,None)]*(n+1)+[(None,None)]*(n+1)+[(.6,.8)]
    bounds[0]=(0,0);bounds[2*n+1]=(0,None)
    objective=np.zeros(nv);objective[ci]=1
    options={'dual_feasibility_tolerance':1e-9,'primal_feasibility_tolerance':1e-9}
    res=linprog(objective,A_ub=mat.tocsr(),b_ub=rhs,A_eq=eq.tocsr(),b_eq=[0],
                bounds=bounds,method='highs',options=options)
    assert res.success,res.message
    optimum=res.x[ci]
    fitted=(math.ceil(optimum*10000)+2)/10000
    bounds[ci]=(fitted,fitted)
    objective[:n+1]=1;objective[ci]=0
    res=linprog(objective,A_ub=mat.tocsr(),b_ub=rhs,A_eq=eq.tocsr(),b_eq=[0],
                bounds=bounds,method='highs',options=options)
    assert res.success,res.message
    tag=str(round(ulo*1000)).zfill(3)
    data={'agent_id':'codex-6e2b','n':n,'u':[str(ulo),'.0463'],
          'cap':f'{fitted+.000001:.6f}','endcap':f'{fitted:.4f}','absolute':False,
          'values':[str(v) for v in res.x[:n+1]],
          'derivatives':[str(v) for v in res.x[n+1:2*n+2]]}
    data['values'][0]='0';data['values'][-1]=data['endcap']
    Path('deficit_structure_refine_witness_'+tag+'.json').write_text(json.dumps(data,indent=2)+'\n')
    print(json.dumps({'N_only':True,'u_min':ulo,'optimized_cap':optimum,
          'fitted_cap':fitted,'certification_cap':data['cap'],
          'content_coefficient':11/108*float(data['cap'])**2,
          'minimum_margin':float(np.min(rhs-mat@res.x))}),flush=True)

if __name__=='__main__':
    f=np.array([m2(x) for x in np.linspace(0,1,501)])
    for u in [.009,.012,.015,.018,.02]:solve(u,f)
