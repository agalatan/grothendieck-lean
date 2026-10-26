#!/usr/bin/env python3
"""Bounded discovery test of nine actual perturbations of the incumbent.

The maps are S_M[T exp(i t phi)], with T and phi EXACTLY the retained
Rounder.lean definitions.  A pair uses t=alpha+beta, alpha-beta.  At a real
physical correlation r, smoothing is integrated out using the covariance
M diag(p(r),q(r)) M.  No marginal Gaussian replacement of a cubic is made.

QMC midpoints and scramble differences are DISCOVERY ONLY.  The output also
records a deterministic (usually much wider) Wiener-L2 perturbation budget.
An optimized necessary common signed-tail screen is not a feasible score.
No missing truncation X, old HS source, or incumbent comparison is restored.

--freeze uses the standard library.  --run needs numpy/scipy and belongs on
the droplet, in a unique owned directory, one process/BLAS thread.  Runs are
bounded by --max-seconds (default 110 seconds).
"""
from __future__ import annotations

import argparse
from fractions import Fraction as Q
import hashlib
import json
import math
from pathlib import Path
import re
import signal
import time


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def rational_definition(text, name):
    match = re.search(r'def '+name+r'\s*:\s*ℚ\s*:=\s*([^\n]+)', text)
    if not match:
        raise ValueError('missing rational '+name)
    numbers = list(map(int, re.findall(r'-?\d+', match[1])))
    if len(numbers) not in (1, 2):
        raise ValueError('unsupported rational '+name)
    return Q(*numbers)


def rational_list(text, name):
    block = re.search(r'def '+name+r'\s*:\s*List ℚ\s*:=\s*\[(.*?)\]', text, re.S)
    if not block:
        raise ValueError('missing list '+name)
    return [Q(int(a), int(b) if b else 1) for a, b in re.findall(
        r'\((-?\d+)\s*:\s*ℚ\)(?:\s*/\s*(\d+))?', block[1])]


def freeze(repo, output):
    data_path = repo/'Grothe/Upper/Data.lean'
    bridge_path = repo/'Grothe/Upper/PolynomialBridge.lean'
    base_path = repo/'handoff/research-third-decimal/fresh-eyes-20261023/upper/incumbent'
    moments_path = repo/'handoff/research-third-decimal/needle-20261023/phase246.json'
    data, bridge = data_path.read_text(), bridge_path.read_text()
    base = json.loads((base_path/'incumbent-column.json').read_text())
    frozen = json.loads((base_path/'frozen-inputs.json').read_text())
    moments = json.loads(moments_path.read_text())
    p, q = rational_list(data, 'pList'), rational_list(data, 'qList')
    assert list(map(str, p)) == frozen['P'] and list(map(str, q)) == frozen['Q']
    assert sum(map(abs, p)) <= 1 and sum(map(abs, q)) <= 1 and q[0] == 0
    # Verify that the old enclosed coefficient head belongs to the current
    # exact stored energies, rather than trusting a historical source hash.
    block = re.search(r'def energyStrs : List String := \[(.*?)\]', data, re.S)[1]
    energies = []
    for row in re.findall(r'"([^"]+)"', block):
        m, entries = row.split(':')
        for entry in entries.split(';'):
            n, numerator, exponent = map(int, entry.split(','))
            energies.append([n, int(m), numerator, exponent])
    assert energies == frozen['energy_entries_n_m_numerator_pow2denominator']
    phase_block = data.split('def phaseStrs : List String :=', 1)[1].split('/--', 1)[0]
    phase = [[int(a), int(b), int(c), str(Q(value))] for a, b, c, value in
             re.findall(r'"(\d+),(\d+),(\d+):([^"]+)"', phase_block)]
    epsilon = rational_definition(data, 'phaseEpsQ')
    phase_payload = {'epsilon': str(epsilon), 'terms': sorted(phase)}
    phase_hash = hashlib.sha256(json.dumps(phase_payload, separators=(',', ':'),
                                         sort_keys=True).encode()).hexdigest()
    assert len(phase) == 1140 and phase_hash == moments['phase_payload_sha256']
    exact_moments = {str(m['power']): m['exact_rational'] for m in moments['moments']}
    def arb_interval(text):
        text = text.strip('[] ')
        if '+/-' not in text:
            return Q(text), Q(text)
        mid, rad = map(Q, text.split('+/-'))
        return mid-rad, mid+rad
    coeff = base['all_251_coefficient_midpoints']
    assert len(coeff) == 251
    midpoint_error = sum(max(abs(lo-Q(value)), abs(hi-Q(value)))
                         for value, bounds in zip(coeff, base['all_251_coefficient_enclosures'])
                         for lo, hi in [arb_interval(bounds)])
    conditional_tax = (rational_definition(bridge, 'compareQ')
                       + rational_definition(data, 'energyErrQ')
                       + rational_definition(bridge, 'tailQ') + midpoint_error)
    result = {'schema': 'coupled-asymmetric-incumbent-input/v1',
              'profile': list(map(str, rational_list(data, 'profileQ'))),
              'a': str(rational_definition(data, 'aQ')),
              'b': str(rational_definition(data, 'bQ')),
              'eta': str(rational_definition(data, 'etaQ')),
              'epsilon': str(epsilon), 'phase': phase,
              'p': list(map(str, p)), 'q': list(map(str, q)),
              'incumbent_251_coefficients': coeff,
              'incumbent_conditional_l1_tax': str(conditional_tax),
              'exact_phase_moments': exact_moments,
              'phase_payload_sha256': phase_hash,
              'sources': {str(path.relative_to(repo)): sha(path) for path in
                          [data_path, bridge_path, moments_path,
                           base_path/'incumbent-column.json', base_path/'frozen-inputs.json']},
              'conditional_inputs': ['incumbent compare', 'incumbent energy_close',
                                     'incumbent Hardy budget; no new numerical hypothesis discharged']}
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(result, indent=2)+'\n')
    print(json.dumps({'status': 'FROZEN_EXACT_CURRENT_PAYLOAD',
                      'phase_terms': len(phase), 'conditional_tax': float(conditional_tax),
                      'sha256': sha(output)}, indent=2))


