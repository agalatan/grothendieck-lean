#!/usr/bin/env python3
"""Numerical discovery for finite joint A/B remainders. Agent-ID: codex-a713.
Floating Gaussian quadrature only: no global maximum or certified inequality.
"""
import sys,os
sys.dont_write_bytecode=True
for k in ('VECLIB_MAXIMUM_THREADS','OPENBLAS_NUM_THREADS','OMP_NUM_THREADS'):
    os.environ[k]='1'
from pathlib import Path
ROOT=Path(__file__).resolve().parent
import argparse,json,time
import numpy as np
from scipy.special import roots_laguerre
from scipy.optimize import differential_evolution,minimize


class Objective:
    def __init__(self,nr,nt,rho):
        t,w=roots_laguerre(nr)
        phase=np.exp(2j*np.pi*(np.arange(nt)+.5)/nt)
        self.t=t[:,None]
        self.L=np.sqrt(self.t)*(.5592+.1432*self.t)*phase
        self.A=np.broadcast_to(self.t-1,self.L.shape)
        self.B=self.t*phase**2/np.sqrt(2)
        self.w=w[:,None]/nt
        self.rho=rho

    def evaluate(self,v):
        x,theta,pa,pb=v
        aa=self.rho*np.cos(theta);bb=self.rho*np.sin(theta)
        alpha=aa*np.exp(1j*pa);beta=bb*np.exp(1j*pb)
        V=self.L+x;h=self.A*alpha+self.B*np.conj(beta)
        r=abs(V);rp=abs(V+h)
        linear=np.real(h*V.conj())/r
        # Direct formula is sufficient here: rho>=.01, errors checked by
        # independent quadrature refinement, never used as an interval proof.
        remainder=float(np.sum(self.w*2*(rp-r-linear)))
        p=2500/1891
        rhs=(p-.24)*aa*aa+(p-.26)*bb*bb+.236*aa*bb
        signed_rhs=(p-.24)*aa*aa+(p-.26)*bb*bb-.236*np.real(alpha*np.conj(beta))
        return dict(violation_per_energy=(remainder-rhs)/self.rho**2,
            signed_violation_per_energy=(remainder-signed_rhs)/self.rho**2,
            remainder=remainder,robust_rhs=float(rhs),rho=self.rho,x=float(x),
            alpha=[float(alpha.real),float(alpha.imag)],beta=[float(beta.real),float(beta.imag)],
            params=list(map(float,v)))

    def __call__(self,v):
        return -self.evaluate(v)['violation_per_energy']


def main(a):
    path=ROOT/'improvement_joint_probe.jsonl';start=time.monotonic()
    done={r['rho'] for r in map(json.loads,path.read_text().splitlines())} if path.exists() else set()
    for rho in (.025,.05,.1,.15,.2,.3,.4,.6):
        if rho in done:continue
        obj=Objective(64,128,rho)
        r=differential_evolution(obj,[(0,2),(0,np.pi/2),(-np.pi,np.pi),(-np.pi,np.pi)],
            maxiter=70,popsize=10,tol=1e-7,seed=713+round(rho*1000),workers=1,polish=True)
        checks=[]
        for nr,nt in ((96,256),(192,512),(320,1024)):
            checks.append(dict(nr=nr,nt=nt,**Objective(nr,nt,rho).evaluate(r.x)))
        out=dict(rho=rho,search=obj.evaluate(r.x),checks=checks,
                 evaluations=r.nfev,seconds=time.monotonic()-start,
                 status='Floating quadrature discovery; no rigorous enclosure or global optimum')
        with path.open('a') as f:f.write(json.dumps(out)+'\n')
        print(json.dumps(out),flush=True)
        if time.monotonic()-start>a.seconds:break


if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--seconds',type=int,default=1200)
    main(p.parse_args())
