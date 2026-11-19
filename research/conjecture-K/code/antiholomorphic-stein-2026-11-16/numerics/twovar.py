"""Two remote variables (all of H_{2,1}(C^2)) at the peak row, by tensor quadrature.  Label N.

q = c0 H(X) + c1 X(|Y|^2-1) + c2 conj(X)Y^2/sqrt2 + c3 (|X|^2-1)Y + c4 H(Y) + c5 X^2 conj(Y)/sqrt2,
H(z) = z(|z|^2-2)/sqrt2, normalised to E|q|^2 = u.  Quadrature: Gauss-Laguerre (nl nodes) in |X|^2, |Y|^2,
equispaced (nt nodes) in both phases.  For a profile h it computes the true content vector, the content
recomputed by Theorem 3, the four projected inner products of Theorem 4 and their norms, Omega_e,
delta and its decomposition (Theorem 2(d)), and the deficit D directly and by Theorem 5.
"""
import numpy as np, math
from scipy import integrate
from scipy.interpolate import CubicSpline
from scipy.special import eval_genlaguerre
from core import gv,jv,g0,j0,phi,B
S2=np.sqrt(2)
H={"raw":gv,"tilt":lambda v:(gv(v)-g0)-0.6*(j0-jv(v))}
def wick1(m,n,z):
    r=np.abs(z)**2
    if m>=n: return (-1)**n*math.factorial(n)*z**(m-n)*eval_genlaguerre(n,m-n,r)
    return (-1)**m*math.factorial(m)*np.conj(z)**(n-m)*eval_genlaguerre(m,n-m,r)
def kprime_table(h,u,vmax=3000.0):
    s=np.concatenate([np.linspace(0,1,400,endpoint=False),np.linspace(1,np.sqrt(vmax),800)]); v=s*s
    k=np.array([integrate.quad(lambda t: h(x+u*t)*np.exp(-t),0,80,limit=400,epsabs=1e-15)[0] for x in v])
    cs=CubicSpline(s,(k-h(v))/u)
    return lambda w: cs(np.sqrt(np.minimum(w,vmax)))*(w<=vmax)
def phi_transform_table(u,vmax=3000.0):
    """K(v)=E phi(v+u tau); returns B(u), K', gamma' with gamma=(B-K)/v."""
    s=np.concatenate([np.linspace(0,1,400,endpoint=False),np.linspace(1,np.sqrt(vmax),800)]); v=s*s
    K=np.array([integrate.quad(lambda t: phi(x+u*t)*np.exp(-t),0,80,limit=400,epsabs=1e-14)[0] for x in v])
    Bu=B(u); Kp=(K-phi(v))/u
    gam=np.where(v>0,(Bu-K)/np.where(v>0,v,1),-Kp[0]); csg=CubicSpline(s,gam); csK=CubicSpline(s,Kp)
    return Bu,(lambda w: csK(np.sqrt(np.minimum(w,vmax)))),(lambda w: csg(np.sqrt(np.maximum(w,1e-300)),1)/(2*np.sqrt(np.maximum(w,1e-300))))
class Grid:
    def __init__(s,nl=40,nt=32):
        xl,wl=np.polynomial.laguerre.laggauss(nl); th=np.arange(nt)*2*np.pi/nt
        R1,T1,R2,T2=np.meshgrid(xl,th,xl,th,indexing="ij")
        s.W=(wl[:,None,None,None]*np.ones(nt)[None,:,None,None]/nt*wl[None,None,:,None]*np.ones(nt)[None,None,None,:]/nt).ravel()
        s.X=(np.sqrt(R1)*np.exp(1j*T1)).ravel(); s.Y=(np.sqrt(R2)*np.exp(1j*T2)).ravel()
        s.bas={}
        for p,q in [(2,0),(3,1),(1,1),(2,2)]:
            L=[]
            for a1 in range(p+1):
                for b1 in range(q+1):
                    a2,b2=p-a1,q-b1
                    L.append(np.conj(wick1(a1,b1,s.X)*wick1(a2,b2,s.Y))*s.W/math.sqrt(math.factorial(a1)*math.factorial(b1)*math.factorial(a2)*math.factorial(b2)))
            s.bas[(p,q)]=np.array(L)
    def E(s,F): return np.sum(s.W*F)
    def proj(s,F,pq): return s.bas[pq]@F
    def cubic(s,c,u):
        X,Y=s.X,s.Y; c=np.asarray(c,dtype=complex)
        q=c[0]*X*(abs(X)**2-2)/S2+c[1]*X*(abs(Y)**2-1)+c[2]*np.conj(X)*Y**2/S2+c[3]*(abs(X)**2-1)*Y+c[4]*Y*(abs(Y)**2-2)/S2+c[5]*X**2*np.conj(Y)/S2
        dX=c[0]*(2*abs(X)**2-2)/S2+c[1]*(abs(Y)**2-1)+c[3]*np.conj(X)*Y+c[5]*2*X*np.conj(Y)/S2
        dXb=c[0]*X**2/S2+c[2]*Y**2/S2+c[3]*X*Y
        dY=c[1]*X*np.conj(Y)+c[2]*np.conj(X)*2*Y/S2+c[3]*(abs(X)**2-1)+c[4]*(2*abs(Y)**2-2)/S2
        dYb=c[1]*X*Y+c[4]*Y**2/S2+c[5]*X**2/S2
        sc=np.sqrt(u/s.E(abs(q)**2).real)
        return [t*sc for t in (q,dX,dXb,dY,dYb)]
