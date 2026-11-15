"""Conjecture K kernels, independently derived; agent codex-a713, 2026-11-13.
All on-disk outputs are confined to this audit directory. No interval claim.
"""
import sys
sys.dont_write_bytecode = True
import os
for _key in ('OPENBLAS_NUM_THREADS', 'OMP_NUM_THREADS', 'VECLIB_MAXIMUM_THREADS'):
    os.environ[_key] = '1'
from pathlib import Path
import json
import time
import math
import numpy as np
from scipy import integrate, optimize, special, interpolate

ROOT = Path(__file__).resolve().parent
ROWS = {'peak': (1891/2500, 1057/1250, 179/1250),
        'flank': (.745, .8534, .1467), 'upper': (.7564, .877, .152)}
SQRTPI = math.sqrt(math.pi)


def angular(r, y):
    """E_theta |r e^(i theta)+y| and its radial derivative divided by y.
    H=A_y/y; its y=0 limit is 1/(2r). Stable also for r>>y.
    """
    if y == 0:
        return r, 0.5/r
    if r == 0:
        return y, 1/y
    hi, lo = max(r,y), min(r,y)
    s = (lo/hi)**2
    if s >= 1:
        E, one_minus_s_K = 1., 0.
    else:
        E = special.ellipe(s)
        one_minus_s_K = (1-s)*special.ellipk(s)
    A = 2/math.pi*hi*(2*E-one_minus_s_K)
    if y >= r:
        H = 2/math.pi*E/y
    elif s < 0.1:
        H = 0.5/r*special.hyp2f1(.5,.5,2.,s)
    else:
        H = 2/math.pi*(E-one_minus_s_K)/(r*s)
    return A, H


