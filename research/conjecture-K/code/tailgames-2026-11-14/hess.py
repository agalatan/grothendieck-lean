# Second-variation (sector) analysis of the plain phase response for the game (1,-eps,mu,mu,...).
# m0(r) = r[(a0 s - 0.443113 e') + 0.221557 e' T], s=1-mu, e'=eps+mu.  Sector gain/cost ratio = e' * lambda_sector.
import numpy as np
from scipy import integrate
a0=0.8862269254527580; a1=0.3133285343288750
def lam(eps,mu):
    s=1-mu; e=eps+mu
    m0=lambda r: r*((a0*s-a1*np.sqrt(2)*e)+a1/np.sqrt(2)*e*r*r)
    E=lambda F: integrate.quad(lambda r: F(r)*2*r*np.exp(-r*r),0,np.inf,limit=400)[0]
    w=lambda r: 1/(m0(r)+2*mu)
    q=0.5*E(w); Y=E(lambda r:r*r*w(r)); W=0.5*Y; A=0.5*E(lambda r:(r*r-1)**2*w(r)); B=0.25*E(lambda r:r**4*w(r))
    nu=E(lambda r:(r*(r*r-2)/np.sqrt(2))**2*w(r))
    return e*np.array([q,Y,W,A,B,nu]), a0*a0-a1*a1*eps+mu*(1-a0*a0-a1*a1)
print(' eps    mu     N_phase    ratios: remote-cubic  Y(chirp)  W      A      B      radial-chirp')
for mu in (0.0,0.01,0.02,0.03,0.05,0.1):
    for eps in (0.60,0.70,0.7564,0.80,0.85,0.90):
        r,N=lam(eps,mu)
        print('%.4f %.3f  %.6f   '%(eps,mu,N),'  '.join('%.3f'%x for x in r))
    print()
