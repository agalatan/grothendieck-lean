"""Largest ratios to delta over H21(C^n), n up to 5, with the pairing formula for E|q|^4 (label N).
keys: L = l1^2 + l2^2, H = ||J1||^2 + ||I2||^2, M = ||J1 + I2||^2 (= ||P11 |q|^2||^2), l1 = l1^2, l2 = l2^2.
usage: python3 sup_fast.py KEY n restarts seed"""
import sys, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np
from scipy.optimize import minimize
from fourth import CLASSES
key,n,R,seed=sys.argv[1],int(sys.argv[2]),int(sys.argv[3]),int(sys.argv[4])
IDX=[(a,b,j) for a in range(n) for b in range(a,n) for j in range(n)]; m=len(IDX)
def build(x):
    z=x[:m]+1j*x[m:]; T=np.zeros((n,n,n),complex)
    for k,(a,b,j) in enumerate(IDX):
        if a==b: T[a,a,j]=z[k]
        else: T[a,b,j]=z[k]/np.sqrt(2); T[b,a,j]=z[k]/np.sqrt(2)
    return T
T0=build(np.ones(2*m)); PATHS={k:np.einsum_path(k+"->",T0,T0,T0,T0,optimize='optimal')[0] for k in CLASSES}
def ev(T):
    Tc=np.conj(T); u=2*float(np.sum(abs(T)**2))
    e4=float(np.real(sum(c*np.einsum(k+"->",T,T,Tc,Tc,optimize=PATHS[k]) for k,c in CLASSES.items())))
    J1=4*np.einsum('acj,bcj->ab',T,Tc); I2=2*np.einsum('abj,abk->jk',Tc,T)
    l1=np.linalg.eigvalsh(J1)[-1]; l2=np.linalg.eigvalsh(I2)[-1]
    return u,e4-2*u*u,J1,I2,l1,l2
def val(T):
    u,dl,J1,I2,l1,l2=ev(T)
    num={'L':l1*l1+l2*l2,'H':np.sum(abs(J1)**2)+np.sum(abs(I2)**2),'M':np.sum(abs(J1+I2)**2),'l1':l1*l1,'l2':l2*l2}[key]
    return float(num/dl)
rng=np.random.default_rng(seed); best=(0,None)
for r in range(R):
    x0=rng.standard_normal(2*m)*np.exp(rng.standard_normal(2*m))
    o=minimize(lambda x:-val(build(x)),x0,method='L-BFGS-B',options={'maxiter':500})
    if -o.fun>best[0]: best=(-o.fun,o.x)
T=build(best[1]); u,dl,J1,I2,l1,l2=ev(T)
ev1=np.linalg.eigvalsh(J1)[::-1]/u; ev2=np.linalg.eigvalsh(I2)[::-1]/u
print(f"{key:2s} n={n} seed={seed}: sup ratio found = {best[0]:.6f} at chi={dl/u/u:.4f}; spec(J1)/u={np.round(ev1,4)}, spec(I2)/u={np.round(ev2,4)}",flush=True)
np.save(f"{os.path.dirname(os.path.abspath(__file__))}/../results/argmax_{key}_n{n}_s{seed}.npy",best[1])
