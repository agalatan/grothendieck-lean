#!/usr/bin/env python3
"""Per-cell safety factors of cases given as a list of {name, band, ...} (the three covers of the game (1, -0.77, 0.05) at the tilt
(2/5, 3/20)): smallest allowance(u, chi)/ratio over the c = 4 cluster family (ten bins) and the stored maximisers, and the smallest
quotient with one constant per energy (N).   usage: cells_table.py WORK CASES.json MODEL"""
import sys, json, os
work, cf, model = sys.argv[1:4]; load = lambda p: json.load(open(p)) if os.path.exists(p) else None
for cs in json.load(open(cf)):
    d = load(os.path.join(work, 'out', 'r4_theta6_1%s_M%s.json' % (cs['name'], model))); pts = [p for p in (d or {}).get('pts', []) if p.get('theta_room')]
    if not pts: print(cs['name'], 'no result'); continue
    cells = []
    for q in (load(os.path.join(work, 'out', 'ratio%s_c4.json' % cs['name'])) or {}).get('pts', []):
        if not q['possible']: continue
        p = min(pts, key=lambda p_: abs(p_['u'] - q['u']))
        if abs(p['u'] - q['u']) > 1e-5 * p['u']: continue
        tc = {float(k): v for k, v in p['theta_chi'].items() if v}; lo, hi = q['bin']; cand = [v for x, v in tc.items() if lo - 1e-9 <= x <= min(hi, 42.0) + 1e-9]
        if cand: cells.append(dict(src='c=4 clusters', u=p['ufrac'], chi=q['chi'], ratio=q['ratio'], allow=min(cand)))
    for rf in ('b2_gen5_5_u0.85_n6_free', 'b2_gen5_5_u0.85_n5_free', 'b2_rows_n4'):
        for q in (load(os.path.join(work, 'out', 'reeval_%s_%s.json' % (os.path.splitext(cs['band'])[0], rf))) or []):
            if not q['possible']: continue
            p = min(pts, key=lambda p_: abs(p_['u'] - q['u']))
            if abs(p['u'] - q['u']) > 1e-4 * p['u']: continue
            tc = {float(k): v for k, v in p['theta_chi'].items() if v}; up = sorted(x for x in tc if x >= q['chi'] - 1e-9)
            if up: cells.append(dict(src='stored n=%d' % q['n'], u=p['ufrac'], chi=q['chi'], ratio=q['ratio'], allow=tc[up[0]]))
    if not cells: print(cs['name'], 'no cells'); continue
    w = min(cells, key=lambda c: c['allow'] / c['ratio']); per_u = []
    for p in pts:
        rr = [c for c in cells if abs(c['u'] - p['ufrac']) < 1e-6]
        if rr: per_u.append((p['theta_room'] / max(c['ratio'] for c in rr), p['ufrac'], p['theta_room'], max(c['ratio'] for c in rr)))
    o = min(per_u)
    print('%s (row %.2f, mu %.4f, room %.2e): band minimum %.3f | per cell: smallest factor %.2f (%s, u/u* %.2f, chi %.1f, ratio %.3f, allowance %.3f) | one constant per energy: %.2f (u/u* %.2f: %.3f / %.3f) | %d cells' % (
        cs['name'], cs['tprime'], cs['mu'], cs['room'], min(p['theta_room'] for p in pts), w['allow'] / w['ratio'], w['src'], w['u'], w['chi'], w['ratio'], w['allow'], o[0], o[1], o[2], o[3], len(cells)))
