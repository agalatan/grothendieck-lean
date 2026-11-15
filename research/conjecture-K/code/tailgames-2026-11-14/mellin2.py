import numpy as np, warnings
from scipy import integrate, special
warnings.filterwarnings('ignore')
def gabs(p): return 2**(p/2)*special.gamma((p+1)/2)/np.sqrt(np.pi)
def mom(coef, p):
    P=np.polynomial.Polynomial(coef); roots=sorted([r.real for r in P.roots() if abs(r.imag)<1e-12])
    br=[-14.0]+roots+[14.0]
    tot=0.0
    for a,b in zip(br[:-1],br[1:]):
        # singular endpoints at the roots: use tanh-sinh-like substitution via quad with weight
        g=lambda x: np.abs(P(x))**p*np.exp(-x*x/2)/np.sqrt(2*np.pi)
        m=(a+b)/2
        tot+=integrate.quad(g,a,m,limit=400,epsabs=1e-13,epsrel=1e-12)[0]+integrate.quad(g,m,b,limit=400,epsabs=1e-13,epsrel=1e-12)[0]
    return tot
tests={'He2':[-1,0,1],'He3':[0,-3,0,1],'He4':[3,0,-6,0,1],'He5':[0,15,0,-10,0,1],'He6':[-15,0,45,0,-15,0,1]}
ps=np.round(np.arange(-0.9,10.01,0.1),2)
for name,c in tests.items():
    m2=mom(c,2.0)
    D=np.array([np.log(mom(c,p))-np.log(gabs(p))-p/2*np.log(m2) for p in ps])
    d2=np.diff(D,2)/0.01
    bad=ps[1:-1][d2<-1e-6]
    print(name,' D(1)=%.5f  D(-0.5)=%.4f D(4)=%.4f'%(D[np.argmin(abs(ps-1))],D[np.argmin(abs(ps+0.5))],D[np.argmin(abs(ps-4))]),' min D\'\'=%.4f at p=%.1f'%(d2.min(),ps[1:-1][np.argmin(d2)]),' nonconvex p-range:',(bad.min(),bad.max()) if len(bad) else None)
