#!/usr/bin/env python3
"""Independent exact algebraic replay. This does not prove a Grothendieck bound.

Only stdlib is used. All source paths are inside the authorized grothe repo.
The output deliberately distinguishes checked rational implications from the
inherited Gaussian/interval enclosures, which this script does not regenerate.
"""
from fractions import Fraction as Q
from pathlib import Path
from math import factorial
import argparse
import hashlib
import json

PINS = {
    'handoff/upper-residual/matrix/joint_candidate_exact.json': '4c5f5cad8b2f231c3821873f5822bfb8c55fd5a9b994bf7a4e67b41f517e71e5',
    'handoff/upper-residual/matrix/joint_prefix_certificate.json': '89498abdeb0f2a5827177e2147dd75f0f61346deb935e583f3f59eb4b1a5b4c3',
    'handoff/upper-residual/matrix/baseline_endpoint_result.json': 'e3b0c3d73750036285410e8bf2c61d203530d4f13d55cec8794a9f4d5e032b9f',
    'handoff/upper-residual/taylor/phase_damped_m4_d36_eps1p05.json': '04d581fa45e1d879623a0f233315dcfed39e0aa91c6684d554d0524ac8a71617',
    'handoff/research-third-decimal/upper-polynomial-bridge-20261022/inputs/taylor_comparison_result.json': '5619546626b7588ce64a2229aa58b0d161bde613dbf9a5eaad94a3ef93461915',
}

def require(condition, explanation):
    if not condition:
        raise ValueError(explanation)

def load(root, rel):
    return json.loads((root / rel).read_text())

