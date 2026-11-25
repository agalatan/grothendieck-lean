#!/usr/bin/env python3
"""Re-score the stored best game of every problem of an eps_profile JSON on the FINAL shared pool (standard library; exact on the
stored decimals up to float rounding).  The run of 25 November refreshed LB on the final pool but kept U from the iteration at which
the game was visited; a pair found later for another problem can score higher against it (review of PR #711, codex-a7c4 and
gemini-21d5).  This sets U = max(U, max over the final pool), records the old value as U_at_visit and the pool row, and checks
U >= every pool row >= ... and U >= LB - 1e-12.  eps_profile.py now does the same at the end of every iteration.
usage: rescore.py FILE.json [...]   (rewrites the files in place; idempotent)"""
import sys, json
for fn in sys.argv[1:]:
    d = json.load(open(fn)); pool = d['pool']; ch = 0
    for p in d['problems']:
        b = p['best']; x = b['lam'] + [b['nu']]; K = len(b['lam']) - 1
        sc = [sum(xi * ci for xi, ci in zip(x, r[1:K + 3])) for r in pool]; i = max(range(len(sc)), key=sc.__getitem__)
        if 'U_at_visit' not in p: p['U_at_visit'] = p['U']
        b['pool_max'] = sc[i]; b['pool_max_row'] = [i, pool[i][0]]
        if sc[i] > p['U']: p['U'] = sc[i]; ch += 1
        p['gap'] = p['U'] - p['LB']; p['K_of_U'] = 1 / p['U']
        assert all(p['U'] >= v for v in sc) and p['U'] >= p['LB'] - 1e-12
        if p['U'] > p['U_at_visit']: print('%s eps %s tail %s: U %.10f -> %.10f (pool row %d, %s), 1/U %.6f -> %.6f, gap %.2e' % (fn.split('/')[-1], p['eps'], p['tail'], p['U_at_visit'], p['U'], i, pool[i][0], 1 / p['U_at_visit'], 1 / p['U'], p['gap']))
    json.dump(d, open(fn, 'w'), indent=0); print('%s: %d problems, %d pool rows, %d scores raised' % (fn.split('/')[-1], len(d['problems']), len(pool), ch))
