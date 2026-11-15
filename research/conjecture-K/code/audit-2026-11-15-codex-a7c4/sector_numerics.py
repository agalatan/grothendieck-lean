#!/usr/bin/env python3
"""Independent Wick-monomial sector calculation, Agent-ID: codex-a7c4.

Run python3 -I sector_numerics.py [--orders 10,16,24] [--energies .01,.02,.03,.0463].
N only. Tensor-product Gaussian quadrature with independent radius panels and
Gauss-Legendre angle quadrature, analytic gradients, simultaneous stationary
saddle solve (no nested minimizer, elliptic kernel, or imported project code).
The returned stationary candidates and grid differences are not certified
suprema or integration error bounds. Single threaded; output is JSON on stdout.
"""
import os
for _var in ('OPENBLAS_NUM_THREADS', 'OMP_NUM_THREADS', 'MKL_NUM_THREADS'):
    os.environ[_var] = '1'
import argparse
import json
import platform
import numpy as np
import scipy
from scipy.optimize import root
from scipy.special import i0e, i1e
from numpy.polynomial.legendre import leggauss

A, B, P = 699/1250, 179/1250, 2500/1891


def radial(n):
    nodes, weights = leggauss(n)
    # Split at the Wick zero sqrt(2); exponential tail past radius 8 omitted.
    edges = [0, .25, .5, 1, np.sqrt(2), 2, 3, 4, 6, 8]
    r = np.concatenate([(a+b)/2+(b-a)*nodes/2 for a,b in zip(edges,edges[1:])])
    w = np.concatenate([(b-a)*weights/2 for a,b in zip(edges,edges[1:])])
    return r*r, 2*r*np.exp(-r*r)*w


class Rule:
    def __init__(self, n, energy):
        t, wt = radial(n)
        d, wd = leggauss(6*n)
        theta = (d+1)*np.pi/2
        self.cos, self.sin = np.cos(theta)[None,:], np.sin(theta)[None,:]
        self.angle_weights = wd/2
        T, R = np.meshgrid(t,t,indexing='ij')
        self.weights = (wt[:,None]*wt[None,:]).ravel()
        self.L = (np.sqrt(T)*(A+B*T)).ravel()
        self.q = (np.sqrt(energy/2)*np.sqrt(R)*(R-2)).ravel()
        self.directions = np.stack([np.sqrt(R)*(T-1), T*np.sqrt(R)/np.sqrt(2), -np.sqrt(R)],axis=-1).reshape(-1,3)
        # Independent exact Rice expectation: integrate visible radius only.
        ell = np.sqrt(t)*(A+B*t)
        z = ell*ell/(2*energy)
        self.gaussian_F = float(np.dot(wt, np.sqrt(np.pi*energy)*((1+2*z)*i0e(z)+2*z*i1e(z))))
        self.base = self.evaluate(np.zeros(3), False)[0]
        self.deficit = self.gaussian_F-self.base

    def evaluate(self,x,gradient=True):
        total=0.; grad=np.zeros(3)
        # Batches keep memory bounded even at high quadrature order.
        for start in range(0,len(self.weights),1024):
            sl=slice(start,start+1024)
            dr=self.directions[sl]
            aa=(self.q[sl]+dr[:,0]*x[0]+dr[:,2]*x[2])[:,None]
            bb=(dr[:,1]*x[1])[:,None]
            xx=self.L[sl,None]+(aa+bb)*self.cos
            yy=(aa-bb)*self.sin
            rr=np.hypot(xx,yy)
            total+=2*np.dot(self.weights[sl],rr@self.angle_weights)
            if gradient:
                da=(xx*self.cos+yy*self.sin)/np.maximum(rr,1e-300)
                db=(xx*self.cos-yy*self.sin)/np.maximum(rr,1e-300)
                va=da@self.angle_weights; vb=db@self.angle_weights
                grad+=2*np.sum(self.weights[sl,None]*dr*np.stack([va,vb,va],axis=-1),axis=0)
        total+=x[2]**2-P*(x[0]**2+x[1]**2)
        grad+=np.array([-2*P*x[0],-2*P*x[1],2*x[2]])
        return float(total),grad


def main():
    ap=argparse.ArgumentParser()
    ap.add_argument('--orders',default='10,16,24')
    ap.add_argument('--energies',default='.01,.02,.03,.0463')
    args=ap.parse_args()
    output={'agent_id':'codex-a7c4','status':'N','python':platform.python_version(),'numpy':np.__version__,'scipy':scipy.__version__, 'method':'direct norm + analytic gradient, stationary saddle roots; Rice benchmark', 'caveat':'No global optimization or rigorous quadrature certificate; grid differences are diagnostics only.', 'runs':[]}
    for energy in map(float,args.energies.split(',')):
        guesses={'K_A':np.array([.03,0,0]),'K_AB':np.array([.03,.005,0]),'retained_A':np.array([.02,0,-.015]),'retained_AB':np.array([.02,.002,-.015])}
        for order in map(int,args.orders.split(',')):
            rule=Rule(order,energy)
            row={'u':energy,'order_per_radius_panel':order,'angular_order':6*order,'deficit':rule.deficit,'candidates':{}}
            for name,active in [('K_A',[0]),('K_AB',[0,1]),('retained_A',[0,2]),('retained_AB',[0,1,2])]:
                def unpack(y):
                    v=np.zeros(3); v[active]=y; return v
                solved=root(lambda y:rule.evaluate(unpack(y))[1][active],guesses[name][active],tol=2e-9)
                x=unpack(solved.x); val,grad=rule.evaluate(x)
                residual=float(np.max(np.abs(grad[active])))
                if residual>2e-7: raise RuntimeError((energy,order,name,solved.message,residual))
                guesses[name]=x
                row['candidates'][name]={'r_s_gamma':x.tolist(),'gain':val-rule.base,'gain_over_deficit':(val-rule.base)/rule.deficit,'gradient_residual':residual}
            output['runs'].append(row)
    print(json.dumps(output,indent=2))

if __name__=='__main__': main()
