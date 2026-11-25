#!/usr/bin/env python3
"""Table of the A/B secant margins from the outputs of margin_scan.py (N; mu_glob is an upper bound of the true infimum, b a lower
bound of the constant needed).   usage: margins_table.py MARGINDIR"""
import sys, os, json, glob
d = sys.argv[1]
def load(pat):
    out = {}
    for f in glob.glob(os.path.join(d, pat)):
        m = json.load(open(f)); out[round(m['t'], 4)] = m
    return out
A = load('m078_t*.json'); B = load('m078b_t*.json'); G = load('m077_t*.json')
print('| row tuned at | tilt (2/5, 3/10): mu0 (second order) | mu_glob (all amplitudes) | ratio | at (s, abs rho) | b fitted | tilt (2/5, 3/20): mu0 | mu_glob | env(tau) min over the scan |')
print('|---|---|---|---|---|---|---|---|---|')
for t in sorted(set(A) | set(B)):
    a, b = A.get(t), B.get(t)
    print('| %.3f | %s | %s | %s | %s | %s | %s | %s | %s |' % (t, ('%.4f' % a['mu0']) if a else '-', ('%.4f' % a['mu_glob']) if a else '-', ('%.2f' % (a['mu_glob'] / a['mu0'])) if a and a['mu0'] > 0 else '-',
          ('(%.2f, %.2f)' % (a['glob_at']['s'], a['glob_at']['norm'])) if a else '-', ('%.3f' % a['b_fit']) if a else '-',
          ('%.4f' % b['mu0']) if b else '-', ('%.4f' % min(b['mu_glob'], b['mu0'])) if b else '-', ('%.4f' % min(b['env'])) if b else '-'))
if G:
    print('\ngame (1, -0.77, 0.05), tilt (2/5, 3/10): ' + '; '.join('row %.2f: mu0 %.4f, mu_glob %.4f, b %.3f' % (t, m['mu0'], m['mu_glob'], m['b_fit']) for t, m in sorted(G.items())))
for f in sorted(glob.glob(os.path.join(d, 'tilt*078_t*.json'))):
    m = json.load(open(f)); print('\n%s (row %.2f): tilt -> mu0 / mu_glob: ' % (os.path.basename(f), m['t']) + '; '.join('(%.2f, %.2f) %.3f / %.3f' % (p['sA'], p['sB'], p['mu0'], p['mu_glob']) for p in m['pts']))
