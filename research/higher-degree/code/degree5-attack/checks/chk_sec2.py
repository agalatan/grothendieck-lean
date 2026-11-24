import sys; import os; sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import d5, numpy as np, json, math
from scipy.optimize import minimize
rows=[json.loads(l) for l in open('/Users/alingalatan/workspaces/grothe/research/higher-degree/code/degree5-content/rows5.lines') if l.strip()]
p1=1/d5.E1
def mk(npan,nth):
    z,w=d5.zgrid(npan=npan,nth=nth); return z,w
grids={'coarse':mk(44,192),'fine':mk(110,512)}
def tools(rec,sa,tb,g):
    z,w=grids[g]
    B=d5.base(z,rec['l'],rec['beta'],rec['nu5']); e11=d5.e11(z); e20=d5.e20(z)
    C=np.diag([p1-sa**2]*2+[p1-tb**2]*2); C[0,2]=C[2,0]=C[1,3]=C[3,1]=-sa*tb
    def Rem(s,x):
        rA=x[0]+1j*x[1]; rB=x[2]+1j*x[3]
        Y=B+s*(1-rec['bA']*e11)-rec['bB']*s*e20
        d=(e11+sa)*rA+e20*np.conj(rB)+tb*rB
        aY=np.abs(Y); return 2*((np.abs(Y+d)-aY-np.real(d*np.conj(Y/aY)))@w)
    def M(s):
        Bm=np.array([e11+sa,1j*(e11+sa),e20+tb,-1j*e20+1j*tb]); Mm=np.zeros((4,4)); Dz=1-rec['bA']*e11-rec['bB']*e20
        for A,sg in ((B+s*Dz,1.0),(B-s*Dz,-1.0)):
            a=np.abs(A); Im_=np.imag(sg*Bm*np.conj(A/a)[None,:]); Mm+=(Im_*(w/(2*a))[None,:])@Im_.T
        return (Mm+Mm.T)/2
    return Rem,M,C
for rec in rows:
    if rec['t'] not in (0.8,0.82,0.84,0.85): continue
    sa,tb=0.4,0.3
    Rem,M,C=tools(rec,sa,tb,'coarse'); RemF,MF,_=tools(rec,sa,tb,'fine')
    mu0=np.linalg.eigvalsh(C-MF(0.0))[0]
    print('t=%.3f: pointwise lam_min(C-M(s)) fine grid at s=0, .02, .05, .1, .2, .5, .9:'%rec['t'], ' '.join('%.4f'%np.linalg.eigvalsh(C-MF(s))[0] for s in (0,.02,.05,.1,.2,.5,.9)), flush=True)
    # maximise g(s,x) = (Rem - x^T C x)/|x|^2  (= -mu_sec)
    def neg(v):
        s=abs(v[0]); x=v[1:]; n2=x@x
        return -((Rem(s,x)-x@C@x)/n2)
    rng=np.random.default_rng(11); best=None
    for st in range(10):
        v0=np.concatenate([[rng.uniform(0.3,1.2)],rng.standard_normal(4)*0.3])
        r=minimize(neg,v0,method='Nelder-Mead',options={'xatol':1e-4,'fatol':1e-7,'maxiter':600})
        if best is None or r.fun<best.fun: best=r
    v=best.x; s=abs(v[0]); x=v[1:]
    gF=(RemF(s,x)-x@C@x)/(x@x)
    print('   sup over (s,rho) of (Rem - rho^T C rho)/|rho|^2: coarse %.4f, same point fine grid %.4f  => mu_sec <= %.4f (pointwise mu at s=0: %.4f); at s=%.3f, rhoA=%.3f%+.3fi, rhoB=%.3f%+.3fi, |rho|=%.3f'%(-best.fun,gF,-gF,mu0,s,x[0],x[1],x[2],x[3],np.linalg.norm(x)),flush=True)
    # along that direction: Rem(tau x)/tau^2 for a few tau
    xd=x/np.linalg.norm(x)
    print('   along the direction, (Rem - cost)/tau^2 at tau = .01,.05,.1,.2,.3,.5,.8,1.5:', ' '.join('%.4f'%((RemF(s,t*xd)-t*t*(xd@C@xd))/t**2) for t in (.01,.05,.1,.2,.3,.5,.8,1.5)),flush=True)
