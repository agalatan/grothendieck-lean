#!/usr/bin/env python3
"""Exact selected-anchor replay for a smaller gate E.

The old source table is an inherited input, compared to --source-row. Selected
anchor integrals are re-evaluated by default. All arithmetic is rational or
outward fixed-point integer arithmetic. No third-party dependencies.
"""
import argparse
from fractions import Fraction as F
from functools import lru_cache
import hashlib
from itertools import combinations, permutations
import json
from pathlib import Path
import sys
import time

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
from exact_base import inv, ldl, matmul, transpose, madd
from anchored_certificate import certify
from moments import generate

PAD = F(1, 10**11)
# Process-local cache populated ONLY after exact reconstruction and equality.
# The key contains the entire original result (including its profile and grids)
# and the entire original recipe. No cache entry is accepted from a file/log.
# New gate matrices and rebased caps are never cached or exempted from checking.
_FULL_REPLAY_SUCCESS = set()


def canonical(d):
    return json.dumps(d, sort_keys=True, separators=(',', ':')).encode()


def digest(d):
    return hashlib.sha256(canonical(d)).hexdigest()


def matrix(A):
    return [[F(v) for v in row] for row in A]


def det(A):
    n = len(A)
    answer = F(0)
    for p in permutations(range(n)):
        term = F((-1)**sum(p[i] > p[j] for i in range(n) for j in range(i+1, n)))
        for i in range(n):
            term *= A[i][p[i]]
        answer += term
    return answer


def psd(A):
    assert A == transpose(A), 'PSD symmetry'
    for k in range(1, len(A)+1):
        for indices in combinations(range(len(A)), k):
            assert det([[A[i][j] for j in indices] for i in indices]) >= 0, 'PSD minor'


def profile_gates(result):
    p = result['profile']
    th = list(map(F, p['theta']))
    eps = F(p['eps'])
    assert len(th) == 15 and eps > 0
    assert F(p.get('E_repair', '0')) == 0, 'Unsupported implicit E repair'
    E = [[th[0], th[1], th[2]], [th[1], th[3], th[4]], [th[2], th[4], th[5]]]
    R = [[th[6], th[7], F(0)], [th[7], th[8], F(0)], [F(0), F(0), eps]]
    return th, E, R


def rebase_result(source_result, new_E):
    """Return exact (q0,q1,q2), checking all four new Schur blocks.

    This is finite algebra only. verifyproof(full=True) also re-integrates the
    original price recipe and authenticates the inherited source table.
    """
    th, old_E, R = profile_gates(source_result)
    E = matrix(new_E)
    assert len(E) == 3 and all(len(row) == 3 for row in E)
    assert E == transpose(E)
    ldl(E)
    ldl(R)
    psd(madd(old_E, E, -1))
    H = [matrix(A) for A in source_result['H_upper']]
    assert len(H) == 4 and all(A == transpose(A) for A in H)
    assert all(len(A) == 3 and all(len(r) == 3 for r in A) for A in H)
    E_inv, R_inv = inv(E), inv(R)
    blocks = [madd(E_inv if i < 2 else R_inv, H[i], -1) for i in range(4)]
    for A in blocks:
        ldl(A)
    C = F(source_result['C_upper'])
    h = matrix(source_result['h_exact'])
    assert len(h) == 3 and all(len(row) == 1 for row in h)
    a = [[1+th[10]], [th[11]], [th[12]]]
    D_inv = inv(blocks[0])
    Dh = matmul(D_inv, h)
    Ha = matmul(H[0], a)
    q0 = C+matmul(transpose(h), Dh)[0][0]
    q1 = 2*matmul(transpose(a), madd(h, matmul(H[0], Dh)))[0][0]
    q2 = matmul(transpose(a), Ha)[0][0]+matmul(transpose(Ha), matmul(D_inv, Ha))[0][0]
    return q0, q1, q2


@lru_cache(maxsize=None)
def moment_tables(nr, nq):
    return generate(nr=nr, nq=nq)


