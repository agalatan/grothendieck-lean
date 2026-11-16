"""Floating-point Wick calculus for complex Gaussian polynomials (label N).
A polynomial in y_1..y_n, ybar_1..ybar_n is (E, C): E an int array (K, 2n) of exponents, C complex coefficients.
E[y^a ybar^b] = prod_i [a_i == b_i] a_i!."""
import numpy as np
from math import factorial
FACT=np.array([factorial(k) for k in range(40)],dtype=float)
def compress(E,C):
    if len(C)==0: return E,C
    key,inv=np.unique(E,axis=0,return_inverse=True)
    out=np.zeros(len(key),dtype=complex); np.add.at(out,inv.ravel(),C)
    keep=np.abs(out)>0
    return key[keep],out[keep]
def mul(P,Q):
    (E1,C1),(E2,C2)=P,Q
    E=(E1[:,None,:]+E2[None,:,:]).reshape(-1,E1.shape[1]); C=(C1[:,None]*C2[None,:]).ravel()
    return compress(E,C)
def conj(P):
    E,C=P; n=E.shape[1]//2
    return np.concatenate([E[:,n:],E[:,:n]],axis=1),np.conj(C)
def expect(P):
    E,C=P; n=E.shape[1]//2
    ok=np.all(E[:,:n]==E[:,n:],axis=1)
    w=np.prod(FACT[E[ok,:n]],axis=1)
    return complex(np.sum(C[ok]*w))
def cubic(T):
    """q = sum_{a,b,j} T[a,b,j] :y_a y_b ybar_j:, T symmetric in (a,b)."""
    n=T.shape[0]; rows=[]; cs=[]
    for a in range(n):
        for b in range(n):
            for j in range(n):
                t=T[a,b,j]
                if t==0: continue
                e=np.zeros(2*n,int); e[a]+=1; e[b]+=1; e[n+j]+=1; rows.append(e); cs.append(t)
                if b==j: e=np.zeros(2*n,int); e[a]+=1; rows.append(e); cs.append(-t)
                if a==j: e=np.zeros(2*n,int); e[b]+=1; rows.append(e); cs.append(-t)
    return compress(np.array(rows),np.array(cs,dtype=complex))
def influence(T):
    """J1[a,b] = E[d_a q conj(d_b q)] = 4 sum T[a,c,j] conj T[b,c,j];  I2[j,k] = E[conj(dbar_j q) dbar_k q] = 2 sum conj T[a,b,j] T[a,b,k]."""
    J1=4*np.einsum('acj,bcj->ab',T,np.conj(T)); I2=2*np.einsum('abj,abk->jk',np.conj(T),T)
    return J1,I2
def stats(T):
    q=cubic(T); V=mul(q,conj(q)); u=expect(V).real; dl=expect(mul(V,V)).real-2*u*u
    J1,I2=influence(T); M=J1+I2
    l1=np.linalg.eigvalsh(J1)[-1]; l2=np.linalg.eigvalsh(I2)[-1]
    return dict(u=u,delta=dl,chi=dl/u/u,M2=float(np.sum(abs(M)**2)),J2=float(np.sum(abs(J1)**2)),I22=float(np.sum(abs(I2)**2)),l1=l1,l2=l2,q=q,V=V)
def symT(x,n):
    m=n*n*n; T=(x[:m]+1j*x[m:2*m]).reshape(n,n,n); return (T+T.transpose(1,0,2))/2
