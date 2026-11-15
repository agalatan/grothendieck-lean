# Independent numerical evaluation of the thread's infinitesimal A/B Hessian kernels K_re(x), K_im(x) (peak row) and the
# signed matrix bound K <= eps^{-1} I - M0, M0 = [[0.24,0.118],[0.118,0.26]], over shifts x >= 0.
import numpy as np
a,b,eps=699/1250,179/1250,1891/2500
M0=np.array([[0.24,0.118],[0.118,0.26]]); target=np.eye(2)/eps-M0
# quadrature in t (Gauss-Laguerre, 400 nodes) and theta (midpoint, 4096 nodes; the integrand ~ 1/dist near V=0, integrable)
sG,wG=np.polynomial.legendre.leggauss(300); sG=3.25*(sG+1); wT=3.25*wG*2*sG*np.exp(-sG*sG); tT=sG*sG; th=(np.arange(4096)+0.5)*2*np.pi/4096
R=np.sqrt(tT)*(a+b*tT); A=tT-1; D=tT/np.sqrt(2)
def K(x):
    Kre=np.zeros((2,2)); Kim=np.zeros((2,2))
    for t,w,r,At,Dt in zip(tT,wT,R,A,D):
        V3=(r*r+x*x+2*r*x*np.cos(th))**1.5
        v=np.stack([-At*r*np.sin(th), Dt*(r*np.sin(th)+x*np.sin(2*th))]); u=np.stack([At*(r*np.cos(th)+x), -Dt*(r*np.cos(th)+x*np.cos(2*th))])
        Kre+=w*(v/V3)@v.T/len(th); Kim+=w*(u/V3)@u.T/len(th)
    return Kre,Kim
print("x    lam_max(K_re)  lam_max(K_im)   min eig(target-K_re)  min eig(target-K_im)   [K_re entries]")
for x in [0,0.02,0.05,0.1,0.15,0.2,0.3,0.4,0.5,0.6,0.8,1.0,1.5,2.0,3.0]:
    Kre,Kim=K(x)
    e1=np.linalg.eigvalsh(target-Kre).min(); e2=np.linalg.eigvalsh(target-Kim).min()
    print(f"{x:4.2f}  {np.linalg.eigvalsh(Kre).max():.4f}        {np.linalg.eigvalsh(Kim).max():.4f}         {e1:+.4f}               {e2:+.4f}        {np.round(Kre.ravel(),4)}",flush=True)
