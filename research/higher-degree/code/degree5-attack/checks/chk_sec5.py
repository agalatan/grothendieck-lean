# amplitude-capped secant margin on a fine grid: m(s, tau) = min over |rho| = tau of (rho^T C rho - Rem)/tau^2
import sys; import os; sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import d5, numpy as np, json, math
from scipy.optimize import minimize
R='/Users/alingalatan/workspaces/grothe/research/higher-degree/code/degree5-content/'
recs={}
for t in ('0.70','0.78'):
    d=json.load(open(R+'profiles_low/band_row_%s.json'%t)); recs[d['row']['t']]=d['row']
p1=1/d5.E1; z,w=d5.zgrid(npan=100,nth=384)
taus=(0.02,0.05,0.1,0.2)
for tt,rec in sorted(recs.items()):
    sa,tb=0.4,0.3
    B=d5.base(z,rec['l'],rec['beta'],rec['nu5']); e11=d5.e11(z); e20=d5.e20(z)
    C=np.diag([p1-sa**2]*2+[p1-tb**2]*2); C[0,2]=C[2,0]=C[1,3]=C[3,1]=-sa*tb
    Bm=np.array([e11+sa,1j*(e11+sa),e20+tb,-1j*e20+1j*tb])
    def Rem(s,x):
        rA=x[0]+1j*x[1]; rB=x[2]+1j*x[3]
        Y=B+s*(1-rec['bA']*e11)-rec['bB']*s*e20; d=(e11+sa)*rA+e20*np.conj(rB)+tb*rB
        aY=np.abs(Y); return 2*((np.abs(Y+d)-aY-np.real(d*np.conj(Y/aY)))@w)
    def M(s):
        Mm=np.zeros((4,4)); Dz=1-rec['bA']*e11-rec['bB']*e20
        for A,sg in ((B+s*Dz,1.0),(B-s*Dz,-1.0)):
            a=np.abs(A); Im_=np.imag(sg*Bm*np.conj(A/a)[None,:]); Mm+=(Im_*(w/(2*a))[None,:])@Im_.T
        return (Mm+Mm.T)/2
    print('row tuned at %.2f'%tt,flush=True)
    for s in (0.0,0.2,0.4,0.6,0.8,1.0,1.3):
        ev,V=np.linalg.eigh(C-M(s)); line='  s=%.1f second-order min eig %.3f |'%(s,ev[0])
        for tau in taus:
            def f(v):
                x=v/np.linalg.norm(v)*tau; return (x@C@x-Rem(s,x))/(tau*tau)
            best=min(minimize(f,x0,method='Nelder-Mead',options={'xatol':2e-3,'fatol':2e-5,'maxiter':140}).fun for x0 in (V[:,0],np.array([0.74,0.02,0.67,0.02])))
            line+=' tau=%.2f: %.3f'%(tau,best)
        print(line,flush=True)
