#!/usr/bin/env python3
"""Numerical (N), not interval-certified, diagnostics for the Gemini plan.

Agent-ID: codex-a7c4. Refs #509. All constants are computed, not fitted input.
The inherited elliptic integral evaluator is checked against a separate positive
Abel integral for g. Gaussian baselines use an independent Rice/Bessel integral.
Run: OPENBLAS_NUM_THREADS=1 python3 diagnostics.py --output result.json
"""
import os
os.environ.setdefault('OPENBLAS_NUM_THREADS', '1')
os.environ.setdefault('OMP_NUM_THREADS', '1')
import argparse
import importlib.util
import json
import math
from pathlib import Path
import sys
sys.dont_write_bytecode = True
import numpy as np
from scipy.integrate import quad
from scipy.optimize import brentq, minimize_scalar
from scipy.special import i0e, i1e
from numpy.polynomial.legendre import leggauss

ROOT = Path(__file__).resolve().parent
def load(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    obj = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(obj)
    return obj

ce = load('audit_constants', ROOT/'constants_exact.py')
lib = load('elliptic_reference', ROOT.parent/'audit-2026-11-13'/'kernels.py')
k = lib.Kernels.__new__(lib.Kernels)
k.a, k.b, k.eps = float(ce.a), float(ce.b), float(ce.eps)
mid = lambda x: float((x.lo+x.hi)/2)
P = list(map(mid, ce.phi)); G = list(map(mid, ce.g))
k.phi0, k.phip0, k.g0 = P[0], P[1], G[0]

def direct(v, tol=3e-13):
    return k.direct(float(v), derivative=True, tol=tol)

def baseline(u, derivative=0, tol=2e-13):
    if u == 0:
        return [P[0], P[1], 2*P[2]][derivative]
    def integrand(x):
        ell = x*(k.a+k.b*x*x)
        t = ell*ell/(2*u)
        if derivative == 0:
            val = math.sqrt(math.pi*u)*((1+2*t)*i0e(t)+2*t*i1e(t))
        elif derivative == 1:
            val = math.sqrt(math.pi)/(2*math.sqrt(u))*i0e(t)
        else:
            val = math.sqrt(math.pi)/(2*u**1.5)*((t-.5)*i0e(t)-t*i1e(t))
        return 2*x*math.exp(-x*x)*val
    return quad(integrand, 0, 10, epsabs=tol, epsrel=tol, limit=250)[0]

class PositiveG:
    """k(v)=-g(v)=E_theta cos^2(theta) int_0^infty f_A(s^2+v cos^2(theta)) ds.

    f_A(H(t))=exp(-t)/(a+bt)^2; H(t)=t(a+bt)^2.
    Derivatives use the positive -d/dH recurrence, without finite differences.
    Quadrature is floating point. Comparing orders is an error diagnostic only.
    """
    def __init__(self, order=14, nang=64):
        x,w = leggauss(order)
        edges=np.r_[np.linspace(0,1,17),np.linspace(1,4,19)[1:],np.linspace(4,10,13)[1:]]
        xx=np.concatenate([(l+r)/2+(r-l)/2*x for l,r in zip(edges,edges[1:])])
        wx=np.concatenate([(r-l)/2*w for l,r in zip(edges,edges[1:])])
        tt=xx*xx; aa=k.a+k.b*tt; bb=k.a+3*k.b*tt
        th,wt=leggauss(nang)
        self.cc=np.cos((th+1)*math.pi/4)**2
        self.ss=(tt*aa*aa)[:,None]
        self.ww=(wx*bb)[:,None]*(wt/2)[None,:]
    def values(self,v):
        s=self.ss+v*self.cc[None,:]
        x=2*math.sqrt(k.a/(3*k.b))*np.sinh(np.arcsinh(3*np.sqrt(s)/(2*k.a)*math.sqrt(3*k.b/k.a))/3)
        t=x*x; aa=k.a+k.b*t; bb=k.a+3*k.b*t
        f=np.exp(-t)/(aa*aa)
        f1=f*(1+2*k.b/aa)/(aa*bb)
        # -f_A, and g'=-f_A' averaged with the corresponding cosine weight.
        return -float(np.sum(self.ww*f*self.cc)), float(np.sum(self.ww*f1*self.cc**2))

def search_extreme(fun, grid, maximum):
    ys=np.array([fun(float(x)) for x in grid])
    candidates=[]
    for j in range(1,len(grid)-1):
        extremum = (ys[j]>=ys[j-1] and ys[j]>=ys[j+1]) if maximum else (ys[j]<=ys[j-1] and ys[j]<=ys[j+1])
        if extremum:
            sg=-1 if maximum else 1
            res=minimize_scalar(lambda logv:sg*fun(math.exp(logv)),bounds=(math.log(grid[j-1]),math.log(grid[j+1])),method='bounded',options={'xatol':2e-10})
            candidates.append((fun(math.exp(res.x)), math.exp(res.x)))
    candidates.extend([(float(ys[0]),float(grid[0])),(float(ys[-1]),float(grid[-1]))])
    return (max(candidates) if maximum else min(candidates)), [float(ys.min()),float(ys.max())]

def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--output',type=Path)
    args=parser.parse_args()
    ustar=brentq(lambda u:baseline(u,1)-1/k.eps,.00551,.0463,xtol=2e-15)
    S=baseline(ustar)-ustar/k.eps
    us=[.00551,.01,.02,.03,ustar,.0403448,.0463]
    rows=[{'u':u,'Lambda_Gauss':baseline(u)-u/k.eps,'B_Gauss':S-baseline(u)+u/k.eps} for u in us]
    print('baseline',ustar,S,flush=True)
    checks=[]
    pos=PositiveG();pos2=PositiveG(20,96)
    for r in [0,1e-5,.005,.0463,.1,.4,1,5,10,100]:
        ph,g,j=direct(r);g2,gp2=pos.values(r);g3,gp3=pos2.values(r)
        checks.append({'r':r,'g_elliptic':g,'g_Abel':g2,'g_Abel_finer':g3,'gp':gp2,'gp_finer':gp3,'Phi':ph,'Phi_prime':j})
    print('Abel check',max(abs(c['g_elliptic']-c['g_Abel_finer']) for c in checks),flush=True)
    # Global claims require a subsequent interval cover and analytic tail bounds.
    grid=np.geomspace(.0003,1e4,240)
    mu=lambda r:G[1]/(direct(r)[1]-G[0])-1/r
    lam=lambda r:((-P[2]/2)*r*r/(P[0]+P[1]*r-direct(r)[0])-1)/r
    mu_candidate,_=search_extreme(mu,grid,False)
    # Cancellation in lambda at tiny r: handle the endpoint by its exact limit.
    lam_candidate,_=search_extreme(lam,grid[grid>=.004],True)
    lam_zero=P[3]/(-3*P[2])
    cap_candidate,_=search_extreme(lambda r:math.sqrt(r)*(-direct(r)[1]),grid,True)
    psi_candidate,_=search_extreme(lambda r:sum([pos2.values(r)[0],r*pos2.values(r)[1],-G[0]]),grid[grid<1000],True)
    print('extrema',mu_candidate,lam_candidate,'lambda endpoint',lam_zero,cap_candidate,psi_candidate,flush=True)
    cases=[]
    for u in [.00551,.0463]:
        B=baseline(u);c=math.sqrt(u/2)
        F1,e1=quad(lambda t:math.exp(-t)*baseline(u*t),0,50,epsabs=3e-11,epsrel=3e-11,limit=200)
        F3,e3=quad(lambda t:math.exp(-t)*baseline(u*t*t/2),0,50,epsabs=3e-11,epsrel=3e-11,limit=200)
        F2,e2=quad(lambda t:math.exp(-t)*direct(u*t*(t-2)**2/2)[0],0,50,points=[2],epsabs=3e-11,epsrel=3e-11,limit=200)
        C2,ec=quad(lambda t:math.exp(-t)*c*t*(t-2)*(direct(u*t*(t-2)**2/2)[1]-G[0]),0,50,points=[2],epsabs=3e-12,epsrel=3e-12,limit=200)
        for name,F,Csq,chi,err in [('I',F1,0.,2.,e1),('II',F2,C2*C2,42.,e2),('III',F3,0.,10.,e3)]:
            cases.append({'case':name,'u':u,'C2':Csq,'D':B-F,'C2_over_D':Csq/(B-F),'chi':chi,'quad_error_estimate_F':err})
        print('cases',u,cases[-3:],flush=True)
    # Direct quadrature of the Gaussian envelope gaps: measures loss even at delta=0.
    gaussian_gaps=[]
    for u in [ustar,.0463]:
        B=baseline(u)
        cubic=P[0]+P[1]*u+P[2]*u*u+P[3]*u**3
        candidate=max(lam_zero,lam_candidate[0])
        def envelope_gap(lam):
            def env(r):return P[0]+P[1]*r+P[2]*r*r/(2*(1+lam*r))
            return quad(lambda s:math.exp(-s)*env(u*s),0,60,epsabs=2e-13,epsrel=2e-13)[0]-B
        gaussian_gaps.append({'u':u,'cubic_envelope_gap':cubic-B,
            'rational_candidate_gap':envelope_gap(candidate),
            'rational_safe_exact_gap':envelope_gap(P[3]/(-2*P[2])),
            'rational_safe_107_over_50_gap':envelope_gap(107/50),
            'available_BG_plus_eta':S-(B-u/k.eps)+1e-4,'lambda_candidate':candidate})
    # Baseline cross-check integrates fixed-shift Phi, separate from the Rice formula.
    cross=quad(lambda s:math.exp(-s)*direct(.0463*s)[0],0,50,epsabs=2e-11,epsrel=2e-11,limit=200)[0]
    out={'agent_id':'codex-a7c4','status':'N: floating quadrature/optimisation, not certificates',
         'accuracy_note':'Quadrature error estimates and cross-checks are diagnostics, not rigorous bounds. B_Gauss can be slightly negative by roundoff near its zero; it is nonnegative analytically.',
         'u_star':ustar,'S':S,'baseline':rows,'curvature_buffer_coefficient_N':-baseline(.0463,2)/2,
         'profile_cross_checks':checks,'numerical_extrema':{
             'mu_max_candidate':mu_candidate,'mu_zero_limit':-G[2]/(2*G[1]),'mu_infinity_limit':G[1]/(-G[0]),
             'lambda_candidate':lam_candidate,'lambda_zero_limit':lam_zero,'lambda_infinity_limit':-P[2]/(2*P[1]),
             'sqrt_r_abs_g_candidate':cap_candidate,'psi1_candidate':psi_candidate},
         'sanity_families':cases,'Gaussian_envelope_gaps':gaussian_gaps,
         'baseline_independent_cross_check_error':cross-baseline(.0463)}
    print(json.dumps(out,indent=2))
    if args.output:args.output.write_text(json.dumps(out,indent=2)+'\n')

if __name__=='__main__':main()
