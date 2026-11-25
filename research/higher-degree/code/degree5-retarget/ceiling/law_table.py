#!/usr/bin/env python3
"""Table of ceiling/law_rows_*.json (N): the row bound with zero sector cost in the Gaussian ideal and in the plain law layer.
'law program' is the value the grid program found: the payoff of an explicit law, so a LOWER estimate of the law-layer supremum.
Where it is below the Gaussian value (the Gaussian law belongs to the class) the difference measures the resolution of the program,
and the lower estimate is the larger of the two.  For every stored law the script replays, from its atoms [U, weight, Psi], the
payoff  const + sum w Psi - kappa sigma^2 - nu^2/eta  and the constraints  sum w = 1, E U = 1, E U^2 = m, E U^3 <= 9m - 12 +
C6 (m - 2)^(3/2), E sqrt U <= rho0  (to 1e-7; the Psi values of the atoms are the stored ones, computed with the nu named)."""
import os, json, glob
HERE = os.path.dirname(os.path.abspath(__file__)); C6 = 40.45313
print('| game (eps, eta) | t | row (l, beta, bA, bB) | Gaussian ideal | law program (payoff of the stored law) | lower estimate of the law layer | minus Gaussian | the law found: sigma, nu, E U^2, mass at 0, atoms |'); print('|---|---|---|---|---|---|---|---|')
for fn in sorted(glob.glob(os.path.join(HERE, 'law_rows_*.json'))):
    for r in sorted(json.load(open(fn)), key=lambda r: r['t']):
        a = r['law_at']
        if 'atoms' in a:
            U = [x[0] for x in a['atoms']]; w = [x[1] for x in a['atoms']]; ps = [x[2] for x in a['atoms']]; m = a['m']
            pay = r['const'] + sum(x * y for x, y in zip(w, ps)) - a['kappa'] * a['sigma'] ** 2 - a['nu'] ** 2 / r['eta']
            assert abs(pay - r['law_lp']) < 1e-7 and abs(sum(w) - 1) < 1e-7 and abs(sum(x * u for x, u in zip(w, U)) - 1) < 1e-7 and abs(sum(x * u * u for x, u in zip(w, U)) - m) < 1e-6, (fn, r['t'], pay, r['law_lp'])
            assert sum(x * u ** 3 for x, u in zip(w, U)) <= 9 * m - 12 + C6 * (m - 2) ** 1.5 + 1e-6 and sum(x * u ** 0.5 for x, u in zip(w, U)) <= r['rho0'] + 1e-7
            desc = '%.3f, %.3f, %g, %.3f, %d' % (a['sigma'], a['nu'], m, a['mass_at_0'], len(U))
        else: desc = 'the Gaussian law'
        print('| (%g, %g) | %g | (%s)%s | %.7f | %.7f | %.7f | %.2e | %s |' % (r['eps'], r['eta'], r['t'], ', '.join('%.5f' % x for x in r['row']), ' opt.' if r['optimised'] else '', r['gauss'], r['law_lp'], r['law'], r['law'] - r['gauss'], desc))
print('\nevery stored law replayed: payoff and constraints agree')
