#!/usr/bin/env python3
"""Discovery only: common response Gram completion on actual named responses.

Run costly jobs on ssh yo. QMC fits/evaluations are independent. No integration
error enclosure or endpoint certificate is asserted. W is a proper charge-one
Gaussian of original degree 3; N is real neutral Gaussian of original degree 2.
They are graded limits, not extra first-chaos coordinates.
"""
import argparse
import json
import time
from pathlib import Path

import numpy as np
from scipy.special import ndtri, roots_laguerre, i0e, i1e
from scipy.optimize import root
from scipy.stats import qmc


def sample(power, seed):
    a = ndtri(qmc.Sobol(9, scramble=True, seed=seed).random_base2(power))
    z = (a[:, :6:2] + 1j * a[:, 1:6:2]) / np.sqrt(2)
    W = (a[:, 6] + 1j * a[:, 7]) / np.sqrt(2)
    N = a[:, 8]
    return z, W, N


def basis(z, W, N):
    terms = []
    for i in range(3):
        for j in range(i, 3):
            for k in range(3):
                a = z[:, i] * z[:, j] * z[:, k].conj()
                if i == k:
                    a = a - z[:, j]
                if j == k:
                    a = a - z[:, i]
                terms.append(a / np.sqrt(1 + (i == j)))
    terms += [z[:, j] * N for j in range(3)] + [W]
    return np.column_stack(terms)


def contact(eps):
    T, w = roots_laguerre(192)
    def equations(a):
        ell, beta, v = a
        if v <= 0:
            return [100, 100, 100]
        R = np.sqrt(T) * (ell + beta*(T-2))
        x = R*R/(2*v)
        deriv = np.sqrt(np.pi)*R/(2*np.sqrt(v))*(i0e(x)+i1e(x))
        K = np.sqrt(np.pi/v)*i0e(x)
        return [ell-w@(np.sqrt(T)*deriv),
                np.sqrt(2)*beta+eps/np.sqrt(2)*(w@(np.sqrt(T)*(T-2)*deriv)),
                w@K-2/eps]
    ans = root(equations, [0.85, 0.14, 0.04], tol=1e-10)
    if not ans.success or max(abs(np.array(equations(ans.x)))) > 1e-7:
        raise ValueError(('contact fit failed', ans.message, ans.x))
    return ans.x


def responses(name, z, W, N, pars):
    Z, X, Y = z.T
    HX = X * (abs(X) ** 2 - 2) / np.sqrt(2)
    HY = Y * (abs(Y) ** 2 - 2) / np.sqrt(2)
    coupling = 0.03 * Z * (abs(X) ** 2 - 1)
    if name == 'diffuse-grade3':
        G = np.sqrt(pars[2]) * W
    elif name == 'diffuse-overlap':
        G = np.sqrt(pars[2] - 0.0001) * W + 0.01 * Z * (abs(X) ** 2 - 1)
    elif name == 'shared-Wick':
        G = 0.17 * HX + coupling
    elif name == 'independent-Wick':
        G = 0.17 * HY + coupling
    elif name == 'shared-grade2':
        G = 0.17 * X * N + coupling
    elif name == 'mixed-square':
        G = 0.17 * X ** 2 * Y.conj() / np.sqrt(2)
    elif name == 'cycle':
        G = 0.17 * (Z ** 2 * X.conj() + X ** 2 * Y.conj() + Y ** 2 * Z.conj()) / np.sqrt(6)
    else:
        raise ValueError(name)
    L = Z * (pars[0] + pars[1] * (abs(Z) ** 2 - 2))
    return [(L + G) / np.maximum(abs(L + G), 1e-300),
            (L - G) / np.maximum(abs(L - G), 1e-300)]


def features(f, Tg, z, N, enrich, sharp, image_scores):
    clip, reg = (32, .002) if sharp else (2, .1)
    if image_scores:
        f = Tg / np.maximum(abs(Tg), 1e-300)
    score = f.conj()[:, None] * z / (abs(Tg)[:, None] + reg)
    A = np.concatenate([np.clip(score.real, -clip, clip),
                        np.clip(score.imag, -clip, clip)], axis=1)
    if enrich:
        neutral = np.clip(abs(z[:, 0]) ** 2 - 1, -2, 2) / 2
        shared = np.clip(N, -2, 2) / 2
        A = np.concatenate([A, A * neutral[:, None], A * shared[:, None]], axis=1)
    # Constant normalization in the sharp run preserves the reciprocal score
    # away from clipping. Both rules obey the declared pointwise unit budget.
    A = A/(clip*np.sqrt(A.shape[1])) if sharp else A / np.maximum(1, np.linalg.norm(A, axis=1))[:, None]
    if image_scores:
        A = A*np.sqrt(abs(Tg)/(abs(Tg)+.01))[:,None]
    return A


