#!/usr/bin/env python3
"""Independent full Wick-chaos content experiment. Agent-ID: codex-a713.

Every objective uses the complete fixed scrambled Sobol set (default 2**20).
The exact Gaussian coefficient norm, not an empirical sample norm, sets energy.
Writes only beside this file; resumable JSONL records and tensor checkpoints.
"""
import os, sys
sys.dont_write_bytecode = True
for name in ('VECLIB_MAXIMUM_THREADS','OPENBLAS_NUM_THREADS','OMP_NUM_THREADS'):
    os.environ.setdefault(name, '1')
from pathlib import Path
ROOT = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT))
import argparse, json, time, math, ctypes
import numpy as np
from scipy.special import ndtri
from scipy.stats import qmc
from scipy.optimize import minimize
from threadpoolctl import threadpool_limits
from kernels import Kernels


def indices(n):
    return [(i,j,k) for i in range(n) for j in range(i,n) for k in range(n)]


def gaussian_points(n, power, seed):
    U = qmc.Sobol(2*n, scramble=True, seed=seed).random_base2(power)
    np.clip(U, 2**-53, 1-2**-53, out=U)
    ndtri(U, out=U)
    return np.ascontiguousarray((U[:,:n]+1j*U[:,n:])/np.sqrt(2))


def features(z, dtype=np.complex128):
    n = z.shape[1]
    out = np.empty((len(z), len(indices(n))), dtype=dtype, order='F')
    for s,(i,j,k) in enumerate(indices(n)):
        b = z[:,i]*z[:,j]*z[:,k].conj()
        if i==k: b -= z[:,j]
        if j==k: b -= z[:,i]
        out[:,s] = b / np.sqrt(1+(i==j))
    return out


class Objective:
    def __init__(self, z, basis, u, kernel):
        self.z=z; self.basis=basis; self.u=u; self.kernel=kernel
        self.N=len(z); self.B=kernel.B(u)
        vals=kernel.eval(np.array([0.,u]))
        self.phi0=float(vals[0][0]); self.g0=float(vals[2][0])
        self.slope=float(vals[1][1]); self.calls=0
        self.fast=None
        if (ROOT/'fast_eval.dylib').exists():
            self.fast=ctypes.CDLL(str(ROOT/'fast_eval.dylib')).content_eval
            self.fast.argtypes=[ctypes.c_long,ctypes.c_int,ctypes.c_void_p,ctypes.c_void_p,
              ctypes.c_void_p,ctypes.c_int]+[ctypes.c_double]*8+[ctypes.c_void_p]*4
            self.fast.restype=ctypes.c_int
            self.co=np.ascontiguousarray(kernel.coeff)
            self.scratch=np.empty(3*self.N)
            self.weights=np.empty(self.N,complex)
            self.stats=np.empty(3)
            self.contents=np.empty(z.shape[1],complex)
    def physical(self,c,grad=True,q=None):
        if q is None:q=self.basis@c
        else:q=np.ascontiguousarray(q,dtype=np.complex128)
        if self.fast:
            k=self.kernel
            ptr=lambda x:ctypes.c_void_p(x.ctypes.data)
            err=self.fast(self.N,self.z.shape[1],ptr(self.z),ptr(q),ptr(self.co),k.ngrid-1,
                k.dx,k.vscale,k.vmax,self.g0,self.phi0,self.slope,self.B,self.u,
                ptr(self.weights),ptr(self.scratch),ptr(self.stats),ptr(self.contents))
            if err: raise ValueError('kernel range exceeded or nonfinite q')
            R,D,N=self.stats
            if not np.isfinite(R) or D<=0:
                raise ValueError('Nonpositive empirical deficit; independent investigation required')
            self.calls+=1
            if not grad:return float(R),float(D),self.contents.copy(),q
            gc=2*(self.basis.T@self.weights.conj()).conj()/(self.N*D)
            return float(R),gc
        v=q.real*q.real+q.imag*q.imag
        ph,dp,g,gp=self.kernel.eval(v)
        h=g-self.g0
        # Exact zero-mean controls: E|q|²=u and E[conj(z_j)q]=0.
        F=self.phi0+self.slope*self.u+np.mean(ph-self.phi0-self.slope*v)
        D=self.B-F
        C=(self.z.T@(q*h).conj()).conj()/self.N
        N=float(np.vdot(C,C).real)
        R=N/D
        if not np.isfinite(R) or D<=0:
            raise ValueError('Nonpositive empirical deficit; independent investigation required')
        self.calls+=1
        if not grad: return R,D,C,q
        zC=self.z@C
        w=h*zC+(2*gp*np.real(zC.conj()*q)+R*(dp-self.slope))*q
        gc=2*(self.basis.T@w.conj()).conj()/(self.N*D)
        return R,gc
    def __call__(self,x):
        m=len(x)//2
        t=x[:m]+1j*x[m:]
        norm=np.linalg.norm(t)
        c=np.sqrt(self.u)*t/norm
        r,gc=self.physical(c)
        gt=np.sqrt(self.u)/norm*(gc-t*np.vdot(t,gc).real/norm**2)
        return -r,-np.r_[gt.real,gt.imag]


