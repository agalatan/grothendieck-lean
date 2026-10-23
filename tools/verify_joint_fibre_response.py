#!/usr/bin/env python3
"""Arb replay of an actual randomized-section joint-fibre response.

Certifies a FEASIBLE VALUE, hence a lower bound on the fixed-law relaxed
supremum. It never certifies a global upper bound or a Grothendieck endpoint.
The fourfold orbit is a latent mixture, not an average of response functions.
Requires python-flint==0.9.0. All optimization is outside this checker.
"""
import argparse
from fractions import Fraction as Q
import hashlib
import json
from pathlib import Path
import sys
import time

from flint import acb, arb, ctx

sys.path.insert(0, str(Path(__file__).resolve().parent))
from verify_abstract_response_support import ball, upper_moments, read_sources
from response_lift_model import psd_pivots


def joint_source(data, target, law, profiles_path):
    if hashlib.sha256(profiles_path.read_bytes()).hexdigest() != data['profiles_sha256']:
        raise ValueError('Source profile hash mismatch')
    profiles = json.loads(profiles_path.read_text())
    eps = Q(target['epsilon'])
    if Q(law['witness_epsilon']) != eps:
        raise ValueError('Witness epsilon mismatch')
    m = [[Q(0) for _ in range(12)] for _ in range(12)]
    ell, beta, forcing, row_weights = Q(0), Q(0), [Q(0)]*3, {}
    for item in law['rows']:
        r, w = item['row'], Q(item['weight'])
        wanted = list(map(Q, r['E']))+list(map(Q, r['b']))+[Q(r['ell']), Q(r['beta']), Q(r['delta'])]
        matches = [j for j, p in enumerate(profiles) if
                   list(map(Q, p['theta'][:6]))+list(map(Q, p['theta'][10:13]))+
                   list(map(Q, p['theta'][13:15]))+[Q(p['theta'][9])] == wanted]
        if len(matches) != 1 or w < 0:
            raise ValueError('Source row must match one exact profile with positive weight')
        j = matches[0]
        if Q(profiles[j]['eps']) != eps:
            raise ValueError('Source profile epsilon mismatch')
        row_weights[j] = row_weights.get(j, Q(0))+w
        theta = list(map(Q, profiles[j]['theta']))
        e = [[theta[0], theta[1], theta[2]], [theta[1], theta[3], theta[4]],
             [theta[2], theta[4], theta[5]]]
        rr = [[theta[6], theta[7]], [theta[7], theta[8]]]
        for start, block in [(0, e), (3, e), (6, rr), (8, rr)]:
            for a in range(len(block)):
                for b in range(len(block)):
                    m[start+a][start+b] += w*block[a][b]
        eps = Q(target['epsilon'])
        m[10][10] += w*eps
        m[11][11] += w*eps
        ell += w*theta[13]
        beta += w*theta[14]
        for a in range(3):
            forcing[a] += w*theta[9]*(theta[10+a]+int(a == 0))
    audit_weights = dict((int(j), Q(w)) for j, w in data['source_row_weights'])
    if row_weights != audit_weights or sum(row_weights.values()) != 1:
        raise ValueError('Mixed row weights mismatch')
    if ell != Q(law['row_parameters']['ell']) or beta != Q(target['beta']):
        raise ValueError('Mixed visible forcing mismatch')
    psd_pivots(m)
    if [m[1][1], m[1][2], m[2][2]] != list(map(Q, target['gate_C'])):
        raise ValueError('Mixed gate matrix mismatch')
    ca, cb, cc = map(Q, target['gate_C'])
    det = ca*cc-cb*cb
    if not ca > 0 or not det > 0:
        raise ValueError('Mixed gate matrix must be positive definite')
    h = [m[0][1]+forcing[1], m[0][2]+forcing[2]]
    alpha = [(-cc*h[0]+cb*h[1])/det, (cb*h[0]-ca*h[1])/det]
    price = m[0][0]-eps+2*forcing[0]+sum(a*b for a,b in zip(alpha,h))
    if alpha != list(map(Q, target['gate_alpha'])) or price != Q(law['row_parameters']['price']):
        raise ValueError('Mixed gate minimizer or completed-square price mismatch')
    return m, ell, beta, forcing