def verifyproof(d, full=True, source_row=None):
    """Verify a rebased table, returning its exact quadratics and lineage.

    The caller may supply its independently hash-pinned source_row. If omitted,
    old table validity remains an explicitly inherited dependency; selected
    anchor integrals are still recomputed when full=True.
    """
    assert __debug__, 'Run without -O'
    row = d['source_row']
    if source_row is not None:
        assert canonical(row) == canonical(source_row), 'Inherited source-row mismatch'
    if 'source_row_sha256' in d:
        assert digest(row) == d['source_row_sha256'], 'Source-row canonical hash'
    old_th = list(map(F, row['theta']))
    assert len(old_th) == 15
    new_E = matrix(d['new_E'])
    allowance = F(d.get('allowance', str(PAD)))
    assert allowance == PAD, 'This format inherits precisely source PAD=1e-11'
    nodes, caps = list(map(F, d['nodes'])), list(map(F, d['caps']))
    old_nodes, old_caps = list(map(F, row['nodes'])), list(map(F, row['caps']))
    assert nodes == old_nodes and len(nodes) == len(caps) == len(old_caps)
    assert nodes and nodes[0] >= 0 and all(x < y for x, y in zip(nodes, nodes[1:]))
    a = [1+old_th[10], old_th[11], old_th[12]]
    assert F(row['smax']) >= 2*(abs(a[0])+F(7358,10000)*abs(a[1])+F(707107,10**6)*abs(a[2])), 'Unchanged global Lipschitz constant'
    quadratics = []
    source_hashes = []
    replayed_now = replayed_cached = 0
    assert d['anchors'], 'At least one selected anchor'
    for number, entry in enumerate(d['anchors']):
        r, recipe = entry['source_result'], entry['recipe']
        p = r['profile']
        assert list(map(F, p['theta'])) == old_th, 'Anchor/source theta alignment'
        assert F(p['eps']) == F(row['eps']) and F(p['t']) == F(row['t'])
        assert str(p['name']) == str(row['name'])
        assert F(recipe['s']) == F(r['s'])
        assert list(map(F, recipe['m'])) == list(map(F, r['anchor_m']))
        assert F(recipe.get('price_scale', '1')) == F(r['price_scale'])
        assert canonical(recipe.get('price_variance')) == canonical(r['price_variance'])
        # In quick mode this still checks the old Schur algebra. Full mode
        # additionally reconstructs every frozen integral from its price recipe.
        old_q = rebase_result(r, profile_gates(r)[1])
        assert old_q == tuple(F(r['global_quadratic'][k]) for k in ('q0','q1','q2'))
        s = F(r['s'])
        assert F(r['upper']) == old_q[0]+s*old_q[1]+s*s*old_q[2]
        if full:
            replay_key = canonical(dict(source_result=r, recipe=recipe))
            if replay_key in _FULL_REPLAY_SUCCESS:
                replayed_cached += 1
            else:
                tables = moment_tables(int(r['radial_cells']), int(r['quarter_angular_cells']))
                rebuilt = certify(p, F(recipe['s']), recipe['m'], tables,
                                  variance=recipe.get('price_variance'),
                                  price_scale=F(recipe.get('price_scale', '1')), verbose=False)
                assert canonical(rebuilt) == canonical(r), 'Original anchor full integral replay mismatch'
                _FULL_REPLAY_SUCCESS.add(replay_key)
                replayed_now += 1
        q = rebase_result(r, new_E)
        if 'rebased_quadratic' in entry:
            assert q == tuple(F(entry['rebased_quadratic'][k]) for k in ('q0','q1','q2'))
        quadratics.append(q)
        source_hashes.append(digest(r))
        print('PASS selected anchor', row['name'], number, 's='+str(s),
              'full integral replay' if full else 'ALGEBRA ONLY', flush=True)
    improved = 0
    for s, cap, old_cap in zip(nodes, caps, old_caps):
        candidate = min([old_cap]+[q0+q1*s+q2*s*s-allowance for q0,q1,q2 in quadratics])
        assert cap >= candidate, ('Unsupported new node cap', s, cap, candidate)
        if cap < old_cap:
            improved += 1
    return dict(status='PASS', full_integral_replay=bool(full), anchors=len(quadratics),
                original_integrals_replayed_now=replayed_now,
                original_integrals_previously_replayed_in_process=replayed_cached,
                certificate_sha256=digest(d),
                nodes=len(nodes), improved_nodes=improved,
                source_row_sha256=digest(row), source_anchor_hashes=source_hashes,
                quadratics=[[str(v) for v in q] for q in quadratics])


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('certificate', type=Path)
    parser.add_argument('--source-row', type=Path, required=True,
                        help='Previously verified source table, checked for exact equality')
    parser.add_argument('--quick', action='store_true',
                        help='Check finite algebra only; do not claim integral replay')
    args = parser.parse_args()
    started = time.monotonic()
    report = verifyproof(json.loads(args.certificate.read_text()), not args.quick,
                         json.loads(args.source_row.read_text()))
    report['seconds'] = round(time.monotonic()-started, 3)
    print(json.dumps(report, indent=2), flush=True)
