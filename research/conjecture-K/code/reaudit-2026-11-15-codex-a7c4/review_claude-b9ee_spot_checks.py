"""Independent floating-point spot checks (N) of the second audit of 15 November (PR #399).

Agent-ID: claude-b9ee, 15 November 2026, written for the review of PR #399. Deterministic Gauss-Legendre
quadrature with numpy/scipy; no interval arithmetic and no code of the audit is imported. The numbers are
evidence that the audited statements are stated correctly; the certificates are the audit's exact checkers.

Run:  python3 -I review_claude-b9ee_spot_checks.py        (needs numpy and scipy; about half a minute)
"""
import numpy as np
from scipy import special


def gl_panels(edges, n):
    xg, wg = np.polynomial.legendre.leggauss(n)
    x = np.concatenate([(lo + hi)/2 + (hi - lo)/2*xg for lo, hi in zip(edges[:-1], edges[1:])])
    w = np.concatenate([(hi - lo)/2*wg for lo, hi in zip(edges[:-1], edges[1:])])
    return x, w


def expo(npan=80, n=20, rmax=7.0):
    """Nodes and weights for T = |Z|^2 ~ Exp(1), through the radius (resolves the sqrt at 0)."""
    r, w = gl_panels(np.linspace(0, 1, npan + 1)**1.5*rmax, n)
    return r*r, w*2*r*np.exp(-r*r)


T, wT = expo()
S_, wS = expo(60, 16)                                           # an independent remote |Y|^2


def M(l, y):                                                    # E_theta |l e^{i theta} + y|
    sm = l + y
    return (2/np.pi)*sm*special.ellipe(np.clip(4*l*y/(sm*sm), 0, 1))


print('1. Odd costs (SECTORS 2-4)')
a, b, p = 11/25, 4/25, 25/19                                    # corner eps = ell = 19/25, beta = 4/25
J1 = float(wT@(np.sqrt(T)/(a + b*T)))
print('   corner (.76,.76,.16): k1 = p - J1 = %.12f   (audit: -0.0762347941016)' % (p - J1))
V = S_ - 1
tau = 1/100
inc = 2*float(wT@(np.sqrt(T)*((np.sqrt((a + b*T)[:, None]**2 + tau*tau*(V*V)[None, :]) - (a + b*T)[:, None])@wS))) - p*tau*tau*float(wS@(V*V))
print('   Lambda((i/100) Z (|Y|^2 - 1)) - Lambda(0) = %.6e   (audit: > 7e-6; lower bound used 7.356e-6)' % inc)
a, b, p = 14/25, 1467/10000, 200/149                             # flank
Jn = lambda n_: float(wT@(T**(n_ - 0.5)/(a + b*T)))
k3 = p - (Jn(3) - 4*Jn(2) + 4*Jn(1))/2
inc = 2*float(wT@(np.sqrt(T)*(np.sqrt((a + b*T)**2 + tau*tau*(T - 2)**2) - (a + b*T)))) - p*2*tau*tau
print('   flank: k3 = %.12f (audit: 0.356624248974);  Lambda((i/100) Z (T-2)) - Lambda(0) + 0.36*2e-4 = %.4e   (audit: > 5e-7)' % (k3, inc + 0.36*2*tau*tau))
a, b, p = 11/25, 4/25, 25/19
k3c = p - float(wT@(np.sqrt(T)*(T - 2)**2/(a + b*T)))/2
print('   sharp one-coordinate cost at the corner: k3 = %.12f   (audit: 0.151676198435)' % k3c)

print('2. Response energies (FOUNDATIONS 2), eps = 1891/2500')
eps = 1891/2500
R = np.sqrt(np.pi)/2
u0 = 0.1
x = u0/2
rho = R*np.exp(-x)*((1 + u0)*special.i0(x) + u0*special.i1(x))
drho = (R/2)*np.exp(-x)*(special.i0(x) + special.i1(x))
A_, B_ = rho - u0*drho, drho
# cross-check rho by quadrature: rho(u) = E|Z + sqrt(u)| = E_T M(sqrt T, sqrt u)
print('   tangent of rho at u = 1/10: A = %.9f  B = %.9f (audit: 0.886762780, 0.432306903);  rho(0.1) by quadrature %.9f vs Bessel formula %.9f'
      % (A_, B_, float(wT@M(np.sqrt(T), np.sqrt(u0))), rho))
for t in (0.84, 0.8456, 0.851):
    print('   t >= %.4f: remote cap 4 eps^2 B (A - t) = %.6f;  total cap eps^2 [3R(R - t) + B(A - t)] = %.6f' % (t, 4*eps*eps*B_*(A_ - t), eps*eps*(3*R*(R - t) + B_*(A_ - t))))
