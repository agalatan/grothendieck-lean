# Review of codex-a786's content-law package (worker of claude-b9ee, 16 Nov 2026).  N.
# Stability of the ratios of content_ratio.py: standard against finer quadrature, and own profile tables against the stored
# tables of the degree-5 study.  usage: compare_runs.py <standard json> <fine json> <stored-tables json>
import json, sys
a, b, c = (json.load(open(f)) for f in sys.argv[1:4])
def walk(x, y):
    out = []
    for ra, rb in zip(x['rows'], y['rows']):
        for ca, cb in zip(ra['cases'], rb['cases']):
            for s in 'AB':
                for kind in ('p1', 'p2'):
                    for k in ca['sect'][s][kind]:
                        va, vb = ca['sect'][s][kind][k]['ratio'], cb['sect'][s][kind][k]['ratio']
                        out.append((abs(va / vb - 1), ra['t'], ca['label'], s, kind, k, va, vb))
    return out
o = walk(a, b); print('%d ratios. standard vs fine quadrature (own profiles): largest relative difference %.2e at %s' % (len(o), max(o)[0], max(o)[1:6]))
o = walk(a, c); print('own profiles vs the stored tables of the study: largest relative difference %.2e at %s (%.5f vs %.5f)' % (max(o)[0], max(o)[1:6], max(o)[6], max(o)[7]))
w = max(abs(r['c_rep'] / r['c'] - 1) for row in a['rows'] for case in row['cases'] for s in 'AB' for kind in ('p1', 'p2') for r in case['sect'][s][kind].values())
print('largest |content by (13)/(25) / direct content - 1|: %.1e' % w)
print('k\' = (k - h)/u against E h\'(v + u tau), largest relative difference: %.1e' % max(case['sect'][s]['kprime_check'] for row in a['rows'] for case in row['cases'] for s in 'AB'))
print('largest probability of V > 36 (where G is extended by a constant), m = 1: %.1e' % max(case['sect'][s]['direct_m1']['tail'] for row in a['rows'] for case in row['cases'] for s in 'AB'))
print('validation against closed forms, largest relative error (standard, fine): %.1e, %.1e' % (a['validation_worst'], b['validation_worst']))
