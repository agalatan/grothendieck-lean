"""Survey of all of H_{2,1}(C^2): largest  delta*Omega_e / D  (projected bound of Theorem 4 over the deficit)
and largest C^2/D, at u = 0.0055, 0.02, 0.0463, by random starts + Nelder-Mead.  Label N: a search gives LOWER
bounds on suprema.  Saves the maximisers to ../results/survey_<mode>.json; re-check them with fine_eval.py.
Usage: python3 survey.py raw|tilt [nl nt]
"""
import sys, json, numpy as np
from scipy.optimize import minimize
from twovar import Grid, analyse, kprime_table, H
from core import B
mode=sys.argv[1]; nl,nt=(int(sys.argv[2]),int(sys.argv[3])) if len(sys.argv)>3 else (28,24)
gr=Grid(nl,nt); h=H[mode]; rng=np.random.default_rng(2024); res={}
vec=lambda x: x[:6]+1j*x[6:]
for u in [0.0055,0.02,0.0463]:
    kp=kprime_table(h,u); Bu=B(u)
    def ev(x):
        r=analyse(gr,vec(x),u,h,kp,False)
        from core import phi
        q=gr.cubic(vec(x),u)[0]; D=Bu-gr.E(phi(abs(q)**2)).real
        return r["Omega"]*r["delta"]/D, r["C2"]/D, r["chi"]
    best=None
    for s in range(40):
        x=rng.standard_normal(12)*np.exp(rng.standard_normal(12)); v=ev(x)
        if best is None or v[0]>best[0]: best=(v[0],x)
    o1=minimize(lambda x:-ev(x)[0],best[1],method="Nelder-Mead",options={"maxiter":600})
    x0=np.array([1,(0.0528+0.2212j)/np.sqrt(2),0,0,0,0]); o2=minimize(lambda x:-ev(x)[1],np.concatenate([x0.real,x0.imag]),method="Nelder-Mead",options={"maxiter":400})
    P1=ev(o1.x); P2=ev(o2.x)
    res[str(u)]=dict(max_projbound_over_D=P1[0],chi_there=P1[2],C2_over_D_there=P1[1],argmax_re=vec(o1.x).real.tolist(),argmax_im=vec(o1.x).imag.tolist(),
                     max_C2_over_D=P2[1],projbound_over_D_at_that_tensor=P2[0])
    print(mode,u,{k:v for k,v in res[str(u)].items() if "arg" not in k},flush=True)
json.dump(dict(mode=mode,nl=nl,nt=nt,results=res),open(f"../results/survey_{mode}.json","w"),indent=1)
