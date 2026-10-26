#!/usr/bin/env python3
"""Rebuild ONE archived anchored integral certificate from its price recipe.

Only Python's standard library is used, including under `python3 -I` from any
directory. No stored C/h/H value participates in the rebuilt integrals. This
checks an analytic majorant's finite arithmetic, not a whole lower-bound cover
or the Lean Gaussian identities. It intentionally does not sweep all pieces.
"""
import argparse
from fractions import Fraction as F
import hashlib
import json
from pathlib import Path
import sys
import time


REPO = Path(__file__).resolve().parents[1]
SUPPORT = REPO / 'handoff/research-third-decimal/gpt-reviews/rotation-gates-20261015/review/rebase_support'
sys.path.insert(0, str(SUPPORT))
from anchored_certificate import certify
from exact_base import I, PI, SQRTPI
from moments import generate, sinpi
from verify_rebased_anchors import rebase_result, profile_gates


def canonical(d):
    return json.dumps(d, sort_keys=True, separators=(',', ':')).encode()


def digest(d):
    return hashlib.sha256(canonical(d)).hexdigest()


def raw_hash(p):
    return hashlib.sha256(p.read_bytes()).hexdigest()


def encoded_tables(t):
    return dict(radial=[[z.out() for z in row] for row in t['radial']],
                angular=[[z.out() for z in row] for row in t['angular']],
                tails=[z.out() for z in t['tails']],
                radial_nodes=list(map(str, t['radial_nodes'])))


def table_report(t):
    """Exact analytic normalization checks and interval width diagnostics."""
    from math import factorial
    radial = []
    for k in range(13):
        enclosed = sum((r[k] for r in t['radial']), t['tails'][k])
        if k % 2 == 0:
            target = I(factorial(k//2))
        else:
            coeff = F(1, 2)
            for j in range(3, k+1, 2):
                coeff *= F(j, 2)
            target = coeff*SQRTPI
        assert enclosed.lo <= target.lo and target.hi <= enclosed.hi
        radial.append(dict(degree=k, sum=enclosed.out(), gamma=target.out()))
    angular = []
    for k in range(5):
        enclosed = sum((r[k] for r in t['angular']), I(0))
        target = I(1) if k == 0 else 2*sinpi(F(k, 2))/(PI*k)
        assert enclosed.lo <= target.lo and target.hi <= enclosed.hi
        angular.append(dict(harmonic=k, sum=enclosed.out(), target=target.out()))
    return dict(radial_normalizations=radial, angular_normalizations=angular,
                max_radial_width=str(max(z.hi-z.lo for r in t['radial'] for z in r)),
                max_angular_width=str(max(z.hi-z.lo for r in t['angular'] for z in r)),
                tail_moments=[z.out() for z in t['tails']],
                table_canonical_sha256=digest(encoded_tables(t)))


def main():
    if not __debug__:
        raise SystemExit('Reject -O/-OO: exact assertions must be enabled')
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--bundle', type=Path, default=REPO/'handoff/lower-stein/cert-0745e/bundles/newA_proof_0.85_0.json')
    ap.add_argument('--index', type=int, default=15)
    ap.add_argument('--out', type=Path, required=True)
    ap.add_argument('--tables-out', type=Path)
    args = ap.parse_args()
    started = time.monotonic()
    bundle = json.loads(args.bundle.read_text())
    assert bundle['version'] == 'anchored-row-table-v1'
    assert 0 <= args.index < len(bundle['results']) == len(bundle['recipes'])
    source = bundle['results'][args.index]
    recipe = bundle['recipes'][args.index]
    assert F(source['s']) == F(recipe['s'])
    assert list(map(F, source['anchor_m'])) == list(map(F, recipe['m']))
    assert F(source['price_scale']) == F(recipe.get('price_scale', '1'))
    assert source['price_variance'] == recipe.get('price_variance')
    assert list(map(F, source['profile']['theta'])) == list(map(F, bundle['source_row']['theta']))
    for field in ('name', 'eps', 't'):
        assert source['profile'][field] == bundle['source_row'][field]
    # The archived table-v1 digest includes one terminal newline.
    assert hashlib.sha256(canonical(bundle['source_row'])+b'\n').hexdigest() == bundle['source_row_sha256']
    nr, nq = int(source['radial_cells']), int(source['quarter_angular_cells'])
    assert nr == int(bundle['grid']['radial_cells'])
    assert nq == int(bundle['grid']['quarter_angular_cells'])
    print('Regenerating exact Gaussian moment tables', nr, nq, flush=True)
    tables = generate(nr=nr, nq=nq)
    moments_seconds = time.monotonic()-started
    moment_report = table_report(tables)
    if args.tables_out:
        args.tables_out.parent.mkdir(parents=True, exist_ok=True)
        args.tables_out.write_text(json.dumps(encoded_tables(tables), sort_keys=True)+'\n')
    print('Gaussian moment tables PASS; seconds', round(moments_seconds, 3), flush=True)
    rebuilt = certify(source['profile'], recipe['s'], recipe['m'], tables,
                      variance=recipe.get('price_variance'),
                      price_scale=F(recipe.get('price_scale', '1')), verbose=True)
    assert canonical(rebuilt) == canonical(source), 'Full integral reconstruction differs from archived result'
    q = rebase_result(rebuilt, profile_gates(rebuilt)[1])
    assert q == tuple(F(rebuilt['global_quadratic'][k]) for k in ('q0', 'q1', 'q2'))
    report = dict(status='PASS', scope=__doc__, bundle=str(args.bundle.resolve()),
                  bundle_sha256=raw_hash(args.bundle), index=args.index,
                  recipe=recipe, result_sha256=digest(rebuilt),
                  source_row_canonical_sha256=digest(bundle['source_row']),
                  exact_C_h_H_match=True, entire_result_match=True,
                  result=rebuilt, moments=moment_report,
                  dependencies={p.name: raw_hash(p) for p in sorted(SUPPORT.glob('*.py'))},
                  moment_seconds=round(moments_seconds, 3),
                  total_seconds=round(time.monotonic()-started, 3),
                  remaining_hypotheses=[
                      'The scalar anchored-pair majorant, polar Gaussian integral identities, symmetry/block reduction, and interval-enclosure analytic proofs are mathematically justified in source notes, not proved by this Python run.',
                      'No rank-one transport or full row/envelope cover is asserted by this replay.',
                      'The single anchor is regenerated; other archived anchors and node caps remain inherited until individually replayed.'
                  ])
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(json.dumps(report, indent=2)+'\n')
    print('PASS entire source result exactly reconstructed; elapsed seconds', report['total_seconds'], flush=True)


if __name__ == '__main__':
    main()
