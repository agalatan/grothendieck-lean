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

    sk = sum(F(3**j)/(5-F(j, 3))**2 for j in (2, 4))
    sl = sum(F(3**j)/(3-F(j, 3))**2 for j in (0, 2, 4, 6, 8))
    assert sk == F(133002, 20449) and sl == F(659393389, 11025)
    assert sk*sl < 625**2
    assert F(27, 128) < F(1, 2)**2
    assert F(463, 10000) < F(1, 4)**2
    remainder = 6*625*F(128, 7)*224*F(1, 2)*F(1, 4)
    assert remainder == 1920000

    ev = a*a+4*a*b+6*b*b
    assert ev == F(1181331, 1562500)
    assert ev+F(463, 10000) < F(81, 100)
    assert F(7, 4)/(16*F(9, 10)**3) > F(3, 20)
    assert F(173, 1000)**2 < F(3, 100)
    assert 3*F(9, 5)/(8*F(3, 100)**2*F(173, 1000)) < 4400
    assert F(4045313, 100000)*4400/36 < 5000
    assert F(3, 20)-1925000*F(463, 10000*10**7) > F(7, 50)
    assert F(3, 80) < F(3, 10)*F(7, 50)

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
                      'energy_interval': ['3/100', '463/10000'],
                      'chi_cap': '1/100000000000000',
                      'deficit_coefficient': '7/50'}, indent=2))


if __name__ == '__main__':
    main()
