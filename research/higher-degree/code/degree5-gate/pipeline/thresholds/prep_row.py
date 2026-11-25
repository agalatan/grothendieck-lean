#!/usr/bin/env python3
"""Prepare one tuned row of a game for the allowance tools: exact profiles (prof2.py), margins, quintic share (gate/kappa_h.py).
claude-b9ee worker d5newcap, 17 Nov 2026.   usage: prep_row.py NAME E1 ETA t     (rows5.lines must hold the row)"""
import sys, os, json, subprocess, shutil
import numpy as np
here = os.path.dirname(os.path.abspath(__file__)); gate = os.path.join(here, '..', 'gate'); name, e1, eta = sys.argv[1:4]; t = float(sys.argv[4])
PY = os.environ.get('ALLOW_PY', sys.executable); os.chdir(os.path.join(here, 'games', name)); os.makedirs('out', exist_ok=True)
env = dict(os.environ, D5_E1=e1, D5_ETA=eta, OMP_NUM_THREADS='1', OPENBLAS_NUM_THREADS='1', MKL_NUM_THREADS='1', VECLIB_MAXIMUM_THREADS='1', RAYON_NUM_THREADS='1')
rows = [json.loads(l) for l in open('rows5.lines') if l.strip()]; k = [j for j, r in enumerate(rows, 1) if abs(r['t'] - t) < 1e-9][0]; r = rows[k - 1]
tk = ('%.4f' % t).replace('.', 'p'); one = 'row_%s.lines' % tk
open(one, 'w').write(json.dumps({k_: r[k_] for k_ in ('t', 'l', 'beta', 'bA', 'bB', 'sig', 'nu5', 'branch', 'row', 'plain', 'driver')}) + '\n')
pf = 'out/prof_t%s.npz' % tk
if not os.path.exists(pf):
    with open('out/prof2_t%s.log' % tk, 'a') as f: subprocess.run([PY, os.path.join(here, 'prof2.py'), str(k), '0,0', '0.4,0.3'], env=env, stdout=f, stderr=subprocess.STDOUT, check=True)
    shutil.copy('out/prof_%d.npz' % k, pf + '.tmp.npz'); os.replace(pf + '.tmp.npz', pf); shutil.copy('out/mu_%d.json' % k, 'out/mu_t%s.json' % tk)
kf = 'kappa_t%s.json' % tk
if not os.path.exists(kf):
    with open('out/kappa.log', 'a') as f: subprocess.run([PY, os.path.join(gate, 'kappa_h.py'), one, '1', kf + '.tmp'], env=env, stdout=f, stderr=subprocess.STDOUT, check=True)
    os.replace(kf + '.tmp', kf)
mu = json.load(open('out/mu_t%s.json' % tk)); kh = json.load(open(kf))
print('row t=%.3f ready: mu untilted %.4f, tilt (0.4, 0.3) %.4f; quintic share %.3f -> own kappa_AB %.3f' % (t, mu['tilts'][0]['mu'], mu['tilts'][1]['mu'], kh['kappa_h'], 1 - kh['kappa_h'] - 0.02), flush=True)
