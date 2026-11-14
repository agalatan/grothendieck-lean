import numpy as np
rng=np.random.default_rng(11); N=3_000_000; n=3
def cg(*s): return (rng.standard_normal(s)+1j*rng.standard_normal(s))/np.sqrt(2)
Y=cg(N,n); tr=np.trace
def exact(A):
    As=A.conj().T; AA=A@As
    p=tr(AA).real; t=tr(A@A); r=tr(AA@AA).real; Qh=np.linalg.norm(A@A,'fro')**2
    s=tr(A@A@A); zeta=tr(A@A@As); eta=tr(A@A@A@As)
    R3=tr(AA@AA@AA).real; Q3=np.linalg.norm(A@A@A,'fro')**2
    U3=tr(As@As@A@A@As@A).real; V3=tr(A@A@As@As@A@As).real
    m4=2*p*p+abs(t)**2+2*r+4*Qh
    m6=6*p**3+9*p*abs(t)**2+4*abs(s)**2+36*abs(zeta)**2+36*(np.conj(t)*eta).real+18*p*r+36*p*Qh+12*R3+36*(Q3+U3+V3)
    return p,m4,m6
for k in range(6):
    A=cg(n,n)
    if k==4: A=np.array([[0,1,0],[0,0,1],[0,0,0]],complex)
    if k==5: A=np.diag([2,-1,-1]).astype(complex)
    P=np.einsum('ni,ij,nj->n',Y.conj(),A,Y)-tr(A); a2=abs(P)**2
    p,m4,m6=exact(A)
    print(f"A{k}: p={p:.4f} m4 exact={m4:.4f} MC={a2.mean()*0+ (a2**2).mean():.4f} | m6 exact={m6:.3f} MC={(a2**3).mean():.3f} | 37p m4-68p^3 = {37*p*m4-68*p**3:.3f}  ratio m6/bound={m6/(37*p*m4-68*p**3):.4f}")
# scalar inequality (23.5): 25 tau sqrt(r q) <= 7 tau^2 + 6 r + 12 q on [0,1]^3 with q<=r
g=np.linspace(0,1,201); T,Rr,Z=np.meshgrid(g,g,g,indexing='ij'); Qq=Rr*Z**2
print("min of 7tau^2+6r+12q-25tau sqrt(rq):", (7*T**2+6*Rr+12*Qq-25*T*np.sqrt(Rr*Qq)).min())
