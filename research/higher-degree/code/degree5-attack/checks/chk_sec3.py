import sys; import os; sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import d5, numpy as np, json, math
from scipy.optimize import minimize
R='/Users/alingalatan/workspaces/grothe/research/higher-degree/code/degree5-content/'
recs={}
for t in ('0.70','0.74','0.76','0.78'):
    d=json.load(open(R+'profiles_low/band_row_%s.json'%t)); recs[d['row']['t']]=(d['row'],d['mu'])
p1=1/d5.E1; z,w=d5.zgrid(npan=60,nth=256)
for tt,(rec,mu_file) in sorted(recs.items()):
    sa,tb=0.4,0.3
    B=d5.base(z,rec['l'],rec['beta'],rec['nu5']); e11=d5.e11(z); e20=d5.e20(z)
    C=np.diag([p1-sa**2]*2+[p1-tb**2]*2); C[0,2]=C[2,0]=C[1,3]=C[3,1]=-sa*tb
    def Rem(s,x):
        rA=x[0]+1j*x[1]; rB=x[2]+1j*x[3]
        Y=B+s*(1-rec['bA']*e11)-rec['bB']*s*e20; d=(e11+sa)*rA+e20*np.conj(rB)+tb*rB
        aY=np.abs(Y); return 2*((np.abs(Y+d)-aY-np.real(d*np.conj(Y/aY)))@w)
    def M(s):
        Bm=np.array([e11+sa,1j*(e11+sa),e20+tb,-1j*e20+1j*tb]); Mm=np.zeros((4,4)); Dz=1-rec['bA']*e11-rec['bB']*e20
        for A,sg in ((B+s*Dz,1.0),(B-s*Dz,-1.0)):
            a=np.abs(A); Im_=np.imag(sg*Bm*np.conj(A/a)[None,:]); Mm+=(Im_*(w/(2*a))[None,:])@Im_.T
        return (Mm+Mm.T)/2
    mu0=np.linalg.eigvalsh(C-M(0.0))[0]
    out=[]
    rng=np.random.default_rng(3)
    for s in (0.0,0.2,0.4,0.6,0.75,0.9,1.2,1.6):
        best=9
        for st in range(4):
            x0=np.array([0.3,0,0.27,0])*(1+0.3*rng.standard_normal(4)) if st<2 else rng.standard_normal(4)*0.3
            r=minimize(lambda x:-(Rem(s,x)-x@C@x)/(x@x),x0,method='Nelder-Mead',options={'xatol':1e-4,'fatol':1e-7,'maxiter':400})
            best=min(best,-(-r.fun))
        out.append((s,best,np.linalg.eigvalsh(C-M(s))[0]))
    print('row tuned at %.2f (file mu %.3f): pointwise mu(0)=%.4f; s: inf_rho (rho^T C rho - Rem)/|rho|^2 [pointwise second-order value]:'%(tt,mu_file,mu0),'; '.join('%.2f: %.3f [%.3f]'%o for o in out),' => global mu_sec <= %.3f, ratio to pointwise %.2f'%(min(o[1] for o in out),min(o[1] for o in out)/mu0),flush=True)
