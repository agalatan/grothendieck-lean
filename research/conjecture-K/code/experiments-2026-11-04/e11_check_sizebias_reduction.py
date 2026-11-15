import numpy as np
exec(open('scan_majorant.py').read().split("rng=np.random.default_rng(123)")[0])
B0=PHI[0]; r=np.linspace(0,40,4001); wr=np.exp(-r)
Phi=lambda s: np.interp(s,vg,PHI)-B0
def B(v): return integrate.quad(lambda s: np.exp(-s)*np.interp(v*s,vg,PHI),0,60)[0]
def Bq(v): return integrate.quad(lambda s: np.exp(-s)*phi(v*s),0,50,limit=200,epsabs=1e-11,epsrel=1e-11)[0]
def Bp(v,h=0.008): vv=[Bq(v+k*h) for k in (-2,-1,1,2)]; return (vv[2]-vv[1])/(2*h)-(vv[3]-2*vv[2]+2*vv[1]-vv[0])/(12*h)
def Bpp(v,h=0.008): return (Bq(v+h)-2*Bq(v)+Bq(v-h))/h**2
def Bppp(v,h=0.008): return (Bq(v+2*h)-2*Bq(v+h)+2*Bq(v-h)-Bq(v-2*h))/(2*h**3)
def Ic(c,z):  return np.trapezoid(wr*Phi(r*abs(c*(r-2)+z)**2),r)
def Tc(c,z):  b=c*(r-2)+z; return np.trapezoid(wr*r*b*np.interp(r*abs(b)**2,vg,G),r)
u=0.0463; Bu_=Bq(u); Bp_=Bp(u); Bpp_=Bpp(u); Bppp_=Bppp(u); K=-2*u*Bpp_-u*u*Bppp_
print(f"B(u)={Bu_:.6f} B'={Bp_:.4f} B''={Bpp_:.4f} B'''={Bppp_:.3f} K(u)={K:.5f}")
def H(c,z,p): return Bu_-B0-Ic(c,z)+Bp_*(abs(z)**2-p)+2*u*Bpp_*(np.conj(c)*z).real
t=np.linspace(0,40,4001); wt=np.exp(-t)
for frac in [1/16,1/4,1/2,3/4]:
    p=u*frac; c=np.sqrt((u-p)/2)
    # pointwise positivity on a grid of z
    zs=[rr_*np.exp(1j*th) for rr_ in np.linspace(0,6*np.sqrt(p),13) for th in np.linspace(0,2*np.pi,12,endpoint=False)]
    Hmin=min(H(c,z,p) for z in zs)
    for lam in [np.sqrt(p), 1j*np.sqrt(p)]:
        P=lam*(t-1)
        EH=np.trapezoid(wt*np.array([H(c,z,p) for z in P[::8]]).repeat(8)[:len(t)],t) if False else np.trapezoid(wt*np.array([H(c,z,p) for z in P]),t)
        # exact deficit and content via the (r,t) quadrature
        TT=np.array([Tc(c,z) for z in P]); C=abs(np.trapezoid(wt*TT,t))
        # Delta directly
        R_,T_=np.meshgrid(r,t,indexing='ij'); b=c*(R_-2)+lam*(T_-1); rho=R_*abs(b)**2
        F=np.trapezoid(np.trapezoid(np.outer(wr,wt)*np.interp(rho,vg,PHI),t,axis=1),r); Delta=Bu_-F
        # weighted CS with optimal (lam,mu,nu): minimise E|T - l z - m zbar - n(|z|^2-p)|^2/H  -> least squares with weight 1/H
        Hv=np.array([H(c,z,p) for z in P]); w=wt/Hv
        A=np.stack([P,np.conj(P),abs(P)**2-p],1)
        # complex weighted least squares: minimise sum w |TT - A x|^2
        Aw=A*np.sqrt(w)[:,None]; bw=TT*np.sqrt(w); x,*_=np.linalg.lstsq(Aw,bw,rcond=None)
        N=TT-A@x; CS=np.trapezoid(wt*abs(N)**2/Hv,t)
        print(f"p/u={frac:.4f} lam={lam:+.4f}: Hmin={Hmin:.2e} (|c|^2K={c*c*K:.2e}) | EH(P)={EH:.5e} Delta={Delta:.5e} | C={C:.5f} C^2/Delta={C*C/Delta:.4f} | CS bound E|N|^2/H={CS:.4f}")
