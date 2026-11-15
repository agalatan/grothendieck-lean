# claude-b9ee, 15 Nov 2026 (N).  ALL five visible sectors at the peak row: is the remainder at a remote base globally
# below the penalty?   Raw K (no retained element).
#
#   h_e = (T - 1) rA + Z^2 conj(rB)/sqrt 2                      (even under Z -> -Z:  A and B sectors)
#   h_o = Z kQ + conj(Z) kP + nu Z (T - 2)/sqrt 2               (odd:  Z Q,  conj(Z) P,  the one-coordinate cubic)
#   F(w; r) = E_Z|L + w + h_e + h_o| + E_Z|L + w + h_e - h_o|    (the two signs of Lambda, after Z -> -Z in the second)
#   Rem(w; r) = F - 2 E_Z|L + w| - 2 E_Z Re[conj(h_e) ph(L + w)]      (the odd first-order terms cancel pointwise)
#   |r|^2 = |rA|^2 + |rB|^2 + |kQ|^2 + |kP|^2 + |nu|^2 = E_Z|h_e + h_o|^2   (the five sectors are orthonormal)
#
# If  Rem(w; r) <= (p - m)|r|^2  for all complex w and r in C^5, with m > 0, then for every remote cubic q and every choice
# of the five sector coefficient fields (any sharing, any amplitude; nu pointwise is more than needed):
#     Lambda(q + sectors) <= Lambda(q) + 2Re<c_A, r_A> + 2Re<c_B, r_B> - m ||sectors||^2,
# so the whole sector layer of K would reduce to the two contents c_A, c_B against the deficit, and the open uniform cost
# of the odd sectors over a nonzero core (STATUS 7.2.4) would follow.  The script minimises
#     margin(w, r) = p - Rem(w; r)/|r|^2
# by multistart local optimisation (a search: it can only find violations, not prove their absence).
# By a rotation of Z, w >= 0 is real.  Plain quadrature in (T, theta).
import sys, time
import numpy as np
from scipy import optimize

a, b, p = 699/1250, 179/1250, 2500/1891


def gl_panels(edges, n):
    xg, wg = np.polynomial.legendre.leggauss(n)
    x = np.concatenate([(lo + hi)/2 + (hi - lo)/2*xg for lo, hi in zip(edges[:-1], edges[1:])])
    w = np.concatenate([(hi - lo)/2*wg for lo, hi in zip(edges[:-1], edges[1:])])
    return x, w


class Grid:
    def __init__(self, npan, n, nth):
        r, w = gl_panels(np.linspace(0, 1, npan + 1)**1.5*6.0, n)
        T = r*r
        th = 2*np.pi*(np.arange(nth) + 0.5)/nth
        e = np.exp(1j*th)[None, :]
        self.Z = (r[:, None]*e).ravel()
        self.T = np.repeat(T, nth)
        self.L = self.Z*(a + b*self.T)
        self.W = np.repeat(w*2*r*np.exp(-T), nth)/nth
        self.fA = self.T - 1
        self.fB = self.Z**2/np.sqrt(2)
        self.fN = self.Z*(self.T - 2)/np.sqrt(2)

    def margin(self, w, r):
        rA, rB, kQ, kP, nu = r
        he = self.fA*rA + self.fB*np.conj(rB)
        ho = self.Z*kQ + np.conj(self.Z)*kP + self.fN*nu
        X0 = self.L + w
        A0 = np.abs(X0)
        val = self.W@(np.abs(X0 + he + ho) + np.abs(X0 + he - ho) - 2*A0 - 2*np.real(he*np.conj(X0))/A0)
        n2 = float(np.sum(np.abs(r)**2))
        return p - val/n2


NO_NU = '--no-nu' in sys.argv          # leave out the one-coordinate cubic nu Z (T - 2): see the note printed below


def unpack(x):
    w = abs(x[0])
    r = x[1:6] + 1j*x[6:11]
    if NO_NU:
        r = r.copy()
        r[4] = 0
    return w, r


if __name__ == '__main__':
    quick = '--quick' in sys.argv
    G = Grid(24, 8, 48)
    Gf = Grid(48, 10, 96)
    rng = np.random.default_rng(15)
    names = ['A', 'B', 'ZQ', 'conjZ P', 'nu']
    # 1. single sectors: sup over w and amplitude
    print('1. one sector at a time (grid over w in [0, 6] and amplitude in [0.02, 4]): smallest margin p - Rem/|r|^2')
    ws = np.linspace(0, 6, 61)
    amps = np.concatenate([np.linspace(0.02, 1, 25), np.linspace(1.1, 4, 15)])
    for k in range(5):
        best = (9.0, None)
        for ph in (np.linspace(0, np.pi, 5) if k != 2 and k != 4 else np.linspace(0, 2*np.pi, 8, endpoint=False)):
            for am in amps:
                r = np.zeros(5, complex)
                r[k] = am*np.exp(1j*ph)
                for w in ws:
                    m = G.margin(w, r)
                    if m < best[0]:
                        best = (m, (w, am, ph))
        print('   sector %-8s smallest margin %+.4f at w = %.2f, amplitude %.2f, phase %.2f' % ((names[k], best[0]) + best[1]))
        sys.stdout.flush()
    # 2. all sectors together: multistart
    nstart = 60 if quick else 400
    t0 = time.time()
    res = []
    for it in range(nstart):
        d = rng.standard_normal(10)
        if it % 4 == 1:
            d[[2, 3, 4, 7, 8, 9]] *= 0.1          # mostly even sectors
        if it % 4 == 2:
            d[[0, 1, 5, 6]] *= 0.1                # mostly odd sectors
        d /= np.linalg.norm(d)
        amp = np.exp(rng.uniform(np.log(0.03), np.log(3.0)))
        x0 = np.concatenate([[rng.uniform(0, 3.0)], amp*d])
        f = lambda x: G.margin(*unpack(x))
        o = optimize.minimize(f, x0, method='L-BFGS-B', options=dict(maxiter=120, maxfun=3000))
        res.append((o.fun, o.x))
    res.sort(key=lambda t: t[0])
    print('2. all five sectors, %d random starts with local minimisation (%.0f s): smallest margins found' % (nstart, time.time() - t0))
    for fun, x in res[:6]:
        w, r = unpack(x)
        print('   margin %+.4f (finer quadrature %+.4f)   w = %.3f   |r| = %.3f   shares A %.2f B %.2f ZQ %.2f cZP %.2f nu %.2f'
              % ((fun, Gf.margin(w, r), w, np.linalg.norm(r)) + tuple(np.abs(r)**2/np.sum(np.abs(r)**2))))
    print('   distribution of the local minima: min %+.4f, 10%% %+.4f, median %+.4f' % (res[0][0], res[len(res)//10][0], res[len(res)//2][0]))
    print('   Note: with nu the pointwise bound fails at once (margin -0.387 at w = 0, infinitesimal amplitude, direction ZQ + nu):')
    print('   Z kQ and nu Z(T-2) have the same frequency and the cross term E[sqrt(T)(T-2)/(a+bT)]/sqrt 2 = -0.608 is large. In the')
    print('   functional that cross term is nu-bar E[Q] = 0, because nu is a constant and E Q = 0: a pointwise statement cannot see it.')
