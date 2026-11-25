#!/usr/bin/env python3
"""THE SCOPE TABLE: one line per piece t, the best achievable band minimum of theta_room with everything applied together (N).
claude-b9ee worker d5newcap, 17 Nov 2026.   Reads shift5_*_f*.json (pieces [t - 0.005, t + 0.005]; every covering row; chi-dependent
split; law gap of the covering row counted in the room; all sector weights; 15 chi; (R1) and cap at the lower end of the
piece) and shift5_*_pub.json (the published pieces of the stage-2 certificate with their certified rooms).
usage: scope_final.py OUTDIR-with-shift5-files [E1]"""
import sys, os, json, glob
d = sys.argv[1]; e1 = float(sys.argv[2]) if len(sys.argv) > 2 else 0.78
cap = lambda t: 4 * e1 * e1 * 0.432306903 * (0.886762780 - t)
new, pub = {}, []
for fn in sorted(glob.glob(os.path.join(d, 'shift5_*.json'))):
    for r in json.load(open(fn)):
        if fn.endswith('_pub.json'): pub.append(r)
        elif '_f' in os.path.basename(fn): new.setdefault(round((r['piece'][0] + r['piece'][1]) / 2, 4), []).append(r)
print('| piece t | cap of the piece (lower end) | covers computed: row t\' -> band minimum (room) | BEST: row tuned at | its room (law gap counted) | mu | kappa_AB(chi) | **band minimum of theta_room** | at u (in u*(t\'); in cap) | binding chi | weights of (F): A, B |')
print('|---|---|---|---|---|---|---|---|---|---|---|')
for t in sorted(new, reverse=True):
    rs = sorted(new[t], key=lambda r: r['tprime']); ok = [r for r in rs if r.get('band_min')]
    covers = ', '.join(('%.2f -> %.3f (%.1e)' % (r['tprime'], r['band_min']['theta_room'], r['room'])) if r.get('band_min') else ('%.2f -> not possible (%.1e)' % (r['tprime'], r['room'])) for r in rs)
    if not ok: print('| %.2f | %.4f | %s | none | | | | | | | |' % (t, cap(t - 0.0051), covers)); continue
    b = max(ok, key=lambda r: r['band_min']['theta_room']); bm = b['band_min']; kc = b.get('kappa_chi')
    wf = next((p.get('weights_F') for p in b['pts'] if abs(p['u'] - bm['u']) < 1e-12), None)
    print('| %.2f | %.4f | %s | %.2f | %.2e (%.1e) | %.3f | %s | **%.3f** | %.4f (%.3f; %.3f) | %s | %s |' % (
        t, b['ucap'], covers, b['tprime'], b['room'], b.get('law_gap', 0.0), b['mu'], ('%s .. %s' % (kc.split(',')[0].split(':')[1], kc.split(',')[-1].split(':')[1])) if kc else '%.3f' % b['kappa'],
        bm['theta_room'], bm['u'], bm['ufrac'], bm['ucapfrac'], '%g' % bm['chi_room'] if bm.get('chi_room') else '-', ('%.2f, %.2f' % tuple(wf)) if wf else '-'))
if pub:
    print('\nPublished pieces of the stage-2 certificate (rows active below their label; certified rooms; chi-dependent split, all weights):')
    print('| published row | active on | certified room | cap | band minimum of theta_room | at u (in u*; in cap) | binding chi |')
    print('|---|---|---|---|---|---|---|')
    for r in sorted(pub, key=lambda r: -r['tprime']):
        bm = r.get('band_min')
        print('| %.2f | [%.4f, %.4f] | %.2e | %s | %s | %s | %s |' % (r['tprime'], r['piece'][0], r['piece'][1], r['room'], ('%.4f = %.3f u*' % (r['ucap'], r['ucap'] / r['ustar'])) if 'ucap' in r else '-',
              ('**%.3f**' % bm['theta_room']) if bm else '-', ('%.4f (%.3f; %.3f)' % (bm['u'], bm['ufrac'], bm['ucapfrac'])) if bm else '-', ('%g' % bm['chi_room']) if bm and bm.get('chi_room') else '-'))
