"""Exact scalar checks for CLAIMS.md. Agent-ID: codex-a7c4; Refs #395.

Run with python3 -I; standard library only. This is finite algebra supporting
the paper arguments, not a checker of the general analytic theorems.
"""
from fractions import Fraction as Q
from math import factorial
import json


def exp_lower(x, terms=40):
    return sum((x**k / factorial(k) for k in range(terms)), Q(0))


def exp_moment_tail_coefficient(k, cutoff):
    # integral_cutoff^infinity t^k exp(-t) dt = exp(-cutoff)*this.
    return sum((Q(factorial(k), factorial(j)) * cutoff**j
                for j in range(k + 1)), Q(0))


def main():
    a, b, ell = Q(699, 1250), Q(179, 1250), Q(1057, 1250)
    cutoff = Q(10)
    hcoef = (a*a*exp_moment_tail_coefficient(1, cutoff)
             + 2*a*b*exp_moment_tail_coefficient(2, cutoff)
             + b*b*exp_moment_tail_coefficient(3, cutoff))
    h_upper = hcoef / exp_lower(cutoff)
    assert h_upper < ell*ell / 2
    # An explicit finite amplitude works, using e<3 and sqrt(pi)>1.
    amplitude = Q(1, 10**6)
    redistribution_margin = (cutoff-1)/(2*3**10)-amplitude/a
    assert redistribution_margin > 0
    assert h_upper+amplitude**2 < ell*ell

    delta = Q(1, 100)
    # G=(a/2) W 1_{T<=1/100}: the elementary tangent bound gives
    # F(G)-B(||G||^2) >= P(T<=delta)*(sqrt(pi)*a/4-2*r(delta)).
    # sqrt(pi)>1 and sqrt(delta)=1/10 give a strict rational margin.
    conditional_margin = a/4-(a+b*delta)/5
    assert conditional_margin > 0

    # Existing assembly formulas independently recomputed, not new theorems.
    ka, kb, rho, e2 = Q(24, 100), Q(26, 100), Q(5053, 10000), Q(7, 1000)**2*Q(463, 10000)
    caps = {}
    for name, m, gamma in [('diagonal', Q(0), Q(15, 100)),
                            ('adverse', -Q(118, 1000), Q(1, 10))]:
        determinant = ka*kb-m*m
        denominator = determinant-gamma*(kb+ka*rho*rho-2*m*rho)
        assert determinant > 0 and denominator > 0 and gamma < ka
        cap = e2*(ka-gamma)/denominator
        assert cap < Q(1, 10000)
        caps[name] = str(cap)
    m = -Q(118, 1000)
    allowance = Q(1, 10000)
    gamma_threshold = (allowance*(ka*kb-m*m)-e2*ka) / (
        allowance*(kb+ka*rho*rho-2*m*rho)-e2)
    assert gamma_threshold == Q(4889900, 47482107)

    ca, cb, deficit = Q(1, 200), rho*Q(1, 200), Q(1, 4000)
    x, y = Q(2579, 32000), Q(5737, 80000)
    excess = 2*ca*x+2*cb*y-ka*x*x-kb*y*y+Q(2, 5)*x*y-deficit
    assert ca*ca == Q(1, 10)*deficit
    assert x*x < Q(113, 10000) and y*y < Q(113, 10000)
    assert excess == Q(53464061, 160000000000) > allowance

    result = {
        'agent_id': 'codex-a7c4', 'status': 'PASS',
        'trust': 'exact finite scalar algebra; analytic implications in CLAIMS.md',
        'redistribution_scope_witness': {
            'H_energy_exp10_coefficient': str(hcoef),
            'H_energy_upper': str(h_upper),
            'required_upper': str(ell*ell/2),
            'shell_amplitude': str(amplitude),
            'difference_lower_without_amplitude_sqrt_pi': str(redistribution_margin)},
        'conditional_sigma_field_scope_witness': {
            'gaussian_amplitude': str(a/2),
            'difference_lower_without_event_probability': str(conditional_margin)},
        'conditional_joint_excess_caps': caps,
        'adverse_gamma_threshold': str(gamma_threshold),
        'axis_countermodel_excess': str(excess)
    }
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == '__main__':
    main()
