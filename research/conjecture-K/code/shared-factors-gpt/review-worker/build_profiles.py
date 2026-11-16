#!/usr/bin/env python3
# Reviewer (N): Gamma, Gamma', Gamma'', Gamma''' of the two tilted profiles of the six band rows on a grid of radii,
# from the definitions (prof_jets.py), plus the Taylor coefficients at 0 to order 7.  Output: one npz per row.
#   argv: <scripts dir> <profiles dir> <out dir>
import sys, json, time
import numpy as np
sys.path.insert(0, sys.argv[1])
import prof_jets as PJ
R = np.concatenate([np.arange(0.03, 0.6, 0.005), np.arange(0.6, 1.5, 0.01), np.arange(1.5, 3.6001, 0.02)])
for t in ('0.80', '0.82', '0.84', '0.845', '0.85', '0.855'):
    t0 = time.time()
    tab = json.load(open('%s/band_row_%s.json' % (sys.argv[2], t))); rp = PJ.RowProfiles(tab['row'], tab['tilt']['s'], tab['tilt']['t'])
    J = np.array([rp.jets(r, 3) for r in R])                 # (nr, 3 profiles, 4)
    J0 = rp.jets(0.0, 7, npan=40, nth=512)                   # (3, 8)
    # table comparison on the whole table range covered
    S = np.array(tab['S']); sel = np.where((S >= 0.03) & (S <= 3.6))[0][::7]
    own = np.array([rp.plain(S[i]) for i in sel])
    dev = max(np.abs(own[:, 0] - np.array(tab['GA'])[sel]).max(), np.abs(own[:, 1] - np.array(tab['GB'])[sel]).max(), np.abs(own[:, 2] - np.array(tab['G0'])[sel]).max())
    np.savez('%s/prof_jets_%s.npz' % (sys.argv[3], t), R=R, J=J, J0=J0, ustar=tab['ustar'], theta=tab['theta_needed'], row=json.dumps(tab['row']))
    print('row %s: %d radii, %.0f s; largest difference from the table on %d of its radii in [0.03, 3.6]: %.1e; odd Taylor coefficients at 0: A %s | B %s; even ones below %.0e' % (
        t, len(R), time.time() - t0, len(sel), dev, ' '.join('%+.5f' % x for x in J0[0, 1::2]), ' '.join('%+.5f' % x for x in J0[1, 1::2]), np.abs(J0[:, 0::2]).max()), flush=True)
