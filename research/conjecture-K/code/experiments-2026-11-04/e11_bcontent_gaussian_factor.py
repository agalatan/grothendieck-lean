import numpy as np
exec(open('scan_majorant.py').read().split("rng=np.random.default_rng(123)")[0])
from scipy import integrate, special
GB=np.load('GB_table.npy')
def beta_tab(v): return integrate.quad(lambda s: np.exp(-s)*s*np.interp(v*s,vg,GB),0,60)[0]          # E_S[S g_B(vS)]
def beta_thr(v):  # the thread's formula
    if v<1e-12: return -integrate.quad(lambda t: np.exp(-t)*t/(2*np.sqrt(2)*rr(t)),0,80)[0]
    D=lambda R: np.sqrt(np.pi/v)*np.exp(-R*R/(2*v))*special.i1(R*R/(2*v)) if R*R/(2*v)<600 else np.sqrt(np.pi/v)/np.sqrt(2*np.pi*R*R/(2*v))
    return -integrate.quad(lambda t: t*np.exp(-t)*D(rr(t)),0,80,limit=400)[0]/(2*np.sqrt(2))
for v in [0,0.01,0.05,0.5,2,10]: print(f"v={v}: beta from my g_B table {beta_tab(v):+.5f}   thread formula {beta_thr(v):+.5f}")
def Bq(v): return integrate.quad(lambda s: np.exp(-s)*phi(v*s),0,50,limit=200,epsabs=1e-11,epsrel=1e-11)[0]
def Bp(v,h=0.008): vv=[Bq(v+k*h) for k in (-2,-1,1,2)]; return (vv[2]-vv[1])/(2*h)-(vv[3]-2*vv[2]+2*vv[1]-vv[0])/(12*h)
worst=0
for u in [0.00551,0.0075,0.01,0.02,0.0463]:
    Bu_,Bp_=Bq(u),Bp(u); bu=beta_thr(u); m=0; arg=None
    for v in np.concatenate([np.linspace(0.0005,0.2,80),np.linspace(0.2,5,120),np.linspace(5,60,40)]):
        if abs(v-u)<2e-3: continue
        d=Bu_+Bp_*(v-u)-Bq(v); r=v*(beta_thr(v)-bu)**2/d
        if r>m: m=r; arg=v
    worst=max(worst,m); print(f"u={u}: max_v v|beta(v)-beta(u)|^2/d_u(v) = {m:.4f} at v={arg:.3f}   (need <= 0.26)",flush=True)
print("WORST",worst)
