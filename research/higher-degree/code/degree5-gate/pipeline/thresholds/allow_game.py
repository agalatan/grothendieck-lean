#!/usr/bin/env python3
"""Allowances theta_room(u) of the low band rows for one game (N).  claude-b9ee worker d5newcap, 16 Nov 2026.

For the game T = P10 - e1 P21 + eta P32:
  1. Gaussian-ideal rows at t = 0.79 ... 0.83 and 0.84, 0.845, 0.85, 0.855 (rows/rowscan.py);
  2. the float envelope: for the rows 0.80 and 0.82 the active piece [t_lo, t_hi] and the room 500/701 - max there; the
     model value N (parabola through the peak rows);
  3. profiles with exact derivatives and the pointwise margin mu of the tilt (prof2.py: accurate quadrature; since 22:45 on
     16 Nov; before that prof.py + tilt.py + mu_tilt.py with the study's spline derivative);
  4. theta_room(u), theta_0(u) (r4_theta2.py = the content worker's r4_theta.py) on the energies and chi given.
The room used is the float room minus ROOM_LOSS (default 1.5e-5: a guess of the certification losses; with the s-dependent
radius input the float law layer has no gap at these rows, see PROGRESS.md), t_lo is the piece's lower end minus 1e-4.
usage: allow_game.py NAME E1 ETA [rows "0.80,0.82"] [energies "0.5,0.7,0.85,1.0"] [chis "2,8,16,30,42"]
       (run from anywhere; works in thresholds/games/NAME/; ALLOW_PY = python to use, ALLOW_TASKSET = core to pin to;
        ALLOW_FULL=1: also the energy 0.5 u* and theta_0)"""
import sys, os, json, subprocess, time
here = os.path.dirname(os.path.abspath(__file__)); rowsdir = os.path.join(here, '..', 'rows')
name, e1, eta = sys.argv[1:4]
tsel = [float(x) for x in (sys.argv[4] if len(sys.argv) > 4 else '0.80,0.82').split(',')]
ulist = sys.argv[5] if len(sys.argv) > 5 else ('0.5,0.7,0.85,0.925,1.0' if os.environ.get('ALLOW_FULL') == '1' else '0.7,0.85,0.925,1.0')
chis = sys.argv[6] if len(sys.argv) > 6 else '2,8,16,30,42'
PY = os.environ.get('ALLOW_PY', sys.executable); pin = os.environ.get('ALLOW_TASKSET')
pre = (['taskset', '-c', pin] if pin else [])
gd = os.path.join(here, 'games', name); os.makedirs(os.path.join(gd, 'out'), exist_ok=True); os.chdir(gd)
env = dict(os.environ, D5_E1=e1, D5_ETA=eta, R4_ZERO=('1' if os.environ.get('ALLOW_FULL') == '1' else '0'), OMP_NUM_THREADS='1', OPENBLAS_NUM_THREADS='1', MKL_NUM_THREADS='1', VECLIB_MAXIMUM_THREADS='1', RAYON_NUM_THREADS='1')
def run(cmd, log):
    with open(log, 'a') as f: subprocess.run(pre + cmd, env=env, stdout=f, stderr=subprocess.STDOUT, check=True)
T0 = time.time()
TS = [float(x) for x in os.environ['ALLOW_TS'].split(',')] if os.environ.get('ALLOW_TS') else [0.79, 0.80, 0.81, 0.82, 0.83, 0.84, 0.845, 0.85, 0.855]
have = [json.loads(l)['t'] for l in open('rows_all.lines') if l.strip()] if os.path.exists('rows_all.lines') else []
miss = [t for t in TS if not any(abs(t - h) < 1e-9 for h in have)]
if miss:
    run([PY, os.path.join(rowsdir, 'rowscan.py'), 'rows_all.lines', ','.join('%g' % t for t in miss)], 'out/rows.log')
