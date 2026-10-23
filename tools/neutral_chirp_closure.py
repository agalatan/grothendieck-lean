#!/usr/bin/env python3
"""Exact, realizability-preserving neutral-chirp closure of mixed chaos kernels.

Write C(z)=sum c_k z^k for the REAL mixed charge-one coefficients of an
actual bounded response pair (or a mixture).  For s=t^2 >= 0 append an
independent standard complex Gaussian U, R=|U|^2, and use

    F_t=f exp(i t R),
    G_t=((1+i t)/(1-i t)) g exp(-i t R).

Mix the t and -t pairs with equal probabilities.  The new coefficients are
the convolution d(s)*c, where

    sum d_j z^j = (1+s)^(-1) (1-u z)/(1-2u z+v z^2),
    u=s(s-1)/(1+s)^2,  v=s^2/(1+s)^2.

Proof: the orthonormal Laguerre coefficients of exp(i t R) are
a_j=(-i t)^j/(1-i t)^(j+1).  Product Hermite orthogonality shifts bidegree
(k+1,k) by (j,j).  The mixed multiplier after the displayed phase correction
is (1+s)^(-1) r^j, r=-s/(1+i t)^2.  Averaging +/-t takes its real part.
This preserves shared drivers, charge one, and boundedness.  Rational s
gives rational d even when sqrt(s) is irrational.  No Gaussian integration
or discovery optimizer is needed for exact coefficient transport.

Optional `phase=h` multiplies G_t by the further Cayley factor
(1+i*t*h)/(1-i*t*h).  With alpha=(1-s*h^2)/(1+s*h^2), beta=2h/(1+s*h^2),
the rational numerator is (1+s)^(-1)[alpha-(alpha*u+2*s^2*beta/(1+s)^2)z].
All denominator and tail statements stay valid.  The default is h=0.

For a finite witness lambda, J_s=lambda.(d*c) is an exact attainable
payoff.  Thus every globally delta-near-maximizing pair obeys
(d^T lambda-lambda).c <= delta.  This supplies coefficient-only necessary
cuts and new actual pool columns, rather than constraints on fictitious
radial laws.  These constant-buffer cuts are weaker than the old
response-dependent fresh-mode variations; the new implementation is a
portable exact closure for complete signed kernels, not a claimed new
inequality stronger than every previous response stability theorem.

With rho=s/(1+s), |d_j| <= (1-rho)rho^j, hence ||d||_1<=1 and its tail
beyond N is at most rho^(N+1).  If c_0,...,c_D are exact and the omitted
absolute tail is <=tau, convolution through any N>=D has absolute tail
<=tau + sum_{i=0}^D |c_i|rho^(N-i+1).  This transports an INPUT tail bound;
it does not manufacture one or certify that arbitrary input data are actual
responses.  Float pool experiments are explicitly discovery-only.
"""

import argparse
from fractions import Fraction as Q
from math import comb
import json
from pathlib import Path


def coefficients(s, n, phase=0):
    """Exact d_0,...,d_n. Here n is the maximum index, not total degree."""
    s = Q(s)
    if s < 0 or n < 0:
        raise ValueError('s and maximum index must be nonnegative')
    a = 1 / (1 + s)
    u = s * (s - 1) / (1 + s) ** 2
    v = s * s / (1 + s) ** 2
    # Optional extra relative phase zeta=(1+i*t*h)/(1-i*t*h), h=phase.
    # Symmetrization makes its coefficients rational for rational s,h.
    h = Q(phase)
    alpha = (1-s*h*h)/(1+s*h*h)
    beta = 2*h/(1+s*h*h)
    imag_r_over_t = 2*s/(1+s)**2
    d = [a*alpha]
    if n:
        d.append(a*(alpha*u-s*beta*imag_r_over_t))
    for j in range(2, n + 1):
        d.append(2 * u * d[-1] - v * d[-2])
    return d


def transform(head, s, n=None, tail_bound=0, phase=0):
    """Exact finite head and rigorously transported absolute tail bound."""
    c = list(map(Q, head))
    if not c:
        raise ValueError('nonempty input head required')
    n = len(c) - 1 if n is None else n
    if n < len(c) - 1:
        raise ValueError('output index must include the entire input head')
    tau = Q(tail_bound)
    if tau < 0:
        raise ValueError('tail bound must be nonnegative')
    d = coefficients(s, n, phase)
    out = [sum((c[i] * d[k-i] for i in range(min(k+1, len(c)))), Q(0))
           for k in range(n+1)]
    rho = Q(s) / (1 + Q(s))
    leakage = sum((abs(v) * rho ** (n-i+1) for i, v in enumerate(c)), Q(0))
    # If n>D and tau>0, the unknown input tail can affect output HEAD too.
    # Charge it once in the complete l1 error budget, not as exact zeros.
    head_exact = n == len(c)-1 or tau == 0
    return {'head': out, 'known_head_leakage': leakage,
            'inherited_tail_or_l1_error': tau, 'total_omission_budget': tau+leakage,
            'head_exact': head_exact}


