#!/usr/bin/env python3
"""A piece [a, b] of t covered by the row tuned at another t' (a "shifted" row): room there, and the minimum over the energy
band of theta_room with its energy and binding chi (N).   claude-b9ee worker d5newcap, 16 Nov 2026.
The row tuned at t' (parameters p(t'), Gaussian-ideal value E(t')) is valid at every t; its line is
E(t') + 2 (t' - l)(t - t') + (t - t')^2.  Used on [a, b]: room = 500/701 - max(line(a), line(b)) - 1.5e-5; its possible
responses satisfy (R1) at t_lo = a - 1e-4 and the cap 4 e1^2 B (A - t_lo), so its energy band reaches cap(a), far above u*(t')
when a is well below t'.  Profiles, mu, u*(t'), V_sl and the quintic share (own kappa_AB) are those of the row t'.
usage: shift4.py NAME E1 ETA a b t'-list [kappa: own | 0.82 | number]      (after band4.py: needs rows5.lines)
       -> games/NAME/out/shift4_<a>_<b>.json; one line per t'"""
import sys, os, json, subprocess, shutil
here = os.path.dirname(os.path.abspath(__file__)); gate = os.path.join(here, '..', 'gate'); name, e1, eta = sys.argv[1:4]; a, b = float(sys.argv[4]), float(sys.argv[5])
tps = [float(x) for x in sys.argv[6].split(',')]; kmode = sys.argv[7] if len(sys.argv) > 7 else 'own'
PY = os.environ.get('ALLOW_PY', sys.executable); pin = os.environ.get('ALLOW_TASKSET'); pre = (['taskset', '-c', pin] if pin else [])
os.chdir(os.path.join(here, 'games', name)); import numpy as np
env = dict(os.environ, D5_E1=e1, D5_ETA=eta, OMP_NUM_THREADS='1', OPENBLAS_NUM_THREADS='1', MKL_NUM_THREADS='1', VECLIB_MAXIMUM_THREADS='1', RAYON_NUM_THREADS='1')
def run(cmd, log, extra=None):
    with open(log, 'a') as f: subprocess.run(pre + cmd, env=dict(env, **(extra or {})), stdout=f, stderr=subprocess.STDOUT, check=True)
rows = [json.loads(l) for l in open('rows5.lines') if l.strip()]; TGT = 500 / 701; loss = float(os.environ.get('ROOM_LOSS', 1.5e-5)); res = []
tkey = lambda t: ('%.4f' % t).replace('.', 'p')
for tp in tps:
    k = [j for j, r in enumerate(rows, 1) if abs(r['t'] - tp) < 1e-9][0]; r = rows[k - 1]; tk = tkey(tp)
    line = lambda x: r['row'] + 2 * (tp - r['l']) * (x - tp) + (x - tp) ** 2
    room = TGT - max(line(a), line(b)) - loss; rec = dict(tprime=tp, piece=[a, b], room=room, room_at_a=TGT - line(a), room_at_b=TGT - line(b))
    if room <= 0:
        print('piece [%.4f, %.4f] by the row tuned at %.3f: NOT POSSIBLE, the row exceeds the target there (room %.2e)' % (a, b, tp, room), flush=True); res.append(rec); continue
    one = 'row_%s.lines' % tk; open(one, 'w').write(json.dumps({k_: r[k_] for k_ in ('t', 'l', 'beta', 'bA', 'bB', 'sig', 'nu5', 'branch', 'row', 'plain', 'driver')}) + '\n')
    pf = 'out/prof_t%s.npz' % tk
    if not os.path.exists(pf):
        oldp = 'out/prof_%d.npz' % k; ok = False
        if os.path.exists(oldp) and os.path.exists('out/mu_%d.json' % k):
            d0 = np.load(oldp); ok = 'dGA' in d0.files and abs(json.loads(str(d0['rec']))['t'] - tp) < 1e-9
        if not ok: run([PY, os.path.join(here, 'prof2.py'), str(k), '0,0', '0.4,0.3'], 'out/prof2_t%s.log' % tk)
        shutil.copy(oldp, pf); shutil.copy('out/mu_%d.json' % k, 'out/mu_t%s.json' % tk)
    mu = {(x['s'], x['t']): x for x in json.load(open('out/mu_t%s.json' % tk))['tilts']}[(0.4, 0.3)]['mu']
    if kmode == 'own':
        kf = 'kappa_t%s.json' % tk
        if not os.path.exists(kf): run([PY, os.path.join(gate, 'kappa_h.py'), one, '1', kf], 'out/kappa.log')
        kap = round(1 - json.load(open(kf))['kappa_h'] - 0.02, 4)
    else: kap = float(kmode)
    tag = '_shift_%g_%g_t%s' % (a, b, tk); bandf = 'band4%s.json' % tag
    json.dump(dict(tilt=[0.4, 0.3], rows={'1': dict(t='%.3f' % tp, mu=mu, tlo=a - 1e-4, room=room, prof=pf)}), open(bandf, 'w'), indent=1)
    run([PY, os.path.join(here, 'r4_theta4.py'), '1', 'band', '-', tag], 'out/r4_theta4%s.log' % tag, dict(BAND_ROWS=bandf, KAPPA_AB=repr(kap), BAND_FMIN=os.environ.get('BAND_FMIN', '0.90')))
    d = json.load(open('out/r4_theta4_1%s.json' % tag)); bm = d['band_min']
    rec.update(mu=mu, kappa=kap, ustar=d['ustar'], ucap=d['ucap'], band_min=bm, pts=[dict(u=p['u'], ufrac=p['ufrac'], ucapfrac=p['ucapfrac'], theta_room=p['theta_room'], chi=p['chi_room'], npossible=len(p['possible'])) for p in d['pts']]); res.append(rec)
    print('piece [%.4f, %.4f] by the row tuned at %.3f: room %.3e | mu %.4f | kappa_AB %.3f | u*(t\') %.5f, cap of the piece %.5f = %.3f u*(t\') | band minimum theta_room %s at u = %.5f (%.3f u*(t\'), %.3f cap), binding chi %s | theta_room at u/cap: %s' % (
        a, b, tp, room, mu, kap, d['ustar'], d['ucap'], d['ucap'] / d['ustar'], ('%.3f' % bm['theta_room']) if bm else '-', bm['u'] if bm else float('nan'), bm['ufrac'] if bm else float('nan'),
        bm['ucapfrac'] if bm else float('nan'), ('%g' % bm['chi_room']) if bm and bm['chi_room'] else '-',
        ' '.join('%.2f: %s' % (p['ucapfrac'], ('%.3f' % p['theta_room']) if p['theta_room'] else '-') for p in d['pts'])), flush=True)
    json.dump(res, open('out/shift4_%g_%g.json' % (a, b), 'w'), indent=1)