def ceil_grid(x, scale=10**18):
    return Q(-((-x.numerator * scale) // x.denominator), scale)

def mat(xs):
    return [[Q(x) for x in row] for row in xs]

def add(a, b, sign=1):
    return [[a[i][j] + sign*b[i][j] for j in range(2)] for i in range(2)]

def det(a):
    return a[0][0]*a[1][1] - a[0][1]*a[1][0]

def psd(a):
    return a[0][1] == a[1][0] and a[0][0] >= 0 and a[1][1] >= 0 and det(a) >= 0

def pmul(a, b):
    out = [Q(0)]*(len(a)+len(b)-1)
    for i, x in enumerate(a):
        for k, y in enumerate(b):
            out[i+k] += x*y
    return out

def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--repo', type=Path, default=Path('/Users/alingalatan/workspaces/grothe'))
    ap.add_argument('--output', type=Path, default=Path(__file__).with_name('p3_matrix_candidate.json'))
    args = ap.parse_args()
    root = args.repo.resolve()
    bound_sources = {}
    for rel, expected in PINS.items():
        actual = hashlib.sha256((root/rel).read_bytes()).hexdigest()
        require(actual == expected, 'source hash mismatch: '+rel)
        bound_sources[rel] = actual

    prefix = load(root, 'handoff/upper-residual/matrix/joint_prefix_certificate.json')
    base = load(root, 'handoff/upper-residual/matrix/baseline_endpoint_result.json')
    candidate = load(root, 'handoff/upper-residual/matrix/joint_candidate_exact.json')
    old_incremental = load(root, 'handoff/upper-residual/matrix/endpoint_result.json')
    for rel in ['handoff/upper-residual/matrix/endpoint_result.json',
                'handoff/upper-residual/matrix/matrix_tail_summary.json',
                'handoff/upper-residual/matrix/arithmetic_certificate_L12.json',
                'handoff/upper-residual/matrix/omitted_orders_result.json']:
        bound_sources[rel] = hashlib.sha256((root/rel).read_bytes()).hexdigest()

    # Exact factor-budget admissibility gates; the tensor realization itself is inherited.
    b, eta = Q(candidate['smoothing_b']), Q(candidate['eta'])
    projection = [[1/(1+b*b), b/(1+b*b)], [b/(1+b*b), b*b/(1+b*b)]]
    identity = [[Q(1), Q(0)], [Q(0), Q(1)]]
    metric = [[projection[i][j] + (identity[i][j]-projection[i][j])/eta
               for j in range(2)] for i in range(2)]
    require(metric == mat(candidate['metric']), 'M^-2 identity')
    summed = [[Q(0), Q(0)], [Q(0), Q(0)]]
    for row in candidate['matrices']:
        a, p = mat(row['A']), mat(row['P'])
        require(row['degree'] % 2 == 1, 'odd coefficient degree')
        require(psd(add(p, a)) and psd(add(p, a, -1)), 'coefficient PSD gate')
        summed = add(summed, p)
    gap = add(metric, summed, -1)
    require(gap == mat(candidate['gap']) and psd(gap), 'summed PSD gate')
    require(det(gap) == Q(candidate['gap_determinant']), 'gap determinant')

    # Disk polynomial identity, no assumed numerical phase supremum used here.
    re = pmul([Q(1), Q(0), Q(-1,2)], [Q(1), Q(0), Q(-1,2)])
    im = pmul([Q(0), Q(1), Q(0), Q(-1,6)], [Q(0), Q(1), Q(0), Q(-1,6)])
    re += [Q(0)]*(len(im)-len(re))
    require([a+b for a,b in zip(re, im)] == [Q(1),0,0,0,Q(-1,12),0,Q(1,36)],
            'P3 modulus identity')

    # Four omitted-column HS bounds combine by sum of squares, 14 cutoffs.
    require(len(prefix['union_caps']) == 14, 'union row count')
    for row in prefix['union_caps']:
        bounds = [Q(x) for x in row['coordinate_hs_caps']]
        u = Q(row['union_hs_cap'])
        require(u >= 0 and u*u >= sum(x*x for x in bounds), 'HS union square gate')
        require(Q(row['prefix_error_cap']) == Q(1,25000000000)+Q(11,500)*u+Q(1,10**18),
                'prefix error formula')
    gates = prefix['square_root_gates']
    require(len(gates) == 20, 'square-root gate count')
    for gate in gates:
        x, u = Q(gate['radicand']), Q(gate['upper'])
        require(x >= 0 and u >= 0 and u*u >= x, 'rational square-root gate')

    cross = Q(0)
    error_norm = Q(prefix['rounding_norm_upper'])
    for index, row in enumerate(prefix['dual_rows']):
        scale = Q(row['scale'])
        ell = [Q(x) for x in row['center_norm_lowers_scaled']]
        eps = [Q(x) for x in row['prefix_errors_scaled']]
        a = [Q(x) for x in row['X_band_caps']]
        nu = [Q(x) for x in row['prefix_multipliers']]
        la, at, mu = Q(row['lambda_rational']), Q(row['X_tail_cap']), Q(row['moment_scaled'])
        require(la > 0 and all(x >= 0 for x in nu), 'dual multiplier signs')
        require(all(x > y >= 0 for x,y in zip(ell, eps)), 'positive visible mass gates')
        terms = [la*(mu-sum(x*x for x in ell)), at*at/(4*la),
                 sum(v*x*x for v,x in zip(nu, eps))]
        terms += [(x+2*la*y)**2/(4*(la+sum(nu[i:])))
                  for i,(x,y) in enumerate(zip(a, ell))]
        require(terms == [Q(x) for x in row['dual_terms_scaled']], 'rational quadratic dual')
        dual = sum(terms)*scale
        require(dual == Q(row['dual_upper']), 'dual rescaling')
        power = row['power']
        cross += 2*dual/factorial(power)

        # Reconstruct both tail square-root radicands and the quadratic error.
        tail_squared = scale*scale*(mu-sum((x-y)**2 for x,y in zip(ell,eps)))
        tail_gate, error_gate = gates[14+2*index:16+2*index]
        require(tail_squared == Q(tail_gate['radicand']), 'omitted Hermite mass')
        require(Q(error_gate['radicand']) == Q(tail_gate['upper'])**2+(scale*eps[-1])**2,
                'joint low and tail error')
        error_norm += Q(error_gate['upper'])/factorial(power)
    require(cross == Q(prefix['cross_upper']), 'cross cap')
    quadratic = error_norm*error_norm
    require(quadratic == Q(prefix['quadratic_upper']), 'quadratic cap')
    rounding = 4*Q(prefix['rounding_norm_upper'])
    direct = cross+quadratic+rounding
    r = Q(prefix['remainder_upper'])
    require(direct+2*r+r*r == Q(prefix['comparison_unrounded']), 'archived exponential comparison')
    require(Q(prefix['comparison_unrounded']) <= Q(prefix['comparison_upper']), 'old comparison rounding')

    components = base['components']
    require(Q(components['finite_head_cap']) >= Q(components['center_residual_exact'])+
            Q(components['finite_arithmetic_cap']), 'retained head assembly')
    for key in ['finite_head_cap','omitted_offdiagonal_cap','infinite_tail_cap']:
        require(components[key] == old_incremental['components'][key], 'shared component '+key)
    tail = load(root, 'handoff/upper-residual/matrix/matrix_tail_summary.json')
    radius, square, tail_cap = Q(tail['radius']), Q(tail['square_cap']), Q(tail['tail_cap'])
    require(radius > 1 and Q(tail['mean_square_upper_rational']) <= square, 'inherited Schur mean')
    require(square*radius**(-1006) <= tail_cap**2*(1-radius**(-4)), 'Hardy tail arithmetic')
    require(tail_cap == Q(components['infinite_tail_cap']), 'shared tail cap')
    require(tail['input_sha256'] == base['candidate_sha256'] ==
            bound_sources['handoff/upper-residual/matrix/joint_candidate_exact.json'], 'covariance binding')

    direct_cap = ceil_grid(direct)
    total = direct_cap+sum(Q(components[k]) for k in
                           ['finite_head_cap','omitted_offdiagonal_cap','infinite_tail_cap'])
    total_cap = ceil_grid(total)
    slope = Q(base['working_slope'])
    require(slope > total_cap, 'positive transfer denominator')
    endpoint = 1/(slope-total_cap)
    advertised = Q(1404598068102, 10**12)
    require(endpoint < advertised, 'rational endpoint comparison')

    ledger = [
        {'item':'matrix coefficient PSD budget and M^-2 identity', 'status':'checked exactly here',
         'count':2*len(candidate['matrices'])+1},
        {'item':'14 HS union caps, 20 square-root gates, three rational quadratic duals',
         'status':'checked exactly here; their Gaussian input interpretations remain inherited'},
        {'item':'P3 modulus polynomial', 'status':'checked exactly here',
         'condition':'|P3(x)|<=1 if x real and |x|<=sqrt(3)'},
        {'item':'phase supremum and measurability/charge',
         'status':'must reverify or explicitly assume',
         'detail':'The archived phase-supremum cover is not regenerated or fully present in this slim repo archive.'},
        {'item':'replace G=F0 exp(i phi) with T=F0 P3(phi)',
         'status':'analytic transfer to write and verify',
         'detail':'Use the same B^j F0 and frozen X. Direct comparison is cross+quadratic+4w, without the exponential remainder. This replay reconstructs it rather than subtracting from a rounded upper cap.'},
        {'item':'matrix factor-budget tensor realization and Wiener comparison',
         'status':'inherited paper lemma; not formalized or rederived here'},
        {'item':'retained X head and omitted off-diagonal orders',
         'status':'inherited numerical and analytic inputs; small rational assembly checked here',
         'detail':'The function X and matrix covariance stay identical; finite Fock contractions and bidisk cover are not regenerated.'},
        {'item':'Schur/Hardy tail for new T',
         'status':'universal bounded-rounding transfer must be verified',
         'detail':'The archived covariance contour is unchanged. The Gaussian Schur estimate is stated for any bounded rounding; confirm that exact theorem and all conventions before reusing it for disk-valued T. Only scalar squared-tail arithmetic is replayed.'},
        {'item':'remaining Gaussian moments, coefficient norms and HS enclosures',
         'status':'inherited, not regenerated; source file identity is not mathematical enclosure verification'},
        {'item':'Grothendieck endpoint',
         'status':'algebraic conditional candidate only; not a proved advance and not an unconditional Lean theorem'},
    ]
    out = {'status':'EXACT_ALGEBRAIC_CANDIDATE_WITH_UNDISCHARGED_ANALYTIC_OBLIGATIONS',
           'working_slope':str(slope), 'direct_P3_comparison_cap':str(direct_cap),
           'total_residual_cap':str(total_cap), 'candidate_endpoint_exact':str(endpoint),
           'candidate_endpoint_decimal':float(endpoint), 'strict_candidate_endpoint':str(advertised),
           'components':{'cross_exact':str(cross), 'quadratic_exact':str(quadratic),
                         'rounding_exact':str(rounding),
                         **{k:components[k] for k in ['finite_head_cap','omitted_offdiagonal_cap','infinite_tail_cap']}},
           'source_hashes_verified':bound_sources, 'proof_obligation_ledger':ledger,
           'repo_mutated':False, 'other_chats_accessed':False}
    args.output.write_text(json.dumps(out,indent=2)+'\n')
    print('PASS exact rational replay; no Grothendieck theorem asserted.')
    print('Conditional algebraic candidate:',float(endpoint))
    print('Saved:',args.output)

if __name__ == '__main__':
    main()