def completion(Df, Dg, G, X, eps):
    """Optimize over ALL missing projection Grams, not one assigned completion."""
    import cvxpy as cp
    r = Df.shape[0]
    known = (X.conj().T @ X).real
    V = (G - known + (G - known).T) / 2
    mineig = np.linalg.eigvalsh(V)[0]
    # Discovery regularization only; explicitly record it and enlarge the body.
    pad = max(0, -mineig) + 1e-10
    V = V + pad * np.eye(2 * r)
    K = cp.Variable((2 * r, 2 * r), symmetric=True)
    t = cp.Variable()
    C = known[:r, r:] + K[:r, r:]
    H = cp.bmat([[Df, eps * C], [eps * C.T, Dg]])
    prob = cp.Problem(cp.Maximize(t), [K >> 0, V - K >> 0, H - t * np.eye(2*r) >> 0])
    prob.solve(solver='CLARABEL', tol_gap_abs=1e-8, tol_feas=1e-8,
               tol_gap_rel=1e-8, max_iter=150)
    kv = K.value
    cv = known[:r, r:] + kv[:r, r:]
    hv = np.block([[Df, eps*cv], [eps*cv.T, Dg]])
    return {'status': prob.status, 'best_min_eigenvalue': prob.value,
            'moment_body_pad': pad, 'raw_residual_min_eigenvalue': mineig,
            'witness_min_eigenvalues': {'K': float(np.linalg.eigvalsh(kv)[0]),
                'V_minus_K': float(np.linalg.eigvalsh(V-kv)[0]),
                'H_minus_tI': float(np.linalg.eigvalsh(hv-prob.value*np.eye(2*r))[0])},
            'surviving_K': kv.tolist()}


