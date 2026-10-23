#!/usr/bin/env python3
"""FLOAT DISCOVERY ONLY: fixed-law joint fibre/projection-cost experiment.

This searches actual bounded responses in an explicitly declared symmetric
family. It proves no upper bound, global optimum, Gaussian-cubic realization,
or Grothendieck endpoint. The full conditional cubic projection is not replaced
by its unprojected coefficient fields. Only valid rank-one projection penalties
are charged. The paired response is g(z,q)=-f(-z,q), so odd conditional fields
of k and the remote h moment vanish by parity.

The phase numerator is L0*z+L1*z*(R-2)+d0(s)+d1(s)*(R-1)+d2(s)*z²/sqrt(2),
with each feature replaced by its analytic cell average. Responses are zero
beyond R=36 and have radius 1/scale on every retained cell. Cell integrals here
use floating special functions; a separate ball-arithmetic replay is needed.
"""
import argparse, hashlib, json, time
from fractions import Fraction as Q
from pathlib import Path
import numpy as np
from scipy.optimize import minimize, root
from scipy.special import gamma, gammainc, gammaincc

def sym3(a):
 a,b,c,d,e,f=a
 return [[a,b,c],[b,d,e],[c,e,f]]

def load(a):
 if not __debug__:raise RuntimeError('Source checks require assertions enabled; omit -O/-OO')
 law=json.loads(a.law.read_text());audit=json.loads(a.audit.read_text())
 rec=next(r for r in audit['selected'] if r['index']==law['index'])
 assert law['point']['t']==rec['envelope_argmax']['t']
 assert law['point']['tau']==rec['envelope_argmax']['tau']
 eps=Q(law['witness_epsilon']);assert eps==Q(149,200)
 EQ=[[Q(0)for _ in range(3)]for _ in range(3)];AQ=[Q(0)]*3
 ell=beta=Q(0)
 for item in law['rows']:
  w=Q(item['weight']);r=item['row'];E=sym3(list(map(Q,r['E'])))
  for i in range(3):
   for j in range(3):EQ[i][j]+=w*E[i][j]
   AQ[i]+=w*Q(r['delta'])*(Q(i==0)+Q(r['b'][i]))
  ell+=w*Q(r['ell']);beta+=w*Q(r['beta'])
 ca,cb,cc=map(Q,rec['retained_squares']['C']);alpha=list(map(Q,rec['retained_squares']['gate_minimizer_Y_over_p']))
 assert [EQ[1][1],EQ[1][2],EQ[2][2]]==[ca,cb,cc]
 assert ca*alpha[0]+cb*alpha[1]==-EQ[1][0]-AQ[1]
 assert cb*alpha[0]+cc*alpha[1]==-EQ[2][0]-AQ[2]
 assert ell==Q(rec['row_parameters']['ell']) and beta==Q(rec['row_parameters']['beta'])
 price=EQ[0][0]-eps+2*AQ[0]+(EQ[0][1]+AQ[1])*alpha[0]+(EQ[0][2]+AQ[2])*alpha[1]
 assert price==Q(rec['row_parameters']['price'])
 vv=[Q(r['v'])for r in law['support']];ww=[Q(r['weight'])for r in law['support']]
 assert sum(ww)==1 and sum(w*v*v for w,v in zip(ww,vv))==1
 t,tau=Q(law['point']['t']),Q(law['point']['tau'])
 m={'index':law['index'],'eps':float(eps),'t':float(t),'tau':float(tau),'ell':float(ell),'beta':float(beta),'E':np.array(EQ,dtype=float),'A':np.array(AQ,dtype=float),'C':np.array([[ca,cb],[cb,cc]],dtype=float),'v':np.array(vv,dtype=float),'wv':np.array(ww,dtype=float)}
 m['c']=np.array([float(t),float(-2*beta/eps),float(tau),float(alpha[0]*tau),float(alpha[1]*tau)])
 m['Winv']=np.zeros((5,5));m['Winv'][1,1]=2/float(eps);m['Winv'][3:,3:]=np.linalg.inv(m['C'])
 m['base']=float(t*t-2*ell*t+2*beta*beta/eps-price*tau*tau)
 return m

