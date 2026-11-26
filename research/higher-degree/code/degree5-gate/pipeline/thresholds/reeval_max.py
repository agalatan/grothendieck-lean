#!/usr/bin/env python3
"""Re-evaluate the content worker's stored maximisers under ANOTHER row profile and energy (N).  claude-b9ee worker d5newcap, 17 Nov 2026.
The stored records (content5/out/b2_gen*.json, b2_rows_n*.json; copies in thresholds/b2data/) hold a cubic of H_{2,1}(C^n) as
coefficients on Wick monomials, found by a search on a row of the content study at a fraction of that row's u*.  Here the
ratio ||c||^2/(delta Omhat) of the SAME cubic is evaluated with the tilted A-profile of the configuration of a band file
(a row on its own piece or a covering row on a lower piece: profile table, t_lo) at chosen energies, by the content
worker's own evaluator (b2_gen7.Gen7.fine, copied unchanged into thresholds/b2copy/; quasi-Monte-Carlo, 2^M2 points, seed 37).
The cubic is NOT re-optimised for the other profile or energy: the number is a LOWER bound on that configuration's largest
ratio.  "possible" = the cubic's law satisfies the Rice family (R1) at the t_lo of the band file at that energy.
usage: reeval_max.py NAME E1 ETA BANDFILE RECORDS.json energies [M2=20] [records: 'best' | number]
       energies: 'rec' (the record's own fraction of u*), or a list of u/u* values and cX (X times the cap of the piece)"""
import sys, os, json, math, shutil, warnings; warnings.filterwarnings('ignore')
here = os.path.dirname(os.path.abspath(__file__)); name, e1, eta, bandf = sys.argv[1:5]; fn = os.path.abspath(os.path.join(here, sys.argv[5])) if not os.path.isabs(sys.argv[5]) else sys.argv[5]
energies = sys.argv[6].split(','); m2 = int(sys.argv[7]) if len(sys.argv) > 7 else 20; which = sys.argv[8] if len(sys.argv) > 8 else 'best'
os.environ.update(D5_E1=e1, D5_ETA=eta, OMP_NUM_THREADS='1', OPENBLAS_NUM_THREADS='1', MKL_NUM_THREADS='1', VECLIB_MAXIMUM_THREADS='1', RAYON_NUM_THREADS='1')
gd = os.path.join(here, 'games', name); band = json.load(open(os.path.join(gd, bandf)))['rows']['1']
work = os.path.join(gd, 'reeval_' + os.path.splitext(bandf)[0] + '_' + os.path.splitext(os.path.basename(fn))[0]); os.makedirs(os.path.join(work, 'out'), exist_ok=True)
recs = [r for r in json.load(open(fn)) if ('coef' in r or 'coef_aligned' in r) and r.get('k') is not None]
if which == 'best': recs = sorted(recs, key=lambda r: -r.get('ratio_check', r.get('ratio', 0)))[:1]
else: recs = recs[:int(which)]
sys.path.insert(0, os.path.join(here, 'b2copy')); sys.path.insert(0, here)          # my rowlib / t4lib / rice (game from the environment) come first
os.chdir(work)
import numpy as np, r4lib as L, rice as RI
from b2_gen7 import Gen7
out = []; g = None; kdone = None
ucap = 4 * RI.E1 ** 2 * 0.432306903 * (0.886762780 - band['tlo'])
for r in recs:
    k = r['k']; labels = r['labels']; n = max(max(l[1:]) for l in labels) + 1
    c = np.array([complex(a, b) for a, b in (r.get('coef') or r.get('coef_aligned'))])
    if kdone != k:                                               # the configuration's row sits under the study's index k
        shutil.copy(os.path.join(gd, band['prof']), 'out/prof_%d.npz' % k); L.ROWS[k] = (band['t'], band['mu'], band['tlo'], band['room']); kdone = k; g = None
    if g is None or g.n != n: g = Gen7(k, n, m2=14)
    if len(g.labels) != len(c): print('record with %d coefficients against a basis of %d: skipped' % (len(c), len(g.labels))); continue
    for e in energies:
        u = r['ufrac'] * g.row.ustar if e == 'rec' else ((float(e[1:]) * ucap) if e.startswith('c') else float(e) * g.row.ustar)
        o = g.fine(c, u, m2=m2, seed=37)
        rec = dict(records=os.path.basename(fn), band=bandf, study_row_k=k, n=n, found_at_ufrac=r.get('ufrac'), ratio_in_study=r.get('ratio_check', r.get('ratio')), u=u, u_over_ustar=u / g.row.ustar, u_over_cap=u / ucap,
                   ratio=o['ratio'], chi=o['chi'], T_rice=o['T_rice'], tlo=band['tlo'], possible=bool(o['T_rice'] >= band['tlo']))
        out.append(rec)
        print('%s (n = %d, found on study row k = %s at %.2f u*, ratio there %.4f) under %s: u = %.5f (%.3f u*, %.3f cap): ratio A %.4f, chi %.2f, Rice T %.4f against t_lo %.4f: %s' % (
            rec['records'], n, k, r.get('ufrac', float('nan')), rec['ratio_in_study'], bandf, u, rec['u_over_ustar'], rec['u_over_cap'], o['ratio'], o['chi'], o['T_rice'], band['tlo'],
            'possible' if rec['possible'] else 'not a possible response'), flush=True)
json.dump(out, open(os.path.join(gd, 'out', 'reeval_%s_%s.json' % (os.path.splitext(bandf)[0], os.path.splitext(os.path.basename(fn))[0])), 'w'), indent=1)
