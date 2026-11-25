#!/usr/bin/env python3
"""Tables of the gate computation of 25 November 2026 (issue #713) from the result files under results/ (standard library; N).
Games: gA = (0.8493, 0.2827) (the rounded optimum of the model), gB = (0.82, 0.194) (the ridge game), gC = (0.78, 0.0779)
(the capped game: the control), gA1 = (0.84896, 0.2818) and gA2 = (0.848, 0.2795) (small-t law rows only).
  1. the float envelope over t of the row bounds t^2 - 2 l t + C: Gaussian rows (the ideal), law rows in the plain class (moments and
     the radius 2287/2500), and at small t the rows re-tuned for the class with the scalar Stein family (lawbundle.py with
     STEIN_OPT=1: up to 8 bundle rounds against a local Stein oracle, then a wider scan; at t = 0 the zero row is kept, FIX_P=1);
     maximum, where, and the smallest room at the targets; a row is an upper bound whatever its parameters, so an envelope of non-optimal rows is an UPPER estimate of the envelope;
     the law values are grid programs: LOWER estimates of each row's law-layer supremum.
  2. band table (thresholds/band5.py: own rows, tilt (2/5, 3/10) of the record, own constant split): quintic share, kappa_AB, margins,
     band minimum of theta_room; comparators: the control gC and the recorded cap-0.81 game.
  3. A/B secant margins at the working tilt (2/5, 3/20) (design/margin_scan.py).
  4. funded per-cell allowances at the working tilt (stage4.py, design/r4_theta6.py) against the ratios recorded for the capped game.
usage: python3 -I summary.py"""
import os, json, glob, math
HERE = os.path.dirname(os.path.abspath(__file__)); R = os.path.join(HERE, 'results')
GAMES = {'gA': (0.8493, 0.2827), 'gB': (0.82, 0.194), 'gC': (0.78, 0.0779), 'gA1': (0.84896, 0.2818), 'gA2': (0.848, 0.2795)}
TG = [('1.402', 500 / 701), ('1.4025', 1 / 1.4025), ('1.403', 1 / 1.403)]
def lines(p): return [json.loads(l) for l in open(p) if l.strip().startswith('{')] if os.path.exists(p) else []
def lawrows(g):
    """the small-t and large-t law rows of game g, without the duplicate t = 0.70 of the large-t scan."""
    lw = lines(os.path.join(R, g, 'law.lines')); ts = {round(r['t'], 4) for r in lw}
    return lw, [r for r in lines(os.path.join(R, g, 'lawhi.lines')) if round(r['t'], 4) not in ts]
def env(rows, t0, t1, n=8863):
    """max over a grid of t in [t0, t1] of the smallest row bound; rows = [(label, l, C)]."""
    best = (-9, None, None)
    for i in range(n):
        t = t0 + (t1 - t0) * i / (n - 1); v, lab = min((t * t - 2 * l * t + C, lab) for lab, l, C in rows)
        if v > best[0]: best = (v, t, lab)
    return best
print('## 1. Envelopes (float)\n')
print('| game | rows used | maximum of the envelope | at t (binding row) | room at 1.402 | at 1.4025 | at 1.403 |'); print('|---|---|---|---|---|---|---|')
for g in ('gC', 'gB', 'gA', 'gA1', 'gA2'):
    gr = [('G%.3f' % r['t'], r['l'], r['row'] - r['t'] ** 2 + 2 * r['l'] * r['t']) for r in lines(os.path.join(R, g, 'rows_all.lines'))]
    lw, hi = lawrows(g)
    pl = [('L%.3f' % r['t'], r['l'], r['C']) for r in lw + hi]
    st = [('S%.3f' % r['t'], r['stein_opt']['l'], r['stein_opt']['C']) for r in lw if r.get('stein_opt')] + [('L%.3f' % r['t'], r['l'], r['C']) for r in hi]
    tu = [x for x in pl if float(x[0][1:]) >= 0.699]; t0 = min([float(x[0][1:]) for x in tu] or [0.7])
    t1 = max([float(x[0][1:]) for x in pl if float(x[0][1:]) <= 0.701] or [0.7])     # the small-t slice ends at its last row (0.70, or 0.60 for gC, gA1, gA2)
    for nm, rows, a, b in (('Gaussian rows, t in [0.70, 0.886]', gr, 0.70, 0.8862), ('law rows, plain class, tuned t in [%.2f, 0.886]' % t0, tu, t0, 0.8862),
                           ('law rows, plain class, small t in [0, %.2f]' % t1, [x for x in pl if float(x[0][1:]) <= 0.701], 0.0, t1),
                           ('law rows re-tuned for the Stein class, small t in [0, %.2f]' % t1, [x for x in st if float(x[0][1:]) <= 0.701], 0.0, t1)):
        if len(rows) < 2: continue
        v, t, lab = env(rows, a, b)
        print('| %s (%g, %g) | %s (%d rows) | %.7f | %.4f (%s) | %s |' % (g, GAMES[g][0], GAMES[g][1], nm, len(rows), v, t, lab, ' | '.join('%.2e' % (T - v) for _, T in TG)))
