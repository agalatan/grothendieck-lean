# cg2.py -- deterministic quadrature for conditionally Gaussian forms in two variables
#     P(x, z) = A(x) + B(x) z,   x ~ N(0,1) (OU rate 1),  z ~ N(0,1) with OU rate r (r = 1: a coordinate; r = 3: the
#     third-chaos Gaussian limit Z), A, B polynomials. Unit norm and E Gamma = 1 are checked, not assumed.
# Time-t values: X' = sqrt(t) x + sqrt(1-t) G1, Z' = t^(r/2) z + sqrt(1-t^r) G2; given G1, P' is Gaussian in G2:
#     N_t = E_G1[ 2 Phi( (A(X') + B(X') t^(r/2) z) / (|B(X')| sqrt(1-t^r)) ) - 1 ].
# Gamma = ((A'(x) + B'(x) z)^2 + r B(x)^2)/3.
# Used for P_theta = cos(theta) h3(x1) + sin(theta) He2(x1) x2/sqrt2 (r = 1). (claude-b9ee research worker, 17 Nov 2026)
import numpy as np, sys, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from omega3lib import tgrid, I_of_p, spectral_dmu_dv, phi
from scipy.special import ndtr
from numpy.polynomial import polynomial as Pl

def compute(Ac, Bc, r=1, nv=16, nx=96, nG=721, npan=12, zfac=(-14, -6, -2.5, -1, 0, 1, 2.5, 6, 14)):
    Ac = np.array(Ac, float); Bc = np.array(Bc, float)
    A = lambda u: Pl.polyval(u, Ac); B = lambda u: Pl.polyval(u, Bc)
    dA = lambda u: Pl.polyval(u, Pl.polyder(Ac)); dB = lambda u: Pl.polyval(u, Pl.polyder(Bc))
    v, wv, t, wt = tgrid(nv)
    xs, wx = np.polynomial.hermite_e.hermegauss(nx); wx = wx/wx.sum()
    G = np.linspace(-9, 9, nG); wG = phi(G)*(G[1]-G[0]); wG = wG/wG.sum()
    gl, glw = np.polynomial.legendre.leggauss(npan)
    # norm and E Gamma by quadrature (z integrated exactly: E z^2 = 1)
    xq = np.linspace(-12, 12, 120001); wq = phi(xq)*(xq[1]-xq[0])
    EP2 = np.sum(wq*(A(xq)**2 + B(xq)**2))
    EG = np.sum(wq*((dA(xq)**2 + dB(xq)**2) + r*B(xq)**2))/3.0
    mu = np.zeros(nv); Aacc = np.zeros(nv)
    for it, tt in enumerate(t):
        st, s1 = np.sqrt(tt), np.sqrt(1-tt); tr = tt**(r/2.0); sr = np.sqrt(1-tt**r)
        Xp = st*xs[:, None] + s1*G[None, :]
        Av, Bv = A(Xp), B(Xp)
        # z-centre and width of the transition of N_t in z
        EA = Av @ wG; EB = Bv @ wG
        VB = (Bv**2) @ wG
        zc = np.where(np.abs(EB) > 1e-12, -EA/np.where(np.abs(EB) > 1e-12, EB, 1.0), 0.0)
        VA = (Av**2) @ wG - EA**2
        wz = np.sqrt(np.maximum(VA + VB*(1-tt**r), 1e-30))/np.maximum(np.abs(EB)*tr, 1e-12)
        brk = zc[:, None] + wz[:, None]*np.array(zfac)[None, :]
        fixed = np.tile(np.array([-10.0, -5.0, -2.5, 0.0, 2.5, 5.0, 10.0])[None, :], (nx, 1))
        brk = np.sort(np.clip(np.concatenate([fixed, brk], 1), -10, 10), 1)
        lo, hi = brk[:, :-1], brk[:, 1:]
        zn = ((0.5*(lo+hi))[:, :, None] + (0.5*(hi-lo))[:, :, None]*gl[None, None, :]).reshape(nx, -1)
        zw = ((0.5*(hi-lo))[:, :, None]*glw[None, None, :]).reshape(nx, -1)
        num = Av[:, None, :] + Bv[:, None, :]*tr*zn[:, :, None]
        den = np.abs(Bv[:, None, :])*sr
        arg = np.where(den > 1e-300, num/np.where(den > 1e-300, den, 1.0), np.sign(num)*np.inf)
        p = ndtr(arg) @ wG
        Iv = I_of_p(p)
        Gam = ((dA(xs)[:, None] + dB(xs)[:, None]*zn)**2 + r*B(xs)[:, None]**2)/3.0
        mu[it] = np.sum(wx[:, None]*zw*phi(zn)*Iv)
        Aacc[it] = np.sum(wx[:, None]*zw*phi(zn)*Iv*Gam)
    wtd = wt*3*t**2
    cov = np.sum(wtd*(Aacc/mu - EG))
    R = np.sqrt(2/np.pi)*np.sqrt(1+cov)
    dmudv = spectral_dmu_dv(v, mu)
    Bb = np.sum(wv*np.sqrt(np.maximum(-dmudv*8*t**2*3*Aacc*2*(1-v), 0.0)))
    # E|P| = E_x E|A + B z|
    m_, s_ = A(xq), np.abs(B(xq)) + 1e-300
    EP = np.sum(wq*(s_*np.sqrt(2/np.pi)*np.exp(-m_**2/(2*s_**2)) + m_*(2*ndtr(m_/s_)-1)))
    return dict(cov=cov, R=R, B=Bb, EP=EP, EP2=EP2, EG=EG, t=t, ct=Aacc/mu-EG)

S6, S2 = np.sqrt(6.0), np.sqrt(2.0)
if __name__ == '__main__':
    kw = {}
    ths = []
    for s in sys.argv[1:]:
        if '=' in s:
            k, val = s.split('='); kw[k] = int(val)
        else:
            ths.append(float(s))
    for th in ths:
        Ac = np.cos(th)*np.array([0, -3, 0, 1])/S6           # cos(th) h3(x)
        Bc = np.sin(th)*np.array([-1, 0, 1])/S2              # sin(th) He2(x)/sqrt2
        rr = compute(Ac, Bc, r=1, **kw)
        print('He2(x1)x2 path theta=%+.3f %s | E P^2=%.8f E Gamma=%.8f | E|P|=%.6f B=%.6f R=%.6f Cov=%+.6f'
              % (th, kw, rr['EP2'], rr['EG'], rr['EP'], rr['B'], rr['R'], rr['cov']), flush=True)
        print('   c(t): ' + ' '.join('%.4f:%+.5f' % (u, w) for u, w in zip(rr['t'], rr['ct'])), flush=True)
