#!/usr/bin/env python3
"""A piece [a, b] of t covered by the row tuned at another t' (a "shifted" row): room there, and the minimum over the energy
band of theta_room with its energy and binding chi (N).   claude-b9ee worker d5newcap, 16-17 Nov 2026 (all sector weights: r4_theta5.py).
The row tuned at t' (parameters p(t'), Gaussian-ideal value E(t')) is valid at every t; its line is
E(t') + 2 (t' - l)(t - t') + (t - t')^2.  Used on [a, b]: room = 500/701 - max(line(a), line(b)) - 1.5e-5; its possible
responses satisfy (R1) at t_lo = a - 1e-4 and the cap 4 e1^2 B (A - t_lo), so its energy band reaches cap(a), far above u*(t')
when a is well below t'.  Profiles, mu, u*(t'), V_sl and the quintic share (own kappa_AB) are those of the row t'.
usage: shift5.py NAME E1 ETA a b t'-list [kappa: own | number | cached:number | chi]     env: LAW_GAP_FILE, ROOM_OVERRIDE, SHIFT_TAG, BAND_FMIN      (after band5.py: needs rows5.lines)
       -> games/NAME/out/shift5_<a>_<b>.json; one line per t'"""
import sys, os, json, subprocess, shutil
here = os.path.dirname(os.path.abspath(__file__)); gate = os.path.join(here, '..', 'gate'); name, e1, eta = sys.argv[1:4]; a, b = float(sys.argv[4]), float(sys.argv[5])
tps = [float(x) for x in sys.argv[6].split(',')]; kmode = sys.argv[7] if len(sys.argv) > 7 else 'own'
PY = os.environ.get('ALLOW_PY', sys.executable); pin = os.environ.get('ALLOW_TASKSET'); pre = (['taskset', '-c', pin] if pin else [])
os.chdir(os.path.join(here, 'games', name)); import numpy as np
env = dict(os.environ, D5_E1=e1, D5_ETA=eta, OMP_NUM_THREADS='1', OPENBLAS_NUM_THREADS='1', MKL_NUM_THREADS='1', VECLIB_MAXIMUM_THREADS='1', RAYON_NUM_THREADS='1')
def run(cmd, log, extra=None):
    with open(log, 'a') as f: subprocess.run(pre + cmd, env=dict(env, **(extra or {})), stdout=f, stderr=subprocess.STDOUT, check=True)
rows = [json.loads(l) for l in open('rows5.lines') if l.strip()]; TGT = 500 / 701; loss = float(os.environ.get('ROOM_LOSS', 1.5e-5)); res = []
tkey = lambda t: ('%.4f' % t).replace('.', 'p')
outf = 'out/shift5_%g_%g%s.json' % (a, b, os.environ.get('SHIFT_TAG', ''))
if os.path.exists(outf) and os.environ.get('SHIFT_REDO') != '1':                   # a finished result is not recomputed (two pools may hold the same job)
    try:
        done_ = json.load(open(outf))
        if all(any(abs(d_['tprime'] - tp_) < 1e-9 and ('band_min' in d_ or d_.get('room', 1) <= 0) for d_ in done_) for tp_ in tps):
            print('already done: %s' % outf); sys.exit(0)
    except Exception: pass
