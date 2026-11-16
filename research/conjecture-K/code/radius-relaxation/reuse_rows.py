#!/usr/bin/env python3
"""Re-partition a certificate: every row's pointwise inequality (C2) holds for all s, only its
endpoint bounds depend on the s-interval.  For each target interval this script evaluates every
row of a pool on that interval (new parameter-LP multipliers for the two endpoints, then the
exact verifier) and keeps the row with the smallest exact bound.

Usage: reuse_rows.py OUT.json "s0,s1,s2,..." POOL1.json [POOL2.json ...]
"""
import os, sys, json, copy, time
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from fractions import Fraction as Fr
import make_cert as MC
import verify_cert as VC

out = sys.argv[1]
pts = [Fr(x) for x in sys.argv[2].split(',')]
pool = []
for p in sys.argv[3:]:
    c = json.load(open(p))
    for r in c['rows']:
        if r.get('_info', {}).get('ok', True):
            pool.append(r)
kind = json.load(open(sys.argv[3])).get('kind')
print('pool: %d rows' % len(pool), flush=True)
# (C2) of every pool row is checked once, on its own interval
okrow = []
for r in pool:
    okrow.append(VC.verify_row(r, quiet=True)['ok'])
print('pool rows passing (C1)-(C2): %d' % sum(okrow), flush=True)
rows = []
t0 = time.time()
for s_lo, s_hi in zip(pts[:-1], pts[1:]):
    best = None
    # candidates: rows designed near the interval first
    mid = (s_lo + s_hi) / 2
    cand = sorted([i for i in range(len(pool)) if okrow[i]],
                  key=lambda i: abs((Fr(pool[i]['s_lo']) + Fr(pool[i]['s_hi'])) / 2 - mid))[:int(os.environ.get('NCAND', '10'))]
    for i in cand:
        r = copy.deepcopy(pool[i])
        mu = [Fr(x) for x in r['mu']]
        l3 = [Fr(x) for x in r['l3']]
        sig = Fr(r['sigma'])
        try:
            par = MC.par_part(mu, sig, l3, (s_lo, s_hi))
        except Exception as ex:  # noqa
            continue
        r['s_lo'], r['s_hi'], r['par'] = str(s_lo), str(s_hi), par
        res = VC.verify_row(r, quiet=True)
        if res['ok'] and (best is None or res['bound'] < best[0]):
            r['_info'] = dict(r.get('_info', {}), bound=float(res['bound']), ok=True,
                              designed_for='[%s, %s]' % (pool[i]['s_lo'], pool[i]['s_hi']))
            best = (res['bound'], r)
    if best is None:
        raise RuntimeError('no row for [%s, %s]' % (s_lo, s_hi))
    rows.append(best[1])
    print('[%s, %s]  bound %.7f  (row designed for %s, %s)  %.0f s' % (
        s_lo, s_hi, float(best[0]), best[1]['_info']['designed_for'], best[1]['_info'].get('scheme', '?'), time.time() - t0), flush=True)
    json.dump(dict(kind=kind, rows=rows), open(out, 'w'))
print('rows %d, max bound %.7f' % (len(rows), max(r['_info']['bound'] for r in rows)))
