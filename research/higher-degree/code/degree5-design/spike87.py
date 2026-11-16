# One-spike sector expansion at the K5 flank row t = 0.87 (K5 game constants), to compare with the exact
# one-spike quadrature of k5 RESULTS 4.3 (+1.61e-5 over the Gaussian ideal, maximiser q = 0.0593 H21(z2), nu5 = 0.0532).
import sys, os, json; sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np, spike as SP
from scipy.optimize import minimize_scalar
E1K, ETAK = 0.848926, 0.281576
for nu5 in (0.0537, 0.0532):
    rec = dict(t=0.87, l=0.8707, beta=0.1775, bA=-0.1727, bB=-0.1064, sig=0.0, nu5=nu5)
    sp = SP.Spike(rec, e1=E1K, eta=ETAK)
    g0 = sp.value(0.0, 0.0)
    gs = max((sp.value(s, 0.0), s) for s in np.linspace(0, 0.3, 31))
    print('nu5=%.4f  q=0 value %.8f ; best Gaussian on grid %.8f at sigma %.3f' % (nu5, g0, gs[0], gs[1]), flush=True)
    for c in (1.0, 0.9):
        r = minimize_scalar(lambda s: -sp.value(s, c), bounds=(0.005, 0.25), method='bounded', options={'xatol': 1e-5})
        tot, val, g = sp.value(r.x, c, detail=True)
        print('  c=%.2f sigma=%.4f total-(q=0)=%+.3e  q-only-(q=0)=%+.3e  gains %s  sum %.2e' % (c, r.x, tot - g0, val - g0, ' '.join('%s %.2e' % (k, v) for k, v in g.items()), sum(g.values())), flush=True)
