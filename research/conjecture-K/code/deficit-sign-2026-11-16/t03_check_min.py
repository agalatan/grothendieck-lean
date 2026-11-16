"""Re-evaluate search optima on independent grids (label N)."""
import sys, os, json, math
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
import numpy as np
from dslib import *
fn = sys.argv[1]; idx = int(sys.argv[2]) if len(sys.argv) > 2 else None
res = json.load(open(fn))
key = lambda r: r['fine']['T2'] / r['fine']['D']
r = min(res, key=key) if idx is None else res[idx]
t = np.array(r['t_re']) + 1j * np.array(r['t_im'])
n = t.shape[0]
np.set_printoptions(precision=4, suppress=True, linewidth=200)
print('tensor t[i,j,k] (sym in i,j), E|q|^2 = 2|t|^2 =', 2 * np.sum(abs(t) ** 2))
for k in range(n):
    print('k=%d' % k); print(t[:, :, k])
prof = SqrtProfile(1.0)
grids = [('fine 8x48', Grid(2, PANELS_FINE, 8, 48)),
         ('other panels 10x64', Grid(2, [0, .1, .3, .6, 1, 1.4, 1.9, 2.5, 3.2, 4, 5, 6.2, 7.6, 9.3, 11.5, 14, 17, 21, 26, 33, 44], 10, 64)),
         ('fine 12x40', Grid(2, PANELS_FINE, 12, 40))]
for lab, g in grids:
    f = stein_fields(t, g.Y)
    s = split(g, t, prof, f); m = moments(g, t, f)
    print(f"{lab:20s} N={g.W.size:8d}: D={s['D']:.9f} T1={s['T1']:.9f} T2={s['T2']:+.9f} T2/D={s['T2']/s['D']:+.6f} err={s['T1']+s['T2']-s['D']:+.2e} chi={m['delta']:.4f} Eq2a={m['Eq2a']:.4f} cov(c2,V)={m['cov_c2V']:.4f}")
