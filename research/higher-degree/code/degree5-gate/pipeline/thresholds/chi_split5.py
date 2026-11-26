#!/usr/bin/env python3
"""What a split kappa_AB(chi) + kappa_h(chi) <= 1 that depends on the concentration does to the allowance (N, an ESTIMATE).
claude-b9ee worker d5newcap, 16-17 Nov 2026 (all sector weights: r4_theta5.py).   For rows of a game already treated by band5.py:
  1. gate/kappa_chi.py: the quintic share along the one-spike family as a function of chi = 42 c^4;
  2. kappa_AB(chi) = 1 - kappa_h(chi) - 0.02, with kappa_h(chi) the share at the nearest sampled chi BELOW (the share falls with
     chi on the family, so this is the conservative reading), piecewise linear in log chi between the samples;
  3. r4_theta5.py "band" with that kappa_AB(chi), next to the game's own constant split (band5.json).
The quintic lemma that would justify such a split (a bound on the quintic shells' gain that falls with the concentration)
does not exist; the family is one path through the cubics.  The output says how much is at stake.
usage: chi_split.py NAME E1 ETA t-list"""
import sys, os, json, subprocess, math
here = os.path.dirname(os.path.abspath(__file__)); gate = os.path.join(here, '..', 'gate'); name, e1, eta = sys.argv[1:4]
PY = os.environ.get('ALLOW_PY', sys.executable); pin = os.environ.get('ALLOW_TASKSET'); pre = (['taskset', '-c', pin] if pin else [])
os.chdir(os.path.join(here, 'games', name)); b4 = json.load(open('band5.json'))
env = dict(os.environ, D5_E1=e1, D5_ETA=eta, OMP_NUM_THREADS='1', OPENBLAS_NUM_THREADS='1', MKL_NUM_THREADS='1', VECLIB_MAXIMUM_THREADS='1', RAYON_NUM_THREADS='1')
CHI15 = [1.0, 2.0, 3.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0, 20.0, 24.0, 30.0, 36.0, 42.0]
for t in [float(x) for x in sys.argv[4].split(',')]:
    tk = ('%.4f' % t).replace('.', 'p'); kf = 'kappa_chi_t%s.json' % tk
    if not os.path.exists(kf):
        with open('out/kappa_chi.log', 'a') as f: subprocess.run(pre + [PY, os.path.join(gate, 'kappa_chi.py'), 'row_%s.lines' % tk, '1', kf], env=env, stdout=f, stderr=subprocess.STDOUT, check=True)
    pts = sorted(json.load(open(kf))['pts'], key=lambda p: p['chi'])
    def kh(chi):                      # share at the nearest sampled chi below (conservative), at least the running maximum to the right
        lower = [p for p in pts if p['chi'] <= chi + 1e-9]; right = [p['kappa_h'] for p in pts if p['chi'] >= chi - 1e-9]
        return max([lower[-1]['kappa_h'] if lower else pts[0]['kappa_h']] + right[:1])
    spec = ','.join('%g:%.4f' % (c, 1 - kh(c) - 0.02) for c in CHI15); tag = '_t%s_chi' % tk
    with open('out/r4_theta5%s.log' % tag, 'a') as f:
        subprocess.run(pre + [PY, os.path.join(here, 'r4_theta5.py'), '1', 'band', '-', tag], env=dict(env, BAND_ROWS='band5_t%s.json' % tk, KAPPA_CHI=spec), stdout=f, stderr=subprocess.STDOUT, check=True)
    d = json.load(open('out/r4_theta5_1%s.json' % tag)); bm = d['band_min']; x = b4['rows']['%.3f' % t]; own = x.get('band_own'); o82 = x.get('band_082')
    at = lambda pts_, f: next((p for p in pts_ if abs(p['ufrac'] - f) < 0.006), None)
    ser = lambda pts_, key='theta_room', ck='chi_room': ' / '.join(('%.3f (chi %s)' % (at(pts_, f)[key], '%g' % at(pts_, f)[ck] if at(pts_, f)[ck] else '-')) if at(pts_, f) and at(pts_, f)[key] else '-' for f in (0.85, 0.90, 1.0))
    print('game %s t=%.3f: quintic share along the spike family: %s' % (name, t, ' '.join('chi %.2g: %.3f' % (p['chi'], p['kappa_h']) for p in pts)))
    print('   kappa_AB(chi) used: %s' % spec)
    print('   chi-dependent split: band minimum %.3f at %.3f u* (chi %s); at 0.85 / 0.90 / 1.0 u*: %s' % (bm['theta_room'], bm['ufrac'], '%g' % bm['chi_room'] if bm['chi_room'] else '-', ser(d['pts'])))
    for nm, bb in (('own constant split', own), ('study split 0.82', o82)):
        if bb and bb.get('min'):
            print('   %s (kappa_AB %.3f): band minimum %.3f at %.3f u* (chi %s); at 0.85 / 0.90 / 1.0 u*: %s  -> the chi-dependent split is %+.1f %% at the band minimum' % (
                nm, bb['kappa'], bb['min']['theta_room'], bb['min']['ufrac'], '%g' % bb['min']['chi_room'] if bb['min']['chi_room'] else '-', ser(bb['pts'], 'theta_room', 'chi'), 100 * (bm['theta_room'] / bb['min']['theta_room'] - 1)), flush=True)
    x['band_chi'] = dict(kappa=spec, min=bm, pts=[dict(ufrac=p['ufrac'], theta_room=p['theta_room'], chi=p['chi_room']) for p in d['pts']], spike_family=pts)
    json.dump(b4, open('band5.json', 'w'), indent=1)
