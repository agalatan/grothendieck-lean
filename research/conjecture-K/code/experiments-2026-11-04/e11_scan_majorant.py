# Scan of the joint majorant C(q)^2 <= 0.24 D(q) over random one-driver cubics at the peak row (claude-b9ee, 5 Nov).
import numpy as np, sys, time
from scipy import integrate, special
a,b,p=699/1250,179/1250,2500/1891
rr=lambda t: np.sqrt(t)*(a+b*t)
def A1(r,y):          # E_theta |r + y e^{i theta}|
    if y<1e-15: return r
    if r<1e-15: return y
    return 2/np.pi*(r+y)*special.ellipe(4*r*y/(r+y)**2)
def Kinv(r,y):        # E_theta |r + y e^{i theta}|^{-1}
    if y<1e-15: return 1/r
    k2=4*r*y/(r+y)**2
    if k2>=1: k2=1-1e-15
    return 2/np.pi*special.ellipk(k2)/(r+y)
def phi(v):           # 2 E_Z |L + sqrt v| (radial), = 2 E_T A1(r(T), sqrt v)
    y=np.sqrt(v); return 2*integrate.quad(lambda t: np.exp(-t)*A1(rr(t),y),0,80,limit=400)[0]
def gfun(v):          # F_A(y) = y g(|y|^2): g(v) = (1/sqrt v) E_T[(T-1) E_theta Re ph(r(T)+sqrt v e^{i th})]
    y=np.sqrt(v)
    if y<1e-9: return 0.5*integrate.quad(lambda t: np.exp(-t)*(t-1)/rr(t),0,80)[0]   # g(0) = E[(T-1)/(2r(T))] = -0.83514 (was wrongly 0: distorted interpolation for rho < 0.002)
    def inner(t):
        r=rr(t); return (A1(r,y)+(v-r*r)*Kinv(r,y))/(2*y)
    # singular point where r(t)=y
    ts=np.linspace(0,80,2001); rt=rr(ts); i=np.searchsorted(rt,y); pts=[ts[i]] if 0<i<len(ts) else None
    val=integrate.quad(lambda t: np.exp(-t)*(t-1)*inner(t),0,80,limit=600,points=pts)[0]
    return val/y
t0=time.time()
vg=np.concatenate([np.linspace(0,0.5,251),np.linspace(0.5,5,181)[1:],np.linspace(5,60,56)[1:]])
PHI=np.array([phi(v) for v in vg]); G=np.array([gfun(v) for v in vg])
print(f"tables built in {time.time()-t0:.0f}s; phi(0)={PHI[0]:.5f} (2E|L|=1.37188), g(0.04)={np.interp(0.04,vg,G):.4f}",flush=True)
Bu=lambda u: integrate.quad(lambda s: np.exp(-s)*np.interp(u*s,vg,PHI),0,60)[0]   # B(u)=E phi(u S)
rng=np.random.default_rng(123); N=int(sys.argv[1]) if len(sys.argv)>1 else 3_000_000
def cg(n): return (rng.standard_normal(n)+1j*rng.standard_normal(n))/np.sqrt(2)
X=cg(N); Y=[cg(N) for _ in range(3)]
def evaluate(q,name):
    u=np.mean(abs(q)**2); rho=abs(q)**2
    F=np.mean(np.interp(rho,vg,PHI)); D=Bu(u)-F
    g=np.interp(rho,vg,G); Fq=q*g
    cX=np.mean(np.conj(X)*Fq); cY=[np.mean(np.conj(y)*Fq) for y in Y]
    C2=abs(cX)**2+sum(abs(c)**2 for c in cY)
    m4=np.mean(rho*rho); delta=m4-2*u*u
    print(f"{name:34s} u={u:.4f} delta/u^2={delta/u/u:6.2f}  D={D:+.3e} D/delta={D/delta if delta>0 else float('nan'):+.3f}  C^2={C2:.2e} C^2/D={C2/D if D>0 else float('nan'):.4f}  cX^2/C^2={abs(cX)**2/C2 if C2>0 else 0:.2f}",flush=True)
    return C2/D if D>0 else np.inf
S=abs(X)**2; Y0,Y1,Y2=Y
shells={
 'H1 X(|X|^2-2)': X*(S-2),
 'H2 X(|Y0|^2-1)': X*(abs(Y0)**2-1),
 'XP hermitian (2,-1,-1)': X*(2*(abs(Y0)**2-1)-(abs(Y1)**2-1)-(abs(Y2)**2-1)),
 'XP nonnormal Y0bar Y1': X*np.conj(Y0)*Y1,
 'Xbar Y0^2': np.conj(X)*Y0*Y0,
 '(|X|^2-1) Y0': (S-1)*Y0,
 'X^2 Y0bar': X*X*np.conj(Y0),
 'R: Y0(|Y0|^2-2)': Y0*(abs(Y0)**2-2),
 'q0 zero-tensor (-1/2,1,1,1,1)': X*(-0.5*(S-2)+(abs(Y0)**2-1)+(abs(Y1)**2-1)+(abs(Y2)**2-1)+(abs(cg(N))**2-1)),
 'A+R: XbarY0^2 + Y0(|Y0|^2-2)': np.conj(X)*Y0*Y0+Y0*(abs(Y0)**2-2),
}
worst=0
for u in [0.0463,0.02,0.0055]:
    print(f"=== u = {u}")
    for name,q in shells.items():
        q=q/np.sqrt(np.mean(abs(q)**2))*np.sqrt(u); worst=max(worst,evaluate(q,name))
    for k in range(12):
        c=rng.standard_normal(10)+1j*rng.standard_normal(10)
        q=(c[0]*X*(S-2)+c[1]*X*(abs(Y0)**2-1)+c[2]*X*np.conj(Y0)*Y1+c[3]*np.conj(X)*Y0*Y0+c[4]*(S-1)*Y0+c[5]*X*X*np.conj(Y1)
           +c[6]*Y0*(abs(Y0)**2-2)+c[7]*Y0*(abs(Y1)**2-1)+c[8]*X*(abs(Y1)**2-1)+c[9]*np.conj(X)*Y0*Y1)
        q=q/np.sqrt(np.mean(abs(q)**2))*np.sqrt(u); worst=max(worst,evaluate(q,f"random mix #{k}"))
print("WORST C^2/D over the scan:",worst)
