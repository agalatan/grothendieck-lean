# claude-b9ee, 15 Nov 2026 (N).  Peak row, tilt s = 3/5.  With the global secant bound (secant_curvature.py),
#     gain(q, r) <= ||c_s(q)||^2 / (P - Sec)   for every r,   and codex-6e2b certified  ||c||^2 <= min{(2/25) chi u^2, (19321/10^6) u}.
# So the tilted sector inequality  gain <= kappa D(q)  follows wherever
#     B(u, chi) := min{(2/25) chi u^2, (19321/10^6) u} / (P - Sec)  <=  kappa D(q).
# This script compares B with the deficit D on a family running from the Gaussian (diffuse) limit to the Wick monomial:
#     q = sqrt(u (1 - lam)) G + sqrt(u lam) y (|y|^2 - 2)/sqrt 2,   G complex Gaussian independent of y,   chi = 42 lam^2.
import numpy as np
from scipy import special
a, b, p, s = 699/1250, 179/1250, 2500/1891, 0.6
P = p - s*s; SEC = 0.5997                         # numerical secant supremum at s = 0.6 (secant_curvature.log)
def gl_panels(edges, n):
    xg, wg = np.polynomial.legendre.leggauss(n)
    x = np.concatenate([(lo + hi)/2 + (hi - lo)/2*xg for lo, hi in zip(edges[:-1], edges[1:])])
    w = np.concatenate([(hi - lo)/2*wg for lo, hi in zip(edges[:-1], edges[1:])]); return x, w
rZ, wZ = gl_panels(np.linspace(0, 1, 61)**1.5*6.5, 16); TZ = rZ*rZ; wZ = wZ*2*rZ*np.exp(-TZ); ell = rZ*(a + b*TZ)
def hfun(y):                                      # h(|w|^2) = 2 E_Z |L + w| at |w| = y (array)
    y = np.asarray(y, float); sm = ell + y[..., None]
    return 2*((2/np.pi)*sm*special.ellipe(np.clip(4*ell*y[..., None]/(sm*sm), 0, 1)))@wZ
# tabulate h on a grid in y and interpolate (h is smooth in y)
yg = np.concatenate([np.linspace(0, 3, 3001), np.linspace(3, 60, 2001)[1:]]); hg = hfun(yg)
hint = lambda y: np.interp(y, yg, hg)
rt, wt = gl_panels(np.linspace(0, 1, 49)**1.5*6.0, 12); tt = rt*rt; wt = wt*2*rt*np.exp(-tt)            # y: |y|^2 = tt
rg, wg_ = gl_panels(np.linspace(0, 1, 49)**1.5*5.5, 12); wg_ = wg_*2*rg*np.exp(-rg*rg)                  # |G|
nph = 48; ph = 2*np.pi*(np.arange(nph) + 0.5)/nph
def F(u, lam):
    mu = np.sqrt(u*lam)*rt*(tt - 2)/np.sqrt(2)                                                          # real mean given y (phase of y irrelevant)
    al = np.sqrt(u*(1 - lam))
    y = np.abs(mu[:, None, None] + al*rg[None, :, None]*np.exp(1j*ph)[None, None, :])
    return float(wt@((hint(y).mean(axis=2))@wg_))
print('P - Sec = %.4f   (2/25)/(P - Sec) = %.4f   (19321/10^6)/(P - Sec) = %.5f' % (P - SEC, 0.08/(P - SEC), 0.019321/(P - SEC)))
print('    u      lam    chi        D          D/(chi u^2)   certified bound B    B/D')
for u in (0.0005, 0.005, 0.01, 0.02, 0.03, 0.0403, 0.0463):
    FG = F(u, 0.0)
    for lam in (0.02, 0.05, 0.1, 0.2, 0.35, 0.5, 0.75, 1.0):
        chi = 42*lam*lam; D = FG - F(u, lam); B = min(0.08*chi*u*u, 0.019321*u)/(P - SEC)
        print(' %.4f  %.2f  %7.3f   %.4e    %7.4f       %.4e      %.3f' % (u, lam, chi, D, D/(chi*u*u), B, B/D))
