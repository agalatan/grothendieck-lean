# claude-b9ee, 15 Nov 2026: the profile ratio (g(v) - g0)/(j0 - j(v)) at small v with adaptive quadrature
# (breakpoint at the radius where |L| = sqrt v), to see whether the non-monotone first entry of tilt_profiles.log is real.
import numpy as np
from scipy import special, integrate, optimize
a, b = 699/1250, 179/1250
rs = lambda s: s*(a + b*s*s)
def tau(r, y):            # (d/dy E_theta |r e^{i theta} + y|)/y
    s = r + y; k2 = min(4*r*y/(s*s), 1 - 1e-16); A = (2/np.pi)*s*special.ellipe(k2); Kinv = (2/np.pi)*special.ellipk(k2)/s
    return (A + (y*y - r*r)*Kinv)/(2*y*y)
def diff(y, weight):      # integral over s of 2 s e^{-s^2} weight(s^2) [1/(2 r) - tau(r, y)]  (so j0 - j, or g0 - g)
    f = lambda s: 2*s*np.exp(-s*s)*weight(s*s)*(1/(2*rs(s)) - tau(rs(s), y)) if s > 0 else 0.0
    sst = optimize.brentq(lambda s: rs(s) - y, 0, 9)
    pts = sorted(set([sst*x for x in (0.25, 0.5, 0.8, 0.95, 1.0, 1.05, 1.25, 2, 4, 10, 40)] + [0.5, 1, 2, 4]))
    pts = [x for x in pts if 0 < x < 9]
    return integrate.quad(f, 0, 9, points=pts, limit=2000, epsabs=1e-15, epsrel=1e-12)[0]
print('    v          j0 - j(v)       g(v) - g0       ratio')
for v in (1e-6, 1e-5, 1e-4, 3e-4, 1e-3, 3e-3, 1e-2, 3e-2):
    y = np.sqrt(v); dj = diff(y, lambda T: 1.0); dg = -diff(y, lambda T: T - 1.0)
    print('  %.0e   %.9e  %.9e   %.6f   [(j0-j)/v = %.4f]' % (v, dj, dg, dg/dj, dj/v))
