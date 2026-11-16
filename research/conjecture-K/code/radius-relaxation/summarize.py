"""Markdown tables from the result files (no computation)."""
import os, sys, json
from fractions import Fraction as Fr
base = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'results')


def load(names):
    rows = {}
    for nm in names:
        p = os.path.join(base, nm)
        if os.path.exists(p):
            for l in open(p):
                o = json.loads(l)
                if 'value' in o:
                    rows.setdefault(o['s'], {})[o['tag']] = o
    return rows


print('### scan over s (unrestricted dual, knots to r = 30, K = 107; value / value corrected by the dense-grid slack)\n')
rows = load(['fine_a.jsonl', 'fine_b.jsonl', 'fine_c.jsonl'])
tags = ['R0', 'Gjoint', 'N', 'Njoint']
print('| s | ' + ' | '.join(tags) + ' |')
print('|---|' + '---|' * len(tags))
for s in sorted(rows):
    cells = []
    for t in tags:
        o = rows[s].get(t)
        cells.append('—' if o is None else '%.4f / %.4f' % (o['value'], o['bound_N']))
    print('| %g | ' % s + ' | '.join(cells) + ' |')

print('\n### ablation at s = 5\n')
p = os.path.join(base, 'ablate_s5.jsonl')
if os.path.exists(p):
    print('| constraint set | dual value | dense-grid min slack |')
    print('|---|---|---|')
    for l in open(p):
        o = json.loads(l)
        print('| %s | %.4f | %.1e |' % (o['tag'], o['value'], o['min_slack']))

for nm in sys.argv[1:]:
    p = os.path.join(base, nm)
    if not os.path.exists(p):
        continue
    c = json.load(open(p))
    print('\n### certificate %s: rows\n' % nm)
    print('| s-interval | knots | exact row bound | scheme |')
    print('|---|---|---|---|')
    for r in c['rows']:
        print('| [%s, %s] | %d | %.7f | %s |' % (r['s_lo'], r['s_hi'], len(r['knots']), r['_info']['bound'], r['_info'].get('scheme', 'default')))
    print('\nmax over rows: %.7f' % max(r['_info']['bound'] for r in c['rows']))
