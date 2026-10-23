#!/usr/bin/env python3
"""Compile fixed-contact moment prices into one fixed row for all t,tau.

Remote prices are scaled with tau, rather than held fixed. This is exact
algebra and source binding, not a uniform potential cap or endpoint proof.
"""
import argparse
from fractions import Fraction as Q
import hashlib
import json
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
from verify_abstract_response_support import read_sources
from verify_joint_fibre_response import joint_source
from verify_joint_fibre_upper import custom_row


def compile_row(data, target, law, profiles):
    matrix, ell, beta, forcing = joint_source(data, target, law, profiles)
    eps, tau0 = Q(target['epsilon']), Q(target['tau'])
    if tau0 <= 0:
        raise ValueError('The reference contact must have positive remote scale')
    lam = list(map(Q, data['lambda']))
    if len(lam) != 5 or custom_row(matrix, ell, beta, forcing, tau0, lam, eps) != data['custom_row']:
        raise ValueError('Reference prices and source row disagree')
    mu = [x/tau0 for x in lam[2:]]
    coupling = [x+y/2 for x, y in zip(forcing, mu)]
    e1, e2 = matrix[0][1], matrix[0][2]
    ca, cb, cc = map(Q, target['gate_C'])
    det = ca*cc-cb*cb
    inv_quad = lambda x, y: (cc*x*x-2*cb*x*y+ca*y*y)/det
    h1, h2 = e1+coupling[1], e2+coupling[2]
    price = matrix[0][0]-eps+2*coupling[0]-inv_quad(h1, h2)
    alpha = [(-cc*h1+cb*h2)/det, (cb*h1-ca*h2)/det]
    th = list(map(Q, data['custom_row']['theta']))
    th[10:13] = [coupling[j]-int(j == 0) for j in range(3)]
    ellp, betap = ell+lam[0]/2, beta+lam[1]/2
    if th[13:] != [ellp, betap]:
        raise ValueError('Visible repricing failed')
    oldprice = Q(law['row_parameters']['price'])
    oldalpha = list(map(Q, target['gate_alpha']))
    shift_price = oldprice+mu[0]+sum(x*y for x, y in zip(mu[1:], oldalpha))-inv_quad(*mu[1:])/4
    if price != shift_price:
        raise ArithmeticError('Schur repricing identity failed')
    controls = 0
    for t in [Q(0), Q(1, 2), Q(target['t']), Q(1)]:
        for tau in [Q(0), Q(1, 9), tau0, Q(1, 3)]:
            scaled_lam = lam[:2]+[tau*x for x in mu]
            c = [t, -2*beta/eps, tau, oldalpha[0]*tau, oldalpha[1]*tau]
            old = (t*t-2*ell*t+2*beta*beta/eps-oldprice*tau*tau
                -sum(x*y for x,y in zip(scaled_lam,c))+lam[1]**2/(2*eps)
                +inv_quad(*scaled_lam[3:])/4)
            new = t*t-2*ellp*t+2*betap*betap/eps-price*tau*tau
            if old != new:
                raise ArithmeticError('Complete dual constant identity failed')
            if any(tau*a+scaled_lam[j+2]/2 != tau*b
                   for j,(a,b) in enumerate(zip(forcing,coupling))):
                raise ArithmeticError('Priced support shift identity failed')
            controls += 2
    return {'scope': 'One fixed row obtained by scaling remote prices with tau. No uniform-law or Grothendieck cap is certified.',
        'status': 'PASS', 'index': data['index'], 'source_row_weights': data['source_row_weights'],
        'reference_tau': str(tau0), 'reference_lambda': data['lambda'],
        'remote_prices_divided_by_tau': list(map(str, mu)),
        'row': {'eps': str(eps), 'theta': list(map(str, th))},
        'completed_gate_price': str(price), 'gate_minimizer': list(map(str, alpha)),
        'gate_price_shift_controls': 1, 'exact_contact_and_forcing_controls': controls,
        'radius_transfer': 'new_radius=tau0*old_radius; at arbitrary tau use old_radius=(tau/tau0)*v',
        'radius_polynomial_transfer': ['q0', 'q1/tau0', 'q2/tau0^2'],
        'uniform_dual_expression': 't^2-2*ell_prime*t+2*beta_prime^2/eps + E_nu Psi_new(tau*v) - completed_gate_price*tau^2'}


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('certificate', type=Path)
    p.add_argument('--audit', type=Path, required=True)
    p.add_argument('--law', type=Path, required=True)
    p.add_argument('--profiles', type=Path, required=True)
    p.add_argument('--out', type=Path, required=True)
    a = p.parse_args()
    data, target = read_sources(a)
    result = compile_row(data, target, json.loads(a.law.read_text()), a.profiles)
    result['source_sha256'] = {k: hashlib.sha256(v.read_bytes()).hexdigest() for k,v in
        [('certificate', a.certificate), ('audit', a.audit), ('law', a.law), ('profiles', a.profiles)]}
    a.out.write_text(json.dumps(result, indent=2)+'\n')
    print(json.dumps({k: result[k] for k in ['status', 'index', 'gate_price_shift_controls',
        'exact_contact_and_forcing_controls', 'completed_gate_price']}, indent=2))


if __name__ == '__main__':
    main()
