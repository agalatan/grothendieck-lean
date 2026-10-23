#!/usr/bin/env python3
"""Replay the saved priced quadratic proposal in the frozen finite pool.

Floating discovery only. The new columns' infinite tails remain unpaid.
No certified rounding score or Grothendieck endpoint is asserted.
"""
import argparse
import hashlib
import json
from pathlib import Path
import sys
import numpy as np

sys.path.insert(0, str(Path(__file__).resolve().parent))
from fresh_pool_asymmetric import solve
from fresh_upper_quadratic_kernel import Candidate, cauchy_coefficients


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--base', type=Path,
                    default=Path(__file__).resolve().parents[1] /
                    'handoff/research-third-decimal/fresh-eyes-20261023')
    ap.add_argument('--out', required=True, type=Path)
    a = ap.parse_args()
    oldpath = a.base/'pool/inherited-chirp-pool128.json'
    freshpath = a.base/'pool/asymmetric-pool-result.npz'
    pricedpath = a.base/'pool/priced-asymmetric.json'
    old = json.loads(oldpath.read_text())
    oldheads = np.array(old['heads'], float)
    charges = np.array(old['tail_charges'], float)
    with np.load(freshpath) as archive:
        fresh = archive['new_heads'].copy()
    proposal = json.loads(pricedpath.read_text())
    candidate = Candidate.from_json(proposal['candidate'])
    lo, _ = cauchy_coefficients(candidate, 257, .96, 8192)
    hi, branch = cauchy_coefficients(candidate, 257, .98, 16384)
    drift = float(np.max(abs(lo-hi)))
    if drift >= 3e-9:
        raise ArithmeticError('Cross-radius discovery consistency check failed')
    head = hi[1::2].real
    if np.max(abs(head-np.array(proposal['head']))) >= 3e-9:
        raise ArithmeticError('Saved priced coefficient head changed')
    baseline = solve(oldheads, charges)
    expanded = solve(np.r_[oldheads, fresh, head[None, :]],
                     np.r_[charges, np.zeros(len(fresh)+1)])
    result = {
        'status': 'FLOATING_EXPANDED_POOL_NEW_TAILS_UNPAID',
        'scope': __doc__, 'baseline': baseline['score'],
        'expanded': expanded,
        'optimistic_score_gain': expanded['score']-baseline['score'],
        'priced_column_weight': expanded['weights'][-1],
        'cross_radius_coefficient_drift': drift,
        'branch_checks': branch, 'new_columns': len(fresh)+1,
        'source_hashes': {
            str(p.relative_to(a.base)): hashlib.sha256(p.read_bytes()).hexdigest()
            for p in [oldpath, freshpath, pricedpath]},
        'global_endpoint_changed': False,
    }
    a.out.parent.mkdir(parents=True, exist_ok=True)
    a.out.write_text(json.dumps(result, indent=2)+'\n')
    print(json.dumps({k: result[k] for k in
        ['status', 'baseline', 'optimistic_score_gain',
         'priced_column_weight', 'cross_radius_coefficient_drift']}, indent=2))


if __name__ == '__main__':
    main()
