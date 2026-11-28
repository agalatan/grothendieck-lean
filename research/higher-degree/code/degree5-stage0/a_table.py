# Stage 0 (a): tables from the result files of a/rows0.py (N).   usage: a_table.py OUTDIR [BANDDIR] > a_tables.md
import sys, os, json, glob, math
D = sys.argv[1]
T = {'1.402': 500 / 701, '1.4025': 1 / 1.4025, '1.4027': 1 / 1.4027, '1.403': 1 / 1.403}
GAMES = [('gC', '(1, -0.78, 0.0779)'), ('g80', '(1, -0.80, 0.1364)'), ('g83', '(1, -0.83, 0.2241)'), ('g84', '(1, -0.84, 0.2552)'), ('gA2', '(1, -0.848, 0.2795)'), ('gA1', '(1, -0.84896, 0.2818)'), ('gA', '(1, -0.8493, 0.2827)')]
CLS = [('phys', 'floor: explicit cubics'), ('plain_2287_2500', 'plain, radius 2287/2500'), ('plain_KOUL3', 'plain, radius 114/125 with its s-table'), ('E2_KOUL3', 'E2: + first-order identities'), ('E3_KOUL3', 'E3: + third-order identities')]
R = {}
for f in glob.glob(os.path.join(D, '*.json')):
    try: r = json.load(open(f))
    except Exception: continue
    g, c, t = os.path.basename(f)[:-5].split('__'); R[(g, c, float(t))] = r
ts = sorted(set(k[2] for k in R))
print('Targets: 500/701 = %.7f, 1/1.4025 = %.7f, 1/1.4027 = %.7f, 1/1.403 = %.7f.\n' % (T['1.402'], T['1.4025'], T['1.4027'], T['1.403']))
print('## A1. Row values per game, t and class\n')
print('Each cell: the value of the best row found in the class (upper side), and in brackets the gap to the dual bound of the pool (lower side: no row')
print('within |p - p_hat| <= 3 has a smaller value against the laws of the pool).\n')
for g, name in GAMES:
    if not any(k[0] == g for k in R): continue
    print('### %s = %s\n' % (g, name))
    print('| t | ' + ' | '.join(n for _, n in CLS) + ' | room of the last class found at 1.4025 / 1.4027 / 1.403 |'); print('|---|' + '---|' * (len(CLS) + 1))
    for t in ts:
        cells = []; last = None
        for c, _ in CLS:
            r = R.get((g, c, t))
            if r is None: cells.append('-'); continue
            last = r['value']; cells.append('%.7f (%.0e)' % (r['value'], r['gap']) if r.get('gap') is not None else '%.7f' % r['value'])
        room = ' / '.join('%+.2e' % (T[k] - last) for k in ('1.4025', '1.4027', '1.403')) if last is not None else '-'
        print('| %g | %s | %s |' % (t, ' | '.join(cells), room))
    print()
print('## A2. The deciding table: the worst row on the sampled t in [0, 0.55] per game and class, and its room at 1/1.4027\n')
print('| game | ' + ' | '.join(n for _, n in CLS) + ' |'); print('|---|' + '---|' * len(CLS))
for g, name in GAMES:
    cells = []
    for c, _ in CLS:
        v = [(R[(g, c, t)]['value'], t) for t in ts if (g, c, t) in R and t <= 0.55 + 1e-9]
        if not v: cells.append('-'); continue
        m, tm = max(v); cells.append('%.7f at t = %g (%d of %d rows); room %+.2e' % (m, tm, len(v), len([t for t in ts if t <= 0.55 + 1e-9]), T['1.4027'] - m))
    if any(c != '-' for c in cells): print('| %s %s | %s |' % (g, name, ' | '.join(cells)))
print()
print('## A3. The laws at the maximum (plain and enriched classes): sigma, nu, s, mass of the law at U <= 10^-3 and 10^-2, and the best rows\n')
print('| game | t | class | row (l, beta, bA, bB) | sigma | nu | s | mass at U <= 1e-3 | at U <= 1e-2 | binding law of the floor |'); print('|---|---|---|---|---|---|---|---|---|---|')
for g, name in GAMES:
    for t in ts:
        for c, _ in CLS:
            r = R.get((g, c, t))
            if r is None: continue
            a = r.get('arg_full') or r['arg']; p = r['p']
            if isinstance(a, dict): print('| %s | %g | %s | (%.4f, %.4f, %.4f, %.4f) | %.4f | %.4f | %.2f | %.4f | %.4f | |' % (g, t, c, p[0], p[1], p[2], p[3], a['sig'], a['nu'], a['s'], a.get('mass_U_le_1e3', float('nan')), a.get('mass_U_le_1e2', float('nan'))))
            else: print('| %s | %g | %s | (%.4f, %.4f, %.4f, %.4f) | %.4f | %.4f | | | | %s |' % (g, t, c, p[0], p[1], p[2], p[3], a[1], a[2], a[0]))
if len(sys.argv) > 2:
    B = {}
    for f in glob.glob(os.path.join(sys.argv[2], '*.json')):
        try: r = json.load(open(f))
        except Exception: continue
        g, c, t = os.path.basename(f)[:-5].split('__'); B[(g, c, float(t))] = r
    print('\n## A4. The law layer on the band: the Gaussian-optimal rows of part (b), with their parameters fixed, in each class\n')
    print('| game | t | ' + ' | '.join(n for _, n in CLS) + ' | class value minus floor (plain 114/125; E3) |'); print('|---|---|' + '---|' * (len(CLS) + 1))
    for g, name in GAMES:
        for t in sorted(set(k[2] for k in B if k[0] == g)):
            v = [B.get((g, c, t), {}).get('value') for c, _ in CLS]
            d = lambda i: ('%+.1e' % (v[i] - v[0])) if v[i] is not None and v[0] is not None else '-'
            print('| %s | %g | %s | %s; %s |' % (g, t, ' | '.join('%.7f' % x if x is not None else '-' for x in v), d(2), d(4)))
