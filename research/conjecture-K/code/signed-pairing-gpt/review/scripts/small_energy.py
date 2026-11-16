#!/usr/bin/env python3
# Reviewer (N): the ratio ||c||^2/(delta Omega_hat) of the row profiles at small energies, against the scale-free
# values for the power profiles h(v) = v^(1/2), v, v^(3/2) (G(s) = s^2, s^3, s^4).  Shows what an energy-uniform
# constant must exceed on each cubic.   argv: <scripts dir> <content5 dir> <out log json>
import sys, json, math
import numpy as np
sys.path.insert(0, sys.argv[1])
import siglib as L
C5 = sys.argv[2]
r, wr = L.r_grid(90.0)
laws = [('X(|Y|^2-1)', L.EqualLaw(1)), ('equal m=4', L.EqualLaw(4)), ('equal m=22', L.EqualLaw(22)), ('A=diag(.8,.6)', L.TwoEigLaw(0.8, 0.6))]
K = {nm: L.hermitian_kernels(law, r) for nm, law in laws}
def ratio(G, u, nm, law):
    p, w1, zp, _ = K[nm]
    pr = L.Profile(G, u); sp = math.sqrt(u) * r; f1 = pr.f1(sp)
    c = float(wr @ (G(sp) * w1)); EVk2 = float(wr @ (p * f1 * f1)); EVk = float(wr @ (p * sp * f1))
    return c * c / (u * u * (4 + 12 * law.kappa) * (1.5 * EVk2 - 0.75 * EVk * EVk / u))
out = {}
print('scale-free ratios for power profiles h(v) = v^a   (a = 1 is the value 16 zeta/(3 + 9 kappa))')
for nm, law in laws:
    vals = [ratio(lambda s, a=a: s ** (2 * a + 1), 1.0, nm, law) for a in (0.25, 0.5, 1.0, 1.5, 2.0)]
    out[nm] = dict(power=vals)
    print('  %-16s a = 1/4: %.4f   1/2: %.4f   1: %.4f (exact %.4f)   3/2: %.4f   2: %.4f' % (nm, vals[0], vals[1], vals[2], 16 * law.zeta / (3 + 9 * law.kappa), vals[3], vals[4]))
print('row profiles at small energies (larger of the two tilted profiles); sharp profile-free theta* in the last column')
FR = [1.0, 0.5, 0.25, 0.1, 0.05, 0.025, 0.01, 0.005, 0.0025]
tst = {x['name']: x['theta_star'] for x in json.load(open(sys.argv[4]))}
for k, t in ((5, '0.80'), (9, '0.84'), (12, '0.855')):
    rec, GA, GB, G0 = L.load_row('%s/out/prof_%d.npz' % (C5, k)); us = rec['sig'] ** 2
    # local expansion of the tilted profiles at 0:  G(s) = g1 s + g2 s^2 + ...  (least squares on the first table points)
    for X, G in (('A', lambda s: GA(s) + 0.4 * G0(s)), ('B', lambda s: GB(s) + 0.3 * G0(s))):
        s = np.linspace(0.0005, 0.02, 40); A = np.vstack([s, s ** 2, s ** 3]).T
        co = np.linalg.lstsq(A, G(s), rcond=None)[0]
        print('  row %s profile %s: G(s) ~ %.4f s %+.4f s^2 %+.3f s^3 on s <= 0.02  (so h(v) = g1 + g2 sqrt(v) + ...: g2/g1 = %.3f)' % (t, X, co[0], co[1], co[2], co[1] / co[0]))
    print('  row %s   u/u*: ' % t + ' '.join('%7g' % f for f in FR))
    for nm, law in laws:
        vals = [max(ratio(lambda s: GA(s) + 0.4 * G0(s), f * us, nm, law), ratio(lambda s: GB(s) + 0.3 * G0(s), f * us, nm, law)) for f in FR]
        out.setdefault(nm, {})[t] = vals
        key = 'equal m=1' if nm.startswith('X(') else nm if nm.startswith('equal') else 'A = diag(0.8000, 0.6000)'
        print('    %-16s ' % nm + ' '.join('%7.4f' % v for v in vals) + '   theta* %.4f' % tst[key])
        assert max(vals) <= tst[key] * (1 + 1e-4)
json.dump(out, open(sys.argv[3], 'w'), indent=1)
