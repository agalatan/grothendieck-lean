# Check: Psi_nu(A,B) = max_{|u|=|v|=1} Re(conj(u)A)+Re(conj(v)B)+nu Re(u conj(v))  equals  (1/2) min{tr D : D diagonal, D - M >= 0}
import numpy as np
from scipy.optimize import minimize
rng=np.random.default_rng(0); worst=0
def primal(A,B,nu,n=4000):
    b=np.linspace(0,2*np.pi,n,endpoint=False); v=np.exp(1j*b)
    val=np.abs(A+nu*v)+np.real(np.conj(v)*B)          # maximise over u exactly
    i=np.argmax(val)
    f=lambda t: -(abs(A+nu*np.exp(1j*t[0]))+np.real(np.exp(-1j*t[0])*B))
    r=minimize(f,[b[i]],method='Nelder-Mead',options=dict(xatol=1e-12,fatol=1e-14)); return -r.fun
def dual(A,B,nu):
    # feasibility-preserving scheme: for a direction d>0, scale so that lambda_min(D-M)=0 exactly, then minimise the trace over directions
    M=np.array([[0,np.conj(A),np.conj(B)],[A,0,nu],[B,nu,0]])
    def scaled(t):
        d=np.exp(t-t.max()); lo,hi=0.0,1.0
        while np.linalg.eigvalsh(hi*np.diag(d)-M)[0]<0: hi*=2
        for _ in range(80):
            mid=(lo+hi)/2
            if np.linalg.eigvalsh(mid*np.diag(d)-M)[0]<0: lo=mid
            else: hi=mid
        return hi*d.sum()/2
    best=1e9
    for s_ in range(8):
        r=minimize(scaled,rng.normal(size=3),method='Nelder-Mead',options=dict(xatol=1e-12,fatol=1e-15,maxiter=6000,maxfev=6000))
        best=min(best,r.fun)
    return best
for trial in range(40):
    A,B=(rng.normal(size=2)+1j*rng.normal(size=2))*rng.choice([0.05,0.5,1.5]); nu=rng.choice([-0.3,-0.05,0.02,0.1,0.5])
    p,d=primal(A,B,nu),dual(A,B,nu); worst=max(worst,abs(p-d))
    if trial<6: print('A=%.3f%+.3fi B=%.3f%+.3fi nu=%+.2f  primal %.9f  dual %.9f'%(A.real,A.imag,B.real,B.imag,nu,p,d))
print('largest |primal - dual| over 40 random cases: %.2e'%worst)
