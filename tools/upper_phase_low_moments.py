#!/usr/bin/env python3
"""Base F0 low-moment sanity anchors and the conditional Schwinger formula.

The actual F0 is phase(z+h(|z|^2)w), with NONCONSTANT h.  A fixed Gaussian
rotation cannot reduce its damped-polynomial moments to finite gamma sums.
This small tool supplies numerical first-moment anchors and checks the
conditional analytic formula against Rice/Bessel expressions.  SciPy quad
error estimates are diagnostics, not rigorous integral enclosures.

Input is the exact frozen incumbent-inputs.json produced by the separate
coupled_asymmetric_phase.py.  Run only in an owned droplet directory.
"""
import argparse
from fractions import Fraction as Q
import hashlib
import json
import math
from pathlib import Path
import signal
import time


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--input',type=Path,required=True)
    parser.add_argument('--output',type=Path,required=True)
    parser.add_argument('--max-seconds',type=int,default=45)
    args=parser.parse_args()
    if not 1<=args.max_seconds<=60:parser.error('bounded run, at most 60 seconds')
    def expired(signum,frame):raise TimeoutError('bounded base-anchor check')
    signal.signal(signal.SIGALRM,expired);signal.alarm(args.max_seconds)
    started=time.monotonic()
    import numpy as np
    from scipy.integrate import quad
    from scipy.special import eval_genlaguerre,gammaln,i0e,i1e
    data=json.loads(args.input.read_text())
    assert data['schema']=='coupled-asymmetric-incumbent-input/v1'
    to_float=lambda x:float(Q(x))
    profile=list(map(to_float,data['profile']))
    a,b,eta=map(to_float,[data['a'],data['b'],data['eta']])
    def h(U):
        return math.sqrt(1+a*a)*sum(x*eval_genlaguerre(j,-.5,U)
            /math.exp((gammaln(j+.5)-gammaln(j+1))/2)
            for j,x in enumerate(profile))
    def conditional_first(U,hh):
        r=math.sqrt(U)
        if hh==0:return (1. if U>0 else 0.),0.
        kappa=r/abs(hh)
        if kappa>1e6:
            A=1-1/(4*kappa*kappa)
            B=hh/(2*r)*(1+1/(4*kappa*kappa))
        else:
            x=kappa*kappa/2
            A=math.sqrt(math.pi)/2*kappa*(i0e(x)+i1e(x))
            B=math.copysign(math.sqrt(math.pi)/2,hh)*i0e(x)
        return A,B
    def gaussian_monomial(p,q,mu,var):
        # E[w^p conj(w)^q] for proper CN(mu,var), here real mu.
        return sum(math.comb(p,k)*math.comb(q,k)*math.factorial(k)
                   *var**k*mu**(p+q-2*k) for k in range(min(p,q)+1))
    def schwinger(U,hh,rate,p,q):
        r=math.sqrt(U)
        def integrand(t):
            den=rate+t*t*hh*hh
            mu=-t*t*hh*r/den;variance=1/den
            norm=math.exp(-rate*t*t*U/den)/den
            if p==q==0:
                numerator=r*rate/den
            else:
                numerator=r*gaussian_monomial(p,q,mu,variance)+hh*gaussian_monomial(p+1,q,mu,variance)
            return 2/math.sqrt(math.pi)*norm*numerator
        return quad(integrand,0,np.inf,epsabs=2e-12,epsrel=2e-12,limit=300)
    checks=[]
    for U,hh in [(0.,.4),(.49,.4),(1.3,-.6),(4.,.2)]:
        A,B=conditional_first(U,hh)
        sA,eA=schwinger(U,hh,1.,0,0)
        sB,eB=schwinger(U,hh,1.,0,1)
        error=max(abs(A-sA),abs(B-sB))
        assert error<2e-10,(U,hh,error)
        checks.append({'U':U,'h':hh,'rice_A':float(A),'rice_B':float(B),
                       'schwinger_A':sA,'schwinger_B':sB,'agreement':error})
    constant_checks=[]
    cutoff=60.
    for hh in [0.,.4,-.7]:
        mz,ez=quad(lambda U:math.exp(-U)*math.sqrt(U)*conditional_first(U,hh)[0],
                   0,cutoff,epsabs=2e-12,epsrel=2e-12,limit=300)
        mw,ew=quad(lambda U:math.exp(-U)*conditional_first(U,hh)[1],
                   0,cutoff,epsabs=2e-12,epsrel=2e-12,limit=300)
        exact_z=math.sqrt(math.pi)/(2*math.sqrt(1+hh*hh))
        exact_w=hh*exact_z
        error=max(abs(mz-exact_z),abs(mw-exact_w))
        assert error<2e-10,(hh,error)
        constant_checks.append({'h':hh,'numerical_z':mz,'numerical_w':mw,
                                'analytic_z':exact_z,'analytic_w':exact_w,'agreement':error})
    mz,ez=quad(lambda U:math.exp(-U)*math.sqrt(U)*conditional_first(U,h(U))[0],
               0,cutoff,epsabs=2e-12,epsrel=2e-12,limit=600)
    mw,ew=quad(lambda U:math.exp(-U)*conditional_first(U,h(U))[1],
               0,cutoff,epsabs=2e-12,epsrel=2e-12,limit=600)
    u=np.array([1.,b]);Pu=np.outer(u,u)/np.dot(u,u)
    M=Pu+math.sqrt(eta)*(np.eye(2)-Pu)
    smoothed=M@np.array([mz,mw])
    out={'schema':'upper-phase-base-low-moments/v1',
         'status':'NUMERICAL_BASE_ANCHORS_NOT_CERTIFIED_QUADRATURE',
         'input_sha256':hashlib.sha256(args.input.read_bytes()).hexdigest(),
         'tool_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
         'seconds':time.monotonic()-started,
         'actual_profile_h_at_U_0_1_4_16':[float(h(U)) for U in [0,1,4,16]],
         'F0_unsmoothed_first_moments':{'z':mz,'w':mw},
         'F0_smoothed_first_moments':smoothed.tolist(),
         'F0_physical_c0_numerical':to_float(data['p'][0])*smoothed[0]**2,
         'quadrature_error_diagnostics_ONLY':{'z':ez,'w':ew},
         'rigorous_tail_formula_at_60':{
             'z':'exp(-60)*(sqrt(60)+1/(2*sqrt(60)))',
             'w':'sqrt(pi)/2*exp(-60)'},
         'conditional_schwinger_vs_rice_checks':checks,
         'constant_profile_gaussian_rotation_checks':constant_checks,
         'finite_gamma_reduction_for_actual_profile':False,
         'new_integral_enclosure':False,'endpoint_changed':False,
         'obstruction':'h(U) is a nonconstant degree-11 polynomial. Conditional integration leaves h(U)^2 in denominators and exponentials; a U-dependent rotation does not preserve the joint Gaussian coordinates or the phase polynomial.'}
    args.output.parent.mkdir(parents=True,exist_ok=True)
    args.output.write_text(json.dumps(out,indent=2)+'\n')
    print(json.dumps({k:out[k] for k in ['status','seconds',
        'actual_profile_h_at_U_0_1_4_16','F0_unsmoothed_first_moments',
        'F0_smoothed_first_moments','F0_physical_c0_numerical',
        'quadrature_error_diagnostics_ONLY']},indent=2))


if __name__=='__main__':main()
