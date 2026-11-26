#!/usr/bin/env python3
"""Export the radial profiles of the band rows of a degree-5 game as JSON, in the format of
research/higher-degree/code/degree5-content/profiles/band_row_<t>.json (claude-b9ee worker d5newcap, 16 Nov 2026).  N.

Input: rows5.lines (this folder), the tables out/prof_<k>.npz written by `prof.py <k> out/prof_<k>.npz` and completed by
`tilt.py <k>`, and optionally band.json = {t: {"theta_needed": .., "mu": .., "tlo": .., "room": ..}} (thresholds).
Output: <dst>/band_row_<t>.json with the same keys as the kit's files (t, row, game, tilt, ustar, S5, theta_needed, S, psi,
GA, GB, G0) plus "extra" = {mu, tlo, room, radius input, note} when band.json has them.  theta_needed is null until the
thresholds are computed.
usage: D5_E1=.. D5_ETA=.. export_profiles2.py <dst> t1,t2,...
"""
import json, os, sys
import numpy as np
import rowlib as R
TILT = {'s': 0.4, 't': 0.3}
def main(dst, ts):
    os.makedirs(dst, exist_ok=True)
    rows = [json.loads(l) for l in open('rows5.lines').read().splitlines() if l.strip()]
    band = json.load(open('band.json')) if os.path.exists('band.json') else {}
    for tname in ts:
        k = [i for i, r in enumerate(rows, 1) if abs(r['t'] - float(tname)) < 1e-9][0]
        path = os.path.join('out', 'prof_%d.npz' % k)
        row = R.Row(path); d = np.load(path)
        rec = {key: row.rec[key] for key in ('t', 'l', 'beta', 'bA', 'bB', 'nu5', 'sig')}
        b = band.get(tname, {})
        out = dict(t=tname, row=rec, game=dict(e1=R.E1, eta=R.ETA), tilt=dict(b.get('tilt', TILT)), ustar=float(row.ustar), S5=float(row.S5),
                   theta_needed=b.get('theta_needed'),
                   S=[float('%.12g' % x) for x in d['S']], psi=[float('%.12g' % x) for x in d['psi']],
                   GA=[float('%.12g' % x) for x in d['GA']], GB=[float('%.12g' % x) for x in d['GB']],
                   G0=[float('%.12g' % x) for x in d['G0']])
        if b: out['extra'] = {key: b[key] for key in b if key not in ('theta_needed', 'tilt')}
        with open(os.path.join(dst, 'band_row_%s.json' % tname), 'w') as f:
            json.dump(out, f, separators=(',', ':')); f.write('\n')
        err = max(float(np.max(np.abs(np.array(out[n]) - d[n]))) for n in ('S', 'psi', 'GA', 'GB', 'G0'))
        print('row %s (line %d): %d points, u* = %.8f (sig^2 = %.8f), S5 = %.10f, theta_needed %s, round-trip error %.1e, max |Im Gamma_A| %.1e, |Im Gamma_B| %.1e'
              % (tname, k, len(out['S']), out['ustar'], rec['sig'] ** 2, out['S5'], out['theta_needed'], err, float(np.abs(d['GAi']).max()), float(np.abs(d['GBi']).max())))
if __name__ == '__main__':
    main(sys.argv[1], sys.argv[2].split(','))