def cells(m,nr,nt):
 edges=np.linspace(0,6,nr+1)**2
 def integral(k):
  a,b,p=edges[:-1],edges[1:],k+1
  return gamma(p)*np.where(a<p,gammainc(p,b)-gammainc(p,a),gammaincc(p,a)-gammaincc(p,b))
 mass=integral(0);r=integral(1)/mass
 ph=np.exp(2j*np.pi*(np.arange(nt)+.5)/nt)
 z=(integral(.5)[:,None]/mass[:,None]*ph*np.sinc(1/nt)).ravel()
 z1=((integral(1.5)-2*integral(.5))[:,None]/mass[:,None]*ph*np.sinc(1/nt)).ravel()
 B=np.array([np.ones(nr*nt),np.repeat(r-1,nt),(r[:,None]*ph[None,:]**2*np.sinc(2/nt)/np.sqrt(2)).ravel()])
 m.update(B=B,z=z,z1=z1,wz=np.repeat(mass/nt,nt),L=m['ell']*z+m['beta']*z1)

def evaluate(m,K,lam,scale,penalty):
 E,A,B,w=m['E'],m['A'],m['B'],m['wz'];L=m['L']+.5*(lam[0]*m['z']+lam[1]*m['z1'])
 a=A+.5*lam[2:]/m['tau'];mom=np.zeros(5);support=quad=vis=remote=0.;ka=[];dc=[]
 for v,wv,k0 in zip(m['v'],m['wv'],K):
  d=E@k0+m['tau']*v*a;D=d@B
  af,ag=L+D,L-D;mf,mg=np.maximum(abs(af),1e-300),np.maximum(abs(ag),1e-300)
  f,g=af/mf/scale,ag/mg/scale;h,k=(f+g)/2,(f-g)/2
  kr=(B.conj()@(w*k)).real;ka.append(kr);dc.append(d)
  mom+=wv*np.r_[(w@(m['z'].conj()*h)).real,(w@(m['z1'].conj()*h)).real,v*kr]
  support+=wv*(w@(mf+mg))/scale;quad+=wv*(kr@E@kr)
  vis+=wv*2*(w@(m['L'].conj()*h)).real;remote+=wv*2*m['tau']*v*(A@kr)
 ka=np.array(ka);delta=mom-m['c'];D=m['eps']/2*delta[1]**2+delta[3:]@m['C']@delta[3:]
 dual=support-np.einsum('n,ni,ij,nj',m['wv'],K,E,K)-lam@m['c']+.25*lam@m['Winv']@lam
 grad=delta+.5*m['Winv']@lam;primal=quad+vis+remote-(D if penalty else 0)
 tangent=primal-np.einsum('n,ni,ij,nj',m['wv'],ka-K,E,ka-K)
 g=m['wv']@(m['v'][:,None]*ka);r=ka-m['v'][:,None]*g
 cancelled=m['t']**2-m['eps']/2*mom[1]**2+m['eps']*m['tau']**2+np.einsum('n,ni,ij,nj',m['wv'],r,E,r)
 detail={'moments':mom.tolist(),'target':m['c'].tolist(),'equality_errors':delta[[0,2]].tolist(),'fibre_terms':{'quadratic':float(quad),'visible':float(vis),'remote':float(remote)},'penalty':float(D),'score':float(m['base']+quad+vis+remote-D),'score_without_penalty':float(m['base']+quad+vis+remote),'optimization_score':float(m['base']+primal),'cancelled_score':float(cancelled),'convex_subproblem_gap':float(dual-tangent),'gradient':grad.tolist(),'phase_D_coefficients':np.array(dc).tolist(),'L_coefficients':[m['ell']+.5*lam[0],m['beta']+.5*lam[1]],'K':ka.tolist(),'lambda':lam.tolist()}
 return dual,grad,ka,detail

