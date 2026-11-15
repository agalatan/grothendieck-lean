import numpy as np
rng=np.random.default_rng(21); N=3_000_000; n=3
def cg(*s): return (rng.standard_normal(s)+1j*rng.standard_normal(s))/np.sqrt(2)
Y=cg(N,n)
for trial in range(5):
    m=[1,2,3,2,4][trial]
    As=[cg(n,n) for _ in range(m)]
    if trial==3: As=[np.diag([2,-1,-1]).astype(complex), np.array([[0,1,0],[0,0,1],[0,0,0]],complex)]
    P=np.stack([np.einsum('ni,ij,nj->n',Y.conj(),A,Y)-np.trace(A) for A in As],1)
    H=np.concatenate([P.real,P.imag],1); V=(H**2).sum(1); M=(H.T@H)/N
    u=np.trace(M); rho=np.linalg.eigvalsh(M).max(); tau=rho/u
    lhs=np.mean(V**3); rhs=(25*u+100*rho)/3*np.mean(V**2)-22/3*u**3-44*u*np.trace(M@M)-176/3*np.trace(M@M@M)
    alpha=(25+100*tau)/3; beta=22/3+44*tau**2+176/3*tau**3; Y0=V/u
    print(f"m={m}: tau={tau:.3f}  EV^3={lhs:.4g} <= bound {rhs:.4g} ratio={lhs/rhs:.4f} | E[Y0^3-alpha Y0^2]={np.mean(Y0**3-alpha*Y0**2):.3f} <= -beta={-beta:.3f}")
