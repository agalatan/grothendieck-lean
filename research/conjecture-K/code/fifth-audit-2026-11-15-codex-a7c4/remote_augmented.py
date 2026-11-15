"""Certify augmented remote moment covers. Agent-ID: codex-a7c4. Refs #411.

python3 -I remote_augmented.py [--dependency-dir EXISTING_FLINT_DIR]
Default: fresh Arb Hermite inputs, then exact rational continuum acceptance.
--exact-only omits the fresh input replay and is conditional on stored caps.
No files are written unless --write-result is explicitly supplied.
"""
import argparse
from fractions import Fraction as Q
import hashlib
import json
from math import comb
from pathlib import Path
import sys

if not __debug__:
    raise RuntimeError('Assertions required; do not use -O.')
sys.dont_write_bytecode = True
BASE = Path(__file__).resolve().parent.parent / 'audit-2026-11-15-codex-a7c4' / 'remote_stein_original'
ROWS = json.loads((BASE / 'moment-boxes.json').read_text())
POLYS = [tuple(map(Q, row['coefficients'])) for row in ROWS]
PRICE = Q(2500, 1891)
S_LOWER = Q('1.3739535256614')
S_UPPER = Q('1.3739535256616')
C6 = Q(4045313, 100000)
GAMMA = Q(1077659, 27000000)
COST = Q(59009, 189100)
LINEAR_CONTENT = Q(19321, 10**6)


def bernstein(poly, left, right):
    n = len(poly) - 1
    shifted = [sum(poly[j] * comb(j, i) * left**(j-i) * (right-left)**i
                   for j in range(i, n+1)) for i in range(n+1)]
    return [sum(shifted[j] * Q(comb(i, j), comb(n, j))
                for j in range(i+1)) for i in range(n+1)]


def poly_value(poly, u):
    result = Q(0)
    for coefficient in reversed(poly):
        result = result*u + coefficient
    return result


def moment_poly(index, x, gamma, cap):
    c0, c1, c2, c3 = POLYS[index]
    assert c3 > 0
    result = [c0, c1-PRICE, c2*(2+x*x), c3*(6+9*x*x+C6*x**3)]
    if cap == 'delta':
        result[2] += gamma*x*x/COST
    else:
        assert cap == 'linear'
        result[1] += LINEAR_CONTENT/COST
    return result


def cover(name, a, b, c, d, gamma, allowance):
    """Every accepted leaf proves a bound on its entire closed rectangle."""
    target = S_LOWER + allowance
    leaves = []
    used = set()
    worst = Q(0)
    maximum_depth = 0

    def visit(a, b, c, d, depth):
        nonlocal worst, maximum_depth
        assert a < b and 0 <= c < d
        umid, xmid = (a+b)/2, (c+d)/2
        # Exact discovery order. Only the later Bernstein comparison accepts.
        choices = sorted((poly_value(moment_poly(i, xmid, gamma, cap), umid), i, cap)
                         for i in range(len(POLYS)) for cap in ['delta', 'linear'])
        for _, i, cap in choices[:6]:
            upper = max(max(bernstein(moment_poly(i, x, gamma, cap), a, b))
                        for x in [c, d])
            if upper < target:
                used.add(i)
                worst = max(worst, upper)
                maximum_depth = max(maximum_depth, depth)
                leaves.append([str(z) for z in [a, b, c, d]] + [i, cap])
                return
        assert depth < 22, (name, a, b, c, d, float(upper-S_LOWER))
        # Relative subdivision alternates according to normalized side lengths.
        if (b-a)/(Q('0.0463')) >= (d-c)/(Q(13, 2)):
            visit(a, umid, c, d, depth+1)
            visit(umid, b, c, d, depth+1)
        else:
            visit(a, b, c, xmid, depth+1)
            visit(a, b, xmid, d, depth+1)

    visit(a, b, c, d, 0)
    # Recursive bisection already proves coverage; exact area independently
    # guards against an omitted branch or malformed leaf endpoints.
    area = sum((Q(row[1])-Q(row[0]))*(Q(row[3])-Q(row[2])) for row in leaves)
    assert area == (b-a)*(d-c)
    encoded = json.dumps(leaves, separators=(',', ':')).encode()
    return {'name': name, 'domain': list(map(str, [a,b,c,d])),
            'gamma': str(gamma), 'allowance': str(allowance),
            'leaf_count': len(leaves), 'max_depth': maximum_depth,
            'leaf_sha256': hashlib.sha256(encoded).hexdigest(),
            'leaves': leaves,
            'polynomial_indices': sorted(used),
            'upper_minus_S_lower': str(worst-S_LOWER),
            'strict_margin': str(target-worst)}, used


