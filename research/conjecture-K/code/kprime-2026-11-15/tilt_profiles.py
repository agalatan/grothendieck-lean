# claude-b9ee, 15 Nov 2026.  The tilted A-sector of K'.
# Retaining the first-chaos penalty and choosing ups = -s r (r the A-sector form) turns the A-direction (|Z|^2 - 1) r into
# (|Z|^2 - 1 + s) r, at local cost  k(s) = k_A - 2 g0 s - (1 + j0) s^2  and with content  Pi_1[ q h_s(|q|^2) ],
#   h_s(v) = (g(v) - g0) - s (j0 - j(v)),   g(v) = E[(T-1) phase(L+w)]/w,  j(v) = E[phase(L+w)]/w,  v = |w|^2.
# Part 1: the two profiles and their ratio.  Part 2: the global bound on the second derivative along the tilted direction,
#   Theta(t0) = sup over base points (w, rho) of lambda_max E_T[(T - t0)^2 Hess A1(r_T, .)(w + (T - t0) rho)],   t0 = 1 - s.
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
    return A, tau, Kinv - tau                      # value, tangential and radial second derivatives
I0, I1, I2 = [float(wT@(T**k/rT)) for k in range(3)]; j0 = I0/2; g0 = (I1 - I0)/2; kA = p - (I2 - 2*I1 + I0)/2
print('I = %.9f %.9f %.9f   j0 = %.9f  g0 = %.9f  k_A = %.9f' % (I0, I1, I2, j0, g0, kA))
print('\nprofiles:   v      j(v)       g(v)      (g-g0)/(j0-j)')
for v in (1e-4, 1e-3, 0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30, 100, 1e4):
    y = np.sqrt(v); A, tau, rad = parts(rT, y); j = float(wT@tau); g = float(wT@((T - 1)*tau))
    print('   %10.4f  %.6f  %+.6f   %.5f' % (v, j, g, (g - g0)/(j0 - j)))
print('   limit v -> infinity: -g0/j0 = %.5f' % (-g0/j0))
def lam(x, t0):
    w, rho, chi = x; W = w + (T - t0)*rho*np.exp(1j*chi); y = np.abs(W); A, tau, rad = parts(rT, y)
    n1 = np.where(y > 1e-12, W.real/np.where(y > 1e-12, y, 1), 1.0); n2 = np.where(y > 1e-12, W.imag/np.where(y > 1e-12, y, 1), 0.0)
    wt = wT*(T - t0)**2; m11 = wt@(tau + (rad - tau)*n1*n1); m22 = wt@(tau + (rad - tau)*n2*n2); m12 = wt@((rad - tau)*n1*n2)
    return float((m11 + m22)/2 + np.sqrt(((m11 - m22)/2)**2 + m12**2))
print('\nglobal second-derivative bound along (T - t0) rho, and the resulting global cost  p - s^2 - Theta:')
print('   s      t0      value at 0   Theta (sup)   at (w, |rho|, chi)            local cost k(s)   global cost')
for s in (0.0, 0.2, 0.3434, 0.5, 0.6, 0.7, 0.75):
    t0 = 1 - s; at0 = (I2 - 2*t0*I1 + t0*t0*I0)/2; best = (at0, (0, 0, 0))
    for w in np.linspace(0, 4, 33):
        for rho in np.linspace(0, 3, 31):
            for chi in np.linspace(0, np.pi, 13):
                v = lam((w, rho, chi), t0)
                if v > best[0]: best = (v, (w, rho, chi))
    r = optimize.minimize(lambda x: -lam(x, t0), best[1], method='Nelder-Mead', options=dict(xatol=1e-5, fatol=1e-9, maxiter=600))
    th = max(best[0], -r.fun); xb = r.x if -r.fun >= best[0] else best[1]
    print('   %.4f %.4f   %.6f     %.6f     (%.3f, %.3f, %.3f)        %+.5f          %+.5f' % (s, t0, at0, th, xb[0], abs(xb[1]), xb[2], kA - 2*g0*s - (1 + j0)*s*s, p - s*s - th))
