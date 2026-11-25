#!/usr/bin/env python3
"""Table of the shifted-row results (games/NAME/out/shift5_*.json): for every piece the band minimum of theta_room of every
row that covers it (N).  claude-b9ee worker d5newcap, 17 Nov 2026.   usage: scope_table.py DIR [DIR ...]   (folders holding shift5_*.json)"""
import sys, os, json, glob
recs = {}
for d in sys.argv[1:]:
    for fn in sorted(glob.glob(os.path.join(d, 'shift5_*.json'))):
        pub = fn.endswith('_pub.json')
        for r in json.load(open(fn)):
            key = (round(r['piece'][0], 4), round(r['piece'][1], 4), round(r['tprime'], 4), pub)
            if key not in recs or (r.get('band_min') and not recs[key].get('band_min')): recs[key] = r
print('| piece | row tuned at | room | mu (tilt) | own kappa_AB | u*(t\') | cap of the piece / u*(t\') | band minimum of theta_room | at u (u/u*(t\'); u/cap) | binding chi | energies scanned (u/u*) |')
print('|---|---|---|---|---|---|---|---|---|---|---|')
for key in sorted(recs, key=lambda k: (-(k[0] + k[1]) / 2, k[3], k[2])):
    r = recs[key]; a, b, tp, pub = key; bm = r.get('band_min')
    if r.get('room', 0) <= 0 or 'ustar' not in r:
        print('| [%.4f, %.4f]%s | %.3f | %.2e: the row exceeds the target on the piece | | | | | | | | |' % (a, b, ' (published piece and room)' if pub else '', tp, r.get('room', float('nan')))); continue
    pts = [p for p in r.get('pts', []) if p.get('theta_room')]
    print('| [%.4f, %.4f]%s | %.3f%s | %.2e | %.3f | %.3f | %.4f | %.3f | %s | %s | %s | %s |' % (
        a, b, ' (published piece and room)' if pub else '', tp, ' (own)' if abs(tp - (a + b) / 2) < 1e-6 else '', r['room'], r['mu'], r['kappa'], r['ustar'], r['ucap'] / r['ustar'],
        ('**%.3f**' % bm['theta_room']) if bm else '-', ('%.4f (%.3f; %.3f)' % (bm['u'], bm['ufrac'], bm['ucapfrac'])) if bm else '-', ('%g' % bm['chi_room']) if bm and bm.get('chi_room') else '-',
        ('%.2f-%.2f' % (min(p['ufrac'] for p in r['pts']), max(p['ufrac'] for p in r['pts']))) if r.get('pts') else '-'))
