"""Exact multi-residual k-row in the Gaussian ideal (cubic witness T = P10 - eps P21).  FLOAT.
Row (all residuals of non-W type set to 0, q = sigma W):
  R(t; ell, beta, lam) = t^2 - 2 ell t + 2 beta^2/eps + lam^2 + sup_{sigma>=0, nu} [ E_W Phi(sigma|W|; nu) - (sigma^2 + nu^2)/eps ],
  Phi(s; nu) = E_z[ |L + G| + |L - G| ],  L = z(ell + beta(U-2)),  G = s + nu H(z) - lam z,  H = z(U-2)/sqrt2, U = |z|^2.
  |L+G| = |z a(U) + s|, a = (ell-lam) + (beta + nu/sqrt2)(U-2);  |L-G| = |z b(U) - s|, b = (ell+lam) + (beta - nu/sqrt2)(U-2).
Angular mean of |x e^{i th} + s| = (2/pi)(x+s) E(4xs/(x+s)^2).
Quadrature: composite Gauss-Legendre in u = |z|^2 on [0, UMAX] (NPu panels x 8) and in v = |W|^2 on [0, VMAX]."""
import numpy as np, sys
from scipy.special import ellipe
from scipy.optimize import minimize
R2 = np.sqrt(2.0)
def gl(a, b, npan, ng=8):
    x, w = np.polynomial.legendre.leggauss(ng); e = np.linspace(a, b, npan+1)
    return (np.concatenate([(p+q)/2 + (q-p)/2*x for p, q in zip(e[:-1], e[1:])]), np.concatenate([(q-p)/2*w for p, q in zip(e[:-1], e[1:])]))
def mabs(x, s):
    t = x + s; m = np.where(t > 0, 4*x*s/np.maximum(t, 1e-300)**2, 0.0); return (2/np.pi)*t*ellipe(np.minimum(m, 1.0))
class Model:
    def __init__(self, eps, npu=48, npv=24, umax=36.0, vmax=36.0):
        # quadrature in the RADIUS r = sqrt(u) (the integrands are smooth in r, not in u): weight 2 r exp(-r^2) dr on [0, sqrt(umax)]
        self.eps = eps; r, wr = gl(0, np.sqrt(umax), npu); self.u = r*r; self.wu = wr*2*r*np.exp(-r*r); r2, wr2 = gl(0, np.sqrt(vmax), npv); self.v = r2*r2; self.wv = wr2*2*r2*np.exp(-r2*r2)
        self.ru = r; self.rv = r2; self.fast = True
    def Phi(self, s, ell, beta, lam, nu):
        """s array -> Phi(s) array.  nu may be complex."""
        a = np.abs((ell-lam) + (beta + nu/R2)*(self.u-2))*self.ru; b = np.abs((ell+lam) + (beta - nu/R2)*(self.u-2))*self.ru
        s = np.atleast_1d(s)[:, None]; return (mabs(a[None, :], s) + mabs(b[None, :], s))@self.wu
    def G(self, sig, ell, beta, lam, nu):
        return float(self.wv@self.Phi(sig*self.rv, ell, beta, lam, nu))
    def inner(self, ell, beta, lam, x0=(0.3, 0.0)):
        """sup over (sigma, nu real) of G - (sigma^2+nu^2)/eps; multi-start"""
        f = lambda p: -(self.G(abs(p[0]), ell, beta, lam, p[1]) - (p[0]**2 + p[1]**2)/self.eps)
        best = None
        for st in ((x0,) if self.fast else (x0, (0.0, 0.0), (0.5, 0.2), (0.5, -0.2), (0.25, 0.1), (0.25, -0.1))):
            r = minimize(f, st, method='Nelder-Mead', options={'xatol': 1e-7, 'fatol': 1e-12, 'maxiter': 2000})
            if best is None or r.fun < best.fun: best = r
        return -best.fun, (abs(best.x[0]), best.x[1])
    def row(self, t, ell, beta, lam, x0=(0.3, 0.0)):
        v, arg = self.inner(ell, beta, lam, x0); return t*t - 2*ell*t + 2*beta**2/self.eps + lam**2 + v, arg
    def best_row(self, t, start=(0.84, 0.14, 0.0)):
        cache = {}
        def f(p):
            v, arg = self.row(t, p[0], p[1], p[2], cache.get('a', (0.3, 0.0))); cache['a'] = arg; return v
        r = minimize(f, start, method='Nelder-Mead', options={'xatol': 1e-6, 'fatol': 1e-10, 'maxiter': 600})
        self.fast = False; v, arg = self.row(t, *r.x, cache['a']); self.fast = True; return v, r.x, arg
if __name__ == "__main__":
    eps = float(sys.argv[1]); M = Model(eps)
    for t in [float(a) for a in sys.argv[2:]]:
        v, p, arg = M.best_row(t, start=(t, 0.14, 0.0)); print(f"eps={eps} t={t}: D''(t) = {v:.7f}  ell={p[0]:.5f} beta={p[1]:.5f} lam={p[2]:.5f}  inner argmax sigma={arg[0]:.4f} nu={arg[1]:.4f}", flush=True)
