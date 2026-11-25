#!/usr/bin/env python3
"""Sensitivity of theta(u, chi) to the room given to the A/B sector: whole room against half of it (N).  usage: half_table.py WORK name1 name2 ..."""
import sys, json, os
work = sys.argv[1]
for nm in sys.argv[2:]:
    a = json.load(open(os.path.join(work, 'out', 'r4_theta6_1%s_Mglob.json' % nm))); b = json.load(open(os.path.join(work, 'out', 'r4_theta6_1_half%s_Mglob.json' % nm)))
    for p, q in zip(a['pts'], b['pts']):
        if p.get('theta_chi') and q.get('theta_chi'):
            ks = [k for k in ('2', '4', '6', '10', '16', '24', '42') if p['theta_chi'].get(k) and q['theta_chi'].get(k)]
            print('%s u/cap %.2f room %.3e -> %.3e: theta(chi) whole/half: ' % (nm, p['ucapfrac'], a['room'], b['room']) + '  '.join('%s: %.3f/%.3f (%+.0f %%)' % (k, p['theta_chi'][k], q['theta_chi'][k], 100 * (q['theta_chi'][k] / p['theta_chi'][k] - 1)) for k in ks))
