# claude-b9ee, 15 Nov 2026: sanity check of the normalisation used in the "remote closure" report:
# Phi(q) = (E|L+q|)^2 / (A + E|q|^2/lambda),  L = Z + lambda*eta*H(Z),  H(Z) = Z(|Z|^2-2)/sqrt2,  A = 1 - lambda*eta^2.
# For a Gaussian remote q = sigma W the supremum over sigma should be the model norm of the cubic game.
import numpy as np
from scipy import special, optimize
lam,eta=0.75637,0.31631; A=1-lam*eta*eta
def mabs(x,s):
    d=x+s
    with np.errstate(divide='ignore',invalid='ignore'):
        m=np.where(d>0,4*x*s/np.where(d>0,d,1)**2,0.0)
    return (2/np.pi)*d*special.ellipe(np.clip(m,0,1))
def radial(n=24,pan=30,rmax=7.5):
    xg,wg=np.polynomial.legendre.leggauss(n); e=np.linspace(0,1,pan+1)**1.5*rmax
    r=np.concatenate([(u+v)/2+(v-u)/2*xg for u,v in zip(e[:-1],e[1:])]); w=np.concatenate([(v-u)/2*wg for u,v in zip(e[:-1],e[1:])])
    return r*r, w*2*r*np.exp(-r*r)
T,WT=radial(); t,Wt=radial(); W2=WT[:,None]*Wt[None,:]
L=np.abs(np.sqrt(T)*(1+lam*eta*(T-2)/np.sqrt(2)))[:,None]
print('visible profile L = Z(%.5f + %.5f |Z|^2);  ratio b/a = %.5f (peak row of the repository: %.5f)'%(1-np.sqrt(2)*lam*eta,lam*eta/np.sqrt(2),lam*eta/np.sqrt(2)/(1-np.sqrt(2)*lam*eta),(179/1250)/(699/1250)))
Phi=lambda u: float(np.sum(W2*mabs(L,np.sqrt(u*t[None,:]))))**2/(A+u/lam)
r=optimize.minimize_scalar(lambda u:-Phi(u),bounds=(0,1),method='bounded',options=dict(xatol=1e-10))
print('Phi(0) = %.7f   sup over Gaussian q: %.7f at E|q|^2 = %.5f   (cap claimed for all remote cubics with E|q|^2<=1: 0.71325; 500/701 = %.7f)'%(Phi(0.0),-r.fun,r.x,500/701))
for u in (0.25,0.5,1.0,2.0): print('   Gaussian q with E|q|^2 = %.2f: Phi = %.6f'%(u,Phi(u)))
