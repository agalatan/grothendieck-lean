# Check of the pointwise sufficient condition (6) for the odd sectors over a nonzero even core H:
# largest eigenvalue of the form M(O) = E[|O|^2/|L+H|] on span{z(|X|^2-1), conj(z) X^2/sqrt2, z(T-2)/sqrt2} (orthonormal),
# compared with 1/eps = 1.3221; and the TRUE second-order cost of Lambda in the top eigendirection.
import numpy as np, sys, os
from scipy.stats import qmc, norm
from multiprocessing import Pool
eps,ell,beta=1891/2500,1057/1250,179/1250; S=1.3739535
LOG2N=int(sys.argv[1]) if len(sys.argv)>1 else 15; N=2**LOG2N
g=norm.ppf(qmc.Sobol(d=2,scramble=True,seed=11).random_base2(LOG2N))/np.sqrt(2); X=g[:,0]+1j*g[:,1]; R=abs(X)**2
sG,wG=np.polynomial.legendre.leggauss(160); sG=3.25*(sG+1); wG=3.25*wG*2*sG*np.exp(-sG*sG); tT=sG*sG; wT=wG/wG.sum()
NTH=160; th=(np.arange(NTH)+0.5)*2*np.pi/NTH; e1=np.exp(1j*th); e2=e1*e1; em=np.conj(e1)
O1=X*np.conj(X)-1; O2=X*X/np.sqrt(2)    # Q=|X|^2-1 (energy 1), P=X^2/sqrt2 (energy 1); d-sector z(T-2)/sqrt2 (energy 1)
def core(c,a,b):   # H = c X(|X|^2-2)/sqrt2 + a (T-1) X + b z^2 conj(X)/sqrt2  (each basis element energy 1)
    return c*X*(R-2)/np.sqrt(2), a*X, b*np.conj(X)
def _form(args):
    s,e,q,A,B=args; M=np.zeros((3,3),complex); Lam=np.zeros(2)
    for t,w in zip(tT,wT):
        st=np.sqrt(t); lt=st*(ell+beta*(t-2))
        for sign in (1,-1):
            Z=lt*e1[None,:]+sign*(q[s:e,None]+(t-1)*A[s:e,None]+e2[None,:]*t*B[s:e,None]/np.sqrt(2))    # L + sign*H
            inv=1/np.abs(Z)
            o=[sign*st*e1[None,:]*O1[s:e,None], sign*st*em[None,:]*O2[s:e,None], sign*st*(t-2)*e1[None,:]/np.sqrt(2)*np.ones((e-s,1))]
            for i in range(3):
                for j in range(i,3):
                    M[i,j]+=0.5*w*np.sum(o[i]*np.conj(o[j])*inv)/NTH
    for i in range(3):
        for j in range(i): M[i,j]=np.conj(M[j,i])
    return M
def form(q,A,B,pool):
    nb=12; b=np.linspace(0,N,nb+1).astype(int)
    return sum(pool.map(_form,[(b[i],b[i+1],q,A,B) for i in range(nb)]))/N
def _lam(args):
    s,e,q,A,B,coef,t0=args; acc=0.0
    for t,w in zip(tT,wT):
        st=np.sqrt(t); lt=st*(ell+beta*(t-2))
        O=st*(coef[0]*e1[None,:]*O1[s:e,None]+coef[1]*em[None,:]*O2[s:e,None]+coef[2]*(t-2)*e1[None,:]/np.sqrt(2))
        for sign in (1,-1):
            Z=lt*e1[None,:]+sign*(q[s:e,None]+(t-1)*A[s:e,None]+e2[None,:]*t*B[s:e,None]/np.sqrt(2)+t0*O)
            acc+=w*np.sum(np.abs(Z))/NTH
    return acc
def Lam(q,A,B,coef,t0,pool,E2):
    nb=12; b=np.linspace(0,N,nb+1).astype(int)
    return sum(pool.map(_lam,[(b[i],b[i+1],q,A,B,coef,t0) for i in range(nb)]))/N - E2/eps
if __name__=="__main__":
    pool=Pool(int(os.environ.get('NPROC','6')))
    print("N=",N,"1/eps=",1/eps)
    for (c,a,b) in [(0,0,0),(0.05,0,0),(0.1,0,0),(0.2,0,0),(0,0.1,0),(0,0,0.1),(0.1,0.1,0),(0.1,0.05,0.05),(0.2,0.1,0.1)]:
        q,A,B=core(c,a,b); M=form(q,A,B,pool); ev,vec=np.linalg.eigh(M); lam=ev[-1]; v=vec[:,-1]
        E2=c*c+a*a+b*b
        # true second-order cost along v: Lambda(H+tO)-Lambda(H) ~ -kappa t^2 (first order vanishes by parity)
        L0=Lam(q,A,B,v,0.0,pool,E2); t0=0.05; L1=Lam(q,A,B,v,t0,pool,E2+t0*t0); L2=Lam(q,A,B,v,2*t0,pool,E2+4*t0*t0)
        print(f"core (c,a,b)=({c},{a},{b}) |H|^2={E2:.4f}: lambda_max(form)={lam:.4f} (pointwise majorant needs < 1.3221; implied kappa_E = {1/eps-lam:+.4f}) | top O = {np.round(np.abs(v),3)} | true Lambda(H+tO)-Lambda(H): t=0.05: {L1-L0:+.3e}, t=0.1: {L2-L0:+.3e}  => curvature kappa ~ {-(L1-L0)/t0**2:+.3f}, {-(L2-L0)/(4*t0**2):+.3f}",flush=True)
