import sys, os, json; sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np, spike as SP
from scipy.optimize import minimize_scalar
rec = {"t": 0.84, "l": 0.8400695938799617, "beta": 0.15910315231354877, "bA": -0.1586450191456344, "bB": -0.09654181764002433, "sig": 0.23952244020644456, "nu5": 0.04082540955215063}
sp = SP.Spike(rec)
g0 = max((sp.value(s, 0.0), s) for s in np.linspace(0.2, 0.28, 17))
print('Gaussian ref %.9f at %.3f' % g0, flush=True)
for c in (0.1, 0.2):
    r = minimize_scalar(lambda s: -sp.value(s, c), bounds=(0.18, 0.28), method='bounded', options={'xatol': 1e-5})
    tot, val, g = sp.value(r.x, c, detail=True); G = sum(g.values())
    print('c=%.2f m-2=%.4f sigma=%.4f total-G=%+.3e qonly-G=%+.3e gains %.3e ratio %.3f  %s' % (c, 42 * c ** 4, r.x, tot - g0[0], val - g0[0], G, G / max(g0[0] - val, 1e-30), ' '.join('%s %.2e' % (k, v) for k, v in g.items())), flush=True)
