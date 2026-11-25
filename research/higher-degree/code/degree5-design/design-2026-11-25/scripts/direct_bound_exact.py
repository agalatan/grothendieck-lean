#!/usr/bin/env python3
"""Exact rational arithmetic (label: exact, given the cited radius constants).  Ledger 4.18 (a):
V <= (1 - eta) t^2 + eps rho0^2 + eta^2/(pi eps) for T = P10 - eps P21 + eta P32 and every universal radius rho0 on H_{2,1}.
Prints, per game, radius and target K (target value 1/K): the end t_end of the unconditional piece (largest t on a 10^-6 grid with
bound < 1/K), and the cap (1/K)/rho0^2 on lambda_1 from the necessary t = 0 test lambda_1 rho*^2 <= 1/K."""
from fractions import Fraction as F
from math import isqrt
INVPI_UP = F(318309887, 10 ** 9); assert INVPI_UP * F(314159265358979, 10 ** 14) > 1
def tend(eps, eta, rho, tgt):
    b = eps * rho ** 2 + eta ** 2 / eps * INVPI_UP; a = 1 - eta
    if b >= tgt: return None, b
    x = (tgt - b) / a; t = F(isqrt(int(x * 10 ** 12)), 10 ** 6)
    while a * t * t + b >= tgt: t -= F(1, 10 ** 6)
    return t, b
radii = [('2287/2500 (P + C)', F(2287, 2500)), ('4571/5000 (P, author only + C)', F(4571, 5000)), ('95133/100000 (law layer of 4.17)', F(95133, 100000)), ('93/100', F(93, 100))]
targets = [('1.402', F(500, 701)), ('1.40195', F(100000, 140195)), ('1.4021', F(10000, 14021)), ('1.40191 (the Lean bound)', F(100000, 140191))]
games = [('(1, -39/50, 779/10000)', F(39, 50), F(779, 10000)), ('(1, -77/100, 1/20)', F(77, 100), F(1, 20)), ('(1, -31/40, 16/250)', F(31, 40), F(16, 250))]
for gn, eps, eta in games:
    for rn, rho in radii:
        for tn, tgt in targets:
            t, b = tend(eps, eta, rho, tgt)
            print('game %s rho0 = %s target %s: V <= %s t^2 + %.9f; unconditional for t <= %s' % (gn, rn, tn, 1 - eta, float(b), ('%.6f' % float(t)) if t is not None else 'nothing (b >= target)'))
print()
for rn, rho in radii:
    for tn, tgt in targets:
        cap = tgt / rho ** 2
        print('rho0 = %s target %s: lambda_1 <= %s = %.7f passes the t = 0 test' % (rn, tn, cap, float(cap)))