I = float(wT@(np.sqrt(T)*np.abs(T - 2)))
print('   response at t = 0: I = E[sqrt(T)|T - 2|] = %.6f, energy eps^2 I^2/2 = %.6f   (audit: > 0.0939738)' % (I, eps*eps*I*I/2))
ell_, beta_ = 1057/1250, 179/1250
Shi = 1.3739535256616
row = lambda t: t*t - 2*ell_*t + 2*beta_*beta_/eps + Shi
print('   central consumer: cap 500/701 minus row value at t = 0.84: %.13f (audit eta_max = 0.0001006120988);  at t = 0.851: %.10f;  5000/7011 - row(0.84) = %.3e (negative: 1.4022 not reached by this row)'
      % (500/701 - row(0.84), 500/701 - row(0.851), 5000/7011 - row(0.84)))

print('3. Content constants (CONTENT 3), peak row')
a, b, p = 699/1250, 179/1250, 2500/1891
ell = np.sqrt(T)*(a + b*T)


def tau_(l, y):
    sm = l + y
    k2 = np.clip(4*l*y/(sm*sm), 0, 1 - 1e-15)
    A = (2/np.pi)*sm*special.ellipe(k2)
    Kinv = (2/np.pi)*special.ellipk(k2)/sm
    return (A + (y*y - l*l)*Kinv)/(2*y*y)


g = lambda v: float(wT@((T - 1)*tau_(ell, np.sqrt(v))))
g0 = float(wT@((T - 1)/(2*ell)))
hs = (0.004, 0.008, 0.016)
d1 = [(g(h) - g0)/h for h in hs]                                 # g is smooth in v; Richardson to remove O(h), O(h^2)
r1 = [2*d1[0] - d1[1], 2*d1[1] - d1[2]]
print('   M0 = -g(0) = %.9f (audit 0.835135933);  M1 = g\'(0) = %.4f (audit 2.159181; finite differences, about 3 digits);  phi\'(0) = E|L|^-1 / 2 = %.9f (audit 1.431973791)'
      % (-g0, (4*r1[0] - r1[1])/3, float(wT@(1/(2*ell)))))
EL2 = a*a + 4*a*b + 6*b*b
print('   B\'(v) lower bound sqrt(pi)/(2 sqrt(E|L|^2 + 0.0463)) = %.6f (needs > 49/50)' % (np.sqrt(np.pi)/(2*np.sqrt(EL2 + 0.0463))))
print('   budget: (209/250)^2 + 2 (336/125)(123/1000) + (6/25)(113/250) = %.6f (= 91789/62500 = %.6f < 3/2)' % ((209/250)**2 + 2*(336/125)*(123/1000) + (6/25)*(113/250), 91789/62500))

print('4. Disjoint-driver cost (REMOTE 2) at the peak row, q = 0 and two shifted bases; U Gaussian of variance w')
cost = p - 199/(200*(a + 2*b))
rg, wg_ = gl_panels(np.linspace(0, 1, 61)**1.5*6.0, 16)
wg_ = wg_*2*rg*np.exp(-rg*rg)
nph = 64
ph = 2*np.pi*(np.arange(nph) + 0.5)/nph
for y0 in (0.0, 0.4, 1.0):
    base = 2*float(wT@M(ell, y0)) if y0 > 0 else 2*float(wT@ell)
    out = []
    for w in (0.01, 0.1, 1.0, 10.0):
        U = np.sqrt(w)*rg[:, None]*np.exp(1j*ph)[None, :]
        amp = np.abs(y0 + (T[:, None, None] - 1)*U[None, :, :])
        val = 2*float(wT@((M(ell[:, None, None], amp).mean(axis=2))@wg_))
        out.append('w=%g: %.4f <= %.4f' % (w, (val - base)/w, p - cost))
    print('   base y = %.1f: [2E|L+y+(T-1)U| - 2E|L+y|]/w   ' % y0 + ';  '.join(out))
print('   (the theorem says the bracket is at most 199/(200 ell) = %.4f for every base and every w; cost %.4f)' % (199/(200*(a + 2*b)), cost))

print('5. Gaussian benchmark and its gradient (REMOTE 3), v0 = 0.0403448')
v0 = 0.0403448
t2, w2 = expo(60, 16)


def Bfun(a_, b_):
    l = np.sqrt(T)*(a_ + b_*T)
    return 2*float(wT@(M(l[:, None], np.sqrt(v0*t2)[None, :])@w2))


h = 1e-5
print('   B(v0) - v0/eps = %.10f (audit 1.37395352566148);  dB/da = %.6f (audit 1.689944147);  dB/db = %.6f (audit 2.622896929)'
      % (Bfun(a, b) - v0/eps, (Bfun(a + h, b) - Bfun(a - h, b))/(2*h), (Bfun(a, b + h) - Bfun(a, b - h))/(2*h)))
