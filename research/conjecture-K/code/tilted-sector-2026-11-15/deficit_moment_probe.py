#!/usr/bin/env python3
"""N ONLY: optimal two-node moment relaxation for the content/deficit goal.
Agent-ID: codex-6e2b. No sampled value is accepted as a theorem.
"""
import json
from functools import lru_cache
import numpy as np
from scipy.integrate import quad
from scipy.optimize import brentq
from scipy.special import ellipe, i0e, i1e

a,b,p=699/1250,179/1250,2500/1891
C6=4045313/100000
gamma=1077659/27000000

@lru_cache(None)
def profile(s):
    if s==0:
        return 387*np.sqrt(np.pi)/500
    r=np.sqrt(s)
    root=brentq(lambda x:x*(a+b*x*x)-r,0,100)
    def fun(x):
        ell=x*(a+b*x*x)
        total=ell+r
        m=(2/np.pi)*total*ellipe(min(1.,4*ell*r/(total*total)))
        return 4*x*np.exp(-x*x)*m
    return quad(fun,0,root,epsabs=2e-12,epsrel=2e-12,limit=200)[0]+quad(fun,root,max(10.,root+2),epsabs=2e-12,epsrel=2e-12,limit=200)[0]

@lru_cache(None)
def gaussian(u):
    if u==0:return profile(0)
    def fun(t):
        z=t*(a+b*t)**2/(2*u)
        return np.sqrt(np.pi*u)*np.exp(-t)*((1+2*z)*i0e(z)+2*z*i1e(z))
    return quad(fun,0,40,epsabs=1e-12,epsrel=1e-12,limit=200)[0]

def content(u,chi):
    delta=chi*u*u
    choices=[.08*delta,3*delta**1.5,.0004,.019321*u]
    if .03<=u<=.0463: choices.append(gamma*delta)
    return min(choices)

def extremal(chi):
    m2=2+chi;m3=6+9*chi+C6*chi**1.5
    total=(m3-m2)/(m2-1)
    product=total-m2
    hi=(total+np.sqrt(total*total-4*product))/2
    lo=product/hi
    whi=(1-lo)/(hi-lo)
    assert 0<lo<1<hi and 0<whi<1
    return lo,hi,whi

def point(u,chi):
    lo,hi,whi=extremal(chi)
    moment=(1-whi)*profile(u*lo)+whi*profile(u*hi)
    D=gaussian(u)-moment
    gain=content(u,chi)
    needed=max(0.,(gain-6e-6)/.3)
    return dict(u=u,chi=chi,lo=lo,hi=hi,whi=whi,content= gain,
                moment_deficit=D,needed_deficit=needed,
                gap=6e-6+.3*max(D,0)-gain,
                exempt=bool(gain<=6e-6))

def main():
    for u in [.002,.005,.01,.02,.03,.04,.0463]:
        for chi in [.04,.1,.2,.3,.5,1,2,4,6,10,20,42]:
            print(json.dumps(point(u,chi)),flush=True)

if __name__=='__main__':main()
