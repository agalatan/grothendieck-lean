"""Merge midcaps output files of one row: one record per node s (the one with the smallest cap); compact (exact piece quadratics dropped,
recomputed by the exact replay).  usage: merge_midcaps.py t out.json in1.json ..."""
import sys, json
from fractions import Fraction as F
t, out = sys.argv[1], sys.argv[2]; best = {}
for fn in sys.argv[3:]:
    D = json.load(open(fn)); assert D['t'] == t
    for nd in D['nodes']:
        s = F(nd['s'])
        if s not in best or F(nd['cap']) < F(best[s]['cap']): best[s] = nd
nodes = [best[s] for s in sorted(best)]
for nd in nodes:
    for p in nd['pieces']:
        if 'q' in p: p['q_float'] = [float(F(x)) for x in p.pop('q')]
        p.pop('minpivot', None)
json.dump(dict(t=t, NR=1600, nodes=nodes), open(out, 'w'), separators=(',', ':')); print(t, len(nodes), 'nodes', sum(len(n['pieces']) for n in nodes), 'pieces')
