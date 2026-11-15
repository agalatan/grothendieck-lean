# REVIEW_4 (claude-b9ee, 15 November 2026): written by the reviewer agent of the session, copied from its scratch folder; first-principles radial tables EN and Fraw at the peak row; writes tables.npz (path given as argument).
# claude reviewer (N): first-principles radial tables for the peak row.
#   L = Z(a+b|Z|^2), T=|Z|^2 ~ Exp(1), rho(T)=sqrt(T)(a+bT), phase uniform.
#   EN(R)   = E_T E_phi |R + rho e^{i phi}|          (so hF(R^2) = 2 EN(R) = 2E|L+R|)
#   Fraw(R) = E_T[(T-2/5) E_phi Re ph(R + rho e^{i phi})]
# Angular means (series derived independently):
#   rho<R:  E|R+rho e| = R 2F1(-1/2,-1/2;1;x^2), x=rho/R;   E Re ph = 2F1(-1/2,1/2;1;x^2)
#   rho>R:  E|R+rho e| = rho 2F1(-1/2,-1/2;1;y^2), y=R/rho; E Re ph = (y/2) 2F1(1/2,1/2;2;y^2)
import numpy as np
from scipy import special, integrate, optimize
a, b, d = 699/1250, 179/1250, 0.4
rho = lambda T: np.sqrt(T)*(a + b*T)
def T0(R):
    if R == 0: return 0.0
    return optimize.brentq(lambda T: rho(T) - R, 0, max(1.0, (R/b)**(2/3)+R/a)**1+10, xtol=1e-15, rtol=1e-15)
def angN(R, r):
    if r < R: return R*special.hyp2f1(-0.5, -0.5, 1, (r/R)**2)
    if r == 0: return 0.0
    return r*special.hyp2f1(-0.5, -0.5, 1, (R/r)**2)
def angA(R, r):
    if r < R: return special.hyp2f1(-0.5, 0.5, 1, (r/R)**2)
    return (R/(2*r))*special.hyp2f1(0.5, 0.5, 2, (R/r)**2)
def EN(R):
    t0 = T0(R); f = lambda T: np.exp(-T)*angN(R, rho(T))
    s = 0.0
    if t0 > 0: s += integrate.quad(f, 0, t0, epsabs=1e-15, epsrel=1e-13, limit=400)[0]
    s += integrate.quad(f, t0, t0 + 60, epsabs=1e-15, epsrel=1e-13, limit=400)[0]
    return s
def Fraw(R):
    t0 = T0(R); f = lambda T: np.exp(-T)*(T - d)*angA(R, rho(T))
    s = 0.0
    if t0 > 0: s += integrate.quad(f, 0, t0, epsabs=1e-15, epsrel=1e-13, limit=400)[0]
    s += integrate.quad(f, t0, t0 + 60, epsabs=1e-15, epsrel=1e-13, limit=400)[0]
    return s
# c0 = Fraw'(0) = E[(T-d)/(2 rho)];  substitute T = s^2
c0 = integrate.quad(lambda s: 2*s*np.exp(-s*s)*(s*s - d)/(2*s*(a + b*s*s)), 0, 12, epsabs=1e-16, epsrel=1e-14, limit=400)[0]
if __name__ == '__main__':
    import time, sys
    t = time.time()
    Rg = np.concatenate([np.linspace(0, 4, 4001), np.geomspace(4, 80, 801)[1:]])
    en = np.array([EN(R) for R in Rg]); fr = np.array([Fraw(R) for R in Rg])
    np.savez(sys.argv[1], R=Rg, EN=en, Fraw=fr, c0=c0)
    print('c0 =', repr(c0), ' (report: 0.024048342160729148)   seconds', time.time() - t)
    print('hF(0) = 2E|L| =', 2*en[0], ' exact 387 sqrt(pi)/500 =', 387*np.sqrt(np.pi)/500)
    print('Fraw(inf) -> E(T-d)=0.6; Fraw(80) =', fr[-1])
