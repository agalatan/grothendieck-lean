# claude-b9ee, 15 Nov 2026: independent numerical checks (N) of the second delivery of codex-6e2b on the tilted sector
# (s = 3/5, peak row).  Nothing here is a certificate; it tests the scalar claims the proofs rest on.
#
#   Phi(x) = E_Z[(T - d) ph(L + x)] - x H(0),  d = 2/5,   Phi = x h_s(|x|^2),   F(R) = Phi_1(R, 0) + R H(0).
#   Hessian entries at (R, 0):  A = F''(R),  B = (F'(R) - F(R)/R)/R.
#   N(R) = max{(3A^2 - 2AB + 3B^2)/8, B^2}     claim: sup_R N(R) < 1/3   (content_profile_proof.md)
#   claim: -1/40 < h_s(v) < 253/1000 for all v >= 0                     (profile_range.py)
#   claim: Theta(3/10) <= 3/4 is checked separately (tilt_restricted_67.log: grid value 0.7086).
#
# Two independent routes to (A, B):
#   (i)  F by one-dimensional quadrature of the closed angular mean (mpmath, 25 digits), differentiated numerically;
#   (ii) the smooth two-dimensional formula (8) of the note, by Gauss-Legendre quadrature (numpy).
# Route (i) does not use the note's formula; agreement of the two validates (8), and (ii) then scans all R.
import sys, time
import numpy as np
import mpmath as mp

a, b, d = 699/1250, 179/1250, 2/5
mp.mp.dps = 25
ma, mb, md = mp.mpf(699)/1250, mp.mpf(179)/1250, mp.mpf(2)/5


def root_t(v):                                   # t with t (a + b t)^2 = v
    v = mp.mpf(v)
    if v <= 0:
        return mp.mpf(0)
    t = v/(ma*ma + v)                            # Newton; the cubic is increasing and convex for t >= 0
    for _ in range(200):
        dt = (t*(ma + mb*t)**2 - v)/((ma + mb*t)*(ma + 3*mb*t))
        t -= dt
        if abs(dt) < mp.mpf(10)**(-mp.mp.dps + 2)*(1 + abs(t)):
            break
    return t


def rho(l, R):                                   # E_theta Re ph(R + l e^{i theta}),  l, R > 0
    if l <= R:
        return 2/mp.pi*mp.ellipe((l/R)**2)
    m = (R/l)**2
    return 2*l/(mp.pi*R)*(mp.ellipe(m) - (1 - m)*mp.ellipk(m))


def Fmp(R):
    R = mp.mpf(R)
    ts = root_t(R*R)
    f = lambda t: mp.exp(-t)*(t - md)*rho(mp.sqrt(t)*(ma + mb*t), R)
    return mp.quad(f, [0, ts/2, ts, 2*ts + 1, 4*ts + 8, 60])


def AB_mp(R):
    R = mp.mpf(R)
    F0 = Fmp(R)
    F1 = mp.diff(Fmp, R, 1, h=mp.mpf('1e-6'))
    F2 = mp.diff(Fmp, R, 2, h=mp.mpf('1e-5'))
    return float(F2), float((F1 - F0/R)/R)


# ---- route (ii): formula (8)
def kfun(v):                                     # k(|z|^2) = 2 f_t(t)/((a + b t)(a + 3 b t)),  f = (t - d) e^{-t}/(pi (a+bt)(a+3bt))
    v = np.asarray(v, float)
    t = v/(a*a + v)                              # Newton for t (a + b t)^2 = v, monotone
    for _ in range(60):
        g = t*(a + b*t)**2 - v
        t = t - g/((a + b*t)*(a + 3*b*t))
    Dn = (a + b*t)*(a + 3*b*t)
    Dp = 4*a*b + 6*b*b*t
    ft = np.exp(-t)*((1 - (t - d))*Dn - (t - d)*Dp)/(np.pi*Dn*Dn)
    return 2*ft/Dn


def gl(n, lo, hi):
    x, w = np.polynomial.legendre.leggauss(n)
    return (lo + hi)/2 + (hi - lo)/2*x, (hi - lo)/2*w


def panels(edges, n):
    xs, ws = zip(*[gl(n, lo, hi) for lo, hi in zip(edges[:-1], edges[1:])])
    return np.concatenate(xs), np.concatenate(ws)


TH, WTH = panels(np.linspace(0, np.pi, 13), 16)  # theta on [0, pi], doubled below


