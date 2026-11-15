# claude-b9ee, 15 Nov 2026: how much does Cauchy-Schwarz lose on the tilted content of the Wick monomial?
#   c_s = E[conj(y) q h_s(|q|^2)],  h_s = (g - g0) - s (j0 - j);   CS bound: min_k E[|q|^2 (h_s(|q|^2) - k)^2]  (since E[conj(y) q] = 0).
import numpy as np
from scipy import special
a, b, p = 699/1250, 179/1250, 2500/1891
def gl_panels(edges, n):
    xg, wg = np.polynomial.legendre.leggauss(n)
    x = np.concatenate([(lo + hi)/2 + (hi - lo)/2*xg for lo, hi in zip(edges[:-1], edges[1:])])
    w = np.concatenate([(hi - lo)/2*wg for lo, hi in zip(edges[:-1], edges[1:])]); return x, w
def radial(n, pan, rmax):
    r, w = gl_panels(np.linspace(0, 1, pan + 1)**1.5*rmax, n); return r, w*2*r*np.exp(-r*r)
sT, wT = radial(16, 22, 7.5); T = sT**2; rT = sT*(a + b*T); st, wt = radial(16, 22, 7.5); t = st**2
def parts(r, y):
    s = r + y; k2 = np.clip(4*r*y/(s*s), 0, 1 - 1e-15)
    A = (2/np.pi)*s*special.ellipe(k2); Kinv = (2/np.pi)*special.ellipk(k2)/s
    ok = y > 1e-9; ys = np.where(ok, y, 1.0); return A, np.where(ok, (A + (y*y - r*r)*Kinv)/(2*ys*ys), 1/(2*r))
I0, I1, I2 = [float(wT@(T**k/rT)) for k in range(3)]; j0 = I0/2; g0 = (I1 - I0)/2; kA = p - (I2 - 2*I1 + I0)/2
print('    u      D        C^2/D (s=0)  |  s      c_s^2/D    CS bound/D   loss   local cost k(s)   c_s^2/(k D)   CS/(k D)')
for u in (0.01, 0.0463, 0.09):
    q = np.sqrt(u)*st*(t - 2)/np.sqrt(2); y = np.abs(q)                      # real, y1 = st
    A, tau = parts(rT[None, :], y[:, None]); jv = tau@wT; gv = tau@(wT*(T - 1)); phi = 2*A@wT
    Ag, _ = parts(rT[None, :], np.sqrt(u)*st[:, None]); D = float(wt@(2*Ag@wT)) - float(wt@phi)
    for s in (0.0, 0.3434, 0.6, 0.75):
        h = (gv - g0) - s*(j0 - jv); c = float(wt@(st*q*h))                    # E[conj(y) q h]
        m2 = float(wt@(q*q)); k0 = float(wt@(q*q*h))/m2; cs = float(wt@(q*q*(h - k0)**2)); k = kA - 2*g0*s - (1 + j0)*s*s
        print('  %.4f  %.7f  %s  |  %.4f  %.6f   %.6f    %5.1f   %.5f          %.5f       %.5f' % (u, D, '%.6f' % (c*c/D) if s == 0 else '        ', s, c*c/D, cs/D, cs/(c*c), k, c*c/(k*D), cs/(k*D)))
