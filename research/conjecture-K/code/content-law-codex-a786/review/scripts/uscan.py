# Review of codex-a786's content-law package (worker of claude-b9ee, 16 Nov 2026).  N.
# The ratio c_X^2/(delta Omhat) on P1 as a function of the energy, for the row profiles: it grows as u decreases and tends to
# the value 16/(3(m+3)) of the profile h(v) = v as u -> 0 (h is smooth at 0 with h'(0) != 0).  So a constant valid "at every
# energy u > 0" cannot be below 16/(3(m+3)) for these profiles; the row targets can only be met on a band of energies.
# usage (from the review folder): python3 -I -c "import sys; sys.path.insert(0,'scripts'); sys.argv=['uscan.py','data','logs/uscan.json']; exec(open('scripts/uscan.py').read())"
import sys, json, math
import numpy as np
import content_ratio as CR
pdir, outjson = sys.argv[1], sys.argv[2]
FR = (0.001, 0.01, 0.03, 0.1, 0.2, 0.35, 0.5, 0.75, 1.0, 1.3, 2.0, 3.0); MS = (1, 4, 21)
TARGET = {'0.80': 0.37, '0.82': 0.64, '0.84': 1.33, '0.845': 1.88, '0.85': 2.5, '0.855': 3.7}
res = []
for tname, k in CR.ROWK.items():
    d = np.load('%s/prof_hp_%d.npz' % (pdir, k)); S = d['S']; sig = float(d['sigma'])
    print('=== t = %s (row target %.2f); columns u/sigma^2; entries: sector A / sector B' % (tname, TARGET[tname]))
    tab = {m: [] for m in MS}; slopes = {}
    for sec, (gname, tilt) in CR.TILT.items():
        pr = CR.Prof(S, d[gname] + tilt * d['G0'])
        slopes[sec] = (float(pr.h(np.array([0.0]))[0]), float((pr.h(np.array([1e-4]))[0] - pr.h(np.array([0.0]))[0]) / 1e-4))
        for f in FR:
            u = f * sig * sig; kp = CR.kprime(pr, u); T = CR.a_tables(pr.h, kp, u)
            for m in MS:
                r = CR.evaluate(m, 1.0, None, u, T); tab[m].append((sec, f, r['ratio'])); res.append(dict(t=tname, sector=sec, ufrac=f, m=m, ratio=r['ratio'], chk=abs(r['c_rep'] / r['c'] - 1)))
    print('   h(0), h\'(0): A %.4f, %.3f; B %.4f, %.3f' % (slopes['A'] + slopes['B']))
    print('   u/sigma^2 ' + ' '.join('%13g' % f for f in FR) + ' | u -> 0: 16/(3(m+3)) | proved 77/(9(m+3))')
    for m in MS:
        A = {f: r for s, f, r in tab[m] if s == 'A'}; B = {f: r for s, f, r in tab[m] if s == 'B'}
        print('   m=%-2d      ' % m + ' '.join('%6.4f/%6.4f' % (A[f], B[f]) for f in FR) + ' | %.4f | %.4f' % (16 / (3 * (m + 3)), 77 / (9 * (m + 3))))
        cross = [f for f in FR if max(A[f], B[f]) >= TARGET[tname]]
        print('              measured ratio >= row target at u/sigma^2 in %s' % (cross if cross else '{} (none of the sampled energies)'))
    sys.stdout.flush()
json.dump(res, open(outjson, 'w'), indent=1)
print('largest relative difference between the direct content and its (13) form over the scan: %.1e' % max(r['chk'] for r in res))