def AB_8(R, ns=24):
    S = R + 14.0
    edges = np.unique(np.concatenate([np.linspace(0, max(R, 0.5), 9), max(R, 0.5) + np.linspace(0, 1, 13)**2*(S - max(R, 0.5))]))
    s, ws = panels(edges, ns)
    c, sn = np.cos(TH)[None, :], np.sin(TH)[None, :]
    x1 = R - s[:, None]*c
    kk = kfun(x1*x1 + (s[:, None]*sn)**2)
    A = 2*float(ws@((sn*sn*x1*kk)@WTH))
    B = 2*float(ws@((s[:, None]*c*sn*sn*kk)@WTH))
    return A, B


def N_of(A, B):
    return max((3*A*A - 2*A*B + 3*B*B)/8, B*B)


if __name__ == '__main__':
    t0 = time.time()
    print('1. Two routes to the Hessian entries (A, B) of Phi at (R, 0):')
    for R in (() if '--skip1' in sys.argv else (0.15, 0.4, 0.7, 1.0, 1.6, 2.5, 4.0)):
        A1, B1 = AB_mp(R)
        A2, B2 = AB_8(R)
        print('   R = %.2f   mpmath: A = %+.8f  B = %+.8f    formula (8): A = %+.8f  B = %+.8f    N = %.6f' % (R, A1, B1, A2, B2, N_of(A2, B2)))
    sys.stdout.flush()
    Rs = np.concatenate([np.linspace(0.002, 3, 1500), np.linspace(3, 12, 451)[1:]])
    AB = np.array([AB_8(R) for R in Rs])
    Nv = np.array([N_of(A, B) for A, B in AB])
    i = int(Nv.argmax())
    print('2. sup over R in (0, 12] of N_Phi(R) = %.6f at R = %.4f   (claim: < 1/3 = 0.333333);  N at R = 4, 8, 12: %.5f, %.5f, %.6f'
          % (Nv[i], Rs[i], Nv[np.argmin(abs(Rs - 4))], Nv[np.argmin(abs(Rs - 8))], Nv[-1]))
    mh = AB[:, 0]**2 + 3*AB[:, 1]**2
    j = int(mh.argmax())
    print('   sup of m_h = A^2 + 3B^2: %.5f at v = R^2 = %.4f   (my first review said 244 at v = 0.46: a spline artefact)' % (mh[j], Rs[j]**2))
    # profile range: h_s(v) = F(R)/R - H(0), H(0) = (I1 - d I0)/2
    I0 = float(mp.quad(lambda t: mp.exp(-t)/(mp.sqrt(t)*(ma + mb*t)), [0, 1, 60]))
    I1 = float(mp.quad(lambda t: mp.sqrt(t)*mp.exp(-t)/(ma + mb*t), [0, 1, 60]))
    H0 = (I1 - d*I0)/2
    mp.mp.dps = 15
    Rg = np.concatenate([np.linspace(0.02, 3, 150), np.linspace(3, 40, 75)[1:]])
    hv = np.array([float(Fmp(R))/R - H0 for R in Rg])
    print('3. profile h_s: H(0) = %.9f;  min over the grid %.6f at R = %.2f (limit -H(0) at infinity; claim > -0.025);  max %.6f at v = %.4f (claim < 0.253)'
          % (H0, hv.min(), Rg[int(hv.argmin())], hv.max(), Rg[int(hv.argmax())]**2))
    # first-review table again, with the correct m_h: (3/4) delta E m_h(|q|^2) on the Wick monomial, against (2/25) delta
    tq, wq = panels(np.linspace(0, 1, 41)**2*40, 12)
    wq = wq*np.exp(-tq)
    print('4. Wick monomial q = sqrt(u/2) y (|y|^2 - 2): the two structural bounds (delta = 42 u^2)')
    for u in (0.0005, 0.005, 0.01, 0.02, 0.03, 0.0463):
        v = np.clip(u*tq*(tq - 2)**2/2, Rs[0]**2, Rs[-1]**2)
        Em = float(wq@np.interp(np.sqrt(v), Rs, mh))
        delta = 42*u*u
        print('   u = %.4f   E m_h = %.4f   old bound (3/4) delta E m_h = %.3e   new bound (2/25) delta = %.3e   ratio old/new = %.1f'
              % (u, Em, 0.75*delta*Em, 0.08*delta, 0.75*Em/0.08))
    print('elapsed %.0f s' % (time.time() - t0))
