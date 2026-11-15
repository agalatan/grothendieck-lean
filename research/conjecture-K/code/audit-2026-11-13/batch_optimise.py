#!/usr/bin/env python3
"""Independent multi-start L-BFGS, vectorized only across sample matrix products.
Agent-ID: codex-a713. Each restart has its own L-BFGS history and Armijo search.
"""
import sys, os
sys.dont_write_bytecode=True
from pathlib import Path
ROOT=Path(__file__).resolve().parent
sys.path.insert(0,str(ROOT))
import json,time,argparse,ctypes
import numpy as np
from optimise import Objective, Kernels, indices, seeds, gaussian_points, features, threadpool_limits


class BatchObjective(Objective):
    def __call__(self,X):
        m=X.shape[0]//2
        t=X[:m]+1j*X[m:]
        norms=np.linalg.norm(t,axis=0)
        c=np.asfortranarray(np.sqrt(self.u)*t/norms)
        q=np.asfortranarray(self.basis@c)
        k=self.kernel; ptr=lambda x:ctypes.c_void_p(x.ctypes.data)
        W=np.empty_like(q,order='F'); stat=np.empty((3,X.shape[1]))
        for j in range(X.shape[1]):
            err=self.fast(self.N,self.z.shape[1],ptr(self.z),ptr(q[:,j]),ptr(self.co),k.ngrid-1,
                k.dx,k.vscale,k.vmax,self.g0,self.phi0,self.slope,self.B,self.u,
                ptr(W[:,j]),ptr(self.scratch),ptr(self.stats),ptr(self.contents))
            if err:raise ValueError('kernel range exceeded')
            stat[:,j]=self.stats
        if np.any(stat[1]<=0) or not np.all(np.isfinite(stat)):
            raise ValueError('Nonpositive empirical deficit; investigate independently')
        self.calls+=X.shape[1]
        gc=2*(self.basis.T@W.conj()).conj()/(self.N*stat[1])
        gt=np.sqrt(self.u)/norms*(gc-t*np.real(np.sum(t.conj()*gc,axis=0))/norms**2)
        return -stat[0],-np.r_[gt.real,gt.imag]


def lbfgs_direction(g,history):
    q=g.copy();alphas=[]
    for s,y,rho in reversed(history):
        alpha=rho*np.dot(s,q);alphas.append(alpha);q-=alpha*y
    if history:
        s,y,rho=history[-1];q*=np.dot(s,y)/np.dot(y,y)
    else:q*=1.0
    for (s,y,rho),alpha in zip(history,reversed(alphas)):
        q+=s*(alpha-rho*np.dot(y,q))
    if np.dot(q,g)<=0:return -g
    return -q