print('\nBetween the tuning points of the law rows (a grid of step 0.05 or 0.1 at small t) the envelope uses the neighbouring rows, so its small-t maxima\nare upper estimates; the row values at their own t below are the primary numbers. On t >= 0.86 the law grid falls BELOW the Gaussian row\n(it does not resolve the Gaussian point there), so only the Gaussian value counts on those rows.')
print('The small-t scan (law.lines, t = 0 to 0.70) and the large-t scan (lawhi.lines, t = 0.70 or 0.80 to 0.886) both ran t = 0.70 for gA and gB;\nthe row of the small-t scan (which has the Stein value) is used and the other dropped (they differ by at most 1.8e-5). The row 0.70 is the\nright end of the small-t slice [0, 0.70] and the left end of the tuned slice.')
print('\nrow values at their own t (Gaussian ideal | plain law class | re-tuned for the Stein class, with the change of l and the s of the final scan):\n')
print('| game | t | Gaussian row | law row, plain | law row, Stein class (re-tuned) | l(Stein) - l(plain) | s | plain minus 1/1.403 |'); print('|---|---|---|---|---|---|---|---|')
for g in ('gC', 'gB', 'gA', 'gA1', 'gA2'):
    G = {round(r['t'], 4): r['row'] for r in lines(os.path.join(R, g, 'rows_all.lines'))}
    lw, hi = lawrows(g)
    for r in sorted(lw + hi, key=lambda r: r['t']):
        s = r.get('stein_opt'); t = round(r['t'], 4)
        print('| %s | %g | %s | %.7f | %s | %s | %s | %+.2e |' % (g, r['t'], ('%.7f' % G[t]) if t in G else '-', r['value'], ('%.7f' % s['value']) if s else '-',
              ('%+.4f' % (s['l'] - r['l'])) if s else '-', ('%g' % s['arg_scan'][2]) if s else '-', r['value'] - 1 / 1.403))
print('\n## 2. Band table: own rows, tilt (2/5, 3/10), own constant split (thresholds/band5.py)\n')
print('| game | t | piece | room used (target of the run) | mu untilted -> tilt (0.4, 0.3) | quintic share kappa_h | kappa_AB own | band minimum of theta_room (at u/u*, chi) |'); print('|---|---|---|---|---|---|---|---|')
for g in ('gC', 'g081rec', 'gB', 'gA'):
    p = os.path.join(R, g, 'band5.json')
    if not os.path.exists(p): continue
    b = json.load(open(p))
    for tk, r in sorted(b['rows'].items()):
        bm = (r.get('band_own') or {}).get('min')
        print('| %s | %s | [%.4f, %.4f] | %.3e | %.4f -> %.4f | %s | %s | %s |' % (g, tk, r['active'][0], r['active'][1], r['room_used'], r['mu_untilted'], r['mu_tilt'], ('%.3f' % r['kappa_h']) if 'kappa_h' in r else '-',
              ('%.3f' % r['kappa_own']) if 'kappa_own' in r else '-', ('%.3f (%.3f, %s)' % (bm['theta_room'], bm['ufrac'], '%g' % bm['chi_room'] if bm.get('chi_room') else '-')) if bm and bm.get('theta_room') else 'none (no split left for the A/B shells)' if r.get('kappa_own', 1) <= 0.01 else '-'))
