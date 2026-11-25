#!/usr/bin/env python3
"""Allowances theta_room(u) of band rows of one game, fine chi grid, exact Gamma' (N).  claude-b9ee worker d5newcap, 16 Nov 2026.
For the game T = P10 - e1 P21 + eta P32:
  1. Gaussian-ideal rows on the list TS (rows/rowscan.py; reused if present);  2. the float envelope: for each selected row its
  active piece [t_lo, t_hi], the room 500/701 - (max on the piece) - ROOM_LOSS (1.5e-5), the model value N and the margin;
  3. profiles with exact derivatives and the pointwise margin mu of the tilt (0.4, 0.3) (prof2.py);
  4. theta_room(u) with the binding chi (r4_theta3.py: 15 values of chi from 1 to 42, cells without a possible law left out),
     for kappa_AB = 0.82 (the study's) and, with OWN=1, for the game's own kappa_AB = 1 - kappa_h - 0.02 (gate/kappa_h.py).
The law layer of the pieces is the Gaussian-ideal one: with the radius input B(s) the float law layer has no gap on these rows
(checked for (0.81, 0.165) at t = 0.80, 0.82), so a row is active around its own t.
usage: allow3.py NAME E1 ETA [rows "0.80,0.82"] [energies "0.85,0.90,1.0"]      env: ALLOW_PY, ALLOW_TASKSET, ALLOW_TS, OWN=1, R4_ZERO=1
       -> thresholds/games/NAME/allow3.json and one line per row on stdout"""
import sys, os, json, subprocess, time
here = os.path.dirname(os.path.abspath(__file__)); rowsdir = os.path.join(here, '..', 'rows'); gate = os.path.join(here, '..', 'gate')
name, e1, eta = sys.argv[1:4]
tsel = [float(x) for x in (sys.argv[4] if len(sys.argv) > 4 else '0.80,0.82').split(',')]
ulist = sys.argv[5] if len(sys.argv) > 5 else '0.85,0.90,1.0'
PY = os.environ.get('ALLOW_PY', sys.executable); pin = os.environ.get('ALLOW_TASKSET'); pre = (['taskset', '-c', pin] if pin else [])
gd = os.path.join(here, 'games', name); os.makedirs(os.path.join(gd, 'out'), exist_ok=True); os.chdir(gd)
env = dict(os.environ, D5_E1=e1, D5_ETA=eta, OMP_NUM_THREADS='1', OPENBLAS_NUM_THREADS='1', MKL_NUM_THREADS='1', VECLIB_MAXIMUM_THREADS='1', RAYON_NUM_THREADS='1')
def run(cmd, log, extra=None):
    with open(log, 'a') as f: subprocess.run(pre + cmd, env=dict(env, **(extra or {})), stdout=f, stderr=subprocess.STDOUT, check=True)
