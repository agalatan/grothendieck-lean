#!/usr/bin/env python3
"""Prints the constants of the design chosen by final_table.py in the notation of ASSEMBLY.md (rows and rooms exact; margins,
allowances and factors N).   usage: assembly_constants.py FIN_TABLE.json ENVELOPE_DESIGN.json WORK(game folder, for the float rows)"""
import sys, json, os
from fractions import Fraction as F
ft = json.load(open(sys.argv[1])); env = json.load(open(sys.argv[2])); work = sys.argv[3]
chosen = {(tuple(c['piece']), c['row_tag']) for c in ft['chosen']}; cases = [c for c in ft['cases'] if (tuple(c['piece']), c['row_tag']) in chosen]
rows5 = {round(r['t'], 4): r for f in ('rows_all.lines', '../g078hi/rows_all.lines') if os.path.exists(os.path.join(work, f)) for r in (json.loads(l) for l in open(os.path.join(work, f)) if l.strip())}
print('Design D*: game (1, -39/50, 779/10000); tilt (sigma_A, sigma_B) = (2/5, 3/20); t_1 = %s (targets %s); t_s = 649/1000.' % (', '.join('%.6f' % float(F(v)) for v in env['t_end'].values()), ', '.join('1/%.5f' % float(1 / F(k)) for k in env['t_end'])))
print('Direct bound (ledger 4.18 (a)): V <= %s t^2 + %s.' % (env['direct']['a'], env['direct']['b']))
print()
print('| j | piece [a_j, a_j+1] | row tuned at | l | beta | b_A | b_B | nu_5 (float row of the profile) | C_j (certified at rho0 = 2287/2500; decimal of the exact rational) | room at 500/701 | at 1/1.40195 | at 1/1.4021 | mu_0 = mu_g (N) | kappa_AB(chi) | min over the grid of theta_j(u, chi) (N) | smallest factor, per cell | smallest factor, one constant per energy |')
print('|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|')
dd = {(d['a'], d['b']): d for d in env['design']}
for j, c in enumerate(sorted(cases, key=lambda c: c['a']), 1):
    d = dd[(c['piece'][0], c['piece'][1])]; r = c['row']; fr = rows5.get(round(c['tprime'], 4), {})
    kap = c['kappa']; ks = ('%s .. %s (chi = 1 .. 42)' % (kap.split(',')[0].split(':')[1], kap.split(',')[-1].split(':')[1])) if isinstance(kap, str) else '%.4f' % kap
    print('| %d | [%.6f, %.6f] | %.3f | %s | %s | %s | %s | %s | %.10f | %.4e | %.4e | %.4e | %.4f | %s | %s | %.2f | %.2f |' % (j, c['a'], c['b'], c['tprime'], r['l'], r['beta'], r['bA'], r['bB'], ('%.7f' % fr['nu5']) if fr else '-',
          float(F(c['C'])), d['rooms'][0], d['rooms'][1], d['rooms'][2], c['mu'], ks, ('%.3f' % c['band_min']) if c['band_min'] < 49 else 'no bound needed ((F) suffices)', c['factor_per_cell'], c['factor_one_constant']))
print()
print('Exact piece ends and exact C_j: the fields "piece" and "C" of the chosen cases in %s; exact rooms: "rooms_exact" in %s.' % (os.path.basename(sys.argv[1]), os.path.basename(sys.argv[2])))
print('theta_j(u, chi) on the grid (u/cap in {0.60, 0.70, 0.78, 0.85, 0.92}, chi in {1, 2, 3, 4, 6, 8, 10, 12, 14, 16, 20, 24, 30, 36, 42}): the field "theta" of each chosen case; 50 means that no bound is needed in that cell.')
