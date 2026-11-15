#!/usr/bin/env python3
"""Finite diffuse-retained scalar budgets. Agent-ID: codex-a7c4. Refs #415.

Run with python3 -I. Standard library; read-only unless --write-result.
Analytic derivative, projection and CLT arguments are in FOUNDATIONS.md.
"""
import argparse
from fractions import Fraction as Q
import json
from math import comb, factorial
from pathlib import Path
import sys

if not __debug__:
    raise RuntimeError('Assertions are required; do not use -O.')
sys.dont_write_bytecode = True


def wick_even_moment(k):
    """E |X(|X|^2-2)/sqrt(2)|^(2k), T=|X|^2~Exp(1)."""
    return sum(Q(comb(2*k,j)*(-2)**(2*k-j)*factorial(k+j), 2**k)
               for j in range(2*k+1))


def verify():
    moments = [wick_even_moment(k) for k in [1, 2, 3]]
    assert moments == [1, 44, 11352]
    # Standard-normal even moments 1,3,15 give E(He_3(G)^2)=6.
    hermite_score_second_moment = 15-6*3+9
    assert hermite_score_second_moment == 6
    assert 2**3*hermite_score_second_moment == 48
    # Integral of T^2(T-2)^3 e^-T, and its truncated-at-2 tail factor.
    coefficients = [0, 0, -8, 12, -6, 1]
    polynomial_mean = sum(c*factorial(k) for k,c in enumerate(coefficients))
    endpoint_factor = sum(c*factorial(k)*sum(Q(2**j,factorial(j))
                           for j in range(k+1))
                          for k,c in enumerate(coefficients))
    assert polynomial_mean == 32 and endpoint_factor == 240
    # E T^2 |T-2|^3 = -32+480 exp(-2).
    exp2_lower = sum(Q(2**j,factorial(j)) for j in range(7))
    assert exp2_lower > Q(300,41)
    assert Q(7,5)**2 < 2
    numerator_upper = -16+240*Q(41,300)
    assert numerator_upper == Q(84,5) == 12*Q(7,5)
    # The reviewed universal sixth-moment input is not proved by this check.
    assert Q(6481,1000)**2 > 42
    universal_sixth_upper = 6+9*42+Q(4045313,100000)*42*Q(6481,1000)
    assert universal_sixth_upper < 11400
    assert Q(48,36)*11400 == 15200
    assert Q(48,36)*12**2 == 192
    a,b=Q(699,1250),Q(179,1250)
    peak_coefficient=192*a**-6*(1+4*b/a)
    assert peak_coefficient == Q(345458984375000000000000,27178092692831571633)
    assert 12710 < peak_coefficient < 12711
    return {
        'agent_id':'codex-a7c4', 'task':415, 'status':'PASS',
        'scope':'Scalar budgets for the finite-dimensional independent-block retained penalty; no K upper bound or CLT payoff rate.',
        'Wick_moments_2_4_6':[str(x) for x in moments],
        'Hermite_score_second_moment':hermite_score_second_moment,
        'Gaussian_third_derivative_squared_coefficient':48,
        'weighted_absolute_moment_formula':'E |X| |H(X)|^3 = (-16 + 240 exp(-2))/sqrt(2)',
        'weighted_absolute_moment_strict_upper':'12',
        'exp2_Taylor_lower':str(exp2_lower),
        'universal_sixth_moment_upper':str(universal_sixth_upper),
        'general_block_coefficient_over_m0m1':'15200',
        'one_coordinate_Wick_coefficient_over_m0m1':'192',
        'peak_one_coordinate_coefficient':str(peak_coefficient),
        'peak_one_coordinate_coefficient_strict_upper':'12711',
        'trust':'Exact rational arithmetic; inherited positive visible-density mixture and cubic moment theorem; new paper derivative/projection argument.'
    }


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write-result',action='store_true')
    args=parser.parse_args()
    output=json.dumps(verify(),indent=2,sort_keys=True)+'\n'
    if args.write_result:
        Path(__file__).with_name('diffuse_retained_exact_result.json').write_text(output)
    print(output,end='')


if __name__=='__main__':
    main()
