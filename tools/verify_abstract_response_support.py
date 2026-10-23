#!/usr/bin/env python3
"""Rigorous fixed-law response support upper bound, using python-flint/Arb.

This tests a saved ABSTRACT radial law, not Gaussian-cubic realizability.
Every integral cell is bounded by Cauchy--Schwarz; this is not an unvalidated
quadrature rule. The abstract-law interval verifiers require python-flint 0.9.0.
"""
import argparse
from fractions import Fraction as Q
import hashlib
import json
from pathlib import Path
import sys
import time

from flint import arb, ctx

sys.path.insert(0, str(Path(__file__).resolve().parent))
from response_lift_model import targets


def ball(q):
    q = Q(q)
    return arb(q.numerator)/q.denominator


def upper_moments(s):
    """Integral from s^2 to infinity of R^k exp(-R), k=0,1/2,...,3."""
    r, e = s*s, (-s*s).exp()
    ghalf = arb.pi().sqrt()*s.erfc()
    g3half = ghalf/2+s*e
    g5half = 3*g3half/2+r*s*e
    return [e, g3half, (1+r)*e, g5half,
            (2+2*r+r*r)*e, 5*g5half/2+r*r*s*e,
            (6+6*r+3*r*r+r*r*r)*e]


def support_upper(data):
    ctx.prec = data['precision_bits']
    nr, nt = data['radial_cells'], data['phase_cells']
    if nr <= 0 or nt <= 0 or nt % 2:
        raise ValueError('Positive radial count and even positive phase count required')
    stop = ball(data['sqrt_radial_stop'])
    y = list(map(ball, data['separator']))
    if len(y) != 5 or not stop > 0:
        raise ValueError('Five separator coefficients and positive radial stop required')
    a1, a3 = y[0]-2*y[1], y[1]
    b0, b2, c2 = y[2]-y[3], y[3], y[4]/arb(2).sqrt()
    step = arb.pi()/nt
    sinc1 = step.sin()/step
    sinc2 = (2*step).sin()/(2*step)
    angular = [(((2*j+1)*step).cos()*sinc1,
                (2*(2*j+1)*step).cos()*sinc2) for j in range(nt//2)]
    tails = [upper_moments(stop*i/nr) for i in range(nr+1)]
    radial = [[tails[i][j]-tails[i+1][j] for j in range(7)] for i in range(nr)]
    total = arb(0)
    eu = Q(0)
    for atom in data['support']:
        v, w = ball(atom['v']), ball(atom['weight'])
        eu += Q(atom['weight'])*Q(atom['v'])**2
        subtotal = arb(0)
        for m in radial:
            d = (a1*a1*m[2]+2*a1*a3*m[4]+a3*a3*m[6]
                 +v*v*(b0*b0*m[0]+2*b0*b2*m[2]+(b2*b2+c2*c2)*m[4]))
            e = v*(a1*b0*m[1]+(a3*b0+a1*(b2+c2))*m[3]+a3*(b2+c2)*m[5])
            f = v*v*c2*(b0*m[2]+b2*m[4])
            for co, co2 in angular:
                # Both factors are exact cell integrals. A nonpositive
                # enclosure fails closed rather than clipping roundoff.
                squared = m[0]*(d+2*e*co+2*f*co2)
                if not squared > 0:
                    raise ArithmeticError('Cell positivity was not certified; raise precision')
                subtotal += squared.sqrt()
        total += w*2*subtotal/nt
    m = tails[-1]
    tail_second = (a1*a1*m[2]+2*a1*a3*m[4]+a3*a3*m[6]
                   +ball(eu)*(b0*b0*m[0]+2*b0*b2*m[2]+(b2*b2+c2*c2)*m[4]))
    tail = (m[0]*tail_second).sqrt()
    return total+tail, tail


def read_sources(args):
    """Bind the compact certificate to the unchanged full source artifacts."""
    data = json.loads(args.certificate.read_text())
    for name, path in [('audit', args.audit), ('law', args.law)]:
        if hashlib.sha256(path.read_bytes()).hexdigest() != data[name+'_sha256']:
            raise ValueError(name+' source hash mismatch')
    row = next(r for r in json.loads(args.audit.read_text())['selected']
               if r['index'] == data['index'])
    target = targets(row)
    law = json.loads(args.law.read_text())
    if target != data['target'] or law['support'] != data['support']:
        raise ValueError('Source target/law mismatch')
    if law['index'] != data['index'] or law['point']['t'] != target['t'] or law['point']['tau'] != target['tau']:
        raise ValueError('Radial law point does not match the audited contact')
    if sum((Q(a['weight']) for a in data['support']), Q(0)) != 1 or any(Q(a['weight']) < 0 or Q(a['v']) < 0 for a in data['support']):
        raise ValueError('Not a probability law on nonnegative radii')
    return data, target


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('certificate', type=Path)
    p.add_argument('--audit', type=Path, required=True)
    p.add_argument('--law', type=Path, required=True)
    args = p.parse_args()
    start = time.monotonic()
    data, target = read_sources(args)
    t, tau, eps, beta = [Q(target[a]) for a in ['t', 'tau', 'epsilon', 'beta']]
    alpha = list(map(Q, target['gate_alpha']))
    c = [t, -2*beta/eps, tau, alpha[0]*tau, alpha[1]*tau]
    y = list(map(Q, data['separator']))
    payoff = sum((a*b for a, b in zip(c, y)), Q(0))
    upper, tail = support_upper(data)
    cap = Q(data['support_upper_rational'])
    if not upper < ball(cap):
        raise ValueError('The rational support upper bound was not certified')
    if not payoff > cap:
        raise ValueError('The claimed separator has no exact positive gap')
    ca, cb, cc = map(Q, target['gate_C'])
    det = ca*cc-cb*cb
    if not eps > 0 or not ca > 0 or not det > 0:
        raise ValueError('The retained penalty metric is not positive definite')
    denom = 2*y[1]**2/eps+(cc*y[3]**2-2*cb*y[3]*y[4]+ca*y[4]**2)/det
    recovery = (payoff-cap)**2/denom
    floor = Q(data['penalty_lower_rational'])
    if not recovery > floor > 0:
        raise ValueError('The claimed positive penalty lower bound failed')
    print(json.dumps({'status': 'PASS', 'index': data['index'],
                     'support_enclosure': str(upper), 'tail_upper_enclosure': str(tail),
                     'rational_support_upper': str(cap),
                     'target_payoff_float': float(payoff),
                     'strict_separation_gap_lower_float': float(payoff-cap),
                     'retained_penalty_lower': str(floor),
                     'retained_penalty_lower_float': float(floor),
                     'computed_recovery_float': float(recovery),
                     'cell_count': len(data['support'])*data['radial_cells']*data['phase_cells'],
                     'seconds': time.monotonic()-start,
                     'scope': 'All bounded response pairs for this fixed abstract law and fixed t,tau; no Gaussian-cubic or endpoint claim.'}, indent=2))


if __name__ == '__main__':
    main()
