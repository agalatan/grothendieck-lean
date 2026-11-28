# Stage 0 (b): tables of the gate run (N).  A research worker of claude-b9ee, 28 Nov 2026.
#   usage: b_collect.py GATEB RECORD > tables.md
#     GATEB:  the run folder (mirror of mega:~/claude-b9ee-stage0/gateb), with thresholds/games/<g>/ and gate_<g>/out/
#     RECORD: research/higher-degree/code/degree5-gate  (results/ and pipeline/ctl/ of the run of 25-26 Nov)
# Prints: the control against the record; per game the sharing constant theta, the quintic share and the band minima;
# the main-term ratio sigma*^2/l^2 of ledger K 3.5a per row; the radius-only bound of the quintic gain.
import sys, os, json, math
G, R = sys.argv[1], sys.argv[2]
GAMES = [('gC', 0.78, 0.0779), ('g80', 0.80, 0.1364), ('g83', 0.83, 0.2241), ('g84', 0.84, 0.2552), ('gA2', 0.848, 0.2795), ('gA1', 0.84896, 0.2818), ('gA', 0.8493, 0.2827)]
def lines(p): return [json.loads(l) for l in open(p) if l.strip()] if os.path.exists(p) else []
def J(p):
    try: return json.load(open(p))
    except Exception: return None
def rows(g): return sorted(lines(os.path.join(G, 'thresholds/games/%s/rows_all.lines' % g)), key=lambda r: r['t'])
def spike(g, k):
    o = J(os.path.join(G, 'gate_%s/out/sp2_%d.json' % (g, k))); return o['pts'] if o else []
def stats(pts):
    """as gate/collect_gate.py ('exact') and gate/kappa_h.py: finite points with D > 0 only."""
    fin = [q for q in pts if q['D'] > 0 and all(math.isfinite(v) for v in q['groups'].values())]
    if not fin: return None
    out = dict(nonconcave=len(pts) - len(fin))
    exc = lambda q: sum(v for g, v in q['groups'].items() if g != 'const') - q['D'] - q['Vsl']
    out['theta'] = max(exc(q) / (q['m2'] * q['sig'] ** 4) for q in fin)
    h = lambda q: sum(v for g, v in q['groups'].items() if g not in ('H10/H01', 'const'))
    out['kappa_h'] = max(h(q) / (q['D'] + q['Vsl']) for q in fin); out['kappa_AB'] = max(q['groups']['H10/H01'] / (q['D'] + q['Vsl']) for q in fin)
    out['one'] = max((h(q) + q['groups']['H10/H01']) / (q['D'] + q['Vsl']) for q in fin)
    out['den_min'] = min(q['D'] + q['Vsl'] for q in fin); out['den_max'] = max(q['D'] + q['Vsl'] for q in fin)
    qm = max(fin, key=lambda q: h(q) / (q['D'] + q['Vsl'])); out['kh_at'] = (qm['c'], qm['sig']); out['kh_den'] = qm['D'] + qm['Vsl']
    out['groups_at'] = {g: v / (qm['D'] + qm['Vsl']) for g, v in qm['groups'].items() if g != 'const'}
    return out

print('## B1. Control against the record of 25-26 Nov\n')
for g, rec_rows, rec_band in (('gC', os.path.join(R, 'pipeline/ctl/g078_rows_all_recorded.lines'), os.path.join(R, 'pipeline/ctl/g078_band5_recorded.json')),
                              ('gA', os.path.join(R, 'results/gA/rows_all.lines'), os.path.join(R, 'results/gA/band5.json'))):
    new = {round(r['t'], 4): r for r in rows(g)}; old = {round(r['t'], 4): r for r in lines(rec_rows)}
    com = sorted(set(new) & set(old))
    if com:
        d = max(abs(new[t]['row'] - old[t]['row']) for t in com); tw = max(com, key=lambda t: abs(new[t]['row'] - old[t]['row']))
        print('- %s: %d rows in common with the record; largest difference of the row value %.1e (at t = %g: %.10f now, %.10f recorded)' % (g, len(com), d, tw, new[tw]['row'], old[tw]['row']))
        for t in com:
            if abs(new[t]['row'] - old[t]['row']) > 1e-7: print('  - t = %g: %.10f now, %.10f recorded (difference %.1e)' % (t, new[t]['row'], old[t]['row'], new[t]['row'] - old[t]['row']))
    nb = J(os.path.join(G, 'thresholds/games/%s/band5.json' % g)); ob = J(rec_band)
    if nb and ob:
        for t in sorted(set(nb['rows']) & set(ob['rows'])):
            a, b = nb['rows'][t], ob['rows'][t]
            s = '  - band row %s: quintic share %.6f now, %.6f recorded' % (t, a.get('kappa_h', float('nan')), b.get('kappa_h', float('nan')))
            if 'band_own' in a and 'band_own' in b: s += '; band minimum of theta_room %.5f now, %.5f recorded' % (a['band_own']['min']['theta_room'], b['band_own']['min']['theta_room'])
            print(s)