print('\n## 3. A/B secant margins at the working tilt (2/5, 3/20) (design/margin_scan.py; upper bounds of infima)\n')
print('| game | t | mu0 (second order) | mu_glob (smallest found at any amplitude) | ratio | at s, |rho| |'); print('|---|---|---|---|---|---|')
for g in ('gB', 'gA'):
    for f in sorted(glob.glob(os.path.join(R, g, 'margins', '*.json'))):
        m = json.load(open(f)); print('| %s | %g | %.4f | %.4f | %.2f | %.3f, %.3f |' % (g, m['t'], m['mu0'], m['mu_glob'], m['mu_glob'] / m['mu0'], m['glob_at']['s'], m['glob_at']['norm']))
print('\nrecorded for the capped game at the same tilt (ledger 4.43): 0.3577, 0.3899, 0.4208, 0.4283, 0.4358, 0.4398, 0.4493, 0.4650, 0.4792 on the rows 0.80, 0.82, 0.84, 0.845, 0.85, 0.855, 0.86, 0.87, 0.88, each equal to its second-order value.')
print('\n## 4. Funded allowances at the working tilt against the recorded largest ratios (stage4.py, design/r4_theta6.py)\n')
print('Allowance theta(u, chi) of the game\'s own row with the funded room (eta_h = 0 on every row: the quintic share is above the share the zero-content')
print('pairs need), the constant secant margin mu_glob of section 3 and the own split; ratios: the largest ratios recorded for the capped game on the')
print('case of the design with the same row (`../degree5-design/design-2026-11-25/tables/fin_table.json`, per energy u/u_cap), so the factors are')
print('estimates: the ratios of this game\'s own cubics were not computed (4.33: 8-10 % larger for the cap-0.81 game).\n')
FIN = json.load(open(os.path.join(HERE, '..', 'degree5-design', 'design-2026-11-25', 'tables', 'fin_table.json')))
def rec_case(t):
    cs = [c for c in FIN['cases'] if abs(c['tprime'] - t) < 1e-9 and c.get('per_energy')]
    return max(cs, key=lambda c: c['a']) if cs else None
print('| game | target | row t | room left | min theta over the grid (u/u_cap, chi) | factor, one constant per energy (recorded ratios) | recorded worst cell: ratio -> factor | capped game, same case: min theta / factor one constant / per cell |')
print('|---|---|---|---|---|---|---|---|')
for g in ('gB', 'gA'):
    for f in sorted(glob.glob(os.path.join(R, g, 'theta6', 'r4_theta6_1_F*.json'))):
        d = json.load(open(f)); tag = os.path.basename(f).split('_F')[1].split('_t')[0]; t = d['t'] if isinstance(d['t'], float) else float(d['t'])
        pts = [p for p in d['pts'] if p.get('theta_room')]
        if not pts: continue
        bm = min(pts, key=lambda p: p['theta_room']); c = rec_case(round(t, 3))
        fac = wc = '-'
        if c:
            fs = []
            for p in pts:
                q = [e for e in c['per_energy'] if abs(e['ucapfrac'] - p['ucapfrac']) < 1e-6]
                if q: fs.append(p['theta_room'] / q[0]['max_ratio'])
            fac = '%.2f' % min(fs) if fs else '-'
            w = c['worst_cell']; p = [p for p in pts if abs(p['ucapfrac'] - w['ucapfrac']) < 1e-6]
            if p:
                tc = sorted((float(k), v) for k, v in (p[0].get('theta_chi') or {}).items() if v and float(k) >= w['chi'] - 1e-9)
                if tc: wc = '%.3f (%s, chi %.1f) -> %.2f' % (w['ratio'], w['src'], w['chi'], tc[0][1] / w['ratio'])
        cc = ('%.3f / %.2f / %.2f' % (c['band_min'], c['factor_one_constant'], c['factor_per_cell'])) if c else '-'
        print('| %s | %s | %.3f | %.3e | %.3f (%.2f, %g) | %s | %s | %s |' % (g, tag, t, d['room'], bm['theta_room'], bm['ucapfrac'], bm['chi_room'], fac, wc, cc))
GATE = os.path.join(R, 'gate.md')
if os.path.exists(GATE): print('\n## 5. The model gate of 4.16 (gate/collect_gate.py, section "exact", per game)\n'); print(open(GATE).read())
