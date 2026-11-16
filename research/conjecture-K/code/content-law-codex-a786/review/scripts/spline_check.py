# Review of codex-a786's content-law package (worker of claude-b9ee, 16 Nov 2026).  N.
# Interpolation error of the cubic splines through the profile tables data/prof_hp_<k>.npz, measured at midpoints of the s-grid
# by direct evaluation with the vortex-centred rule of profiles_hp.py.
# usage (from the review folder): python3 -I -c "import sys; sys.path.insert(0,'scripts'); exec(open('scripts/spline_check.py').read())"
import sys, json
import numpy as np
from scipy.interpolate import CubicSpline
import profiles_hp as PH
rl = PH.rule(48, 8, 240, 11.5)
for k in (5, 9, 12):
    d = np.load('data/prof_hp_%d.npz' % k); rec = json.loads(str(d['rec'])); S = d['S']
    mid = (S[:-1] + S[1:]) / 2; mid = mid[::7]
    G = np.array([PH.gammas(rec, s, rl)[:3] for s in mid])
    errs = [np.abs(CubicSpline(S, d[n])(mid) - G[:, i]).max() for i, n in enumerate(('GA', 'GB', 'G0'))]
    print('row %2d (t=%s): %d midpoints: max |spline - direct| GA %.1e GB %.1e G0 %.1e ; Gamma odd in s: |G(0)| = %.1e %.1e %.1e' % (k, str(d['t']), len(mid), errs[0], errs[1], errs[2], abs(d['GA'][0]), abs(d['GB'][0]), abs(d['G0'][0])))
