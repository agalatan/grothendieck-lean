# Cubic games T = P0 - eps P1 on the graded space (z grade 0, W grade 1): responses f = ph(a(|z|) + c2 W),
# W-average in closed form, 1D radial quadrature.  Best-response iteration.
import numpy as np
from scipy.special import i0e, i1e
from numpy.polynomial.legendre import leggauss
def Mf(r): x=r*r/2; return np.sqrt(np.pi)/2*r*(i0e(x)+i1e(x))
def Nf(r): x=r*r/2; return np.sqrt(np.pi)*i0e(x)
x,w=leggauss(16); edges=np.linspace(0,7.0,141)
R=np.concatenate([(a+b)/2+(b-a)/2*x for a,b in zip(edges[:-1],edges[1:])])
WR=np.concatenate([(b-a)/2*w for a,b in zip(edges[:-1],edges[1:])])*2*R*np.exp(-R*R)
S=R*R; e0=R; e1=R*(S-2)/np.sqrt(2)
def respond(c):
    a=c[0]*e0+c[1]*e1
    if abs(c[2])<1e-15:
        F=a/np.maximum(np.abs(a),1e-300); p2=0
    else:
        rho=np.abs(a)/abs(c[2]); F=np.where(np.abs(a)>0,a/np.maximum(np.abs(a),1e-300),0)*Mf(rho)
        p2=(c[2]/abs(c[2]))/2*(WR*Nf(rho)).sum()
    return np.array([(WR*F*e0).sum(),(WR*F*e1).sum(),p2])
def br(eps,init,iters=3000,tol=1e-14):
    q=np.array([1.0,-eps,-eps]); pg=respond(np.array(init,complex)); vold=-1
    for it in range(iters):
        pf=respond(q*pg); pg=respond(q*pf)
        v=np.real((q*pf*np.conj(pg)).sum())
        if abs(v-vold)<tol: break
        vold=v
    return v,q*pg,pf,pg,it
if __name__=='__main__':
    print('norms',(WR*e0*e0).sum(),(WR*e1*e1).sum(),(WR*e0*e1).sum())
    for eps in [0.70,0.72,0.745,0.7564,0.77,0.80]:
        best=max((br(eps,i) for i in ([1,-0.2,-0.3],[1,-0.4,-0.6],[1,0.1,-0.15],[1,-0.2,-0.3j])),key=lambda t:t[0])
        v,cf,pf,pg,it=best
        print('eps=%.4f v=%.9f 1/v=%.8f  f=ph(z*(..)+W): coeffs/c0=%s  iters=%d'%(eps,v,1/v,np.round(cf/cf[0],5),it))
