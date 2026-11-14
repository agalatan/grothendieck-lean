import numpy as np
exec(open('scan_majorant.py').read().split("rng=np.random.default_rng(123)")[0])
S=1.3739535; p=2500/1891; kappa=0.24
r=np.linspace(0,40,4001); wr=np.exp(-r)
def mono(u):   # pure Wick monomial, deterministic quadrature over r=|X|^2
    c=np.sqrt(u/2); b=c*(r-2); rho=r*b*b
    CX=np.trapezoid(wr*r*b*np.interp(rho,vg,G),r); F=np.trapezoid(wr*np.interp(rho,vg,PHI),r)
    return abs(CX), Bu(u)-F
print(" u      slack=S-B(u)+pu   D(mono)   C(mono)   r(u)    kappa*r   Psi_r(C)   Psi/(D+slack)   C^2/(kappa D)")
for u in [0.0056,0.006,0.007,0.0085,0.01,0.015,0.02,0.03,0.0403,0.0463]:
    slack=S-Bu(u)+p*u; C,D=mono(u); ru=np.sqrt(min(0.01125,(u-0.00551)/0.319))
    Psi=C*C/kappa if C<=kappa*ru else 2*ru*C-kappa*ru*ru
    print(f"{u:.4f}  {slack:+.3e}   {D:.3e}  {C:.4f}  {ru:.4f}  {kappa*ru:.4f}  {Psi:.3e}   {Psi/(D+slack):.4f}        {C*C/(kappa*D):.4f}")
