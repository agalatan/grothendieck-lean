#!/usr/bin/env python3
"""Independent deterministic check/search in X[(R-2)+z(S-1)].
Agent-ID: codex-a713. A separately authored optimizer_audit.md appeared in the
shared audit folder and suggested z≈.052835+.221227i. Its claimed computations
are not adopted as ours. This script checks that explicit polynomial using
our independently built kernels, analytic derivatives, and radial quadrature.
"""
import sys,os
sys.dont_write_bytecode=True
for key in ('VECLIB_MAXIMUM_THREADS','OPENBLAS_NUM_THREADS','OMP_NUM_THREADS'):os.environ[key]='1'
from pathlib import Path
ROOT=Path(__file__).resolve().parent
sys.path.insert(0,str(ROOT))
import numpy as np,json,math
from scipy.special import roots_legendre
from scipy.optimize import minimize
from kernels import Kernels
from moments import fourth_excess
from optimise import indices


class Family:
    def __init__(self,u,order,k):
        nodes,weights=roots_legendre(order)
        t=20*(nodes+1);w=20*weights*np.exp(-t)
        self.R=t[:,None];self.S=t[None,:]
        self.weights=w[:,None]*w[None,:];self.u=u;self.k=k;self.B=k.B(u)
    def evaluate(self,x,gradient=True):
        z=x[0]+1j*x[1];den=2+abs(z)**2;c=np.sqrt(self.u/den)
        P=self.R-2+z*(self.S-1);Q=c*P;v=self.R*abs(Q)**2
        ph,dp,g,gp=self.k.eval(v);h=g-self.k.g0
        F=np.sum(self.weights*ph);D=self.B-F
        C=np.sum(self.weights*self.R*Q*h);N=abs(C)**2;R=N/D
        if not gradient:return dict(R=float(R),D=float(D),C_real=float(C.real),C_imag=float(C.imag),C2=float(N))
        grad=[]
        for j,dP in enumerate((self.S-1,1j*(self.S-1))):
            dQ=c*dP-Q*x[j]/den
            dv=2*self.R*np.real(Q.conj()*dQ)
            dF=np.sum(self.weights*dp*dv)
            dC=np.sum(self.weights*self.R*(dQ*h+Q*gp*dv))
            grad.append((2*np.real(C.conj()*dC)+R*dF)/D)
        return -float(R),-np.array(grad)


def main():
    k=Kernels('peak');out=[]
    for u in (.02,.03,.0463):
        fam=Family(u,192,k);best=None
        for x in ((0,0),(0,.1),(.05,.22),(-.1,.3),(.2,.5)):
            result=minimize(fam.evaluate,np.array(x,float),jac=True,method='BFGS',
                            options={'gtol':2e-11,'maxiter':200})
            if best is None or result.fun<best.fun:best=result
        x=best.x;z=x[0]+1j*x[1]
        checks=[dict(order=n,**Family(u,n,k).evaluate(x,False)) for n in (128,256,512)]
        c=np.zeros(6,complex);ix=indices(2)
        c[ix.index((0,0,0))]=math.sqrt(2*u/(2+abs(z)**2))
        c[ix.index((0,1,1))]=math.sqrt(u/(2+abs(z)**2))*z
        out.append(dict(u=u,z_real=float(z.real),z_imag=float(z.imag),checks=checks,
             coefficients_real=c.real.tolist(),coefficients_imag=c.imag.tolist(),indices=ix,
             fourth_excess_Wick_formula=fourth_excess(c,ix),
             intrinsic_family_gradient=float(np.linalg.norm(fam.evaluate(x)[1])),
             prior_external_claim='Candidate only; external numerical claims not used as verification',
             status='Independently checked floating quadrature; no rigorous global optimality assertion'))
    (ROOT/'STRUCTURED_BASELINE.json').write_text(json.dumps(out,indent=2)+'\n')
    print(json.dumps(out,indent=2))


if __name__=='__main__':main()
