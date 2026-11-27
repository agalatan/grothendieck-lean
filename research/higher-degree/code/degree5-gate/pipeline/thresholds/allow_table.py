#!/usr/bin/env python3
"""Table of the allowances over the game family (reads games/*/allow.json).  claude-b9ee worker d5newcap, 16 Nov 2026.
usage: allow_table.py [rows "0.80,0.82"]"""
import sys, os, json, glob
here = os.path.dirname(os.path.abspath(__file__))
tsel = (sys.argv[1] if len(sys.argv) > 1 else '0.80,0.82').split(',')
games = []
for fn in sorted(glob.glob(os.path.join(here, 'games', '*', 'allow.json'))):
    d = json.load(open(fn)); games.append((d['game']['e1'], d['game']['eta'], os.path.basename(os.path.dirname(fn)), d))
games.sort(key=lambda x: (x[0], x[1]))
f3 = lambda v: ('%.3f' % v) if v is not None else '-'
def series(dct):
    if not dct: return '-'
    return ' '.join('%s: %s' % (k_, f3(v)) for k_, v in sorted(dct.items(), key=lambda kv: float(kv[0])))
for tname in tsel:
    print('\nrow t = %s (energies as u/u*)' % tname)
    print('| game (lambda_1, gamma) | margin | room of the row | t_lo | mu untilted -> tilt (0.4, 0.3) (at |q|) | u* | cap/u* | theta_room, kappa_AB = 0.82 | theta_0, 0.82 | quintic share kappa_h | own kappa_AB | theta_room, own kappa_AB |')
    print('|---|---|---|---|---|---|---|---|---|---|---|---|')
    for e1, eta, name, d in games:
        x = d['rows'].get(tname)
        if not x or 'theta_room' not in x: continue
        tr = x.get('theta_room_ref') if x.get('theta_room_ref') and any(v is not None for v in x['theta_room_ref'].values()) else x['theta_room']
        tz = x.get('theta_zero_ref') if x.get('theta_zero_ref') and any(v is not None for v in x['theta_zero_ref'].values()) else x.get('theta_zero', {})
        tz = {k_: v for k_, v in (tz or {}).items() if v is not None}
        print('| (%.4g, %.4g) %s | %.2e | %.2e | %.4f | %.3f -> %.3f (%.2f) | %.4f | %.3f | %s | %s | %s | %s | %s |' % (
            e1, eta, name, d['margin'], x['room_used'], x['tlo'], x['mu_untilted'], x['mu_tilt'], x['mu_tilt_at'], x['ustar'], x['ucap_over_ustar'],
            series(tr), series(tz) if tz else '-', f3(x.get('kappa_h')), f3(x.get('kappa_own')), series(x.get('theta_room_own'))))
