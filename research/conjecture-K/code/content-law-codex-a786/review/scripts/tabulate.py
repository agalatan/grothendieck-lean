# Review of codex-a786's content-law package: tables from content_ratio.py's JSON.  usage: tabulate.py <json>
import json, sys
R = json.load(open(sys.argv[1])); MS = ['1', '2', '4', '8', '21']
TARGET = {'0.80': 0.37, '0.82': 0.64, '0.84': 1.33, '0.845': 1.88, '0.85': 2.5, '0.855': 3.7}
th = lambda m: 77.0 / (9 * (int(m) + 3))
print('P1: q = sqrt(u) X P_m.  ratio = c_X^2/(delta Omhat), sector A (tilt 0.4) / sector B (tilt 0.3).  Proved constant theta = 77/(9(m+3)).')
print('%-6s %-12s | ' % ('t', 'u') + ' | '.join('m=%-2s A      B    ' % m for m in MS))
worst = {m: (0, None) for m in MS}; tight = {m: (1e9, None) for m in MS}
for row in R['rows']:
    for case in row['cases']:
        if 'sigma' not in case['label']: continue
        cells = []
        for m in MS:
            a = case['sect']['A']['p1'][m]['ratio']; b = case['sect']['B']['p1'][m]['ratio']; cells.append('%.4f %.4f' % (a, b))
            for sec, v in (('A', a), ('B', b)):
                if v > worst[m][0]: worst[m] = (v, (row['t'], case['label'], sec))
                if th(m) / v < tight[m][0]: tight[m] = (th(m) / v, (row['t'], case['label'], sec))
        print('%-6s %-12s | ' % (row['t'], case['label']) + ' | '.join('     ' + c for c in cells))
print('%-19s | ' % 'theta = 77/(9(m+3))' + ' | '.join('     %.4f       ' % th(m) for m in MS))
print('%-19s | ' % 'largest ratio' + ' | '.join('     %.4f       ' % worst[m][0] for m in MS))
print('%-19s | ' % 'theta / largest' + ' | '.join('     %5.1f        ' % tight[m][0] for m in MS))
print('largest ratio at:', {m: worst[m][1] for m in MS})
print()
print('Row targets of the question against the largest measured ratio over u/sigma^2 in {0.5, 1, 1.3} and both sectors (N):')
for row in R['rows']:
    out = []
    for m in MS:
        v = max(case['sect'][s]['p1'][m]['ratio'] for case in row['cases'] if 'sigma' in case['label'] for s in 'AB')
        out.append('m=%s: %.3f (%s; proved theta %.3f %s)' % (m, v, 'below target' if v < TARGET[row['t']] else 'ABOVE target', th(m), 'below' if th(m) < TARGET[row['t']] else 'above'))
    print(' t=%-5s target %.2f | ' % (row['t'], TARGET[row['t']]) + ' | '.join(out))
print()
print('P2: q = sqrt(u)(sqrt(rho) X P_m + sqrt(1-rho) W).  N1: W = U^2 conj(Z)/sqrt 2 (Var D = 5); diffuse: D = 1 (limit N -> infinity of W_N).')
keys = list(R['rows'][0]['cases'][0]['sect']['A']['p2'].keys())
print('%-6s %-12s | ' % ('t', 'u') + ' | '.join('%-22s A      B   ' % k for k in keys))
wp = {k: 0 for k in keys}; thp = {}
for row in R['rows']:
    for case in row['cases']:
        if 'sigma' not in case['label']: continue
        cells = []
        for k in keys:
            a = case['sect']['A']['p2'][k]; b = case['sect']['B']['p2'][k]; thp[k] = a['theta']; wp[k] = max(wp[k], a['ratio'], b['ratio'])
            cells.append('chi %5.2f        %.4f %.4f' % (a['chi'], a['ratio'], b['ratio']))
        print('%-6s %-12s | ' % (row['t'], case['label']) + ' | '.join(cells))
print('proved theta: ' + ', '.join('%s: %.4f' % (k, thp[k]) for k in keys))
print('largest ratio: ' + ', '.join('%s: %.4f (theta/largest = %.1f)' % (k, wp[k], thp[k] / wp[k]) for k in keys))
print()
print('Comparison with the degree-5 study (t4fam_<k>.log, family X(|Y|^2-1), sums over the sectors A and B):')
for row in R['rows']:
    for case in row['cases']:
        if 'u*' not in case['label']: continue
        a, b = case['sect']['A']['p1']['1'], case['sect']['B']['p1']['1']
        s = ' t=%-5s u=%-8s X(|Y|^2-1): content/delta %.5f Omhat %.4f' % (row['t'], case['label'], (a['c'] ** 2 + b['c'] ** 2) / a['delta'], a['Omhat'] + b['Omhat'])
        k = 'm1_rho0.36_diffuse'
        if k in case['sect']['A']['p2']:
            a, b = case['sect']['A']['p2'][k], case['sect']['B']['p2'][k]
            s += ' | with diffuse bulk, c = 0.6: content/delta %.5f Omhat %.4f chi %.2f' % ((a['c'] ** 2 + b['c'] ** 2) / a['delta'], a['Omhat'] + b['Omhat'], a['chi'])
        print(s)