def seeds(n, count, seed):
    rng=np.random.default_rng(seed); ids=indices(n); m=len(ids)
    for r in range(count):
        c=rng.normal(size=m)+1j*rng.normal(size=m)
        c/=np.linalg.norm(c)
        if r==0:
            c[:]=0; c[ids.index((0,0,0))]=1
        elif r==1:
            c[:]=0; c[ids.index((0,1,1))]=1
        elif r<10:
            t=np.zeros(m,complex); t[ids.index((0,0,0))]=1
            c=(0.05+0.05*r)*c+t
        elif r<15:
            # Saddle perturbation, then a small full-space perturbation.
            t=np.zeros(m,complex); t[ids.index((0,0,0))]=1
            t[ids.index((0,1,1))]=1j*(r-9)*0.06
            c=t+0.03*c
        # Remaining starts sample the entire complex sphere.
        c/=np.linalg.norm(c)
        yield r,c


def run(args):
    threadpool_limits(limits=args.threads)
    start=time.monotonic()
    kernel=Kernels(row=args.row)
    tag=f'{args.row}_n{args.n}_u{args.u:g}'
    log=ROOT/f'optim_{tag}.jsonl'
    done={}
    if log.exists():
        for l in log.read_text().splitlines():
            o=json.loads(l); done[o['restart']]=o
            if o['power']!=args.power or o['seed']!=args.seed+args.n:
                raise ValueError('Resume configuration differs from existing experiment')
    print(json.dumps({'event':'start','tag':tag,'done':len(done),'dimension':len(indices(args.n)),
                      'power':args.power,'threads':args.threads}),flush=True)
    z=gaussian_points(args.n,args.power,args.seed+args.n)
    basis=features(z)
    obj=Objective(z,basis,args.u,kernel)
    if args.check:
        r,c=next(seeds(args.n,1,43)); x=np.r_[c.real,c.imag]
        rng=np.random.default_rng(28); d=rng.normal(size=len(x)); d/=np.linalg.norm(d)
        t0=time.monotonic(); value,gradient=obj(x)
        checks=[]
        for h in (1e-4,1e-5,1e-6):
            fd=(obj(x+h*d)[0]-obj(x-h*d)[0])/(2*h)
            checks.append({'h':h,'finite_difference':fd,'analytic':float(gradient@d)})
        R,D,C,q=obj.physical(np.sqrt(args.u)*c,grad=False)
        print(json.dumps({'event':'gradient_check','R':R,'D':D,'C2':float(np.vdot(C,C).real),
                          'checks':checks,'seconds_per_call':(time.monotonic()-t0)/8}),flush=True)
        return
    for r,c in seeds(args.n,args.restarts,args.seed+100*args.n):
        if r in done: continue
        if time.monotonic()-start>args.seconds: break
        t0=time.monotonic(); calls=obj.calls
        x=np.r_[c.real,c.imag]
        result=minimize(obj,x,jac=True,method='L-BFGS-B',options={'maxiter':args.maxiter,
                  'ftol':2e-11,'gtol':args.gtol,'maxls':18,'maxcor':10})
        m=len(c); c=result.x[:m]+1j*result.x[m:]
        c*=np.sqrt(args.u)/np.linalg.norm(c)
        R,D,C,q=obj.physical(c,grad=False)
        path=ROOT/f'tensor_{tag}_r{r:02d}.npz'
        np.savez(path,coefficients=c,indices=np.array(indices(args.n)),content=C,n=args.n,u=args.u,
                 row=args.row,power=args.power,seed=args.seed+args.n)
        rec={'restart':r,'n':args.n,'u':args.u,'row':args.row,'R_train':R,'D_train':D,
             'C2_train':float(np.vdot(C,C).real),'iterations':result.nit,'evaluations':obj.calls-calls,
             'converged':bool(result.success),'message':str(result.message),
             'gradient_inf':float(np.max(np.abs(result.jac))),'seconds':time.monotonic()-t0,
             'power':args.power,'seed':args.seed+args.n,'tensor':str(path),
             'fourth_excess_train':float(np.mean(np.abs(q)**4)/args.u**2-2),
             'content_shares_train':(np.abs(C)**2/np.vdot(C,C).real).tolist()}
        with log.open('a') as f: f.write(json.dumps(rec)+'\n')
        print(json.dumps(rec),flush=True)
    print(json.dumps({'event':'batch_end','seconds':time.monotonic()-start}),flush=True)


if __name__=='__main__':
    p=argparse.ArgumentParser()
    p.add_argument('--n',type=int,required=True);p.add_argument('--u',type=float,required=True)
    p.add_argument('--row',default='peak');p.add_argument('--power',type=int,default=20)
    p.add_argument('--restarts',type=int,default=50);p.add_argument('--maxiter',type=int,default=120)
    p.add_argument('--seed',type=int,default=713013);p.add_argument('--seconds',type=int,default=1500)
    p.add_argument('--threads',type=int,default=1);p.add_argument('--gtol',type=float,default=2e-6)
    p.add_argument('--check',action='store_true')
    run(p.parse_args())
