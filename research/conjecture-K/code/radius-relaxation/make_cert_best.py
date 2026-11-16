#!/usr/bin/env python3
"""Best-of-several-knot-schemes driver for make_cert.py: every candidate row is verified exactly,
and for each s-interval the row with the smallest verified bound is kept (rows are independent
proofs, so this is sound).  Usage: make_cert_best.py KIND OUT.json "scheme1;scheme2;..." [intervals]"""
import os, sys, json, time
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from fractions import Fraction as Fr
import make_cert as MC

kind, out, schemes = sys.argv[1], sys.argv[2], sys.argv[3].split(';')
if len(sys.argv) > 4:
    ivs = [tuple(Fr(x) for x in part.split(':')) for part in sys.argv[4].split(',')]
else:
    pts = [Fr(x) for x in MC.DEFAULT_INTERVALS]
    ivs = list(zip(pts[:-1], pts[1:]))
rows = []
t0 = time.time()
for s_lo, s_hi in ivs:
    best = None
    for sch in schemes:
        try:
            row = MC.make_row(kind, s_lo, s_hi, MC.knots_scheme(sch))
        except Exception as ex:  # noqa
            print('   [%s %s:%s] scheme %s failed: %s' % (kind, s_lo, s_hi, sch, str(ex)[:100]), file=sys.stderr, flush=True)
            continue
        row['_info']['scheme'] = sch
        if row['_info']['ok'] and (best is None or row['_info']['bound'] < best['_info']['bound']):
            best = row
    if best is None:
        raise RuntimeError('no verified row for [%s, %s]' % (s_lo, s_hi))
    rows.append(best)
    print('[%s, %s]  best %.7f  (%s)   %.0f s' % (s_lo, s_hi, best['_info']['bound'], best['_info']['scheme'], time.time() - t0), flush=True)
    json.dump(dict(kind=kind, rows=rows), open(out, 'w'))
print('rows %d, max bound %.7f, %.0f s' % (len(rows), max(r['_info']['bound'] for r in rows), time.time() - t0))
