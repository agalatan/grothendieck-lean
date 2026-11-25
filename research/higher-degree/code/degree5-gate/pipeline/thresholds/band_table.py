#!/usr/bin/env python3
"""Tables from games/*/band4.json (N).  claude-b9ee worker d5newcap, 16 Nov 2026.   usage: band_table.py [name ...]"""
import sys, os, json, glob
here = os.path.dirname(os.path.abspath(__file__))
names = sys.argv[1:] or [os.path.basename(os.path.dirname(f)) for f in sorted(glob.glob(os.path.join(here, 'games', '*', 'band4.json')))]
def cell(p): return ('%.3f (chi %s)' % (p['theta_room'], '%g' % p['chi'] if p.get('chi') else '-')) if p and p.get('theta_room') else '-'
for nm in names:
    fn = os.path.join(here, 'games', nm, 'band4.json')
    if not os.path.exists(fn): continue
    d = json.load(open(fn)); g = d['game']
    print('\ngame %s = (1, -%.4g, %.4g): N %.7f, margin %.2e, peak at t = %.4f' % (nm, g['e1'], g['eta'], d['N'], d['margin'], d['t_peak']))
    print('| row t | piece | room | mu (tilt 0.4, 0.3) | u* | cap/u* | quintic share | own kappa_AB | BAND MINIMUM of theta_room: value at u/u* (binding chi) | theta_room at 0.85 u* | 0.90 u* | 1.0 u* |')
    print('|---|---|---|---|---|---|---|---|---|---|---|---|')
    for tn in sorted(d['rows'], key=float):
        x = d['rows'][tn]
        for key in ('band_own', 'band_082', 'band_chi'):
            b = x.get(key)
            if not b: continue
            at = lambda f: next((p for p in b['pts'] if abs(p['ufrac'] - f) < 0.006), None)
            m = b.get('min')
            kap = b['kappa'] if isinstance(b['kappa'], str) else '%.3f' % b['kappa']
            print('| %s%s | [%.4f, %.4f] | %.2e | %.3f | %.4f | %.3f | %s | %s | %s | %s | %s | %s |' % (
                tn, {'band_own': '', 'band_082': ' (study split)', 'band_chi': ' (chi-dependent split)'}[key], x['active'][0], x['active'][1], x['room_used'], x['mu_tilt'], x.get('ustar', float('nan')),
                x.get('ucap_over_ustar', float('nan')), ('%.3f' % x['kappa_h']) if 'kappa_h' in x else '-', kap if key != 'band_chi' else 'f(chi)',
                ('%.3f at %.3f (chi %s)' % (m['theta_room'], m['ufrac'], '%g' % m['chi_room'] if m.get('chi_room') else '-')) if m else '-', cell(at(0.85)), cell(at(0.90)), cell(at(1.0))))