def audit(input_path, result_path, output_path):
    """Exact algebra on saved midpoints; no new integration is certified."""
    inputs=json.loads(input_path.read_text())
    result=json.loads(result_path.read_text())
    assert result['input_sha256']==sha(input_path)
    assert result['status']=='NUMERICAL_DISCOVERY_NO_ENDPOINT'
    assert len(result['columns'])==9
    s=Q(43,50)
    assert abs(s)<=1
    coefficients=list(map(Q,inputs['incumbent_251_coefficients']))
    base=coefficients[0]-s*coefficients[1]
    tax=Q(inputs['incumbent_conditional_l1_tax'])
    target=Q(711950,10**6)
    values=[]
    for column in result['columns']:
        delta=Q(column['delta_c0'])-s*Q(column['delta_c1'])
        values.append(base+delta)
    bound=max([base]+values)
    # Exact upward square root, so the deterministic whole-spectrum L2
    # enclosure need not rely on binary64 rounding of sqrt(E phi^2).
    phase2=Q(inputs['exact_phase_moments']['2'])
    scale=10**24
    ceiling=(phase2.numerator*scale*scale+phase2.denominator-1)//phase2.denominator
    root=math.isqrt(ceiling)
    if root*root<ceiling:root+=1
    root=Q(root,scale)
    assert root*root>=phase2
    deterministic=[]
    for column in result['columns']:
        eF=abs(Q(column['tF']))*root
        eG=abs(Q(column['tG']))*root
        deterministic.append(base+tax+eF+eG+eF*eG)
    # Replay the general price's all-index front/geometric certificate too.
    price=result['common_price']
    qrho=list(map(lambda x:Q(str(x)),result['rhos']))
    qa=list(map(Q,price['a']))
    assert abs(Q(price['s']))<=1 and len(qa)==len(qrho)
    front=max(abs(sum(a*r**power for a,r in zip(qa,qrho))) for power in range(5,130,2))
    geometric=sum(abs(a)*r**131 for a,r in zip(qa,qrho))
    assert front<=1 and geometric<=1
    assert result['columns'][3]['alpha']==result['columns'][3]['beta']==0
    assert result['columns'][3]['delta_c0']==result['columns'][3]['delta_c1']==0
    assert all(v==0 for v in result['columns'][3]['delta_kernel_midpoints'])
    error_cases=[]
    for error in [Q(0),Q(1,10**8),Q(1,10**7),Q(1,10**6)]:
        total=bound+tax+(1+s)*error
        error_cases.append({'assumed_PROVEN_uniform_delta_head_error':str(error),
                            'conditional_exact_bound':str(total),
                            'conditional_decimal_bound':float(total),
                            'requires_uncertified_new_integral_enclosures':True})
    out={'schema':'coupled-asymmetric-exact-midpoint-audit/v1',
         'status':'PASS_EXACT_ALGEBRA_ONLY_NO_INTEGRAL_CERTIFICATE',
         'input_sha256':sha(input_path),'sample_result_sha256':sha(result_path),
         'sampling_tool_sha256':result['tool_sha256'],'audit_tool_sha256':sha(__file__),
         'fixed_all_index_price':{'lambda0':'1','lambda1':str(-s),'lambda_k_for_k_ge_2':'0'},
         'scope':'D(c)<=c0-(43/50)c1 for every absolutely summable real signed spectrum; hence the same common price covers every convex mixture.',
         'incumbent_price_midpoint':str(base),'incumbent_price_midpoint_decimal':float(base),
         'column_price_midpoints':list(map(str,values)),
         'every_new_midpoint_at_most_incumbent':max(values)<=base,
         'midpoint_pool_bound':str(bound),'midpoint_pool_bound_decimal':float(bound),
         'target':str(target),'discovery_gate_passed':bound>target,
         'conditional_incumbent_l1_tax':str(tax),
         'conditional_error_cases':error_cases,
         'sufficient_delta_head_error_for_exclusion':str(max(Q(0),(target-bound-tax)/(1+s))),
         'sufficient_delta_head_error_decimal':float(max(Q(0),(target-bound-tax)/(1+s))),
         'phase2_sqrt_rational_upper':str(root),
         'deterministic_price_upper_all_nine':str(max(deterministic)),
         'deterministic_price_upper_decimal':float(max(deterministic)),
         'general_kernel_price_front_max':str(front),
         'general_kernel_price_geometric_budget':str(geometric),
         'rigorous_exclusion':False,'endpoint_changed':False,
         'reason':'The saved new head/kernel integrals are numerical QMC estimates. The supplied deterministic Wiener-L2 response error is too wide for exclusion. Error-priced headroom cannot count as a positive discovery gate.'}
    output_path.parent.mkdir(parents=True,exist_ok=True)
    output_path.write_text(json.dumps(out,indent=2)+'\n')
    print(json.dumps({k:out[k] for k in ['status','every_new_midpoint_at_most_incumbent',
        'midpoint_pool_bound_decimal','discovery_gate_passed',
        'sufficient_delta_head_error_decimal','deterministic_price_upper_decimal',
        'rigorous_exclusion','endpoint_changed']},indent=2))


