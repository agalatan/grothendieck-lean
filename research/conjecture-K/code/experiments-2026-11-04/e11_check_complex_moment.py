import numpy as np
rng=np.random.default_rng(3); N=4_000_000; n=3
def cg(*s): return (rng.standard_normal(s)+1j*rng.standard_normal(s))/np.sqrt(2)
Y=cg(N,n)
def stats(A):
    P=np.einsum('ni,ij,nj->n',Y.conj(),A,Y)-np.trace(A)
    a2=abs(P)**2; u=a2.mean(); z=(P*P).mean(); m4=(a2**2).mean(); m6=(a2**3).mean()
    k=m4-2*u*u-abs(z)**2
    k31=(P**3*P.conj()).mean()-3*z*u   # cum(P,P,P,Pbar) for centred P
    return u,z,k,k31,m6
for trial in range(6):
    A=cg(n,n) if trial<4 else (lambda M:(M+M.conj().T)/2)(cg(n,n))
    if trial==3: A=np.array([[0,1,0],[0,0,1],[0,0,0]],complex)  # nilpotent
    u,z,k,k31,m6=stats(A)
    bound=6*u**3+9*u*abs(z)**2+(25*u+50/3*abs(z))*k
    H=(A+A.conj().T)/2; J=(A-A.conj().T)/(2j)
    # exact identity check: cumulants via traces (complex Gaussian, E|Y|^2=1): kappa = E|P|^4-2u^2-|z|^2 = tr((AA*)^2)+tr(A A* A A*)?? just compare MC k - Re k31 with the claimed trace formula after phase rotation
    ph=np.exp(-1j*np.angle(k31)/2); Ar=A*ph; Hr=(Ar+Ar.conj().T)/2; Jr=(Ar-Ar.conj().T)/(2j)
    rhs=12*np.trace(Jr@Jr@Jr@Jr)+8*np.trace(Hr@Hr@Jr@Jr)+4*np.trace(Hr@Jr@Hr@Jr)
    print(f"trial{trial}: m6={m6:.4g} bound={bound:.4g} ratio={m6/bound:.4f} | |k31|/k={abs(k31)/k:.4f} | k-Re k31(rot)={k-abs(k31):.4g} trace formula={rhs.real:.4g}")
