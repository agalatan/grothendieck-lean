# claude-b9ee, 15 Nov 2026.  Joint A+B sectors on the remote Wick monomial, with and without the retained first-chaos
# penalty.  G = q + (T-1) r y + Z^2 conj(s y)/sqrt2,  u = gamma y,  q = c y(|y|^2-2)/sqrt2  (r, s, gamma real).
# In the frame of Z:  |ell + A1 e^{i d} + A2 e^{-i d}|,  A1 = sqrt(t)(c(t-2)/sqrt2 + (T-1) r - gamma),  A2 = T sqrt(t) s/sqrt2.
import numpy as np
from scipy import optimize
a,b,p=699/1250,179/1250,2500/1891
def radial(n=16,pan=22,rmax=7.5):
    xg,wg=np.polynomial.legendre.leggauss(n); e=np.linspace(0,1,pan+1)**1.5*rmax
    r=np.concatenate([(u+v)/2+(v-u)/2*xg for u,v in zip(e[:-1],e[1:])]); w=np.concatenate([(v-u)/2*wg for u,v in zip(e[:-1],e[1:])])
    return r*r, w*2*r*np.exp(-r*r)
T,WT=radial(); t,Wt=radial()
nd=64; d=(np.arange(nd)+0.5)*np.pi/nd; cd=np.cos(d)[None,None,:]; sd=np.sin(d)[None,None,:]
TT=T[:,None,None]; tt=t[None,:,None]; W3=(WT[:,None,None]*Wt[None,:,None])/nd; L=np.sqrt(TT)*(a+b*TT)
def F(c,r,s,g):
    A1=np.sqrt(tt)*(c*(tt-2)/np.sqrt(2)+(TT-1)*r-g); A2=TT*np.sqrt(tt)*s/np.sqrt(2)
    return 2*float(np.sum(W3*np.sqrt((L+(A1+A2)*cd)**2+((A1-A2)*sd)**2)))
def FG(u):   # Gaussian remote residual of energy u (|w|^2 = u t, uniform phase)
    return 2*float(np.sum(W3*np.sqrt((L+np.sqrt(u*tt)*cd)**2+(np.sqrt(u*tt)*sd)**2)))
print('   u       D          K: A only   A+B (r*, s*)                 K\': A only   A+B (r*, s*, gamma*)                   ratios to D: K  A+B | K\' A+B')
for u in (0.01,0.02,0.03,0.0463):
    c=np.sqrt(u); base=F(c,0,0,0)-p*u; D=FG(u)-F(c,0,0,0)
    val=lambda r,s: F(c,r,s,0)-p*(u+r*r+s*s)
    def hat(r,s):
        m=optimize.minimize_scalar(lambda g: g*g+F(c,r,s,g),bounds=(-0.6,0.6),method='bounded',options=dict(xatol=1e-8))
        return m.fun-p*(u+r*r+s*s), m.x
    kA=optimize.minimize_scalar(lambda r:-val(r,0),bounds=(-0.5,0.5),method='bounded',options=dict(xatol=1e-8))
    kAB=optimize.minimize(lambda x:-val(x[0],x[1]),[kA.x,0.01],method='Nelder-Mead',options=dict(xatol=1e-7,fatol=1e-12))
    hA=optimize.minimize_scalar(lambda r:-hat(r,0)[0],bounds=(-0.5,0.5),method='bounded',options=dict(xatol=1e-8))
    hAB=optimize.minimize(lambda x:-hat(x[0],x[1])[0],[hA.x,0.005],method='Nelder-Mead',options=dict(xatol=1e-7,fatol=1e-12))
    print(' %.4f  %.7f   %.7f   %.7f (%+.4f,%+.4f)      %.7f   %.7f (%+.4f,%+.4f,%+.4f)        %.4f  %.4f | %.4f  %.4f'%(u,D,-kA.fun-base,-kAB.fun-base,kAB.x[0],kAB.x[1],-hA.fun-base,-hAB.fun-base,hAB.x[0],hAB.x[1],hat(*hAB.x)[1],(-kA.fun-base)/D,(-kAB.fun-base)/D,(-hA.fun-base)/D,(-hAB.fun-base)/D))
