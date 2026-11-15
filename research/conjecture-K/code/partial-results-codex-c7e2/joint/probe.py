# /workspace/scratch/f307e93b3610/codex-c7e2-research/joint/probe.py
"""Agent-ID codex-c7e2. Numerical exploration only, no certificates."""
import numpy as np
from scipy.special import roots_legendre
from scipy.optimize import minimize
import json
from pathlib import Path

a,b,p,rho=699/1250,179/1250,2500/1891,5053/10000
def setup(nr=120,nt=256):
    x,w=roots_legendre(nr); r=(x+1)*3.5; wt=w*3.5*2*r*np.exp(-r*r)
    th=(np.arange(nt)+.5)*(2*np.pi/nt)
    z=r[:,None]*np.exp(1j*th)
    return (z*(a+b*r[:,None]**2),r[:,None]**2,wt[:,None]/nt,z*z/np.sqrt(2))

grid=setup()
def calc(x, g=None):
    L,T,wt,Z2=grid if g is None else g
    w,ar,ai,br,bi=x
    A=ar+1j*ai; B=br+1j*bi; S=abs(A)**2+abs(B)**2
    h=(T-.4)*A+.6*rho*B+Z2*np.conj(B)
    X=L+w
    rem=2*np.sum(wt*(np.abs(X+h)-np.abs(X)-np.real(h*np.conj(X)/np.abs(X))))
    target=(p-.0926)*S-.67*abs(A+rho*B)**2-.08*abs(B-rho*A)**2+(.5*w*w+S)*S
    return float(rem-target)/max(S,1e-20)

if __name__=='__main__':
    rng=np.random.default_rng(987)
    ans=[]
    for i in range(30):
        x0=np.r_[rng.uniform(0,1.25),rng.normal(0,.2,4)]
        if i==0:x0=np.array([.6,.35,0,.2,0])
        sol=minimize(lambda x:-calc(x),x0,method='Nelder-Mead',options={'maxiter':1000,'xatol':1e-6,'fatol':1e-8})
        ans.append({'x':sol.x.tolist(),'value':-float(sol.fun),'ok':bool(sol.success)})
        print(ans[-1],flush=True)
    ans.sort(key=lambda x:-x['value'])
    hi=setup(500,1024)
    for row in ans[:5]:row['refined']=calc(row['x'],hi)
    Path(__file__).with_suffix('.json').write_text(json.dumps(ans,indent=2))
    print('top',ans[:5],flush=True)