def main():
    p = argparse.ArgumentParser()
    p.add_argument('--out', type=Path, required=True)
    p.add_argument('--fit-power', type=int, default=17)
    p.add_argument('--eval-power', type=int, default=18)
    p.add_argument('--replicate', type=int, default=0)
    p.add_argument('--sharp', action='store_true')
    p.add_argument('--image-scores', action='store_true')
    args = p.parse_args()
    eps = 149 / 200
    pars = contact(eps)
    z0, W0, N0 = sample(args.fit_power, 11 + 100 * args.replicate)
    z, W, N = sample(args.eval_power, 23 + 100 * args.replicate)
    b0, b = basis(z0, W0, N0), basis(z, W, N)
    n = len(z)
    fcal = z[:, 0]/abs(z[:, 0])
    pcal, qcal = z.conj().T@fcal/n, b.conj().T@fcal/n
    calibration = {'phase_Z_first_error': float(abs(pcal[0]-np.sqrt(np.pi)/2)),
        'phase_Z_cubic_error': float(abs(qcal[0]+np.sqrt(np.pi)/(4*np.sqrt(2)))),
        'max_off_target_coefficient': float(max(np.max(abs(pcal[1:])), np.max(abs(qcal[1:]))))}
    print(json.dumps({'contact': pars.tolist(), 'calibration': calibration}), flush=True)
    results = []
    for name in ['diffuse-grade3', 'diffuse-overlap', 'shared-Wick',
                 'independent-Wick', 'shared-grade2', 'mixed-square', 'cycle']:
        start = time.monotonic()
        f0, g0 = responses(name, z0, W0, N0, pars)
        f, g = responses(name, z, W, N, pars)
        pf, pg = z0.conj().T @ f0 / len(z0), z0.conj().T @ g0 / len(z0)
        qf, qg = b0.conj().T @ f0 / len(z0), b0.conj().T @ g0 / len(z0)
        Tf, Tg = z @ pf - eps * (b @ qf), z @ pg - eps * (b @ qg)
        # Independent estimate of the bilinear payoff using fit on one branch.
        J = np.mean((f.conj() * Tg).real)
        entry = {'name': name, 'payoff': float(J), 'fit_payoff': float(
            np.vdot(pf, pg).real - eps*np.vdot(qf, qg).real), 'features': []}
        for enrich in [False, True]:
            A = features(f, Tg, z, N, enrich, args.sharp, args.image_scores)
            B = features(g, Tf, z, N, enrich, args.sharp, args.image_scores)
            fa, gb = f[:, None] * A, g[:, None] * B
            allv = np.concatenate([fa, gb], axis=1)
            X = z.conj().T @ allv / n
            G = (allv.conj().T @ allv).real / n
            r = A.shape[1]
            Df = (A.T @ (abs(Tg)[:, None] * A)) / n
            Dg = (B.T @ (abs(Tf)[:, None] * B)) / n
            Dfs = (A.T @ ((f.conj()*Tg).real[:, None] * A)) / n
            Dgs = (B.T @ ((g.conj()*Tf).real[:, None] * B)) / n
            C = (X[:, :r].conj().T @ X[:, r:]).real
            H = np.block([[Df, eps*C], [eps*C.T, Dg]])
            actual_min = np.linalg.eigvalsh(H)[0]
            measured = (X[:1].conj().T@X[:1]).real
            Kactual = (X[1:].conj().T@X[1:]).real
            actual_budget_min = np.linalg.eigvalsh(G-measured-Kactual)[0]
            # Measured visible Z only. All other first-chaos directions are free
            # in the completion SDP, with one shared Gram budget.
            lifted = completion(Df, Dg, G, X[:1], eps)
            signed_lifted = completion(Dfs, Dgs, G, X[:1], eps)
            phg = Tg/np.maximum(abs(Tg),1e-300)
            phf = Tf/np.maximum(abs(Tf),1e-300)
            surrogate = np.concatenate([phg[:,None]*A,phf[:,None]*B],axis=1)
            Gsur = (surrogate.conj().T@surrogate).real/n
            Xsur = z.conj().T@surrogate/n
            Csur = (Xsur[:,:r].conj().T@Xsur[:,r:]).real
            alignment = {'weighted_f':float(np.mean(abs(Tg)*abs(f-phg)**2)),
                'weighted_g':float(np.mean(abs(Tf)*abs(g-phf)**2)),
                'tuple_squared_error':float(np.mean(np.sum(abs(allv-surrogate)**2,axis=1))),
                'gram_operator_difference':float(np.linalg.norm(G-Gsur,2)),
                'cross_operator_difference':float(np.linalg.norm(C-Csur,2))}
            entry['features'].append({'enriched': enrich, 'count_per_branch': r,
                'actual_min_eigenvalue': float(actual_min),
                'actual_gram_budget_min_eigenvalue': float(actual_budget_min),
                'suggested_gap_lower_bound': float(max(0, -actual_min)**2 /
                    (16*(13/4+3*eps))), 'completion': lifted,
                'signed_actual_min_eigenvalue': float(np.linalg.eigvalsh(
                    np.block([[Dfs, eps*C], [eps*C.T, Dgs]]))[0]),
                'signed_completion': signed_lifted,
                'observables': {'Df': Df.tolist(), 'Dg': Dg.tolist(),
                    'Df_signed': Dfs.tolist(), 'Dg_signed': Dgs.tolist(),
                    'G': G.tolist(), 'measured_Gram': measured.tolist(),
                    'actual_missing_Gram': Kactual.tolist()},'alignment':alignment})
        entry['seconds'] = time.monotonic() - start
        results.append(entry)
        print(json.dumps({'name': name, 'payoff': float(J), 'features': [
            {'enriched': e['enriched'], 'actual_min': e['actual_min_eigenvalue'],
             'completion_min': e['completion']['best_min_eigenvalue'],
             'signed_actual_min': e['signed_actual_min_eigenvalue'],
             'signed_completion_min': e['signed_completion']['best_min_eigenvalue']}
            for e in entry['features']], 'seconds': entry['seconds']}), flush=True)
        args.out.write_text(json.dumps({'status': 'FLOAT DISCOVERY ONLY; no quadrature enclosure',
            'epsilon': '149/200', 'fit_power': args.fit_power,
            'eval_power': args.eval_power, 'replicate': args.replicate,
            'sharp': args.sharp, 'contact_parameters': pars.tolist(),
            'image_scores':args.image_scores,'image_cutoff':'.01' if args.image_scores else None,
            'calibration': calibration,
            'definitions': __doc__, 'results': results}, indent=2) + '\n')


if __name__ == '__main__':
    main()
