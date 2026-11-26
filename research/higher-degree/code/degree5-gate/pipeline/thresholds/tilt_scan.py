#!/usr/bin/env python3
"""The allowance of a row as a function of the tilt (s, t) of the retained functional (N).  claude-b9ee worker d5newcap, 16 Nov 2026.
The tilt is a free choice in the proof (CONTENT_LEMMA_D5 3.1): it changes the margin mu_{s,t} and the tilted profiles
G_A + s G_0, G_B + t G_0, hence both sides of the content inequality (the measured ratio must then be taken for the same tilt).
For each tilt: mu from the accurate quadrature of prof2.py (every second radius of the table up to 3), then theta_room(u) by
r4_theta3.py (15 chi) with the same room, t_lo and kappa_AB as the row has in band3.json.
usage: tilt_scan.py NAME E1 ETA t "s,t s,t ..." energies       (after allow3.py; works in thresholds/games/NAME)"""
import sys, os, json, subprocess, time
here = os.path.dirname(os.path.abspath(__file__)); name, e1, eta = sys.argv[1:4]; t = float(sys.argv[4])
tilts = [tuple(float(x) for x in a.split(',')) for a in sys.argv[5].replace('|', ' ').split()]      # tilts separated by blanks or by |; ulist = sys.argv[6]
os.environ.update(D5_E1=e1, D5_ETA=eta, OMP_NUM_THREADS='1', OPENBLAS_NUM_THREADS='1', MKL_NUM_THREADS='1', VECLIB_MAXIMUM_THREADS='1', RAYON_NUM_THREADS='1')
sys.path.insert(0, here); os.chdir(os.path.join(here, 'games', name))
import numpy as np, prof2 as P2
rows = [json.loads(l) for l in open('rows5.lines') if l.strip()]; k = [j for j, r in enumerate(rows, 1) if abs(r['t'] - t) < 1e-9][0]; rec = rows[k - 1]
rw = json.load(open('band3.json'))['rows'][str(k)]
S = P2.SGRID[P2.SGRID <= 3.0][::2]; Q = P2.Quad(); mu = {tl: [] for tl in tilts}
for s_ in S:
    o = P2.eval_s(rec, float(s_), Q, tilts)
    for tl in tilts: mu[tl].append(o['tilt'][tl][1])
out = []
for tl in tilts:
    arr = np.array(mu[tl]); i = int(np.argmin(arr)); m = float(arr[i]); tag = '_tilt%g_%g' % tl
    json.dump(dict(tilt=list(tl), rows={str(k): dict(rw, mu=m)}), open('band%s.json' % tag, 'w'), indent=1)
    subprocess.run([sys.executable, os.path.join(here, 'r4_theta3.py'), str(k), ulist, '-', tag], env=dict(os.environ, BAND_ROWS='band%s.json' % tag),
                   stdout=open('out/r4_theta3_%d%s.log' % (k, tag), 'w'), stderr=subprocess.STDOUT, check=True)
    d = json.load(open('out/r4_theta3_%d%s.json' % (k, tag)))
    out.append(dict(tilt=list(tl), mu=m, mu_at=float(S[i]), mu0=float(arr[0]), pts=d['pts']))
    print('game %s t=%s tilt (%.2f, %.2f): mu %.4f at |q| = %.2f (at 0: %.4f) | theta_room %s' % (name, rec['t'], tl[0], tl[1], m, S[i], arr[0],
          ' '.join('%.2f: %s (chi %s)' % (p['ufrac'], ('%.3f' % p['theta_room']) if p['theta_room'] else '-', ('%g' % p['chi_room']) if p['chi_room'] else '-') for p in d['pts'])), flush=True)
json.dump(out, open('out/tilt_scan_%d.json' % k, 'w'), indent=1)
