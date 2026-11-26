#!/usr/bin/env python3
"""The two-variable content ratio of the row tuned at t' on the energy band of a lower piece [a, .] (N).  claude-b9ee worker d5newcap.
usage: ratio_shift.py NAME E1 ETA a t'-list energies(cX = fraction of the cap of the piece)     (after shift3.py)"""
import sys, os, json, subprocess
here = os.path.dirname(os.path.abspath(__file__)); name, e1, eta = sys.argv[1:4]; a = float(sys.argv[4])
os.chdir(os.path.join(here, 'games', name)); rows = [json.loads(l) for l in open('rows5.lines') if l.strip()]
env = dict(os.environ, D5_E1=e1, D5_ETA=eta, OMP_NUM_THREADS='1', OPENBLAS_NUM_THREADS='1', MKL_NUM_THREADS='1', VECLIB_MAXIMUM_THREADS='1', RAYON_NUM_THREADS='1')
for tp in [float(x) for x in sys.argv[5].split(',')]:
    k = [j for j, r in enumerate(rows, 1) if abs(r['t'] - tp) < 1e-9][0]; tag = '_shift%g_%g' % (a, tp)
    if not os.path.exists('band%s.json' % tag): print('no band file for t\' = %g on the piece from %g' % (tp, a)); continue
    r = subprocess.run([os.environ.get('ALLOW_PY', sys.executable), os.path.join(here, 'ratio_game.py'), str(k), sys.argv[6], tag], env=dict(env, BAND_ROWS='band%s.json' % tag),
                       capture_output=True, text=True)
    print(('row of t\' = %g on the piece from %g:\n' % (tp, a)) + r.stdout.strip() + (('\n' + r.stderr.strip()[-600:]) if r.returncode else ''), flush=True)
