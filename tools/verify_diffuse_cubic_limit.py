#!/usr/bin/env python3
"""Arb integral certificate for an explicit diffuse-cubic phase pair.

The numerical statement concerns the exact rank-three Gaussian limit model.
Its transfer to genuine finite-dimensional cubic witnesses is a separate
analytic argument; no upper bound on that model is asserted.
"""
from fractions import Fraction as Q
import json
from flint import acb, arb, ctx


def ball(x):
    x = Q(x)
    return arb(x.numerator)/x.denominator


def verify_limit():
    ctx.prec = 128
    eps, c, b = ball('149/200'), ball('243529/1000000'), ball('98197/500000')
    rootpi, root2 = arb.pi().sqrt(), arb(2).sqrt()

    def integrand(r, which):
        rr = r*r
        signal = r*(1+c*(rr-2)/root2)/b
        x = signal*signal/2
        i0 = x.bessel_i(0, scaled=True)
        if which == 2:
            return rootpi*r*(-rr).exp()*i0
        psi = rootpi*signal*(i0+x.bessel_i(1, scaled=True))/2
        value = 2*rr*(-rr).exp()*psi
        return value if which == 0 else value*(rr-2)/root2

    coefficients = []
    for which in range(3):
        # Integer-order scaled I_0,I_1 and polynomial/exponential factors
        # are entire. No unverified square-root branch is taken in r.
        value = acb.integral(lambda r, analytic: integrand(r, which), 0, 8,
            rel_tol=ball('1/100000000000000000000'),
            abs_tol=ball('1/100000000000000000000'),
            eval_limit=1000000, depth_limit=40)
        if not value.is_finite() or not value.imag.contains(0):
            raise ArithmeticError('The analytic integral was not certified')
        coefficients.append(value.real)
    # For R>=64, |E_G phase(signal+bG)|<=1 and
    # |E_G barG phase(signal+bG)|<=E|G|=sqrt(pi)/2.
    r, exponential = arb(8), arb(-64).exp()
    gammahalf = rootpi*r.erfc()
    gamma3half = gammahalf/2+r*exponential
    gamma5half = 3*gamma3half/2+r**3*exponential
    tails = [gamma3half, (gamma5half+2*gamma3half)/root2, rootpi*exponential/2]
    for i, tail in enumerate(tails):
        if not 0 < tail < ball('1/1000000000000000000000000'):
            raise ArithmeticError('Explicit Gaussian tail bound failed')
        coefficients[i] += (-tail).union(tail)
    m0, m1, mq = coefficients
    mq_squared_upper = Q(51, 1000)
    if not mq*mq < ball(mq_squared_upper):
        raise ArithmeticError('Remote coefficient square bound failed')
    score = m0*m0-eps*m1*m1+eps*mq*mq
    cubic_mixed_lower = m1*m1-mq*mq
    head_rounding_ceiling = m0*m0-cubic_mixed_lower
    if not cubic_mixed_lower > ball('0.0274') or not head_rounding_ceiling < ball('0.70631'):
        raise ArithmeticError('Single-response rounding head ceiling failed')
    lower, upper = Q('0.71329117'), Q('0.71329118')
    if not ball(lower) < score < ball(upper) or not ball(lower) > ball(Q(500, 701)):
        raise ArithmeticError('Claimed strict limit obstruction failed')
    return {'status': 'PASS', 'epsilon': '149/200',
        'phase_numerator_c': '243529/1000000', 'phase_numerator_b': '98197/500000',
        'coefficients_m0_m1_mq': list(map(str, coefficients)),
        'full_tail_upper_enclosures': list(map(str, tails)),
        'limit_pairing_enclosure': str(score), 'score_lower_rational': str(lower),
        'score_upper_rational': str(upper),
        'mq_squared_upper_rational': str(mq_squared_upper),
        'linear_mixed_coefficient': str(m0*m0),
        'cubic_mixed_coefficient_lower_enclosure': str(cubic_mixed_lower),
        'single_pair_rounding_score_upper_enclosure': str(head_rounding_ceiling),
        'single_pair_rounding_score_upper_rational': '70631/100000',
        'strict_margin_over_500_over_701': str(lower-Q(500, 701)),
        'scope': 'Explicit response-pair LOWER value in the exact rank-three Gaussian limit model. No global maximum, finite-dimensional transfer, or Grothendieck endpoint is certified by this script.'}


def main():
    print(json.dumps(verify_limit(), indent=2))


if __name__ == '__main__':
    main()
