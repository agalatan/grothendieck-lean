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
# The t = 0 row has the zero row parameters, so its response integral does not depend on the game: the SAME stored law, repriced for
# another game (eps', eta'), pays  payoff + sigma^2 (1/eps - 1/eps') + nu^2 (1/eta - 1/eta')  (codex-a7c4, review of PR #711).  Also
# the direct bound of ledger 4.18 (a) at t = 0, eps rho0^2 + eta^2/(pi eps), for the game named on each line.
import math
K2 = json.load(open(os.path.join(HERE, 'eps_profile_K2.json'))); opt = next(p for p in K2['problems'] if p['eps'] is None and not p['tail'])['best']['lam']
src = next(r for r in json.load(open(os.path.join(HERE, 'law_rows_0849.json'))) if r['t'] == 0 and not any(r['row'])); a = src['law_at']
print('\n| game (eps, eta) | t = 0 row: payoff of the law stored for (0.84896, 0.2818) | 1/payoff | below 1/1.403 | below 1/1.4025 | direct bound at t = 0 |'); print('|---|---|---|---|---|---|')
for nm, e, h in (('(0.84896, 0.2818), ledger 1.2', src['eps'], src['eta']), ('(%.10f, %.10f), the optimum saved in eps_profile_K2.json' % (-opt[1], opt[2]), -opt[1], opt[2]), ('(0.8493, 0.2827)', 0.8493, 0.2827), ('(0.849, 0.2824)', 0.849, 0.2824), ('(0.848, 0.2795)', 0.848, 0.2795)):
    v = src['law_lp'] + a['sigma'] ** 2 * (1 / src['eps'] - 1 / e) + a['nu'] ** 2 / src['eta'] - a['nu'] ** 2 / h
    print('| %s | %.8f | %.6f | %.3e | %.3e | %.6f |' % (nm, v, 1 / v, 1 / 1.403 - v, 1 / 1.4025 - v, e * src['rho0'] ** 2 + h * h / (math.pi * e)))
print('\ndirect bound at t = 0 for the other games of the table: ' + '; '.join('(%g, %g): %.6f' % (e, h, e * 0.9148 ** 2 + h * h / (math.pi * e)) for e, h in ((0.78, 0.0779), (0.82, 0.194))))
