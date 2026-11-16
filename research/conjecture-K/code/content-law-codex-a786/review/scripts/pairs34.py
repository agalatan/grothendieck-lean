# Review of codex-a786's content-law package (worker of claude-b9ee, 16 Nov 2026).  N.
# The 34 row/rank pairs that P1 leaves open (SCALAR_REDUCTION.md): q = sqrt(u) X P_m with
#   t = 0.80: m = 1..20;  0.82: m = 1..10;  0.84: m = 1, 2, 3;  0.845: m = 1.
# For each pair: the ratio c_X^2/(delta Omhat) for both tilted profiles on a grid of the band u/sigma^2 in [0.5, 1.3], against the
# row target; and, below the band, the largest scanned energy at which the target is violated.  Floating point only: this is
# evidence, not a certificate.
# usage (from the review folder): python3 -I -c "import sys; sys.path.insert(0,'scripts'); sys.argv=['pairs34.py','data','logs/pairs34.json']; exec(open('scripts/pairs34.py').read())"
import sys, json
import numpy as np
import content_ratio as CR
pdir, outjson = sys.argv[1], sys.argv[2]
PAIRS = {'0.80': (0.37, range(1, 21)), '0.82': (0.64, range(1, 11)), '0.84': (1.33, range(1, 4)), '0.845': (1.88, range(1, 2))}
BAND = (0.5, 0.55, 0.6, 0.7, 0.8, 0.9, 1.0, 1.1, 1.2, 1.3); BELOW = (0.02, 0.05, 0.1, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45)
res = []; npairs = 0; worst = (1e9, None)
for tname, (target, ms) in PAIRS.items():
    k = CR.ROWK[tname]; d = np.load('%s/prof_hp_%d.npz' % (pdir, k)); S = d['S']; sig = float(d['sigma'])
    val = {}
    for sec, (gname, tilt) in CR.TILT.items():
        pr = CR.Prof(S, d[gname] + tilt * d['G0'])
        for f in BAND + BELOW:
            u = f * sig * sig; kp = CR.kprime(pr, u); tab = CR.a_tables(pr.h, kp, u)
            for m in ms: val[(m, sec, f)] = CR.evaluate(m, 1.0, None, u, tab)['ratio']
    print('=== t = %s, target %.2f' % (tname, target))
    for m in ms:
        band = max((val[(m, s, f)], f, s) for s in 'AB' for f in BAND)
        mono = all(val[(m, s, BAND[i])] > val[(m, s, BAND[i + 1])] for s in 'AB' for i in range(len(BAND) - 1))
        viol = [f for f in BELOW if max(val[(m, 'A', f)], val[(m, 'B', f)]) >= target]
        npairs += 1; ok = band[0] < target
        if target / band[0] < worst[0]: worst = (target / band[0], (tname, m))
        res.append(dict(t=tname, m=m, target=target, max_band=band[0], at=band[1], sector=band[2], decreasing_in_u=mono, violated_below_band_up_to=max(viol) if viol else None,
                        theta_p1=77 / (9 * (m + 3)), hv=16 / (3 * (m + 3))))
        print('  m=%2d: largest ratio on the band %.4f (u = %.2f sigma^2, sector %s; decreasing in u on the band: %s) = target/%.2f  %s | below the band the target is violated up to u/sigma^2 = %s | u -> 0: %.4f | proved theta %.4f'
              % (m, band[0], band[1], band[2], mono, target / band[0], 'HOLDS on the band grid' if ok else 'FAILS on the band grid', max(viol) if viol else 'none of the scanned', 16 / (3 * (m + 3)), 77 / (9 * (m + 3))))
    sys.stdout.flush()
json.dump(res, open(outjson, 'w'), indent=1)
print('%d pairs; pairs holding on the band grid (10 energies, both sectors): %d; smallest margin target/ratio = %.2f at %s' % (npairs, sum(r['max_band'] < r['target'] for r in res), worst[0], worst[1]))
