"""E5: OU-path monotonicity for Conjecture K.  For a cubic adversary G (full Wick tensor in d coords + optional W part),
interpolate G_c = c*G + sqrt(1-c^2)*|G|*W' (W' an independent complex Gaussian; same L2 norm at every c) and tabulate
Lambda(G_c) = E|L+G_c| + E|L-G_c| - |G_c|^2/eps for c in [0,1].  Monotone decreasing in c for all G  =>  Lambda(G) <= Lambda(|G| W') <= S  =>  K.
Common random numbers, n samples.  usage: e5_oupath.py d eps ell beta seed n"""
import numpy as np, math, sys
d=int(sys.argv[1]); eps=float(sys.argv[2]); ell=float(sys.argv[3]); beta=float(sys.argv[4]); seed=int(sys.argv[5]); n=int(sys.argv[6])
rng=np.random.default_rng(seed)
idx=[(i,j,k) for i in range(d) for j in range(i,d) for k in range(d)]; M=len(idx)+1
D=np.array([1.0+(1.0 if i==j else 0.0) for (i,j,k) in idx]+[1.0])
Z=(rng.standard_normal((n,d))+1j*rng.standard_normal((n,d)))/math.sqrt(2)
W=(rng.standard_normal(n)+1j*rng.standard_normal(n))/math.sqrt(2); W2=(rng.standard_normal(n)+1j*rng.standard_normal(n))/math.sqrt(2)
B=np.empty((n,M),complex)
for t,(i,j,k) in enumerate(idx):
    v=Z[:,i]*Z[:,j]*np.conj(Z[:,k])
    if k==i: v=v-Z[:,j]
    if k==j: v=v-Z[:,i]
    B[:,t]=v
B[:,-1]=W
u=np.abs(Z[:,0])**2; L=Z[:,0]*(ell+beta*(u-2))
def lam_of(Gs, nrm2): return np.mean(np.abs(L+Gs))+np.mean(np.abs(L-Gs))-nrm2/eps
def path(a, label):
    G=B@a; nrm2=float(np.sum(D*np.abs(a)**2)); nrm=math.sqrt(nrm2)
    cs=np.linspace(0,1,11); vals=[]
    for c in cs:
        Gc=c*G+math.sqrt(1-c*c)*nrm*W2; vals.append(lam_of(Gc,nrm2))
    vals=np.array(vals); mono=np.all(np.diff(vals)<=1e-6)
    print(f"{label:46s} |G|={nrm:.3f}  Lam(c=0)={vals[0]:.6f} Lam(G)={vals[-1]:.6f}  diff={vals[-1]-vals[0]:+.2e}  max rise along path={np.max(np.diff(vals)):+.2e}  monotone={mono}")
    return vals
def tensor(fn):
    a=np.zeros(M,complex)
    for t,(i,j,k) in enumerate(idx): a[t]=fn(i,j,k)
    return a
print(f"d={d} eps={eps} (ell,beta)=({ell},{beta}) n={n}")
# 1. L4 counterexample  G = i c z1 (|z2|^2 - 1)
for c in (0.15,0.4): path(tensor(lambda i,j,k: 1j*c if (i==0 and j==k==1) else 0), f"i*{c}*z1(|z2|^2-1)")
# 2. junta cubic in z2 (Wick :z2 z2 conj z2: has norm sqrt2)
for c in (0.1,0.2,0.3): path(tensor(lambda i,j,k: c/math.sqrt(2) if (i==j==k==1) else 0), f"{c}*H(z2) junta")
# 3. mixed: junta + r_A, r_B components
a=tensor(lambda i,j,k: 0.15/math.sqrt(2) if (i==j==k==1) else (0.08 if (i==0 and j==1 and k==0) else (0.05 if (i==j==0 and k==1) else 0))); path(a,"junta+ (|z1|^2-1)z2 + z1^2 conj z2")
# 4. random spiky tensors of norm 0.15, 0.3 (no W) and with W
for s in range(4):
    a=rng.standard_normal(M)+1j*rng.standard_normal(M); a[-1]=0; a*=0.2/math.sqrt(np.sum(D*np.abs(a)**2)); path(a,f"random tensor norm 0.2 #{s}")
for s in range(2):
    a=rng.standard_normal(M)+1j*rng.standard_normal(M); a[-1]=0; a*=0.12/math.sqrt(np.sum(D*np.abs(a)**2)); a[-1]=0.16; path(a,f"random 0.12 + 0.16 W #{s}")
# 5. the previous best MC candidates' structure: W + small tensor
a=np.zeros(M,complex); a[-1]=0.2; a[:-1]=0.04*(rng.standard_normal(M-1)+1j*rng.standard_normal(M-1))/math.sqrt(M-1); path(a,"0.2 W + 0.04 random")
