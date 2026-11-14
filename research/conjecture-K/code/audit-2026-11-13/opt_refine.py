"""codex-a713: refine two-real-parameter axisymmetric family and local Hessian."""
import os
os.environ['OPENBLAS_NUM_THREADS']='1';os.environ['OMP_NUM_THREADS']='1';os.environ['VECLIB_MAXIMUM_THREADS']='1'
import sys, importlib.util
from pathlib import Path
root=Path(__file__).resolve().parent
spec=importlib.util.spec_from_file_location('independent',root/'opt_deterministic.py')
m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m)
np=m.np
from scipy.optimize import minimize
k=m.Kernel()
for n in [80,120,200,300]:
    rr=m.Rule(n,8)
    def obj(z):
        c=np.array([np.sqrt(2),0,0,z[0]+1j*z[1],0,0],complex)
        x=np.r_[c.real,c.imag]
        f,g=rr.objective(x,k)
        return f,np.array([g[3],g[9]])
    res=minimize(obj,np.array([.0528,.2214]),jac=True,method='BFGS',options={'gtol':1e-10,'maxiter':60})
    c=np.array([np.sqrt(2),0,0,res.x[0]+1j*res.x[1],0,0],complex)
    c*=np.sqrt(m.U)/np.linalg.norm(c)
    print('REFINE',n,res.x,rr.data(c,k),res.message,flush=True)
np.savez(root/'opt_refined.npz',c=c)
rr=m.Rule(120,64)
x=np.r_[c.real,c.imag];h=1e-5
H=np.stack([(rr.objective(x+h*e,k)[1]-rr.objective(x-h*e,k)[1])/(2*h) for e in np.eye(12)],axis=1)
print('HESSIAN eigenvalues of negative ratio',np.linalg.eigvalsh((H+H.T)/2),flush=True)
print('HESSIAN antisymmetry',np.max(np.abs(H-H.T)),flush=True)
# Independent kernel interpolation and quadrature refinement at populated scales.
vs=np.r_[0,np.geomspace(1e-8,1000,150)]
old=k.values(vs)
for order in [128,192,256]:
    p,g=m.abel_kernels(vs,order)
    print('KERNEL discrepancy',order,np.max(np.abs(p-old[0])),np.max(np.abs(g-old[1])),flush=True)
kfine=m.Kernel(.001,192)
print('FINE',m.Rule(240,8).data(c,kfine),'Bu',kfine.bu,flush=True)