def integrated_grid(data):
    nr, nt = data['radial_cells'], data['phase_cells']
    if nr <= 0 or nt <= 0 or nt % 2 or not ball(data['sqrt_radial_stop']) > 0:
        raise ValueError('Invalid radial/phase grid')
    stop, root2 = ball(data['sqrt_radial_stop']), arb(2).sqrt()
    step = arb.pi()/nt
    angular = []
    for j in range(nt):
        angle = (2*j+1)*step
        p1 = acb(angle.cos(), angle.sin())*(step.sin()/step)
        p2 = acb((2*angle).cos(), (2*angle).sin())*((2*step).sin()/(2*step))
        angular.append((p1, p2))
    tails = [upper_moments(stop*i/nr) for i in range(nr+1)]
    grid = []
    imaginary = acb(0, 1)
    for i in range(nr):
        mm = [(tails[i][k]-tails[i+1][k])/nt for k in range(4)]
        for p1, p2 in angular:
            u, radial, z2 = acb(mm[0]), acb(mm[2]-mm[0]), mm[2]*p2/root2
            z, z3 = mm[1]*p1, (mm[3]-2*mm[1])*p1
            basis = [u, radial, z2, imaginary*u, imaginary*radial, -imaginary*z2,
                     z, z3/root2, imaginary*z, imaginary*z3/root2,
                     z.conjugate(), imaginary*z.conjugate()]
            grid.append((basis, [b.conjugate() for b in basis], z, z3))
    return grid


def branch_moments(branch, grid, scale):
    if branch.get('kind') == 'zero':
        return [arb(0)]*12, arb(0), arb(0)
    d, lc = list(map(ball, branch['D'])), list(map(ball, branch['L']))
    if len(d) != 12 or len(lc) != 2:
        raise ValueError('A phase branch needs twelve residual and two visible coefficients')
    coefficients = [arb(0) for _ in range(12)]
    m0, m1 = arb(0), arb(0)
    for basis, conjugates, z, z3 in grid:
        l = lc[0]*z+lc[1]*z3
        p = sum((a*b for a, b in zip(d, basis)), acb(0))
        af, ag = l+p, l-p
        nf, ng = abs(af), abs(ag)
        if not nf > 0 or not ng > 0:
            raise ArithmeticError('Phase numerator not certified nonzero; increase precision')
        f, g = af/(nf*scale), ag/(ng*scale)
        h, k = (f+g)/2, (f-g)/2
        for j in range(12):
            coefficients[j] += (k*conjugates[j]).real
        m0 += (h*z.conjugate()).real
        m1 += (h*z3.conjugate()).real
    return coefficients, m0, m1


