#!/usr/bin/env python3
"""Discover exact zero-penalty completions of the finite response lift.

CVXPY is used only to find completions. The saved rational coefficients are
rechecked without the optimizer by verify_response_lift.py. No endpoint claim.
"""
import argparse
from fractions import Fraction as Q
import hashlib
import json
from pathlib import Path
import sys
import time

import numpy as np
import cvxpy as cp
sys.path.insert(0, str(Path(__file__).resolve().parent))
from response_lift_model import (lengths, banks, response, energy, targets,
                                  check_completion, controls, RHO)


def run_case(target, order):
    sz = lengths(order)
    h = {a: cp.Variable(n, name='h_'+a) for a, n in sz.items()}
    k = {a: cp.Variable(n, name='k_'+a) for a, n in sz.items()}
    constraints = [h['m'][0] == float(Q(target['t'])),
                   k['b'][0] == float(Q(target['tau']))]
    eps, beta, tau = [float(Q(target[a])) for a in ['epsilon', 'beta', 'tau']]
    alpha = list(map(lambda s: float(Q(s)), target['gate_alpha']))
    # Fix zero cost exactly in discovery; all other displayed coefficients
    # remain free. This directly tests whether any positive recovery is possible.
    constraints += [h['m'][1] == -2*beta/eps, h['b'][0] == 0,
                    k['b'][1] == alpha[0]*tau, k['n'][0] == alpha[1]*tau]
    slack = cp.Variable(name='common_slack')
    constraints += [slack >= 0]
    for sign in [1, -1]:
        v = response(h, k, sign)
        terms = ([cp.square(x)/float(j+1) for j, x in enumerate(v['m'])]
                 +[cp.square(x) for x in v['b']]
                 +[cp.square(x)/float((j+1)*(j+2)//2) for j, x in enumerate(v['n'])])
        constraints.append(cp.sum(terms) <= 1-slack)
        for name, gout, gin, cross in banks(v, order):
            C = cp.bmat([[x for x in row] for row in cross])
            A = cp.bmat([[np.diag(list(map(float, gout))), C],
                         [C.T, np.diag(list(map(float, gin)))]])
            # Relative slack in the feature Gram metric, so rescaling a bank
            # does not change the strict-feasibility target.
            G = np.diag(list(map(float, gout+gin)))
            constraints.append(A-slack*G >> 0)
            start = order+1 if name in ['0', '1'] else 1
            Cr = C[:, start:]
            Gr = np.diag(list(map(float, gin[start:])))
            Ar = cp.bmat([[float(RHO*RHO)*np.diag(list(map(float, gout))), Cr], [Cr.T, Gr]])
            R = np.diag(list(map(float, [RHO*RHO*x for x in gout]+gin[start:])))
            constraints.append(Ar-slack*R >> 0)
    prob = cp.Problem(cp.Maximize(slack), constraints)
    prob.solve(solver='CLARABEL', tol_gap_abs=1e-10, tol_feas=1e-10,
               tol_gap_rel=1e-10, max_iter=300)
    if prob.status not in ['optimal', 'optimal_inaccurate']:
        return {'target': target, 'order': order, 'discovery_status': prob.status,
                'scope': 'No conclusion; infeasibility has not been certified.'}
    record = {'target': target, 'order': order, 'discovery_status': prob.status,
              'discovery_relative_slack': float(slack.value)}
    for digits in [7, 9, 11, 13]:
        for label, vv in [('h', h), ('k', k)]:
            record[label] = {a: [str(Q(round(float(x), digits)).limit_denominator(10**digits))
                                  for x in vv[a].value] for a in sz}
        # Restore every fixed coefficient as the source rational, never a float.
        record['h']['m'][0] = target['t']
        record['k']['b'][0] = target['tau']
        record['h']['m'][1] = str(-2*Q(target['beta'])/Q(target['epsilon']))
        record['h']['b'][0] = '0'
        record['k']['b'][1] = str(Q(target['gate_alpha'][0])*Q(target['tau']))
        record['k']['n'][0] = str(Q(target['gate_alpha'][1])*Q(target['tau']))
        try:
            record['exact_verification'] = check_completion(record)
            record['rationalization_digits'] = digits
            return record
        except ValueError:
            pass
    record['scope'] = 'Numerical candidate only; exact rationalization failed.'
    return record


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--audit', type=Path, required=True)
    p.add_argument('--output', type=Path, required=True)
    p.add_argument('--orders', default='1,2')
    p.add_argument('--indices', default='')
    args = p.parse_args()
    data = json.loads(args.audit.read_text())
    selected = data['selected']
    if args.indices:
        wanted = set(map(int, args.indices.split(',')))
        selected = [r for r in selected if r['index'] in wanted]
        if len(selected) != len(wanted):
            raise ValueError('Requested contact missing from source audit')
    out = {'scope': 'Finite necessary coefficient completion, not Gaussian realization or endpoint.',
           'source_audit': str(args.audit.resolve()),
           'source_sha256': hashlib.sha256(args.audit.read_bytes()).hexdigest(),
           'actual_response_controls': controls(), 'results': []}
    start = time.monotonic()
    args.output.parent.mkdir(parents=True, exist_ok=True)
    for order in map(int, args.orders.split(',')):
        for row in selected:
            result = run_case(targets(row), order)
            out['results'].append(result)
            out['elapsed_seconds'] = time.monotonic()-start
            args.output.write_text(json.dumps(out, indent=2)+'\n')
            print(json.dumps({'index': row['index'], 'order': order,
                              'solver': result['discovery_status'],
                              'slack': result.get('discovery_relative_slack'),
                              'exact_zero_completion': 'exact_verification' in result}), flush=True)


if __name__ == '__main__':
    main()
