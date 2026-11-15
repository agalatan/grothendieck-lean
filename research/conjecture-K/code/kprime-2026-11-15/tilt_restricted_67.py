# claude-b9ee, 15 Nov 2026.  Second-derivative bound along the tilted A-direction (T - t0) rho, restricted to base points with
# |rho_base| <= R:  Theta(R) = sup_{w, |rho| <= R, chi} lambda_max E_T[(T - t0)^2 Hess A1(r_T, .)(w + (T - t0) rho)].
# The budget is p - s^2 (s = 1 - t0): the sector is concave along the whole segment as long as Theta(R) < p - s^2.
import numpy as np
from scipy import special, optimize
a, b, p = 699/1250, 179/1250, 2500/1891
def gl_panels(edges, n):
    xg, wg = np.polynomial.legendre.leggauss(n)
    x = np.concatenate([(lo + hi)/2 + (hi - lo)/2*xg for lo, hi in zip(edges[:-1], edges[1:])])
    w = np.concatenate([(hi - lo)/2*wg for lo, hi in zip(edges[:-1], edges[1:])]); return x, w
s_, w_ = gl_panels(np.linspace(0, 1, 301)**1.3*6.5, 8); T = s_**2; wT = w_*2*s_*np.exp(-T); rT = s_*(a + b*T)
def parts(r, y):
    s = r + y; k2 = np.clip(4*r*y/(s*s), 0, 1 - 1e-15)
    A = (2/np.pi)*s*special.ellipe(k2); Kinv = (2/np.pi)*special.ellipk(k2)/s
    ok = y > 1e-9; ys = np.where(ok, y, 1.0); tau = np.where(ok, (A + (y*y - r*r)*Kinv)/(2*ys*ys), 1/(2*r))
    return tau, Kinv - tau
def lam(w, rho, chi, t0):
    W = w + (T - t0)*rho*np.exp(1j*chi); y = np.abs(W); tau, rad = parts(rT, y); ok = y > 1e-12; ys = np.where(ok, y, 1)
    n1 = np.where(ok, W.real/ys, 1.0); n2 = np.where(ok, W.imag/ys, 0.0)
    wt = wT*(T - t0)**2; m11 = wt@(tau + (rad - tau)*n1*n1); m22 = wt@(tau + (rad - tau)*n2*n2); m12 = wt@((rad - tau)*n1*n2)
    return float((m11 + m22)/2 + np.sqrt(((m11 - m22)/2)**2 + m12**2))
I0, I1, I2 = [float(wT@(T**k/rT)) for k in range(3)]
print('   s       budget p-s^2   value at 0 |  Theta(R) for R = 0      0.02     0.05     0.10     0.15     0.20     0.30     0.50')
for s in (0.6, 0.7):
    t0 = 1 - s; row = []
    for R in (0.0, 0.02, 0.05, 0.10, 0.15, 0.20, 0.30, 0.50):
        best = 0.0
        for rho in ([0.0] if R == 0 else np.linspace(0, R, 9)[1:] if R > 0.02 else [R/2, R]):
            for w in np.concatenate([np.linspace(0, 1.5, 61), np.linspace(1.6, 6, 23)]):
                for chi in np.linspace(0, np.pi, 17):
                    best = max(best, lam(w, rho, chi, t0))
                    if rho == 0: break
        row.append(best)
    print('   %.4f  %.5f       %.5f    |              ' % (s, p - s*s, (I2 - 2*t0*I1 + t0*t0*I0)/2) + '  '.join('%.4f' % v for v in row), flush=True)