def _cmul(z, w):
    return z[0]*w[0]-z[1]*w[1], z[0]*w[1]+z[1]*w[0]


def _cinv(z):
    m = z[0]*z[0]+z[1]*z[1]
    return z[0]/m, -z[1]/m


def _cpow(z, k):
    ans = (Q(1), Q(0))
    for _ in range(k):
        ans = _cmul(ans, z)
    return ans


def self_test():
    """Independent exact Laplace integrals test phase, conjugation and grades."""
    checks = 0
    for t in map(Q, ['0', '1/4', '-1/4', '1/2', '1', '2', '3/4']):
        s = t*t
        d = coefficients(s, 20)
        laplace = _cinv((Q(1), -t))
        phase = _cmul((Q(1), t), _cinv((Q(1), -t)))
        for j in range(21):
            # Integrate the finite polynomial L_j(R), term by term:
            # E[R^r exp(itR)] = r!/(1-it)^(r+1).
            terms = [tuple(Q((-1)**r * comb(j, r)) * z
                           for z in _cpow(laplace, r+1)) for r in range(j+1)]
            aj = (sum(x[0] for x in terms), sum(x[1] for x in terms))
            b = _cmul(phase, _cpow((aj[0], -aj[1]), 2))
            assert b[0] == d[j], ('Laguerre/phase mismatch', t, j)
            rho = s/(1+s)
            assert d[j]**2 <= (1/(1+s))**2 * rho**(2*j)
            checks += 2
        assert sum(map(abs, d)) + rho**21 <= 1
        checks += 1
    assert coefficients(Q(1), 5) == [Q(1,2), 0, Q(-1,8), 0, Q(1,32), 0]
    assert coefficients(0, 10) == [Q(1)] + [Q(0)]*10
    # A grade-three base has first nonzero coefficient at index one.
    assert transform([0, Q(3,4)], 1)['head'] == [0, Q(3,8)]
    # Two independent neutral buffers commute, with the same exact tail rules.
    base = [Q(7,10), Q(1,10), Q(-1,20)]
    left = transform(transform(base, Q(1,4), n=12)['head'], Q(3,2))['head']
    right = transform(transform(base, Q(3,2), n=12)['head'], Q(1,4))['head']
    assert left == right
    # Negative controls: missing phase correction and missing symmetrization
    # do not pass the identities above (except at t=0).
    t = Q(1,2)
    uncorrected = _cpow(_cinv((Q(1), t)), 2)
    assert uncorrected[0] != coefficients(t*t, 0)[0]
    assert uncorrected[1] != 0
    excluded = transform([Q(1,4),Q(1,32)],Q(1,64))['head']
    assert excluded[0]-excluded[1]-Q(7,32) == Q(2681,8788000)
    for t in map(Q,['1/4','1/2','1','2']):
        for h in map(Q,['-2','-1/4','1/4','2']):
            extra = _cmul((Q(1),t*h),_cinv((Q(1),-t*h)))
            phase = _cmul(extra,_cmul((Q(1),t),_cinv((Q(1),-t))))
            d = coefficients(t*t,8,h)
            for j in range(9):
                aj = _cmul(_cpow((Q(0),t),j),_cpow(_cinv((Q(1),t)),j+1))
                b = _cmul(phase,_cpow(aj,2))
                assert b[0] == d[j]
                rho=t*t/(1+t*t)
                assert d[j]**2 <= (1/(1+t*t))**2*rho**(2*j)
                checks += 2
    return {'status': 'PASS exact rational identities',
            'independent_laplace_and_envelope_checks': checks,
            'additional_checks': 7}


