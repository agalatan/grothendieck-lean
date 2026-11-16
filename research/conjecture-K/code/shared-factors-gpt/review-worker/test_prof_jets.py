#!/usr/bin/env python3
# Reviewer (N): validation of prof_jets.py.  (a) values against the band-row tables; (b) convergence of the quadrature;
# (c) the Taylor-mode derivatives against central differences of the reviewer's own accurate values; (d) oddness at 0.
#   argv: <scripts dir> <profiles dir>
import sys, json, math, time
import numpy as np
sys.path.insert(0, sys.argv[1])
import prof_jets as PJ
t0 = time.time()
for t in ('0.80', '0.84', '0.855'):
    tab = json.load(open('%s/band_row_%s.json' % (sys.argv[2], t))); rp = PJ.RowProfiles(tab['row'])
    S = np.array(tab['S']); worst = 0; rows = []
    for s in (0.0005, 0.005, 0.02, 0.05, 0.1, 0.3, 0.6, 1.0, 2.0, 3.0, 5.0):
        i = int(np.argmin(np.abs(S - s))); own = rp.plain(S[i])
        diff = max(abs(own[0] - tab['GA'][i]), abs(own[1] - tab['GB'][i]), abs(own[2] - tab['G0'][i])); worst = max(worst, diff)
        rows.append('%g: %.1e' % (S[i], diff))
    print('row %s (a) own values against the table (largest of the three profiles): %s | worst %.1e' % (t, '  '.join(rows), worst))
    for r in (0.01, 0.2, 1.0, 2.5):
        a = rp.jets(r, 3); b = rp.jets(r, 3, npan=56, nq=8, nth=768, tail=8.0)
        e = 1e-3
        fp, fm = rp.jets(r + e, 0)[:, 0], rp.jets(r - e, 0)[:, 0]; f0 = a[:, 0]
        fp2, fm2 = rp.jets(r + 2 * e, 0)[:, 0], rp.jets(r - 2 * e, 0)[:, 0]
        d1 = (fp - fm) / (2 * e); d2 = (fp - 2 * f0 + fm) / e ** 2; d3 = (fp2 - 2 * fp + 2 * fm - fm2) / (2 * e ** 3)
        print('   r = %-5g (b) coarse vs fine rule, orders 0..3: %s  (c) Taylor-mode vs differences: G\' %.1e  G\'\' %.1e  G\'\'\' %.1e   [G\'\'\' = %+.5f, %+.5f, %+.5f]' % (
            r, ' '.join('%.0e' % np.abs(a[:, k] - b[:, k]).max() for k in range(4)),
            np.abs(a[:, 1] - d1).max(), np.abs(2 * a[:, 2] - d2).max(), np.abs(6 * a[:, 3] - d3).max(), *(6 * a[:, 3])))
    j0 = rp.jets(0.0, 7, npan=40, nth=512)
    print('   (d) Taylor coefficients at 0 (tilted A, tilted B): odd  %s | even (should vanish) %s' % (
        ' '.join('%+.6f' % x for x in j0[:2, 1::2].ravel()), ' '.join('%.0e' % abs(x) for x in j0[:2, 0::2].ravel())))
print('%.0f s' % (time.time() - t0))
