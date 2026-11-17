# eps^4 test: P_eps = eps h3(Y) + sqrt(1-eps^2) Z, Z the third-chaos Gaussian limit (rate-3 OU), deterministic quadrature.
# Prediction (leading order, derived in REPORT.md): Cov(Wbar, Gamma) = -K eps^4 + O(eps^6 log), K_h3 = 132/5 + sqrt3 pi/2 - (45/2) ln 3.
import numpy as np, sys, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from bath_limit import compute
K = 132/5 + np.sqrt(3)*np.pi/2 - 22.5*np.log(3)
print('K_h3 = %.10f' % K)
for nv, nx, nG in [(16, 80, 361), (24, 120, 721), (32, 160, 1081)]:
    for eps in [0.02, 0.05, 0.1, 0.2, 0.3, 0.5]:
        r = compute(eps, 0.0, np.sqrt(1-eps*eps), nv=nv, nx=nx, nG=nG)
        # leading-order scale-wise prediction c(t) = eps^4 t^3/(2(1-t^3)) [12(t-1) + 18(t^2-1)]
        tt = r['t']; cpred = eps**4*tt**3/(2*(1-tt**3))*(12*(tt-1) + 18*(tt*tt-1))
        print('nv=%2d nx=%3d nG=%4d eps=%.2f  E|P|=%.8f  R=%.8f  B=%.8f  Cov=%+.4e  Cov/eps^4=%+.5f  (pred -%.5f)  max_t c(t)/c_pred(t) in [%.3f, %.3f]'
              % (nv, nx, nG, eps, r['EP'], r['R'], r['B'], r['cov'], r['cov']/eps**4, K, np.min(r['ct']/cpred), np.max(r['ct']/cpred)), flush=True)