def seed(m,rng):
 Qe=np.linalg.inv(m['E']);K=[]
 for v in m['v']:
  def obj(x):
   D=(x+m['tau']*v*m['A'])@m['B'];af,ag=m['L']+D,m['L']-D
   mf,mg=np.maximum(abs(af),1e-300),np.maximum(abs(ag),1e-300)
   val=m['wz']@(mf+mg)-x@Qe@x
   grad=(m['B'].conj()@(m['wz']*(af/mf-ag/mg))).real-2*Qe@x
   return -val,-grad
  trials=[minimize(obj,x,jac=True,method='BFGS',options={'gtol':1e-9,'maxiter':200})for x in [np.zeros(3),.05*rng.standard_normal(3)]]
  best=min(trials,key=lambda r:r.fun);K.append(Qe@best.x)
 return np.array(K)

def main():
 p=argparse.ArgumentParser(description=__doc__)
 p.add_argument('--audit',type=Path,required=True);p.add_argument('--law',type=Path,required=True);p.add_argument('--out',type=Path,required=True)
 p.add_argument('--nr',type=int,default=128);p.add_argument('--nt',type=int,default=256);p.add_argument('--scale',type=float,default=1.00001)
 p.add_argument('--iterations',type=int,default=30);p.add_argument('--penalty',choices=['on','off'],default='on');p.add_argument('--warm',type=Path);p.add_argument('--seed',type=int,default=0)
 a=p.parse_args();assert a.nr>=2 and a.nt>=4 and a.nt%2==0 and a.scale>1
 started=time.monotonic();m=load(a);cells(m,a.nr,a.nt);enabled=a.penalty=='on';ids=np.array(list(range(5))if enabled else[0,2])
 if a.warm:
  old=json.loads(a.warm.read_text());K=np.array(old['K'])[:,:3];lam=np.array(old['lambda'])
 else:K=seed(m,np.random.default_rng(a.seed));lam=np.zeros(5)
 out={'scope':__doc__,'index':m['index'],'nr':a.nr,'nt':a.nt,'sqrt_R_stop':6,'scale':a.scale,'penalty_enabled':enabled,'seed':a.seed,'base':m['base'],'audit_sha256':hashlib.sha256(a.audit.read_bytes()).hexdigest(),'law_sha256':hashlib.sha256(a.law.read_bytes()).hexdigest(),'history':[]}
 out['unconstrained_start']=evaluate(m,K,np.zeros(5),a.scale,enabled)[3]
 for it in range(a.iterations):
  def expand(x):
   l=np.zeros(5);l[ids]=x;return l
  def obj(x):
   val,grad,_,_=evaluate(m,K,expand(x),a.scale,enabled);return val,grad[ids]
  ans=minimize(obj,lam[ids],jac=True,method='BFGS',options={'gtol':1e-10,'maxiter':150})
  val,grad,ka,detail=evaluate(m,K,expand(ans.x),a.scale,enabled)
  if max(abs(grad[ids]))>1e-10:
   rr=root(lambda x:evaluate(m,K,expand(x),a.scale,enabled)[1][ids],ans.x,tol=1e-10)
   val,grad,ka,detail=evaluate(m,K,expand(rr.x),a.scale,enabled)
  detail.update(iteration=it,optimizer_success=bool(ans.success),seconds=time.monotonic()-started)
  out['history'].append({k:detail[k]for k in ['iteration','optimization_score','score','penalty','equality_errors','convex_subproblem_gap','seconds']});out.update(detail)
  a.out.parent.mkdir(parents=True,exist_ok=True);a.out.write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out['history'][-1]),flush=True)
  if it>1 and abs(out['history'][-1]['optimization_score']-out['history'][-2]['optimization_score'])<1e-10:break
  K=ka;lam=np.array(detail['lambda'])

if __name__=='__main__':main()