def verify(exact_only=False):
    assert COST == PRICE-Q(3,5)**2-Q(13,20)
    # x=sqrt(chi) <=sqrt(42)<13/2 for a genuine cubic.
    assert Q(13,2)**2 > 42
    specifications = [
        ('small_energy_all_tensors', Q(0), Q(21,1000), Q(0), Q(13,2), Q(2,25), Q(0)),
        ('near_gaussian_low_energy', Q(0), Q(3,100), Q(0), Q(1,2), Q(2,25), Q(1,50000)),
        ('near_gaussian_central_energy', Q(3,100), Q(463,10000), Q(0), Q(1,2), GAMMA, Q(1,50000)),
    ]
    summaries, used = [], set()
    for spec in specifications:
        summary, indices = cover(*spec)
        summaries.append(summary)
        used |= indices
    assert Q(summaries[0]['upper_minus_S_lower']) < -Q(69,25000000)
    fresh_nodes = []
    if not exact_only:
        # Fresh profile integration and coefficientwise Hermite acceptance.
        # Importing verify does not execute the original full verifier.
        sys.path.insert(0, str(BASE))
        from verify import check_hermite, val
        for i in sorted(used):
            assert tuple(check_hermite(ROWS[i]['nodes'], ROWS[i]['coefficients'])) == POLYS[i]
        for node in sorted({Q(z) for i in used for z in ROWS[i]['nodes']}):
            value, derivative = val(node)
            fresh_nodes.append({'s':str(node), 'h':str(value), 'h_prime':str(derivative)})
    # Limitation of this fixed bank plus these two surcharge estimates.
    # It is NOT a realizable-law/cubic counterexample to the target theorem.
    obstruction_u, obstruction_x = Q(1,25), Q(2)
    point_values = [(poly_value(moment_poly(i, obstruction_x, GAMMA, cap), obstruction_u), i, cap)
                    for i in range(len(POLYS)) for cap in ['delta','linear']]
    best, best_index, best_cap = min(point_values)
    assert best > S_UPPER+Q(1,5000)
    input_rows = [{'index':i, 'nodes':ROWS[i]['nodes'], 'coefficients':ROWS[i]['coefficients'],
                   'row_sha256':hashlib.sha256(json.dumps(ROWS[i],sort_keys=True,separators=(',',':')).encode()).hexdigest()}
                  for i in sorted(used)]
    return {'agent_id':'codex-a7c4', 'task':411, 'status':'PASS',
            'mode':'conditional exact acceptance' if exact_only else 'fresh Arb inputs and exact acceptance',
            'profile_polynomial_count':len(used), 'profile_polynomials':input_rows,
            'fresh_profile_nodes':fresh_nodes, 'covers':summaries,
            'fixed_bank_obstruction':{'u':str(obstruction_u), 'x':str(obstruction_x),
                'chi':str(obstruction_x**2), 'best_index':best_index, 'best_cap':best_cap,
                'best_upper_minus_S_upper':str(best-S_UPPER),
                'scope':'Failure of these 154 moment-polynomial caps with the two listed content surcharges; not a lower bound on the true functional.'},
            'source_sha256':{name:hashlib.sha256((BASE/name).read_bytes()).hexdigest()
                             for name in ['moment-boxes.json','profile.py','verify.py']},
            'scope':'Peak retained A-core only; all finite dimensions and all shell amplitudes. '
                    'Reviewed global secant/content/moment inputs retained; no generic K or all-sector result.'}


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--dependency-dir', type=Path)
    parser.add_argument('--exact-only', action='store_true')
    parser.add_argument('--write-result', action='store_true')
    args=parser.parse_args()
    if args.dependency_dir:
        sys.path.insert(0,str(args.dependency_dir.resolve(strict=True)))
    result=verify(args.exact_only)
    output=json.dumps(result,indent=2)+'\n'
    if args.write_result:
        assert not args.exact_only, 'Do not save conditional mode as the full replay.'
        Path(__file__).with_name('remote_augmented_result.json').write_text(output)
    print(output,end='')


if __name__=='__main__':
    main()
