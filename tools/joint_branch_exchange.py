#!/usr/bin/env python3
"""FLOAT DISCOVERY: actual response branch bank with a remote auxiliary coin.

At every q-radius, mix actual response pairs using a latent remote coin.
Average their fibre QUADRATIC values, not their response functions. Fourfold
symmetrization by conjugation and (f,g)->(-g(-z),-f(-z)) preserves the quadratic
payoff, makes selected moments real and cancels the remote h moment.
The coin is part of the remote probability space; no Gaussian cubic claim.
The fixed law, original t/tau equalities and selected projection costs are
retained. Numerical discovery needs an independent rigorous primal replay.
"""
import argparse,json,time,hashlib
from pathlib import Path
from fractions import Fraction as Q
import sys
sys.path.insert(0,str(Path(__file__).resolve().parent))
import numpy as np
import cvxpy as cp
from scipy.optimize import minimize
from discover_joint_fibre_cost import load,cells

def full_model(m,profiles,law):
 ps=json.loads(profiles.read_text());Rm=np.zeros((2,2))
 for item in law['rows']:
  row=item['row'];match=[]
  for p in ps:
   th=list(map(Q,p['theta']))
   if th[:6]==list(map(Q,row['E'])) and th[10:13]==list(map(Q,row['b'])) and th[13:15]==[Q(row['ell']),Q(row['beta'])] and th[9]==Q(row['delta']):match.append(th)
  assert len(match)==1
  th=match[0];Rm+=float(Q(item['weight']))*np.array([[float(th[6]),float(th[7])],[float(th[7]),float(th[8])]])
 B=m['B'];z,z1=m['z'],m['z1'];m['B12']=np.array([B[0],B[1],B[2],1j*B[0],1j*B[1],-1j*B[2],z,z1/np.sqrt(2),1j*z,1j*z1/np.sqrt(2),z.conj(),1j*z.conj()])
 M=np.zeros((12,12));M[:3,:3]=M[3:6,3:6]=m['E'];M[6:8,6:8]=M[8:10,8:10]=Rm;M[10:,10:]=m['eps']*np.eye(2)
 m['M']=M;m['Q']=np.linalg.inv(M);m['a']=np.r_[m['A'],np.zeros(9)]

def response_record(m,j,Lc,dc,scale):
 L=Lc[0]*m['z']+Lc[1]*m['z1'];D=np.array(dc)@m['B12'];af,ag=L+D,L-D
 f=af/np.maximum(abs(af),1e-300)/scale;g=ag/np.maximum(abs(ag),1e-300)/scale
 h,k=(f+g)/2,(f-g)/2;K=(m['B12'].conj()@(m['wz']*k)).real;v=m['v'][j]
 moments=np.r_[(m['wz']@(m['z'].conj()*h)).real,(m['wz']@(m['z1'].conj()*h)).real,v*K[:3]]
 F=K@m['M']@K+2*(m['wz']@(m['L'].conj()*h)).real+2*m['tau']*v*(m['a']@K)
 return {'L_coefficients':list(map(float,Lc)),'phase_D_coefficients':list(map(float,dc)),'scale':scale,'moments':moments.tolist(),'fibre':float(F),'K':K.tolist()}

def oracle(m,j,lam,scale,rng,starts=()):
 Lc=[m['ell']+.5*lam[0],m['beta']+.5*lam[1]];L=Lc[0]*m['z']+Lc[1]*m['z1'];a=m['a'].copy();a[:3]+=.5*lam[2:]/m['tau'];B=m['B12'];v=m['v'][j]
 def obj(x):
  D=(x+m['tau']*v*a)@B;af,ag=L+D,L-D;mf,mg=np.maximum(abs(af),1e-300),np.maximum(abs(ag),1e-300)
  val=(m['wz']@(mf+mg))/scale-x@m['Q']@x
  grad=(B.conj()@(m['wz']*(af/mf-ag/mg))).real/scale-2*m['Q']@x
  return -val,-grad
 init=[np.zeros(12),*starts]+[.08*rng.standard_normal(12)for _ in range(4)]
 best=min([minimize(obj,x,jac=True,method='L-BFGS-B',options={'gtol':1e-9,'ftol':1e-14,'maxiter':400})for x in init],key=lambda r:r.fun)
 return response_record(m,j,Lc,best.x+m['tau']*v*a,scale)

