# /workspace/scratch/f307e93b3610/codex-c7e2-research/all-sector/check_local_stability.py
"""Agent ID codex-c7e2. Exact algebra and floating-point cross-checks; not a certificate."""
import json
import math
from pathlib import Path
import numpy as np
from scipy.integrate import quad
from scipy.special import i0e, i1e
import sympy as s

t,a,b=s.symbols('t a b', positive=True)
x=s.symbols('x', positive=True)
w=t*(a+b*t)/(a+3*b*t)
identities={
'a_kernel':s.factor(t*t-(2*t-t*t)*w-t*t*(a*(t-1)+b*t*(1+t))/(a+3*b*t)),
'b_kernel':s.factor(t*t/2+t-(1-t*t/2)*w-t*t*(a*(t+1)+b*(t*t+3*t+4))/(2*(a+3*b*t))),
'nu_kernel':s.factor(t-t*t/2+t**3/2-w-t*t*(3*b*t*t+(a-3*b)*t+4*b-a)/(2*(a+3*b*t))),
'matrix_determinant':s.factor((2*x-s.Rational(3,2)*x*x)*(2-s.Rational(3,4)*x*x)-(s.Rational(3,2)*x*x-x)**2/2-x*(4-s.Rational(7,2)*x)),
'linear_determinant':s.factor((a+b)*(a+3*b)/2-(a-b)**2/2-(3*a*b+b*b)),
}
assert all(v==0 for v in identities.values())

def integral(f):
    # T=y² removes the only endpoint singularity in the zero-buffer formulas.
    return quad(lambda y: 2*y*math.exp(-y*y)*f(y*y),0,12,epsabs=2e-11,epsrel=2e-11,limit=400)[0]

def check(a,b,v):
    def rd(t):
        r=math.sqrt(t)*(a+b*t)
        if v==0:
            return 1/r,0.,-(a+3*b*t)/(2*t**1.5*(a+b*t)**2)
        x=r*r/(2*v)
        c=math.sqrt(math.pi)/(2*math.sqrt(v))
        r1=c*(i0e(x)+i1e(x))
        d1=c*(i0e(x)-i1e(x))
        derivative=-math.sqrt(math.pi)/(4*v**1.5)*(i1e(x)/x if x else .5)*(a+b*t)*(a+3*b*t)
        return r1,d1,derivative
    pv=integral(lambda t:sum(rd(t)[:2])/2)
    ka=pv-integral(lambda t:(t-1)**2*sum(rd(t)[:2])/2)
    kb=pv-integral(lambda t:t*t*sum(rd(t)[:2])/4)
    mix=integral(lambda t:(rd(t)[0]-rd(t)[1])*t*(t-1)/(2*math.sqrt(2)))
    q=pv-integral(lambda t:t*rd(t)[0])
    nu=pv-integral(lambda t:t*(t-2)**2*rd(t)[0]/2)
    ka2=integral(lambda t:t*t/(a+3*b*t)*(-rd(t)[2])*(a*(t-1)+b*t*(1+t)))
    nu2=integral(lambda t:t*t/(2*(a+3*b*t))*(-rd(t)[2])*(3*b*t*t+(a-3*b)*t+4*b-a))
    assert abs(ka-ka2)<1e-8 and abs(nu-nu2)<1e-8
    vals={'a':a,'b':b,'v':v,'price':pv,'ab_min':float(np.linalg.eigvalsh([[ka,mix],[mix,kb]])[0]),'q_cost':q,'nu_cost':nu,'a_ibp_error':abs(ka-ka2),'nu_ibp_error':abs(nu-nu2)}
    assert min(vals['ab_min'],q,nu)>0
    return vals

rows=[check(a,b,v) for a,b in [(0.5592,0.1432),(.44,.16),(.66,.12),(.01,1.),(1.,.001),(10.,10.)] for v in [0.,.001,.04,1.,10.]]
out={'exact_algebra':{k:str(v) for k,v in identities.items()},'numerical_crosschecks':rows,'status':'Exact algebra passed; all sampled costs positive. Floating quadrature is a cross-check only.'}
Path(__file__).with_name('local_stability_checks.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({'exact_identities':len(identities),'sampled_profiles_and_buffers':len(rows),'status':out['status']},indent=2))
