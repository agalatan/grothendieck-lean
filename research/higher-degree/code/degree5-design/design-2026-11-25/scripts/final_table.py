#!/usr/bin/env python3
"""Task D: safety factors of the design candidates written by design_final.py, and the best assignment (N; rooms exact).
For every case (piece [a, b] <- row t'): the allowance theta(u, chi) of the model named (r4_theta6.py, PERCHI) at the energies computed;
  one constant:  band minimum (over u and chi) / largest ratio found here (c = 4 three-cluster family over all bins and energies, and the
                 stored 4-6 variable maximisers of the content study re-evaluated at the tilt), possible responses only;
  per (u, chi):  the smallest quotient allowance(u, chi-bin upper end, or the next grid chi above the cubic's chi) / ratio over the same
                 cubics; this is the safety factor of the content law posed per cell (ASSEMBLY.md, H6).
The best row of a piece is the one with the largest per-cell safety factor; the assignment is written as a design file for
envelope_design.py.   usage: final_table.py WORK CASES.json[,CASES2.json] MODEL OUT_PREFIX [fixed "a:t',a:t'" to force rows]"""
import sys, os, json
from fractions import Fraction as F
work, casefiles, model, outp = sys.argv[1:5]; forced = {round(float(x.split(':')[0]), 4): round(float(x.split(':')[1]), 4) for x in sys.argv[5].split(',')} if len(sys.argv) > 5 and sys.argv[5] else {}
STORED = ['b2_gen5_5_u0.85_n6_free', 'b2_gen5_5_u0.85_n5_free', 'b2_rows_n4']
load = lambda p: json.load(open(p)) if os.path.exists(p) else None
res = []
for cf in casefiles.split(','):
    for cs in json.load(open(cf)):
        row = dict(piece=cs['piece'], a=float(F(cs['piece'][0])), b=float(F(cs['piece'][1])), tprime=cs['tprime'], row_tag=cs['row_tag'], row=cs['row'], C=cs['C'], room=cs['room'], room_exact=cs['room_exact'], skipped=cs.get('skipped'))
        if cs.get('skipped'): res.append(row); continue
        row.update(mu=cs['mu_glob'], mu0=cs['mu_record'], b_fit=cs['b_fit'], kappa=cs['kappa'], ucap=cs['ucap'], name=cs['name'])
        d = load(os.path.join(work, 'out', 'r4_theta6_1%s_M%s.json' % (cs['name'], model)))
        pts = [p for p in (d or {}).get('pts', []) if p.get('theta_room')]
        if not pts: row['missing'] = True; res.append(row); continue
        bm = min(pts, key=lambda p: p['theta_room']); row.update(band_min=bm['theta_room'], band_min_at=dict(ucapfrac=bm['ucapfrac'], ufrac=bm['ufrac'], chi=bm['chi_room']))
        row['theta'] = [dict(ucapfrac=p['ucapfrac'], u=p['u'], theta_chi=p.get('theta_chi')) for p in pts]
        cells = []
        rat = load(os.path.join(work, 'out', 'ratio%s_c4.json' % cs['name']))
        for q in (rat or {}).get('pts', []):
            if not q['possible']: continue
            p = min(pts, key=lambda p_: abs(p_['u'] - q['u']))
            if abs(p['u'] - q['u']) > 1e-5 * max(p['u'], 1e-9) + 1e-9: continue
            tc = {float(k_): v for k_, v in (p.get('theta_chi') or {}).items() if v}; lo, hi = q['bin']
            cand = [v for x, v in tc.items() if lo - 1e-9 <= x <= min(hi, 42.0) + 1e-9] or [v for x, v in tc.items() if x >= q['chi']][:1]
            if not cand: continue
            cells.append(dict(src='c=4 clusters', ucapfrac=p['ucapfrac'], chi=q['chi'], bin=q['bin'], ratio=q['ratio'], allowance=min(cand), factor=min(cand) / q['ratio']))
        for rf in STORED:
            for q in (load(os.path.join(work, 'out', 'reeval_%s_%s.json' % (os.path.splitext(cs['band'])[0], rf))) or []):
                if not q['possible']: continue
                p = min(pts, key=lambda p_: abs(p_['u'] - q['u']))
                if abs(p['u'] - q['u']) > 1e-4 * max(p['u'], 1e-9) + 1e-9: continue
                tc = {float(k_): v for k_, v in (p.get('theta_chi') or {}).items() if v}; up = sorted(x for x in tc if x >= q['chi'] - 1e-9)
                if not up: continue
                cells.append(dict(src='stored n=%d' % q['n'], ucapfrac=p['ucapfrac'], chi=q['chi'], ratio=q['ratio'], allowance=tc[up[0]], factor=tc[up[0]] / q['ratio']))
        row['n_cells'] = len(cells)
        if cells:
            mr = max(cells, key=lambda c: c['ratio']); w = min(cells, key=lambda c: c['factor'])
            # one constant per ENERGY (the posing of ledger 4.29-4.32): theta_room(u) = min over chi, against the largest ratio found at that energy
            per_u = []
            for p in pts:
                rr = [c for c in cells if abs(c['ucapfrac'] - p['ucapfrac']) < 1e-6]
                if rr: m_ = max(rr, key=lambda c: c['ratio']); per_u.append(dict(ucapfrac=p['ucapfrac'], theta_room=p['theta_room'], chi_binding=p['chi_room'], max_ratio=m_['ratio'], src=m_['src'], chi=m_['chi'], factor=p['theta_room'] / m_['ratio']))
            w1 = min(per_u, key=lambda x: x['factor'])
            row.update(max_ratio=mr['ratio'], max_ratio_src=mr['src'], max_ratio_chi=mr['chi'], per_energy=per_u, worst_energy=w1, factor_one_constant=w1['factor'], worst_cell=w, factor_per_cell=w['factor'])
        res.append(row)
