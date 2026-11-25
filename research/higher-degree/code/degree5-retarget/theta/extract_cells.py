#!/usr/bin/env python3
"""The content ratios found on each piece of D* (ledger 4.44), collected from the design run into one small file (N; lower bounds of
the largest ratio: the c = 4 three-cluster family per bin of chi, and the stored maximisers in 4 to 6 variables, possible responses only).
The ratios do not depend on the target.  usage: extract_cells.py DESIGN_DIR WORK(g078 of the design run; outside the repository) OUT.json"""
import json, os, sys
design, work, outp = sys.argv[1:4]; STORED = ['b2_gen5_5_u0.85_n6_free', 'b2_gen5_5_u0.85_n5_free', 'b2_rows_n4']
tab = json.load(open(os.path.join(design, 'tables', 'funded', 'fin_table_fundFull.json')))
chosen = {(tuple(c['piece']), c['row_tag']) for c in tab['chosen']}; res = []
for j, c in enumerate(sorted((c for c in tab['cases'] if (tuple(c['piece']), c['row_tag']) in chosen), key=lambda c: c['a']), 1):
    cells = []
    for q in json.load(open(os.path.join(work, 'out', 'ratio%s_c4.json' % c['name'])))['pts']:
        if q['possible']: cells.append(dict(src='c=4 clusters', u=q['u'], chi=q['chi'], bin=q['bin'], ratio=q['ratio']))
    for rf in STORED:
        p = os.path.join(work, 'out', 'reeval_band5%s_%s.json' % (c['name'], rf))
        for q in (json.load(open(p)) if os.path.exists(p) else []):
            if q['possible']: cells.append(dict(src='stored n=%d' % q['n'], u=q['u'], chi=q['chi'], ratio=q['ratio']))
    res.append(dict(j=j, name=c['name'], piece=c['piece'], row=c['row_tag'], n_cells_design=c.get('n_cells'), factor_fundFull=c.get('factor_per_cell'), cells=cells))
json.dump(res, open(outp, 'w'), indent=0); print(sum(len(r['cells']) for r in res), 'cells on', len(res), 'pieces')
