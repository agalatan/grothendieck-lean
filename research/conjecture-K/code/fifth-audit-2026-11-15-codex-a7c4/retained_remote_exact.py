#!/usr/bin/env python3
"""Exact scalar acceptance for FOUNDATIONS.md §§5–6.

Agent-ID: codex-a7c4. Refs #411. python3 -I; standard library only.
The paper supplies the Gaussian-mixture identities, Taylor inequality and
retained-dual bound. No numerical sampling or external result file is input.
"""
from fractions import Fraction as Q
from math import comb, factorial
from pathlib import Path
import argparse
import json
import sys

if not __debug__:
    raise RuntimeError('Assertions must be enabled; do not use -O.')
sys.dont_write_bytecode = True


def verify():
    a, b = Q(699, 1250), Q(179, 1250)
    assert Q(1, 2) < a < Q(3, 5)
    assert 0 <= b < Q(1, 4)
    m1 = a**-4 + 4*b*a**-5
    m2 = a**-6 + 12*b*a**-7 + 42*b*b*a**-8
    assert m1 < 48 and m2 < 1120
    assert 48*1120 < 232**2
    j2_upper = Q(2, 16)*232
    assert j2_upper == 29
    # pi > 3 proves sqrt(pi)/(8a^3)>1; pi < 4 proves j0<2.
    assert (8*Q(3, 5)**3)**2 < 3
    assert 2/(2*a) < 2
    centered_cubic_moment = sum(Q(comb(3,k)*(-1)**(3-k)*factorial(k))
                                for k in range(4))
    fifth_absolute_moment_upper = sum(comb(5,k)*factorial(k)
                                      for k in range(6))
    assert centered_cubic_moment == 2
    assert fifth_absolute_moment_upper == 326
    leading_coefficient = factorial(2)*centered_cubic_moment
    remainder_coefficient = Q(j2_upper, 2)*factorial(3)*fifth_absolute_moment_upper
    assert leading_coefficient == 4
    assert remainder_coefficient == 28362
    amplitude = Q(1, 100)
    projection_lower = amplitude**3*(leading_coefficient
                                    - remainder_coefficient*amplitude**2)
    assert projection_lower == Q(5819, 5*10**9) > amplitude**3
    gap_lower = projection_lower**2/3
    assert gap_lower == Q(33860761, 75000000000000000000)
    assert gap_lower > Q(1, 3*10**12)
    return {
        'agent_id': 'codex-a7c4', 'task': 411, 'status': 'PASS',
        'profile': {'a': str(a), 'b': str(b)},
        'scope': 'q=c X(|Y|^2-1), c=1/100, peak profile; genuine remote cubic. No new global cap.',
        'derivative_bounds': {'j0_upper': '2', 'minus_jprime0_lower': '1',
                              'jsecond_global_upper': str(j2_upper)},
        'density_moment_bounds': {'m1_upper': '48', 'm2_upper': '1120'},
        'exp_centered_third_moment': str(centered_cubic_moment),
        'exp_absolute_fifth_moment_upper': str(fifth_absolute_moment_upper),
        'projection_remainder_coefficient': str(remainder_coefficient),
        'amplitude': str(amplitude),
        'absolute_projection_coefficient_lower': str(projection_lower),
        'raw_minus_retained_gap_lower': str(gap_lower),
        'simple_gap_lower': str(Q(1, 3*10**12)),
        'trust': 'Exact rational arithmetic; analytic identities and classical 3<pi<4 supplied by paper proof.'
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write-result', action='store_true')
    args = parser.parse_args()
    output = json.dumps(verify(), indent=2, sort_keys=True)+'\n'
    if args.write_result:
        Path(__file__).with_name('retained_remote_exact_result.json').write_text(output)
    print(output, end='')


if __name__ == '__main__':
    main()
