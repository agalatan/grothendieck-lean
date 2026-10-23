#!/usr/bin/env python3
"""Exact rational consequence of the independently replayed bank constants.

This verifies a direct full-Wiener-score ceiling for mixtures of the two
specified banks. It is not a Grothendieck bound or a Gaussian formalization.
Run verify_bank_constants.py in the supplied frozen certificate directory
first; that verifier derives the constants from the companion Arb replays.
"""
import argparse
from fractions import Fraction as Q
import hashlib
import json
from pathlib import Path


def require(value, message):
    if not value:
        raise ArithmeticError(message)


def verify(path, target):
    data = json.loads(path.read_text())
    require(data['status'] == 'PASS', 'Bank constants must pass')
    for source in data['sources'].values():
        require(hashlib.sha256((path.parent/source['path']).read_bytes()).hexdigest()
                == source['sha256'], 'A companion replay changed')
    old, new = data['old_bank'], data['new_bank']
    require(old['s3_exact'] == new['s3_exact'] == new['s5_exact'] == '0',
            'The exact cancellation identities are required')
    pB, pQ = Q(old['p_upper_strict']), Q(new['p_upper_strict'])
    sB, CB, CQ = Q(old['s5_upper_strict']), Q(old['C1_lower_strict']), Q(new['C1_lower_strict'])
    require(sB < 0 and pB > pQ and CB < CQ, 'Unexpected signed bank geometry')
    theta = Q(49, 250)
    intercept = (1+theta)*pQ-theta*CQ
    slope = (1+theta)*(pB-pQ+sB)-theta*(CB-CQ)
    require(intercept == Q('71088648/100000000'), 'Unexpected score intercept')
    require(slope == -Q('5272/1000000000'), 'Unexpected score slope')
    require(slope < 0 and intercept < target, 'The requested strict rejection failed')
    return {'status': 'PASS', 'theta': str(theta), 'beta_range': ['0','1'],
            'score_upper_intercept': str(intercept), 'score_upper_slope': str(slope),
            'requested_strict_target': str(target),
            'identity': 'D_full <= (1+theta)*p+(theta-1)*s3+(1+theta)*s5-theta*C1',
            'scope': __doc__,
            'input_sha256': hashlib.sha256(path.read_bytes()).hexdigest(),
            'verifier_sha256': hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('constants', type=Path)
    parser.add_argument('--out', type=Path, required=True)
    parser.add_argument('--target', default='711947/1000000')
    args = parser.parse_args()
    result = verify(args.constants, Q(args.target))
    args.out.write_text(json.dumps(result, indent=2)+'\n')
    print(json.dumps(result, indent=2))


if __name__ == '__main__':
    main()
