#!/usr/bin/env python3
"""Deterministic floating check of the independent-cubic flat Hessian sector.

The nonnegativity is proved algebraically in FULL_HESSIAN_AND_FLAT_SECTOR.md.
This script checks the contact and regularized margins by Rice quadrature;
these decimals are not interval enclosures or a Grothendieck certificate.
"""
import argparse
import importlib.util
import json
from hashlib import sha256
from pathlib import Path

import numpy as np
from scipy.integrate import quad_vec
from scipy.special import roots_laguerre, i0e


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--order', type=int, default=192)
    ap.add_argument('--out', type=Path, required=True)
    args = ap.parse_args()
    path=Path(__file__).resolve().with_name('fresh_lower_frozen_response_gram.py')
    digest='15a863df1e06635370165f3fa922ca019bd036a1652869168e10d7c6d4ba7ef0'
    if sha256(path.read_bytes()).hexdigest()!=digest:
        raise RuntimeError('Frozen response fixture SHA256 mismatch')
    spec=importlib.util.spec_from_file_location('fixture',path)
    base=importlib.util.module_from_spec(spec); spec.loader.exec_module(base)
    eps=149/200; ell,beta,v=base.contact(eps)
    T,w=roots_laguerre(args.order)
    l=abs(np.sqrt(T)*(ell+beta*(T-2)))
    R0=float(w@(np.sqrt(np.pi/v)*i0e(l*l/(2*v))))
    etas=np.array([.1,.05,.02,.01,.005,.002,.001])
    accum=np.zeros((len(etas),3)); quadrature_error=0.
    for li,wi in zip(l,w):
        # Rice density: conditioning on Z, L+sqrt(v)*W is proper Gaussian.
        def integrand(r):
            density=2*r/v*np.exp(-(r-li)**2/v)*i0e(2*r*li/v)
            d=r+etas
            return np.column_stack([density/d,density*r/d**2,
                density*np.ones(len(etas))])
        val,err=quad_vec(integrand,0,float(li+12*np.sqrt(v)),epsabs=2e-11,epsrel=2e-10)
        accum+=wi*val; quadrature_error+=wi*err
    rows=[]
    for eta,(R,Ea,mass) in zip(etas,accum):
        D=Ea/2
        actual=D-eps*R*R/4
        cauchy=Ea/2-R*R/(2*R0)
        rows.append({'eta':float(eta),'R_eta':float(R),'D_eta':float(D),
            'rice_mass':float(mass),'signed_full_hessian_margin':float(actual),
            'variance_identity_margin':float(cauchy),
            'contact_error_contribution':float(actual-cauchy)})
    output={'scope':__doc__,'epsilon':'149/200','Laguerre_order':args.order,
        'fixture_sha256':digest,
        'contact':{'ell':float(ell),'beta':float(beta),'v':float(v),
            'R0':R0,'target_2_over_epsilon':2/eps,'stationarity_residual':R0-2/eps},
        'adaptive_quadrature_error_estimate_not_enclosure':float(quadrature_error),
        'rows':rows}
    args.out.parent.mkdir(parents=True,exist_ok=True)
    args.out.write_text(json.dumps(output,indent=2)+'\n')
    print(json.dumps(output,indent=2))


if __name__=='__main__':
    main()