print()
print('## B2. The gate per game (exact coupled one-spike model, gate/spike2.py; points c in {0.1, 0.3, 0.6, 1} x sigma in {0.5, 0.9, 1, 1.1} sigma*)\n')
print('| game | t | row (Gaussian ideal) | theta | quintic share (gate points) | A/B share | one inequality | non-concave points | sigma*^2/l^2 (K 3.5a needs <= 1/6) |')
print('|---|---|---|---|---|---|---|---|---|')
ST = {}
for g, e1, eta in GAMES:
    for k, r in enumerate(rows(g), 1):
        st = stats(spike(g, k)); ST[(g, round(r['t'], 4))] = (st, r)
        if not st: continue
        print('| %s | %.3f | %.7f | %+.3f | %.3f | %.3f | %.3f | %d | %.3f |' % (g, r['t'], r['row'], st['theta'], st['kappa_h'], st['kappa_AB'], st['one'], st['nonconcave'], (r['sig'] / r['l']) ** 2))
print()
print('## B3. Quintic share on the band, as the record defines it (gate/kappa_h.py: c in {0.1, 0.3, 0.6, 1} x sigma in {0.9, 1, 1.1} sigma*) and the band minimum of theta_room\n')
print('| game | t | room used | quintic share kappa_h | kappa_AB own = 1 - kappa_h - 1/50 | band minimum of theta_room |')
print('|---|---|---|---|---|---|')
for g, e1, eta in GAMES:
    b = J(os.path.join(G, 'thresholds/games/%s/band5.json' % g))
    if not b: continue
    for t in sorted(b['rows'], key=float):
        x = b['rows'][t]; m = x.get('band_own', {}).get('min')
        print('| %s | %s | %.3e | %.3f | %.3f | %s |' % (g, t, x['room_used'], x.get('kappa_h', float('nan')), x.get('kappa_own', float('nan')), ('%.3f (u/u* %.3f, chi %g)' % (m['theta_room'], m['ufrac'], m['chi_room'])) if m else 'none (no split left for the A/B shells)'))
print()
print('## B4. An assumed quintic radius r: what it can and cannot change\n')
print('The share of B2/B3 is measured on explicit responses and does not contain r.  The only general consequence of E|q5| <= r ||q5||_2 for the row is the')
print('first-order bound 2 r ||G5||_2 on the two phase terms, hence a gain of at most eta r^2/(1 - c) for the whole quintic part (c = the curvature ratio,')
print('0 <= c < 1; c = 0 below).  Its ratio to the deficit D + V_sl of the gate points (smallest and largest over the finite points of the row):\n')
print('| game | t | D + V_sl (min .. max) | eta r^2/(D + V_sl): r = 0.999 | 0.95 | sqrt(pi)/2 | 0.80 | 0.70 | r for a ratio 0.35 at the largest D + V_sl |')
print('|---|---|---|---|---|---|---|---|---|')
for g, e1, eta in GAMES:
    for t in (0.80, 0.82, 0.84, 0.85, 0.86, 0.875):
        st, r = ST.get((g, t), (None, None))
        if not st: continue
        f = lambda rr: '%.0f .. %.0f' % (eta * rr * rr / st['den_max'], eta * rr * rr / st['den_min'])
        print('| %s | %.3f | %.2e .. %.2e | %s | %s | %s | %s | %s | %.4f |' % (g, t, st['den_min'], st['den_max'], f(0.999), f(0.95), f(math.sqrt(math.pi) / 2), f(0.8), f(0.7), math.sqrt(0.35 * st['den_max'] / eta)))
