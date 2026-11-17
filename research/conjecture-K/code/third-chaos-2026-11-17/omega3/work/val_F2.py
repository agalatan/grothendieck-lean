# Validation of the nested engine: n = 1 (h3, exact line mass) against the 1-D quadrature, and F_2 = (h3(X1)+h3(X2))/sqrt2
# with the inner integral done three ways on the SAME outer points: Gauss-Hermite (deterministic), MC + jackknife, MC raw.
import numpy as np, sys, time
sys.path.insert(0, '.')
from omega3lib import *
nv = int(sys.argv[1]) if len(sys.argv) > 1 else 20
nout = int(sys.argv[2]) if len(sys.argv) > 2 else 4000
v, wv, t, wt = tgrid(nv)
rng = np.random.default_rng(7)
P1 = DiagCubic([1.0])
t0 = time.time()
Pv, Gm, Ij, Ir = nested_run(P1, 3, t, 200000, 2, rng, chunk=20000, inner='none')
s = summarise(Gm, Ij, t, wt, 3, v, wv)
print('h3 n=1 (exact line mass, outer MC 2e5): Cov=%+.5f +- %.5f  R=%.5f  B=%.5f  [1-D quadrature: Cov=-0.020151 R=0.789804 B=0.772382]  %.1fs'
      % (s['cov_cv'], s['cov_cv_se'], s['R'], s['B'], time.time()-t0))
P2 = DiagCubic([1.0, 1.0])
x = rng.standard_normal((nout, 2))
for inner, M in [('gh', 0), ('mc', 64), ('mc', 256)]:
    t0 = time.time()
    Pv, Gm, Ij, Ir = nested_run(P2, 3, t, nout, M, np.random.default_rng(11), chunk=64, x_given=x, inner=inner, ngh=200)
    s = summarise(Gm, Ij, t, wt, 3, v, wv)
    sr = summarise(Gm, Ir, t, wt, 3, v, wv)
    print('F2 inner=%s M=%3d: Cov(jk)=%+.5f +- %.5f  Cov(raw)=%+.5f   B(jk)=%.5f  mu(t_max) jk/raw = %.5f/%.5f  %.1fs'
          % (inner, M, s['cov_cv'], s['cov_cv_se'], sr['cov_cv'], s['B'], s['mu'][-1], sr['mu'][-1], time.time()-t0))
    if inner == 'gh':
        Igh = Ij.copy()
    else:
        dI = Ij - Igh
        print('      per-point |I_jk - I_gh|: mean %.2e, mean signed (bias) %+.2e;  raw bias %+.2e' % (np.abs(dI).mean(), dI.mean(), (Ir-Igh).mean()))
