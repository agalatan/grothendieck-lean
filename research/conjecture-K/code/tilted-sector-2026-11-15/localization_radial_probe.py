#!/usr/bin/env python3
"""N only: test radial-derivative localization using uniform curvature.

Agent-ID: codex-6e2b. No acceptance of a mathematical inequality occurs here.
Elliptic-log source quadrature and nonlinear maxima have no error bounds.
"""
import sys
sys.dont_write_bytecode = True
import time
import numpy as np
from scipy.special import ellipe, ellipk
from scipy.optimize import differential_evolution, minimize_scalar
from scipy.interpolate import PchipInterpolator

a, b, d = 699/1250, 179/1250, 2/5
budget = 2500/1891 - 9/25


def source(npanels=300, order=8):
    q, w = np.polynomial.legendre.leggauss(order)
    edges = np.linspace(0, 1, npanels+1)**1.3*6.5
    rad = np.concatenate([(lo+hi)/2+(hi-lo)*q/2
                          for lo, hi in zip(edges[:-1], edges[1:])])
    weights = np.concatenate([(hi-lo)*w/2
                              for lo, hi in zip(edges[:-1], edges[1:])])
    t = rad*rad
    return t, weights*2*rad*np.exp(-t), rad*(a+b*t)


T, WT, LT = source()


def hessian(par, rho, t=T, wt=WT, lt=LT):
    w, chi = par
    W = w+(t-d)*rho*np.exp(1j*chi)
    y = np.abs(W)
    total = lt+y
    m = np.clip(4*lt*y/(total*total), 0, 1-1e-15)
    mean = (2/np.pi)*total*ellipe(m)
    inv = (2/np.pi)*ellipk(m)/total
    safe = np.maximum(y, 1e-8)
    tau = (mean+(y*y-lt*lt)*inv)/(2*safe*safe)
    tau = np.where(y>1e-8, tau, 1/(2*lt))
    radial = inv-tau
    nx, ny = W.real/safe, W.imag/safe
    nx = np.where(y>1e-8, nx, 1)
    ny = np.where(y>1e-8, ny, 0)
    weight = wt*(t-d)**2
    xx = weight@(tau+(radial-tau)*nx*nx)
    yy = weight@(tau+(radial-tau)*ny*ny)
    xy = weight@((radial-tau)*nx*ny)
    return (xx+yy)/2+np.hypot((xx-yy)/2, xy)


def main():
    start = time.time()
    print('Agent-ID: codex-6e2b; ALL OUTPUT N; no interval certificate.', flush=True)
    rhos = np.r_[np.arange(0, .801, .025), [.85,.9,1.,1.1,1.2,1.4,1.6,1.8,2.,2.2,2.4]]
    vals = []
    fine = source(500, 10)
    for j, rho in enumerate(rhos):
        result = differential_evolution(lambda p:-hessian(p,rho),
                     [(0,5),(0,np.pi)], seed=314+j, popsize=8,
                     maxiter=35, tol=1e-6, polish=True, workers=1)
        candidates=[(-result.fun,result.x)]
        for chi in (0,np.pi/2,np.pi):
            rr=minimize_scalar(lambda w:-hessian((w,chi),rho),
                               bounds=(0,3),method='bounded')
            candidates.append((-rr.fun,np.array([rr.x,chi])))
        val, par=max(candidates,key=lambda pair:pair[0])
        fineval=hessian(par,rho,*fine)
        vals.append(max(val,fineval))
        print(f'rho={rho:.5f} coarse={val:.10f} fine_at_argmax={fineval:.10f} '
              f'w={par[0]:.8f} chi={par[1]:.8f}',flush=True)
    interpolation=PchipInterpolator(rhos,vals)
    primitive=interpolation.antiderivative()
    q,w=np.polynomial.legendre.leggauss(500)
    y=(q+1)*3
    weight=w*3*2*y*y*np.exp(-y*y)
    print('N radial derivative test: margin = P*sigma-E[Y*g(sigma*Y)]',flush=True)
    for sigma in [.06,.07,.08,.085,.09,.10,.12,.15,.18,.20,.25,.30,.35,.371]:
        correction=weight@(primitive(sigma*y)-primitive(0))
        margin=budget*sigma-correction
        print(f'sigma={sigma:.6f} margin={margin:.12f} compare_C=.03 '
              f'effective_cost={margin/sigma:.9f}',flush=True)
    print(f'N runtime={time.time()-start:.2f}s',flush=True)


if __name__=='__main__':
    main()
