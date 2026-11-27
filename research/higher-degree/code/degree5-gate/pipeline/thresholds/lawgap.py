#!/usr/bin/env python3
"""Law-layer gap of tuned rows with the s-dependent radius input (N, float LP).  claude-b9ee worker d5newcap, 17 Nov 2026.
For each t: the row's Gaussian-ideal value E(t) against the float law-layer value (rows/lawbundle.py, plain LP: moments +
E|q| <= B(s) ||q||; the Stein family is not used), at the row's own parameters (FIX_P=1).  gap = law value - Gaussian value;
a positive gap lowers the row's room by that much unless Stein covers remove it.
usage: lawgap.py NAME E1 ETA t-list"""
import sys, os, json, subprocess
here = os.path.dirname(os.path.abspath(__file__)); rowsdir = os.path.join(here, '..', 'rows'); name, e1, eta = sys.argv[1:4]
rows = {round(json.loads(l)['t'], 4): json.loads(l) for l in open(os.path.join(here, 'games', name, 'rows_all.lines')) if l.strip()}
tab = os.path.join(here, '..', 'radius', 'rho_table_N.json'); out = []
for t in [float(x) for x in sys.argv[4].split(',')]:
    r = rows[round(t, 4)]; nu = r['nu5']; nus = ','.join('%.4f' % max(0.0, nu + d) for d in (-0.008, -0.004, 0.0, 0.004, 0.008))
    env = dict(os.environ, D5_E1=e1, D5_ETA=eta, D5_RHO='93/100', D5_RHO_TABLE=tab, FIX_P='1', LAW_NUS=nus, OMP_NUM_THREADS='1', OPENBLAS_NUM_THREADS='1', VECLIB_MAXIMUM_THREADS='1', RAYON_NUM_THREADS='1')
    p = subprocess.run([os.environ.get('ALLOW_PY', sys.executable), os.path.join(rowsdir, 'lawbundle.py'), repr(t), repr(r['l']), repr(r['beta']), repr(r['bA']), repr(r['bB'])], env=env, capture_output=True, text=True)
    try:
        o = json.loads(p.stdout.strip().split('\n')[-1]); gap = o['value'] - r['row']; out.append(dict(t=t, gauss=r['row'], law=o['value'], gap=gap, at=o.get('lp_arg')))
        print('game %s t=%.3f: Gaussian row %.7f (room %.3e) | float law layer with B(s) %.7f at %s | gap %+.2e | room with the gap %.3e' % (name, t, r['row'], 500 / 701 - r['row'], o['value'], o.get('lp_arg'), gap, 500 / 701 - max(o['value'], r['row'])), flush=True)
    except Exception as ex:
        print('game %s t=%.3f: lawbundle failed: %s %s' % (name, t, ex, p.stderr[-300:]), flush=True)
json.dump(out, open(os.path.join(here, 'games', name, 'out', 'lawgap.json'), 'w'), indent=1)
