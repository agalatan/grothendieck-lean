#!/usr/bin/env python3
# Reviewer (N): Omega_hat under the exponential law, computed (a) from the reviewer's accurate profiles (proflib: k' = E h'(. + u tau))
# and (b) from the band-row TABLES with the pipeline of the first review (siglib.Profile: k' = (k - h)/u, splines of the table).
# Also E D_h^2 by two quadrature rules.   argv: <scripts dir> <data dir> <profiles dir>
import sys, json, math
import numpy as np
from scipy.interpolate import CubicSpline
sys.path.insert(0, sys.argv[1])
import siglib as L, proflib as PL
for t in ('0.80', '0.84', '0.855'):
    npz = np.load('%s/prof_jets_%s.npz' % (sys.argv[2], t)); us = float(npz['ustar'])
    tab = json.load(open('%s/band_row_%s.json' % (sys.argv[3], t))); S = np.array(tab['S'])
    for X, name, tilt, key in ((0, 'A', 0.4, 'GA'), (1, 'B', 0.3, 'GB')):
        pr = PL.Prof(npz, X)
        sp = CubicSpline(S, np.array(tab[key]) + tilt * np.array(tab['G0'])); Gt = lambda s: sp(np.minimum(np.asarray(s, float), 6.0))
        for fr in (0.5, 1.3):
            u = fr * us
            vals = []
            for (ed, nq) in ((list(np.linspace(0, 8, 65)) + list(np.linspace(8, 60, 53)[1:]), 8), (list(np.linspace(0, 10, 201)) + list(np.linspace(10, 70, 121)[1:]), 6)):
                tl, wl = L.panels(ed, nq); wl = wl * np.exp(-tl); v = u * tl
                e = pr.ev(np.sqrt(v)); kp, _ = PL.transforms(pr, u, v)
                D2 = 3 * e[2] ** 2 + np.maximum(e[4] ** 2, e[3] ** 2)
                vals.append((float(wl @ D2), 1.5 * float(wl @ (v * kp * kp)) - 0.75 * float(wl @ (v * kp)) ** 2 / u))
            tl, wl = L.panels(list(np.linspace(0, 8, 65)) + list(np.linspace(8, 60, 53)[1:]), 8); wl = wl * np.exp(-tl); s = np.sqrt(u * tl)
            f1 = L.Profile(Gt, u).f1(s)
            Om_tab = 1.5 * float(wl @ (f1 * f1)) - 0.75 * float(wl @ (s * f1)) ** 2 / u
            print('row %s %s u = %.1f u*: E D_h^2 = %.6f / %.6f (two rules);  Omega_hat = %.8f / %.8f (two rules), from the table: %.8f (relative difference %.1e)' % (
                t, name, fr, vals[0][0], vals[1][0], vals[0][1], vals[1][1], Om_tab, abs(Om_tab / vals[0][1] - 1)))
