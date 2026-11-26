#!/usr/bin/env python3
"""One game: for every content row the minimum over the energy band of theta_room, with its energy and binding chi (N).
claude-b9ee worker d5newcap, 16 Nov 2026.   For the game T = P10 - e1 P21 + eta P32:
  1. Gaussian-ideal rows on TS (rows/rowscan.py; reused if present): N, margin, peak;
  2. float envelope: each selected row's active piece [t_lo, t_hi] and room = 500/701 - (max on the piece) - 1.5e-5
     (with the radius input B(s) the float law layer has no gap on these rows, so a row is active around its own t);
  3. profiles with exact Gamma' and the pointwise margin mu of the tilt (0.4, 0.3) (prof2.py);
  4. the quintic shells' share kappa_h of D + V_sl in the exact coupled one-spike model (gate/kappa_h.py, 12 points), and the
     game's OWN constant split kappa_AB = 1 - kappa_h - 0.02 (the study's 0.82 = 1 - 0.16 - 0.02 for the present game);
  5. r4_theta4.py "band": theta_room(u) on u/u* = 0.75, 0.80, ..., up to the cap, refined at the minimum; 15 values of chi,
     cells without a possible law left out; the binding chi with every number.   BOTH=1: also kappa_AB = 0.82.
usage: band4.py NAME E1 ETA [rows "0.80,0.82,0.84,0.845,0.85,0.855"]      env: ALLOW_PY, ALLOW_TASKSET, ALLOW_TS, BOTH=1, NOKAPPA=1
       -> thresholds/games/NAME/band4.json; one line per row on stdout"""
import sys, os, json, subprocess, time
here = os.path.dirname(os.path.abspath(__file__)); rowsdir = os.path.join(here, '..', 'rows'); gate = os.path.join(here, '..', 'gate')
name, e1, eta = sys.argv[1:4]
tsel = [float(x) for x in (sys.argv[4] if len(sys.argv) > 4 else '0.80,0.82,0.84,0.845,0.85,0.855').split(',')]
PY = os.environ.get('ALLOW_PY', sys.executable); pin = os.environ.get('ALLOW_TASKSET'); pre = (['taskset', '-c', pin] if pin else [])
gd = os.path.join(here, 'games', name); os.makedirs(os.path.join(gd, 'out'), exist_ok=True); os.chdir(gd)
env = dict(os.environ, D5_E1=e1, D5_ETA=eta, OMP_NUM_THREADS='1', OPENBLAS_NUM_THREADS='1', MKL_NUM_THREADS='1', VECLIB_MAXIMUM_THREADS='1', RAYON_NUM_THREADS='1')
def run(cmd, log, extra=None):
    with open(log, 'a') as f: subprocess.run(pre + cmd, env=dict(env, **(extra or {})), stdout=f, stderr=subprocess.STDOUT, check=True)
T0 = time.time()
TS = [float(x) for x in os.environ['ALLOW_TS'].split(',')] if os.environ.get('ALLOW_TS') else [0.79, 0.80, 0.81, 0.82, 0.83, 0.84, 0.845, 0.85, 0.855, 0.86]
have = [json.loads(l)['t'] for l in open('rows_all.lines') if l.strip()] if os.path.exists('rows_all.lines') else []
miss = [t for t in TS if not any(abs(t - h) < 1e-9 for h in have)]
if miss: run([PY, os.path.join(rowsdir, 'rowscan.py'), 'rows_all.lines', ','.join('%g' % t for t in miss)], 'out/rows.log')
rows = sorted([json.loads(l) for l in open('rows_all.lines') if l.strip()], key=lambda r: r['t'])
# the row index k of a row must not change when rows are added later: profiles are stored by the row's t
tkey = lambda t: ('%.4f' % t).replace('.', 'p')
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
loss = float(os.environ.get('ROOM_LOSS', 1.5e-5)); both = os.environ.get('BOTH') == '1'; nokappa = os.environ.get('NOKAPPA') == '1'
info = dict(game=dict(e1=float(e1), eta=float(eta)), N=Npk, margin=TGT - Npk, t_peak=float(tp), rows={}, chi_grid='1,2,3,4,6,8,10,12,14,16,20,24,30,36,42')
if os.path.exists('band4.json'):                              # rows done in an earlier call are kept
    try:
        old_ = json.load(open('band4.json'))
        if old_.get('game') == info['game']: info['rows'] = old_.get('rows', {})
    except Exception: pass
