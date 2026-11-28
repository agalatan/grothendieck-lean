# Stage 0 (b): which shell groups make up the quintic share kappa_h at its maximising gate point (N).
#   usage: b_groups.py GATEB > groups.md     (GATEB as for b_collect.py; finite points with D > 0, as gate/kappa_h.py)
import sys, os, json, math
G = sys.argv[1]; T = {0.70: 1, 0.80: 7, 0.82: 9, 0.84: 11, 0.85: 13, 0.86: 15, 0.875: 18, 0.886: 20}
KEYS = ['H11', 'H20/H02', 'H21/H12', 'H22', 'H30', 'H31', 'H32', 'H10/H01']
print('| game | t | kappa_h | ' + ' | '.join(KEYS) + ' | (c, sigma/sigma*) |'); print('|---|---|---|' + '---|' * (len(KEYS) + 1))
for g in ('gC', 'g80', 'g83', 'g84', 'gA'):
    rows = [json.loads(l) for l in open(os.path.join(G, 'gate_%s/rows5.lines' % g)) if l.strip()]
    for t, k in T.items():
        p = os.path.join(G, 'gate_%s/out/sp2_%d.json' % (g, k))
        if not os.path.exists(p): continue
        fin = [q for q in json.load(open(p))['pts'] if q['D'] > 0 and all(math.isfinite(v) for v in q['groups'].values())]
        if not fin: continue
        h = lambda q: sum(v for n, v in q['groups'].items() if n not in ('H10/H01', 'const')) / (q['D'] + q['Vsl'])
        q = max(fin, key=h); den = q['D'] + q['Vsl']; s = rows[k - 1]['sig']
        print('| %s | %g | %.3f | %s | (%g, %.2f) |' % (g, t, h(q), ' | '.join('%.3f' % (q['groups'][n] / den) for n in KEYS), q['c'], q['sig'] / s if s > 1e-9 else float('nan')))
