#!/usr/bin/env python3
"""Task C/D tables from the outputs of r4_theta6.py (PERCHI=1) and ratio_cluster.py (N).
For every case (piece of t covered by a tuned row) and margin model (mu = the record's pointwise margin, glob = constant secant margin,
lin = linear-in-amplitude margin):
  * "one constant": the band minimum of theta_room over the energies and chi computed, against the largest ratio of the record
    (RECORD below; ledger 4.28, 4.32) and against the largest ratio found here in the c = 4 three-cluster family over all bins;
  * "per chi": for each energy and chi-bin (lo, hi], the allowance theta(u, hi) (theta falls with chi on every case computed: the
    script checks it and uses the smaller of the two ends otherwise) against the largest ratio found in the bin
    (c = 4: actual cubics; c = 8: the floor law, an upper proxy); the safety factor of the case is the smallest quotient.
usage: build_table.py WORKDIR CASES.json OUT.json [title]"""
import sys, os, json, math
work, casesf, outf = sys.argv[1:4]; title = sys.argv[4] if len(sys.argv) > 4 else work
cases = json.load(open(casesf))
# largest ratios of the record, sector A (ledger 4.28, 4.32; PLAN section 3.2), keyed by (piece centre or published row, cover)
RECORD = {('f', 0.80, 0.82): (0.2363, 'six-variable maximiser re-evaluated (4.32)'), ('f', 0.78, 0.82): (0.2417, 'clusters 8,8,8 (4.32)'), ('f', 0.76, 0.81): (0.2167, 'clusters 8,8,8'),
          ('f', 0.74, 0.80): (0.1962, 'clusters 8,8,8'), ('f', 0.72, 0.79): (0.1749, 'clusters 8,8,8'), ('f', 0.70, 0.79): (0.1787, 'clusters 8,8,8 at 1.449 u* (0.1650 at 1.612 u*)'),
          ('f', 0.80, 0.80): (0.2761, 'n = 25 at 0.85 u* (4.28); 0.2505 at u*'), ('f', 0.78, 0.78): (0.350 / 1.53, 'allowance/factor of 4.32 (i)'), ('f', 0.76, 0.76): (0.233 / 1.17, '4.32 (i)'),
          ('f', 0.74, 0.74): (0.171, 'PLAN table (own row)'), ('f', 0.72, 0.72): (0.148, 'PLAN table'), ('f', 0.70, 0.70): (0.131, 'PLAN table'),
          ('pub', 0.80): (0.478 / 2.4, 'six-variable cubic, allowance/factor of 4.32 (ii)'), ('pub', 0.79): (0.381 / 2.1, '4.32 (ii)'), ('pub', 0.78): (0.288 / 1.76, '4.32 (ii)'),
          ('pub', 0.76): (0.190 / 1.41, '4.32 (ii)'), ('pub', 0.74): (0.140 / 1.22, '4.32 (ii)'), ('pub', 0.72): (0.104 / 1.09, '4.32 (ii)'), ('pub', 0.70): (0.0802, '4.32 (ii)'),
          ('own', 0.80): (0.2761, 'n = 25 at 0.85 u* (4.28)'), ('own', 0.82): (0.331, 'n <= 25 at 0.85 u* (4.28)'), ('own', 0.84): (0.418, '4.28'), ('own', 0.845): (0.447, '4.28'), ('own', 0.85): (0.482, '4.28'), ('own', 0.855): (0.524, '4.28')}
STORED = ['b2_gen5_5_u0.85_n6_free', 'b2_gen5_5_u0.85_n5_free', 'b2_rows_n4']
def key(cs):
    n = cs['name']; tp = round(cs['tprime'], 4)
    if n.endswith('_pub'): return ('pub', tp)
    if '_shift_' in n:
        a, b = [float(x) for x in n.split('_')[2:4]]; return ('f', round((a + b) / 2, 3), tp)
    return ('own', tp)
def load(p):
    return json.load(open(p)) if os.path.exists(p) else None
