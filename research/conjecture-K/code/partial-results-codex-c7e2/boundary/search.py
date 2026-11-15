# /workspace/scratch/f307e93b3610/codex-c7e2-research/boundary/search.py
"""Agent-ID: codex-c7e2. Exploratory full H21(C2)+diffuse searches, never a certificate."""
import json, itertools, math, time, sys
import numpy as np
from scipy.special import i0e, i1e
from scipy.optimize import minimize, minimize_scalar

SQPI=math.sqrt(math.pi)
def radial(n):
    x,w=np.polynomial.legendre.leggauss(n)
    r=(x+1)*3.5
    return r,w*3.5*2*r*np.exp(-r*r)

def rice(r,sigma):
    if sigma<1e-10:
        return r,np.ones_like(r),np.zeros_like(r)
    x=r*r/(2*sigma*sigma)
    i0,i1=i0e(x),i1e(x)
    value=sigma*SQPI/2*((1+2*x)*i0+2*x*i1)
    dr=SQPI/(2*sigma)*r*(i0+i1)
    ds=SQPI/2*i0
    return value,dr,ds

class Model:
    def __init__(self,n=32,nth=32):
        r,w=radial(n); theta=2*np.pi*np.arange(nth)/nth
        R,S,TH=np.meshgrid(r,r,theta,indexing='ij')
        Z=R.ravel(); X=(S*np.exp(1j*TH)).ravel(); T=Z*Z; U=abs(X)**2
        self.weights=(w[:,None,None]*w[None,:,None]*np.ones(nth)[None,None,:]/nth).ravel()
        self.B=np.stack([Z*(T-2)/np.sqrt(2),(T-1)*X,Z*Z*np.conj(X)/np.sqrt(2),Z*(U-1),Z*X*X/np.sqrt(2),X*(U-2)/np.sqrt(2)],axis=1)
        self.Z,self.T=Z,T
        self.r,self.w=radial(max(128,n*2))
    def profile(self,eps,ell,b):
        self.p=1/eps; self.a=ell-2*b;self.b=b
        self.L=self.Z*(self.a+self.b*self.T)
        lr=self.r*(self.a+self.b*self.r*self.r)
        f=lambda sig:2*np.dot(self.w,rice(lr,sig)[0])-self.p*sig*sig
        res=minimize_scalar(lambda s:-f(s),bounds=(0,1),method='bounded',options={'xatol':1e-13})
        self.sigma0=res.x if f(res.x)>f(0) else 0.
        self.benchmark=f(self.sigma0)
        self.base=2*rice(self.L,self.sigma0)[0]
    def fg(self,x):
        c=x[:6]+1j*x[6:12]; sig=x[12]
        G=self.B@c; plus=self.L+G; minus=self.L-G
        rp,rm=abs(plus),abs(minus)
        vp,dp,sp=rice(rp,sig);vm,dm,sm=rice(rm,sig)
        val=self.weights@(vp+vm-self.base)-self.p*(np.vdot(c,c).real+sig*sig-self.sigma0**2)
        phases=dp*plus/np.maximum(rp,1e-300)-dm*minus/np.maximum(rm,1e-300)
        gc=self.B.conj().T@(self.weights*phases)-2*self.p*c
        gs=self.weights@(sp+sm)-2*self.p*sig
        return -float(val),-np.r_[gc.real,gc.imag,gs]

def main():
    n=int(sys.argv[1]) if len(sys.argv)>1 else 28
    nth=int(sys.argv[2]) if len(sys.argv)>2 else 24
    out=sys.argv[3] if len(sys.argv)>3 else 'results.jsonl'
    m=Model(n,nth); rng=np.random.default_rng(71839)
    rows=list(itertools.product([.74,.76],[.76,.90],[.12,.16]))+[(.75,.83,.14),(1891/2500,1057/1250,179/1250)]
    t0=time.time()
    for row in rows:
        m.profile(*row)
        starts=[]
        for k in range(6):
            x=np.zeros(13);x[k]=.17;x[-1]=max(m.sigma0/2,.02);starts.append(x)
        for k in range(4):
            x=rng.normal(size=13)*.08;x[-1]=max(m.sigma0,.03);starts.append(x)
        best=None
        for k,x in enumerate(starts):
            opt=minimize(m.fg,x,jac=True,method='L-BFGS-B',bounds=[(-1,1)]*12+[(0,1)],options={'ftol':1e-13,'gtol':2e-8,'maxiter':180,'maxls':30})
            rec=dict(profile=row,start=k,excess=-float(opt.fun),x=opt.x.tolist(),benchmark=m.benchmark,sigma0=m.sigma0,iterations=int(opt.nit),success=bool(opt.success),n=n,nth=nth)
            with open(out,'a') as f:f.write(json.dumps(rec)+'\n')
            if best is None or rec['excess']>best['excess']:best=rec
        print(json.dumps(dict(profile=row,best=best,seconds=time.time()-t0)),flush=True)

if __name__=='__main__':main()
