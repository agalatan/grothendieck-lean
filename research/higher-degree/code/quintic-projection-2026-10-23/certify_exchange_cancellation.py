#!/usr/bin/env python3
"""Arb certificate for a frozen finite-Gaussian three-response cancellation.

The analytic input is docs/EXACT_QUINTIC_PROJECTION_2026-10-23.md.
Only its finite error bounds are used here: |s3_m-s3_inf|<=1/(m+1),
|s5_m-s5_inf|<=4/m; p is unchanged. The phase_Z column is exact.
Profiles are rational; exact canceling weights are defined by Cramer
formulas in the actual finite coefficients. Displayed rational weights
are proposals only and are not claimed to cancel transcendental moments.
No global response cap and no Grothendieck endpoint are certified.
"""
import argparse
from fractions import Fraction as Q
import hashlib
import json
from pathlib import Path
import time
from flint import arb, ctx
from quintic_phase_moments import arb_moments, bounds, NAMES


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('input', type=Path)
    parser.add_argument('--out', type=Path, required=True)
    args = parser.parse_args()
    started = time.monotonic()
    data = json.loads(args.input.read_text())
    ctx.prec = data['precision_bits']
    m = int(data['finite_m'])
    assert m >= 2 and len(data['profiles']) == 3
    ball = lambda q: arb(Q(q).numerator)/Q(q).denominator
    widen = lambda value, error: value+(-ball(error)).union(ball(error))
    serial = lambda value: {'ball': str(value), 'rational_bounds': list(map(str, bounds(value)))}
    eps, gamma, floor = map(ball, [data['epsilon'], data['gamma'], data['requested_floor']])
    error3, error5 = Q(1, m+1), Q(4, m)
    columns, records = [], []
    for row in data['profiles']:
        if row['kind'] == 'phase_Z':
            p, s3, s5 = arb.pi()/4, arb.pi()/32, 3*arb.pi()/256
            finite = [p,s3,s5]
            record = {'kind': 'phase_Z', 'exact_column': ['pi/4','pi/32','3*pi/256']}
        else:
            values, tails = arb_moments(row['c'], row['b'], data['precision_bits'], all_moments=True)
            a,h,q,v,A,B,_ = values
            p, s3, s5 = a*a, h*h-q*q, v*v-A*A-B*B
            finite = [p,widen(s3,error3),widen(s5,error5)]
            record = dict(row)
            record['moments'] = {name: serial(value) for name,value in zip(NAMES,values)}
            record['tail_bounds'] = {name: str(value) for name,value in zip(NAMES,tails)}
        record['limit_column_p_s3_s5'] = list(map(serial, [p,s3,s5]))
        record['finite_column_p_s3_s5'] = list(map(serial, finite))
        payoff = finite[0]-eps*finite[1]+gamma*finite[2]
        if not payoff > floor:
            raise ArithmeticError('One support payoff failed the requested floor')
        record['finite_support_payoff'] = serial(payoff)
        records.append(record)
        columns.append(finite)

    # phase_Z has exactly s5=(3/8)s3. The other two alphas must straddle 0.
    p0,x0,y0 = columns[0]
    p1,x1,y1 = columns[1]
    p2,x2,y2 = columns[2]
    alpha1,alpha2 = y1-3*x1/8,y2-3*x2/8
    if not alpha1 < 0 < alpha2 or not x1 < 0 or not x2 < 0:
        raise ArithmeticError('The finite cancellation triangle lost its strict signs')
    t1,t2 = alpha2,-alpha1
    X = t1*x1+t2*x2
    D = x0*(t1+t2)-X
    if not D > 0:
        raise ArithmeticError('The finite cancellation denominator is not positive')
    weights = [-X/D,x0*t1/D,x0*t2/D]
    if not all(w > 0 and w < 1 for w in weights):
        raise ArithmeticError('A finite Cramer weight lost positivity')
    # The common lower support payoff bounds the exactly canceled first moment:
    # sum_i lambda_i p_i = sum_i lambda_i (p_i-eps*s3_i+gamma*s5_i)>floor.
    # This avoids any overestimate from interval dependency in Cramer's ratio.
    exact_floor_upper_ceiling = 1/Q(data['requested_floor'])
    # A frozen rational mixture is separately checkable on the bounded rectangle.
    nominal = []
    for value in weights[:2]:
        lo, hi = bounds(value)
        nominal.append(Q(round(float((lo+hi)/2)*10**8),10**8))
    nominal.append(1-sum(nominal))
    mixed = [sum(ball(w)*column[j] for w,column in zip(nominal,columns)) for j in range(3)]
    rectangle_payoffs = [mixed[0]-ball(e)*mixed[1]+ball(g)*mixed[2]
                        for e in ['7/10','19/20'] for g in ['0','1/2']]
    rectangle_floor = ball(data.get('rational_rectangle_requested_floor',data['requested_floor']))
    if not all(value > rectangle_floor for value in rectangle_payoffs):
        raise ArithmeticError('The frozen rational mixture failed the bounded rectangle')
    result = {
        'status': 'PASS', 'scope': __doc__, 'finite_m': str(m),
        'finite_errors': {'s3': str(error3), 's5': str(error5)},
        'epsilon': data['epsilon'], 'gamma': data['gamma'],
        'requested_strict_floor': data['requested_floor'],
        'reciprocal_ceiling_strict': str(exact_floor_upper_ceiling),
        'profiles': records,
        'finite_alpha1': serial(alpha1), 'finite_alpha2': serial(alpha2),
        'finite_Cramer_denominator': serial(D),
        'exact_finite_weight_definitions': ['-X/D','x0*alpha2/D','-x0*alpha1/D'],
        'exact_finite_weight_bounds': list(map(serial,weights)),
        'exact_finite_weight_identity': 'X=alpha2*x1-alpha1*x2; D=x0*(alpha2-alpha1)-X. The three weights sum exactly to 1 and cancel actual finite s3,s5 exactly by algebra.',
        'frozen_rational_weight_proposal': list(map(str,nominal)),
        'frozen_rational_mixture_finite_p_s3_s5': list(map(serial,mixed)),
        'frozen_rational_rectangle': {'epsilon': ['7/10','19/20'], 'gamma': ['0','1/2'],
                                      'requested_strict_floor': data.get('rational_rectangle_requested_floor',data['requested_floor']),
                                      'corner_payoff_bounds': list(map(serial,rectangle_payoffs))},
        'analytic_limit': 'PASS certifies integral enclosures and finite error transfer under the separate analytic Mehler identity; it does not formalize that identity in Lean.',
        'seconds': time.monotonic()-started,
        'input_sha256': hashlib.sha256(args.input.read_bytes()).hexdigest(),
        'verifier_sha256': hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
        'moment_verifier_sha256': hashlib.sha256(Path(__file__).with_name('quintic_phase_moments.py').read_bytes()).hexdigest()
    }
    args.out.write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({key:result[key] for key in ['status','requested_strict_floor','reciprocal_ceiling_strict','frozen_rational_weight_proposal','exact_finite_weight_bounds','seconds']},indent=2),flush=True)


if __name__ == '__main__':
    main()