class Kernels:
    def __init__(self, row='peak', ngrid=4097, rebuild=False, cache=True):
        self.row = row
        self.eps,self.ell,self.b = ROWS[row]
        self.a = self.ell-2*self.b
        self.phi0 = SQRTPI*(self.a+1.5*self.b)
        self.vscale = .05
        self.vmax = 10000.
        self.ngrid = int(ngrid)
        self.path = ROOT/f'kernels_{row}_{ngrid}.npz'
        self.g0 = integrate.quad(lambda s: math.exp(-s*s)*(s*s-1)/(self.a+self.b*s*s),0,10,epsabs=2e-13,epsrel=2e-13)[0]
        self.phip0 = integrate.quad(lambda s: math.exp(-s*s)/(self.a+self.b*s*s),0,10,epsabs=2e-13,epsrel=2e-13)[0]
        if self.path.exists() and not rebuild:
            with np.load(self.path) as data:
                self.x=data['x']; self.values=data['values']
        else:
            self.x=np.linspace(0,math.log1p(self.vmax/self.vscale),self.ngrid)
            v=self.vscale*np.expm1(self.x)
            start=time.monotonic()
            self.values=np.array([self.direct(float(z))[:2] for z in v]).T
            if cache:
                np.savez(self.path,x=self.x,values=self.values)
            print(f'Built {row} kernel table, {ngrid} nodes, {time.monotonic()-start:.2f} seconds',flush=True)
        self.dx=self.x[1]-self.x[0]
        # g'(0)=-1/(16) int r^-3 (T-1) is NOT valid: moving the
        # origin through r=0 introduces cancellation. Use spline endpoint.
        self.spline=interpolate.CubicSpline(self.x,self.values,axis=1)
        self.coeff=self.spline.c.transpose(0,2,1)
        self._B_cache={}
        self._B_error={}

    def direct(self,v,derivative=False,tol=2e-12):
        """Adaptive elliptic-integral quadrature. Returns phi,g[,phi_prime]."""
        if v == 0:
            return (self.phi0,self.g0,self.phip0) if derivative else (self.phi0,self.g0)
        y=math.sqrt(v)
        root=optimize.brentq(lambda s: s*(self.a+self.b*s*s)-y,0,max(1,(y/self.b)**(1/3)))
        points=[]
        breakpoint=root
        while breakpoint < 10:
            points.append(breakpoint)
            breakpoint *= 2
        points=points or None
        def fphi(s):
            r=s*(self.a+self.b*s*s)
            A,_=angular(r,y)
            return 4*s*math.exp(-s*s)*A
        def fg(s):
            r=s*(self.a+self.b*s*s)
            _,H=angular(r,y)
            return 2*s*math.exp(-s*s)*(s*s-1)*H
        kw=dict(epsabs=tol,epsrel=tol,points=points,limit=220)
        ph=integrate.quad(fphi,0,10,**kw)[0]
        gg=integrate.quad(fg,0,10,**kw)[0]
        if derivative:
            def fp(s):
                _,H=angular(s*(self.a+self.b*s*s),y)
                return 2*s*math.exp(-s*s)*H
            pp=integrate.quad(fp,0,10,**kw)[0]
            return ph,gg,pp
        return ph,gg

    def eval(self,v):
        """Return phi, phi_prime, g, g_prime; derivatives of smooth table.
        Uniform transformed grid gives O(N) indexing with no binary search.
        """
        v=np.asarray(v,dtype=float)
        if np.any(v<0): raise ValueError('v must be nonnegative')
        if np.any(v>self.vmax):
            raise ValueError('v exceeds kernel table; extend vmax, never silently clip')
        x=np.log1p(v/self.vscale)
        idx=np.minimum((x/self.dx).astype(np.int64),self.ngrid-2)
        d=x-self.x[idx]
        c=self.coeff[:,:,idx]
        val=((c[0]*d+c[1])*d+c[2])*d+c[3]
        der=((3*c[0]*d+2*c[1])*d+c[2])/(v+self.vscale)
        return val[0],der[0],val[1],der[1]

    def B(self,u):
        if float(u) not in self._B_cache:
            # Integration of the same interpolant removes inconsistent-kernel bias.
            val,err=integrate.quad(lambda s: math.exp(-s)*float(self.eval(u*s)[0]),0,60,epsabs=2e-12,epsrel=2e-12,limit=200)
            self._B_cache[float(u)]=val
            self._B_error[float(u)]=err
        return self._B_cache[float(u)]

    def calibrate(self,u=.0463):
        # Exact radial reduction of Wick monomial q=sqrt(u/2)X(R-2).
        c=math.sqrt(u/2)
        f=lambda t: c*c*t*(t-2)**2
        F,F_error=integrate.quad(lambda t:math.exp(-t)*float(self.eval(f(t))[0]),0,60,points=[2],epsabs=2e-11,epsrel=2e-11,limit=300)
        content,C_error=integrate.quad(lambda t:math.exp(-t)*c*t*(t-2)*(float(self.eval(f(t))[2])-self.g0),0,60,points=[2],epsabs=2e-11,epsrel=2e-11,limit=300)
        D=self.B(u)-F
        tail=math.exp(-60)
        return dict(u=u,B=self.B(u),F=F,D=D,C=content,C2=content**2,ratio=content**2/D,fourth_excess=42.,
            adaptive_quadrature_error_estimates={'F':F_error,'C':C_error,'B':self._B_error[float(u)]},
            analytic_truncation_bounds_evaluated_in_float={
              'F':tail*(self.phi0+2*c*(60**2+4*60+4)),
              'C':tail*((2/math.e)*61+abs(c*self.g0)*(60**2+4*60+4)),
              'B':tail*(self.phi0+2*math.sqrt(u)*61)},
            error_status='Adaptive estimates are not rigorous; interpolation/roundoff errors are separate')

if __name__=='__main__':
    import argparse
    parser=argparse.ArgumentParser()
    parser.add_argument('--row',default='peak',choices=ROWS)
    parser.add_argument('--ngrid',type=int,default=4097)
    parser.add_argument('--rebuild',action='store_true')
    args=parser.parse_args()
    k=Kernels(args.row,args.ngrid,args.rebuild)
    checks=[]
    rng=np.random.default_rng(728193)
    points=np.r_[0.,1e-10,1e-7,1e-5,.005,.04,.3,1,10,100,500, np.exp(rng.uniform(-14,8,40))]
    for v in points:
        ph,g,pp=k.direct(float(v),derivative=True)
        ph0,pp0,g0,gp0=k.eval(v)
        checks.append(dict(v=float(v),phi_error=float(ph0-ph),g_error=float(g0-g),phi_prime_error=float(pp0-pp)))
    out=dict(agent='codex-a713',row=args.row,phi0=k.phi0,g0=k.g0,phip0=k.phip0,calibration=[k.calibrate(u) for u in [.02,.03,.0463]],checks=checks)
    (ROOT/f'kernel_checks_{args.row}_{args.ngrid}.json').write_text(json.dumps(out,indent=2)+'\n')
    print(json.dumps({key:out[key] for key in ('phi0','g0','phip0','calibration')},indent=2))
    print('max interpolation errors', {key:max(abs(c[key]) for c in checks) for key in ('phi_error','g_error','phi_prime_error')})
