# B-sector content: F_B(q) = E_z[(z^2/sqrt2) conj(ph(L+q))] = q * gB(|q|^2); compare C_B^2 / Delta with the certified
# B-cost kappa_B = 0.26 (peak), and evaluate the joint A/B sufficient condition with the (uncertified) cross term 0.118.
import numpy as np, sys
exec(open('scan_majorant.py').read().split("rng=np.random.default_rng(123)")[0])   # tables vg, PHI, G (A-kernel), Bu, rr(t)
from scipy import integrate
th=(np.arange(2048)+0.5)*2*np.pi/2048   # midpoint rule: avoids the point th=pi where |r e^{i th}+y| vanishes when r=y
def M(r,y):  # (1/2pi) int (r cos th + y cos 2th)/|r e^{i th} + y| dth
    return np.mean((r*np.cos(th)+y*np.cos(2*th))/np.sqrt(r*r+y*y+2*r*y*np.cos(th)))
def gB(v):
    y=np.sqrt(v)
    if y<1e-9: return -integrate.quad(lambda t: np.exp(-t)*t/(2*np.sqrt(2)*rr(t)),0,80)[0]
    ts=np.linspace(0,80,2001); rt=rr(ts); i=np.searchsorted(rt,y); pts=[ts[i]] if 0<i<len(ts) else None
    return integrate.quad(lambda t: np.exp(-t)*(t/np.sqrt(2))*M(rr(t),y),0,80,limit=600,points=pts)[0]/y
GB=np.array([gB(v) for v in vg])
print("NaN in GB:",int(np.isnan(GB).sum())); GB=np.where(np.isnan(GB),np.interp(vg,vg[~np.isnan(GB)],GB[~np.isnan(GB)]),GB); print(f"gB(0)={GB[0]:.5f}  gB(0.04)={np.interp(0.04,vg,GB):.5f}   (A-kernel g(0)={G[0]:.5f}, g(0.04)={np.interp(0.04,vg,G):.5f})",flush=True)
kA,kB,kAB=0.24,0.26,0.118
rng=np.random.default_rng(123); N=2_000_000
def cg(n): return (rng.standard_normal(n)+1j*rng.standard_normal(n))/np.sqrt(2)
X=cg(N); Y0,Y1,Y2=cg(N),cg(N),cg(N); S=abs(X)**2
basis={'X(|X|^2-2)':X*(S-2),'X(|Y0|^2-1)':X*(abs(Y0)**2-1),'XbY0^2':np.conj(X)*Y0*Y0,'(|X|^2-1)Y0':(S-1)*Y0,'X^2Yb0':X*X*np.conj(Y0),
       'Y0(|Y0|^2-2)':Y0*(abs(Y0)**2-2),'X(|Y1|^2-1)':X*(abs(Y1)**2-1),'XbY0Y1':np.conj(X)*Y0*Y1,'X Y0bY1':X*np.conj(Y0)*Y1,'Y1^2Yb2':Y1*Y1*np.conj(Y2)}
names=list(basis); Bm=np.array([basis[k] for k in names]); dirs=[X,Y0,Y1,Y2]
def ev(q,u):
    q=q/np.sqrt(np.mean(abs(q)**2))*np.sqrt(u); rho=abs(q)**2
    D=Bu(u)-np.mean(np.interp(rho,vg,PHI)); FA=q*np.interp(rho,vg,G); FB=q*np.interp(rho,vg,GB)
    CA2=sum(abs(np.mean(np.conj(d)*FA))**2 for d in dirs); CB2=sum(abs(np.mean(np.conj(d)*FB))**2 for d in dirs)
    CA,CB=np.sqrt(CA2),np.sqrt(CB2)
    joint=(CA2*kB+CB2*kA+2*kAB*CA*CB)/(kA*kB-kAB*kAB)
    return D,CA2,CB2,joint
for u in [0.0463,0.02,0.0055]:
    print(f"=== u={u}")
    tests=[(n,Bm[i]) for i,n in enumerate(names[:6])]+[(f"mix{k}",(rng.standard_normal(10)+1j*rng.standard_normal(10))@Bm) for k in range(8)]
    worstB=worstJ=0
    for n,q in tests:
        D,CA2,CB2,J=ev(q,u); worstB=max(worstB,CB2/D); worstJ=max(worstJ,J/D)
        print(f"  {n:14s} D={D:.3e}  C_A^2/D={CA2/D:.4f}  C_B^2/D={CB2/D:.4f}  C_B^2/C_A^2={CB2/max(CA2,1e-30):.3f}  joint/D={J/D:.4f} (need<=1)",flush=True)
    print(f"  worst C_B^2/D = {worstB:.4f} (kappa_B = 0.26); worst joint/D = {worstJ:.4f}")