def run(a):
    threadpool_limits(limits=a.threads)
    start=time.monotonic();kernel=Kernels(a.row)
    tag=f'{a.row}_n{a.n}_u{a.u:g}';log=ROOT/f'optim_{tag}.jsonl'
    records=[json.loads(l) for l in log.read_text().splitlines()] if log.exists() else []
    if any(o['power']!=a.power or o['seed']!=a.seed+a.n for o in records):
        raise ValueError('Resume configuration differs from saved experiment')
    done={o['restart'] for o in records}
    pending=[(r,c) for r,c in seeds(a.n,a.restarts,a.seed+100*a.n) if r not in done]
    print(json.dumps({'event':'batch_start','tag':tag,'remaining':len(pending),'batch_size':a.batch,
                     'method':'independent_LBFGS_Armijo','power':a.power}),flush=True)
    z=gaussian_points(a.n,a.power,a.seed+a.n);basis=features(z)
    obj=BatchObjective(z,basis,a.u,kernel)
    if a.check:
        cs=[c for _,c in seeds(a.n,a.batch,a.seed)]
        X=np.array([np.r_[c.real,c.imag] for c in cs]).T
        t0=time.monotonic();f,g=obj(X);sec=time.monotonic()-t0
        errors=[]
        for j in (0,len(cs)-1):
            fj,gj=Objective.__call__(obj,X[:,j])
            errors.append({'index':j,'value':float(fj-f[j]),'gradient':float(np.max(abs(gj-g[:,j])))})
        print(json.dumps({'seconds':sec,'errors':errors}),flush=True);return
    for offset in range(0,len(pending),a.batch):
        if time.monotonic()-start>a.seconds:break
        group=pending[offset:offset+a.batch];K=len(group)
        X=np.array([np.r_[c.real,c.imag] for _,c in group]).T
        t0=time.monotonic();f,g=obj(X);hist=[[] for _ in group]
        active=np.ones(K,bool);iterations=np.zeros(K,int);evals=np.ones(K,int)
        messages=['iteration_limit']*K
        for it in range(a.maxiter):
            ids=np.flatnonzero(active)
            if not len(ids):break
            P=np.column_stack([lbfgs_direction(g[:,j],hist[j]) for j in ids])
            gd=np.sum(g[:,ids]*P,axis=0);alpha=np.ones(len(ids))
            remaining=np.arange(len(ids))
            accepted=[]
            for ls in range(20):
                if not len(remaining):break
                jj=ids[remaining]
                proposed=X[:,jj]+P[:,remaining]*alpha[remaining]
                fn,gn=obj(proposed);evals[jj]+=1
                ok=np.isfinite(fn)&(fn<=f[jj]+1e-4*alpha[remaining]*gd[remaining])
                for local in np.flatnonzero(ok):
                    j=int(jj[local]);xn=proposed[:,local];gg=gn[:,local]
                    s=xn-X[:,j];y=gg-g[:,j];sy=np.dot(s,y)
                    if sy>1e-12*np.linalg.norm(s)*np.linalg.norm(y):
                        hist[j].append((s.copy(),y.copy(),1/sy));hist[j]=hist[j][-10:]
                    old=f[j];X[:,j]=xn;f[j]=fn[local];g[:,j]=gg;iterations[j]+=1
                    if np.max(np.abs(gg))<a.gtol:
                        active[j]=False;messages[j]='gradient_tolerance'
                    elif abs(old-f[j])<a.ftol and np.linalg.norm(s)<1e-5:
                        active[j]=False;messages[j]='step_and_function_tolerance'
                remaining=remaining[~ok];alpha[remaining]*=.5
            for loc in remaining:
                j=ids[loc];active[j]=False;messages[j]='line_search_failed'
            if (it+1)%25==0:
                print(json.dumps({'event':'iteration','offset':offset,'iteration':it+1,
                  'active':int(active.sum()),'best_train':float(-min(f)),
                  'seconds':time.monotonic()-t0}),flush=True)
        for j,(r,_) in enumerate(group):
            m=X.shape[0]//2;c=X[:m,j]+1j*X[m:,j];c*=np.sqrt(a.u)/np.linalg.norm(c)
            R,D,C,q=obj.physical(c,grad=False)
            _,gc=obj.physical(c,grad=True)
            tangent=np.sqrt(a.u)*(gc-c*np.vdot(c,gc).real/a.u)
            path=ROOT/f'tensor_{tag}_r{r:02d}.npz'
            np.savez(path,coefficients=c,indices=np.array(indices(a.n)),content=C,n=a.n,u=a.u,
              row=a.row,power=a.power,seed=a.seed+a.n)
            rec={'restart':r,'n':a.n,'u':a.u,'row':a.row,'R_train':R,'D_train':D,
                'C2_train':float(np.vdot(C,C).real),'iterations':int(iterations[j]),
                'evaluations':int(evals[j]),'converged':messages[j] in ('gradient_tolerance','step_and_function_tolerance'),
                'message':messages[j],'gradient_inf':float(np.max(abs(g[:,j]))),
                'unit_sphere_tangent_gradient_norm':float(np.linalg.norm(tangent)),
                'batch_seconds':time.monotonic()-t0,'power':a.power,'seed':a.seed+a.n,
                'tensor':str(path),'fourth_excess_train':float(np.mean(np.abs(q)**4)/a.u**2-2),
                'content_shares_train':(np.abs(C)**2/np.vdot(C,C).real).tolist(),
                'method':'independent_LBFGS_Armijo'}
            with log.open('a') as file:file.write(json.dumps(rec)+'\n')
            print(json.dumps(rec),flush=True)
    print(json.dumps({'event':'batch_end','seconds':time.monotonic()-start}),flush=True)


if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--n',type=int,required=True);p.add_argument('--u',type=float,required=True)
    p.add_argument('--row',default='peak');p.add_argument('--power',type=int,default=20)
    p.add_argument('--restarts',type=int,default=50);p.add_argument('--batch',type=int,default=10)
    p.add_argument('--maxiter',type=int,default=150);p.add_argument('--seconds',type=int,default=1350)
    p.add_argument('--threads',type=int,default=1);p.add_argument('--seed',type=int,default=713013)
    p.add_argument('--gtol',type=float,default=2e-6);p.add_argument('--ftol',type=float,default=2e-11)
    p.add_argument('--check',action='store_true');run(p.parse_args())
