"""The threshold theta of a band row (N): the largest theta for which the law-layer test of CONTENT_LEMMA_D5.md section 11.4 (b)
(combo3.solve_point_t4: T4 frame with the hypothesis ||c_X||^2 <= theta delta Omhat_X, moment + Stein relaxation, response cap
and Rice family at t_lo, kappa_AB = 0.82, tilt and pointwise margin mu) keeps the row's excess inside its room.
claude-b9ee worker d5newcap, 16 Nov 2026.
usage: D5_E1=.. D5_ETA=.. theta_row.py k s t mu tlo room theta1,theta2,... [fr-list] [chi-list]
Prints the excess (gain units) at each theta and the interpolated threshold (excess = room)."""
import sys, json, os, warnings; warnings.filterwarnings('ignore')
import numpy as np
import rowlib as R, lawstein as LS, combo as C, rice as RI, t4lib as T4, combo3 as C3
k = int(sys.argv[1]); s, t, mu, tlo, room = [float(x) for x in sys.argv[2:7]]
thetas = [float(x) for x in sys.argv[7].split(',')]
fr = [float(x) for x in (sys.argv[8] if len(sys.argv) > 8 else '0.8,0.9,1.0,1.05,9').split(',')]
chis = [float(x) for x in (sys.argv[9] if len(sys.argv) > 9 else '4,8,12,16,24').split(',')]
row = R.Row('out/prof_%d.npz' % k); profs = C.prof_derivs(row, s, t); U = LS.ugrid(); kappa = 0.82
ucap = 4 * RI.E1 ** 2 * 0.432306903 * (0.886762780 - tlo)
res = []
for theta in thetas:
    worst = (-9, None); nolaw = 0; fail = 0
    for f in fr:
        u = min(f * row.ustar, 0.999 * ucap)
        kprofs = (T4.Profile(profs[0], u), T4.Profile(profs[2], u))
        for chi in chis:
            best, aux = C3.solve_point_t4(row, U, u, chi, theta, mu, kappa, profs, kprofs, tlo)
            if best == 'fail': fail += 1; continue
            if best is None: nolaw += 1; continue
            v = best[0] / (4 * mu)
            if v > worst[0]: worst = (v, (round(u / row.ustar, 3), chi))
    res.append(dict(theta=theta, excess=worst[0], at=worst[1], cells_without_law=nolaw, failed=fail))
    print('t=%.3f theta=%.3f: largest excess %+.3e at (u/u*, chi) = %s; room %.3e; share %.0f %% (cells with no response law %d, solver failures %d)' % (
        row.t, theta, worst[0], worst[1], room, 100 * worst[0] / room, nolaw, fail), flush=True)
th = sorted(res, key=lambda r: r['theta']); thr = None
for a, b in zip(th[:-1], th[1:]):
    if a['excess'] <= room <= b['excess']:
        thr = a['theta'] + (b['theta'] - a['theta']) * (room - a['excess']) / (b['excess'] - a['excess'])
note = ''
if thr is None:
    if th[-1]['excess'] < room and len(th) >= 2 and th[-1]['excess'] > th[-2]['excess']:      # extrapolate from the last two
        a, b = th[-2], th[-1]; thr = b['theta'] + (b['theta'] - a['theta']) * (room - b['excess']) / (b['excess'] - a['excess']); note = ' (extrapolated)'
    elif th[0]['excess'] > room: note = ' (below the smallest theta run)'
print('t=%.3f: threshold theta%s = %s   [ustar %.6f, ucap %.6f = %.3f u*, mu %.4f, tlo %.4f, room %.3e]' % (row.t, note, ('%.3f' % thr) if thr else 'none', row.ustar, ucap, ucap / row.ustar, mu, tlo, room), flush=True)
json.dump(dict(t=row.t, k=k, tilt=[s, t], mu=mu, tlo=tlo, room=room, kappa=kappa, ustar=row.ustar, ucap=ucap, runs=res, threshold=thr, note=note.strip()),
          open('out/theta_%d_s%s_t%s.json' % (k, sys.argv[2], sys.argv[3]), 'w'), indent=1)
