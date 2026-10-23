#!/usr/bin/env python3
"""Actual Gaussian q_m invariant-family best-response calibration.

Numerical QMC evidence only: no endpoint, global-optimality, or rigorous
integration claim. Full U(m) representation theory supplies the exact
five-feature projection formula; this script uses its coupled scalar law.
Discovery coefficients are frozen before independent Sobol holdout scrambles.
"""
import argparse
import json
from pathlib import Path
import time

import numpy as np
from scipy.special import gammaincinv
from scipy.stats import qmc


def phase(z):
    return np.divide(z, np.abs(z), out=np.ones_like(z), where=np.abs(z) > 0)


def sample_features(m, logn, seed):
    d = m*(m+1)//2
    u = qmc.Sobol(6, scramble=True, seed=seed).random_base2(logn)
    u = np.clip(u, 2.0**-53, 1.0-2.0**-53)
    z = np.sqrt(-np.log(u[:, 0]))*np.exp(2j*np.pi*u[:, 1])
    g = np.sqrt(-np.log(u[:, 2]))*np.exp(2j*np.pi*u[:, 3])
    rx = gammaincinv(m, u[:, 4])
    v = gammaincinv(d-1, u[:, 5]) if d > 1 else np.zeros(len(u))
    ry = np.abs(g)**2+v  # Essential: AY and q share this SAME g.
    ax, ay = (rx-m)/np.sqrt(m), (ry-d)/np.sqrt(d)
    q = rx*g/np.sqrt(m*(m+1))
    return np.array([z, z*(np.abs(z)**2-2)/np.sqrt(2), z*ax, z*ay, q])


def sample_features_reduced(m, logn, seed):
    """Exact for charge-one linear-feature phases and their moment products.

    The common phase of Z and G cancels from bar(Phi)*phase(v.Phi).
    Keep their relative phase, and integrate the common angle out exactly.
    """
    d = m*(m+1)//2
    u = qmc.Sobol(5, scramble=True, seed=seed).random_base2(logn)
    u = np.clip(u, 2.0**-53, 1.0-2.0**-53)
    rz, rg = -np.log(u[:, 0]), -np.log(u[:, 1])
    z = np.sqrt(rz).astype(complex)
    g = np.sqrt(rg)*np.exp(2j*np.pi*u[:, 2])
    rx = gammaincinv(m, u[:, 3])
    v = gammaincinv(d-1, u[:, 4]) if d > 1 else np.zeros(len(u))
    ax, ay = (rx-m)/np.sqrt(m), (rg+v-d)/np.sqrt(d)
    q = rx*g/np.sqrt(m*(m+1))
    return np.array([z, z*(rz-2)/np.sqrt(2), z*ax, z*ay, q])


def coefficient(features, response):
    return (features.conj()@response)/features.shape[1]


def packed(v):
    return [[float(z.real), float(z.imag)] for z in v]


def iterate(features, diagonal, start, maxiter):
    g = phase(start@features)
    cg = coefficient(features, g)
    history = []
    old = -np.inf
    for iteration in range(maxiter):
        vf = diagonal*cg
        f = phase(vf@features)
        cf = coefficient(features, f)
        vg = diagonal*cf
        g = phase(vg@features)
        cg = coefficient(features, g)
        value = float(np.vdot(cf, diagonal*cg).real)
        history.append(value)
        if value < old-2e-12:
            raise ArithmeticError('Discrete alternating payoff decreased')
        if value-old < 5e-12:
            break
        old = value
    # Freeze BOTH actual polynomial phase numerators, rather than holdout
    # re-estimating a best response or fitting its coefficients again.
    f = phase(vf@features)
    g = phase(vg@features)
    cf, cg = coefficient(features, f), coefficient(features, g)
    tf, tg = diagonal*cf, diagonal*cg
    return {'value': float(np.vdot(cf, diagonal*cg).real),
            'iterations': len(history), 'history': history,
            'f_numerator': packed(vf), 'g_numerator': packed(vg),
            'f_coefficients': packed(cf), 'g_coefficients': packed(cg),
            'f_best_response_defect': float(np.mean(abs(tg@features))
                -np.vdot(cf, diagonal*cg).real),
            'g_best_response_defect': float(np.mean(abs(tf@features))
                -np.vdot(cf, diagonal*cg).real)}


