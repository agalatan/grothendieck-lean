# claude-b9ee, 14 Nov 2026.  Model norms of games  lambda = (1, l1, ..., lD, nu, nu, ...)  (finite head + identity tail)
# in the two-variable graded model (z grade 1, w grade 3), charge-one responses on a (T=|z|^2, |w|^2, arg) grid.
import numpy as np, sys, time
from scipy.optimize import minimize
class Model:
    def __init__(s, nT=96, nR=48, nA=48):
        def radial(n, rmax=7.0, npan=None):   # composite Gauss-Legendre in r for the weight 2 r exp(-r^2) on [0, rmax]
            g=16; npan=max(1,n//g) if npan is None else npan
            xg,wg=np.polynomial.legendre.leggauss(g); edges=np.linspace(0,1,npan+1)**1.5*rmax
            x=np.concatenate([(a+b)/2+(b-a)/2*xg for a,b in zip(edges[:-1],edges[1:])])
            wq=np.concatenate([(b-a)/2*wg for a,b in zip(edges[:-1],edges[1:])])
            return x, wq*2*x*np.exp(-x*x)
        rr,wT=radial(nT); rh,wS=radial(nR)
        ang=(np.arange(nA)+0.5)*2*np.pi/nA
        r=rr[:,None,None]; T=r*r; rho=rh[None,:,None]; ph=ang[None,None,:]
        s.W=(wT[:,None,None]*wS[None,:,None]*np.ones((1,1,nA))/nA)
        w=(rho*np.exp(1j*ph))+0*r; s.w=w; s.r=r+0*w.real; S=np.abs(w)**2
        one=1+0*w
        s.B=[[r*one],
             [r*(T-2)/np.sqrt(2)*one, w],
             [r*(T*T-6*T+6)/(2*np.sqrt(3))*one, (T-1)*w, T*np.conj(w)/np.sqrt(2)],
             # level 3 = bidegree (4,3): psi3(z); L2(T) w; z^2 conj(w) (T-3)/sqrt(6); z (|w|^2-1); conj(z) w^2/sqrt2
             [r*(T**3-12*T**2+36*T-24)/(6*2.0)*one, (T*T-4*T+2)/2*w, T*(T-3)/np.sqrt(6)*np.conj(w), r*(S-1), r*w*w/np.sqrt(2)]]
        s.Bf=[np.array([e.ravel() for e in b]) for b in s.B]; s.Wf=s.W.ravel()
        s.warm={}
    def proj(s,k,v):   # coefficients of v on level k
        return (s.Bf[k].conj()*s.Wf)@v
    def apply(s, lam, nu, v):
        out=nu*v
        for k in range(len(lam)):
            c=s.proj(k,v); out=out+(lam[k]-nu)*(c@s.Bf[k])
        return out
    def value(s, lam, nu, u, v):
        return float(np.real(np.vdot(u*s.Wf, s.apply(lam,nu,v))))
    ncall=0
    def iterate(s, lam, nu, u, v, iters=500, tol=2e-12, visible=False):
        val=None; sh=s.r.shape
        for it in range(iters):
            mu_=s.apply(lam,nu,v)
            if visible: mu_=np.repeat((mu_.reshape(sh)*s.W).sum(axis=(1,2))/s.W.sum(axis=(1,2)), sh[1]*sh[2])
            u=np.exp(1j*np.angle(mu_))
            mv=s.apply(lam,nu,u)
            if visible: mv=np.repeat((mv.reshape(sh)*s.W).sum(axis=(1,2))/s.W.sum(axis=(1,2)), sh[1]*sh[2])
            v=np.exp(1j*np.angle(mv))
            new=s.value(lam,nu,u,v)
            if val is not None and abs(new-val)<tol: break
            val=new
        return val,u,v
    def best(s, lam, nu, starts=(0.25,0.5), warm=True, quiet=False):
        res=[]; r=s.r.ravel(); w=s.w.ravel(); T=r*r
        # visible-only branches (functions of |z| only): plain phase, radial sign flips, chirp pairs
        vis=[(np.ones_like(w),np.ones_like(w)), (np.sign(2.5-T)+0j,np.sign(2.5-T)+0j), (np.exp(0.3j*T),np.exp(-0.3j*T)), (np.exp(1j*T),np.exp(-1j*T))]
        for i,(u,v) in enumerate(vis):
            val,u,v=s.iterate(lam,nu,u,v,visible=True); res.append((val,'vis%d'%i,u,v))
        for st in starts:
            u=np.exp(1j*np.angle(r+st*w)); v=np.exp(1j*np.angle(r-st*w))
            val,u,v=s.iterate(lam,nu,u,v); res.append((val,'kr%.2f'%st,u,v))
        if warm and 'w' in s.warm:
            val,u,v=s.iterate(lam,nu,*s.warm['w']); res.append((val,'warm',u,v))
        res.sort(key=lambda t:-t[0]); Model.ncall+=1
        nonvis=[t for t in res if not t[1].startswith('vis')]
        s.warm['w']=(nonvis[0][2],nonvis[0][3])
        if not quiet and Model.ncall%5==0: print('   eval %d'%Model.ncall, np.round(lam,5), 'tail %.5f'%nu, 'N=%.7f'%res[0][0], [(st,round(v,7)) for v,st,_,_ in res], flush=True)
        return res
    def coeffs(s,u,v):
        c=[float(np.real(np.vdot(s.proj(k,v),s.proj(k,u)))) for k in range(len(s.Bf))]
        fg=float(np.real(np.vdot(v*s.Wf,u)))
        return c,fg
def report(M,lam,nu,tag=''):
    res=M.best(lam,nu,warm=False,quiet=True)
    print(tag,'game',np.round(lam,5),'tail %.5f'%nu,' N=%.7f  1/N=%.6f'%(res[0][0],1/res[0][0]),flush=True)
    for val,st,u,v in res:
        c,fg=M.coeffs(u,v)
        print('    start %s  value %.7f  c0..c3='%(st,val),np.round(c,5),' <f,g>=%.5f  tail(k>=2)=%.5f tail(k>=3)=%.5f'%(fg,fg-c[0]-c[1],fg-c[0]-c[1]-c[2]),flush=True)
if __name__=="__main__":
    mode=sys.argv[1]; M=Model(*(int(a) for a in sys.argv[2:5])) if len(sys.argv)>=5 else Model()
    t0=time.time()
    if mode=='sanity':
        report(M,(1,-0.7564),0.0,'[cubic]'); report(M,(1,-0.8494,0.283),0.0,'[quintic]')
    if mode=='two':
        f=lambda x: M.best((1,-x[0]),x[1])[0][0]
        r=minimize(f,[0.760,0.019],method='Nelder-Mead',options=dict(xatol=1e-5,fatol=1e-10,maxiter=300,initial_simplex=[[0.760,0.019],[0.775,0.019],[0.760,0.035]]))
        print('RESULT two: eps=%.5f mu=%.5f N=%.7f 1/N=%.6f  (%.0fs)'%(r.x[0],r.x[1],r.fun,1/r.fun,time.time()-t0),flush=True)
        report(M,(1,-r.x[0]),r.x[1],'[two-opt]')
    if mode=='three':
        f=lambda x: M.best((1,-x[0],x[1]),x[2])[0][0]
        r=minimize(f,[0.85,0.28,0.0],method='Nelder-Mead',options=dict(xatol=1e-5,fatol=1e-10,maxiter=500,initial_simplex=[[0.85,0.28,0.0],[0.87,0.28,0.0],[0.85,0.31,0.0],[0.85,0.28,0.03]]))
        print('RESULT three: eps=%.5f eta=%.5f nu=%.5f N=%.7f 1/N=%.6f  (%.0fs)'%(r.x[0],r.x[1],r.x[2],r.fun,1/r.fun,time.time()-t0),flush=True)
        report(M,(1,-r.x[0],r.x[1]),r.x[2],'[three-opt]')
    if mode=='four':
        f=lambda x: M.best((1,-x[0],x[1],x[2]),x[3])[0][0]
        x0=[0.9,0.6,-0.3,0.0]
        r=minimize(f,x0,method='Nelder-Mead',options=dict(xatol=1e-5,fatol=1e-10,maxiter=900,initial_simplex=[x0]+[[x0[i]+(0.03 if i==j else 0) for i in range(4)] for j in range(4)]))
        print('RESULT four: l1=%.5f l2=%.5f l3=%.5f nu=%.5f N=%.7f 1/N=%.6f  (%.0fs)'%(-r.x[0],r.x[1],r.x[2],r.x[3],r.fun,1/r.fun,time.time()-t0),flush=True)
        report(M,(1,-r.x[0],r.x[1],r.x[2]),r.x[3],'[four-opt]')
    if mode=='htriv':   # h-trivial family: (1,-eps,eta,mu,mu,...) with eta<=mu : parametrise eta = mu - a^2
        f=lambda x: M.best((1,-x[0],x[1]-x[2]**2),x[1])[0][0]
        r=minimize(f,[0.76,0.02,0.05],method='Nelder-Mead',options=dict(xatol=1e-5,fatol=1e-10,maxiter=500,initial_simplex=[[0.76,0.02,0.05],[0.78,0.02,0.05],[0.76,0.04,0.05],[0.76,0.02,0.15]]))
        print('RESULT htriv: eps=%.5f mu=%.5f eta=%.5f N=%.7f 1/N=%.6f  (%.0fs)'%(r.x[0],r.x[1],r.x[1]-r.x[2]**2,r.fun,1/r.fun,time.time()-t0),flush=True)
        report(M,(1,-r.x[0],r.x[1]-r.x[2]**2),r.x[1],'[htriv-opt]')
