#!/usr/bin/env python3
"""queue helper: run a python script with environment variables given on the command line (claude-b9ee worker d5newcap).
usage: envrun.py VAR=VAL ... [LOG=path] -- script.py args...     (paths relative to this folder; single-threaded BLAS forced)"""
import sys, os, subprocess
here = os.path.dirname(os.path.abspath(__file__)); i = sys.argv.index('--')
env = dict(os.environ, OMP_NUM_THREADS='1', OPENBLAS_NUM_THREADS='1', MKL_NUM_THREADS='1', VECLIB_MAXIMUM_THREADS='1', RAYON_NUM_THREADS='1'); log = None; cwd = here
for a in sys.argv[1:i]:
    k, v = a.split('=', 1)
    if k == 'LOG': log = os.path.join(here, v)
    elif k == 'CWD': cwd = os.path.join(here, v)      # working directory of the script (relative to this folder)
    else: env[k] = v.replace('@HERE', here)
cmd = [sys.executable, os.path.join(here, sys.argv[i + 1])] + sys.argv[i + 2:]
if log:
    with open(log, 'a') as f: sys.exit(subprocess.run(cmd, env=env, stdout=f, stderr=subprocess.STDOUT, cwd=cwd).returncode)
sys.exit(subprocess.run(cmd, env=env, cwd=cwd).returncode)
