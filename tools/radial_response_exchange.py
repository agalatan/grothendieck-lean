#!/usr/bin/env python3
"""FLOAT DISCOVERY: replacement radial law with actual response branches.

Fixed audited t,tau,x; radial probability, second/fourth/sixth moments, first
absolute moment and every specified finite Stein cut are imposed. Variables
are masses on (radius, actual bounded response branch), with a latent remote
coin and the fourfold symmetrization explained in joint_branch_exchange.py.
No Gaussian cubic realization, global maximum, or endpoint is claimed.
"""
import argparse,hashlib,json,time,sys
from fractions import Fraction as Q
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parent))
import numpy as np
from scipy.optimize import linprog
import cvxpy as cp
from discover_joint_fibre_cost import load,cells
from joint_branch_exchange import full_model,oracle,response_record

def G(no,u):
 f=lambda x:float(Q(x));mesh=np.array([f(v)**2 for v in no['rv']]);ph=np.array([f(v)for v in no['phi']]+[0.]);integ=np.r_[0,np.cumsum((ph[:-1]+ph[1:])*np.diff(mesh)/2)]
 ii=np.searchsorted(mesh,u,side='right')-1;lo=mesh[ii];slope=np.zeros_like(u);inside=ii<len(mesh)-1
 slope[inside]=(ph[ii[inside]+1]-ph[ii[inside]])/(mesh[ii[inside]+1]-lo[inside]);du=u-lo;phi=ph[ii]+slope*du;Phi=integ[ii]+ph[ii]*du+slope*du*du/2
 d=phi-np.divide(Phi,u,out=np.copy(phi),where=u>0);la,mu,tt,be,nu=[f(no.get(k,'0'))for k in ['lam','mu','t','beta','nu']]
 af,ag=la/3,mu/3
 if 'tensor_budget'in no:af,ag=f(no['tensor_budget']['A'])/2,f(no['tensor_budget']['B'])/2
 assert not no.get('extra_budgets') and la>0 and mu>0
 ff=-(phi+be)/2+(2*tt+af)*u;gg=-d/2+(tt+ag-nu/2)*u;ze=f(no.get('sixth_joint',{}).get('weight','0'))
 return ff*ff/la+gg*gg/mu+Phi-phi+(nu/3-2*tt)*(u*u-2)+ze*(-u**3+9*u*u-12)

def cut_bank(law,extras):
 bank={}
 for item in law['cuts']:
  no=item['data'];assert Q(law['point']['x'])<=Q(no.get('sixth_joint',{}).get('xmax','31/4'))
  bank[json.dumps(no,sort_keys=True)]=(item['name'],no)
 for path in extras:
  item=json.loads(path.read_text())
  if 'cut'not in item:continue
  no=item['cut'];assert Q(no['lam'])>0 and Q(no['mu'])>0 and Q(no.get('nu','0'))>=0
  assert not any(k in no for k in ['extra_budgets','tensor_budget','sixth_joint'])
  bank[json.dumps(no,sort_keys=True)]=(str(path.name),no)
 return list(bank.values())

def solve(m,law,bank,banks,margin):
 v=m['v'];u=v*v;x=float(Q(law['point']['x']));m4=2+x*x;m6=6+9*x*x+40.45313*x**3
 raw=np.array([G(no,u)for name,no in bank]);scale=np.maximum(1e-8,np.max(abs(raw[:,u<=8]),axis=1));cuts=-raw/scale[:,None]
 sizes=list(map(len,banks));idx=np.repeat(np.arange(len(v)),sizes);features=np.array([r['moments']for b in banks for r in b]);F=np.array([r['fibre']for b in banks for r in b]);n=len(F)
 mass=cp.Variable(n,nonneg=True);mom=features.T@mass;delta=mom-m['c'];D=m['eps']/2*cp.square(delta[1])+cp.quad_form(delta[3:],m['C'])
 Aeq=np.vstack([np.ones(n),u[idx],u[idx]**2/m4,features[:,0],features[:,2]]);beq=np.r_[np.ones(3),m['t'],m['tau']]
 Aub=np.vstack([v[idx],u[idx]**3/m6,cuts[:,idx]]);bub=np.r_[.973612157-margin,1-margin,-np.full(len(bank),margin)]
 constraints=[Aeq@mass==beq,Aub@mass<=bub];problem=cp.Problem(cp.Maximize(F@mass-D),constraints)
 problem.solve(solver='CLARABEL',tol_gap_abs=2e-9,tol_feas=1e-9,tol_gap_rel=2e-9,max_iter=250)
 if mass.value is None:raise RuntimeError(problem.status)
 z=np.maximum(mass.value,0);momv=features.T@z;dd=momv-m['c'];eqdual=np.array(constraints[0].dual_value)
 lam=np.r_[-eqdual[3],-m['eps']*dd[1],-eqdual[4],-2*m['C']@dd[3:]]
 Dv=m['eps']/2*dd[1]**2+dd[3:]@m['C']@dd[3:];radial=np.bincount(idx,weights=z,minlength=len(v));off=0;split=[]
 for size in sizes:split.append(z[off:off+size].tolist());off+=size
 return {'score':float(m['base']+F@z-Dv),'fibre':float(F@z),'penalty':float(Dv),'moments':momv.tolist(),'target':m['c'].tolist(),'max_equality_error':float(max(abs(Aeq@z-beq))),'max_scaled_inequality_violation':float(max(Aub@z-bub)),'lambda':lam.tolist(),'radial_weights':radial.tolist(),'branch_masses':split,'status':problem.status,'radial_moments':{str(k):float(radial@v**k)for k in [0,1,2,4,6]},'m6_cap':m6,'minimum_scaled_cut':float(min(raw@radial/scale)),'active_atoms':[{'index':j,'v':float(v[j]),'weight':float(w)}for j,w in enumerate(radial)if w>1e-8]}

