import numpy as np
exec(open('scan_majorant.py').read().split("rng=np.random.default_rng(123)")[0])
B0=PHI[0]; r=np.linspace(0,40,4001); wr=np.exp(-r)
def Bq(v): return integrate.quad(lambda s: np.exp(-s)*phi(v*s),0,50,limit=200,epsabs=1e-11,epsrel=1e-11)[0]
def derivs(u,h=0.008):
    v=[Bq(u+k*h) for k in (-2,-1,0,1,2)]
    return v[2], (v[3]-v[1])/(2*h) - (v[4]-2*v[3]+2*v[1]-v[0])/(12*h), (v[3]-2*v[2]+v[1])/h**2   # B, B' (4th order), B''
def Ic(c,z): return np.trapezoid(wr*(np.interp(r*abs(c*(r-2)+z)**2,vg,PHI)-B0),r)
def Tc(c,z): b=c*(r-2)+z; return np.trapezoid(wr*r*b*np.interp(r*abs(b)**2,vg,G),r)
for u in [0.03,0.0463]:
    Bu_,Bp_,Bpp_=derivs(u); lam=np.trapezoid(wr*r*np.interp(u*r,vg,G),r)
    print(f"u={u}: B={Bu_:.6f} B'={Bp_:.5f} B''={Bpp_:.4f} lambda={lam:.5f}")
    for f in [1/16,1/8,1/4,1/2,3/4,7/8,15/16]:
        p=u*(1-f); c=np.sqrt(u*f/2); m=1e9; arg=None
        for h in np.concatenate([np.linspace(0,0.6,61),np.linspace(0.65,4,68)]):
            for th in np.linspace(0,np.pi,25):
                z=h*np.exp(1j*th); H=Bu_-B0-Ic(c,z)+Bp_*(h*h-p)+2*u*Bpp_*c*z.real
                mg=(H*(0.09+0.13*h*h/p)-abs(Tc(c,z)-lam*z)**2)/H
                if mg<m: m=mg; arg=(h,th,H)
        print(f"  f={f:.4f}: min margin/H = {m:+.5f} at |z|={arg[0]:.3f} arg={arg[1]:.2f} (H={arg[2]:.2e})",flush=True)
