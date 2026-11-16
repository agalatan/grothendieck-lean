"""Largest values of ||P11 |q|^2||^2/delta, (l1^2+l2^2)/delta, l1^2/delta, l2^2/delta over H21(C^n) (label N).
First checks that the matrix M = J1 + I2 equals the second-chaos coefficients of |q|^2 (Theorem 7(a))."""
import sys, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np
from scipy.optimize import minimize
from wickfloat import *
rng=np.random.default_rng(1)
# check Theorem 7(a) on a random cubic
n=3; T=symT(rng.standard_normal(2*n**3),n); s=stats(T); q,V=s['q'],s['V']
P11=np.zeros((n,n),complex)
for a in range(n):
    for b in range(n):
        e=np.zeros(2*n,int); e[n+a]+=1; e[b]+=1   # ybar_a y_b
        P11[a,b]=expect(mul((e[None,:],np.array([1.0+0j])),V))-(s['u'] if a==b else 0)
J1,I2=influence(T); print("Theorem 7(a) check: max |P11 coefficients - (J1+I2)| =",np.max(abs(P11-(J1+I2).T)), " vs", np.max(abs(P11-(J1+I2))))
def neg(x,n,key):
    s=stats(symT(x,n))
    v={'M':s['M2'],'L':s['l1']**2+s['l2']**2,'l1':s['l1']**2,'l2':s['l2']**2,'J':s['J2'],'I':s['I22']}[key]
    return -v/s['delta']
for key in ['M','L','l1','l2','J','I']:
    for n in [2,3]:
        best=(0,None)
        for r in range(8 if n==2 else 5):
            x0=rng.standard_normal(2*n**3)*np.exp(rng.standard_normal(2*n**3))
            o=minimize(neg,x0,args=(n,key),method='L-BFGS-B',options={'maxiter':400})
            if -o.fun>best[0]: best=(-o.fun,o.x)
        s=stats(symT(best[1],n))
        print(f"{key:2s} n={n}: sup ratio found = {best[0]:.6f}   at chi={s['chi']:.3f}, l1/u={s['l1']/s['u']:.4f}, l2/u={s['l2']/s['u']:.4f}, ||M||^2/delta={s['M2']/s['delta']:.4f}",flush=True)
