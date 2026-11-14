"""Exact Wick-product fourth moment and tensor structure; agent codex-a713.
Exact here means algebraic Gaussian moment formula, evaluated in float64.
Basis indexed (i,j,k), i<=j: (z_i z_j conj z_k-delta_ik z_j-delta_jk z_i)/sqrt(1+delta_ij).
"""
import sys
sys.dont_write_bytecode=True
import math
from collections import defaultdict
import numpy as np
from scipy import optimize, linalg


def fourth_moment(c,indices):
    c=np.asarray(c,complex)
    n=max(max(x) for x in indices)+1
    terms=[]
    for z,(i,j,k) in zip(c,indices):
        if abs(z)==0: continue
        alpha=np.zeros(n,dtype=int); alpha[i]+=1; alpha[j]+=1
        beta=np.zeros(n,dtype=int); beta[k]=1
        terms.append((z/math.sqrt(1+(i==j)),alpha,beta,k))
    out=defaultdict(complex)
    for aa,alpha,beta,k in terms:
        for bb,gamma,delta,l in terms:
            # Cross-contraction i: alpha against delta=e_l; j: beta=e_k against gamma.
            for contract_l in range(1+(alpha[l]>0)):
                for contract_k in range(1+(gamma[k]>0)):
                    a=alpha+gamma; b=beta+delta
                    multiplier=1
                    if contract_l:
                        a[l]-=1; b[l]-=1; multiplier*=alpha[l]
                    if contract_k:
                        a[k]-=1; b[k]-=1; multiplier*=gamma[k]
                    out[(tuple(a),tuple(b))]+=aa*bb*multiplier
    return float(sum(abs(z)**2*math.prod(math.factorial(int(x)) for x in a+b) for (a,b),z in out.items()))


def fourth_excess(c,indices):
    u=float(np.vdot(c,c).real)
    return fourth_moment(c,indices)/u**2-2


def wick_coefficients(direction,indices):
    v=np.asarray(direction,complex)
    v=v/np.linalg.norm(v)
    return np.array([(1 if i==j else math.sqrt(2))*v[i]*v[j]*np.conj(v[k]) for i,j,k in indices])


def wick_overlap(c,indices,content=None,restarts=12):
    """Maximum found squared overlap with a normalized rotated Wick monomial.
    Deterministic small nonlinear search; not certified globally optimal.
    """
    c=np.asarray(c,complex); norm2=np.vdot(c,c).real
    n=max(max(x) for x in indices)+1
    rng=np.random.default_rng(5713)
    seeds=[np.eye(n,dtype=complex)[j] for j in range(n)]
    if content is not None and np.linalg.norm(content)>0: seeds.insert(0,np.asarray(content,complex))
    seeds += [rng.normal(size=n)+1j*rng.normal(size=n) for _ in range(restarts)]
    def value(x):
        v=x[:n]+1j*x[n:]
        if np.linalg.norm(v)<1e-30: return 0.
        w=wick_coefficients(v,indices)
        return -float(abs(np.vdot(w,c))**2/norm2)
    best=(1.,None)
    for seed in seeds:
        seed=seed/np.linalg.norm(seed)
        ans=optimize.minimize(value,np.r_[seed.real,seed.imag],method='BFGS',options={'gtol':1e-8,'maxiter':150})
        if ans.fun<best[0]:
            v=ans.x[:n]+1j*ans.x[n:]; v/=np.linalg.norm(v)
            best=(float(ans.fun),v)
    v=best[1]
    phase=np.vdot(wick_coefficients(v,indices),c)
    return dict(overlap_squared=-best[0],direction=v,coefficient=phase,relative_distance=math.sqrt(max(0,1+best[0])))


def rotate_to_driver(c,indices,direction):
    """Return coefficients in w-coordinates whose first variable is direction dot z."""
    n=max(max(x) for x in indices)+1
    v=np.asarray(direction,complex);v=v/np.linalg.norm(v)
    # Rows W form a unitary matrix and row zero equals v.
    columns=linalg.null_space(v.reshape(1,-1))
    W=np.vstack([v,columns.conj().T])
    A=np.zeros((n,n,n),complex)
    for z,(i,j,k) in zip(c,indices):
        if i==j: A[i,j,k]=z/math.sqrt(2)
        else: A[i,j,k]=A[j,i,k]=z/2
    Ap=np.einsum('ai,bj,ck,ijk->abc',W.conj(),W.conj(),W,A,optimize=True)
    cp=np.array([Ap[i,j,k]*(math.sqrt(2) if i==j else 2) for i,j,k in indices])
    return cp,W


def shell_weights(c,indices,direction):
    cp,W=rotate_to_driver(c,indices,direction)
    buckets=defaultdict(float)
    for z,(i,j,k) in zip(cp,indices):
        if i==j==k==0: key='Wick X(|X|2-2)'
        elif int(i==0)+int(j==0)==1 and k!=0: key='X P(Y)'
        elif i!=0 and j!=0 and k==0: key='conj(X) B(Y)'
        elif int(i==0)+int(j==0)==1 and k==0: key='(|X|2-1) V(Y)'
        elif i==j==0 and k!=0: key='X2 conj(W(Y))'
        else: key='R(Y)'
        buckets[key]+=float(abs(z)**2)
    norm2=float(np.vdot(c,c).real)
    return {k:v/norm2 for k,v in buckets.items()}


if __name__=='__main__':
    for n in (1,2,3,6):
        ix=[(i,j,k) for i in range(n) for j in range(i,n) for k in range(n)]
        c=np.zeros(len(ix),complex); c[ix.index((0,0,0))]=1
        assert abs(fourth_excess(c,ix)-42)<1e-10
        if n>1:
            c*=0;c[ix.index((0,1,1))]=1
            assert abs(fourth_excess(c,ix)-16)<1e-10
            rng=np.random.default_rng(n)
            v=rng.normal(size=n)+1j*rng.normal(size=n);v/=np.linalg.norm(v)
            c=wick_coefficients(v,ix)
            cp,_=rotate_to_driver(c,ix,v)
            assert abs(np.vdot(c,c)-1)<1e-12
            assert abs(fourth_excess(c,ix)-42)<1e-10
            assert abs(abs(cp[ix.index((0,0,0))])**2-1)<1e-12
            print(n,len(ix),fourth_excess(c,ix),shell_weights(c,ix,v))
    print('PASS Wick product, radial moment, and rotation checks')
