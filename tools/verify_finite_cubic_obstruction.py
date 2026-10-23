#!/usr/bin/env python3
"""Replay the Arb limit and exact constants in its genuine finite-cubic bridge.

The bridge inequalities are proved on paper in the companion report. This
checks every numerical constant in that analytic application. It is not a
Lean formalization, an optimal norm, or a new Grothendieck endpoint.
"""
from fractions import Fraction as Q
import json
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
from verify_diffuse_cubic_limit import verify_limit


def main():
    limit = verify_limit()
    m = 65536
    d = m*(m+1)//2
    # The exact normalized-G response has no RX error. The remote q_m
    # coefficient is sqrt(m/(m+1))*mq. The additional Z*AY coefficient
    # is n/sqrt(d), with |n|<=1 by Cauchy--Schwarz and the shared G law.
    eps = Q(limit['epsilon'])
    total = eps*Q(limit['mq_squared_upper_rational'])/(m+1)+eps/d
    advertised_error = Q(581, 10**9)
    if not total < advertised_error:
        raise ArithmeticError('The advertised total pairing error failed')
    floor = Q(71329, 100000)
    derived_floor = Q(limit['score_lower_rational'])-total
    if not derived_floor > floor > Q(500, 701):
        raise ArithmeticError('The finite genuine-cubic obstruction failed')
    reciprocal = 1/floor
    if not reciprocal < Q(1401955, 1000000):
        raise ArithmeticError('The reciprocal witness ceiling failed')
    print(json.dumps({'status': 'PASS', 'epsilon': '149/200',
        'm': str(m), 'symmetric_square_dimension': str(d),
        'full_complex_gaussian_dimension': str(1+m+d),
        'phase_numerator_c': limit['phase_numerator_c'],
        'phase_numerator_b': limit['phase_numerator_b'],
        'limit_pairing_enclosure': limit['limit_pairing_enclosure'],
        'response_definition': 'phase(RX*(Z+c*H21(Z)) +/- b*sqrt(m*(m+1))*q_m)',
        'finite_pairing_identity': 'J_m = J_limit - eps*mq^2/(m+1) - eps*|n|^2/d; |n|<=1',
        'coefficient_pairing_error_upper': str(advertised_error),
        'exact_total_error_bound': str(total),
        'derived_pairing_lower_rational': str(derived_floor),
        'finite_pairing_strict_lower': str(floor),
        'strict_margin_over_500_over_701': str(floor-Q(500, 701)),
        'reciprocal_witness_ceiling': str(reciprocal),
        'reciprocal_witness_ceiling_float': float(reciprocal),
        'single_pair_full_rounding_score_upper': limit['single_pair_rounding_score_upper_rational'],
        'proof_status': 'Paper proof of genuine invariant projection closure and the exact normalized-G finite coefficient identity; external Arb integral and exact rational constants replayed here. Not newly formalized in Lean.',
        'scope': 'The unchanged P10-(149/200)P21 witness cannot certify a reciprocal bound at or above 1.401955, in particular cannot reach 1.402. This is NOT an upper bound on the Grothendieck constant.'}, indent=2))


if __name__ == '__main__':
    main()