def evaluate_frozen(features, record, diagonal, eps):
    vf = np.array([complex(*z) for z in record['f_numerator']])
    vg = np.array([complex(*z) for z in record['g_numerator']])
    f, g = phase(vf@features), phase(vg@features)
    cf, cg = coefficient(features, f), coefficient(features, g)
    ch, ck = (cf+cg)/2, (cf-cg)/2
    score = float(np.vdot(cf, diagonal*cg).real)
    pieces = [float(abs(ch[0])**2), float(-eps*np.vdot(ch[1:], ch[1:]).real),
              float(-abs(ck[0])**2), float(eps*np.vdot(ck[1:], ck[1:]).real)]
    # Exact known phase(Z) coefficient vector is a control variate, not an
    # assumption that the numerical Gram is exactly orthonormal. Its common
    # phase is frozen from the discovered numerators, never fit on holdout.
    orient = phase(np.array([vf[0]+vg[0]]))[0]
    phasez = phase(features[0])
    known = np.array([np.sqrt(np.pi)/2, -np.sqrt(np.pi)/(4*np.sqrt(2)), 0, 0, 0])
    cf_cv = known+coefficient(features, np.conj(orient)*f-phasez)
    cg_cv = known+coefficient(features, np.conj(orient)*g-phasez)
    score_cv = float(np.vdot(cf_cv, diagonal*cg_cv).real)
    return {'score': score, 'phaseZ_control_variate_score': score_cv,
            'control_variate_f_coefficients': packed(cf_cv),
            'control_variate_g_coefficients': packed(cg_cv),
            'f_coefficients': packed(cf), 'g_coefficients': packed(cg),
            'polarization_pieces': pieces, 'polarization_error': float(score-sum(pieces)),
            't': float(abs(ch[0])), 'remote_tau': float(abs(ck[4]))}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--m', type=int, nargs='+', default=[1, 16, 128])
    parser.add_argument('--discovery-logn', type=int, default=15)
    parser.add_argument('--holdout-logn', type=int, default=18)
    parser.add_argument('--holdout-scrambles', type=int, default=3)
    parser.add_argument('--starts', type=int, default=16)
    parser.add_argument('--maxiter', type=int, default=100)
    parser.add_argument('--epsilon', type=float, default=.745)
    parser.add_argument('--out', type=Path, required=True)
    parser.add_argument('--frozen', type=Path, help='Reuse existing numerator coefficients without fitting')
    parser.add_argument('--reduced-holdout', action='store_true')
    args = parser.parse_args()
    if any(m < 1 for m in args.m):
        raise ValueError('m must be positive')
    diagonal = np.array([1, -args.epsilon, -args.epsilon, -args.epsilon, -args.epsilon])
    calibration_exact = np.pi/4-args.epsilon*np.pi/32
    output = {'scope': __doc__, 'epsilon': args.epsilon,
              'feature_order': ['Z', 'H21(Z)', 'Z AX', 'Z AY', 'q_m'],
              'phaseZ_calibration_exact': calibration_exact, 'results': []}
    frozen = json.loads(args.frozen.read_text()) if args.frozen else None
    if frozen and (frozen['epsilon'] != args.epsilon or args.out.resolve() == args.frozen.resolve()):
        raise ValueError('Frozen epsilon must agree and output must be a different file')
    for m in args.m:
        started = time.monotonic()
        if frozen:
            previous = next(r for r in frozen['results'] if r['m'] == m)
            records, winners = previous['winners'], previous['winners']
            nstarts = previous['starts']
        else:
            features = sample_features(m, args.discovery_logn, 10101+m)
            rng = np.random.default_rng(2026+m)
            starts = [np.array([1, 0, 0, 0, 0], complex), np.array([0, 0, 0, 0, 1], complex)]
            for j in range(max(0, args.starts-2)):
                start = (rng.standard_normal(5)+1j*rng.standard_normal(5))
                if j % 3 == 0:
                    start *= .08
                    start[0] += 1
                elif j % 3 == 1:
                    start[0] += 1
                    start[1:4] *= .2
                starts.append(start)
            records = [iterate(features, diagonal, start, args.maxiter) for start in starts]
            order = np.argsort([-r['value'] for r in records])
            winners = [records[int(j)] for j in order[:min(3, len(records))]]
            nstarts = len(starts)
        result = {'m': m, 'remote_complex_coordinates': m+m*(m+1)//2,
                  'discovery_logN': args.discovery_logn, 'starts': nstarts,
                  'all_discovery_scores': [r['value'] for r in records],
                  'winners': winners, 'holdout_logN': args.holdout_logn,
                  'reduced_common_angle': args.reduced_holdout,
                  'frozen_source': str(args.frozen) if args.frozen else None,
                  'holdouts': []}
        for scramble in range(args.holdout_scrambles):
            seed = 700001+1000*m+scramble
            sampler = sample_features_reduced if args.reduced_holdout else sample_features
            holdout = sampler(m, args.holdout_logn, seed)
            gram = (holdout.conj()@holdout.T)/holdout.shape[1]
            phasez = phase(holdout[0])
            cz = coefficient(holdout, phasez)
            calibration = float(np.vdot(cz, diagonal*cz).real)
            result['holdouts'].append({'scramble_seed': seed,
                'orthonormal_Gram_max_error': float(np.max(abs(gram-np.eye(5)))),
                'phaseZ_calibration': calibration,
                'phaseZ_calibration_error': calibration-calibration_exact,
                'frozen_winners': [evaluate_frozen(holdout, r, diagonal, args.epsilon)
                                   for r in winners]})
        result['seconds'] = time.monotonic()-started
        output['results'].append(result)
        args.out.write_text(json.dumps(output, indent=2)+'\n')
        print(json.dumps({'m': m, 'best_discovery': winners[0]['value'],
            'frozen_best_holdouts': [h['frozen_winners'][0]['score'] for h in result['holdouts']],
            'phaseZ_control_variate_holdouts': [h['frozen_winners'][0]['phaseZ_control_variate_score']
                                               for h in result['holdouts']],
            'phaseZ_errors': [h['phaseZ_calibration_error'] for h in result['holdouts']],
            'seconds': result['seconds']}), flush=True)


if __name__ == '__main__':
    main()
