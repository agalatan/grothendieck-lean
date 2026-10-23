#!/usr/bin/env python3
"""FLOAT best responses to the degree-seven cubic-phase separating witness.

Two independent proper Gaussians have original noise grades one and three.
Weighted-degree polynomial images close exactly for this fixed witness. This
is a restricted adversary oracle, never a universal witness-norm certificate.
"""
import argparse
import json
from math import comb, factorial, sqrt
from pathlib import Path
import numpy as np
from scipy.special import ndtri
from scipy.stats import qmc


def indices():
    return sorted([(p,q,r,s) for p in range(8) for q in range(8)
                   for r in range(3) for s in range(3)
                   if p-q+r-s == 1 and p+q+3*(r+s) <= 7],
                  key=lambda v:(v[0]+v[1]+3*(v[2]+v[3]),v))


def wick(z,p,q):
    return sum((-1)**j*comb(p,j)*comb(q,j)*factorial(j)
               *z**(p-j)*z.conjugate()**(q-j) for j in range(min(p,q)+1))/sqrt(factorial(p)*factorial(q))


def features(power,seed):
    u=qmc.Sobol(4,scramble=True,seed=seed).random_base2(power)
    x=ndtri(u)/sqrt(2);z=x[:,0]+1j*x[:,1];g=x[:,2]+1j*x[:,3]
    return np.column_stack([wick(z,p,q)*wick(g,r,s) for p,q,r,s in indices()])


def projection(B,c):
    v=B@c;phase=np.divide(v,abs(v),out=np.zeros_like(v),where=abs(v)>0)
    return B.conj().T@phase/len(B)


def serialize(c):return [[float(z.real),float(z.imag)] for z in c]


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--out',type=Path,required=True)
    p.add_argument('--power',type=int,default=18);p.add_argument('--iterations',type=int,default=160)
    a=p.parse_args();idx=indices();grade=np.array([p+q+3*(r+s) for p,q,r,s in idx])
    lam=np.array([1 if d==1 else -.36 if d==3 else -1 for d in grade])
    print('indices',idx,'multipliers',lam.tolist(),flush=True)
    B=features(a.power,74013);out=[]
    for variance in [.1,.2,1/3,.5]:
        c=np.zeros(len(idx),complex);e=c.copy()
        c[idx.index((1,0,0,0))]=1;e[idx.index((1,0,0,0))]=1
        c[idx.index((0,0,1,0))]=sqrt(variance);e[idx.index((0,0,1,0))]=-sqrt(variance)
        path=[]
        for k in range(a.iterations):
            c=lam*projection(B,e);e=lam*projection(B,c)
            if k%20==0 or k==a.iterations-1:
                kf,kg=projection(B,c),projection(B,e)
                payoff=float(np.real(np.vdot(kf,lam*kg)));path.append([k,payoff])
                print('start',variance,'iteration',k,'payoff',payoff,flush=True)
        row={'start_variance':variance,'image_coefficients':[serialize(c),serialize(e)],
             'training_path':path,'indices':idx,'scope':__doc__}
        out.append(row);a.out.write_text(json.dumps(out,indent=2)+'\n')
    del B
    for power,seed in [(20,84017),(20,94019)]:
        B=features(power,seed)
        for row in out:
            c,e=[np.array([complex(*z) for z in v]) for v in row['image_coefficients']]
            kf,kg=projection(B,c),projection(B,e)
            cc=(kf.conj()*kg).real
            row.setdefault('independent_projections',[]).append({'power':power,'seed':seed,
                'payoff':float(cc@lam),'c0':float(cc[grade==1].sum()),
                'c1':float(cc[grade==3].sum()),'c2':float(cc[grade==5].sum()),
                'c3':float(cc[grade==7].sum()),'projections':[serialize(kf),serialize(kg)]})
            print('holdout',row['start_variance'],seed,'payoff',cc@lam,flush=True)
        a.out.write_text(json.dumps(out,indent=2)+'\n')
        del B


if __name__=='__main__':main()
