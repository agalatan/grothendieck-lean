#!/usr/bin/env python3
"""Exact transport of archived full-space anchored caps to a rank-one test.

Finite algebra uses standard-library rational arithmetic. --replay reconstructs
each selected anchor's Gaussian majorant from the original rational price recipe;
without it the archived Gaussian-integral majorant is an inherited hypothesis.
No old source cap is used to certify a shifted potential.
"""
import argparse
from fractions import Fraction as F
import hashlib
from itertools import combinations
import json
from pathlib import Path
import sys
import time


def dot(x, y):
    assert len(x) == len(y)
    return sum((a*b for a, b in zip(x, y)), F(0))


def mv(A, x):
    return [dot(row, x) for row in A]


def transpose(A):
    return list(map(list, zip(*A)))


def mm(A, B):
    return [[dot(row, col) for col in transpose(B)] for row in A]


def add(A, B, sign=1):
    return [[x+sign*y for x, y in zip(a, b)] for a, b in zip(A, B)]


def inv(A):
    n = len(A)
    T = [list(row)+[F(i == j) for j in range(n)] for i, row in enumerate(A)]
    for j in range(n):
        k = next(k for k in range(j, n) if T[k][j])
        T[j], T[k] = T[k], T[j]
        p = T[j][j]
        T[j] = [v/p for v in T[j]]
        for k in range(n):
            if k != j:
                p = T[k][j]
                T[k] = [v-p*w for v, w in zip(T[k], T[j])]
    answer = [row[n:] for row in T]
    assert mm(A, answer) == [[F(i == j) for j in range(n)] for i in range(n)]
    return answer


def ldl(A):
    assert A == transpose(A)
    n = len(A)
    L = [[F(i == j) for j in range(n)] for i in range(n)]
    d = []
    for j in range(n):
        p = A[j][j]-sum((L[j][k]**2*d[k] for k in range(j)), F(0))
        assert p > 0, ('nonpositive LDL', j)
        d.append(p)
        for i in range(j+1, n):
            L[i][j] = (A[i][j]-sum((L[i][k]*L[j][k]*d[k] for k in range(j)), F(0)))/p
    assert all(A[i][j] == sum((L[i][k]*d[k]*L[j][k] for k in range(n)), F(0))
               for i in range(n) for j in range(n))
    return d


def det(A):
    if not A:
        return F(1)
    return sum(((-1)**j*A[0][j]*det([r[:j]+r[j+1:] for r in A[1:]])
                for j in range(len(A))), F(0))


def psd(A):
    assert A == transpose(A)
    minors = [det([[A[i][j] for j in ix] for i in ix])
              for n in range(1, len(A)+1) for ix in combinations(range(len(A)), n)]
    assert all(q >= 0 for q in minors)
    return min(minors)


def mat(A):
    return [[F(x) for x in row] for row in A]


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def canonical(d):
    return json.dumps(d, sort_keys=True, separators=(',', ':')).encode()


def qeval(q, r):
    return q[0]+r*q[1]+r*r*q[2]


