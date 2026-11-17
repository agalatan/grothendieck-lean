# claude-b9ee research worker (fourpartite): task 4, N-level exploration (floating point, orientation only).
# Q = sum_i ( lam_i (g_i^2 - 1) + mu_i g_i ),  ||Q||_2^2 = sum (2 lam_i^2 + mu_i^2) = 1.
# phi_Q(t) = prod_i (1+4lam^2t^2)^{-1/4} exp(-mu^2 t^2/(2(1+4lam^2t^2))) exp(i psi_i(t)),
# psi_i(t) = arctan(2 lam t)/2 - lam t - lam mu^2 t^3/(1+4 lam^2 t^2).
# E|Q| = (2/pi) int_0^inf (1 - Re phi_Q(t)) t^{-2} dt.
import numpy as np
from scipy import integrate, optimize
import sys, time

SQ2PI = np.sqrt(2/np.pi)

def EabsQ(lam, mu):
    lam = np.asarray(lam, float); mu = np.asarray(mu, float)
    v = np.sum(2*lam**2 + mu**2)
    def f(t):
        t2 = t*t; d = 1 + 4*lam*lam*t2
        lr = -0.25*np.sum(np.log(d)) - np.sum(mu*mu*t2/(2*d))
        ps = np.sum(0.5*np.arctan(2*lam*t) - lam*t - lam*mu*mu*t*t2/d)
        return (1 - np.exp(lr)*np.cos(ps))/t2
    pts = [0, 0.5, 1, 2, 3, 4, 6, 8, 12, 16, 24, 32, 48, 64, 100, 200, 400, 1000, 3000, 10000]
    tot = 0.0
    for lo, hi in zip(pts[:-1], pts[1:]):
        r, e = integrate.quad(f, lo, hi, limit=500, epsabs=1e-13, epsrel=1e-11)
        tot += r
    # tail int_T^inf (1 - Re phi)/t^2: |1 - Re phi| <= 2, Re phi -> 0 slowly; use 1/T +- 1/T
    tot += 1.0/pts[-1]
    return 2/np.pi*tot/np.sqrt(v)/SQ2PI

def ratio_direct_1d(lam, mu):
    """E|lam(g^2-1) + mu g| by direct 1D quadrature (cross-check), divided by sqrt(2/pi)||Q||"""
    def f(x):
        return abs(lam*(x*x - 1) + mu*x)*np.exp(-x*x/2)/np.sqrt(2*np.pi)
    # roots of lam(x^2-1) + mu x = 0
    pts = [-14.0, 14.0]
    if lam != 0:
        disc = mu*mu + 4*lam*lam
        r1 = (-mu - np.sqrt(disc))/(2*lam); r2 = (-mu + np.sqrt(disc))/(2*lam)
        pts = sorted([-14.0, 14.0] + [r for r in (r1, r2) if -14 < r < 14])
    tot = 0.0
    for lo, hi in zip(pts[:-1], pts[1:]):
        r, e = integrate.quad(f, lo, hi, limit=200, epsabs=1e-14, epsrel=1e-12)
        tot += r
    return tot/(SQ2PI*np.sqrt(2*lam*lam + mu*mu))

if __name__ == '__main__':
    t0 = time.time()
    print('one coordinate: Q = lam(g^2-1) + mu g, 2lam^2 + mu^2 = 1; ratio E|Q|/(sqrt(2/pi)||Q||)')
    best = (0, None)
    for th in np.linspace(0.0, np.pi/2, 31):
        lam = np.sin(th)/np.sqrt(2); mu = np.cos(th)
        r1 = ratio_direct_1d(lam, mu)
        if th in (0.0,) or abs(th - np.pi/4) < 0.03 or abs(th - np.pi/2) < 1e-9:
            r2 = EabsQ([lam], [mu])
            print('  lam=%.4f mu=%.4f  direct %.10f  fourier %.10f' % (lam, mu, r1, r2))
        if r1 > best[0]: best = (r1, (lam, mu))
    print('  max over the circle (direct quadrature, 31 points): %.10f at lam=%.4f mu=%.4f' % (best[0], *best[1]))
    sys.stdout.flush()
    rng = np.random.default_rng(5)
    print('random configurations (n coordinates): max ratio')
    for n in [2, 3, 5, 8]:
        mx = 0; arg = None
        for k in range(40):
            z = rng.normal(size=2*n)
            lam = z[:n]*rng.uniform(0, 1.5); mu = z[n:]
            r = EabsQ(lam, mu)
            if r > mx: mx, arg = r, (lam.copy(), mu.copy())
        print('  n=%d: max ratio %.8f at lam=%s mu=%s' % (n, mx, np.round(arg[0], 3), np.round(arg[1], 3)))
        sys.stdout.flush()
    print('local maximisation of the ratio (Nelder-Mead), n = 1..3, same-sign and mixed-sign starts')
    for n in [1, 2, 3]:
        def obj(z):
            return -EabsQ(z[:n], z[n:])
        bestv = 0; bestz = None
        for trial in range(4):
            z0 = rng.normal(size=2*n)
            res = optimize.minimize(obj, z0, method='Nelder-Mead', options={'maxiter': 300, 'xatol': 1e-5, 'fatol': 1e-10})
            if -res.fun > bestv: bestv, bestz = -res.fun, res.x
        lam, mu = bestz[:n], bestz[n:]
        nrm = np.sqrt(np.sum(2*lam**2 + mu**2))
        print('  n=%d: sup ratio >= %.8f at lam=%s mu=%s (normalised)' % (n, bestv, np.round(lam/nrm, 4), np.round(mu/nrm, 4)))
        sys.stdout.flush()
    # the near-Gaussian (Edgeworth) direction: many small equal-sign lam with linear terms
    print('Edgeworth check: kappa4 - kappa3^2 >= kappa4/4 (N, random)')
    worst = 1
    for k in range(2000):
        n = rng.integers(1, 6)
        lam = rng.normal(size=n); mu = rng.normal(size=n)
        v = np.sum(2*lam**2 + mu**2); lam /= np.sqrt(v); mu /= np.sqrt(v)
        k3 = np.sum(8*lam**3 + 6*mu**2*lam); k4 = np.sum(48*lam**4 + 48*mu**2*lam**2)
        worst = min(worst, 1 - k3**2/k4)
    print('  min of 1 - kappa3^2/kappa4 over 2000 random unit-variance Q: %.6f' % worst)
    print('time %.0f s' % (time.time() - t0))