print('game %s (lambda_1 %s, gamma %s): N %.7f margin %.3e (peak t %.4f)' % (name, e1, eta, Npk, TGT - Npk, tp), flush=True)
for t in tsel:
    k = [j for j, r in enumerate(rows, 1) if abs(r['t'] - t) < 1e-9][0]; r = rows[k - 1]; tk = tkey(t)
    act = [(float(a), float(b), float(max(a * a - 2 * ex[i_][0] * a + ex[i_][1], b * b - 2 * ex[i_][0] * b + ex[i_][1]))) for a, b, i_ in pieces if i_ == k - 1]
    if not act: print('  t=%.3f: the row is nowhere active on the envelope' % t, flush=True); continue
    a = min(x[0] for x in act); b = max(x[1] for x in act); m = max(x[2] for x in act)
    one = 'row_%s.lines' % tk; open(one, 'w').write(json.dumps({k_: r[k_] for k_ in ('t', 'l', 'beta', 'bA', 'bB', 'sig', 'nu5', 'branch', 'row', 'plain', 'driver')}) + '\n')
    pf = 'out/prof_t%s.npz' % tk
    if not os.path.exists(pf):
        # prof2.py reads line k of rows5.lines and writes out/prof_<k>.npz, out/mu_<k>.json; the result is filed under the row's t
        # (a copy), so that it stays valid when rows are added.  An exact table of the same row made earlier is reused.
        import shutil
        oldp = 'out/prof_%d.npz' % k; ok = False
        if os.path.exists(oldp) and os.path.exists('out/mu_%d.json' % k):
            d0 = np.load(oldp); ok = 'dGA' in d0.files and abs(json.loads(str(d0['rec']))['t'] - t) < 1e-9
        if not ok: run([PY, os.path.join(here, 'prof2.py'), str(k), '0,0', '0.4,0.3'], 'out/prof2_t%s.log' % tk)
        shutil.copy(oldp, pf); shutil.copy('out/mu_%d.json' % k, 'out/mu_t%s.json' % tk)
    mu = {(x['s'], x['t']): x for x in json.load(open('out/mu_t%s.json' % tk))['tilts']}
    x = dict(k=k, row=r['row'], l=r['l'], beta=r['beta'], bA=r['bA'], bB=r['bB'], nu5=r['nu5'], sig=r['sig'], active=[a, b], room_float=TGT - m, room_used=TGT - m - loss, tlo=a - 1e-4,
             mu_untilted=mu[(0.0, 0.0)]['mu'], mu_tilt=mu[(0.4, 0.3)]['mu'], mu_tilt_at=mu[(0.4, 0.3)]['at_q'])
    bandf = 'band4_t%s.json' % tk
    json.dump(dict(tilt=[0.4, 0.3], rows={'1': dict(t='%.3f' % t, mu=x['mu_tilt'], tlo=x['tlo'], room=x['room_used'], prof=pf)}), open(bandf, 'w'), indent=1)
    kaps = []
    if not nokappa:
        kf = 'kappa_t%s.json' % tk
        if not os.path.exists(kf): run([PY, os.path.join(gate, 'kappa_h.py'), one, '1', kf], 'out/kappa.log')
        kh = json.load(open(kf)); x.update(kappa_h=kh['kappa_h'], kappa_AB_exact=kh['kappa_AB'], kappa_own=round(1 - kh['kappa_h'] - 0.02, 4)); kaps.append(('own', x['kappa_own']))
    if both or nokappa: kaps.append(('082', 0.82))
    line = '  t=%.3f: piece [%.4f, %.4f] room %.3e | mu %.4f -> tilt %.4f (at |q| %.2f)' % (t, a, b, x['room_used'], x['mu_untilted'], x['mu_tilt'], x['mu_tilt_at'])
    for nm, kap in kaps:
        tag = '_t%s_%s' % (tk, nm)
        run([PY, os.path.join(here, 'r4_theta4.py'), '1', 'band', '-', tag], 'out/r4_theta4%s.log' % tag, dict(BAND_ROWS=bandf, KAPPA_AB=repr(kap)))
        d = json.load(open('out/r4_theta4_1%s.json' % tag)); bm = d['band_min']; x['ustar'] = d['ustar']; x['ucap_over_ustar'] = d['ucap'] / d['ustar']
        x['band_' + nm] = dict(kappa=kap, min=bm, pts=[dict(ufrac=p['ufrac'], theta_room=p['theta_room'], chi=p['chi_room'], npossible=len(p['possible'])) for p in d['pts']])
        at = lambda f: next((p for p in d['pts'] if abs(p['ufrac'] - f) < 0.006), None)
        line += ' | u* %.5f cap %.3f u*%s | kappa_AB %.3f: band minimum %s at %.3f u* (chi %s); at 0.85 / 0.90 / 1.0 u*: %s' % (
            d['ustar'], d['ucap'] / d['ustar'], (' | quintic share %.3f' % x['kappa_h']) if nm == 'own' else '', kap, ('%.3f' % bm['theta_room']) if bm else '-', bm['ufrac'] if bm else float('nan'),
            ('%g' % bm['chi_room']) if bm and bm['chi_room'] else '-',
            ' / '.join(('%.3f (chi %s)' % (at(f)['theta_room'], '%g' % at(f)['chi_room'] if at(f)['chi_room'] else '-')) if at(f) and at(f)['theta_room'] else '-' for f in (0.85, 0.90, 1.0)))
    print(line, flush=True); info['rows']['%.3f' % t] = x; info['secs'] = time.time() - T0; json.dump(info, open('band4.json', 'w'), indent=1)
print('game %s done in %.0f s' % (name, time.time() - T0), flush=True)
