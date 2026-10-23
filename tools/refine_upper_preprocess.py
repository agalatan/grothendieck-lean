#!/usr/bin/env python3
"""FLOAT sequential LP for the complete stored upper head (degree 501).

P,Q stay in their exact coefficient-l1 balls after rationalization. Each LP
uses the exact algebraic polynomial Jacobian; proposals are accepted only by
nonlinear recomposition. The output still requires directed head and Hardy
replays, and it inherits the master's table/comparison inputs.
"""
import argparse
from fractions import Fraction as F
import json
from pathlib import Path

import numpy as np
from scipy.optimize import linprog

from upper_polynomial import table_head,shifted_columns,feasible_rationals


def refine(data,P,Q,iterations=25):
    initial=table_head(data,P,Q);initialscore=initial[0]-sum(abs(initial[1:]))
    trust=.001;history=[];n=len(P);m=len(Q)-1;d=250;micro=1e6
    for it in range(iterations):
        h,jp,jq=table_head(data,P,Q,jacobian=True)
        J=np.column_stack([shifted_columns(jp,range(n),251),shifted_columns(jq,range(1,m+1),251)])
        nc=n+m;N=nc+d+n+m;A=[];b=[]
        for k in range(d):
            for sign in [-1,1]:
                row=np.zeros(N);row[:nc]=sign*micro*J[k+1];row[nc+k]=-1
                A.append(row);b.append(-sign*micro*h[k+1])
        for j in range(n):
            for sign in [-1,1]:
                row=np.zeros(N);row[j]=sign;row[nc+d+j]=-1
                A.append(row);b.append(-sign*P[j])
        row=np.zeros(N);row[nc+d:nc+d+n]=1;A.append(row);b.append(1.)
        for j in range(m):
            for sign in [-1,1]:
                row=np.zeros(N);row[n+j]=sign;row[nc+d+n+j]=-1
                A.append(row);b.append(-sign*Q[j+1])
        row=np.zeros(N);row[nc+d+n:]=1;A.append(row);b.append(1.)
        bounds=[(-trust,trust)]*(n+m)+[(0,None)]*(d+n+m)
        obj=np.r_[-micro*J[0],np.ones(d),np.zeros(n+m)]
        lp=linprog(obj,A_ub=A,b_ub=b,bounds=bounds,
                   options={'primal_feasibility_tolerance':1e-10,'dual_feasibility_tolerance':1e-10})
        assert lp.success,lp.message
        old=h[0]-sum(abs(h[1:]));accepted=False
        for factor in [1.,.5,.25,.125,.0625]:
            pp=np.array([float(F(x)) for x in feasible_rationals(P+factor*lp.x[:n])])
            qq=Q.copy();qq[1:]+=factor*lp.x[n:n+m]
            qq=np.array([float(F(x)) for x in feasible_rationals(qq)])
            new=table_head(data,pp,qq);score=new[0]-sum(abs(new[1:]))
            if score>old+2e-13:
                P,Q=pp,qq;accepted=True;break
        history.append({'iteration':it,'accepted':accepted,'score':float(score if accepted else old),
                        'gain':float(score-initialscore if accepted else old-initialscore),'trust':trust})
        print('REFINE',json.dumps(history[-1]),flush=True)
        if not accepted:
            trust/=4
            if trust<1e-7:break
    pp=feasible_rationals(P);qq=feasible_rationals(Q)
    final=table_head(data,np.array(list(map(lambda x:float(F(x)),pp))),np.array(list(map(lambda x:float(F(x)),qq))))
    return {'P':pp,'Q':qq,'initial_head_score':float(initialscore),
            'head_score':float(final[0]-sum(abs(final[1:]))),'head':final.tolist(),'history':history}


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('input',type=Path)
    p.add_argument('--out',type=Path,required=True);p.add_argument('--iterations',type=int,default=25)
    p.add_argument('--initial',type=Path)
    p.add_argument('--p-terms',type=int,default=21);p.add_argument('--q-terms',type=int,default=4)
    a=p.parse_args();data=json.loads(a.input.read_text())
    P=np.array([float(F(x)) for x in data['pList']]);Q=np.array([float(F(x)) for x in data['qList']])
    if a.initial:
        old=json.loads(a.initial.read_text());P=np.array([float(F(x)) for x in old['P']]);Q=np.array([float(F(x)) for x in old['Q']])
    P=np.pad(P,(0,max(0,a.p_terms-len(P))));Q=np.pad(Q,(0,max(0,a.q_terms-len(Q))))
    assert len(P)<=251 and len(Q)<=251 and Q[0]==0
    result=refine(data,P,Q,a.iterations)
    result['status']='FLOAT_PROPOSAL_DIRECTED_REPLAYS_REQUIRED'
    result['gain_over_source_head']=result['head_score']-result['initial_head_score']
    a.out.write_text(json.dumps(result,indent=2)+'\n');print('DONE gain',result['gain_over_source_head'],flush=True)


if __name__=='__main__':main()
