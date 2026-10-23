#!/usr/bin/env python3
"""Floating independent symmetry and oracle-gradient controls, not a certificate."""
import argparse,json
import sys
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parent))
import numpy as np
from joint_branch_exchange import full_model
from discover_joint_fibre_cost import load,cells

def main():
 p=argparse.ArgumentParser()
 for name in ['audit','law','profiles']:p.add_argument('--'+name,required=True,type=__import__('pathlib').Path)
 a=p.parse_args();m=load(a);cells(m,12,24);full_model(m,a.profiles,json.loads(a.law.read_text()));rng=np.random.default_rng(401)
 B,w,z,z1=m['B12'],m['wz'],m['z'],m['z1'];j=1;v=m['v'][j]
 d=.2*rng.standard_normal(12);L=.77*z+.14*z1;P=L+d@B;Q=L-d@B;f=P/abs(P);g=Q/abs(Q)
 def data(f,g):
  h,k=(f+g)/2,(f-g)/2;K=(B.conj()@(w*k)).real
  F=K@m['M']@K+2*(w@(m['L'].conj()*h)).real+2*m['tau']*v*(m['a']@K)
  mom=np.r_[w@(z.conj()*h),w@(z1.conj()*h),v*(w@k),v*(w@(B[1]*k)),v*(w@(B[2].conj()*k))]
  return F,mom,v*(w@h)
 def T(f,g):return(-np.roll(g.reshape(12,24),12,axis=1).ravel(),-np.roll(f.reshape(12,24),12,axis=1).ravel())
 def C(f,g):return(f.reshape(12,24)[:,::-1].conj().ravel(),g.reshape(12,24)[:,::-1].conj().ravel())
 vals=[data(f,g),data(*T(f,g)),data(*C(f,g)),data(*C(*T(f,g)))]
 assert max(abs(vv[0]-vals[0][0])for vv in vals)<1e-12
 assert np.max(abs(vals[1][1]-vals[0][1]))<1e-12
 assert np.max(abs(vals[2][1]-vals[0][1].conj()))<1e-12
 assert abs(sum(vv[2]for vv in vals))<1e-12
 lam=np.array([-.2,.001,-.06,.004,-.002]);Lp=m['L']+.5*(lam[0]*z+lam[1]*z1);aa=m['a'].copy();aa[:3]+=.5*lam[2:]/m['tau'];x=.05*rng.standard_normal(12)
 def obj(x):
  D=(x+m['tau']*v*aa)@B;ap,am=Lp+D,Lp-D;mp,mm=abs(ap),abs(am)
  val=w@(mp+mm)-x@m['Q']@x;grad=(B.conj()@(w*(ap/mp-am/mm))).real-2*m['Q']@x
  return val,grad
 val,grad=obj(x);errors=[]
 for i in range(12):
  e=np.zeros(12);e[i]=1e-6;fd=(obj(x+e)[0]-obj(x-e)[0])/2e-6;errors.append(abs(fd-grad[i]))
 assert max(errors)<1e-8
 print(json.dumps({'symmetry_payoff_max_error':max(abs(vv[0]-vals[0][0])for vv in vals),'symmetrized_remote_h_error':abs(sum(vv[2]for vv in vals)),'oracle_gradient_max_error':max(errors),'status':'PASS floating controls'},indent=2))

if __name__=='__main__':main()
