# claude-b9ee, 15 Nov 2026 (N).  Joint A/B sectors at the peak row: is there a GLOBAL quadratic bound for the remainder?
#
#   h(Z; rA, rB) = (T - 1 + sA) rA + sB rB + Z^2 conj(rB)/sqrt 2          (tilt: retained element u = -sA rA - sB rB)
#   f(w; rA, rB) = E_Z |L + w + h|,      Rem = 2 [ f - f(w; 0, 0) - (first-order term at 0) ]  >= 0,
#   cost form     C(rA, rB) = p (|rA|^2 + |rB|^2) - |sA rA + sB rB|^2.
# If  Rem(w; rA, rB) <= C(rA, rB) - m (|rA|^2 + |rB|^2)  for all complex w, rA, rB  with m > 0, then for every remote q and
# all remote linear r_A, r_B (any sharing, any amplitude):
#   Lambda_hat(q + (T-1) r_A + Z^2 conj(r_B)/sqrt 2) <= Lambda(q) + 2Re<c_A, r_A> + 2Re<c_B, r_B> - m (||r_A||^2 + ||r_B||^2),
# so the joint gain is at most (||c_A||^2 + ||c_B||^2)/m: the finite-amplitude joint remainder problem (STATUS 15, item 1)
# would be settled by one scalar inequality.  This script estimates  m = inf over directions of [C - sup_w Rem]/(|rA|^2+|rB|^2).
# By rotation rA >= 0 is real; by conjugation Im w >= 0.  Plain quadrature in (T, theta); no closed forms.
import sys, time
import numpy as np

a, b, p = 699/1250, 179/1250, 2500/1891


def gl_panels(edges, n):
    xg, wg = np.polynomial.legendre.leggauss(n)
    x = np.concatenate([(lo + hi)/2 + (hi - lo)/2*xg for lo, hi in zip(edges[:-1], edges[1:])])
    w = np.concatenate([(hi - lo)/2*wg for lo, hi in zip(edges[:-1], edges[1:])])
    return x, w


def setup(npan, n, nth):
    r, w = gl_panels(np.linspace(0, 1, npan + 1)**1.5*6.0, n)
    T = r*r
    wT = w*2*r*np.exp(-T)
    th = 2*np.pi*(np.arange(nth) + 0.5)/nth
    L = (r*(a + b*T))[:, None]*np.exp(1j*th)[None, :]            # (T, theta)
    Z2 = T[:, None]*np.exp(2j*th)[None, :]
    W = (wT[:, None]*np.ones(nth)[None, :]/nth)
    return T, L.ravel(), Z2.ravel(), np.repeat(T, nth), W.ravel()


def rem(grid, wvals, rA, rB, sA, sB):
    """Rem for an array of base values w (complex) at one sector point (rA real >= 0, rB complex)."""
    T, L, Z2, Tn, W = grid
    h = (Tn - 1 + sA)*rA + sB*rB + Z2*np.conj(rB)/np.sqrt(2)
    out = np.empty(len(wvals))
    for k0 in range(0, len(wvals), 64):
        X0 = L[None, :] + wvals[k0:k0 + 64, None]
        A0 = np.abs(X0)
        lin = np.real(h[None, :]*np.conj(X0))/A0
        out[k0:k0 + 64] = 2*((np.abs(X0 + h[None, :]) - A0 - lin)@W)
    return out


if __name__ == '__main__':
    quick = '--quick' in sys.argv
    grid = setup(36, 8, 48) if quick else setup(48, 10, 64)
    w1 = np.linspace(-3.0, 3.0, 13 if quick else 25)
    w2 = np.linspace(0.0, 3.0, 7 if quick else 13)
    wv = (w1[:, None] + 1j*w2[None, :]).ravel()
    amps = [0.05, 0.15, 0.3, 0.5, 0.8, 1.2, 2.0] if quick else [0.03, 0.1, 0.2, 0.35, 0.5, 0.7, 1.0, 1.4, 2.0, 3.0]
    mix = [0.0, 0.2, 0.4, 0.6, 0.8, 1.0] if quick else [0.0, 0.125, 0.25, 0.375, 0.5, 0.625, 0.75, 0.875, 1.0]   # angle between the A and B axes
    psis = np.linspace(0, 2*np.pi, 6 if quick else 12, endpoint=False)
    for sA, sB in ((0.0, 0.0), (0.6, 0.0), (0.5, 0.0), (0.3434, 0.0)):
        t0 = time.time()
        worst = (1e9, None)
        byshare = {}
        for share in mix:                                         # (rA, |rB|) = amp (cos, sin)(share pi/2)
            ca, sb = np.cos(share*np.pi/2), np.sin(share*np.pi/2)
            best = (1e9, None)
            for amp in amps:
                for psi in (psis if sb > 1e-12 else [0.0]):
                    rA, rB = amp*ca, amp*sb*np.exp(1j*psi)
                    R = rem(grid, wv, rA, rB, sA, sB)
                    k = int(R.argmax())
                    cost = p*amp*amp - abs(sA*rA + sB*rB)**2
                    m = (cost - R[k])/(amp*amp)
                    if m < best[0]:
                        best = (m, (amp, psi, wv[k], R[k]/(amp*amp), cost/(amp*amp)))
            byshare[share] = best
            if best[0] < worst[0]:
                worst = (best[0], share) + best[1:]
        print('tilt (sA, sB) = (%.4f, %.2f):  margin m by direction (share of B from 0 = pure A to 1 = pure B):' % (sA, sB))
        print('    ' + '  '.join('%.3f:%+.3f' % (sh, byshare[sh][0]) for sh in mix))
        sh = worst[1]
        amp, psi, w0, sec, cost = byshare[sh][1]
        print('    smallest margin %+.4f at share %.3f, amplitude %.2f, phase %.2f, w = %.2f%+.2fi  (Rem/|r|^2 = %.4f, cost/|r|^2 = %.4f)   [%.0f s]'
              % (worst[0], sh, amp, psi, w0.real, w0.imag, sec, cost, time.time() - t0))
        sys.stdout.flush()
