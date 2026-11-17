# Deterministic 1-D computation of the Omega_3 quantities for P = h3(X) (d = 3) and for P = X (d = 1, Gaussian check).
# Outer integral: trapezoid on a fine grid; t-integral: Gauss-Legendre in v, t = 1-(1-v)^2.
# mu'(t) two ways: spectral differentiation of mu(v), and the identity mu'(t) = -(1/(8t)) E[|N_t'|^2 / I(N_t)].
import numpy as np, sys
sys.path.insert(0, '.')
from omega3lib import tgrid, I_of_p, spectral_dmu_dv, phi
from scipy.special import ndtr
x = np.linspace(-12, 12, 480001); w = phi(x)*(x[1]-x[0])
s3 = np.sqrt(3.0)
def run(case, nv):
    v, wv, t, wt = tgrid(nv)
    if case == 'h3':
        d = 3; ints = [(-s3, 0.0), (s3, np.inf)]; Pv = (x**3-3*x)/np.sqrt(6); Gam = (x*x-1)**2/2
    else:
        d = 1; ints = [(0.0, np.inf)]; Pv = x; Gam = np.ones_like(x)
    mu = np.zeros(nv); A = np.zeros(nv); J = np.zeros(nv)
    for j, tt in enumerate(t):
        sg = np.sqrt(1-tt); m = np.sqrt(tt)*x
        p = np.zeros_like(x); dp = np.zeros_like(x)
        for a, b in ints:
            za, zb = (a-m)/sg, (b-m)/sg     # stable interval mass: survival functions on the right half-line
            p += np.where(za >= 0, ndtr(-za) - ndtr(-zb), ndtr(zb) - ndtr(za))
            dp += (np.sqrt(tt)/sg)*(phi((a-m)/sg) - (phi((b-m)/sg) if np.isfinite(b) else 0.0))
        It = I_of_p(p)
        mu[j] = np.sum(It*w); A[j] = np.sum(It*Gam*w)
        dN = 2*dp
        J[j] = np.sum(np.where(It > 1e-300, dN**2/np.where(It > 1e-300, It, 1.0), 0.0)*w)
    wtd = wt*d*t**(d-1)
    cov = np.sum(wtd*(A/mu-1)); EW = np.sum(wtd)   # E Wbar = int d t^(d-1) dt
    R = np.sqrt(2/np.pi)*np.sqrt(1+cov)
    dmudv = spectral_dmu_dv(v, mu)
    B1 = np.sum(wv*np.sqrt(np.maximum(-dmudv*8*t**(d-1)*d*A*2*(1-v), 0)))
    mup = -J/(8*t)                                   # mu'(t) from the identity
    B2 = np.sum(wt*np.sqrt(np.maximum(-mup, 0)*8*t**(d-1)*d*A))
    EP = np.sum(np.abs(Pv)*w)
    return dict(d=d, EP=EP, cov=cov, R=R, B_spec=B1, B_ident=B2, EW=EW, mu0=mu[0], t=t, ct=A/mu-1,
                dmu_check=np.max(np.abs(dmudv/(2*(1-v)) - mup)/np.abs(mup)))
for case in ['gauss', 'h3']:
    for nv in [16, 24, 32, 48]:
        r = run(case, nv)
        print('%-5s d=%d nv=%2d  E|P|=%.6f  B(spec)=%.6f  B(ident)=%.6f  R=%.6f  Cov=%+.6f  (int d t^(d-1)=%.8f; max rel diff of the two mu-prime = %.1e)'
              % (case, r['d'], nv, r['EP'], r['B_spec'], r['B_ident'], r['R'], r['cov'], r['EW'], r['dmu_check']))
r = run('h3', 32)
print('sqrt(2/pi) = %.6f' % np.sqrt(2/np.pi))
print('h3 scale-wise c(t) = Cov(I(N_t),Gamma)/mu(t):')
for tt, c in zip(r['t'], r['ct']):
    print('   t=%.6f  c=%+.6f' % (tt, c))
# t -> 1 limit: Gaussian surface average of Gamma over the nodal set {0, +-sqrt3}
S = (phi(0)*0.5 + 2*phi(s3)*2)/(phi(0) + 2*phi(s3))
print('t->1 limit: surface average of Gamma - 1 = %+.6f' % (S-1))
