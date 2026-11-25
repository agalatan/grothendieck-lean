#!/usr/bin/env python3
"""The deficit at zero energy, V_sl(0) = S5 - F(nu), of the row of each piece at its nu5 and at nu' (N; needs numpy, scipy and the
module rowlib of ../../degree5-content/ or of the working folder; run where the profile archives are).
For the pairs of checks/zero_content_budget.py with lambda -> 0, X(q) -> V_sl(0): the share of the deficit that the gain needs is
gain/V_sl(0) (with the Gaussian benchmark S5 itself, where the exact script uses the certified cap G+ >= S5), and in the nu-matched
variant X^{nu'}(q) -> S5^{nu'} - F(nu') must be positive.
usage: D5_E1=0.78 D5_ETA=0.0779 zero_energy_deficit.py THRESH_DIR DESIGN_PROF_DIR NU_PROF_DIR ROWS5.lines(of the nu-matched rows)"""
import sys, os, json, math
sys.path.insert(0, sys.argv[1]); import rowlib as R
dprof, nprof, rowsf = sys.argv[2:5]; MU = math.sqrt(math.pi) / 2; GAM = math.sqrt(3) / 8; ETA = float(os.environ['D5_ETA'])
F = lambda r, v: 2 * MU * (r['l'] - r['beta'] / 2 + GAM * v) - v * v / ETA
print('| j | row | nu5 | S5 - F(nu5) (N) | gain F(nu\') - F(nu5) | gain/(S5 - F(nu5)) | u* at nu5 | nu\' | S5 at nu\' minus F(nu\') (N) | u* at nu\' |')
print('|---|---|---|---|---|---|---|---|---|---|')
for k, l in enumerate([x for x in open(rowsf) if x.strip()], 1):
    r = json.loads(l); a = R.Row(os.path.join(dprof, 'prof_t%s.npz' % ('%.4f' % r['t']).replace('.', 'p'))); b = R.Row(os.path.join(nprof, 'prof_%d.npz' % k))
    r5 = dict(r, nu5=r['nu5_row']); gain = F(r, r['nu5']) - F(r5, r['nu5_row'])
    print('| %d | %.3f | %.7f | %.4e | %.4e | %.4f | %.5f | %.7f | %.4e | %.5f |' % (k, r['t'], r['nu5_row'], a.Vsl(0.0), gain, gain / a.Vsl(0.0), a.ustar, r['nu5'], b.Vsl(0.0), b.ustar))
