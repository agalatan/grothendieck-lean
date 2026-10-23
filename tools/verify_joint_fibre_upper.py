#!/usr/bin/env python3
"""Global full-fibre upper certificate at one fixed abstract radial law.

Revalidates all cached Gaussian moments with Arb, integrates free cell prices
with the inherited outward paired-majorizer code, checks every quadratic
piece by exact rational LDL, checks whole-line coverage, and assembles the
moment-price bound exactly. No optimizer or local maximum is trusted.
This is not a uniform-law or Grothendieck endpoint certificate.
"""
import argparse
from fractions import Fraction as Q
import hashlib
import json
from pathlib import Path
import sys
import time

import numpy as np

sys.path.insert(0, str(Path(__file__).resolve().parent))
import joint_fibre_majorizer as integration
from response_lift_model import targets
from verify_abstract_response_support import read_sources
from verify_joint_fibre_moments import verify_cache
from verify_joint_fibre_response import joint_source


def line_cover(intervals):
    """Exact coverage of R by closed intervals with None as an infinite end."""
    ordered = sorted(intervals, key=lambda t: (0, Q(0)) if t[0] is None else (1, t[0]))
    if not ordered or ordered[0][0] is not None:
        raise ValueError('The negative half-line is uncovered')
    end = ordered[0][1]
    for lo, hi in ordered[1:]:
        if end is None:
            return
        if lo is not None and lo > end:
            raise ValueError('Gap in the scalar region cover')
        if hi is None:
            end = None
        elif end is not None:
            end = max(end, hi)
    if end is not None:
        raise ValueError('The positive half-line is uncovered')


def custom_row(matrix, ell, beta, forcing, tau, lam, eps):
    theta = [matrix[0][0], matrix[0][1], matrix[0][2], matrix[1][1],
             matrix[1][2], matrix[2][2], matrix[6][6], matrix[6][7], matrix[7][7], Q(1)]
    theta += [tau*forcing[j]+lam[j+2]/2-int(j == 0) for j in range(3)]
    theta += [ell+lam[0]/2, beta+lam[1]/2]
    if not theta[13]-2*theta[14] > 0 or not theta[14] > 0:
        raise ValueError('The inherited radial L bound requires ell-2 beta>0 and beta>0')
    return {'eps': str(eps), 'theta': list(map(str, theta))}


