"""E5b: derivative of Lambda along the OU path, c in a fine grid near 1 and near 0, common random numbers, n samples.
Also the Stein-kernel form: dLam/dc should equal c * E[(tau_G - |G|^2)(1/|L+G_c| + 1/|L-G_c|)] / 2 (checked numerically via tau for the junta)."""
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
def lam(Gs,nrm2): return np.mean(np.abs(L+Gs))+np.mean(np.abs(L-Gs))-nrm2/eps
def tensor(fn):
    a=np.zeros(M,complex)
    for t,(i,j,k) in enumerate(idx): a[t]=fn(i,j,k)
    return a
def report(a,label):
    G=B@a; nrm2=float(np.sum(D*np.abs(a)**2)); nrm=math.sqrt(nrm2)
    cs=np.concatenate([np.linspace(0,0.2,5), np.linspace(0.8,1.0,11)]); vals=np.array([lam(c*G+math.sqrt(1-c*c)*nrm*W2,nrm2) for c in cs])
    dv=np.diff(vals)/np.diff(cs)
    print(f"{label:40s} |G|={nrm:.3f} Lam(0)={vals[0]:.6f} Lam(1)={vals[-1]:.6f} | slope near 0: {dv[0]:+.2e},{dv[3]:+.2e} | slopes c=0.8..1: " + " ".join(f"{x:+.1e}" for x in dv[4:]))
print(f"d={d} eps={eps} (ell,beta)=({ell},{beta}) n={n}")
report(tensor(lambda i,j,k: 0.15j if (i==0 and j==k==1) else 0),"i*0.15*z1(|z2|^2-1)")
report(tensor(lambda i,j,k: 0.1/math.sqrt(2) if (i==j==k==1) else 0),"0.1*H(z2) junta")
report(tensor(lambda i,j,k: 0.2/math.sqrt(2) if (i==j==k==1) else 0),"0.2*H(z2) junta")
a=tensor(lambda i,j,k: 0.15/math.sqrt(2) if (i==j==k==1) else (0.08 if (i==0 and j==1 and k==0) else (0.05 if (i==j==0 and k==1) else 0))); report(a,"junta+mixed")
for s in range(3):
    a=rng.standard_normal(M)+1j*rng.standard_normal(M); a[-1]=0; a*=0.2/math.sqrt(np.sum(D*np.abs(a)**2)); report(a,f"random norm 0.2 #{s}")
a=np.zeros(M,complex); a[-1]=0.2; a[:-1]=0.06*(rng.standard_normal(M-1)+1j*rng.standard_normal(M-1))/math.sqrt(M-1); report(a,"0.2W + 0.06 random")
# small perturbations of the Gaussian point in each basis direction (flattest region)
for t in range(min(M-1,6)):
    a=np.zeros(M,complex); a[-1]=0.2; a[t]=0.05/math.sqrt(D[t]); report(a,f"0.2W + 0.05 e_{idx[t]}")
