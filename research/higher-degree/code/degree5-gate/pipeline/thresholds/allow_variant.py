#!/usr/bin/env python3
"""Allowance theta_room(u) of ONE row with given (not necessarily optimal) parameters (N).  claude-b9ee worker d5newcap, 16 Nov 2026.
Any (l, beta, bA, bB) gives a valid row V <= t'^2 - 2 l t' + 2 beta^2/e1 + G+ (the multipliers are dual variables); the
optimal one minimises the Gaussian-ideal value at t' = t.  On the low band rows the room is two to three times the peak room,
so a row may give up some of it; this script measures what a detuned row does to the A/B margin mu and to the allowance.
  value = Gaussian-ideal row value at t (d5eng2, fine grid); the row is used on the piece [t - h, t + h] (PIECE_H, default
  0.005: rows 0.01 apart), where its line is value + 2 (t - l)(t' - t) + (t' - t)^2;
  room = 500/701 - (largest value of the line on the piece) - ROOM_LOSS (default 1.5e-5);  t_lo = t - h - 1e-4.
  For an optimal row this is the room that allow_game.py takes from the envelope (checked on g081, t = 0.80: 1.390e-3).
usage: allow_variant.py NAME E1 ETA t l,beta,bA,bB [energies] [chis]     -> thresholds/variants/NAME/allow.json"""
import sys, os, json, subprocess, time
here = os.path.dirname(os.path.abspath(__file__)); rowsdir = os.path.join(here, '..', 'rows')
name, e1, eta, t = sys.argv[1], sys.argv[2], sys.argv[3], float(sys.argv[4]); p = [float(x) for x in sys.argv[5].split(',')]
ulist = sys.argv[6] if len(sys.argv) > 6 else '0.7,0.85,0.925,1.0'; chis = sys.argv[7] if len(sys.argv) > 7 else '2,8,16,30,42'
PY = os.environ.get('ALLOW_PY', sys.executable); pin = os.environ.get('ALLOW_TASKSET'); pre = (['taskset', '-c', pin] if pin else [])
gd = os.path.join(here, 'variants', name); os.makedirs(os.path.join(gd, 'out'), exist_ok=True); os.chdir(gd)
os.environ.update(D5_E1=e1, D5_ETA=eta, OMP_NUM_THREADS='1', OPENBLAS_NUM_THREADS='1', MKL_NUM_THREADS='1', VECLIB_MAXIMUM_THREADS='1', RAYON_NUM_THREADS='1')
env = dict(os.environ)
def run(cmd, log):
    with open(log, 'a') as f: subprocess.run(pre + cmd, env=env, stdout=f, stderr=subprocess.STDOUT, check=True)
T0 = time.time()
sys.path.insert(0, rowsdir)
import d5eng2 as D
val, sig, nu, inn = D.row_value(t, p, grid=D.zgrid(half=True), ret=True)
(vp, _, nup), (vd, sd, nud) = inn.branches(lo=0.05); c = inn.row.const()
rec = dict(t=t, l=p[0], beta=p[1], bA=p[2], bB=p[3], sig=sig, nu5=nu, branch=('plain' if vp >= vd else 'driver'), row=val, plain=vp + c, driver=vd + c)
open('rows5.lines', 'w').write(json.dumps(rec) + '\n')
TGT = 500 / 701; hh = float(os.environ.get('PIECE_H', 0.005)); loss = float(os.environ.get('ROOM_LOSS', 1.5e-5))
line_max = max(val + 2 * (t - p[0]) * d_ + d_ * d_ for d_ in (-hh, hh))
run([PY, os.path.join(here, 'prof2.py'), '1', '0,0', '0.4,0.3'], 'out/prof2_1.log')      # profiles with exact derivatives, margins
mu = {(x['s'], x['t']): x for x in json.load(open('out/mu_1.json'))['tilts']}
room = TGT - line_max - loss
json.dump(dict(tilt=[0.4, 0.3], rows={'1': dict(t='%.2f' % t, mu=mu[(0.4, 0.3)]['mu'], tlo=t - hh - 1e-4, room=room)}), open('band_rows.json', 'w'), indent=1)
info = dict(name=name, game=dict(e1=float(e1), eta=float(eta)), t=t, p=p, row=val, line_max=line_max, piece_h=hh, room_used=room, sig=sig, nu5=nu, rho_AB=mu[(0.0, 0.0)]['ratio_max'],
            mu_untilted=mu[(0.0, 0.0)]['mu'], mu_tilt=mu[(0.4, 0.3)]['mu'], mu_tilt_at=mu[(0.4, 0.3)]['at_q'])
if room > 0:
    run([PY, os.path.join(here, 'r4_theta2.py'), '1', ulist, chis], 'out/r4_theta_1.log')
    d = json.load(open('out/r4_theta_1.json'))
    pick = lambda q, key: q.get(key + '_ref') if q.get(key + '_ref') is not None else q[key]
    key = (lambda q: 'c%.3f' % q['ucapfrac']) if ulist.startswith('c') else (lambda q: '%.3f' % q['ufrac'])
    info.update(ustar=d['ustar'], ucap_over_ustar=d['ucap'] / d['ustar'], theta_room={key(q): pick(q, 'theta_room') for q in d['pts']},
                theta_zero={key(q): pick(q, 'theta_zero') for q in d['pts']})
info['secs'] = time.time() - T0
json.dump(info, open('allow.json', 'w'), indent=1)
print('%s (e1 %s eta %s) t=%.2f p=%s: row %.7f room %.3e | rho_AB %.4f mu %.4f tilt mu %.4f (|q| %.2f) | theta_room %s | theta_0 %s' % (
    name, e1, eta, t, ['%.5f' % x for x in p], val, room, info['rho_AB'], info['mu_untilted'], info['mu_tilt'], info['mu_tilt_at'],
    ' '.join('%s: %s' % (a, ('%.3f' % b) if b is not None else '-') for a, b in info.get('theta_room', {}).items()),
    ' '.join('%s: %s' % (a, ('%.3f' % b) if b is not None else '-') for a, b in info.get('theta_zero', {}).items())), flush=True)
