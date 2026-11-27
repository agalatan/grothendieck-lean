#!/usr/bin/env python3
"""wrapper: ratio_game.py for a row of a game folder (N).  usage: ratio_run.py NAME E1 ETA t-list energies   (claude-b9ee worker d5newcap)"""
import sys, os, json, subprocess
here = os.path.dirname(os.path.abspath(__file__)); name, e1, eta = sys.argv[1:4]
os.chdir(os.path.join(here, 'games', name)); rows = [json.loads(l) for l in open('rows5.lines') if l.strip()]
env = dict(os.environ, D5_E1=e1, D5_ETA=eta, OMP_NUM_THREADS='1', OPENBLAS_NUM_THREADS='1', MKL_NUM_THREADS='1', VECLIB_MAXIMUM_THREADS='1', RAYON_NUM_THREADS='1')
pin = os.environ.get('ALLOW_TASKSET'); pre = (['taskset', '-c', pin] if pin else [])
for t in [float(x) for x in sys.argv[4].split(',')]:
    k = [j for j, r in enumerate(rows, 1) if abs(r['t'] - t) < 1e-9][0]
    with open('out/ratio_%d.log' % k, 'a') as f:
        subprocess.run(pre + [os.environ.get('ALLOW_PY', sys.executable), os.path.join(here, 'ratio_game.py'), str(k), sys.argv[5]], env=env, stdout=f, stderr=subprocess.STDOUT, check=True)
    print(open('out/ratio_%d.log' % k).read().strip().split('\n')[-len(sys.argv[5].split(',')):], flush=True)
