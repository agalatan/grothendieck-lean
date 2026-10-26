#!/usr/bin/env python3
"""Discovery: full signed P-eps Q phase Hessian on a closed graded model.

The old response fixtures are imported from a hash-pinned adjacent frozen copy.
W and N retain degrees 3 and 2. The basis contains all degree (1,0)/(2,1)
functions in the three explicit coordinates, plus Z_j*N and W. Under the same
graded-limit interpretation as the imported fixtures, these are the complete
original degree-1/3 sectors: Hermite degree in W has original weight 3 and in
N original weight 2. Additional mixed W/N terms have original degree at least 5.

Tangent features use charge-zero real and imaginary parts conj(f)*psi.
Output is floating quadrature discovery, never an enclosure or a new proof
that a named graded-limit fixture is realized by a finite Gaussian model.
"""
import argparse
import importlib.util
import json
from hashlib import sha256
from pathlib import Path
import time

import numpy as np


FROZEN = Path(__file__).resolve().with_name('fresh_lower_frozen_response_gram.py')
FROZEN_SHA256 = '15a863df1e06635370165f3fa922ca019bd036a1652869168e10d7c6d4ba7ef0'


def feature(response, psi, weight):
    vals = response.conj()[:, None] * psi
    return np.column_stack([vals.real, vals.imag])/weight[:,None]


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--fit-power', type=int, default=15)
    ap.add_argument('--eval-power', type=int, default=16)
    ap.add_argument('--seed', type=int, default=5)
    ap.add_argument('--regularizer', type=float, default=None)
    ap.add_argument('--names', nargs='+', default=['diffuse-grade3', 'diffuse-overlap',
        'shared-Wick', 'independent-Wick', 'shared-grade2', 'mixed-square', 'cycle'])
    ap.add_argument('--out', type=Path, required=True)
    args = ap.parse_args()
    if sha256(FROZEN.read_bytes()).hexdigest() != FROZEN_SHA256:
        raise RuntimeError('Frozen response fixture SHA256 mismatch')
    spec = importlib.util.spec_from_file_location('fresh_fixture', FROZEN)
    old = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(old)
    eps = 149/200
    pars = old.contact(eps)
    z0,W0,N0 = old.sample(args.fit_power, 11+100*args.seed)
    z,W,N = old.sample(args.eval_power, 23+100*args.seed)
    psi0 = np.column_stack([z0, old.basis(z0,W0,N0)])
    psi = np.column_stack([z, old.basis(z,W,N)])
    lam = np.r_[np.ones(3), -eps*np.ones(psi.shape[1]-3)]
    n = len(z)
    results = []
    output = {'scope':__doc__, 'epsilon':'149/200', 'parameters':vars(args) | {'out':str(args.out)},
        'fixture_sha256':FROZEN_SHA256,
        'basis_dimension':psi.shape[1], 'contact_parameters':pars.tolist(), 'results':results}
    args.out.parent.mkdir(parents=True, exist_ok=True)
    for name in args.names:
        start = time.monotonic()
        f0,g0 = old.responses(name,z0,W0,N0,pars)
        f,g = old.responses(name,z,W,N,pars)
        cf,cg = psi0.conj().T@f0/len(z0), psi0.conj().T@g0/len(z0)
        Tf,Tg = psi@(lam*cf), psi@(lam*cg)
        weightf = np.ones(n) if args.regularizer is None else abs(Tg)+args.regularizer
        weightg = np.ones(n) if args.regularizer is None else abs(Tf)+args.regularizer
        A,B = feature(f,psi,weightf), feature(g,psi,weightg)
        r = A.shape[1]
        Xf = psi.conj().T@(f[:,None]*A)/n
        Xg = psi.conj().T@(g[:,None]*B)/n
        C = (Xf.conj().T@(lam[:,None]*Xg)).real
        C1 = (Xf[:3].conj().T@Xg[:3]).real
        C3 = (Xf[3:].conj().T@Xg[3:]).real
        Df = A.T@((f.conj()*Tg).real[:,None]*A)/n
        Dg = B.T@((g.conj()*Tf).real[:,None]*B)/n
        H = np.block([[Df,-C],[-C.T,Dg]])
        Hfresh = np.block([[Df,eps*C1],[eps*C1.T,Dg]])
        # For diffuse-grade3, psi[20]=H21(z_2) is an independent cubic.
        # Its real/imaginary score block has the analytic variance identity;
        # this numerical subblock is a useful sensitivity diagnostic.
        qi=[20,20+psi.shape[1]]
        independent_block=H[np.ix_(qi+[r+i for i in qi],qi+[r+i for i in qi])]
        # Remove identically zero features (e.g. the imaginary part of a
        # response's defining polynomial) before reporting a stability margin.
        Gf,Gg = A.T@A/n,B.T@B/n
        def whitening(G):
            e,u = np.linalg.eigh(G)
            keep = e>1e-8*max(e[-1],1)
            return u[:,keep]/np.sqrt(e[keep])[None,:]
        Wf,Wg = whitening(Gf),whitening(Gg)
        Hwhite = np.block([[Wf.T@Df@Wf,-Wf.T@C@Wg],
                           [-Wg.T@C.T@Wf,Wg.T@Dg@Wg]])
        Hfreshwhite = np.block([[Wf.T@Df@Wf,eps*Wf.T@C1@Wg],
                           [eps*Wg.T@C1.T@Wf,Wg.T@Dg@Wg]])
        # Algebraic coefficient normalization retains a dimension-free L8
        # estimate for the polynomial psi multiplying each branch response.
        eig,vec = np.linalg.eigh(H)
        eta = max(0.,-float(eig[0]))
        a,b = vec[:r,0],vec[r:,0]
        aval,bval = A@a,B@b
        # Empirical derivative bounds are diagnostics, never certified moments.
        L8a = float(np.mean(abs(aval)**8)**(1/8))
        L8b = float(np.mean(abs(bval)**8)**(1/8))
        entry = {'name':name,'payoff':float(np.mean((f.conj()*Tg).real)),
            'coefficient_fit_payoff':float(np.vdot(cf,lam*cg).real),
            'full_hessian_min_eigenvalue':float(eig[0]),
            'fresh_first_hessian_min_eigenvalue':float(np.linalg.eigvalsh(Hfresh)[0]),
            'L2_whitened_full_min_eigenvalue':float(np.linalg.eigvalsh(Hwhite)[0]),
            'L2_whitened_fresh_min_eigenvalue':float(np.linalg.eigvalsh(Hfreshwhite)[0]),
            'feature_ranks':[Wf.shape[1],Wg.shape[1]],
            'independent_H21_Y_block_min':float(np.linalg.eigvalsh(independent_block)[0]),
            'negative_eigenvalue_count':int(np.sum(eig < -1e-4)),
            'direction_signed_first_cross':float(a@C1@b),
            'direction_signed_cubic_cross':float(a@C3@b),
            'formal_hypercontractive_gap_floor':None if args.regularizer is not None else float(3*eta*eta/(8*7**6)),
            'empirical_L8_fourth_derivative_bound':(L8a+L8b)**4,
            'direction_a':a.tolist(),'direction_b':b.tolist(),
            'seconds':time.monotonic()-start}
        results.append(entry)
        args.out.write_text(json.dumps(output,indent=2)+'\n')
        print(json.dumps({k:v for k,v in entry.items() if not k.startswith('direction_') or k.endswith('cross')}),flush=True)


if __name__ == '__main__':
    main()
