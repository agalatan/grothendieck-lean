#!/usr/bin/env python3
"""Per game: the quintic shells' share kappa_h of the deficit in the exact coupled one-spike model (gate/kappa_h.py), and the
allowances with the game's own kappa_AB = 1 - kappa_h - 0.02 next to the study's 0.82.  (N)   claude-b9ee worker d5newcap, 16 Nov 2026.
The content study used kappa_AB = 0.82 because in the old game the quintic shells take at most 0.16 (exact model) to 0.18
(decoupled chain) of D + V_sl.  The share depends on the game (it grows with eta), so each game gets its own.
usage: game_extra.py NAME E1 ETA [rows "0.80,0.82"] [energies "0.85,0.925,1.0"]     (after allow_game.py; cwd anywhere)"""
import sys, os, json, subprocess
here = os.path.dirname(os.path.abspath(__file__)); gate = os.path.join(here, '..', 'gate')
name, e1, eta = sys.argv[1:4]
tsel = [float(x) for x in (sys.argv[4] if len(sys.argv) > 4 else '0.80,0.82').split(',')]
ulist = sys.argv[5] if len(sys.argv) > 5 else '0.85,0.925,1.0'
PY = os.environ.get('ALLOW_PY', sys.executable); pin = os.environ.get('ALLOW_TASKSET'); pre = (['taskset', '-c', pin] if pin else [])
os.chdir(os.path.join(here, 'games', name))
env = dict(os.environ, D5_E1=e1, D5_ETA=eta, R4_ZERO='0', OMP_NUM_THREADS='1', OPENBLAS_NUM_THREADS='1', MKL_NUM_THREADS='1', VECLIB_MAXIMUM_THREADS='1', RAYON_NUM_THREADS='1')
rows = [json.loads(l) for l in open('rows5.lines') if l.strip()]; info = json.load(open('allow.json'))
for t in tsel:
    k = [j for j, r in enumerate(rows, 1) if abs(r['t'] - t) < 1e-9][0]; kf = 'kappa_%d.json' % k
    if not os.path.exists(kf):
        with open('out/kappa.log', 'a') as f: subprocess.run(pre + [PY, os.path.join(gate, 'kappa_h.py'), 'rows5.lines', str(k), kf], env=env, stdout=f, stderr=subprocess.STDOUT, check=True)
    kh = json.load(open(kf)); kap = round(1 - kh['kappa_h'] - 0.02, 4)
    with open('out/r4_theta_%d_own.log' % k, 'a') as f:
        subprocess.run(pre + [PY, os.path.join(here, 'r4_theta2.py'), str(k), ulist, '2,8,16,30,42', '_own'], env=dict(env, KAPPA_AB=repr(kap)), stdout=f, stderr=subprocess.STDOUT, check=True)
    d = json.load(open('out/r4_theta_%d_own.json' % k)); x = info['rows']['%.2f' % t]
    x.update(kappa_h=kh['kappa_h'], kappa_AB_exact=kh['kappa_AB'], kappa_all=kh['kappa_all'], kappa_own=kap,
             theta_room_own={('%.3f' % p['ufrac']): (p.get('theta_room_ref') if p.get('theta_room_ref') is not None else p['theta_room']) for p in d['pts']})
    print('game %s t=%.2f: kappa_h %.3f (A/B exact %.3f, all %.3f) -> kappa_AB %.3f | theta_room with it: %s | with 0.82: %s' % (
        name, t, kh['kappa_h'], kh['kappa_AB'], kh['kappa_all'], kap, ' '.join('%s: %.3f' % (a, b) for a, b in x['theta_room_own'].items() if b is not None),
        ' '.join('%s: %.3f' % (a, b) for a, b in (x.get('theta_room_ref') or x['theta_room']).items() if b is not None)), flush=True)
json.dump(info, open('allow.json', 'w'), indent=1)
