#!/usr/bin/env python3
"""Numerical separation in the six-feature diffuse quintic response family.

Every frozen phase is an actual finite Gaussian response after substituting
G=sqrt(m(m+1))*q_m/RX. The separate Mehler proof bounds the finite error.
QMC errors here are NOT certified. No norm upper bound, optimum, or new
Grothendieck endpoint follows from an exchange LP or alternating search.
Reported real spectra refer to the equal mixture of each response pair
with its conjugation-reflected pair. This is a realizable kernel mixture.
"""
import argparse
import hashlib
import json
from pathlib import Path
import time

import numpy as np
from scipy.optimize import linprog
from scipy.stats import qmc


def phase(z):
    # The zero value preserves charge-one equivariance for every circuit.
    return np.divide(z, abs(z), out=np.zeros_like(z), where=abs(z) > 0)


def features(logn, seed):
    u = qmc.Sobol(3, scramble=True, seed=seed).random_base2(logn)
    u = np.clip(u, 2.0**-53, 1-2.0**-53)
    r, t = -np.log(u[:, 0]), -np.log(u[:, 1])
    z = np.sqrt(r).astype(complex)
    g = np.sqrt(t)*np.exp(2j*np.pi*u[:, 2])
    return np.array([z, z*(r-2)/np.sqrt(2), g,
                     z*(r*r-6*r+6)/np.sqrt(12),
                     (r-1)*g, z*z*g.conj()/np.sqrt(2)])


def coefficient(phi, f):
    return phi.conj()@f/phi.shape[1]


def packed(v):
    return [[float(a.real), float(a.imag)] for a in v]


def unpacked(v):
    return np.array([complex(*a) for a in v])


def known_phase_z():
    return np.array([np.sqrt(np.pi)/2, -np.sqrt(np.pi)/(4*np.sqrt(2)),
                     0, np.sqrt(3*np.pi)/16, 0, 0])


def grouped(cf, cg):
    return np.array([np.vdot(cf[:1], cg[:1]).real,
                     np.vdot(cf[1:3], cg[1:3]).real,
                     np.vdot(cf[3:], cg[3:]).real])


def evaluate(phi, record):
    vf, vg = unpacked(record['f_numerator']), unpacked(record['g_numerator'])
    f, g = phase(vf@phi), phase(vg@phi)
    cf, cg = coefficient(phi, f), coefficient(phi, g)
    axis = vf[0]+vg[0]
    orient = axis/abs(axis) if abs(axis) > 0 else 1
    known, pz = known_phase_z(), phase(phi[0])
    cfc = known+coefficient(phi, orient.conjugate()*f-pz)
    cgc = known+coefficient(phi, orient.conjugate()*g-pz)
    return {'raw_column_p_s3_s5': grouped(cf, cg).tolist(),
            'control_column_p_s3_s5': grouped(cfc, cgc).tolist(),
            'f_coefficients': packed(cfc), 'g_coefficients': packed(cgc),
            'endpoint_correlation': float(np.mean(f.conj()*g).real)}


def iterate(phi, eps, gamma, start, maxiter):
    diagonal = np.array([1, -eps, -eps, gamma, gamma, gamma])
    cg = coefficient(phi, phase(start@phi))
    previous = -np.inf
    for iteration in range(maxiter):
        vf = diagonal*cg
        cf = coefficient(phi, phase(vf@phi))
        vg = diagonal*cf
        cg = coefficient(phi, phase(vg@phi))
        score = float(np.vdot(cf, diagonal*cg).real)
        if score < previous-1e-10:
            raise ArithmeticError('Discrete best-response payoff decreased')
        if score-previous < 1e-11:
            break
        previous = score
    record = {'epsilon': eps, 'gamma': gamma, 'iterations': iteration+1,
              'f_numerator': packed(vf), 'g_numerator': packed(vg),
              'discrete_score': score}
    record.update(evaluate(phi, record))
    return record


def oracle(phi, eps, gamma, starts, maxiter, rng, warm):
    vectors = [np.array([1, 0, 0, 0, 0, 0], complex),
               np.array([1, .239247, -.239247, 0, 0, 0], complex)]
    vectors += [unpacked(r['g_numerator']) for r in warm[:2]]
    while len(vectors) < starts:
        v = .2*(rng.standard_normal(6)+1j*rng.standard_normal(6))
        v[0] += 1
        vectors.append(v)
    records = [iterate(phi, eps, gamma, v, maxiter) for v in vectors]
    return sorted(records, key=lambda r: -r['discrete_score'])[:3]