def analyse(gr,c,u,h,kp,full=True,phitab=None):
    q,dX,dXb,dY,dYb=gr.cubic(c,u); X,Y=gr.X,gr.Y
    V=abs(q)**2; dl=gr.E(V*V).real-2*u*u
    a=dX*dXb+dY*dYb; x=abs(dXb)**2+abs(dYb)**2-u
    hv=h(V); cv=np.array([gr.E(np.conj(X)*q*hv),gr.E(np.conj(Y)*q*hv)]); C=np.linalg.norm(cv)
    e=cv/C; ye=e[0]*X+e[1]*Y
    K=kp(V)
    out=dict(chi=dl/u**2,delta=dl,C2=C**2)
    G=ye*q*np.conj(K); Gp=ye*np.conj(q)*np.conj(K)
    pG={k:gr.proj(F,k) for F,k in [(G,(2,0)),(G,(3,1)),(Gp,(1,1)),(Gp,(2,2))]}
    Om=np.sum(abs(pG[(2,0)])**2)+0.25*np.sum(abs(pG[(3,1)])**2)+0.5*np.sum(abs(pG[(1,1)])**2)+0.5*np.sum(abs(pG[(2,2)])**2)
    out["Omega"]=Om
    out["Dir"]=gr.E(abs(ye)**2*V*abs(K)**2).real*1.5
    if full:
        thm3=gr.E(np.conj(ye)*K*(np.conj(q)*a+q*x)); out["thm3_err"]=abs(abs(thm3)-C)/C
        Q=q*q; q20=np.sum(abs(gr.proj(Q,(2,0)))**2); q31=np.sum(abs(gr.proj(Q,(3,1)))**2); nx=gr.E(x*x).real
        out["delta_identity_err"]=abs(dl-(q20+q31+2*nx))/dl
        out["budget"]=(gr.E(abs(a)**2).real+2*nx)/dl
        pf={(2,0):gr.proj(a,(2,0)),(3,1):gr.proj(a,(3,1)),(1,1):gr.proj(x,(1,1)),(2,2):gr.proj(x,(2,2))}
        ips={k:np.vdot(pG[k],pf[k]) for k in pG}
        out["sum_ips_err"]=abs(abs(sum(ips.values()))-C)/C
        out["cosines"]={str(k):abs(ips[k])/(np.linalg.norm(pG[k])*np.linalg.norm(pf[k])) for k in pG}
    if phitab is not None:
        Bu,Kp,gp=phitab
        out["D"]=Bu-gr.E(phi(V)).real
        out["D_thm5"]=(-gr.E(x*Kp(V))+gr.E(np.conj(q)**2*a*gp(V))).real
    return out
FAMILIES={"monomial H(X)":[1,0,0,0,0,0],
          "best two-variable tensor X[(|X|^2-2)+z(|Y|^2-1)] (6.4.2)":[1,(0.05283531218+0.22122669064j)/S2,0,0,0,0],
          "X(|Y|^2-1)":[0,1,0,0,0,0],
          "mixed":[1,0.3j,0.2,0.1-0.2j,0,0.1],
          "H(X)+H(Y)":[1,0,0,0,1,0]}
if __name__=="__main__":
    import sys
    nl,nt=(int(sys.argv[1]),int(sys.argv[2])) if len(sys.argv)>2 else (40,32)
    gr=Grid(nl,nt); u=0.0463
    pt=phi_transform_table(u)
    for lab in ["raw","tilt"]:
        kp=kprime_table(H[lab],u)
        for name,c in FAMILIES.items():
            r=analyse(gr,c,u,H[lab],kp,True,pt)
            dl=r["delta"];D=r["D"]
            print(f"{lab:4s} | {name}: chi={r['chi']:.3f} C^2/D={r['C2']/D:.4f} projbound/D={r['Omega']*dl/D:.4f} (loss x{r['Omega']*dl/r['C2']:.2f}) unproj/D={r['Dir']*dl/D:.4f} (x{r['Dir']*dl/r['C2']:.2f})")
            print(f"       checks: Thm3 rel.err {r['thm3_err']:.1e}; delta identity rel.err {r['delta_identity_err']:.1e}; sum of projected inner products rel.err {r['sum_ips_err']:.1e}; D direct {D:.6e} vs Thm5 {r['D_thm5']:.6e}; (|a|^2+2|c2-u|^2)/delta={r['budget']:.4f}; cosines {', '.join(f'{k}:{v:.2f}' for k,v in r['cosines'].items())}")