for tp in tps:
    k = [j for j, r in enumerate(rows, 1) if abs(r['t'] - tp) < 1e-9][0]; r = rows[k - 1]; tk = tkey(tp)
    line = lambda x: r['row'] + 2 * (tp - r['l']) * (x - tp) + (x - tp) ** 2
    gap = 0.0
    if os.environ.get('LAW_GAP_FILE'):                       # the row's law-layer gap (float LP with B(s)): a constant added to the row's line
        gaps = {round(g_['t'], 4): g_['gap'] for g_ in json.load(open(os.environ['LAW_GAP_FILE']))}; gap = max(gaps[round(tp, 4)], 0.0)
    room = TGT - max(line(a), line(b)) - gap - loss; rec = dict(tprime=tp, piece=[a, b], room=room, law_gap=gap, room_at_a=TGT - line(a) - gap, room_at_b=TGT - line(b) - gap)
    if os.environ.get('ROOM_OVERRIDE'):                      # a certified room given from outside (e.g. the published one), instead of the Gaussian-ideal line
        rec['room_gaussian_line'] = room; room = float(os.environ['ROOM_OVERRIDE']); rec['room'] = room; rec['room_override'] = True
    if room <= 0:
        print('piece [%.4f, %.4f] by the row tuned at %.3f: NOT POSSIBLE, the row exceeds the target there (room %.2e)' % (a, b, tp, room), flush=True); res.append(rec); continue
    one = 'row_%s.lines' % tk; open(one, 'w').write(json.dumps({k_: r[k_] for k_ in ('t', 'l', 'beta', 'bA', 'bB', 'sig', 'nu5', 'branch', 'row', 'plain', 'driver')}) + '\n')
    pf = 'out/prof_t%s.npz' % tk
    if not os.path.exists(pf):
        oldp = 'out/prof_%d.npz' % k; ok = False
        if os.path.exists(oldp) and os.path.exists('out/mu_%d.json' % k):
            d0 = np.load(oldp); ok = 'dGA' in d0.files and abs(json.loads(str(d0['rec']))['t'] - tp) < 1e-9
        if not ok: run([PY, os.path.join(here, 'prof2.py'), str(k), '0,0', '0.4,0.3'], 'out/prof2_t%s.log' % tk)
        shutil.copy(oldp, pf); shutil.copy('out/mu_%d.json' % k, 'out/mu_t%s.json' % tk)
    mu = {(x['s'], x['t']): x for x in json.load(open('out/mu_t%s.json' % tk))['tilts']}[(0.4, 0.3)]['mu']
    kf = 'kappa_t%s.json' % tk; kchi = None
    if kmode == 'chi':                                       # kappa_AB(chi) = 1 - (quintic share along the one-spike family at the nearest sampled chi below) - 0.02
        pts_ = sorted(json.load(open('kappa_chi_t%s.json' % tk))['pts'], key=lambda p_: p_['chi'])
        def kh_(chi):
            lower = [p_ for p_ in pts_ if p_['chi'] <= chi + 1e-9]; right = [p_['kappa_h'] for p_ in pts_ if p_['chi'] >= chi - 1e-9]
            return max([lower[-1]['kappa_h'] if lower else pts_[0]['kappa_h']] + right[:1])
        kchi = ','.join('%g:%.4f' % (c_, 1 - kh_(c_) - 0.02) for c_ in (1, 2, 3, 4, 6, 8, 10, 12, 14, 16, 20, 24, 30, 36, 42))
        kap = round(1 - max(p_['kappa_h'] for p_ in pts_) - 0.02, 4)        # the constant own split, for the record
    elif kmode == 'own' or (kmode.startswith('cached:') and os.path.exists(kf)):
        if not os.path.exists(kf): run([PY, os.path.join(gate, 'kappa_h.py'), one, '1', kf], 'out/kappa.log')
        kap = round(1 - json.load(open(kf))['kappa_h'] - 0.02, 4)
    else: kap = float(kmode.split(':')[-1])           # 'cached:0.869' = the row's own split if it has been computed, else this value
    tag = '_shift_%g_%g_t%s%s' % (a, b, tk, os.environ.get('SHIFT_TAG', '')); bandf = 'band5%s.json' % tag
    json.dump(dict(tilt=[0.4, 0.3], rows={'1': dict(t='%.3f' % tp, mu=mu, tlo=a - 1e-4, room=room, prof=pf)}), open(bandf, 'w'), indent=1)
    run([PY, os.path.join(here, 'r4_theta5.py'), '1', 'band', '-', tag], 'out/r4_theta5%s.log' % tag, dict(BAND_ROWS=bandf, KAPPA_AB=repr(kap), BAND_FMIN=os.environ.get('BAND_FMIN', '0.90'), **({'KAPPA_CHI': kchi} if kchi else {})))
    d = json.load(open('out/r4_theta5_1%s.json' % tag)); bm = d['band_min']
    rec.update(mu=mu, kappa=kap, kappa_chi=kchi, ustar=d['ustar'], ucap=d['ucap'], band_min=bm, pts=[dict(u=p['u'], ufrac=p['ufrac'], ucapfrac=p['ucapfrac'], theta_room=p['theta_room'], chi=p['chi_room'], npossible=len(p['possible']), weights_F=p.get('weights_F')) for p in d['pts']]); res.append(rec)
    print('piece [%.4f, %.4f] by the row tuned at %.3f: room %.3e (law gap %.1e) | mu %.4f | kappa_AB %s | u*(t\') %.5f, cap of the piece %.5f = %.3f u*(t\') | band minimum theta_room %s at u = %.5f (%.3f u*(t\'), %.3f cap), binding chi %s | theta_room at u/cap: %s' % (
        a, b, tp, room, gap, mu, ('f(chi) %s..%s' % (kchi.split(',')[0].split(':')[1], kchi.split(',')[-1].split(':')[1])) if kchi else '%.3f' % kap, d['ustar'], d['ucap'], d['ucap'] / d['ustar'], ('%.3f' % bm['theta_room']) if bm else '-', bm['u'] if bm else float('nan'), bm['ufrac'] if bm else float('nan'),
        bm['ucapfrac'] if bm else float('nan'), ('%g' % bm['chi_room']) if bm and bm['chi_room'] else '-',
        ' '.join('%.2f: %s' % (p['ucapfrac'], ('%.3f' % p['theta_room']) if p['theta_room'] else '-') for p in d['pts'])), flush=True)
    json.dump(res, open('out/shift5_%g_%g%s.json' % (a, b, os.environ.get('SHIFT_TAG', '')), 'w'), indent=1)
