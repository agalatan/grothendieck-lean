import numpy as np, sys
from psi_float import Psi, load_row
class Maj:
    def __init__(s, P): s.P=P; Bv=P.B; s.G=np.real(Bv[:,None,:]*np.conj(Bv)[None,:,:]); s.u=np.real(Bv*np.conj(P.L)[None,:]); s.l=np.abs(P.L)
    def build(s, p0, R=None):
        P=s.P; L=P.L; A0=np.abs(L+p0); B0=np.abs(L-p0); R=s.l if R is None else R
        S=A0+B0; d0=A0-B0; D=S*(S*S+4*R*R+4*R*np.abs(d0)); nu=(1/A0+1/B0)/2; dnu=(1/A0-1/B0)/2; g=8/D; x0=(A0**2-B0**2)/4
        w=P.w
        H=np.einsum('ijk,k->ij',s.G,w*nu)-np.einsum('ik,jk,k->ij',s.u,s.u,w*g)
        h=s.u@(w*(dnu+g*x0)); C=w@(S/2+nu*s.l**2-g*x0**2)
        return C,h,H
    def quad(s, C,h,H, sv):
        Q=s.P.Q; a=s.P.a; D=Q-H; v=h+sv*H@a
        ev=np.linalg.eigvalsh(D)
        val=C+2*sv*h@a+sv*sv*a@H@a+v@np.linalg.solve(D,v)
        return val, ev
if __name__=="__main__":
    t=sys.argv[1]; R,th,eps=load_row(t); P=Psi(th,eps,nr=300,nt=128); M=Maj(P)
    for sv in [0.1,0.2,0.25,0.3,0.35,0.4,0.45]:
        psi,m=P.psi(sv); p0=(m+sv*P.a)@P.B
        C,h,H=M.build(p0); val,ev=M.quad(C,h,H,sv)
        # majorant at m itself
        y=m+sv*P.a; mj=C+2*h@y+y@H@y-m@P.Q@m
        print(f"s={sv}: Psi={psi:.8f}  Maj(m*)-Psi={mj-psi:+.1e}  q(s*)-Psi={val-psi:.2e}  eig D: {np.round(np.sort(ev)[:4],5)}")
