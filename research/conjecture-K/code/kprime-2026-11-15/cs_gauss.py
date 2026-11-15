# claude-b9ee, 15 Nov 2026.  The Cauchy-Schwarz bound on the tilted A-sector gain as a functional of the law of |q|^2:
#   gain <= E[ |q|^2 (h_s(|q|^2) - k0)^2 ] / k(s)      (local cost k(s); the finite-amplitude loss is not included).
# Evaluated for the exponential law |q|^2 ~ u Exp(1) (a Gaussian remote q, deficit D = 0, the worst case of the remote part):
# there the true content is 0, so this number is pure loss, to be compared with the slack eta of the target.
import numpy as np
from scipy import special, optimize
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
print('target 1.402 needs N <= 500/701 = 0.7132668; the model norm is 0.7131355: slack eta = 1.31e-4 (for 1.4022: 0.30e-4)')
print('    u       |  loss at s = 0      0.2       0.3434    0.5       0.6       0.7      |  best s   loss')
for u in (0.02, 0.03, 0.0463, 0.06, 0.08):
    y = np.sqrt(u*t); A, tau = parts(rT[None, :], y[:, None]); jv = tau@wT; gv = tau@(wT*(T - 1)); v = u*t
    def loss(s):
        h = (gv - g0) - s*(j0 - jv); k0 = float(wt@(v*h))/float(wt@v); return float(wt@(v*(h - k0)**2))/(kA - 2*g0*s - (1 + j0)*s*s)
    r = optimize.minimize_scalar(loss, bounds=(0.0, 0.8), method='bounded', options=dict(xatol=1e-6))
    print('  %.4f    |  ' % u + '  '.join('%.2e' % loss(s) for s in (0.0, 0.2, 0.3434, 0.5, 0.6, 0.7)) + '   |  %.4f   %.2e' % (r.x, r.fun))
