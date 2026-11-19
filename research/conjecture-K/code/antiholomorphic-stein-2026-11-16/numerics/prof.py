"""Independent floating-point model of the peak-row visible profiles (label N).
E_psi|Y + r e^{i psi}| and its Y-derivative by complete elliptic integrals; T ~ Exp(1) by adaptive quadrature split at the kink r(T)=Y."""
# Independent numerical model of the peak-row profiles (floating point, N only).
import numpy as np
from scipy import special, integrate
A0=699/1250; B0=179/1250; EPS=1891/2500; P=1/EPS
def rho(T,a=A0,b=B0): return np.sqrt(T)*(a+b*T)
def Mcirc(r,Y):
    # E_psi |Y + r e^{i psi}|
    s=r+Y
    if s==0: return 0.0
    m=4*r*Y/s**2
    return 2/np.pi*s*special.ellipe(min(m,1.0))
def dMcirc(r,Y):
    # E_psi Re ph(Y + r e^{i psi}) = d/dY Mcirc
    if Y==0: return 0.0
    s=r+Y; m=4*r*Y/s**2
    if m>=1: return 0.5
    return ((Y+r)*special.ellipe(m)+(Y-r)*special.ellipk(m))/(np.pi*Y)
def Tint(f,Y,a=A0,b=B0):
    # integrate f(T) e^{-T} over T>=0 with the kink at rho(T)=Y
    # find T* with rho(T*)=Y
    pts=[]
    if Y>0:
        lo,hi=0.0,1.0
        while rho(hi,a,b)<Y: hi*=2
        for _ in range(80):
            mid=(lo+hi)/2
            if rho(mid,a,b)<Y: lo=mid
            else: hi=mid
        pts=[lo]
    g=lambda T: f(T)*np.exp(-T)
    if pts and pts[0]<60:
        r1=integrate.quad(g,0,pts[0],limit=200,epsabs=1e-14,epsrel=1e-12)[0]
        r2=integrate.quad(g,pts[0],np.inf,limit=200,epsabs=1e-14,epsrel=1e-12)[0]
        return r1+r2
    return integrate.quad(g,0,np.inf,limit=200,epsabs=1e-14,epsrel=1e-12)[0]
def phi(v,a=A0,b=B0):  # 2 E|L+sqrt v|
    Y=np.sqrt(v); return 2*Tint(lambda T: Mcirc(rho(T,a,b),Y),Y,a,b)
def jprof(v,a=A0,b=B0):
    Y=np.sqrt(v)
    if Y==0: return 0.5*Tint(lambda T: 1/rho(T,a,b),0.0,a,b)  # j0 = (1/2)E|L|^-1
    return Tint(lambda T: dMcirc(rho(T,a,b),Y),Y,a,b)/Y
def gprof(v,a=A0,b=B0):
    Y=np.sqrt(v)
    if Y==0: return 0.5*Tint(lambda T:(T-1)/rho(T,a,b),0.0,a,b)
    return Tint(lambda T:(T-1)*dMcirc(rho(T,a,b),Y),Y,a,b)/Y
if __name__=="__main__":
    # sanity: dMcirc vs finite difference
    r,Y=0.7,0.4
    print(dMcirc(r,Y),(Mcirc(r,Y+1e-6)-Mcirc(r,Y-1e-6))/2e-6)
    print("j0",jprof(0.0),"g0",gprof(0.0),"(ledger j0 1.4319737913, g0 -0.8351359326)")
    print("B0",phi(0.0),"ledger 1.3718792806")
