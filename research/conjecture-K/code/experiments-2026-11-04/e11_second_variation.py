# Deterministic quadrature of C_X^2/D for q_tau = sqrt(u/(2+tau^2)) X[(|X|^2-2) + i tau (|Y|^2-1)], peak row.
import numpy as np
exec(open('scan_majorant.py').read().split("rng=np.random.default_rng(123)")[0])
from scipy import integrate
u=0.0463; Buv=Bu(u)
r=np.linspace(0,40,6001); t=np.linspace(0,40,6001); wr=np.exp(-r); wt=np.exp(-t)
R,Tt=np.meshgrid(r,t,indexing='ij'); W=np.outer(wr,wt)
def ratio(tau):
    c=np.sqrt(u/(2+tau*tau)); b=c*((R-2)+1j*tau*(Tt-1)); rho=R*abs(b)**2
    g=np.interp(rho,vg,G); ph=np.interp(rho,vg,PHI)
    CX=np.trapz(np.trapz(W*R*b*g,t,axis=1),r)        # E[ r b g(r|b|^2) ]
    F=np.trapz(np.trapz(W*ph,t,axis=1),r)
    D=Buv-F; return abs(CX)**2/D, D, abs(CX)**2
r0,D0,C0=ratio(0.0); print(f"tau=0: ratio={r0:.7f} D={D0:.6e} C^2={C0:.6e}")
for tau in [0.02,0.05,0.1,0.2,0.3,0.5]:
    rt,Dt,Ct=ratio(tau); print(f"tau={tau}: ratio={rt:.7f} diff={rt-r0:+.3e} diff/tau^2={(rt-r0)/tau**2:+.4e}  D={Dt:.6e} C^2={Ct:.6e}")
