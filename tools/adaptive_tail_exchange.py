#!/usr/bin/env python3
"""Numerical adaptive separation for a necessary full-tail rounding score.

Every frozen response is an actual two-channel disk rounding, with channel
correlations z and z|z|^2. Real spectra use conjugation-reflected mixtures.
The score p-sum_j|s_(2j+1)|-|C1-p-sum_j s_(2j+1)| is NECESSARY ONLY:
passing it is not a Grothendieck bound. Holdout integration is numerical,
without error bounds. The default head depth2 retains the old six features.
"""
import argparse
import copy
import hashlib
import json
import math
from functools import lru_cache
from pathlib import Path
import sys
import time

import numpy as np
from scipy.optimize import linprog

sys.path.insert(0, str(Path(__file__).resolve().parent))
from quintic_local_oracle import coefficient, features as base_features, grouped as base_grouped, known_phase_z as base_known_phase_z, packed, phase, unpacked


@lru_cache(None)
def feature_indices(depth=2):
    """Indices (a,b,c,d) for H_ab(Z)H_cd(G), grouped by weighted grade.

    Charge one gives a=b+1-c+d and weighted grade2j+1 gives j=b+c+2d.
    The first six indices and feature values preserve the old API exactly.
    """
    if not isinstance(depth, (int, np.integer)) or depth < 2:
        raise ValueError('Head depth must be an integer at least2')
    indices = [(1,0,0,0), (2,1,0,0), (0,0,1,0),
               (3,2,0,0), (1,1,1,0), (2,0,0,1)]
    for j in range(3, depth+1):
        for d in range(j//2+1):
            for c in range(j-2*d+1):
                b = j-c-2*d
                a = b+1-c+d
                if a >= 0:
                    indices.append((a,b,c,d))
    return tuple(indices)


@lru_cache(None)
def depth_from_size(size):
    if not isinstance(size, (int, np.integer)) or size < 6:
        raise ValueError('A complete weighted head has at least six features')
    depth = 2
    while len(feature_indices(depth)) < size:
        depth += 1
    if len(feature_indices(depth)) != size:
        raise ValueError('Feature count is not a complete weighted head')
    return depth


def complex_hermite(z, a, b):
    """Orthonormal proper-complex Hermite H_ab, with E|Z|^2=1."""
    answer = np.zeros_like(z, dtype=complex)
    for k in range(min(a,b)+1):
        scalar = (-1)**k*math.factorial(k)*math.comb(a,k)*math.comb(b,k)
        answer += scalar*z**(a-k)*z.conj()**(b-k)
    return answer/math.sqrt(math.factorial(a)*math.factorial(b))


def features(logn, seed, depth=2):
    indices = feature_indices(depth)
    original = base_features(logn, seed)
    if depth == 2:
        return original
    z, g = original[0], original[2]
    z_basis, g_basis = {}, {}
    added = []
    for a,b,c,d in indices[6:]:
        if (a,b) not in z_basis:
            z_basis[a,b] = complex_hermite(z, a, b)
        if (c,d) not in g_basis:
            g_basis[c,d] = complex_hermite(g, c, d)
        added.append(z_basis[a,b]*g_basis[c,d])
    return np.vstack([original, added])


def known_phase_z(depth=2):
    if depth == 2:
        return base_known_phase_z()
    answer = np.zeros(len(feature_indices(depth)), dtype=complex)
    answer[:6] = base_known_phase_z()
    # <H_(j+1,j)(Z),phase(Z)> = (-1)^j sqrt(pi)/2
    #                         * (1/2)_j/(j!*sqrt(j+1)).
    pure = math.sqrt(math.pi)/2
    for j in range(1, depth+1):
        pure *= -(j-.5)/j*math.sqrt(j/(j+1))
        if j >= 3:
            answer[feature_indices(depth).index((j+1,j,0,0))] = pure
    return answer


def grouped(cf, cg, depth=None):
    if depth is None:
        depth = depth_from_size(len(cf))
    indices = feature_indices(depth)
    if len(cf) != len(indices) or len(cg) != len(indices):
        raise ValueError('Coefficient vectors do not match the weighted head')
    if depth == 2:
        return base_grouped(cf,cg)
    answer = np.zeros(depth+1)
    for i, (_,b,c,d) in enumerate(indices):
        answer[b+c+2*d] += (cf[i].conjugate()*cg[i]).real
    return answer


def padded_vector(vector, size):
    vector = np.asarray(vector, dtype=complex)
    if vector.ndim != 1 or len(vector) > size:
        raise ValueError('Response coefficient vector exceeds feature count')
    return np.pad(vector, (0,size-len(vector)))


def padded_record(record, size):
    record = copy.deepcopy(record)
    if record['kind'] == 'polynomial_pair':
        for key in ['f_numerator','g_numerator']:
            record[key] = packed(padded_vector(unpacked(record[key]), size))
    elif record['kind'] == 'feedback':
        record['initial_g'] = packed(padded_vector(unpacked(record['initial_g']), size))
        for step in record['steps']:
            for key in ['vf','vg']:
                step[key] = packed(padded_vector(unpacked(step[key]), size))
    else:
        raise ValueError('Unknown response kind')
    return record


def apply(phi, record):
    size = phi.shape[0]
    if record['kind'] == 'polynomial_pair':
        return (phase(padded_vector(unpacked(record['f_numerator']),size)@phi),
                phase(padded_vector(unpacked(record['g_numerator']),size)@phi))
    if record['kind'] != 'feedback' or not record['steps']:
        raise ValueError('A feedback record requires at least one step')
    g = phase(padded_vector(unpacked(record['initial_g']),size)@phi)
    for step in record['steps']:
        f = phase(padded_vector(unpacked(step['vf']),size)@phi-step['tail_price']*g)
        g = phase(padded_vector(unpacked(step['vg']),size)@phi-step['tail_price']*f)
    return f, g


def evaluate(phi, record):
    depth = depth_from_size(phi.shape[0])
    f, g = apply(phi, record)
    rawf, rawg = coefficient(phi, f), coefficient(phi, g)
    v = (record['steps'][-1]['vf'] if record['kind'] == 'feedback'
         else record['f_numerator'])
    axis = unpacked(v)[0]
    orient = axis/abs(axis) if abs(axis) else 1
    base = phase(phi[0])
    cvf = known_phase_z(depth)+coefficient(phi, orient.conjugate()*f-base)
    cvg = known_phase_z(depth)+coefficient(phi, orient.conjugate()*g-base)
    c1 = float(np.mean(f.conj()*g).real)
    return {'raw': [*map(float, grouped(rawf, rawg)), c1],
            'control': [*map(float, grouped(cvf, cvg)), c1]}


def necessary(column):
    column = np.asarray(column)
    return float(column[0]-sum(abs(column[1:-1]))-abs(column[-1]-sum(column[:-1])))


def price(column, u):
    column, u = np.asarray(column), np.asarray(u)
    if len(u) != len(column)-1:
        raise ValueError('One price per nonlinear head and one tail price are required')
    return float((1+u[-1])*column[0]+np.dot(u[-1]-u[:-1],column[1:-1])-u[-1]*column[-1])


def master(columns):
    columns = np.asarray(columns, dtype=float)
    if columns.ndim != 2 or columns.shape[1] < 4 or not np.isfinite(columns).all() or not len(columns):
        raise ValueError('A finite nonempty bank with at least p,s3,s5,C1 is required')
    # Both (F,H) and (F,-H) are admissible. Preserve this signed symmetry.
    signed = np.vstack([columns, -np.asarray(columns)])
    n = len(signed)
    residuals = [signed[:,k] for k in range(1,signed.shape[1]-1)]
    residuals.append(signed[:,-1]-np.sum(signed[:,:-1],axis=1))
    penalties = len(residuals)
    rows = []
    for k, residual in enumerate(residuals):
        for sign in [1, -1]:
            row = np.r_[sign*residual, np.zeros(penalties)]
            row[n+k] = -1
            rows.append(row)
    # HiGHS defaults permit dual reduced-cost errors of 1e-7, larger than
    # our independent 1e-8 support check. Keep the check and solve two
    # orders of magnitude more accurately rather than relaxing the check.
    lp_options = {'primal_feasibility_tolerance': 1e-10,
                  'dual_feasibility_tolerance': 1e-10,
                  'ipm_optimality_tolerance': 1e-12}
    ans = linprog(np.r_[-signed[:, 0], np.ones(penalties)],
                  A_ub=rows, b_ub=np.zeros(2*penalties),
                  A_eq=[np.r_[np.ones(n), np.zeros(penalties)]], b_eq=[1],
                  bounds=[(0, None)]*(n+penalties), method='highs',
                  options=lp_options)
    if not ans.success:
        raise ArithmeticError(ans.message)
    marg = ans.ineqlin.marginals
    u = np.array([marg[2*k+1]-marg[2*k] for k in range(penalties)])
    value = -float(ans.fun)
    support = max(price(c, u) for c in signed)
    mixed_column = ans.x[:n]@signed
    diagnostics = {'solver_options':lp_options, 'primal_objective':value,
                   'priced_support':support, 'support_gap':support-value,
                   'mixed_necessary_score':necessary(mixed_column),
                   'mixed_score_gap':necessary(mixed_column)-value,
                   'equality_dual_score':-float(ans.eqlin.marginals[0]),
                   'max_price_abs':float(max(abs(u))),
                   'max_inequality_violation':float(max(0,-min(ans.ineqlin.residual))),
                   'max_equality_violation':float(max(abs(ans.eqlin.residual))),
                   'max_bound_violation':float(max(0,-min(ans.x))),
                   'dual_penalty_excess':float(max(0,max(-marg[2*k]-marg[2*k+1]-1
                                                        for k in range(penalties)))),
                   'iterations':int(ans.nit)}
    failures = []
    if max(abs(u)) > 1+1e-8:
        failures.append('dual tail prices outside [-1,1]')
    if abs(support-value) > 1e-8:
        failures.append('primal/dual support identity failed')
    if abs(necessary(mixed_column)-value) > 1e-8:
        failures.append('mixed primal score identity failed')
    if max(diagnostics[key] for key in ['max_inequality_violation',
                                       'max_equality_violation','max_bound_violation',
                                       'dual_penalty_excess']) > 1e-8:
        failures.append('primal or dual feasibility check failed')
    if failures:
        raise ArithmeticError('; '.join(failures)+': '+json.dumps(diagnostics,sort_keys=True))
    count = len(columns)
    active = [{'index': int(i % count), 'sign': 1 if i < count else -1,
               'weight': float(w)} for i, w in enumerate(ans.x[:n]) if w > 1e-8]
    return {'necessary_score': value, 'prices': u.tolist(), 'active': active,
            'mixed_column': mixed_column.tolist(),
            'support_check': support, 'solver_diagnostics':diagnostics}


def fit(phi, start, u, iterations):
    depth = depth_from_size(phi.shape[0])
    u = np.asarray(u)
    if len(u) != depth+1:
        raise ValueError('Price count does not match head depth')
    diagonal = np.array([1+u[-1] if b+c+2*d == 0 else u[-1]-u[b+c+2*d-1]
                         for _,b,c,d in feature_indices(depth)])
    if isinstance(start, dict):
        start = padded_record(start, phi.shape[0])
        _, g = apply(phi, start)
        initial = start['initial_g']
        prefix = copy.deepcopy(start['steps'])
    else:
        start = padded_vector(start,phi.shape[0])
        g = phase(start@phi)
        initial, prefix = packed(start), []
    cg = coefficient(phi, g)
    record = {'kind': 'feedback', 'initial_g': initial, 'steps': prefix,
              'prefix_depth': len(prefix), 'prices': list(map(float, u))}
    previous = -np.inf
    for _ in range(iterations):
        vf = diagonal*cg
        f = phase(vf@phi-u[-1]*g)
        cf = coefficient(phi, f)
        vg = diagonal*cf
        g = phase(vg@phi-u[-1]*f)
        cg = coefficient(phi, g)
        objective = float(np.vdot(cf, diagonal*cg).real-u[-1]*np.mean(f.conj()*g).real)
        if objective < previous-1e-10:
            raise ArithmeticError('Empirical alternating best response decreased')
        record['steps'].append({'vf': packed(vf), 'vg': packed(vg),
                                'tail_price': float(u[-1])})
        if objective-previous < 1e-10:
            break
        previous = objective
    record['raw_discovery_price'] = objective
    return record


def initial_bank(root, depth=2):
    rows = [{'kind': 'polynomial_pair', 'f_numerator': packed(np.array([1,0,0,0,0,0],complex)),
             'g_numerator': packed(np.array([1,0,0,0,0,0],complex)), 'label': 'phase_Z'}]
    data = json.loads((root/'research/quintic_projection_20261023/numerics/quintic-local-oracle-final.json').read_text())
    for i, row in enumerate(data['frozen_records']):
        rows.append({'kind': 'polynomial_pair', 'f_numerator': row['f_numerator'],
                     'g_numerator': row['g_numerator'], 'label': f'frozen_polynomial_{i}'})
    for c in [.239246, .239248]:
        rows.append({'kind': 'polynomial_pair', 'f_numerator': packed(np.array([1,c,c,0,0,0],complex)),
                     'g_numerator': packed(np.array([1,c,-c,0,0,0],complex)), 'label': f'balanced_{c}'})
    data = json.loads((root/'research/quintic_projection_20261023/numerics/tail-priced-oracle.json').read_text())
    for row in data['frozen_circuits']:
        steps = [dict(step, tail_price=49/250) for step in row['steps']]
        rows.append({'kind': 'feedback', 'initial_g': row['initial_g'], 'steps': steps,
                     'label': 'fixed_price_feedback'})
    return [padded_record(row,len(feature_indices(depth))) for row in rows]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--repo', type=Path, default=Path(__file__).resolve().parent.parent)
    parser.add_argument('--out', type=Path, required=True)
    parser.add_argument('--discovery-logn', type=int, default=15)
    parser.add_argument('--holdout-logn', type=int, default=19)
    parser.add_argument('--scrambles', type=int, default=3)
    parser.add_argument('--starts', type=int, default=8)
    parser.add_argument('--iterations', type=int, default=60)
    parser.add_argument('--rounds', type=int, default=16)
    parser.add_argument('--head-depth', type=int, default=2,
                        help='Retain weighted chaos degrees through 2*depth+1 (minimum 2)')
    args = parser.parse_args()
    if args.starts < 3 or min(args.iterations,args.rounds,args.scrambles) < 1:
        raise ValueError('At least three starts and positive limits required')
    if not all(4 <= n <= 21 for n in [args.discovery_logn,args.holdout_logn]):
        raise ValueError('Use sample exponents between 4 and 21')
    indices = feature_indices(args.head_depth)
    size = len(indices)
    begun = time.monotonic()
    phi = features(args.discovery_logn, 4722026, args.head_depth)
    rng = np.random.default_rng(2832026)
    bank = initial_bank(args.repo, args.head_depth)
    estimates = [evaluate(phi, record) for record in bank]
    # Raw empirical discovery preserves the exact alternating objective.
    columns = [row['raw'] for row in estimates]
    history = []
    checkpoint_path = args.out.with_suffix(args.out.suffix+'.checkpoint.json')
    def save_checkpoint(stage, iteration, error=None):
        payload = {'status':'NUMERICAL_CHECKPOINT_ONLY', 'stage':stage,
                   'round':iteration, 'head_depth':args.head_depth,
                   'feature_indices':[list(index) for index in indices],
                   'parameters':vars(args)|{'repo':str(args.repo),'out':str(args.out)},
                   'history':history, 'bank':bank, 'columns':columns,
                   'rng_state':rng.bit_generator.state,
                   'source_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
                   'seconds':time.monotonic()-begun}
        if error is not None:
            payload['error'] = str(error)
        temporary = checkpoint_path.with_suffix(checkpoint_path.suffix+'.tmp')
        temporary.write_text(json.dumps(payload,indent=2)+'\n')
        temporary.replace(checkpoint_path)
    for iteration in range(args.rounds):
        save_checkpoint('before_master',iteration)
        try:
            lp = master(columns)
        except ArithmeticError as error:
            save_checkpoint('master_failed',iteration,error)
            raise
        u = np.array(lp['prices'])
        starts = [padded_vector(v,size) for v in
                  [np.array([1,0,0,0,0,0],complex),
                   np.array([1,.239247,.239247,0,0,0],complex),
                   np.array([1,.1,.32,.02,.02,.02],complex)]]
        for item in lp['active']:
            r = bank[item['index']]
            if r['kind'] == 'feedback' and len(r['steps']) <= 120:
                starts.append(r)
            else:
                v = r['steps'][-1]['vg'] if r['kind'] == 'feedback' else r['g_numerator']
                starts.append(unpacked(v))
        while len(starts) < args.starts:
            v = .2*(rng.standard_normal(size)+1j*rng.standard_normal(size)); v[0] += 1
            starts.append(v)
        found = [fit(phi, v, u, args.iterations) for v in starts]
        found.sort(key=lambda r: -r['raw_discovery_price'])
        best = found[0]['raw_discovery_price']
        history.append({'round': iteration, 'master': lp, 'best_oracle_price': best,
                        'oracle_gap': best-lp['necessary_score'],
                        'actual_starts': len(starts)})
        print(json.dumps({'round': iteration, 'score': lp['necessary_score'],
                          'prices': lp['prices'], 'oracle_gap': best-lp['necessary_score'],
                          'seconds': time.monotonic()-begun}), flush=True)
        for record in found[:3]:
            estimate = evaluate(phi, record)
            if all(np.linalg.norm(np.array(estimate['raw'])-c) > 1e-7 for c in map(np.array,columns)):
                bank.append(record); estimates.append(estimate); columns.append(estimate['raw'])
        if iteration >= 4 and best-lp['necessary_score'] < 2e-7:
            break
    save_checkpoint('before_final_master',len(history))
    try:
        lp = master(columns)
    except ArithmeticError as error:
        save_checkpoint('final_master_failed',len(history),error)
        raise
    selected = sorted({item['index'] for item in lp['active']})
    frozen = [copy.deepcopy(bank[i]) for i in selected]
    lookup = {index:i for i,index in enumerate(selected)}
    weights = [dict(item,index=lookup[item['index']]) for item in lp['active']]
    holdouts = []
    for j in range(args.scrambles):
        test = features(args.holdout_logn, 5572026+j, args.head_depth)
        results = [evaluate(test, record) for record in frozen]
        mixed = {}
        for variant in ['raw','control']:
            column = sum(item['weight']*item['sign']*np.array(results[item['index']][variant]) for item in weights)
            mixed[variant] = {'column': column.tolist(), 'necessary_score': necessary(column)}
        holdouts.append({'seed':5572026+j,'evaluations':results,'frozen_mixture':mixed})
    output = {'status':'NUMERICAL_ONLY','scope':__doc__,'parameters':vars(args)|{'repo':str(args.repo),'out':str(args.out)},
              'history':history,'discovery_master':lp,'discovery_columns':columns,
              'frozen_records':frozen,'frozen_weights':weights,'holdouts':holdouts,
              'phase_Z_exact_column':['pi/4','pi/32','3*pi/256']+
                  [f'pi/4*((1/2)_{j}/{j}!)^2/{j+1}' for j in range(3,args.head_depth+1)]+['1'],
              'head_depth':args.head_depth, 'feature_indices':[list(index) for index in indices],
              'feature_weighted_degrees':[2*(b+c+2*d)+1 for _,b,c,d in indices],
              'column_order':['p']+[f's{2*j+1}' for j in range(1,args.head_depth+1)]+['C1'],
              'price_order':[f'u{2*j+1}' for j in range(1,args.head_depth+1)]+['uTail'],
              'checkpoint_path':str(checkpoint_path),
              'source_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
              'feature_source_sha256':hashlib.sha256(Path(__file__).with_name('quintic_local_oracle.py').read_bytes()).hexdigest(),
              'seconds':time.monotonic()-begun}
    args.out.write_text(json.dumps(output,indent=2)+'\n')
    print(json.dumps({'status':output['status'],'discovery_score':lp['necessary_score'],
                      'holdout_scores':[h['frozen_mixture']['control']['necessary_score'] for h in holdouts],
                      'seconds':output['seconds']},indent=2),flush=True)


if __name__ == '__main__':
    main()
