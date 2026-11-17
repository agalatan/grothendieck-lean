# det2d.py -- deterministic quadrature of the Omega_3 quantities for any P in the third chaos of two variables.
#   outer: x2 = z on Gauss-Hermite nodes; x1 = x on composite Gauss-Legendre panels around the real roots of the cubic
#          x -> P(x, z) (scaled by the local transition width) plus fixed panels for the factor phi(x);
#   inner: N_t(x, z) = E_G2[ P_G1( P(sqrt t x + sqrt(1-t) G1, sqrt t z + sqrt(1-t) G2) > 0 ) ], the G1-mass exact (real
#          roots of a cubic), G2 on Gauss-Hermite nodes.
# No Monte Carlo, no concavity bias. (claude-b9ee research worker, 17 Nov 2026)
import numpy as np, sys, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from omega3lib import tgrid, I_of_p, spectral_dmu_dv, phi, poly_pos_mass, TensorCubic, _cubic_real_roots

def gh(n):
    x, w = np.polynomial.hermite_e.hermegauss(n)
    return x, w/w.sum()

def zrule(P, nper):
    """Outer rule in z on [-10, 10]: composite panels with breakpoints at the real zeros of the discriminant (in z) of
    the cubic x -> P(x, z) (where the root structure in x changes: kinks of the integrand) and at fixed points;
    cosine-mapped Gauss-Legendre in each panel (clusters nodes at panel ends, removes sqrt singularities).
    Weights include phi(z)."""
    zz = np.linspace(-1.0, 1.0, 7)
    m = np.stack([np.zeros_like(zz), zz], 1); e = np.tile([1.0, 0.0], (len(zz), 1))
    cs = [np.polynomial.polynomial.polyfit(zz, c, 3) for c in P.line(m, e)]     # c_k(z) exactly (degree <= 3)
    c0, c1, c2, c3 = [np.polynomial.Polynomial(c) for c in cs]
    disc = 18*c3*c2*c1*c0 - 4*c2**3*c0 + c2**2*c1**2 - 4*c3*c1**3 - 27*c3**2*c0**2
    br = [-10.0, -5.0, -2.5, 0.0, 2.5, 5.0, 10.0]
    co = disc.coef
    if np.max(np.abs(co)) > 0:
        co = co/np.max(np.abs(co))
        while len(co) > 1 and abs(co[-1]) < 1e-13:
            co = co[:-1]
        if len(co) > 1:
            rr = np.polynomial.polynomial.polyroots(co)
            rr = rr[np.abs(rr.imag) < 1e-7*(1+np.abs(rr.real))].real
            br += [r for r in rr if -10 < r < 10]
    br = np.unique(np.round(np.sort(br), 12))
    u, wu = np.polynomial.legendre.leggauss(nper); u = 0.5*(u+1); wu = 0.5*wu
    s = 0.5*(1-np.cos(np.pi*u)); ds = 0.5*np.pi*np.sin(np.pi*u)
    zs, wz = [], []
    for lo, hi in zip(br[:-1], br[1:]):
        zs.append(lo + (hi-lo)*s); wz.append((hi-lo)*ds*wu)
    zs = np.concatenate(zs); wz = np.concatenate(wz)*phi(zs)
    return zs, wz

def real_roots_x(P, z):
    """real roots in x of P(x, z) for an array z (cubic in x)."""
    m = np.stack([np.zeros_like(z), z], 1); e = np.tile([1.0, 0.0], (len(z), 1))
    c0, c1, c2, c3 = P.line(m, e)
    R = np.full((len(z), 3), np.nan)
    good = np.abs(c3) > 1e-12*(np.abs(c0) + np.abs(c1) + np.abs(c2) + 1e-300)
    if np.any(good):
        R[good] = _cubic_real_roots(c0[good], c1[good], c2[good], c3[good])
    # degree < 3 (c3 = 0): quadratic / linear
    for i in np.where(~good)[0]:
        co = [c0[i], c1[i], c2[i]]
        while len(co) > 1 and abs(co[-1]) < 1e-14:
            co = co[:-1]
        if len(co) > 1:
            rr = np.roots(co[::-1]); rr = rr[np.abs(rr.imag) < 1e-12].real
            R[i, :len(rr)] = np.sort(rr)
    return R