def master(columns, eps_bounds, gamma_bounds):
    # Each real part and its negative are actual signed response payoffs.
    rows = []
    rhs = []
    for p, s3, s5 in columns:
        for sign in [1, -1]:
            rows.append([-sign*s3, sign*s5, -1])
            rhs.append(-sign*p)
    ans = linprog([0, 0, 1], A_ub=rows, b_ub=rhs,
                  bounds=[eps_bounds, gamma_bounds, (0, None)], method='highs')
    if not ans.success:
        raise ArithmeticError(ans.message)
    return ans


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--out', type=Path, required=True)
    parser.add_argument('--discovery-logn', type=int, default=15)
    parser.add_argument('--holdout-logn', type=int, default=19)
    parser.add_argument('--holdout-scrambles', type=int, default=3)
    parser.add_argument('--starts', type=int, default=8)
    parser.add_argument('--maxiter', type=int, default=120)
    parser.add_argument('--exchanges', type=int, default=8)
    args = parser.parse_args()
    if min(args.starts, args.maxiter, args.exchanges, args.holdout_scrambles) < 1:
        raise ValueError('Positive search limits are required')
    started = time.monotonic()
    phi = features(args.discovery_logn, 9312026)
    rng = np.random.default_rng(1191026)
    eps_bounds, gamma_bounds = (.65, 1.), (0., .6)
    pz = known_phase_z()
    columns = [grouped(pz, pz).tolist()]
    records, history, warm = [], [], []
    for eps, gamma in [(.7564, 0), (.78, .05), (.82, .15), (.9, .35)]:
        found = oracle(phi, eps, gamma, args.starts, args.maxiter, rng, warm)
        records += found
        columns += [r['control_column_p_s3_s5'] for r in found]
        warm = found
    for iteration in range(args.exchanges):
        lp = master(columns, eps_bounds, gamma_bounds)
        eps, gamma, floor = map(float, lp.x)
        found = oracle(phi, eps, gamma, args.starts, args.maxiter, rng, warm)
        discovered = max(np.dot(r['control_column_p_s3_s5'], [1, -eps, gamma]) for r in found)
        history.append({'iteration': iteration, 'epsilon': eps, 'gamma': gamma,
                        'finite_bank_LP_value': floor, 'oracle_value': float(discovered),
                        'gap': float(discovered-floor)})
        records += found
        columns += [r['control_column_p_s3_s5'] for r in found]
        warm = found
        if iteration >= 3 and discovered-floor < 2e-6:
            break
    lp = master(columns, eps_bounds, gamma_bounds)
    eps, gamma, floor = map(float, lp.x)
    ranked = sorted(records, key=lambda r: -np.dot(r['control_column_p_s3_s5'], [1, -eps, gamma]))
    # A small, diverse frozen bank, chosen only using discovery information.
    frozen = []
    for r in ranked:
        if all(np.linalg.norm(np.array(r['control_column_p_s3_s5'])
                              -np.array(q['control_column_p_s3_s5'])) > 2e-5 for q in frozen):
            frozen.append(r)
        if len(frozen) == 6:
            break
    if not frozen:
        raise ArithmeticError('No frozen response was generated')
    holdouts = []
    phase_z_column = grouped(known_phase_z(), known_phase_z())
    phase_z_score = float(np.dot(phase_z_column, [1, -eps, gamma]))
    for j in range(args.holdout_scrambles):
        test = features(args.holdout_logn, 7102026+j)
        evaluations = [evaluate(test, r) for r in frozen]
        for r in evaluations:
            r['raw_score'] = float(np.dot(r['raw_column_p_s3_s5'], [1, -eps, gamma]))
            r['control_score'] = float(np.dot(r['control_column_p_s3_s5'], [1, -eps, gamma]))
        holdouts.append({'seed': 7102026+j,
                         'analytic_phaseZ_score': phase_z_score,
                         'bank_max_including_phaseZ': max(phase_z_score,
                             max(r['control_score'] for r in evaluations)),
                         'Gram_max_error': float(np.max(abs(test.conj()@test.T/test.shape[1]-np.eye(6)))),
                         'frozen_evaluations': evaluations})
    dual = []
    for row, marginal in enumerate(lp.ineqlin.marginals):
        if -marginal > 1e-7:
            dual.append({'column_index': row//2, 'sign': 1 if row % 2 == 0 else -1,
                         'record_index': None if row//2 == 0 else row//2-1,
                         'weight': float(-marginal), 'column': columns[row//2]})
    output = {'status': 'NUMERICAL_ONLY', 'scope': __doc__,
              'source_sha256': hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
              'feature_order': ['Z', 'H21(Z)', 'G', 'H32(Z)', '(RZ-1)G', 'Z^2 barG/sqrt2'],
              'parameters': vars(args) | {'out': str(args.out)},
              'epsilon': eps, 'gamma': gamma, 'master_value': floor,
              'analytic_phaseZ_expression': 'pi/4-epsilon*pi/32+gamma*3*pi/256',
              'analytic_phaseZ_score': phase_z_score,
              'reciprocal_master_diagnostic': 1/floor, 'parameter_bounds': [eps_bounds, gamma_bounds],
              'exchange_history': history, 'dual_support': dual,
              'discovery_records': records,
              'frozen_records': frozen, 'holdouts': holdouts,
              'finite_bridge': '|J_m-J_limit| <= |epsilon|/(m+1)+4|gamma|/m for m>=2, from the separate exact Mehler proof. QMC errors are additional and uncertified.',
              'seconds': time.monotonic()-started}
    args.out.write_text(json.dumps(output, indent=2)+'\n')
    print(json.dumps({'status': output['status'], 'epsilon': eps, 'gamma': gamma,
                      'master_value': floor, 'reciprocal_diagnostic': 1/floor,
                      'nonlinear_holdout_maxima': [max(r['control_score'] for r in h['frozen_evaluations']) for h in holdouts],
                      'bank_maxima_including_phaseZ': [h['bank_max_including_phaseZ'] for h in holdouts],
                      'seconds': output['seconds']}, indent=2), flush=True)


if __name__ == '__main__':
    main()
