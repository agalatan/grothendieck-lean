#!/usr/bin/env python3
"""Table of ceiling/law_rows_*.json (N): the row bound with zero sector cost in the Gaussian ideal and in the plain law layer.
'law program' is the value the grid program found; where it is below the Gaussian value (the Gaussian law belongs to the class, so the
supremum is at least that) the difference measures the resolution of the program, and the law-layer value is taken as the larger."""
import os, json, glob
HERE = os.path.dirname(os.path.abspath(__file__))
print('| game (eps, eta) | t | row (l, beta, bA, bB) | Gaussian ideal | law program | law layer >= | minus Gaussian | worst law found: sigma, nu, E U^2, mass at 0 |'); print('|---|---|---|---|---|---|---|---|')
for fn in sorted(glob.glob(os.path.join(HERE, 'law_rows_*.json'))):
    for r in sorted(json.load(open(fn)), key=lambda r: r['t']):
        a = r['law_at']
        print('| (%g, %g) | %g | (%s)%s | %.7f | %.7f | %.7f | %.2e | %s |' % (r['eps'], r['eta'], r['t'], ', '.join('%.5f' % x for x in r['row']), ' opt.' if r['optimised'] else '', r['gauss'], r['law_lp'], r['law'], r['law'] - r['gauss'],
              'the Gaussian law' if a.get('note') else '%.3f, %.3f, %g, %.3f' % (a['sigma'], a['nu'], a['m'], a['mass_at_0'])))
