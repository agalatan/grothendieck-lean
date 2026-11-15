# claude-b9ee, 15 Nov 2026: independent numerical checks of the report of codex-6e2b on the tilted sector (s = 3/5).
import numpy as np
from scipy import special, integrate, optimize
a, b, p, s = 699/1250, 179/1250, 2500/1891, 0.6
P = p - s*s
def gl_panels(edges, n):
    xg, wg = np.polynomial.legendre.leggauss(n)
    x = np.concatenate([(lo + hi)/2 + (hi - lo)/2*xg for lo, hi in zip(edges[:-1], edges[1:])])
    w = np.concatenate([(hi - lo)/2*wg for lo, hi in zip(edges[:-1], edges[1:])]); return x, w
def radial(n, pan, rmax):
    r, w = gl_panels(np.linspace(0, 1, pan + 1)**1.5*rmax, n); return r, w*2*r*np.exp(-r*r)
def A1(r, y):
    sm = r + y; return (2/np.pi)*sm*special.ellipe(np.clip(4*r*y/(sm*sm), 0, 1))
# 1. circular mean lemma  C(t) <= 1 + 0.3 t^2
t = np.concatenate([np.linspace(0, 3, 300001), np.linspace(3, 200, 200001)]); C = A1(1.0, t)
i = int(np.argmax(C - 1 - 0.3*t*t)); j = int(np.argmax((C[1:] - 1)/t[1:]**2)) + 1
print('1. circular mean: max of C(t) - 1 - 0.3 t^2 = %.3e at t = %.4f;  sup (C-1)/t^2 = %.6f at t = %.4f' % (C[i] - 1 - 0.3*t[i]**2, t[i], (C[j] - 1)/t[j]**2, t[j]))
# quadrature in T and in |y|
sT, wT = radial(16, 22, 7.5); T = sT**2; rT = sT*(a + b*T); st, wt = radial(16, 22, 7.5); tt = st**2
I0, I1, I2 = [float(wT@(T**k/rT)) for k in range(3)]
print('   (3/5) I0 = %.9f (report 1.718368549...),  P - (3/5) J_s = %.9f (report 0.343638104...)' % (0.6*I0, P - 0.6*(I2 - 0.8*I1 + 0.16*I0)))
# 2. global bound (1) on the Wick monomial: J(q, r) <= (1074/625) u - (859/2500) alpha^2
def J(u, al):
    q = np.sqrt(u)*st*(tt - 2)/np.sqrt(2)                       # real representative, r = al*y
    W = np.abs(q[:, None] + (T[None, :] - 0.4)*al*st[:, None])
    return 2*float(wt@(A1(rT[None, :], W)@wT)) - P*al*al - 2*float(wt@(A1(rT[None, :], np.abs(q)[:, None])@wT))
worst = -1e9
for u in (1e-5, 1e-3, 0.02, 0.0463, 0.2, 1.0):
    for al in np.linspace(-1.5, 1.5, 61):
        worst = max(worst, J(u, al) - (1074/625*u - 859/2500*al*al))
print('2. global bound (1) on the monomial: max of J - [(1074/625) u - (859/2500) alpha^2] over the grid = %.3e (must be <= 0)' % worst)
# 3. structural estimate (5) on the monomial: ||c_s||^2 <= (3/4) delta E m_h(|q|^2)
def prof(y):                                                   # h_s(v) at v = y^2 by direct quadrature
    r = rT; sm = r + y; k2 = np.clip(4*r*y/(sm*sm), 0, 1 - 1e-15)
    A = (2/np.pi)*sm*special.ellipe(k2); Kinv = (2/np.pi)*special.ellipk(k2)/sm
    tau = (A + (y*y - r*r)*Kinv)/(2*y*y) if y > 1e-9 else 1/(2*r)
    return float(wT@((T - 0.4)*tau))                           # = g(v) + s j(v)
vs = np.concatenate([np.linspace(1e-4, 0.5, 400), np.linspace(0.5, 60, 1200)[1:]])
H = np.array([prof(np.sqrt(v)) for v in vs]); from scipy.interpolate import CubicSpline
sp = CubicSpline(vs, H); h1 = sp.derivative(1); h2 = sp.derivative(2)
mh = lambda v: 4*v*((3*h1(v) + 2*v*h2(v))**2 + 3*h1(v)**2)
vv = np.linspace(1e-4, 60, 200000); mm = mh(vv); print('3. sup of m_h over v in (0, 60]: %.2f at v = %.3f   (certified bound: 4*848/3 = 1130.7);  h_s\'(0) = %.4f' % (mm.max(), vv[int(mm.argmax())], float(h1(1e-4))))
for u in (0.0005, 0.005, 0.02, 0.0463):
    q = np.sqrt(u)*st*(tt - 2)/np.sqrt(2); v = np.clip(q*q, 1e-4, 60)
    c = float(wt@(st*q*np.array([prof(abs(x)) for x in q])))    # E[conj(y) q (g + s j)(|q|^2)]
    delta = float(wt@q**4) - 2*u*u; rhs = 0.75*delta*float(wt@mh(v))
    Ag = A1(rT[None, :], np.sqrt(u)*st[:, None]); D = 2*float(wt@(Ag@wT)) - 2*float(wt@(A1(rT[None, :], np.abs(q)[:, None])@wT))
    print('   u = %.4f: content^2 = %.4e,  (3/4) delta E m_h = %.4e  (ratio %.0f),  delta = %.3e,  D = %.4e,  content^2/D = %.4f,  bound/D = %.1f' % (u, c*c, rhs, rhs/(c*c), delta, D, c*c/D, rhs/D))
