#!/usr/bin/env python3
"""Numerical tail-priced separation using frozen finite phase circuits.

For theta=49/250, every real complete response spectrum satisfies
D_full <= (1+theta)p+(theta-1)s3+(1+theta)s5-theta*C1.
The final term is an identity-operator price. Best response therefore keeps
the other phase itself, producing phase circuits beyond polynomial phases.
All discovery and holdout integration here is NUMERICAL, not a certificate.
The separate exact Mehler bridge applies to every frozen charge-one circuit.
Real columns are realized by mixing each pair equally with its conjugation
reflection; the necessary score applies to that mixture. We set phase(0)=0.
"""
import argparse
import hashlib
import json
from pathlib import Path
import sys
import time

import numpy as np

sys.path.insert(0, str(Path(__file__).resolve().parent))
from quintic_local_oracle import coefficient, features, grouped, known_phase_z, packed, phase, unpacked


def fit(phi, start, iterations, theta):
    diagonal = np.array([1+theta, theta-1, theta-1, 1+theta, 1+theta, 1+theta])
    g = phase(start@phi)
    cg = coefficient(phi, g)
    circuit = {'initial_g': packed(start), 'steps': []}
    previous = -np.inf
    for iteration in range(iterations):
        vf = diagonal*cg
        f = phase(vf@phi-theta*g)
        cf = coefficient(phi, f)
        vg = diagonal*cf
        g = phase(vg@phi-theta*f)
        cg = coefficient(phi, g)
        score = float(np.vdot(cf, diagonal*cg).real-theta*np.mean(f.conj()*g).real)
        if score < previous-1e-10:
            raise ArithmeticError('Discrete identity-priced best response decreased')
        circuit['steps'].append({'vf': packed(vf), 'vg': packed(vg)})
        if score-previous < 1e-10:
            break
        previous = score
    circuit['discovery_score'] = score
    circuit['depth'] = len(circuit['steps'])
    return circuit


def evaluate(phi, circuit, theta):
    g = phase(unpacked(circuit['initial_g'])@phi)
    for step in circuit['steps']:
        f = phase(unpacked(step['vf'])@phi-theta*g)
        g = phase(unpacked(step['vg'])@phi-theta*f)
    axis = (unpacked(circuit['steps'][-1]['vf'])[0]
            +unpacked(circuit['steps'][-1]['vg'])[0])
    orient = axis/abs(axis) if abs(axis) > 0 else 1
    pz, known = phase(phi[0]), known_phase_z()
    raw_f, raw_g = coefficient(phi, f), coefficient(phi, g)
    raw_p, raw_s3, raw_s5 = grouped(raw_f, raw_g)
    cf = known+coefficient(phi, orient.conjugate()*f-pz)
    cg = known+coefficient(phi, orient.conjugate()*g-pz)
    p, s3, s5 = grouped(cf, cg)
    c1 = float(np.mean(f.conj()*g).real)
    price = (1+theta)*p+(theta-1)*s3+(1+theta)*s5-theta*c1
    raw_price = (1+theta)*raw_p+(theta-1)*raw_s3+(1+theta)*raw_s5-theta*c1
    necessary = p-abs(s3)-abs(s5)-abs(c1-p-s3-s5)
    return {'p': float(p), 's3': float(s3), 's5': float(s5), 'C1': c1,
            'priced_objective': float(price),
            'raw_priced_objective': float(raw_price),
            'necessary_full_tail_score_upper': float(necessary),
            'f_coefficients': packed(cf), 'g_coefficients': packed(cg)}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--out', type=Path, required=True)
    parser.add_argument('--discovery-logn', type=int, default=15)
    parser.add_argument('--holdout-logn', type=int, default=18)
    parser.add_argument('--scrambles', type=int, default=3)
    parser.add_argument('--starts', type=int, default=6)
    parser.add_argument('--iterations', type=int, default=30)
    args = parser.parse_args()
    if args.starts < 2 or min(args.iterations, args.scrambles) < 1:
        raise ValueError('At least two starts and positive search limits are required')
    begun, theta = time.monotonic(), 49/250
    phi = features(args.discovery_logn, 3602026)
    rng = np.random.default_rng(9612026)
    starts = [np.array([1, 0, 0, 0, 0, 0], complex),
              np.array([1, .239247, .239247, 0, 0, 0], complex)]
    while len(starts) < args.starts:
        v = .2*(rng.standard_normal(6)+1j*rng.standard_normal(6)); v[0] += 1
        starts.append(v)
    circuits = sorted([fit(phi, s, args.iterations, theta) for s in starts],
                      key=lambda c: -c['discovery_score'])[:3]
    holdouts = []
    for j in range(args.scrambles):
        test = features(args.holdout_logn, 1182026+j)
        holdouts.append({'seed': 1182026+j,
                         'evaluations': [evaluate(test, c, theta) for c in circuits]})
    output = {'status': 'NUMERICAL_ONLY', 'scope': __doc__, 'theta': '49/250',
              'parameters': vars(args) | {'out': str(args.out)}, 'frozen_circuits': circuits,
              'holdouts': holdouts, 'seconds': time.monotonic()-begun,
              'source_sha256': hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
              'feature_source_sha256': hashlib.sha256(Path(__file__).with_name('quintic_local_oracle.py').read_bytes()).hexdigest(),
              'finite_priced_bridge': 'For m>=2: |priced_m-priced_limit| <= (201/250)/(m+1)+(299/250)*4/m. The identity term C1 agrees exactly. QMC error remains uncertified.',
              'finite_necessary_score_bridge': 'The necessary score changes by at most 2/(m+1)+8/m. This is separate from uncertified QMC error.'}
    args.out.write_text(json.dumps(output, indent=2)+'\n')
    print(json.dumps({'status': output['status'], 'discovery_scores': [c['discovery_score'] for c in circuits],
                      'holdout_priced': [[v['priced_objective'] for v in h['evaluations']] for h in holdouts],
                      'necessary_score_uppers': [[v['necessary_full_tail_score_upper'] for v in h['evaluations']] for h in holdouts],
                      'seconds': output['seconds']}, indent=2))


if __name__ == '__main__':
    main()