def ceil_grid(q, den=10**12):
    return F(-((-q.numerator*den)//q.denominator), den)


def majorant(result, expected_theta, eps):
    """Accept exact archived Schur algebra and return q,l,K for any shift b."""
    p = result['profile']
    assert list(map(F, p['theta'])) == expected_theta
    assert F(p['eps']) == eps and F(p.get('E_repair', '0')) == 0
    th = expected_theta
    E = [[th[0], th[1], th[2]], [th[1], th[3], th[4]], [th[2], th[4], th[5]]]
    R = [[th[6], th[7], F(0)], [th[7], th[8], F(0)], [F(0), F(0), eps]]
    ldl(E)
    ldl(R)
    HH = [mat(H) for H in result['H_upper']]
    assert len(HH) == 4
    DD = [add(inv(E if i < 2 else R), H, -1) for i, H in enumerate(HH)]
    pivots = [ldl(D) for D in DD]
    assert pivots == [list(map(F, row)) for row in result['LDL_pivots']]
    H = HH[0]
    h = [F(row[0]) for row in result['h_exact']]
    C = F(result['C_upper'])
    Di = inv(DD[0])
    K = add(H, mm(mm(H, Di), H))
    l = [x+y for x, y in zip(h, mv(H, mv(Di, h)))]
    q = C+dot(h, mv(Di, h))
    a = [1+th[10], th[11], th[12]]
    original = [q, 2*dot(l, a), dot(a, mv(K, a))]
    assert original == [F(result['global_quadratic'][k]) for k in ('q0', 'q1', 'q2')]
    assert qeval(original, F(result['s'])) == F(result['upper'])
    return q, l, K, min(min(row) for row in pivots)


def transport(q, l, K, A, v, d, c):
    """Return exact optimal profile f(r)=f0+f1*r and its quadratic cap."""
    KA, Kv = mv(K, A), mv(K, v)
    alpha = d+dot(v, Kv)
    assert alpha > 0
    b0, b1 = dot(l, v), dot(A, Kv)-c
    f0, f1 = b0/alpha, b1/alpha
    old = [q, 2*dot(l, A), dot(A, KA)]
    gain = [b0*b0/alpha, 2*b0*b1/alpha, b1*b1/alpha]
    new = [x-y for x, y in zip(old, gain)]
    # Exact polynomial identity, including deliberately negative r and f.
    count = 0
    for r in [F(-1), F(0), F(1, 10), F(3, 20), F(1)]:
        for f in [F(-2), F(-1, 7), F(0), F(2, 3), f0+f1*r]:
            b = [r*x-f*y for x, y in zip(A, v)]
            lhs = q+2*dot(l, b)+dot(b, mv(K, b))+d*f*f+2*c*r*f
            assert lhs == qeval(new, r)+alpha*(f-(f0+f1*r))**2
            count += 1
    return dict(profile=[f0, f1], quadratic=new, original=old,
                denominator=alpha, gain=gain, identity_fixtures=count)


def row_geometry(th, eps, w):
    E = [[th[0], th[1], th[2]], [th[1], th[3], th[4]], [th[2], th[4], th[5]]]
    A = [th[9]*((F(1) if j == 0 else F(0))+th[10+j]) for j in range(3)]
    v = mv(E, w)
    d = dot(w, v)
    assert d > 0
    C = [r[1:] for r in E[1:]]
    ldl(C)
    h = [E[j][0]+A[j] for j in (1, 2)]
    c = v[0]-dot(h, mv(inv(C), v[1:]))
    S = [[E[i][j]-(F(-1) if i == 0 else eps) if i == j else E[i][j]
          for j in range(3)] for i in range(3)]
    N = [[E[i][j]-(eps-th[9] if i == j == 0 else 0) for j in range(3)] for i in range(3)]
    psd(S)
    psd(N)
    sE = E[0][0]-dot(E[0][1:], mv(inv(C), E[0][1:]))
    assert sE >= 0
    L10 = [S[i]+[-v[i]] for i in range(3)]+[[-z for z in v]+[d]]
    minimum = psd(L10)
    return A, v, d, c, minimum


def old_cap(row, r):
    # The archived source cap convention allows PAD=1e-11.
    x = F(row['theta'][9])*r
    nodes, caps = list(map(F, row['nodes'])), list(map(F, row['caps']))
    assert nodes[0] <= x <= nodes[-1]
    j = max(j for j, s in enumerate(nodes) if s <= x)
    value = caps[j] if x == nodes[j] else caps[j]+(caps[j+1]-caps[j])*(x-nodes[j])/(nodes[j+1]-nodes[j])
    return value+F(1, 10**11)


def main():
    if not __debug__:
        raise SystemExit('Reject -O/-OO: assertions are part of exact acceptance')
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--repo', type=Path, default=Path(__file__).resolve().parents[1])
    ap.add_argument('--row', default='0.85', choices=['0.84', '0.845', '0.85', '0.855'])
    ap.add_argument('--r', default='3/20', help='physical residual magnitude')
    ap.add_argument('--replay', action='store_true', help='fully replay the selected Gaussian anchor')
    ap.add_argument('--out', type=Path)
    ap.add_argument('--bank-out', type=Path, help='write every exact transported quadratic and affine scalar test')
    args = ap.parse_args()
    repo, r = args.repo, F(args.r)
    basedir = repo/'handoff/lower-stein/cert-0745e'
    source = basedir/f'row_{args.row}.json'
    row = json.loads(source.read_text())
    th, eps = list(map(F, row['theta'])), F(row['eps'])
    name = {'0.84': 'm12', '0.845': 'm13', '0.85': 'm14', '0.855': 'm15'}[args.row]
    discovery_path = repo/f'handoff/research-third-decimal/attack-20261022/step22_mix_{name}.json'
    discovery = json.loads(discovery_path.read_text())
    w = [F(str(x)) for x in discovery['res']['cone']['w']]
    A, v, d, c, minimum = row_geometry(th, eps, w)
    candidates = []
    for path in sorted((basedir/'bundles').glob(f'new?_proof_{args.row}_*.json')):
        bundle = json.loads(path.read_text())
        assert list(map(F, bundle['source_row']['theta'])) == th
        assert len(bundle['recipes']) == len(bundle['results'])
        for j, result in enumerate(bundle['results']):
            q, l, K, pivot = majorant(result, th, eps)
            t = transport(q, l, K, A, v, d, c)
            candidates.append((qeval(t['quadratic'], r), path, j, result, bundle['recipes'][j], t, pivot))
    if args.bank_out:
        bank = dict(version='rankone-anchor-bank-v1', row=args.row, epsilon=str(eps),
            source_row=str(source.relative_to(repo)), source_row_sha256=sha(source),
            discovery_file=str(discovery_path.relative_to(repo)), discovery_sha256=sha(discovery_path),
            coordinate='physical residual magnitude r; old source coordinate s=delta*r',
            delta=str(th[9]), w=list(map(str,w)), A=list(map(str,A)), v=list(map(str,v)),
            d=str(d), c=str(c), semiconvex_coefficient=str(c*c/d),
            minimum_L10_principal_minor=str(minimum),
            Gaussian_majorant_dependency='inherited archived C,h,H; finite Schur algebra exactly rechecked for every record',
            origin_rule='Set f(0)=0 if radial phase is defined to vanish at zero. The affine tests here may have nonzero intercept; use them on positive-r cells only.',
            records=[dict(bundle=str(path.relative_to(repo)), bundle_sha256=sha(path), result_index=j,
                          original_anchor_s=result['s'],
                          quadratic=list(map(str,t['quadratic'])),
                          scalar_profile_affine=list(map(str,t['profile'])),
                          original_quadratic=list(map(str,t['original'])),
                          exact_gain_quadratic=list(map(str,t['gain'])),
                          square_denominator=str(t['denominator']),
                          minimum_anchor_LDL_pivot=str(pivot))
                     for value,path,j,result,recipe,t,pivot in candidates])
        args.bank_out.parent.mkdir(parents=True, exist_ok=True)
        args.bank_out.write_text(json.dumps(bank,indent=2)+'\n')
        print('Wrote',len(candidates),'exact transported quadratics to',args.bank_out,flush=True)
    value, path, j, result, recipe, t, pivot = min(candidates, key=lambda c: c[0])
    replay = None
    if args.replay:
        support = repo/'handoff/research-third-decimal/gpt-reviews/rotation-gates-20261015/review/rebase_support'
        sys.path.insert(0, str(support))
        from anchored_certificate import certify
        from moments import generate
        start = time.monotonic()
        print('Replaying exact Gaussian moments and selected anchor', path.name, j, flush=True)
        tables = generate(nr=result['radial_cells'], nq=result['quarter_angular_cells'])
        rebuilt = certify(result['profile'], F(recipe['s']), recipe['m'], tables,
                          variance=recipe.get('price_variance'), price_scale=F(recipe.get('price_scale', '1')), verbose=False)
        assert canonical(rebuilt) == canonical(result), 'Full integral reconstruction mismatch'
        replay = dict(status='PASS', seconds=round(time.monotonic()-start, 3),
                      dependencies={p.name:sha(p) for p in sorted(support.glob('*.py'))})
    old = old_cap(row, r)
    cap = ceil_grid(value)
    report = dict(version='rankone-anchor-transport-v1', row=args.row, physical_r=str(r),
        source_convention_s=str(th[9]*r), original_effective_cap=str(old),
        shifted_cap=str(cap), exact_shifted_value=str(value),
        certified_improvement_over_source=str(old-cap), improvement_float=float(old-cap),
        scope='Global shifted-potential upper cap for an explicit rational scalar test; no law cover or Grothendieck endpoint change.',
        Gaussian_majorant_dependency='recomputed with exact rational enclosures' if replay else 'inherited archived C,h,H majorant; no new Gaussian assertion',
        full_integral_replay=replay, source_sha256=sha(source), discovery_sha256=sha(discovery_path),
        bundle=str(path.relative_to(repo)), bundle_sha256=sha(path), result_index=j,
        original_anchor_s=result['s'], number_of_candidates=len(candidates),
        w=list(map(str,w)), A=list(map(str,A)), v=list(map(str,v)), d=str(d), c=str(c),
        minimum_L10_principal_minor=str(minimum), minimum_anchor_LDL_pivot=str(pivot),
        semiconvex_coefficient=str(c*c/d),
        scalar_profile_affine=list(map(str,t['profile'])),
        scalar_profile_at_node=str(t['profile'][0]+t['profile'][1]*r),
        transported_global_quadratic=list(map(str,t['quadratic'])),
        original_global_quadratic_physical_r=list(map(str,t['original'])),
        exact_square_gain_quadratic=list(map(str,t['gain'])),
        square_denominator=str(t['denominator']), exact_identity_fixtures=t['identity_fixtures'])
    if args.out:
        args.out.parent.mkdir(parents=True, exist_ok=True)
        args.out.write_text(json.dumps(report, indent=2)+'\n')
    print('PASS exact anchor transport:', args.row, 'r=',r,'cap=',float(cap),
          'gain against effective source=',float(old-cap),'anchor=',result['s'],
          'profile=',float(t['profile'][0]+t['profile'][1]*r),flush=True)
    print('Full Gaussian-integral replay:', bool(replay),flush=True)


if __name__ == '__main__':
    main()
