#!/usr/bin/env python3
"""The two hypothesis-free small-t facts along the ridge of degree-5 games (exact rational arithmetic, given the games).
For each game (1, -eps, eta) of ceiling/eps_profile_K2.json without tail (eta = the best coefficient found, rounded to 4 decimals):
  (i)  the necessary t = 0 test of ledger 4.12: eps rho0^2 against the target value;
  (ii) the direct bound of ledger 4.18 (a), V <= (1 - eta) t^2 + eps rho0^2 + eta^2/(pi eps), valid for every game and every pair:
       its value at t = 0 and the largest t (10^-4 grid) at which it is below the target value;
with rho0 = 2287/2500 (conjecture-K 3.7, P + C).  Where (ii) fails at t = 0 the game has no hypothesis-free start: its small t needs
law rows with a sector hypothesis from t = 0 on, or a sharper direct bound (the clipped quintic payoff, ledger 4.12)."""
import os, json
from fractions import Fraction as F
from math import isqrt
HERE = os.path.dirname(os.path.abspath(__file__)); RHO = F(2287, 2500); INVPI_UP = F(318309887, 10 ** 9)
TG = [('1.4023', F(10000, 14023)), ('1.4025', F(10000, 14025)), ('1.4027', F(10000, 14027)), ('1.403', F(1000, 1403)), ('1.4035', F(10000, 14035))]
d = json.load(open(os.path.join(HERE, '..', 'ceiling', 'eps_profile_K2.json')))
print('| eps | eta | eps rho0^2 | direct bound at t = 0 | ' + ' | '.join('t_end at %s' % n for n, _ in TG) + ' |'); print('|---|---|---|---|' + '---|' * len(TG))
for p in d['problems']:
    if p['tail']: continue
    eps = F(repr(round(-p['best']['lam'][1], 6))); eta = F(repr(round(p['best']['lam'][2], 4)))
    if not 0 < eta < eps: print('| %s | %s | %.6f | (eta <= 0: the formula does not apply) |' % (float(eps), float(eta), float(eps * RHO ** 2)) + ' |' * len(TG)); continue
    b = eps * RHO ** 2 + eta ** 2 / eps * INVPI_UP; a = 1 - eta; cells = []
    for n, tg in TG:
        if b >= tg: cells.append('none'); continue
        t = F(isqrt(int((tg - b) / a * 10 ** 8)), 10 ** 4)
        while a * t * t + b >= tg: t -= F(1, 10 ** 4)
        assert a * t * t + b < tg <= a * (t + F(1, 10 ** 4)) ** 2 + b
        cells.append('%.4f' % float(t))
    print('| %s%s | %s | %.6f | %.6f | ' % (float(eps), '' if p['eps'] is not None else ' (free)', float(eta), float(eps * RHO ** 2), float(b)) + ' | '.join(cells) + ' |')