def run(args):
    import numpy as np
    from scipy.optimize import linprog
    from scipy.special import eval_genlaguerre, gammaln, ndtri
    from scipy.stats import qmc

    started = time.monotonic()
    def expired(signum, frame):
        raise TimeoutError('bounded experiment wall-clock limit')
    signal.signal(signal.SIGALRM, expired)
    signal.alarm(args.max_seconds)
    d = json.loads(args.input.read_text())
    assert d['schema'] == 'coupled-asymmetric-incumbent-input/v1'
    f = lambda x: float(Q(x))
    p, q = np.array(list(map(f, d['p']))), np.array(list(map(f, d['q'])))
    profile = np.array(list(map(f, d['profile'])))
    a, b, eta, eps = map(f, [d['a'], d['b'], d['eta'], d['epsilon']])
    u = np.array([1., b]); pu = np.outer(u, u)/np.dot(u, u)
    M = pu+math.sqrt(eta)*(np.eye(2)-pu)
    v = M[:, 0]; variance = np.dot(v, v)
    params = np.arange(-3, 4)/4
    pairs = [(alpha, beta) for alpha in [-.25, 0., .25] for beta in [0., .25, .5]]
    indices = [(int(round(4*(alpha+beta)))+3, int(round(4*(alpha-beta)))+3)
               for alpha, beta in pairs]
    rho = np.array([.2, .4, .6, .75, .85, .925, .975])
    coeff = np.array(d['incumbent_251_coefficients'])
    base_kernel = rho*np.polynomial.polynomial.polyval(rho*rho, coeff)
    base0, base1 = coeff[:2]
    dense = np.zeros((18, 18, 18))
    dense_ld = np.zeros((18, 18, 18), dtype=np.longdouble)
    for i, j, k, value in d['phase']:
        dense[i, j, k] = f(value)
        rational = Q(value)
        dense_ld[i, j, k] = np.longdouble(rational.numerator)/np.longdouble(rational.denominator)
    def phase_eval(Z, dtype=np.float64):
        U = np.asarray(abs(Z[:, 0])**2, dtype=dtype)
        V = np.asarray(abs(Z[:, 1])**2, dtype=dtype)
        W = np.asarray((Z[:, 0].conj()*Z[:, 1]).real, dtype=dtype)
        D = np.asarray((Z[:, 0].conj()*Z[:, 1]).imag, dtype=dtype)
        S = np.zeros(len(Z), dtype=dtype)
        for i in range(17, -1, -1):
            sj = np.zeros(len(Z), dtype=dtype)
            for j in range(17-i, -1, -1):
                sk = np.zeros(len(Z), dtype=dtype)
                for k in range(17-i-j, -1, -1):
                    sk = sk*W+(dense_ld[i,j,k] if dtype is np.longdouble else dense[i,j,k])
                sj = sj*V+sk
            S = S*U+sj
        return D*np.exp(-dtype(eps)*(U+V))*S
    def responses(Z):
        phi = phase_eval(Z)
        U = abs(Z[:, 0])**2
        vv = np.zeros(len(Z))
        for j, x in enumerate(profile):
            normalizer = math.exp((gammaln(j+.5)-gammaln(j+1))/2)
            vv += x*eval_genlaguerre(j, -.5, U)/normalizer
        zz = Z[:, 0]+math.sqrt(1+a*a)*vv*Z[:, 1]
        F0 = zz/np.maximum(abs(zz), 1e-300)
        T = F0*(1+1j*phi-phi**2/2-1j*phi**3/6)
        if not np.all(np.isfinite(T)) or np.max(abs(T)) > 1+1e-8:
            raise ArithmeticError('nonfinite or nondisk incumbent sample')
        return T[:, None]*np.exp(1j*phi[:, None]*params), phi
    def normals(power, seed, dim):
        unif = qmc.Sobol(dim, scramble=True, seed=seed).random_base2(power)
        if not np.all((unif > 0) & (unif < 1)):
            raise ArithmeticError('Sobol normal endpoint')
        nn = ndtri(unif)
        return (nn[:, ::2]+1j*nn[:, 1::2])/math.sqrt(2)
    def heads(power, seed):
        Z = normals(power, seed, 4)
        T, phi = responses(Z)
        h = Z.conj().T@T/len(Z)
        h = M@h
        L = Z@v
        wick = L*(abs(L)**2-2*variance)/math.sqrt(2)
        cubic = wick.conj()@T/len(Z)
        return h, cubic, {'seed': seed, 'max_abs_phi': float(np.max(abs(phi))),
                           'mean_phi2': float(np.mean(phi**2))}
    test_Z = normals(8, args.seed+17, 4)
    test_T, test_phi = responses(test_Z)
    rotated, rotated_phi = responses(test_Z*np.exp(.37j))
    reflected, reflected_phi = responses(test_Z.conj())
    arithmetic_checks = {
        'charge_rotation_max_error':float(np.max(abs(rotated-test_T*np.exp(.37j)))),
        'conjugation_max_error':float(np.max(abs(reflected-test_T.conj()))),
        'phase_rotation_max_error':float(np.max(abs(rotated_phi-test_phi))),
        'phase_reflection_max_error':float(np.max(abs(reflected_phi+test_phi))),
        'phase_double_vs_longdouble_max_error':float(np.max(abs(
            phase_eval(test_Z,np.longdouble)-test_phi))),
        'scope':'Sampled arithmetic controls, not deterministic integral or global floating-error enclosures.'}
    assert arithmetic_checks['charge_rotation_max_error'] < 1e-8
    assert arithmetic_checks['conjugation_max_error'] < 1e-10
    all_heads = [heads(args.head_power, args.seed+1009*j) for j in range(2)]
    h0, k0, _ = all_heads[0]; h1, k1, _ = all_heads[1]
    def cross(j, k, row):
        return float(((h0[row, j].conjugate()*h1[row, k]
                       + h1[row, j].conjugate()*h0[row, k])/2).real)
    def cross3(j, k):
        return float(((k0[j].conjugate()*k1[k]+k1[j].conjugate()*k0[k])/2).real)
    delta0, delta1 = [], []
    for j, k in indices:
        dfirst = cross(j, k, 0)-cross(3, 3, 0)
        dsecond = cross(j, k, 1)-cross(3, 3, 1)
        dthird = cross3(j, k)-cross3(3, 3)
        delta0.append(p[0]*dfirst)
        delta1.append(p[1]*dfirst+q[1]*dsecond+p[0]**3*dthird)
    delta0, delta1 = np.array(delta0), np.array(delta1)
    kernels, controls = [], []
    for repeat in range(args.scrambles):
        ZN = normals(args.kernel_power, args.seed+5003+7907*repeat, 8)
        Z, N = ZN[:, :2], ZN[:, 2:]
        TZ, phiZ = responses(Z)
        values, baseline_samples = [], []
        for rr in rho:
            pp = rr*np.polynomial.polynomial.polyval(rr*rr, p)
            qq = rr*np.polynomial.polynomial.polyval(rr*rr, q)
            C = M@np.diag([pp, qq])@M
            val, vec = np.linalg.eigh(np.eye(2)-C@C)
            if min(val) < -1e-12:
                raise ArithmeticError('invalid Gaussian covariance')
            B = (vec*np.sqrt(np.maximum(val, 0)))@vec.T
            W = Z@C+N@B
            TW, phiW = responses(W)
            anchor = TZ[:, 3].conj()*TW[:, 3]
            baseline_samples.append(float(np.mean(anchor).real))
            values.append([float(np.mean(TZ[:, j].conj()*TW[:, k]-anchor).real)
                           for j, k in indices])
        kernels.append(np.array(values).T)
        controls.append({'seed': args.seed+5003+7907*repeat,
                         'baseline_sample_kernel': baseline_samples,
                         'baseline_sample_minus_stored_kernel':
                             (np.array(baseline_samples)-base_kernel).tolist()})
        print(json.dumps({'completed_scramble': repeat+1,
                          'seconds': time.monotonic()-started}), flush=True)
    dk = np.mean(kernels, axis=0)
    c0, c1 = base0+delta0, base1+delta1
    K = base_kernel[None, :]+dk
    rem = K-rho[None, :]*c0[:, None]-rho[None, :]**3*c1[:, None]
    # Dual variables s,a[7],abs(a)[7],abs(alpha),abs(beta),z.
    # Finite front plus geometric budget
    # proves |sum a_i rho_i^(2k+1)|<=1 for EVERY k>=2.
    nr = len(rho); dim = 2*nr+4; iz = dim-1
    objective = np.zeros(dim); objective[iz] = 1
    AA, bb = [], []
    for cc0, cc1, rr in zip(c0, c1, rem):
        row = np.zeros(dim); row[0] = -cc1; row[1:1+nr] = -rr; row[iz] = -1
        AA.append(row); bb.append(-cc0)
    # Retain the exact enclosed incumbent as a tenth column.
    base_rem = base_kernel-rho*base0-rho**3*base1
    row = np.zeros(dim); row[0] = -base1; row[1:1+nr] = -base_rem; row[iz] = -1
    AA.append(row); bb.append(-base0)
    for power in range(5, 130, 2):
        row = np.zeros(dim); row[1:1+nr] = rho**power
        AA.extend([row, -row]); bb.extend([1., 1.])
    for j in range(nr):
        row = np.zeros(dim); row[1+j] = 1; row[1+nr+j] = -1
        AA.extend([row, row-np.eye(1, dim, 1+j).ravel()*2]); bb.extend([0., 0.])
    row = np.zeros(dim); row[1+nr:1+2*nr] = rho**131
    AA.append(row); bb.append(1.)
    ia, ib = dim-3, dim-2
    row = np.zeros(dim); row[1:1+nr]=rho; row[ia]=-1
    AA.append(row);bb.append(-1.)
    row = np.zeros(dim); row[1:1+nr]=-rho; row[ia]=-1
    AA.append(row);bb.append(1.)
    row = np.zeros(dim); row[0]=-1;row[1:1+nr]=rho**3;row[ib]=-1
    AA.append(row);bb.append(0.)
    row = np.zeros(dim); row[0]=1;row[1:1+nr]=-rho**3;row[ib]=-1
    AA.append(row);bb.append(0.)
    error_priced_cases=[]
    fits=[]
    for eh,ek in [(0.,0.),(1e-8,1e-8),(1e-7,1e-7),(1e-6,1e-6)]:
        obj=objective.copy();obj[1+nr:1+2*nr]=ek;obj[ia]=eh;obj[ib]=eh
        fit = linprog(obj, A_ub=np.array(AA), b_ub=np.array(bb),
                      bounds=[(-1,1)]+[(None,None)]*nr+[(0,None)]*(nr+2)+[(None,None)],
                      method='highs', options={'primal_feasibility_tolerance':1e-9,
                                               'dual_feasibility_tolerance':1e-9})
        assert fit.success, fit.message
        fits.append(fit)
        error_priced_cases.append({'assumed_proven_delta_head_error':eh,
                                  'assumed_proven_delta_kernel_error':ek,
                                  'conditional_screen_excluding_incumbent_tax':float(fit.fun),
                                  'conditional_screen_including_incumbent_tax':float(fit.fun+f(d['incumbent_conditional_l1_tax'])),
                                  'head_error_amplification':float(sum(fit.x[[ia,ib]])),
                                  'kernel_error_amplification':float(sum(fit.x[1+nr:1+2*nr])),
                                  'status':'FLOAT_LP_OBJECTIVE_PROPOSAL_ONLY; rationalize and replay the price before treating this as even a conditional bound; integral errors are unproved'})
    fit=fits[0]
    ss, prices = fit.x[0], fit.x[1:1+nr]
    # Rationalize then rescale: this exact arithmetic certifies admissibility,
    # not the integrals in the midpoint columns.
    qrho = [Q(str(rr)) for rr in rho]
    qa = [Q(str(xx)).limit_denominator(10**8) for xx in prices]
    qs = min(Q(1), max(Q(-1), Q(str(ss)).limit_denominator(10**8)))
    budget = max([Q(1), sum(abs(xx)*rr**131 for xx, rr in zip(qa, qrho))]
                 + [abs(sum(xx*rr**power for xx, rr in zip(qa, qrho)))
                    for power in range(5, 130, 2)])
    qa = [xx/budget for xx in qa]
    prices = np.array(list(map(float, qa))); ss = float(qs)
    priced = c0-ss*c1-rem@prices
    baseprice = float(base0-ss*base1-np.dot(base_rem, prices))
    tax = f(d['incumbent_conditional_l1_tax'])
    phase2 = f(d['exact_phase_moments']['2'])
    # True coefficients obey this deterministic enclosure, independently of
    # the sampled midpoints.  L1 spectrum difference <= epsF+epsG+epsF epsG.
    exact_l2_budgets = []
    for alpha, beta in pairs:
        eF, eG = abs(alpha+beta)*math.sqrt(phase2), abs(alpha-beta)*math.sqrt(phase2)
        exact_l2_budgets.append(eF+eG+eF*eG)
    amplification_head = abs(1+np.dot(prices,rho))+abs(-ss+np.dot(prices,rho**3))
    amplification_kernel = sum(abs(prices))
    result = {'schema':'coupled-asymmetric-incumbent-result/v1',
              'status':'NUMERICAL_DISCOVERY_NO_ENDPOINT',
              'input_sha256':sha(args.input),'tool_sha256':sha(__file__),
              'parameters':{'head_power':args.head_power,'kernel_power':args.kernel_power,
                            'scrambles':args.scrambles,'seed':args.seed},
              'target':.711950,'seconds':time.monotonic()-started,
              'original_covariance_formula':'C(r)=M diag(p(r),q(r)) M; sqrt(I-C(r)^2) for the replica',
              'baseline_head_from_integration':{
                  'c0':p[0]*cross(3,3,0),
                  'c1':p[1]*cross(3,3,0)+q[1]*cross(3,3,1)+p[0]**3*cross3(3,3)},
              'head_sample_controls':[v[2] for v in all_heads],
              'arithmetic_controls':arithmetic_checks,
              'kernel_sample_controls':controls,
              'rhos':rho.tolist(),'kernel_scramble_differences':[
                  float(np.max(abs(k-dk))) for k in kernels],
              'common_price':{'s':str(qs),'a':list(map(str,qa)),
                              'front_degrees':[5,129],'geometric_degree':131,
                              'all_index_admissible_exact_arithmetic':True},
              'incumbent_price_midpoint':baseprice,
              'incumbent_conditional_l1_tax':tax,
              'midpoint_full_signed_tail_pool_screen':float(max(max(priced),baseprice)),
              'midpoint_screen_minus_target':float(max(max(priced),baseprice)-.711950),
              'conditional_uniform_error_formula':{
                  'head_amplification':float(amplification_head),
                  'kernel_amplification':float(amplification_kernel),
                  'note':'Add baseline l1 tax once, plus these factors times PROVEN errors of the DELTA head/kernel integrals. Scramble differences are not such proof.'},
              'error_priced_LP_cases':error_priced_cases,
              'columns':[{'alpha':alpha,'beta':beta,'tF':alpha+beta,'tG':alpha-beta,
                          'c0_midpoint':float(cc0),'c1_midpoint':float(cc1),
                          'delta_c0':float(dc0),'delta_c1':float(dc1),
                          'kernel_midpoints':kk.tolist(),'delta_kernel_midpoints':dkk.tolist(),
                          'priced_midpoint':float(pp),
                          'deterministic_l1_difference_bound':float(ee),
                          'deterministic_price_upper':float(baseprice+tax+ee)}
                         for (alpha,beta),cc0,cc1,dc0,dc1,kk,dkk,pp,ee in
                         zip(pairs,c0,c1,delta0,delta1,K,dk,priced,exact_l2_budgets)],
              'interpretation':'A common signed-tail necessary screen covers mixtures. Numerical midpoints do not certify score, exclusion, or improvement. The deterministic L2 budget is the only error enclosure supplied for the new columns.'}
    args.output.parent.mkdir(parents=True,exist_ok=True)
    args.output.write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({key:result[key] for key in ['status','seconds',
        'baseline_head_from_integration','midpoint_full_signed_tail_pool_screen',
        'midpoint_screen_minus_target','kernel_scramble_differences',
        'conditional_uniform_error_formula']},indent=2),flush=True)


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--freeze',type=Path,help='safe repository root')
    parser.add_argument('--input',type=Path)
    parser.add_argument('--audit',type=Path,help='saved sample result, exact midpoint algebra only')
    parser.add_argument('--output',type=Path,required=True)
    parser.add_argument('--head-power',type=int,default=15)
    parser.add_argument('--kernel-power',type=int,default=14)
    parser.add_argument('--scrambles',type=int,default=2)
    parser.add_argument('--seed',type=int,default=20261023)
    parser.add_argument('--max-seconds',type=int,default=110)
    args=parser.parse_args()
    if args.freeze:
        freeze(args.freeze,args.output)
    elif args.audit:
        if args.input is None:parser.error('--input is required for audit')
        audit(args.input,args.audit,args.output)
    else:
        if args.input is None:parser.error('--input is required for a run')
        if not (6<=args.head_power<=20 and 6<=args.kernel_power<=20
                and 1<=args.scrambles<=4 and 1<=args.max_seconds<=120):
            parser.error('bounded power/scramble/wall-clock parameters required')
        run(args)


if __name__=='__main__':
    main()