def main():
    if not __debug__:
        raise RuntimeError('The inherited exact checker requires assertions; omit -O/-OO')
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('certificate', type=Path)
    p.add_argument('--audit', type=Path, required=True)
    p.add_argument('--law', type=Path, required=True)
    p.add_argument('--profiles', type=Path, required=True)
    p.add_argument('--moments', type=Path, default=Path(__file__).with_name(
        'joint_fibre_moments_1600_256.json'))
    args = p.parse_args()
    started = time.monotonic()
    data, target = read_sources(args)
    law = json.loads(args.law.read_text())
    matrix, ell, beta, forcing = joint_source(data, target, law, args.profiles)
    if sum((Q(a['weight'])*Q(a['v'])**2 for a in data['support']), Q(0)) != 1:
        raise ValueError('Normalized remote variable required')
    audit = json.loads(args.audit.read_text())
    record = next(r for r in audit['selected'] if r['index'] == data['index'])
    if data['source_row_weights'] != record['rows']:
        raise ValueError('Source row weights mismatch')
    if hashlib.sha256(Path(integration.__file__).read_bytes()).hexdigest() != data['integration_sha256']:
        raise ValueError('The outward integration implementation changed')
    cached = verify_cache(args.moments)
    if cached['sha256'] != data['moments_sha256']:
        raise ValueError('Moment cache hash mismatch')
    lam = list(map(Q, data['lambda']))
    if len(lam) != 5:
        raise ValueError('Five moment prices required')
    t, tau, eps = [Q(target[a]) for a in ['t', 'tau', 'epsilon']]
    row = custom_row(matrix, ell, beta, forcing, tau, lam, eps)
    if row != data['custom_row']:
        raise ValueError('Priced row was not reconstructed exactly')
    setup = integration.Setup(row, json.loads(args.moments.read_text()))
    if len(data['atoms']) != len(data['support']):
        raise ValueError('Incomplete radial atom coverage')
    expected = Q(0)
    piece_count = 0
    ball_constrained = 0
    summaries = []
    for atom, source in zip(data['atoms'], data['support']):
        if atom['v'] != source['v']:
            raise ValueError('Atom mismatch')
        radius = Q(atom['v'])
        direction = list(map(Q, atom.get('direction', ['0']*12)))
        if len(direction) != 12:
            raise ValueError('A direction needs twelve coordinates')
        bounds, intervals = [], []
        for pc in atom['pieces']:
            anchor = np.array(list(map(float, pc['anchor_y'])))
            var = [np.array(list(map(float, v))) for v in pc['variance_vectors']]
            if len(anchor) != 12 or any(len(v) != 12 for v in var):
                raise ValueError('Invalid price proposal dimensions')
            if not np.all(np.isfinite(anchor)) or any(not np.all(np.isfinite(v)) for v in var):
                raise ValueError('Nonfinite price proposal')
            pa, pb = setup.prices(anchor, var)
            if not np.all(pa > 0) or not np.all(pb > 0):
                raise ValueError('Cell prices must be strictly positive')
            c, h, hh = setup.integrate(pa, pb)
            cu, hu, hhu, rho = integration.upper(c, h, hh)
            # Bessel: the twelve real coordinates pack six complex
            # coefficients of an orthonormal visible Gaussian family.
            # Thus ||K||^2 <= E|k|^2 <= 1 for every disk response pair.
            # It suffices to evaluate the Fenchel support bound at m=M K,
            # where m^T Q^2 m <= 1. This optional S-lemma term caps actual
            # responses, and need not cap the unrestricted potential on R^12.
            eta = Q(pc.get('bessel_ball_multiplier', '0'))
            if eta < 0:
                raise ValueError('Negative Bessel ball multiplier')
            effective_q = setup.Q
            if eta:
                ball_constrained += 1
                cu += eta
                effective_q = [[setup.Q[i][j]+eta*sum(setup.Q[i][k]*setup.Q[k][j]
                         for k in range(12)) for j in range(12)] for i in range(12)]
            if pc.get('whole_space', False):
                constraints = []
                intervals.append((None, None))
            else:
                if not any(direction) or pc['sign'] not in [-1, 1]:
                    raise ValueError('Invalid scalar slicing direction')
                sign = pc['sign']
                lo, hi = Q(pc['lo']), None if pc['hi'] is None else Q(pc['hi'])
                la, mu = Q(pc['lam']), Q(pc['mu'])
                if la < 0 or mu < 0 or (hi is None and la != 0) or (hi is not None and hi <= lo):
                    raise ValueError('Invalid S-lemma region or multiplier')
                constraints = [(list(sign*x for x in direction), lo, hi, la, mu)]
                intervals.append((lo, hi) if sign == 1 else
                                 (None if hi is None else -hi, -lo))
            result = integration.piece_quadratic_multi(effective_q, setup.a, cu, hu, hhu, constraints)
            if result is None:
                raise ValueError('Exact quadratic LDL check failed')
            value = result[0]+result[1]*radius+result[2]*radius*radius
            cap = Q(pc['cap_upper'])
            if value > cap:
                raise ValueError('Advertised piece cap was exceeded')
            bounds.append(cap)
            piece_count += 1
        line_cover(intervals)
        cap = max(bounds)
        expected += Q(source['weight'])*cap
        summaries.append({'v': source['v'], 'pieces': len(bounds), 'global_response_cap': str(cap),
                          'global_response_cap_float': float(cap)})
        print(json.dumps(summaries[-1]), flush=True)
    alpha = list(map(Q, target['gate_alpha']))
    ca, cb, cc = map(Q, target['gate_C'])
    det = ca*cc-cb*cb
    if not ca > 0 or not det > 0:
        raise ValueError('Penalty matrix is not positive definite')
    c = [t, -2*beta/eps, tau, alpha[0]*tau, alpha[1]*tau]
    base = t*t-2*ell*t+2*beta*beta/eps-Q(law['row_parameters']['price'])*tau*tau
    constant = base-sum(a*b for a, b in zip(lam, c))+lam[1]**2/(2*eps)
    constant += (cc*lam[3]**2-2*cb*lam[3]*lam[4]+ca*lam[4]**2)/(4*det)
    padding = Q(data['assembly_padding'])
    if padding < 0:
        raise ValueError('A negative assembly allowance is invalid')
    upper = constant+expected+padding
    advertised = Q(data['score_upper_rational'])
    if not upper <= advertised:
        raise ValueError('The assembled fixed-law score exceeded its advertised bound')
    print(json.dumps({'status': 'PASS', 'index': data['index'], 'atoms': len(summaries),
                     'quadratic_regions': piece_count,
                     'bessel_constrained_regions': ball_constrained,
                     'independently_checked_cached_moments': cached['independently_checked_intervals'],
                     'assembled_upper_float': float(upper),
                     'rational_score_upper': str(advertised),
                     'below_500_over_701': advertised < Q(500, 701),
                     'seconds': time.monotonic()-started,
                     'scope': 'Global over all bounded sections and mixtures at this fixed law and contact; no uniform-law, cubic-realization, or endpoint claim.'}, indent=2))


if __name__ == '__main__':
    main()
