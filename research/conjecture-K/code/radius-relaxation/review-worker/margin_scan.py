#!/usr/bin/env python3
"""Float scan (label N) of the pointwise inequality (C2): min over a fine grid of  R2(r^2) - r  per row, with the
float evaluator of validate_cubics.py (a third implementation, independent of both exact verifiers).
Usage: python3 -I margin_scan.py CERT.json"""
import json, os, sys
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
import numpy as np
import validate_cubics as VC

cert = json.load(open(sys.argv[1]))
allmin = np.inf
for i, row in enumerate(cert['rows']):
    RF = VC.RowF(row)
    eK = RF.e[-1]
    r = np.unique(np.concatenate([np.linspace(1e-9, eK, 400001), np.linspace(eK, eK + 40, 40001), RF.e[1:],
                                  RF.e[1:] - 1e-9, RF.e[1:] + 1e-9]))
    V = r * r
    one = np.ones_like(r)
    R2, RHS, br1, br2, cone = RF.evaluate(r, V, one, one, 0 * one)
    k = int(np.argmin(R2 - r))
    allmin = min(allmin, float((R2 - r)[k]))
    print('row %2d  last knot %.3f  K=%d  min (R2 - r) = %.3e at r = %.4f;  at r = 0+: %.3e;  at the last knot: %.3e'
          % (i, eK, RF.K, (R2 - r)[k], r[k], (R2 - r)[0], (R2 - r)[np.searchsorted(r, eK)]))
print('smallest margin over all rows: %.3e' % allmin)
