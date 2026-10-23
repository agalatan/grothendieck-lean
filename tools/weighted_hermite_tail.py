#!/usr/bin/env python3
"""NUMERICAL ONLY: complete weighted Hermite heads and joint-Gram tail SDP.

Input is an adaptive_tail_exchange.py output with frozen_records and
frozen_weights. A mathematical full-tail lower-score formula is evaluated on
QMC estimates. Sampling, unbounded Hermite integrals, and PSD repairs have NO
certified error enclosure; this program never proves a Grothendieck bound.
Heavy runs belong in an owned directory on the droplet.
"""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import sys
import time

import numpy as np
from scipy.special import eval_genlaguerre, gammaln

sys.path.insert(0, str(Path(__file__).resolve().parent))
from adaptive_tail_exchange import apply, features, unpacked


def indices(depth):
    """(j,a,b,c,d), including EVERY charge-one index through weighted j."""
    return [(j, j+1-2*c-d, j-c-2*d, c, d)
            for j in range(depth+1) for c in range(j+1)
            for d in range(j//2+1)
            if c+2*d <= j and 2*c+d <= j+1]


def hermite(z, p, q):
    """Normalized complex Hermite H_pq, by generalized Laguerre."""
    low, high = min(p, q), max(p, q)
    power = z**(p-q) if p >= q else z.conj()**(q-p)
    return ((-1)**low*np.exp((gammaln(low+1)-gammaln(high+1))/2)
            * power*eval_genlaguerre(low, high-low, abs(z)**2))


def phase_z_coefficient(a, b, c, d):
    if c or d or a != b+1:
        return 0.0
    return ((-1)**b*np.exp(gammaln(1.5)+gammaln(b+.5)
                          -gammaln(.5)-gammaln(b+1))/np.sqrt(b+1))


def orientations(record):
    if record['kind'] == 'polynomial_pair':
        pair = (record['f_numerator'], record['g_numerator'])
    elif record['kind'] == 'feedback' and record['steps']:
        pair = (record['steps'][-1]['vf'], record['steps'][-1]['vg'])
    else:
        raise ValueError('Unknown response kind or empty feedback circuit')
    axes = [unpacked(v)[0] for v in pair]
    return [a/abs(a) if abs(a) else 1.0 for a in axes]


def pack_matrix(a):
    a = np.asarray(a)
    return [[[float(z.real), float(z.imag)] for z in row] for row in a]


def hermitian(a):
    return (a+a.conj().T)/2


def w_matrix(net):
    w = np.zeros((2*len(net), 2*len(net)), complex)
    for i, value in enumerate(net):
        w[2*i, 2*i+1] = w[2*i+1, 2*i] = value/2
    return w


def tail_penalty(sqrt_s, w):
    return float(np.abs(np.linalg.eigvalsh(hermitian(sqrt_s@w@sqrt_s))).sum())


def repair_residual(tail, allowance, budget):
    """Report every scalar PSD repair; it is NOT a sampling-error bound."""
    values, vectors = np.linalg.eigh(hermitian(tail))
    minimum = float(values[0])
    repair = max(0.0, -minimum+1e-12)
    total = repair+allowance
    shifted = values+total
    if shifted.min() < -1e-10:
        raise ArithmeticError('Explicit scalar PSD repair failed')
    # Any remaining negative is floating roundoff AFTER the reported repair.
    sqrt_s = (vectors*np.sqrt(np.maximum(shifted, 0)))@vectors.conj().T
    s = hermitian(tail+total*np.eye(len(tail)))
    return s, sqrt_s, {
        'minimum_residual_eigenvalue': minimum,
        'negative_eigenvalue_count': int(np.count_nonzero(values < -1e-10)),
        'negative_eigenvalue_mass': float(-np.minimum(values, 0).sum()),
        'explicit_scalar_psd_repair': repair,
        'user_scalar_gram_allowance': allowance,
        'total_diagonal_shift': total,
        'maximum_allowed_psd_repair': budget,
        'repair_budget_pass': bool(repair <= budget),
        'meaning': 'Repair and allowance are numerical diagnostics, NOT certified QMC errors.'}


def sufficient_formula(e, s, sqrt_s, net, ts):
    w = w_matrix(net)
    head = np.array([np.trace(w@j).real for j in e])
    penalty = tail_penalty(sqrt_s, w)
    n = len(e)-1
    rows = []
    for t in ts:
        linear = t*head[0]
        head_cost = sum(t**(2*j+1)*abs(head[j]) for j in range(1,n+1))
        tail_cost = t**(2*n+3)*penalty
        rows.append({'t':t,'linear':float(linear), 'absolute_head_cost':float(head_cost),
                     'joint_tail_cost':float(tail_cost),
                     'full_tail_lower_score_formula':float(linear-head_cost-tail_cost)})
    endpoint_tail = float(np.trace(w@s).real)
    necessary = float(head[0]-np.abs(head[1:]).sum()-abs(endpoint_tail))
    return {'head_spectrum':head.tolist(), 'joint_tail_trace_norm':penalty,
            'endpoint_tail_trace':endpoint_tail,
            'necessary_score_from_retained_head_and_endpoint':necessary,
            'scores':rows}


def optional_sdp(e, s, ts, solver_name):
    if importlib.util.find_spec('cvxpy') is None:
        return {'status':'CVXPY_NOT_INSTALLED', 'installed':False}
    import cvxpy as cp
    installed = cp.installed_solvers()
    solver = solver_name or next((s for s in ['CLARABEL','SCS'] if s in installed), None)
    if solver not in installed:
        return {'status':'NO_REQUESTED_SDP_SOLVER','installed':True,'solvers':installed}
    count, depth = len(s)//2, len(e)-1
    columns = np.array([[j[2*i,2*i+1].real for i in range(count)] for j in e])
    result = []
    for t in ts:
        weights = cp.Variable(2*count, nonneg=True)
        net = weights[:count]-weights[count:]
        y = cp.Variable(s.shape, hermitian=True)
        w = sum(net[i]*w_matrix(np.eye(count)[i]) for i in range(count))
        head_cost = sum(t**(2*j+1)*cp.abs(columns[j]@net) for j in range(1,depth+1))
        objective = (t*(columns[0]@net)-head_cost
                     -t**(2*depth+3)*cp.real(cp.trace(s@y)))
        problem = cp.Problem(cp.Maximize(objective),
                             [cp.sum(weights)==1, y-w >> 0, y+w >> 0])
        try:
            options = {'eps':1e-7,'max_iters':20000} if solver == 'SCS' else {}
            problem.solve(solver=solver, **options)
            if weights.value is None or y.value is None:
                result.append({'t':t,'status':problem.status}); continue
            raw = np.asarray(weights.value).real
            clean = np.maximum(raw,0)
            if clean.sum() <= 0:
                raise ArithmeticError('SDP returned no positive mixture')
            clean /= clean.sum()
            net_value = clean[:count]-clean[count:]
            w_value = w_matrix(net_value)
            y_value = hermitian(np.asarray(y.value))
            minimum = min(np.linalg.eigvalsh(y_value-w_value)[0],
                          np.linalg.eigvalsh(y_value+w_value)[0])
            y_shift = max(0.0, -float(minimum)+1e-10)
            y_value += y_shift*np.eye(len(s))
            spectrum = columns@net_value
            penalty = float(np.trace(s@y_value).real)
            score = (t*spectrum[0]-sum(t**(2*j+1)*abs(spectrum[j])
                                      for j in range(1,depth+1))
                     -t**(2*depth+3)*penalty)
            result.append({'t':t,'status':problem.status,'solver_objective':float(problem.value),
                           'checked_formula_score':float(score), 'joint_tail_dual_penalty':penalty,
                           'weights_positive_then_negative':clean.tolist(),
                           'weight_normalization_l1_change':float(np.abs(clean-raw).sum()),
                           'minimum_Y_plus_minus_W_eigenvalue_before_repair':float(minimum),
                           'explicit_Y_diagonal_repair':y_shift,
                           'Y':pack_matrix(y_value)})
        except Exception as error:
            result.append({'t':t,'status':'SDP_ERROR','error':str(error)})
    return {'status':'NUMERICAL_ONLY','installed':True,'solver':solver,'results':result}


def one_holdout(args, data, seed):
    started = time.monotonic()
    frozen_depth = int(data.get('head_depth', data.get('parameters',{}).get('head_depth',2)))
    phi = features(args.logn,seed,frozen_depth)
    records = data['frozen_records']
    pairs = [apply(phi, record) for record in records]
    u = np.array([response for pair in pairs for response in pair])
    n = phi.shape[1]
    orient = np.array([x for record in records for x in orientations(record)])
    base = np.ones(n,complex)  # features fixes Z=sqrt(R)>0; phase(Z)=1.
    differences = u-orient[:,None]*base
    gram = hermitian(u.conj()@u.T/n)
    all_indices = indices(max(args.depths))
    raw_coeffs, control_coeffs, norms = [], [], []
    # Stream one tensor basis vector at a time. Even caching every univariate
    # factor becomes expensive for N=20 on a large remote holdout.
    for j,a,b,c,d in all_indices:
        basis = hermite(phi[0],a,b)*hermite(phi[2],c,d)
        raw_coeffs.append(u@basis.conj()/n)
        control_coeffs.append(differences@basis.conj()/n
                              +orient*phase_z_coefficient(a,b,c,d))
        norms.append(float(np.mean(abs(basis)**2)))
    raw_coeffs, control_coeffs = np.array(raw_coeffs), np.array(control_coeffs)
    chosen = control_coeffs if args.coefficients == 'control' else raw_coeffs
    ej = [np.zeros(gram.shape,complex) for _ in range(max(args.depths)+1)]
    ej_raw = [np.zeros(gram.shape,complex) for _ in ej]
    for row,index,raw in zip(chosen,all_indices,raw_coeffs):
        j = index[0]
        ej[j] += np.outer(row.conj(),row)
        ej_raw[j] += np.outer(raw.conj(),raw)
    net = np.zeros(len(records))
    total_weight = 0.0
    for item in data['frozen_weights']:
        if (item['sign'] not in [-1,1] or not np.isfinite(item['weight'])
                or item['weight'] < 0 or not isinstance(item['index'],int)
                or not 0 <= item['index'] < len(records)):
            raise ValueError('Invalid frozen sign/weight')
        net[item['index']] += item['sign']*item['weight']
        total_weight += item['weight']
    if abs(total_weight-1) > 1e-6:
        raise ValueError('Frozen weights must sum to one')
    net /= total_weight
    result = []
    for depth in args.depths:
        head = ej[:depth+1]
        tail = hermitian(gram-sum(head))
        s, sqrt_s, repairs = repair_residual(tail,args.gram_allowance,args.max_psd_shift)
        row = {'depth':depth,'hermite_count':len(indices(depth)),
               'residual_gram_diagnostic':repairs,
               'frozen_mixture':sufficient_formula(head,s,sqrt_s,net,args.ts),
               'head_raw_vs_chosen_operator_norm':float(np.linalg.norm(
                   sum(ej_raw[:depth+1])-sum(head),2)),
               'residual_gram':pack_matrix(tail), 'head_grams':[pack_matrix(j) for j in head]}
        row['status'] = ('NUMERICAL_ONLY_UNCERTIFIED_ERRORS' if repairs['repair_budget_pass']
                         else 'REJECTED_EXCESSIVE_PSD_REPAIR')
        if args.sdp and repairs['repair_budget_pass']:
            row['sdp'] = optional_sdp(head,s,args.ts,args.sdp_solver)
        elif args.sdp:
            row['sdp'] = {'status':'SKIPPED_EXCESSIVE_PSD_REPAIR'}
        result.append(row)
        print(json.dumps({'seed':seed,'depth':depth,'status':row['status'],
                          'minimum_residual_eigenvalue':repairs['minimum_residual_eigenvalue'],
                          'psd_shift':repairs['total_diagonal_shift'],
                          'scores':row['frozen_mixture']['scores'],
                          'seconds':time.monotonic()-started}),flush=True)
    return {'seed':seed,'samples':n,'endpoint_gram':pack_matrix(gram),
            'response_norms_squared':np.diag(gram).real.tolist(),
            'basis_norm_diagnostics':{
                'maximum_empirical_abs_norm_error':float(np.max(np.abs(np.array(norms)-1))),
                'minimum_empirical_norm':min(norms),'maximum_empirical_norm':max(norms),
                'meaning':'High Hermite degrees have unbounded integrands; these are not error bounds.'},
            'indices_j_a_b_c_d':all_indices,
            'raw_coefficients':pack_matrix(raw_coeffs),
            'control_coefficients':pack_matrix(control_coeffs),
            'per_basis_empirical_norms_squared':norms,
            'depths':result,'seconds':time.monotonic()-started}


def csv_numbers(value, kind):
    return sorted(set(kind(x) for x in value.split(',')))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('input',type=Path)
    parser.add_argument('--out',type=Path,required=True)
    parser.add_argument('--logn',type=int,default=17)
    parser.add_argument('--scrambles',type=int,default=3)
    parser.add_argument('--seed',type=int,default=7712026)
    parser.add_argument('--depths',default='2,5,10')
    parser.add_argument('--ts',default='1,0.999,0.995')
    parser.add_argument('--coefficients',choices=['raw','control'],default='control')
    parser.add_argument('--gram-allowance',type=float,default=0.0,
                        help='Explicit scalar numerical residual-Gram allowance; NOT an error proof.')
    parser.add_argument('--max-psd-shift',type=float,default=1e-3,
                        help='Reject diagnostics requiring a larger scalar PSD repair.')
    parser.add_argument('--sdp',action='store_true')
    parser.add_argument('--sdp-solver')
    args = parser.parse_args()
    args.depths = csv_numbers(args.depths,int)
    args.ts = csv_numbers(args.ts,float)
    if (not args.depths or min(args.depths)<0 or max(args.depths)>20
            or not args.ts or min(args.ts)<=0 or max(args.ts)>1
            or not all(np.isfinite(args.ts))
            or not 4<=args.logn<=23 or args.scrambles<1
            or min(args.gram_allowance,args.max_psd_shift)<0
            or not np.isfinite(args.gram_allowance+args.max_psd_shift)):
        raise ValueError('Require depths 0..20, t in (0,1], logn 4..23, and nonnegative allowances')
    data = json.loads(args.input.read_text())
    if not data.get('frozen_records') or not data.get('frozen_weights'):
        raise ValueError('Input must contain a nonempty frozen adaptive bank and weights')
    begun = time.monotonic()
    holdouts = [one_holdout(args,data,args.seed+j) for j in range(args.scrambles)]
    output = {'status':'NUMERICAL_ONLY_NO_BOUND_PROVED','scope':__doc__,
              'parameters':vars(args)|{'input':str(args.input),'out':str(args.out)},
              'input_sha256':hashlib.sha256(args.input.read_bytes()).hexdigest(),
              'source_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
              'adaptive_source_sha256':hashlib.sha256(Path(__file__).with_name(
                  'adaptive_tail_exchange.py').read_bytes()).hexdigest(),
              'cvxpy_available':importlib.util.find_spec('cvxpy') is not None,
              'warning':'No PSD repair or user allowance is a certified sampling/integration error.',
              'holdouts':holdouts,'seconds':time.monotonic()-begun}
    args.out.parent.mkdir(parents=True,exist_ok=True)
    args.out.write_text(json.dumps(output,indent=2,allow_nan=False)+'\n')


if __name__ == '__main__':
    main()
