# bath_limit.py -- deterministic quadrature of the Omega_3 quantities on the Gaussian-bath limit family
#     P = a h3(X) + b X Y + c Z,   a^2 + b^2 + c^2 = 1,   h3 = He3/sqrt6,
# taken as the limit of the third-chaos variables a h3(X) + b X sum(U_i^2-1)/sqrt(2K) + c sum h3(V_j)/sqrt(K), K -> inf.
# In that limit Y and Z are standard Gaussians that move under the Ornstein-Uhlenbeck semigroup at the rates of the
# 2nd and 3rd chaos:  given time-0 values, the time-t values are
#     X' = sqrt(t) x + sqrt(1-t) G1,   Y' = t y + sqrt(1-t^2) G2,   Z' = t^(3/2) z + sqrt(1-t^3) G3,
# and |grad P|^2 = (a h3'(X) + b Y)^2 + 2 b^2 X^2 + 3 c^2 (|grad Y|^2 -> 2, |grad Z|^2 -> 3), Gamma = |grad P|^2/3.
# Given G1, P(X',Y',Z') is Gaussian in (G2, G3): N_t = E_G1[2 Phi(mu/sqrt(v)) - 1] with
#     mu = a h3(X') + b X' t y + c t^(3/2) z,   v = b^2 X'^2 (1-t^2) + c^2 (1-t^3).
# Quadrature: x and y on Gauss-Hermite nodes; z on composite Gauss-Legendre panels around the nodal value
# z_c = -(a h3(x) + b x y)/c with the conditional width; G1 by the trapezoid rule on [-9, 9]. Requires c > 0.
# (claude-b9ee research worker, 17 Nov 2026)
import numpy as np, sys, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from omega3lib import tgrid, I_of_p, spectral_dmu_dv, phi
from scipy.special import ndtr

S6 = np.sqrt(6.0)
def h3(x): return (x**3 - 3*x)/S6
def h3p(x): return (3*x*x - 3)/S6

def gh(n):
    x, w = np.polynomial.hermite_e.hermegauss(n)
    return x, w/np.sum(w)

def compute(a, b, c, nv=20, nx=120, ny=40, nG=721, npan=16, zfac=(-14, -6, -2.5, -1, 0, 1, 2.5, 6, 14), verbose=False):
    assert c > 0
    v, wv, t, wt = tgrid(nv)
    xs, wxs = gh(nx)
    if b == 0:
        ys, wys = np.array([0.0]), np.array([1.0])
    else:
        ys, wys = gh(ny)
    X, Yb = np.meshgrid(xs, ys, indexing='ij'); X = X.ravel(); Yb = Yb.ravel()
    W = np.outer(wxs, wys).ravel()
    Gam = ((a*h3p(X) + b*Yb)**2 + 2*b*b*X*X + 3*c*c)/3.0
    G = np.linspace(-9, 9, nG); wG = phi(G)*(G[1]-G[0]); wG = wG/wG.sum()
    gl, glw = np.polynomial.legendre.leggauss(npan)
    mu = np.zeros(nv); A = np.zeros(nv)
    for it, tt in enumerate(t):
        st, s1 = np.sqrt(tt), np.sqrt(1-tt)
        Xp = st*X[:, None] + s1*G[None, :]                       # (nxy, nG)
        mu0 = a*h3(Xp) + b*Xp*tt*Yb[:, None]                       # z-independent part of the conditional mean
        vv = b*b*Xp*Xp*(1-tt*tt) + c*c*(1-tt**3)
        Em = mu0 @ wG
        Vm = (mu0**2) @ wG - Em**2 + vv @ wG
        zc = -Em/(c*tt**1.5)
        wz = np.sqrt(np.maximum(Vm, 1e-300))/(c*tt**1.5)
        # composite panels in z, clipped to [-10, 10]
        brk = zc[:, None] + wz[:, None]*np.array(zfac)[None, :]
        fixed = np.tile(np.array([-10.0, -5.0, -2.5, 0.0, 2.5, 5.0, 10.0])[None, :], (len(X), 1))   # for the factor phi(z)
        brk = np.clip(np.concatenate([fixed, brk], 1), -10, 10)
        brk = np.sort(brk, 1)
        lo, hi = brk[:, :-1], brk[:, 1:]
        zn = (0.5*(lo+hi))[:, :, None] + (0.5*(hi-lo))[:, :, None]*gl[None, None, :]
        zw = (0.5*(hi-lo))[:, :, None]*glw[None, None, :]
        zn = zn.reshape(len(X), -1); zw = zw.reshape(len(X), -1)
        # N_t at all (xy, z) nodes; loop over xy in blocks to bound memory
        mt = np.zeros(len(X))
        blk = max(1, 2000000//(zn.shape[1]*nG))
        for i0 in range(0, len(X), blk):
            i1 = min(len(X), i0+blk)
            arg = (mu0[i0:i1, None, :] + c*tt**1.5*zn[i0:i1, :, None])/np.sqrt(vv[i0:i1, None, :])
            p = ndtr(arg) @ wG                                       # P(P' > 0 | x, y, z)
            Iv = I_of_p(p)
            mt[i0:i1] = np.sum(Iv*phi(zn[i0:i1])*zw[i0:i1], 1)
        mu[it] = np.sum(W*mt); A[it] = np.sum(W*mt*Gam)
        if verbose:
            print('  t=%.6f mu=%.6e A/mu-1=%+.6e' % (tt, mu[it], A[it]/mu[it]-1), flush=True)
    EG = np.sum(W*Gam)
    wtd = wt*3*t**2
    cov = np.sum(wtd*(A/mu - EG))
    R = np.sqrt(2/np.pi)*np.sqrt(1+cov)
    dmudv = spectral_dmu_dv(v, mu)
    B = np.sum(wv*np.sqrt(np.maximum(-dmudv*8*t**2*3*A*2*(1-v), 0.0)))
    # E|P| = E_X[ E|mu(X) + sqrt(v(X)) W| ], mu = a h3(X), v = b^2 X^2 + c^2
    xx = np.linspace(-12, 12, 240001); wx = phi(xx)*(xx[1]-xx[0])
    m_ = a*h3(xx); s_ = np.sqrt(b*b*xx*xx + c*c)
    EP = np.sum(wx*(s_*np.sqrt(2/np.pi)*np.exp(-m_**2/(2*s_**2)) + m_*(2*ndtr(m_/s_)-1)))
    return dict(cov=cov, R=R, B=B, EP=EP, EG=EG, t=t, ct=A/mu-EG, mu=mu)

if __name__ == '__main__':
    a, b = float(sys.argv[1]), float(sys.argv[2])
    c = np.sqrt(max(0.0, 1-a*a-b*b))
    kw = {}
    for s in sys.argv[3:]:
        k, val = s.split('='); kw[k] = int(val)
    r = compute(a, b, c, **kw)
    print('bath a=%.4f b=%.4f c=%.4f %s | E|P|=%.6f B=%.6f R=%.6f Cov=%+.7f (E Gamma quad=%.8f)'
          % (a, b, c, kw, r['EP'], r['B'], r['R'], r['cov'], r['EG']), flush=True)
    print('   c(t): ' + ' '.join('%.4f:%+.5f' % (u, w) for u, w in zip(r['t'], r['ct'])), flush=True)
