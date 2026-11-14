"""Deterministic calibration and interpolation convergence, codex-a713."""
import sys
sys.dont_write_bytecode=True
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parent))
import os
for key in ('OPENBLAS_NUM_THREADS','OMP_NUM_THREADS','VECLIB_MAXIMUM_THREADS'):os.environ[key]='1'
import json, math
import numpy as np
from scipy.special import roots_legendre
from kernels import Kernels,ROOT


def two_radial(k,u,n,tau=None):
    # Both exponential radii truncated at40. Values at n,2n check quadrature.
    nodes,weights=roots_legendre(n)
    s=20*(1+nodes);w=20*weights*np.exp(-s)
    R=s[:,None];S=s[None,:];W=w[:,None]*w[None,:]
    if tau is None:
        c=math.sqrt(u); P=(S-1)+np.zeros_like(R)
    else:
        c=math.sqrt(u/(2+tau*tau));P=(R-2)+1j*tau*(S-1)
    v=c*c*R*abs(P)**2
    ph,_,g,_=k.eval(v)
    F=float(np.sum(W*ph))
    C=c*np.sum(W*R*P*(g-k.g0))
    D=k.B(u)-F
    return dict(n=n,F=F,D=D,C=[float(C.real),float(C.imag)],C2=float(abs(C)**2),ratio=float(abs(C)**2/D))


k=Kernels('peak')
k2=Kernels('peak',8193)
rng=np.random.default_rng(8461)
v=np.r_[0,np.exp(rng.uniform(-22,9,10000))]
e1=k.eval(v);e2=k2.eval(v)
convergence={name:float(np.max(abs(a-b))) for name,a,b in zip(('phi','phi_prime','g','g_prime'),e1,e2)}
out={'agent':'codex-a713','note':'floating quadrature, not interval certificates','table_4097_8193_difference':convergence,'templates':{}}
for u in [.02,.03,.0463]:
    cases={'wick':k.calibrate(u),'XP':[],'saddle_tau_0.1':[]}
    for n in (128,256,512):
        cases['XP'].append(two_radial(k,u,n))
        cases['saddle_tau_0.1'].append(two_radial(k,u,n,.1))
    out['templates'][str(u)]=cases
(ROOT/'kernel_calibration.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out,indent=2))
