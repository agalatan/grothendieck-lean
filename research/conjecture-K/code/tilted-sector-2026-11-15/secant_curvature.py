# claude-b9ee, 15 Nov 2026 (N).  Tilted sector at the peak row: is there a GLOBAL quadratic bound for the remainder?
#
#   f(w, rho) = E_Z |L + w + (T - d) rho|,   L = Z (a + b T),  T = |Z|^2,  d = 1 - s.
#   Rem(w, rho) = 2 [ f(w, rho) - f(w, 0) - <grad_rho f(w, 0), rho> ]                     (>= 0, convex in rho)
#   Secant curvature   Sec(s) = sup over w, rho of Rem(w, rho) / |rho|^2.
#
# If Sec(s) < P = p - s^2, then for EVERY remote q and EVERY linear r (no localisation, no tail, no maximiser):
#       2E|L + q + (T - d) r| - 2E|L + q| - P ||r||^2  <=  2 ||c_s(q)|| ||r|| - (P - Sec) ||r||^2  <=  ||c_s(q)||^2 / (P - Sec).
# The Hessian supremum Theta(R) is larger than P for R >= 0.4 or so (and infinite past the fold |rho| ~ 0.49), but the
# secant is an average of the Hessian along the segment, so it can stay below P.
#
# The phase of Z is uniform and independent of T, so  f(w, rho) = E_T[ M(l(T), |w + (T - d) rho|) ],
# M(l, y) = E_theta |l e^{i theta} + y| = (2/pi)(l + y) E(4 l y/(l + y)^2),  l(T) = sqrt(T)(a + b T):  one integral.
import sys
import numpy as np
from scipy import special

a, b, p = 699/1250, 179/1250, 2500/1891


def gl_panels(edges, n):
    xg, wg = np.polynomial.legendre.leggauss(n)
    x = np.concatenate([(lo + hi)/2 + (hi - lo)/2*xg for lo, hi in zip(edges[:-1], edges[1:])])
    w = np.concatenate([(hi - lo)/2*wg for lo, hi in zip(edges[:-1], edges[1:])])
    return x, w


def make(npan, n):
    r, w = gl_panels(np.linspace(0, 1, npan + 1)**1.5*6.5, n)      # Z radius; T = r^2
    return r*r, w*2*r*np.exp(-r*r), r*(a + b*r*r)


def M(l, y):
    sm = l + y
    return (2/np.pi)*sm*special.ellipe(np.clip(4*l*y/(sm*sm), 0, 1))


def tau(l, y):                                   # grad_w E_theta|l e^{i theta} + w| = w tau(l, |w|)
    sm = l + y
    k2 = np.clip(4*l*y/(sm*sm), 0, 1 - 1e-15)
    A = (2/np.pi)*sm*special.ellipe(k2)
    Kinv = (2/np.pi)*special.ellipk(k2)/sm
    return np.where(y > 1e-9, (A + (y*y - l*l)*Kinv)/(2*np.maximum(y, 1e-9)**2), 1/(2*l))


def rem_over_rho2(T, wT, ell, d, w1, w2, rho):
    """Rem/|rho|^2 for arrays w1, w2 (broadcast) and scalar rho > 0 (rho real by rotation)."""
    A = T - d
    W1 = w1[..., None]
    W2 = w2[..., None]
    y0 = np.hypot(W1, W2)
    y1 = np.hypot(W1 + A*rho, W2)
    f1 = M(ell, y1)@wT
    f0 = M(ell, y0)@wT
    g1 = (A*W1*tau(ell, y0))@wT                 # d/d rho at 0 of f = E[A Re(w) tau]
    return 2*(f1 - f0 - rho*g1)/(rho*rho)


if __name__ == '__main__':
    quick = '--quick' in sys.argv
    T, wT, ell = make(60, 16)
    T2, wT2, ell2 = make(120, 20)
    rhos = np.concatenate([np.linspace(0.02, 0.6, 30), np.linspace(0.65, 2.0, 28), np.linspace(2.2, 6.0, 12)])
    w1g = np.linspace(-7, 7, 141 if not quick else 57)
    w2g = np.linspace(0, 7, 71 if not quick else 29)
    W1, W2 = np.meshgrid(w1g, w2g, indexing='ij')
    for s in (0.6, 0.5, 0.7, 0.3434, 0.0):
        d = 1 - s
        P = p - s*s
        best = (-1, None)
        prof = []
        for rho in rhos:
            V = rem_over_rho2(T, wT, ell, d, W1, W2, rho)
            i = np.unravel_index(int(V.argmax()), V.shape)
            prof.append((rho, float(V[i]), float(W1[i]), float(W2[i])))
            if V[i] > best[0]:
                best = (float(V[i]), (rho, float(W1[i]), float(W2[i])))
        # refine around the best point on the finer quadrature
        rho0, a1, a2 = best[1]
        rr = np.linspace(max(0.01, rho0 - 0.05), rho0 + 0.05, 21)
        u1 = np.linspace(a1 - 0.12, a1 + 0.12, 49)
        u2 = np.linspace(max(0, a2 - 0.12), a2 + 0.12, 49)
        U1, U2 = np.meshgrid(u1, u2, indexing='ij')
        fine = max((float(rem_over_rho2(T2, wT2, ell2, d, U1, U2, r).max()), r) for r in rr)
        small = float(rem_over_rho2(T2, wT2, ell2, d, np.array([0.0]), np.array([0.0]), 1e-3)[0])
        print('s = %.4f   P = %.4f   Hessian at the origin (rho -> 0, w = 0) %.4f   SECANT SUP = %.4f at rho = %.3f, w = (%.2f, %.2f)   refined %.4f   P - Sec = %+.4f'
              % (s, P, small, best[0], rho0, a1, a2, fine[0], P - fine[0]))
        print('      sup over w of Rem/rho^2 as a function of rho: ' + '  '.join('%.2f:%.3f' % (r, v) for r, v, _, _ in prof[::6]))
        sys.stdout.flush()
