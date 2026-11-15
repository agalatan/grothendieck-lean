# REVIEW_4 (claude-b9ee, 15 November 2026): written by the reviewer agent of the session, copied from its scratch folder; module for the family q = sqrt(u(1-lam))G + sqrt(u lam) y(|y|^2-2)/sqrt2 (needs tables.npz from tables.py).
# claude reviewer (N): family q = sqrt(u(1-lam)) G + sqrt(u lam) y(|y|^2-2)/sqrt2, G = diffuse (Gaussian-limit) part.
# Content of the diffuse part vanishes in the limit (its own coordinates' projections are O(1/N) each), so
#   C^2 = |beta|^2,  beta = E[Phi(q) ybar] = E[ r Phi(sG rho' e^{i th} + mu(r)) ],  mu(r) = sy r (r^2-2)/sqrt2, |y| = r.
# Phi(w) = ph(w) Fraw(|w|) - c0 w  (= w h_{3/5}(|w|^2)).   F(q) = E hF(|q|^2), hF(v) = 2 EN(sqrt v).
import numpy as np, os
from scipy import special
from scipy.interpolate import CubicSpline
HERE = os.path.dirname(os.path.abspath(__file__))
tb = np.load(os.path.join(HERE, 'tables.npz'))
Rg, ENg, FRg, c0 = tb['R'], tb['EN'], tb['Fraw'], float(tb['c0'])
_EN = CubicSpline(Rg, ENg); _FR = CubicSpline(Rg, FRg)
a, b = 699/1250, 179/1250
def EN(R):
    R = np.asarray(R, float); out = _EN(np.minimum(R, Rg[-1]))
    big = R > Rg[-1]
    if np.any(big): out = np.where(big, R + (ENg[-1] - Rg[-1]), out)  # never reached in practice
    return out
def FR(R):
    R = np.asarray(R, float); return _FR(np.minimum(R, Rg[-1]))
def Phi(w):
    A = np.abs(w); ph = np.where(A > 0, w/np.where(A > 0, A, 1), 0)
    return ph*FR(A) - c0*w
def panels(edges, n):
    x, w = np.polynomial.legendre.leggauss(n)
    xs = np.concatenate([(lo + hi)/2 + (hi - lo)/2*x for lo, hi in zip(edges[:-1], edges[1:])])
    ws = np.concatenate([(hi - lo)/2*w for lo, hi in zip(edges[:-1], edges[1:])]); return xs, ws
def radial(npan=40, n=12, rmax=6.6):        # |y| = r with |y|^2 ~ Exp(1): density 2 r e^{-r^2}
    r, w = panels(np.linspace(0, rmax, npan + 1), n); return r, w*2*r*np.exp(-r*r)
def Bgauss(u):                               # Rice formula, independent of the author's code
    T, wT = panels(np.linspace(0, 1, 201)**2*70, 16); wT = wT*np.exp(-T)
    z = T*(a + b*T)**2/(2*u)
    return float(wT@(np.sqrt(np.pi*u)*((1 + 2*z)*special.i0e(z) + 2*z*special.i1e(z))))
def family(u, lam, nr=(48, 12), ng=(32, 12), nth=64):
    rt, wt = radial(*nr); mu = np.sqrt(u*lam)*rt*(rt*rt - 2)/np.sqrt(2)
    sg = np.sqrt(u*(1 - lam))
    if sg == 0:
        w = mu.astype(complex); Fv = float(wt@(2*EN(np.abs(w)))); beta = complex(wt@(rt*Phi(w)))
        m4 = float(wt@np.abs(w)**4); m6 = float(wt@np.abs(w)**6)
        return Fv, abs(beta)**2, m4, m6
    rg, wg = radial(*ng); th = np.pi*(np.arange(nth) + 0.5)/nth; wth = np.full(nth, 1/nth)   # theta in (0,pi), symmetric
    G = (rg[:, None]*np.exp(1j*th)[None, :])        # [ng, nth]
    Fv = 0.0; beta = 0.0; m4 = 0.0; m6 = 0.0
    for i in range(len(rt)):
        w = sg*G + mu[i]; A = np.abs(w)
        W2 = wg[:, None]*wth[None, :]
        Fv += wt[i]*np.sum(W2*2*EN(A)); beta += wt[i]*rt[i]*np.sum(W2*Phi(w).real)
        m4 += wt[i]*np.sum(W2*A**4); m6 += wt[i]*np.sum(W2*A**6)
    return Fv, beta**2, m4, m6
if __name__ == '__main__':
    for u in (0.001, 0.01, 0.0463):
        print('B(%g) = %.15f' % (u, Bgauss(u)))
    # cross-check B(u) = E hF(u V), V ~ Exp(1)
    r, w = radial(60, 16)
    for u in (0.01, 0.0463):
        print('  E hF(uV) = %.15f' % float(w@(2*EN(np.sqrt(u)*r))))
    # convergence test of the family quadrature
    for args in [dict(), dict(nr=(64, 16), ng=(48, 12), nth=96)]:
        print(family(0.0463, 0.35, **args))
