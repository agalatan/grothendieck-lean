#!/usr/bin/env python3
"""Explicit rational endpoint tests from a transported rank-one anchor bank.

The bank is independently reconstructed in exact rational algebra against its
hash-pinned original anchor data. Gaussian majorants remain inherited unless
their separate integral replay has been performed. Floats only select a valid
candidate; every accepted bound is computed in Fraction and rounded upward.
"""
import argparse
from fractions import Fraction as F
import json
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
from rankone_analytic_transport import (canonical, ceil_grid, majorant, old_cap,
    qeval, row_geometry, sha, transport)


def rounded(q, den=10**9):
    """Nearest rational, with ties toward +infinity; it is an arbitrary test."""
    return F((2*q.numerator*den+q.denominator)//(2*q.denominator), den)


def load_bank(repo, path):
    bank = json.loads(path.read_text())
    assert bank['version'] == 'rankone-anchor-bank-v1'
    rowpath = repo/bank['source_row']
    assert sha(rowpath) == bank['source_row_sha256']
    discoverypath = repo/bank['discovery_file']
    assert sha(discoverypath) == bank['discovery_sha256']
    discovery = json.loads(discoverypath.read_text())
    row = json.loads(rowpath.read_text())
    th, eps = list(map(F, row['theta'])), F(row['eps'])
    w = [F(str(x)) for x in discovery['res']['cone']['w']]
    assert w == list(map(F, bank['w']))
    A, v, d, c, minimum = row_geometry(th, eps, w)
    assert A == list(map(F, bank['A'])) and v == list(map(F, bank['v']))
    assert d == F(bank['d']) and c == F(bank['c'])
    assert c*c/d == F(bank['semiconvex_coefficient'])
    assert minimum == F(bank['minimum_L10_principal_minor'])
    cache = {}
    for rec in bank['records']:
        if rec['bundle'] not in cache:
            p = repo/rec['bundle']
            assert sha(p) == rec['bundle_sha256']
            cache[rec['bundle']] = json.loads(p.read_text())
        result = cache[rec['bundle']]['results'][rec['result_index']]
        q, l, K, pivot = majorant(result, th, eps)
        t = transport(q, l, K, A, v, d, c)
        assert list(map(F, rec['quadratic'])) == t['quadratic']
        assert list(map(F, rec['scalar_profile_affine'])) == t['profile']
        assert list(map(F, rec['original_quadratic'])) == t['original']
        assert list(map(F, rec['exact_gain_quadratic'])) == t['gain']
        assert F(rec['square_denominator']) == t['denominator']
        assert F(rec['minimum_anchor_LDL_pivot']) == pivot
    print('PASS independent exact bank reconstruction:', len(bank['records']), 'anchors', flush=True)
    return bank, row


def build(bank, row, mesh, limit):
    delta = F(bank['delta'])
    assert delta > 0
    oldnodes = [F(s)/delta for s in row['nodes']]
    # Additional regular physical nodes improve the semiconvex interpolation.
    nodes = set(oldnodes)
    for k in range(1, int(limit/mesh)+1):
        nodes.add(k*mesh)
    nodes = sorted(nodes)
    assert nodes[0] == 0 and nodes[-1] == oldnodes[-1]
    candidates = [dict(q=list(map(F, rec['quadratic'])),
                       f=list(map(F, rec['scalar_profile_affine'])),
                       alpha=F(rec['square_denominator'])) for rec in bank['records']]
    floatq = [tuple(map(float, rec['q'])) for rec in candidates]
    out = []
    for r in nodes:
        baseline = old_cap(row, r)
        bound, test, f = baseline, None, F(0)
        if 0 < r < nodes[-1]:
            x = float(r)
            # Selection only. Even a nonminimal selected candidate is valid.
            j = min(range(len(floatq)), key=lambda j: floatq[j][0]+x*floatq[j][1]+x*x*floatq[j][2])
            rec = candidates[j]
            fstar = rec['f'][0]+r*rec['f'][1]
            frational = rounded(fstar)
            value = qeval(rec['q'], r)+rec['alpha']*(frational-fstar)**2
            candidate = ceil_grid(value)
            assert candidate >= value
            if candidate < bound:
                bound, test, f = candidate, j, frational
        assert bound <= baseline
        assert test is not None or f == 0
        out.append(dict(r=str(r), cap=str(bound), scalar_f=str(f), bank_record=test,
                        original_effective_cap=str(baseline),
                        certified_gain_at_node=str(baseline-bound)))
    return dict(version='rankone-explicit-nodes-v1', row=bank['row'],
        coordinate='physical residual magnitude r',
        epsilon=bank['epsilon'], delta=bank['delta'],
        semiconvex_coefficient=bank['semiconvex_coefficient'],
        full_integral_replay=False,
        Gaussian_majorant_dependency=bank['Gaussian_majorant_dependency'],
        source_table_allowance='1/100000000000 included exactly once in original_effective_cap and inherited zero-test caps',
        scalar_rounding_denominator=10**9, cap_rounding_denominator=10**12,
        regular_physical_mesh=str(mesh), regular_mesh_limit=str(limit),
        zero_origin_and_final_tests=True,
        tail='Beyond the final node use scalar f=0 and the inherited source smax Lipschitz tail in s=delta*r, including source PAD exactly once.',
        nodes=out,
        summary=dict(nodes=len(out), improved_nodes=sum(rec['bank_record'] is not None for rec in out),
            maximum_node_gain_float=max(float(F(rec['certified_gain_at_node'])) for rec in out)))


def main():
    if not __debug__:
        raise SystemExit('Reject -O/-OO: acceptance requires assertions')
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('bank', type=Path)
    ap.add_argument('--repo', type=Path, default=Path(__file__).resolve().parents[1])
    ap.add_argument('--mesh', default='1/500')
    ap.add_argument('--limit', default='6/5')
    ap.add_argument('--out', type=Path, required=True)
    ap.add_argument('--check', action='store_true', help='reconstruct and compare the saved output')
    args = ap.parse_args()
    mesh, limit = F(args.mesh), F(args.limit)
    assert 0 < mesh <= limit
    bank, row = load_bank(args.repo, args.bank)
    report = build(bank, row, mesh, limit)
    report['bank'] = str(args.bank.resolve().relative_to(args.repo.resolve()))
    report['bank_sha256'] = sha(args.bank)
    report['source_row'] = bank['source_row']
    report['source_row_sha256'] = bank['source_row_sha256']
    if args.check:
        assert canonical(report) == canonical(json.loads(args.out.read_text())), 'Node-table reconstruction mismatch'
    else:
        args.out.parent.mkdir(parents=True, exist_ok=True)
        args.out.write_text(json.dumps(report, indent=2)+'\n')
    print('PASS explicit rational endpoint tests:', report['summary'], flush=True)
    print('No law integration, lifted hull or endpoint bound is asserted.',flush=True)


if __name__ == '__main__':
    main()
