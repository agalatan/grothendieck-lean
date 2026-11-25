#!/usr/bin/env python3
"""Quintic share along the one-spike family for one tuned row (gate/kappa_chi.py), filed as kappa_chi_t<t>.json (N).  claude-b9ee worker d5newcap.
usage: prep_chi.py NAME E1 ETA t"""
import sys, os, json, subprocess
here = os.path.dirname(os.path.abspath(__file__)); gate = os.path.join(here, '..', 'gate'); name, e1, eta = sys.argv[1:4]; t = float(sys.argv[4])
os.chdir(os.path.join(here, 'games', name)); tk = ('%.4f' % t).replace('.', 'p'); kf = 'kappa_chi_t%s.json' % tk
env = dict(os.environ, D5_E1=e1, D5_ETA=eta, OMP_NUM_THREADS='1', OPENBLAS_NUM_THREADS='1', MKL_NUM_THREADS='1', VECLIB_MAXIMUM_THREADS='1', RAYON_NUM_THREADS='1')
if not os.path.exists(kf):
    r = subprocess.run([os.environ.get('ALLOW_PY', sys.executable), os.path.join(gate, 'kappa_chi.py'), 'row_%s.lines' % tk, '1', kf + '.tmp'], env=env, capture_output=True, text=True)
    print(r.stdout.strip() + (('\n' + r.stderr.strip()[-400:]) if r.returncode else '')); os.replace(kf + '.tmp', kf)
d = json.load(open(kf)); print('row t=%.3f: quintic share along the spike family: %s' % (t, ' '.join('chi %.2g: %.3f' % (p['chi'], p['kappa_h']) for p in sorted(d['pts'], key=lambda p: p['chi']))), flush=True)
