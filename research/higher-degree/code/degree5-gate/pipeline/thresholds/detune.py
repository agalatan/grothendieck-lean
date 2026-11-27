#!/usr/bin/env python3
"""Does detuning a low band row raise its allowance?  (N)   claude-b9ee worker d5newcap, 16 Nov 2026.

A row is valid for any multipliers p = (l, beta, bA, bB); the optimal p* minimises the Gaussian-ideal row value R(p).  The
allowance theta_room(u) depends on p through the A/B margin mu, the deficit rate of the row potential and the profiles, at
first order, while the room falls only at second order: R(p* + d) - R(p*) = d^T H d / 2.
  1. H = Hessian of R at p* (central differences of the Danskin gradient of rows/rowfast.py); eigen-directions q_i, lam_i.
  2. probes p* +- a_i q_i with a_i = sqrt(2 loss0 / lam_i): each gives up loss0 of room (default 1e-4).
  3. allowances of the base row and of the 8 probes (allow_variant.py: exact profiles, mu, theta_room at the energies given).
  4. the gradient of log(min_u theta_room) in the scaled coordinates, and a line search along it (steps c = 1, 2, 3, 4:
     room given up about c^2 loss0).
usage: detune.py NAME E1 ETA t ROWS.lines [loss0] [energies] [steps]     (variants in thresholds/variants/NAME_*; log on stdout)
       env: ALLOW_PY, ALLOW_TASKSET as allow_variant.py"""
import sys, os, json, subprocess, time
here = os.path.dirname(os.path.abspath(__file__)); rowsdir = os.path.join(here, '..', 'rows')
name, e1, eta, t = sys.argv[1], sys.argv[2], sys.argv[3], float(sys.argv[4]); rowsfile = sys.argv[5]
loss0 = float(sys.argv[6]) if len(sys.argv) > 6 else 1e-4
ulist = sys.argv[7] if len(sys.argv) > 7 else 'c0.80,c0.84,c0.88'      # fractions of the response cap: the same absolute energies for every variant
steps = [float(x) for x in (sys.argv[8] if len(sys.argv) > 8 else '1,2,3,4').split(',')]
os.environ.update(D5_E1=e1, D5_ETA=eta, OMP_NUM_THREADS='1', OPENBLAS_NUM_THREADS='1', MKL_NUM_THREADS='1', VECLIB_MAXIMUM_THREADS='1', RAYON_NUM_THREADS='1', R4_ZERO='0')
sys.path.insert(0, rowsdir)
import numpy as np, d5eng2 as D, rowfast as RF
PY = os.environ.get('ALLOW_PY', sys.executable)
base = [json.loads(l) for l in open(rowsfile) if l.strip() and abs(json.loads(l)['t'] - t) < 1e-9][0]
p0 = np.array([base['l'], base['beta'], base['bA'], base['bB']])
gc = D.zgrid(npan=40, nq=8, nth=256, half=True)
H = np.zeros((4, 4)); hs = [2e-3, 2e-3, 2e-3, 2e-3]
for i in range(4):
    e = np.zeros(4); e[i] = hs[i]
    H[:, i] = (RF.fg(t, p0 + e, gc)[1] - RF.fg(t, p0 - e, gc)[1]) / (2 * hs[i])
H = (H + H.T) / 2; lam, Qm = np.linalg.eigh(H)
print('base row t=%.3f p* = %s value %.7f' % (t, np.round(p0, 5), base['row']))
print('Hessian eigenvalues %s' % np.round(lam, 4))
for i in range(4): print('  direction %d: lam %.4f  q = %s  step a = %.5f' % (i, lam[i], np.round(Qm[:, i], 3), np.sqrt(2 * loss0 / max(lam[i], 1e-3))), flush=True)
a = np.sqrt(2 * loss0 / np.maximum(lam, 1e-3))

def variant(tag, p):
    vd = os.path.join(here, 'variants', '%s_%s' % (name, tag)); fn = os.path.join(vd, 'allow.json')
    if not os.path.exists(fn):
        subprocess.run([PY, os.path.join(here, 'allow_variant.py'), '%s_%s' % (name, tag), e1, eta, repr(t), ','.join(repr(float(x)) for x in p), ulist],
                       check=True, stdout=subprocess.DEVNULL)
    d = json.load(open(fn)); th = d.get('theta_room', {})
    vals = [v for v in th.values() if v is not None]
    d['theta_min'] = min(vals) if vals and len(vals) == len(th) else None
    print('  %-8s p = %s | row %.7f room %.3e | mu %.4f -> tilt %.4f | u* %.5f cap/u* %.3f | theta_room %s | min %s  (%.0fs)' % (
        tag, np.round(p, 5), d['row'], d['room_used'], d['mu_untilted'], d['mu_tilt'], d.get('ustar', float('nan')), d.get('ucap_over_ustar', float('nan')),
        ' '.join('%s: %s' % (k, ('%.4f' % v) if v is not None else '-') for k, v in th.items()), ('%.4f' % d['theta_min']) if d['theta_min'] else '-', d['secs']), flush=True)
    return d

b = variant('base', p0); g = np.zeros(4); sym = np.zeros(4)
dirs = [int(x) for x in os.environ.get('DETUNE_DIRS', '0,1,2,3').split(',')]
for i in dirs:
    dp, dm = variant('d%dp' % i, p0 + a[i] * Qm[:, i]), variant('d%dm' % i, p0 - a[i] * Qm[:, i])
    if dp['theta_min'] and dm['theta_min'] and b['theta_min']:
        g[i] = (np.log(dp['theta_min']) - np.log(dm['theta_min'])) / 2; sym[i] = (np.log(dp['theta_min']) + np.log(dm['theta_min'])) / 2 - np.log(b['theta_min'])
print('gradient of log theta_min per probe step (each step = %.1e of room): %s ; symmetric parts %s' % (loss0, np.round(g, 4), np.round(sym, 4)))
gn = np.linalg.norm(g)
if gn > 0:
    gh = g / gn; print('direction in the scaled coordinates %s ; first-order gain per unit step %.4f' % (np.round(gh, 3), gn))
    best = (b['theta_min'], 0.0)
    for c in steps:
        d = variant('line%g' % c, p0 + sum(c * gh[i] * a[i] * Qm[:, i] for i in range(4)))
        if d['theta_min'] and d['theta_min'] > best[0]: best = (d['theta_min'], c)
    print('best on the line: theta_min %.4f at step %g (base %.4f): gain %+.1f %%' % (best[0], best[1], b['theta_min'], 100 * (best[0] / b['theta_min'] - 1)))
