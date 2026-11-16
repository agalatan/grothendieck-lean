#!/usr/bin/env python3
# Reviewer (N): the limit model Q = alpha X(|X|^2-2) + beta W at the END of each row's certified rho-range, both tilted
# profiles of that row, over a wide range of energies; against the certified cell bound, the sharp theta*(rho), the
# package's rational constant and the application's threshold.
#   argv: <scripts dir> <content5 dir> <cert cells json> <out json>
import sys, json, math
import numpy as np
sys.path.insert(0, sys.argv[1])
import siglib as L
C5 = sys.argv[2]; cells = json.load(open(sys.argv[3]))
ROWS = [(5, '0.80', 0.11, 0.35, 0.37), (7, '0.82', 0.13, 0.6, 0.64), (9, '0.84', 0.2, 1.3, 1.33), (10, '0.845', 0.25, 1.8, 1.88), (11, '0.85', 1 / 3, 2.4, 2.5), (12, '0.855', 0.6, 3.6, 3.7)]
FR = [0.0025, 0.005, 0.01, 0.025, 0.05, 0.1, 0.25, 0.5, 0.85, 1.0, 1.25, 2.0, 5.0, 20.0]
T = L.t_grid(40.0, 0.1); out = []
print('%-6s %-6s | %-9s %-9s %-9s | %-22s | %-8s %-8s %-8s %-8s' % ('row', 'rho', 'u=.5u*', 'u=.85u*', 'u=u*', 'largest over 14 energies', 'theta*', 'cert.', 'claimed', 'needed'))
for k, t, rho, th, need in ROWS:
    rec, GA, GB, G0 = L.load_row('%s/out/prof_%d.npz' % (C5, k)); us = rec['sig'] ** 2
    s, ws = L.s_grid(240 * rho + 12); p, w1, zp = L.limit_kernels(rho, s, T)
    pos = p > 1e-300; tstar = (float(ws[pos] @ (zp[pos] ** 2 / p[pos])) + 1024 * rho * rho / (1 + 2 * rho * rho)) / 252
    cert = [c[5] for c in cells if c[0] - 1e-12 <= rho <= c[1] + 1e-12 and c[1] <= rho + 1e-12][0]
    vals = {}
    for fr in FR:
        u = fr * us; beta = math.sqrt(u / (1 + 2 * rho * rho)); alpha = rho * beta; sp = beta * s; best = 0
        for G in (lambda x: GA(x) + 0.4 * G0(x), lambda x: GB(x) + 0.3 * G0(x)):
            pr = L.Profile(G, u); f1 = pr.f1(sp)
            c = float(ws @ (G(sp) * w1)); EVk2 = float(ws @ (p * f1 * f1)); EVk = float(ws @ (p * sp * f1))
            best = max(best, c * c / (168 * alpha ** 4 * (1.5 * EVk2 - 0.75 * EVk * EVk / u)))
        vals[fr] = best
    mx = max(vals, key=vals.get)
    assert vals[mx] <= tstar * (1 + 1e-4) <= cert * (1 + 1e-4) and cert <= th
    out.append(dict(row=t, rho=rho, vals=vals, tstar=tstar, cert=cert, claimed=th, need=need))
    print('%-6s %-6.4f | %-9.4f %-9.4f %-9.4f | %.4f at u = %-7g u* | %-8.4f %-8.4f %-8.4f %-8.2f' % (t, rho, vals[0.5], vals[0.85], vals[1.0], vals[mx], mx, tstar, cert, th, need), flush=True)
json.dump(out, open(sys.argv[4], 'w'), indent=1)
