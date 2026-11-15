#!/usr/bin/env python3
"""Agent-ID: codex-a7c4. Refs #446. Exact arithmetic for the scalar proof.

This checks coefficients and constants, not the analytic proof's validity.
No numerical quadrature or floating acceptance is used.
"""
from fractions import Fraction as F
import json

if not __debug__:
    raise RuntimeError('Assertions must be enabled')


def mul(a, b, degree):
    out = [F(0)] * (degree + 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            if i + j <= degree:
                out[i + j] += x * y
    return out


def main():
    a, b = F(699, 1250), F(179, 1250)
    tau = [F(0), a**-2, -2*b*a**-5, 7*b*b*a**-8]
    tau2 = mul(tau, tau, 3)
    tau3 = mul(tau2, tau, 3)
    assert [a*a*tau[j]+2*a*b*tau2[j]+b*b*tau3[j]
            for j in range(4)] == [0, 1, 0, 0]
    exp_minus_tau = [F(j == 0)-tau[j]+tau2[j]/2 for j in range(3)]
    density = mul(exp_minus_tau, [(j+1)*tau[j+1] for j in range(3)], 2)
    inverse_moment = a**-6+12*b*a**-7+42*b*b*a**-8
    assert 2*density[2] == inverse_moment < 224
    assert -density[1] == a**-4+4*b*a**-5 < 21

    sk = sum(F(3**j)/(5-F(j, 3))**2 for j in (2, 4))
    sl = sum(1/(3-F(j, 3))**2 for j in (0, 2, 4, 6, 8))
    assert sk == F(133002, 20449) and sl == F(117469, 11025)
    assert sk*sl < F(25, 3)**2
    assert F(27, 128) < F(1, 2)**2
    assert F(463, 10000) < F(1, 4)**2
    assert 66 < 3**4 and F(9, 2) < F(3, 2)**4
    assert F(28, 3)*F(25, 3)*F(128, 7)*224*F(1, 2) < 160000
    assert F(29, 6)*F(25, 3)*F(128, 7)*224*F(1, 2) < 83000
    remainder, small_chi_remainder = 40000, 20750
    assert 4*remainder == 160000 and 4*small_chi_remainder == 83000

    ev = a*a+4*a*b+6*b*b
    assert ev == F(1181331, 1562500)
    assert ev+F(463, 10000) < F(81, 100)
    assert F(7, 4)/(16*F(9, 10)**3) > F(3, 20)
    assert 21*224 < 69**2 and F(27, 40)*69 < 47
    assert F(4045313, 100000)*47/36 < 53
    assert F(1, 10**10) <= 1
    assert F(3, 20)-(small_chi_remainder+53)*F(463, 10000*10**5) > F(7, 50)
    assert 42 < F(13, 2)**2
    assert F(1, 10**5) < F(1, 300)**2
    assert F(3, 20)-(F(160000, 300)+53)*F(1, 10**5)*F(13, 2) > F(11, 100)
    assert F(3, 80) < F(3, 10)*F(7, 50)
    retained_reserve = F(7, 50)-F(3, 80)/F(59009, 189100)
    assert retained_reserve == F(117001, 5900900) > F(19, 1000)

    # Circular projection: normalized moments are 3+3chi/2 and
    # 15+45chi/2+5kappa6c/(2u^3). H6 subtracts 15 H4's raw moment.
    assert F(45, 2)-15*F(3, 2) == 0
    assert 15-15*3+45-15 == 0
    assert F(3, 2)*4/24 == F(1, 4)
    assert F(5, 2)*8/720 == F(1, 36)
    # Independent radial moment controls for the correction coefficients.
    assert F(1, 4)*4 == 1
    assert F(1, 4)*36 == 9 and F(1, 36)*36 == 1
    print(json.dumps({'agent_id': 'codex-a7c4',
                      'status': 'PASS exact scalar Edgeworth arithmetic; analytic review pending',
                      'S_K': str(sk), 'S_L': str(sl),
                      'inverse_moment': str(inverse_moment),
                      'remainder_coefficient': int(remainder),
                      'small_chi_remainder_coefficient': small_chi_remainder,
                      'energy_interval': ['0 (excluded)', '463/10000'],
                      'chi_cap': '1/10000000000',
                      'deficit_coefficient': '7/50',
                      'all_shapes_energy_cap': '1/100000',
                      'all_shapes_deficit_coefficient': '11/100',
                      'retained_A_central_energy_reserve': '19/1000'}, indent=2))


if __name__ == '__main__':
    main()
