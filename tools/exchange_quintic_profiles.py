#!/usr/bin/env python3
"""Numerical two-parameter phase-family column exchange; no global claims.

For actual normalized-G profiles phase(Z+cH+bG), mirror b for the second
response. Each column is the diffuse-limit (p,s3,s5), with s5 determined
by the separate exact original-chaos finite-envelope identity. All column
moments/derivatives use adaptive 1D Bessel integration. A finite bank LP is
exactly solved numerically; bounded multistart L-BFGS-B is only a discovery
oracle. Output rational profiles require independent Arb replay and finite
exact cancellation before becoming a genuine witness-method ceiling.
"""
import argparse
from fractions import Fraction as Q
from functools import lru_cache
import hashlib
import json
from pathlib import Path
import time

import numpy as np
from scipy.integrate import quad_vec
from scipy.optimize import linprog, minimize
from scipy.special import i0e, i1e

ROOT2, ROOT3, K = np.sqrt(2.), np.sqrt(3.), np.sqrt(np.pi)/2


@lru_cache(maxsize=10000)
def column(c, b):
    def fn(r):
        root = np.sqrt(r)
        t = root*(1+c*(r-2)/ROOT2)/b
        x = t*t/2
        I0, I1 = i0e(x), i1e(x)
        psi, zeta, chi = K*t*(I0+I1), K*I0, -K*I1
        dpsi, dzeta = K*(I0-I1), -t*K*(I0-I1)
        ratio = I1/x if x > 1e-6 else .5-.5*x+5*x*x/16-7*x**3/48
        dchi = -K*t*(I0-I1-ratio)
        v = np.array([root*psi, root*(r-2)/ROOT2*psi, zeta,
                      root*(r*r-6*r+6)/(2*ROOT3)*psi,
                      (r-1)*zeta, r/ROOT2*chi])
        dv = np.array([root*dpsi, root*(r-2)/ROOT2*dpsi, dzeta,
                       root*(r*r-6*r+6)/(2*ROOT3)*dpsi,
                       (r-1)*dzeta, r/ROOT2*dchi])
        return np.exp(-r)*np.array([v, dv*root*(r-2)/(ROOT2*b), dv*(-t/b)])
    result, error = quad_vec(fn, 0, np.inf, epsabs=3e-11, epsrel=3e-11)
    moments, derivatives = result[0], result[1:].T
    a, h, q, v, A, B = moments
    coefficients = np.array([a*a, h*h-q*q, v*v-A*A-B*B])
    jacobian = np.array([2*a*derivatives[0],
                         2*h*derivatives[1]-2*q*derivatives[2],
                         2*v*derivatives[3]-2*A*derivatives[4]-2*B*derivatives[5]])
    return coefficients, jacobian, moments, float(error)


def profile(c, b, denominator=10**8):
    cq, bq = Q(round(float(c)*denominator), denominator), Q(round(float(b)*denominator), denominator)
    r, _, m, error = column(float(cq), float(bq))
    return {'kind': 'normalized_G_phase', 'c': str(cq), 'b': str(bq),
            'column_p_s3_s5': r.tolist(), 'moments': m.tolist(),
            'quadrature_error_estimate': error}


def master(bank, eps_bounds, gamma_bounds):
    matrix = np.array([r['column_p_s3_s5'] for r in bank])
    answer = linprog([0, 0, 1], A_ub=np.c_[-matrix[:, 1], matrix[:, 2], -np.ones(len(bank))],
                     b_ub=-matrix[:, 0], bounds=[eps_bounds, gamma_bounds, (None, None)],
                     method='highs', options={'dual_feasibility_tolerance': 1e-10,
                                             'primal_feasibility_tolerance': 1e-10})
    if not answer.success:
        raise ArithmeticError(answer.message)
    return answer


def cancellation(bank):
    matrix = np.array([r['column_p_s3_s5'] for r in bank])
    answer = linprog(-matrix[:, 0], A_eq=np.vstack([np.ones(len(bank)), matrix[:, 1], matrix[:, 2]]),
                     b_eq=[1, 0, 0], bounds=[(0, None)]*len(bank), method='highs',
                     options={'dual_feasibility_tolerance': 1e-10,
                              'primal_feasibility_tolerance': 1e-10})
    if not answer.success:
        return {'status': answer.message}
    active = [{'weight': float(w), 'profile': row} for w, row in zip(answer.x, bank) if w > 1e-8]
    return {'status': 'NUMERICAL', 'floor': float(-answer.fun),
            'reciprocal_ceiling': float(-1/answer.fun), 'active_profiles': active,
            'equality_residual': (np.vstack([np.ones(len(bank)), matrix[:, 1], matrix[:, 2]])@answer.x-[1, 0, 0]).tolist()}