T0 = time.time()
TS = [float(x) for x in os.environ['ALLOW_TS'].split(',')] if os.environ.get('ALLOW_TS') else [0.79, 0.80, 0.81, 0.82, 0.83, 0.84, 0.845, 0.85, 0.855]
have = [json.loads(l)['t'] for l in open('rows_all.lines') if l.strip()] if os.path.exists('rows_all.lines') else []
miss = [t for t in TS if not any(abs(t - h) < 1e-9 for h in have)]
if miss: run([PY, os.path.join(rowsdir, 'rowscan.py'), 'rows_all.lines', ','.join('%g' % t for t in miss)], 'out/rows.log')
rows = sorted([json.loads(l) for l in open('rows_all.lines') if l.strip()], key=lambda r: r['t'])
open('rows5.lines', 'w').write('\n'.join(json.dumps({k: r[k] for k in ('t', 'l', 'beta', 'bA', 'bB', 'sig', 'nu5', 'branch', 'row', 'plain', 'driver')}) for r in rows) + '\n')
sys.path.insert(0, rowsdir)
from fractions import Fraction as F
from envelope import envelope
import numpy as np
ex = [(F(r['l']).limit_denominator(10 ** 12), F(r['row'] - r['t'] ** 2 + 2 * r['l'] * r['t']).limit_denominator(10 ** 12)) for r in rows]
tall = [r['t'] for r in rows]
B, tb, pieces = envelope(ex, F(min(tall)).limit_denominator(10 ** 6), F(max(tall)).limit_denominator(10 ** 6))
TGT = 500 / 701
tt = np.array(tall); vv = np.array([r['row'] for r in rows]); i = int(np.argmax(vv)); i = min(max(i, 1), len(tt) - 2)
c = np.polyfit(tt[i - 1:i + 2], vv[i - 1:i + 2], 2); tp = -c[1] / (2 * c[0]); Npk = float(np.polyval(c, tp))
loss = float(os.environ.get('ROOM_LOSS', 1.5e-5)); own = os.environ.get('OWN') == '1'; ATAG = os.environ.get('ALLOW_TAG', '')
info = dict(game=dict(e1=float(e1), eta=float(eta)), N=Npk, margin=TGT - Npk, t_peak=float(tp), rows={}, chi_grid='1,2,3,4,6,8,10,12,14,16,20,24,30,36,42', kappa_AB_default=0.82)
band = dict(tilt=[0.4, 0.3], rows={})
for t in tsel:
    k = [j for j, r in enumerate(rows, 1) if abs(r['t'] - t) < 1e-9][0]
    act = [(float(a), float(b), float(max(a * a - 2 * ex[i_][0] * a + ex[i_][1], b * b - 2 * ex[i_][0] * b + ex[i_][1]))) for a, b, i_ in pieces if i_ == k - 1]
    a = min(x[0] for x in act); b = max(x[1] for x in act); m = max(x[2] for x in act)
    pf = 'out/prof_%d.npz' % k
    if os.path.exists(pf) and 'dGA' not in np.load(pf).files: os.replace(pf, 'out/prof_%d_spline.npz' % k)
    if not os.path.exists(pf): run([PY, os.path.join(here, 'prof2.py'), str(k), '0,0', '0.4,0.3'], 'out/prof2_%d.log' % k)
    mu = {(x['s'], x['t']): x for x in json.load(open('out/mu_%d.json' % k))['tilts']}; r = rows[k - 1]
    band['rows'][str(k)] = dict(t='%.3f' % t, mu=mu[(0.4, 0.3)]['mu'], tlo=a - 1e-4, room=TGT - m - loss)
    info['rows']['%.3f' % t] = dict(k=k, row=r['row'], l=r['l'], beta=r['beta'], bA=r['bA'], bB=r['bB'], nu5=r['nu5'], sig=r['sig'], active=[a, b], room_float=TGT - m,
                                    room_used=TGT - m - loss, tlo=a - 1e-4, mu_untilted=mu[(0.0, 0.0)]['mu'], rho_AB=mu[(0.0, 0.0)]['ratio_max'],
                                    mu_tilt=mu[(0.4, 0.3)]['mu'], mu_tilt_at=mu[(0.4, 0.3)]['at_q'])
json.dump(band, open('band3.json', 'w'), indent=1)
def series(d): return ' '.join('%.2f: %s (chi %s)' % (p['ufrac'], ('%.3f' % p['theta_room']) if p['theta_room'] else '-', ('%g' % p['chi_room']) if p['chi_room'] else '-') for p in d['pts'])
print('game %s (e1 %s, eta %s)%s: N %.7f margin %.3e (peak t %.4f)' % (name, e1, eta, (' [' + ATAG + (', law class with the radius input B(chi)' if os.environ.get('LAW_RADIUS') else '') + ']') if ATAG else '', Npk, TGT - Npk, tp), flush=True)
for t in tsel:
    x = info['rows']['%.3f' % t]; k = x['k']
    run([PY, os.path.join(here, 'r4_theta3.py'), str(k), ulist, '-', ATAG], 'out/r4_theta3_%d%s.log' % (k, ATAG), dict(BAND_ROWS='band3.json'))
    d = json.load(open('out/r4_theta3_%d%s.json' % (k, ATAG))); x.update(ustar=d['ustar'], ucap_over_ustar=d['ucap'] / d['ustar'], theta=d['pts'])
    line = '  t=%.3f: row %.7f piece [%.4f, %.4f] room %.3e | mu %.4f -> tilt %.4f (at |q| %.2f) | u* %.5f cap %.3f u* | kappa_AB 0.82: %s' % (
        t, x['row'], x['active'][0], x['active'][1], x['room_used'], x['mu_untilted'], x['mu_tilt'], x['mu_tilt_at'], x['ustar'], x['ucap_over_ustar'], series(d))
    if own:
        kf = 'kappa_%d.json' % k
        if not os.path.exists(kf): run([PY, os.path.join(gate, 'kappa_h.py'), 'rows5.lines', str(k), kf], 'out/kappa.log')
        kh = json.load(open(kf)); kap = round(1 - kh['kappa_h'] - 0.02, 4)
        run([PY, os.path.join(here, 'r4_theta3.py'), str(k), ulist, '-', ATAG + '_own'], 'out/r4_theta3_%d%s_own.log' % (k, ATAG), dict(BAND_ROWS='band3.json', KAPPA_AB=repr(kap)))
        d2 = json.load(open('out/r4_theta3_%d%s_own.json' % (k, ATAG))); x.update(kappa_h=kh['kappa_h'], kappa_AB_exact=kh['kappa_AB'], kappa_own=kap, theta_own=d2['pts'])
        line += ' | quintic share %.3f -> own kappa_AB %.3f: %s' % (kh['kappa_h'], kap, series(d2))
    print(line, flush=True)
    info['secs'] = time.time() - T0; json.dump(info, open('allow3%s.json' % ATAG, 'w'), indent=1)
