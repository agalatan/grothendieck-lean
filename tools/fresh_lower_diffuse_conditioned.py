#!/usr/bin/env python3
"""Discovery quadrature after exact conditioning of unused Gaussian modes.

For the diffuse contact, first/cubic basis elements factor into one visible
complex Hermite polynomial and one orthonormal remote Wick mode. All remote
products are integrated symbolically. Image-centered polar quadrature then
integrates only visible |Z|^2 and the image L+sqrt(v)W. No random projections
or unconstrained Gram completions occur. Results are not interval enclosures.
"""
import argparse
import importlib.util
import json
from hashlib import sha256
from math import comb, factorial, sqrt
from pathlib import Path

import numpy as np
from scipy.special import roots_laguerre, roots_legendre


def descriptors():
    rows=[]
    for i in range(3):
        p=[0]*3; p[i]=1
        rows.append((p,[0]*3,0,False))
    for i in range(3):
        for j in range(i,3):
            for k in range(3):
                p=[0]*3; q=[0]*3
                p[i]+=1; p[j]+=1; q[k]+=1
                rows.append((p,q,0,False))
    for i in range(3):
        p=[0]*3; p[i]=1
        rows.append((p,[0]*3,1,False))
    rows.append(([0]*3,[0]*3,0,True))
    return rows


def hermite(p,q,z):
    return sum((-1)**r*factorial(r)*comb(p,r)*comb(q,r)*
        z**(p+q-2*r) for r in range(min(p,q)+1))/sqrt(factorial(p)*factorial(q))


def main():
    ap=argparse.ArgumentParser()
    ap.add_argument('--outer',type=int,default=192)
    ap.add_argument('--radial',type=int,default=192)
    ap.add_argument('--angular',type=int,default=256)
    ap.add_argument('--eta',type=float,default=.01)
    ap.add_argument('--out',type=Path,required=True)
    args=ap.parse_args()
    fixture=Path(__file__).resolve().with_name('fresh_lower_frozen_response_gram.py')
    digest='15a863df1e06635370165f3fa922ca019bd036a1652869168e10d7c6d4ba7ef0'
    if sha256(fixture.read_bytes()).hexdigest()!=digest:
        raise RuntimeError('Frozen response fixture SHA256 mismatch')
    spec=importlib.util.spec_from_file_location('fixture',fixture)
    base=importlib.util.module_from_spec(spec); spec.loader.exec_module(base)
    eps=149/200; ell,beta,v=base.contact(eps)
    rows=descriptors(); d=len(rows)
    modes=[(p[1],q[1],p[2],q[2],n) for p,q,n,isw in rows]
    conjugate=lambda a:(a[1],a[0],a[3],a[2],a[4])
    same=np.array([[a==b for b in modes] for a in modes])
    conj=np.array([[a==conjugate(b) for b in modes] for a in modes])
    wmode=np.array([isw for p,q,n,isw in rows],float)
    T,wt=roots_laguerre(args.outer)
    xr,wr=roots_legendre(args.radial)
    theta=2*np.pi*np.arange(args.angular)/args.angular
    eitheta=np.exp(1j*theta)[None,:]
    co=np.cos(theta)[None,:]
    accum=np.zeros((3,2,d,d)) # weights R,D,G; real/imag feature blocks
    mass=0.
    r0=0.
    for t,tw in zip(T,wt):
        if tw<1e-26:
            continue
        z=sqrt(t); L=z*(ell+beta*(t-2))
        upper=L+10*sqrt(v)
        r=(upper*(xr+1)/2)[:,None]
        dr=(upper*wr/2)[:,None]
        dens=(2/(v*args.angular))*r*dr*np.exp(-((r-L)**2+2*r*L*(1-co))/v)
        W=(r*eitheta-L)/sqrt(v)
        phase2=eitheta.conj()**2
        observables=[np.ones_like(W),W,abs(W)**2,phase2,
                     phase2*W,phase2*W**2]
        m0=float(np.sum(dens)); mass+=tw*m0
        r0+=tw*float(np.sum(dens/r))
        c=np.array([0. if isw else hermite(p[0],q[0],z) for p,q,n,isw in rows])
        cc=np.outer(c,c); wc=np.outer(wmode,c); cw=wc.T; ww=np.outer(wmode,wmode)
        for k,weight in enumerate([1/(r+args.eta),r/(r+args.eta)**2,
                                   1/(r+args.eta)**2]):
            m=[float(np.sum(dens*weight*o).real) for o in observables]
            K=same*(cc*m[0]+(wc+cw)*m[1]+ww*m[2])
            N=conj*(cc*m[3]+(wc+cw)*m[4]+ww*m[5])
            accum[k,0]+=tw*(K+N)/2
            accum[k,1]+=tw*(K-N)/2
    ls=np.r_[np.ones(3),-eps*np.ones(d-3)]
    ls[-1]=eps # W -> -W switches the second branch image.
    report=[]
    for parity in range(2):
        R,D,G=accum[:,parity]
        ge,gu=np.linalg.eigh(G)
        keep=ge>1e-8*max(ge[-1],1)
        whiten=gu[:,keep]/np.sqrt(ge[keep])[None,:]
        C=R@(ls[:,None]*R)
        full_margins={}
        for sign in [-1,1]:
            H=D+sign*C
            Hwhite=whiten.T@H@whiten
            full_margins[str(sign)]={'raw_min':float(np.linalg.eigvalsh(H)[0]),
                'whitened_min':float(np.linalg.eigvalsh(Hwhite)[0])}
        re,ru=np.linalg.eigh(R)
        root=(ru*np.sqrt(np.maximum(re,0))[None,:])@ru.T
        operator_eigs=np.linalg.eigvalsh(root@(ls[:,None]*root))
        report.append({'parity':'real' if parity==0 else 'imag',
            'feature_rank':int(sum(keep)),'score_hessian':full_margins,
            'regularized_weighted_operator_eigen_interval':[
                float(operator_eigs[0]),float(operator_eigs[-1])],
            'independent_H21_Y_R':float(R[20,20]),
            'independent_H21_Y_D':float(D[20,20]),
            'independent_H21_Y_score_margin':float(D[20,20]-eps*R[20,20]**2)})
    out={'scope':__doc__,'parameters':vars(args)|{'out':str(args.out)},
        'fixture_sha256':digest,
        'contact':[float(ell),float(beta),float(v)],'total_mass':float(mass),
        'R0':float(r0),'R0_target':2/eps,'blocks':report}
    args.out.parent.mkdir(parents=True,exist_ok=True)
    args.out.write_text(json.dumps(out,indent=2)+'\n')
    print(json.dumps(out,indent=2))


if __name__=='__main__':
    main()
