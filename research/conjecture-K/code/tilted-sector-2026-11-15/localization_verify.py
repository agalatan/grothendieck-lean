#!/usr/bin/env python3
"""Exact lower integral certificate for the improved localization bound.

Agent-ID: codex-6e2b. Standard library only. Run python3 -I localization_verify.py.
All acceptance arithmetic is rational/integer; this script writes no files.
The analytic implication is explained in localization_notes.md.
"""
import sys
sys.dont_write_bytecode = True
from fractions import Fraction as F
from math import factorial, isqrt


def ceil_scaled_sqrt(num, den, scale):
    assert num >= 0 and den > 0
    n = isqrt(num*scale*scale//den)
    if n*n*den < num*scale*scale:
        n += 1
    assert n*n*den >= num*scale*scale
    return n


def decimal_down(value, digits=15):
    scale = 10**digits
    n = value.numerator*scale//value.denominator
    return f'{n//scale}.{n%scale:0{digits}d}'


def main():
    print('Agent-ID: codex-6e2b; exact rational localization certificate.')
    steps_per_unit = 512
    cutoff = 16
    scale = 10**24
    h = F(1, steps_per_unit)
    # exp(-h) has a decreasing alternating series. Odd degree 9 is a
    # rigorous lower bound. The integer floor keeps the rounding downward.
    exp_lower = sum(((-h)**k/factorial(k) for k in range(10)), F(0))
    assert 0 < h <= 1 and 0 < exp_lower < 1
    exp_step = exp_lower.numerator*scale//exp_lower.denominator
    assert 0 < exp_step < scale
    exp_current = scale
    sum_integrand_lower = 0
    # ell(t)^2=t(a+bt)^2; t=k/m, a=699/1250, b=179/1250.
    m = steps_per_unit
    ell_den = 1250**2*m**3
    for k in range(1, cutoff*m+1):
        exp_current = exp_current*exp_step//scale
        ell_num = k*(699*m+179*k)**2
        ell_upper = ceil_scaled_sqrt(ell_num, ell_den, scale)
        # 44*u0 = 44*(463/10000) = 5093/2500.
        root_upper = ceil_scaled_sqrt(
            4*ell_num*2500+5093*ell_den, 2500*ell_den, scale)
        denominator_upper = 2*ell_upper+root_upper
        integrand_lower = 2*exp_current*scale//denominator_upper
        sum_integrand_lower += integrand_lower

    integral_lower = F(sum_integrand_lower, m*scale)
    assert integral_lower > F(7, 10)
    print(f'C: {cutoff*m} right-endpoint intervals cover [0,{cutoff}].')
    print('C: omitted tail is nonnegative; no tail estimate is assumed.')
    print('C: c(463/10000) is strictly greater than',
          decimal_down(integral_lower))
    print('C: c(463/10000) > 7/10.')

    u_coefficient = F(1074, 625)-F(7, 10)
    cost = F(859, 2500)
    u_max = F(463, 10000)
    radius_sq = u_coefficient*u_max/cost
    assert u_coefficient == F(1273, 1250)
    assert radius_sq < F(371, 1000)**2
    r_upper = ceil_scaled_sqrt(radius_sq.numerator,
                               radius_sq.denominator, 10**15)
    print('C: improved u coefficient = 1273/1250; cost = 859/2500.')
    print('C: any nonnegative-gain radius is at most',
          f'{r_upper//10**15}.{r_upper%10**15:015d}', '< 371/1000.')
    print('PASS. This does not prove the required 17/200 localization.')


if __name__ == '__main__':
    assert len(sys.argv) == 1
    main()
