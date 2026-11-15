exec(open('betacheck.py').read().split("worst=0")[0])
import numpy as np
def Bp2(v): 
    h=min(0.008,v/3); vv=[Bq(v+k*h) for k in (-2,-1,1,2)]; return (vv[2]-vv[1])/(2*h)-(vv[3]-2*vv[2]+2*vv[1]-vv[0])/(12*h)
for u in [0.00551,0.01,0.02,0.0463]:
    Bu_,Bp_=Bq(u),Bp2(u); bu=beta_thr(u); m=0; arg=None
    for v in np.concatenate([np.linspace(0.0005,0.2,60),np.linspace(0.2,5,100),np.linspace(5,60,30)]):
        if abs(v-u)<2e-3: continue
        d=Bu_+Bp_*(v-u)-Bq(v)
        if not d>0: continue
        r=v*(beta_thr(v)-bu)**2/d
        if r>m: m=r; arg=v
    print(f"u={u}: max_v v|beta(v)-beta(u)|^2/d_u(v) = {m:.4f} at v={arg}   (need <= 0.26; thread's sampled max 0.211 at smallest u)",flush=True)
