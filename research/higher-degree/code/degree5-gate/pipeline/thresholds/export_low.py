#!/usr/bin/env python3
"""Export the profiles of the rows that cover the low pieces t = 0.70 ... 0.78, in the kit's JSON format, with their allowances.
claude-b9ee worker d5newcap, 17 Nov 2026.   (N)
For each piece t: among the covering rows computed by shift5.py (files out/shift5_*_f*.json of the game folder: chi-dependent
split, law gap counted in the room, exact weights, 15 chi) the one with the largest band minimum of theta_room among those
with room >= 5e-4 (ROOM_MIN) is "the cover".
Files written to DST:
  band_row_<t>.json       the cover: keys of the kit (t, row, game, tilt, ustar, S5, theta_needed, S, psi, GA, GB, G0) plus
                          dpsi, dGA, dGB, dG0 (EXACT derivatives: derivative of the defining integral, never of an interpolant),
                          piece, covering_row, t_lo, ucap, room, law_gap, mu, kappa_AB_of_chi, allowance (theta_room at every
                          energy scanned, with u, u/u*, u/cap, binding chi, optimal weights of (F)), band_minimum, definition
  band_row_<t>_own.json   the same for the row tuned at t itself (if computed)
"t" is the piece (the t of the responses); "row" holds the parameters of the covering row, tuned at covering_row.
theta_needed = the band minimum of theta_room (the kit's files have the row minimum there).
usage: D5_E1=.. D5_ETA=.. export_low.py GAMEDIR DST t1,t2,..."""
import sys, os, json, glob
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np, rowlib as R
gd, dst = os.path.abspath(sys.argv[1]), os.path.abspath(sys.argv[2]); ts = [float(x) for x in sys.argv[3].split(',')]
os.makedirs(dst, exist_ok=True); os.chdir(gd)
recs = []
for fn in sorted(glob.glob('out/shift5_*_f*.json')):
    recs += [r for r in json.load(open(fn)) if r.get('band_min')]
DEF = ('theta_room(u) = the largest theta for which (F) plus the hypothesis ||c_X||^2 <= theta delta Omhat_X in both sectors (X = A, B; tilted profiles G_A + s G_0, '
       'G_B + t G_0) keeps the row inside its room at the energy u, within the law-layer relaxation (moments, Stein family, Rice family (R1) at t_lo, response cap); '
       'minimum over ALL sector weights (exact, minimax); chi in {1,2,3,4,6,8,10,12,14,16,20,24,30,36,42}, cells without a possible law left out; '
       'kappa_AB(chi) = 1 - (quintic share along the one-spike family) - 0.02; pointwise margin mu of the tilt; room = 500/701 - (row line on the piece) - law gap - 1.5e-5. '
       'Sufficient for the row, not necessary. Floating point (N).')
def write(name, t, r):
    tp = r['tprime']; tk = ('%.4f' % tp).replace('.', 'p'); path = 'out/prof_t%s.npz' % tk; row = R.Row(path); d = np.load(path)
    # energies below the range scanned by shift5.py (lowpts.py), if they were computed
    lowf = glob.glob('out/r4_theta5_1_shift_%g_%g_t%s_f*_low.json' % (r['piece'][0], r['piece'][1], tk)); pts = list(r['pts'])
    for lf in lowf:
        for p_ in json.load(open(lf))['pts']:
            if p_.get('theta_room') and not any(abs(q_['u'] - p_['u']) < 1e-9 for q_ in pts):
                pts.append(dict(u=p_['u'], ufrac=p_['ufrac'], ucapfrac=p_['ucapfrac'], theta_room=p_['theta_room'], chi=p_['chi_room'], npossible=len(p_['possible']), weights_F=p_.get('weights_F')))
    r = dict(r, pts=sorted(pts, key=lambda q_: q_['u']))
    f12 = lambda arr: [float('%.12g' % x) for x in arr]
    out = dict(t='%.2f' % t, row={k: row.rec[k] for k in ('t', 'l', 'beta', 'bA', 'bB', 'nu5', 'sig')}, game=dict(e1=R.E1, eta=R.ETA), tilt=dict(s=0.4, t=0.3),
               ustar=float(row.ustar), S5=float(row.S5), theta_needed=r['band_min']['theta_room'],
               S=f12(d['S']), psi=f12(d['psi']), GA=f12(d['GA']), GB=f12(d['GB']), G0=f12(d['G0']),
               dpsi=f12(d['dpsi']), dGA=f12(d['dGA']), dGB=f12(d['dGB']), dG0=f12(d['dG0']),
               piece=r['piece'], covering_row=tp, t_lo=r['piece'][0] - 1e-4, ucap=r['ucap'], room=r['room'], law_gap=r.get('law_gap', 0.0), mu=r['mu'],
               kappa_AB_of_chi=r.get('kappa_chi'), kappa_AB_constant_own=r['kappa'],
               allowance=[dict(u=p['u'], u_over_ustar=p['ufrac'], u_over_cap=p['ucapfrac'], theta_room=p['theta_room'], binding_chi=p['chi'], chi_with_a_possible_law=p['npossible'],
                               weights_of_F=p.get('weights_F')) for p in r['pts']],
               band_minimum=dict(theta_room=r['band_min']['theta_room'], u=r['band_min']['u'], u_over_ustar=r['band_min']['ufrac'], u_over_cap=r['band_min']['ucapfrac'],
                                 binding_chi=r['band_min'].get('chi_room')),
               definition=DEF, derivatives='dGA, dGB, dG0, dpsi are exact (prof2.py); do not differentiate a spline through GA, GB, G0')
    with open(os.path.join(dst, name), 'w') as f: json.dump(out, f, separators=(',', ':')); f.write('\n')
    print('%s: piece t = %.2f covered by the row tuned at %.2f: u* %.5f, cap %.5f (%.3f u*), room %.3e (law gap %.1e), mu %.4f | band minimum theta_room %.3f at u = %.5f (%.3f u*, chi %s) | %d energies' % (
        name, t, tp, out['ustar'], r['ucap'], r['ucap'] / out['ustar'], r['room'], out['law_gap'], r['mu'], r['band_min']['theta_room'], r['band_min']['u'], r['band_min']['ufrac'],
        r['band_min'].get('chi_room'), len(r['pts'])))
for t in ts:
    mine = [r for r in recs if abs((r['piece'][0] + r['piece'][1]) / 2 - t) < 1e-6]
    if not mine: print('no cover computed for t = %.2f' % t); continue
    solid = [r for r in mine if r['room'] >= float(os.environ.get('ROOM_MIN', 5e-4))] or mine      # a cover whose room is almost gone is not exported as "the cover"
    best = max(solid, key=lambda r: r['band_min']['theta_room']); write('band_row_%.2f.json' % t, t, best)
    print('   all covers of t = %.2f: %s' % (t, ', '.join('%.2f -> %.3f (room %.1e)' % (r['tprime'], r['band_min']['theta_room'], r['room']) for r in sorted(mine, key=lambda r: r['tprime']))))
    own = [r for r in mine if abs(r['tprime'] - t) < 1e-6]
    if own: write('band_row_%.2f_own.json' % t, t, own[0])
