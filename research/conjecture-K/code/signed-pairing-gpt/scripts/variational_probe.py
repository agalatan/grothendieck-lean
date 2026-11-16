# scripts/variational_probe.py
"""N: optimize polynomial representatives; no floating result is a certificate."""
import math, json, sys
from pathlib import Path
import numpy as np
from scipy.linalg import lstsq

def indices(D, charge):
    return [(a,b,c,d) for a in range(D+1) for b in range(D-a+1)
            for c in range(D-a-b+1) for d in range(D-a-b-c+1)
            if a-b+c-d == charge]

def mul_core(i, j):
    a,b,c,d=i; e,f=j
    for r in range(min(a,f)+1):
        for s in range(min(b,e)+1):
            v=math.comb(a,r)*math.comb(f,r)*math.factorial(r)*math.comb(b,s)*math.comb(e,s)*math.factorial(s)
            yield (a+e-r-s,b+f-r-s,c,d),v

def norm(i):
    return math.prod(math.factorial(k) for k in i)

def matrices(D):
    cols=[('A',i) for i in indices(D,0)]+[('B',i) for i in indices(D,-2)]
    outs=indices(D+3,-1); loc={i:j for j,i in enumerate(outs)}
    M0=np.zeros((len(outs),len(cols))); M1=M0.copy()
    for j,(typ,i) in enumerate(cols):
        n=norm(i); k=list(i); k[1 if typ=='A' else 0]+=1; k=tuple(k)
        M0[loc[k],j]+=math.sqrt(norm(k)/n)
        for core,factor,axis in ([((1,1),2,3),((0,2),1,2)] if typ=='A' else [((2,0),1,3),((1,1),2,2)]):
            for p,v in mul_core(i,core):
                k=list(p); k[axis]+=1; k=tuple(k)
                M1[loc[k],j]-=factor*v*math.sqrt(norm(k)/n)
    target=np.zeros(len(outs))
    for i,v in [((0,1,0,0),12),((1,2,0,0),16),((2,3,0,0),3)]:
        target[loc[i]]=v*math.sqrt(norm(i))
    return cols,outs,M0,M1,target

if __name__=='__main__':
    D=int(sys.argv[1]) if len(sys.argv)>1 else 10
    cols,outs,M0,M1,target=matrices(D)
    print('D',D,'shape',M0.shape,flush=True)
    for rho in [.025,.05,.075,.1,.125,.15,.2,.25,.3,.4,.5]:
        M=M0+rho*M1
        sol,_,_,_=lstsq(M,target,cond=1e-12,lapack_driver='gelsy')
        Z=target-M@sol; norm2=Z@Z
        theta=(norm2+1024*rho*rho/(1+2*rho*rho))/252
        energy=2*rho*rho/(1+2*rho*rho)
        print(json.dumps(dict(rho=rho,energy_fraction=energy,chi=42*energy**2,norm2=norm2,theta=theta)),flush=True)
