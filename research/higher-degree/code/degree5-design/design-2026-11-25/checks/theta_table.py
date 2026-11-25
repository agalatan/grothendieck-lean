#!/usr/bin/env python3
"""Prints the allowances theta_j(u, chi) of the chosen design D* from tables/fin_table.json as one Markdown table per piece
(N: outputs of the conic programs of scripts/r4_theta6.py; written when the design computation was recorded).  Stdlib only.
Per piece: t_lo = a_j, the cap u_cap, the row, the margin, the room, and theta at the grid energies u/u_cap and the grid chi;
"-" = no value in the file for that cell (no possible law there, or the energy was not computed); "none" = no bound needed (50 in the file).
Last column: the largest ratio found at that energy over the cubics evaluated (possible responses only), with its chi.
usage (from design-2026-11-25/):  python3 -I checks/theta_table.py [TABLE.json] > tables/THETA_TABLE.md      (default tables/fin_table.json)"""
import json, os, sys
here = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..')
ft = json.load(open(sys.argv[1] if len(sys.argv) > 1 else os.path.join(here, 'tables', 'fin_table.json')))
chosen = {(tuple(c['piece']), c['row_tag']) for c in ft['chosen']}
CH = ['1', '2', '3', '4', '6', '8', '10', '12', '14', '16', '20', '24', '30', '36', '42']
def fmt(v):
    if v is None: return '-'
    if v >= 49.999: return 'none'
    return '%.3f' % v if v < 10 else '%.2f' % v
j = 0
for c in ft['cases']:
    if (tuple(c['piece']), c['row_tag']) not in chosen: continue
    j += 1
    print('**Piece %d: t ∈ [%.6f, %.6f], row tuned at %s.** t_lo = %.6f, u_cap = %.6f, margin μ = %.4f, room %.4e, smallest factor per cell %.2f.' % (
        j, c['a'], c['b'], c['row_tag'], c['a'], c['ucap'], c['mu'], c['room'], c['factor_per_cell']))
    print()
    print('| u/u_cap | u | ' + ' | '.join('χ = ' + x if x == '1' else x for x in CH) + ' | largest ratio found (χ) |')
    print('|---|---|' + '---|' * len(CH) + '---|')
    pe = {round(p['ucapfrac'], 3): p for p in c.get('per_energy', [])}
    for t in c['theta']:
        p = pe.get(round(t['ucapfrac'], 3))
        print('| %.2f | %.5f | ' % (t['ucapfrac'], t['u']) + ' | '.join(fmt(t['theta_chi'].get(x)) for x in CH) + ' | ' + (('%.3f (%.1f)' % (p['max_ratio'], p['chi'])) if p else '-') + ' |')
    print()
