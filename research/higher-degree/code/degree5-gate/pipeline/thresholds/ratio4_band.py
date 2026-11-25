#!/usr/bin/env python3
"""The two-variable content ratio for the configuration of a band file (a row on its own piece or a shifted row) (N).
claude-b9ee worker d5newcap.   usage: ratio4_band.py NAME E1 ETA BANDFILE energies(cX = fraction of the cap of the piece, or u/u*)"""
import sys, os, subprocess
here = os.path.dirname(os.path.abspath(__file__)); name, e1, eta, band, en = sys.argv[1:6]
os.chdir(os.path.join(here, 'games', name))
env = dict(os.environ, D5_E1=e1, D5_ETA=eta, BAND_ROWS=band, OMP_NUM_THREADS='1', OPENBLAS_NUM_THREADS='1', MKL_NUM_THREADS='1', VECLIB_MAXIMUM_THREADS='1', RAYON_NUM_THREADS='1')
tag = '_' + os.path.splitext(band)[0]
r = subprocess.run([os.environ.get('ALLOW_PY', sys.executable), os.path.join(here, 'ratio_game.py'), '1', en, tag], env=env, capture_output=True, text=True)
open('out/ratio%s.log' % tag, 'a').write(r.stdout + r.stderr)
print('game %s, %s:\n%s' % (name, band, r.stdout.strip() + (('\n' + r.stderr.strip()[-500:]) if r.returncode else '')), flush=True)
