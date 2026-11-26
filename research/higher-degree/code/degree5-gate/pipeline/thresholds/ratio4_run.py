#!/usr/bin/env python3
"""The two-variable content ratio (families + shared-driver class) of rows of a game treated by band4.py (N).  claude-b9ee worker d5newcap.
usage: ratio4_run.py NAME E1 ETA t-list energies"""
import sys, os, json, subprocess
here = os.path.dirname(os.path.abspath(__file__)); name, e1, eta = sys.argv[1:4]
os.chdir(os.path.join(here, 'games', name))
env = dict(os.environ, D5_E1=e1, D5_ETA=eta, OMP_NUM_THREADS='1', OPENBLAS_NUM_THREADS='1', MKL_NUM_THREADS='1', VECLIB_MAXIMUM_THREADS='1', RAYON_NUM_THREADS='1')
pin = os.environ.get('ALLOW_TASKSET'); pre = (['taskset', '-c', pin] if pin else [])
for t in [float(x) for x in sys.argv[4].split(',')]:
    tk = ('%.4f' % t).replace('.', 'p')
    r = subprocess.run(pre + [os.environ.get('ALLOW_PY', sys.executable), os.path.join(here, 'ratio_game.py'), '1', sys.argv[5], '_t' + tk], env=dict(env, BAND_ROWS='band4_t%s.json' % tk), capture_output=True, text=True)
    open('out/ratio_t%s.log' % tk, 'a').write(r.stdout + r.stderr)
    print('game %s:\n%s' % (name, r.stdout.strip() + (('\n' + r.stderr.strip()[-500:]) if r.returncode else '')), flush=True)
