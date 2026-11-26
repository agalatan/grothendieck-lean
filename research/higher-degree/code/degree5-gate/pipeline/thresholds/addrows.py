#!/usr/bin/env python3
"""Add Gaussian-ideal rows to a game folder (rows/rowscan.py) and rewrite rows5.lines sorted by t (N).  claude-b9ee worker d5newcap.
usage: addrows.py NAME E1 ETA t-list"""
import sys, os, json, subprocess
here = os.path.dirname(os.path.abspath(__file__)); rowsdir = os.path.join(here, '..', 'rows'); name, e1, eta = sys.argv[1:4]
PY = os.environ.get('ALLOW_PY', sys.executable); pin = os.environ.get('ALLOW_TASKSET'); pre = (['taskset', '-c', pin] if pin else [])
os.chdir(os.path.join(here, 'games', name)); os.makedirs('out', exist_ok=True)
env = dict(os.environ, D5_E1=e1, D5_ETA=eta, OMP_NUM_THREADS='1', OPENBLAS_NUM_THREADS='1', MKL_NUM_THREADS='1', VECLIB_MAXIMUM_THREADS='1', RAYON_NUM_THREADS='1')
have = [json.loads(l)['t'] for l in open('rows_all.lines') if l.strip()] if os.path.exists('rows_all.lines') else []
miss = [t for t in (float(x) for x in sys.argv[4].split(',')) if not any(abs(t - h) < 1e-9 for h in have)]
if miss:
    with open('out/rows.log', 'a') as f: subprocess.run(pre + [PY, os.path.join(rowsdir, 'rowscan.py'), 'rows_all.lines', ','.join('%g' % t for t in sorted(miss, reverse=True))], env=env, stdout=f, stderr=subprocess.STDOUT, check=True)
rows = sorted([json.loads(l) for l in open('rows_all.lines') if l.strip()], key=lambda r: r['t'])
open('rows5.lines', 'w').write('\n'.join(json.dumps({k: r[k] for k in ('t', 'l', 'beta', 'bA', 'bB', 'sig', 'nu5', 'branch', 'row', 'plain', 'driver')}) for r in rows) + '\n')
TGT = 500 / 701
for r in rows: print('t=%.3f row %.7f room at its own t %.3e  l=%.5f (slope E\' = %.4f) beta=%.5f bA=%.5f bB=%.5f sig*=%.4f nu5=%.5f gnorm %.1e' % (
    r['t'], r['row'], TGT - r['row'], r['l'], 2 * (r['t'] - r['l']), r['beta'], r['bA'], r['bB'], r['sig'], r['nu5'], r.get('gnorm', float('nan'))))
