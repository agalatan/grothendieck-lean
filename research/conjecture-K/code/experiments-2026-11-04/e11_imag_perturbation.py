import numpy as np
exec(open('scan_majorant.py').read().split("rng=np.random.default_rng(123)")[0])
rng=np.random.default_rng(5); N=4_000_000
def cg(n): return (rng.standard_normal(n)+1j*rng.standard_normal(n))/np.sqrt(2)
X=cg(N); Y=cg(N); S=abs(X)**2; M=X*(S-2); H=X*(abs(Y)**2-1); H2=X*(S-2)  # also try self-perturbation
def ratio(q,u):
    q=q/np.sqrt(np.mean(abs(q)**2))*np.sqrt(u); rho=abs(q)**2
    D=Bu(u)-np.mean(np.interp(rho,vg,PHI)); Fq=q*np.interp(rho,vg,G)
    C2=abs(np.mean(np.conj(X)*Fq))**2+abs(np.mean(np.conj(Y)*Fq))**2
    return C2/D
for u in [0.0463,0.02]:
    base=ratio(M,u)
    print(f"u={u}: monomial {base:.5f}")
    for lam in [0.05,0.1,0.2,0.3,0.5]:
        print(f"   + i*{lam} X(|Y|^2-1): {ratio(M+1j*lam*H,u):.5f}   real +{lam}: {ratio(M+lam*H,u):.5f}   -{lam}: {ratio(M-lam*H,u):.5f}")
