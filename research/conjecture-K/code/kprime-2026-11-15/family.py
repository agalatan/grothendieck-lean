# claude-b9ee, 15 Nov 2026.  The family  q = X [ c1 (|X|^2 - 2)/sqrt2 + c2 S_m/sqrt m ],  S_m = sum_{k<=m} (|Y_k|^2 - 1)
# (m = 0 stands for the Gaussian limit m -> infinity), c1^2 + c2^2 = u, with the A-sector (T-1) alpha X and the retained
# first-chaos element gamma X.  Exact quadrature in (|X|^2, S, T).  For each m: maximise the K and K' ratios over the angle.
import numpy as np, sys
from scipy import special, optimize
a, b, p = 699/1250, 179/1250, 2500/1891
def gl_panels(edges, n):
    xg, wg = np.polynomial.legendre.leggauss(n)
    x = np.concatenate([(lo + hi)/2 + (hi - lo)/2*xg for lo, hi in zip(edges[:-1], edges[1:])])
    w = np.concatenate([(hi - lo)/2*wg for lo, hi in zip(edges[:-1], edges[1:])]); return x, w
def radial(n, pan, rmax):
    r, w = gl_panels(np.linspace(0, 1, pan + 1)**1.5*rmax, n); return r, w*2*r*np.exp(-r*r)
sT, wT = radial(8, 8, 5.8); T = sT**2; rT = sT*(a + b*T)
sx, wx = radial(8, 8, 5.2); t = sx**2
def bath(m):                                      # nodes and weights of S_m/sqrt(m)
    if m == 0:
        x, w = gl_panels(np.linspace(-7, 7, 15), 8); return x, w*np.exp(-x*x/2)/np.sqrt(2*np.pi)
    hi = m + 12*np.sqrt(m) + 30; sg, w = gl_panels(np.linspace(0, 1, 17)**2*hi, 8)
    return (sg - m)/np.sqrt(m), w*np.exp((m - 1)*np.log(sg) - sg - special.gammaln(m))
def parts(r, y):
    s = r + y; k2 = np.clip(4*r*y/(s*s), 0, 1 - 1e-15)
    A = (2/np.pi)*s*special.ellipe(k2); Kinv = (2/np.pi)*special.ellipk(k2)/s
    ok = y > 1e-9; ys = np.where(ok, y, 1.0); return A, np.where(ok, (A + (y*y - r*r)*Kinv)/(2*ys*ys), 1/(2*r))
st_, wt_ = radial(16, 22, 7.5)
def LG(u): return 2*float(wT@(parts(rT[:, None], np.sqrt(u)*st_[None, :])[0]@wt_)) - p*u
def setup(m):
    s, ws = bath(m); TT, SS = np.meshgrid(t, s, indexing='ij'); W2 = (wx[:, None]*ws[None, :]).ravel()
    return np.sqrt(TT.ravel()), TT.ravel(), SS.ravel(), W2
def J(u, th, al, ga, G):
    sq, tt, ss, W2 = G; c1, c2 = np.sqrt(u)*np.cos(th), np.sqrt(u)*np.sin(th)
    amp = c1*(tt - 2)/np.sqrt(2) + c2*ss - ga                                   # q/X - gamma
    Wv = sq[:, None]*(amp[:, None] + (T[None, :] - 1)*al); A, q = parts(rT[None, :], np.abs(Wv)); Gf = Wv*q
    val = ga*ga + 2*W2@(A@wT) - p*(u + al*al)
    dal = 2*W2@(sq*(Gf@(wT*(T - 1)))) - 2*p*al; dga = -2*W2@(sq*(Gf@wT)) + 2*ga
    return val, dal, dga
def ratios(u, th, G, lg):
    J0 = J(u, th, 0.0, 0.0, G)[0]; D = lg - J0
    ak = optimize.brentq(lambda x: J(u, th, x, 0.0, G)[1], -0.4, 0.4, xtol=1e-12)
    sol = optimize.root(lambda x: J(u, th, x[0], x[1], G)[1:], [ak/2, -ak/3], method='hybr', tol=1e-12)
    return D, (J(u, th, ak, 0.0, G)[0] - J0)/D, (J(u, th, sol.x[0], sol.x[1], G)[0] - J0)/D, ak, sol.x
print('   m     u       | K: max ratio  at z      D        | K\': max ratio  at z      D         (alpha, gamma)       | K\' ratio at the K maximiser')
for m in (1, 2, 3, 5, 10, 30, 100, 0):
    G = setup(m)
    for u in (0.02, 0.0463, 0.09):
        lg = LG(u); best = {}
        for which in (1, 2):
            ths = np.linspace(-np.pi/2, np.pi/2, 49); vals = [ratios(u, th, G, lg)[which] for th in ths]; i = int(np.argmax(vals))
            r = optimize.minimize_scalar(lambda th: -ratios(u, th, G, lg)[which], bounds=(ths[max(i - 1, 0)], ths[min(i + 1, 48)]), method='bounded', options=dict(xatol=1e-6))
            best[which] = (r.x, ratios(u, r.x, G, lg))
        zz = lambda th: np.tan(th)*np.sqrt(2)/np.sqrt(max(m, 1))      # q ~ X[(|X|^2-2) + z S_m]  (m = 0: z multiplies the unit Gaussian)
        (thk, rk), (thp, rp) = best[1], best[2]
        print('  %3s  %.4f   |   %.5f    %+.4f  %.6f  |   %.5f     %+.4f  %.6f  (%+.4f, %+.4f)   |   %.5f' % ('inf' if m == 0 else m, u, rk[1], zz(thk), rk[0], rp[2], zz(thp), rp[0], rp[4][0], rp[4][1], rk[2]), flush=True)
