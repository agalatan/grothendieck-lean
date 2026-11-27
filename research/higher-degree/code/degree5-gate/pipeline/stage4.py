#!/usr/bin/env python3
"""Funded per-cell allowances of a game on its own tuned rows, at the working tilt (2/5, 3/20) (N): the job generator.
For each selected row t of thresholds/games/G/band5.json (its active piece [a, b] on the float envelope of the Gaussian rows):
  room(T)  = T - (max of the row on its piece) - ROOM_LOSS            (ROOM_LOSS = 1.5e-5, the convention of band5.py)
  the zero-content pairs of ledger 4.44 at the upper end b:  nu' = eta b gamma, gamma = sqrt(3)/8, mu = sqrt(pi)/2,
     F(v) = 2 mu (l - beta/2 + gamma v) - v^2/eta,  gain = F(nu') - F(nu5),  cap = S5 - F(nu5)  (S5 = the Gaussian supremum of the row),
     kappa_h = 1 - kappa_AB - 1/50 (the row's own split, band5.py);  need = gain - kappa_h cap;
  eta_h = gain if need > 0 else 0   (the rule of the funded allocation of ledger 4.44: the whole gain where the pairs refute eta_h = 0)
  room left = room(T) - eta_h; a band file with the tilt (0.4, 0.15), the constant secant margin mu_glob of margins/G_t<t>.json,
  and the command line of design/r4_theta6.py (PERCHI, own constant split, five energies).
usage: stage4.py G E1 ETA "tag:target,tag:target" [MU "t:mu,..."]   -> thresholds/games/G/bandF_*.json, appends to s4.txt, writes s4_G.json"""
import sys, os, json, math
from fractions import Fraction as F
here = os.path.dirname(os.path.abspath(__file__)); PY = os.path.expanduser('~/claude-b9ee-gate/venv/bin/python')
g, e1, eta = sys.argv[1], float(sys.argv[2]), float(sys.argv[3]); targets = [(x.split(':')[0], float(F(x.split(':')[1]))) for x in sys.argv[4].split(',')]
mus = {round(float(x.split(':')[0]), 4): float(x.split(':')[1]) for x in sys.argv[5].split(',')} if len(sys.argv) > 5 else {}
gd = os.path.join(here, 'thresholds', 'games', g); b5 = json.load(open(os.path.join(gd, 'band5.json'))); T5 = float(F(os.environ.get('BAND5_TARGET', '500/701')))
MU, GAM, LOSS = math.sqrt(math.pi) / 2, math.sqrt(3) / 8, 1.5e-5; out = []; cmds = []
for tk, r in sorted(b5['rows'].items()):
    t = float(tk); a, b = r['active']; l, beta, nu5 = r['l'], r['beta'], r['nu5']
    Fv = lambda v: 2 * MU * (l - beta / 2 + GAM * v) - v * v / eta
    S5 = r['row'] - (t * t - 2 * l * t + 2 * beta * beta / e1); nup = eta * min(b, 0.886) * GAM
    gain = Fv(nup) - Fv(nu5); cap = S5 - Fv(nu5); kh = 1 - r['kappa_own'] - 0.02; need = gain - kh * cap; eta_h = gain if need > 0 else 0.0
    mf = os.path.join(here, 'margins', '%s_t%g.json' % (g, t)); mu = mus.get(round(t, 4)) or (json.load(open(mf))['mu_glob'] if os.path.exists(mf) else None)
    rec = dict(t=t, piece=[a, b], nu5=nu5, nu_pair=nup, gain=gain, cap=cap, share_needed=gain / cap, kappa_h=kh, kappa_AB=r['kappa_own'], need=need, eta_h=eta_h, mu_glob=mu, mu_tilt_030=r.get('mu_tilt'), rooms={})
    for tag, T in targets:
        room = r['room_float'] + (T - T5) - LOSS; left = room - eta_h; rec['rooms'][tag] = dict(room=room, left=left)
        if left <= 0 or mu is None: continue
        tkey = ('%.4f' % t).replace('.', 'p'); bf = 'bandF_%s_t%s.json' % (tag, tkey)
        json.dump(dict(tilt=[0.4, 0.15], rows={'1': dict(t='%.3f' % t, mu=mu, tlo=r['tlo'], room=left, prof='out/prof_t%s.npz' % tkey)}), open(os.path.join(gd, bf), 'w'), indent=1)
        cmds.append('cd thresholds/games/%s && PERCHI=1 D5_E1=%r D5_ETA=%r OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 THRESH_DIR=../.. BAND_ROWS=%s KAPPA_AB=%.4f MARGIN_MODEL=const:%.6f %s ../../../design/r4_theta6.py 1 c0.60,c0.70,c0.78,c0.85,c0.92 - _F%s_t%s > out/r4_theta6_F%s_t%s.log 2>&1' % (
            g, e1, eta, bf, r['kappa_own'], mu, PY, tag, tkey, tag, tkey))
    out.append(rec)
    print('%s t=%.3f piece [%.4f, %.4f] nu5 %.4f nu\' %.4f gain %.3e cap %.3e share needed %.3f kappa_h %.3f -> eta_h %.3e | mu %s | ' % (g, t, a, b, nu5, nup, gain, cap, gain / cap, kh, eta_h, mu) + ' '.join('%s: room %.3e left %.3e' % (k, v['room'], v['left']) for k, v in rec['rooms'].items()))
json.dump(out, open(os.path.join(here, 's4_%s.json' % g), 'w'), indent=1); open(os.path.join(here, 's4.txt'), 'a').write('\n'.join(cmds) + ('\n' if cmds else ''))