def quadratic(matrix, v):
    return sum((ball(matrix[i][j])*v[i]*v[j] for i in range(len(v))
                for j in range(len(v)) if matrix[i][j]), arb(0))


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('certificate', type=Path)
    p.add_argument('--audit', type=Path, required=True)
    p.add_argument('--law', type=Path, required=True)
    p.add_argument('--profiles', type=Path, required=True)
    args = p.parse_args()
    start = time.monotonic()
    data, target = read_sources(args)
    ctx.prec = data['precision_bits']
    law = json.loads(args.law.read_text())
    m, ell, beta, forcing = joint_source(data, target, law, args.profiles)
    row = next(r for r in json.loads(args.audit.read_text())['selected'] if r['index'] == data['index'])
    if data['source_row_weights'] != row['rows']:
        raise ValueError('Audit row weights mismatch')
    if sum((Q(a['weight'])*Q(a['v'])**2 for a in data['support']), Q(0)) != 1:
        raise ValueError('Normalized remote variable required')
    if len(data['atoms']) != len(data['support']):
        raise ValueError('Incomplete radial support')
    scale = ball(data['scale'])
    if not scale > 1:
        raise ValueError('An interior response radius is required for moment repair')
    grid = integrated_grid(data)
    profiles = []
    visible, cubic, remote = arb(0), arb(0), [arb(0) for _ in range(3)]
    for atom, source in zip(data['atoms'], data['support']):
        if atom['v'] != source['v']:
            raise ValueError('Atom radius mismatch')
        if sum((Q(b['probability']) for b in atom['branches']), Q(0)) != 1:
            raise ValueError('Each conditional mixture must have total probability one')
        v, weight = ball(source['v']), ball(source['weight'])
        for branch in atom['branches']:
            probability = Q(branch['probability'])
            if probability < 0:
                raise ValueError('Negative branch probability')
            if not probability:
                continue
            k, a, b = branch_moments(branch, grid, scale)
            w = weight*ball(probability)
            profiles.append((v, w, k))
            visible += w*a
            cubic += w*b
            for j in range(3):
                remote[j] += w*v*k[j]
    t, tau, eps = [ball(target[a]) for a in ['t', 'tau', 'epsilon']]
    # The fourfold mixture makes all five target moments real, and b0(h)=0.
    # These two bounded analytic terms repair the remaining equalities exactly.
    a0, a2 = 4*(t-visible), 2*(tau-remote[0])
    vmax = ball(max(Q(a['v']) for a in data['support']))
    repair = abs(a0)/2+vmax*abs(a2)
    norm = 1/scale+repair
    if not norm < ball(data['response_norm_upper_rational']) < 1:
        raise ValueError('The repaired response disk bound failed')
    cubic -= a0/4
    remote = [arb(0) for _ in range(3)]
    quad, odd = arb(0), arb(0)
    repaired = []
    for v, w, k in profiles:
        k[0] += a2*v/2
        k[1] -= a2*v/4
        repaired.append((v, w, k))
        quad += w*quadratic(m, k)
        odd += w*sum((ball(m[i][j])*k[i]*k[j] for i in range(6, 12)
                     for j in range(6, 12) if m[i][j]), arb(0))
        for j in range(3):
            remote[j] += w*v*k[j]
    if not (remote[0]-tau).contains(0):
        raise ArithmeticError('Exact remote moment repair identity failed')
    ca, cb, cc = map(ball, target['gate_C'])
    alpha = list(map(ball, target['gate_alpha']))
    u, v = remote[1]-alpha[0]*tau, remote[2]-alpha[1]*tau
    penalty = eps*(cubic+2*ball(beta)/eps)**2/2+ca*u*u+2*cb*u*v+cc*v*v
    base = t*t-2*ball(ell)*t+2*ball(beta)**2/eps-ball(law['row_parameters']['price'])*tau*tau
    fibre = quad+2*ball(ell)*t+2*ball(beta)*cubic+2*tau*sum(
        (ball(a)*b for a, b in zip(forcing, remote)), arb(0))
    score = base+fibre-penalty
    # Independent cancellation identity: keep branchwise covariance, including
    # the auxiliary coin. Averaging the K vectors before squaring is invalid.
    residual = arb(0)
    for radius, w, k in repaired:
        rr = k[:]
        for j in range(3):
            rr[j] -= radius*remote[j]
        residual += w*quadratic(m, rr)
    cancelled = t*t-eps*cubic*cubic/2+eps*tau*tau+residual
    if not (score-cancelled).contains(0):
        raise ArithmeticError('Independent primal cancellation failed')
    lower, upper = ball(data['score_lower_rational']), ball(data['score_upper_rational'])
    if not lower < score < upper:
        raise ValueError('The stated feasible-value enclosure failed')
    print(json.dumps({'status': 'PASS', 'index': data['index'],
                     'branches_verified': len(profiles), 'fourfold_orbit_per_branch': 4,
                     'conditional_cells_per_branch': len(grid),
                     'moment_repair_coefficients': list(map(str, [a0, a2])),
                     'response_norm_upper_enclosure': str(norm),
                     'visible_cubic_moment': str(cubic), 'remote_moments': list(map(str, remote)),
                     'conditional_quadratic': str(quad), 'odd_sector_quadratic': str(odd),
                     'selected_penalty': str(penalty), 'fibre_expression': str(fibre),
                     'feasible_score_enclosure': str(score),
                     'score_lower_rational': data['score_lower_rational'],
                     'score_upper_rational': data['score_upper_rational'],
                     'exact_contact_after_repair': True, 'seconds': time.monotonic()-start,
                     'scope': 'Actual bounded randomized sections under an abstract radial law. A feasible-value lower bound, not a global upper bound or Gaussian-cubic realization.'}, indent=2))


if __name__ == '__main__':
    main()
