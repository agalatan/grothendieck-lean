#!/usr/bin/env python3
"""Exact arithmetic for the rank-zero-defect feasibility follow-up.

Agent-ID: codex-91d4, issue #436. Standard library only.
Checks the D0 cancellation example, task caps, regional exclusion and
specified strip/Holder scalar budgets. It does NOT formally verify the
analytic probability bound, fold geometry or an averaged Psi inequality.
"""
import sys
if not __debug__ or sys.flags.optimize:
    raise SystemExit('Assertions required; reject -O/-OO')
sys.dont_write_bytecode = True
from fractions import Fraction as F
from pathlib import Path
from math import factorial
import argparse
import hashlib
import json

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
from verify_primitives import pi_bounds


def require(condition, message):
    if not condition:
        raise ValueError(message)


def expect_rejection(action, label):
    try:
        action()
    except ValueError:
        return label
    raise ValueError('Rejection control accepted: ' + label)


def check():
    a, b = F(699, 1250), F(179, 1250)
    s, rho, eps = F(3, 5), F(5053, 10000), F(1891, 2500)
    kappa, e, W = 1-s, F(1, 2000), F(1, 1000)
    beta = (a/(2*b)+kappa-e/(b*b))/(s*rho)
    require(beta == F(3729782500, 485709519), 'beta binding')

    # A=sqrt(e)Y, B=beta*A, q=-A(|A|^2-2e)/(2b^2).
    # Coefficients of A^2 conjugate(A) and A in
    # D0=2b^2(q-kappa*A+s*rho*B)-ab*A+|A|^2*A.
    cubic_coefficient = 2*b*b*(-1/(2*b*b))+1
    linear_coefficient = 2*b*b*(e/(b*b)-kappa+s*rho*beta)-a*b
    require(cubic_coefficient == 0 and linear_coefficient == 0,
            'D0 polynomial coefficient cancellation')

    u = e**3/(2*b**4)
    EA, EB = e, beta*beta*e
    V = EA+EB
    total = u+V+W
    weighted = u/2+F(2, 3)*EA+F(4, 3)*EB+W
    pi_lo, _ = pi_bounds()
    ellipsoid_cap_lower = eps*eps*(pi_lo/4-F(21, 25)**2)
    require(u <= F(463, 10000), 'remote energy cap')
    require(total < F(80051, 10**6), 'total energy cap')
    require(weighted < ellipsoid_cap_lower, 'weighted cap via lower pi')
    regional_lhs = F(771, 500)*u+F(43, 250)*V-F(16, 125)*W
    require(regional_lhs > F(1087, 500000), 'example must remain outside regional closure')

    # A lower Taylor partial sum proves exp(1)>2.7 analytically.
    euler_lower = F(27, 10)
    require(sum(F(1, factorial(j)) for j in range(5)) > euler_lower,
            'positive Taylor control for euler constant')
    delta = F(6, 10**7)
    require(0 < delta < a*b, 'positive strip interval')
    probability_upper = 2*delta/(euler_lower*(a*b-delta))
    M4_reference, eta = F(43, 20000), F(1, 20000)
    critical_cube = eta**4/(16*M4_reference)
    require(critical_cube == F(1, 5504000000000000), 'Holder reference budget')
    require(probability_upper**3 < critical_cube, 'reference Holder charge below 50 micro')

    K = F(891, 500)
    gradient_coefficient = 6*K/a+2*b
    require(gradient_coefficient == F(2826082, 145625), 'gradient coefficient binding')
    gradient_coefficient_square = b*b+gradient_coefficient**2
    require(gradient_coefficient_square < 400, 'compact defect constant below 20')
    g = F(3, 10**8)
    require(g < a/2 and 20*g == delta, 'gradient-to-defect threshold')

    rejected = [
        expect_rejection(lambda: require(2*b*b*(e/(b*b)-kappa+s*rho*(beta+1))-a*b == 0,
                                         'wrong beta'), 'replace beta by beta+1'),
        expect_rejection(lambda: require(gradient_coefficient_square < 19**2,
                                         'too small gradient factor'), 'replace factor20 by19'),
        expect_rejection(lambda: require((2*F(1, 10**6)/(euler_lower*(a*b-F(1, 10**6))))**3 < critical_cube,
                                         'too large strip'), 'replace delta6e-7 by1e-6'),
    ]
    return {
        'Agent-ID': 'codex-91d4', 'issue': 436,
        'status': 'PASS EXACT ARITHMETIC ONLY; analytic strip proof is separate',
        'global_averaged_Psi_proved': False,
        'full_cap_discriminant_Holder_charge_proved': False,
        'D0_example': {
            'e_EA': str(e), 'beta': str(beta), 'q': '-A(|A|^2-2e)/(2b^2)',
            'D0_cubic_coefficient': str(cubic_coefficient),
            'D0_linear_coefficient': str(linear_coefficient),
            'u': str(u), 'EA': str(EA), 'EB': str(EB), 'W_Q': str(W),
            'total_energy': str(total), 'weighted_energy': str(weighted),
            'ellipsoid_cap_lower': str(ellipsoid_cap_lower),
            'regional_lhs': str(regional_lhs), 'regional_limit': str(F(1087, 500000)),
        },
        'strip': {
            'delta': str(delta), 'euler_lower': str(euler_lower),
            'probability_upper': str(probability_upper),
            'M4_reference': str(M4_reference),
            'reference_energies': {'W_Q': '1/200', 'W_P': '1/200', 'W_nu': '0'},
            'Holder_eta': str(eta), 'critical_probability_cube': str(critical_cube),
            'scope': '50-micro Holder charge only when E|O|^4 <=43/20000; not a whole-cap moment bound',
        },
        'near_gradient': {
            'compact_K': str(K), 'gradient_coefficient': str(gradient_coefficient),
            'gradient_coefficient_square': str(gradient_coefficient_square),
            'g': str(g), '20g': str(20*g),
            'scope': 'Given analytic inclusion |D1|<=20sqrt(Gamma) on compact core and sqrt(Gamma)<=a/2',
        },
        'rejection_controls': rejected,
        'source_sha256': {p.name: hashlib.sha256(p.read_bytes()).hexdigest()
                          for p in [Path(__file__), HERE/'verify_primitives.py']},
    }


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', type=Path)
    args = parser.parse_args()
    body = json.dumps(check(), indent=2)+'\n'
    if args.output:
        args.output.write_text(body)
    print(body, end='')
