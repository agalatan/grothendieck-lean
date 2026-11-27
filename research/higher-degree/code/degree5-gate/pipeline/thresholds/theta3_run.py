#!/usr/bin/env python3
"""wrapper: r4_theta3.py for rows of a game folder that has its own band_rows.json (N).  claude-b9ee worker d5newcap, 16 Nov 2026.
usage: theta3_run.py NAME E1 ETA k-list energies [tag] [bandfile]     (makes the exact profiles with prof2.py if they are missing)"""
import sys, os, json, subprocess
import numpy as np
here = os.path.dirname(os.path.abspath(__file__)); name, e1, eta = sys.argv[1:4]
tag = sys.argv[6] if len(sys.argv) > 6 else ''; band = sys.argv[7] if len(sys.argv) > 7 else 'band_rows.json'
os.chdir(os.path.join(here, 'games', name)); PY = os.environ.get('ALLOW_PY', sys.executable)
env = dict(os.environ, D5_E1=e1, D5_ETA=eta, BAND_ROWS=band, OMP_NUM_THREADS='1', OPENBLAS_NUM_THREADS='1', MKL_NUM_THREADS='1', VECLIB_MAXIMUM_THREADS='1', RAYON_NUM_THREADS='1')
for k in sys.argv[4].split(','):
    pf = 'out/prof_%s.npz' % k
    if os.path.exists(pf) and 'dGA' not in np.load(pf).files: os.replace(pf, 'out/prof_%s_spline.npz' % k)
    if not os.path.exists(pf):
        with open('out/prof2_%s.log' % k, 'a') as f: subprocess.run([PY, os.path.join(here, 'prof2.py'), k, '0,0', '0.4,0.3'], env=env, stdout=f, stderr=subprocess.STDOUT, check=True)
    r = subprocess.run([PY, os.path.join(here, 'r4_theta3.py'), k, sys.argv[5], '-', tag], env=env, capture_output=True, text=True)
    open('out/r4_theta3_%s%s.log' % (k, tag), 'a').write(r.stdout + r.stderr)
    print('game %s row %s (%s):\n%s' % (name, k, band, r.stdout.strip() + (('\n' + r.stderr.strip()[-500:]) if r.returncode else '')), flush=True)
