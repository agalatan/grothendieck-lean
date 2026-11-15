#!/usr/bin/env python3
"""Exact scalar checks for the joint A/B Gaussian-tail reduction.

Agent codex-a713, 2026-11-13. This does NOT check the missing compact
finite-remainder inequality. All acceptance comparisons use Fraction.
No dependencies, no imports of other experiment modules, no large arrays.
"""
import sys
sys.dont_write_bytecode = True
from fractions import Fraction as F
from pathlib import Path
import hashlib
import json
import math
import time

ROOT = Path(__file__).resolve().parent
ROWS = {
    'peak': (F(699,1250), F(179,1250), F(1891,2500), F(7,25)),
    'flank': (F(14,25), F(1467,10000), F(149,200), F(11,40)),
    'upper': (F(573,1000), F(19,125), F(1891,2500), F(13,50)),
}


def exp_lower(x, order):
    """Positive Taylor polynomial <= exp(x), for x >= 0."""
    assert x >= 0
    total = term = F(1)
    for j in range(1, order+1):
        term *= x / j
        total += term
    return total


def sqrt_upper(x, denominator=10**8):
    """Exact rational upper bound for the nonnegative square root."""
    assert x >= 0
    integer = math.isqrt(x.numerator*denominator**2//x.denominator)
    if F(integer,denominator)**2 < x:
        integer += 1
    bound = F(integer,denominator)
    assert bound**2 >= x
    return bound


def main():
    start = time.monotonic()
    row_checks = {}
    JA, JB, JAB = F(179,50), F(53,50), F(39,20)
    for name, (a,b,epsilon,M) in ROWS.items():
        # t^2 exp(-t) increases on [0,2], denominator increases on [0,infty).
        # Beyond 2 the numerator decreases, so the final cell covers the tail.
        max_ratio = F(0)
        for j in range(2000):
            lo, hi = F(j,1000), F(j+1,1000)
            density_bound = hi**2 / exp_lower(hi,16) / (2*(a+b*lo)*(a+3*b*lo))
            assert density_bound <= M, (name,j)
            max_ratio = max(max_ratio, density_bound/M)
        assert 2/a <= JA
        assert 4*M <= JB**2
        assert JA*JB <= JAB**2
        p = 1/epsilon
        assert p >= F(33,25)
        assert JA-(p-F(6,25)) <= F(5,2)
        assert JB-(p-F(13,50)) <= 0
        # Finite-remainder all-shift tail, uniform over every alpha,beta.
        r5_upper = sqrt_upper(F(5))*(a+5*b)
        assert r5_upper < 6
        outer_root = sqrt_upper(F(89,2)*F(57,2)/((a+5*b)*(a+15*b)))
        large_shift_cap = 2/(6-r5_upper)+2*outer_root/exp_lower(F(5),50)
        assert large_shift_cap <= F(91,100)
        # Largest row sum of [[.24,.118],[.118,.26]] is .378.
        assert p-F(189,500)-F(91,100) >= F(3,100)
        row_checks[name] = {
            'B_density_cells': 2000,
            'B_density_cap': str(M),
            'maximum_exact_cell_bound_over_cap_decimal': float(max_ratio),
            'uniform_A_potential_cap': str(JA),
            'uniform_B_potential_cap': str(JB),
            'uniform_cross_potential_cap': str(JAB),
            'large_shift_finite_remainder_cap_decimal': float(large_shift_cap),
            'certified_large_shift_common_cap': '91/100',
            'large_shift_signed_diagonal_reserve': '3/100',
        }
    # Pointwise tail-excess matrices, relative to robust and signed targets.
    # Robust: +.236 |alpha beta|; signed: -.236 Re(alpha conjugate(beta)).
    robust_cross = JAB-F(59,500)
    signed_cross = JAB+F(59,500)
    Krob, Ksigned = F(7,2), F(15,4)
    assert Krob >= F(5,2) and Krob*(Krob-F(5,2)) >= robust_cross**2
    assert Ksigned >= F(5,2) and Ksigned*(Ksigned-F(5,2)) >= signed_cross**2

    w = F(113,10000)
    # Rational diagonal reserves claimed in the accompanying proof.
    table = [
        (F(3,10), F(11,500), F(59,2500)),
        (F(13,40), F(4,625), F(17,2500)),
        (F(7,20), F(163,100000), F(7,4000)),
        (F(3,8), F(371,1000000), F(199,500000)),
        (F(2,5), F(753,10000000), F(807,10000000)),
        (F(9,20), F(219,100000000), F(47,20000000)),
    ]
    results = []
    for R,eta_rob,eta_signed in table:
        assert eta_rob <= F(3,100) and eta_signed <= F(3,100)
        s = R**2/w
        # Exact upper bound on delta = 2(1+s)exp(-s).
        delta_upper = 2*(1+s)/exp_lower(s,160)
        assert delta_upper < 1
        assert (Krob+eta_rob)*delta_upper <= eta_rob
        assert (Ksigned+eta_signed)*delta_upper <= eta_signed
        results.append({
            'R': str(R), 'R_decimal': float(R), 's': str(s),
            'delta_upper_decimal': float(delta_upper),
            'robust_diagonal_reserve': str(eta_rob),
            'signed_diagonal_reserve': str(eta_signed),
            'robust_unabsorbed_tail_allowance_at_both_energy_caps_decimal': float(Krob*delta_upper*2*w),
        })
    result = {
        'status': 'passed_exact_scalar_checks',
        'scope': 'Gaussian-tail reduction only; compact finite-remainder premise remains unproved',
        'source_sha256': hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
        'w': str(w), 'robust_tail_constant': str(Krob), 'signed_tail_constant': str(Ksigned),
        'row_checks': row_checks, 'reserves': results,
        'seconds': time.monotonic()-start,
    }
    output = ROOT/'improvement_joint_tail_check.json'
    output.write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps(result,indent=2))


if __name__ == '__main__':
    main()