def solve_bank(m,banks,enabled=True):
 sizes=[len(b)for b in banks];w=cp.Variable(sum(sizes),nonneg=True);F=[];features=[];off=0;constraints=[]
 for wv,bank in zip(m['wv'],banks):
  n=len(bank);constraints.append(cp.sum(w[off:off+n])==1);F.extend(wv*np.array([r['fibre']for r in bank]));features.extend(wv*np.array([r['moments']for r in bank]));off+=n
 features=np.array(features);mom=features.T@w;delta=mom-m['c']
 penalty=m['eps']/2*cp.square(delta[1])+cp.quad_form(delta[3:],m['C'])
 constraints.extend([mom[0]==m['c'][0],mom[2]==m['c'][2]])
 problem=cp.Problem(cp.Maximize(np.array(F)@w-(penalty if enabled else 0)),constraints);problem.solve(solver='CLARABEL',tol_gap_abs=1e-10,tol_feas=1e-10,tol_gap_rel=1e-10,max_iter=200)
 if w.value is None:raise RuntimeError(problem.status)
 ww=np.maximum(w.value,0);momv=features.T@ww;dd=momv-m['c'];lam=np.r_[-constraints[-2].dual_value,-m['eps']*dd[1] if enabled else 0,-constraints[-1].dual_value,-2*m['C']@dd[3:] if enabled else np.zeros(2)]
 split=[];off=0
 for n in sizes:split.append(ww[off:off+n].tolist());off+=n
 D=m['eps']/2*dd[1]**2+dd[3:]@m['C']@dd[3:]
 return {'score':float(m['base']+np.array(F)@ww-D),'score_without_penalty':float(m['base']+np.array(F)@ww),'optimization_score':float(m['base']+np.array(F)@ww-(D if enabled else 0)),'penalty':float(D),'fibre':float(np.array(F)@ww),'moments':momv.tolist(),'target':m['c'].tolist(),'equality_errors':dd[[0,2]].tolist(),'lambda':lam.tolist(),'mixing_weights':split,'status':problem.status,'simplex_error':float(max(abs(sum(x)-1)for x in split))}

def main():
 p=argparse.ArgumentParser(description=__doc__)
 for name in ['audit','law','profiles','anchors','symmetric','out']:p.add_argument('--'+name,type=Path,required=True)
 p.add_argument('--nr',type=int,default=128);p.add_argument('--nt',type=int,default=256);p.add_argument('--scale',type=float,default=1.00001);p.add_argument('--rounds',type=int,default=4);p.add_argument('--seed',type=int,default=0);p.add_argument('--warmbank',type=Path);p.add_argument('--penalty',choices=['on','off'],default='on');a=p.parse_args()
 start=time.monotonic();m=load(a);cells(m,a.nr,a.nt);law=json.loads(a.law.read_text());full_model(m,a.profiles,law);rng=np.random.default_rng(a.seed)
 anchors=json.loads(a.anchors.read_text());sym=json.loads(a.symmetric.read_text());lam=np.array(anchors['lambda']);at=m['a'].copy();at[:3]+=.5*lam[2:]/m['tau'];banks=[]
 if a.warmbank:
  previous=json.loads(a.warmbank.read_text())
  banks=[[response_record(m,j,b['L_coefficients'],b['phase_D_coefficients'],a.scale)for b in bank]for j,bank in enumerate(previous['banks'])]
 else:
  for j,v in enumerate(m['v']):
   dc=np.r_[np.array(sym['phase_D_coefficients'][j])[:3],np.zeros(9)]
   escaped=np.array(anchors['results'][j]['anchor_m'])+m['tau']*v*at
   bank=[response_record(m,j,sym['L_coefficients'],dc,a.scale),response_record(m,j,[m['ell']+.5*lam[0],m['beta']+.5*lam[1]],escaped,a.scale),response_record(m,j,[1,0],np.zeros(12),a.scale),response_record(m,j,[0,0],np.r_[1,np.zeros(11)],a.scale),response_record(m,j,[0,0],np.zeros(12),a.scale)]
   bank.append(oracle(m,j,np.zeros(5),a.scale,rng,[m['M']@np.array(r['K'])for r in bank[:2]]));banks.append(bank)
 out={'scope':__doc__,'index':m['index'],'nr':a.nr,'nt':a.nt,'sqrt_R_stop':6,'scale':a.scale,'penalty_enabled':a.penalty=='on','base':m['base'],'audit_sha256':hashlib.sha256(a.audit.read_bytes()).hexdigest(),'law_sha256':hashlib.sha256(a.law.read_bytes()).hexdigest(),'profiles_sha256':hashlib.sha256(a.profiles.read_bytes()).hexdigest(),'rounds':[]}
 for r in range(a.rounds):
  result=solve_bank(m,banks,a.penalty=='on');out['rounds'].append(result);out.update(result);out['banks']=banks;out['seconds']=time.monotonic()-start;a.out.write_text(json.dumps(out,indent=2)+'\n');print(json.dumps({k:v for k,v in result.items()if k!='mixing_weights'}),flush=True)
  if r+1<a.rounds:
   lam=np.array(result['lambda'])
   for j,bank in enumerate(banks):
    ranked=sorted(bank,key=lambda b:b['fibre']+lam@np.array(b['moments']),reverse=True)[:4]
    bank.append(oracle(m,j,lam,a.scale,rng,[m['M']@np.array(b['K'])for b in ranked]))

if __name__=='__main__':main()
