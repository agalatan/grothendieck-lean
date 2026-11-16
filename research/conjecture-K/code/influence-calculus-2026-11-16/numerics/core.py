"""Interpolated peak-row profiles phi(v)=2E|L+sqrt v|, j, g (from tab_peak.npz), the Gaussian benchmark B(u), and S.  Label N."""
import sys, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np
from scipy.interpolate import CubicSpline
from scipy import integrate, optimize
d=np.load(os.path.join(os.path.dirname(os.path.abspath(__file__)),"tab_peak.npz"))
_s=d["s"]
PHI=CubicSpline(_s,d["phi"]); J=CubicSpline(_s,d["j"]); G=CubicSpline(_s,d["g"])
EPS=1891/2500; P=1/EPS
j0=float(d["j"][0]); g0=float(d["g"][0])
def phi(v): return PHI(np.sqrt(v))
def jv(v): return J(np.sqrt(v))
def gv(v): return G(np.sqrt(v))
def B(u):
    return integrate.quad(lambda r: phi(u*r)*np.exp(-r),0,60,limit=400,epsabs=1e-13)[0]
def Sval():
    f=lambda u: -(B(u)-P*u)
    r=optimize.minimize_scalar(f,bounds=(0.02,0.06),method="bounded",options={"xatol":1e-10})
    return -r.fun, r.x
if __name__=="__main__":
    S,us=Sval(); print(f"S = {S:.13f} at u* = {us:.7f}   (ledger 3.14: 1.3739535256614 < S < 1.3739535256616, v0 = 0.0403448)")
    print(f"j0 = {j0:.15f} (ledger 1.431973791291431..432), g0 = {g0:.15f} (ledger -0.835135932614130..129), B0 = {float(phi(0.0)):.15f} (ledger 1.371879280600869..870)")
