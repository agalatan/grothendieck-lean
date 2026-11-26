#!/usr/bin/env python3
"""A piece [a, b] of t covered by the row tuned at another t' (a "shifted" row): its room there and its allowance (N).
claude-b9ee worker d5newcap, 16 Nov 2026.
The row tuned at t' (parameters p(t'), Gaussian-ideal value E(t')) is a valid row at every t: its line is
E(t') + 2 (t' - l)(t - t') + (t - t')^2.  Used on [a, b] it has the room 500/701 - max(line(a), line(b)) - ROOM_LOSS, its
possible responses satisfy the Rice family (R1) at t_lo = a - 1e-4 and the cap 4 e1^2 B (A - t_lo); profiles, margin mu,
benchmark u*(t') and V_sl are those of the row t'.  The allowance is r4_theta3.py on that configuration; energies are given
as fractions of the CAP of the piece (cX), the same absolute energies for every t'.
usage: shift3.py NAME E1 ETA a b t'-list energies [OWNKAPPA]     (after allow3.py; rows of the t' must be in rows_all.lines)
       -> games/NAME/out/shift_<a>_<b>.json, one line per t'"""
import sys, os, json, subprocess
here = os.path.dirname(os.path.abspath(__file__)); name, e1, eta = sys.argv[1:4]; a, b = float(sys.argv[4]), float(sys.argv[5])
tps = [float(x) for x in sys.argv[6].split(',')]; ulist = sys.argv[7]; kap = sys.argv[8] if len(sys.argv) > 8 else None
PY = os.environ.get('ALLOW_PY', sys.executable); pin = os.environ.get('ALLOW_TASKSET'); pre = (['taskset', '-c', pin] if pin else [])
os.chdir(os.path.join(here, 'games', name)); import numpy as np
env = dict(os.environ, D5_E1=e1, D5_ETA=eta, OMP_NUM_THREADS='1', OPENBLAS_NUM_THREADS='1', MKL_NUM_THREADS='1', VECLIB_MAXIMUM_THREADS='1', RAYON_NUM_THREADS='1')
rows = [json.loads(l) for l in open('rows5.lines') if l.strip()]; TGT = 500 / 701; loss = float(os.environ.get('ROOM_LOSS', 1.5e-5)); res = []
for tp in tps:
    k = [j for j, r in enumerate(rows, 1) if abs(r['t'] - tp) < 1e-9][0]; r = rows[k - 1]
    line = lambda x: r['row'] + 2 * (tp - r['l']) * (x - tp) + (x - tp) ** 2
    room = TGT - max(line(a), line(b)) - loss; tag = '_shift%g_%g' % (a, tp)
    rec = dict(tprime=tp, k=k, piece=[a, b], room=room, room_at_a=TGT - line(a), room_at_b=TGT - line(b))
    if room <= 0:
        print('piece [%.4f, %.4f] covered by the row of t\' = %.3f: NOT POSSIBLE, the row exceeds the target there (room %.2e)' % (a, b, tp, room), flush=True); res.append(rec); continue
    pf = 'out/prof_%d.npz' % k
    if os.path.exists(pf) and 'dGA' not in np.load(pf).files: os.replace(pf, 'out/prof_%d_spline.npz' % k)
    if not os.path.exists(pf):
        with open('out/prof2_%d.log' % k, 'a') as f: subprocess.run(pre + [PY, os.path.join(here, 'prof2.py'), str(k), '0,0', '0.4,0.3'], env=env, stdout=f, stderr=subprocess.STDOUT, check=True)
    mu = {(x['s'], x['t']): x for x in json.load(open('out/mu_%d.json' % k))['tilts']}[(0.4, 0.3)]['mu']
    json.dump(dict(tilt=[0.4, 0.3], rows={str(k): dict(t='%.3f' % tp, mu=mu, tlo=a - 1e-4, room=room)}), open('band%s.json' % tag, 'w'), indent=1)
    with open('out/r4_theta3_%d%s.log' % (k, tag), 'a') as f:
        subprocess.run(pre + [PY, os.path.join(here, 'r4_theta3.py'), str(k), ulist, '-', tag], env=dict(env, BAND_ROWS='band%s.json' % tag, **({'KAPPA_AB': kap} if kap else {})),
                       stdout=f, stderr=subprocess.STDOUT, check=True)
    d = json.load(open('out/r4_theta3_%d%s.json' % (k, tag))); rec.update(mu=mu, ustar=d['ustar'], ucap=d['ucap'], kappa=d['kappa'], pts=d['pts']); res.append(rec)
    ths = [p['theta_room'] for p in d['pts'] if p['theta_room']]
    print('piece [%.4f, %.4f] covered by the row of t\' = %.3f: room %.3e | mu %.4f | u*(t\') %.5f, cap %.3f u*(t\') | theta_room at u/cap: %s | smallest %s' % (
        a, b, tp, room, mu, d['ustar'], d['ucap'] / d['ustar'], ' '.join('%.2f: %s (chi %s)' % (p['ucapfrac'], ('%.3f' % p['theta_room']) if p['theta_room'] else '-',
        ('%g' % p['chi_room']) if p['chi_room'] else '-') for p in d['pts']), ('%.3f' % min(ths)) if ths else '-'), flush=True)
json.dump(res, open('out/shift_%g_%g.json' % (a, b), 'w'), indent=1)
