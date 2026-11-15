# claude-b9ee, 15 Nov 2026 (N): independent floating-point checks of the third tilt delivery of codex-6e2b (global secant
# bound and the central content coefficient).  Nothing here is a certificate.
#   m(x)   = E[(T - 2/5) sign(Re L + x)],  m'' from the density formula (8) of secant_content_proof.md, cross-checked by finite
#            differences of m computed from the closed angular probability arccos(-x/l)/pi;
#   k_u(x) = int_0^1 z^(2/3) E m''(z x + sqrt(u/2 (1 - z^2)) G) dz;   claim  sup |k_u| <= 313/500 on 0.03 <= u <= 0.0463;
#   N_Psi(R) from (4) and the direct bound (11/72) sup|k_u|^2;  the angular inequality (6) symbolically.
import numpy as np
from fractions import Fraction as F
a, b, d = 699/1250, 179/1250, 0.4


def gl(n, lo, hi):
    x, w = np.polynomial.legendre.leggauss(n)
    return (lo + hi)/2 + (hi - lo)/2*x, (hi - lo)/2*w


def panels(edges, n):
    xs, ws = zip(*[gl(n, lo, hi) for lo, hi in zip(edges[:-1], edges[1:])])
    return np.concatenate(xs), np.concatenate(ws)


def t_of_v(v):
    t = v/(a*a + v)
    for _ in range(80):
        t = t - (t*(a + b*t)**2 - v)/((a + b*t)*(a + 3*b*t))
    return t


Y, WY = panels(np.concatenate([np.linspace(0, 3, 61), np.linspace(3, 12, 37)[1:]]), 12)


def m2(x):                                                    # formula (8)
    x = np.atleast_1d(np.asarray(x, float))
    t = t_of_v(x[:, None]**2 + Y[None, :]**2)
    p_, q_ = a + b*t, a + 3*b*t
    R = b/p_ + 3*b/q_
    return 8*x*((np.exp(-t)/(np.pi*(p_*q_)**2)*(1 - (t - d)*(1 + R)))@WY)


Tq, WT = panels(np.linspace(0, 1, 201)**1.6*40, 16)
WT = WT*np.exp(-Tq)
ellT = np.sqrt(Tq)*(a + b*Tq)


def m_direct(x):                                              # m(x) = 2E[(T-d) arccos(clip(-x/l))/pi] - E(T-d)
    c = np.clip(-x/np.maximum(ellT, 1e-300), -1, 1)
    return 2*float(WT@((Tq - d)*np.arccos(c)/np.pi)) - float(WT@(Tq - d))


def m1(x):                                                    # m'(x) = 4 int_0^inf (t-d) e^-t/(pi D) dy: the (T-d)-weighted density of Re L
    x = np.atleast_1d(np.asarray(x, float))
    t = t_of_v(x[:, None]**2 + Y[None, :]**2)
    return 4*(((t - d)*np.exp(-t)/(np.pi*(a + b*t)*(a + 3*b*t)))@WY)


print('1. m\' from the density against central differences of m (closed angular probability, h = 0.01); m\'\' by formula (8)')
print('   against central differences of that m\' (h = 0.001).  (Second differences of m itself are useless here: the')
print('   fixed-node quadrature of m has kinks at l(T) = |x| whose error is amplified by 1/h^2.)')
for x in (0.1, 0.3, 0.6, 1.0, 2.0):
    h = 1e-2
    fd1 = (m_direct(x + h) - m_direct(x - h))/(2*h)
    h2 = 1e-3
    fd2 = (m1(x + h2)[0] - m1(x - h2)[0])/(2*h2)
    print('   x = %.2f:  m\' density %.6f  difference of m %.6f   |   m\'\' formula (8) %.6f  difference of m\' %.6f' % (x, m1(x)[0], fd1, m2(x)[0], fd2))
xs = np.linspace(-8, 8, 3201)
M2 = m2(np.abs(xs))*np.sign(xs)                              # odd
print('   sup |m\'\'| on [0, 8] = %.5f;  min on [0, 8] = %.5f (claim >= -25/24 = -1.0417);  max on [1, 8] = %.5f (claim <= 25/24)'
      % (np.abs(M2).max(), M2[xs >= 0].min(), M2[xs >= 1].max()))
gz, gw = np.polynomial.hermite_e.hermegauss(60)
gw = gw/gw.sum()
zq, zw = panels(np.linspace(0, 1, 41), 10)


def k_u(u, x):
    out = []
    for xv in np.atleast_1d(x):
        args = zq[:, None]*xv + np.sqrt(u/2*(1 - zq[:, None]**2))*gz[None, :]
        out.append(float(zw@(zq**(2/3)*(np.interp(args, xs, M2)@gw))))
    return np.array(out)


xg = np.linspace(0, 4, 801)
for u in (0.03, 0.0403, 0.0463):
    k = k_u(u, xg)
    i = int(np.abs(k).argmax())
    th, wth = gl(200, 0, np.pi/2)
    Nmax = 0.0
    for R in np.linspace(0, 4, 401):
        kk = np.interp(R*np.cos(th), xg, k)
        A = float(wth@(np.cos(th)**3*kk))
        B = float(wth@(np.cos(th)*np.sin(th)**2*kk))
        Nmax = max(Nmax, (3*A*A - 2*A*B + 3*B*B)/8, B*B)
    print('2. u = %.4f: sup |k_u| = %.5f at x = %.3f (claim <= 313/500 = 0.626);  sup N_Psi = %.5f (bound (11/72) sup|k|^2 = %.5f);  content coefficient (2/3) sup N_Psi = %.5f (certified 0.0399)'
          % (u, abs(k[i]), xg[i], Nmax, 11/72*k[i]**2, 2/3*Nmax))
# angular inequality (6): 11/72 - (3A^2 - 2AB + 3B^2)/8 = z(1-z)/18 (8z^4 + 8z^3 - 16z^2 - 12z + 15) for the one-switch w
import sympy as sp
z = sp.symbols('z')
A = 2*z - sp.Rational(2, 3)*z**3 - sp.Rational(2, 3)
B = sp.Rational(2, 3)*z**3 - sp.Rational(1, 3)
lhs = sp.Rational(11, 72) - (3*A**2 - 2*A*B + 3*B**2)/8
rhs = z*(1 - z)/18*(8*z**4 + 8*z**3 - 16*z**2 - 12*z + 15)
print('3. angular identity holds:', sp.simplify(lhs - rhs) == 0, ';  min of the quartic on [0,1]:', min(float((8*zz**4 + 8*zz**3 - 16*zz**2 - 12*zz + 15)) for zz in np.linspace(0, 1, 10001)))
print('   gamma = (11/108)(313/500)^2 =', F(11, 108)*F(313, 500)**2, '=', float(F(11, 108)*F(313, 500)**2), ';  k = P - 13/20 =', F(2500, 1891) - F(9, 25) - F(13, 20))
