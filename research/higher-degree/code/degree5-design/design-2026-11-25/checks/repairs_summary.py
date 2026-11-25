#!/usr/bin/env python3
"""Summary of the two repairs of the zero-content obstruction (N; standard library only).
(b) funded rooms: tables/funded/rooms.json (checks/funded_rooms.py) and tables/funded/fin_table_fundMin.json, fin_table_fundFull.json
    (scripts/final_table.py on the allowances recomputed with the reduced rooms), against tables/fin_table.json (eta_h = 0);
(a) nu-matched rows: tables/nu_matched/mnu_<k>.json (scripts/margin_scan.py on the row with nu5 replaced by nu') and
    tables/nu_matched/r4_theta6_1<name>_Mnu.json (scripts/r4_theta6.py with the profile and margin of that row), against the same.
usage (from design-2026-11-25/):  python3 -I checks/repairs_summary.py > tables/REPAIRS.md"""
import json, os
here = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..'); T = lambda *a: os.path.join(here, 'tables', *a)
def chosen(path):
    d = json.load(open(path)); ch = {(tuple(c['piece']), c['row_tag']) for c in d['chosen']}
    return [c for c in d['cases'] if (tuple(c['piece']), c['row_tag']) in ch]
base = chosen(T('fin_table.json')); mn = chosen(T('funded', 'fin_table_fundMin.json')); fl = chosen(T('funded', 'fin_table_fundFull.json'))
rooms = {(r['j'], r['variant']): r for r in json.load(open(T('funded', 'rooms.json')))}
print('### (b) A part eta_h of the room given to the sectors other than A/B; allowances recomputed with the room left (N)')
print()
print('fundMin is FALSE as an allocation (checks/codex_a7c4_fundmin_test.py: the same pairs at lambda = 10^-12 need more than it gives on each of the pieces 1-11); its columns are a sensitivity calculation only.')
print('"not hit" = the zero-content pairs do not contradict eta_h = 0 on the piece; that eta_h = 0 suffices there is not shown.')
print('fundMin: eta_h = the lower bound of the eta_h that the zero-content pairs force with the split of D*; fundFull: eta_h = the whole gain F(nu\') - F(nu5) at the upper end of the piece.')
print('Per variant: eta_h (share of the room), the smallest allowance on the grid, the smallest factor allowance/ratio per cell, and with one constant per energy.')
print()
print('| j | piece | row | room | eta_h = 0: min theta, factor per cell, per energy | fundMin (refuted allocation): eta_h (share) | min theta, per cell, per energy | fundFull: eta_h (share) | min theta, per cell, per energy |')
print('|---|---|---|---|---|---|---|---|---|')
f3 = lambda c: '%.3f, %.2f, %.2f' % (c['band_min'], c['factor_per_cell'], c['factor_one_constant'])
for j, (b, m, f) in enumerate(zip(base, mn, fl), 1):
    assert b['piece'] == m['piece'] == f['piece'] and b['row_tag'] == m['row_tag'] == f['row_tag']
    rm, rf = rooms.get((j, 'fundMin')), rooms.get((j, 'fundFull'))
    e = lambda r: ('%.4e (%.1f %%)' % (r['eta_h'], 100 * r['share_of_room'])) if r else '0 (not hit)'
    print('| %d | [%.6f, %.6f] | %s | %.4e | %s | %s | %s | %s | %s |' % (j, b['a'], b['b'], b['row_tag'], b['room'], f3(b), e(rm), f3(m), e(rf), f3(f)))
for nm, cs in (('eta_h = 0 (false on pieces 1-11)', base), ('fundMin (false on pieces 1-11; sensitivity only)', mn), ('fundFull', fl)):
    w = min(cs, key=lambda c: c['factor_per_cell']); w1 = min(cs, key=lambda c: c['factor_one_constant'])
    print()
    print('%s: smallest factor per cell %.2f (piece [%.4f, %.4f], %s, u/cap %.2f, chi %.1f, ratio %.3f, allowance %.3f); with one constant per energy %.2f' % (
        nm, w['factor_per_cell'], w['a'], w['b'], w['worst_cell']['src'], w['worst_cell']['ucapfrac'], w['worst_cell']['chi'], w['worst_cell']['ratio'], w['worst_cell']['allowance'], w1['factor_one_constant']))
def drops(cs):
    out = []
    for b, c in zip(base, cs):
        old = {round(t['ucapfrac'], 3): t['theta_chi'] for t in b['theta']}; q = []
        for t in c['theta']:
            for x, v in (t['theta_chi'] or {}).items():
                o = old.get(round(t['ucapfrac'], 3), {}).get(x)
                if v and o and v < 49.999 and o < 49.999: q.append(v / o)
        out.append(min(q) if q else None)
    return out
print()
for nm, cs in (('fundMin', mn), ('fundFull', fl)):
    d = drops(cs)
    print('%s: smallest quotient theta(funded)/theta(eta_h = 0) over the cells, pieces 1-11: %s' % (nm, ', '.join('%.3f' % x for x in d[:11])))
print()
print('### (a) The row of each piece with nu5 replaced by nu\' = eta t gamma (t the upper end of the piece): margin and allowances (N)')
print()
print('Ratios of cubics were not recomputed with the new profiles: the last columns compare allowances only, cell by cell, where both runs have a value.')
print()
print('| j | row | nu5 | nu\' | margin at nu5 (design) | at nu\': mu0, smallest m/|rho|^2 found | min theta at nu5 | min theta at nu\' | theta(nu\')/theta(nu5) over the cells: min, median, max |')
print('|---|---|---|---|---|---|---|---|---|')
ROWS = {}
for f in ('g078', 'g078hi'):
    for l in open(T(f, 'rows_all.lines')):
        if l.strip(): r = json.loads(l); ROWS.setdefault(round(r['t'], 4), r)
for j, b in enumerate(base, 1):
    pm = T('nu_matched', 'mnu_%d.json' % j); pt = T('nu_matched', 'r4_theta6_1%s_Mnu.json' % b['name'])
    if not (os.path.exists(pm) and os.path.exists(pt)): continue
    m = json.load(open(pm)); d = json.load(open(pt)); old = {round(t['ucapfrac'], 3): t['theta_chi'] for t in b['theta']}; q = []; tmin = None
    for p in d['pts']:
        tc = p.get('theta_chi') or {}; oc = old.get(round(p['ucapfrac'], 3), {})
        for x, v in tc.items():
            if v and v < 49.999:
                tmin = v if tmin is None else min(tmin, v)
                if oc.get(x) and oc[x] < 49.999: q.append(v / oc[x])
    q.sort()
    print('| %d | %s | %.7f | %.7f | %.4f | %.4f, %.4f | %.3f | %s | %s |' % (j, b['row_tag'], ROWS[round(b['tprime'], 4)]['nu5'], m['row']['nu5'], b['mu'], m['mu0'], m['mu_glob'], b['band_min'],
          ('%.3f' % tmin) if tmin else '-', ('%.3f, %.3f, %.3f (%d cells)' % (q[0], q[len(q) // 2], q[-1], len(q))) if q else '-'))
