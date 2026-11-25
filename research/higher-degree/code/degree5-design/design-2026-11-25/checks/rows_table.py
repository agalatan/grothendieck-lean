#!/usr/bin/env python3
"""Prints the eighteen float tuned rows of the design D* (tables/g078/rows_all.lines up to 0.855, tables/g078hi/rows_all.lines from
0.86) as a Markdown table, with the rational (l, beta, b_A, b_B) of the certificate row beside them (tables/fin_table.json).
Written when the design computation was recorded; the problem statements P1 and P2 embed the table.  Stdlib only.
usage (from design-2026-11-25/):  python3 -I checks/rows_table.py > tables/ROWS_TABLE.md"""
import json, os
here = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..')
def load(f): return {round(r['t'], 4): r for r in (json.loads(l) for l in open(os.path.join(here, f)) if l.strip())}
lo = load('tables/g078/rows_all.lines'); hi = load('tables/g078hi/rows_all.lines')
ft = json.load(open(os.path.join(here, 'tables', 'fin_table.json'))); rat = {round(c['tprime'], 4): c['row'] for c in ft['cases']}
print('| row | ℓ | β | b_A | b_B | ν₅ | rational (ℓ, β, b_A, b_B) of the certificate |')
print('|---|---|---|---|---|---|---|')
for t in sorted(rat):
    r = lo[t] if (t in lo and t < 0.86 - 1e-9) else hi[t]; q = rat[t]
    print('| %s | %.10f | %.10f | %.10f | %.10f | %.10f | %s, %s, %s, %s |' % (('%.3f' % t).rstrip('0') if t * 100 % 1 > 1e-9 else '%.2f' % t,
          r['l'], r['beta'], r['bA'], r['bB'], r['nu5'], q['l'], q['beta'], q['bA'], q['bB']))
