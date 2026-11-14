"""codex-a713. Independent deterministic full H_(2,1)(C^2) audit.

No imports or code from tables.py/kscan.py. Kernels use smooth Abel transforms
derived in the record's wick_cert/proof.md, not elliptic angular integrals.
All computations are ordinary floating quadrature, not interval certificates.
"""
import os
os.environ['OPENBLAS_NUM_THREADS']='1'
os.environ['OMP_NUM_THREADS']='1'
os.environ['VECLIB_MAXIMUM_THREADS']='1'
import numpy as np
from scipy.special import roots_legendre, roots_laguerre
from scipy.interpolate import CubicSpline
from scipy.optimize import minimize
from pathlib import Path
import json, sys, time

ROOT=Path(__file__).resolve().parent
A=699/1250; B=179/1250; U=.0463

def leg(n,lo,hi):
    x,w=roots_legendre(n)
    return (x+1)*(hi-lo)/2+lo,w*(hi-lo)/2

def abel_kernels(v,order=96):
    """phi(v), g(v), using two regular integrals and the inverse cubic."""
    v=np.atleast_1d(v)
    th,wt=leg(order,0,np.pi/2)
    y,wy=leg(order,0,8)
    sn=np.sin(th)**2; cs=1-sn
    outp=[]; outg=[]
    for start in range(0,len(v),64):
        z=v[start:start+64,None]*sn
        radial=2*np.sqrt(A/(3*B))*np.sinh(np.arcsinh(3*np.sqrt(z)/(2*A)*np.sqrt(3*B/A))/3)
        t0=radial**2
        d0=(A+B*t0)*(A+3*B*t0)
        e0=2*A*B+3*B*B*t0
        t=t0[:,:,None]+y*y
        den=np.sqrt(d0[:,:,None]+e0[:,:,None]*y*y+B*B*y**4)
        base=np.exp(-t)/den*wy
        aa=base.sum(2)
        hh=(base*(A+3*B*t)/(A+B*t)).sum(2)
        vv=(base*(A+B*t)*(A+3*B*t)).sum(2)
        outp.extend(4/np.pi*((vv+2*v[start:start+64,None]*cs*aa)*wt).sum(1))
        outg.extend(-2/np.pi*(sn*hh*wt).sum(1))
    return np.array(outp),np.array(outg)

class Kernel:
    def __init__(self,step=.002,order=96):
        fn=ROOT/f'opt_abel_{step}_{order}.npz'
        if fn.exists():
            z=np.load(fn); x,p,g=z['x'],z['p'],z['g']
        else:
            x=np.arange(0,18+step/2,step)
            p,g=abel_kernels(.02*np.expm1(x),order)
            np.savez(fn,x=x,p=p,g=g)
        self.p=CubicSpline(x,p); self.g=CubicSpline(x,g)
        r,w=roots_laguerre(160)
        self.bu=float(w@self.values(U*r)[0])
    def values(self,v):
        x=np.log1p(v/.02); scale=1/(v+.02)
        return self.p(x),self.g(x),self.p(x,1)*scale,self.g(x,1)*scale

class Rule:
    def __init__(self,n=64,nt=64):
        r,w=roots_laguerre(n)
        th=2*np.pi*np.arange(nt)/nt
        R,S,T=np.meshgrid(r,r,th,indexing='ij')
        X=np.sqrt(R).ravel().astype(complex)
        Y=(np.sqrt(S)*np.exp(1j*T)).ravel()
        self.weights=np.broadcast_to(w[:,None,None]*w[None,:,None]/nt,R.shape).ravel()
        R=R.ravel(); S=S.ravel()
        self.W=np.stack([X,Y],axis=1)
        self.E=np.stack([X*(R-2)/np.sqrt(2), X*X*Y.conj()/np.sqrt(2),
                         Y*(R-1),X*(S-1),Y*Y*X.conj()/np.sqrt(2),Y*(S-2)/np.sqrt(2)],axis=1)
    def data(self,c,k):
        q=self.E@c; v=np.abs(q)**2
        p,g,pv,gv=k.values(v)
        C=self.W.conj().T@(self.weights*q*g)
        D=k.bu-float(self.weights@p)
        c2=float(np.vdot(C,C).real)
        d4=float(self.weights@(v*v))/U**2-2
        return c2/D,D,c2,C,d4
    def objective(self,x,k):
        c=x[:6]+1j*x[6:]; norm=np.linalg.norm(c); c=c*np.sqrt(U)/norm
        q=self.E@c; v=np.abs(q)**2
        p,g,pv,gv=k.values(v)
        C=self.W.conj().T@(self.weights*q*g)
        D=k.bu-float(self.weights@p)
        c2=float(np.vdot(C,C).real); ratio=c2/D
        s=self.W@C
        derivative=2*self.E.conj().T@(self.weights*(s*(g+v*gv)+s.conj()*q*q*gv+ratio*pv*q))/D
        derivative-=c*np.vdot(c,derivative).real/U
        derivative*=np.sqrt(U)/norm
        return -ratio,-np.r_[derivative.real,derivative.imag]

def run():
    t=time.time(); k=Kernel(); print('kernel',k.bu,k.values(np.array([0,.01,.1,1]))[:2],time.time()-t,flush=True)
    rr=Rule(64,48)
    starts=[]
    mono=np.zeros(6,complex); mono[0]=1; starts.append(mono)
    for tau in [.1,.2,.4]:
        c=mono.copy();c[3]=1j*tau/np.sqrt(2);starts.append(c)
    rng=np.random.default_rng(47183)
    for j in range(3): starts.append(rng.normal(size=6)+1j*rng.normal(size=6))
    results=[]
    for i,c in enumerate(starts):
        x=np.r_[c.real,c.imag]
        res=minimize(rr.objective,x,args=(k,),jac=True,method='L-BFGS-B',options={'maxiter':180,'ftol':1e-13,'gtol':3e-8,'maxls':30})
        cc=res.x[:6]+1j*res.x[6:];cc*=np.sqrt(U)/np.linalg.norm(cc)
        ans={'start':i,'ratio':-float(res.fun),'c_re':cc.real.tolist(),'c_im':cc.imag.tolist(),'nit':int(res.nit),'success':bool(res.success),'message':str(res.message)}
        results.append(ans);print(json.dumps(ans),flush=True)
        (ROOT/'opt_results.json').write_text(json.dumps(results,indent=2))
    print('seconds',time.time()-t,flush=True)
    best=max(results,key=lambda d:d['ratio']);c=np.array(best['c_re'])+1j*np.array(best['c_im'])
    for n,nt in [(80,64),(120,96),(180,128),(240,160)]:
        rule=Rule(n,nt); out=rule.data(c,k)
        print('CONVERGENCE',n,nt,out,flush=True)

if __name__=='__main__':run()
