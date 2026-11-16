"""Check (label N) of the general one-coordinate inequalities of REPORT section 5.4 on random cubics and random directions:
     D_phi(q) >= B_phi(u) - E_r phi(Vbar_e(r)) >= A a + B b + L2 c + R2 d      (both bounds may be negative; the point is the direction and the coefficients)."""
import sys, os, math
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
import numpy as np
from scipy.interpolate import CubicSpline
from dslib import *
from hyper import *

if __name__ == '__main__':
    rng = np.random.default_rng(11)
    g = Grid(2, PANELS_FINE, 8, 48)
    U = 0.0463; pk = peak_profile(U); sq = SqrtProfile(1.0)
    d = np.load('tab_peak.npz'); Jsp = CubicSpline(d['s'], d['j']); smax = d['s'][-1]
    jpeak = lambda v: np.where(np.sqrt(v) <= smax, Jsp(np.minimum(np.sqrt(v), smax)), Jsp(smax) * smax / np.maximum(np.sqrt(v), smax))
    cs = tangent_coeffs(lambda v: 0.5 / np.sqrt(v), 1.0); cp = tangent_coeffs(jpeak, U)
    print('sqrt (u=1):  a,b,c,d =', np.round(cs, 6), ' expected sqrt(pi)/16, sqrt(pi)/8, -sqrt(pi)/8, -sqrt(pi)/4 =', np.round([SQPI/16, SQPI/8, -SQPI/8, -SQPI/4], 6))
    print('peak (u=0.0463): a,b,c,d =', np.round(cp, 6))
    bad = 0
    for i in range(16):
        t = random_tensor(2, rng); e = rng.standard_normal(2) + 1j * rng.standard_normal(2)
        for prof, coef, lab in [(sq, cs, 'sqrt'), (pk, cp, 'peak')]:
            tt = normalise(t, prof.u); cf = profile_coeffs(tt, e)
            D = split(g, tt, prof)['D']; jb = prof.B - jensen_value(cf, prof.phi)
            tb = cf[0] * coef[0] + cf[1] * coef[1] + cf[3] * coef[2] + cf[4] * coef[3]
            ok = D >= jb - 1e-4 * abs(D) and jb >= tb - 1e-9
            bad += (not ok)
            if i < 4: print(f'  cubic {i} {lab}: (A,B,C,L2,R2)/u = {np.round(np.array(cf)/prof.u, 3)}: D = {D:.5e} >= Jensen {jb:+.5e} >= tangent {tb:+.5e}  {"OK" if ok else "VIOLATION"}')
    print('violations in 32 cases:', bad)
