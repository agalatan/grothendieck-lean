import numpy as np
exec(open('scan_majorant.py').read().split("rng=np.random.default_rng(123)")[0])
r=np.linspace(0,40,4001); t=np.linspace(0,40,4001); wr=np.exp(-r); wt=np.exp(-t)
R,Tt=np.meshgrid(r,t,indexing='ij'); W=np.outer(wr,wt)
def Bq(v): return integrate.quad(lambda s: np.exp(-s)*phi(v*s),0,50,limit=200,epsabs=1e-11,epsrel=1e-11)[0]
def CD(c,lam,u):
    b=c*(R-2)+lam*(Tt-1); rho=R*abs(b)**2
    CX=abs(np.trapezoid(np.trapezoid(W*R*b*np.interp(rho,vg,G),t,axis=1),r))
    F=np.trapezoid(np.trapezoid(W*np.interp(rho,vg,PHI),t,axis=1),r)
    return CX, Bq(u)-F
a=699/1250
for u in [0.00551,0.01,0.02,0.03,0.0463]:
    p=u/5; v=u-p; c=np.sqrt(v/2); C0,D0=CD(c,0,v)
    out=[]
    for lam in [np.sqrt(p),1j*np.sqrt(p),np.sqrt(p/2)*(1+1j),-np.sqrt(p)]:
        C,D=CD(c,lam,u); out.append((C-C0, D0-D, C*C/D))
    print(f"u={u}: C0^2/D0={C0*C0/D0:.4f}  max(C-C0)={max(o[0] for o in out):+.2e} vs p/(2a^2)={p/(2*a*a):.2e} | max(D0-D)={max(o[1] for o in out):+.2e} vs v*p={v*p:.2e} | max ratio={max(o[2] for o in out):.4f}")
