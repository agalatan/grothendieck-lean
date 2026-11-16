# Heuristic primal (best-response) evaluation of complex charge-one Hermite games
#   T = P0 - eps*P1 + gam*P2   on the graded asymptotic space with variables
#   z (grade 0, bidegree (1,0)), W (grade 1, (2,1)), V (grade 2, (3,2)); all standard complex Gaussians.
# Basis (orthonormal): P0: e0=z ; P1: e1=z(|z|^2-2)/sqrt2, e2=W ;
#   P2: e3=z(|z|^4-6|z|^2+6)/(2sqrt3), e4=W(|z|^2-1), e5=z^2 conj(W)/sqrt2, e6=V.
# Responses f=ph(X + c6 V), X=sum_{e<6} c_e e ; V integrated analytically; z fixed real (charge-one reduction).
import numpy as np, sys
from scipy.special import i0e, i1e
from numpy.polynomial.legendre import leggauss
def Mf(r): x=r*r/2; return np.sqrt(np.pi)/2*r*(i0e(x)+i1e(x))
def Nf(r): x=r*r/2; return np.sqrt(np.pi)*i0e(x)
def panels(L, npan, nq):
    x,w=leggauss(nq); edges=np.linspace(0,L,npan+1); X=[];Wt=[]
    for a,b in zip(edges[:-1],edges[1:]):
        X.append((a+b)/2+(b-a)/2*x); Wt.append((b-a)/2*w)
    return np.concatenate(X), np.concatenate(Wt)
class Grid:
    def __init__(s, npr=24, nqr=8, npw=24, nqw=6, na=64, L=6.5):
        r,wr=panels(L,npr,nqr); rho,wrho=panels(L,npw,nqw)
        wr=wr*2*r*np.exp(-r*r); wrho=wrho*2*rho*np.exp(-rho*rho)
        al=2*np.pi*np.arange(na)/na; wa=np.full(na,1.0/na)
        R,RH,AL=np.meshgrid(r,rho,al,indexing='ij')
        s.w=(wr[:,None,None]*wrho[None,:,None]*wa[None,None,:])
        S=R*R; Wv=RH*np.exp(1j*AL)
        s.E=[R+0j, R*(S-2)/np.sqrt(2)+0j, Wv, R*(S*S-6*S+6)/(2*np.sqrt(3))+0j, Wv*(S-1), S*np.conj(Wv)/np.sqrt(2)]
        s.deg=[0,1,1,2,2,2,2]   # degree index k of e0..e6
        s.norms=[(s.w*np.abs(e)**2).sum() for e in s.E]
def respond(G, c):
    """f = ph(X + c6 V); returns vector of <f,e_k>, k=0..6"""
    X=sum(c[i]*G.E[i] for i in range(6))
    out=np.zeros(7,complex)
    if abs(c[6])<1e-14:
        F=X/np.maximum(np.abs(X),1e-300)
        for i in range(6): out[i]=(G.w*F*np.conj(G.E[i])).sum()
        out[6]=0.0
    else:
        a=np.abs(X); rho=a/abs(c[6]); F=np.where(a>0, X/np.maximum(a,1e-300),0)*Mf(rho)
        for i in range(6): out[i]=(G.w*F*np.conj(G.E[i])).sum()
        out[6]=(c[6]/abs(c[6]))/2*(G.w*Nf(rho)).sum()
    return out
def value(q, pf, pg):
    # Re <f, T g> = Re sum_e q_k(e) <f,e> conj(<g,e>)
    return float(np.real(sum(q[k]*pf[i]*np.conj(pg[i]) for i,k in enumerate([0,1,1,2,2,2,2]))))
def best_response(G, eps, gam, c_init, iters=200, tol=1e-12, verbose=False):
    q={0:1.0,1:-eps,2:gam}
    kk=[0,1,1,2,2,2,2]
    cg=np.array(c_init,complex)
    pg=respond(G,cg); v_old=-1
    for it in range(iters):
        cf=np.array([q[kk[i]]*pg[i] for i in range(7)])   # Tg coefficients
        pf=respond(G,cf)
        cg=np.array([q[kk[i]]*pf[i] for i in range(7)])   # Tf coefficients
        pg=respond(G,cg)
        v=value([q[0],q[1],q[2]],pf,pg)
        if verbose and it%10==0: print(it,v)
        if abs(v-v_old)<tol: break
        v_old=v
    return v, cf, cg, pf, pg
if __name__=='__main__':
    G=Grid()
    print('norm check', np.round(G.norms,6))
