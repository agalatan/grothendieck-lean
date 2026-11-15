# claude-b9ee, 15 Nov 2026.  Does retaining the first-chaos penalty cancel the A-sector "content" gain?
# Base: remote Wick monomial q = c y(|y|^2-2)/sqrt2 (energy u = c^2).  A-sector: (T-1) r y.  Retained variable: u = gamma y.
# Everything is exact up to quadrature:  F_L(G) = 2 E_{T,t} mabs( ell(T), sqrt(t) |c(t-2)/sqrt2 + (T-1) r - gamma| ).
import numpy as np
from scipy import special, optimize
a,b,p=699/1250,179/1250,2500/1891
ell=lambda T: np.sqrt(T)*(a+b*T)
def mabs(x,s):
    d=x+s
    with np.errstate(divide='ignore',invalid='ignore'):
        m=np.where(d>0,4*x*s/np.where(d>0,d,1)**2,0.0)
    return (2/np.pi)*d*special.ellipe(np.clip(m,0,1))
def radial(n=24,pan=26,rmax=7.5):
    xg,wg=np.polynomial.legendre.leggauss(n); e=np.linspace(0,1,pan+1)**1.5*rmax
    r=np.concatenate([(u+v)/2+(v-u)/2*xg for u,v in zip(e[:-1],e[1:])]); w=np.concatenate([(v-u)/2*wg for u,v in zip(e[:-1],e[1:])])
    return r*r, w*2*r*np.exp(-r*r)
T,WT=radial(); t,Wt=radial()
TT=T[:,None]; tt=t[None,:]; W2=WT[:,None]*Wt[None,:]; L2=ell(TT)
def F(c,r,g):   # F_L(q + (T-1) r y - g y)
    return 2*float(np.sum(W2*mabs(L2,np.sqrt(tt)*np.abs(c*(tt-2)/np.sqrt(2)+(TT-1)*r-g))))
# Gaussian remote value at energy u: 2 E_T E_{w~Exp} mabs(ell, sqrt(u w))
def FG(u): return 2*float(np.sum(W2*mabs(L2,np.sqrt(u*tt))))
print('   u       D(q)        Lambda_hat-Lambda   gain K (A only)   r*      gain K\' (A, retained)  r*     gamma*    gainK/D   gainK\'/D')
for u in (0.00551,0.01,0.02,0.03,0.0463,0.07):
    c=np.sqrt(u); base=F(c,0,0)-p*u
    D=FG(u)-F(c,0,0)
    K=optimize.minimize_scalar(lambda r: -(F(c,r,0)-p*(u+r*r)),bounds=(-0.6,0.6),method='bounded',options=dict(xatol=1e-9))
    def inner(r):
        m=optimize.minimize_scalar(lambda g: g*g+F(c,r,g),bounds=(-0.6,0.6),method='bounded',options=dict(xatol=1e-9))
        return m.fun-p*(u+r*r), m.x
    Kp=optimize.minimize_scalar(lambda r: -inner(r)[0],bounds=(-0.6,0.6),method='bounded',options=dict(xatol=1e-9))
    hat0=inner(0.0)[0]
    gK=-K.fun-base; gKp=-Kp.fun-base
    print(' %.5f  %.7f   %+.7f          %.7f      %+.4f   %+.7f           %+.4f  %+.4f   %.4f   %+.4f'%(u,D,hat0-base,gK,K.x,gKp,Kp.x,inner(Kp.x)[1],gK/D,gKp/D))
