#!/usr/bin/env python3
"""N ONLY. Moment-dual diagnostic for radial localization. codex-6e2b.

Relax cubic q to an arbitrary conditional distribution given a unit complex
Gaussian Y, retaining E|q|^2<=.0463 and E[conj(Y)q]=0. For r=sigma Y, the
half radial derivative is E[Re(conj(Y) E_Z[A ph(L+q+A sigma Y)])]-P sigma.
This program optimizes a FINITE GRID relaxation; neither its maxima nor its
quadrature are certified upper bounds. It writes no files.
"""
import sys
sys.dont_write_bytecode = True
import argparse
import numpy as np
from scipy.special import ellipe, ellipkm1
from scipy.optimize import minimize

a,b,d = 699/1250,179/1250,2/5
P = 2500/1891-9/25


def source_rule(order=12, panels=24):
    x,w=np.polynomial.legendre.leggauss(order)
    edges=np.linspace(0,1,panels+1)**1.4*np.sqrt(40)
    r=np.concatenate([(lo+hi)/2+(hi-lo)*x/2 for lo,hi in zip(edges[:-1],edges[1:])])
    wt=np.concatenate([(hi-lo)*w/2 for lo,hi in zip(edges[:-1],edges[1:])])
    return r*r,wt*2*r*np.exp(-r*r)


def gradient(x,y,rho,order=12,panels=24):
    t,wt=source_rule(order,panels)
    ell=np.sqrt(t)*(a+b*t)
    A=t-d
    vx=np.asarray(x)[...,None]+rho*A
    vy=np.asarray(y)[...,None]
    v=np.hypot(vx,vy)
    total=ell+v
    complement=((ell-v)/total)**2
    inv=2/np.pi*ellipkm1(np.maximum(complement,1e-300))/total
    mean=2/np.pi*total*ellipe(1-complement)
    tang=np.divide(mean+(v*v-ell*ell)*inv,2*v*v,
                   out=np.broadcast_to(.5/ell,v.shape).copy(),where=v>1e-8)
    small=v/ell<1e-3
    z=(v/ell)**2
    tang=np.where(small,(.5+z/16+3*z*z/128)/ell,tang)
    return np.sum(wt*A*vx*tang,axis=-1)


def diagnostic(sigma,nr=24,nx=81,ny=31,order=12,panels=24):
    # Gauss-Legendre on radius [0,5]; discarded tail is N, not bounded here.
    z,w=np.polynomial.legendre.leggauss(nr)
    rad=(z+1)*2.5
    weights=w*2.5*2*rad*np.exp(-rad*rad)
    xx=np.linspace(-2.5,2.5,nx)
    yy=np.linspace(0,2,ny)
    x,y=np.meshgrid(xx,yy,indexing='ij')
    x,y=x.ravel(),y.ravel()
    v=x*x+y*y
    grad=np.array([R*gradient(x,y,sigma*R,order,panels) for R in rad])
    cross=rad[:,None]*x
    def dual(z,ret=False):
        beta,lam=z
        val=grad-beta*v-lam*cross
        idx=np.argmax(val,axis=1)
        out=beta*.0463+np.sum(weights*val[np.arange(nr),idx])-P*sigma
        if ret:
            return out,float(np.sum(weights*v[idx])),float(np.sum(weights*cross[np.arange(nr),idx])), list(zip(rad,x[idx],y[idx]))
        return out
    opt=minimize(dual,[.15,.02],method='Powell',bounds=[(0,3),(-2,2)],
                 options={'xtol':1e-9,'ftol':1e-10,'maxiter':100})
    result=dual(opt.x,True)
    print('N',{'sigma':sigma,'dual_grid_value':result[0], 'beta_lambda':opt.x.tolist(),
                'selected_energy':result[1],'selected_cross':result[2],
                'radius_nodes':nr,'q_grid':[nx,ny],'source':[order,panels]},flush=True)
    print('N selected q(R):',[(round(R,3),round(X,3),round(Y,3)) for R,X,Y in result[3] if R<3],flush=True)


if __name__=='__main__':
    parser=argparse.ArgumentParser()
    parser.add_argument('--sigma',nargs='+',type=float,default=[.085,.1,.15,.2,.3,.371])
    parser.add_argument('--refine',action='store_true')
    args=parser.parse_args()
    print('Agent-ID: codex-6e2b. N ONLY; finite-grid dual and unbounded discarded tails.',flush=True)
    for s in args.sigma:
        diagnostic(s,**({'nr':40,'nx':121,'ny':51,'order':20,'panels':32} if args.refine else {}))
