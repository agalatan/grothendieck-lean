"""Wick monomial q = c X(|X|^2-2)/sqrt2 at the peak row (one variable; 1-D quadrature).  Label N.

For the raw profile h = g and the tilt s = 3/5 profile h = (g-g0)-(3/5)(j0-j), prints:
  * the true content C^2/delta and the content recomputed through Theorem 3 (must agree),
  * the projected bound Omega_X of Theorem 4 (exact one-variable Laguerre projections),
  * the unprojected bound (3/2) E[|X|^2 V k'(V)^2],
  * the law-free coefficient (3/2) sup_v v k'(v)^2 against the certified gamma of ledger 11.49,
  * C^2/D and the two bounds divided by D.
Exact one-variable facts used: ||a||^2 = 14u^2, ||c2-u||^2 = 5u^2, delta = 42u^2,
||P20(q^2)||^2 = 8u^2, ||P31(q^2)||^2 = 24u^2  (8 + 24 + 2*5 = 42).
"""
import numpy as np
from scipy import integrate
from scipy.interpolate import interp1d
from core import *
PTS=[0,0.5,1,2,3,4,6,8,12,20,45]
def Er(f):
    return sum(integrate.quad(lambda r: f(r)*np.exp(-r),a,b,limit=400,epsabs=1e-16,epsrel=1e-12)[0] for a,b in zip(PTS[:-1],PTS[1:]))
def kprime(hfun,u):
    def k(v): return integrate.quad(lambda t: hfun(v+u*t)*np.exp(-t),0,80,limit=400,epsabs=1e-15)[0]
    return lambda v:(k(v)-hfun(v))/u
H={"raw":gv,"tilt":lambda v:(gv(v)-g0)-0.6*(j0-jv(v))}
CERT={0.009:251/5000,0.02:441/10000,0.03:3/80,0.0463:13/400}
def run(u,lab):
    h=H[lab]; c=np.sqrt(u); dl=42*u*u
    V=lambda r: u*r*(r-2)**2/2
    Ct=abs(c*Er(lambda r: r*(r-2)/np.sqrt(2)*h(V(r))))
    kp=kprime(h,u); rr=np.concatenate([np.linspace(0,20,4001),np.linspace(20,45,501)[1:]])
    KP=interp1d(rr,[kp(V(r)) for r in rr],kind="cubic")
    t1=Er(lambda r: KP(r)*u*(r-2)*(r-1)*r**2/np.sqrt(2)); t2=Er(lambda r: KP(r)*u*r*(r-2)*(r*r/2-1)/np.sqrt(2))
    Cs=abs(c*(t1+t2))
    F1=lambda r:(r-2)/np.sqrt(2)*KP(r)            # X q k' = c X^2 F1(R)
    p20=Er(lambda r:r**2*F1(r)); p31=Er(lambda r:r**2*(r-3)*F1(r))
    F2=lambda r:r*(r-2)/np.sqrt(2)*KP(r)           # X conj(q) k' = conj(c) F2(R)
    p11=Er(lambda r:(r-1)*F2(r)); p22=Er(lambda r:(r*r-4*r+2)/2*F2(r))
    Om=u*(p20**2/2+0.25*p31**2/6+0.5*p11**2+0.5*p22**2)
    full=1.5*u*Er(lambda r: r*r*F1(r)**2)
    vv=np.concatenate([np.linspace(0,0.05,201),np.linspace(0.05,3,600),np.linspace(3,60,300)])
    lawfree=1.5*max(v*kp(v)**2 for v in vv)
    D=B(u)-Er(lambda r: phi(V(r)))
    print(f"{lab:4s} u={u:.4f}: C^2/delta true {Ct**2/dl:.4e} | via Thm3 {Cs**2/dl:.4e} | Omega(proj) {Om:.4e} (x{Om*dl/Ct**2:.2f}) | unproj {full:.4e} (x{full*dl/Ct**2:.2f}) | law-free {lawfree:.4f}"
          +(f" vs 11.49 gamma {CERT[u]:.4f}" if lab=="tilt" and u in CERT else "")
          +f" | C^2/D {Ct**2/D:.4f} projbound/D {Om*dl/D:.4f} unproj/D {full*dl/D:.4f} | D/delta {D/dl:.4f}")
if __name__=="__main__":
    for u in [0.009,0.02,0.03,0.0463]:
        for lab in ["raw","tilt"]: run(u,lab)