def main():
 p=argparse.ArgumentParser(description=__doc__)
 for name in ['audit','law','profiles','price','seedbank','out']:p.add_argument('--'+name,type=Path,required=True)
 p.add_argument('--extra-cuts',type=Path,nargs='*',default=[]);p.add_argument('--nr',type=int,default=48);p.add_argument('--nt',type=int,default=96);p.add_argument('--vmax',type=float,default=8);p.add_argument('--step',type=float,default=.075);p.add_argument('--rounds',type=int,default=3);p.add_argument('--scale',type=float,default=1.00001);p.add_argument('--margin',type=float,default=1e-8);p.add_argument('--seed',type=int,default=17);p.add_argument('--warmbank',type=Path);p.add_argument('--extra-radii',nargs='*',default=[]);p.add_argument('--oracle-nr',type=int,default=48);p.add_argument('--oracle-nt',type=int,default=96);p.add_argument('--active-oracles',action='store_true');a=p.parse_args()
 start=time.monotonic();law=json.loads(a.law.read_text());m=load(a);cells(m,a.nr,a.nt);full_model(m,a.profiles,law);opt=load(a);cells(opt,a.oracle_nr,a.oracle_nt);full_model(opt,a.profiles,law);bank=cut_bank(law,a.extra_cuts);price=json.loads(a.price.read_text());lam=np.array([float(Q(x))for x in price['lambda']]);rng=np.random.default_rng(a.seed);old=json.loads(a.seedbank.read_text())
 def propose(j,l,starts):
  b=oracle(opt,j,l,a.scale,rng,starts)
  return response_record(m,j,b['L_coefficients'],b['phase_D_coefficients'],a.scale)
 if a.warmbank:
  previous=json.loads(a.warmbank.read_text());prior={v:bb for v,bb in zip(previous['radii'],previous['banks'])};v=np.array(sorted(set(previous['radii']+[float(Q(r))for r in a.extra_radii])));m['v']=opt['v']=v;banks=[]
  for j,rad in enumerate(v):
   if rad in prior:banks.append([response_record(m,j,b['L_coefficients'],b['phase_D_coefficients'],a.scale)for b in prior[rad]])
   else:banks.append([propose(j,lam,()),propose(j,np.zeros(5),())])
 else:
  vv=np.r_[np.arange(0,3+a.step/2,a.step),np.arange(3,a.vmax+.001,.25),[float(Q(x['v']))for x in law['support']]]
  vv=np.r_[vv,[float(Q(r))for r in a.extra_radii],*[np.array([float(Q(v))for v in no['rv']])for name,no in bank]];v=np.unique(vv[(vv>=0)&(vv<=a.vmax)]);m['v']=opt['v']=v;banks=[]
  # The response seed bank is attached to the priced source law, which may
  # differ from a newer replacement-law template carrying additional cuts.
  source_v=np.array([float(Q(x['v']))for x in price['support']])
  assert len(source_v)==len(old['banks'])
  for j,rad in enumerate(v):
   near=int(np.argmin(abs(source_v-rad)));bb=old['banks'][near];ranked=sorted(bb,key=lambda b:b['fibre']+lam@np.array(b['moments']),reverse=True)[:3];starts=[m['M']@np.array(b['K'])for b in ranked]
   first=propose(j,lam,starts);second=propose(j,np.zeros(5),[m['M']@np.array(first['K'])])
   banks.append([first,second,response_record(m,j,[1,0],np.zeros(12),a.scale),response_record(m,j,[0,0],np.r_[1,np.zeros(11)],a.scale),response_record(m,j,[0,0],np.zeros(12),a.scale)])
   if j%20==0:print('ORACLE',j,len(v),flush=True)
 out={'scope':__doc__,'index':m['index'],'radii':v.tolist(),'nr':a.nr,'nt':a.nt,'scale':a.scale,'base':m['base'],'cut_count':len(bank),'cuts':[{'name':n,'data':d}for n,d in bank],'source_hashes':{k:hashlib.sha256(getattr(a,k).read_bytes()).hexdigest()for k in ['audit','law','profiles','price']},'rounds':[]}
 for it in range(a.rounds):
  result=solve(m,law,bank,banks,a.margin);out['rounds'].append(result);out.update(result);out['banks']=banks;out['seconds']=time.monotonic()-start;a.out.write_text(json.dumps(out,indent=2)+'\n');print(json.dumps({k:v for k,v in result.items()if k not in ['radial_weights','branch_masses']}),flush=True)
  if it+1<a.rounds:
   lam=np.array(result['lambda'])
   chosen=set(range(len(v)))
   if a.active_oracles:chosen={k for j,w in enumerate(result['radial_weights'])if w>1e-7 for k in range(max(0,j-2),min(len(v),j+3))}
   for j in sorted(chosen):
    bb=banks[j];ranked=sorted(bb,key=lambda b:b['fibre']+lam@np.array(b['moments']),reverse=True)[:3];bb.append(propose(j,lam,[m['M']@np.array(b['K'])for b in ranked]))

if __name__=='__main__':main()