res = []
for cs in cases:
    k = key(cs); recr = RECORD.get(k); row = dict(case=cs['name'], key=k, tprime=cs['tprime'], room=cs['room'], tlo=cs['tlo'], mu_record=cs['mu_record'], mu_glob=cs['mu_glob'], b_fit=cs['b_fit'],
                                                  record_band_min=cs['record_band_min'], record_ratio=recr[0] if recr else None, record_ratio_source=recr[1] if recr else None, models={})
    rat = {c_: load(os.path.join(work, 'out', 'ratio%s_c%d.json' % (cs['name'], c_))) for c_ in (4, 8)}
    for c_ in (4, 8):
        if rat[c_]:
            ok = [p for p in rat[c_]['pts'] if p['possible']]
            row['max_ratio_c%d' % c_] = max((p['ratio'] for p in ok), default=None)
    for mod in ('mu', 'glob', 'lin'):
        d = load(os.path.join(work, 'out', 'r4_theta6_1%s_M%s.json' % (cs['name'], mod)))
        if not d: continue
        pts = [p for p in d['pts'] if p.get('theta_room')]
        if not pts: continue
        bm = min(pts, key=lambda p: p['theta_room']); m = dict(band_min=bm['theta_room'], at_ufrac=bm['ufrac'], at_chi=bm['chi_room'], margin_model=d.get('margin_model'))
        if recr: m['factor_record'] = bm['theta_room'] / recr[0]
        for c_ in (4, 8):
            if row.get('max_ratio_c%d' % c_): m['factor_one_constant_c%d' % c_] = bm['theta_room'] / row['max_ratio_c%d' % c_]
        # per chi
        for c_ in (4, 8):
            if not rat[c_]: continue
            worst = None; cells = []
            for p in pts:
                tc = {float(k_): v for k_, v in (p.get('theta_chi') or {}).items() if v}
                if not tc: continue
                for q in rat[c_]['pts']:
                    if abs(q['u'] - p['u']) > 2e-6 * max(1.0, p['u']) or not q['possible']: continue
                    lo, hi = q['bin']; hi_g = min(tc, key=lambda x: abs(x - min(hi, 42.0)))
                    cand = [v for x, v in tc.items() if lo - 1e-9 <= x <= hi_g + 1e-9] or [tc[hi_g]]
                    allow = min(cand); f = allow / q['ratio'] if q['ratio'] > 0 else float('inf')
                    cells.append(dict(ufrac=p['ufrac'], bin=q['bin'], chi_of_max=q['chi'], in_bin=q.get('in_bin', True), ratio=q['ratio'], allowance=allow, factor=f))
                    if worst is None or f < worst['factor']: worst = cells[-1]
            m['cells_c%d' % c_] = cells; m['worst_c%d' % c_] = worst
        # the stored maximisers of the content study re-evaluated on this case (thresholds/reeval_max.py): general cubics in 4, 5, 6 variables
        st = []; 
        for rf in STORED:
            dd = load(os.path.join(work, 'out', 'reeval_%s_%s.json' % (os.path.splitext(cs['band'])[0], rf)))
            for q in (dd or []):
                if not q['possible']: continue
                p = min(pts, key=lambda p_: abs(p_['ufrac'] - q['u_over_ustar']))
                if abs(p['ufrac'] - q['u_over_ustar']) > 2e-3: continue
                tc = {float(k_): v for k_, v in (p.get('theta_chi') or {}).items() if v}; up = [x for x in tc if x >= q['chi'] - 1e-9]
                if not up: continue
                allow = tc[min(up)]; st.append(dict(record=rf, n=q['n'], ufrac=q['u_over_ustar'], chi=q['chi'], ratio=q['ratio'], allowance=allow, allowance_at_chi=min(up), factor=allow / q['ratio']))
        m['stored'] = st; m['worst_stored'] = min(st, key=lambda x: x['factor']) if st else None
        m['theta_chi_at_min_energy'] = bm.get('theta_chi')
        row['models'][mod] = m
    res.append(row)
json.dump(res, open(outf, 'w'), indent=1)
f3 = lambda x: ('%.3f' % x) if x is not None else '-'
f2 = lambda x: ('%.2f' % x) if x is not None else '-'
print('### %s' % title)
print('| case (piece <- row) | room | mu / mu_glob / b | ONE CONSTANT: allowance mu / glob / lin | largest ratio: record; c=4 family here | factor with the record ratio: mu / glob / lin | PER CHI: smallest factor mu / glob / lin (c = 4 cubics) | at (u/u*, chi-bin, ratio, allowance) under lin | c = 8 floor proxy: smallest factor lin | stored 4-6 variable maximisers: smallest factor mu / glob / lin (n, chi, ratio, allowance under lin) |')
print('|---|---|---|---|---|---|---|---|---|---|')
for r in sorted(res, key=lambda r: (r['key'][0], -r['key'][1], r['tprime'])):
    M = r['models']; g = lambda mod, k_: (M.get(mod) or {}).get(k_)
    w = g('lin', 'worst_c4'); w8 = g('lin', 'worst_c8')
    name = ('published row %.3f on [%.4f, ...]' % (r['tprime'], r['tlo'] + 1e-4)) if r['key'][0] == 'pub' else (('piece %.2f <- row %.3f' % (r['key'][1], r['tprime'])) if r['key'][0] == 'f' else 'own row %.3f' % r['tprime'])
    ws = g('lin', 'worst_stored')
    print('| %s | %.2e | %.3f / %.3f / %.2f | %s / %s / %s | %s; %s | %s / %s / %s | %s / %s / %s | %s | %s | %s / %s / %s %s |' % (
        name, r['room'], r['mu_record'], r['mu_glob'], r['b_fit'], f3(g('mu', 'band_min')), f3(g('glob', 'band_min')), f3(g('lin', 'band_min')),
        f3(r['record_ratio']), f3(r.get('max_ratio_c4')), f2(g('mu', 'factor_record')), f2(g('glob', 'factor_record')), f2(g('lin', 'factor_record')),
        f2((g('mu', 'worst_c4') or {}).get('factor')), f2((g('glob', 'worst_c4') or {}).get('factor')), f2((w or {}).get('factor')),
        ('%.2f, (%g, %g], %.3f, %.3f' % (w['ufrac'], w['bin'][0], w['bin'][1], w['ratio'], w['allowance'])) if w else '-', f2((w8 or {}).get('factor')),
        f2((g('mu', 'worst_stored') or {}).get('factor')), f2((g('glob', 'worst_stored') or {}).get('factor')), f2((ws or {}).get('factor')), ('(n = %d, %.1f, %.3f, %.3f)' % (ws['n'], ws['chi'], ws['ratio'], ws['allowance'])) if ws else ''))
