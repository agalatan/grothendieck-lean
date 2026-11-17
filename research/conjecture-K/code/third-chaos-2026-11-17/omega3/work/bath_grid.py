# bath_grid.py -- the Gaussian-bath limit family a h3(X) + b X Y + c Z on a grid of (p, q) = (a^2, b^2), c^2 = 1-p-q.
# usage: python3 bath_grid.py <shard> <nshards>
import numpy as np, sys, os, time
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from bath_limit import compute
pts = []
for p in [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9]:
    for q in np.arange(0.0, 1.0001-p-0.05, 0.1):
        pts.append((p, round(q, 3)))
pts += [(0.95, 0.0), (0.95, 0.02), (0.9, 0.05), (0.85, 0.1), (0.98, 0.0), (0.97, 0.01), (0.0, 0.95), (0.05, 0.9), (0.3, 0.65), (0.6, 0.35)]
pts = [pq for pq in pts if not (pq[0] == 0.0 and pq[1] == 0.0)]
if 'pts' in os.environ:                      # explicit list "p,q;p,q;..."
    pts = [tuple(float(u) for u in s.split(',')) for s in os.environ['pts'].split(';')]
shard, nsh = int(sys.argv[1]), int(sys.argv[2])
for k, (p, q) in enumerate(pts):
    if k % nsh != shard:
        continue
    a, b = np.sqrt(p), np.sqrt(q); c = np.sqrt(max(0.0, 1-p-q))
    small = c < 0.35
    kw = dict(nv=16, nx=96 if small else 64, ny=32 if q > 0 else 1, nG=721 if small else 361, npan=10)
    t0 = time.time()
    r = compute(a, b, c, **kw)
    print('p=%.3f q=%.3f (a=%.4f b=%.4f c=%.4f) | E|P|=%.6f B=%.6f R=%.6f Cov=%+.6f | %s %.0fs'
          % (p, q, a, b, c, r['EP'], r['B'], r['R'], r['cov'], kw, time.time()-t0), flush=True)
    print('   c(t): ' + ' '.join('%.4f:%+.5f' % (u, w) for u, w in zip(r['t'], r['ct'])), flush=True)
