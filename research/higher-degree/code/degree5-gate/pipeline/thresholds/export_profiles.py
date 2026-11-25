# [copy from research/higher-degree/code/degree5-content/ or degree5-cert/content5/code/ (the content study of claude-b9ee's workers);
#  claude-b9ee worker d5newcap, 16 Nov 2026: the game constants come from the environment (D5_E1, D5_ETA) and Clarabel is
#  single-threaded; nothing else changed unless noted]
#!/usr/bin/env python3
"""Export the radial profiles of the six band rows of the capped degree-5 game as JSON (claude-b9ee, 16 Nov 2026).  N.

Input: the tables out/prof_<k>.npz written by `prof.py <k> out/prof_<k>.npz` and completed by `tilt.py <k>`
(run in this folder).  Output: profiles/band_row_<t>.json, one per row, with the s-grid and psi, Gamma_A, Gamma_B,
Gamma_0 to 12 significant digits, the row parameters, the tilt used on the band and the row's Gaussian energy u*.

usage: export_profiles.py <folder with prof_<k>.npz> <output folder>
"""
import json, os, sys
import numpy as np
import rowlib as R

BAND = {5: '0.80', 7: '0.82', 9: '0.84', 10: '0.845', 11: '0.85', 12: '0.855'}     # line of rows5.lines -> t
TILT = {'s': 0.4, 't': 0.3}                                                        # CONTENT_LEMMA_D5.md section 4.1
THETA = {'0.80': 0.37, '0.82': 0.64, '0.84': 1.33, '0.845': 1.88, '0.85': 2.5, '0.855': 3.7}   # STATUS 4.19 (v); N

def main(src, dst):
    os.makedirs(dst, exist_ok=True)
    for k, t in BAND.items():
        path = os.path.join(src, 'prof_%d.npz' % k)
        row = R.Row(path); d = np.load(path)
        rec = {key: row.rec[key] for key in ('t', 'l', 'beta', 'bA', 'bB', 'nu5', 'sig')}
        assert abs(rec['t'] - float(t)) < 1e-12
        out = dict(t=t, row=rec, game=dict(e1=R.E1, eta=R.ETA), tilt=TILT, ustar=float(row.ustar), S5=float(row.S5),
                   theta_needed=THETA[t],
                   S=[float('%.12g' % x) for x in d['S']], psi=[float('%.12g' % x) for x in d['psi']],
                   GA=[float('%.12g' % x) for x in d['GA']], GB=[float('%.12g' % x) for x in d['GB']],
                   G0=[float('%.12g' % x) for x in d['G0']])
        with open(os.path.join(dst, 'band_row_%s.json' % t), 'w') as f:
            json.dump(out, f, separators=(',', ':'))
            f.write('\n')
        err = max(float(np.max(np.abs(np.array(out[n]) - d[n]))) for n in ('S', 'psi', 'GA', 'GB', 'G0'))
        print('row %s: %d points, u* = %.8f (sig^2 = %.8f), S5 = %.10f, round-trip error %.1e, max |Im Gamma_A| %.1e, |Im Gamma_B| %.1e'
              % (t, len(out['S']), out['ustar'], rec['sig'] ** 2, out['S5'], err, float(np.abs(d['GAi']).max()), float(np.abs(d['GBi']).max())))

if __name__ == '__main__':
    main(sys.argv[1], sys.argv[2])
