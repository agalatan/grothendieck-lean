"""codex-a713. Independent deterministic quadrature; no research-code imports.

Push forward L to the plane, then use polar coordinates centred at -y.
This avoids angular elliptic integrals, their singularities, and source tables.
Numerical convergence tests are empirical, not interval certificates.
"""
import os
for key in ('OPENBLAS_NUM_THREADS', 'OMP_NUM_THREADS', 'VECLIB_MAXIMUM_THREADS'):
    os.environ[key] = '1'
import argparse, json, time
from pathlib import Path
import numpy as np
from scipy.special import roots_legendre
from scipy.integrate import quad
from scipy.interpolate import CubicSpline
from scipy.optimize import minimize_scalar, minimize

ROOT = Path(__file__).resolve().parent
a, b, u = 699/1250, 179/1250, 0.0463

def legendre_panels(edges, order):
    x,w=roots_legendre(order)
    left,right=np.array(edges[:-1]),np.array(edges[1:])
    return ((left[:,None]+right[:,None])/2+(right-left)[:,None]*x/2).ravel(), ((right-left)[:,None]*w/2).ravel()

def inverse_radius(r):
    s=2*np.sqrt(a/(3*b))*np.sinh(np.arcsinh(3*r*np.sqrt(3*b/a)/(2*a))/3)
    return s*s

def direct_kernels(y, order=24, angles=160):
    # R outside [max(0,y-r8),y+r8] omitted; visible radius >= r8 means T>=64.
    r8=8*(a+64*b)
    edges=sorted(set([0.,max(0.,y-r8), y+r8] + [max(0.,y+d) for d in (-40,-20,-10,-6,-3,-1,0,1,3,6,10,20,40)]))
    edges=[x for x in edges if x<=y+r8]
    rr,ww=legendre_panels(edges,order)
    theta,tw=roots_legendre(angles)
    theta=(theta+1)*np.pi/2
    # Reflection doubles integral over theta in [0,pi]; normalization /pi cancels.
    ct=np.cos(theta)
    dist=np.sqrt(np.maximum(0,rr[:,None]**2+y*y-2*rr[:,None]*y*ct))
    t=inverse_radius(dist)
    den=np.exp(-t)/((a+b*t)*(a+3*b*t))
    phi=2*np.sum(ww*rr**2*(den@tw))
    if y==0:
        g=quad(lambda s: np.exp(-s*s)*(s*s-1)/(a+b*s*s),0,10,epsabs=2e-13,epsrel=2e-13)[0]
    else:
        g=np.sum(ww*rr*((den*(t-1)*ct)@tw))/y
    return float(phi),float(g)

def make_table(step=.002,order=24,angles=160):
    yy=np.unique(np.r_[np.arange(0,2,step),np.arange(2,10,step*5),np.arange(10,80.001,step*25)])
    vals=[]
    t0=time.time()
    for i,y in enumerate(yy):
        vals.append(direct_kernels(y,order,angles))
        if i%500==0: print('table',i,len(yy),time.time()-t0,flush=True)
    vals=np.array(vals)
    name=ROOT/f'independent_kernels_{step:g}_{order}_{angles}.npz'
    np.savez(name,y=yy,phi=vals[:,0],g=vals[:,1])
    return name

def load_table(path):
    z=np.load(path)
    phi=CubicSpline(z['y'],z['phi'],bc_type=((1,0.),'not-a-knot'))
    g=CubicSpline(z['y'],z['g'],bc_type=((1,0.),'not-a-knot'))
    return phi,g

def evaluate(phi,g,tau=0.,order=48,template=False,realpart=0.):
    # Composite remote Exp(1) integrals, split at zeros R=2 and S=1.
    r,rw=legendre_panels([0,.25,.5,1,1.5,2,2.5,3,4,6,9,13,18,25,35,50],order)
    rw*=np.exp(-r)
    if template or tau or realpart:
        s,sw=legendre_panels([0,.25,.5,1,1.5,2,3,4,6,9,13,18,25,35,50],order)
        sw*=np.exp(-s)
        coeff=np.sqrt(u)*(s[None,:]-1) if template else np.sqrt(u/(2+tau*tau+realpart*realpart))*((r[:,None]-2)+(realpart+1j*tau)*(s[None,:]-1))
        amp=np.sqrt(r[:,None])*np.abs(coeff)
        weights=rw[:,None]*sw
        F=np.sum(weights*phi(amp))
        C=np.sum(weights*r[:,None]*coeff*g(amp))
    else:
        coeff=np.sqrt(u/2)*(r-2)
        amp=np.sqrt(r)*np.abs(coeff)
        F=np.sum(rw*phi(amp)); C=np.sum(rw*r*coeff*g(amp))
    # Benchmark independent deterministic integral on positive line.
    Bu=quad(lambda x: np.exp(-x)*phi(np.sqrt(u*x)),0,60,epsabs=3e-13,epsrel=3e-13,limit=300)[0]
    D=Bu-F; C2=abs(C)**2
    return dict(tau=float(tau),realpart=float(realpart),ratio=float(C2/D),D=float(D),C_re=float(C.real),C_im=float(C.imag),C2=float(C2),B=float(Bu),F=float(F))

if __name__=='__main__':
    parser=argparse.ArgumentParser(); parser.add_argument('mode'); parser.add_argument('--table'); parser.add_argument('--step',type=float,default=.002); parser.add_argument('--order',type=int,default=24); parser.add_argument('--angles',type=int,default=160)
    arg=parser.parse_args()
    if arg.mode=='kernels':
        print(make_table(arg.step,arg.order,arg.angles))
    elif arg.mode=='check':
        for y in [0,.0001,.002,.1,.2,.5,1,2,4,10,20,50]:
            print(y,direct_kernels(y,arg.order,arg.angles),flush=True)
    elif arg.mode=='families':
        phi,g=load_table(arg.table)
        records=[dict(kind='monomial',**evaluate(phi,g,order=arg.order)),dict(kind='template',**evaluate(phi,g,order=arg.order,template=True))]
        for tau in [0.025,.05,.075,.1,.125,.15,.2,.25,.3]:
            records.append(dict(kind='imaginary',**evaluate(phi,g,tau,order=arg.order)))
        fit=minimize_scalar(lambda t:-evaluate(phi,g,t,order=arg.order)['ratio'],bounds=(0,.3),method='bounded',options={'xatol':2e-7})
        records.append(dict(kind='optimum_tau',**evaluate(phi,g,fit.x,order=arg.order)))
        print(json.dumps(records,indent=2))
        (ROOT/f'independent_families_{arg.order}.json').write_text(json.dumps(records,indent=2)+'\n')
    elif arg.mode=='complex':
        phi,g=load_table(arg.table)
        fit=minimize(lambda v:-evaluate(phi,g,v[1],realpart=v[0],order=arg.order)['ratio'],[.0528,.2214],method='Nelder-Mead',options={'xatol':2e-7,'fatol':1e-14})
        record=evaluate(phi,g,fit.x[1],realpart=fit.x[0],order=arg.order)
        print(json.dumps(record,indent=2))
        (ROOT/f'independent_complex_{arg.order}.json').write_text(json.dumps(record,indent=2)+'\n')
