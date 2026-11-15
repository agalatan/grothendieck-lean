# REVIEW_4 (claude-b9ee, 15 November 2026): written by the reviewer agent of the session, copied from its scratch folder; m'' and the scalar resolvent k_u from first principles; writes m2.npz.
# claude reviewer (N): scalar resolvent k_u from first principles and the gamma rows.
#  m(x) = E[(T-2/5) sign(Re L + x)];  m'(x) = (2/pi) E[(T-d)/sqrt(rho^2-x^2); rho>|x|]  (own derivation, not formula (8));
#  m'' by central differences of m' (computed with the substitution T = T0 + w^2, smooth integrand).
#  k_u(x) = int_0^1 z^{2/3} E m''(z x + sqrt(u(1-z^2)/2) G) dz.
import numpy as np, json, os, sys
from scipy import integrate, optimize
from scipy.interpolate import CubicSpline
from fractions import Fraction as Q
a, b, d = 699/1250, 179/1250, 0.4
rho = lambda T: np.sqrt(T)*(a + b*T)
AUTH = '/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/'
HERE = os.path.dirname(os.path.abspath(__file__))
def T0(x):
    if x == 0: return 0.0
    return optimize.brentq(lambda T: rho(T) - x, 0, 200, xtol=1e-16, rtol=1e-15)
def m1(x):
    x = abs(x); t0 = T0(x)
    Dt0 = (a + b*t0)*(a + 3*b*t0)
    def f(w):
        T = t0 + w*w
        if w < 1e-7: core = 2/np.sqrt(Dt0)
        else: core = 2*w/np.sqrt(rho(T)**2 - x*x)
        return np.exp(-T)*(T - d)*core
    return 2/np.pi*integrate.quad(f, 0, 9, epsabs=1e-15, epsrel=1e-14, limit=500)[0]
def build_m2():
    xs = np.concatenate([np.linspace(0, 3, 1501), np.linspace(3, 8, 251)[1:]])
    hh = 1e-4
    m2 = np.array([(m1(x + hh) - m1(x - hh))/(2*hh) if x > 0 else (m1(hh) - m1(-hh))/(2*hh) for x in xs])
    return xs, m2
if __name__ == '__main__':
    xs, m2 = build_m2()
    np.savez(os.path.join(HERE, 'm2.npz'), x=xs, m2=m2)
    print('m2 at 0.1,0.3,0.6,1,2:', [float(np.interp(v, xs, m2)) for v in (0.1, 0.3, 0.6, 1.0, 2.0)])
    print('min m2 on x>=0', m2.min(), ' max|m2| on x>=1', np.abs(m2[xs >= 1]).max(), ' max m2', m2.max())
