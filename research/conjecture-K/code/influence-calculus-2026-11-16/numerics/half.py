"""Theorem 9 with the sharp influence constant 1/2 (Corollary 13.1) against (F) and the 3/4 version (label N).
Gaussian-law shadows, peak row, raw and tilted (3/5) profiles; the coefficient gamma of ledger 11.49 for comparison."""
import sys, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np
from influence import prof, Er, GAMMA
from scipy.optimize import brentq
def capc(u,dl,sA,sB,c):
    L=np.sqrt(c*dl); th=np.linspace(0,np.pi/2,40001)
    return float(np.max(np.sqrt(np.minimum(L*np.cos(th),2*u))*sA+np.sqrt(np.minimum(L*np.sin(th),u))*sB)**2)
for lab in ["tilt","raw"]:
    h,hp=prof(lab)
    for u in [0.009,0.02,0.03,0.0463]:
        psi=lambda r: h(u*r)+u*r*hp(u*r); m=Er(psi)
        sA=np.sqrt(Er(lambda r:(psi(r)-m)**2)); sB=np.sqrt(Er(lambda r:(u*r*hp(u*r))**2))
        F=u*(np.sqrt(2)*sA+sB)**2
        row=" ".join(f"chi={c}: F {F/(c*u*u):.4f} | 3/4 {capc(u,c*u*u,sA,sB,0.75)/(c*u*u):.4f} | 1/2 {capc(u,c*u*u,sA,sB,0.5)/(c*u*u):.4f};" for c in [1,2,4,6,8,10])
        out=f"{lab} u={u}: T/delta  {row}"
        if lab=="tilt":
            g=GAMMA[u]
            x34=brentq(lambda c: capc(u,c*u*u,sA,sB,0.75)/(c*u*u)-g,0.05,60)
            x12=brentq(lambda c: capc(u,c*u*u,sA,sB,0.5)/(c*u*u)-g,0.05,60)
            out+=f"  | crossover with gamma={g:.4f} of 11.49: chi = {x34:.2f} (3/4), {x12:.2f} (1/2)"
        print(out,flush=True)
