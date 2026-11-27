#!/usr/bin/env python3
"""Select the game of every problem of an eps_profile JSON on the FINAL shared pool (standard library).
The run of 25 November refreshed LB on the final pool but kept U and the incumbent game from the iteration at which the game was
visited; a pair found later for another problem can score higher against it (reviews of PR #711, codex-a7c4 and gemini-21d5).
For every logged candidate (game x, largest oracle payoff U_hist when visited) the score is max(U_hist, max over the final pool);
the candidate of smallest score becomes 'best', U its score, gap = U - LB, done = (gap < 1e-6).  The first values are kept as
U_at_visit and best_at_visit.  Checked: U >= every pool row at the selected game, U >= LB.  Idempotent.
usage: rescore.py FILE.json [...]   (rewrites the files in place)"""
import sys, json
for fn in sys.argv[1:]:
    d = json.load(open(fn)); pool = d['pool']; ch = 0
    for p in d['problems']:
        K = len(p['best']['lam']) - 1
        def pmax(x):
            sc = [sum(xi * ci for xi, ci in zip(x, r[1:K + 3])) for r in pool]; i = max(range(len(sc)), key=sc.__getitem__); return sc[i], i
        if 'U_at_visit' not in p: p['U_at_visit'] = p['U']; p['best_at_visit'] = dict(lam=p['best']['lam'], nu=p['best']['nu'])
        if 'best_at_visit' not in p:            # records migrated by the first version: the incumbent is the logged game whose U is U_at_visit
            e0 = min(p['log'], key=lambda e: (abs(e['U'] - p['U_at_visit']), e['it'])); p['best_at_visit'] = dict(lam=[1.0] + e0['x'][:K], nu=e0['x'][K], iteration=e0['it'])
        # every logged candidate (its game x and the largest oracle payoff U found when it was visited), scored on the final pool
        cands = []
        for e in p['log']:
            x = [1.0] + e['x']; v, i = pmax(x); cands.append((max(e['U'], v), e['it'], x, v, i, e))
        sc, it, x, v, i, e = min(cands, key=lambda c: (c[0], c[1]))
        old = (p['best']['lam'], p['best']['nu'], p['U'])
        p['best'] = dict(lam=x[:K + 1], nu=x[K + 1], vals=e['vals'], pool_max=v, pool_max_row=[i, pool[i][0]], iteration=it)
        p['U'] = sc; p['gap'] = p['U'] - p['LB']; p['K_of_U'] = 1 / p['U']; p['done'] = bool(p['gap'] < 1e-6)
        assert all(p['U'] >= sum(xi * ci for xi, ci in zip(x, r[1:K + 3])) for r in pool) and p['U'] >= p['LB'] - 1e-12
        if old != (p['best']['lam'], p['best']['nu'], p['U']):
            ch += 1; print('%s eps %s tail %s: selected iteration %d, (%s), nu %.6f: U %.10f, 1/U %.6f, gap %.2e (at visit: U %.10f, 1/U %.6f)' % (
                fn.split('/')[-1], p['eps'], p['tail'], it, ', '.join('%.6f' % t for t in x[:K + 1]), x[K + 1], p['U'], 1 / p['U'], p['gap'], p['U_at_visit'], 1 / p['U_at_visit']))
    json.dump(d, open(fn, 'w'), indent=0); print('%s: %d problems, %d pool rows, %d selections changed' % (fn.split('/')[-1], len(d['problems']), len(pool), ch))
