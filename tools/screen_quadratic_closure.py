#!/usr/bin/env python3
"""Float discovery: quadratic features close exactly on first+cubic images.

P(f A_M) is computed from Pf and Qf by the Wick contraction identity, then
compared with independent direct projection. No free Gram completion is used.
The neutral N feature is a real degree-two limit with its original grade.
"""
import argparse
import json
import time
from pathlib import Path

import numpy as np
import screen_response_gram as base


def hermitian_basis():
    matrices=[]
    for i in range(3):
        M=np.zeros((3,3),complex); M[i,i]=1; matrices.append(M)
    for i in range(3):
        for j in range(i+1,3):
            M=np.zeros((3,3),complex)
            M[i,j]=M[j,i]=1/np.sqrt(2); matrices.append(M)
            M=np.zeros((3,3),complex)
            M[i,j]=1j/np.sqrt(2); M[j,i]=-1j/np.sqrt(2); matrices.append(M)
    return matrices


def closure(p,q,M):
    index={}; k=0
    for i in range(3):
        for j in range(i,3):
            for l in range(3):
                index[i,j,l]=k; k+=1
    out=M.conj()@p
    for l in range(3):
        for i in range(3):
            for j in range(3):
                out[l]+=M[i,j].conjugate()*np.sqrt(1+(j==l))*q[index[min(j,l),max(j,l),i]]
    return out


def main():
    p=argparse.ArgumentParser()
    p.add_argument('--out',type=Path,required=True)
    p.add_argument('--fit-power',type=int,default=19)
    p.add_argument('--eval-power',type=int,default=20)
    p.add_argument('--replicate',type=int,default=3)
    p.add_argument('--centered-only',action='store_true')
    args=p.parse_args()
    eps=149/200; pars=base.contact(eps)
    z0,W0,N0=base.sample(args.fit_power,11+100*args.replicate)
    z,W,N=base.sample(args.eval_power,23+100*args.replicate)
    b0,b=base.basis(z0,W0,N0),base.basis(z,W,N)
    matrices=hermitian_basis()
    A=np.column_stack([np.ones(len(z))]+[(np.einsum('ni,ij,nj->n',z.conj(),M,z)-np.trace(M)).real
                       for M in matrices]+[N])
    if args.centered_only:
        A=A[:,1:]
    gram=A.T@A/len(z)
    results=[]
    for name in ['diffuse-grade3','diffuse-overlap','shared-Wick','independent-Wick',
                 'shared-grade2','mixed-square','cycle']:
        start=time.monotonic()
        f0,g0=base.responses(name,z0,W0,N0,pars)
        f,g=base.responses(name,z,W,N,pars)
        pf,pg=z0.conj().T@f0/len(z0),z0.conj().T@g0/len(z0)
        qf,qg=b0.conj().T@f0/len(z0),b0.conj().T@g0/len(z0)
        Tf,Tg=z@pf-eps*(b@qf),z@pg-eps*(b@qg)
        Xf=np.column_stack([pf]+[closure(pf,qf,M) for M in matrices]+[qf[18:21]])
        Xg=np.column_stack([pg]+[closure(pg,qg,M) for M in matrices]+[qg[18:21]])
        if args.centered_only:
            Xf,Xg=Xf[:,1:],Xg[:,1:]
        directf=z.conj().T@(f[:,None]*A)/len(z)
        directg=z.conj().T@(g[:,None]*A)/len(z)
        C=(Xf.conj().T@Xg).real
        Df=A.T@(abs(Tg)[:,None]*A)/len(z)
        Dg=A.T@(abs(Tf)[:,None]*A)/len(z)
        Dfs=A.T@((f.conj()*Tg).real[:,None]*A)/len(z)
        Dgs=A.T@((g.conj()*Tf).real[:,None]*A)/len(z)
        H=np.block([[Df,eps*C],[eps*C.T,Dg]])
        Hs=np.block([[Dfs,eps*C],[eps*C.T,Dgs]])
        eig=np.linalg.eigvalsh(H)[0]; eigs=np.linalg.eigvalsh(Hs)[0]
        entry={'name':name,'payoff':float(np.mean((f.conj()*Tg).real)),
            'positive_min_eigenvalue':float(eig),'signed_min_eigenvalue':float(eigs),
            f'suggested_gap_bound_{48 if args.centered_only else 67}':float(
                max(0,-eigs)**2/(16*(48 if args.centered_only else 67))),
            'direct_closure_max_error_f':float(np.max(abs(directf-Xf))),
            'direct_closure_max_error_g':float(np.max(abs(directg-Xg))),
            'seconds':time.monotonic()-start,
            'observables':{'Df':Df.tolist(),'Dg':Dg.tolist(),'Df_signed':Dfs.tolist(),
                'Dg_signed':Dgs.tolist(),'C':C.tolist(),'H':H.tolist(),'H_signed':Hs.tolist()}}
        results.append(entry)
        print(json.dumps({k:v for k,v in entry.items() if k!='observables'}),flush=True)
        args.out.write_text(json.dumps({'scope':__doc__,'epsilon':'149/200',
            'fit_power':args.fit_power,'eval_power':args.eval_power,'replicate':args.replicate,
            'include_constant':not args.centered_only,
            'feature_gram_error':float(np.max(abs(gram-np.eye(A.shape[1])))),
            'results':results},indent=2)+'\n')


if __name__=='__main__':
    main()