rows = sorted([json.loads(l) for l in open('rows_all.lines') if l.strip()], key=lambda r: r['t'])
open('rows5.lines', 'w').write('\n'.join(json.dumps({k: r[k] for k in ('t', 'l', 'beta', 'bA', 'bB', 'sig', 'nu5', 'branch', 'row', 'plain', 'driver')}) for r in rows) + '\n')
# ---- float envelope
sys.path.insert(0, rowsdir)
from fractions import Fraction as F
from envelope import envelope
ex = [(F(r['l']).limit_denominator(10 ** 12), F(r['row'] - r['t'] ** 2 + 2 * r['l'] * r['t']).limit_denominator(10 ** 12)) for r in rows]
B, tb, pieces = envelope(ex, F(min(TS)).limit_denominator(10 ** 6), F(max(TS)).limit_denominator(10 ** 6))
TGT = 500 / 701
import numpy as np
tt = np.array([r['t'] for r in rows]); vv = np.array([r['row'] for r in rows]); i = int(np.argmax(vv)); i = min(max(i, 1), len(tt) - 2)
c = np.polyfit(tt[i - 1:i + 2], vv[i - 1:i + 2], 2); tp = -c[1] / (2 * c[0]); Npk = float(np.polyval(c, tp))
loss = float(os.environ.get('ROOM_LOSS', 1.5e-5))
band = dict(tilt=[0.4, 0.3], rows={})
info = dict(game=dict(e1=float(e1), eta=float(eta)), N=Npk, margin=TGT - Npk, t_peak=float(tp), rows={})
for t in tsel:
    k = [j for j, r in enumerate(rows, 1) if abs(r['t'] - t) < 1e-9][0]
    act = [(float(a), float(b), float(max(a * a - 2 * ex[i_][0] * a + ex[i_][1], b * b - 2 * ex[i_][0] * b + ex[i_][1]))) for a, b, i_ in pieces if i_ == k - 1]
    a = min(x[0] for x in act); b = max(x[1] for x in act); m = max(x[2] for x in act)
    # profiles with EXACT derivatives (prof2.py); a table of the study's prof.py found here is kept as prof_<k>_spline.npz
    # and enters only the comparison printed by prof2.py
    pf = 'out/prof_%d.npz' % k
    if os.path.exists(pf) and 'dGA' not in np.load(pf).files: os.replace(pf, 'out/prof_%d_spline.npz' % k)
    if not os.path.exists(pf):
        run([PY, os.path.join(here, 'prof2.py'), str(k), '0,0', '0.4,0.3'], 'out/prof2_%d.log' % k)
    mu = {tuple(x[k_] for k_ in ('s', 't')): x for x in json.load(open('out/mu_%d.json' % k))['tilts']}
    r = rows[k - 1]
    band['rows'][str(k)] = dict(t='%.2f' % t, mu=mu[(0.4, 0.3)]['mu'], tlo=a - 1e-4, room=TGT - m - loss)
    info['rows']['%.2f' % t] = dict(k=k, row=r['row'], l=r['l'], beta=r['beta'], bA=r['bA'], bB=r['bB'], nu5=r['nu5'], sig=r['sig'], active=[a, b], room_float=TGT - m,
                                    room_used=TGT - m - loss, tlo=a - 1e-4, mu_untilted=mu[(0.0, 0.0)]['mu'], rho_AB=mu[(0.0, 0.0)]['ratio_max'],
                                    mu_tilt=mu[(0.4, 0.3)]['mu'], mu_tilt_at=mu[(0.4, 0.3)]['at_q'])
json.dump(band, open('band_rows.json', 'w'), indent=1)
for t in tsel:
    k = info['rows']['%.2f' % t]['k']
    run([PY, os.path.join(here, 'r4_theta2.py'), str(k), ulist, chis], 'out/r4_theta_%d.log' % k)
    d = json.load(open('out/r4_theta_%d.json' % k))
    info['rows']['%.2f' % t].update(ustar=d['ustar'], ucap_over_ustar=d['ucap'] / d['ustar'],
                                    theta_room={('%.3f' % p['ufrac']): p['theta_room'] for p in d['pts']}, theta_zero={('%.3f' % p['ufrac']): p['theta_zero'] for p in d['pts']},
                                    theta_room_ref={('%.3f' % p['ufrac']): p.get('theta_room_ref') for p in d['pts']}, theta_zero_ref={('%.3f' % p['ufrac']): p.get('theta_zero_ref') for p in d['pts']})
info['secs'] = time.time() - T0
json.dump(info, open('allow.json', 'w'), indent=1)
print('game %s (e1 %s, eta %s): N %.7f margin %.3e (peak t %.4f)' % (name, e1, eta, Npk, TGT - Npk, tp))
for t in tsel:
    x = info['rows']['%.2f' % t]
    print('  t=%.2f: row %.7f room %.3e t_lo %.4f | rho_AB %.4f mu %.4f -> tilt mu %.4f (at |q| %.2f) | u* %.5f cap %.3f u* | theta_room: %s | theta_0: %s' % (
        t, x['row'], x['room_used'], x['tlo'], x['rho_AB'], x['mu_untilted'], x['mu_tilt'], x['mu_tilt_at'], x['ustar'], x['ucap_over_ustar'],
        ' '.join('%s: %s' % (u_, ('%.3f' % v) if v is not None else '-') for u_, v in (x['theta_room_ref'] if any(v is not None for v in x['theta_room_ref'].values()) else x['theta_room']).items()),
        ' '.join('%s: %s' % (u_, ('%.3f' % v) if v is not None else '-') for u_, v in (x['theta_zero_ref'] if any(v is not None for v in x['theta_zero_ref'].values()) else x['theta_zero']).items())), flush=True)
