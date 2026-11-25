#!/usr/bin/env python3
"""Check written when the design computation was recorded (not part of the design worker's scripts).  Stdlib only.
Compares the float tuned rows used for the profiles, the margin scans and the allowance programs with the exact rational rows
of the certificate (the field "row" of the cases of tables/fin_table.json, equal to the rows of ledger 4.17):
  tables/g078/rows_all.lines, tables/g078hi/rows_all.lines   rows of the profiles and of the scans at the tilt (2/5, 3/20)
  margins/rows078.lines                                      rows of the scans at the tilt (2/5, 3/10) (margins/m078_t*.json)
Prints float minus rational for (l, beta, b_A, b_B), and the largest absolute difference per file.
usage (from this folder's parent, design-2026-11-25/):  python3 -I checks/rows_compare.py"""
import json, os
from fractions import Fraction as F
here = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..')
ft = json.load(open(os.path.join(here, 'tables', 'fin_table.json')))
rat = {round(c['tprime'], 4): {k: F(v) for k, v in c['row'].items()} for c in ft['cases']}
def load(f): return {round(r['t'], 4): r for r in (json.loads(l) for l in open(os.path.join(here, f)) if l.strip())}
files = ['tables/g078/rows_all.lines', 'tables/g078hi/rows_all.lines', 'margins/rows078.lines']
for f in files:
    S = load(f); worst = {}
    print(f)
    for t in sorted(rat):
        if t not in S: continue
        d = {k: S[t][k] - float(rat[t][k]) for k in ('l', 'beta', 'bA', 'bB')}; m = max(abs(v) for v in d.values()); worst[t] = m
        print('  row %.3f: ' % t + '  '.join('%s %+.2e' % (k, d[k]) for k in d) + '   max %.2e   nu5 (float row) %.7f' % (m, S[t]['nu5']))
    small = [t for t in worst if worst[t] < 1e-4]; big = [t for t in worst if worst[t] >= 1e-4]
    print('  largest difference over the rows within 1e-4: %.2e (%d rows); rows that differ by 1e-4 or more: %s' % (
        max(worst[t] for t in small) if small else float('nan'), len(small), ', '.join('%.3f (%.1e)' % (t, worst[t]) for t in big) or 'none'))
# which rows did each margin scan use?
import glob
for pref, label in (('m078_t', 'tilt (2/5, 3/10)'), ('m078b_t', 'tilt (2/5, 3/20)')):
    bad = []
    for f in sorted(glob.glob(os.path.join(here, 'margins', pref + '*.json'))):
        m = json.load(open(f)); t = round(m['t'], 4)
        if t in rat:
            d = max(abs(m['row'][k] - float(rat[t][k])) for k in ('l', 'beta', 'bA', 'bB'))
            if d >= 1e-4: bad.append('%.3f (%.1e)' % (t, d))
    print('margin scans %s*.json, %s: rows that differ from the certificate row by 1e-4 or more: %s' % (pref, label, ', '.join(bad) or 'none'))