def pool_diagnostic(source, s_grid, output, incumbent=None, phase_grid=('0',)):
    """Floating LP, charging inherited bounds and the added convolution tail.

    Source must contain actual kernel heads in `heads`, not preprocessor
    polynomials stored in the phase pool's misleadingly named `columns`.
    A zero source charge remains an UNCERTIFIED omission if the source says
    its tails are incomplete.  Source provenance is retained in the result.
    """
    import numpy as np
    from scipy.optimize import linprog
    data = json.loads(Path(source).read_text())
    if 'heads' not in data:
        raise ValueError('requires actual kernel `heads`; preprocessor columns are not heads')
    original = np.asarray(data['heads'], dtype=float)
    n = original.shape[1]-1
    charges = np.asarray(data.get('tail_charges', data.get('phase_tail_charges',
                              [0.]*len(original))), dtype=float)
    definitions = list(data.get('rows', [{} for _ in original]))
    if incumbent:
        inc = json.loads(Path(incumbent).read_text())
        head = np.asarray(inc['head'], dtype=float)
        if len(head) != n+1:
            raise ValueError('incumbent head length must match pool')
        original = np.vstack([original, head])
        charges = np.r_[charges, float(inc['tail_bound'])]
        definitions.append({'incumbent': str(incumbent), 'definition': inc.get('definition')})

    def solve(C, T):
        # min_lambda max_column lambda.c - tail, lambda0=1, |lambda_k|<=1.
        lp = linprog(np.r_[np.zeros(n), 1.],
            A_ub=np.c_[C[:,1:], -np.ones(len(C))], b_ub=T-C[:,0],
            bounds=[(-1,1)]*n+[(None,None)], method='highs',
            options={'dual_feasibility_tolerance':1e-9,
                     'primal_feasibility_tolerance':1e-9})
        if not lp.success:
            raise RuntimeError(lp.message)
        w = -lp.ineqlin.marginals
        mix = w@C
        witness = np.r_[1.,lp.x[:-1]]
        dual_upper = float(np.max(C@witness-T))
        charged = float(mix[0]-abs(mix[1:]).sum()-w@T)
        return {'lp_value': float(lp.fun), 'head_score': float(mix[0]-abs(mix[1:]).sum()),
                'charged_score': charged, 'dual_upper':dual_upper,
                'primal_dual_gap':dual_upper-charged,
                'paid_tail': float(w@T), 'weights': w,
                'witness': witness, 'mixture': mix}

    baseline = solve(original, charges)
    all_heads = [original]
    all_charges = [charges]
    labels = [(i, '0','0') for i in range(len(original))]
    for s in s_grid:
        sf = float(Q(s)); rho = sf/(1+sf)
        leakage = np.abs(original) @ rho**np.arange(n+1, 0, -1)
        for phase in phase_grid:
            d = np.array([float(x) for x in coefficients(s,n,phase)])
            heads = np.array([np.convolve(c,d)[:n+1] for c in original])
            all_heads.append(heads)
            all_charges.append(charges+leakage)
            labels.extend((i,str(s),str(phase)) for i in range(len(original)))
    C = np.vstack(all_heads); T = np.concatenate(all_charges)
    solved = solve(C, T)
    active = np.flatnonzero(solved['weights']>1e-8)
    result = {'status': 'FLOAT discovery only; inherited head errors/tails not upgraded',
        'source': str(source), 'source_status': data.get('status', data.get('classification')),
        'index': n, 'source_columns': len(original), 'closed_columns': len(C),
        's_grid': list(map(str,s_grid)),
        'phase_grid': list(map(str,phase_grid)),
        'baseline': {k: baseline[k] for k in ['lp_value','head_score','charged_score','paid_tail','dual_upper','primal_dual_gap']},
        'closure': {k: solved[k] for k in ['lp_value','head_score','charged_score','paid_tail','dual_upper','primal_dual_gap']},
        'charged_gain': solved['charged_score']-baseline['charged_score'],
        'active': [{'column':int(i), 'source_index':labels[i][0], 's':labels[i][1],
                    'phase':labels[i][2],
                    'weight':float(solved['weights'][i]),
                    'definition': definitions[labels[i][0]]} for i in active],
        'witness': solved['witness'].tolist(),
        'mixture': solved['mixture'].tolist(),
        'incumbent_certificate_denominator': 0.711947153313208982,
        'new_endpoint': False}
    Path(output).write_text(json.dumps(result,indent=2)+'\n')
    return {k:result[k] for k in ['status','source_columns','closed_columns',
                                'baseline','closure','charged_gain']}


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--self-test', action='store_true')
    ap.add_argument('--s', default='1/4')
    ap.add_argument('--phase',default='0',help='extra relative Cayley phase h')
    ap.add_argument('--index', type=int, default=16)
    ap.add_argument('--input', type=Path, help='JSON with exact head and a valid tail_bound')
    ap.add_argument('--pool', type=Path, help='floating discovery source with kernel heads')
    ap.add_argument('--incumbent', type=Path, help='optional head/tail JSON of matching length')
    ap.add_argument('--s-grid', default='1/1000000,1/10000,1/1000,1/100,1/25,1/10,1/4,1/2,1,2,4')
    ap.add_argument('--phase-grid',default='0',help='comma-separated extra Cayley phases')
    ap.add_argument('--output', type=Path)
    args = ap.parse_args()
    if args.self_test:
        print(json.dumps(self_test(),sort_keys=True))
    elif args.pool:
        if not args.output:
            ap.error('--pool requires --output')
        print(json.dumps(pool_diagnostic(args.pool,args.s_grid.split(','),args.output,args.incumbent,args.phase_grid.split(',')),sort_keys=True))
    else:
        out = {'s':str(Q(args.s)), 'phase':str(Q(args.phase)), 'index':args.index,
               'multiplier_coefficients': list(map(str,coefficients(args.s,args.index,args.phase))),
               'multiplier_tail_bound':str((Q(args.s)/(1+Q(args.s)))**(args.index+1))}
        if args.input:
            source = json.loads(args.input.read_text())
            transformed = transform(source['head'],args.s,args.index,source['tail_bound'],args.phase)
            out['input_definition'] = source.get('definition')
            out['transformed'] = {k: list(map(str,v)) if isinstance(v,list)
                                  else v if isinstance(v,bool) else str(v)
                                  for k,v in transformed.items()}
        encoded = json.dumps(out,indent=2)+'\n'
        if args.output:
            args.output.write_text(encoded)
        else:
            print(encoded,end='')


if __name__ == '__main__':
    main()