def oracle(eps, gamma, seeds, bounds):
    prices = np.array([1, -eps, gamma])
    def objective(x):
        r, jac, _, _ = column(float(x[0]), float(x[1]))
        return -float(prices@r), -(prices@jac)
    results = []
    for seed in seeds:
        ans = minimize(objective, seed, jac=True, bounds=bounds, method='L-BFGS-B',
                       options={'ftol': 1e-13, 'gtol': 2e-9, 'maxiter': 150, 'maxls': 30})
        results.append({'c': float(ans.x[0]), 'b': float(ans.x[1]),
                        'payoff': float(-ans.fun), 'success': bool(ans.success),
                        'message': ans.message, 'iterations': int(ans.nit),
                        'gradient': ans.jac.tolist()})
    return max(results, key=lambda r: r['payoff']), results


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--out', type=Path, required=True)
    parser.add_argument('--iterations', type=int, default=10)
    parser.add_argument('--epsilon-bounds', nargs=2, type=float, default=[.7, .95])
    parser.add_argument('--gamma-bounds', nargs=2, type=float, default=[0, .5])
    args = parser.parse_args()
    started = time.monotonic()
    bank = [{'kind': 'phase_Z', 'column_p_s3_s5': [np.pi/4, np.pi/32, 3*np.pi/256]},
            {'kind': 'phase_G_mirror', 'column_p_s3_s5': [0, -np.pi/4, 0]}]
    for c in [0, .15, .24, .35, .5]:
        for b in [.05, .15, .24, .35, .6]:
            bank.append(profile(c, b))
    bank += [profile(.239246, .239246), profile(.239248, .239248), profile(.239236, .239349)]
    history = []
    oracle_bounds = [(-1, 1.5), (.01, 3)]
    for iteration in range(args.iterations):
        solution = master(bank, args.epsilon_bounds, args.gamma_bounds)
        eps, gamma, B = solution.x
        ranked = sorted([r for r in bank if r['kind'] == 'normalized_G_phase'],
                        key=lambda row: np.dot([1, -eps, gamma], row['column_p_s3_s5']), reverse=True)
        seeds = [(float(Q(r['c'])), float(Q(r['b']))) for r in ranked[:2]]
        seeds += [(.24, .24), (.2, .5), (-.2, .3), (.85, .15)]
        best, results = oracle(eps, gamma, seeds, oracle_bounds)
        row = profile(best['c'], best['b'])
        gap = best['payoff']-B
        entry = {'iteration': iteration, 'epsilon': float(eps), 'gamma': float(gamma),
                 'bank_master_value': float(B), 'best_discovered_payoff': best['payoff'],
                 'discovered_gap': float(gap), 'new_profile': row, 'oracle_starts': results}
        history.append(entry)
        print(json.dumps({k: entry[k] for k in ['iteration', 'epsilon', 'gamma', 'bank_master_value', 'best_discovered_payoff', 'discovered_gap']}), flush=True)
        bank.append(row)
        if gap < 2e-10:
            break
    final = master(bank, args.epsilon_bounds, args.gamma_bounds)
    result = {'status': 'NUMERICAL_DISCOVERY', 'scope': __doc__, 'oracle_parameter_box': oracle_bounds,
              'master_epsilon_bounds': args.epsilon_bounds, 'master_gamma_bounds': args.gamma_bounds,
              'final_epsilon_gamma_bank_value': final.x.tolist(), 'cancellation': cancellation(bank),
              'history': history, 'columns': bank, 'seconds': time.monotonic()-started,
              'source_sha256': hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
    args.out.write_text(json.dumps(result, indent=2)+'\n')
    print(json.dumps({'final': final.x.tolist(), 'cancellation': result['cancellation'], 'seconds': result['seconds']}, indent=2), flush=True)


if __name__ == '__main__':
    main()
