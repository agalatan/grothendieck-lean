#!/usr/bin/env python3
"""Discovery radial separation for the FIXED five moment-price vector.

Each objective entry is an actual bounded response's priced payoff, hence a
lower estimate of the source support. No global inner maximum is assumed.
The output law satisfies the specified finite radial relaxation numerically.
"""
import argparse,json,sys
from fractions import Fraction as Q
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parent))
import numpy as np
from scipy.optimize import linprog
from radial_response_exchange import G

def main():
 p=argparse.ArgumentParser(description=__doc__)
 for k in ['bank','law','price','out']:p.add_argument('--'+k,type=Path,required=True)
 a=p.parse_args();b=json.loads(a.bank.read_text());law=json.loads(a.law.read_text());price=json.loads(a.price.read_text());lam=np.array([float(Q(x))for x in price['lambda']]);v=np.array(b['radii']);u=v*v;x=float(Q(law['point']['x']));m4=2+x*x;m6=6+9*x*x+40.45313*x**3
 raw=np.array([G(i['data'],u)for i in b['cuts']]);scale=np.maximum(1e-8,np.max(abs(raw[:,u<=8]),axis=1));Aub=np.vstack([v,u**3/m6,-raw/scale[:,None]]);bub=np.r_[.973612157-1e-8,1-1e-8,-np.full(len(raw),1e-8)];Aeq=np.vstack([np.ones_like(v),u,u*u/m4]);beq=np.ones(3)
 branch=[];obj=[]
 for bb in b['banks']:
  vals=[r['fibre']+lam@np.array(r['moments'])for r in bb];j=int(np.argmax(vals));branch.append(j);obj.append(vals[j])
 obj=np.array(obj);lp=linprog(-obj,A_ub=Aub,b_ub=bub,A_eq=Aeq,b_eq=beq,bounds=(0,None),method='highs',options={'primal_feasibility_tolerance':1e-9,'dual_feasibility_tolerance':1e-9})
 if not lp.success:raise RuntimeError(lp.message)
 target=price['target'];t,tau,eps,beta=[float(Q(target[k]))for k in ['t','tau','epsilon','beta']];alpha=np.array([float(Q(x))for x in target['gate_alpha']]);ca,cb,cc=[float(Q(x))for x in target['gate_C']];C=np.array([[ca,cb],[cb,cc]]);c=np.r_[t,-2*beta/eps,tau,alpha*tau]
 constant=b['base']-lam@c+lam[1]**2/(2*eps)+lam[3:]@np.linalg.inv(C)@lam[3:]/4
 mom=sum((w*np.array(bb[j]['moments'])for w,bb,j in zip(lp.x,b['banks'],branch)),np.zeros(5))
 result={'scope':__doc__,'index':b['index'],'radii':v.tolist(),'radial_weights':lp.x.tolist(),'branch_indices':branch,'score':float(constant+lp.x@obj),'constant':float(constant),'lambda':lam.tolist(),'moments':mom.tolist(),'target':c.tolist(),'contact_errors':(mom-c)[[0,2]].tolist(),'max_equality_error':float(max(abs(Aeq@lp.x-beq))),'max_scaled_inequality_violation':float(max(Aub@lp.x-bub)),'minimum_scaled_cut':float(min(raw@lp.x/scale)),'active_atoms':[{'index':j,'v':float(v[j]),'weight':float(w),'branch':branch[j]}for j,w in enumerate(lp.x)if w>1e-10]}
 a.out.write_text(json.dumps(result,indent=2)+'\n');print(json.dumps({k:v for k,v in result.items()if k not in ['radii','radial_weights','branch_indices']},indent=2))

if __name__=='__main__':main()
