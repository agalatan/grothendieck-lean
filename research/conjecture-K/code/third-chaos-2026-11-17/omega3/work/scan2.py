# scan2.py -- deterministic scan of the whole two-variable third chaos, in the frame where the He2(x1) x2 coefficient
# vanishes (always reachable by a rotation): P = cos(al) h3(x1) + sin(al) [cos(be) x1 He2(x2)/sqrt2 + sin(be) h3(x2)].
# usage: python3 scan2.py <shard> <nshards> [nv=.. nz=.. n2=.. npan=..]
import numpy as np, sys, os, time, itertools
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from det2d import compute
from omega3lib import TensorCubic
def add(T, idx, c):
    perms = set(itertools.permutations(idx))
    for p in perms:
        T[p] += c/len(perms)
def tensor(al, be):
    T = np.zeros((2, 2, 2))
    add(T, (0, 0, 0), np.cos(al)/np.sqrt(6))
    add(T, (0, 1, 1), np.sin(al)*np.cos(be)/np.sqrt(2))
    add(T, (1, 1, 1), np.sin(al)*np.sin(be)/np.sqrt(6))
    return T
shard, nsh = int(sys.argv[1]), int(sys.argv[2])
kw = {}
for s in sys.argv[3:]:
    k, val = s.split('='); kw[k] = int(val)
pts = [(al, be) for al in np.arange(0.1, 1.5701, 0.1) for be in np.arange(0, 2*np.pi-1e-9, np.pi/6)]
if 'pts' in os.environ:
    pts = [tuple(float(u) for u in s.split(',')) for s in os.environ['pts'].split(';')]
for k, (al, be) in enumerate(pts):
    if k % nsh != shard:
        continue
    t0 = time.time()
    r = compute(TensorCubic(tensor(al, be)), **kw)
    print('al=%.3f be=%.3f (a=%+.4f c=%+.4f d=%+.4f) | E|P|=%.6f B=%.6f R=%.6f Cov=%+.6f | %s %.0fs'
          % (al, be, np.cos(al), np.sin(al)*np.cos(be), np.sin(al)*np.sin(be), r['EP'], r['B'], r['R'], r['cov'], kw, time.time()-t0), flush=True)
    print('   c(t): ' + ' '.join('%.4f:%+.5f' % (u, w) for u, w in zip(r['t'], r['ct'])), flush=True)
