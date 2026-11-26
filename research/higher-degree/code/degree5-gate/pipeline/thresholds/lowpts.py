#!/usr/bin/env python3
"""More energies for one cover already treated by shift5.py (same band file, same kappa_AB(chi), same room): the allowance
below the range scanned there (N).  claude-b9ee worker d5newcap, 17 Nov 2026.
usage: lowpts.py NAME E1 ETA a b t' energies(e.g. c0.3,c0.4,c0.5,c0.6) FTAG(e.g. _f0p80)"""
import sys, os, json, subprocess
here = os.path.dirname(os.path.abspath(__file__)); name, e1, eta = sys.argv[1:4]; a, b, tp = float(sys.argv[4]), float(sys.argv[5]), float(sys.argv[6]); en, ftag = sys.argv[7], sys.argv[8]
os.chdir(os.path.join(here, 'games', name)); tk = ('%.4f' % tp).replace('.', 'p'); tag = '_shift_%g_%g_t%s%s' % (a, b, tk, ftag)
rec = [r for r in json.load(open('out/shift5_%g_%g%s.json' % (a, b, ftag))) if abs(r['tprime'] - tp) < 1e-9][0]
env = dict(os.environ, D5_E1=e1, D5_ETA=eta, BAND_ROWS='band5%s.json' % tag, KAPPA_AB=repr(rec['kappa']), OMP_NUM_THREADS='1', OPENBLAS_NUM_THREADS='1', MKL_NUM_THREADS='1', RAYON_NUM_THREADS='1')
if rec.get('kappa_chi'): env['KAPPA_CHI'] = rec['kappa_chi']
r = subprocess.run([os.environ.get('ALLOW_PY', sys.executable), os.path.join(here, 'r4_theta5.py'), '1', en, '-', tag + '_low'], env=env, capture_output=True, text=True)
open('out/r4_theta5%s_low.log' % tag, 'w').write(r.stdout + r.stderr); print(r.stdout.strip() + (('\n' + r.stderr.strip()[-400:]) if r.returncode else ''), flush=True)
