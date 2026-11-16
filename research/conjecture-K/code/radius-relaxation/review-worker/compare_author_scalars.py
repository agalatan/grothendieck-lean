#!/usr/bin/env python3
"""The author's scalar definitions (function `scalars` of scripts/check_budgets_exact.py, loaded from a scratch copy
given as argv[1]) against the reviewer's transcription of the Lean index patterns (own_wick.lean_contractions),
on the reviewer's test tensors.  Exact comparison of Fractions."""
import sys, os, importlib.util
from fractions import Fraction as Fr
sys.path.append(os.path.dirname(os.path.abspath(__file__)))   # the reviewer's folder (run with python3 -I)
import own_wick as W
import own_identities as OI

spec = importlib.util.spec_from_file_location('author_cbe', sys.argv[1])
A = importlib.util.module_from_spec(spec)
spec.loader.exec_module(A)

bad = 0
for name, d, t in OI.cases():
    R = range(d)
    ta = [[[A.C(t[a][b][c][0], t[a][b][c][1]) for c in R] for b in R] for a in R]
    n, h, b, y, z, nrm = A.scalars(ta, d)
    mine = W.lean_contractions(W.to_fr_tensor(t, d), R)
    u = 2 * W.tensor_norm_sq(t, R)
    mine_n = tuple(x / Fr(u * u) for x in mine)
    ok = (mine_n == (n, h, b, y, z)) and nrm == u
    bad += not ok
    print('%-42s author = reviewer (exact): %s' % (name, ok))
print('%d mismatches' % bad)
sys.exit(1 if bad else 0)