def compute(P, nv=16, nz=64, n2=96, npan=10, rfac=(-14, -6, -2.5, -1, 0, 1, 2.5, 6, 14)):
    v, wv, t, wt = tgrid(nv)
    zs, wz = zrule(P, nz); nz = len(zs)
    g2, w2 = gh(n2)
    gl, glw = np.polynomial.legendre.leggauss(npan)
    roots = real_roots_x(P, zs)                                   # (nz, 3)
    mu = np.zeros(nv); A = np.zeros(nv)
    for it, tt in enumerate(t):
        st, s1 = np.sqrt(tt), np.sqrt(1-tt)
        brk = [np.tile(np.array([-10.0, -5.0, -2.5, 0.0, 2.5, 5.0, 10.0])[None, :], (nz, 1))]
        for k in range(3):
            xr = roots[:, k]
            ok = np.isfinite(xr)
            xr0 = np.where(ok, xr, 0.0)
            gr = P.grad(np.stack([xr0, zs], 1))
            ratio = np.linalg.norm(gr, axis=1)/np.maximum(np.abs(gr[:, 0]), 1e-12)
            w = np.clip(s1/st*ratio, 1e-5, 30.0)
            b = xr0[:, None] + w[:, None]*np.array(rfac)[None, :]
            b = np.where(ok[:, None], b, 0.0)
            brk.append(b)
        brk = np.sort(np.clip(np.concatenate(brk, 1), -10, 10), 1)
        lo, hi = brk[:, :-1], brk[:, 1:]
        xn = ((0.5*(lo+hi))[:, :, None] + (0.5*(hi-lo))[:, :, None]*gl[None, None, :]).reshape(nz, -1)
        xw = ((0.5*(hi-lo))[:, :, None]*glw[None, None, :]).reshape(nz, -1)
        nxn = xn.shape[1]
        # inner: base points m = (st x, st z + s1 g2), direction e1, scale s1
        Zb = np.broadcast_to(zs[:, None], xn.shape)
        mx = (st*xn)[:, :, None]*np.ones(n2)[None, None, :]
        mz = (st*Zb)[:, :, None] + s1*g2[None, None, :]
        m = np.stack([mx.ravel(), mz.ravel()], 1)
        e = np.tile([1.0, 0.0], (m.shape[0], 1))
        c0, c1, c2, c3 = P.line(m, e)
        p = poly_pos_mass(c0, c1*s1, c2*s1**2, c3*s1**3).reshape(nz, nxn, n2) @ w2
        Iv = I_of_p(p)
        pts = np.stack([xn.ravel(), Zb.ravel()], 1)
        gg = P.grad(pts); Gam = (np.sum(gg*gg, 1)/3.0).reshape(nz, nxn)
        W = wz[:, None]*xw*phi(xn)
        mu[it] = np.sum(W*Iv); A[it] = np.sum(W*Iv*Gam)
    # E Gamma and E|P| on the same outer rule (t-independent panels: use t -> 1 panels at the last t)
    pts = np.stack([xn.ravel(), Zb.ravel()], 1)
    gg = P.grad(pts); Gam = (np.sum(gg*gg, 1)/3.0).reshape(nz, nxn)
    EG = np.sum(W*Gam); EP = np.sum(W*np.abs(P.val(pts)).reshape(nz, nxn)); E1 = np.sum(W)
    wtd = wt*3*t**2
    cov = np.sum(wtd*(A/mu - EG/E1))
    R = np.sqrt(2/np.pi)*np.sqrt(1+cov)
    dmudv = spectral_dmu_dv(v, mu)
    B = np.sum(wv*np.sqrt(np.maximum(-dmudv*8*t**2*3*A*2*(1-v), 0.0)))
    return dict(cov=cov, R=R, B=B, EP=EP/E1, EG=EG/E1, E1=E1, t=t, ct=A/mu-EG/E1)

if __name__ == '__main__':
    kw = {}; files = []
    for s in sys.argv[1:]:
        if '=' in s:
            k, val = s.split('='); kw[k] = int(val)
        else:
            files.append(s)
    for f in files:
        if f == 'h3':
            T = np.zeros((2, 2, 2)); T[0, 0, 0] = 1.0
        else:
            T = np.load(f)
        P = TensorCubic(T)
        r = compute(P, **kw)
        print('%-28s %s | E|P|=%.6f B=%.6f R=%.6f Cov=%+.6f (outer-rule mass %.8f, E Gamma %.6f)'
              % (os.path.basename(f), kw, r['EP'], r['B'], r['R'], r['cov'], r['E1'], r['EG']), flush=True)
        print('   c(t): ' + ' '.join('%.4f:%+.5f' % (u, w) for u, w in zip(r['t'], r['ct'])), flush=True)
