#!/usr/bin/env python3
"""Per-cell factors of the funded design D* (ledger 4.44) at higher targets (N), from the allowances recomputed with the reduced rooms.
  collect_factors.py pack OUTDIR(with r4_theta6_1<name>_M<tag>.json) JOB/rooms_targets.json   -> thetas.json (the compact record that is committed)
  collect_factors.py table                                                                   -> the table (reads thetas.json, cells.json beside it)
factor of a piece = min over the cells (cubics found; cells.json) of allowance(u, chi-bin) / ratio, exactly as scripts/final_table.py of the
design: for the c = 4 family the smallest allowance over the grid values of chi in the bin (or the next grid value above the cubic's
chi), for a stored maximiser the allowance at the next grid chi above its own.  A factor above 1 proves nothing (ledger 4.44): the
ratios are lower bounds of the largest ratio, from cubics in at most 13 variables, and the allowances are float conic programs.
Control: the target tag K14020 is the funded allocation itself and must reproduce factor_fundFull of the design's table on pieces 1-11 within the
tolerance 1e-2 of the allowance program."""
import sys, os, json
from fractions import Fraction as F
HERE = os.path.dirname(os.path.abspath(__file__)); TAGS = ['K14020', 'K14021', 'K14023', 'K14025', 'K14027']
def factor(pts, cells):
    best = None
    for q in cells:
        p = min(pts, key=lambda p_: abs(p_['u'] - q['u'])); tol = (1e-5 if 'bin' in q else 1e-4) * max(p['u'], 1e-9) + 1e-9
        if abs(p['u'] - q['u']) > tol: continue
        tc = {float(k): v for k, v in (p.get('theta_chi') or {}).items() if v}
        if 'bin' in q:
            lo, hi = q['bin']; cand = [v for x, v in tc.items() if lo - 1e-9 <= x <= min(hi, 42.0) + 1e-9] or [v for x, v in sorted(tc.items()) if x >= q['chi']][:1]
            if not cand: continue
            al = min(cand)
        else:
            up = sorted(x for x in tc if x >= q['chi'] - 1e-9)
            if not up: continue
            al = tc[up[0]]
        f = al / q['ratio']
        if best is None or f < best['factor']: best = dict(factor=f, src=q['src'], ucapfrac=p['ucapfrac'], chi=q['chi'], ratio=q['ratio'], allowance=al)
    return best
if sys.argv[1] == 'pack':
    outd, rooms = sys.argv[2], json.load(open(sys.argv[3])); res = []
    for r in rooms:
        p = os.path.join(outd, 'r4_theta6_1%s_M%s.json' % (r['name'], r['target'])); rec = dict(r)
        if os.path.exists(p):
            d = json.load(open(p)); assert abs(d['room'] - r['room_left']) < 1e-15
            rec['pts'] = [dict(ucapfrac=q['ucapfrac'], u=q['u'], theta_room=q.get('theta_room'), chi_room=q.get('chi_room'), theta_chi=q.get('theta_chi')) for q in d['pts']]
        res.append(rec)
    json.dump(res, open(os.path.join(HERE, 'thetas.json'), 'w'), indent=0); print(sum(1 for r in res if 'pts' in r), 'runs packed of', len(res))
else:
    th = json.load(open(os.path.join(HERE, 'thetas.json'))); cells = {c['j']: c for c in json.load(open(os.path.join(HERE, 'cells.json')))}
    by = {(r['j'], r['target']): r for r in th}; worst = {t: None for t in TAGS}; dev = []
    print('| piece | row | ' + ' | '.join('K* = 1.%s: room left (1e-4), factor' % t[2:] for t in TAGS) + ' |'); print('|---|---|' + '---|' * len(TAGS))
    for j in sorted(cells):
        c = cells[j]; out = []
        for t in TAGS:
            r = by[(j, t)]
            if r['room_left'] <= 0: out.append('%.3f, **no room**' % (r['room_left'] * 1e4)); worst[t] = (0.0, j); continue
            if 'pts' not in r:
                out.append('%.3f, %s' % (r['room_left'] * 1e4, ('%.2f (design)' % c['factor_fundFull']) if t == 'K14020' else 'not run'))
                f = c['factor_fundFull'] if t == 'K14020' else None
            else:
                b = factor([p for p in r['pts'] if p.get('theta_room')], c['cells']); f = b['factor'] if b else None
                if t == 'K14020': assert abs(f - c['factor_fundFull']) < 1e-2 * f, ('control', j, f, c['factor_fundFull']); dev.append(abs(f / c['factor_fundFull'] - 1))
                out.append('%.3f, %s' % (r['room_left'] * 1e4, ('%.2f' % f) if f else 'no cell'))
            if f is not None and (worst[t] is None or f < worst[t][0]): worst[t] = (f, j)
        print('| %d [%.4f, %.4f] | %s | ' % (j, float(F(c['piece'][0])), float(F(c['piece'][1])), c['row']) + ' | '.join(out) + ' |')
    print('\nsmallest factor per target: ' + '; '.join('1.%s: %s' % (t[2:], ('%.2f (piece %d)' % worst[t]) if worst[t] and worst[t][0] > 0 else 'no room on piece %d' % worst[t][1]) for t in TAGS))
    print('control: the factors at 1.4020 on the pieces 1-11 (a re-run of the funded allocation) differ from those of tables/funded/fin_table_fundFull.json of the design by at most %.1e relative (tolerance of the allowance program: 1e-2); %d of 11 agree to 1e-9' % (max(dev), sum(1 for x in dev if x < 1e-9)))
