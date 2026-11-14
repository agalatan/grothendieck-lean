"""D1 numerics, part 6: conditional means given X_s = 0.  c_i(s) := E[xi_i | X_s = 0], X_s = X + G_s.
E[xi_i delta(X_s)] = (1/pi) int_0^inf Re[ 2 i lam_i t phi_X(t) e^{-s^2 t^2/2} / (1 - 2 i lam_i t) ] dt,  p_s(0) = (1/pi) int Re[phi_X e^{-s^2t^2/2}].
Tests: (i) is lam_i -> lam_i c_i(s) (= E[Y_i | X_s = 0]) decreasing in lam_i?  (ii) C7: 2 sum lam_i^2 c_i(s) <= 0."""
import numpy as np, math
from scipy.integrate import quad
def phiX(lam, t): return np.prod(np.exp(-1j*lam*t)/np.sqrt(1 - 2j*lam*t))
def cond_means(lam, s, limit=1500):
    lam = np.asarray(lam, float)
    p0 = quad(lambda t: (phiX(lam, t)*math.exp(-s*s*t*t/2)).real, 0, np.inf, limit=limit)[0]/math.pi
    cs = []
    for li in lam:
        f = lambda t: (2j*li*t*phiX(lam, t)*math.exp(-s*s*t*t/2)/(1-2j*li*t)).real
        cs.append(quad(f, 0, np.inf, limit=limit)[0]/math.pi/p0)
    return p0, np.array(cs)
def nz(lam): lam = np.asarray(lam, float); return lam/math.sqrt(2*np.sum(lam**2))
rng = np.random.default_rng(5)
spectra = [nz([1,0.5,0.25]), nz([1,1,1,0.1,0.1]), nz([1,0.7,0.5,0.3,0.1]), nz([1]+[0.1]*20), nz([3,1,1,1,1,1,1,1]), nz([1,0.9,0.8])]
for k in range(4): spectra.append(nz(abs(rng.standard_normal(rng.integers(3,7)))))
viol_order = 0; viol_c7 = 0
for lam in spectra:
    lam = np.sort(lam)[::-1]
    for s in [0.0, 0.3, 1.0, 3.0]:
        if s == 0.0 and len(lam) < 3: continue
        p0, c = cond_means(lam, s)
        Yi = lam*c                      # E[Y_i | X_s = 0], lam sorted decreasing
        order_ok = np.all(np.diff(Yi) >= -1e-7)   # should be increasing as lam decreases
        c7 = 2*np.sum(lam**2*c)        # E[X2 | X_s = 0] <= 0 ?
        viol_order += (not order_ok); viol_c7 += (c7 > 1e-7)
        print(f"lam={np.round(lam,3)} s={s}: E[Y_i|X_s=0]={np.round(Yi,4)} ordered={order_ok}  E[X2|X_s=0]={c7:+.5f}")
print("ordering violations:", viol_order, " C7 violations:", viol_c7)