pieces = sorted(set((r['a'], r['b']) for r in res)); design = []
print('| piece of t | row tuned at | room at 500/701 (exact, printed to 4 digits) | mu (constant secant margin, N) | band minimum of the allowance (at u/cap, chi) | largest ratio found (source, chi) | ONE CONSTANT PER ENERGY: smallest factor (at u/cap: allowance / ratio) | PER CELL (u, chi): smallest factor | at (source, u/cap, chi, ratio, allowance) | chosen |')
print('|---|---|---|---|---|---|---|---|---|---|')
for a, b in pieces:
    cand = [r for r in res if (r['a'], r['b']) == (a, b)]; ok = [r for r in cand if r.get('factor_per_cell')]
    if round(a, 4) in forced: best = next((r for r in ok if abs(r['tprime'] - forced[round(a, 4)]) < 1e-9), None)
    else: best = max(ok, key=lambda r: r['factor_per_cell']) if ok else None
    for r in sorted(cand, key=lambda r: r['tprime']):
        if r.get('skipped') or r.get('missing'):
            print('| [%.4f, %.4f] | %.3f | %.3e | %s | | | | | | |' % (a, b, r['tprime'], r['room'], 'no room' if r.get('skipped') == 'room' else (r.get('skipped') or 'no result'))); continue
        w = r.get('worst_cell')
        print('| [%.4f, %.4f] | %.3f | %.3e | %.4f | %.3f (%.2f, %s) | %s | %s | %s | %s | %s |' % (a, b, r['tprime'], r['room'], r['mu'], r['band_min'], r['band_min_at']['ucapfrac'], '%g' % r['band_min_at']['chi'] if r['band_min_at']['chi'] else '-',
              ('%.3f (%s, %.1f)' % (r['max_ratio'], r['max_ratio_src'], r['max_ratio_chi'])) if r.get('max_ratio') else '-', ('%.2f (%.2f: %.3f / %.3f)' % (r['factor_one_constant'], r['worst_energy']['ucapfrac'], r['worst_energy']['theta_room'], r['worst_energy']['max_ratio'])) if r.get('factor_one_constant') else '-',
              ('**%.2f**' % r['factor_per_cell']) if r.get('factor_per_cell') else '-', ('%s, %.2f, %.1f, %.3f, %.3f' % (w['src'], w['ucapfrac'], w['chi'], w['ratio'], w['allowance'])) if w else '-', 'yes' if r is best else ''))
    if best: design.append(best)
if design:
    wk = min(design, key=lambda r: r['factor_per_cell']); wk1 = min(design, key=lambda r: r['factor_one_constant'])
    print('\nchosen assignment: weakest piece PER CELL [%.4f, %.4f] <- row %.3f with factor %.2f; weakest piece with ONE CONSTANT per piece [%.4f, %.4f] <- row %.3f with factor %.2f; smallest room %.3e' % (
        wk['a'], wk['b'], wk['tprime'], wk['factor_per_cell'], wk1['a'], wk1['b'], wk1['tprime'], wk1['factor_one_constant'], min(r['room'] for r in design)))
json.dump(dict(model=model, cases=res, chosen=[dict(piece=r['piece'], tprime=r['tprime'], row_tag=r['row_tag']) for r in design]), open(outp + '.json', 'w'), indent=1)
json.dump(dict(name=os.path.basename(outp), pieces=[[r['piece'][0], r['piece'][1], r['row_tag']] for r in design]), open(outp + '.design.json', 'w'), indent=1)
