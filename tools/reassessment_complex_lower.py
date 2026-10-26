#!/usr/bin/env python3
"""Discovery only: keep complex Gram moments in the response completion.

Imports the existing named responses without changing them.  Independent fit
and evaluation grids, observable-space regularization, and solver residuals are
reported.  No integration error bound, global cap, or endpoint is asserted.
"""
import argparse
import importlib.util
import json
import time
import inspect
from hashlib import sha256
from pathlib import Path

import cvxpy as cp
import numpy as np


def completion(Df, Dg, G, X, eps, complex_body):
    r = Df.shape[0]
    known = X.conj().T @ X
    if not complex_body:
        known, G = known.real, G.real
    V = G - known
    V = (V + V.conj().T) / 2
    mineig = float(np.linalg.eigvalsh(V)[0])
    pad = max(0., -mineig) + 1e-10
    V += pad * np.eye(2 * r)
    K = (cp.Variable((2*r, 2*r), hermitian=True) if complex_body
         else cp.Variable((2*r, 2*r), symmetric=True))
    t = cp.Variable()
    C = known[:r, r:] + K[:r, r:]
    if complex_body:
        C = cp.real(C)
    H = cp.bmat([[Df, eps*C], [eps*C.T, Dg]])
    prob = cp.Problem(cp.Maximize(t), [K >> 0, V-K >> 0,
                                     H-t*np.eye(2*r) >> 0])
    prob.solve(solver='CLARABEL', tol_gap_abs=1e-9, tol_feas=1e-9,
               tol_gap_rel=1e-9, max_iter=200)
    kv = K.value
    cv = (known[:r, r:] + kv[:r, r:]).real
    hv = np.block([[Df, eps*cv], [eps*cv.T, Dg]])
    return {'status': prob.status, 'best_min_eigenvalue': float(prob.value),
            'moment_body_pad': pad, 'raw_residual_min_eigenvalue': mineig,
            'residuals': {'K': float(np.linalg.eigvalsh(kv)[0]),
                'V_minus_K': float(np.linalg.eigvalsh(V-kv)[0]),
                'H_minus_tI': float(np.linalg.eigvalsh(
                    hv-prob.value*np.eye(2*r))[0])},
            'K_real': kv.real.tolist(), 'K_imag': kv.imag.tolist()}


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--out', type=Path, required=True)
    ap.add_argument('--fit-power', type=int, default=16)
    ap.add_argument('--eval-power', type=int, default=17)
    ap.add_argument('--replicate', type=int, default=0)
    ap.add_argument('--enrich', action='store_true')
    ap.add_argument('--sharp', action='store_true')
    ap.add_argument('--names', nargs='+', default=[
        'diffuse-grade3', 'shared-Wick', 'shared-grade2', 'cycle'])
    args = ap.parse_args()
    spec = importlib.util.spec_from_file_location('old_screen',
        Path(__file__).with_name('screen_response_gram.py'))
    old = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(old)
    eps = 149/200
    pars = old.contact(eps)
    z0, W0, N0 = old.sample(args.fit_power, 11+100*args.replicate)
    z, W, N = old.sample(args.eval_power, 23+100*args.replicate)
    b0, b = old.basis(z0, W0, N0), old.basis(z, W, N)
    n = len(z)
    fcal = z[:, 0]/abs(z[:, 0])
    pcal, qcal = z.conj().T@fcal/n, b.conj().T@fcal/n
    output = {'status': __doc__, 'epsilon': '149/200',
        'response_source_sha256': sha256(Path(spec.origin).read_bytes()).hexdigest(),
        'fit_power': args.fit_power, 'eval_power': args.eval_power,
        'replicate': args.replicate, 'sharp': args.sharp,
        'enriched': args.enrich, 'contact': pars.tolist(),
        'calibration': {
            'first_error': float(abs(pcal[0]-np.sqrt(np.pi)/2)),
            'cubic_error': float(abs(qcal[0]+np.sqrt(np.pi)/(4*np.sqrt(2)))),
            'off_target': float(max(np.max(abs(pcal[1:])),
                                    np.max(abs(qcal[1:]))))}, 'results': []}
    for name in args.names:
        start = time.monotonic()
        f0, g0 = old.responses(name,z0,W0,N0,pars)
        f,g = old.responses(name,z,W,N,pars)
        pf,pg = z0.conj().T@f0/len(z0),z0.conj().T@g0/len(z0)
        qf,qg = b0.conj().T@f0/len(z0),b0.conj().T@g0/len(z0)
        Tf,Tg = z@pf-eps*(b@qf),z@pg-eps*(b@qg)
        feature_extra = {'image_scores':False} if 'image_scores' in inspect.signature(old.features).parameters else {}
        A = old.features(f,Tg,z,N,args.enrich,args.sharp,**feature_extra)
        B = old.features(g,Tf,z,N,args.enrich,args.sharp,**feature_extra)
        vals = np.concatenate([f[:,None]*A,g[:,None]*B],axis=1)
        G = vals.conj().T@vals/n
        X = z.conj().T@vals/n
        r = A.shape[1]
        Df = A.T@(abs(Tg)[:,None]*A)/n
        Dg = B.T@(abs(Tf)[:,None]*B)/n
        Dfs = A.T@((f.conj()*Tg).real[:,None]*A)/n
        Dgs = B.T@((g.conj()*Tf).real[:,None]*B)/n
        entry = {'name': name,
            'payoff': float(np.mean((f.conj()*Tg).real)),
            'fit_payoff': float(np.vdot(pf,pg).real-eps*np.vdot(qf,qg).real),
            'observables': {'G_real':G.real.tolist(),'G_imag':G.imag.tolist(),
                'X_real':X.real.tolist(),'X_imag':X.imag.tolist(),
                'Df':Df.tolist(),'Dg':Dg.tolist(),
                'Df_signed':Dfs.tolist(),'Dg_signed':Dgs.tolist()}}
        for signed,df,dg in [(False,Df,Dg),(True,Dfs,Dgs)]:
            key = 'signed' if signed else 'positive'
            re = completion(df,dg,G,X[:1],eps,False)
            co = completion(df,dg,G,X[:1],eps,True)
            entry[key] = {'real':re,'complex':co,
                'complex_reduction': re['best_min_eigenvalue']-
                                     co['best_min_eigenvalue']}
        entry['seconds'] = time.monotonic()-start
        output['results'].append(entry)
        args.out.parent.mkdir(parents=True,exist_ok=True)
        args.out.write_text(json.dumps(output,indent=2)+'\n')
        print(json.dumps({k:v for k,v in entry.items()
            if k not in ['observables','positive','signed']} | {
                key:{'real':entry[key]['real']['best_min_eigenvalue'],
                     'complex':entry[key]['complex']['best_min_eigenvalue'],
                     'reduction':entry[key]['complex_reduction']}
                for key in ['positive','signed']}),flush=True)


if __name__ == '__main__':
    main()
