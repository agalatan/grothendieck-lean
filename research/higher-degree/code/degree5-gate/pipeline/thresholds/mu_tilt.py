"""Pointwise A/B margin of a row at a tilt (N): mu = min over |q| <= 3 of lambda_min(C_{s,t} - M(q)), as CONTENT_LEMMA_D5.md
section 4.1 (tilt.tilt_profiles).  claude-b9ee worker d5newcap, 16 Nov 2026.
usage: D5_E1=.. D5_ETA=.. mu_tilt.py k [s,t s,t ...]   (k = line of rows5.lines; default tilts (0,0) and (0.4,0.3))"""
import sys, json, os
import numpy as np, prof as PF, tilt as TL
k = int(sys.argv[1]); rec = json.loads(open('rows5.lines').read().splitlines()[k - 1])
tilts = [tuple(float(x) for x in a.split(',')) for a in sys.argv[2:]] or [(0.0, 0.0), (0.4, 0.3)]
S = np.concatenate([np.linspace(0, 0.2, 9), np.linspace(0.2, 3.0, 57)[1:]])
out = dict(t=rec['t'], k=k, tilts=[])
# a fine z-grid: with (48, 384) the 1/|A| singularity at the zero of A+- (|z| about |q|/l) gave errors of up to 5 % in mu
# at |q| = 0.02-0.07 and near |q| = 1 (checked against (96, 768) and (160, 1024))
grid = PF.zgrid(npan=int(os.environ.get('MU_NPAN', 128)), nq=8, nth=int(os.environ.get('MU_NTH', 768)))
for sa, tb in tilts:
    G0, rhos = TL.tilt_profiles(rec, S, svals=(sa,), tvals=(tb,), grid=grid)
    arr = np.array(rhos[(sa, tb)]); i = int(np.argmin(arr[:, 1]))
    out['tilts'].append(dict(s=sa, t=tb, mu=float(arr[i, 1]), at_q=float(S[i]), mu_at_0=float(arr[0, 1]), ratio_max=float(arr[:, 0].max())))
    print('t=%.3f tilt (%.2f, %.2f): mu = %.4f at |q| = %.2f (mu at 0: %.4f; worst curvature/cost %.4f)' % (rec['t'], sa, tb, arr[i, 1], S[i], arr[0, 1], arr[:, 0].max()), flush=True)
json.dump(out, open('out/mu_%d.json' % k, 'w'), indent=1)
