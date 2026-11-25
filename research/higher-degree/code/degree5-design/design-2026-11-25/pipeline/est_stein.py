# Float-free estimate of the Stein law-layer maximum of a row (it only chooses the cover target): exact Stein box
# bounds (stein2.certify_box_stein) on 12 boxes around the old maximiser, nu in [0, 3/250].   claude-b9ee d5cert 2b
import sys, os, json, time
os.environ.setdefault('OMP_NUM_THREADS', '1')
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from fractions import Fraction as F
import law2 as law, stein2 as st
capsf, sig_star = sys.argv[1], F(sys.argv[2])
row = law.Row(capsf)
res = []
for k in (-1, 0, 1):
    sa = sig_star + F(k, 20) - F(1, 40); sb = sa + F(1, 20)
    for xa, xb in ((F(1), F(3, 2)), (F(3, 2), F(2)), (F(2), F(5, 2)), (F(5, 2), F(3))):
        t0 = time.time()
        b, info = st.certify_box_stein(row, F(0), F(3, 250), sa, sb, xa, xb)
        res.append((float(b) if b is not None else None, float(sa), float(xa)))
        print('sigma [%.3f,%.3f] x [%.2f,%.2f]: %s (%.0fs)' % (sa, sb, xa, xb, res[-1][0], time.time() - t0), flush=True)
best = max(r[0] for r in res if r[0] is not None)
print(json.dumps(dict(caps=capsf, est=best, boxes=res)))
